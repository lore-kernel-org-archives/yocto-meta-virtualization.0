Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.17552.1581311301278413880
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dvyba4oB;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 293F4E016BB; Sun,  9 Feb 2020 21:08:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D65C9E016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:20 -0800 (PST)
Received: by mail-pf1-f195.google.com with SMTP id j9so3096524pfa.8
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lZlOK7N7v6InCb6oYZli3/UOh/Sz73X6I2GEKOw37h4=;
        b=dvyba4oBx73SMYKMFLG4a/sY3SVBmUwvANlJugKFpqnm7weQYLWZOvGA6MrvMoL7f/
         mS0ofBibSg1p6l+k1sA3BirowYLTWYZaDqE4ES/gywHD/FOmuQd3F46ejg1/UhQVH0t/
         Vv5KTrf7n2iLY3lGaaQrFAU7CgOg3RmmYyNwoB/6UpR7rH/Y3AeFdwOtsbfI1iA0s4Mw
         1MfU3zQFYH0RqrHV3OpXIhNX7BrpJPRDex04NQRp12yJbF9FumEW5/W9bi25GKvlGTS+
         cuXmbHoZaGyv9ilMvVgpKdTpfvt/mFoaIStOtJnkE6eRvtFkLIHKmgXrjCWHkZDO9wKd
         B7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lZlOK7N7v6InCb6oYZli3/UOh/Sz73X6I2GEKOw37h4=;
        b=r8Stf3IJxGfxiM78Ka9bberGFU+8EkOlFmLkQdF15lyefzv55mtUeYqtUAgpQpgkbm
         LSVkUv6Ip3nENw2AoeWP42HS/lY8wlkVyXAGAs1WPYw803t4rL07/w5skTzApGquPeKb
         pdDSt27fuDspltcw87DAN4VvXVZwWqbECZqjuz+IAoNO5y1qwAd83dHUz7mW22RkUMS9
         j3zgPn7THDmxiceApA0uaHQwx1Wsck76il2cblK8GUUGUNQ3vCvZIQE/l4f/+FmWmXKM
         5eRZh3mdWukgpIxkI2tCVVFtzxWQ/tw7k6M3QQ6LOmXr+lIrow2arq+3J+5zYuQKzNv2
         mFFw==
X-Gm-Message-State: APjAAAXdXb6q6g9/D1Ocf41P1SkLyrbtYxEwjXs1Yd4Oy8BAeSJj9EiI
	9K3GGoGGDzn1XYRrlyNvwe9iApBL
X-Google-Smtp-Source: APXvYqzupjewMm3Hl8yq3+rL275S5k9e8MCSvJcRbfafu09LjAxBWvZc+uolPAGsVUnbUBWWzJW6eQ==
X-Received: by 2002:a63:9dcd:: with SMTP id i196mr12281202pgd.93.1581311300213;
        Sun, 09 Feb 2020 21:08:20 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:19 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 04/16] xen: package the EFI hypervisor binary /boot/xen.efi
Date: Sun,  9 Feb 2020 21:07:42 -0800
Message-Id: <20200210050754.3534-8-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 9bf2ab4..63dd177 100644
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

