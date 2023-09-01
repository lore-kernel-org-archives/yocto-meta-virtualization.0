Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FECCA0FF5
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 19:01:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.3899.1693594882522683487
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Sep 2023 12:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Fbb2l2wY;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so286717766b.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Sep 2023 12:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693594881; x=1694199681; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVznm3bDzWt6+D2xwFIl0a0gHP7m9mqx2bEih1VsC7Y=;
        b=Fbb2l2wYe07cfDxTqe/vOohksIruvIiE/PpiH6jslr/LGsr42O3Z2Asr0RlW6Xsr+8
         bJdGlt0THHyCtwlk90nYU6ys84+3g72x6+Y2QOvkN3FLgGTShJZlkmRFhLFoCfQkei0v
         rkhhFIWfDNLVKnNIHqAxP4jMoukulrh6nJ1/az/twFB7DlYtmBgq3SSYBhc2pAYb9UQ6
         Iwd+SZ67xuWoe+tYmqz8nobgBmVXf3bFYVzLbKn97NegbinXAciuMDuzuYYcJiICue8c
         iut0GR4zDFEsBPPlnbeG0eS5TMm2Lu6EPE+FbfhOTREPTQAQEjGJ2wxILin3PIvZFE5W
         /TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693594881; x=1694199681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVznm3bDzWt6+D2xwFIl0a0gHP7m9mqx2bEih1VsC7Y=;
        b=CgnwJQjPZ/VHKoclOgkKC3DdJKA4cVI0XpiHISj206gS7b+GA87rSdENqGb8oBRxhw
         cmLHHlyrfzzOWndXiPpqUJaRaMFKx36CrnMuQc6UjZwC41RvlmxaJHht0K850+eUkvIN
         eyTQ2UcZ2QlAJClzDU4zTq8mHc0hrjc08ub0ni0xBFCsL+AyWwOU+rXyucCfIZ535d78
         jxjpnmjDJ6tRyuq6Z9E8A8YHi6jyPerNRWUZhWBt3oDvYk+LoPnM7MX+2ClEdyXk3h85
         /n/F8pkh8tl7i7eZrcKHgsyw3y9eVrNzn0CPWmobE83Cmd9TqVNH5vpQgoBWjDlhTunt
         4k2Q==
X-Gm-Message-State: AOJu0YwLalUZigCKnjD6pBhKBbVactqp6tVY/DqDk6Iwnv85EGD3Htna
	1QajyJmrFLGUq4oN5AEGU7KC4UeRnJw=
X-Google-Smtp-Source: AGHT+IF+aBY2RRnjOYYO5vMk2oc/fQJkYKU5hvy4cP7Aa+ssGF6tOhKJCExJOcaRNBJi5AmbkOmR7g==
X-Received: by 2002:a17:906:9bc3:b0:9a4:6437:3256 with SMTP id de3-20020a1709069bc300b009a464373256mr2423063ejc.39.1693594880712;
        Fri, 01 Sep 2023 12:01:20 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ss20-20020a170907c01400b00993159ce075sm2312015ejc.210.2023.09.01.12.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 12:01:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [master-next][PATCH] virtiofsd: add seccomp to REQUIRED_DISTRO_FEATURES
Date: Fri,  1 Sep 2023 21:01:01 +0200
Message-ID: <20230901190101.3898929-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Sep 2023 19:01:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8264

* otherwise causes world build failures for DISTROs without seccomp:

  ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb DEPENDS on or otherwise requires it)
  libseccomp was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/virtiofsd/virtiofsd_1.7.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb b/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb
index 7224888..b8a9382 100644
--- a/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb
+++ b/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb
@@ -6,8 +6,11 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
     file://LICENSE-BSD-3-Clause;md5=b1ed361f9fc790c1054d81a7ef041a34 \
 "
-DEPENDS += "libseccomp"
-DEPENDS += "libcap-ng"
+
+DEPENDS = "libseccomp libcap-ng"
+
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "seccomp"
 
 SRC_URI += "crate://crates.io/virtiofsd/1.7.0"
 SRC_URI[virtiofsd-1.7.0.sha256sum] = "6f043afa23aedbb18f36084b9df831796a9e4c62e73a16fe557de0cf30d7708d"
-- 
2.42.0


