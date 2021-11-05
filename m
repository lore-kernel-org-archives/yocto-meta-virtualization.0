Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.6715.1636124324630913920
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 07:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BH+ITElV;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r8so14134011wra.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Nov 2021 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8X4NI32O1SiTNzArDXJAOj78Q31iycoYeCouPtvRH3s=;
        b=BH+ITElVxictT1CnmEzOcoTagaIazWzpYbX7IyfnhNTEoFdfDBZ3T60Yadw9V5Al3Q
         mEPn95V3q3LUsXiWzGw5YQivhDdXqqDZ7t5tJWIAZuBf0Hsu2gicsUwtb7vSBe45lNWx
         16l9dDF8t2gFNjWg+JqFBZ5VGlb2KUSqP1nrt+kzAyVEUDUTxrNLVM64Mm0Tf3ULM2Tv
         as7gFRjyDLViD3PqIyLeUySP8v/geBraDtVdedyDqAj4kKjatHSp2GbIFbmqwDDN0KQ6
         hhxJf2iHx/5DbuBNn0ybrN44YfFLKxMU4LrgmTAWaJHa5JFWmW3tW2f1dzd1bJ6S5JKU
         oyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8X4NI32O1SiTNzArDXJAOj78Q31iycoYeCouPtvRH3s=;
        b=J5rjUJ+YRyKUFAfYexN1brrzYr/aM0cQYG9T4m5/E1PR+gZqsbU/+/0rPmCqjiHyLE
         KkU0g3ILhZUrmOHpeSxf8iksVos5/tcNpjITO9tRnsmtXxkYmC/8kUMf8MMuILb3w/6J
         Mci2uja1ChexEfXk7xN0UQ5SQt+GdasdWjSdU0ulzcSvcTRN/9icqxuDPUSnjgwVi990
         cXJVEeEzu0kGPxoaGolblm2ZOtwEvrUda0zWz6IFG6hc9aOgVD0PfrF/9JTCuxMEYmTv
         XiIf98fWetc6gEGG+HiFEy0P9ejPb4jP5vze6KEqGEh4wd21UFo9h5O1zMQm0aw7gq5Z
         adMA==
X-Gm-Message-State: AOAM533mmXcQ+33No9L+7X9/UCrRlKqiYrt+24sP3sdFnP/+n9IFndVY
	zLAFWco+HjXJTpz3Nw8/rLu+9+hZwQU=
X-Google-Smtp-Source: ABdhPJyesrDcGnkrZUA544YfKcXrbUqaVDR1mbEk3C//Q8T4g6RdYefEX9GhGyt96YmWEJRu5YzRAg==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr55244837wro.395.1636124323144;
        Fri, 05 Nov 2021 07:58:43 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i15sm10465679wmq.18.2021.11.05.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 07:58:42 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH 1/2] go-{distribution,systemd}: convert github SRC_URIs to use https protocol
Date: Fri,  5 Nov 2021 15:58:39 +0100
Message-Id: <20211105145840.1721877-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/go/go-distribution_git.bb | 2 +-
 recipes-devtools/go/go-systemd_git.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devtools/go/go-distribution_git.bb
index f481d61..948831b 100644
--- a/recipes-devtools/go/go-distribution_git.bb
+++ b/recipes-devtools/go/go-distribution_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=d2794c0df5b907fdace235a61
 SRCNAME = "distribution"
 
 PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME}"
+SRC_URI = "git://${PKG_NAME}.git;branch=docker/1.13;destsuffix=git/src/${PKG_NAME};protocol=https"
 
 SRCREV = "28602af35aceda2f8d571bad7ca37a54cf0250bc"
 PV = "2.6.0+git${SRCPV}"
diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
index 130ef8b..91f67da 100644
--- a/recipes-devtools/go/go-systemd_git.bb
+++ b/recipes-devtools/go/go-systemd_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
 SRCNAME = "systemd"
 
 PKG_NAME = "github.com/coreos/go-${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=main"
+SRC_URI = "git://${PKG_NAME}.git;branch=main;protocol=https"
 
 SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
 PV = "4+git${SRCPV}"
-- 
2.32.0

