Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17138.1582521582804259733
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 23 Feb 2020 21:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D2ioBr7P;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9752E01483; Sun, 23 Feb 2020 21:19:42 -0800 (PST)
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
	*      [209.85.210.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 220AAE00804
	for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:42 -0800 (PST)
Received: by mail-pf1-f195.google.com with SMTP id 84so4738478pfy.6
        for <meta-virtualization@yoctoproject.org>; Sun, 23 Feb 2020 21:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ONbOrUBjw+OqmFF63CPqzoFqX94zrh1UnIiKUU23bzw=;
        b=D2ioBr7PWphu+PCHtfv5grOtDkw9d4kcwHcNdG7c52gKjw0r9xLm5reZ9Sfb9K62WZ
         B4yl3aI3+0W9WZzORNXRQXjcyIAtmZhlQ/GEmNkfQekyebzHPvg/ewLofNCVUpA8O5WF
         zprP24bRHxeIm0MN15iqnb69Fgo8lL4RglduzqrqBqIXuZ2WrzD2TQ8EU59QNa/bUsmA
         DvF3PR38VQEvnIJd+hCc4RpqL6HV+0+tPj8QYgeuHGSvcB2glFcnqBPevD8wKVoqf+ro
         ECDDd7jM7jBtltZwCqH7yq3NhlnS8RCRHj1xoYvKr0GfMYLKpeSVwA4U8mA8oiwrVSPa
         mOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ONbOrUBjw+OqmFF63CPqzoFqX94zrh1UnIiKUU23bzw=;
        b=aQ6dQH62fZDp1HAAjV+in0oT9cI9UhZNb/Gne7NC0M20IHQ2gdmJ3dBtsw1yqr1sfL
         ahL6wdy9GvPXeeyYdHb61G7ZbUHbZRnWYhnI/jqmF5VPUCYhFaB+pJ2W1zsKv6vWIuuv
         rFtF2SsswZRgX8BZUzFxcWRr0czFpVIEXBhzIMj+RrJMxWEQe9DziJ/N62F6AYT0qOl/
         TiAxtMpSSQLLXhSL21wBr7Bf4HXb6otbb1XoZAZNl2tLAVtmhJMnZGwuHqTSLHj5WVuJ
         q/Cpeq6vgmYUg7huKooG09kNzt0iXfCWLAAm2CaxULa/p2O3hiAZ1D3G9irR9xh4KJpo
         q2xQ==
X-Gm-Message-State: APjAAAX8jq2Qs+Eu9+nla6u7/KWZ/Az7Paox+hN4QS6YkepLMMj5CTW4
	4ne35x08VWGQsDKE6T9W4B+vn3b3
X-Google-Smtp-Source: APXvYqyUvkEUkypJ8gNWAkJ6+6FARI+H2FhYMTxT3LMu3VHUOAtNn4hSQHnUhtuanTJL5hzgXn096g==
X-Received: by 2002:a63:646:: with SMTP id 67mr50532670pgg.376.1582521581239;
        Sun, 23 Feb 2020 21:19:41 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id a195sm10859409pfa.120.2020.02.23.21.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:19:40 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v2 18/22] xen, xen-tools: bug fix to post_patch task
Date: Sun, 23 Feb 2020 21:18:48 -0800
Message-Id: <20200224051852.21933-19-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200224051852.21933-1-christopher.w.clark@gmail.com>
References: <20200224051852.21933-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Patch needs to be applied to tree in ${S}.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 32e836a..d863c8f 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -192,7 +192,7 @@ do_post_patch() {
 
 do_post_patch_append_arm()  {
     # The hypervisor binary must not be built with the hard floating point ABI.
-    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${B}/xen/arch/arm/Rules.mk
+    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${S}/xen/arch/arm/Rules.mk
 }
 
 addtask post_patch after do_patch before do_configure
-- 
2.17.1

