Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17135.1582521562364235559
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EaoTF5Si;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B967E01483; Sun, 23 Feb 2020 21:19:22 -0800 (PST)
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
	*      [209.85.216.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE8E4E00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:20 -0800 (PST)
Received: by mail-pj1-f65.google.com with SMTP id f2so3639905pjq.1
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wXj64CZOLpCPpIxEeggHtiJRJjk9wj2J/XlzFBMSiGI=;
        b=EaoTF5Si76cb2BMkrG9JacO7/urAxyskstU0W4cDKOJy+xnF//HAz5z80fJZFk4Yq2
         cBmVLGnxzV1s9B1ANKJpJdPYWb0fvWz0heBkQLAHwnbMoehjVjyDxpWyw6I09zurpSoR
         r2s7LetW+AWr2YzhzWPHI/7jhk2ZupctuisPVrpqq47ShAlYOo5yeopzGle33qGB+jrb
         mooRIE9DqbntOwLFsW75QU7oOYUSi7c0p1QFdmytC771yQRew4BROAU6zSme/mv1c/B1
         XeTlF6p7zvGyIIwLEsKHYirUJ+bO/kdcRLBSWV5dLU2/R5bFpJgkTAYNJQr2Z6voV7Oy
         Cvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wXj64CZOLpCPpIxEeggHtiJRJjk9wj2J/XlzFBMSiGI=;
        b=c0UiO3xsniBUNHoT7SwmUz78dTK1AVdiomE34S/yRWulw3vpk7/rX6EdYnN4HN86d6
         nn8zEQ2Peddn0sYpLNjGd4N2gw12nSnBP58+vsyAiB8aNw/6l/mgU0Puw3DYWw6SGCxs
         B6wC/mofR9hcSYXiQwRpI7ADSqLgKT3kubJDHyJewAt+sroz7iC7M3H0OKDkqY2if++S
         8geXwCxOeMOAddcPvGjUyZJgd9tf/VNs8g8bwVvNcGfX1NwrXM0cG5x6db6vUtiA7vuK
         9Fnm0AKf4bhwDNT9Y/FysjxYWd6IYnPUbQnPBVB8MzKA4742318J3f5WjpXSMKcXrxMQ
         N4oA==
X-Gm-Message-State: APjAAAWoV2NFA/JTV45x4mG+Wlo8BCWvMKxGUOMqON+SH5YHV+z839I4
	edYMEW+XVGhPAwKlz7+PBDdEW7qn
X-Google-Smtp-Source: APXvYqzFxftJdCqRAhdJxScgXo4wy6FjYsI0doBSLEOobXqFY3LW8dtccIr+UQeRyjk6/sLJFPZkoQ==
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr17645174pjt.105.1582521559931;
        Sun, 23 Feb 2020 21:19:19 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:19 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 05/22] xen: upgrade to 4.12.2
Date: Sun, 23 Feb 2020 21:18:35 -0800
Message-Id: <20200224051852.21933-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

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

