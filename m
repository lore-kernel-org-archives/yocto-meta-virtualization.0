Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.6444.1593482140901450099
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Jun 2020 18:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aaKNEjoL;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C233DE01DBE; Mon, 29 Jun 2020 18:55:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F78BE01D76
	for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:40 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id e12so14442404qtr.9
        for <meta-virtualization@yoctoproject.org>; Mon, 29 Jun 2020 18:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SrGI5d+AUs3FRFItlx7kfp2P08QTPVFQh/pN9xsrZ40=;
        b=aaKNEjoLaaPmdIIY23qxABhZ/cLeBJxW2Roru8cANbK79uEQkzdvSWom7EfVDJQlHq
         tA4Wb18Vqaza0U3omRModvYvcBL6w81mJOdvDUKps1Pkecd7givFZkUJPxJtNSpMU2as
         InoQCgNdKYzD52f2s6fX6G4k67Xh+MC7Ko1TVTw++MsxCw4g55iVUTpitTAbbrMuNGWc
         Dp9Ud9ZeGYIafRlMQYrPwpMV0rh6wZKEsYfq8GTwSs50ORsSMDhUixua67PB/jZMKKGQ
         LkifhIRLafo0f11C2RipHOUBYjm+HfJ5ScXgv8eXOJkQw/T0aRMFqSDQjqPrW4ENWmbu
         33iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SrGI5d+AUs3FRFItlx7kfp2P08QTPVFQh/pN9xsrZ40=;
        b=fnxpSIYfij7t1h60Ebykrbf73MsHrohpSPCMz8OvRTdEcMGb06QBi0H7vCXR0oYtXV
         N7U0HktpPm/C4a/PWD8Y8ep9Kb1Vaq3BwxtK97RBwivOmIB05FpAt4elwSNnUEaOyE3f
         Ym97LsX0CmVVvA6cWi86Zyznm9kSYegjzOYNFENqPx6fr/EedeiRh3krYYZRZPKB90FP
         np/Tt//jxMw/teUbU2ttp3gf2HgXtNy8DcP4v3hOCOGKNhxuInK7Ff6vxjTgA2Akw2a1
         JHPWn9Ley2eiXovrKJ9Eab2AbsfACFGMWZnlZolPSWCbbbP8nmqri1sfMj5xswF0zDSI
         y0GA==
X-Gm-Message-State: AOAM532dyhBsON4weH+SM1ycGZBQLXvdMC9LfCqGS8THoicNED2i8vj0
	bUL8VTp1dGt2SBwbhNu8RjWJrUTpiFk=
X-Google-Smtp-Source: ABdhPJyO441f0RzU0MI1lx2m1el8vtWxul6tsLKLtYbE7n6rULd7LveiPUTQyXGUKqJKXVdnya+f9w==
X-Received: by 2002:ac8:7768:: with SMTP id h8mr19180898qtu.232.1593482139767;
        Mon, 29 Jun 2020 18:55:39 -0700 (PDT)
Received: from localhost.localdomain (mobile-166-176-186-179.mycingular.net. [166.176.186.179])
        by smtp.gmail.com with ESMTPSA id t48sm1841794qtb.50.2020.06.29.18.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 18:55:39 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com,
	Stewart.Hildebrand@dornerworks.com
Subject: [meta-virtualization][PATCH v2 02/11] xen-tools: add RRECOMENDS qemu on ARM and x86 when HVM is enabled
Date: Mon, 29 Jun 2020 18:54:45 -0700
Message-Id: <20200630015454.10151-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630015454.10151-1-christopher.w.clark@gmail.com>
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-tools.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 8b86f7b..c0e54b1 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -53,7 +53,13 @@ RDEPENDS_${PN} = "\
 
 RDEPENDS_${PN}-dev = ""
 
+# Qemu is necessary on ARM platforms, and to support HVM guests on x86
+QEMU = "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d)}"
+QEMU_arm = "qemu"
+QEMU_aarch64 = "qemu"
+
 RRECOMMENDS_${PN} = " \
+    ${QEMU} \
     ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
     ${PN}-flask \
-- 
2.17.1

