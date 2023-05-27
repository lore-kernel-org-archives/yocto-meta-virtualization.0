Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EE5C77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 20:48:13 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.17638.1685220483358836694
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 May 2023 13:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Vs5Sw3Ux;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: christopher.w.clark.io@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b0314f057cso2331225ad.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 13:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685220482; x=1687812482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=36GKCScRxlcrQe3ycVR9eZBnzKU5vCgopp+FMzi3fuY=;
        b=Vs5Sw3UxzsDB7wMgeLQPnkeiSuMzlVzlNs1KbLBZcxMS8wR85EkKpEyMla1DV+/ytd
         u5jGsaMIi3NTEDvpLCKJMvLfLbJ7jVk3yJe1LTibxjVSaT5HwAeu6iYakUVgrv6US+CX
         x1TwYJE1VgCBqc1CmisfnlNAooA5AogNh73gR8GTQZLI7CAwPNjDz/m8WjAPSOuH3P2t
         EOwaLiY5KcKOgFTd84+yfWsKtGmK22MgbNny2k3JKeR5F6QSCzC2iGoY3aEEjMRMjceX
         82e6W6LvhbVzyJjiDyeSIAEW85QLQH+uxWpr4l4V7slsFT8D/0M84TmljOK6K6nLrPtx
         SNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685220482; x=1687812482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36GKCScRxlcrQe3ycVR9eZBnzKU5vCgopp+FMzi3fuY=;
        b=TaTRK5kQfVSvm4vH0SL0ninlB52XTENQNnuQ4sENLpYvGVZQ0x4YiEgHlCCnJAw4BK
         uFNiUw1Fja/of117xyaLIXYN1K6e7ZHjk+pjIYng5JjuUI+wnscU1HmEeF/jjLX2QNEF
         ZpD0yBJLjpRbjlPYeKTCDKBqHZixeSk7rB9xtXTalHo1KeDEYKMkZca0OUjFEl411Qr6
         qOCmjrHgNsZhd/kmK7tVpfHrl+nn/oLYl2ETCBm3ady5JnNHuo0PUwhXRAkPe8H5WUoQ
         945DM+wxMV4HrJRgUY9HuQiQUhTUCWTvOmxMGWhFiCap6/woAp22cfYeDCW6PD155xQy
         Yu8Q==
X-Gm-Message-State: AC+VfDyyAZ5Odx9m7B3Mokw7MLMCQZCDFkroxzj2AWbJqmzIO/nd9YBg
	YO4+vWntOafjTL8L/LprAHhxl39lUIs=
X-Google-Smtp-Source: ACHHUZ6SBaUnDKITepU7nA98t3jVklNrOxlrfTvtMuvth3izJUM1j/ZC5L8z29wzaqZwom/cBCJ5EQ==
X-Received: by 2002:a17:902:d509:b0:1ab:7c4:eb24 with SMTP id b9-20020a170902d50900b001ab07c4eb24mr8947208plg.22.1685220482380;
        Sat, 27 May 2023 13:48:02 -0700 (PDT)
Received: from cog-dev.home ([70.103.208.83])
        by smtp.gmail.com with ESMTPSA id jd15-20020a170903260f00b001b02881081fsm1507870plb.156.2023.05.27.13.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 13:48:01 -0700 (PDT)
Sender: Christopher Clark <christopher.w.clark.io@gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Bertrand.Marquis@arm.com
Subject: [meta-virtualization][PATCH 1/3] xen, xen-tools: Update 4.16 revision for gcc 13 compatibility
Date: Sat, 27 May 2023 13:47:51 -0700
Message-Id: <20230527204753.1385743-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 20:48:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8080

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
Compile tested for qemux86-64 and raspberrypi4-64;
posted to fix the build with the new gcc.

 recipes-extended/xen/xen-tools_4.16.bb | 4 ++--
 recipes-extended/xen/xen_4.16.bb       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-tools_4.16.bb b/recipes-extended/xen/xen-tools_4.16.bb
index 2861788..34790f7 100644
--- a/recipes-extended/xen/xen-tools_4.16.bb
+++ b/recipes-extended/xen/xen-tools_4.16.bb
@@ -1,5 +1,5 @@
-# xen 4.16.3 release sha
-SRCREV ?= "556c2e817c9cf23b675eb4eaa2dc091f7bb3039f"
+# stable-4.16 status on 2023-05-26
+SRCREV ?= "b0806d84d48d983d40a29534e663652887287a78"
 
 XEN_REL ?= "4.16"
 XEN_BRANCH ?= "stable-${XEN_REL}"
diff --git a/recipes-extended/xen/xen_4.16.bb b/recipes-extended/xen/xen_4.16.bb
index 14a4fa7..77d0951 100644
--- a/recipes-extended/xen/xen_4.16.bb
+++ b/recipes-extended/xen/xen_4.16.bb
@@ -1,5 +1,5 @@
-# xen 4.16.3 release sha
-SRCREV ?= "556c2e817c9cf23b675eb4eaa2dc091f7bb3039f"
+# stable-4.16 status on 2023-05-26
+SRCREV ?= "b0806d84d48d983d40a29534e663652887287a78"
 
 XEN_REL ?= "4.16"
 XEN_BRANCH ?= "stable-${XEN_REL}"
-- 
2.25.1


