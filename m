Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F360C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.37931.1670831997951200770
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VcH228aN;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id d20so11744787edn.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UQGsr3Noz+VDrZphVV2nowHRKIjHmi3drfgNquyGUU=;
        b=VcH228aNIAdAxUh6/WzewIqB98NWELSWCfEGNkYpDCAh/3tg0ugjx3PGd6LEdyyR30
         GP3uBent0SGTups/eXQ/cd3WtcdFeBNjLepVxE5wtbADKhDK3t4GwtkRTcuuBxtKxWaj
         zOBVd+lga6nHEqLd2cuoI/iDq4buvO8CWFlfsrHxZ1DAeZJ2HA8Sm4M2InWwqCIoyUyh
         89TCqs4ahczgJ/Y1bYXLErZTKO3GEsmyPDWZusX2PD/UNLeM8O2RMYwvg1IyXHKp6Vtm
         Cb2cgS27vmDO4LcgS5nPRXajv5kOpib+kGZPlk5Him1MSZ0L1afl4rHG2dfocaqc8vmQ
         siLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UQGsr3Noz+VDrZphVV2nowHRKIjHmi3drfgNquyGUU=;
        b=VtwFwdfcxKFJDumeDEg94aT5LruIkfR0Ot6cBtz2Zmea2ZuDZX6bBgOMld6l6MTFmo
         Eq19lOz/fMs/1K7uII9zNpSpwcGmNFDDw4vSQ6fWnpjqxKU5RZneZADOxeBlCW8lCNg+
         A2iKOtJXeG6bnb4As624h3fEPJ7sk2/oSFI2h5Z7g+lsfpvL0iLhUuIgf0Zwb2wBp+j+
         S67saTJvUnE+QV9ixG+sbQpT14PzS68nm3oxN2/MiAwRv1f5YMMd3BD8wiVTn4iWGpg4
         1G9j+a0NBKgT9c6QUMQRq3+gDrti5nqPWYJyNcB7ED2fJtjS5y4i8UBzYQOQJHFW1xXG
         ey3A==
X-Gm-Message-State: ANoB5pl6/Ij4wrTbRhaar1JuztYFAwUODhVoK8Js0ip6sCoT4uWzoO2Y
	RK+thVU0nLtPDeVK1/IdGzuRVW1Xvus=
X-Google-Smtp-Source: AA0mqf5cMDFgAbqndOxC4C7cPv/gTXrKJDE8FfioZ+vxMTFQ3L3s4M/V/uVsbHqmeAvoeEGgCbhAJg==
X-Received: by 2002:a05:6402:5511:b0:45c:835c:c6d3 with SMTP id fi17-20020a056402551100b0045c835cc6d3mr11219311edb.4.1670831996310;
        Sun, 11 Dec 2022 23:59:56 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:55 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 16/21] runc-docker: update to 1.1.4-tip
Date: Mon, 12 Dec 2022 08:58:52 +0100
Message-Id: <20221212075857.1065221-17-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7769

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping runc to version v1.1.4-8-g974efd2d, which comprises the following commits:

    3b958289 Fixes inability to use /dev/null when inside a container
    335ec376 cirrus-ci: install EPEL on CentOS 7 conditionally
    fb145a2f cirrus-ci: enable EPEL for CentOS 7
    276297b6 VERSION: back to development
    5fd4c4d1 Release 1.1.4
    204c673c [1.1] fix failed exec after systemctl daemon-reload
    ec2efc2c ci: fix for codespell 2.2
    c778598c [1.1] ci/gha: fix cross-386 job vs go 1.19
    d83a861d Fix error from runc run on noexec fs
    d614445d [1.1] libct/nsenter: switch to sane_kill()
    3ca5673f CI: workaround CentOS Stream 9 criu issue
    c3986e53 tests/int: don't use --criu
    f46c0dad [1.1] ci: fix delete.bats for GHA
    6b94849d tests/int: runc delete: fix flake, enable for rootless
    fa3354dc libct: fix mounting via wrong proc fd
    eb1552a0 VERSION: back to development
    6724737f VERSION: release 1.1.3
    91fa032d ci: add basic checks for CHANGELOG.md

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/runc/runc-docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 8180c3a..97373a7 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "1e7bb5b773162b57333d57f612fd72e3f8612d94"
+SRCREV_runc-docker = "974efd2dfca0abec041a3708a2b66bfac6bd2484"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
-RUNC_VERSION = "1.1.3"
+RUNC_VERSION = "1.1.4"
 
 CVE_PRODUCT = "runc"
-- 
2.38.1


