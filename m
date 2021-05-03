Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.33742.1620049252755899817
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 May 2021 06:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JfFgWkA+;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id k4-20020a7bc4040000b02901331d89fb83so3535901wmi.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 03 May 2021 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7Zc8LYdHRn2FbawcwnuPDR7hHENVdK9T0WHKMvMsCU=;
        b=JfFgWkA+P+fSED1rRi7nDUN49D8s5KWgG7cvG6USYm/FfQZWzoE1w6HBEoWSNpsoZU
         MqAsSdVaQOF8VFerjH5cbUFsWNetLymo/hOBdKtJWBrFwuNRLfgPDtUGvC5q9lEUblS6
         1X/PueM7ZdZ9LprmgOF2CBIlYfMoHyw3GJTgk3yu2t+Cd0R0w9gKabfdp6vBHKd/c2Pj
         sEIzsOlVQ9+0bpf5tXX7OnyO1o1P+T8n5LieeVVvhAT8fsZGA86F5cn9Z5rvb8FzNiHO
         mOw0qUlmdadc0UifHJTb6573Xya8BIk5TM4xhP9U4Y2MINYy5dxDt8XiS1bEQkxaxtni
         /I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W7Zc8LYdHRn2FbawcwnuPDR7hHENVdK9T0WHKMvMsCU=;
        b=QekDR/dbHKU8o+uUzDD16Kk197xJFTrIdcI0H4i3GAruIswWRLqwu2sHsKXdKpLa1G
         B+viBUkbosnFaNx0HqK5Ej+riWQ7pn/GnFpC6z0CgvDL1t0pJxa1Ku78IU1BT4GqvaCS
         KfQilfPFeaojJ8YiserGL10ge4tOa2SeX7ofXXMEt0MRAgBQ8lPxj42B5QmC8aygV7CY
         apD2P4icgUUqsvsvr6WYMtHfsR8KYr4v+6FHlIqc1bPxzqUZZ3l6GCbGChG1x+CcSrjN
         4aiGtxDpAxDSaEN2rGiY0frO5mKFkBU6PajiGbveHZDMRyohLYNEKVRGtHLLg1Vdnsjz
         3Hrg==
X-Gm-Message-State: AOAM531f6RJbuX5crPGwFZDOrYK0uiSkcPCVYI/rkUxTrcdyGrH0+4tE
	xh18CCOGh8UylSeCUbIIDhPsQopCL1s=
X-Google-Smtp-Source: ABdhPJxYoH/bHeRKeQryl0PpMAG9TxjqI5eiFuFapz8H1xul+6PARQUnu+cnP9FLuf4AS1iuldxIlQ==
X-Received: by 2002:a1c:c5:: with SMTP id 188mr18803254wma.5.1620049251200;
        Mon, 03 May 2021 06:40:51 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s15sm7064157wrt.19.2021.05.03.06.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 06:40:50 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: raj.khem@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] runc-opencontainers: use bfd even with ld-is-gold
Date: Mon,  3 May 2021 15:40:41 +0200
Message-Id: <20210503134041.2962422-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* just a work around for internal error in binutils-2.36 gold:
  http://errors.yoctoproject.org/Errors/Details/580099/
  CGO_ENABLED=1 x86_64-oe-linux-go build -trimpath  -tags "seccomp seccomp                       netgo osusergo" -ldflags "-w -extldflags -static -X main.gitCommit="fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty" -X main.version=1.0.0-rc93+dev " -o runc .
  TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal error in format_file_lineno, at ../../gold/dwarf_reader.cc:2278
  collect2: error: ld returned 1 exit status

* it fails like this only together with gcc-11, with gcc-10.3 it
  builds fine even with gold

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index f3ff9a8..51ba7c9 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -8,3 +8,10 @@ SRC_URI = " \
 RUNC_VERSION = "1.0.0-rc93"
 
 CVE_PRODUCT = "runc"
+
+# use BFD when ld-is-gold is used to work around:
+# http://errors.yoctoproject.org/Errors/Details/580099/
+# CGO_ENABLED=1 x86_64-oe-linux-go build -trimpath  -tags "seccomp seccomp                       netgo osusergo" -ldflags "-w -extldflags -static -X main.gitCommit="fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty" -X main.version=1.0.0-rc93+dev " -o runc .
+# TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal error in format_file_lineno, at ../../gold/dwarf_reader.cc:2278
+# collect2: error: ld returned 1 exit status
+LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.30.2

