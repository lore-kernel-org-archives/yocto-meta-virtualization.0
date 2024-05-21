Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3EDC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:01:34 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.16925.1716289287892437352
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 May 2024 04:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZS4oMQl;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so6447136e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 May 2024 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716289286; x=1716894086; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J+91pCwMiIC42s4Dp6rJI7bu4beGtZXH/TTJoni/7Es=;
        b=IZS4oMQl1N5DYp845gptNWVhlbGmIcbdWEeC5uMb07RkRRuys1IqhVc411SHFuSLFQ
         WED5Tf1dH3SPjAX+zU3iOQFTa30EIiqrop//4fdqnwNXvlZzsMFi4Qk4T6nG2tM/gYu+
         Fu/9eppKXJf8faHkJQNAnmoygz3lOdJeh5e4UPYMsbM4tHD5CBOC6Yrq8F67Do2YJsBn
         XGmrLLoMjen4iSOu3fQC7Z+9J1VsZNviDo5bypOzuuboPDq/Ye9/yziknKI/LzRMzk4r
         A9LZRvnaFnOTiQKwQoB2FKtsBVoV7nySybcmjwTj1JSDPwuKs8qTkvSvOs8wL+OUbxB/
         UK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716289286; x=1716894086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+91pCwMiIC42s4Dp6rJI7bu4beGtZXH/TTJoni/7Es=;
        b=ItAIvEXKZF98pnHttCgKndoUAk8C5SHtLNa+FizM+zZtQSUDBfvYvtiGO8BVC/f262
         w1oL0PHTGVrUIQyxl2cSuzDl6gbgP/8vPBF6QwvscHRs35eBaNKRrCfLT2ie/7XTjeGF
         Z3z+6f6097YVkerfu2w9fFKSOnnuGLBaIECropLe6PDbktet2yvJsH0fu7+d5Fjt8MmC
         YiJ6FS2mbgFtmXuHyJFZptWR2tQKHkjN8XzwP19wgGe5KQ/rKC6KYjhgoBV6O8pvPart
         B1Q+wBb0Yx/QMOAeynVVFhKNKJlJb97XNE9dLf9gnx/qxEJ3aP3CwtHydWWomI7Z9vjF
         8MDA==
X-Gm-Message-State: AOJu0Ywmg9CA08ZHnxpvW1jUoVlKr5114Z8Q2VrKR6z0pO0mDtg7Dxep
	i96q9sGvEUnzBL2/ZOzuRhv/F+Y2P+Utz72dZ9irHm9EOLdMmvDN13Ob3IKx
X-Google-Smtp-Source: AGHT+IEH2rvv1bU6Il407uX547A7N0XthfFXfb9EWGFDMQPIrgnNeIQXkCtID50VXjmN1Z+ygH8V5w==
X-Received: by 2002:a19:f001:0:b0:51c:adb8:8921 with SMTP id 2adb3069b0e04-5221006c765mr18260198e87.58.1716289285487;
        Tue, 21 May 2024 04:01:25 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f882086f0sm496417235e9.42.2024.05.21.04.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:01:25 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [[meta-virtualization][master][scarthgap][PATCH]] docker-compose: drop SRCREV_FORMAT
Date: Tue, 21 May 2024 11:58:48 +0100
Message-ID: <20240521105848.6817-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 May 2024 11:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8732

We currently only fetch from one SRC_URI so we can drop:
the SRCREV_FORMAT and covert the named SRCREV_compose

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 0765012..06d6c47 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -7,11 +7,9 @@ DEPENDS = " \
     rsync-native \
 "
 
-# Specify the first two important SRCREVs as the format
-SRCREV_FORMAT="compose_survey"
-SRCREV_compose = "3371227794f5f3645f4f19829c60a741635ed329"
+SRCREV = "3371227794f5f3645f4f19829c60a741635ed329"
 
-SRC_URI = "git://github.com/docker/compose;name=compose;branch=main;protocol=https"
+SRC_URI = "git://github.com/docker/compose;branch=main;protocol=https"
 
 include src_uri.inc
 
-- 
2.45.1


