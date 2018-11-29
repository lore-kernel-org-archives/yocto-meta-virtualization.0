Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 318D6E00C8A; Thu, 29 Nov 2018 09:08:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28A64E00C72
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Nov 2018 09:08:20 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wATH7ilj018826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Nov 2018 09:08:09 -0800
Received: from [128.224.56.49] (128.224.56.49) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 29 Nov 2018 09:07:53 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1543421852-17067-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <184af61a-bf27-788b-882e-c24d8ac4bd95@windriver.com>
Date: Thu, 29 Nov 2018 12:07:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1543421852-17067-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [PATCH] libvirt: uprev from 4.7.0 to 4.9.0
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
X-List-Received-Date: Thu, 29 Nov 2018 17:08:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

merged.

Bruce

On 11/28/18 11:17 AM, Mark Asselstine wrote:
> Minor update bringing in new features such as better support for
> cgroup v2, vfio AP support, support for XEN suspend/wakeup.
> 
> Basic usecases pass and the ptest return similar results we have been
> achieving with the last few uprevs:
> 
>      ====================================
>      Testsuite summary for libvirt 4.9.0
>      ====================================
>      # TOTAL: 120
>      # PASS:  117
>      # SKIP:  0
>      # XFAIL: 0
>      # FAIL:  3
>      # XPASS: 0
>      # ERROR: 0
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   recipes-extended/libvirt/libvirt-python.inc        |   4 +-
>   .../lxc_monitor-Avoid-AB-BA-lock-race.patch        | 106 ---------------------
>   .../libvirt/{libvirt_4.7.0.bb => libvirt_4.9.0.bb} |   5 +-
>   3 files changed, 4 insertions(+), 111 deletions(-)
>   delete mode 100644 recipes-extended/libvirt/libvirt/lxc_monitor-Avoid-AB-BA-lock-race.patch
>   rename recipes-extended/libvirt/{libvirt_4.7.0.bb => libvirt_4.9.0.bb} (98%)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index be9079d..ae43ba8 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>   SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>   SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
>   
> -SRC_URI[libvirt_python.md5sum] = "32cf281199367aec2881c96d1bd80dc6"
> -SRC_URI[libvirt_python.sha256sum] = "e36fee5898de3550ed7e63d5d0a8447f9d78f06574634855dee59eae27930908"
> +SRC_URI[libvirt_python.md5sum] = "cba7dc90d564aa8c267c38d452b83f80"
> +SRC_URI[libvirt_python.sha256sum] = "01c4becf50b521a9e3d1b48a3a79d83cb389d86d760b895d911d78f5b6ae7b60"
>   
>   export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>   export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt/lxc_monitor-Avoid-AB-BA-lock-race.patch b/recipes-extended/libvirt/libvirt/lxc_monitor-Avoid-AB-BA-lock-race.patch
> deleted file mode 100644
> index fc3880f..0000000
> --- a/recipes-extended/libvirt/libvirt/lxc_monitor-Avoid-AB-BA-lock-race.patch
> +++ /dev/null
> @@ -1,106 +0,0 @@
> -From 7882c6eca53fe9abe253497a50f6c5ae062176d3 Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Mon, 24 Sep 2018 11:11:35 -0400
> -Subject: [PATCH] lxc_monitor: Avoid AB / BA lock race
> -
> -A deadlock situation can occur when autostarting a LXC domain 'guest'
> -due to two threads attempting to take opposing locks while holding
> -opposing locks (AB BA problem). Thread A takes and holds the 'vm' lock
> -while attempting to take the 'client' lock, meanwhile, thread B takes
> -and holds the 'client' lock while attempting to take the 'vm' lock.
> -
> -The potential for this can be seen as follows:
> -
> -Thread A:
> -virLXCProcessAutostartDomain (takes vm lock)
> - --> virLXCProcessStart
> -  --> virLXCProcessConnectMonitor
> -   --> virLXCMonitorNew
> -    --> virNetClientSetCloseCallback (wants client lock)
> -
> -Thread B:
> -virNetClientIncomingEvent (takes client lock)
> - --> virNetClientIOHandleInput
> -  --> virNetClientCallDispatch
> -   --> virNetClientCallDispatchMessage
> -    --> virNetClientProgramDispatch
> -     --> virLXCMonitorHandleEventInit
> -      --> virLXCProcessMonitorInitNotify (wants vm lock)
> -
> -Since these threads are scheduled independently and are preemptible it
> -is possible for the deadlock scenario to occur where each thread locks
> -their first lock but both will fail to get their second lock and just
> -spin forever. You get something like:
> -
> -virLXCProcessAutostartDomain (takes vm lock)
> - --> virLXCProcessStart
> -  --> virLXCProcessConnectMonitor
> -   --> virLXCMonitorNew
> -<...>
> -virNetClientIncomingEvent (takes client lock)
> - --> virNetClientIOHandleInput
> -  --> virNetClientCallDispatch
> -   --> virNetClientCallDispatchMessage
> -    --> virNetClientProgramDispatch
> -     --> virLXCMonitorHandleEventInit
> -      --> virLXCProcessMonitorInitNotify (wants vm lock but spins)
> -<...>
> -    --> virNetClientSetCloseCallback (wants client lock but spins)
> -
> -Neither thread ever gets the lock it needs to be able to continue
> -while holding the lock that the other thread needs.
> -
> -The actual window for preemption which can cause this deadlock is
> -rather small, between the calls to virNetClientProgramNew() and
> -execution of virNetClientSetCloseCallback(), both in
> -virLXCMonitorNew(). But it can be seen in real world use that this
> -small window is enough.
> -
> -By moving the call to virNetClientSetCloseCallback() ahead of
> -virNetClientProgramNew() we can close any possible chance of the
> -deadlock taking place. There should be no other implications to the
> -move since the close callback (in the unlikely event was called) will
> -spin on the vm lock. The remaining work that takes place between the
> -old call location of virNetClientSetCloseCallback() and the new
> -location is unaffected by the move.
> -
> -Upstream-Status: Backport commit 7882c6eca53f
> -
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> -Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ----
> - src/lxc/lxc_monitor.c | 11 +++++++----
> - 1 file changed, 7 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/lxc/lxc_monitor.c b/src/lxc/lxc_monitor.c
> -index e765c16..0b18a14 100644
> ---- a/src/lxc/lxc_monitor.c
> -+++ b/src/lxc/lxc_monitor.c
> -@@ -161,6 +161,13 @@ virLXCMonitorPtr virLXCMonitorNew(virDomainObjPtr vm,
> -     if (virNetClientRegisterAsyncIO(mon->client) < 0)
> -         goto error;
> -
> -+    /* avoid deadlock by making this call before assigning virLXCMonitorEvents */
> -+    virNetClientSetCloseCallback(mon->client, virLXCMonitorEOFNotify, mon,
> -+                                 virLXCMonitorCloseFreeCallback);
> -+
> -+    /* close callback now has its own reference */
> -+    virObjectRef(mon);
> -+
> -     if (!(mon->program = virNetClientProgramNew(VIR_LXC_MONITOR_PROGRAM,
> -                                                 VIR_LXC_MONITOR_PROGRAM_VERSION,
> -                                                 virLXCMonitorEvents,
> -@@ -175,10 +182,6 @@ virLXCMonitorPtr virLXCMonitorNew(virDomainObjPtr vm,
> -     mon->vm = virObjectRef(vm);
> -     memcpy(&mon->cb, cb, sizeof(mon->cb));
> -
> --    virObjectRef(mon);
> --    virNetClientSetCloseCallback(mon->client, virLXCMonitorEOFNotify, mon,
> --                                 virLXCMonitorCloseFreeCallback);
> --
> -  cleanup:
> -     VIR_FREE(sockpath);
> -     return mon;
> ---
> -2.7.4
> -
> diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.9.0.bb
> similarity index 98%
> rename from recipes-extended/libvirt/libvirt_4.7.0.bb
> rename to recipes-extended/libvirt/libvirt_4.9.0.bb
> index 5136798..768cf0e 100644
> --- a/recipes-extended/libvirt/libvirt_4.7.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.9.0.bb
> @@ -35,11 +35,10 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>              file://install-missing-file.patch \
>              file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
>              file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
> -           file://lxc_monitor-Avoid-AB-BA-lock-race.patch \
>             "
>   
> -SRC_URI[libvirt.md5sum] = "38da6c33250dcbc0a6d68de5c758262b"
> -SRC_URI[libvirt.sha256sum] = "92c279f7321624ac5a37a81f8bbe8c8d2a16781da04c63c99c92d3de035767e4"
> +SRC_URI[libvirt.md5sum] = "aaf7b265ac2013d6eb184a86b5f7eeb9"
> +SRC_URI[libvirt.sha256sum] = "4fd4bfe7312b7996a817c7919cf0062de0d5b3c400c93bd30855a46c40dd455a"
>   
>   inherit autotools gettext update-rc.d pkgconfig ptest systemd
>   
> 


