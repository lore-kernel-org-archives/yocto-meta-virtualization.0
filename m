Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.4674.1593065102829881538
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 23:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BpoRAkIO;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9897E01D78; Wed, 24 Jun 2020 23:05:02 -0700 (PDT)
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
	*      [209.85.222.194 listed in list.dnswl.org]
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 336AAE01D75
	for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:05:02 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id e11so4341911qkm.3
        for <meta-virtualization@yoctoproject.org>; Wed, 24 Jun 2020 23:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NumlpwTiGICU7vMthgfZ/Xmyi6tWBmxNLgVPFpXAHGk=;
        b=BpoRAkIO6v3wmvkgSLaeE+1u4skjftmfrMjW1Ntk+vEgDKVgatRYKhy7Mia2Z1H0pM
         dzxrbs4BEqiWEuEmCn44TWgxNdwEBHMLojcQABWE1ISA1WWdxB3WbduS2uYqKWltq712
         sZalLteY6kavIob1DN6geh1zlHoxJvN+uwsRJ8cqmycFi4aKjL9m/eAmbWVn8Xm8Xzyw
         5QEdZ1wPAjt6UhH/uyif1phWWeByyfTdecxROQqXhJQXvJNX7NQ84JSKZ5Lz3xZfcKGQ
         CdpgtqwtqkKhjMdakWf2bbH8GONel6clXo+M8mqxCqr95Xof8fO2nx44+nMwZpjjNLO8
         SDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NumlpwTiGICU7vMthgfZ/Xmyi6tWBmxNLgVPFpXAHGk=;
        b=LgNOxLPPkrOLdznM2nLTqSJVvqW3KS89JGMfGmvmaAtypljSa0/2XuPU0fiQP071lp
         m1QP1AIpC0a436F2eXtbclnhbpcGI6A//korDrO/T/E18RzZeDjKFWSVxPdchdQoBOpL
         4HpZSsyPFrYg2TaXTLprh+GYbMQCVBZgLm+sQ9awAo8vDqLQBOxkpCsIjoSsXO0XqrWT
         keFb/ffGTOIDqEKBZ8utTT1oMQ97CSdOmxvwuDk7tm9PbkZGA724Vzru/u0ateUSzO0n
         egg++2t3guaYkmAiYaPVbNHBB+uBPvb/GQKq/kL7JARAwV1T1PmMzZenoKkWfFylB7hc
         kx+Q==
X-Gm-Message-State: AOAM531SXGKzeSVGYReRMCgZqrIKCXDBxCY+h/9Qv9fk9sMsAb4LTLCl
	CcNpn9RnFiBm62ox1XYqFmR/t5mSI+Q=
X-Google-Smtp-Source: ABdhPJwsvF1OnDyvis3ovmn+K+L2ixWAS2TILyCm4VtWptAfELkp72G4JEqoQqBj3xLqdgVFq5AmCA==
X-Received: by 2002:a37:a196:: with SMTP id k144mr26457237qke.329.1593065101298;
        Wed, 24 Jun 2020 23:05:01 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-184-6.mycingular.net. [166.176.184.6])
        by smtp.gmail.com with ESMTPSA id g5sm6059161qta.46.2020.06.24.23.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 23:05:00 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH 03/10] xen-tools: use non-busybox ifupdown tool if available
Date: Wed, 24 Jun 2020 23:04:24 -0700
Message-Id: <20200625060431.31826-4-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625060431.31826-1-christopher.w.clark@gmail.com>
References: <20200625060431.31826-1-christopher.w.clark@gmail.com>

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

