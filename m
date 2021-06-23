Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.10504.1624466133157047334
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Jun 2021 09:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ni2CEH+T;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id n20so4324133edv.8
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Jun 2021 09:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wgPJIu4RVCaBptlG7QPAdUC5UfJvaoHsYApXY7fMM6o=;
        b=ni2CEH+TsFzdAzc7dEBSiXWjC+qqMT8LKA13Lq3fZZoxFNMiA/g4Wo+VK5NeDDaNIr
         OSWAwMi3Eb6gAOmDi4oESqSUwVkH7ESk5I1lEASSk03idAyjMLqVLDz+IijIH2inlHvk
         MyM/d5cJbCHIZBgA6EPV1k76KEJPbLHHPFFjuxpXeHvNOdN/Wc7a5h52YP5lxsv7xYpp
         OvArU2FaIyJ/3nLRHhke7QdQuu0W+/mRPU53zIC3cBmCKIRHtcH8zZgB3tqfi9GqAOnK
         vubabQnfgs+LtGbH9KGfozLHw1Zdo5efevZqLk85jV8hpsVKbkLHfEnb8yGxekVgeKqR
         NI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wgPJIu4RVCaBptlG7QPAdUC5UfJvaoHsYApXY7fMM6o=;
        b=Jn2rTqaza9tUidHNCGH4RONmxJxBp7vRxOUvo3It2VWC6ntq9dkGnSsaveQSzxN4m0
         wrsawbQrzv2hd7Pskg7v7EvIWFX4ylp2fuxVVIiIpNC5bkM83rK0IMM1dBzUj3emAlyq
         g+1UJrZ3rvt7/XVqwL+IU9AZmf0S6gBcr4citS0nf+IXJUFHr6PiRkYqmGVLFPlgNNtj
         aJv/9XIaqa1YMWBREnYPnA0BJziZy1wJVB86wUBKFcQ+f6a4jAjuU7SN4iUzJ3eTCkIY
         dqTheZSw8K2mluxzDbgF541uePaBd7QtyG0tmo0mU1MQc/kUKdBnsj9Yv/HViPmGrona
         3PEw==
X-Gm-Message-State: AOAM532y8kVS4l9d+sD1fRp8rbsTrLupJrqePmt1Eb19iA3h2F15s3M+
	mm+H2IupIFYubf0Ne66iYoqE0k7MPgE=
X-Google-Smtp-Source: ABdhPJx02fDHbnMxVoZsUX5xjsyOdwKSrCDqAT/xRKoD860WaI4lPCmlqpp7mlscL4+YkBes3o78Lw==
X-Received: by 2002:a05:6402:2927:: with SMTP id ee39mr827704edb.367.1624466131631;
        Wed, 23 Jun 2021 09:35:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i18sm326924edc.7.2021.06.23.09.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 09:35:31 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] conmon: add dependency on libseccomp and seccomp to REQUIRED_DISTRO_FEATURES
Date: Wed, 23 Jun 2021 18:35:27 +0200
Message-Id: <20210623163527.2150181-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* added with to v2.0.29 commit:
  106cad5 seccomp: add support for seccomp notify
* fixes:
  | src/seccomp_notify.c:9:10: fatal error: seccomp.h: No such file or directory
  |     9 | #include <seccomp.h>
  |       |          ^~~~~~~~~~~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/conmon/conmon_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
index 5c45ce0..e2f452c 100644
--- a/recipes-containers/conmon/conmon_git.bb
+++ b/recipes-containers/conmon/conmon_git.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "https://github.com/containers/conmon"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
 
-DEPENDS = "glib-2.0 go-md2man-native"
+inherit features_check
+REQUIRED_DISTRO_FEATURES ?= "seccomp"
+
+DEPENDS = "glib-2.0 go-md2man-native libseccomp"
 
 SRCREV = "1ef246896b4f6566964ed861b98cd32d0e7bf7a2"
 SRC_URI = "\
-- 
2.30.2

