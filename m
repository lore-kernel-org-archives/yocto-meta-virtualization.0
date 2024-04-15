Return-Path: <lukasz.czechowski@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFE6C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:08:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.18272.1713179292702255241
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 04:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=Xo16mY7l;
 spf=pass (domain: thaumatec.com, ip: 209.85.218.52, mailfrom: lukasz.czechowski@thaumatec.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a44ad785a44so355720266b.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1713179290; x=1713784090; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tjBgzeRLoP2OXKX2lB0FU9EJp9uSlkcEG3akDo3Tgik=;
        b=Xo16mY7l3fSiooiUcKH4B262nWua5gNbteAEwzCprZXmnwZgeLwL2Tmg08ByEvAt6r
         /59DZbKNgXFvflFWzM62hzZkeNkRHdbc1crXZtPlkZY2rDMb8bu9DyW/QnPFcVAb/rZE
         zJFBNcBO8ng9LstbKA0bYRGAUl8xLD530NMK0dC18zRLmGrWKq6iV/BkZDG0nh1aI+tZ
         YuHlYXw4OoNTyRK48bBhQybOtYL0PEXR/7iHokECAp94AWhqNM9Bp2gP4lh/QkREMyS2
         htjZwQl3PRP+ucHPqDDUBeeNFr4g4HeQ6Uc06iLQTm3SRyfio9G0x+svZrTMO4rv5SCB
         P0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713179290; x=1713784090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjBgzeRLoP2OXKX2lB0FU9EJp9uSlkcEG3akDo3Tgik=;
        b=AfC4a0DpUjFAsU788noVj84Tg7ggRpe3lrJs/30UNYzikLFkiDwMq8O4/26+qpxoFN
         Tiy8JFQas1KfIzkd0Mcn7vCo7bmmkV/ePy7RL5Vi9xtxjVRPnfb39D472KdVUMms0TsD
         fURfPB9L9b9P5Cl0rejfR9G3EmnfAYlIsNGglyGOZfxfPQ4GzccxP/pyrZRGwCoDHb6k
         T5nrxdFl/a4l9qvu9WZsZNsORlUfU0LMhtpsW1YmrIR1tqmqzVjL8zvAkIpZlQKqtrDk
         bCqxSR667OzKJ57mYeButrXjur7f2ee370+3z0sbxZ+NIpaViEQ55ahMhI4t9um/kusT
         BYPA==
X-Gm-Message-State: AOJu0Yy5m0V5Db2xSd9bsHaZwZdJCTX9qnIII98xkCCRYl5ObC94iZKm
	u4+sR92dR4nCdC+mXcxljM94HTEC3HY3ZwshvL5EJ60wmSFld06nTNeByy4fv08EtK2G81DQ+jU
	JPP4=
X-Google-Smtp-Source: AGHT+IE7pHAff4FCnAhBXVZTSB2SjXTZ7Wg87Yllb7UOGGB9j5i25W/ReXBQ1n7dby/zTIeP2wpJrQ==
X-Received: by 2002:a17:907:3181:b0:a52:5460:a1d1 with SMTP id xe1-20020a170907318100b00a525460a1d1mr3639994ejb.60.1713179290168;
        Mon, 15 Apr 2024 04:08:10 -0700 (PDT)
Received: from lczechowski-Latitude-5511.. ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id ds19-20020a170907725300b00a522911e2aesm4883504ejc.124.2024.04.15.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 04:08:10 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Subject: [meta-virtualization][PATCH] podman: fix location of user systemd service units
Date: Mon, 15 Apr 2024 13:08:07 +0200
Message-Id: <20240415110807.63387-1-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Apr 2024 11:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8675

The value of USERSYSTEMDDIR is currently set to
${systemd_unitdir}/user, which might not be present in user unit
search path.
Use dedicated bitbake variable ${systemd_user_unitdir} instead.

Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 3eadd202..f69dec16 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -62,7 +62,7 @@ do_configure[noexec] = "1"
 EXTRA_OEMAKE = " \
      PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir} \
      ETCDIR=${sysconfdir} TMPFILESDIR=${nonarch_libdir}/tmpfiles.d \
-     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_unitdir}/user \
+     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_user_unitdir} \
 "
 
 # remove 'docker' from the packageconfig if you don't want podman to
@@ -134,7 +134,7 @@ do_install_ptest () {
 FILES:${PN} += " \
     ${systemd_unitdir}/system/* \
     ${nonarch_libdir}/systemd/* \
-    ${systemd_unitdir}/user/* \
+    ${systemd_user_unitdir/* \
     ${nonarch_libdir}/tmpfiles.d/* \
     ${datadir}/user-tmpfiles.d/* \
     ${sysconfdir}/cni \
-- 
2.34.1


