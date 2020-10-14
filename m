Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.571.1602685890803544659
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 07:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XE7/ZYMt;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id u8so5190838ejg.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Oct 2020 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dElGe3lu94LernfHoBdwgoJLl+YsfwY50Z2izpP1WTE=;
        b=XE7/ZYMtf6Oqs6cNpPD7+FeG+Ob4ZR/vdvm8o6lJIQZujHv8VOkot9mo9XTfxAUJU0
         aCHEcTV0CCyJBDVVC8cWTEFIqpCyBrT+1qSwp6FUXPg2PGHH0LGf/0RpVKXkuUANIuYX
         lKczMjodOldSR0mDs35ymxGK60EqHSNgytS4Q1LjiZMofy02YgJ5X41RgHlx8HUkxVZM
         n3PvFiNXM6OKXRJR8GIEezJczjOW5WUhHXNsXbH2y28UruNmjJzMT/b548sqpSNkpgOJ
         p5WrbiZSStXXOwx/prBHMbc9ilcsSV3n+xMgO3iez5yUngpvXOk0cCvnBFkgPEtLfqYK
         D1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dElGe3lu94LernfHoBdwgoJLl+YsfwY50Z2izpP1WTE=;
        b=cCkPa5yLDtJ5CDtvDNW16q+BI/3LcNGnJFpYyyj8/XsY14BPsSWxWMmMKnzdnFEw6B
         kGQ3oeHvLl+bqdVPUfKcl28hI4zbZN0i78rMkA5R2F4x1rOUifMulZ3Yik3jD5zvj9h8
         ysgbW3iCAJqbcSYvxFS5UZh5XaraegGVfJkkSHcGql9PUffL9Sw+4GetEsDDI9UEnw08
         vYZtPJt6ksEZmKl5fA/iom6Y4/CFe6psSgzCbN35UTKcW1ltSoexPTh9TtXWTiLN+Xlo
         wc+gi817cIHrsPLL5GwFaWS89zPRpPlWGSmI832zcJJiaYymrBtEbfShHXIXhQy64vq8
         pXoQ==
X-Gm-Message-State: AOAM532yKt/DkLc8hRdIortQKZXgx3l3vIe2dknh2Iw/C9zM1ibnfBmE
	moY+ghQijszYZe4wLD23rfjbBBqPj1o=
X-Google-Smtp-Source: ABdhPJxgUSvT2mftH6nN1uHgtalIIyQDyQPItLsNIN0kNOwTIyUO8FUnZi18LojTEz5ibCA5Vktu+A==
X-Received: by 2002:a17:906:ad87:: with SMTP id la7mr5458221ejb.85.1602685889030;
        Wed, 14 Oct 2020 07:31:29 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w25sm1860917ejy.123.2020.10.14.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 07:31:28 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] layer.conf: add security to LAYERDEPENDS
Date: Wed, 14 Oct 2020 16:31:20 +0200
Message-Id: <20201014143120.423865-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes:
  NOTE: Resolving any missing task queue dependencies
  ERROR: Nothing PROVIDES 'libseccomp' (but /OE/meta-virtualization/recipes-networking/slirp4netns/slirp4netns_0.4.1.bb, /OE/meta-virtualization/recipes-containers/crun/crun_git.bb DEPENDS on or otherwise requires it). Close matches:
    libcomps
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'slirp4netns', 'libseccomp']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/layer.conf b/conf/layer.conf
index 16d071b..e2cdf23 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -38,6 +38,7 @@ LAYERDEPENDS_virtualization-layer = " \
     networking-layer \
     filesystems-layer \
     meta-python \
+    security \
 "
 
 # webserver: naigos requires apache2
-- 
2.25.1

