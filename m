Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.4834.1635929488204425915
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 01:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJGqUJiB;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id f8so6557443edy.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Nov 2021 01:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tlk6/kiGj3egNB+wt++VA/lrb0Ww/br7ZSKufEro1fc=;
        b=gJGqUJiBvm6xJIpVp+5MUbtzlTcULpYFSTHViQob7IYpobofarYKADrnTI4IKJ8OTL
         /LNhrnmSlnOj0H91uCkrGhV9Ax2ZprMO2GO5c/v/LN2+WrzYzhTPLUznVTMPi4vU+6Ee
         KI/509SF4syt+q6lFi+x/TgwcSgsBdUhiAuZCNVIwJYgnbiEgbtMzpnqP+MWUgR0/ERw
         154LVfu0V4tU1rnzjKKumqA9dVDbhwPVvV8sqVkPZ4nwVWIDXpee+b5ANZpu8IwOpQhZ
         bp6Xxw9/+5BGqSEPwBDngW4f5s4eL8QvY/ZJ8j7SoWpxnt67isUhsYrlf5GZsxg9HtXf
         zp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tlk6/kiGj3egNB+wt++VA/lrb0Ww/br7ZSKufEro1fc=;
        b=dlegpNHzFni5y0PBuRCXFP/oGZtikejJPdeCiDjAIqOV1Tt+QYl5m3iSRIB3WzE/EU
         +7EGcxvq7En7IyP22LZDPfnpt9XB3KAGi/+MZPL6uqy4QkwQptniP/83uQrNABfxJvxt
         eg/9oTmLEb42MWL/llvmveLicDIQSjJeMshBXGUzAFbQ2gA7AEWGrdCUolgW4yCGNi7w
         LnRy/aoGxDjTJYjsBMbPh4ffGhtQhHb1QUdoc4iyFhrAlSrMTuRFGKrNb8fScKQhk4H5
         ZIHmSJLMdUU7G5OEopee5P5uI3qLbV37zUzIKwEdmrrPSTJINlVWaSHyoZBRBu2fl882
         JLNw==
X-Gm-Message-State: AOAM531Tz6FCX+48QkabRIJh2vmESMztw4cqpHUFoKSs7K9Lp3cOPHQV
	KNDjqc1EK1nxAipJcPKR9PWa84OG5y4=
X-Google-Smtp-Source: ABdhPJx1VfhZ2tXA7wiFQfhFRtVUNs7wtj5g+8LkBO8NMyGLU1iFTgLQNMW8zTAcg9d8SdgSyUOyNw==
X-Received: by 2002:a17:906:1f98:: with SMTP id t24mr32067650ejr.353.1635929486419;
        Wed, 03 Nov 2021 01:51:26 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z22sm881695edc.83.2021.11.03.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 01:51:25 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] global: convert github SRC_URIs to use https protocol
Date: Wed,  3 Nov 2021 09:51:23 +0100
Message-Id: <20211103085123.694138-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* apply the same also for recipes using PKG_NAME starting
  with github.com which the conversion script doesn't update
  automatically

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/go-digest/go-digest_git.bb               | 2 +-
 recipes-containers/go-errors/go-errors_git.bb               | 2 +-
 recipes-containers/go-spf13-cobra/spf13-cobra_git.bb        | 2 +-
 recipes-containers/go-spf13-pflag/spf13-pflag_git.bb        | 2 +-
 recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
 recipes-devtools/go/compose-file_git.bb                     | 2 +-
 recipes-devtools/go/go-capability_git.bb                    | 2 +-
 recipes-devtools/go/go-cli_git.bb                           | 2 +-
 recipes-devtools/go/go-connections_git.bb                   | 2 +-
 recipes-devtools/go/go-context_git.bb                       | 2 +-
 recipes-devtools/go/go-dbus_git.bb                          | 2 +-
 recipes-devtools/go/go-fsnotify_git.bb                      | 2 +-
 recipes-devtools/go/go-libtrust_git.bb                      | 2 +-
 recipes-devtools/go/go-logrus_git.bb                        | 2 +-
 recipes-devtools/go/go-metalinter_git.bb                    | 2 +-
 recipes-devtools/go/go-mux_git.bb                           | 2 +-
 recipes-devtools/go/go-patricia_git.bb                      | 2 +-
 recipes-devtools/go/go-pty_git.bb                           | 2 +-
 recipes-devtools/go/notary_git.bb                           | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/recipes-containers/go-digest/go-digest_git.bb b/recipes-containers/go-digest/go-digest_git.bb
index 3966fac..c06a142 100644
--- a/recipes-containers/go-digest/go-digest_git.bb
+++ b/recipes-containers/go-digest/go-digest_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE.code;md5=9cd86830b557232ce55e
 SRCNAME = "go-digest"
 
 PKG_NAME = "github.com/opencontainers/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "b6234c321f263c503268e3b205f3d9755f9d14ed"
 PV = "v1.0.0-rc0+git${SRCPV}"
diff --git a/recipes-containers/go-errors/go-errors_git.bb b/recipes-containers/go-errors/go-errors_git.bb
index d7b3287..f1d7ef3 100644
--- a/recipes-containers/go-errors/go-errors_git.bb
+++ b/recipes-containers/go-errors/go-errors_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=6fe682a02df52c6653f33bd0f
 SRCNAME = "errors"
 
 PKG_NAME = "github.com/pkg/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "5dd12d0cfe7f152f80558d591504ce685299311e"
 PV = "v0.8.1+git${SRCPV}"
diff --git a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
index 697ba4e..b272f16 100644
--- a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
+++ b/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE.txt;md5=920d76114a32b0fb75b3f
 SRCNAME = "cobra"
 
 PKG_NAME = "github.com/spf13/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "b5d8e8f46a2f829f755b6e33b454e25c61c935e1"
 PV = "v0.0.1+git${SRCPV}"
diff --git a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
index c4c374e..ea63029 100644
--- a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
+++ b/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=1e8b7dc8b906737639131047a
 SRCNAME = "pflag"
 
 PKG_NAME = "github.com/spf13/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "d5e0c0615acee7028e1e2740a11102313be88de1"
 PV = "v1.0.5+git${SRCPV}"
diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
index d30868c..64354f9 100644
--- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
+++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=b355a61a394a504dacde901c9
 SRCNAME = "runtime-spec"
 
 PKG_NAME = "github.com/opencontainers/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "ab23082b188344f6fbb63a441ea00ffc2852d06d"
 PV = "v1.0.2+git${SRCPV}"
diff --git a/recipes-devtools/go/compose-file_git.bb b/recipes-devtools/go/compose-file_git.bb
index 1571265..c33a7ac 100644
--- a/recipes-devtools/go/compose-file_git.bb
+++ b/recipes-devtools/go/compose-file_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=9cd86830b557232ce55e2a6b4
 SRCNAME = "compose-file"
 
 PKG_NAME = "github.com/aanand/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "a3e58764f50597b6217fec07e9bff7225c4a1719"
 PV = "3.0+git${SRCPV}"
diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-devtools/go/go-capability_git.bb
index 5c180e7..7e5ab11 100644
--- a/recipes-devtools/go/go-capability_git.bb
+++ b/recipes-devtools/go/go-capability_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a7304f5073e7be4ba7bffabbf9f2bbca"
 SRCNAME = "gocapability"
 
 PKG_NAME = "github.com/syndtr/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "2c00daeb6c3b45114c80ac44119e7b8801fdd852"
 PV = "0.0+git${SRCPV}"
diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
index 7db5fc5..ae67f8e 100644
--- a/recipes-devtools/go/go-cli_git.bb
+++ b/recipes-devtools/go/go-cli_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9b539ed65d73926f30ff1f1587dc44"
 SRCNAME = "cli"
 
 PKG_NAME = "github.com/codegangsta/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
 PV = "1.1.0+git${SRCPV}"
diff --git a/recipes-devtools/go/go-connections_git.bb b/recipes-devtools/go/go-connections_git.bb
index 1bf6e94..ebfdb9f 100644
--- a/recipes-devtools/go/go-connections_git.bb
+++ b/recipes-devtools/go/go-connections_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=04424bc6f5a5be60691b9824d
 SRCNAME = "go-connections"
 
 PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366"
 PV = "0.2.1+git${SRCPV}"
diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/go/go-context_git.bb
index ba0368b..37f39b3 100644
--- a/recipes-devtools/go/go-context_git.bb
+++ b/recipes-devtools/go/go-context_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
 SRCNAME = "context"
 
 PKG_NAME = "github.com/gorilla/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
 
diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-dbus_git.bb
index 39b14a5..4bf44d6 100644
--- a/recipes-devtools/go/go-dbus_git.bb
+++ b/recipes-devtools/go/go-dbus_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed"
 SRCNAME = "dbus"
 
 PKG_NAME = "github.com/godbus/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "5f6efc7ef2759c81b7ba876593971bfce311eab3"
 PV = "4.0.0+git${SRCPV}"
diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
index 2ae27b1..8aa1c76 100644
--- a/recipes-devtools/go/go-fsnotify_git.bb
+++ b/recipes-devtools/go/go-fsnotify_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
 SRCNAME = "fsnotify"
 
 PKG_NAME = "github.com/fsnotify/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
 PV = "1.2.11+git${SRCPV}"
diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools/go/go-libtrust_git.bb
index 404baf5..e2a28ec 100644
--- a/recipes-devtools/go/go-libtrust_git.bb
+++ b/recipes-devtools/go/go-libtrust_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
 SRCNAME = "libtrust"
 
 PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "9cbd2a1374f46905c68a4eb3694a130610adc62a"
 PV = "0.0+git${SRCPV}"
diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index b54b32b..2c59d34 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
 SRCNAME = "logrus"
 
 PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
 PV = "0.11.0+git${SRCPV}"
diff --git a/recipes-devtools/go/go-metalinter_git.bb b/recipes-devtools/go/go-metalinter_git.bb
index 3bef3b5..3dda45c 100644
--- a/recipes-devtools/go/go-metalinter_git.bb
+++ b/recipes-devtools/go/go-metalinter_git.bb
@@ -9,7 +9,7 @@ BBCLASSEXTEND = "native"
 SRCNAME = "gometalinter"
 
 PKG_NAME = "github.com/alecthomas/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "e8d801238da6f0dfd14078d68f9b53fa50a7eeb5"
 PV = "0.0+git${SRCPV}"
diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-mux_git.bb
index c0db050..3f939f4 100644
--- a/recipes-devtools/go/go-mux_git.bb
+++ b/recipes-devtools/go/go-mux_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c50f6bd9c1e15ed0bad3bea18e3c1b7f"
 SRCNAME = "mux"
 
 PKG_NAME = "github.com/gorilla/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
 
diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools/go/go-patricia_git.bb
index 1098560..4c29b57 100644
--- a/recipes-devtools/go/go-patricia_git.bb
+++ b/recipes-devtools/go/go-patricia_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9949b99212edd6b1e24ce702376c3baf"
 SRCNAME = "go-patricia"
 
 PKG_NAME = "github.com/tchap/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "666120de432aea38ab06bd5c818f04f4129882c9"
 PV = "2.2.6+git${SRCPV}"
diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-pty_git.bb
index 0baa70d..132e82d 100644
--- a/recipes-devtools/go/go-pty_git.bb
+++ b/recipes-devtools/go/go-pty_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://License;md5=93958070863d769117fa33b129020050"
 SRCNAME = "pty"
 
 PKG_NAME = "github.com/creack/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;branch=master"
+SRC_URI = "git://${PKG_NAME}.git;branch=master;protocol=https"
 
 SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
 
diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/notary_git.bb
index 3e908a0..972da5e 100644
--- a/recipes-devtools/go/notary_git.bb
+++ b/recipes-devtools/go/notary_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=3596b980bb036e0875174ed15
 SRCNAME = "notary"
 
 PKG_NAME = "github.com/docker/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master"
+SRC_URI = "git://${PKG_NAME}.git;destsuffix=git/src/${PKG_NAME};branch=master;protocol=https"
 
 SRCREV = "d6e1431feb32348e0650bf7551ac5cffd01d857b"
 PV = "0.6.1+git${SRCPV}"
-- 
2.32.0

