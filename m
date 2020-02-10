Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17790.1581311314818469276
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IOjDFxUO;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB894E016BB; Sun,  9 Feb 2020 21:08:34 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C001AE016B9
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:32 -0800 (PST)
Received: by mail-pl1-f193.google.com with SMTP id t6so2332841plj.5
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iDHAueZ/77mLPXnrnSpcr5kV2EHX9cRS3r0BposViPk=;
        b=IOjDFxUO+/LAhBl6g5TjyaXHeEllQ+c5te6ijo5Y5fjvcQ6k1QhQeOvyQlyyFkGlZI
         x4uJSmm3jxkEYIMAeicoWGXFEI+GG/omdfvZNTkrIWcc1aDgjagftTj5lz4MhxJ1z3D9
         B/pgjsjuY4LghYFbBSj5ag7WBDEYVmBzTCTD71Fpt2n5LXJNiePa00oSjoG8TwBiq7Nl
         WbNx709yIGIovO3f1Hv6nusXfpSDfCcjgaCfeObTLIQf9HQZXF7dqZJZCS1a0lnFJZAr
         OWpTeH6G9/RicLeyn7FLbaPimRbT7SGxFFRx0Lgn3uvKO583MIDK/ToVFIqWII9iinWe
         jrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iDHAueZ/77mLPXnrnSpcr5kV2EHX9cRS3r0BposViPk=;
        b=HvCH6XLQwZDGBlOlBdJLbLLnHORTHx2DViDgLdiSaWhht9LrXnWHF7ryVdv18D4w9F
         gS/otl1qACrjAs7uzzMAzEFepZRlJs7XGTUrl6stq75a0V36xBDmh4e9S6KN2uVb8mYC
         TClKjMrpeAYFD1zYo8wAFNi8s0bgG7nu8SKS9pWgCjnNYeguEj2swolrIw8iPFlJpROX
         2n2+jKJ8YTL70NR67n1vjnmz+SHmTB2pfE+UM0rqD9omhJVJYbmTDvjuCtAatHajtBLi
         KmlcaxljTkKg7b9c4xfJHEnhkg/4UBSKFxVNzglF6RwFrBIcYWfcb623JeVnhImdo8gT
         eK3A==
X-Gm-Message-State: APjAAAUwmI4QF+yJFXho6gzRAZzIpxJyUZxmhfqa55XRP8vvBu+c8Oet
	5cmJQW6dqK2z30xdu3T7KuZFhX2f
X-Google-Smtp-Source: APXvYqxrSdohC7FBUwX2ow9181t3cEn4B9Ylc7qMXch+Rr7hSHHAyYdU1GqXmdpI7Z8qs0G1ywcJ5g==
X-Received: by 2002:a17:90a:fb87:: with SMTP id cp7mr18577132pjb.56.1581311311854;
        Sun, 09 Feb 2020 21:08:31 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:30 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 11/16] xen-tools: change globbing to fix syntax highlighting
Date: Sun,  9 Feb 2020 21:07:49 -0800
Message-Id: <20200210050754.3534-15-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Fixes an annoyance when editing the file. No functional change intended.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 5b0a339..e166c74 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -197,7 +197,7 @@ FILES_${PN}-dbg += "\
     ${libdir}/fs/zfs/.debug \
     ${libdir}/fs/reiserfs/.debug \
     ${libdir}/fs/iso9660/.debug \
-    ${libdir}/fs/*/.debug \
+    ${libdir}/fs/**/.debug \
     ${sbindir}/.debug \
     ${libdir}exec/.debug \
     ${libdir}/xen/libexec/.debug \
@@ -346,8 +346,8 @@ FILES_${PN}-libfsimage-dev = " \
     "
 
 FILES_${PN}-fsimage = " \
-    ${libdir}/fs/*/*fsimage.so \
-    ${libdir}/xenfsimage/*/fsimage.so \
+    ${libdir}/fs/**/[a-z]*fsimage.so \
+    ${libdir}/xenfsimage/**/fsimage.so \
     "
 
 FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
-- 
2.17.1

