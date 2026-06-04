Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DDCCD6E60
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 00:41:34 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1254.1780533689453569818
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 17:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Lk1uMp0J;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c0b944f6edso1368185ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Jun 2026 17:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533689; x=1781138489; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SF3QtKEMKe4Kv5sFWPv3vu7XRd2lqmgKZENJMx+1n4=;
        b=Lk1uMp0JHJU84VMNroAjsmTJw3op6vCTWEJqgzxKXkJZK1jDHY8XQBpTa7Kqz9GyQP
         z68ru6MKjq6c2LMxHWmYndOwkI5LnV3yNBjJX7S7MqmDY7RcZSOLbvxv3xX0g7nd26+a
         QHe5+KtL/4s3j0MkWOWU1QWPfAVO1x3Z6gEwec4g+KA303lRB9Txv11VRAtMBo/xJ44U
         xvcoz/T0SQAZ+XFVgHTpPZo4/xdnZOqNNJjX3YJSR9iTbHMEZoKxx1h5aeDGulab1Lah
         IWa2U4PF4SyKnII1vIzADK4vj9KtGJqSXAdMclqyY54kDQsVyxJmQBrnGrc8IW1P5dsr
         Gmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533689; x=1781138489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SF3QtKEMKe4Kv5sFWPv3vu7XRd2lqmgKZENJMx+1n4=;
        b=btNFqQr9m6wS29qTiPIPz++bWkYb40Yq8X2QsVXBCr177of2Zg49G8jNA8/Ws4eI3k
         gsIMNfIA8fpcvQu/wCC1tzEa5qKVsrzO4IzYIyhRo1YPXj3CDxLCVN63+Ge+6v8ERZd3
         WjywANinOkGEJkgK9FPbWrnQFaz6ufK2taJxyEv4AehFYTNGA+egP+GwJjTUjtLyc6W9
         RcJil03cJOjyGFE9gXhVGW8RjMGhA9nol1j14cEFspEtWRps2H+FfKiIBil6u1YomJt9
         0New/d5AP/HEjpWscyDQ5CoBl+3CUqblpYTy9A2EfxzV1BxPliUIggNGFOS8TAPAcUsh
         C2rA==
X-Gm-Message-State: AOJu0YxL6UZWcmyCzDS9i7mmdFWqBrVw9zl22yZAiK2lnU29V60QgkCU
	O3NB8mZYHg6FBiuj+jAl0MKpz+mqopcRwdnYBFaqIXXZyPj1NLH54IZIqH2OFg==
X-Gm-Gg: Acq92OGhgmfyFAhiUCzPGr5dw6uEmq1riUDU/QT+mrEIgRw/g96HuiKRYYYmnHTqTjM
	RNk/MmKjWlFfLezCSFTfj7NfKTlolz/kzw2k9MiYrl2/HKC+NjMeF9QCYbGMq/LqezlfxrsbRA6
	rYYolj18hJKQ0HEcFi3EG4/VhWSLFJ8hjZKEeLfX2ygYLYym1pE98xuNulhAAX4JyjSemiZM8zE
	8EkkaIw9gxSp0vrG0XhPsQTekeOaLGYtHCT2NmDNZcQKexJffhuFb2EVuttYt8irnkkXCIWfutG
	mvJhkVEatkvqfsMNQGqdDhGhOIaJlDqu8BFUxBjnlnG72yvJunUfH3a1oyVqgMH9/HzV0FBa5M+
	Aj8WShgs21ld4aHOUw6NlmvTcTfuPlgYIwxvxPNz7xp2hi9pjHJnFrxB3IEo2cLmjTDdd3VUOvg
	0vZBrk3Ib4pRNR7kWyB0JZ/W4gomvSPnPsl3WRmuK0FGfIV/FmbL17AmJxkLqwXvnzdg4qiTNsi
	ubQi7RV0cbHfX6XZUB4UuxN0wVhdCHLWg==
X-Received: by 2002:a17:902:7d83:b0:2ba:7749:f89a with SMTP id d9443c01a7336-2c163a3f998mr41064595ad.11.1780533688778;
        Wed, 03 Jun 2026 17:41:28 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f87920sm39057215ad.24.2026.06.03.17.41.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 03 Jun 2026 17:41:28 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH 1/2] container-image-packagelists.inc: add list of container images
Date: Wed,  3 Jun 2026 17:41:19 -0700
Message-ID: <20260604004120.97156-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 00:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9847

Similar to ptest-packagelists.inc in oe-core, this list is used by
container-image-multiarch.bb to provide common multiarch container
support.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 conf/distro/include/container-image-packagelists.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 conf/distro/include/container-image-packagelists.inc

diff --git a/conf/distro/include/container-image-packagelists.inc b/conf/distro/include/container-image-packagelists.inc
new file mode 100644
index 00000000..6a50d0bf
--- /dev/null
+++ b/conf/distro/include/container-image-packagelists.inc
@@ -0,0 +1,12 @@
+#
+# List of the container-image recipes in meta-virt
+#
+
+CONTAINER_IMAGES_META_VIRT = "\
+    container-base \
+    app-container-curl \
+    app-container-mosquitto \
+    app-container-nginx \
+    app-container-python \
+    app-container-valkey \
+"
-- 
2.54.0


