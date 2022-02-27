Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC97C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 23:28:27 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.14444.1646004506739351700
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 15:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nPSQ0TuT;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id bx5so9570885pjb.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 15:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=utt+dA2zyTwh8pqYkQnRjqoUcgB+A9fhuWEKU4+sjK8=;
        b=nPSQ0TuTDt0fwrLphmyq7dqbmCtjbR5lzrot80B/GwrAPVm3/3OuoTOnNqi1+Q3m6X
         zCmGEpdNNcn4mWO8AbnRPBfQgohF67uEP7yEzbC88lM4kyXDtTlIh/HlJqMvFejjscXn
         Bz64ZwjVpLCpcRxIJBHmH9I23YyS1E7WC11JHEp2z7NM1ycN6PohB9sYdh18I2TJn1Q/
         EbTFR1CvvlBxqOyUPwZ3nfvJZTue2Y0t6rgTmd/MKJBUnkmkc6I7aY8zIECRFwxv4IeC
         Upst7cQtSnLFsN+pg6d9fgqgHNFIWYcJoOcUaREaMNixIN8auRxdbFseGa5DfSFFwjgS
         54yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=utt+dA2zyTwh8pqYkQnRjqoUcgB+A9fhuWEKU4+sjK8=;
        b=zniIp3AoOr79y1ITbZFny5qWFsjR0l1sc3eGukYyyY1QV6YAVV3daYlb+x0bKh+8Ou
         +eYq68+rTbKa7x0W+u2RCSl5z1EFbemUKYIVeyzbEDmw9bWwQYUV1QrXkLtLP6Z2VxFM
         TmaUgSml3RIlDh7j5jDBavinLqKbXjlTWTCaCQ4skbLdk97ZRcryCjS8dEMylZb3YA5F
         nEM4t+Te62EG6hLF76tatKgaZfWzM9DA+D89PjVzJz+g/FUN/dDW21BI0j5I6MfiAaZi
         wkHWDr6UOaznrjjmAuteLVP7OfTR9a9vPwnVy1Jl4HUzpRgP8wl0CaOQDHs83poMfNAL
         Zbcg==
X-Gm-Message-State: AOAM531gIvIXSKYwE5EVdh0d0Gcpd3eWeVfPeLksvuXWXAZPnIfQGV8P
	Teyc0pb/p8kjCUhl7CSunq5QvGJtskM=
X-Google-Smtp-Source: 
 ABdhPJwn8ULLWDHx7IaNASclaKSWHox7ZTjMzqiCmvD3NIz4LDWH9Ke6c757EzZUbjJ8affZAKLYuQ==
X-Received: by 2002:a17:90a:6c66:b0:1bc:52a2:18e8 with SMTP id
 x93-20020a17090a6c6600b001bc52a218e8mr13977127pjj.180.1646004505785;
        Sun, 27 Feb 2022 15:28:25 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 s33-20020a056a0017a100b004bf85a94ef2sm11166972pfg.183.2022.02.27.15.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 15:28:25 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] lopper: fix wheel build
Date: Sun, 27 Feb 2022 15:28:18 -0800
Message-Id: <20220227232818.1085145-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220227232818.1085145-1-tim.orling@konsulko.com>
References: <20220227232818.1085145-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Feb 2022 23:28:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7067

The wheel that is built is:
lopper-1.0-py3-none-any.whl

Set BASEVERSION to 1.0 and use this to set PV and the value for PYPA_WHEEL
(the path to the wheel filename).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-kernel/lopper/lopper_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/lopper/lopper_git.bb b/recipes-kernel/lopper/lopper_git.bb
index 606dab6..e96bac7 100644
--- a/recipes-kernel/lopper/lopper_git.bb
+++ b/recipes-kernel/lopper/lopper_git.bb
@@ -7,7 +7,10 @@ SRC_URI = "git://github.com/devicetree-org/lopper.git;branch=master;protocol=htt
 SRCREV = "3c81fcce08eeb64cbbde1535abd83572985a8689"
 S = "${WORKDIR}/git"
 
-PV="v1.0+git${SRCPV}"
+BASEVERSION = "1.0"
+PV="v${BASEVERSION}+git${SRCPV}"
+
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${BPN}-${BASEVERSION}-*.whl"
 
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8e5f5f691f01c9fdfa7a7f2d535be619"
 
-- 
2.30.2


