Return-Path: <koen.kooi@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D4AAE009D6; Thu, 11 Jun 2015 22:36:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.212.180 listed in list.dnswl.org]
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6597BE009C2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jun 2015 22:36:41 -0700 (PDT)
Received: by wiga1 with SMTP id a1so6164153wig.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Jun 2015 22:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sF5o5dLowPtTXnbbZ5I1Ls3KyPIJR90ud5SpzLAxsNs=;
	b=geubcTyFvv3Y+oZ6ADdq4IW+OKu6LZ2lhdZI49p9o4EruPO2DQif2ZcKDEYt2uoGWI
	pEYJEzLpXJGZRqRQKw26dUgjHq9hFR7AX+MJcwjhb4I0KdEv3PVzIqq+JXng8uwBxaX1
	5E0qLlWtzz+BSnFLd8KMw6GbdgINh9kltCiuHLGDryPmAtAqdaW4rsY95L2DACZaxepC
	+5B3b79nM6j2c8cSt4RXxtbQ4S8vMrAQY43A/9p2We8ODbNxGMGMKNcWmeSJ6tjcq8nx
	GX+/jqGH6Zk9k8q97VsN3Y1nSf9+2bztkc7tceBKkWeoKcrftFF4CPb+YwCEuyorMTRO
	DiQA==
X-Gm-Message-State: ALoCoQnAB57ly6ltK9M5bYXHKG7WLx3mzN7PsfhNTpv7zG3adpVq+r2vYw08a8+z419M6eFLYrod
X-Received: by 10.180.73.236 with SMTP id o12mr3289958wiv.56.1434087401036;
	Thu, 11 Jun 2015 22:36:41 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id pp8sm1876398wjc.13.2015.06.11.22.36.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jun 2015 22:36:40 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: meta-virtualization@yoctoproject.org
Message-Id: <1434087392-20250-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: ray.danks@se-eng.com, Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] cloud-image-*: catch up with OE-core class rename
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
Date: Fri, 12 Jun 2015 05:36:46 -0000
X-Original-Date: Fri, 12 Jun 2015 07:36:32 +0200
X-List-Received-Date: Fri, 12 Jun 2015 05:36:46 -0000

OE-core rev 0a3e8eb9f592c3f1edd2c7521855f7406541651a renamed 'image-vmdk' to 'image-vm'. IMAGE_FSTYPES didn't change, so keep those as 'vmdk'.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 recipes-extended/images/cloud-image-controller.bb | 2 +-
 recipes-extended/images/cloud-image-guest.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/images/cloud-image-controller.bb b/recipes-extended/images/cloud-image-controller.bb
index 74f724b..0b2a67b 100644
--- a/recipes-extended/images/cloud-image-controller.bb
+++ b/recipes-extended/images/cloud-image-controller.bb
@@ -26,7 +26,7 @@ IMAGE_INSTALL = "\
     "
 
 inherit core-image
-inherit image-vmdk
+inherit image-vm
 
 IMAGE_FSTYPES = "vmdk tar.gz"
 
diff --git a/recipes-extended/images/cloud-image-guest.bb b/recipes-extended/images/cloud-image-guest.bb
index 818a513..e24bf0d 100644
--- a/recipes-extended/images/cloud-image-guest.bb
+++ b/recipes-extended/images/cloud-image-guest.bb
@@ -13,6 +13,6 @@ IMAGE_INSTALL = "\
     "
 
 inherit core-image
-inherit image-vmdk
+inherit image-vm
 
 IMAGE_FSTYPES += "vmdk"
-- 
1.9.3


