Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B004C41513
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:09:31 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.3524.1716577769453159484
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dJJerBIy;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so107440591fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716577767; x=1717182567; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/TVbOR2VwPaZLrlvkGL5YROU4JU5No4ASybLivAiSE=;
        b=dJJerBIyCzyue6Nzhjs6CpRx59ENww0TACXUkvckxfdZK3kY+E4WpveR7piO1zL7VK
         PXbWF6BKYSjpZ2+U+ASOACsB2YYeZ9pLcEbY3ZT0D9mdmQMLtUH1jomm/xsnw3H97zrb
         KoLJpE8GYG2onQyJi/3oaYFlAD7IFEFCzaGLBAT7ts1uXyr77Z2gIgIYT6hJD8lbeyrB
         xEid9ns7bEg9U7UDOcD+Xt93kGDeX1Hpid21eoPbE0C03zXgv3N0sgbHTjGihT1OR9ZF
         I/OtekSlC1PiLqOfD8R7gIPQ4aoiF32bn/9Ibod8MK0UgQTVRuuwkKnUuPJrzalWXOvc
         7UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716577767; x=1717182567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/TVbOR2VwPaZLrlvkGL5YROU4JU5No4ASybLivAiSE=;
        b=An4dSfpj8KVpfeYogAh4+tbjUiLb/+/GbTCnPwDc2Dy3wRWWwUofihgJ3GW3HPu/rm
         gtG350RXbCg5hu/SI6DXoq0xwaW4RVTWtf35izR5baw4hThO1DEtA4YPQyfXhvHeSxD9
         ogGWJjEleCzs4Hj/cAusjJJ2Q83h+ldfz1pHpRqyGEhLu8UWueJe7+CVi33MALIS+6lJ
         rolbzKUi/CDeFy6cEX1kxQO2Uf3d0P/xveaKEZyLaYNMxgEZxyiuTJrk+eK0S4U3xlsl
         NIeAGHGVuZ7KwcbnmAWjZpL2Xr0jMs4hXi1U40a3nPdHQkoIqrhLliwmKWsnWeCphqNI
         8nUA==
X-Gm-Message-State: AOJu0YymU2WwuoZzb1dDLl77JBPBq/6CVbPP7M9qVIk66jtusLiGKtE3
	YPjbxgoTL0f9qbsKaC2liEA3LtZHImB+tgWiNzyV49flX3uNIx60ycbxyA==
X-Google-Smtp-Source: AGHT+IEGfpC9e0oLEEpxrsyqQJd2jr4pdJiKcGUhIRlHQslwcp4q6bsXOBV/Ba/JMmI/YZ0H9YS4cg==
X-Received: by 2002:a2e:7808:0:b0:2e7:134d:f7ac with SMTP id 38308e7fff4ca-2e95b27b0a6mr26607161fa.44.1716577767375;
        Fri, 24 May 2024 12:09:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785240ea59sm2133141a12.54.2024.05.24.12.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:09:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC][PATCH 2/3] cni: use GO_SRCURI_DESTSUFFIX
Date: Fri, 24 May 2024 21:09:14 +0200
Message-ID: <20240524190915.1241716-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524190915.1241716-1-martin.jansa@gmail.com>
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:09:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8756

* see:
  https://lists.openembedded.org/g/openembedded-architecture/message/2007
  https://git.openembedded.org/openembedded-core/commit/?id=cc4ec43a2b657fb4c58429ab14f1edc2473c1327

* fixes:
  http://errors.yoctoproject.org/Errors/Details/772691/
  ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid file: TOPDIR/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25774a8047c896b5/src/import/LICENSE [license-checksum]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-networking/cni/cni_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index b41b47cf..c0f316ec 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -14,7 +14,7 @@ SRCREV_plugins = "b6a0e0bc96906f0d3bd6bfcaab0b5ae72292f46c"
 SRCREV_flannel_plugin = "6464faacf5c00e25321573225d74638455ef03a0"
 SRCREV_FORMAT = "cni_plugins"
 SRC_URI = "\
-	git://github.com/containernetworking/cni.git;branch=main;name=cni;protocol=https \
+	git://github.com/containernetworking/cni.git;branch=main;name=cni;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         git://github.com/containernetworking/plugins.git;branch=main;destsuffix=${S}/src/github.com/containernetworking/plugins;name=plugins;protocol=https \
         git://github.com/flannel-io/cni-plugin;branch=main;name=flannel_plugin;protocol=https;destsuffix=${S}/src/github.com/containernetworking/plugins/plugins/meta/flannel \
         file://modules.txt \
-- 
2.45.1


