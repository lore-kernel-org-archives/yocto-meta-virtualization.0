Return-Path: <b43198@fsr-fed1764-008.ea.freescale.net>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47F1EE014A7
	for <meta-virtualization@lists.yoctoproject.org>;
	Fri, 24 May 2013 07:24:45 -0700 (PDT)
Received: from mail51-co9-R.bigfish.com (10.236.132.252) by
	CO9EHSOBE028.bigfish.com (10.236.130.91) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 May 2013 14:24:45 +0000
Received: from mail51-co9 (localhost [127.0.0.1])	by mail51-co9-R.bigfish.com
	(Postfix) with ESMTP id E98E69A08A3	for
	<meta-virtualization@lists.yoctoproject.org>;
	Fri, 24 May 2013 14:24:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zz853kzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz177df4h17326ah8275bh8275dh8275chz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1155h)
Received: from mail51-co9 (localhost.localdomain [127.0.0.1]) by mail51-co9
	(MessageSwitch) id 1369405483141513_27138;
	Fri, 24 May 2013 14:24:43 +0000 (UTC)
Received: from CO9EHSMHS021.bigfish.com (unknown [10.236.132.225])	by
	mail51-co9.bigfish.com (Postfix) with ESMTP id 2029DC20073	for
	<meta-virtualization@lists.yoctoproject.org>;
	Fri, 24 May 2013 14:24:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS021.bigfish.com
	(10.236.130.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 May 2013 14:24:41 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 24 May 2013 14:25:27 +0000
Received: from fsr-fed1764-008.ea.freescale.net
	(fsr-fed1764-008.ea.freescale.net [10.171.73.92])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id r4OEOdSn021432;
	Fri, 24 May 2013 07:24:40 -0700
Received: (from b43198@localhost)	by fsr-fed1764-008.ea.freescale.net
	(8.14.5/8.14.5/Submit) id r4OEOcLL013625;
	Fri, 24 May 2013 17:24:38 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@lists.yoctoproject.org>
Date: Fri, 24 May 2013 17:24:36 +0300
Message-ID: <1369405476-13592-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Cc: Bogdan Purcareata <bogdan.purcareata@freescale.net>
Subject: [PATCH] libvirt: add patch to fix thread safety in lxc callback
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
X-List-Received-Date: Fri, 24 May 2013 14:24:46 -0000
Content-Type: text/plain

From: Bogdan Purcareata <bogdan.purcareata@freescale.net>

Patch has been submitted upstream (22 mar 2013) after the release of
Libvirt 1.0.3 (5 mar 2013). Updated to work against libvirt 1.0.3.
Please see http://www.redhat.com/archives/libvir-list/2013-March/msg01353.html
for original patch.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.net>
---
 ...ix-thread-safety-in-lxc-callback-handling.patch | 63 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.0.3.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch

diff --git a/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch b/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
new file mode 100644
index 0000000..558d5ef
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
@@ -0,0 +1,63 @@
+From ad5d9cee87357f9f38f62583119606ef95ba10df Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Fri, 24 May 2013 16:46:00 +0300
+Subject: [PATCH] Fix thread safety in LXC callback handling
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+---
+ src/lxc/lxc_process.c | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/src/lxc/lxc_process.c b/src/lxc/lxc_process.c
+index aaa81a7..0eadc67 100644
+--- a/src/lxc/lxc_process.c
++++ b/src/lxc/lxc_process.c
+@@ -609,8 +609,13 @@ static void virLXCProcessMonitorExitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
+                                            virLXCProtocolExitStatus status,
+                                            virDomainObjPtr vm)
+ {
++    virLXCDriverPtr driver = lxc_driver;
+     virLXCDomainObjPrivatePtr priv = vm->privateData;
+ 
++    lxcDriverLock(driver);
++    virObjectLock(vm);
++    lxcDriverUnlock(driver);
++
+     switch (status) {
+     case VIR_LXC_PROTOCOL_EXIT_STATUS_SHUTDOWN:
+         priv->stopReason = VIR_DOMAIN_EVENT_STOPPED_SHUTDOWN;
+@@ -628,6 +633,8 @@ static void virLXCProcessMonitorExitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
+     }
+     VIR_DEBUG("Domain shutoff reason %d (from status %d)",
+               priv->stopReason, status);
++
++    virObjectUnlock(vm);
+ }
+ 
+ /* XXX a little evil */
+@@ -636,12 +643,21 @@ static void virLXCProcessMonitorInitNotify(virLXCMonitorPtr mon ATTRIBUTE_UNUSED
+                                            pid_t initpid,
+                                            virDomainObjPtr vm)
+ {
+-    virLXCDomainObjPrivatePtr priv = vm->privateData;
++    virLXCDriverPtr driver = lxc_driver;
++    virLXCDomainObjPrivatePtr priv;
++
++    lxcDriverLock(driver);
++    virObjectLock(vm);
++    lxcDriverUnlock(driver);
++
++    priv = vm->privateData;
+     priv->initpid = initpid;
+     virDomainAuditInit(vm, initpid);
+ 
+     if (virDomainSaveStatus(lxc_driver->caps, lxc_driver->stateDir, vm) < 0)
+         VIR_WARN("Cannot update XML with PID for LXC %s", vm->def->name);
++
++    virObjectUnlock(vm);
+ }
+ 
+ static virLXCMonitorCallbacks monitorCallbacks = {
+-- 
+1.7.11.7
+
diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
index 0364421..9a828b1 100644
--- a/recipes-extended/libvirt/libvirt_1.0.3.bb
+++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
@@ -19,6 +19,7 @@ RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
 RCONFLICTS_${PN}_libvirtd = "connman"
 
 SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
+  file://libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch \
 	file://libvirtd.sh \
 	file://libvirtd.conf"
 
-- 
1.7.11.7



