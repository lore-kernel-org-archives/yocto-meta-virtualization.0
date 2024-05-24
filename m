Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38422C25B7D
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:09:31 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3525.1716577770318063377
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBepZo/5;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57857e0f462so1137801a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716577769; x=1717182569; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XEYzPZKQsN4knP279W50sbUq9UXvmWr2Y6XYfvGqvU=;
        b=XBepZo/5VJpfQ9feV0ZdnA7UE0+e4D46Bar6nSdi5yqcq4ae2Q0Sz0achgj0h+hruy
         SvVYEcywTymjkaWiMoGbIqgBZQ7SqYFj4+8lwwMgzFMLLNAqMtf1m2mSRpDGtpVg95Qh
         tZaOphsDoEEIj7enbKleqreWdoTcMMnARezul7QQC2WkgPTQ8IcR+LWAyEjuXOv0O50/
         7QDC0XTFVdpFf45lzw8macTHHGiTV+7UvqgYBn44waweVRSECHd+/H5ZB/+AEtm4s1Ga
         blaABqmfsivxypanZVVy5RzD5iyn4+1Q7NDFD+v7NtP6d6szQgNQzdd0x2pLbJ7LWCnZ
         eVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716577769; x=1717182569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XEYzPZKQsN4knP279W50sbUq9UXvmWr2Y6XYfvGqvU=;
        b=gZNFj7ptBl4rkiBYXRPkxZh2TgFa3GhgmB3S9O9y2BFHmFaEBdufZuU3EXvTInczsQ
         aKH1LvfJNBBWTaT2iVyBePEJdVHARu/9u6TvA5enJF0Umb03C4ZiJppk8T4IW58aZqLZ
         9aG19SavoMU+W2iY5BRLlsHKAU1SZfBGDxTkTPHuS+RNhAcIRslL72yZ3yrE17DUXRyE
         eTqwFGPBOhAJbONooyPqkTaY/oriQZVLrXwUvKRr7IKJKJdt0luW75AtdzPDZ1iOD+/w
         2peOKDPPdNVWvB3AHThe4rs2uofpc+ozWVGKL4mor81Rmq8NuY6D0JBAbg+MldY7hP33
         uZfg==
X-Gm-Message-State: AOJu0Yx4Mt7vK0UJeQ1Bi86sRK4o55eRw5Xj2ysW8J7IbJuLeq4SC7Ck
	bYID4FKxtEVI2pBYWO91Kx3UNg46rY+Bd2CQ7crv9FMfQGYAHwYPPMwLJA==
X-Google-Smtp-Source: AGHT+IEu9PXTB2RknLQNezqk5VYOIcXKHfod1HBvJtd/q+fabOz0ChbXLDKqs1K27+mLomWbIHFVXA==
X-Received: by 2002:a50:a45b:0:b0:578:5851:b0da with SMTP id 4fb4d7f45d1cf-5785851b1a5mr1561563a12.36.1716577768413;
        Fri, 24 May 2024 12:09:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57852495ed5sm2100063a12.68.2024.05.24.12.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:09:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC][PATCH 3/3] go-md2man: use GO_SRCURI_DESTSUFFIX
Date: Fri, 24 May 2024 21:09:15 +0200
Message-ID: <20240524190915.1241716-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524190915.1241716-1-martin.jansa@gmail.com>
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:09:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8757

* see:
  https://lists.openembedded.org/g/openembedded-architecture/message/2007
  https://git.openembedded.org/openembedded-core/commit/?id=cc4ec43a2b657fb4c58429ab14f1edc2473c1327

* fixes:
  http://errors.yoctoproject.org/Errors/Details/772683/
  no Go files in TOPDIR/tmp-glibc/work/core2-64-oe-linux/go-md2man/1.0.10+git/build

  http://errors.yoctoproject.org/Errors/Details/772689/
  ERROR: QA Issue: go-md2man: LIC_FILES_CHKSUM points to an invalid file: TOPDIR/tmp-glibc/work/core2-64-oe-linux/go-md2man/1.0.10+git/git/src/github.com/cpuguy83/go-md2man/LICENSE.md [license-checksum]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-devtools/go/go-md2man_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/go/go-md2man_git.bb
index 1d96bb1b..73d8d167 100644
--- a/recipes-devtools/go/go-md2man_git.bb
+++ b/recipes-devtools/go/go-md2man_git.bb
@@ -9,7 +9,7 @@ BBCLASSEXTEND = "native"
 GO_IMPORT = "github.com/cpuguy83/go-md2man"
 #GO_INSTALL = "${GO_IMPORT}/bin/go-md2man"
 
-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https"
+SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
 SRCREV = "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
 PV = "1.0.10+git"
-- 
2.45.1


