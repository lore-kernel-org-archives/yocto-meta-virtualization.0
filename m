Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB63C7EE23
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 07:29:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.43973.1683185351789837438
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 May 2023 00:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IswDxpd0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9536df4b907so22089466b.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 May 2023 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683185350; x=1685777350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lsn6Dd1e77yY73anZDBP2Yhd1m6QLGxhiVKISkkm6LU=;
        b=IswDxpd0nId7JRZNkx4jAmm8XeI2Fg1abSmRgwtHrQz+rIfsH39BwjH4LnM75lqsbP
         VCr+/avgzaY+H5dvaFqgp6+l9Lm2Meyu6N37I72uc8hTTN0OWAZxaAhD61o3Ub9uCCOk
         wsjZ8LFGKvjojM2rHBz6woqmKhRH43vv28XBiJhtQ5tQ9vGdoe/bXIAV9LnhhfpB7+p7
         7F3Su8qekVTVDUVh/co/doBhEN7G99miI/KIpUOHlcJYQTHC3Opo62VLPWFYsv50Tg+W
         /7v7D13w2OxQziQQAAe4fWWw1/OBr6OB/tQBoovcRfAECkZVuTnhbfXcPBKXnq0dkTfW
         L+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683185350; x=1685777350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lsn6Dd1e77yY73anZDBP2Yhd1m6QLGxhiVKISkkm6LU=;
        b=DmGu9cABNGaCeCXaExEaqi771d0WYRZ2ojWdi1i8yhTgQSnNOcjAlaseylt0ErEBQ2
         r98Gz6LIjdXCiOS9JWm2H1itjw4/ZRTQSMLc90xZc0JxVedf0B20CEysx81+ZfklWFa9
         GhK6mKZaf4MY/etRtAY6KjkU66L0Z5m0Go2JTPdtxdGpFfLFvPB5jqWnPNUtCCpxqktK
         QWwJ4Z3HS1jv2ZBd5D0uPSViChavYjqkRSSXQpBnrnXbPd1JB8kGL4rZVqXYC70Wt9wG
         1JFY6ty/hVAzslFPZPPKAa3ld1YQal1Iq/Sw1CbnM7lkO4dHsp+EJY+IU6GEGBajRNBF
         HoTw==
X-Gm-Message-State: AC+VfDx+QqQou3Hk0yM9p9aCMTePmRRU2rle62FsE3eOmYIAc3Ahr6wS
	uN9lpzehyzkP8PhA7AEPP+RpC7qHAfY=
X-Google-Smtp-Source: ACHHUZ5yN7Me1x9Gx3p0vk0Teg1uzEJPBgwS804Y729qWgKTMSCTiJCxftOJwAoeRcn94y3MGqNzdQ==
X-Received: by 2002:a17:907:805:b0:94f:cee:56f2 with SMTP id wv5-20020a170907080500b0094f0cee56f2mr5851494ejb.4.1683185349987;
        Thu, 04 May 2023 00:29:09 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jz26-20020a17090775fa00b009611a489a88sm7308699ejc.25.2023.05.04.00.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:29:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] k3s, kubernetes, nagios-nrpe: fix Upstream-Status formatting
Date: Thu,  4 May 2023 09:29:05 +0200
Message-Id: <20230504072905.1065116-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 May 2023 07:29:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8043

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch        | 2 +-
 .../0001-hack-lib-golang.sh-use-CC-from-environment.patch       | 2 +-
 ...1-Should-fix-235-nasty_metachars-was-not-being-returne.patch | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
index 524ac2c..12f9941 100644
--- a/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
+++ b/recipes-containers/k3s/k3s/0001-Finding-host-local-in-usr-libexec.patch
@@ -3,7 +3,7 @@ From: Erik Jansson <erikja@axis.com>
 Date: Wed, 16 Oct 2019 15:07:48 +0200
 Subject: [PATCH] Finding host-local in /usr/libexec
 
-Upstream-status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: <erikja@axis.com>
 ---
  pkg/agent/config/config.go | 2 +-
diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
index c81bd1a..15e8ffa 100644
--- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
+++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/2] hack/lib/golang.sh: use CC from environment
 
 Toolchain tupples differs, especially when using vendor provides ones.
 
-Upstream-status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
 ---
  hack/lib/golang.sh | 5 -----
diff --git a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
index 7a12e73..fb34c5c 100644
--- a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
+++ b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Should fix #235 (nasty_metachars was not being returned when
  specified in cfg file
 
 CVE: CVE-2020-6581
-Upstream Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]
+Upstream-Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]
 
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
 ---
-- 
2.40.1


