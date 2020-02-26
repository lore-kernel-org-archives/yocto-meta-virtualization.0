Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.168.1582676200892841928
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H5pbDnbk;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE4C7E016E9; Tue, 25 Feb 2020 16:16:40 -0800 (PST)
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
	*      [209.85.215.193 listed in list.dnswl.org]
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6844AE016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:40 -0800 (PST)
Received: by mail-pg1-f193.google.com with SMTP id u12so356688pgb.10
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N5OLLQt2eyLxj40DtlB5dNMiuLGmeowneoLGenkXhfw=;
        b=H5pbDnbkcEW9iAWn7K9JZkaXaJ9OCxjJwLmQrBZQbL/0pLOBPH8qwzVyLQRRpYo3vu
         DGM/Bz7/6cJPQhHGfhdOfecos3wudpkNb/fv3frtzfLESGzsBmXzwX2scRUxktHNGpPY
         X0LCZAiUbvpcGrRMIiJyi5l1+sczT7RF05EAa3mcRz4AzQoEW25pDWA28HXYVh6spX9y
         PBpola/ZPe/jcbyFS45CtaEFaYjc1q1CEUwQI1/8wdP2z8qCqdr0FdTBWM+I7WDgaW7h
         XPtNPXB4kWbrSwJw/xA28MUDxshwEcoqbt881RSaMsjlvmdHY92bzDsKyLGhnNw/xyuQ
         xpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N5OLLQt2eyLxj40DtlB5dNMiuLGmeowneoLGenkXhfw=;
        b=CIzxbCikFxpcEABDJBBXIbZqHltHgimQBfpc33bJ6YhB4uAteOCSJphHq8t5fW8nKr
         1RpMZCPTgnjCDM88IKw5lMihQfFkHSz0xH4q6FoM44J6rwt0SIyU6lf3urG8p6Msk8LZ
         G0y0Dxj1G4ylECLjM/81T2nlsCk1QztqUMJRqhCCrQP6OBxIK7MYkBawchCZ5NaeKzaz
         74AI7hQqIw91jQKOFEf1+vFpl/KpXUgwszVaLsbL4wri3nwPbJSY+tdnE1/X6CVigd10
         mrEi/+FhnPfYPni56uu3rC+EX6aZFdqwat5B6m+PQ6FzJxMuMhXEZzoR6DJ2OUoYY6m2
         fQTQ==
X-Gm-Message-State: APjAAAWYQa7l36bDlfkkCk1187WJR13IsppeyMqKIMYmYMcoaOTn18k8
	iwOgrgGm1FBGgHXUcOsBzaq8YmHn
X-Google-Smtp-Source: APXvYqzjJARCV01W6m5XAhnYep20/Vf6ECMiqgooiVj2ll4dBAkJEQn0BdVWqCHG7EyGrSscLIDRwQ==
X-Received: by 2002:a63:ab04:: with SMTP id p4mr1085177pgf.37.1582676199518;
        Tue, 25 Feb 2020 16:16:39 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:38 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 07/22] xen: package the EFI hypervisor binary /boot/xen.efi
Date: Tue, 25 Feb 2020 16:15:51 -0800
Message-Id: <20200226001606.14750-8-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 4ac954e..380b193 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -429,6 +429,7 @@ FILES_${PN}-hypervisor = "\
 FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
 
 FILES_${PN}-efi = "\
+    /boot/xen.efi \
     ${exec_prefix}/lib64/efi/xen* \
     "
 
-- 
2.17.1

