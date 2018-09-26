Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2FB0E00A0C; Wed, 26 Sep 2018 12:12:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAFBFE00953
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Sep 2018 12:12:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8QJCWKV029882
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Sep 2018 12:12:43 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 26 Sep 2018 12:12:22 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Sep 2018 15:12:16 -0400
Message-ID: <1537989136-27095-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537989136-27095-1-git-send-email-mark.asselstine@windriver.com>
References: <1537989136-27095-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libvirt: backport LXC AB / BA deadlock fix
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2018 19:12:54 -0000
Content-Type: text/plain

This fix will most likely be part of libvirt 4.8.0 but since we took
the time to investigate and fix this issue we are including it now to
prevent others from hitting this issue.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../lxc_monitor-Avoid-AB-BA-lock-race.patch        | 106 +++++++++++++++++++++
 recipes-extended/libvirt/libvirt_4.7.0.bb          |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/lxc_monitor-Avoid-AB-BA-lock-race.patch

diff --git a/recipes-extended/libvirt/libvirt/lxc_monitor-Avoid-AB-BA-lock-race.patch b/recipes-extended/libvirt/libvirt/lxc_monitor-Avoid-AB-BA-lock-race.patch
new file mode 100644
index 0000000..fc3880f
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/lxc_monitor-Avoid-AB-BA-lock-race.patch
@@ -0,0 +1,106 @@
+From 7882c6eca53fe9abe253497a50f6c5ae062176d3 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Mon, 24 Sep 2018 11:11:35 -0400
+Subject: [PATCH] lxc_monitor: Avoid AB / BA lock race
+
+A deadlock situation can occur when autostarting a LXC domain 'guest'
+due to two threads attempting to take opposing locks while holding
+opposing locks (AB BA problem). Thread A takes and holds the 'vm' lock
+while attempting to take the 'client' lock, meanwhile, thread B takes
+and holds the 'client' lock while attempting to take the 'vm' lock.
+
+The potential for this can be seen as follows:
+
+Thread A:
+virLXCProcessAutostartDomain (takes vm lock)
+ --> virLXCProcessStart
+  --> virLXCProcessConnectMonitor
+   --> virLXCMonitorNew
+    --> virNetClientSetCloseCallback (wants client lock)
+
+Thread B:
+virNetClientIncomingEvent (takes client lock)
+ --> virNetClientIOHandleInput
+  --> virNetClientCallDispatch
+   --> virNetClientCallDispatchMessage
+    --> virNetClientProgramDispatch
+     --> virLXCMonitorHandleEventInit
+      --> virLXCProcessMonitorInitNotify (wants vm lock)
+
+Since these threads are scheduled independently and are preemptible it
+is possible for the deadlock scenario to occur where each thread locks
+their first lock but both will fail to get their second lock and just
+spin forever. You get something like:
+
+virLXCProcessAutostartDomain (takes vm lock)
+ --> virLXCProcessStart
+  --> virLXCProcessConnectMonitor
+   --> virLXCMonitorNew
+<...>
+virNetClientIncomingEvent (takes client lock)
+ --> virNetClientIOHandleInput
+  --> virNetClientCallDispatch
+   --> virNetClientCallDispatchMessage
+    --> virNetClientProgramDispatch
+     --> virLXCMonitorHandleEventInit
+      --> virLXCProcessMonitorInitNotify (wants vm lock but spins)
+<...>
+    --> virNetClientSetCloseCallback (wants client lock but spins)
+
+Neither thread ever gets the lock it needs to be able to continue
+while holding the lock that the other thread needs.
+
+The actual window for preemption which can cause this deadlock is
+rather small, between the calls to virNetClientProgramNew() and
+execution of virNetClientSetCloseCallback(), both in
+virLXCMonitorNew(). But it can be seen in real world use that this
+small window is enough.
+
+By moving the call to virNetClientSetCloseCallback() ahead of
+virNetClientProgramNew() we can close any possible chance of the
+deadlock taking place. There should be no other implications to the
+move since the close callback (in the unlikely event was called) will
+spin on the vm lock. The remaining work that takes place between the
+old call location of virNetClientSetCloseCallback() and the new
+location is unaffected by the move.
+
+Upstream-Status: Backport commit 7882c6eca53f
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
+---
+ src/lxc/lxc_monitor.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/src/lxc/lxc_monitor.c b/src/lxc/lxc_monitor.c
+index e765c16..0b18a14 100644
+--- a/src/lxc/lxc_monitor.c
++++ b/src/lxc/lxc_monitor.c
+@@ -161,6 +161,13 @@ virLXCMonitorPtr virLXCMonitorNew(virDomainObjPtr vm,
+     if (virNetClientRegisterAsyncIO(mon->client) < 0)
+         goto error;
+ 
++    /* avoid deadlock by making this call before assigning virLXCMonitorEvents */
++    virNetClientSetCloseCallback(mon->client, virLXCMonitorEOFNotify, mon,
++                                 virLXCMonitorCloseFreeCallback);
++
++    /* close callback now has its own reference */
++    virObjectRef(mon);
++
+     if (!(mon->program = virNetClientProgramNew(VIR_LXC_MONITOR_PROGRAM,
+                                                 VIR_LXC_MONITOR_PROGRAM_VERSION,
+                                                 virLXCMonitorEvents,
+@@ -175,10 +182,6 @@ virLXCMonitorPtr virLXCMonitorNew(virDomainObjPtr vm,
+     mon->vm = virObjectRef(vm);
+     memcpy(&mon->cb, cb, sizeof(mon->cb));
+ 
+-    virObjectRef(mon);
+-    virNetClientSetCloseCallback(mon->client, virLXCMonitorEOFNotify, mon,
+-                                 virLXCMonitorCloseFreeCallback);
+-
+  cleanup:
+     VIR_FREE(sockpath);
+     return mon;
+-- 
+2.7.4
+
diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
index 14565da..47275ae 100644
--- a/recipes-extended/libvirt/libvirt_4.7.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://install-missing-file.patch \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
            file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
+           file://lxc_monitor-Avoid-AB-BA-lock-race.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "38da6c33250dcbc0a6d68de5c758262b"
-- 
2.7.4


