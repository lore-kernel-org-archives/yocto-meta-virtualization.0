Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B555FF8867
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 01:13:43 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2361.1777338816797342739
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 18:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X2duU0SR;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3614826eca4so9535059a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Apr 2026 18:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777338816; x=1777943616; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+GSgX06U9/YRsOABf/skCn8mrlfn+jWsxWWZedDhbf0=;
        b=X2duU0SR8mk3K+DbUxe0LrOIRrtUQ/RROD6seHCcdqtk1VNoWJTF0nUQW36ZcOLHem
         OXWXD/erZubDurFh7sWnzJEHvD/bPecPX7w4B1XOIrqQ6rYKFXFjMv6J3+Lbw6WpMYmp
         776FEuG87IzZYyA69rH1QyGyJEEPYrtV8fCYSFjqwWaAFMOly9sHnJuDg6dhmmXGDpIC
         E4Gyua28CGEXRWjkEbYnWZ/ipgUofiZLdGue6EMflE62swKhp+PXOc9mVE/Lj12a2sB3
         ys8+J5sVxwJRdS7ofXx3tMqyKaowSyFBCfiit6N4ydy+nqBvMDoluTbHC2miAkMNsk05
         OfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777338816; x=1777943616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+GSgX06U9/YRsOABf/skCn8mrlfn+jWsxWWZedDhbf0=;
        b=Q6XXdHFgj7WX8JYNtPKCuTmB8jeowuGPCg7+XDk1tr2nC+aU9lxoL3TeLk+Pj8AjAp
         QKvBSlhCuu/n+nKaa5E9HNHeWbCRWdgs88p6nULsWzzXJYHaoqFiafMPOQOVtXKmd7Ux
         4rwncVdeCHja6Tz9cZgzXCRJGFO3fdqJsVJyXvSck48aalr6eFI9qj//fbiV3bgevRIe
         p/Tdq96pYvtQRGkZ1RzyhJVkhSvrzzne8rECUJ/PgM7fP28ba6qZjQrhYZLo7d9uOS4/
         bFfBLW1yHevTjOoBUG8ngZdpW9j+xvtZzrtBrRJAbaOKAqjcCqhBX0Y/6DX019/0ZeRL
         zG5A==
X-Gm-Message-State: AOJu0Yzx91QfugKZ3iND4fjnZ66R9UD42Qvf1LeJ6ueW3M2QPor1M/PW
	43rDJP78stYjGZo9fddTw8EKQa8rmUWXOettX9p+FigxAcb+fjW9UC1J+pGpXBHz
X-Gm-Gg: AeBDiev+yoRkmbII5diLeDbXMp/rz+d2t1T7C+KZExPpMvPoV6NwOwZsFI6ijgz4Ibt
	46zCPwzv0C3G0GhSthuV9hQR5Qw48N9qucIugxY7anXzemUi7wwN/yhvtkQHTEXB8DBXi4Rcbwn
	p9jy3lKOS1feCl0Kba87Ou9tR+DrcxIIks6hN01LbTA0/BwAw/HDxNuI7QAsJBCXWWQ8yQjSTuY
	RIMfhW1FAEFocpU83m1DTseQB+5iCUYBCJURPUjJJTpL9SnJqMyY91KwlFP4vCpcT4gKtrcaLSS
	I1zl56V8s9jm2BdjLB5kzwGW5C410KNDUQ13Xe20cYeXyCinTuJBy7e6ez9IWBvqlLXQHScJ6Ho
	4/TqW0AoVi3+9/9mhFTuGyz1QYW3MTMOdiG3E0icY0MsvWpLgsMySiif3DZVYdDZ5nV0y5LAMx2
	UtcTQ5eY7Sih0ZIcPRPphXmWu5cYKAFTuky+cQSuwVzyZc2hcxx2tqpqDR8j0QpOS/XSTtQ2xWx
	70mJGNFFdqmjkcLH2wAjx+XULYlzJd21hEXKklVbjKC
X-Received: by 2002:a17:90b:3811:b0:35e:30bc:96e2 with SMTP id 98e67ed59e1d1-36491fd5b52mr941072a91.10.1777338815480;
        Mon, 27 Apr 2026 18:13:35 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490035847sm854772a91.7.2026.04.27.18.13.34
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Apr 2026 18:13:34 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [RFC PATCH 3/4] vcontainer-initramfs-create.inc: depend on virtual/kernel:do_deploy
Date: Mon, 27 Apr 2026 18:13:13 -0700
Message-ID: <f654e57a131e4e6ef29ba6b8159a77bd1f65f388.1777337030.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1777337030.git.tim.orling@konsulko.com>
References: <cover.1777337030.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 01:13:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9752

vcontainer-tarball fails on sstate-accelerated builds with errors
similar to:

  vdkr blob not found: .../tmp-vruntime-x86-64/deploy/images/\
  qemux86-64/vdkr/x86_64/bzImage

do_compile in vcontainer-initramfs-create.inc copies the kernel out
of the multiconfig deploy dir:

    KERNEL_FILE="${MC_DEPLOY}/${KERNEL_IMAGETYPE_INITRAMFS}"

but only declares build-time deps on the two image recipes:

    do_compile[depends]  = "${VCONTAINER_RUNTIME}-tiny-initramfs-image:do_image_complete"
    do_compile[depends] += "${VCONTAINER_RUNTIME}-rootfs-image:do_image_complete"

The existing comment argued that the kernel is "built as a dependency
of the rootfs image" so no explicit kernel dep was needed. That
conflates building with deploying: a core-image rootfs needs the
kernel via virtual/kernel:do_shared_workdir / do_packagedata, but it
does not force virtual/kernel:do_deploy. The bare bzImage / Image
symlink only lands in DEPLOY_DIR_IMAGE when something explicitly
pulls in virtual/kernel:do_deploy (typically qemuboot.bbclass or an
IMAGE_CLASSES inherit), which the vruntime-* multiconfigs do not do.

Why sstate exposes it so reliably:

  - On a clean from-source build the kernel ends up deployed
    transitively through other mechanisms and do_compile finds it by
    accident.
  - On an sstate-accelerated build, <runtime>-rootfs-image:do_image_complete
    is restored straight from cache, virtual/kernel:do_deploy is
    never invoked, MC_DEPLOY/bzImage doesn't exist, do_compile only
    emits a bbwarn, and do_deploy silently skips the kernel install
    because of its `if [ -f ${B}/kernel ]` guard. vcontainer-tarball
    is then the one that finally fatals with "vdkr blob not found".
  - Because the kernel wasn't in do_compile's signature, the
    do_deploy sstate key didn't reflect it either, so a cached
    kernel-less deploy could be reused indefinitely.

Fix: declare an explicit intra-multiconfig dep on
virtual/kernel:do_deploy. The recipe runs inside the mc (it is pulled
in as `mc::<mc>:vdkr-initramfs-create:do_deploy` from
vcontainer-tarball.bb), so a plain `depends` — not `mcdepends` — is
correct. Also promote the missing-kernel bbwarn to bbfatal so a
future regression fails loudly at the producing recipe instead of
downstream in vcontainer-tarball.

AI-Generated: Claude Cowork Opus 4.7
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../vcontainer-initramfs-create.inc           | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/recipes-containers/vcontainer/vcontainer-initramfs-create.inc b/recipes-containers/vcontainer/vcontainer-initramfs-create.inc
index 1a22c3d4..29b14e20 100644
--- a/recipes-containers/vcontainer/vcontainer-initramfs-create.inc
+++ b/recipes-containers/vcontainer/vcontainer-initramfs-create.inc
@@ -58,12 +58,18 @@ INHIBIT_DEFAULT_DEPS = "1"
 # Dependencies:
 # 1. The tiny initramfs image (produces cpio.gz)
 # 2. The multiconfig rootfs image (produces squashfs)
-# 3. The kernel from main build
-#
-# Both initramfs and rootfs images are in the same multiconfig
+# 3. The kernel's do_deploy (so ${MC_DEPLOY}/${KERNEL_IMAGETYPE_INITRAMFS}
+#    — e.g. bzImage/Image — actually exists before do_compile reads it).
+#    Being a build-time dep of the rootfs image is not enough: image
+#    recipes don't imply virtual/kernel:do_deploy, so on an sstate-
+#    accelerated build the kernel binary never lands in MC_DEPLOY and
+#    this recipe silently deploys a kernel-less blob set, which later
+#    fatals in vcontainer-tarball as "vdkr blob not found: .../bzImage".
+#    The dep is intra-multiconfig (this recipe runs inside the mc), so
+#    a plain depends — not mcdepends — is correct.
 do_compile[depends] = "${VCONTAINER_RUNTIME}-tiny-initramfs-image:do_image_complete"
 do_compile[depends] += "${VCONTAINER_RUNTIME}-rootfs-image:do_image_complete"
-# mcdepends set conditionally in anonymous python below
+do_compile[depends] += "virtual/kernel:do_deploy"
 
 S = "${UNPACKDIR}"
 B = "${WORKDIR}/build"
@@ -152,7 +158,10 @@ do_compile() {
         KERNEL_SIZE=$(stat -c%s ${B}/kernel)
         bbnote "Kernel copied: ${KERNEL_SIZE} bytes ($(expr ${KERNEL_SIZE} / 1024 / 1024)MB)"
     else
-        bbwarn "Kernel not found at ${KERNEL_FILE} — check that the vruntime multiconfig kernel is built"
+        # Fatal rather than warn: silently shipping a kernel-less blob set
+        # lets vcontainer-tarball get much further before failing with a
+        # confusing "vdkr blob not found" and produces stale sstate.
+        bbfatal "Kernel not found at ${KERNEL_FILE}. This usually means virtual/kernel:do_deploy was not pulled into the multiconfig build graph; ensure do_compile[depends] includes virtual/kernel:do_deploy."
     fi
 }
 
-- 
2.50.1 (Apple Git-155)


