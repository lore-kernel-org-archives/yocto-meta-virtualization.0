Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F77BC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:13:51 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155193.1783358023376148827
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Jul 2026 10:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GQ8NFOgO;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-847921eed4aso4506458b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358023; x=1783962823; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=86RV8dobbRzhbO4tvhC4PKCwpxaLUDHbCbcgBO5CPq0=;
        b=GQ8NFOgOl573j1Q1phezsp4QqtY1IwFPj0rJIgpVCGGxQXFfU1KlbNB/eu+QbcMikJ
         z9vcUL8TgBIisipKXX2GDUKT6+ilrKnsmXtPIV9GvVqZHo5LA/X7nMUBd5hKVumbNFuw
         LDiVwNLqWxJCywAALR1fQtRvX0ZG5EArY8hGWICV6dNcO8qlXKsEG2rEEjz+KICRCVn3
         e5CAaJl3WgLyP8+OLCFVNyhWRCoxo1mpTJqozws4rUnxZGu4H+F389OJoEHaA8+mcizJ
         xinX51zue8yIEzstBSPvaDdzLCwjRuvd2238n9Ric8f8G/4Z6Y2hvdeeCJgFHWsLbBgk
         HkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358023; x=1783962823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=86RV8dobbRzhbO4tvhC4PKCwpxaLUDHbCbcgBO5CPq0=;
        b=BBodzl5+9wvFWp92ENwkmmSsEKngCOVK1XnOdQCbNiVBToNJxpezKAPFyle6YTr5vq
         UwDbCRwcEYhe3DVx0hV3EMf9flu/6uLbCMd/tSSUrXtQTEkvS8MEQJ6grX6FJDvP2exM
         DxOrxpBUVutaKlrspybx2FHaeXM/q+rjH6C0HcNxjGlCHytQipnhybJ6imqYHmvnAZcB
         XVz+seKMwIM8UwE9W1FjP9Inu1RjbqZisyBR9Q/qyV/JuF/YJz3SzUZw92TiOJjjJ+qU
         x6Qkqk76lMywNnWdLLaLOiD9CmyFL3Y9f25DhU1CmeU23g6K+OWqJ+PzKmirEdhednFw
         +ZeA==
X-Gm-Message-State: AOJu0YzdLRAjtMEflJvWSUNf27I5gmJ9n6h01su7BKSVbdYvCdDQsaf4
	iAi/Nk1CrMhuU/8jsVnTRKCt8zVZVjsHzTYFn0vGzlOpjEnwyIYhqI0Ied/tGw==
X-Gm-Gg: AfdE7cm8/wa5e2d15gkvnpcrW8yMnHZjTDJKYShDE1fsxOP8coDUZ/9b1f6Sv09u9ww
	HymArhmgsWNhRrlu8JvgKXPvB3p0Nrma4E3ahGDRKIuK9AtUB2m9NnZIhEmEvTVCQ7qS+zPLzv3
	vaViTFB8YsJq1cKLVGaAXRoQ/ZIDBhCxPJsxHIoimM4T7GH3KkryAfXjAGx05DMhgW//gc58m/r
	4WA/62K2tOC4Vc1nJQNwUOmWvhdAicB3/SHt7yn1DNnRuOx5uvMh2OepDmJCwxfg13FiLy5bbCK
	ZCEHx4tXKg/Gky1RD4s7SyJY8eyIv8+E0F89RrTbtsAK5eMS/w3V9X/HvAapXYyHCHBBOZ+c+TW
	YILjz/cJAsEWUtwk5Yya+lE4sHIB65KaVYsRiwHwrifYQzA8YzGF7zjmUueBQXrSpid7LcfBD2j
	HY77mGhqy9KToq9hLytqtSigh7R38VWHFWJ4qpPCLj3iDm5VkTXPNWRUj5cARafsOXUb/hAvzix
	Ihe/1ixVbfu
X-Received: by 2002:a05:6a00:1c8f:b0:847:9178:f396 with SMTP id d2e1a72fcca58-84826c960a9mr1631620b3a.16.1783358022804;
        Mon, 06 Jul 2026 10:13:42 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bd1078sm4121873b3a.24.2026.07.06.10.13.41
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 10:13:41 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH v2 01/13] image-oci: set OCI_IMAGE_RUNTIME_UID with ??=
Date: Mon,  6 Jul 2026 10:12:36 -0700
Message-ID: <2a7f456b9137fb0d19117a9792623fc279e0cd5b.1783356922.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783356922.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com> <cover.1783356922.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Jul 2026 17:13:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9925

Allow other subsequently inherited classes, such as container-nonroot-user
to set OCI_IMAGE_RUNTIME_UID with ?=

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/image-oci.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 1ceadc7f..9914411b 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -94,7 +94,8 @@ OCI_IMAGE_AUTHOR ?= "${PATCH_GIT_USER_NAME}"
 OCI_IMAGE_AUTHOR_EMAIL ?= "${PATCH_GIT_USER_EMAIL}"
 
 OCI_IMAGE_TAG ?= "latest"
-OCI_IMAGE_RUNTIME_UID ?= ""
+# Allow other classes e.g. container-nonroot-user to set with ?=
+OCI_IMAGE_RUNTIME_UID ??= ""
 
 OCI_IMAGE_ARCH ?= "${@oe.go.map_arch(d.getVar('TARGET_ARCH'))}"
 OCI_IMAGE_SUBARCH ?= "${@oci_map_subarch(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
-- 
2.54.0


