Return-Path: <b43198@az84smr01.freescale.net>
Received: from tx2outboundpool.messaging.microsoft.com
	(tx2ehsobe005.messaging.microsoft.com [65.55.88.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24E0CE014F7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 02:10:06 -0700 (PDT)
Received: from mail188-tx2-R.bigfish.com (10.9.14.227) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Thu, 16 May 2013 09:10:05 +0000
Received: from mail188-tx2 (localhost [127.0.0.1])	by
	mail188-tx2-R.bigfish.com (Postfix) with ESMTP id 32299200984	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 09:10:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzd772hzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1155h)
Received: from mail188-tx2 (localhost.localdomain [127.0.0.1]) by mail188-tx2
	(MessageSwitch) id 1368695402705819_18253;
	Thu, 16 May 2013 09:10:02 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.233])	by
	mail188-tx2.bigfish.com (Postfix) with ESMTP id 9E21D220050	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 09:10:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS012.bigfish.com
	(10.9.99.112) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 16 May 2013 09:10:00 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 16 May 2013 09:10:26 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r4G99wec011527;	Thu, 16 May 2013 02:09:59 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r4G99w9x023204;
	Thu, 16 May 2013 12:09:58 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 16 May 2013 12:09:57 +0300
Message-ID: <1368695397-23171-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH] lxc-clone: don't let LXC_PATH end in failure
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
X-List-Received-Date: Thu, 16 May 2013 09:10:06 -0000
Content-Type: text/plain

This patch has been included in the upstream repo as the first
patch after LXC 0.9.0 release. Including it in meta-virtualization
for proper functioning of the lxc-clone command.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...c-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch | 29 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch

diff --git a/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch b/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
new file mode 100644
index 0000000..fe9f8cc
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
@@ -0,0 +1,29 @@
+From fd95f2402dc70ad41fa2db8fb101f950196458a9 Mon Sep 17 00:00:00 2001
+From: Serge Hallyn <serge.hallyn@ubuntu.com>
+Date: Tue, 9 Apr 2013 16:23:05 -0500
+Subject: [PATCH] lxc.functions: don't let LXC_PATH= line end in failure
+
+Otherwise if called from dash with set -e, dash will exit.  This
+causes lxc-clone to fail.
+
+Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
+---
+ src/lxc/lxc.functions.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lxc/lxc.functions.in b/src/lxc/lxc.functions.in
+index b41f9b8..aa5717d 100644
+--- a/src/lxc/lxc.functions.in
++++ b/src/lxc/lxc.functions.in
+@@ -26,7 +26,7 @@ templatedir=@LXCTEMPLATEDIR@
+ lxcinitdir=@LXCINITDIR@
+ 
+ get_default_lxcpath() {
+-	LXC_PATH=$(grep -v "^#" "$globalconf" 2>/dev/null | grep "[ \t]*lxcpath[ \t]*=")
++	LXC_PATH=$(grep -v "^#" "$globalconf" 2>/dev/null | grep "[ \t]*lxcpath[ \t]*=") || true
+ 	if [ -n "$LXC_PATH" ]; then
+ 		echo $LXC_PATH | awk -F= '{ print $2 }'
+ 	else
+-- 
+1.7.11.7
+
diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 1cbbad0..bed7e4a 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
 	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
 	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
     file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
+    file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
 	"
 SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
 SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
-- 
1.7.11.7



