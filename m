Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63BEEC8748
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 10:01:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.33325.1694340069251799644
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 10 Sep 2023 03:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dHxKBNUv;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-500c37d479aso5519714e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 10 Sep 2023 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694340067; x=1694944867; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5t2JzW/Wv63/NYbvESdZuGQK+R6+tDdS6/H7Vs6piI=;
        b=dHxKBNUvZ94LnWpPYYNAvTN8wzDlClqnlDqH9umRvEX2YlE+Xv72BvFNSfvbaLNpUo
         3ssnIQlpqiE7hHhY5ErCojBtEkaSv60+WzFNCGXt09360FSswBs0u04Ojc/VHWUSckya
         sNZoNUehPEQWeVoEcgUjK8o2gs/jvpQfSD0JCX2TfnhDhT4EupiwXvCZOb9x2hcHA0Ti
         GldxlYRvjibbx4Pn3Pn+S3olKdvMgyZ2FNQzXElxJewBOcLqeY7xixzvkt79bMvgxwkG
         XEU+wHnK77EbpIHl99FFEzPc4klNORoTYh80+bwBUkE0R284grNGOzQ2+Yx/0UxtoV59
         1KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694340067; x=1694944867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5t2JzW/Wv63/NYbvESdZuGQK+R6+tDdS6/H7Vs6piI=;
        b=vDXDqFPwfGGvkhpbdD7w817qbstKJb1b1rp2apG/pYH83nFmnM6bz44mV4vXsJKSFI
         jARwMKeGxdFD+didOJLTBa6BU6CmJJnW9Q55tcRpud2GdaxCng7BMmuo+ZWxyaBi6e5Z
         YNjdNx5wqoWkS7DRepDwZL2J5+jjry7vKelTXqkjOxTRdGvMKHEy/fSvZxfjJZGyRm/x
         DQ5WiM3ss2saWDg6TvGfXDCOvo46swwh66+X1b5xxlJcN7E37WI2vaA/MjTyMoOFt6DP
         fT9XjL8YSHwADkVRZeRFhKBzsLsGmBWAXmN3CxwvjICtmOjwUw6rStidC79Cg8tFivxf
         Z9YQ==
X-Gm-Message-State: AOJu0Yxg0GNiZMOG1TQM4mcABsNgx6VV9ieCm9hdZf5CYE/M1B3TMpSj
	u/oYTXZ2h5rGXX6d5/6zXLJNCY8QpTA=
X-Google-Smtp-Source: AGHT+IG+aG/bE8b1ayUFFRxjF9yThAGfpn/T87fSoTGf+FRiWzHgKzcXW6ODvVdojitOz/37D9eTJQ==
X-Received: by 2002:a05:6512:3f12:b0:500:b964:37e0 with SMTP id y18-20020a0565123f1200b00500b96437e0mr6488169lfa.6.1694340067111;
        Sun, 10 Sep 2023 03:01:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h4-20020a50ed84000000b0052cdc596652sm3138047edr.23.2023.09.10.03.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 03:01:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] layer.conf: update LAYERSERIES_COMPAT for nanbield
Date: Sun, 10 Sep 2023 12:01:01 +0200
Message-ID: <20230910100101.1939456-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 10 Sep 2023 10:01:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8291

* oe-core switched to nanbield in:
  https://git.openembedded.org/openembedded-core/commit/?id=f212cb12a0db9c9de5afd3cc89b1331d386e55f6

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 9ff61f1..c44d585 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -21,7 +21,7 @@ BBFILES_DYNAMIC += " \
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_virtualization-layer = "1"
-LAYERSERIES_COMPAT_virtualization-layer = "mickledore"
+LAYERSERIES_COMPAT_virtualization-layer = "nanbield"
 LAYERDEPENDS_virtualization-layer = " \
     core \
     openembedded-layer \
-- 
2.42.0


