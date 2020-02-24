Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.17120.1582521589872117813
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SariIVrU;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B827EE01483; Sun, 23 Feb 2020 21:19:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C62BE00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:49 -0800 (PST)
Received: by mail-pl1-f181.google.com with SMTP id a6so3563962plm.3
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=P0iV809Buftfgh8Sm7mgAQFvjpyrE6MBJaGLQk8l5Hk=;
        b=SariIVrUhDEX2ubdX6lWDX7q/WguJ7mIq+ISKkQLb8xy/BBybdzfJNwQHe/50hJTDo
         jqFecf1mzfJq1ThF/xVxprMdQaCRvZ1OyYpd9M2eq+6kcxXmLRKhVyzBddcj5ciFFQB/
         w6NwkvFdO+cu9bZunlVFxVQmnnVyyOetx2QMiklTzk6Bpz+QZMZywyZ/NR8h5HG3zOHG
         jAXsujQJ4i7D1nix7yDKbyki889GOeLPbTPZbnU6VIv0o+GkyHHSSFE5pHbcyE0RBY0C
         Fs7SA7mbzEU3E8rBor4Oemds9C/4HtYuh01d70+3b5ktJLVtiLr5DAo0ny05NQ6HwmX3
         S2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=P0iV809Buftfgh8Sm7mgAQFvjpyrE6MBJaGLQk8l5Hk=;
        b=agYJnYIXG5WiNYErym1PjpuBOU6WN83OlcSJv5mM1yO9PRYttgM37a768TLeFXYFpF
         mwTMvDikjgcuU1yaUmf6OFQ6fMkUdXAiyAO4Z0vg3v7CucIQFeTVHLO0O41LxJcS5/Qk
         I9Fwi/PvqwiJLDHl9glPFbNqvscrbbuEbLzE7qLhiaaSKDxHRzLC3ea+cAKzFToEbbKh
         5eLfvx8atl4BxTBr2nW/dPk/XVvSSTRWBgTxaGRaifHNrBoZw+3Y/pjAeyHpUjm8Avpt
         9s5GWB0i9ej8PgBrYLDcTWIBTe9KZoRGc+O+rpD/LX161ZRA0ZsUT5dIIGXxY4Born1H
         0oLw==
X-Gm-Message-State: APjAAAVwzH1uMymMMB5DJEPUqwlcl3mOM8JrzsiQXVPJThXTCmu2M6t8
	1PVQq4LyLl2wsENbQm8c3KN1OqEs
X-Google-Smtp-Source: APXvYqxTe4zDjbDVOPnyvN9R67XEuQXwoNG2GysouJVugXleGBFDldjXMadXbkgI62aXsOUPa+v2ag==
X-Received: by 2002:a17:902:7b94:: with SMTP id w20mr48429165pll.257.1582521588372;
        Sun, 23 Feb 2020 21:19:48 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:47 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 22/22] xen, xen-tools: updates to the deploy task
Date: Sun, 23 Feb 2020 21:18:52 -0800
Message-Id: <20200224051852.21933-23-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Amend addtask for deploy in both recipes: add deploy before do_build to
ensure that it completes before the build step stamp is written.
Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Add comments explaining the scheduling of the deploy task to
both the hypervisor and tools recipes.

In the hypervisor build, change deploy to obtain files from ${B} rather
than ${D}, since it allows a bbappend to modify boot binary file
destinations in do_install without breaking do_deploy. do_deploy can
then be scheduled to run after do_compile.

To ensure that a deployed hypervisor has matching tools in any image
being built, add a dependency to make sure that the tools have built and
been staged first:
    do_deploy[depends] += "xen-tools:do_populate_sysroot"

Also add a dependency to ensure that anything that the tools recipe
deploys, such as a XSM policy file, has been deployed first:
    do_deploy[depends] += "xen-tools:do_deploy"

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 24 ++++++++++++++++--------
 recipes-extended/xen/xen-tools.inc      |  6 ++++--
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 41de9b6..45d2057 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -47,20 +47,28 @@ do_install() {
 do_deploy() {
     install -d ${DEPLOYDIR}
 
-    if [ -f ${D}/boot/xen ]; then
-        install -m 0644 ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}
+    if [ -f ${B}/xen/xen.gz ]; then
+        install -m 0644 ${B}/xen/xen ${DEPLOYDIR}/xen-${MACHINE}
     fi
 
-    if [ -f ${D}/boot/xen.gz ]; then
-        install -m 0644 ${D}/boot/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
+    if [ -f ${B}/xen/xen.gz ]; then
+        install -m 0644 ${B}/xen/xen.gz ${DEPLOYDIR}/xen-${MACHINE}.gz
     fi
 
-    if [ -f ${D}/usr/lib64/efi/xen.efi ]; then
-        install -m 0644 ${D}/usr/lib64/efi/xen.efi ${DEPLOYDIR}/xen-${MACHINE}.efi
+    if [ -f ${B}/xen/xen.efi ]; then
+        install -m 0644 ${B}/xen/xen.efi ${DEPLOYDIR}/xen-${MACHINE}.efi
     fi
 }
-
-addtask deploy after do_populate_sysroot
+# Deploy copies files from ${B} that are written during do_compile so must
+# run afer that task; and add the task before do_build to ensure that deployment
+# has completed when the recipe build done stamp is written.
+addtask deploy after do_compile before do_build
+# To ensure that a deployed hypervisor has matching tools, add a dependency to
+# make sure that the tools have built and been staged:
+do_deploy[depends] += "xen-tools:do_populate_sysroot"
+# Also ensure anything that the tools recipe needs to deploy, such as a
+# XSM policy file, has been deployed first:
+do_deploy[depends] += "xen-tools:do_deploy"
 
 # Enable use of menuconfig directly from bitbake and also within the devshell
 OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 864c40c..a033f39 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -781,5 +781,7 @@ do_deploy() {
         ln -sf ${FLASK_POLICY_FILE} ${DEPLOYDIR}/xenpolicy-${MACHINE}
     fi
 }
-
-addtask deploy after do_populate_sysroot
+# Deploy copies files from ${D} that are written during do_install so must run
+# after that task; and add the task before do_build to ensure that deployment
+# has completed when the recipe build done stamp is written.
+addtask deploy after do_install before do_build
-- 
2.17.1

