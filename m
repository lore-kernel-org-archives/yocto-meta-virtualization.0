Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.17116.1582521579839840883
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EASnCJ8C;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AED47E014C6; Sun, 23 Feb 2020 21:19:39 -0800 (PST)
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
	*      [209.85.210.180 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A38B1E00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:38 -0800 (PST)
Received: by mail-pf1-f180.google.com with SMTP id b185so4734285pfb.7
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zF2FLO/gce1rPxAkPOtNMU2u38MVbJNMPk/aqmv+kyg=;
        b=EASnCJ8CUn+Y52YMSTLg6G/G7lTKezYMJIksHC9t7imXnIC4zIEySWJ41u4nsuvX0J
         J9fCpn8HJHMw/6usTftMMtvQQj12PHV8rriLhTJhMpny/tJfB23+IPxTt0c4M2hXSk2t
         jqX1BjYZ+vAKT8ijAzj5pcgo6s8j9VlK3XMa0NBQmvS4EwtxnLFKk+Wo2Kcfi44HMg3i
         mj7O9p0XEMqDHLIRyfzwXVX75hTdeXU2cpGlO7xkqDldG/CEyJmzs/NSC+9LilBefDcV
         xINsVj3Ng0ajR/FRswTzn5apeMCiRx96Ju2/bsok3iz97X3LBKvE1AlB2RCbiZXh5h9W
         ZhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zF2FLO/gce1rPxAkPOtNMU2u38MVbJNMPk/aqmv+kyg=;
        b=ID8dK7MICQim4bi1t/9QPOobio4jphmovpqhThcxtqAuRmOcIp321zrwps2o1iSpCt
         CeZGkKuoq9A7KFV8e1BlJ4BOjcLcCg5xMMHidVYMG00Fsq4Xx5kpUw/D8QxNDxVh5yDO
         EGc6p0ZLRiYsny85VpmKhh5TmCRlidXj4Lw0FDm6TJK/Dlk1zQF88wv/hmZzM4ST9EEv
         AeKTl9SA1j7mg4Z028pyuIB763ij4Rv2EsoxQeU4Mwfuaua+SjhEJSvPq1wwPgbOppMO
         5RNCHmpa57uvzDFCl9KcldYrDGIDe+NiWjvF8jFMgjlaNAZxAsEpKK1eS9ouyL88BUTy
         JpWg==
X-Gm-Message-State: APjAAAWclNNpQDa+bMj95a01wY59YzQdJZDwU4Y4W8DM5H9orSrQ92tV
	gWm2tJ0gOOXw01rXFDMgoZJn2oiz
X-Google-Smtp-Source: APXvYqwrSbn+xCqd68CLiZlIJTJveiT/p7J9zyUduDIJF2SyG2B/Pol8VNSxymgy/eTtPOljD/O1sg==
X-Received: by 2002:a63:d10c:: with SMTP id k12mr6129334pgg.392.1582521577827;
        Sun, 23 Feb 2020 21:19:37 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:36 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 16/22] xen, xen-tools: separate COMPATIBLE_HOST for hypervisor and tools
Date: Sun, 23 Feb 2020 21:18:46 -0800
Message-Id: <20200224051852.21933-17-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

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

