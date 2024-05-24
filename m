Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A513EC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 06:28:08 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.9803.1716532078955091162
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 May 2024 23:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X4eRM6tB;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5785f861868so107779a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 23:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716532077; x=1717136877; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tjyXfzOdm5yAExkiwMvdTWoYtWgZ5+rGMN59HgN1Cc0=;
        b=X4eRM6tB6G9V6W/C8RfjAJEfzrfDXRxou5DXeWVxE6+8FB0p1545XljJsAaj+UF5Iu
         bp6O1HNSWscoek5pvnWc2yBgyrvqf4dpPS5n+G82uN2mmySMrQDp4YejySmJn3pO7CvQ
         SBAhbVegDC4DnIP6mzDVJFBakTLVNhKsoRNebHu2g7kvUP5q+KaTpgi/g6Lcnk1FQIIS
         KlDpVHMjOaEDDtsERU037TtYcOR5ckHQT/UdFK17KEIZh/ZVlAFgCpEOKi+dlj6PImhg
         deynwQfdRmnDuSXtNu+GLq7VNx2IlyFm7Snm7T8R+5fhjfnHQvnYo9RamXfGBaLSBzt/
         6QfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716532077; x=1717136877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjyXfzOdm5yAExkiwMvdTWoYtWgZ5+rGMN59HgN1Cc0=;
        b=vZoOZbPRy/7w4ND7k+BM2oG43PyZQWdN2e0vWvuUc8ZLYo5hQ+sYJGwqYM5FfRDtr7
         wmblC1LKiyTEd4Fjhjq26UPZkV8H6IFPpUhPUAeC+ISt/rGEgC6zO5zaPW6orotFvICv
         3xa4EHwGwjGLJOowRkBunqlypQLVomqRfoOPr38JdNy8z+Wvz/Tg4JrWntuQ5vQSKsk6
         esgk1s+ZdOZ/O+FXsqxDrh1IIABd++GsDtQhNAaQaca0layvhZiHeLV5xxcZ19hm9tvD
         pId80kz8qXdGcPTD9a8Xcml1qVU9Eji5G+agmUS116//W07G8HQF/ElpBd5VpXeoBqhZ
         ZalQ==
X-Gm-Message-State: AOJu0YwKC6piHEL9mdxLKOI1LAN9CCLO5FsFdL/FTBeQN0TzLPRnBHjN
	rEKA3TDEElhkvjQEF79AbSygtOWl7FfLuetvcgOuQi9L18tmKaqhsVFx3Q==
X-Google-Smtp-Source: AGHT+IH6+4/07xqijEJA19AHHTmLFEHXpPvajWuqWHe8l5iYfRzilO23So/WDGuM6upBpv4+XymASA==
X-Received: by 2002:a50:bb0b:0:b0:574:f26f:cb63 with SMTP id 4fb4d7f45d1cf-578519a2a49mr757427a12.27.1716532076859;
        Thu, 23 May 2024 23:27:56 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785234b3d8sm1067041a12.6.2024.05.23.23.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 23:27:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC][PATCH 1/4] dev86: ignore various issues fatal with gcc-14
Date: Fri, 24 May 2024 08:27:43 +0200
Message-ID: <20240524062746.232409-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 06:28:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8746

work arounds for:
meta-virtualization/recipes-extended/dev86/dev86_git.bb:do_install

http://errors.yoctoproject.org/Errors/Build/183127/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-extended/dev86/dev86_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/recipes-extended/dev86/dev86_git.bb b/recipes-extended/dev86/dev86_git.bb
index a3d0fded..5adf2826 100644
--- a/recipes-extended/dev86/dev86_git.bb
+++ b/recipes-extended/dev86/dev86_git.bb
@@ -41,3 +41,20 @@ do_install() {
 }
 
 FILES:${PN} += "${libdir}/bcc"
+
+# http://gecko.lge.com:8000/Errors/Details/832862
+# http://errors.yoctoproject.org/Errors/Details/766930/
+# cpp.c:548:1: error: type of 'ch' defaults to 'int' [-Wimplicit-int]
+# strsave.c:47:42: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
+# strsave.c:55:26: error: implicit declaration of function 'hash' [-Wimplicit-function-declaration]
+# strsave.c:66:32: error: implicit declaration of function 'strlen' [-Wimplicit-function-declaration]
+# symbol.c:60:42: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
+# symbol.c:72:30: error: implicit declaration of function 'strlen' [-Wimplicit-function-declaration]
+# symbol.c:77:13: error: implicit declaration of function 'hash' [-Wimplicit-function-declaration]
+# tok_class.c:305:43: error: implicit declaration of function 'strlen' [-Wimplicit-function-declaration]
+# tok_io.c:219:20: error: implicit declaration of function 'atoi' [-Wimplicit-function-declaration]
+# tok_io.c:488:20: error: implicit declaration of function 'strlen' [-Wimplicit-function-declaration]
+# unproto.c:188:51: error: implicit declaration of function 'strcmp' [-Wimplicit-function-declaration]
+CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
+
+EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
-- 
2.45.1


