Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47DCC18E72
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 19:04:10 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.169181.1692212642477232213
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Aug 2023 12:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XO/a+T2k;
 spf=pass (domain: linaro.org, ip: 209.85.221.52, mailfrom: erik.schilling@linaro.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3196afc7d4bso3819310f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692212641; x=1692817441;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TdWzewv8GUma9pXgw6rUxoyxlO9OXTrajLY/ClvSzo=;
        b=XO/a+T2kWxqCTHMGxPH7zkclEsGvtZ8IMB3Zs66WpljViMnunY/c2VhlO6+xVuZEwc
         z8XJDBD/WC5hzMWX8uNlDBIKa9bMkPilAqt8xr9zovb4UnSxTi2XiYdG4cYfeMu9YoHO
         kaTWnfrLhsAiKRZ2pFj3m2TEdtPfFpgDOlK6mbNM12DP++c0QEXQcHdKuknFmHxXTVI7
         I+eDLgVL1gpLkGATsf6Zr395PY/RQOcEHcaeusSWHyAHs3hvWb5J9Uddpl46Z+OPRslZ
         D8ZytUUUkY/xpYPMFhto2JM/JDflsHvLJUe/5Vm/pDc8G+habOMuKyLC7Ilg6DqkGZ9S
         1deQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692212641; x=1692817441;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TdWzewv8GUma9pXgw6rUxoyxlO9OXTrajLY/ClvSzo=;
        b=IwILl7b21aGHazNSfED6P33iD7+I11EpJc5W4w/x4VGcCrzJee6mESWIZuHlfW6jWa
         uHSKzdGtNWCvDzLCTenExAynt3ZvSdsnb8xBnb3ew0pS6a7Oqkyy0p52Rwhuz4eLAcxl
         uvYBf9k7GlaDIbeNTlMu89J+87qJZnI9XGFgIhu9EQSkP58+ISjjM7EuecGTFFhMtPUC
         /UgWoCijIh5wWz1j32a2MVp8AFUDiE+Dc4r5AzqE6HEORRiomj2a+efZW3WuHmDH2OiQ
         GhjBv1Qf0+9eERkUGG05usDbwymmWRWLijWXV807xYI+fF9yhlyLK+ITTs6LM/y+m9DY
         lVgw==
X-Gm-Message-State: AOJu0YxGsLsRLszsgcRwjLgkYXi3HFAk0PxI9e+rcUnHE//xc7W9Zlmx
	46CAanNzopAHyLb4+Ryln5JnTw==
X-Google-Smtp-Source: AGHT+IEcgnLH40/nv6l7vOXAYfRu7/zE/j3ZtdhOV1TYJQGrTh9keTBl9m3CQEfn+jLlUlnC5bjbIA==
X-Received: by 2002:adf:edc6:0:b0:317:cdc4:762e with SMTP id v6-20020adfedc6000000b00317cdc4762emr2347001wro.63.1692212640732;
        Wed, 16 Aug 2023 12:04:00 -0700 (PDT)
Received: from [192.168.1.127] (i5387890C.versanet.de. [83.135.137.12])
        by smtp.gmail.com with ESMTPSA id g8-20020a17090613c800b00992bea2e9d2sm8789766ejc.62.2023.08.16.12.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 12:04:00 -0700 (PDT)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Wed, 16 Aug 2023 21:03:07 +0200
Subject: [meta-virtualization][PATCH] vhost-device-gpio: only enable if
 meta-clang exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230816-vhost-device-clang-fix-v1-1-bbbd47b13e5b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGod3WQC/x2NwQqDMBBEf0X27IImWtL+ivQQkrUuWC1JDMXgv
 7t6fMObmQKRAlOEV1UgUObI6yLQ1hW4yS4fQvbCoBqlG9M+ME9rTOhFdYRuFgVH/qPRnXn2avT
 aG5DyL5DE9/AAX0oWM4e02Zl3m66P93GcI0Yx+n0AAAA=
To: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692212640; l=1503;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=jrZYg4fwsCmU2DNh3Z73/kidda2GQ2PNUYMbgaQ1UIg=;
 b=QITPfxtoiCvgustHvL8htGxQyw1eBoWEOs7r4ljmLPlsQVecYJWv3aM3ruKssbM02SqXDZ6Vw
 9oSBGDOYiXPBda23aZOdOb4ANBE0cfnnJJvKR9C1MZLCBo7GO8elMtd
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 19:04:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8203

This disables the recipe - which depends on clang-native - if meta-clang
is not active.

Link: https://lore.kernel.org/yocto-meta-virtualization/ZNyErpfW8p2lX81Z@nuoska/
Reported-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
As discussed in the linked thread.

Sorry for the inconveniences!
---
 recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
index 4ef9de4..7993116 100644
--- a/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
+++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
@@ -10,6 +10,8 @@ DEPENDS += "libgpiod"
 # libgpiod-sys generates bindings using bindgen, which depends on clang
 DEPENDS += "clang-native"
 
+SKIP_RECIPE[vhost-device-gpio] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', '', 'Depends on clang-native from meta-clang which is not included', d)}"
+
 SRC_URI += "crate://crates.io/vhost-device-gpio/0.1.0"
 SRC_URI[vhost-device-gpio-0.1.0.sha256sum] = "f4789dd127ce746d4f702d50256ff09e47b19fdb2bfee88a254b7e48efbf1100"
 

---
base-commit: 28205358690f79e13c1970ea7d61bce0131da027
change-id: 20230816-vhost-device-clang-fix-8348952fd3d8

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


