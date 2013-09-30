Return-Path: <b43198@fsr-fed1764-008.ea.freescale.net>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe001.messaging.microsoft.com [216.32.181.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA08EE0165B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Sep 2013 03:40:09 -0700 (PDT)
Received: from mail16-ch1-R.bigfish.com (10.43.68.230) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.22; Mon, 30 Sep 2013 10:40:08 +0000
Received: from mail16-ch1 (localhost [127.0.0.1])	by mail16-ch1-R.bigfish.com
	(Postfix) with ESMTP id 975F5160263	for
	<meta-virtualization@yoctoproject.org>;
	Mon, 30 Sep 2013 10:40:08 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h177df4h17326ah1de097h186068h8275bh8275dhz2dh2a8h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h1155h)
Received: from mail16-ch1 (localhost.localdomain [127.0.0.1]) by mail16-ch1
	(MessageSwitch) id 1380537607415840_10280;
	Mon, 30 Sep 2013 10:40:07 +0000 (UTC)
Received: from CH1EHSMHS037.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.244])	by mail16-ch1.bigfish.com (Postfix) with ESMTP id
	6115D3800F8 for <meta-virtualization@yoctoproject.org>;
	Mon, 30 Sep 2013 10:40:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS037.bigfish.com
	(10.43.69.246) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 30 Sep 2013 10:40:07 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Mon, 30 Sep 2013 10:40:06 +0000
Received: from fsr-fed1764-008.ea.freescale.net
	(fsr-fed1764-008.ea.freescale.net [10.171.73.92])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id r8UAe5rc026298;
	Mon, 30 Sep 2013 03:40:05 -0700
Received: (from b43198@localhost)	by fsr-fed1764-008.ea.freescale.net
	(8.14.5/8.14.5/Submit) id r8UAe3dU028917;
	Mon, 30 Sep 2013 13:40:03 +0300
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 30 Sep 2013 13:40:02 +0300
Message-ID: <1380537602-28880-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] libvirt: Don't fail when mounting securityfs with containers
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
X-List-Received-Date: Mon, 30 Sep 2013 10:40:11 -0000
Content-Type: text/plain

When starting containers under libvirt, the code will automatically
try to mount securityfs in the new mount namespace. Since securityfs
support is not available on all embedded platforms, add runtime check
of its presence in the current running kernel. Based on this, mount
securityfs in libvirt containers.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 .../Don-t-fail-when-mounting-securityfs.patch      | 101 +++++++++++++++++++++
 recipes-extended/libvirt/libvirt_1.1.2.bb          |   3 +-
 2 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/libvirt/libvirt/Don-t-fail-when-mounting-securityfs.patch

diff --git a/recipes-extended/libvirt/libvirt/Don-t-fail-when-mounting-securityfs.patch b/recipes-extended/libvirt/libvirt/Don-t-fail-when-mounting-securityfs.patch
new file mode 100644
index 0000000..865dcb5
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/Don-t-fail-when-mounting-securityfs.patch
@@ -0,0 +1,101 @@
+From 258c44b56fca2b4095fc1cf76e2a3baf0ce3f33f Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Wed, 25 Sep 2013 13:19:47 +0300
+Subject: [PATCH] Don't fail when mounting securityfs when it's not supported
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+---
+ src/lxc/lxc_container.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 59 insertions(+)
+
+diff --git a/src/lxc/lxc_container.c b/src/lxc/lxc_container.c
+index 8abaea0..a44c9ef 100644
+--- a/src/lxc/lxc_container.c
++++ b/src/lxc/lxc_container.c
+@@ -509,6 +509,59 @@ static int lxcContainerChildMountSort(const void *a, const void *b)
+ # define MS_SLAVE                (1<<19)
+ #endif
+ 
++/*
++ * This function attempts to detect kernel support
++ * for a specific filesystem type. This is done by
++ * inspecting /proc/filesystems.
++ */
++static int lxcCheckFSSupport(const char *fs_type)
++{
++    FILE *fp = NULL;
++    int ret = -1;
++    const char *fslist = "/proc/filesystems";
++    char *line = NULL;
++    const char *type;
++
++    if(!fs_type)
++	    return 1;
++
++    VIR_DEBUG("Checking kernel support for %s", fs_type);
++
++    VIR_DEBUG("Open  %s", fslist);
++    if (!(fp = fopen(fslist, "r"))) {
++        if (errno == ENOENT)
++
++        virReportSystemError(errno,
++                             _("Unable to read %s"),
++                             fslist);
++        goto cleanup;
++    }
++
++    while (!feof(fp)) {
++        size_t n;
++        VIR_FREE(line);
++        if (getline(&line, &n, fp) <= 0) {
++            if (feof(fp))
++                break;
++
++            goto cleanup;
++        }
++
++        type = strstr(line, fs_type);
++        if (type) {
++            ret = 1;
++	    goto cleanup;
++	}
++    }
++
++    ret = 0;
++
++cleanup:
++    VIR_FREE(line);
++    VIR_FORCE_FCLOSE(fp);
++    return ret;
++}
++
+ static int lxcContainerGetSubtree(const char *prefix,
+                                   char ***mountsret,
+                                   size_t *nmountsret)
+@@ -784,17 +837,23 @@ static int lxcContainerMountBasicFS(void)
+ 
+     for (i = 0; i < ARRAY_CARDINALITY(mnts); i++) {
+         const char *srcpath = NULL;
++	const char *dstpath = NULL;
+ 
+         VIR_DEBUG("Processing %s -> %s",
+                   mnts[i].src, mnts[i].dst);
+ 
+         srcpath = mnts[i].src;
++	dstpath = mnts[i].dst;
+ 
+         /* Skip if mount doesn't exist in source */
+         if ((srcpath[0] == '/') &&
+             (access(srcpath, R_OK) < 0))
+             continue;
+ 
++	if ((access(dstpath, R_OK) < 0) || /* mount is not present on host */
++	    (!lxcCheckFSSupport(mnts[i].type))) /* no fs support in kernel */
++		continue;
++
+ #if WITH_SELINUX
+         if (STREQ(mnts[i].src, SELINUX_MOUNT) &&
+             !is_selinux_enabled())
+-- 
+1.7.11.7
+
diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
index cfb406d..240f3d2 100644
--- a/recipes-extended/libvirt/libvirt_1.1.2.bb
+++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
@@ -25,7 +25,8 @@ RCONFLICTS_${PN}_libvirtd = "connman"
 SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
            file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
 	   file://libvirtd.sh \
-	   file://libvirtd.conf"
+	   file://libvirtd.conf \
+	   file://Don-t-fail-when-mounting-securityfs.patch"
 
 SRC_URI[md5sum] = "1835bbfa492099bce12e2934870e5611"
 SRC_URI[sha256sum] = "16648af54d3e162f5cc5445d970ec29a0bd55b1dbcb568a05533c4c2f25965e3"
-- 
1.7.11.7



