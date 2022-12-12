Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC098C4708E
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 08:00:08 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.37932.1670831999559874657
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eepf8PCy;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id i15so11681340edf.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWJPhLg1MmmrYkP8S6v6jaotqjvmWNfg5wfiMSPvF7k=;
        b=eepf8PCyV5bDLTsD5SIjvJ6P8NAVT3TzOLB3kjceQPhBak/RyNVVPJslrg/7uq5tEm
         iuG94Y8gvCM9DPBhCbDWfH3XbJfeJqgTekMwTb2bDVeWKVhpo1iWvjrMmdYwsqKY6KhB
         dt6od/qq55XAvFctP88C9bavbSLuZdBt38oZIszkSPTqJaHV55W9GH0tmd+Rsyg/csry
         41oHUsgKQIQgGvXABCAHPtfMQ7RlneYFTM+x6WES8hG7ffBRUPJUyMtpkYOyZx2TEkqp
         WqW/NpxrJpzSRSXwh2yiNyav1EyPocETlD/BjSwicfdPYC7qujgW1oDgGn3MIA1um1ex
         PCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWJPhLg1MmmrYkP8S6v6jaotqjvmWNfg5wfiMSPvF7k=;
        b=2efjE/SJojuWVkExdzTRTDAqf4Z0egqsMx+4vMI9fURl+gNOJLq6pjSHsMJSdnVWJv
         qhKQAJrtRkB3YjSjeOd3SCuNdrWtJgo7AXa7FYQzNx9kn+kcg+NOTtO928ReTEsUnsmq
         hT8COidgdNUJVHbPM/6kjc7E1HJv+BFy5VWSvgdCujSrQdLmbGKUUSCuHp4kCku3qTsX
         teccrm/gq+OdYYJ1pN2b5b2nyJHsEnZfmjPXnYmNEKABvYCXi6ygYlnUc5QTogA76na6
         HMnsYCxqZrHxRPJqTg1Z325c/8dDJGOnPwnqanYPKJHK2gHF41hVtXcpyVfq1evo1PuX
         EiNQ==
X-Gm-Message-State: ANoB5pnza2oirusvonqNLsvd/5ak6w7zc9sEJAPFBbzD9UOfnUObTdvZ
	F3bZjSBph/9abI1Tk6cVHCmGYinDucQ=
X-Google-Smtp-Source: AA0mqf69d/P9eygZc4c+eQNuDWnhFdZxWr0LCYn/vInlVUOtnJPgvOHXuTm5OSZqi2A5VpboEVFCaQ==
X-Received: by 2002:a05:6402:702:b0:46f:68d0:76 with SMTP id w2-20020a056402070200b0046f68d00076mr8555779edx.34.1670831997633;
        Sun, 11 Dec 2022 23:59:57 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:57 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 18/21] docker: add mobyproject:moby to CVE_PRODUCT
Date: Mon, 12 Dec 2022 08:58:54 +0100
Message-Id: <20221212075857.1065221-19-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 08:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7771

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Add mobyproject:moby to CVE_PRODUCT to reflect where the source
is coming from for both docker recipes.

We keep the old 'docker' designation for compatibility.

It is unclear whether or not we should also be adding the cli
and libnetwork to the CVE_PRODUCT. But since they are on
different SRCREVs and not vendored, we keep them out for now.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-ce_git.bb   | 2 +-
 recipes-containers/docker/docker-moby_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index b36ac0d..b86596c 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -54,4 +54,4 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f
 DOCKER_VERSION = "20.10.17-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
-CVE_PRODUCT = "docker"
+CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index dea5a8e..e687cec 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -57,4 +57,4 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f
 DOCKER_VERSION = "20.10.17"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
-CVE_PRODUCT = "docker"
+CVE_PRODUCT = "docker mobyproject:moby"
-- 
2.38.1


