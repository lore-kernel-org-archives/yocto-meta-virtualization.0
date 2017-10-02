Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15D17E00C44; Mon,  2 Oct 2017 12:47:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.65 listed in dnsbl.sorbs.net]
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE0DFE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Oct 2017 12:47:52 -0700 (PDT)
Received: by mail-pg0-f65.google.com with SMTP id y192so7105168pgd.5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Oct 2017 12:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aVTLNKRamUxsDA50tURMiY1757xFnU9swaAl2EWj5Q0=;
	b=dhsU7biDTgVctXElyaGHLbEsa/hnjY/bE+6oqy4RdY+Wh9JNwz0Dil5Ugv4cynbI/6
	FZ7yVhM1janjMoPYezDqJpistXeeTqygcKnxIPY8yls0YDorbiOI3qXpnF3UH5za6rKy
	bp6wyogTZeg8sjQ6MrlrHTOrLsGUsyiqCwzKvThekmUqu+StMJSHdTABlT2sbtUCO9pb
	HZhfE0fXlvvKdGL2AlMeiPC9TgHq4jaNyQajomfgLOVnUH4BGOtKew6hgO6xDa09SvbY
	lp59LCHv9PHcdEWF7ZITbth4PILr4GbXxST8fK/8ZO/BDJFxnTwLNd2hKpJW5TFd+02s
	za2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aVTLNKRamUxsDA50tURMiY1757xFnU9swaAl2EWj5Q0=;
	b=Z0A20gl8gLwulWyYqRiPE6ABtuOf+owhFPYFRmBq4qQF2KxF4JC5X14P/d3eSeiXvO
	bfVLXVhqzZhawMlBLRYTSvdCsxD3rj0Uodj6yiPKJndsF2TK1RNNRU+TLVtK2ACSKp/n
	VJnvWVsE0eyCfisqBGj/MRKJUBuzFExIZ3kefJCv8jqVbP1ATfqvNeUXqhLPlFkGmtDI
	Zgua3s/HtJhYTbMPZOG6ZzMUPmCQ4X0P2ESZl1TveIVv2oBi4TFiyHMUznxq9sOwgIQA
	3aM0xXlaitn3GU/BC0AsEJx7GlY6yP9imzWfCraoZ/uP/qpHTquDBcmFzwlQmjgv1WOm
	1GPA==
X-Gm-Message-State: AMCzsaW2IF8w4Oc7qFv8plaGaWVXtZXjoMsN7+pay4AtwdBpcSQM0Y5r
	caQ1S79zqYUs97Uogc2O+8QsfXHk
X-Google-Smtp-Source: AOwi7QAaTIfb/+iz4TfxgQtPOdwGeDaGdHE6MjlxpxKLFJ58K88twDsPfIwOhBqpV3OZGI3TKm461w==
X-Received: by 10.84.234.136 with SMTP id n8mr3118479plk.228.1506973671545;
	Mon, 02 Oct 2017 12:47:51 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	s9sm18544698pfk.20.2017.10.02.12.47.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Oct 2017 12:47:50 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Mon,  2 Oct 2017 12:47:36 -0700
Message-Id: <1506973656-11819-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH] xen-guest-image-minimal: fix making PCI a x86-only dependency
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2017 19:47:53 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

The logic for restricting the xen-pciback kernel module to x86-only
images was incorrect, resulting in the IMAGE_INSTALL_x86 and _x86-64
variables causing the IMAGE_INSTALL variable contents to be
overridden and incomplete.

This correction removes the specialized IMAGE_INSTALL_x86 and _x84-64
variables. The replacement logic causes a value with
conditionally-populated contents to be added to the IMAGE_INSTALL
variable.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---

The symptom prior to this patch was that the xen-image-minimal build on
x86 would complete successfully, but would not include the expected
contents. This is because the IMAGE_INSTALL variable _only_ included
kernel-module-xen-pciback and was missing the other contents. The cause
was the specialized _x86 and _x86-64 variables overriding the
unspecialized IMAGE_INSTALL variable, rather than appending to it.


Please use my gmail address for any correspondence.

 recipes-extended/images/xen-image-minimal.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index a01976e..827cc87 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -10,16 +10,16 @@ IMAGE_INSTALL += " \
     kernel-module-xen-gntalloc \
     kernel-module-xen-gntdev \
     kernel-module-xen-netback \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', "${XEN_PCIBACK_MODULE}", '', d)} \
     kernel-module-xen-wdt \
     xen-base \
     qemu \
     "
 
 # Linux kernel option CONFIG_XEN_PCIDEV_BACKEND depends on X86
-IMAGE_INSTALL_x86 += " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'kernel-module-xen-pciback', '', d)}"
-IMAGE_INSTALL_x86-64 += " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'kernel-module-xen-pciback', '', d)}"
+XEN_PCIBACK_MODULE = ""
+XEN_PCIBACK_MODULE_x86    = "kernel-module-xen-pciback"
+XEN_PCIBACK_MODULE_x86-64 = "kernel-module-xen-pciback"
 
 LICENSE = "MIT"
 
-- 
2.7.4


