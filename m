Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17461.1581311298731831561
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g3fxxmyj;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95F3EE016BB; Sun,  9 Feb 2020 21:08:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.216.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4800E016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:17 -0800 (PST)
Received: by mail-pj1-f65.google.com with SMTP id ep11so3660579pjb.2
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wXj64CZOLpCPpIxEeggHtiJRJjk9wj2J/XlzFBMSiGI=;
        b=g3fxxmyj6TY711+yb2I/28Y8EqPSEbi2sKj/EKacgE2i8jgdX9gTk9lchMpRtsxwcZ
         Ok7rJOIQmsXTd6elEHyGX3mvUxipomwiXoHfpfAHBQBAp5ykNm2UFVyWg1Pd3St0r1sJ
         DH874BbDuQCYKFu/3H5WPUTkx6eGkxeK6/4UDe6KR36DZzNcO5f6uCHQDq5cRkQQ+rdX
         QvdDR8jzrO1EV2hDX7L9emo+Gq28vzAohPgCqWjrocXoz1WC0hd5JL6snlWTM43K0lDS
         LZaF26b03rVD0af5zIhZweUdVgPHrePetT09VFhgnxTwgLVTmd8+tkiSteOSxcMhwCQo
         1XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wXj64CZOLpCPpIxEeggHtiJRJjk9wj2J/XlzFBMSiGI=;
        b=rVX019B9g7Zmbn1h2QGaJp6Ez6hboDzC/zqUlX9jXsjK3P1UclS4fBt9qk94ihx1gZ
         Mq6jyH5DbJFIEBKCWu/0RlSYKMaJWCrfFjEvcO+rWh5DdQbl8iF9dSeqfW6wjguPQ/WH
         HTBSlpnL28qRg61qSpMmEIAKH7Rb5dOq84rtlTsCbaCeNEkzYy2Wl4ywQwRIrRcipW68
         0qMzRHNnj3DVfFySVbPwzJB3tc2dwbhEOjMu4S7IOmBJMc3Gev7P02zTjijbBXlRATSr
         DYyFe/JN8vbHR/4iS22pxo1tj1+cC1ejqftxQM8tw/6/G6urbciLC/ZiTclA6reLC8xm
         pXoA==
X-Gm-Message-State: APjAAAWm+0HbaUBw4J/kmKZXArh/Zhd8LfcV6rOUtrw6NRPQBkExdxuj
	0UmqX5TmsUB9AqoUykBLu2Iu/U16
X-Google-Smtp-Source: APXvYqyluRFwuAtB0gji45zSgVr/PSJIYhhsE6k42J6EDUY/nCIUCAoe/jrNnMt+o2rWSTHhJyjuwQ==
X-Received: by 2002:a17:90a:8a98:: with SMTP id x24mr19371271pjn.113.1581311296849;
        Sun, 09 Feb 2020 21:08:16 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:15 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 02/16] xen: upgrade to 4.12.2
Date: Sun,  9 Feb 2020 21:07:40 -0800
Message-Id: <20200210050754.3534-6-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

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

