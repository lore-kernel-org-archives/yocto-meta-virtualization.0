Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.17463.1581311308374576395
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gJonnbe9;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3AA69E01711; Sun,  9 Feb 2020 21:08:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.216.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAF09E016B9
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:27 -0800 (PST)
Received: by mail-pj1-f67.google.com with SMTP id ep11so3660793pjb.2
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QniVLW5HTbRPxDMWn4H/terzLA8kdMfO+D1fUPsYDPI=;
        b=gJonnbe9q+dXnel4rQJc8NpmtA+bs45lVG8T6xOUE1UZQZx9qUNDyhiyO4l345/fuS
         1oM6w7yaeDxNXVb/xOCZRhLq9shM/b/mt3/nhz+TeHwhDTeYx0FlSn+yl/fuw+8NWj02
         U+eK18YInP+4QiJps6Z3nkB0GhT1/MBL+jfzFjy+9dN/vqXRgCgKrJaLHSFznayXFj5G
         5kiaaE22a/jv1/aGqal/06EoqiWIbP/dO/FJVWCRW35eYuAvoM0Pl8aPRHrYgaOC9BZG
         xDP2CqoSgU/OHUMkgavQ5UWqK9e1gjzzP/uztBGWrF4LLidtiHBOzo1LlbwJNHmXnBn1
         U38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QniVLW5HTbRPxDMWn4H/terzLA8kdMfO+D1fUPsYDPI=;
        b=tQMwm6qnYrYAJISL/4f+LXEgAqaEWM5WLIEIT2+DdJzLs0NFxx8SPvrzZcrVx+wbR6
         RyKgf3bOFGCvxSmc1MGC/QUYnhWAmD68mqqoie5B1fmV8JZYnbcjTo58vDy9uxvjHDbx
         V56IlYH0bwgonJJwUyfCH/w0KFZ/8Do3zYD+q6TSijjn3eL7GrJ90xBnBOzuF2e1nUZt
         VhnmL0GQHLwtYYjrW1+0DpkSbupYGCxq1nfLGQGbSnOPf0S4hS/C//21vli5VamWckoD
         DJmH/ANXn4yGm71v+I7uUDSdlhrySd/jqDybjOCLHvaJP1BS9Pi7ONnV3H8l4rId6Fyc
         sHCA==
X-Gm-Message-State: APjAAAVaiw6LmrFOdmt9MwNd80ag5f0baVo/Kr02cRuaayXqpAJN7Fr9
	NmtQllKcaGeZpcLYQh1TSNk8gVKE
X-Google-Smtp-Source: APXvYqyDyfyFm6mY1CUV0cSOy7fbQvsTwF4eOfHu4kGJej2Bv0ut447hAW43gHJSlQLpSZOZQmXD4g==
X-Received: by 2002:a17:90a:c691:: with SMTP id n17mr18619900pjt.41.1581311307144;
        Sun, 09 Feb 2020 21:08:27 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:26 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 08/16] xen-tools: move xentrace_setmask into the xentrace package
Date: Sun,  9 Feb 2020 21:07:46 -0800
Message-Id: <20200210050754.3534-12-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

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

