Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.173.1582676209989540245
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=amVHlLcT;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5461E0175C; Tue, 25 Feb 2020 16:16:49 -0800 (PST)
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
	*      [209.85.216.51 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDFBCE016B6
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:48 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id fa20so472797pjb.1
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=94toTxN8hQ2nuR/rMwCVMtEmzu/PwaTUOi2X04Go/n4=;
        b=amVHlLcTnRDLbP+D5NYutXCcrxFloCjp/vFPzmuU1j/zLtnsDeZ3YoOqzXyyVhEelW
         MPgPCUNPYcbexsOlEe/rzgeH3aDOGhu0wBNvL291uYbk8qqlXGB0tRVjCuvZ2opIyi8Q
         Q2rNhETeEbw73xFytNdb78F+DS39ZzYzVyXk0abCqCo7qhDEa1H/l+Pz217W8wZTQgEH
         4ZQIaDNFElSC9XCvK8t/gWLVuE2EhkMWeKYTUo03lEGzuGYN/kWhmuZ58z9nF5q98KUy
         p4nCYcw4DaeoP8Bs5/6hIDv3BvEBaqdbhtd+g6Fmx3e0yq4VkLv2B/HUs6jvRhfE7Eld
         V1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=94toTxN8hQ2nuR/rMwCVMtEmzu/PwaTUOi2X04Go/n4=;
        b=adTvlTwSFvzwvKnv5qtamTDYMHsk/KWkqgzG4lg7mtyBXk4+GKOBZ2yaS/0iFQtnVF
         CsIXB9pGIwJqDNMs9kFq7UtPeAXXv6Yx2A3OFEQOy7Tr77Cp6B/iW8UeLAl9+YF6Vhy8
         2C6MBHkkEAkgmXrSze9FtjSknJRGnEsgsgMuW5/oXd1HzsVKglRVRZd21GP+J6aCL5ig
         e5z3Wy2x+UbgTj6qveWz8Bw0Tx0UEyqMTSLIsh/+RGtJ9rG4ijZnmbbzFfWiLt+LiaE8
         0MhaW58yQ5bRcuWvvr9qU8CDj6w/rvUDVm6m5jnYdm+jELoCfQHqGUdvWqCoIwiXsdNA
         i1sg==
X-Gm-Message-State: APjAAAX9x3a2GKzS0l0YAo5UoSLG/Xo04iqKF4sTQ65s/LrjMka6Y5oi
	YO6JH915FNjZ39Zeu+02PMyfiuCV
X-Google-Smtp-Source: APXvYqyw7JkIm5oj4jPdWmuUlqs0D9Z9dUI3coVSU4e8/m8H9JJfMR8YZsllV3GyNZtpvelproYKag==
X-Received: by 2002:a17:902:7898:: with SMTP id q24mr1080047pll.164.1582676207996;
        Tue, 25 Feb 2020 16:16:47 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:47 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 12/22] xen: add seabios to RRECOMMENDS of xen-tools when HVM-enabled
Date: Tue, 25 Feb 2020 16:15:56 -0800
Message-Id: <20200226001606.14750-13-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Launching HVM guest VMs requires a BIOS firmware binary.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen-tools.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index e012020..5b0a339 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -29,6 +29,7 @@ RDEPENDS_${PN} = "\
 RDEPENDS_${PN}-dev = ""
 
 RRECOMMENDS_${PN} = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP_RRECOMMENDS}', d)} \
     ${PN}-flask \
     ${PN}-hvmloader \
-- 
2.17.1

