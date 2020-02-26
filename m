Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.175.1582676215941525665
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSJdx8er;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8896E0175C; Tue, 25 Feb 2020 16:16:55 -0800 (PST)
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
	*      [209.85.215.170 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D21BE016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:55 -0800 (PST)
Received: by mail-pg1-f170.google.com with SMTP id b1so165754pgm.8
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zF2FLO/gce1rPxAkPOtNMU2u38MVbJNMPk/aqmv+kyg=;
        b=HSJdx8erXrenljBX6fsZi7Af3YKJ+U3ExrVR5Sq6yqMdBUOjix2q4r4GqQA3eWyq8B
         vxCzkThf8bi62lG40tzzSopS8qFztov0wTLyagAsTTDN2MNtTO3f5u26GgMNGA9dpYXS
         KnevfCfEll9Y4VdLY9s0D4IZUZjzzftEI6LMP4Iv/DcN9PlGl0FSwNnVLdpOuKXnsBHQ
         Mk9CId1dVanJj9fjKjjuGs78YidzHKNzd5rO1ZlB0AHCPU1x7hd2FZWy1qV2KcLdG+QZ
         BSTcT4itg0DBK4UGt6ngWGiit8Zvi8DwykPhoL8Mve1RksehRj6PRHP34hwcfVOpEh2U
         EGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zF2FLO/gce1rPxAkPOtNMU2u38MVbJNMPk/aqmv+kyg=;
        b=kVBszeSFSElimz8cX50Vgzrr7oa3muHWayQpi9wjJ4jYWkavs6CF+8sx7ZBOCDdPUW
         l3xSvigBS7GC88J3TlzXyfIhwQ6rW2BomKU080wjHybybHOqh8Flb6PHPRR44TVHG/OF
         AWMrL4+RuoNPegBSrr1Kmb/dGrMtufPSqTpv0PowllWmFDq6E99cLSVoHqS3pfvLz488
         Elkt7YVneHL159m+w4+vP0x8fBk4M4cCiVU6IWegzbFTdAH7FSQsXQW4J5Tjh6iE6D4y
         yncalTnMYahQmTk1AKsPQHZZUu4q7FzixXCKyWaqP7GpR+8YV/IS3gvnscj058VxKmCk
         CrEQ==
X-Gm-Message-State: APjAAAUAM2IG0zXLCMbn2QkjVwywnfkRGt0DlARli5LxrxzRyWtZCo5a
	dvjuOQDv0YgSJrzHu4TlSxh+LFPH
X-Google-Smtp-Source: APXvYqyaxZR51Dr7wp8GmlvjlSkilQSKgIGUkhnSCEHm5QGV4pUY64uNVb8hGlJOCLllNJrG1z0YmQ==
X-Received: by 2002:a63:de4c:: with SMTP id y12mr1007852pgi.107.1582676214322;
        Tue, 25 Feb 2020 16:16:54 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:53 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 16/22] xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools
Date: Tue, 25 Feb 2020 16:16:00 -0800
Message-Id: <20200226001606.14750-17-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

The tools have broader platform compatibility than the hypervisor.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 3 +++
 recipes-extended/xen/xen-tools.inc      | 2 ++
 recipes-extended/xen/xen.inc            | 2 --
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 79fafd2..41de9b6 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -6,6 +6,9 @@ DESCRIPTION = "The Xen hypervisor"
 # this allows for varying the target architecture or toolchain used
 # to build the different components. eg. 32-bit tools and a 64-bit hypervisor.
 
+# The Xen hypervisor has a narrower compatible platform range than the Xen tools
+COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
+
 inherit deploy python3native
 
 PACKAGES = " \
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index a6f1209..00843ca 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -1,6 +1,8 @@
 SUMMARY = "Xen hypervisor tools"
 DESCRIPTION = "Tools and utility software for the Xen hypervisor"
 
+COMPATIBLE_HOST = 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
+
 inherit setuptools3 update-rc.d systemd deploy
 require xen-blktap.inc
 
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 0bfe72d..1ac131e 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -2,8 +2,6 @@ HOMEPAGE = "http://xen.org"
 LICENSE = "GPLv2"
 SECTION = "console/tools"
 
-COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
-
 inherit autotools-brokensep
 
 require xen-arch.inc
-- 
2.17.1

