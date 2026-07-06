Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23B1C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:14:21 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156222.1783358060099119542
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rlo7nh/A;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-846970f0acaso3141396b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358059; x=1783962859; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53v0vLz49LGOgoey6tIKyL+7oPrZ2+iKwesfQwF95Ms=;
        b=Rlo7nh/AGcHR1sj08oM+rbueZ6cX1ZwXL9TY3rnDrDWVLBXV9JNxvrDSa0e8UJCfEb
         TaBiUBkslmBPzibOzQZ7XY/Z2Y4Dv9WDZc/6Q2QFs6XNm7u6ipQ7dTQyoJt9k12iKt2M
         +7UXiBa1vlhPF8SYddaVwqU3qiuSNiFUm9eZQlGJigkhQonSNEy3PRw4JHKDTqCO/E2b
         xAzhlmhJpv/fRAt9FlXbv+gzwUa89laOEekeMNbU6RMGYQKfgKL3lurvLXQHhRcZVOTW
         Ga21ONKFg6aoTIHr4DpvMcr6N0TR12OmapqpV/qPZ7oh1cTvpPj1Yene4w9Z+41+Yf+G
         WWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358059; x=1783962859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=53v0vLz49LGOgoey6tIKyL+7oPrZ2+iKwesfQwF95Ms=;
        b=CyThacu4IaJJV5AqS5TyqebnnyPcJQ1C0FljOt2hWDA+CHZjsVg6vChEcUhlfl0cgB
         Uh7js6kq+PtWtKtH8jRUYN8kBGgzULIIRBpfXmZdE/EHFXndSkWEhpeHaZS16+E/G2tT
         S5ZIhYL85Y/qIS8DpiX6pppUd2cjBAkobus+/daCuV2gL8B0P7zO/EA6PVjDDk69w6BH
         UtMplrCP7IOwPk4WzuAXMDyUlhAX49O7ts7v6zen3+ThDD81haLXevKSrOeF6vjQwLzb
         7DZL3znPoKF42vTJHcgVQ5xsAAndm0a+wVcbImv76vS9bQBYDBIScMm4+Nu8XpCymbCZ
         K33g==
X-Gm-Message-State: AOJu0YxqCOPPIVRgpGQM2R08Dcb2MnPkri/58dsmklrDsKbkRo/QicKd
	yK7jQjHLNYs501kGWIlrg/cIHm9DvLcI3dhVz7nJY2eRsvGpnZ1FUJ5BuWtaEw==
X-Gm-Gg: AfdE7clO9ECEivK9XzSRgHpAEgeY2iP2Mfw550aO04X1Vw3OR9GUzqgnLsgq5RcuqW6
	DvYHmvSOiLjhzgHD4yGyqPY0dxC5VKMy2Y1AnMQBGNoVq48OgThNqw1Kj2l8HezGJ4W952DK/+7
	Grtio5ZTcYCflkP46GU5nD5Eyoy1H+qJkfhjhrZIZ4MIZtWTFWng1bR/z3H1x/a8lw0WMB7FHPH
	SCGuBMFLRHvELCdPaEr8jAmW9JN73jHpgYX3UsS1+Snjy3tsDcPYMXGwLOSkwRQdaIA0PV8Y56c
	YBEyUvDzP8QjiBykrljW/akgproUxYojwJMHanYt6YfMo1Dkbkbz0Wn6EohQknb9DFXauN41A6U
	34nIiNoUJPiPOYHNT0z97VxDeegK970jyztdYstnTzmCEmAQOhwj08r8qrCex8jVWO61ZoR7qE0
	slRX3dRwDcqyPvNUfG3bciXvErYnQAWzHrcGfvrJBM0vncMLoDp8tObkowjB37xfYZslKToMn4h
	Zdfd+r0LNn2
X-Received: by 2002:a05:6a00:2342:b0:847:88eb:1e00 with SMTP id d2e1a72fcca58-84826d2f156mr1399953b3a.49.1783358059389;
        Mon, 06 Jul 2026 10:14:19 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.14.08
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:14:12 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 10/13] vcontainer-bbmask.inc: allow meta-webserver/recipes-httpd/nginx
Date: Mon,  6 Jul 2026 10:12:45 -0700
Message-ID: <f0fce0665aa8b1009bef15233dffd3ab26370f6d.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:14:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9934

Allow us to build nginx multiarch containers.
If we choose to support apache2 we can add it in the future.

While it seems that BBFILE_PATTERN_IGNORE_EMTPY_webserver = "1"
in conf/distro/include/meta-virt-host.conf is no longer
needed, we will see warnings from vruntime-* multiconfigs if
we remove it.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/include/vcontainer-bbmask.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/distro/include/vcontainer-bbmask.inc b/conf/distro/include/vcontainer-bbmask.inc
index f79ea9b9..0c9b8b02 100644
--- a/conf/distro/include/vcontainer-bbmask.inc
+++ b/conf/distro/include/vcontainer-bbmask.inc
@@ -93,6 +93,7 @@ BBMASK += "meta-networking/recipes-(?!filter|support|connectivity/mosquitto)"
 BBMASK += "meta-openstack/recipes-dbs/postgresql/"
 BBMASK += "meta-oe/dynamic-layers/networking-layer/recipes-core/"
 BBMASK += "meta-openstack/recipes-extended/libvirt/"
+BBMASK += "meta-webserver/recipes-(?!httpd/nginx)"
 
 # ---------------------------------------------------------------------------
 # Entire layers with 0 recipes in the container image dependency graph.
@@ -101,7 +102,6 @@ BBMASK += "meta-openstack/recipes-extended/libvirt/"
 # ---------------------------------------------------------------------------
 BBMASK += "meta-filesystems/"
 BBMASK += "meta-python/"
-BBMASK += "meta-webserver/"
 # Warning suppression for these fully-masked layers is in meta-virt-host.conf
 # (BBFILE_PATTERN_IGNORE_EMPTY) because BitBake checks the base datastore,
 # not per-multiconfig datastores.
-- 
2.54.0


