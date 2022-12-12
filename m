Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD843C3DA7A
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.37855.1670831987304699300
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WFBR3/zb;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id vv4so25831032ejc.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUYl3hc9OUFaaDMMfQy1WW7hROLfa3tQ0LhdV/TbWf0=;
        b=WFBR3/zbvMwNBKtDY88B9WRoIJGosSGOmndDTp/4CPgCOe0AAOvMjvt9oOVjnf7ZAi
         kjwrtjD2wDrOaniXTmatlHC6autrDOZS3PQTUVjNKNqfo85IAekKaVmr9rI0RRBgt1zF
         Ta2CGlwXhOl4XKJVk43jumpxGHNbxLYOUXAldqc9j54ZeZu0+E8CDUK/9pZSFJJ6nNNT
         oXWE0s4XkHV/cR17jEN3X/SdS+orQTNs9k1oAtSaSeBPvuDNKHdQgxtcQJzpMh6vvk46
         h7/pBgMLU74UuFU3ee3JP7MYdbtmuGbDEIDPhfZSPR3VldimjZ54Hfxu/LrJSarjCNtK
         kD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUYl3hc9OUFaaDMMfQy1WW7hROLfa3tQ0LhdV/TbWf0=;
        b=Ybk1qsRImnw3uVTUL1Rz+C4v3BTEvLTXAZUorZ41MnSj33Td/FHYGLeydHTOncvLpW
         3VSfYWV9Su/d894x4zD4xoxi3hyydHT1tjQ8Z3DYr1gwi3O+iafkV0vhYgM3MySQFhSD
         Hc+Yuagz3E43e6nOsy9u3MERpYCa1a7deiLzOXBZhq7/aiaxyFQsD0qGP5VPPrjZhUrq
         ZBcCxfIjk4ZzK3IP02gucGdmACEWl/dnd/BgT2d5nJN8Xd5IzjJXGslqA6hzhlAJObBI
         OdzTl6kbvfoZZN8/GU8BhUK95bugs9OorgwSgbXQz6xHFkTRkBuxChZWt8X/D49gX/7l
         iVlA==
X-Gm-Message-State: ANoB5pkvnjgNl+rFoGpxi80+IdxhXcYrPf9gZqOAkiWgGrQ0+27qlMzL
	qZ6m7n53fdhwGFQjiqYGrIl4IN6S4lU=
X-Google-Smtp-Source: AA0mqf6T59AuTH5PlKxqZ/YU1TqRNRYPAnG4uJdh8y1oVO1few/0xgBVD885T67Ju+o0xrvb8OPboA==
X-Received: by 2002:a17:906:4687:b0:7c0:deb1:bb8a with SMTP id a7-20020a170906468700b007c0deb1bb8amr12044302ejr.28.1670831988255;
        Sun, 11 Dec 2022 23:59:48 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:47 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 05/21] runc: update to 1.1.3
Date: Mon, 12 Dec 2022 08:58:41 +0100
Message-Id: <20221212075857.1065221-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7757

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
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index 14570b9..997fb1e 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,10 +1,10 @@
 include runc.inc
 
-SRCREV = "b507e2da6c6a3a328f208fa415a56ad7cd58761b"
+SRCREV = "1e7bb5b773162b57333d57f612fd72e3f8612d94"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.1.2"
+RUNC_VERSION = "1.1.3"
 
 CVE_PRODUCT = "runc"
-- 
2.38.1


