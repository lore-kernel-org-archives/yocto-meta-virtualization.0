Return-Path: <dariusz.pelowski@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0435E00C7B; Sun,  5 Nov 2017 04:16:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (dariusz.pelowski[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.215.65 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6A2AE00AD7
	for <meta-virtualization@yoctoproject.org>;
	Sun,  5 Nov 2017 04:16:30 -0800 (PST)
Received: by mail-lf0-f65.google.com with SMTP id a132so7644163lfa.7
	for <meta-virtualization@yoctoproject.org>;
	Sun, 05 Nov 2017 04:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EUbbk2Fwc7r1II7e/FIqAvUhmr3O6t0ggFjEoSZoAgs=;
	b=GgHZY+EPRuhQZlII9qu9FwqRGzAydUVXcR4AUeyLhX+xqVpt61l+fEwBAV/p5Fc2OU
	EDUZcUZeYHcTiNoRSpjdhxErwAJ6RUmuT78UyTY9OMztpHEaL+v7kyiZQCpURh6+PXom
	0GTXKQ/RHYsWNB09m81NkPq5b957YrSnZC7QwfrAySt+b3Fbh/YfbokxhnlGXNOYaV1u
	dU3g/zJBMDoFK2zuhA6CpB+BFAJ3sCKMfmhNoEUIYpj5Ak1jVfPUljCNgz8yzdSlN8SI
	EMvBEIiyvTG3oMKsUkE5lC9R3HRuG+q9jonR018RFg+BWbCiNFLG97iG08qEDTrhSu4a
	vtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EUbbk2Fwc7r1II7e/FIqAvUhmr3O6t0ggFjEoSZoAgs=;
	b=otiEl3XK7BHAAVeL8u7NQfytyHBkFLJEcJ6u472t6BH5RQA/A8wc+zpAmdmP7EjFUS
	WuAueInErYg/cyVj/WVcS/H6INAgysnXHl/Q/etpWEeZpxOaXP9DW70JD+XwvAEjrMWO
	QtzwGk5V3ybTH4X28yhlHwp6Ao38JEXxKo3IBbyw9CvcOSFokbg+7R42ZIfYe4mfoDsY
	DbbNu/RDFjDZI6zpeWDIqyBdMBxPef4uKTYnanIIZQOD4Nbjql2y9aYHDgUMBZ4kP4Vs
	fTF6YxjXn96lzxjyJyREhcqiZF/5j4yLa8M6e7sHd+yAGtudERaKcu7GzK9szjCe79pX
	SBSw==
X-Gm-Message-State: AMCzsaW2KTlRdzC1KfdldQx6kQ3PROW76PKY42r3OZI7YTAuMPlYLDZG
	3oYym+oMWWIcyqjOVSab8fCIsocu
X-Google-Smtp-Source: ABhQp+SrenBZdpkf3LigvjTkZLhFmACB1tZmI5jgD3R6egqFPsxuP0JZfAmqS3hL9zlCADLzsGoeMw==
X-Received: by 10.46.21.28 with SMTP id s28mr4900081ljd.70.1509884189014;
	Sun, 05 Nov 2017 04:16:29 -0800 (PST)
Received: from duzy.lan (user-188-33-218-82.play-internet.pl. [188.33.218.82])
	by smtp.gmail.com with ESMTPSA id
	x188sm1866986lfa.0.2017.11.05.04.16.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Nov 2017 04:16:28 -0800 (PST)
From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Sun,  5 Nov 2017 13:15:41 +0100
Message-Id: <20171105121541.10625-1-dariusz.pelowski@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH] kvmtool: fix compilation errors
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
X-List-Received-Date: Sun, 05 Nov 2017 12:16:31 -0000

Fixed issues:
Usage of makedev requires including <sys/sysmacros.h> otherwise
the error is raised due to multiple definition in <sys/types.h>.

Add include path to kernel headers required to get kvmtool
compilatioin successful.

Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
---
 .../0001-kvmtool-9p-fixed-compilation-error.patch  | 27 ++++++++++++++++++++
 .../0002-kvmtool-add-EXTRA_CFLAGS-variable.patch   | 29 ++++++++++++++++++++++
 recipes-extended/kvmtool/kvmtool.bb                |  7 +++++-
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 recipes-extended/kvmtool/files/0001-kvmtool-9p-fixed-compilation-error.patch
 create mode 100644 recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch

diff --git a/recipes-extended/kvmtool/files/0001-kvmtool-9p-fixed-compilation-error.patch b/recipes-extended/kvmtool/files/0001-kvmtool-9p-fixed-compilation-error.patch
new file mode 100644
index 0000000..63911fc
--- /dev/null
+++ b/recipes-extended/kvmtool/files/0001-kvmtool-9p-fixed-compilation-error.patch
@@ -0,0 +1,27 @@
+From bcd954ffdb9383030e02d356b51e09e4e2a7105a Mon Sep 17 00:00:00 2001
+From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
+Date: Sun, 5 Nov 2017 12:39:52 +0100
+Subject: [PATCH 1/2] kvmtool: 9p: fixed compilation error
+
+makedev is defined in sys/sysmacros.h
+
+Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
+---
+ virtio/9p.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/virtio/9p.c b/virtio/9p.c
+index 6acbfdd..1dee2c2 100644
+--- a/virtio/9p.c
++++ b/virtio/9p.c
+@@ -15,6 +15,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <sys/vfs.h>
++#include <sys/sysmacros.h>
+ 
+ #include <linux/virtio_ring.h>
+ #include <linux/virtio_9p.h>
+-- 
+2.15.0
+
diff --git a/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
new file mode 100644
index 0000000..262531c
--- /dev/null
+++ b/recipes-extended/kvmtool/files/0002-kvmtool-add-EXTRA_CFLAGS-variable.patch
@@ -0,0 +1,29 @@
+From 977a4d41012d1814f5a5330cacc2e4944de387cc Mon Sep 17 00:00:00 2001
+From: Dariusz Pelowski <dariusz.pelowski@gmail.com>
+Date: Sun, 5 Nov 2017 12:39:21 +0100
+Subject: [PATCH 2/2] kvmtool: add EXTRA_CFLAGS variable
+
+to avoid CFLAGS overriding introduce new EXTRA_CFLAGS variable
+for setting via command argument
+
+Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 64a0a16..bca1b26 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,6 +2,8 @@
+ # Define WERROR=0 to disable -Werror.
+ #
+ 
++CFLAGS += $(EXTRA_CFLAGS)
++
+ ifeq ($(strip $(V)),)
+ 	E = @echo
+ 	Q = @
+-- 
+2.15.0
+
diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
index b3bf202..33fec31 100644
--- a/recipes-extended/kvmtool/kvmtool.bb
+++ b/recipes-extended/kvmtool/kvmtool.bb
@@ -5,10 +5,15 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 
 DEPENDS = "dtc libaio zlib"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+inherit kernel-arch
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
            file://external-crosscompiler.patch \
            file://0001-Avoid-pointers-for-address-of-packed-members.patch \
+           file://0001-kvmtool-9p-fixed-compilation-error.patch \
+           file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
            "
 
 SRCREV = "3fea89a924511f9f8fe05a892098fad77c1eca0d"
@@ -16,7 +21,7 @@ PV = "3.18.0+git${SRCREV}"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE='ARCH="${TARGET_ARCH}" V=1'
+EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_DIR}/arch/${ARCH}/include -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated/"'
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.15.0


