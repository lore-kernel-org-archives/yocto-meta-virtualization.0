Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B90C46CC5
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 12:09:33 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.6901.1702296571704731476
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 04:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+d5IE20;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c9f8faf57bso55466371fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 04:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702296569; x=1702901369; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP6FyViqjqi1cetplXt5AtPcrWpYTAEtHph8mHF5yVw=;
        b=c+d5IE20KyZaZCfTIqRAUKO+9ldds2l2ilHTPMWWfttk1AVEMebQrNju6+k0s1NA57
         O5uYhKjI7G7Uzlssyidj3CKK0Yb4U8zOiZZ2Zhna77v6wv1zwiLjpRyuuaU7QZKFDBpG
         k4vrkUZ6PFsyYBNuCumsTGKu4jWOl8CE2f+4ZUIeqO1jDtqVFiTU0f9KwN63q18wRK+4
         ysl0xv/1tXBKwhUfqpI+M9tbbMzv+ZXRMtvBgry8NBNrDYXWnzRG2WK6zC+7v3iRmAJT
         eSi1XswkdFg7hrf3Fwy0Gl2AimsYr8um5cjJO/dHM+Ldiso1vOUBYkqwU1qZytk2j4ng
         D11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702296569; x=1702901369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP6FyViqjqi1cetplXt5AtPcrWpYTAEtHph8mHF5yVw=;
        b=oG3Olk2K6KuZE4yzZT19E9BvHuRI+LLrDC/9Z2SfltGouhqrc5crE8xIOci1Vw5A2A
         4+x3semAq5g2DQYrpNcv3CuKge/koMKikQSaQIzCZ8wyyOR6YWi2LC5eXxTI/ijXoNQc
         jGQxxc5qKGpWQbhcyP7/+bjv4BUvV1yKgfBR+wmtxrGPT1ENYN8CRHcLlLtt99Ekde+3
         yHIWGgzYznyjZuByL0MHfDn2gBevl5fpvyfkbeWmDLuZUsKTjPxNsoQhIm+xKC3CA5cv
         q9FvNE7S7vkLY3BIIaCdx4Ee4CM66HgPxmIJPCB1fKTDkza2NlVQelmY5G3rUaUVAc7c
         3qlQ==
X-Gm-Message-State: AOJu0YydGEFaFFVWnDlE1M0EUMDWpcCtFRWGSA6kmsRdABw9mVnnoBqq
	iY1dgy4uZXu1Q2+cKsyHOC4yX5eFEmg=
X-Google-Smtp-Source: AGHT+IHBTq+WzYT35AYa5aTpQF63lKpLq+bFiBx4TuV6oorH87DWfAM58Lc3AVfIo5giI7w5XKWULQ==
X-Received: by 2002:a2e:b046:0:b0:2ca:3c4:3414 with SMTP id d6-20020a2eb046000000b002ca03c43414mr2150447ljl.9.1702296569077;
        Mon, 11 Dec 2023 04:09:29 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id r17-20020a2eb611000000b002c9f5039a86sm1210962ljn.87.2023.12.11.04.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:09:28 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 2/2] podman: add alternative link for docker
Date: Mon, 11 Dec 2023 13:09:14 +0100
Message-Id: <20231211120914.1631095-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211120914.1631095-1-liu.ming50@gmail.com>
References: <20231211120914.1631095-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 12:09:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8497

From: Ming Liu <liu.ming50@gmail.com>

Add alternative link for docker when 'docker' pkgconfig is enabled,
this allows it could be installed together with docker-cli package.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-containers/podman/podman_git.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 7634ac85..e021dcd4 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -63,11 +63,16 @@ EXTRA_OEMAKE = " \
      SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_unitdir}/user \
 "
 
-# remove 'docker' from the packageconfig if you don't want podman to
-# build and install the docker wrapper. If docker is enabled in the
-# packageconfig, the podman package will rconfict with docker.
 PACKAGECONFIG ?= "docker"
 
+UPDATE_ALTERNATIVES_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'update-alternatives', '', d)}"
+
+inherit ${UPDATE_ALTERNATIVES_BBCLASS}
+
+ALTERNATIVE_PRIORITY = "50"
+ALTERNATIVE:${PN} = "docker"
+ALTERNATIVE_LINK_NAME[docker] = "${bindir}/docker"
+
 do_compile() {
 	cd ${S}/src
 	rm -rf .gopath
@@ -151,7 +156,6 @@ RDEPENDS:${PN} += "\
 	${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'fuse-overlayfs slirp4netns', '', d)} \
 "
 RRECOMMENDS:${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
-RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
 
 RDEPENDS:${PN}-ptest += " \
 	bash \
-- 
2.34.1


