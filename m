Return-Path: <ryosuke.saito@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A967ED3B7E0
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 06:28:41 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.13233.1732516116323409276
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 24 Nov 2024 22:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JyMUIyRY;
 spf=pass (domain: linaro.org, ip: 209.85.214.180, mailfrom: ryosuke.saito@linaro.org)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2126408cf31so29806545ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 24 Nov 2024 22:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732516115; x=1733120915; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vmed9LCNHkPsp8VfPKK1K4kTvX2Oy+sa0gZPKUHf+8Y=;
        b=JyMUIyRYB3Y85RwfX92JK46Xh0awhRr4vABpk4F7YPWB8VygdV+g2YE1mRyILikVg/
         uP4WqVedx9mxE9rQh6ExRHKHWnj/YTpLRgESSXpcEuwovVazJHLq78k9pzbNe/hUgwK1
         6hRyCdFSuXLrYSwAF8fU0XIr8dI57SMStTAgq48r+N0Lao+Bwg/OrtBFe1rn+yu5lkft
         xtL6+Km/Fwv03OvVIeOne8+0zpJzfqVQsJkx9neRjdwoYvMlY+9Bx7PxryHvgVSeUWKa
         W19yqQTjckMeXyCsul2Yl9SaK711fa75BxKTtXFOisYZuOzIvZCt7TL99SKvMMzy5Ygk
         Vozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732516115; x=1733120915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vmed9LCNHkPsp8VfPKK1K4kTvX2Oy+sa0gZPKUHf+8Y=;
        b=a3N+fjCrVFJcPon0CayTqIU0tQ/4rKxGfirBiOXebMTfYzWjcgYBJ1sx0KUIbNUs1c
         M807nq5GU4YWSoRaB477IEeqDEWQpqhZhVZr5k8cOTQk4S7kb2ZjyfXnYk2yTKiOy8nv
         vvVem6+BqtGx5tOCwIabW5FWYxszYPRQQ14EuE+H6SpLAK7Uj80IyHX+2Z2wqmdwlkzp
         AEeFMpSShDUWbZ654NOwllD1wpCWJegr62Db95zMPF3tn/OZMK0ZNsIt3H8LG91FgPph
         km7hNhbB0UVg3agrn5dmZDtGsSRO/HuLRw+cMf3gbuYmTaZYsbV833bcHTDE28Bg+cra
         g+KA==
X-Gm-Message-State: AOJu0YwVFCL84aGak39WsJpozjE/aWBqV2zCTPGvM5k6vGH+omz8Ow8G
	88K/CR3tRFQqPoEa9bybX9ZGgQCPKRbEno4W1QQ/NHnC+TRrjtSdOZ1i7ai4/DS9IwmK4RMrIfR
	K
X-Gm-Gg: ASbGncs3nyylwxO6EL2ESZUJKL1sLK+PKT4bz8qM5VCZMpw/H5qeZT0l0YD+Q8Ri/Yt
	48nQMkURWEH4e141weh4tub+4iDgdtdu7g6Pn+uOn5cjHtPaull6fjFBu2Yz8+BkDcFjWUuJXAX
	uSWcQZoDLBFgjIWmilrLf4BKf7NLcAXQN0SORLLMO3v23PoPQDK20v4WrA+IZLJGo6gtdJl99WU
	1rv87/qHht1w7tWy9QHoXv65BpXmAVkOK5R/D45CbnoHrd0+f/y
X-Google-Smtp-Source: AGHT+IFmfn2dqyKcsM3BCVboJr3U0j2zicg0jYT3t2HqRZRwZl4OqweUWc+U+rRExqRoMRaU3DEuVA==
X-Received: by 2002:a17:903:983:b0:20c:8cc4:cf2c with SMTP id d9443c01a7336-2129f51c10fmr171084955ad.10.1732516115352;
        Sun, 24 Nov 2024 22:28:35 -0800 (PST)
Received: from fedora.. ([240d:1a:3a7:a400:9a57:aa11:487a:b54f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba1b40sm56866755ad.87.2024.11.24.22.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 22:28:35 -0800 (PST)
From: Ryosuke Saito <ryosuke.saito@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: raitosyo@gmail.com
Subject: [meta-virtualization][m-c-s][PATCH] layer.conf: remove BB_DANGLINGAPPENDS_WARNONLY
Date: Mon, 25 Nov 2024 15:28:32 +0900
Message-ID: <20241125062832.686682-1-ryosuke.saito@linaro.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2024 06:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9011

Remove the use of BB_DANGLINGAPPENDS_WARNONLY as bitbake no longer
supports this.

Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
---
 meta-openstack/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 6774aec64cc0..114e1abb5fd7 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -8,7 +8,6 @@ BBFILE_COLLECTIONS += "openstack-layer"
 BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_openstack-layer = "5"
 LAYERSERIES_COMPAT_openstack-layer = "styhead"
-BB_DANGLINGAPPENDS_WARNONLY ?= "true"
 
 LAYERDEPENDS_openstack-layer = " \
 	core \
-- 
2.47.0


