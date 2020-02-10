Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.17558.1581311322490146858
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lxP4HriN;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B654E016BB; Sun,  9 Feb 2020 21:08:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E40DDE016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:41 -0800 (PST)
Received: by mail-pl1-f179.google.com with SMTP id t6so2332969plj.5
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uCcaBqKK66Bc8QYqhpcxPa4QICA1QiilWk0S1Zs3OaY=;
        b=lxP4HriNavaXkvDhzfIMNhQAxXeOElFOd4lzflfIj+VHXwRgJJbZggQTsBpOTWFWIk
         gC5DqGiwVDYRjNk/L9h84+WuA4Er6JAgiDe/KvCGFXYMP+26mcS29Ng+M9vatSdbhAh3
         FWnUISutD+OKNXe9t9I+JVsjcExkt+CFDIisiPG8qa7113UQgp6MvG9W2OhZoxdQvIhE
         G7WZbOtfS+rh3gitOKV2CAJ5Qn+Sve5wUmHkY6ht+vXX6HwwTn69WMzCykmS+7kWrIKU
         KcdJOM5OtJDgZQH2ZyuL1GwsgfKZkaz7qG92FZNpNXsATn1ktxNMO04Oi1/nwCZhGZz3
         5n8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uCcaBqKK66Bc8QYqhpcxPa4QICA1QiilWk0S1Zs3OaY=;
        b=QNAzYCCp43OVneSAeMy1QFMwj5MeYOOso+SE5l6fdemldvW/xxwH6uA324qycIH3EQ
         hPajsjvs1d258SVHhdjGXnmsxjlE6awnRPucLv3/uLZ2FP8FbQOlHcobBv5DSkxksd/9
         xKICMQihbHMKnqqFai7Ghn3WFU9SfufQZi23sShlArPK94smkCeeCIGMd5YPWwYWwKAM
         lM5uexDc9lVoUp1NAlqylzgPTydXICww3t5s3+atmWRG5e6h+NH4yn34xb7phz8DXDaU
         OCulpkvVqyYCJ/XqY5+gLy4VGqRxctfaStirpl4b1IJx1FJoZLSi+gmr8KEcU8N6nrdN
         mRYw==
X-Gm-Message-State: APjAAAWPLugM6MdeoM2MuL6uJMWxICPDLotzuWwQ0tqS0Y9QP9L1KR4f
	mnUPabhIc5lbiJtijliAnNS+VpMM
X-Google-Smtp-Source: APXvYqxu4RKTipNbZwDlGEKK05mg8XaKIn77PzU8WVaYbQANFHkPziVl7k7/XfUCIm+tqk9KqFw+wQ==
X-Received: by 2002:a17:902:7c05:: with SMTP id x5mr11448902pll.236.1581311321112;
        Sun, 09 Feb 2020 21:08:41 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:40 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 16/16] xen: add contact to recipe README file
Date: Sun,  9 Feb 2020 21:07:54 -0800
Message-Id: <20200210050754.3534-20-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

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

