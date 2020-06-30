Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.6626.1593482162851613811
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nGxbxEaa;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1B15E01DBE; Mon, 29 Jun 2020 18:56:02 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.195 listed in list.dnswl.org]
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CB3EE01D76
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:56:02 -0700 (PDT)
Received: by mail-qt1-f195.google.com with SMTP id z2so14482998qts.5
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NTQM0UT5yawxyIO9pIAHodj+AI8BiFKoiHB8alF8N0U=;
        b=nGxbxEaafFBY5EvFKAgG6l3HYkEWS16nM/zgH0UyML177NMUogcnYceWVs2lOX5iRK
         ZwAqUoaxuqYPS9IsgIg3JPW/Wszle4tohFL7cSwgq3QBuv8a4tLxdO3s3HKEGO4+gHoz
         rW3J/MleGAn40uHVuLNq0MJEssSLpKprXaBqmdSjDLUiKaoteWhWAzpcGGr4j10Wg6RI
         lVuA8gt9XbhnFDy1z70+ROfg3u3VP70rrdsTJT0b8uXHk2EU1VsHDDME88fTo1JycEcI
         8kDvjtkTbv43mtjI7rsE0z0Rv+Tk+yOrNen/SF/7MHY/VPXu4c5f/t4tF5JuEZ756vLd
         LrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NTQM0UT5yawxyIO9pIAHodj+AI8BiFKoiHB8alF8N0U=;
        b=Jj0+OFhOO8bWq+ht1KzaKMMII6OBcsd5e9UKBf918BcIYeIFGaDWNfLoKI9dXwwQg1
         ERPfEFN75QX7NZBnWvkp+UZncQk1FvWYHydFm0vp0yDG+0kCsIcQrkgaX8ZCa2Qt7aEJ
         acN7VJjKUL/cruvvFIFSpJXgFc+9wLJDvYWsKOOF8obD4j+PA2T2wJnTUfXB4Vub5dNJ
         UicGOjC1CUvoSQCIImfnVmBurHxmQ+LZ5d3yzGQY3XJ2qzQ9WTCOBLrLT6np3j6Au+og
         5oNS5Afz+xgbgWNGfckO7Y5Gkx75VMVDweG2cAk1opDGDYnGlH4Q1/k+eNpFpv7WfPYD
         0wHw==
X-Gm-Message-State: AOAM532971Id1YBd84VD6WB+ABSZZ2FVdTYzPmwFA+WvLlLXfMx/kCgA
	GgiRy3swn0RUznljcJP5p+UtUEsJVME=
X-Google-Smtp-Source: ABdhPJwS7ONq9JgZNxktu8EkgwgmaVXu1RLRwi5DGxlKUNiCcZ1oWs/GYVRf1QPks8Ow6/w1iEWzLg==
X-Received: by 2002:ac8:173b:: with SMTP id w56mr8792242qtj.218.1593482161459;
        Mon, 29 Jun 2020 18:56:01 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t48sm1841794qtb.50.2020.06.29.18.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 18:56:01 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH v2 10/11] linux-raspberrypi: prefer kernel version 5.4
Date: Mon, 29 Jun 2020 18:54:53 -0700
Message-Id: <20200630015454.10151-11-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>

Aligns with Yocto's current kernel version.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/distro/include/meta-virt-xen.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index b4a20fe..2c8ef0b 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -15,3 +15,5 @@ ENABLE_UART = "1"
 # Build the bootable SD card image
 IMAGE_CLASSES_append_raspberrypi4-64 = " sdcard_image-rpi-xen"
 IMAGE_FSTYPES_append_raspberrypi4-64 = " rpi-xen-sdimg"
+# Align kernel version with current meta-virtualization kernel version
+PREFERRED_VERSION_linux-raspberrypi ?= "5.4.%"
-- 
2.17.1

