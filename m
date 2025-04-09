Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293BAC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 15:14:04 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.11140.1744211634163947765
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Apr 2025 08:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=lAlZ/MQ8;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.222.170, mailfrom: troth@openavr.org)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c56a3def84so639108985a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1744211633; x=1744816433; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uknhXFT7dhROYIbMcRqQwJHEPHAIOGb5oYbXi9ZKxT0=;
        b=lAlZ/MQ8Y1yQOgs9e341KcID0Owk6SVJFLOmZ2Fsw7kiDXn2w0x/Zjp+KbX1dNU6qL
         UapqTcETZ5JQ1rmr5VJcomT8M40v5A7JN44DWb86d2u0hqxCDo/7WEN+IZomhi9W4hqu
         jgpQSW4Tj8x6PmK7a1lyduEztOpZcso0Yn9Cg6Iex2RoLcWZ2Z4VCKj8G0BNnxXq4J5b
         tt0+zmXnODPfGstEv5n9I46UDOhY1kxRkG5sh5YP0JnCX2Pslx2mBxQ8O2ybT2WZu1dW
         tFbzNYjCGGsjMusxWcHoo4PqlsanzP3hml21BRO5Eb5NXl1blZWcFD4a9ZuTi78mwc7C
         BKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211633; x=1744816433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uknhXFT7dhROYIbMcRqQwJHEPHAIOGb5oYbXi9ZKxT0=;
        b=TvuViB/5EvCpa16R18yJ3yRcqDq7KvuM95v8tkFlDk4Bo3mqc1ZBtN1LFjUObADgYz
         qAEwYy21wL7Vkbnn4HNnnt8dqdEZGzRO3JZc6Xv87Nisbn7CSUaMP46XfHuzf+pGscic
         +3i5lG3lLo8plGzaN8ldjuGkCBRv9/T4XlG7CRtxEWQFyAhxtsz9k73OWpM1CCIl/Fdb
         tANcnMtAa0s8mAph4qzJ/Dz9ssLKTqN8+0c5fyHEOlbtbgqa9CzI227k+wdx7HmEeAFd
         kxw5onIP+peDKqL7tUSGwfoVJIV/48mnPGlrFokUiEl/FkZ5W/QaSFpk9UuAhEjy7TN6
         rT7w==
X-Gm-Message-State: AOJu0Yy8toyWRyGYpL1MUaSDguBJyWjTxY3FpCq55IUnFOLVRsVBtMTs
	eae9HWLIpZRAD+A4DI/ovhhQmMego1WiISNRubq1vjga3q3wEBM1gCVe5E2KLbijhSOhaJZoZZ2
	3
X-Gm-Gg: ASbGncuQZvaZh4mmnbJV7nehtErwQ8mbc2+lgaSQ5uVHpFmd1XbWxL3Mh54lnmjR1hS
	iDHWs6/m65UlQCUPx6jsoviAeVf3EFq2UQdOm7HsNK4XP+t4cJuFCTtDDuo8Ze5Mw0af1YLYEOS
	VT/Zpso3v2SCJLla3tGLcy/mgrizf1Ixc3gvRdSQdZ92fiQ++PYcJMqFLhJKTjpOk1O1UV7Zwhd
	PLEHGmbwyXTOhQ5mYOLppytYtlXfPQDghDQdxjUAtDnNmb1VjDlsg5Ase3fZ8aLoV+tj42yJmQU
	YuU1+ffB1IvscDotXKRF8VHkpbklzWZbXoGSzEmudd8wePdbAiQw2XJA9jI=
X-Google-Smtp-Source: AGHT+IFxVCj7qN/QpseKDHtmWlN04fHZb8OmGy0EsRZmFUw4cuExXYbF1f8rdoPTBzP6sODIaF8wzw==
X-Received: by 2002:a05:620a:2544:b0:7c5:6cf5:9439 with SMTP id af79cd13be357-7c79cc31cc9mr462834585a.37.1744211632778;
        Wed, 09 Apr 2025 08:13:52 -0700 (PDT)
Received: from tas-troth.am.trimblecorp.net ([155.63.136.49])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a11e6bb7sm82268685a.107.2025.04.09.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:13:52 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [meta-virtualization][PATCH] packagegroup-container: Fix docker typo
Date: Wed,  9 Apr 2025 09:13:49 -0600
Message-Id: <20250409151349.59874-1-troth@openavr.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Apr 2025 15:14:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9212

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index 21402d65..f5e20344 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -56,7 +56,7 @@ RDEPENDS:packagegroup-container-tools = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'conmon', '', d)} \
     umoci \
     ${@bb.utils.contains('VIRTUAL-RUNTIME_container_engine','podman','podman-tui nerdctl podman-compose','',d)}  \
-    ${@bb.utils.contains_any('VIRTUAL-RUNTIME_container_engine','dcoker docker-moby','docker-compose','',d)}  \
+    ${@bb.utils.contains_any('VIRTUAL-RUNTIME_container_engine','docker docker-moby','docker-compose','',d)}  \
 "
 
 RDEPENDS:packagegroup-oci = " \
-- 
2.34.1


