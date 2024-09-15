Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77B9C35FE7
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 08:08:53 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.110671.1726387724431339250
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Sep 2024 01:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTOjTZpT;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-375e5c12042so1898286f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Sep 2024 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726387722; x=1726992522; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1sX8kE4CZZCNKO2Sa9gp976Z3T1u+GNB7agwdKyWA0=;
        b=MTOjTZpTEMj5f+MP6isKlRLpFAoLIa3rL59fXWapWaQS51ae2T6hGxpApXPO3trUq0
         KWphmgRlGYhvkkskmYHz9fQM9teMRlZX/yLWQXdd8CdjPxvRdRgSFGAlUpDbft3w2IjU
         4so3XwBu5F6oOTYnlD7khoQMayFF5u8Mkke0uhGQx83PUKEIYF+zrI6Z81Jv+5Fcm0/1
         EvkYlbGmzbeJTigs8ptlnkRz2X2lL4u8g5NWTeQpVhtYDEA6ktYPzmb/mkyyKA87KExW
         jaQz53rav9eAbaKxMkUjEB7Ok0Pw0ZbPm/N6ZSUtjOmaMMCsntyHW0JtnKckrIOfv9LM
         VT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726387722; x=1726992522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1sX8kE4CZZCNKO2Sa9gp976Z3T1u+GNB7agwdKyWA0=;
        b=Ahm9MtYsbF47g48dFcthWYhkMne5cIk+N5IzD/y8nkFGOVoJ2EvyVxp+C+nSNAm3gP
         RbeMTzVZoEzrj8+2enwMl3C5PdoNE25hQWSC1vqzBg4e73m7nORCdod48OQvtUdJ5bFO
         3IVPE64hWRnVNIgqnn8zkywkANdloDBIfJr2pDlck0q9PPcgvmLI5pT2XNfSQxSJqSq7
         sihKJSXv0vXfMHrX7Gw13BfSHbwTgXnjBjAhrywDrk84V4g6BBHMPd5ocbO5/hJ08mDo
         BTTCV0ZWqE0q/nLptxlfclUKzLtQrNjyFBDph8hZUxfAhAQ0Y/ZOdGfabVnY7avyKgau
         dl5A==
X-Gm-Message-State: AOJu0YzodXx6wDp47DTqwLT/e4RQqJjyrNtdq1JeWIPdIMvc1egyJ2jc
	Vckd3xbrtOSWBEmZUntwAt7kTkFYtoOXPxbWagBsRo41WGRFOdFw6ooki1NU
X-Google-Smtp-Source: AGHT+IGqicj2ypqYr/QFe2a/Pz6bywf95LW3DN5tcAaTvqUjzOHPc0I1ogAAheX4TEigU2uq9n143Q==
X-Received: by 2002:a05:6000:541:b0:374:b1fa:bee2 with SMTP id ffacd0b85a97d-378c2d12f36mr7011317f8f.34.1726387721526;
        Sun, 15 Sep 2024 01:08:41 -0700 (PDT)
Received: from localhost.localdomain (2a01cb00049093005051749d710d867c.ipv6.abo.wanadoo.fr. [2a01:cb00:490:9300:5051:749d:710d:867c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780ddebsm4052661f8f.112.2024.09.15.01.08.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Sep 2024 01:08:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] k3s: fix PV not properly bumped
Date: Sun, 15 Sep 2024 10:08:16 +0200
Message-ID: <20240915080816.81614-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Sep 2024 08:08:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8894

This has been missed in commit
4fbc98c93c5a68bde74b4691da190885022bdbbf

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 recipes-containers/k3s/k3s_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index f9443c46..c42e907e 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -19,7 +19,7 @@ SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
 SRCREV_k3s = "16321f2554c50281218f3efe999e085b5c6aeefc"
 
 SRCREV_FORMAT = "k3s_fuse"
-PV = "v1.28.7+k3s1+git${SRCREV_k3s}"
+PV = "v1.30.2+k3s2+git${SRCREV_k3s}"
 
 include src_uri.inc
 
-- 
2.45.2


