Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC514C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 18:09:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.4416.1704737341146924229
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Jan 2024 10:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nS0TmMfx;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d5b89e2bfso23201305e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jan 2024 10:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704737339; x=1705342139; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLSpMB8Y2wSvESlTgZDglx/M2Hb7UJw6OzNn4CQEDpM=;
        b=nS0TmMfx1h1hej+6a5eA4XE6FTUm6DFTwfnmw7CxOqXANJhYjDb2zslz70g11gr7Jo
         Ex/He/f8/7Q72JaVuznsDagIHQ5HWHMTW7ELNI3f/q9ki2zQDT3fFSfIBNp5DfUDaPxB
         vemq0HN/Mz45t+XnpHvEv+RkvSIExDQfkjfb2OCVEvfyUFYZMukJvdFZNxYUxxiC+YUI
         QhSG9JpW2q+Be8/ILrTQxw+DD0YAZWndku3HbM8DxzDl8Gh/9RrVs0Pe0i5+JhUD2dh1
         IxHb2eyaHoKMlwM/B4X4uOKBw9wYxFzONRyg3D0shSjFBCGwYcdNO4AfllEMQL+gKF5b
         ww7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704737339; x=1705342139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLSpMB8Y2wSvESlTgZDglx/M2Hb7UJw6OzNn4CQEDpM=;
        b=M43HDBPNHOtllfnPa0LIGbCJvXbeOwfBfcdEKC1U2FWK9OaKfPDB4gxQsYE0DlQKbr
         hNOTGQxCr3eI9WAyjfwd/gif/pDQ+6R53R+0TDG9mNebkoxsyV0iUh5DTL4QO/+bchd7
         HqvOcdGASY6KCOzW7ohrcpeW1HJBK2/r47hdlxleq/0MFglTz2FeZPW8pWDdXMicgktX
         cRee+io1CFZBJMOK036Wo3LQqW2CPjuAoYx2yim+AqjUJQeXwK3lip7/VVUQPeROhMCJ
         HGsjZL7vo3axbKqye/XKz+/UCNjlP5NNStr9+APmZIcnNy2So3pf0LdBTnK9fKD1WJAP
         KG8Q==
X-Gm-Message-State: AOJu0YxdFfvhueSLdxiQAfznkEfTsGYO+oOjpf0ztlXAoi+pY4TQMsTY
	tMcX6R4Autg6tM194Nb+uGN8PyWwZhk=
X-Google-Smtp-Source: AGHT+IFv6o6bazLYImV10X6NUhK+W4U6u00Oe6AW2yT6xigSAic7+Fl+BHDoj2jjgPx6nLbf9lMK7A==
X-Received: by 2002:a05:600c:1d04:b0:40d:725a:6c6 with SMTP id l4-20020a05600c1d0400b0040d725a06c6mr1985593wms.181.1704737338494;
        Mon, 08 Jan 2024 10:08:58 -0800 (PST)
Received: from peterliu-Precision-7530.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id fc12-20020a05600c524c00b0040d5a9d6b68sm11946877wmb.6.2024.01.08.10.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:08:57 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization][PATCH] docker-moby: support bash completion
Date: Mon,  8 Jan 2024 19:08:54 +0100
Message-Id: <20240108180854.2362898-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Jan 2024 18:09:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8530

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-containers/docker/docker.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 48f7d3ec..53cdc703 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -40,6 +40,7 @@ inherit systemd update-rc.d
 inherit go
 inherit goarch
 inherit pkgconfig
+inherit bash-completion
 
 do_configure[noexec] = "1"
 
@@ -122,8 +123,10 @@ do_install() {
 
 	mkdir -p ${D}${datadir}/docker/
 	install -m 0755 ${S}/src/import/contrib/check-config.sh ${D}${datadir}/docker/
-}
 
+	install -d ${D}${datadir}/bash-completion/completions
+	install -m 0644 ${S}/cli/contrib/completion/bash/docker ${D}${datadir}/bash-completion/completions
+}
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
 SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.socket','',d)}"
-- 
2.34.1


