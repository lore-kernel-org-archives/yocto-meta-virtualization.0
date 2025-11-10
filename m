Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577BBCCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 07:15:32 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42841.1762758923791312417
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Nov 2025 23:15:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HxIn98dq;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso1912773b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Nov 2025 23:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762758923; x=1763363723; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QTI/YIm2/7L+AkmY6EpITx3o4Qe6spbqMxPCdo9rSQ0=;
        b=HxIn98dqo1pQnE3ivxWZ2UzF9Bqgdh1wNpY5r4ZlWrvEnJUsxZjSR1avVMI6sux/jr
         VZwOb5T9VxJjeL0UbkZN8X2xle0Z4zctQ9ZWDSYI1KXP+RA5CLA09OuW6BEsDt4UtdUc
         iZK3V3nJvODauAHWth3T5cnBbpdhGu1AIIWxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758923; x=1763363723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTI/YIm2/7L+AkmY6EpITx3o4Qe6spbqMxPCdo9rSQ0=;
        b=P+WOCXh/FdFPJYaQA7WLX+K3umxRDC91UC5YGM2wsfp9y2jOHXgarg1dYO0rkTqnpB
         SpeosDqzBeIPf05FGducHSlpC+/pjLcVOLb5nJaGzlNoSo2JI/S4EaKUf3JynZfAearo
         4dAhiRp/F2utNOBRUYlz0xxjbjdyZOowC5MMyXYUpWoqsX2LyKm9EJskvj2mgNqGJY4N
         WdqAlWugwUdIKWWajCcVE6JR2nzNoADTGt8UnWqyKVX9mAoUkY2kPUw4J/Bf1HoKVSyL
         KxL7VNzL4pyaa9iKFN1Qibczl40X5ElS3l1Spoycj4x5Nrk62OSe6YK8T/T30w/BH1Uw
         uxCg==
X-Gm-Message-State: AOJu0YyobtvbpJwfs8eLHN4O/829kbR9jPG6Ly6IrrWyxg/y3rvTZAGa
	YheO9nBBtcnj9SIbVmvfam0E9YeKEF1T/q3HGbsCKuMTmQhICIHm2nCJAK+zATzlsllWeav2AKf
	ZwYckc3s=
X-Gm-Gg: ASbGnculVxl2+cUwuLhmAE3EanAlD0FWZ4KxeCVswQwv6DhPd9nxHp+V9QEIJCv/yxC
	agsaGpXLOA2naYYXcKcI+umzte4l9hE/ARqFISoBP6mUVJHq7+HiUSHKwKoO2gPX1+m+NsC+I2t
	GdlWGeWIxxBe+OYMzvVHKXX0Qx7VHyButwdfdzezbaVQcpStFuH97iarQ6DAJzHoIrx4ihCNisB
	hJSi8elE2tGP8WhZcc9DLzSFSgCV4Mj45npcI4lfjElR1WuFl8q6gPt22ynG7kS+5B85HAYx2nH
	DGGyZxbDx/3HZmUVXvrCoiCIv0YPMdinRzYu4lc2wo0UzBwYYdZzU8ujoS5+7tqZZdAlhjEfLjQ
	R1hzJfXqB7UM6qYZNNHIqCWjhh8XyZ018XLit9qblK0qzeNtHSczRW3kHfLhHLIlzD36iNlCLS2
	txnNDWFJM36ssFA5igE5LAyuD0
X-Google-Smtp-Source: AGHT+IFYdhtS0IEyeTbyAFdsnULbQa+JTdyXZby4nrWRf9QHBel7BDtvNPQh6LfWBt53LzT4v/8MJg==
X-Received: by 2002:a05:6a20:7493:b0:33e:779e:fa7f with SMTP id adf61e73a8af0-353a11a2aa1mr10027765637.1.1762758922641;
        Sun, 09 Nov 2025 23:15:22 -0800 (PST)
Received: from MVIN00352.mvista.com ([2401:4900:8fcf:9e59:8917:fc81:ea70:98b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bad33c80393sm7980646a12.4.2025.11.09.23.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:15:21 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-vitualization][scarthgap][patch] containerd: upgrade 2.0.5 -> 2.0.7
Date: Mon, 10 Nov 2025 12:45:13 +0530
Message-ID: <20251110071513.1199491-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Nov 2025 07:15:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9435

Includes CVE fix for CVE-2024-25621 and CVE-2025-64329

Release Notes:
https://github.com/containerd/containerd/releases/tag/v2.0.7

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../containerd/containerd-opencontainers_git.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index d041b699..3144a5a6 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "fb4c30d4ede3531652d86197bf3fc9515e5276d9"
+SRCREV = "4ac6c20c7bbf8177f29e46bbdc658fec02ffb8ad"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v2.0.5"
-CVE_VERSION = "2.0.5"
+CONTAINERD_VERSION = "v2.0.7"
+CVE_VERSION = "2.0.7"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.43.0


