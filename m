Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5824.1631702822951737872
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 03:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=etH6/z2q;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id f21so1377099plb.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Sep 2021 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=YT3dXRh6obcFtxySX0VHgSaW+SuE48hCTd77TrzQlSE=;
        b=etH6/z2qQT5BV2gRrscrMPODZp7wDmsOwGtQJJwHhOrtqHEHccpYSZMIx77Orxb79X
         +Zng+ARS1NQBcf+yJd+NLmXmb4gR6GpSL7Vri5gJ6XQ2STZNptbhKfPFQ2BN6bppeDGM
         bbStOa0QpD1bmSDpyrdPUUN2SZUQab6xRsAQ8NETlDaTlaHUj2WZelh8ahOSZWp7OAp4
         7VZzItnavMzrjRfKMa18M9ww0yzmHFBSSfkmpolOTzJPDruIx5kdjCp6y6YTKNB1SfJ9
         zYjypnwdIihexw2lDPZhNMsRr7JWk9XdyNM44y0BDfBcHA60mPF1bffswi+twq1mVUVG
         eHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YT3dXRh6obcFtxySX0VHgSaW+SuE48hCTd77TrzQlSE=;
        b=uI7yDLcYMCVjC0nbALrn/X6fj8HUgELRtFuQgjCcU27kbDL3UuebBh0HozQuCsSbww
         hIwgHp+N53tcFWzjMqyJrdahNdh9b4jO1vQGoMwIS3V5kekPEy0My1tdKrYQbV/0evTn
         fEhNCuRT/rGaSxnb/PDQu1GYqXot8INV9pzlUpWtl30zUvTohDaQwIe4F4QvUuwKnrLz
         Vy3LooCOaPr/KryCLIqB5B6yFyofWEbUvrvkXBi+kZYnPHiu9HSbhACcZ4Qm7QLqmTXN
         Li3mee9pCoRbdjyUGSfvErD05rkM+h1rAmHhi/GbsrNgHVUbTGPuwJHwvhG4RNtSL6hK
         YTKg==
X-Gm-Message-State: AOAM531zMRnCabeWfnCdYQLjGwfzyWNHCCE93PRM6IW7W1VcQwynak6x
	lAcxsGwY8aH6zmrxG7at/zWQ8NGSVzE=
X-Google-Smtp-Source: ABdhPJxHo2fBRsQITi6hPbgI9y1kXyqO6JjXKAXsmqSuXNaMrm0z6QlAm4YsjcO8pdoJFr7bHMDL6w==
X-Received: by 2002:a17:90b:4a84:: with SMTP id lp4mr7854975pjb.34.1631702821978;
        Wed, 15 Sep 2021 03:47:01 -0700 (PDT)
Return-Path: <sanakazisk19@gmail.com>
Received: from localhost.localdomain ([2401:4900:197c:c240:ac8a:850a:232a:b91b])
        by smtp.gmail.com with ESMTPSA id 126sm16121312pgi.86.2021.09.15.03.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 03:47:01 -0700 (PDT)
From: "sana kazi" <sanakazisk19@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-virtualization][master][PATCH] lxc: Skip rootfs pinning for read-only filesystem
Date: Wed, 15 Sep 2021 16:16:19 +0530
Message-Id: <20210915104619.18928-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1

Added patch to skip rootfs pinning for read-only filesystem
which fixes below issue:

lxc-start[1559]: Error: oap: conf - conf.c:lxc_rootfs_init:581
- Read-only file system - Failed to pin rootfs
lxc-start[1744]: Error: node1: conf - conf.c:lxc_rootfs_init:581
- Read-only file system - Failed to pin rootfs
lxc-start[1745]: Error: ivi: conf - conf.c:lxc_rootfs_init:581
- Read-only file system - Failed to pin rootfs

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...tfs_pinning_for_read_only_filesystem.patch | 30 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.9.bb           |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 recipes-containers/lxc/files/skip_rootfs_pinning_for_read_only_filesystem.patch

diff --git a/recipes-containers/lxc/files/skip_rootfs_pinning_for_read_only_filesystem.patch b/recipes-containers/lxc/files/skip_rootfs_pinning_for_read_only_filesystem.patch
new file mode 100644
index 0000000..c29d996
--- /dev/null
+++ b/recipes-containers/lxc/files/skip_rootfs_pinning_for_read_only_filesystem.patch
@@ -0,0 +1,30 @@
+From e859a5ee2cdee5111185a6a629f891aa40b2ffd6 Mon Sep 17 00:00:00 2001
+From: Wei Mingzhi <weimingzhi@baidu.com>
+Date: Tue, 18 May 2021 20:37:52 +0800
+Subject: [PATCH] Skip rootfs pinning for read-only file system.
+
+Signed-off-by: Wei Mingzhi <weimingzhi@baidu.com>
+---
+ src/lxc/conf.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://github.com/lxc/lxc/commit/966dad2494dda4948f1508bcd0e444f1d65b2df8.patch]
+Comment: No change in any hunk
+
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c
+index 7a248c2685..4b427c08d2 100644
+--- a/src/lxc/conf.c
++++ b/src/lxc/conf.c
+@@ -573,8 +573,12 @@ int lxc_rootfs_init(struct lxc_conf *conf, bool userns)
+ 			 PROTECT_OPEN | O_CREAT,
+ 			 PROTECT_LOOKUP_BENEATH,
+ 			 S_IWUSR | S_IRUSR);
+-	if (fd_pin < 0)
++	if (fd_pin < 0) {
++		if (errno == EROFS) {
++			return log_trace_errno(0, EROFS, "Not pinning on read-only filesystem");
++		}
+ 		return syserror("Failed to pin rootfs");
++	}
+ 
+ 	TRACE("Pinned rootfs %d(.lxc_keep)", fd_pin);
diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
index 6720733..ad2416f 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
 	file://dnsmasq.conf \
 	file://lxc-net \
         file://enable_seccomp_profile_when_compiled_libseccomp.patch \
+        file://skip_rootfs_pinning_for_read_only_filesystem.patch \
 	"
 
 SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
-- 
2.17.1

