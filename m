Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D8FC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:09:31 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.3517.1716577768151128743
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/enn1yI;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52905ff2a9eso1781697e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716577766; x=1717182566; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ez/3Di/A0QCenVmPlcOUqT1K8QWNGHP8hdGM5/Rq9zo=;
        b=V/enn1yIPA5ASW3rowBYsnh+rJ5AkBScYiEhB9R0wqPbvHPXWUvfX9EoQa5FW9wmHc
         S1Z6o3ReC8px+LQjBh7zNCuygGtziXH/3h6t4ku4VOj8mlg5DbnlovjUm40N6TnA0Fss
         aTRj6tzF2ch0T8ov/tAGVYSM/lKkv8JD9QoStXKMacrxYVu/LETfZX4izUQ4pJgqRS38
         RpLTJ/vAq0RUM+JQxaHf75rirQUTkHh4IwfvgmO5slIqox62AhVT9W9SQ1dQNa6nVVCO
         Xwu+zxC5uCsxgkQphBSJwM14+myBxf4yiLPLdCZH8YTRVOLW3ZLdMabzP9Hn2gD3QdWr
         6BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716577766; x=1717182566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ez/3Di/A0QCenVmPlcOUqT1K8QWNGHP8hdGM5/Rq9zo=;
        b=YZIElpm8IoJjRTkTE6dgpd+jeLArsfEQ4zEwaGcEhibyPYbWJ8FoUn1zBLRxzXZhKp
         3+VEO3TqFIPz6EeQC45KM4CKY2+By4YgTpRNSMoI8jcHfB7CI5JZMUrhMImVlmJcvRRe
         IhrUll6xnNRxjQZEpKCYn2rKyBHpyDQGM6cKxfw3V7cW3QFIQM5XsA72pnC9KLZcv4K0
         WHcSga4vcFJ2+bS89sRjDzMUzAq7Bx5ydPEt/su+iVE7V9ZqehtPwIXLMd2YunYNabYm
         aPQC2ufoFAjQOzzNQZ5wVa8NJ6LSrTChfRkbzenCgflexL8uA3906eqE2FX/VWJuv685
         ZJIQ==
X-Gm-Message-State: AOJu0Yw3AYDLq0PBV39wuodwUMGFhZETK6BVSbrYxpdWEx1iR3VCCpbp
	wGMT/86O/icgWRamhqAyOWrqhDNN4XDkKrh2MaVxOCXyXEgwdlVl7lCTbQ==
X-Google-Smtp-Source: AGHT+IHXZQ7VuMedUzzZNEmPO9f/t+9FfU/KwCQBaiVPXZdGDFUJoAghBbVqyqF1UAYr3dRF0yaE3w==
X-Received: by 2002:ac2:5f0b:0:b0:523:d1ba:6431 with SMTP id 2adb3069b0e04-52966bad418mr1546229e87.66.1716577766225;
        Fri, 24 May 2024 12:09:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8dcb2sm169902766b.173.2024.05.24.12.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:09:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC][PATCH 1/3] netns: use GO_SRCURI_DESTSUFFIX
Date: Fri, 24 May 2024 21:09:13 +0200
Message-ID: <20240524190915.1241716-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:09:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8755

* see:
  https://lists.openembedded.org/g/openembedded-architecture/message/2007
  https://git.openembedded.org/openembedded-core/commit/?id=cc4ec43a2b657fb4c58429ab14f1edc2473c1327

* fixes:
  http://errors.yoctoproject.org/Errors/Details/772686/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-networking/netns/netns_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index 357275c1..be41d2b8 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Runc hook for setting up default bridge networking."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7bac31faf84a2d7e88972f562a3ebbe5"
 
-SRC_URI = "git://github.com/genuinetools/netns;branch=master;protocol=https \
+SRC_URI = "git://github.com/genuinetools/netns;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
            file://Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch \
           "
 SRCREV = "00d5d07ab1c8afcf481ffa5958719943b6ecfde4"
-- 
2.45.1


