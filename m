Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.167.1582676196805268228
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rxeBxHXK;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A74A0E0175C; Tue, 25 Feb 2020 16:16:36 -0800 (PST)
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
	*      [209.85.210.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BCDDE016B6
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:36 -0800 (PST)
Received: by mail-pf1-f195.google.com with SMTP id b185so450281pfb.7
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wXj64CZOLpCPpIxEeggHtiJRJjk9wj2J/XlzFBMSiGI=;
        b=rxeBxHXKLxt7tDQX+6MZ5aRxNdJNneaezHkzmUOaaPb1AIXVv7kcYxnaK9nadxJvBB
         smX4HWuXY0geRj6bljgUUlOs+bmvnQTah/eTyjDPsQ548xjM2OwXZ8F467CqA/+9tIcT
         jeH8SygJw63W5ad6YD3gv5xTCbWMZXHiiAICShLfCJARHfwwK/Z3X5YArVwrI2AlxXQL
         xIleSOY3JakHKKs5vdY0BBFUeLeVwBIeWphGY/pbSD42WbIGL33bcfUyQnFbfi1O9Uos
         bpcm4rQqgLmG89FjxRTSWPkafvLA7Ql1CC/f8+FLlg5uT5ZBf6TTGU76mJuGJqnGbZHH
         kvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wXj64CZOLpCPpIxEeggHtiJRJjk9wj2J/XlzFBMSiGI=;
        b=LaxMEjiOhdxzIjSsBzkkaqXfTet/GIG9wdE5bkgyZ0p0bmeSRofHV9yr0l/W5wQRff
         cIY1F6RnaOaQS/KDsNEgc25ZHIFgAGZ2w6kjqheWAzrvCH3kl11QOvYcjDfFAUpJiFIG
         LazDRBljKdP9dIUWX65Vqfu4FLqWSZqv8TFH6LTHdROcqR5Vqvk3B6p+rewfLKe3hDT9
         fHyRwyzMDGssfA9/n2AjPmzhgVFaBHua52sxWmyAgbLFvKbyGvJslbfMClEGbEHtTu6L
         Xfq4QjHcb/KkuKn2BN9VymDa/t+vMeT0f/d43Xid9d9Y4cunaivoiLOEOGOq/O7tub/X
         BN4g==
X-Gm-Message-State: APjAAAUvEmJW032ZazLfqbD8KFVwoEWf/MLc84X8jJuKhrDSl+gnHwPT
	N0yJ3nwcmJGZW+/G86MTw6M1WSYu
X-Google-Smtp-Source: APXvYqx68rwQ+A1fSw/mHLHvq9ujShMCwoxc12alJtc5vT8kKASIgHA4L1FjZeMMfH88woFWomQT7g==
X-Received: by 2002:a65:67c5:: with SMTP id b5mr1047523pgs.138.1582676195087;
        Tue, 25 Feb 2020 16:16:35 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:34 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 05/22] xen: upgrade to 4.12.2
Date: Tue, 25 Feb 2020 16:15:49 -0800
Message-Id: <20200226001606.14750-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Fixes the build failure with 4.12.0 seen with the newer OE compiler.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/{xen_4.12.0.bb => xen_4.12.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/xen/{xen_4.12.0.bb => xen_4.12.2.bb} (63%)

diff --git a/recipes-extended/xen/xen_4.12.0.bb b/recipes-extended/xen/xen_4.12.2.bb
similarity index 63%
rename from recipes-extended/xen/xen_4.12.0.bb
rename to recipes-extended/xen/xen_4.12.2.bb
index 246be7a..affeb4a 100644
--- a/recipes-extended/xen/xen_4.12.0.bb
+++ b/recipes-extended/xen/xen_4.12.2.bb
@@ -6,7 +6,7 @@ SRC_URI = " \
     file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
     "
 
-SRC_URI[md5sum] = "7d24d4541e3025421e02384cabc3528b"
-SRC_URI[sha256sum] = "6e5455e4a58dcb2339bfcd2a89842728068b530aa62501843793f7cf743c4d64"
+SRC_URI[md5sum] = "57084e3f55bbec063d38b464e1b7e4f2"
+SRC_URI[sha256sum] = "1c75cbe728dfabf02b7f9a17ce96ee7d202d2fd4b4689490018d3a28b63f9fa3"
 
 S = "${WORKDIR}/xen-${PV}"
-- 
2.17.1

