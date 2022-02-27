Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FD1C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 23:28:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.14222.1646004503078549647
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 15:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=klC2/WcX;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id z2so9218324plg.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Feb 2022 15:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7JQejhwYj7uqjNLmeKabLn2mRL4jFTenAjV4Mszp+ng=;
        b=klC2/WcXXlKP9q3umwOaLOqLACJHx8NSuFLpvakN0yXjr8kIWptHh7u1BxBJI2Sglv
         xcs2VYBZ6J8l/skYUm/cFge1jzxdZ+/unvbqlE9yhXX9/b8DUtaGHQlyQcR8tu62yNmH
         B7lSiJ4dmOpuLgGeTgxYqRl3kbuU/9GOaFxzEzS+o53HxztEC7aaN1YzKlnjzsj0JE6d
         di7HuW2dCI0WfLGOD5f11z91wkzCbgDJQcCLIzAjHQtC+uqHevqHFCwzNPz1l9BdL7Nu
         2vkZh+rXY0IKwwFKyoVNWr1LMoH+YTpjNpmntkwPLGr7fBUyiNq4IBIhxMoEw2Oo/agM
         cLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7JQejhwYj7uqjNLmeKabLn2mRL4jFTenAjV4Mszp+ng=;
        b=GI1w6Xgku/0uuZ89T1EkNOlm4g4RNMgfat4Lyhu2IpWlsMIH/DZvi+QslMwip29Wtc
         n9mVNh6cPajWm/gTDHmpbZCyyMWMHQUk3e42SfeqKiYNZwvjNRqm+cqd630Mj7o91LTb
         7/PNk40+GkQbMatYGSDOrIRPsQXyP2/KLSkj/EsoVTh+zCxvhhH1mhNXgl7aWgSCZi7x
         lQf3HjkFdZTdTjz5PiFsqYXE5BOLiJHO1OLlpD+86S49AwJOymEItka216Q7EFVKluA7
         4a3SXU4Nd1YGlgHGx1Q6Jtja+RjC5OzyvR1IAW7Bl8PR1SYFLCcXaotLWIQumbX9t/GY
         MPnQ==
X-Gm-Message-State: AOAM530oJbXejNA6aOWz6x+FvsZ54178WBf3HlBxOSS0MiWUHyaCfUSB
	PUFNR/3iQb7l+kzXWKs4ExheydX1s4E=
X-Google-Smtp-Source: 
 ABdhPJyQyjra0Mr/rmTUuMWMYgefjwdYjWTj2jO1uZOztORqr6XVZCTRC5cw+WX85QvI/wp0b8GfUA==
X-Received: by 2002:a17:90b:4394:b0:1bc:e369:1f2b with SMTP id
 in20-20020a17090b439400b001bce3691f2bmr13762323pjb.92.1646004502075;
        Sun, 27 Feb 2022 15:28:22 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:1961:a694:c80b:3158])
        by smtp.gmail.com with ESMTPSA id
 s33-20020a056a0017a100b004bf85a94ef2sm11166972pfg.183.2022.02.27.15.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 15:28:21 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-dtc: fix wheel build
Date: Sun, 27 Feb 2022 15:28:17 -0800
Message-Id: <20220227232818.1085145-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Feb 2022 23:28:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7066

The wheel that is built is ${S}/dist/libfdt-1.6.2.dev39+g4048aed.d20220103-cp310-cp310-linux_x86_64.whl
Set PYPA_WHEEL to match this.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 recipes-kernel/dtc/python3-dtc_1.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
index 449d071..671d280 100644
--- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
+++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
@@ -19,6 +19,8 @@ SRCREV = "4048aed12b81c5a0154b9af438edc99ec7d2b6a1"
 PV = "1.6.1+git${SRCPV}"
 S = "${WORKDIR}/git"
 
+PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
+
 inherit setuptools3 pkgconfig
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


