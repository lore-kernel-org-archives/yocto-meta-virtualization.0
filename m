Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.85.1600803950661868512
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 12:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MidkO8y+;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id g3so16610929qtq.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Sep 2020 12:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=45kHTLzepS9lAxa9GfVLCf8AC38nuSBd1VpAP7jXWqs=;
        b=MidkO8y+DWjHWbvOud5pgKh29KaGcxBTYnv5JqGht1rSonxPdCI+FEFmkKeVGnY5IX
         TxdCbu9knL6+4YWtnYjhKwLNOmuY2021U83Mpz+EMtHFpQFKKVe2YTt4f8aMMBGoh+lM
         Zn0IaZxLfXiOLEJb5pjqDdeeXarcBco0QmndrNe40E2NiD9h47STXmKSHFQAnhgEdCGQ
         /Ai0ar6E0afAfH2Kca2t/fp327bwzKsE3d0qBzC82XFgZPxV+A3OzXdQwU9yyjZAOkl6
         EoxU5t5bhHLEhmoXPFS+LoezcKie06pmWec/knLqusB3+KzAwiU/tPZDoTGVFPZqKxWd
         FbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=45kHTLzepS9lAxa9GfVLCf8AC38nuSBd1VpAP7jXWqs=;
        b=tSK3RdwEHcTQSDM071J7BY2E2gKNVnRKiQY/osoGyIF9LPOLlWzkJmjO75WCahayZj
         RBwbAjjqYBNaLldvAX5dmi8vm4zFdILOSZGr/Ni+4WHAI441E3UMFZsVZhndirCP0YDD
         WXxyWczQorPZWoDMJni88z1WxOAIyNxMUq1/9D207at/JUE2PVuQOfMyTefcxvxWGfLO
         92rMY279HXaORJMuvF8M4ylf6jVYdlKpfbtzpPklbxrkvVGqTYx69sqvM44ts7pm67mj
         VDDjxz4FPGxoY2xfqPo4XjT1nNFz3YftzWx3x12yeddXj+2S/e6xq16BuSzunYViExEB
         t72w==
X-Gm-Message-State: AOAM5332wJh+yOGmyVPRKr/VdSpjZdavVLr/WHTqAD8fq+6NyamAbyNN
	k2FaFuM7D4TRrrFnfvA0nhYwUbSGCmQGgiI+
X-Google-Smtp-Source: ABdhPJyDthr4qPmmO0DPXLHqeGi6A67xPzbgrubwbT3CRFUiPSG7dwF8uzKSmtKgGYlnRx0fQ/vDUw==
X-Received: by 2002:ac8:c44:: with SMTP id l4mr1693759qti.2.1600803949412;
        Tue, 22 Sep 2020 12:45:49 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t43sm13538513qtc.54.2020.09.22.12.45.48
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:45:48 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH 4/7] runx: robustness changes
Date: Tue, 22 Sep 2020 15:45:36 -0400
Message-Id: <20200922194539.51933-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200922194539.51933-1-bruce.ashfield@gmail.com>
References: <20200922194539.51933-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@xilinx.com>

Adding one build and one runtime robustness change:

  - build: specify the syroot native as a library path to qemu user.
           This allows us to run dynamic executables

  - runtime: add a patch to increase the serial fd timeout. We'll
             drop this once it is merged upstream.

Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...001-runX-add-bounded-looping-timeout.patch | 35 +++++++++++++++++++
 recipes-core/runx/runx_git.bb                 |  6 ++--
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 recipes-core/runx/runx/0001-runX-add-bounded-looping-timeout.patch

diff --git a/recipes-core/runx/runx/0001-runX-add-bounded-looping-timeout.patch b/recipes-core/runx/runx/0001-runX-add-bounded-looping-timeout.patch
new file mode 100644
index 0000000..b4c6efa
--- /dev/null
+++ b/recipes-core/runx/runx/0001-runX-add-bounded-looping-timeout.patch
@@ -0,0 +1,35 @@
+From 1cf4ff2137252c63687f54e09626850cfab6e9f9 Mon Sep 17 00:00:00 2001
+From: Rob Woolley <Rob.Woolley@windriver.com>
+Date: Thu, 17 Sep 2020 19:41:06 -0700
+Subject: [PATCH] runX: add bounded / looping timeout
+
+On slower machines, we may need a longer timeout before giving
+up.
+
+Signed-off-by: Rob Woolley <Rob.Woolley@windriver.com>
+---
+ git/runX | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/runX b/runX
+index 492cb4c..70c95e1 100755
+--- a/runX
++++ b/runX
+@@ -119,7 +119,13 @@ then
+         daemonize $workpath/serial_start \
+           "$containerid" \
+           "$crundir"/console_pty
+-        sleep .1
++        for n in 5 4 3 2 1; do
++            if [ ! -l "$crundir"/console_pty ]; then
++              break;
++            else
++              sleep .1;
++            fi;
++        done
+         daemonize $workpath/serial_fd_handler \
+           "$guestconsole" \
+           "$crundir"/console_pty
+-- 
+2.17.1
+
diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
index bf84b2d..53c2464 100644
--- a/recipes-core/runx/runx_git.bb
+++ b/recipes-core/runx/runx_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
           https://www.kernel.org/pub/linux/kernel/${KERNEL_URL_VER}/${KERNEL_SRC_VER}.tar.xz;destsuffix=git/kernel/build \
           file://0001-make-kernel-cross-compilation-tweaks.patch \
           file://0001-make-initrd-cross-install-tweaks.patch \
+          file://0001-runX-add-bounded-looping-timeout.patch \
 	  "
 SRC_URI[md5sum] = "ce9b2d974d27408a61c53a30d3f98fb9"
 SRC_URI[sha256sum] = "bf338980b1670bca287f9994b7441c2361907635879169c64ae78364efc5f491"
@@ -31,7 +32,7 @@ inherit kernel-arch
 
 # we have a busybox bbappend that makes /bin available to the
 # sysroot, and hence gets us the target binary that we need
-DEPENDS = "busybox go-build"
+DEPENDS = "busybox-initrd go-build"
 
 # for the kernel build phase
 DEPENDS += "openssl-native coreutils-native util-linux-native xz-native bc-native"
@@ -77,9 +78,8 @@ do_compile() {
 
     # construct the initrd
     echo "[INFO]: runx: constructing the initrd"
-
     cp ${STAGING_DIR_HOST}/bin/busybox.nosuid ${WORKDIR}/busybox
-    export QEMU_USER=`which qemu-${HOST_ARCH}`
+    export QEMU_USER="`which qemu-${HOST_ARCH}` -L ${STAGING_BASELIBDIR}/.."
     export BUSYBOX="${WORKDIR}/busybox"
     export CROSS_COMPILE="t"
     ${S}/initrd/make-initrd
-- 
2.19.1

