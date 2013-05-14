Return-Path: <>
Received: from AM1EHSNDR001.bigfish.com
	(am1outboundsmtppool1.messaging.microsoft.com [213.199.180.165])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0808DE014F5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 02:41:37 -0700 (PDT)
Received: from am1outboundpool.messaging.microsoft.com (10.3.201.249) by
	AM1EHSNDR001.bigfish.com (10.3.204.15) with Microsoft SMTP Server (TLS)
	id 14.1.225.23; Tue, 14 May 2013 09:41:35 +0000
Received: from mail65-am1-R.bigfish.com (10.3.201.226) by
	AM1EHSOBE008.bigfish.com (10.3.204.28) with Microsoft SMTP Server id
	14.1.225.23; Tue, 14 May 2013 09:41:35 +0000
Received: from mail65-am1 (localhost [127.0.0.1])	by mail65-am1-R.bigfish.com
	(Postfix) with ESMTP id 6871A1C009E	for
	<meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 09:41:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-OUTBOUND-SPAM: yes
X-SpamScore: 0
X-BigFish: VS0(zzd772hzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz17326ah8275bh8275chz2dh87h2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh41h42h1155h1151h)
X-FB-DOMAIN-IP-MATCH: fail
Received: from mail65-am1 (localhost.localdomain [127.0.0.1]) by mail65-am1
	(MessageSwitch) id 136852449371860_20777;
	Tue, 14 May 2013 09:41:33 +0000 (UTC)
Received: from AM1EHSMHS016.bigfish.com (unknown [10.3.201.244])	by
	mail65-am1.bigfish.com (Postfix) with ESMTP id 059EE100227	for
	<meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 09:41:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS016.bigfish.com
	(10.3.207.154) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 14 May 2013 09:41:32 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 14 May 2013 09:41:30 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r4E9fTjX032478;	Tue, 14 May 2013 02:41:30 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r4E9fRe2030913;
	Tue, 14 May 2013 12:41:27 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 14 May 2013 12:41:26 +0300
Message-ID: <1368524486-30880-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: sigmatel.com
Subject: [PATCH] lxc-busybox: check when bind-mounting host libdirs
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: b43198@localhost.localdomain
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 09:41:37 -0000
Content-Type: text/plain

The patch checks bind mounting lib directories when starting a
busybox container on a 64bit platform. Some entries in the host
filesystem are not present but the busybox template expects them
to be there, and thus container start fails.

Please see further details in added patch description.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...xc-0.9.0-check-when-bind-mounting-libdirs.patch | 44 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch

diff --git a/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch b/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
new file mode 100644
index 0000000..4d21a02
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
@@ -0,0 +1,44 @@
+From 9e74f8161b8db05365fde0646b0c29c852afc3a0 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Tue, 14 May 2013 11:54:23 +0300
+Subject: [PATCH] lxc-busybox: check when bind-mounting host libdirs
+
+The patch changes the busybox template behavior to automatically
+mount /lib and /usr/lib. In case one of these folders does not exist,
+starting the container will fail. Also, if there are other lib entries
+on the host - e.g. /usr/lib64 -  mount them as well.
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+---
+ templates/lxc-busybox.in | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index cb425ec..49effae 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -240,13 +240,6 @@ lxc.pts = 1
+ #lxc.aa_profile = unconfined
+ EOF
+ 
+-if [ -d "$rootfs/lib" ]; then
+-cat <<EOF >> $path/config
+-lxc.mount.entry = /lib $rootfs/lib none ro,bind 0 0
+-lxc.mount.entry = /usr/lib $rootfs/usr/lib none ro,bind 0 0
+-EOF
+-fi
+-
+     libdirs="\
+         lib \
+         usr/lib \
+@@ -255,6 +248,7 @@ fi
+ 
+     for dir in $libdirs; do
+         if [ -d "/$dir" ] && [ -d "$rootfs/$dir" ]; then
++            echo "lxc.mount.entry = /$dir $rootfs/$dir none ro,bind 0 0" >> $path/config
+             echo "lxc.mount.entry = /$dir $dir none ro,bind 0 0" >> $path/config
+         fi
+     done
+-- 
+1.7.11.7
+
diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 63ce2d6..1cbbad0 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = " \
 SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
 	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
 	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
+    file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
 	"
 SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
 SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
-- 
1.7.11.7



