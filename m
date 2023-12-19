Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB7AC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:29:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8674.1702978163413134832
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 01:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P753z1hm;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so42654875e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 01:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702978161; x=1703582961; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mPVkVLtpFC1DGAlpxHSMHfRjmJBIeGIfaQC/KOlJFHU=;
        b=P753z1hm03I1D7xst2IWp9zyAFwD2BMHOxS6nAVXL28h6i/YqSISqgPIWsVNXY0m4b
         K9Gu8vijCmiVePpYlPc8s6VufCgy0tVrSBvXIQJWPzKNtmStECche9GXvOTVCcKD4Hty
         PDu/1/3HYc4UtNvgiWypfRPcgHQgdaE2d+obNJq6myGTR8ePNnqgWkf9lWWNp5vRCAYR
         dCD63nzbRQMawlP0EluWbg+LuLRh/r3CZ6lbwnSxUhuqdGvNxxOiBOFSO5aNoyCNNseq
         CnGqVK8AcGL2mxCX1SnZNBMUk58ImodZsp9F9FL8aIFhezmsuvIserKeCkMZIFcE2hp8
         RDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702978161; x=1703582961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPVkVLtpFC1DGAlpxHSMHfRjmJBIeGIfaQC/KOlJFHU=;
        b=RzdgfJAe0lSkZmmi8w5jjvcO8We1dQz8sPK7rzNqhlvizUo5XSE9aXRKozINFu7HBN
         USIxw4HwJ7C6z2jF1JOpOMmM5yFlMmHNM0+VzcBY3bl5WxoLh/OxD4KbbSHzbXuglGcM
         ucg2gB5lbMUauXHsTs1Cw16FcTAgqKpLRZwDCTyD1fQy4nuYI0YW2GkRskLCyhJekiLj
         ldin0M6to/YL94TXt9n7V34mOJpqAMlfTD8of8oEn0xRwlHqDmdTM+Exfjfbfa5p9m/S
         sDtmRbQt8qYysSp/3f9u08RRYOWQDUrCdhEst4IVIRGWdlDEMXnAebOk2Zm4I9S1DT3p
         R3GQ==
X-Gm-Message-State: AOJu0YyaUAsf9L17w8q/S9KEEcD1RhlYyBg7S6lOVlFUdBd8JtfvcWCP
	LvRyZh+iAh02JWZp6XDI/H/xsvmw3GPDjQ==
X-Google-Smtp-Source: AGHT+IGb5c2Lxtmyrl9LBqYSCYwfw1ZL54PTJ9NJ12OIGRdlL9ryg8btjFMMhZc19oDlLnu0kQ26jA==
X-Received: by 2002:a05:600c:518a:b0:405:4776:735a with SMTP id fa10-20020a05600c518a00b004054776735amr9284270wmb.2.1702978161083;
        Tue, 19 Dec 2023 01:29:21 -0800 (PST)
Received: from peterliu-Precision-7530.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c19c900b0040d18fdfe96sm1918601wmq.44.2023.12.19.01.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 01:29:20 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 0/2] Uprev podman to 4.8.2
Date: Tue, 19 Dec 2023 10:29:09 +0100
Message-Id: <20231219092911.14331-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 09:29:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8517

From: Ming Liu <liu.ming50@gmail.com>

Also add instructions to test podman system service.

Ming Liu (2):
  podman: update to 4.8.2
  podman: add test instructions for podman system service

 recipes-containers/podman/README        | 21 +++++++++++++++++++++
 recipes-containers/podman/podman_git.bb |  6 +++---
 2 files changed, 24 insertions(+), 3 deletions(-)

-- 
2.34.1


