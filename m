Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4803.1593065122859333786
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 23:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T+aGvOyn;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B49FCE01D78; Wed, 24 Jun 2020 23:05:22 -0700 (PDT)
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
	*      [209.85.222.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42EE6E01D75
	for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:05:22 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id q198so4331738qka.2
        for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NTQM0UT5yawxyIO9pIAHodj+AI8BiFKoiHB8alF8N0U=;
        b=T+aGvOynDECsMz5wSG2l3VPDjtB0i14ToZNpJRhJ6LKQypIWmnfTLp+VCt+cSt1YfZ
         ajHYHmnGXEIXH8sQTQoMZIWSIqncS777GjBSc0QpEiYFCuqi2BDMsGLRdEABSZ9SPKVz
         yqGneS6eAfKdImQuw08eCjqDOj4qd7Ae4LxTzNddLL9fmN8/DRiHuns43i4Vlg/LiZ5Z
         Tq3pQO5JV5UsFkll/6N//DhFHNkkyBMARq8JkcuRP7AJbo7ME+Xnb7rdQJfyZMdlwSyI
         DSxvxLYlHXDbUacj8kC3ucXaZktLfxFoUjdWQCRfmGS/kcODgsk/IY/k0omIQ7CWhewd
         kUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NTQM0UT5yawxyIO9pIAHodj+AI8BiFKoiHB8alF8N0U=;
        b=ciyvVF2WBbfhJnNmZqClTGr6T3+PSpec9hI84fN0MP+fTcL4B6wn0kXVqo3BTpBty5
         CipU/eW1wq09X+F0nLVU6ZoXDCCal/vPWf3ie4P3UDAUYqEof7o5jO3g9ogveZDB8vDg
         1tqFdlQ/M0EFUGtcP/ODPzCApZYIABKIHyseAFaplEF2tCvWVpGcea0ol2DsVelrWIhA
         JOPaMq8+UhL1+SSCuEiceK2XCYG+hA3HOjtI7LnyBLwAoCvFSx4Ee31Dj4AwsUqqSYhf
         psZKwMpNTiczf7kTTpDokJUl9a2IBe7vOB9kPuoM9eX/+VRbudLeLyW65J6+fTXx6jJN
         gHJg==
X-Gm-Message-State: AOAM530YIyioubzdLSHdAZhTD4c+0AkjOyg8BSkRxSJAnWboi/eZE9jE
	OljAHFnZ3e1nqYObBuy5lEbhTz4s4w0=
X-Google-Smtp-Source: ABdhPJxVBuICO1QQMbW15Gl4xS/lxFPRVRbw8tPPkNw+wqaA2Vse4Q53i6LmJykQVj0cFghMQaKt2g==
X-Received: by 2002:a37:9b08:: with SMTP id d8mr14627321qke.105.1593065121498;
        Wed, 24 Jun 2020 23:05:21 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-6.mycingular.net. [166.176.184.6])
        by smtp.gmail.com with ESMTPSA id g5sm6059161qta.46.2020.06.24.23.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:05:21 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 10/10] linux-raspberrypi: prefer kernel version 5.4
Date: Wed, 24 Jun 2020 23:04:31 -0700
Message-Id: <20200625060431.31826-11-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625060431.31826-1-christopher.w.clark@gmail.com>
References: <20200625060431.31826-1-christopher.w.clark@gmail.com>

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

