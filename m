Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF68C04FDE
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 08:00:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.37861.1670831998658516936
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 00:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B8gsvchn;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id ud5so25833112ejc.4
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uA3Ac0C+gMGAAB4VU0DT0tLJpyaG5xG9yitWTHJmF4=;
        b=B8gsvchnYQFR/+ZIlUWm7yWuI/dkHoUZ9nSBAuKRYM5H8YgUnNvprDVqVz4bwmfLra
         9n3FAqVTl6gkqomywyN134XV9nMbAhJ4U0zIiA2pjW2hUeVeHnSkexSvw6YtV9DrtMtY
         y3Vy5U9Vho1kFIjfK1zh+ZmH6nBi28qzsDnqDp9UgdICEhzkKaCwSG3MYeDLvCRYGp97
         0tbfWZXdLCi7KjuurG/UIu9+UWsWrmVbV6wcq5AWm4LhstPwIGchXmTAp+q6IWamz21j
         qiYhZAfUUWGwJD6Zux3aZVwsvFRpz6S1xhr5G58pvhlguSMg6MqhIjjp1q1lNX5fNO6s
         TPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uA3Ac0C+gMGAAB4VU0DT0tLJpyaG5xG9yitWTHJmF4=;
        b=EUCgxzw8CEWqPwqHcSjAXAA5Vc6Ed4Jttciqc4/c8/U1FC45gRvrmcBdXmEj0BHjNn
         FnxMVnIxtqsugg232lPUbusplDidhjyFHlgT4W1qOMiDXWINQdrowuhi+BttX4fzGKLJ
         GvEe7SrClAsYN8YB/0doaiQS/XrVoVCGlRc9XxyCidmQT53av5JMm3mEaKvGx9rTV76R
         cNbl+jMbkE18R/Cs1e4mbPKHkNFyUh6pPn3G0JrKWpD/bWlXFerP4cTms5Z6oHvP/qZP
         hb+yPDe2XKa85Fv/0/a6HktTV7Lj7B8iXfiHcteEglFDamvC2Z0C+o+Fzw2OqhHtV2JU
         vdAQ==
X-Gm-Message-State: ANoB5plfgLTNFvPuxP2tgioGrFXwJPaBTzRVTqMU+ktY1RyP1sABu6Dc
	x8kjfC4UXcLcPO9wGGu+Hf4Clc8E9GI=
X-Google-Smtp-Source: AA0mqf71ND5aKy3wHoQ3hGldFuCvBR6+oTzqqi2FEUyD7nkVF0mnpUuwsMLwzGhoywfbFx/zLiDy+Q==
X-Received: by 2002:a17:906:7185:b0:7c1:4bb:b157 with SMTP id h5-20020a170906718500b007c104bbb157mr13311891ejk.4.1670831999198;
        Sun, 11 Dec 2022 23:59:59 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:58 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 20/21] docker/moby: use generic DOCKER_COMMIT in do_compile
Date: Mon, 12 Dec 2022 08:58:56 +0100
Message-Id: <20221212075857.1065221-21-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 08:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7772

From: Bruce Ashfield <bruce.ashfield@gmail.com>

do_compile() is shared and shouldn't have been using SRCREV_moby
as that is obviously only set in the moby recipe.

Switch to using a generic DOCKER_COMMIT variable and set it in
both docker_moby and docker-ce.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-ce_git.bb   | 2 ++
 recipes-containers/docker/docker-moby_git.bb | 2 ++
 recipes-containers/docker/docker.inc         | 4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index b86596c..4561687 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -45,6 +45,8 @@ SRC_URI = "\
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
 	"
 
+DOCKER_COMMIT = "${SRCREV_docker}"
+
 require docker.inc
 
 # Apache-2.0 for docker
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index e687cec..8a35290 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -48,6 +48,8 @@ SRC_URI = "\
         file://0001-dynbinary-use-go-cross-compiler.patch \
 	"
 
+DOCKER_COMMIT = "${SRCREV_moby}"
+
 require docker.inc
 
 # Apache-2.0 for docker
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index b74b412..2487456 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -97,14 +97,14 @@ do_compile() {
 	# this is the unsupported built structure
 	# that doesn't rely on an existing docker
 	# to build this:
-	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_moby}" ./hack/make.sh dynbinary
+	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${DOCKER_COMMIT}" ./hack/make.sh dynbinary
 
         # build the cli
 	cd ${S}/src/import/.gopath/src/github.com/docker/cli
 	export CFLAGS=""
 	export LDFLAGS=""
 	export DOCKER_VERSION=${DOCKER_VERSION}
-	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${SRCREV_moby}" make dynbinary
+	VERSION="${DOCKER_VERSION}" DOCKER_GITCOMMIT="${DOCKER_COMMIT}" make dynbinary
 
 	# build the proxy
 	cd ${S}/src/import/.gopath/src/github.com/docker/libnetwork
-- 
2.38.1


