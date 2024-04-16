Return-Path: <lukasz.czechowski@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F5CC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 22:57:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.35472.1713308275491152632
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 15:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20230601.gappssmtp.com header.s=20230601 header.b=hbANNeea;
 spf=pass (domain: thaumatec.com, ip: 209.85.221.46, mailfrom: lukasz.czechowski@thaumatec.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3465921600dso4398780f8f.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Apr 2024 15:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1713308273; x=1713913073; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+NZk12yodJIvAfDkdaW9I1VTiswfZPoQDSerxZVsnGI=;
        b=hbANNeeaPStkJkxSZ3aRsFUwn4xLccbdS2k4iIAQVaUjG7xf8OIrYEBUDhSQn8mrYf
         Qn9a5+hra3k918qXHR9iDy5KRFVSkUk4AKkz2I5v3fk3CWNLVRevTkikYpb03CaRqVMB
         tFPW1Pnkmdjee6JUlL7m6pt81BFQ1WmPKH5P76ErpCcLKfs2z4DSfQhhuZy+Em3qYydc
         BXxyPqEabdCBE9fm2Pac7wNd8GG1+awlDMrrA70PWfYmOXzsFD/pQjVF3gNEQN4uF7UD
         xzG3R7GpL1RfLwfLNcby6ESEfqXZeAgqnv9iBIZQsp54qsGR5maY+l0YJnKg+SlBvf6I
         7elQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713308273; x=1713913073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NZk12yodJIvAfDkdaW9I1VTiswfZPoQDSerxZVsnGI=;
        b=ksmtfA1IYBjedKHGuapaBj1KYoaK39W/+7EaxpK7b+NIpSZMuODj/JWfGo0BqkNBgV
         +Habdx5zvDb0NhPq4uwas1o20A5qQxdXAaGphlwEX+YdBrYTXYnNkdG/y8JmV9CO+3Jj
         3f8bsMoBVIQUikjLCR1UBTp8hK3+6PGKyCZbasu1hzCilUWGDEHwbHZKrOFh9FWcxjBu
         Dfw0hZC5LYC1lyrMiKwb7+2y7Na+akwmq9MaAv/+hMquHy3B5LEvmsg1+qhDNKZ8MyNR
         LtSB42bwpvrEu4Wu/K+moq8GeLz3Yy1/ubMshMJgqOXABK5PtGp4ZTcNjVWkmOScEJEp
         8e8w==
X-Gm-Message-State: AOJu0YwIwUrtUo9prziMr36NsFYPrevzjzynzrBEwixM0201K+8aBmj6
	K1EDHlDIjR9IS613Rj02OlGWQm0aH9LCxP7t9T5LTGxeicnPY9refL0coGC2pQDwqVPfb/owAz6
	iEmI=
X-Google-Smtp-Source: AGHT+IFKYShVuRo9WB8GMsVlp1JBzZHV4GqArh+xU8eT9EgT50OBqq6ku58j6RnzFKQgfTIXzkWwfg==
X-Received: by 2002:a5d:4e47:0:b0:349:793e:b89 with SMTP id r7-20020a5d4e47000000b00349793e0b89mr1876929wrt.63.1713308273095;
        Tue, 16 Apr 2024 15:57:53 -0700 (PDT)
Received: from localhost.localdomain (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id bi25-20020a05600c3d9900b004187c590849sm431726wmb.0.2024.04.16.15.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 15:57:52 -0700 (PDT)
From: lukasz.czechowski@thaumatec.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][PATCH v2] podman: fix location of user systemd service units
Date: Wed, 17 Apr 2024 00:56:15 +0200
Message-Id: <20240416225615.165473-1-lukasz.czechowski@thaumatec.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Apr 2024 22:57:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8682

From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>

The value of USERSYSTEMDDIR is currently set to
${systemd_unitdir}/user, which might not be present in user unit
search path.
Use dedicated bitbake variable ${systemd_user_unitdir} instead.

Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
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


