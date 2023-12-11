Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3044CC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 12:09:33 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.6900.1702296568987041537
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 04:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fWYjA8NV;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c9f572c4c5so64925741fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702296567; x=1702901367; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/6xKSTSae8SNWDJKB/LYWVrYZsO4ZF1pQPeV9CER0k=;
        b=fWYjA8NVdhPc5EX6w8HH5KFjPQjkSeKYv4rjf/WmtPpxZEZ027SqhlBZ1RE3EttmZt
         tn3nh/vShM74tQBlSAO+qKpdcoEeas6W0XnVuKTA+YDxTA2rg1xp69SRTwX0EuCLoCyl
         qkCSnvsGZ15m5LMmWPRULDaVtZB6kxlZayc7MnvkC7zLE0Vyd45OSJoIasnFXETqBr3O
         FZ1rnNoxj62s8nIqb2KT/dh9zSqejkbEddzhQKi7BaehghzTBwd8U4cLP1UI3FCE9BW0
         Pfa5WNqLi73B6nmZGb8OuT1aKq4aAsXs35T9Y7nbG+0q1ZkqmDfM1kkd4BhWLHs061/C
         Gl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702296567; x=1702901367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/6xKSTSae8SNWDJKB/LYWVrYZsO4ZF1pQPeV9CER0k=;
        b=IrAVlE2WTLkDXEvxDkvliZkUTDuN1Yi4SvjT5z8Ghw0251YFLw7nsbQxAa3tqSbt6a
         OKJsAcXM3sH/cTov7kCOKnq++wjwWaieszbMWAqZ9l5ftkGbOASAHsj6d81O6O4cBc7A
         zHogZXZeHR7dEQ6WmG8/FzCwasU40T2nbFViIL/DYOu9y5Da31yYPYA0xqCZ0hm0dxy8
         EmM43JzLne/nFR+yJd7eVbbgQ/wEwUcffkiCQup+X3BAQH10WESyAZ8QLcDmqUOcSCP2
         l3154maxrrVcf1my3+DOXBfmwM4qsKvcR+uiqPyFRQ53vTzWlRYByA01u54NNatmNRrI
         5/MQ==
X-Gm-Message-State: AOJu0YzqQC9JGycaDVPDjD3NE8GTwTJRtHOynmJkczkMc2RLgPBSBheQ
	86g3uCLgGTzhXmvAMe2LtbmdJ3KIp10=
X-Google-Smtp-Source: AGHT+IF4OYOsCtzhrrV62bibhKo1Z/7OQNAtryXpBIf27CsxCWaQ3ni8+gwviWBuZFGZ4wA6bZruGQ==
X-Received: by 2002:a2e:be23:0:b0:2cc:1c47:127d with SMTP id z35-20020a2ebe23000000b002cc1c47127dmr1217335ljq.28.1702296566614;
        Mon, 11 Dec 2023 04:09:26 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id r17-20020a2eb611000000b002c9f5039a86sm1210962ljn.87.2023.12.11.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:09:26 -0800 (PST)
From: liu.ming50@gmail.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-virtualization] [PATCH 1/2] docker: add alternative link for docker
Date: Mon, 11 Dec 2023 13:09:13 +0100
Message-Id: <20231211120914.1631095-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211120914.1631095-1-liu.ming50@gmail.com>
References: <20231211120914.1631095-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 12:09:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8496

From: Ming Liu <liu.ming50@gmail.com>

This allows other recipes also install docker tool, for instance, when
'docker' pkgconfig being enabled in podman.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-containers/docker/docker.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 48f7d3ec..861b4839 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -36,11 +36,15 @@ GO_IMPORT = "import"
 S = "${WORKDIR}/git"
 
 
-inherit systemd update-rc.d
+inherit systemd update-rc.d update-alternatives
 inherit go
 inherit goarch
 inherit pkgconfig
 
+ALTERNATIVE_PRIORITY = "60"
+ALTERNATIVE:${PN}-cli = "docker"
+ALTERNATIVE_LINK_NAME[docker] = "${bindir}/docker"
+
 do_configure[noexec] = "1"
 
 # Export for possible use in Makefiles, default value comes from go.bbclass
-- 
2.34.1


