Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7CDC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 11:14:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.58524.1721992448054308465
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 04:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bvETgim0;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so2292705e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jul 2024 04:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721992446; x=1722597246; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8I/eL+OQatimF7WbyE982ifzPP+Fj9BthTqv3DGy+AM=;
        b=bvETgim09pxMvnNOtSrW0XFQ26/rybvbU5+m4glfPP/X+2szod1rcWzhrkDMndxKT8
         8fHSHjfFYE9HAh4cDCfoG1UZPfVwA5riKQiRAMsTJLbqYBNr8tDFteHWkwxfqSwBmMtZ
         zd5VZORn1Cc0t41Rlgt8L9BvBELBM+wbGjNBVrdHdzPosJPUN8qENQ+d1GRneUDd7ARD
         QpRIM6HwKbzZJhw03G1wV5DGSnOmcrwcK2SLm1WxryO4xJolizpN1rWAgy44cX6Tq+Xh
         S/xRiWCky8C3odev2DYJwmNUkE7orkd2i8Pn3oFNEtIIpiL5w9g5zKqGyD1C/8wEOTQR
         6fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721992446; x=1722597246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8I/eL+OQatimF7WbyE982ifzPP+Fj9BthTqv3DGy+AM=;
        b=VFNn5v+smlqlIFegx/pfXr+qrELFvsxFblVZWn2PA6V4fQtG7K8TT9/JBrcBjF+mbh
         APo3MS+mTzCOhARZ73H34jxKmNKCH+0dl8c61/yJZpSEX8+N5+D0EF0Mdhd4ItASc5Qa
         m8RiD4bn2fgVaBVT5uuqXui80eFrL7AdK6Qucc6hwHyegDhawaRolnaToNDFb3wxVgPW
         s4tg8BFVRWx3chti7m6ZYJRg9ZVTL5nTD4BzdwpYHuwfXi6Ma3VhaZKMTRsCZ/MM/3I/
         pwEU14zfgEvON261ygrrhlLwoVK2Uwh2kHyIW9Kw+J8ls3VmX9kmNXJJGdN4vKR4uNJK
         aIGw==
X-Gm-Message-State: AOJu0YzBV1NFRCUml7q8NRniSbKz+1NhgAC6av2dK7RsSrGatZWXdMum
	0GxpwHvBmUFAGUxYH7zWvltt/Ecb34cuJEpX51eoba1OfBhv8lvdEOf1mQ==
X-Google-Smtp-Source: AGHT+IFm90GHY8o/PWrxAU0uztdcUETrRyNTgaC+zPE149KgKk7tU7k4nzV5rareIOz58B4+H6r/Vw==
X-Received: by 2002:a05:600c:1c87:b0:426:6f81:d235 with SMTP id 5b1f17b1804b1-42806b8d9c9mr36298515e9.15.1721992445981;
        Fri, 26 Jul 2024 04:14:05 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057a6283sm73359145e9.32.2024.07.26.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:14:05 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-virtualization][PATCH v2] docker-compose: drop SRCREV_FORMAT
Date: Fri, 26 Jul 2024 12:12:47 +0100
Message-ID: <20240726111246.1730125-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Jul 2024 11:14:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8846

We currently only fetch from one SRC_URI so we can drop
the SRCREV_FORMAT and covert from the named SRCREV_compose

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: I have changed the SRCREV by mistake so replace them

 recipes-containers/docker-compose/docker-compose_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 8bab3fb6..4d600300 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -7,11 +7,9 @@ DEPENDS = " \
     rsync-native \
 "
 
-# Specify the first two important SRCREVs as the format
-SRCREV_FORMAT="compose_survey"
-SRCREV_compose = "f79c28168bf6a95ea0cbd1c298f4a0ff4c3ac36b"
+SRCREV = "f79c28168bf6a95ea0cbd1c298f4a0ff4c3ac36b"
 
-SRC_URI = "git://github.com/docker/compose;name=compose;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
+SRC_URI = "git://github.com/docker/compose;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
 include src_uri.inc
 
-- 
2.45.2


