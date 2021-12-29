Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2378C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 12:05:46 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.50130.1640779545153928325
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Dec 2021 04:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TUuA44i5;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id r17so44028373wrc.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Dec 2021 04:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yr/EgWCnMRuCS+io/wBFFcfWMi+peGIsvjIEthNTkUo=;
        b=TUuA44i5SYrp3HqdajQ54H1fJoTVm+oBHkKFNJA2c2elu/cxj6De+ZixO7es38Ut7A
         2jHDwpUqYr0fJC1zWwpJqTYjdrPAWdF3dal58+s76x2oZs1d/zf+fvDLdkP0m7iV+CFe
         TzZqR2Y1RZYz60uGJEJvDcktG+ZPRSRJjTRqP/0MtisZ8evYdfr8BZWVeOXAAIS/nb9r
         f/JpOqa/2qEHHk2XNae7wotbhYaJIG1r/SdQyJBwj/NFgSawiYWluGNgE8WlHSU7CqOV
         vmiBn6MDWJUb2oWop7MDuN9QoEURCu34vAq8lu6jfrnKWyRWIOBUa5tGcBfmQzkl25PU
         AZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yr/EgWCnMRuCS+io/wBFFcfWMi+peGIsvjIEthNTkUo=;
        b=QC+Gdd5H9VobpsPb4TpZAaxwqwM6TKQ6ZFcOAYW8NVLHbD27tVaXhB09wOlTk7zJK7
         2aJNUHarzAZ8/wvmwnrbOUv+0Eklb76WBIsQtA0ZyKDIqojPAfi+oNOEH2kxy80FXbSQ
         cF/qRry1rLWJEhXsdJZeo+XvAaaaNTDWEiYqDO/gVAe5FZxkYkmwfm3syvrcEm28teCm
         qMtsOTdmbL5RbcN+4XUkd9iN7cZcw5ISdaVe6YLhnsEWBAaNmwdpoDqmkQcoPpPNN9Oi
         omlS1GO6CJRGTKEysQmsMEG8g3Fj4hFMCiwY3ptA/g5YqtJfB5YZaLUF7el0gsQnLkUQ
         xAxQ==
X-Gm-Message-State: AOAM531m0rwhrf+aw2woUnwU4gFS8ilSxCcP8FH/B8+6eE1prCI2KAdN
	CS9s+K9956weXXqNcBRHX97f0YXaybY=
X-Google-Smtp-Source: 
 ABdhPJwXREImeJ9OcYZxI5lXR4tte0mTKrgVfdu+KugFTMt05kD0jroyxToRiRbcVhU7DxSvCoLmsw==
X-Received: by 2002:a5d:59ad:: with SMTP id
 p13mr20004620wrr.602.1640779543197;
        Wed, 29 Dec 2021 04:05:43 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 l7sm21377054wms.1.2021.12.29.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 04:05:42 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][PATCH] k3s: fix systemd service install
Date: Wed, 29 Dec 2021 13:05:39 +0100
Message-Id: <20211229120539.2392783-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Dec 2021 12:05:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6988

- sed was complicated and fragile
- sed runs on k3s-agent.service before it was installed
- not all paths were replaced
- "if systemd in DISTRO_FEATURES" is already handled in systemd.bbclass

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 recipes-containers/k3s/k3s/k3s-agent.service |  4 ++--
 recipes-containers/k3s/k3s/k3s.service       |  4 ++--
 recipes-containers/k3s/k3s_git.bb            | 12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-containers/k3s/k3s/k3s-agent.service b/recipes-containers/k3s/k3s/k3s-agent.service
index 9f9016d..eeeef2a 100644
--- a/recipes-containers/k3s/k3s/k3s-agent.service
+++ b/recipes-containers/k3s/k3s/k3s-agent.service
@@ -21,6 +21,6 @@ Restart=always
 RestartSec=5s
 ExecStartPre=-/sbin/modprobe br_netfilter
 ExecStartPre=-/sbin/modprobe overlay
-ExecStart=/usr/local/bin/k3s agent
-ExecStopPost=/usr/local/bin/k3s-clean
+ExecStart=@@BIN_PREFIX@@/bin/k3s agent
+ExecStopPost=@@BIN_PREFIX@@/bin/k3s-clean
 
diff --git a/recipes-containers/k3s/k3s/k3s.service b/recipes-containers/k3s/k3s/k3s.service
index 33d3ee7..b82d8ce 100644
--- a/recipes-containers/k3s/k3s/k3s.service
+++ b/recipes-containers/k3s/k3s/k3s.service
@@ -29,9 +29,9 @@ RestartSec=5s
 ExecStartPre=/bin/sh -xc '! systemctl is-enabled --quiet nm-cloud-setup.service'
 ExecStartPre=-/sbin/modprobe br_netfilter
 ExecStartPre=-/sbin/modprobe overlay
-ExecStart=/usr/local/bin/k3s server
+ExecStart=@@BIN_PREFIX@@/bin/k3s server
 # Avoid any delay due to this service when the system is rebooting or shutting
 # down by using the k3s-killall.sh script to kill all of the running k3s
 # services and containers
 ExecStopPost=/bin/sh -c "if systemctl is-system-running | grep -i \
-                           'stopping'; then /usr/local/bin/k3s-killall.sh; fi"
+                           'stopping'; then @@BIN_PREFIX@@/bin/k3s-killall.sh; fi"
diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index c9779ea..d38044c 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -63,12 +63,12 @@ do_install() {
         install -m 755 "${WORKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
         install -m 755 "${WORKDIR}/k3s-killall.sh" "${D}${BIN_PREFIX}/bin"
 
-        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-                install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
-                install -D -m 0644 "${WORKDIR}/k3s-agent.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
-                sed -i "s#\(Exec\)\(.*\)=\(.*\)\(k3s\)#\1\2=${BIN_PREFIX}/bin/\4#g" "${D}${systemd_system_unitdir}/k3s.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
-                install -m 755 "${WORKDIR}/k3s-agent" "${D}${BIN_PREFIX}/bin"
-        fi
+        install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
+        install -D -m 0644 "${WORKDIR}/k3s-agent.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
+        install -m 755 "${WORKDIR}/k3s-agent" "${D}${BIN_PREFIX}/bin"
+        sed -i -e "s#@@BIN_PREFIX@@#${BIN_PREFIX}#g" \
+            "${D}${systemd_system_unitdir}/k3s.service" \
+            "${D}${systemd_system_unitdir}/k3s-agent.service"
 }
 
 PACKAGES =+ "${PN}-server ${PN}-agent"
-- 
2.31.1


