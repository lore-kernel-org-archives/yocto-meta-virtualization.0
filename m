Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.17598.1581311293959195952
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q8JctWrA;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7028CE016BB; Sun,  9 Feb 2020 21:08:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 512BBE016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:12 -0800 (PST)
Received: by mail-pf1-f195.google.com with SMTP id 185so3110663pfv.3
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=exEk+M++bdlgKc/oBnIE1LTFqpIuoJFiETPDi+4FxAE=;
        b=Q8JctWrANGcXeJehy6O+d0VMsYSHB8FchmVOOnBezfsaYAqhzwwX700MHZkPgf6orT
         zYH4SGg/d1w/0hw1yPgj6Bgofw+6fR5pt66GjfTAENw3URpYMVnsIrpHxnM6Ab6RtlyX
         t/quOLlTpowkf+1kDzHElo0rYm+I9VOGI/WRmn0VLJGJvju1sfKoafHlQWaF1B2MTlbB
         GqQvAh92/IwDgATw2Q6nZj6K3SmcHwzz3ZyuFhGQc62btRXHzcXW2mFrekQPuIRLvv48
         c7T8X8o8165diZgLN+ff9lgViD1mu4YnlRTC4P3JPtY1+UkcPj5EA8h6kIQb/kcCDcxF
         sA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=exEk+M++bdlgKc/oBnIE1LTFqpIuoJFiETPDi+4FxAE=;
        b=IPmjTrOTvycguy2/lQHI0f5rJb0rlQzZZF5dHwhoHYYR7IcdNfmg0tsDx/O2a0wRxe
         vlM2wR+vQvNbmQTgqE+rimDOuqTdXNtkl+ShWRILBtVzoz9zpus03P4cO8c4B0qhpO5Z
         Jw8tAdYG0yWbeYuaNFP3TjzqUzJziSP2q2GfUkcoLF3q/BfUogBkIwQUjnF80eEGtAVX
         sLpCkaU2Cjx5UtVpZFV+t6cFRsz0+TqIF3/qQ28VDNaOzP8S4AtDnsWJecKmZBTu7Izc
         BjdBj7h0QO0rEvSZakRHZ/lo9zmBYK3TMB30ztvX29AH4Z2iXaszIoTzgJfLmkkD/4KH
         birw==
X-Gm-Message-State: APjAAAWUGgbfbXMHhG22kmzq35oja1WOeFGPCA2genWHLPvVbeaBGesn
	oLH7AjcJk1bsrfIFKyYhl+tITaIg
X-Google-Smtp-Source: APXvYqy8OCqz5ST5m57IGD+SK1vwSjGZKG8ryXuyY6JGoxVcI1gi3A7Tfojf3BzXOucjCy77HkOCXg==
X-Received: by 2002:a63:9c12:: with SMTP id f18mr10286684pge.397.1581311291345;
        Sun, 09 Feb 2020 21:08:11 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:10 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [meta-virtualization][PATCH] linux-yocto/xen.cfg: update Xen KConfig fragment entries
Date: Sun,  9 Feb 2020 21:07:37 -0800
Message-Id: <20200210050754.3534-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Removes build warnings during kernel compilation.

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

