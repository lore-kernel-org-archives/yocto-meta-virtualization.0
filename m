Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A259CD3ABD0
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 16:36:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.63855.1731343001975244827
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Nov 2024 08:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJbtNRaW;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso59897165e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Nov 2024 08:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731343000; x=1731947800; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAwLLl8bbzMZ5NK9dPT2o7JzjsQ6RmMVSKjO7EzweAs=;
        b=XJbtNRaWjnKAvOUfd6LH4oxDfrgvERXgLKGOqlaNqreigOXuaO5fc/axtrM4gwu/HE
         KpJN+xHhHfk4dWq8kFdPZXovM9+TMjJiSjx+X0JI5GZ85Am1owmTz7fN1gTKqzeBUm20
         LM4P1raTjF1YG+X/JGwHSCU/+qrM84f+rlc18A6oqUpw7RenhD6aEaV5HB4+8Mv/dXtk
         v/oCZsL5nbO6jRM/nrsyRv7iFlxAsy2fiWbydrc851f9HS5/yk3Lpdjj3+0Ry1+I+xW5
         H1j4UI5tI8LY40P1MB0q0t1a8y8aIn3uq9fbl5d4/bVfBxx0q6bhO3onf0IGgl8V5oXG
         I2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731343000; x=1731947800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAwLLl8bbzMZ5NK9dPT2o7JzjsQ6RmMVSKjO7EzweAs=;
        b=Be78EbOD3Nq36uNXcK7GjDfn1oIxs0xqOcebxifXOncXRWBAqKph+xHrbDfqb/Kubo
         JVAgSmlYluzTp5U+rXr1TwbAuL0a/MiYSWzMBfpdqfaK8z1+qP5ulla5hOQOBr2zRpdd
         p/2ZhBoD+NJAWaxJLPD1ZRSkBK8FAN2+tXpntE/bE54JzGviA9M+AldoJ41SB06ax8l+
         LJ49JHI64jcEgI2tuybZkvs3CAPCJw3b8AT0osh1VQLGqZLr/CfCDHkbjCm85AuL/1x/
         4RPUz3X7Kcsy9bjp1Z3GgyjExGs7OIxXSxNsExJAfh4kNznb7E2JoCtxIQAFNTU7GpUZ
         +awQ==
X-Gm-Message-State: AOJu0YyTDE+DV1u/j33A/f492HmCATrET+723pjDJii24a8FLEEL5dEb
	eninnGsSAw2X2MVRhHqJRyqvKiE4X4zzWGD+9xyByh4tpzECogOoiTxPzA==
X-Google-Smtp-Source: AGHT+IH+rjyInTf94sFAWMRQALo6TKzlvCVYlomvRZTnkqBjRQU+B1CslkYApv09FZjY6d3yeMG6WQ==
X-Received: by 2002:a05:600c:138a:b0:42c:bae0:f05f with SMTP id 5b1f17b1804b1-432b7505c2dmr143203925e9.13.1731343000219;
        Mon, 11 Nov 2024 08:36:40 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b60cfsm214327305e9.7.2024.11.11.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:36:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master][scarthgap][styhead][kirkstone][PATCH] go-cli: use main branch
Date: Mon, 11 Nov 2024 17:36:28 +0100
Message-ID: <20241111163628.111992-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Nov 2024 16:36:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8962

* master was renamed to main long time ago

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-devtools/go/go-cli_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
index 8a4992bd..37f65c33 100644
--- a/recipes-devtools/go/go-cli_git.bb
+++ b/recipes-devtools/go/go-cli_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
 SRCNAME = "cli"
 
 PKG_NAME = "github.com/codegangsta/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
 
 SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
 PV = "1.1.0+git"
-- 
2.47.0


