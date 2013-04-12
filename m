Return-Path: <b43198@az84smr01.freescale.net>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe001.messaging.microsoft.com [207.46.163.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5CA3E014D5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2013 07:22:08 -0700 (PDT)
Received: from mail215-co9-R.bigfish.com (10.236.132.253) by
	CO9EHSOBE003.bigfish.com (10.236.130.66) with Microsoft SMTP Server id
	14.1.225.23; Fri, 12 Apr 2013 14:22:07 +0000
Received: from mail215-co9 (localhost [127.0.0.1])	by
	mail215-co9-R.bigfish.com (Postfix) with ESMTP id 554D422017F	for
	<meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2013 14:22:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 13
X-BigFish: VS13(zzd772hdb1duzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail215-co9 (localhost.localdomain [127.0.0.1]) by mail215-co9
	(MessageSwitch) id 1365776524833074_26424;
	Fri, 12 Apr 2013 14:22:04 +0000 (UTC)
Received: from CO9EHSMHS020.bigfish.com (unknown [10.236.132.238])	by
	mail215-co9.bigfish.com (Postfix) with ESMTP id C2D1E480047	for
	<meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2013 14:22:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS020.bigfish.com
	(10.236.130.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 12 Apr 2013 14:22:04 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 12 Apr 2013 14:22:03 +0000
Received: from localhost.localdomain (fsr-fed1764-008.ea.freescale.net
	[10.171.73.92])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r3CEM2j2031124;	Fri, 12 Apr 2013 07:22:02 -0700
Received: (from b43198@localhost)	by localhost.localdomain
	(8.14.5/8.14.5/Submit) id r3CEM1fl008965;
	Fri, 12 Apr 2013 17:22:01 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 12 Apr 2013 17:21:58 +0300
Message-ID: <1365776519-8929-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
Subject: [PATCH 1/2] containers - lxc-template: enable chroot + chpasswd functionality for Busybox hosts
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
X-List-Received-Date: Fri, 12 Apr 2013 14:22:08 -0000
Content-Type: text/plain

This patch enables installation of Buysbox containers on Busybox hosts.
Please see patch message for detailed information.

The patch has been submitted and accepted upstream by LXC maintainers.
The functionality hasn't made it to LXC 0.9.0, but will (most probably)
be included upstream in future releases of LXC.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...-chpasswd-functionality-for-busybox-hosts.patch | 70 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch

diff --git a/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch b/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
new file mode 100644
index 0000000..d07c658
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
@@ -0,0 +1,70 @@
+From 4ddc14bd0866ff769421857044dd14867f1944d5 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Thu, 11 Apr 2013 16:15:43 +0300
+Subject: [PATCH v2] lxc-template: enable chroot + chpasswd functionality for
+ Busybox hosts
+
+This patch supports the scenario where a user wants to install a
+busybox container on a busybox host.
+
+When running the template, in order to change the root password,
+the template needs to do the chroot. On busybox-powered hosts, chroot
+is not part of the coreutils package - it's part of busybox. And the
+busybox implementation or chroot only works if it has /lib in the new
+root populated with the right binaries (or at least that's the
+solution I found to make it work).
+
+The temporarily bind-mounts /lib in the NEWROOT, chroots there,
+changes the password, goes back and unmounts. This set of operations
+is contained in a new MOUNT namespace, using the lxc-unshare call.
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+---
+ templates/lxc-busybox.in | 30 ++++++++++++++++++++++++++++--
+ 1 file changed, 28 insertions(+), 2 deletions(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index cb425ec..2ca2bfd 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -189,9 +189,35 @@ configure_busybox()
+     # passwd exec must be setuid
+     chmod +s $rootfs/bin/passwd
+     touch $rootfs/etc/shadow
+-    echo "setting root passwd to root"
+-    echo "root:root" | chroot $rootfs chpasswd
+ 
++    # setting passwd for root
++    CHPASSWD_FILE=$rootfs/root/chpasswd.sh
++
++    cat <<EOF >$CHPASSWD_FILE
++echo "setting root password to \"root\""
++
++mount --bind /lib $rootfs/lib
++if [ \$? -ne 0 ]; then
++    echo "Failed bind-mounting /lib at $rootfs/lib"
++    exit 1
++fi
++
++chroot $rootfs chpasswd <<EOFF 2>/dev/null
++root:root
++EOFF
++
++
++if [ \$? -ne 0 ]; then
++    echo "Failed to change root password"
++    exit 1
++fi
++
++umount $rootfs/lib
++
++EOF
++
++    lxc-unshare -s MOUNT -- /bin/sh < $CHPASSWD_FILE
++    rm $CHPASSWD_FILE
+ 
+     # add ssh functionality if dropbear package available on host
+     which dropbear >/dev/null 2>&1
+-- 
+1.7.11.7
+
diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index fcda0ba..63ce2d6 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} = " \
 
 SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
 	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
+	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
 	"
 SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
 SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
-- 
1.7.11.7



