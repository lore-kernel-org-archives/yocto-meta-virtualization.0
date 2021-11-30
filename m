Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.76401.1638281354537452907
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 06:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cnYUHuZq;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id a18so44777244wrn.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Nov 2021 06:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3lsv6MxAdeK+DuuwQs4I04pmyWAY0TCB41rfNB+/sro=;
        b=cnYUHuZq8HgiuTJSTmGeiOZC2xdN1ytONKaBfilpSu7PE5w5iNh7jrJUdsrDvJMJin
         6OIBrY5km8UN9TxjmICG89fjhViXPpIQBQxZSzdxoTz9f/XnLUVOggzoxcFUQlJGJFog
         gJyiTbsC4WU20/ALStxWWFmj7DxqkwdiKKgL8FhRcUmnRik5Nz8RVjuEOSa7L4XWFdyJ
         QkPvJW3w87nhCjykfeOV73+1l4zPNbQbJu5p1h7xUCw8IIIOsqXyjcyXP/znL5vrPZ4s
         +ccoC8on4iVrS7zackMKF2k6AMFxPQ25zWryr6x+AUNMy8Utx9eNkCQNcSPLcRUqACFb
         uOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3lsv6MxAdeK+DuuwQs4I04pmyWAY0TCB41rfNB+/sro=;
        b=n/+t+boRhqkFLIWiIQgQT7cAZxtbWmaq1L0unADvbUwfWytoNk0wRA3FOjua2u2NGq
         hBwkqNbWt6+iqXcblIos2F9UR/XEdjlnZxLsvqvUIhMixK47GIFyDun6E22Jur2JFPwp
         AS8vuKOmVVJzfu9snJqQFKmiQojRzHQpieM8VFtozEzIr6JrraGHLiDnQIfzyvho0kUh
         f9QXP4ff5GYTd9brrq6Bd5aLtanU2wlWTlMJis9TKSq+vROOLopUD+//Zv/SjvBClDX6
         Y7VB2/1rH7en8JoDmPUlKA5sAoBtk8Nvx8HdZt93P04kfcUuX0UeUe9XyeLQFBuKrhK7
         IoZA==
X-Gm-Message-State: AOAM532ewtOnPhqVZfIrpfafdi2pyRE1FZJOvPQswLpJYedxgyide9kg
	bhyp2CkOckuW+h1HJ70TmwcjXdiTG1g=
X-Google-Smtp-Source: ABdhPJxxBNRbLZC9kq6TOciVeqeRknksYm5tv4rdnWThkCFEVbhO/C2hxIEcyKLZVXu/m2Yfqh518A==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr40284658wrf.410.1638281352965;
        Tue, 30 Nov 2021 06:09:12 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 10sm21601889wrb.75.2021.11.30.06.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 06:09:12 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] singularity: fix build with automake-1.16.5
Date: Tue, 30 Nov 2021 15:09:08 +0100
Message-Id: <20211130140908.33560-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...nfigure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch | 34 +++++++++++++++++++
 .../singularity/singularity_git.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 recipes-containers/singularity/singularity/0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch

diff --git a/recipes-containers/singularity/singularity/0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch b/recipes-containers/singularity/singularity/0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch
new file mode 100644
index 0000000..d5744a2
--- /dev/null
+++ b/recipes-containers/singularity/singularity/0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch
@@ -0,0 +1,34 @@
+From 13ee3e016490e74868b64e3a07dcccf9feafebdf Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 30 Nov 2021 05:59:06 -0800
+Subject: [PATCH] configure.ac: drop 2nd AM_INIT_AUTOMAKE
+
+* automake-1.16.5 introduced in oe-core:
+  https://git.openembedded.org/openembedded-core/commit/?id=851167b3a41b1728407d331c1666827fb730daa1
+  doesn't like this after:
+  http://git.savannah.gnu.org/cgit/automake.git/commit/?id=f4a3a70f69e1dbccb6578f39ef47835098a04624
+
+  and do_configure fails with:
+  configure.ac:38: error: AM_INIT_AUTOMAKE expanded multiple times
+
+  There is no point in upstreaming this, because singularity-2.3.1 is very old and
+  whole autotools support is removed in version 3 (currently 3.8.5) with:
+  https://github.com/hpcng/singularity/commit/a06e3d13a822080d7a9bc55085ee1bb32026a96e
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8ffa5ab32..a5a35c43a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,7 +35,6 @@ AC_GNU_SOURCE
+ AC_PROG_INSTALL
+ AC_PROG_LIBTOOL
+ AC_PROG_CC
+-AM_INIT_AUTOMAKE
+ AM_PROG_CC_C_O
+ AC_ENABLE_SHARED
+ AC_PROG_LIBTOOL(libtool)
diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
index f729657..321a9a6 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=be78c34e483dd7d8439358b1e024b294 \
 
 SRC_URI = "git://github.com/singularityware/singularity.git;protocol=https;branch=master \
     file://0001-Use-python3.patch \
+    file://0001-configure.ac-drop-2nd-AM_INIT_AUTOMAKE.patch \
 "
 PV = "2.3.1+git${SRCPV}"
 SRCREV = "e214d4ebf0a1274b1c63b095fd55ae61c7e92947"
-- 
2.32.0

