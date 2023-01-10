Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B94C54EBE
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 15:15:36 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.106453.1673363726315185665
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 07:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aaJaIiW/;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso5902548wms.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 07:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYO6W6xD9qPZqrJnM4ZyWzHf1ZTIHpXfQk+y97BOrkU=;
        b=aaJaIiW/7Z8T2zvbPbPL2PwSMZFc4x0Vh5ombs4JtcsdEntPyftXH6G0Rs9lIZGw+v
         Ep5NldL+QuEl8WToVG5KbpSOWBL7QLUCTd+cWfCAMQzCAHoYcJJbp5gPmea4kwPOCV0P
         fKwiHF8XbX0eEhQl7qQjojtkXqhcSzxvt4tEAncg1k5fS7ypharE6zY/BOtwTZV6qpyD
         f8UfNU56K2eDazzcUCHKbwNTpAXxOFNg/6W0hMjN0oSVuYnfkSExJkuy5wy7w4N9KnqZ
         dhmfFWQhHPY0iR6CNhVSFZ9D3ZB1BkHZhJPxOlWEDKKIReJw9Fq9jXJSLAOLAXbdiWGG
         UlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYO6W6xD9qPZqrJnM4ZyWzHf1ZTIHpXfQk+y97BOrkU=;
        b=Et4Ek+38038adsrYIYsyG629H2GaVhXJgC/X7WU1168bp5aUmo5rrSZGocjyxwmu1F
         B4G+z74h2QqASQE+Wz2XLKm3D9l9VFzX1neLEZfKDxRknHrCOOCvFrangN2m1FUvQ5Sy
         iTZKAdVFhKtGUMlifzJ8GtZqC/FsrvRUmBMfRwV4i3nfrvRo9UHp3NdPXAS1AVdrswH6
         d4sC1lpvg72YuIFXlQT0sU5ZFVCGmrkgwhASGNi/rmqUhFFxKBSRBWov+lWCx4JSRt0v
         XGNhpjDR2xEyuDRd1x0Vv4FT7vXa5aBF25D0iEndUhwt+JE4fTP542v1NUY2HLry69Za
         DEZw==
X-Gm-Message-State: AFqh2kpRd38MGP4KKDgT7YZw524WSJ6B4Bs3wArNCYhpTQ/PrZuL0wDz
	7XrUdD5Ic7+iPMmMnRM4Iwvla0kNnI3tjQ==
X-Google-Smtp-Source: AMrXdXsIT9b4+gVIKs3ujd/ULk/Jftp9GV4MGJbmvkONTcVYXp5zaeTYzutH07TTS9y2cK7BE+ey+Q==
X-Received: by 2002:a05:600c:3596:b0:3d2:3b8d:21e5 with SMTP id p22-20020a05600c359600b003d23b8d21e5mr48705521wmq.14.1673363724555;
        Tue, 10 Jan 2023 07:15:24 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b003b4cba4ef71sm22956178wmb.41.2023.01.10.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 07:15:23 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH] skope: fix build with btrfs-progs 6.1
Date: Tue, 10 Jan 2023 15:14:32 +0000
Message-Id: <20230110151432.3434073-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 15:15:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7809

| # github.com/containers/storage/drivers/btrfs
| vendor/github.com/containers/storage/drivers/btrfs/btrfs.go:387:11: args.lim.max_referenced undefined (type _Ctype_struct_btrfs_qgroup_limit has no field or method max_referenced)
| recipe skopeo-v1.8.0+gitAUTOINC+b95e081162-r0: task do_compile: Failed

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...ound_field_rename_in_btrfs-progs_6_1.patch | 38 +++++++++++++++++++
 recipes-containers/skopeo/skopeo_git.bb       |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch

diff --git a/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch b/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch
new file mode 100644
index 0000000..cd3c70f
--- /dev/null
+++ b/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch
@@ -0,0 +1,38 @@
+From 246ba3062e8b551026aef2708eee747014ce5c52 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Wed, 28 Dec 2022 18:26:39 -0500
+Subject: [PATCH] fix: workaround field rename in btrfs-progs 6.1
+
+same as kdave/btrfs-progs@0345143
+
+Signed-off-by: Rui Chen <rui@chenrui.dev>
+
+Upstream-Status: Backport [https://github.com/containers/storage/commit/246ba3062e8b551026aef2708eee747014ce5c52]
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ drivers/btrfs/btrfs.go | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/btrfs/btrfs.go b/drivers/btrfs/btrfs.go
+index e8b16b858e..3d9053297b 100644
+--- a/drivers/btrfs/btrfs.go
++++ b/drivers/btrfs/btrfs.go
+@@ -6,6 +6,9 @@ package btrfs
+ /*
+ #include <stdlib.h>
+ #include <dirent.h>
++
++// keep struct field name compatible with btrfs-progs < 6.1.
++#define max_referenced max_rfer
+ #include <btrfs/ioctl.h>
+ #include <btrfs/ctree.h>
+ 
+@@ -382,7 +385,7 @@ func subvolLimitQgroup(path string, size uint64) error {
+ 	defer closeDir(dir)
+ 
+ 	var args C.struct_btrfs_ioctl_qgroup_limit_args
+-	args.lim.max_referenced = C.__u64(size)
++	args.lim.max_rfer = C.__u64(size)
+ 	args.lim.flags = C.BTRFS_QGROUP_LIMIT_MAX_RFER
+ 	_, _, errno := unix.Syscall(unix.SYS_IOCTL, getDirFd(dir), C.BTRFS_IOC_QGROUP_LIMIT,
+ 		uintptr(unsafe.Pointer(&args)))
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index a2fff2c..3eaddfd 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://storage.conf \
     file://registries.conf \
     file://0001-makefile-add-GOBUILDFLAGS-to-go-build-call.patch \
+    file://0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch;patchdir=src/import/vendor/github.com/containers/storage \
 "
 
 SRCREV = "b95e081162382f9a28f400bee10046ce72b957fe"
-- 
2.34.1


