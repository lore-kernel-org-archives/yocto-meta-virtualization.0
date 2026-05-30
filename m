Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5935DCD6E52
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 01:31:33 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2367.1780104691959331751
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 May 2026 18:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KeyPpkSi;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3664df32e91so16051159a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 18:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780104691; x=1780709491; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLSNFeTS1b6IZTlfcCdgAs6QY2bt2K2ZELAfkOyKSiU=;
        b=KeyPpkSiOFF/RW5/6yoeZ8t0XtsCs4K2HUpL2pOs0q/VRt6p1an7iZARViIIbrY72f
         dUYGUZ+a43PlQB8z3/ngCuh2TB4p3zX41OS27mlK48udJ0Ybr5vh3GXiTiOcl1AjoHWr
         qp1RvP7Aq3Jy18YTmoul/omm/t0tThszkQlV5p2PKrZgskuXFc30Bu0qD3SRwbfAH8SL
         1yirAR1tnu8yTVr1oM/LzsTa9QUDo5EbWWuUGNuQNhQiiFrmOARO1BuXOQwp5UbTq9oJ
         8iS3aUF9Nol8/QGG1U6fJqlFzeQ9Had69N7SmPwXRainZTTfNgZJRBFFffjg+fYaJG97
         8Ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780104691; x=1780709491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLSNFeTS1b6IZTlfcCdgAs6QY2bt2K2ZELAfkOyKSiU=;
        b=ZNLlKO0BIStSPhIXiLt/HziTXxR2b8Z6ATi/jjx09kwz300NQ5b3cJeu02NGyvmtt3
         CKLsHnluM34hazN2kHvR+ccdJlxL5aWzj0OX/i9bS/3lXsQQ5N3dJqRM27PeZzpT/9Hm
         Sb8OqvNgOS9epf3hAkdTq4gE21GsRY9GRuSIMo5/FSdI7e+HB/d21ohUrPkHyZJtO6kj
         bCUP2n1WwQ6UxUci/qORpEn9PgqxUDJegSFESbkN92hnkO+yBwIBv4MWhjoxqzRT40lS
         Bfosr8iDDlvRNQqVOjR7VBKtnlH9dTEU2gh1mj6nl+vE1dMAGXd9GR+5i4+a492pyZJI
         jf5A==
X-Gm-Message-State: AOJu0Yym2pLdrrP9nP10QxuVmDw2WuskTcZb2+rDuuFRksMN/Selxtsj
	UKceBKxBGAXS+tw30/E+nbvkXSd0tIQ8lLCQMdg1q9oU4CU1zIsN3cmwqq7IIw==
X-Gm-Gg: Acq92OE06i6h5JjFs99S8cPCAE4Q+HlRlxBCxua/V4NVTuHaZzZ+GAbLk4AL5PBza0W
	EMLadGU+f0ITY+UhqDk0ObRhJhQZYU/Puv3xblKLc98F1zRSFvRE8/3yqYHPUb6lmoYtPzGppsi
	+2hATiTV8ePvpLcck16COUyYl2kVxRm6QWuzQoVnvTppMxPQwQ7/mFcH2JK9n+1TeofpQMgyI/p
	njjLBajmWFjoz+nDcO1Ri6PNrhiuumP193Tvaa039TdEZQaD86Pbv7wuJYbGjaiIDOVLGwxirI9
	Ion5vBBct2QbK264aODjTFostqwbC2z/low0aNqmdpBWoFmnqxMfBREnE8z4JW7c7VVy/pUv+bp
	Umquvk7Qb9GCqdMB50l5T5drfwlEZip6SWSZGmjIarUSl6IceFumm7ALnPdAyBVHIhgCp02DzYW
	rh4ZZZMT80+xdogQJ//Yct+b/53261gwHvUpvlwgdi/qRu7GcO7+LA9/wV0dtH2cGHKf8dxB6qE
	GALHWFCjsMvGAcAYB9UDT+h6kC/4WwbDwNFK/dyEqdE
X-Received: by 2002:a17:902:d50f:b0:2bf:3074:34d5 with SMTP id d9443c01a7336-2bf3687d473mr23693105ad.34.1780104690824;
        Fri, 29 May 2026 18:31:30 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a2dbfbsm33798765ad.37.2026.05.29.18.31.29
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 29 May 2026 18:31:30 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 0/7] Container improvements
Date: Fri, 29 May 2026 18:31:01 -0700
Message-ID: <cover.1780104071.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 30 May 2026 01:31:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9826

This series:
  * Adds a class to create/run containers with a non-root user
  * Adds new containers:
    - app-container-python
    - app-containter-mosquitto
    - app-container-valkey
    - app-container-nginx
  * Modifies app-container-curl to be more like the upstream
    experience (and more like the above containers)
  * Allows meta-webserver/recipes-http to be parsed for
    vcontainer distro so we can build multiarch containers
    for app-container-nginx, etc.

Each of these containers was built in a MACHINE=qemuarm64
environment as well as mc:container-amd64+mc:container-arm64
multiarch environment.

The resulting containers were tested with simple command line
usage compared to Docker provided equivalents to ensure the
same expected behavior.

Tim Orling (7):
  classes: add container-nonroot-user.bbclass
  recipes-containers/images: add app-container-python
  recipes-containers/images: add app-container-mosquitto
  recipes-containers/images: add app-container-valkey
  recipes-containers/images: add app-container-nginx
  vcontainer-bbmask.inc: allow meta-webserver/recipes-httpd
  app-container-curl: use multilayer mode; container-nonroot-user

 classes/container-nonroot-user.bbclass        | 68 ++++++++++++++++
 conf/distro/include/vcontainer-bbmask.inc     |  2 +-
 conf/layer.conf                               |  1 +
 .../images/app-container-curl.bb              | 29 ++++++-
 .../images/app-container-mosquitto.bb         | 46 +++++++++++
 .../images/app-container-nginx.bb             | 77 +++++++++++++++++++
 .../images/app-container-python.bb            | 57 ++++++++++++++
 .../images/app-container-valkey.bb            | 61 +++++++++++++++
 8 files changed, 336 insertions(+), 5 deletions(-)
 create mode 100644 classes/container-nonroot-user.bbclass
 rename {recipes-demo => recipes-containers}/images/app-container-curl.bb (58%)
 create mode 100644 recipes-containers/images/app-container-mosquitto.bb
 create mode 100644 recipes-containers/images/app-container-nginx.bb
 create mode 100644 recipes-containers/images/app-container-python.bb
 create mode 100644 recipes-containers/images/app-container-valkey.bb

-- 
2.54.0


