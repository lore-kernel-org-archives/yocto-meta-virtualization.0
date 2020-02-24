Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.17113.1582521567755733546
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G8jo6vnZ;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92555E014C6; Sun, 23 Feb 2020 21:19:27 -0800 (PST)
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
	*      [209.85.210.175 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD2BFE00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:25 -0800 (PST)
Received: by mail-pf1-f175.google.com with SMTP id b185so4734034pfb.7
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jMdEtCVovWwRaP2yKiEu7f2gEVClUWmQT4kq9SJcQvU=;
        b=G8jo6vnZd5rj5coWcCQG78heHbtmqHREWPB4aU9mzZ0qg84rk81DFnUL5NPBZH9YtF
         H3f7Sw3FBNT+fR6HAW62sJoqluaUvPQ6MLh6Bu8jHrPW1LXd+4j/ThPcBMw8fZi4A1u8
         T9FfIn23G3UCplbOl5fjGjOJ9xePD2h6QRowaiA5MZ47xt4XkxGK2QFvo9NHftTfOwD4
         TnOwIe4zDu4rEjLB9vas0I3jlSX2yjqWyzHG7rpp+gG3I75w19iTF9kDM7C6xZiZJ4cv
         uXFBSKaoYDcZb4ny6+9etj2Uc6rT19KpmG2Q6H6DvENFoAJHhPryO0syj8q1cuGtp+8e
         Xu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jMdEtCVovWwRaP2yKiEu7f2gEVClUWmQT4kq9SJcQvU=;
        b=eYMyoHw79JtFGeQBUwih9gpbFT0iRsJTBwlaB68ZPXU+1VSWK4l+zMC9kgdz0p9th7
         3OS/NpsrdZHTHyCxbz74pN2CJ73BFedZOM1uURLYH17H35RTydP7YB5MJnwGgpPuJO50
         VzSDGfYYuEZod4OTLWYpejqPbMR1nLkbM3YXriK66NDcP1QlanUBYG7x3O4cq3l69kAN
         1RoIPK0Clpzq18gvCiLEC5aVVRsG75ATt8OgEdJOQ61vBv3jzpctxy7lS4nigYNlC3OB
         YN+z5EBAPReCtGHD+ol654g0jOSapKT5jS7bek7iGdCbAqaqdOZKzZjuUIis5D0YokdM
         In3g==
X-Gm-Message-State: APjAAAV3VlNIwv6r0KTnHYKBUQccFJrrseilk6iielKQTY/1nz0zKQ+i
	6E1JjBiQfWRamLCGj00qPBWQe0G2
X-Google-Smtp-Source: APXvYqwzMf74U6Wi3BlzyV8nXI0yILHSpBfL7hZaLbX/XXN2wYfW1fggm6zU/NrFQBmMgDV3e2aUeg==
X-Received: by 2002:a63:7a02:: with SMTP id v2mr10352278pgc.13.1582521564924;
        Sun, 23 Feb 2020 21:19:24 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:24 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 08/22] xen: add RDEPENDS for xen-pygrub and xen-python packages
Date: Sun, 23 Feb 2020 21:18:38 -0800
Message-Id: <20200224051852.21933-9-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

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

