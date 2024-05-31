Return-Path: <marcus.flyckt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D98C27C44
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 09:13:24 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.7394.1717146801904036993
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 31 May 2024 02:13:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0Ov78py;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: marcus.flyckt@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso27397081fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 31 May 2024 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146800; x=1717751600; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhd4hs9vlvqJLqVo1gioPVSRfEL7kcYTCD9KEwhPdZY=;
        b=D0Ov78pygpDUtZy/JtXWh/C4mj/b6kA6A/lTEtB5kb5ct8+ATjxEUL2g8DgfwSrQTb
         DWj7286DDPWeU9T/MRfJPBeH/Koq6lMwO5xgU1ZkhuPlTibOP7n76xCfZWFBf8OBDRrJ
         gectRIVKMX/vmaYfkQQGCdC+T95YiL2sP5HXfYCngOulVrh0wZrFXIFSZeIPeKXanQku
         gKIlJ88ce1dGW00u7W9qEPz6+RmgjcWbh0vv7xTMvj3qHX8r+JRfU0YqVrk4jUJxsdJj
         R2Gam3BcqQpM7KTkku4c+Q/+zwH1GovSaiNRHRH9xvyb4kc/kQ4KCeNNHtVtDBrgvfQl
         Icsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146800; x=1717751600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhd4hs9vlvqJLqVo1gioPVSRfEL7kcYTCD9KEwhPdZY=;
        b=D5iTLk6X2yhK5W04HBOFjYiR2iFFtdymMauBZqqWdBeLqRgQvlHax99VhUSiZiarIX
         rgWUSug9250Gps2B1DkXW1MY+UbmGHmfBic2iqk5rZnibvooMVb0e2e/4R7RPJBvC5Md
         X2hpAEjeLMVYdlWzaTRwrS4zRQ3SyyrDfHGb+hUCbh415Is/JeupW3KaqouID8CMNogo
         XpKJXwcew5q5WguH82DGcx4LUpiptkRDGOflgNNuDCLaJcq6JPB202Zi9AZGry1M2cer
         Nj5kG4upENZyCzWJgTGNyNa/sj1oC/V9QCpfs/adNa/HmJKW6nkkS/anvYtzarUmhz1m
         KweQ==
X-Gm-Message-State: AOJu0YyzsDwGUCLCnWPs0OX61gdsklQSD31hq8DcTw2s89Na+iY7MDC4
	//LKcwqfeWzwVlT4q+cdc3Myhnl0LKrYRhduZnhC4bbXRNOihSS0xCg8CQ==
X-Google-Smtp-Source: AGHT+IEKutti9bZ6q3gIMczy7ufSbtZ9/dwRw7egfKOOnKNEq2jIkveEP5VzzXC1LT50rWhQMNZ0UA==
X-Received: by 2002:a2e:b6ce:0:b0:2e5:566:c752 with SMTP id 38308e7fff4ca-2ea951f5d74mr11467651fa.48.1717146799324;
        Fri, 31 May 2024 02:13:19 -0700 (PDT)
Received: from Flyckt-Ubuntu.kvaser.se (83-233-138-78.cust.bredband2.com. [83.233.138.78])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cc6401sm2397011fa.96.2024.05.31.02.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 02:13:19 -0700 (PDT)
From: Marcus Flyckt <marcus.flyckt@gmail.com>
X-Google-Original-From: Marcus Flyckt <mafl@kvaser.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Marcus Flyckt <mafl@kvaser.com>
Subject: [meta-virtualization][PATCH] podman: Use slirp4netns instead of pasta
Date: Fri, 31 May 2024 11:13:16 +0200
Message-ID: <20240531091316.339912-1-mafl@kvaser.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 31 May 2024 09:13:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8789

podman uses pasta as the default rootless network command since 5.0.0,
but only slirp4netns is available when building for Yocto.

This commit adds a containers.conf file setting slirp4netns as default
rootless command if 'rootless' is set in PACKAGECONFIG

Signed-off-by: Marcus Flyckt <mafl@kvaser.com>
---
 recipes-containers/podman/podman_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 32de3f0c..b8e90406 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -117,6 +117,11 @@ do_install() {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'true', 'false', d)}; then
 		install -d "${D}${sysconfdir}/sysctl.d"
 		install -m 0644 "${WORKDIR}/50-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
+		install -d "${D}${sysconfdir}/containers"
+		cat <<-EOF >> "${D}${sysconfdir}/containers/containers.conf"
+		[NETWORK]
+		default_rootless_network_cmd="slirp4netns"
+		EOF
 	fi
 }
 
-- 
2.43.0


