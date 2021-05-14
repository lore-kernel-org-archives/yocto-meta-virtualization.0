Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.6633.1620985928185152824
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 02:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WEPrB3Iw;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n2so43836498ejy.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NUAnxAlwjnmavugQMw2YYpKVD9T5IX5BP7IhkY0Z3x4=;
        b=WEPrB3IwXlju/sDPpxv/TsBrkp+w5/PNgpUL4ES2RZwiU2HL4o8peGrv9CIxrxGoDV
         m6n38X1t6/KT+K/WFrhh/OaJ0Bv9dOdCk5Gy4KJK57/22cOK/gGjTH+P+/WVrB3rZ6gV
         qkerY8DO6RjzyCWEX9Nyux+85nW0OYKWKMh/NwyNwGgNJdvjwYWyjESzkPQ/uzjcvH2C
         /wLCHI4jnPTw4YVcnJ5ZaqZ4CEKhC8NmsYoWDesfSsPiVMymu1jgRwcASrbn/5ARoBuO
         Cl5SlpsMI4vUdwDaSRj4cDreUSoQ+LkxTxzSK09RB2mxK1A9tV2oImXz3ZIwKXR1um5E
         qqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUAnxAlwjnmavugQMw2YYpKVD9T5IX5BP7IhkY0Z3x4=;
        b=lKLWsA6ZrV9B5AUeeV+k8LkL6YzIvxXDQtRUcPrDU5LQgzom15hv9RBivC9qqwMq4O
         oqdCNeDpUq1Bh8jZwOb1PkTbxknDk5DiTbX0LqEnWtievrDFXaS9VyYbNdIlRAo1fovE
         e9K86fD1KBeJwmw7LDlyHim6rfJNlP430gLahaUg8iKewXRSzGDEDpbcGhHzFCbc5ePZ
         Lawpal1FXx1g/d6PYF0cy9jzSFl12+cGi5zJCexpCSAbzNQPvaPFsEva/Ce4oFjEVE68
         +DOjQtAdOu390kGsNQHdiDRPe5hSnMk+ll3R/OLUEVSvNdQ6QNHj9TLMYrWkj78Mrchg
         BhbA==
X-Gm-Message-State: AOAM5309xWpY8I937khA57DWev6gHPfrBRMlVz/+GvrXEnhxKyPgStWp
	XH2wNzR/9WVAr90K65y/8J+AwJEXVm4=
X-Google-Smtp-Source: ABdhPJyb8cfiqZGzrId4ClaZeohbwHHOpobJhVPpxF9dlDdWkEN5ECPb2eJ/fuF8Cf7rV74W+ORfkg==
X-Received: by 2002:a17:906:7fd9:: with SMTP id r25mr2886840ejs.417.1620985926804;
        Fri, 14 May 2021 02:52:06 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g17sm5210302edv.47.2021.05.14.02.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 02:52:06 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] dev86: add dependency on gperf-native
Date: Fri, 14 May 2021 11:51:55 +0200
Message-Id: <20210514095156.1562532-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
References: <20210514095156.1562532-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fails to build on hosts without gperf:
  /bin/sh: gperf: command not found
  Makefile:27: recipe for target 'token2.h' failed

* normally this isn't triggered, because token[12].h
  are included in git repo, but regenerating them fails:
  tmp-glibc/work/x86_64-linux/dev86-native/0.16.21-r0/git/cpp$ touch token1.tok
  tmp-glibc/work/x86_64-linux/dev86-native/0.16.21-r0/git/cpp$ make bcc-cpp
  gperf -aptTc -N is_ctok -H hash1 token1.tok > tmp.h
  /bin/sh: gperf: command not found
  Makefile:23: recipe for target 'token1.h' failed
  make: *** [token1.h] Error 127

* unfortunately this isn't enough, because new gperf 3.1 from oe-core
  isn't compatible, we need to upgrade to different dev86 fork which
  contains:
  https://github.com/jbruchon/dev86/pull/19

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-extended/dev86/dev86_0.16.21.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/dev86/dev86_0.16.21.bb b/recipes-extended/dev86/dev86_0.16.21.bb
index cf64a9d..def7c5c 100644
--- a/recipes-extended/dev86/dev86_0.16.21.bb
+++ b/recipes-extended/dev86/dev86_0.16.21.bb
@@ -9,6 +9,8 @@ SRC_URI = "git://github.com/lkundrak/${BPN}.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
+DEPENDS = "gperf-native"
+
 BBCLASSEXTEND = "native"
 EXTRA_OEMAKE = "VERSION=${PV} PREFIX=${prefix} DIST=${D} LDFLAGS='${LDFLAGS}'"
 
-- 
2.30.2

