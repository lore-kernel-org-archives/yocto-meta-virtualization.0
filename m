Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.16775.1582521560762270148
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y2PGMEG0;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CC56E01483; Sun, 23 Feb 2020 21:19:20 -0800 (PST)
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
	*      [209.85.216.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0136E00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:18 -0800 (PST)
Received: by mail-pj1-f68.google.com with SMTP id gv17so3639654pjb.1
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s1/6ExQKSic75SsI91x8sSO+u0t1bJGoWff2qEe6WuU=;
        b=Y2PGMEG0YRdX0QACsEPJogVzJtEC87W/yBiNo59ldfgCshhR4gFa3jI3KFGumYZpy2
         y346M9TT0LLPoNr8nB0qpeGgfWOfCCbRkIChzFCJNHByTzB3k1dUMw8bPsW99dPwz8+7
         z51KgZQi6nZOVQXk0NmULQQIuxuWIPHQDOvM+iz27X5+LRsI8MyxxMh4xMfVZm7SlE3T
         tKolOE17qZ7b6h57oZ+P9/ivNO38wlQ6lU0zTmnoA7iQPlRsErTI2FqEeVH7/KYdPDfP
         YPmY4rPPORiWPSNFdNXq4A/R3VRiutvmJhjmnCCfzNFtitY7lxLaz4a+AjSGDDZU+nOd
         7jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s1/6ExQKSic75SsI91x8sSO+u0t1bJGoWff2qEe6WuU=;
        b=fq7UoFlYBezb6qYK90hq6JSk1iK2q+Afhe6VsSE7v9cedydOEmacZeRGpL5ikSC08J
         N/9WDZvW2N7EuknFwIz680utsQS4lYTmMjEu9D/rEHnkbKkMukq6Ihj5hE1cB8NhxUvK
         wj1a4NgRSA7VwplOw8TYH3waqQOxtLeTb2g0xbxKjx2WNgnwuq7jlvAwajQePhH2GZHY
         P0K1KAlycRP81UaERKlBcAcvQPI3ltN2SLX/fjtWFoFk9/eTrZOT2Mqj0ltCDWDwM5Aq
         J5BlNIZLaYV86JtcmXzi+03detjn98i+wlvfmXgFgSiXCOYpeq3GgS5t21sigi/dAtQP
         p86Q==
X-Gm-Message-State: APjAAAV+M3wuqxEQbScYc1Ps35KDRDM74457ox1wFX1m12iLIPr9MJIc
	EzhQoXPMb+FZEoNBZabqs1VMSoF6
X-Google-Smtp-Source: APXvYqz/dslhzQdJ5v2P6BBy7IhxuOxMlsadyYXljaulGL6S6kiUHOEcy+Qw/OzJ5ekTpf38l593VQ==
X-Received: by 2002:a17:90a:3268:: with SMTP id k95mr18418355pjb.48.1582521557233;
        Sun, 23 Feb 2020 21:19:17 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:16 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 03/22] linux-yocto/xen.cfg: update Xen KConfig fragment entries
Date: Sun, 23 Feb 2020 21:18:33 -0800
Message-Id: <20200224051852.21933-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

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

