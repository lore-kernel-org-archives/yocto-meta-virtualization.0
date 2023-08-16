Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACE3C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 06:09:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.155160.1692166183300547024
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 23:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Xm1uCI2R;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5254f9eda36so4654197a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Aug 2023 23:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692166182; x=1692770982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+oP7cXiJgIE73ndQmdF9cI8GC10wRslunAfaXgVFFE=;
        b=Xm1uCI2RrAFmfiIGkUi28mkLbyK1mp8Gl5m4k7TPZ/GE/y6ntPTdPhKFLGGBadSQZo
         8PVnC8nCOTdZ891fiWByDoGlxE14/MTIw5KOkdCpdrRfgvwi6NdUjJQcaXWiSRj2/fsB
         TQ6bP3A2TQ8SuT9CYbDxnj7fCjdQp0jy/j5NI9MtnPZ8ZA7dwyI0gFjyBQQYwqoi7ppW
         l0ROM3kscrRty7DHMiba4eJXFD4osYlDg+AAI4CkZsCcU00en2VJ5MG76BG06+Qy2MPd
         67ejk4m3Ruu2MO26BxZbZfeePyX4KN9cbArj6PDSTdFMEWMvL2oyXNt/44yAa5N3XSWD
         vZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692166182; x=1692770982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+oP7cXiJgIE73ndQmdF9cI8GC10wRslunAfaXgVFFE=;
        b=adbt83YirbmCTO9VgkAQyvJji8oc+VuWWzWYbWyJ9LQcpOkedgMqo0UmbZFVKJRIKf
         J/KKwTpPqUhiuUicfGfyFwzP9yK+Shbk0JfRRRMor3EQmsJJRjO9Y53H2H8DFnX4+K3N
         9L+rcycXBpUE6x171CIbt+/r1Vqty2qISSESDPzs0dYUhHB73pPpeGlDgN5P6np2hNC1
         mR3CTPxF6SbJ7OkbIZrwmBC3/5Hu8O6hoxPUg5/U/5n15kkW/gGx/dQ45gRmsrgqxVkb
         HFkMW2hnnWpxeS46kxPrlyjDeursJxJ9zybfm/1d2/XsuoyolQRuc/z85DEIxbEI1D5O
         Xy2g==
X-Gm-Message-State: AOJu0YzFVMzbs0NMdd28NEq5qS7HvGdPvL+Qj6bym8kYPEQ4iq4El9JH
	1SnjBaXVE8bSlsp9McGRDq+/tjTOwMo=
X-Google-Smtp-Source: AGHT+IFCzhN3Z3XLru9Weh3mbOMKJLa2ZiD5gDM83Y1MqQHsbiqVqPAaKD5ZfmMWEZdUMu9vW3jHSg==
X-Received: by 2002:a50:fc17:0:b0:525:6772:159a with SMTP id i23-20020a50fc17000000b005256772159amr823251edr.1.1692166181400;
        Tue, 15 Aug 2023 23:09:41 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b18-20020aa7d492000000b0052333d7e320sm7813397edr.27.2023.08.15.23.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 23:09:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [kirkstone][PATCH] docker-ce: bump SRCREV_docker
Date: Wed, 16 Aug 2023 08:09:32 +0200
Message-ID: <20230816060932.668438-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Aug 2023 06:09:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8196

* fix my prevous commit where I've missed this update corresponding
  to SRCREV_moby change in docker-moby recipe.

* also re-order the patches in SRC_URI to match docker-moby, so
  that they are easier to compare

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-containers/docker/docker-ce_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 76ac41e..7142060 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -31,7 +31,7 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_docker = "3056208812eb5e792fa99736c9167d1e10f4ab49"
+SRCREV_docker = "791d8ab87747169b4cbfcdf2fd57c81952bae6d5"
 SRCREV_libnetwork = "dcdf8f176d1e13ad719e913e796fb698d846de98"
 SRCREV_cli = "911449ca245308472a3d34a7f1a98b918e65c8c3"
 SRCREV_FORMAT = "docker_libnetwork"
@@ -39,10 +39,10 @@ SRC_URI = "\
     git://github.com/docker/docker.git;branch=20.10;name=docker;protocol=https \
     git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
     git://github.com/docker/cli;branch=20.10;name=cli;destsuffix=git/cli;protocol=https \
-    file://0001-libnetwork-use-GO-instead-of-go.patch \
     file://docker.init \
-    file://0001-dynbinary-use-go-cross-compiler.patch \
+    file://0001-libnetwork-use-GO-instead-of-go.patch \
     file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
+    file://0001-dynbinary-use-go-cross-compiler.patch \
     file://0001-Revert-go-updates-from-1.19.12-to-1.18.7.patch;patchdir=src/import \
     file://0002-Revert-go-updates-from-1.18.7-to-1.17.13.patch;patchdir=src/import \
     file://0003-builder.go-avoid-using-strings.Cut-from-go-1.18.patch;patchdir=src/import \
-- 
2.41.0


