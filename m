Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17121.1582521581440184377
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TRReRQ0A;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D51BE014C6; Sun, 23 Feb 2020 21:19:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAFB4E00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:40 -0800 (PST)
Received: by mail-pf1-f196.google.com with SMTP id k29so4719884pfp.13
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1A1E5Zt7hISwawqs7rRAuh3tEg0r2nKJZODU0Wjb74w=;
        b=TRReRQ0A9Vk/WoTaG7xwjjS7nUCtIUY1xU/ESR9BHOFMWbHYjaUxNmnG0dgMKC2nEm
         ic8afXN0TYm2utgqhVHP0oQQXyok0g6FBdvmRLbcPzjx1mwftEVBuA08tt7BKFoLnUIz
         FwLFe561aN2jrqoDZhYKX0ntftq9VHrOrwKbNP62BDaqXdU5atufXKBtFR2FiPNFqj3H
         b9gh4JYgipNOQDGTcsgKPp3Puqgr7jp0DMxLK62Hq0dyhPV+feoGnDHx/Gtz1CXKFIMm
         Ntk4GgDrgeW74oazuJ+lnZ90MYnrIct7h/RBSDaNw3CarpudX0flqahTx/SpLz5QIpI7
         lnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1A1E5Zt7hISwawqs7rRAuh3tEg0r2nKJZODU0Wjb74w=;
        b=qhDH0hr0qPKxwcpUOuTg9fe/faKJJLpBzW+v7T/s6UNevt1gHpd5sjPvX1ob096MoO
         BBeI/nItVeNpg2yrNJJI1/4PBNudqXNO4j7gNq9IsMC8Ylm06UFSukZwFHMeJ045cY7x
         5HsbPusL0Q4T/wh8yxZndbtwOcPR6h7r2hv6S3yZzA7d8LapgNez6KyzR20vz0i7k5nA
         prTXSSNxqmpxivmfRe3tTLULuZ8BI21qHiJwWpt3YsmQkBNMZUJGhthGnooNA2+79Y8a
         Qg6U3PYDRDfwKMdqy+YAV6GuCYJXGWhrJPSvGbJPer79+QRnD307wMIFif5SCh8aG4rV
         fTgQ==
X-Gm-Message-State: APjAAAXeN4m6UEkDV6Mo8cRD5Ot8EQKKHyU0APFeKQfK5xYq72E9i6B1
	1RJ/pKkPhKTWbzsGlE9x6ukHyq03
X-Google-Smtp-Source: APXvYqxXw1cIGCCKvAf4QGLeKW6o8N9yTROEurNwHiSoYTTDkiz8/eAiYzEb3YMDm1iTvEcTb5XnOA==
X-Received: by 2002:a63:b515:: with SMTP id y21mr4647898pge.148.1582521579976;
        Sun, 23 Feb 2020 21:19:39 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:38 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 17/22] xen, xen-tools: remove stubs task and use multilib when necessary
Date: Sun, 23 Feb 2020 21:18:47 -0800
Message-Id: <20200224051852.21933-18-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

The stubs task was MACHINE-specific due to the OE variables it accessed
which had forced unnecessary rebuild work in OpenXT's multi-MACHINE
builds.

The stubs task was generating a 32-bit header file to satisfy the Xen
tools firmware build to generate the hvmloader binary, which is only
needed on x86-64 targets where HVM-mode guests are enabled.

Remove this header file generation logic and similar in the configure
task, and in the cases where hvmloader is to be built use multilib to
provide a 32-bit sysroot and allow the build to obtain the needed 32-bit
materials from their source: glibc.

Building Xen tools for x86-64 with HVM-guest support enabled now
requires the following to be added to a build conf file
(eg. distro.conf, or local.conf) :

    require conf/multilib.conf
    MULTILIBS = "multilib:lib32"
    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 48 ++++++++++++++++++++++--------
 recipes-extended/xen/xen.inc       |  4 ---
 2 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 00843ca..864c40c 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -6,6 +6,29 @@ COMPATIBLE_HOST = 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux
 inherit setuptools3 update-rc.d systemd deploy
 require xen-blktap.inc
 
+# To build hvmloader, which is needed on x86-64 targets when 'hvm' is enabled
+# in PACKAGECONFIG, to support running HVM-mode guest VMs, some files from
+# 32-bit glibc are needed.
+# Add the multilib 32-bit glibc to DEPENDS only when necessary.
+#
+# To enable multilib, please add the following to your local.conf -:
+#
+#    require conf/multilib.conf
+#    MULTILIBS = "multilib:lib32"
+#    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+
+# Use this multilib prefix for x86 32-bit to match local.conf:
+MLPREFIX32 = "lib32-"
+
+# The DEPENDS on a multilib 32-bit glibc is only added when target is x86-64
+# and 'hvm' is enabled in PACKAGECONFIG.
+# This x86-64 override is never intended for native use, so clear that.
+GLIBC32 = ""
+GLIBC32_x86-64 = \
+    "${@bb.utils.contains('PACKAGECONFIG', 'hvm', '${MLPREFIX32}glibc', '', d)}"
+GLIBC32_class-native = ""
+DEPENDS += "${GLIBC32}"
+
 RDEPENDS_${PN} = "\
     bash perl xz \
     ${PN}-console \
@@ -656,25 +679,24 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
     "
 SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
 
+# To build hvmloader, which is needed on x86-64 targets when 'hvm' is enabled
+# in PACKAGECONFIG, additional CFLAGS are needed to set the 32-bit sysroot.
+RECIPE_SYSROOT32 = "${WORKDIR}/${MLPREFIX32}recipe-sysroot"
+ADD_SYSROOT32_CFLAGS = ""
+ADD_SYSROOT32_CFLAGS_x86-64 = \
+    "${@bb.utils.contains('PACKAGECONFIG', 'hvm', \
+        'CFLAGS += "--sysroot=${RECIPE_SYSROOT32}"', '', d)}"
+# This x86-64 override is never intended for native use, so clear that.
+ADD_SYSROOT32_CFLAGS_class-native = ""
+
 do_configure() {
     do_configure_common
-}
 
-do_stubs() {
-    # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
-    if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
-        if test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h ; then
-            test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gnu
-            cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h | grep -v stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg > ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_cosl >> ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_sinl >> ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/stubs-32.h
-        fi
+    if [ -n '${ADD_SYSROOT32_CFLAGS}' ] ; then
+        echo '${ADD_SYSROOT32_CFLAGS}' >>"${S}/tools/firmware/Rules.mk"
     fi
 }
 
-addtask stubs after do_configure before do_compile
-
 do_compile() {
     cd ${S}
     oe_runmake tools PYTHON="${PYTHON}"
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 1ac131e..32e836a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -223,10 +223,6 @@ do_configure_common() {
     oe_runconf EXTRA_CFLAGS_XEN_CORE="${EXTRA_CFLAGS_XEN_CORE}" \
                EXTRA_CFLAGS_XEN_TOOLS="${EXTRA_CFLAGS_XEN_TOOLS}" \
                PYTHON="${PYTHON}"
-
-    if [ ! -e ${STAGING_INCDIR}/bits/long-double-32.h ]; then
-        cp ${STAGING_INCDIR}/bits/long-double-64.h ${STAGING_INCDIR}/bits/long-double-32.h
-    fi
 }
 
 do_compile_prepend() {
-- 
2.17.1

