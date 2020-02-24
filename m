Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17119.1582521570571809967
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hZc9O0cS;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B2E3E01483; Sun, 23 Feb 2020 21:19:30 -0800 (PST)
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
	*      [209.85.214.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15DADE00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:30 -0800 (PST)
Received: by mail-pl1-f193.google.com with SMTP id t14so3556133plr.8
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QniVLW5HTbRPxDMWn4H/terzLA8kdMfO+D1fUPsYDPI=;
        b=hZc9O0cS9VxquLTIDJcPiz+iloW7OgzfML48W9e3nFrsnvmhE/WIZQL7Ha8hBcGxqY
         YS8Dafg1ItR54gqw3GR/PiRw74w02e3utkFjICziwE/git414p/wyXMAzL8HaLjnzlWB
         Dk+SxOc5P0Sk9+AeFqWSE1jXbx6vUCbUJrkPPZQavr07tslI/54A7sVjz+yv0GY/Zbm0
         9MOYtGFiemqsNl3L84iqCruulPvifwNkqfXFiJEpzv8tlGeC35XPRnDWdEhfyA2Fwa3L
         26hyFb8+gP23/qmttqm30ZoanYZadEIRiTd3+lTXEKZXjFmaFUESsroVp1CWwajPmEh1
         6d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QniVLW5HTbRPxDMWn4H/terzLA8kdMfO+D1fUPsYDPI=;
        b=kNuESrTLvC5s2UYIEk41ObrveUV/iL2rklXjeHOXsIdRVPgFzT+brJLQ4ssRKKWyqE
         KB9weswl5EY/S7ee7dbEW7ZQas//H+LBIrbADiDYfhU2MwCqfttfaHZn7u9TFK+zWUde
         E5xl4LBCv0qnIKm98WDGglvJZIZSBXsP5QSMXPenhNYWeyn35B8hSbvcHmWOzFj6Trmc
         VXuQyLYuw1J+OI4kW3ivlMvVBNoWFs1U82g2CWXuk9xbgt1G7XUePZCCr4uhapQrcVIX
         pTJZW/XkpWrBG8M969XYqyWp/Vi/L+nEgriungNRQIeO+eIafYryTqBpcspyioS9/3f6
         YRrQ==
X-Gm-Message-State: APjAAAV6wpjCd76CX3fpUJ9PohM17KVnOAs85k2weIUwKsCcWg9JymXE
	WRD/CqXUgus9gfily2ZkQ6E+LsaW
X-Google-Smtp-Source: APXvYqyUPvG2ZuJflz+CEBHLFlLNpOi3VlttFXSbnDZoqq8YEexGwcwU+rksC3fH2fCRSf8r6yQo0g==
X-Received: by 2002:a17:90a:8b82:: with SMTP id z2mr18803787pjn.59.1582521569213;
        Sun, 23 Feb 2020 21:19:29 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:28 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 11/22] xen-tools: move xentrace_setmask into the xentrace package
Date: Sun, 23 Feb 2020 21:18:41 -0800
Message-Id: <20200224051852.21933-12-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index f37968b..e012020 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -544,6 +544,7 @@ FILES_${PN}-xentrace = "\
     ${bindir}/xenalyze \
     ${sbindir}/xentrace \
     ${sbindir}/xentrace_setsize \
+    ${sbindir}/xentrace_setmask \
     "
 
 FILES_${PN}-xen-watchdog = "\
@@ -578,7 +579,6 @@ FILES_${PN}-xm-examples = "\
 
 FILES_${PN}-xenmon = "\
     ${sbindir}/xenbaked \
-    ${sbindir}/xentrace_setmask \
     ${sbindir}/xenmon.py \
     ${sbindir}/xenmon \
     "
-- 
2.17.1

