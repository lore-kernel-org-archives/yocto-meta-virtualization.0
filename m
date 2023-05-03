Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FFCC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 06:39:08 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.12766.1683095944164525152
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 23:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QfMolM+g;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50bcb00a4c2so3926533a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 23:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683095942; x=1685687942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXbdtMvvpcg69IcwW3buZhpw2NGWD5a4gMcD7dv+lFo=;
        b=QfMolM+gmCJa8WilHd6yNiGZIU/LIKAb5XCxvzSa1SnsONd0vnSbD0FxnLPFwrxqsT
         fxGNQ9kqSrNXqX6axCo7rGrbap3jFdX7NPI32K8+WpXWAFTdYk/69qif/343Osy4IMvU
         +l6SJ4xB2jYUUMr+AAUn+nsGuvYbXqFZ29UAVPZcjH7lSvV2R7XKZdrOR7Ds0+I0sbIf
         liJeivFhj9vc1ZmoffBiJFGmwvae090+ERQT26CIUqcLhc9iXfIskn8IXZsSjPGjQhqU
         K0p/zKysjwYj6RrrKFmhsP9OJ5uamvVok1ySGVLGQPRAGmtEcwYm/j8WAIh0BKl+R4mW
         9NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683095942; x=1685687942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXbdtMvvpcg69IcwW3buZhpw2NGWD5a4gMcD7dv+lFo=;
        b=bZHudbMmFbQ17TaG1WVNFOrBLg4NXbjx0WGmqnZ37U2RlUA4LaUO230VAVH+aGQLXB
         vK9BQq59pI7N6qNhUatzgGusfiDIJLE0mEkIMdrlFkCy/dKEy5xbB28tO8gFx02uzmNG
         Qf3d9rV3XJzJAwJntmrtHnQlVNl/g4lkUf91U/FFZ8kJ0mcTy9ZK3h7OViw99GQE/o/n
         CGrUuG5WBC/xTwOfxOJW87X95p/lkRzFi2lShWwqLvSCVN2GCpEZx8/fV2w75myzsqmz
         IBVCuXjXKVKxzXPBBiFFvB8oaWZhUJcTnwcyfiXx7Px8BNpFdYqyIkfFmz4/tjoUOMir
         pbzQ==
X-Gm-Message-State: AC+VfDwkR9NG/bNbtttImKomxFbT2hGfDb+aShPSpwytTskU7KhgOVgK
	JfTMfUiCXfd7gXYSymNgAzHPPQ7r2cw=
X-Google-Smtp-Source: ACHHUZ5rKAZp/qH5rvmD2GrDBx9U3VgmVuiSRA9ZAzwUWk4CuOUb/JnPu+6sqP+cKkGoH/HaKayWjw==
X-Received: by 2002:a17:907:2ce2:b0:953:7e12:838a with SMTP id hz2-20020a1709072ce200b009537e12838amr2202253ejc.67.1683095942297;
        Tue, 02 May 2023 23:39:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d15-20020a170906040f00b0092b8c1f41ebsm16628306eja.24.2023.05.02.23.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 23:39:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] lxcfs: fix build with newer linux-libc-headers
Date: Wed,  3 May 2023 08:38:56 +0200
Message-Id: <20230503063857.731912-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 03 May 2023 06:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8039

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-build-with-newer-linux-libc-headers.patch | 50 +++++++++++++++++++
 recipes-containers/lxcfs/lxcfs_4.0.7.bb       |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 recipes-containers/lxcfs/lxcfs/0001-bindings-fix-build-with-newer-linux-libc-headers.patch

diff --git a/recipes-containers/lxcfs/lxcfs/0001-bindings-fix-build-with-newer-linux-libc-headers.patch b/recipes-containers/lxcfs/lxcfs/0001-bindings-fix-build-with-newer-linux-libc-headers.patch
new file mode 100644
index 0000000..64d19f4
--- /dev/null
+++ b/recipes-containers/lxcfs/lxcfs/0001-bindings-fix-build-with-newer-linux-libc-headers.patch
@@ -0,0 +1,50 @@
+From ca3c3484b078304998b3f2a2d6cd6c00540deb2c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 28 Apr 2023 19:16:11 +0000
+Subject: [PATCH] bindings: fix build with newer linux-libc-headers
+
+Fixes:
+
+../../lxcfs-4.0.7/src/bindings.c: In function 'initpid_still_valid_pidfd':
+../../lxcfs-4.0.7/src/bindings.c:160:15: error: implicit declaration of function 'pidfd_send_signal'; did you mean 'SYS_pidfd_send_signal'? [-Werr
+or=implicit-function-declaration]
+  160 |         ret = pidfd_send_signal(entry->init_pidfd, 0, NULL, 0);
+      |               ^~~~~~~~~~~~~~~~~
+      |               SYS_pidfd_send_signal
+../../lxcfs-4.0.7/src/bindings.c:160:15: warning: nested extern declaration of 'pidfd_send_signal' [-Wnested-externs]
+../../lxcfs-4.0.7/src/bindings.c: In function 'save_initpid':
+../../lxcfs-4.0.7/src/bindings.c:296:25: error: implicit declaration of function 'pidfd_open' [-Werror=implicit-function-declaration]
+  296 |                 pidfd = pidfd_open(pid, 0);
+      |                         ^~~~~~~~~~
+../../lxcfs-4.0.7/src/bindings.c:296:25: warning: nested extern declaration of 'pidfd_open' [-Wnested-externs]
+../../lxcfs-4.0.7/src/bindings.c: At top level:
+../../lxcfs-4.0.7/src/bindings.c:612:12: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+  612 | static int pivot_enter()
+      |            ^~~~~~~~~~~
+../../lxcfs-4.0.7/src/bindings.c: In function 'pivot_enter':
+../../lxcfs-4.0.7/src/bindings.c:612:12: warning: old-style function definition [-Wold-style-definition]
+../../lxcfs-4.0.7/src/bindings.c: At top level:
+../../lxcfs-4.0.7/src/bindings.c:655:12: warning: function declaration isn't a prototype [-Wstrict-prototypes]
+  655 | static int chroot_enter()
+      |            ^~~~~~~~~~~~
+../../lxcfs-4.0.7/src/bindings.c: In function 'chroot_enter':
+../../lxcfs-4.0.7/src/bindings.c:655:12: warning: old-style function definition [-Wold-style-definition]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Pending
+---
+ src/bindings.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/bindings.c b/src/bindings.c
+index 6f2444c..3e0d60a 100644
+--- a/src/bindings.c
++++ b/src/bindings.c
+@@ -39,6 +39,7 @@
+ #include <sys/mman.h>
+ #include <sys/mount.h>
+ #include <sys/param.h>
++#include <sys/pidfd.h>
+ #include <sys/socket.h>
+ #include <sys/syscall.h>
+ #include <sys/sysinfo.h>
diff --git a/recipes-containers/lxcfs/lxcfs_4.0.7.bb b/recipes-containers/lxcfs/lxcfs_4.0.7.bb
index be2c363..364f920 100644
--- a/recipes-containers/lxcfs/lxcfs_4.0.7.bb
+++ b/recipes-containers/lxcfs/lxcfs_4.0.7.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     https://linuxcontainers.org/downloads/lxcfs/lxcfs-${PV}.tar.gz \
     file://systemd-allow-for-distinct-build-directory.patch \
     file://systemd-ensure-var-lib-lxcfs-exists.patch \
+    file://0001-bindings-fix-build-with-newer-linux-libc-headers.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=29ae50a788f33f663405488bc61eecb1"
-- 
2.40.1


