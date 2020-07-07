Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.8398.1594088367981386472
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2020 19:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ja9weIwS;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D05A1E01E16; Mon,  6 Jul 2020 19:19:27 -0700 (PDT)
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
	*      [209.85.222.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71DA1E01E14
	for <meta-virtualization@yoctoproject.org>; Mon,  6 Jul 2020 19:19:26 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id 145so34366777qke.9
        for <meta-virtualization@yoctoproject.org>; Mon, 06 Jul 2020 19:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6qc1pIiI+aU+obmln3ZuQS9XjsT2Ti2IXszD5a7utMI=;
        b=Ja9weIwScnsoLahCagEMFcVK3x4fT0VOmAwJToRxIIpgGP+dSeNRftZDSspO5GYwFN
         hHfY4bctS3O7eMu+zorctJn6ibMXtgeaDTlUX2/PaOcINV20WJEoVXs6R0g2sXsw7BlW
         EicHoegqWUrvrpqeyksyjuLVVaty0LGMui3drmT4d3r8rKoEupD9OITPHEK5SGnOE71h
         HkxGMITJnLryakJH1VpK8cdV9OdO2AJYQSUhMY8I54MBorWjdvvBR4Gti+joScje3wGB
         J05AkYGkjSI6t3j1r1e4fjtRbCIc/fCFB2RX/rIjDzh3vm2iNUQ8L7BN7Mqp/GaVwb/V
         XVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6qc1pIiI+aU+obmln3ZuQS9XjsT2Ti2IXszD5a7utMI=;
        b=ABlASLHv62xAcccHlM0VpMDRFBbTpszUdbRTfG504qEBWWxPXVakhlinRossvUyuV7
         1aWdoRPkRZiEkKdR/MidAWkO895h053wzsv6EROuZ7Wrua65b/DSX5/9IKi4InwWfcwj
         HtrAOsg5kSvIq9kkYV1dA+TZfngig2friPzeddFBVV3GRyEPQr9EiqUDGp+uPb8VimUo
         2nLTrX/Ks9mAFPJZz4mBj5SYiKv/Zwiw6NR+LSeehxlKHlbO2PE/WtoGHbekKP8Zruab
         kgFr9XGRde/JUltzSkb64P2Kdn0IrHx1NacW99eYyWl3drylamm/piuvPCnW7HJpPRec
         j6Zw==
X-Gm-Message-State: AOAM532GrUnmXBVT5IPBbJJp4bxFxGPqIKJxQbFAJ6GuzsihNxL0vGIF
	t51UC/zLS/hnNA6+8von4pkGQAVm
X-Google-Smtp-Source: ABdhPJwn+x8XfWBdbYAK7wyt8QYnsJ5Ag48p/Z/KZbwntf6pcl707V+98Dtf1g/uP+hJqf4iEqjn5A==
X-Received: by 2002:a05:620a:2409:: with SMTP id d9mr51870885qkn.36.1594088365597;
        Mon, 06 Jul 2020 19:19:25 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-195.mycingular.net. [166.176.184.195])
        by smtp.gmail.com with ESMTPSA id z1sm14042921qkl.74.2020.07.06.19.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 19:19:25 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 1/2] xen-tools: apply kdd tool patch
Date: Mon,  6 Jul 2020 19:18:49 -0700
Message-Id: <20200707021850.9841-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200707021850.9841-1-christopher.w.clark@gmail.com>
References: <20200707021850.9841-1-christopher.w.clark@gmail.com>

Apply an upstream Xen Release-acked patch to fix kdd debugger
and remove the temporary inhibit of Werror on building that tool.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 ...xen-build-temporarily-inhibit-Werror.patch | 12 ------
 .../files/xen-tools-kdd-fix-build-again.patch | 39 +++++++++++++++++++
 recipes-extended/xen/xen-tools_git.bb         |  1 +
 3 files changed, 40 insertions(+), 12 deletions(-)
 create mode 100644 recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch

diff --git a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch b/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
index 6e43a4f..ba97c4b 100644
--- a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
+++ b/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-Werror.patch
@@ -40,15 +40,3 @@ index a151b3f625..a05ceec1e5 100644
 -- 
 2.19.1
 
-diff --git a/tools/debugger/kdd/Makefile b/tools/debugger/kdd/Makefile
-index 26116949d4..a72ad3b1e0 100644
---- a/tools/debugger/kdd/Makefile
-+++ b/tools/debugger/kdd/Makefile
-@@ -1,7 +1,6 @@
- XEN_ROOT = $(CURDIR)/../../..
- include $(XEN_ROOT)/tools/Rules.mk
- 
--CFLAGS  += -Werror
- CFLAGS  += $(CFLAGS_libxenctrl)
- CFLAGS  += -DXC_WANT_COMPAT_MAP_FOREIGN_API
- LDLIBS  += $(LDLIBS_libxenctrl)
diff --git a/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch b/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
new file mode 100644
index 0000000..6122999
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
@@ -0,0 +1,39 @@
+From d44cbbe0f3243afcc56e47dcfa97bbfe23e46fbb Mon Sep 17 00:00:00 2001
+From: Wei Liu <wl@xen.org>
+Date: Fri, 3 Jul 2020 20:10:01 +0000
+Subject: [PATCH] kdd: fix build again
+
+Restore Tim's patch. The one that was committed was recreated by me
+because git didn't accept my saved copy. I made some mistakes while
+recreating that patch and here we are.
+
+Fixes: 3471cafbdda3 ("kdd: stop using [0] arrays to access packet contents")
+Reported-by: Michael Young <m.a.young@durham.ac.uk>
+Signed-off-by: Wei Liu <wl@xen.org>
+Reviewed-by: Tim Deegan <tim@xen.org>
+Release-acked-by: Paul Durrant <paul@xen.org>
+---
+ tools/debugger/kdd/kdd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
+index 866532f0c7..a7d0976ea4 100644
+--- a/tools/debugger/kdd/kdd.c
++++ b/tools/debugger/kdd/kdd.c
+@@ -79,11 +79,11 @@ typedef struct {
+ /* State of the debugger stub */
+ typedef struct {
+     union {
+-        uint8_t txb[sizeof (kdd_hdr)];           /* Marshalling area for tx */
++        uint8_t txb[sizeof (kdd_pkt)];           /* Marshalling area for tx */
+         kdd_pkt txp;                 /* Also readable as a packet structure */
+     };
+     union {
+-        uint8_t rxb[sizeof (kdd_hdr)];           /* Marshalling area for rx */
++        uint8_t rxb[sizeof (kdd_pkt)];           /* Marshalling area for rx */
+         kdd_pkt rxp;                 /* Also readable as a packet structure */
+     };
+     unsigned int cur;       /* Offset into rx where we'll put the next byte */
+-- 
+2.17.1
+
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 5f41915..679feb1 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
     file://0001-xen-build-temporarily-inhibit-Werror.patch \
     file://xen-tools-kdd-stop-using-0-arrays-to-access-packet-contents.patch \
+    file://xen-tools-kdd-fix-build-again.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=4295d895d4b5ce9d070263d52f030e49"
-- 
2.17.1

