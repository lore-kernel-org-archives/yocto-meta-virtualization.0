Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69310C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:29:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.8624.1702978169022355297
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Dec 2023 01:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAJOWfI8;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: liu.ming50@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso49540335e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 01:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702978167; x=1703582967; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuwXcexQBkr4fge7ve495RXkoBkuWssV6qha7QzZLzk=;
        b=dAJOWfI8owbBS+KdeVPJAnJeScnnW8Dcr4VI3hhV5R4LZad+nFVUYOf6f7jOBB4Lq5
         o2qAKg2M93O/f84cPtHpNUjG+vM/dTd1qIoZ8hS7rbzG1ZJwirxZHUEVshsOK+S6Wk7F
         /BACwEzyYWCRlUyujAxS1awga0bA3O6w6xhEwKO/53k0xqGfBxnh5t+1j5oXC7Dr8M4S
         /KH94ueczNHNQvtZchHsRhEHna2GMSSF4bnJhfJHqaE8/zjqmh2LrqU1Qa2nmwLUcPXl
         As223qrNfCeuJ45GVsjkDTq2qDBrvkslIeIIVoKxXVKUDkrwdaDZZLwXI5urRhdkCrYL
         WDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702978167; x=1703582967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuwXcexQBkr4fge7ve495RXkoBkuWssV6qha7QzZLzk=;
        b=w7nXbsTzsJ/lIMvzZ5x7CBZ9iVj1e4PJ43d7lgwvbs/e7eHdFWx9MAcvORh4z6GK3v
         Cmodt1D+yWYUs9NxgsMCX5bKmxApy19zsiOMc6iuY68D7glJrWqiGk/YltJg029jdRiL
         u3Y7CUXpktA1loQie25rvPwg8MTYtMIGn0WkLxF60s16EXaWNhMPCncxhSVdYcVNZrvr
         UT+EOewqAa2mZQXcItox581zUezh9RaezhBW71oBnWv1bLDs4vuP4LGs4ZLA96rLhFiU
         7bUlyNLWwsU3tH8atC2IUtrGqxMrhsBJjmEcC7HD1JeEwmX0nHnFeBDhbEB4oTQmKaUK
         1bMg==
X-Gm-Message-State: AOJu0YyZttvAiTQF09dXgCbPyww21bJoVOSdM1U5eNXQbRVE0rLRdt/3
	pR00/M62/UbY/T7pKA0hkK6JNNSZ5rfcjQ==
X-Google-Smtp-Source: AGHT+IFjgDj4bmgqqQxph1l5MuIseK6SkYDyXTZV8xhJ01c9C0cyWmczqRUIndLlQlyonvMyY7FKZA==
X-Received: by 2002:a05:600c:4995:b0:40c:2369:c9ed with SMTP id h21-20020a05600c499500b0040c2369c9edmr6514111wmp.96.1702978166750;
        Tue, 19 Dec 2023 01:29:26 -0800 (PST)
Received: from peterliu-Precision-7530.atlascopco.group ([213.50.243.108])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c19c900b0040d18fdfe96sm1918601wmq.44.2023.12.19.01.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 01:29:26 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 2/2] podman: add test instructions for podman system service
Date: Tue, 19 Dec 2023 10:29:11 +0100
Message-Id: <20231219092911.14331-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219092911.14331-1-liu.ming50@gmail.com>
References: <20231219092911.14331-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Dec 2023 09:29:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8519

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-containers/podman/README | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/recipes-containers/podman/README b/recipes-containers/podman/README
index 4c223a39..213ac256 100644
--- a/recipes-containers/podman/README
+++ b/recipes-containers/podman/README
@@ -18,3 +18,24 @@ Basic configuration:
 % podman images
 % podman unshare cat /proc/self/uid_map
 
+
+podman system service
+---------------
+
+The podman system service command creates a listening service that answers API
+calls for Podman, it supports systemd socket activation.
+
+Test with docker-compose (v2):
+
+To be noticed, docker could NOT be installed together with podman, so
+docker-compose should be built as a standalone tool, remove 'docker-plugin'
+from its PACKAGECONFIG at build time:
+
+```
+PACKAGECONFIG:remove:pn-docker-compose = "docker-plugin"
+```
+
+% sudo systemctl start podman.socket
+% git clone https://github.com/docker/awesome-compose.git
+% cd awesome-compose/postgresql-pgadmin; source .env
+% sudo docker-compose up -d
-- 
2.34.1


