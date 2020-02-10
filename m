Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.17554.1581311305065279031
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cxdYEgC2;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E66D1E01711; Sun,  9 Feb 2020 21:08:24 -0800 (PST)
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
	*      [209.85.216.46 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5E19E016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:23 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id d5so3655458pjz.5
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y2ybYuwlHquRStztFzCysiHt1sHtWObfNnU5HiKXQM0=;
        b=cxdYEgC2TdP2N8fLgpnVZnsMt1GiqXh5vTsxKZotUxNoehyH8uWVs8Wi+SvUyQVxfa
         ZXhFCbdn4LdBdgBmHqzeSKKKovEnGqGAx3To02JMK5S0dK+Y4VE+x2MN/kk4PNq/qMh/
         beTegRrdjx4mYFm25EQggTIy3epQwNrQcYvKG5QZDBAPXGunkVimemE9E6BGBictmb9c
         2Pab3afIkFufBSNhL2Pme5nr8F8oZpPWwHHRWisTQQGt27Q6AN6Ve65OEIj/bS+cbMVK
         0xsCHW3t9hBiCuRK8V6bQTGt9v9OzANE3blXAztgs7GBr4Az7rJF020jaGSy6QuwqdA7
         wndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y2ybYuwlHquRStztFzCysiHt1sHtWObfNnU5HiKXQM0=;
        b=VcmofsLmx64T7hTIk75BXivNj1bmvqkDboPpHK50sSsBA9lzJ9dkwqZgeej8lWNTKZ
         E3svt4+Eqp3OC5sXeLaggpn38Ita2pzDGJFRh10k9zi1L0++hLHcQT/+XJGQgk/WSta1
         waWFKYT7Ze8hrYM1f6edUzw8FdnbDon/4HGU7lVk/7O/u2x3VYHAdESYOrZGOQxfzlQB
         ZZfv0Gx+JvZ4n0BYDpOh2r/TZrx0W0Fprk41AkoqQNE0CAYbM5zJgqpiChG7xE6WAbTE
         iv7XDFpBS1DsHAwys2CvfAJjBrWEkH4aH97zT2YJ55f83YRjYuU4Wwcii1z+hQSjcT5f
         zODg==
X-Gm-Message-State: APjAAAXMrRH71FQ9Gzr6Ru9xz2dBrFRiUkdPIzak9f633BM7cJXzLDhq
	ouWhg4Sz0a2jt2/JDObNlP3B0h9R
X-Google-Smtp-Source: APXvYqyJjPbGa8FLXcBQRdJP4mIo1+vKQJ54xPr815mm7XbJAWvTK8lvq4TOSYA+XsFdZ5Dk1fD6Ew==
X-Received: by 2002:a17:90a:9c1:: with SMTP id 59mr18390508pjo.65.1581311302295;
        Sun, 09 Feb 2020 21:08:22 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:21 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 05/16] xen: add RDEPENDS for xen-pygrub and xen-python packages
Date: Sun,  9 Feb 2020 21:07:43 -0800
Message-Id: <20200210050754.3534-9-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 63dd177..146e02b 100644
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

