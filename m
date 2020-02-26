Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.167.1582676194772050278
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZuNrtmao;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A19E9E016E9; Tue, 25 Feb 2020 16:16:34 -0800 (PST)
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
	*      [209.85.210.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39CC6E016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:33 -0800 (PST)
Received: by mail-pf1-f193.google.com with SMTP id j9so447850pfa.8
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s1/6ExQKSic75SsI91x8sSO+u0t1bJGoWff2qEe6WuU=;
        b=ZuNrtmaoSNYPQzssTCGHg2Zxsu2put90qVcKoYh/5YsnI3Sq63KMhdwpc0A0GXEGxP
         wmBzE5Fqa6wV0UoYWerhRW4qBxPKc8nvk06YNrDPwFDl5V6qfMRIWx0opfTwnDcI7KUl
         0Brl9LbrWHZGtm7/AaaoqtGJ3/R+ULaS9lJarPYNKJdm1qFA3+9RqoyYjMTB3NCFzH8l
         wXvr2ufnOCRbomWQMVG/YLDsWorsj/n0LDM6lasG1NJGOcvHxjXY2Dx1ViceFPutRRxi
         0Syo8FAgVziUONflvt4nv++8W95wE+U9ODvNR0J9Un7ZMGqUBhP5ognN9SsZCzFEjPi2
         PKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s1/6ExQKSic75SsI91x8sSO+u0t1bJGoWff2qEe6WuU=;
        b=ZmIsdrpcpZfi1HoyKWae6IEyaEg5RMlo0F7bV8yEsJpUuhAxFPg+NrvCNGNfbtPRYg
         MeCGYdS5rPo4Tujc/VLfCYD0fbFfyOj9tG/V1ZBrfiYreTVPKtSPtiv2x2Sr1wNEbCPX
         alGa20doHGOjWKT0/DBqvNIwDqaj5PyCx2rx74Kf71rXIOca5lqRN9zR4Pr/pqZJJxst
         /8L+8aEE7dbh/9nTEV1pHJsyKJqB0B1m9dRUUKDblzAQiXbX1F/Gml1yI+9Qf9bFwic1
         q4A2sBhXSCKoaYyGenRh2CIVOg7MPzF07+XD1bufDoX22QzgVe021ExpO6xvfskWcaYk
         C2yA==
X-Gm-Message-State: APjAAAX4KUQNL7B0SIBvCOLnCENpwrT4iKUZmLEQ1Gq0hVbBzb/MoCAK
	MQ/s5sd5KA5ZU2blannVeduDE4iy
X-Google-Smtp-Source: APXvYqz+761XGg3LxPMvUof/2z3CDxh0jLgaGpaqiabHM90h5VaHNDewRQQO9Z+h6UHWrJqRxGbUcA==
X-Received: by 2002:a65:53c9:: with SMTP id z9mr913957pgr.405.1582676192459;
        Tue, 25 Feb 2020 16:16:32 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:31 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 03/22] linux-yocto/xen.cfg: update Xen KConfig fragment entries
Date: Tue, 25 Feb 2020 16:15:47 -0800
Message-Id: <20200226001606.14750-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

CONFIG_XEN_MAX_DOMAIN_MEMORY has been retired since kernel commit:
    197ecb3802c04499d8ff4f8cb28f6efa008067db
    xen/balloon: add runtime control for scrubbing ballooned out pages

CONFIG_XEN_SCRUB_PAGES has been replaced with CONFIG_XEN_SCRUB_PAGES_DEFAULT
since kernel commit: c70727a5bc18a5a233fddc6056d1de9144d7a293
    xen: allow more than 512 GB of RAM for 64 bit pv-domains

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-kernel/linux/linux-yocto/xen.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
index 4780311..af821d2 100644
--- a/recipes-kernel/linux/linux-yocto/xen.cfg
+++ b/recipes-kernel/linux/linux-yocto/xen.cfg
@@ -3,7 +3,6 @@ CONFIG_PARAVIRT=y
 CONFIG_XEN=y
 CONFIG_XEN_DOM0=y
 CONFIG_XEN_PVHVM=y
-CONFIG_XEN_MAX_DOMAIN_MEMORY=500
 CONFIG_XEN_SAVE_RESTORE=y
 # CONFIG_XEN_DEBUG_FS is not set
 CONFIG_XEN_PVH=y
@@ -30,7 +29,7 @@ CONFIG_FB_SYS_FOPS=y
 CONFIG_FB_DEFERRED_IO=y
 CONFIG_XEN_FBDEV_FRONTEND=y
 CONFIG_XEN_BALLOON=y
-CONFIG_XEN_SCRUB_PAGES=y
+CONFIG_XEN_SCRUB_PAGES_DEFAULT=y
 CONFIG_XEN_DEV_EVTCHN=y
 CONFIG_XEN_BACKEND=y
 CONFIG_XENFS=y
-- 
2.17.1

