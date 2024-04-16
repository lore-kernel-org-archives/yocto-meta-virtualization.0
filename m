Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FFBC04FF6
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 05:15:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.13044.1713244507776317573
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 22:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MzAyLINk;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-343bccc0b2cso2607864f8f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 22:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713244505; x=1713849305; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DAg+iozhGOgnLFTZWZG4oXPC6ICJUe7kzSeDTY6DWg=;
        b=MzAyLINk6ASJ1I+sCpCqToKIHppHIu06X6cIgg6u9i54FUUh9Yn33RiDbrMRQu9mnP
         c1tAo7gSr4Ao155upQTuDJfLXKFLpSqSsg5C8OI0qcg+/WvQDuFV31BvuWPF/UeEAe87
         sAgwpdcbwOjY6QJf6eOjR8kjqOMWtPRHn7Hv9+fm64ovOlvqXFZWA7YoiBZaz9S+C4rQ
         WGxaUV6KzTlXLJ7i70VWtBIcJSWgbsJKmyMBbiVCyqv3F2dOg64pnsIDPUXEex4eKM9A
         769JllYzVDozu5N1NEdpLqN6xqc0GPdagNdV2WLsHmOM4u8GRYsiLWYp4EDZ3cuu5Omj
         PQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713244505; x=1713849305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DAg+iozhGOgnLFTZWZG4oXPC6ICJUe7kzSeDTY6DWg=;
        b=TJ10PytX7Vg9wSMMI+tgyeZ1zTxtecV+AMrQZfljPFUOcO5twIyGifmYhjfoZWaxp7
         F4GzaSVquNjygsLo1M+jih6/kv+RHit4MPXyi9fBzOTAxtfD7QRXQ3p9GGXFEMt3PuCQ
         w6oW8gB7mXGy39Ur2wgF9z8fZCcPzQcHEmpT9zTnAWD7qBeRaGtwS3Sba73SMBpWnPbk
         tBRCFB5+rpTc4EO9Ffj01q0RcGPWG2q8Qc+BPyPaDCUfRoRQl/e+tXyZfVwQqHebqKlX
         S3/NnSZ/SR6NL1IOhjrEwDopnp9ivMauH41BfnH+53ujEHr/zDUpGtdiYpZT43Ti2Afg
         Sedw==
X-Gm-Message-State: AOJu0Yw3hkG/3jppLZqOGWZ6pTcPSlt8QgAYaPx/TKxKXQgytB1D7VVp
	q23ZsgU2a6EOnIFHAsu4c35fF+QOqeOVbyRBy9+KcJHyeJWrUpmnyhT5IQ==
X-Google-Smtp-Source: AGHT+IGMn6iD+dtIZs5lnDcglSrRlN3sEuO/VxkpKjkU2nE+j60L86cJY7b3mbJkokSwEWVhIHGSRw==
X-Received: by 2002:adf:e80b:0:b0:345:f96e:39b4 with SMTP id o11-20020adfe80b000000b00345f96e39b4mr6673335wrm.8.1713244505431;
        Mon, 15 Apr 2024 22:15:05 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4b46000000b00341c7129e28sm13707478wrs.91.2024.04.15.22.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 22:15:05 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: meta-virtualization@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH] python3-os-brick: Fix syntax error
Date: Tue, 16 Apr 2024 07:15:00 +0200
Message-ID: <20240416051500.1077950-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Apr 2024 05:15:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8680

RDEPENDS:${PN} must have a closing quotation mark.
This error was present since the recipe was added.
Scarthgap catches it as a syntax error.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-openstack/recipes-devtools/python/python3-os-brick_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb b/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb
index 093b673e..cef666d4 100644
--- a/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-os-brick_git.bb
@@ -40,3 +40,4 @@ RDEPENDS:${PN} += " \
         python3-retrying \
         python3-six \
         python3-os-win \
+"
-- 
2.44.0


