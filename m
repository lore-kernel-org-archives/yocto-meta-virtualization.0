Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3215C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 18:09:48 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4439.1704737379053958348
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 10:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bAV1I9YN;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e47dc8b0eso8837765e9.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jan 2024 10:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704737377; x=1705342177; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TROi1KiYD2jeLAivy/7vAMGru+r30gHTrl4/f+0qIJQ=;
        b=bAV1I9YN2Qrowkh7hLBvGCmrVnf8Gv8tyxo9j2jvrAFNW4NDJ3MlOi5pqiUSM5p7cD
         cdYgU4S74kf96eolRd80PS8NoHh69MMuiY24fIb/NgZKYy+C1nWaF3NuF/lEpaz5BQpj
         6I+hRmjU9h2umixA5yZWN1d9Xs9G34ec8vnQtvxVI+Y3VHLSRcK+A1RvmgKWDAFy9xhG
         7r4fuZUvOFGZrtxAK8vJKcCWCO8Kj9w4nwezGYpvFisPhf99tPZ2ANNNzPwlgaVWvg5Y
         X4E/PFbiz6VpkQsunE7Ng6JBcnePFTOQ9Ls7AqG2JyIMIglbSVNVt/mtvdvGjy1OLHZX
         ajgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704737377; x=1705342177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TROi1KiYD2jeLAivy/7vAMGru+r30gHTrl4/f+0qIJQ=;
        b=q/qXsRCLlXFtJpxRIZXYN/fREaINOE0PXdc9GONNlT5Pr8UNI++iYmKv9gRR3+OWCC
         Ej7HfmWBImK6yG4ZV3R3ZUGdCPbV+BLGEfUJhsaIM9CkY9Ww4vcztbW+ty/o6iCEJe7e
         terGEWk0CnHpekH7kGmygODoUP3ndVk9tcSupEU+OrRTCmcyXT7E/tg8nC0bgzl2YWbr
         2AqEHsKa4DyNugtXCYZSE7g9yrg8l+VQg1sYxpjiTYxUL/KGvaULt0Pdg5pQ3+AjmecS
         bc874H4QsPodU5CdFKXoUZir6/4i98Pwn7od//X99z2YGX5XH5aMRSzQsD45INA00LDw
         49hA==
X-Gm-Message-State: AOJu0Yz6dFKnNsLO1Ox1UGW3TofL+NYoiEYctLjC67lkj5WLft4Vrwkh
	oW8JwNZBoF+Mhby+j2leVHSVzhpHTS8=
X-Google-Smtp-Source: AGHT+IGNaCjYJVyJmn0QsF20bKjA0TguU0dEnCwLgZwP3qxNSVjyk5yyLIhACjbMvcZ88C6yWOjx9w==
X-Received: by 2002:a05:600c:4e8b:b0:40d:560c:eeab with SMTP id f11-20020a05600c4e8b00b0040d560ceeabmr2347428wmq.58.1704737376645;
        Mon, 08 Jan 2024 10:09:36 -0800 (PST)
Received: from peterliu-Precision-7530.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id b15-20020adfe30f000000b003367a51217csm269709wrj.34.2024.01.08.10.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:09:36 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH] podman: support bash completions for podman/docker
Date: Mon,  8 Jan 2024 19:09:33 +0100
Message-Id: <20240108180933.2362963-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jan 2024 18:09:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8531

From: Ming Liu <liu.ming50@gmail.com>

Generate podman bash completion script with qemu wrapper.

When docker pkgconfig is enabled, also generate bash completion script
for docker.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-containers/podman/podman_git.bb | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 33d437a3..1c64272a 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -68,6 +68,18 @@ EXTRA_OEMAKE = " \
 # packageconfig, the podman package will rconfict with docker.
 PACKAGECONFIG ?= "docker"
 
+# podman builds bash completion with the help of podman binary, only the machines
+# that support qemu usermode can enable this pkgconfig.
+PACKAGECONFIG:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'completion', '', d)}"
+DEPENDS:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'qemu-native', '', d)}"
+
+inherit qemu bash-completion
+
+# To avoid breaking the recipes without 'completion' enabled.
+ALLOW_EMPTY:${PN}-bash-completion = "1"
+
+QEMU_OPTIONS = ""
+
 do_compile() {
 	cd ${S}/src
 	rm -rf .gopath
@@ -116,6 +128,23 @@ do_install() {
 		install -d "${D}${sysconfdir}/sysctl.d"
 		install -m 0644 "${WORKDIR}/50-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
 	fi
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'completion', 'true', 'false', d)}; then
+		qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
+		cat > ${WORKDIR}/podman-qemuwrapper << EOF
+#!/bin/sh
+
+$qemu_binary "\$@"
+EOF
+		chmod +x ${WORKDIR}/podman-qemuwrapper
+		${WORKDIR}/podman-qemuwrapper ./bin/podman completion bash > ${B}/podman-bash-completion
+		install -d ${D}${datadir}/bash-completion/completions
+		install -m 0644 ${B}/podman-bash-completion ${D}${datadir}/bash-completion/completions/podman
+		if ${@bb.utils.contains('PACKAGECONFIG', 'docker', 'true', 'false', d)}; then
+			sed "s/podman/docker/g" ${B}/podman-bash-completion > ${B}/docker-bash-completion
+			install -m 0644 ${B}/docker-bash-completion ${D}${datadir}/bash-completion/completions/docker
+		fi
+	fi
 }
 
 do_install_ptest () {
-- 
2.34.1


