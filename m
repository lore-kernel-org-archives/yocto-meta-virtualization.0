Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2440.1595019856589383398
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 14:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CLSy4lfr;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 402A3E01EAC; Fri, 17 Jul 2020 14:04:16 -0700 (PDT)
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
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16F10E01EA8
	for <meta-virtualization@yoctoproject.org>; Fri, 17 Jul 2020 14:04:13 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id z15so3277763qki.10
        for <meta-virtualization@yoctoproject.org>; Fri, 17 Jul 2020 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JoPGRi927qG7HGujTnfeUd5Hxc2iY4L0Vc6f9B71jKk=;
        b=CLSy4lfrNipU2oWGZbBO2AH3JujCo3LAU1HnDx2tgetUp8oAZREgygHFApx6wLAHhH
         v0ny3YS1y1mum4o9CDHOqORGqauLTMmPxlTe8eod0tDZbajGnn8jwWUF4OoTNwior/WF
         qeKcSQAJE+RTPjxdaOWIIxSPX+BtJFG3t/VU3N0v+HcxYM3FOOeE9jbVfEeXfF9HL0sT
         66WB6Tz1MPjPyAv0ntmZNrwAxqEqOpJACYPL1lVNBfYUPI1K9FVpAtOnn0wf7Bf7lGg5
         ZLPXLd2aTO1mweOJ62LTSsWYYZISMsQMGzYz1/QlW9yoUP8KIPXxD4k3l+FB5jlpkQNX
         +mRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JoPGRi927qG7HGujTnfeUd5Hxc2iY4L0Vc6f9B71jKk=;
        b=XzDwEB+HhVJjEDTGOyivmn08+DgJFLIxQf/7f2NEMZIgwiPhihjhbjataV4TCeshgf
         p3at4cNLizjkbw5+ceqCQ9OEKD/CcN+4cjXcRq8TWts82l2fmoAPb+h2qqjTLNpjQ80P
         KXwnFvellcLDIezNmvETzXifmuT8kx9ULqeBETjmV2MpyE+2Z7uHonGgWKhxLMcn3I79
         XZ4f9ftmKMRia8UV83h9vxXTQ6W/yWewhjUGM113RCLCn0FAy5jKC6HXUA3XIuLQvocC
         MY0kBY/7JtdJC9r8YQJ1kT6D2sxrXg4p3aLVk3os3e67Ju4am4e+lfeFLmEWUPZwpPmT
         mAoQ==
X-Gm-Message-State: AOAM533l94O1I6fajULAyOAyL/Alit6k3pBmXxOKMebYyq7FdetVn7Vp
	ooPtyr6VdhVJvUkREqw+DQUvjGT6
X-Google-Smtp-Source: ABdhPJyvHLGVySrj6pv/ZRVXcuav1bVOsDXjKy1LCKbTmRl60aDT3YbS4YH3UegyLtY5XNCSYdqraQ==
X-Received: by 2002:a37:46d5:: with SMTP id t204mr230045qka.479.1595019850872;
        Fri, 17 Jul 2020 14:04:10 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-137-177-108.mycingular.net. [166.137.177.108])
        by smtp.gmail.com with ESMTPSA id y45sm12819387qtk.19.2020.07.17.14.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 14:04:10 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	Christopher Clark <christopher.w.clark@gmail.com>,
	bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH 1/4] xen-tools: packaging for new files in Xen 4.14
Date: Fri, 17 Jul 2020 14:03:46 -0700
Message-Id: <20200717210349.16459-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 2feed00..99e7e0b 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -64,9 +64,12 @@ RRECOMMENDS_${PN} = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
     ${PN}-flask \
     ${PN}-hvmloader \
+    ${PN}-libxenhypfs \
     ${PN}-shim \
     ${PN}-ucode \
+    ${PN}-vchan \
     ${PN}-xenpaging \
+    ${PN}-xenhypfs \
     "
 
 RDEPENDS_${PN}-devd = " \
@@ -137,6 +140,10 @@ RDEPENDS_${PN}-xendomains = "\
     virtual/xenstored \
     "
 
+RDEPENDS_${PN}-xenhypfs = " \
+    ${PN}-libxenhypfs \
+    "
+
 RDEPENDS_${PN}-xl = "libgcc"
 
 RDEPENDS_${PN}-xenmon = " \
@@ -179,6 +186,8 @@ PACKAGES = " \
     ${PN}-libxengnttab-dev \
     ${PN}-libxenguest \
     ${PN}-libxenguest-dev \
+    ${PN}-libxenhypfs \
+    ${PN}-libxenhypfs-dev \
     ${PN}-libxenlight \
     ${PN}-libxenlight-dev \
     ${PN}-libxenstat \
@@ -204,6 +213,7 @@ PACKAGES = " \
     ${PN}-shim \
     ${PN}-staticdev \
     ${PN}-ucode \
+    ${PN}-vchan \
     ${PN}-volatiles \
     ${PN}-xcutils \
     ${PN}-xencommons \
@@ -211,6 +221,7 @@ PACKAGES = " \
     ${PN}-xend \
     ${PN}-xend-examples \
     ${PN}-xendomains \
+    ${PN}-xenhypfs \
     ${PN}-xenmon \
     ${PN}-xenpaging \
     ${PN}-xenpmd \
@@ -324,6 +335,12 @@ FILES_${PN}-libxenguest-dev = " \
     ${datadir}/pkgconfig/xenguest.pc \
     "
 
+FILES_${PN}-libxenhypfs = "${libdir}/libxenhypfs.so.*"
+FILES_${PN}-libxenhypfs-dev = " \
+    ${libdir}/libxenhypfs.so \
+    ${libdir}/pkgconfig/xenhypfs.pc \
+    "
+
 FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
 FILES_${PN}-libxenlight-dev = " \
     ${libdir}/libxenlight.so \
@@ -535,6 +552,10 @@ FILES_${PN}-ucode = "\
     ${sbindir}/xen-ucode \
     "
 
+FILES_${PN}-vchan = "\
+    ${bindir}/vchan-socket-proxy \
+    "
+
 FILES_${PN}-volatiles = "\
     ${sysconfdir}/default/volatiles/99_xen \
     ${sysconfdir}/tmpfiles.d/xen.conf \
@@ -557,6 +578,10 @@ FILES_${PN}-xend-examples = "\
     ${sysconfdir}/xen/xend-pci-quirks.sxp \
     "
 
+FILES_${PN}-xenhypfs = "\
+    ${sbindir}/xenhypfs \
+    "
+
 FILES_${PN}-xenpaging = "\
     ${libdir}/xen/bin/xenpaging \
     ${localstatedir}/lib/xen/xenpaging \
-- 
2.17.1

