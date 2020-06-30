Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.6618.1593482150535174661
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KxvQkB98;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63F28E01DBF; Mon, 29 Jun 2020 18:55:50 -0700 (PDT)
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
	*      [209.85.160.194 listed in list.dnswl.org]
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CFCBE01DBD
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:49 -0700 (PDT)
Received: by mail-qt1-f194.google.com with SMTP id d27so14479776qtg.4
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HQ6Kqinrt1VRn17OKwhp2mornyBKluB9mRVZX4ful94=;
        b=KxvQkB98u7RByvvFvVgjTCIE3x4R0fEPbedXRTVht9npvB0RtdLrE9xg5i8sK9w+vQ
         jMG7G24cp4uTZ7N2V13PfZztGcI1FLKcWF0ZfOfQp56usy4bM6bbNHhrHNL+8ZuaOuga
         Ky4qi+i2k50z0OvtTYXsRAT/0LndkBOUqKNn9HmYunVlny2752xL+jIgi0OATOy2XxbA
         wv3W72/NblLcS7GOe3bimzoG9UparoeBXqvBY0oSFGa5to+2TlJn73fRiFdJS7tVqohc
         vBBnd1vDqJ4f93VuL4skMMgxdVFk4+jFbO6dpSDARuwMj7icGv1j5G+lHxFjKbOuhjRa
         Jodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HQ6Kqinrt1VRn17OKwhp2mornyBKluB9mRVZX4ful94=;
        b=OGJL16McFxvVzYVyuEMiY40fa0+GhsE4DY2jflCCdLqVRtcAtRBOI2PMpENsX9X3o8
         49Jd61Zho6PJehp16AdloXTihkZXx3+e8aMwqA2RvdID7vb40mdJXR3wHD7xleAIblX5
         0B08U728ZeBPZl7HmyYoCIVhgwY9dPwhZ0/g9/V+wA0zaxgE9xvYOhCMUT/UyK8JuCgP
         +CM4TMpVbb95IaW4+DhJAhAsKp8kn4kxBXQUg6iRwiHfuZKsu8WxqpVNO5rxBw1loFyO
         bvbQupb6cm4Vljj9dNocLLtt7dxcOV+gm8bAM3GaVWvrOLgLA8eBsTgz7eW4mla7VvMm
         cLOw==
X-Gm-Message-State: AOAM530aclYqL6Aq/Y6qdBUDuNKqBJEmgPGYWXZsv1Z//6dy+r/ejjJb
	vb9GLwPpPN7V0iUdPM8UOv9DvUuQI1s=
X-Google-Smtp-Source: ABdhPJxDXTIpFpA2DL1XWAY8tBc2uUanY56fHJtPZ7ZfmwpFs4t7DV/YqpIQS7yltjmlNJ7KnDm1mQ==
X-Received: by 2002:aed:3609:: with SMTP id e9mr19135800qtb.152.1593482148412;
        Mon, 29 Jun 2020 18:55:48 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t48sm1841794qtb.50.2020.06.29.18.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 18:55:47 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH v2 05/11] meta-virt-xen.inc: add Raspberry Pi settings
Date: Mon, 29 Jun 2020 18:54:48 -0700
Message-Id: <20200630015454.10151-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 conf/distro/include/meta-virt-xen.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/meta-virt-xen.inc
index a92b08b..2ada83a 100644
--- a/conf/distro/include/meta-virt-xen.inc
+++ b/conf/distro/include/meta-virt-xen.inc
@@ -4,3 +4,11 @@ PACKAGECONFIG_append_pn-qemu = " xen"
 # For builds for ARM platforms, enable fdt
 PACKAGECONFIG_append_pn-qemu_arm = " fdt"
 PACKAGECONFIG_append_pn-qemu_aarch64 = " fdt"
+
+# Raspberry Pi settings
+#  - Xen guest console
+KERNEL_CONSOLE = "hvc0"
+SERIAL_CONSOLES = "115200;hvc0"
+#  - Xen uses u-boot for configuration and uses the uart
+RPI_USE_U_BOOT = "1"
+ENABLE_UART = "1"
-- 
2.17.1

