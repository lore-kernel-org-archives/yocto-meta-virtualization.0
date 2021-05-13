Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.11552.1620903138372308812
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 May 2021 03:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bm7FfnvC;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id s6so30422613edu.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 May 2021 03:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ohndrLRsm6VAB/mSgGLV3TnQe0ruFzXsgmaw/U8jeIg=;
        b=Bm7FfnvCswyVWnroPxNub97GS+ZA7lOblR4jF8+St/QsJr+PbUIR63kT7WnK7B6+tN
         MtiHDierzssky0DCZHKw705bx2666hm2Ww4WvKbw44rosgTYr0NQEmL7COr4HWZ68C/O
         PntrkWNHiU221yojW8PTzFioY0j7373P2C3meqAKJtnwp9gDST4aNe/t5RaUpqN3EE7c
         w66U880WZAy9uCrbTnQLAJYdKy3k8VVuKQvjkul5etgZurJcZMD3tWKRpqwqPLcSYloX
         9/jLkDfnFK6ulnPwpYYs4Irmpkk51yE0DGoWlAQYLmW02KzLOkGXEdodLlqvlFs9Zn6Z
         qDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ohndrLRsm6VAB/mSgGLV3TnQe0ruFzXsgmaw/U8jeIg=;
        b=nRvifyUhOOKYYQtLgKPf4kX43enpGCtPn4RyFVmWjSSWGIOzE4dB11OOVMpxO0Ar6L
         YRs8ZTtV21eUIXoXRHiaKxNLvmplZyVILOKxkLXDXLc9CahsFlySu2D/OeFn+NCIh8go
         elTfaNVm+t+gmcVL3JA735YHQzqJvnM+usN2YV2iYv1ia7NFiYWWJBwqWtv+vecnI2uF
         8oXbTreMehNvOL58HDumPaMZdU/me31GMzGJ3n18jv50tWJ4VKWuPazECUxvVspYH9D0
         9TGeOJIKDRuk2ZFAPIbFrNqtliNBLVC/LatAwjCA85ijg0Zpg/z403iLCdsp8xk2AIn3
         yUJQ==
X-Gm-Message-State: AOAM532b1eQsubR/7Xo6AqZbBa0QrCoW7a2tM0Z3wk5UHghczJG6rrk6
	kHJvdIZ8Zj4abv6uXnFHpLZXYReAn4U=
X-Google-Smtp-Source: ABdhPJynws9ljVvogbiuLxXcA94lh/TocfDROmhx67haQMPtZdhPmox1U8G+ErVdk34Q+P+YbQiiGA==
X-Received: by 2002:a05:6402:3104:: with SMTP id dc4mr48375491edb.144.1620903136668;
        Thu, 13 May 2021 03:52:16 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ck4sm2099416edb.56.2021.05.13.03.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 03:52:16 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] Revert "runc-opencontainers: use bfd even with ld-is-gold"
Date: Thu, 13 May 2021 12:52:12 +0200
Message-Id: <20210513105212.1446927-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit dda5ae36b44c61e61439341ea3153e6be5cb015e.

binutils gold linker was fixed with:
https://git.openembedded.org/openembedded-core/commit/?id=d07d4d739ae17787017f771dd2068fda0e836722

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 51ba7c9..f3ff9a8 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -8,10 +8,3 @@ SRC_URI = " \
 RUNC_VERSION = "1.0.0-rc93"
 
 CVE_PRODUCT = "runc"
-
-# use BFD when ld-is-gold is used to work around:
-# http://errors.yoctoproject.org/Errors/Details/580099/
-# CGO_ENABLED=1 x86_64-oe-linux-go build -trimpath  -tags "seccomp seccomp                       netgo osusergo" -ldflags "-w -extldflags -static -X main.gitCommit="fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty" -X main.version=1.0.0-rc93+dev " -o runc .
-# TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal error in format_file_lineno, at ../../gold/dwarf_reader.cc:2278
-# collect2: error: ld returned 1 exit status
-LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.30.2

