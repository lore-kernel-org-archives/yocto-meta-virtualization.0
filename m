Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E117C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 13:56:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.30581.1743342979997614559
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 30 Mar 2025 06:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aKzTtEH7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso34733605e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Mar 2025 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743342978; x=1743947778; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=U8APjPur0p/qbfUQ/oZJoT3zXilwSUDsBLhOiIGJgTE=;
        b=aKzTtEH7/q46K7c2BBgMk5TmuiO1ZPmjAEpA6G5S1ajEvDZ/wXeqlLhiAwkgmxf9jr
         nero5QiYyPvthyvyJgHzgBlyhMnQqKA67a+DSYfpnhem8ejbUT+nxsnAV38MdhjrorWY
         WWbfbB/KFvic73I3f8U39a+CjkxEyBc/0HaaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743342978; x=1743947778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8APjPur0p/qbfUQ/oZJoT3zXilwSUDsBLhOiIGJgTE=;
        b=mjecdDfW5Uapwo3pSzi3aI/XboyGOuzoOtuCTuiIet41S2OVs1m9S/+FD1dhXFxHfe
         IQFC1stlDIo9p3dFlblsRd81/ima36rnh0NndeKd0w9zVzMVJIRnxmzjlNoGSXmAzVg8
         34+qlYJG2W+LB8e84p03wBO7/GURG+NLdjYVLodnjvxJuHm24pB3XLZ7xAQFO8sThl3L
         OTkyrv0FI5TaG6uUKmwmixPrVtZ2tVeQOUb09iIkmwHsiwigHqhjHXU0AXw0zSMvkaSu
         1qV8GBlLltfWaZc4zDqw8jd0Am2Yi3fNyHM4CRLTh1aywPBhKifudF8BrdpfAKtIoMBF
         1kcA==
X-Gm-Message-State: AOJu0YwhIMToql9yUL3afwAOoOhVJ7ROh4rF/2kUHQn/zEACv0o/4J3R
	b+T0JnH/eeS3Or/ZgfGBSQYWTVGJeVkH5sHjUf0Dnh9L7kzbRqkfgX87Cucgul9d3BUo1G4NkYO
	Q
X-Gm-Gg: ASbGncurk8tIAy/ZyQBUPVjzlMM4Msxlk6mSmQH3GitGm6UN51S+U6NfEWZic0tQBVU
	CDW6YpvW0+LYOO7i7fqNechir9OZiTAzMvlYJCMOD+6eg0diJZ676VKbR8w7vaZkWQ7KofkK9Km
	XbILAqDjBayuuiNkcBN1XGJVM94EL7SNX7a/SmpWXQNfruyzr1BaCyA89nHxfIYxIlUO78Gmxr7
	olX+jE7yQ0/R342dxNQIwTUDjMLerhQUiRis9T107OQkeMMPzV/m00g9+ORYc5z3tN83VJ5cdEb
	GUkiXQCi9KH+EmFkdNPuquUtWz/KvYtOrb9IGTwPO3C4LhSy5ep5LjQSDETW+5+bM32WpJEA
X-Google-Smtp-Source: AGHT+IEqSOT0b2M0i5BplnZRFoPO8TKFFIP3X1tGZZYG7OVJBtU0ZM+kSZoD3rkN6onr328YM5IzEg==
X-Received: by 2002:a05:600c:b97:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43db6228697mr54776565e9.9.1743342977511;
        Sun, 30 Mar 2025 06:56:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7ae:7c46:3aa2:eb70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff02e75sm92606845e9.30.2025.03.30.06.56.16
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 06:56:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] layer.conf: Update to the new release layer series
Date: Sun, 30 Mar 2025 14:56:15 +0100
Message-ID: <20250330135615.1769001-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Mar 2025 13:56:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9179

Update to the walnascar release.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index fc35ce40..3db840e7 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -21,7 +21,7 @@ BBFILES_DYNAMIC += " \
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_virtualization-layer = "1"
-LAYERSERIES_COMPAT_virtualization-layer = "styhead"
+LAYERSERIES_COMPAT_virtualization-layer = "walnascar"
 LAYERDEPENDS_virtualization-layer = " \
     core \
     openembedded-layer \

