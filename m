Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80620C3DA45
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 10:59:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.11636.1720609142904735481
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jul 2024 03:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cALOVF4o;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c965efab0fso3803628a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720609142; x=1721213942; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LS1qLpYa2q49iFBGgIraKL7UevmBfdC3W5+/k7ufYfQ=;
        b=cALOVF4oEZL2me2pwVe/Q/HkILmOJC/lwK/suKh1n8OKQNw+RZzJwGxWjiwVJ+Ztz4
         nv+h4qxQssj8WJmJlcqnt9xwndh6pW0kdOGwq/6LRFoHHWgFXN9YVCNxxfLjijRBTOL6
         ruU/uS6BEqG+tSTkjCsy5aK9emvrWhkvR515By4bJJNoWgWyrOMQe4Z5pqn64jBD00ba
         nFlM20CWsilAEu/W8iaZnSqxza8XWO14+GhfaNdWFxpjlUPLRggZewGcOZvAoh6x/Cgd
         K5YkGLK+/lKRHH/waGmYtSFRZs8w+KiXdlS8rwuQtLfZ1ZCPNqc+wUofY8nkU8ppFmO0
         Iu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720609142; x=1721213942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LS1qLpYa2q49iFBGgIraKL7UevmBfdC3W5+/k7ufYfQ=;
        b=KfHyQXOUYc+R/H7VqDeNls4PKfJeCAl3ix/UsOtxCndGI/Kr7rnxjyz0FBkLrYbsS1
         Agc6bST/qAeaq5Z2sC0CG4b4YUhFB+FYkOCrcQL5l2/VQQFi3nOf31k/BSWmQ3TvrV1H
         FfekCQNF+kvDdOtI9xnWilVr6slu2Gig2U8gK6QLATckTCoZOTJ5zZNIELoqRMfvMbWH
         gLwGc1cRN2IpNG7sgiHOHSrV3VHGG6mqTB93X+mkdsnVviqjh0cnJfitF9Tg37Qr+1Bb
         2xKtPlKHv4ZryZACPnJsKCvbwOTS169brArPS51q/7ColgO8LPXDUXsUugbL+ruHJAyM
         m/MQ==
X-Gm-Message-State: AOJu0Yz5ecGAkwOiUJDq8UzOMYc8AnTPNxqDNGmCmr/+9iVAPk3Jtham
	Y9XsWKnpWfEPH4ZLjGljHsFehdcPbloUbLtkM5DUluoUK8+Oc/7c3GRqwg==
X-Google-Smtp-Source: AGHT+IHeaPCzxwkKXc8aN73hehlQhoK/zo/j6PmVsaASCw3IlpK8G/II6vVtGCQXT/3b/uIqjjoSxA==
X-Received: by 2002:a17:90a:be09:b0:2c8:452d:e634 with SMTP id 98e67ed59e1d1-2ca35d62a22mr3710514a91.45.1720609142054;
        Wed, 10 Jul 2024 03:59:02 -0700 (PDT)
Received: from LL-1378.kpit.com ([106.213.81.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca344b936dsm3509544a91.10.2024.07.10.03.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:59:01 -0700 (PDT)
From: Pawan <badganchipv@gmail.com>
To: meta-virtualization@lists.yoctoproject.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-virtualization][master][PATCH] lxc: Fix meson build issue
Date: Wed, 10 Jul 2024 16:28:21 +0530
Message-Id: <20240710105821.60987-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jul 2024 10:59:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8834

Build is failing during do_configure stage for lxc as meson
does not support --with-systemdsystemunitdir config parameter.

Error:
meson: error: unrecognized arguments: --with-systemdsystemunitdir=/etc/systemd/system/

Hence, use -Dsystemd-unitdir config parameter instead.

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
---
 recipes-containers/lxc/lxc_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 09d5a05e..22ab80c9 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -79,8 +79,7 @@ PACKAGECONFIG[apparmor] = "-Dapparmor=true,-Dapparmor=false,apparmor,apparmor"
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,libselinux"
 PACKAGECONFIG[seccomp] ="-Dseccomp=true,-Dseccomp=false,libseccomp,libseccomp"
-# meson equiv for the unitdir found yet
-# PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
+PACKAGECONFIG[systemd] = "-Dsystemd-unitdir=${sysconfdir}/systemd/system/, -Dsystemd-unitdir=, systemd,"
 PACKAGECONFIG[systemd] = "-Dinit-script=systemd,-Dinit-script=sysvinit,systemd,"
 
 # required by python3 to run setup.py
-- 
2.25.1


