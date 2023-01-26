Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04CDC54EAA
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 20:43:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.85840.1674765820099167231
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Jan 2023 12:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kkaR+UCx;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1996093wms.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jan 2023 12:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=crFOkX0hJZwTX3wU9bNCFALt0kIYpy4NC1xT4/zoC9c=;
        b=kkaR+UCxxMAsEDtON9HC1CAAhoo3VPzWkEy4zoDm8pAZcnUcc+mvrvO2y+FUiR20a5
         SgCbC7gYmlO7H8TIWwtfvc/NUQ3tQuP3DqF9e7QIRSIfQDOmEFpsiwv4DRKehYnQqhjM
         e7OaNEtvWTy4FXyVmcmPaGiey8Vse3JdhWGL23Qei0dMPHf25Wo8+xuaO4Q2hrfYIrxX
         RNj17+B/6iHTuHLoR+a5xixxaVxg3VyaDytEK8zronGVMB5NQrQxF+jhQcCxcta1km3V
         jrjEn9VZIJmlZfOkQzbVG9IIETVtG1OY0beCjqvfNU5lBpD4nFVLSrzUjhIldAbBLd4W
         xJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crFOkX0hJZwTX3wU9bNCFALt0kIYpy4NC1xT4/zoC9c=;
        b=JFKEC/FXfrfz0k85+Sg6EV+HvUZBUPi/wsEZgmBRDOjf4OV4B5F19N324IW/5moEWx
         loK/mftaigDCYKGXwztQngSpYMlbalzxwjgzNFMJw1DPGLrRECbFWxoEi7cNevkEViy0
         MTvs5zbMiIybKG6hgaf3I3uwiDy4gFpApZITWe1br0euAXEKjYwA85Qv59Ezf7E2L/lY
         F/rpbeKGwqJs396iV9cUnyif9ltjgb5Q8U9SFpzDkPXEmmrjIDg+mq8RoTlHM7yWa0iV
         fbVl+I8aACziqbzMYUC/sw3iLeIfvl3HJRSw/OXBkQ8S+Xj81/Mw4JyWnjupgt5ZPixq
         rc0Q==
X-Gm-Message-State: AFqh2kp8IkV2T9gXksjw18mhyvLxJ90TxFof/v0Qa29w/jJKaQZpEdH/
	m49wn2g66YijZ3hC9zKZGp9MZjlCgkM=
X-Google-Smtp-Source: AMrXdXsYt+HpJyjOZk6DER+jYHsuolC5WTcKR4+rtfyitJtnwE71DG9+pvOnYSYTZz9ajTOPEMfgBg==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:674a:aefe with SMTP id ay29-20020a05600c1e1d00b003cf674aaefemr36374828wmb.22.1674765818374;
        Thu, 26 Jan 2023 12:43:38 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h18-20020a05600c30d200b003c21ba7d7d6sm2276617wmn.44.2023.01.26.12.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 12:43:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-virtualization][PATCH] xen: fix Upstream-Status formatting
Date: Thu, 26 Jan 2023 21:43:33 +0100
Message-Id: <20230126204333.3183171-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jan 2023 20:43:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7836

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ig-mconf-cfg-Allow-specification-of-ncurses-location.patch | 4 ++--
 .../files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch    | 2 +-
 recipes-extended/xen/files/xen-flask-race-fix.patch           | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
index 135860a..b871175 100644
--- a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
+++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
@@ -3,8 +3,8 @@ From: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date: Mon, 2 Jul 2018 23:10:28 -0400
 Subject: [PATCH] xen: Fix menuconfig and add support for config fragments and
 
-Upstream-Status: Xen: Inappropriate [oe specific, cross compile issue]
-Upstream-Status: Kernel: Pending
+Upstream-Status: Inappropriate [oe specific, cross compile issue]
+
 Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
 commit e6972e689a980ab28637e94e48c77eeace6abde5
 
diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch
index 35cd9a8..476f5dd 100644
--- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch
+++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch
@@ -4,7 +4,7 @@ From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
 Date: Fri, 19 Oct 2018 11:01:37 +0200
 Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py args
 
-Upstream-Status: Xen: Inappropriate [oe specific, python install issues]
+Upstream-Status: Inappropriate [oe specific, python install issues]
 
 Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
 as well as other parameters set by the OpenEmbedded build system.
diff --git a/recipes-extended/xen/files/xen-flask-race-fix.patch b/recipes-extended/xen/files/xen-flask-race-fix.patch
index fa2a82f..e4b0e9d 100644
--- a/recipes-extended/xen/files/xen-flask-race-fix.patch
+++ b/recipes-extended/xen/files/xen-flask-race-fix.patch
@@ -21,7 +21,7 @@ we need to ignore it in this case. $(MAKECMDGOALS) can't be used in
 this case as it is empty, but we can guess which operation is done by
 looking at the list of loaded makefiles.
 
-Upstream-Status: backport [https://lore.kernel.org/xen-devel/20230120133626.55680-1-anthony.perard@citrix.com/T/#u]
+Upstream-Status: Backport [https://lore.kernel.org/xen-devel/20230120133626.55680-1-anthony.perard@citrix.com/T/#u]
 
 Fixes: 7a3bcd2babcc ("build: build everything from the root dir, use obj=$subdir")
 Reported-by: "Daniel P. Smith" <dpsmith@apertussolutions.com>
-- 
2.39.1


