Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.6448.1593482144212133483
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b1kBWVzP;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19C20E01DBE; Mon, 29 Jun 2020 18:55:44 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.193 listed in list.dnswl.org]
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4F59E01D76
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:42 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id d27so14479652qtg.4
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NumlpwTiGICU7vMthgfZ/Xmyi6tWBmxNLgVPFpXAHGk=;
        b=b1kBWVzPTniuNRBUeTkBUaciiPw6slzESka0BbiAdIJqUmOGVxajZ5SGwgZyDC9z29
         oy4MA5uPWr7XzkbTH2Tj018VyVI+EOHV2NkyfwJ9iyNldfBF1Hx48JxH3Pj0/Gp1mGb3
         C073Jg2TglVE0A1mn66nAdBjWr0DOMAfvaHW/aDMP2LRK2w87naOqIb6DUufRygaLDyo
         +2NPEpDpmTIk4ILVYiPGM0hZdumnyAiAG2cr3W5ShSEpqBk3cULHRk7qZoeSRbbjVW2N
         ZbavMvDeE54lnZFSFC0Cetb2Qe0s4WMcI3rZg2dOJ79P9Sns2N4LcWTNIUJmUeLD32eK
         5NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NumlpwTiGICU7vMthgfZ/Xmyi6tWBmxNLgVPFpXAHGk=;
        b=sCbCS2F7iX0GAEWwQ7DvgrPxeFIDZe7nWGLlSNTs9qdKyFRt0lgb+Z2wuKTqxK1jem
         jwXZOaICGR+jV30nUun4FL0/IeoFQcGlYsYGhUaVuNnI+TEbTIDj6bGcmIIBIb8PW8gv
         SoW7kEj4m/ah4z55NK+ONwt2I8hLN7cgPLn2GLJqwe7tNNStYQjANFGlcQ0VITSI+eh3
         eSmhy/DeWohIvwsZ76xnvKB84yNELNcQRw852ABV+A6Hy4ZFxE4e83IbDPrnBs3Sn8np
         Wi/XomjRuHMO9rew0cekEVwTadhpzMqzhTiFgjjgp6hX03C5QjzYJHJaKeBzSuJaU++5
         tMjw==
X-Gm-Message-State: AOAM5315NB+JzvdhZtPew0B2iXRU1qbARYYPNYl50y32rr5oVDVD7riA
	eeFeXtOxQ6Qj5XLLjkmaQtpcldNqhEQ=
X-Google-Smtp-Source: ABdhPJz7DYFe6aQrFJEqlxxGZHHslip0WxiaxE4DWT5kkLSDcnBbX/ifwwzoLuyem5drCb49fiv7tQ==
X-Received: by 2002:ac8:6602:: with SMTP id c2mr18543942qtp.243.1593482141946;
        Mon, 29 Jun 2020 18:55:41 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t48sm1841794qtb.50.2020.06.29.18.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 18:55:41 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH v2 03/11] xen-tools: use non-busybox ifupdown tool if available
Date: Mon, 29 Jun 2020 18:54:46 -0700
Message-Id: <20200630015454.10151-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>

Adds: RSUGGESTS_${PN}-scripts-network = "ifupdown"

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Suggested-by: Corey Minyard <cminyard@mvista.com>
---
 recipes-extended/xen/xen-tools.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index c0e54b1..154e224 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -113,6 +113,10 @@ RDEPENDS_${PN}-scripts-network = "\
     ${PN}-volatiles \
     "
 
+RSUGGESTS_${PN}-scripts-network = "\
+    ifupdown \
+    "
+
 RSUGGESTS_${PN}-xencov = "${PN}-xencov-split"
 
 RDEPENDS_${PN}-xencommons = "\
-- 
2.17.1

