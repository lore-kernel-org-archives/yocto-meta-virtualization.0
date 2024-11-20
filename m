Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE31CD6E2DE
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 08:50:42 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.9217.1732092641008927319
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 00:50:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GVQX9E2n;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cfa9979cd1so1171276a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 00:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732092639; x=1732697439; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJL//2c3KJgeytN1DTc4psgY43AXKG3PpMdtCmA99Z8=;
        b=GVQX9E2nSwaPHwkQ4oh8TOLzl5f6T4fa453tlWD8QrBq1FkBVggF8uEsRCUsoUScIv
         FhCsV98GLWlMX+5Fb6feypATMP5RVYYgykgWuxhS1lHg6/Mzl1pFYIem5b5fhhTJoa96
         VMJAMfuvTswvJMi49EAv+W79RZ/qTj2n4mfoj8ySbk44fua/EESdnKQ7Fgz6zbio6zQ3
         onekkcKnQXfHcQF32cTKuHlShFxWpSY+PSErlX/a69Btl617NWuFbpy+0GGJRPJflMYT
         EXIZ2FonCbstnhAcAYljZZvtL/5gOUbMBppCmcv78eEtKSXEZRmaEYmkijh6dETyysQD
         uaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732092639; x=1732697439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJL//2c3KJgeytN1DTc4psgY43AXKG3PpMdtCmA99Z8=;
        b=QM4ov/AYTeZIzKCl/tWVbfMvIAg+1/QR5Tv0as8/hMGsN+JWdsJVA/0ETVcC1DU474
         Sivh5ouhbAONR7IeoBt0nw73L5E99iY6P/mGKSJ3cs071cVXQShhleugnhempjaWoe1s
         ZrEnvQH9YqgX906LBjf0U+Y/6+d0k7JkGgHZEE6Q9ePl3kngHjGN5UlweBStYxAPbVeo
         SlrAwW379dWZEghwLwhGa9x+I7cuPfzgz1vzlxHWsz97dEpK2wt8GPPI79g0diyiCz4B
         FI3T//e2gPVq5Gq3DYTdJSpvo9FC+HZ3l9kuJhi2YcMwOHxAVkuvQ88UmTlNJ7PS80qA
         fasQ==
X-Gm-Message-State: AOJu0YzZp8EkUabMU9+BDsP/vRVOEW0FFBpIEFR4YOyuCUVdi/pjy3UX
	7LR1EslX0wPI+lxlsLCCUKIDkqQZ/WYbFais9FATi/rgMoQCh7iI1HizcA==
X-Google-Smtp-Source: AGHT+IGauDLuI7VB7xEN4rQHnQdF8/PqBuAk/F9isRURUQkkqx+A71v63XFx2+fnfPk80pAGMn5d0w==
X-Received: by 2002:a05:6402:5210:b0:5cf:e97b:8874 with SMTP id 4fb4d7f45d1cf-5cfe97b8abbmr3477406a12.16.1732092638963;
        Wed, 20 Nov 2024 00:50:38 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cff44deadesm573407a12.1.2024.11.20.00.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 00:50:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] packagegroup-container: respect seccomp in DISTRO_FEATURES
Date: Wed, 20 Nov 2024 09:50:33 +0100
Message-ID: <20241120085033.3104538-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 08:50:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8984

* fix f53b101d455d7e7447fa83f2faecb5e05d595b3e

* you might want to skip whole packagegroup-netavark without
  seccomp, but without this parsing world in DISTRO without
  seccomp fails with:

ERROR: Nothing RPROVIDES 'netavark' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
netavark was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
NOTE: Runtime target 'netavark' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['netavark']
ERROR: Nothing RPROVIDES 'packagegroup-docker' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-docker'
NOTE: Runtime target 'packagegroup-docker' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-docker']
ERROR: Nothing RPROVIDES 'packagegroup-oci' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-oci'
NOTE: Runtime target 'packagegroup-oci' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-oci']
ERROR: Nothing RPROVIDES 'packagegroup-container' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-container'
NOTE: Runtime target 'packagegroup-container' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-container']
ERROR: Nothing RPROVIDES 'packagegroup-lxc' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-lxc'
NOTE: Runtime target 'packagegroup-lxc' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-lxc']
ERROR: Nothing RPROVIDES 'packagegroup-cni' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-cni'
NOTE: Runtime target 'packagegroup-cni' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-cni']
ERROR: Nothing RPROVIDES 'aardvark-dns' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
aardvark-dns was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
NOTE: Runtime target 'aardvark-dns' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['aardvark-dns']
ERROR: Nothing RPROVIDES 'conmon' (but meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDEPENDS on or otherwise requires it)
conmon was skipped: missing required distro feature 'seccomp' (not in DISTRO_FEATURES)
NOTE: Runtime target 'conmon' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['conmon']

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 recipes-core/packagegroups/packagegroup-container.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index aba1d3e1..21402d65 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -48,13 +48,12 @@ RDEPENDS:packagegroup-cni = " \
 "
 
 RDEPENDS:packagegroup-netavark = " \
-    netavark \
-    aardvark-dns \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'netavark aardvark-dns', '', d)} \
 "
 
 RDEPENDS:packagegroup-container-tools = " \
     skopeo \
-    conmon \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'conmon', '', d)} \
     umoci \
     ${@bb.utils.contains('VIRTUAL-RUNTIME_container_engine','podman','podman-tui nerdctl podman-compose','',d)}  \
     ${@bb.utils.contains_any('VIRTUAL-RUNTIME_container_engine','dcoker docker-moby','docker-compose','',d)}  \
-- 
2.47.0


