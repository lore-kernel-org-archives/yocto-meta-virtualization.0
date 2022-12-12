Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0913C3DA79
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.37856.1670831988598671637
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q9YoXYVb;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bj12so25753681ejb.13
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AymoWxBpMeTFQeweaj0WNmYSnnKGvpuxgvUaJXmw5Ig=;
        b=Q9YoXYVbR+4Y5FvhbiDhqpmStritZZrEDtllPAa60aw1fnZItywsxD2aWQKcKsLnT7
         C2cprB/oZ2QQXUz8o21UXJPKNbG0XJcFMT3x766OXg6fgHHSFYRhyDHqZStlpIPOouqR
         oGS+GiUAhHd+oVN/lQ6yGf/ZAefBojh9/gBffzqUXBIhtN/fVOlV9Io9ENGMTRouBeCC
         vZmK8vrZNdelLhwZphPAnMRSWIxfs5lefsyTqA6KUTbdp/xsDJhDni+5LcT//rtfLOSx
         21vQT98UHUoNV8uUqFr/RiEdYjBWJhNF1edXsef/+P0V+9LrnBHLTG6C44Sae1kiSDA4
         A8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AymoWxBpMeTFQeweaj0WNmYSnnKGvpuxgvUaJXmw5Ig=;
        b=CRyO6TRC+iJVNy00+1HWwX+dwal4MACx7ucwVvbONJwNePBroOzq8k60F/80976+F6
         nJna7e2IcDJ/n8htDxVExXXzluYlv4upkJNjaa4Rglr6Q8Wo2bqk1vrbWX/90fC1ynrD
         Dyo56jUuOQpY5wlOS9OIYC4Me/stYnjspw6qvNwMlq9HuOHJkuFXjVYXiqbI3ZADfb19
         M8qW/F0d3lPJm0xyZP+WOO/RcM5msCK+52FrEulyklzkgJQW8RZK3Cy4XMqht/op1Scg
         4vLvSOdFu1y4dBEgC+31v4LYw1cS2ZMIiybhcTP7dqPYOyCUt5kCXzp7f3knodFIhWIf
         bU/g==
X-Gm-Message-State: ANoB5plJxeBdNjHAlyDeBBdvfjaV0ViS8xrNxUWQie56beIyZrcE2kB2
	8TlNyQ8q5+hjQK6rb0X6TFQdp0G2hUs=
X-Google-Smtp-Source: AA0mqf7oWXXnX4XigDgF+CGCG3lGf7YwTWcZNY8wV1ZE+yZL7WkyXhARSm7/nHxfYWuhhTzzuEEYnQ==
X-Received: by 2002:a17:906:d10d:b0:7c1:4623:400e with SMTP id b13-20020a170906d10d00b007c14623400emr2500216ejz.16.1670831988890;
        Sun, 11 Dec 2022 23:59:48 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:48 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 06/21] runc-docker: update to 1.1.3
Date: Mon, 12 Dec 2022 08:58:42 +0100
Message-Id: <20221212075857.1065221-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7759

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping runc to version v1.1.3-2-g1e7bb5b7, which comprises the following commits:

    eb1552a0 VERSION: back to development
    6724737f VERSION: release 1.1.3
    91fa032d ci: add basic checks for CHANGELOG.md
    7219387e cgroups: systemd: skip adding device paths that don't exist
    93d1807b libcontainer: relax getenv_int sanity check
    8242c05d script/seccomp.sh: check tarball sha256
    017cb29b Dockerfile,scripts/release: bump libseccomp to v2.5.4
    51649a7d Allow mounting of /proc/sys/kernel/ns_last_pid
    3a09da6b ci: drop docker layer caching from release job
    8b93f9fb seccomp: enosys: always return -ENOSYS for setup(2) on s390(x)
    fc2a8fe1 libct/cg/sd: check dbus.ErrClosed instead of isDbusError
    d105e052 libct/seccomp/config: add missing KillThread, KillProcess
    e4474ef8 [1.1] vendor: bump seccomp/libseccomp-golang to f33da4d
    dc083b2b fix deprecated ActKill
    bf1cd884 ci: use golangci-lint-action v3, GO_VERSION
    1feafc31 ci: bump golangci-lint to v1.44
    89f79ff0 libct: StartInitialization: fix %w related warning
    3b7f2605 Format sources using gofumpt 0.2.1
    eeac4e77 build(deps): bump actions/checkout from 2 to 3
    cd7fa00d Vagrantfile.fedora: fix build wrt new git

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/runc/runc-docker_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index f2c0613..8180c3a 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -2,13 +2,13 @@ include runc.inc
 
 # Note: this rev is before the required protocol field, update when all components
 #       have been updated to match.
-SRCREV_runc-docker = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
+SRCREV_runc-docker = "1e7bb5b773162b57333d57f612fd72e3f8612d94"
 SRC_URI = "git://github.com/opencontainers/runc;branch=release-1.1;name=runc-docker;protocol=https \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
-RUNC_VERSION = "1.1.2"
+RUNC_VERSION = "1.1.3"
 
 CVE_PRODUCT = "runc"
-- 
2.38.1


