Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.172.1582676208555286392
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=czhP7Z8+;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B2D9E0175C; Tue, 25 Feb 2020 16:16:48 -0800 (PST)
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
	*      [209.85.214.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63F73E016B6
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:47 -0800 (PST)
Received: by mail-pl1-f195.google.com with SMTP id y1so509842plp.7
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QniVLW5HTbRPxDMWn4H/terzLA8kdMfO+D1fUPsYDPI=;
        b=czhP7Z8+HuJVCVOBkJDZrmfFGKUAU/Aj/TvwDAVlfbBZxZQ+JmqudmtZ7dnsWJ+qVi
         G9GHT5bWHdxaYqehWnzjxEUszVjb84WlRVW9Oy0mSja2NTzGJ8XsWXFGEFsrJVFW6GyR
         GYtL2QChuvueSFaRkxBfh4+qkVAiZfq+Z3VzDydW5dtrILBuVGDj0ga7YI+2SJIOx1rE
         WSGFiKC9h96T8TvLDSZf+OnApRH8xr65HzyLgOhQsdoG8M9keN+CwGnnqq48z0TJJjVM
         9+eavN+adMjttvD78HAflcLQ7Z8jugmiI7OCRLeTup0EH2SeqxlOWIegZjkYmJXbW0ky
         oxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QniVLW5HTbRPxDMWn4H/terzLA8kdMfO+D1fUPsYDPI=;
        b=Aag9HGomrl8Ysw+8iVPxTPnyRGwpfYl5xqk/1axTi3QJ+nr/McWqwh8cY/bY2DFWSl
         Po0xHgo579lb1oJppFadmBSEb2cXhYwvxoLp7Jo9qbE1lPiHvRk5m+Ds+xtN60aCCQ3G
         5a3n12HRxCn2rOfEF4M+Dk7xCc7z83CLucO6vexS/FttkWddL7CttiR0bFJ/7Af6NHvH
         zipGAKF5eRXpx1OcobgHB+Nokx4Tlax+kuPviFiJnjHMbycZhJZMJ5c8qd/14jBXTe8H
         46vZCS4gthhdFWD7LuZSGn6bZm6T50oklNDaoMVAtkqy6tZGfdoPkVU73ukAZKU4MuLK
         ageQ==
X-Gm-Message-State: APjAAAUC+SBVZUlDkors9npXjMGsw0zkuczoeQYDdxuQ21xQBPb9+ey1
	XuuB32g53VRXXNgv5524vraRcnpK
X-Google-Smtp-Source: APXvYqxJSAHW3V3cESe7H2CahmfjMPgGA13DT6KuBEyscDyWZIt3He/i3rqbguFRV4iMIvi6grsOEw==
X-Received: by 2002:a17:902:103:: with SMTP id 3mr1173529plb.34.1582676206161;
        Tue, 25 Feb 2020 16:16:46 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:45 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 11/22] xen-tools: move xentrace_setmask into the xentrace package
Date: Tue, 25 Feb 2020 16:15:55 -0800
Message-Id: <20200226001606.14750-12-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

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

