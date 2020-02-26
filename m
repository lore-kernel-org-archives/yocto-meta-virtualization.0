Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.183.1582676222211544125
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DpFeg12Z;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1555FE016E9; Tue, 25 Feb 2020 16:17:02 -0800 (PST)
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
	*      [209.85.214.178 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9092E016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:59 -0800 (PST)
Received: by mail-pl1-f178.google.com with SMTP id y1so510037plp.7
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uCcaBqKK66Bc8QYqhpcxPa4QICA1QiilWk0S1Zs3OaY=;
        b=DpFeg12ZBPHIKuJHTM0X7Go3t0ictOXz/8jJdjlZbCDzFvbmCGA/qste4OD9GqPwb2
         8/TCFc92c2oJMjTSGvUg4wZW6DXjejxEthO+6rlxueFrN8RWymFL2ts9Qf7x1INJcVEu
         EWjEEsPtcrzu4tnvKWP18iHaawSiSS8FQ8x8WaPewK8fDmJcSYHmY/ABJGtozk/wQggu
         vK9CMoRbzQOfdNewuLbsIVD+SQQnZqINeee5VtjufIopHVL2aHuA4XZjDQooIEcUcpRM
         Ov5H6cP6ufydIU5N9135iM0MA9ukO+soab8177dzRRJ2eAS7r2RuSIvinZqPMrQDnAyV
         fEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uCcaBqKK66Bc8QYqhpcxPa4QICA1QiilWk0S1Zs3OaY=;
        b=F/zzV4p0Ff6B2Zf0LyFh0TWH+aQ8hfJY+4MJDJdch9MQ27wp8T9AqUlb9J6g3OBhNZ
         TCPEOvWawo5usFalA7PY9zv/l/H/nRBbNrLAYJHToGbekK+OWhSJ5CR/aTTH8ChBVqMD
         W1qhfUav1IzhKc1MI5PcB8tBxU0ZULiyZR01KoeQf/0DDqMJUYbjUrksL8x++9suIl/9
         JA3g5CagJ3CRkkHCORxJP4YiZFhgQufJsSnXb+fo9YVhSM4+cOtSoahU3E0AyDnMVheZ
         oXdbSMmhVGK0PBzKvjsrixhBmujmIa2Qpznxp54kFO3eltoSn1WAoM6bsR37KC17gK/S
         8GEQ==
X-Gm-Message-State: APjAAAW+4Hu+xzop57t+rkpFjAHyt40Grr+VaJq2OlEDdEE1LbTFN4it
	YQWKOoDzlwrD0HQim+dsmz0rD8Vv
X-Google-Smtp-Source: APXvYqwrU3cjDzSHf7AWfjgHABBBvHnamR5ljPS9/cEr2irNX8jpjiDD0TCaX1z/ekMCvUaoowNRAg==
X-Received: by 2002:a17:902:7203:: with SMTP id ba3mr1073591plb.249.1582676219008;
        Tue, 25 Feb 2020 16:16:59 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:58 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 19/22] xen: add contact to recipe README file
Date: Tue, 25 Feb 2020 16:16:03 -0800
Message-Id: <20200226001606.14750-20-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Add myself as a contact for the Xen recipes.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/README | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
index 3686530..5592b48 100644
--- a/recipes-extended/xen/README
+++ b/recipes-extended/xen/README
@@ -1,7 +1,9 @@
 Xen
 ---
 
-For any issues with the xen recipes please make sure you CC cardoe@gentoo.org
+For any issues with the Xen recipes please make sure you CC:
+ christopher.w.clark@gmail.com
+ cardoe@gentoo.org
 
 configuring the hypervisor
 --------------------------
-- 
2.17.1

