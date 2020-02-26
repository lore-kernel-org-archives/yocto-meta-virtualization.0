Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.186.1582676225251966938
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H2uJRHKh;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20EA9E016E9; Tue, 25 Feb 2020 16:17:05 -0800 (PST)
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
	*      [209.85.215.177 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 647B1E016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:17:04 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id b1so165896pgm.8
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EyaDDu8NZt+I0sVUlyFUQTd4Z8aTJsbDIK9tkmPri2o=;
        b=H2uJRHKhdUIZcCycXpVODsbihoAm2iJRbFyZ9iDtiqFcktfgv8iBOOzC3eIfkBg4i1
         ed+tPrw0v1CHe3Kps6eH2YCPf98B3rvBJIVhHNZrIFACuNRknQZy9dKI3UCll3w1dqsx
         J0guLQ7IMbdqZqaFfcQXxiSDWQhPgdfkoJEO62NdV9yWgx/qmFewTtBy09EYD+d8P5/E
         0xSxSxw1gmxsXADmkypcZH/f+dC/a6NIQRtQ7EGf6NDsSn+tRZ3Uk25pXGHyI6gkSIuO
         ZM5rPebYiTQ3bpmjQOschvcNbDzVkqd45YBCCgaEQaB7+zyMcGxkD56+z35l3vHTuL7i
         aRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EyaDDu8NZt+I0sVUlyFUQTd4Z8aTJsbDIK9tkmPri2o=;
        b=qaakOf8w0obNJahdJOfzdfQQkpTXUMc3j7jIjyK6Z6jD6V10Mj6cGF2UsPIxxXD3ER
         x4q6Opxc8V7JwTDQa/UdM30YanlgyZm8OkOoPpVG2LafcZ75tgRlX/eJazRcyC+lzrdA
         En364RfksQqwuFDrrdZi1nAAIJTPfhQC85ejezpBCFW5f6gEUxI+NP+bazVaOwznwPTF
         Ck0pW+ZS/vPc8fKKyvKba0ypbbnT1Vzfaf0GihLFRL8kTAzO/dWqUFfORKsylsRe1D4h
         Kp4MeZ8ssYIxmnacD/vlygGqqw+2DDwS55rU6FEhDQdnb6V/8R1WiaIRLbQnzwXHz3oY
         VMKg==
X-Gm-Message-State: APjAAAVcmdSxEIR843OdeDQG9hncxu/IAAgzkh5SAve2FQtQAfCRQN30
	tYwrrh7MfdRY4FO9wYeNos4/4Rn2
X-Google-Smtp-Source: APXvYqxo7L8IP9XxPAiLyjvbaLqC56uMLQ50c0mRGNlYCyoYJUa6retRLeDhgMY6Up3Idv5pUz6mlw==
X-Received: by 2002:a65:45ca:: with SMTP id m10mr916170pgr.401.1582676223474;
        Tue, 25 Feb 2020 16:17:03 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:17:02 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 22/22] xen, xen-tools: updates to the deploy task
Date: Tue, 25 Feb 2020 16:16:06 -0800
Message-Id: <20200226001606.14750-23-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Amend addtask for deploy in both recipes: add deploy before do_build to
ensure that it completes before the build step stamp is written.
Suggested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Add comments explaining the scheduling of the deploy task to
both the hypervisor and tools recipes.

In the hypervisor build, change deploy to obtain files from ${B} rather
than ${D}, since it allows a bbappend to modify boot binary file
destinations in do_install without breaking do_deploy.

To ensure that a deployed hypervisor has matching tools in any image
being built, add a dependency to make sure that the tools have built and
been staged first:
    do_deploy[depends] += "xen-tools:do_populate_sysroot"

Also add a dependency to ensure that anything that the tools recipe
deploys, such as a XSM policy file, has been deployed first:
    do_deploy[depends] += "xen-tools:do_deploy"

Schedule deploy tasks after populate_sysroot to ensure that deployed
binaries match those staged for inclusion in the image rootfs.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 30 ++++++++++++++++++-------
 recipes-extended/xen/xen-tools.inc      | 11 +++++++--
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 41de9b6..21d9c7f 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -47,20 +47,34 @@ do_install() {
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
+# Scheduling the do_deploy task:
+# - deploy copies files from ${B} that are written during do_compile so must
+#   at least run afer that task has completed
+# - the hypervisor binaries may be included in the image filesystem, so we
+#   must ensure that the binaries deployed match what is staged in the sysroot:
+#   so do deploy must run after do_populate_sysroot -- which is always after
+#   do_compile, so that handles 'after do_compile' too
+# - add the task before do_build to ensure that deployment has completed when
+#   the recipe build done stamp is written
+addtask deploy after do_populate_sysroot before do_build
+# To ensure that a deployed hypervisor has matching tools, add a dependency to
+# make sure that the tools have built and been staged:
+do_deploy[depends] += "xen-tools:do_populate_sysroot"
+# Also ensure anything that the tools recipe needs to deploy, such as a
+# XSM policy file, has been deployed first:
+do_deploy[depends] += "xen-tools:do_deploy"
 
 # Enable use of menuconfig directly from bitbake and also within the devshell
 OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 864c40c..8bdbfec 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -781,5 +781,12 @@ do_deploy() {
         ln -sf ${FLASK_POLICY_FILE} ${DEPLOYDIR}/xenpolicy-${MACHINE}
     fi
 }
-
-addtask deploy after do_populate_sysroot
+# Scheduling the do_deploy task:
+# - deploy copies files from ${D} that are written during do_install so must run
+#   after that task
+# - the tools binaries are included in the image filesystem, so we must ensure
+#   that the binaries deployed match what is staged in the sysroot:
+#   so do_deploy must run after do_populate_sysroot
+# - add the task before do_build to ensure that deployment has completed when
+#   the recipe build done stamp is written
+addtask deploy after do_install do_populate_sysroot before do_build
-- 
2.17.1

