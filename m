Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75532E00D90; Thu, 10 Sep 2015 10:59:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BD08E00B0B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 10:59:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8AHxDVh000788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 10:59:13 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 10 Sep 2015 10:59:13 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 10 Sep 2015 13:59:12 -0400
Message-ID: <1441907952-29662-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] dnsmasq: allow for multiple instances (per libvirt)
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
X-List-Received-Date: Thu, 10 Sep 2015 17:59:15 -0000
Content-Type: text/plain

We have had a persistent issue of contention with multiple instances
of dnsmasq. When libvirtd is started it will attempt and fail to
create virbr0 that includes a dnsmasq binding (dnsmasq complains that
the port is already in use). The root cause being that the base
dnsmasq configuration uses the 'default' binding, meaning it will be
greedy and bind to all available interfaces, along with any new
interfaces that appear. This prevents any new instances of dnsmasq to
fail. By changing the base dnsmasq configuration to use 'bind-dynamic'
we will be able to create new interfaces and if we want to attach a
new dnsmasq instance for the new interface we can, without contention.

Overall this change should not change the default behavior (other then
fixing the contention) as the 'bind-dynamic' mode will allow the base
config to attach to new interfaces which are not be bound to new
dnsmasq instances.

Removing dnsmasq_exclude_virbr.conf which was a previous (partial)
attempt that was made to resolve this issue.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt/dnsmasq_exclude_virbr.conf | 1 -
 recipes-support/dnsmasq/dnsmasq_2.%.bbappend                | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)
 delete mode 100644 recipes-extended/libvirt/libvirt/dnsmasq_exclude_virbr.conf
 create mode 100644 recipes-support/dnsmasq/dnsmasq_2.%.bbappend

diff --git a/recipes-extended/libvirt/libvirt/dnsmasq_exclude_virbr.conf b/recipes-extended/libvirt/libvirt/dnsmasq_exclude_virbr.conf
deleted file mode 100644
index 16bf198..0000000
--- a/recipes-extended/libvirt/libvirt/dnsmasq_exclude_virbr.conf
+++ /dev/null
@@ -1 +0,0 @@
-except-interface=virbr0
diff --git a/recipes-support/dnsmasq/dnsmasq_2.%.bbappend b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
new file mode 100644
index 0000000..8d66ca6
--- /dev/null
+++ b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
@@ -0,0 +1,5 @@
+# dnsmasq is greedy with interfaces by default using bind-dynamic will
+# make it less greedy but still function as it did by default.
+do_install_append() {
+    sed -i '/#bind-interfaces/a # Play nice with libvirt\nbind-dynamic' ${D}${sysconfdir}/dnsmasq.conf
+}
-- 
2.1.4


