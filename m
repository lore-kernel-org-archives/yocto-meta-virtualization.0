Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.178.1582676202692963079
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNK0L1If;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DA83E016E9; Tue, 25 Feb 2020 16:16:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.216.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36195E016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:42 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id n96so467166pjc.3
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jMdEtCVovWwRaP2yKiEu7f2gEVClUWmQT4kq9SJcQvU=;
        b=bNK0L1IfSl3w15o3w5P8rOYkApoN0zbJEXC8DH3t4f8sZIPTiUuYHWXkDXOXdUjRIQ
         NOqptnevuTFC4jIrLKj6ChUw5ulEWdrMTsKQx7Q82iqcyJ8QmKCNLKCRXnCddpk7CMpG
         KjuuzoXzTi8Eq5FnGIKrKkpL/TuJXsTGxFQjhe8zCGBjtU2pb8/5AXmA2cXIrlLXRJ+D
         Zvr495Onl3N1/mAjK3F6pzFDdYkEwttZHYhHa//nVxaVoX/xIEkrCeMlSSd9SVxMNoZU
         81nAcymEbTkvvZE0Vynxo+1EKhZ/+WD6YQyha7a+5WREJ6nqvB4pF7Wj/grmZhgEV7sl
         2qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jMdEtCVovWwRaP2yKiEu7f2gEVClUWmQT4kq9SJcQvU=;
        b=J2yWyeuwS128xtWXmp6QFaw8SNYHnrZzjLFneNeQUmgq0RcsyhomOU7ruqJp2DGdDU
         A4nLWaQs1km97EqjNo44cPgsAOQU9BWXiyBGIjsDYxrKZI/csn/Fu2Z1nBiv15bHEA27
         nzBBkl4b4UK9SqT7PvDsrTgTeDOv2vA2iwB1fAbYxsJpsdL9axbdgAKRxuEnAXfVu1FA
         TM+ceV9rxJ9AwJZW293LdgIazSUaO6LEcBjDI6DzEQW6YGQm8Tbh2h8w+nhiwfiHzLYW
         CG2VgF7GjFgp8uBed/8zx//KhvsGPSMFGclUb/AKXllLwtFp+lReZfCqj5L7tLrMDaF0
         BtNA==
X-Gm-Message-State: APjAAAXHrMlI5NVyCYsZ1u6r3lwq9oVYz3eQeIEZ22TqZvgDAXqfNuPq
	xARAnE/GX3BYffaOQ1dGJqv4M7Ii
X-Google-Smtp-Source: APXvYqzbTEjo/fbKt9P43YAupVR6FlFo1DrwyvFJR4u2ow4QVwuybb7oIQCSv2fliHSUSY6ktYYp+g==
X-Received: by 2002:a17:902:a711:: with SMTP id w17mr1171632plq.152.1582676201480;
        Tue, 25 Feb 2020 16:16:41 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:40 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 08/22] xen: add RDEPENDS for xen-pygrub and xen-python packages
Date: Tue, 25 Feb 2020 16:15:52 -0800
Message-Id: <20200226001606.14750-9-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 380b193..7b1397f 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -108,6 +108,14 @@ RDEPENDS_${PN}-misc = " \
     python \
     "
 
+RDEPENDS_${PN}-python = " \
+    python \
+    "
+
+RDEPENDS_${PN}-pygrub = " \
+    ${PN}-python \
+    "
+
 RDEPENDS_${PN}-remus = " \
     bash \
     python \
-- 
2.17.1

