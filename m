Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34AFC4332F
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 10:26:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.13144.1702722367459671693
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 16 Dec 2023 02:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfNpF3KV;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so16055125e9.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 16 Dec 2023 02:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702722365; x=1703327165; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISR0INQIQlw45KZhl33zIgcuEWnP5W5YFGXGfez2Z88=;
        b=DfNpF3KV2FumhlVIPx3ucJmS1160ngajxgSvLMN/KTaxkGS7t3fFuw/+2mNIgZDTmx
         CBBJ5hCJzg3+S/4g0lkES3V7i9wNoDyb/cMj45fKVoGAOoVY7FEkwsXrHWtcN96LA1i3
         +L2l7zORqrGhqp2Mpopyk3l/kLxONCEKnHZPAgUbPVfBVirGSQTcciWwQKAzdsztbQlv
         ILmpGLD1S9E59fX5hXrlapJSlOJ+8jFt7fSw5SCiVK/PFSPqWnfjXL910kAjqybNI2/W
         wHm4JG3OIhrEUBgipr0TkHMWkIVx/gjqNKaV5k/Wi0TJR7ZN+veBJ7DiOe+43eiGmy8b
         P2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702722365; x=1703327165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISR0INQIQlw45KZhl33zIgcuEWnP5W5YFGXGfez2Z88=;
        b=tcb+lAVtAgv8X6J2+Z5XWwvx0WsLaLzb+YpLvc0RLDfm39QKy9hA9ykQqTtj963Igw
         7fqMJNWjQ4etm0CAl0gyx3LKgI8IOYT+bG/OMfUuBu6pESVZHUiNMuR9ggannZ7rre/q
         LwS23ujMtt8QWJx9UlRCLp/fC3G+sp3YI61rNEFPc0mI1WTPiBSkJAKaL8xuOQbyjimA
         +SmshQ5BuILZgIqK+EUQHyR+S9GVjuDuBlUFmGHbwwoJOizKrbi1B3KyrCyrMXmySHbj
         /wNYwnU0/Y1aF42eSG/6rezokM2GLA9d8hE/QmWWCHtWaERrXsNmOWwM396SZzluWVWh
         BMug==
X-Gm-Message-State: AOJu0YzLf1jErQMa/uT7gsovPdTAn/4l0gfxAt0bGPnFkwBMlgJzlvHI
	mbmb2tM+doAXk3ssgtHaNkHu+Aee+kkNsw==
X-Google-Smtp-Source: AGHT+IHdfpD0raBdDieHEe2qWlcSdC7/sr3b4o9FYE+H9v6cRku+3zMdk65cWqh/xSHv2e8UCDZK2g==
X-Received: by 2002:a05:600c:5026:b0:40c:7a1:b2db with SMTP id n38-20020a05600c502600b0040c07a1b2dbmr3366456wmr.377.1702722365030;
        Sat, 16 Dec 2023 02:26:05 -0800 (PST)
Received: from peterliu-Precision-7530.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id gw18-20020a05600c851200b004063c9f68f2sm32260398wmb.26.2023.12.16.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 02:26:04 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH] docker-compose: introduce pkgconfig docker-plugin
Date: Sat, 16 Dec 2023 11:26:01 +0100
Message-Id: <20231216102601.54277-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 16 Dec 2023 10:26:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8510

From: Ming Liu <liu.ming50@gmail.com>

This allows docker-compose choose to be built as a docker plugin or a
standalone binary, in the later case, docker-compose does not have to
rdepends on docker, so nother container tools like podman can also use
it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../docker-compose/docker-compose_git.bb       | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 092ce3d2..b7745f2b 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -34,7 +34,8 @@ COMPATIBLE_HOST = "^(?!mips).*"
 
 do_configure[noexec] = "1"
 
-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "docker-plugin"
+PACKAGECONFIG[docker-plugin] = ",,,docker"
 
 include relocation.inc
 
@@ -63,16 +64,15 @@ do_compile() {
 }
 
 do_install() {
-        #install -d "${D}${BIN_PREFIX}/bin"
-        #install -m 755 "${S}/src/import/bin/docker-compose" "${D}${BIN_PREFIX}/bin"
-
-	# commonly installed to: /usr/lib/docker/cli-plugins/
-	install -d "${D}${nonarch_libdir}/docker/cli-plugins/"
-	install -m 755 "${S}/src/import/bin/docker-compose" "${D}${nonarch_libdir}/docker/cli-plugins/"
-
+	if ${@bb.utils.contains('PACKAGECONFIG', 'docker-plugin', 'true', 'false', d)}; then
+		install -d ${D}${nonarch_libdir}/docker/cli-plugins
+		install -m 755 ${S}/src/import/bin/docker-compose ${D}${nonarch_libdir}/docker/cli-plugins
+	else
+		install -d ${D}${bindir}
+		install -m 755 ${S}/src/import/bin/docker-compose ${D}${bindir}
+	fi
 }
 
-RDEPENDS:${PN} += " docker"
 
 FILES:${PN} += " ${nonarch_libdir}/docker/cli-plugins/"
 
-- 
2.34.1


