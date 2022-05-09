Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12506C433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 17:01:09 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.47.1652115665501165299
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gVT8b18/;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id v11so12781499pff.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 May 2022 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cH6yb80UvXN6GDxKE3BHV6GCMZ1RZcmRnqcVAPQxMPU=;
        b=gVT8b18/U67ttDFnbiZO2Sd70RRYQ8i+x3Xu05hineQfYmUgMFyLHy97T7aHLobPRk
         Rxpc1a8JlPF4FeXEMYD08ounKNu0k7XaWDodq4xgN4NgJgbXUO/etWp/S+RwoNOlnXyj
         VcIm78mi/wAFZ2+MWyrRt60z+dViwO/g9vg6BKDhr27BQFRUflyVic/quYcwskYW8GUb
         XYr1EdAcodQRw46bzX7nxfIw+nBkx9Qv6gXrAWxv5RFMSIr63aIk3a+Slt0uhaEsBRqO
         3c+2iaIM0Of0SmA871kNUOdSQ7ZSVriw1628dZx6U1lCvIGXB4wSeSDGMJ395Embtc0W
         oLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cH6yb80UvXN6GDxKE3BHV6GCMZ1RZcmRnqcVAPQxMPU=;
        b=1ebEvwQsPgCEpiVyQ9OP+tAqjPXiSvmTPfZHC90s0OOEqh70Z8nHI1GCbpO254UYgZ
         OYjcWjx8+e0owEY3R0vjD1udtSPcUGTyAl38dGSed8qblKWla5aLLaEhe0VDDi5NaG8r
         wHQ6Ks7qnXU/dwYgFFEG6B+Bypq0sTj9oSkX6rC8ExP0bFae6tMfwwS6EiCvjLUVYBkU
         qRY3oQPZFMW92BxEjnANIG9Fg8OLr7/tum0zhqrBClKkYNVA0PJHYQ+obDh4DiQl/O21
         5mtMFSI/cuK+IW+Mi/ChJ7MOAQrFwDtsYQIEUzUQ03CQGhfvIxSdgfYRPcbLo03pfN7w
         Ep7A==
X-Gm-Message-State: AOAM530yZNVZPFmMEQcDzh0huC4WmklAw2i6iZm+7RJdmRgjxvMbhqxR
	W/jgf4bycqH1VG/lldecJl0bB/MIOcjsSA==
X-Google-Smtp-Source: 
 ABdhPJzysQXMVAk7IKWmbdg68QQ+E87eoEVZ+JGkciNgs3CSsjUL3ynz6kXvvHiu2zADJRW13fmHLA==
X-Received: by 2002:a63:8b49:0:b0:3c6:1ec9:a018 with SMTP id
 j70-20020a638b49000000b003c61ec9a018mr14127944pge.451.1652115664634;
        Mon, 09 May 2022 10:01:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 h9-20020a170902704900b0015e8d4eb216sm110193plt.96.2022.05.09.10.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 10:01:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] xen-tools: Fix build with GCC 12
Date: Mon,  9 May 2022 10:00:58 -0700
Message-Id: <20220509170059.2751954-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 May 2022 17:01:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7264

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-extended/xen/xen-tools_4.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-extended/xen/xen-tools_4.16.bb b/recipes-extended/xen/xen-tools_4.16.bb
index ae1ae8a..be27cf7 100644
--- a/recipes-extended/xen/xen-tools_4.16.bb
+++ b/recipes-extended/xen/xen-tools_4.16.bb
@@ -7,6 +7,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
+    file://xen-fix-gcc12-build-issues.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-- 
2.36.1


