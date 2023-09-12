Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B468CA0ECE
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 07:20:55 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.19664.1694503245636677762
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Sep 2023 00:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Xh7uvKi/;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-52f31fb26e2so3257513a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694503244; x=1695108044; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7uupswudLp+VAUdIYtmb5VTcYQ2Q+g1pbusgIo7/rA=;
        b=Xh7uvKi/DknPBU1aGHtHufO3zjFEFZmCIWGb35xjyBHiOlO/I+gpJvuT36TBDVJvTL
         WjgVKIEfBlvLaHV+QqiYHEzZ1qLJ/ZKdUVUwu5S+uVmHAiwYLhYA/gDVGec4S0fUpkzv
         YK6p91qeoLNRCUVOFoKww8yz1bqGI1Sk/XjUXxhpmHeGP2goPsaiLl37F1bJDwyltHvO
         TlodLjwhKCjaKB6oBGCqf+cyRYdzBfp0EJVZ9Fnd3b0etR2EmkHJhNIvzdHgMG/umUgV
         7QTQXzu6Mit7oMAU5X5QrnGdYGE7XVI8lu+RSlk6HS0a1+3ypa9vwgAbk5jeStY7ffGx
         KMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503244; x=1695108044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7uupswudLp+VAUdIYtmb5VTcYQ2Q+g1pbusgIo7/rA=;
        b=JeQrxZxQhHHI+bkd7Q16sujSY89tgVY607pc6EEVuGrPNmhQWTDCE5ZUIwC96Md6TV
         VuBUjUjgotaw1hHxWgInXWs/MXuajR8/uovYqNhp0JWtF6w1R3Ruwaa0fgOe3OT1DDn7
         eANmybsGsbRaiww6U41mgejLSDXWpMca5n6C8oJAckej01qK+iw2X1ye2uGDjLWPMe8P
         mHczkgV2/XFsReCmho7INmp7haQng7lcnSJ6iU93KYlP4lygA9DkseT/FHLG4bRzztKR
         Kjjfm+UUz6bMY2LNXdHUcuJDnod01UFACMWvuGEuReqqtlJJSrSMIOo8DfpFMRH/ixDV
         00dA==
X-Gm-Message-State: AOJu0YzbfzqIrt6INnUlPLwU4VTsi9xD8CrpRUQtctuS0QjMakTBSnLY
	FDPHEyjix/UWFN7a/OhS+e8eDS/V51I=
X-Google-Smtp-Source: AGHT+IEDWcU1iyUgoZjZ61rSzy0dM81XBLYui9Uc5GyeZRc870nbG4Tgtyrz8wvdNQBhB5eWTxNxuA==
X-Received: by 2002:a05:6402:153:b0:52a:250e:a04f with SMTP id s19-20020a056402015300b0052a250ea04fmr9626875edu.33.1694503243504;
        Tue, 12 Sep 2023 00:20:43 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402120a00b005256ae8494asm5468298edw.17.2023.09.12.00.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 00:20:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Mingli Yu <mingli.yu@windriver.com>
Subject: [kirkstone][PATCH 1/2] go-context: Switch to main branch
Date: Tue, 12 Sep 2023 09:20:33 +0200
Message-ID: <20230912072034.89009-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Sep 2023 07:20:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8294

From: Mingli Yu <mingli.yu@windriver.com>

The project has renamed the master branch to main.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/go/go-context_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/go-context_git.bb
index 37f39b38..0959054b 100644
--- a/recipes-devtools/go/go-context_git.bb
+++ b/recipes-devtools/go/go-context_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
 SRCNAME = "context"
 
 PKG_NAME = "github.com/gorilla/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
 
 SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
 
-- 
2.42.0


