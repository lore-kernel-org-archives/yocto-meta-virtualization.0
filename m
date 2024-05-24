Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8ACC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 19:30:11 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.3922.1716579007704461905
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 May 2024 12:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zy4vOG3p;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso13889361fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 12:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716579006; x=1717183806; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8f2nhi0HGCAn3Dvo8XjE+FuDJO4k71L7SdR5tOeR8g=;
        b=Zy4vOG3pZvTUM2cMWs+hSl4Dp2TJvofd8Cyc3BcP6v3ZGHewQHb87bK2znWxGtNPRI
         RLjPcNdIqPNWI4LopewLhk2qMje+TEEfHrtE/8Gyi+xM/1oXAlewsXOeqQXDoG0VCztZ
         YOyUoRlgCWstImOpHTLEGQ4hpmfr2HwL+TVgUFMvZ4LhoZokMEJXx5+LF/V2bUJsMjxQ
         UMSfMgshkxUTVGrlDUzUhTE3TLuJbkJOhtioku4zqT47LGAdpofcWeAELbVFkpdNJsf0
         oAN5isnGW/mMRZBv4SoZzCa3x3Bl4DDqnZ+WT34/MpkF17l0Vqm1LC1W8BUDnHADvgu+
         WLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716579006; x=1717183806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8f2nhi0HGCAn3Dvo8XjE+FuDJO4k71L7SdR5tOeR8g=;
        b=PbpDu8wLGqFSgkXuFbkZQI5B4pi06/ebAZWa01Bb55S41DbUYQIS8H8a6caUQT/vW+
         8WEt5dHR2fJvBxvoEzF/Q+8uUqEizbKAhZ/gotEJcEHJrjfmazQpyIze869fSo1X7Vq4
         /48Qa3WViwiaf+Z6pDn2EA9DI/cOArJ4iZyqYwRhfK/+/9H/5uj1nDR+KLHBGds2oPeI
         YMgQAXZEH3IdAaETs5t6ieZYyvC7iDDh2ePqe8cMBtS0bBi67RX4IKzZw4n1ktwmHxxF
         5Xxe8qUVErHpmZKjLEPhJUyX3SBtP6JAPYtP3Fgfom+n60Ks7iqIbi8rb/XnaYPvjUm8
         YrHg==
X-Gm-Message-State: AOJu0YyDPaj/G0K6QE/fRE79MvQlLNl2NPPZk8WEc5kbOIdPxVnQRbWW
	kj2NMRRFRZduY5mfRiSn9Ij3uZGx1bMNau9+maRGJNqZFUQdABM+tFx6Nw==
X-Google-Smtp-Source: AGHT+IG3CJAV3lPe64sGFKNZzev3bDVYzBTIkgoa4uQiyKLUdOj3G3BRtZpNXjzLDYUJEpxejWtfFQ==
X-Received: by 2002:a2e:88d5:0:b0:2e6:bb81:ba0b with SMTP id 38308e7fff4ca-2e95b1cd676mr19156811fa.25.1716579005653;
        Fri, 24 May 2024 12:30:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bbb5dsm2112274a12.95.2024.05.24.12.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 12:30:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [RFC][PATCH 2/2] cri-tools: use GO_SRCURI_DESTSUFFIX
Date: Fri, 24 May 2024 21:29:55 +0200
Message-ID: <20240524192955.2497200-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524192955.2497200-1-martin.jansa@gmail.com>
References: <20240524192955.2497200-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 May 2024 19:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8763

* see:
  https://lists.openembedded.org/g/openembedded-architecture/message/2007
  https://git.openembedded.org/openembedded-core/commit/?id=cc4ec43a2b657fb4c58429ab14f1edc2473c1327

* fixes:
  http://errors.yoctoproject.org/Errors/Details/772685/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...d-allow-environmental-CGO-settings-and-pass-dont.patch | 6 +++---
 recipes-containers/cri-tools/cri-tools_git.bb             | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-containers/cri-tools/cri-tools/0001-build-allow-environmental-CGO-settings-and-pass-dont.patch b/recipes-containers/cri-tools/cri-tools/0001-build-allow-environmental-CGO-settings-and-pass-dont.patch
index 29e0367b..5b25c7c8 100644
--- a/recipes-containers/cri-tools/cri-tools/0001-build-allow-environmental-CGO-settings-and-pass-dont.patch
+++ b/recipes-containers/cri-tools/cri-tools/0001-build-allow-environmental-CGO-settings-and-pass-dont.patch
@@ -35,10 +35,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  src/import/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: cri-tools-1.27.0+gite73a7139ed4986d6a0db784ae7a036841a02b351/src/import/Makefile
+Index: Makefile
 ===================================================================
---- cri-tools-1.27.0+gite73a7139ed4986d6a0db784ae7a036841a02b351.orig/src/import/Makefile
-+++ cri-tools-1.27.0+gite73a7139ed4986d6a0db784ae7a036841a02b351/src/import/Makefile
+--- a/Makefile
++++ b/Makefile
 @@ -74,7 +74,8 @@
  	@$(MAKE) -B $(CRICTL)
  
diff --git a/recipes-containers/cri-tools/cri-tools_git.bb b/recipes-containers/cri-tools/cri-tools_git.bb
index e0caf740..bfaacdd0 100644
--- a/recipes-containers/cri-tools/cri-tools_git.bb
+++ b/recipes-containers/cri-tools/cri-tools_git.bb
@@ -18,12 +18,12 @@ What is not in scope for this project? \
 
 SRCREV_cri-tools = "17b4dd65d660fec94d7a5a070e3e89ef640f1087"
 SRC_URI = "\
-	git://github.com/kubernetes-sigs/cri-tools.git;branch=master;name=cri-tools;protocol=https \
-        file://0001-build-allow-environmental-CGO-settings-and-pass-dont.patch \
-	"
+    git://github.com/kubernetes-sigs/cri-tools.git;branch=master;name=cri-tools;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+    file://0001-build-allow-environmental-CGO-settings-and-pass-dont.patch;patchdir=src/${GO_IMPORT}/ \
+"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
 GO_IMPORT = "import"
 
-- 
2.45.1


