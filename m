Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.174.1582676218792705993
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uObN3si1;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7EB7BE0175C; Tue, 25 Feb 2020 16:16:58 -0800 (PST)
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
	*      [209.85.216.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 323F2E016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:58 -0800 (PST)
Received: by mail-pj1-f67.google.com with SMTP id ep11so470348pjb.2
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ONbOrUBjw+OqmFF63CPqzoFqX94zrh1UnIiKUU23bzw=;
        b=uObN3si1ZrrPCCHhbK7bo5A6hw8ekMMqi/kRvXAvnPXp82H3J/7J8dz5z0sA2M40/b
         9kOCllkz3xT2IrszG4TNocDf6ZDNyOQW4U+Fge4qXmOP0Q7/Zh7QrKGBPJs7LLkyfEZ0
         ULjPtwrCOMUzmWvjY1PR/Yqqw3av0DyeYvLb3PxGRi2Nwwc7WvAzHx1XgEwBKtJO2dVw
         H3hdznnwIj5MwQ/WAODrGJWM/Wt8HYfzpVYX5cxaMc9FKu5WzZXNqDxYgZyP397oOhj9
         DVvt2JsZsk1WsxwvS45fmqyxOnjh2U1NFzpsw3zRg0Kt3A6OXz4tKmlqr1G0/mjBisA1
         u9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ONbOrUBjw+OqmFF63CPqzoFqX94zrh1UnIiKUU23bzw=;
        b=QDtQL57LrYRkdC0BZ3aknqfX2v/37KbD/M5TMv2nmYvhXhxlCSWGwIFrGLSi7MSH5R
         miNc9BlkhNNifLaOci3C99QjAjxiogSV17C8mMdUPdyWTkZ+JMwC8IgvTTYdzqKCq0z1
         VlJ4QGZ5BSlJPggkAcS4GDB0WWnkih7++EbmEBpGc1CiRhJYuOCj91znjfNsX672atIp
         n3RxKIMh8Xz/Kr73J9hVfkEDjKCuHtCcML34/OeNW/uIrwMvug04oE3rVi1BadQD+NRH
         12rFW0GKWsTnGzgA3ogAMCphBoanMnTiwVCBKcldkLUIJacl/mh4wvSW99vAfj2N9LZh
         FW5w==
X-Gm-Message-State: APjAAAWMlbkwVBBVzYt4T7McvJhbms6BWtfzMASUIpFMnTVs1fN1MwJF
	YGciv3CcF/ZgRiVgdJH6cEyukfhh
X-Google-Smtp-Source: APXvYqwrAq8TelhL4+G5u7WAp3YGeVkgNyZn0G0QYjYI88r24nh4P6sC7SKcMS7z00oumB4K28HVXQ==
X-Received: by 2002:a17:90b:1245:: with SMTP id gx5mr1804355pjb.105.1582676217396;
        Tue, 25 Feb 2020 16:16:57 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:56 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 18/22] xen, xen-tools: bug fix to post_patch task
Date: Tue, 25 Feb 2020 16:16:02 -0800
Message-Id: <20200226001606.14750-19-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Patch needs to be applied to tree in ${S}.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 32e836a..d863c8f 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -192,7 +192,7 @@ do_post_patch() {
 
 do_post_patch_append_arm()  {
     # The hypervisor binary must not be built with the hard floating point ABI.
-    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${B}/xen/arch/arm/Rules.mk
+    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${S}/xen/arch/arm/Rules.mk
 }
 
 addtask post_patch after do_patch before do_configure
-- 
2.17.1

