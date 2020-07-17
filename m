Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2356.1595019861337876011
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 14:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m7nyE1MB;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36697E01EAC; Fri, 17 Jul 2020 14:04:21 -0700 (PDT)
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
	*      [209.85.219.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12C61E01EA8
	for <meta-virtualization@yoctoproject.org>; Fri, 17 Jul 2020 14:04:19 -0700 (PDT)
Received: by mail-qv1-f65.google.com with SMTP id h17so4863070qvr.0
        for <meta-virtualization@yoctoproject.org>; Fri, 17 Jul 2020 14:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S4yarpLcBcuJ/Rvym1Km/BiVSHWFUPd1yXFbPSWMcz4=;
        b=m7nyE1MBDa3o00jYvVRJ1SEbcHtp0Ftg3Xnp5+T0hgDwFhAapMHHQZbI9CNV8Sa5W1
         5aY+qQF8OUlTQlauOiGaGO/rDllEMrOO+BchdTITS/rOGSUmkPzk182PmVGhAeN60xUR
         qPzCf3aNo9McAB5wovUPfWgPK5DhJL0VQrPjHT7Ewo4rWq8wXOg66IDF+1lGIxjk5nKa
         6ULIhDNT0Mtgd9zal59HPuQTuUmgSQiydBsqpv9+Gk62GjTsiep5+mnIrMHOO05Sv8zb
         yKyhLR4StnyJQXE0x3WLFCTklldHxBV1r7DjcBgbfjcVKB5d/ZIgf++DG+qYGGfdh/lS
         TzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S4yarpLcBcuJ/Rvym1Km/BiVSHWFUPd1yXFbPSWMcz4=;
        b=cPG2unWG3fM7oGCMx6/vnr5ZIieHk23VA+8z+lgfDKcGigRat9+XANGuYFel0xBlaL
         e+zv5LyNsmzLIGkdfHEyvajRwFw9MvTMbsBbm/x1TGcZhYQ2sva1lntGp4NDtL1Ijrv2
         zwW/qJbBWb7uPYStz7M9En+8HlnMlTkeVQxuUMw8Qvl8RKYXkVR2Rhx7c0k0Uplzq72U
         2e9z385JlwjdRj3M+qOi0jD8rEsuPeyIX5LOzNYDkMw3yrxUczFRe4Qo1mGAfuklskiC
         v2WXvmLH56M4Nk4wuH1uOk56JzAUQcXfEZZkqFRqY9TCfFVOvfN2kjSC/mhKfxf1krXJ
         /fcQ==
X-Gm-Message-State: AOAM530EznS9sBem2r3uWEQTXxODmmbgGkZIX6lBU8bCFvew+eNSnm9y
	L9BEoy1Wz1m+eZ0rsJC0q01CUp+8OOM=
X-Google-Smtp-Source: ABdhPJwCeh5aACZUehkQ4pkG3bNbZHF/kcBTS5z/9+yR673kPp42PgKrjy0baIn1v944/7Isoch8Dw==
X-Received: by 2002:a0c:fc42:: with SMTP id w2mr10727115qvp.57.1595019859294;
        Fri, 17 Jul 2020 14:04:19 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-137-177-108.mycingular.net. [166.137.177.108])
        by smtp.gmail.com with ESMTPSA id y45sm12819387qtk.19.2020.07.17.14.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 14:04:18 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	Christopher Clark <christopher.w.clark@gmail.com>,
	bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH 4/4] xen, arm32: filter out unwanted tune flags from CPP as per CC
Date: Fri, 17 Jul 2020 14:03:49 -0700
Message-Id: <20200717210349.16459-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717210349.16459-1-christopher.w.clark@gmail.com>
References: <20200717210349.16459-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Avoids passing the wrong floating point ABI flags to the linker.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 58b57e5..3c1e3b9 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -193,6 +193,7 @@ do_post_patch() {
 do_post_patch_append_arm()  {
     # The hypervisor binary must not be built with the hard floating point ABI.
     echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${S}/xen/arch/arm/Rules.mk
+    echo "CPP := \$(filter-out ${TUNE_CCARGS},\$(CPP))" >> ${S}/xen/arch/arm/Rules.mk
 }
 
 addtask post_patch after do_patch before do_configure
-- 
2.17.1

