Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4148BC4167D
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 14:43:48 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.3026.1648840106783322623
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 12:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BvxckmwU;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id bg10so7791253ejb.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Apr 2022 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XZEuR73uT72R8o+S7MdLnBvvFqRluOgBvy8Jex8IEp0=;
        b=BvxckmwUm9bOUaRo37BGyUL4XPKBDPtHX2bspd3243nr0Duiv0cNc2cvGRwG/DAAQ6
         4Upla75ja2bufR5L+k/PpKQ+zigLj13Pqcy5vReteQnLkBkchcG/5dk1BV2zlxktdYHL
         UKPvEWzJMT5r+53i9jUXuGIQMMeZS/ALB1WF0UOE6DXg5ZpMXdHrNfYzKdnunoUg1KbO
         K4gpOY4ii9/ksXcLPF74D57wGKO8j5P7eQQo33msu4aA70rPiD/gGcv3pWzUqjGKl6me
         Cn7vlNwSCXp378uFEJFLxBj+e/j8EOe+b7SlI4JLcY6aNP0OAigBnWFhyKAcZkuBkqwK
         TgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XZEuR73uT72R8o+S7MdLnBvvFqRluOgBvy8Jex8IEp0=;
        b=HxM9WQKx7fRxIb3MAKyUH/WABb+LZdERUOfVBFGSD2BM4sLvbefbbOhOOeERQ/i8ZW
         jzfgeTLolltM3nEtw6JkGvO+iiyQRPKIsTCxUEEB/siUoxNcHTdsIkb8o1bsO4sEcYmL
         HqLyqYYtwcHNn9+j6SJoG5PAQ+MRIPe2lQ8WUJk16/MzXxgyHypG25ynFy0dyStDRh8j
         rPSQCGfaJ3dMolNNrjKddXWQGjMqAG+ppeDN6ZaQZYhgA01IUsOROxS9JOacMuN89x5d
         2l0kMB+mb7KEbbngK4tcnksCt8syqjZeHKVJPcrtnL+kWH6oM4hkNVcQyK4Avu01j+5p
         cwMA==
X-Gm-Message-State: AOAM530YxW6KP/R8YbM6xomfxtMeCVo7xmaPLBK8N85q9PT7jp/2Sxb6
	w7VUVpJiUsNYM6bMXKppVBKKcRgcDs8pEA==
X-Google-Smtp-Source: 
 ABdhPJw0fynLwczS6TSG3TNeHxV6Ts9727dE20F4Cg51Nw1YbtQk1AQHtF1tMt2PJW5v3GOSh+nd6A==
X-Received: by 2002:a17:906:6a81:b0:6da:d7e5:4fa with SMTP id
 p1-20020a1709066a8100b006dad7e504famr1090047ejr.223.1648840105233;
        Fri, 01 Apr 2022 12:08:25 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a056402238b00b00419181bb171sm1480169eda.38.2022.04.01.12.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 12:08:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][dunfell][PATCH] containerd-opencontainers: add
 EXTRA_EXTLDFLAGS and use it to fix build with gold
Date: Fri,  1 Apr 2022 21:07:40 +0200
Message-Id: <20220401190740.2179656-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Apr 2022 14:43:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7124

* Work around internal error in gold triggered due to DWARF-5 by forcing to use bfd even with ld-is-gold:
  _/OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/git/src/import/cmd/containerd-shim
  /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/go/pkg/tool/linux_amd64/link: running x86_64-webos-linux-gcc failed: exit status 1
  /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-webos-linux/9.3.0/ld: internal error in read_header_prolog, at ../../gold/dwarf_reader.cc:1678
  collect2: error: ld returned 1 exit status

* alternatively we can backport DWARF-5 support to binutils-2.34 used in dunfell like in:
  https://git.openembedded.org/openembedded-core/commit/?id=d07d4d739ae17787017f771dd2068fda0e836722

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-Add-build-option-GODEBUG-1.patch             |  2 +-
 .../0001-build-use-oe-provided-GO-and-flags.patch     |  0
 .../containerd/containerd-opencontainers_git.bb       | 11 ++++++++++-
 3 files changed, 11 insertions(+), 2 deletions(-)
 rename recipes-containers/containerd/{files => containerd-opencontainers}/0001-build-use-oe-provided-GO-and-flags.patch (100%)

diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
index 05c4f15..fec9ea6 100644
--- a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
+++ b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
@@ -33,7 +33,7 @@ index 4355395..4fb5d3b 100644
 -GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) $(EXTRA_LDFLAGS)'
 -SHIM_GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static"'
 +GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) $(EXTRA_LDFLAGS)'
-+SHIM_GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static" $(EXTRA_LDFLAGS)'
++SHIM_GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static $(EXTRA_EXTLDFLAGS)" $(EXTRA_LDFLAGS)'
  
  #Replaces ":" (*nix), ";" (windows) with newline for easy parsing
  GOPATHS=$(shell echo ${GOPATH} | tr ":" "\n" | tr ";" "\n")
diff --git a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch b/recipes-containers/containerd/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch
similarity index 100%
rename from recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
rename to recipes-containers/containerd/containerd-opencontainers/0001-build-use-oe-provided-GO-and-flags.patch
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index a52a5c3..5f697ed 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -10,7 +10,16 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d
 
 CONTAINERD_VERSION = "v1.2.14"
 
-EXTRA_OEMAKE += "GODEBUG=1"
+# Work around internal error in gold triggered due to DWARF-5 by forcing to use bfd even with ld-is-gold:
+# _/OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/git/src/import/cmd/containerd-shim
+# /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/lib/x86_64-webos-linux/go/pkg/tool/linux_amd64/link: running x86_64-webos-linux-gcc failed: exit status 1
+# /OE/lge/build/webosose/dunfell/BUILD/work/qemux86_64-webos-linux/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f62-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-webos-linux/9.3.0/ld: internal error in read_header_prolog, at ../../gold/dwarf_reader.cc:1678
+# collect2: error: ld returned 1 exit status
+# alternatively we can backport DWARF-5 support to binutils-2.34 used in dunfell like in:
+# https://git.openembedded.org/openembedded-core/commit/?id=d07d4d739ae17787017f771dd2068fda0e836722
+EXTRA_EXTLDFLAGS = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
+
+EXTRA_OEMAKE += "GODEBUG=1 EXTRA_EXTLDFLAGS='${EXTRA_EXTLDFLAGS}'"
 
 PROVIDES += "virtual/containerd"
 RPROVIDES_${PN} = "virtual/containerd"
-- 
2.35.1


