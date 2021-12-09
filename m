Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.5662.1639014114114805909
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 17:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FigFUT8l;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id i12so4011756pfd.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Dec 2021 17:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OOqATsan2GZy/zzKlWRnLpb3BX3xTX+p8vsEXH6oh9k=;
        b=FigFUT8lh6ltShTGfWlWy6lgOl+i3f8cKrqMx0E1T+17K0cEQFwdLtzdwl8HXIEg5m
         nkb6+lmLceW458xnDVSfQxW85bMJaoyqAZiI/tSHpcWQJAbGhob8+JvyGHHXlGEeWv5e
         Mb/mbXTOAyJD9wQlR+AwxmBVJAPWxV4BYfQMkDLjqMg4TbM8pK1mIXDVqZe/wjJTIXKL
         FsaimMnmUTinH6npYFEHjf8hb9Ovv0s9bQDaqVE5IG6b7o9Zy7c2HyEaqtyWuF1Vjwsi
         BxX6N80v4nzR/eKj/FJg6G7EIG0oTNhGncsobfocdcCwX1+TLuua6FrIkQrHpuoUhbB2
         5EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OOqATsan2GZy/zzKlWRnLpb3BX3xTX+p8vsEXH6oh9k=;
        b=mDbz/4kw1P75Uxkvjvavt5AHqkKJZxGXJ54u0XRAngeTlD1vn+7ltw1Ga7mwbiIrEu
         qjdwKfTFvU9gyqapg0ebCC0RgUYD+Jy7is6jKYK8KdDIatmisSSLZEAyJOuL7vyxVHi+
         chr38zp+UC4I6eksBdqeCLpFeZZcUaNj9LRWl72CJLY9Dr0Kjdm/jRljIdhBIi9pw4Tw
         1dj+t86MO/S50g73qljTJDfK8CyR3JETGqzOUezwzFfiem5uf2IAbmK9owBA+BeKKpew
         uUuqzeabt//spOcV7yWKLoPM7kuAHyLNnw3lLBhpiqBoXx35T4Nzu7xvZxxXlV3H/TbM
         J8Mw==
X-Gm-Message-State: AOAM530wtI4NQyDcpfYowt7g2o61EAacgwP4v+jP5WswR71M2GsRnggV
	NpPaXKomplCpIsCwGjlAtt2XipmWFR8=
X-Google-Smtp-Source: ABdhPJyQEkx/63iDZhIfS4Swe0/0Y1qAiMzC28pF7PbZwOR659CCWimeB2bU2YxlLj0b38qqoAl/dg==
X-Received: by 2002:a63:190b:: with SMTP id z11mr31480480pgl.414.1639014113583;
        Wed, 08 Dec 2021 17:41:53 -0800 (PST)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id x33sm4925759pfh.133.2021.12.08.17.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 17:41:53 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	Bertrand.Marquis@arm.com,
	cminyard@mvista.com
Subject: [meta-virtualization][PATCH 2/3] xen-tools: upgrade RSUGGESTS to RRECOMMENDS for ifupdown
Date: Wed,  8 Dec 2021 17:41:34 -0800
Message-Id: <20211209014135.9976-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209014135.9976-1-christopher.w.clark@gmail.com>
References: <20211209014135.9976-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen's networking for guests is typically configured using bridges and
the standalone ifupdown package, which contains a more capable version
of the tool than busybox, is needed to configure them, so:

Increase the recommendation strength from RSUGGESTS to RRECOMMENDS to
bring the package in by default, which fixes networking for images built
with packaging formats that follow RRECOMMENDS but not RSUGGESTS.

I should've paid closer attention to Corey's recommendation for this, so:
Suggested-by: Corey Minyard <cminyard@mvista.com>

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index d831941..ca924f4 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -94,7 +94,7 @@ RDEPENDS:${PN}-scripts-network = "\
     ${PN}-volatiles \
     "
 
-RSUGGESTS:${PN}-scripts-network = "\
+RRECOMMENDS:${PN}-scripts-network = "\
     ifupdown \
     "
 
-- 
2.25.1

