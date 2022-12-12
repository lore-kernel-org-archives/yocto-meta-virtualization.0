Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28E3C3DA6E
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.37857.1670831992294032945
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HHxf0Xf1;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id a16so11665356edb.9
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xGwKh1JThmWTLMtP8y3tqNYDT5Exe5UzVafr05QjXo=;
        b=HHxf0Xf1aSc/XvGeIWs4KKtFCQXtK2q8WiOz849qMjvoMq84KY1Vs3jpm6nOKuQC13
         c+cTMSElCSgw1qJoDszIHrANXDMYaRHp5rvVMd+ZCQFsZn+ewNOxx3R0z+m/QKTCeAxC
         UO3OUE451wyEuTFZpcIq4kZ/SAPC84mO+9+m0hBncX72fjIEMMKtPx+DEpikVGIOmnwg
         YfdaLOsrDTfiGICzqb7AbzUPbUPQzzw60ohtScL7sE/Pp1N1HTKFTmJrH2whlpL5hEAT
         eg7dL/15f1OPixw8O60R3Uzp2t9gtEbnHzmUNrMCrbFwGqtvULgWQ2OPxYsozfD5uuO8
         qVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xGwKh1JThmWTLMtP8y3tqNYDT5Exe5UzVafr05QjXo=;
        b=s0SDI0B+bE/WRkd/m8leD026khPuT04lYM2S3PuekiEXt/tIVhN+xSclkiQEshoshN
         76BeuYwbL0NGrf9Kp9aeww3MerxXztHLCEiMtXXWVnG8W1uR8OFB42ZCFJO9zqgBEUZo
         YjFNMA4NFY1dytfeH9HkzgQGaqam/YFCohM4cFRFiZ0jGDd+xHgIYXkbZ+rrqiuK4BMT
         7Z1+IP4x30YE/b4Ff1l3cn4LfGm9EU7KAC5w0ei42sqKfkJYErY0NLUauo57pjUvq5YI
         JojEu4aeeJ+zKQz8uoQ2DSGecvD2hIvYkQiErS1INQNtAAisHFV5kb+dNcwQCNyxQn2w
         XJMw==
X-Gm-Message-State: ANoB5pnCFej0yZgxDlA2H5jdZyEV4Rv0mr/RlnZ+600NiIP6vWFQFkCk
	4C71JP5K4NsyNsxzpCDjMvj9xRsv72E=
X-Google-Smtp-Source: AA0mqf4aaG2hCV6gbSEOFeaxxw9Zyz8h8t+xWQa/VAWuJ39xwj/Nygx9bbhGWrNqveIAk2HlDvqCZg==
X-Received: by 2002:a05:6402:3899:b0:468:260e:ad53 with SMTP id fd25-20020a056402389900b00468260ead53mr12599062edb.10.1670831990399;
        Sun, 11 Dec 2022 23:59:50 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:49 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 08/21] docker-ce: update to 20.10.17
Date: Mon, 12 Dec 2022 08:58:44 +0100
Message-Id: <20221212075857.1065221-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7762

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping moby to version v20.10.17-2-g3949ff121e, which comprises the following commits:

    ff7feeac37 vendor: github.com/containerd/continuity v0.3.0
    6f3f2b6d08 update containerd binary to v1.6.6
    b3bcb15da8 update containerd binary to v1.6.5
    f55b030fa0 system: unbreak build for darwin
    63ab12cd3a Port pkg/system/mknod.go to FreeBSD
    081e538fbd vendor: libnetwork f6ccccb1c082a432c2a5814aaedaca56af33d9ea
    8e9d647c01 [20.10] update golang to 1.17.11
    87ead7fd2a vendor: hcsshim a11a2c44e8a4aa9d66314b1d759ef582df5ab5e8
    27f8322324 vendor: libnetwork 2dab5620d4462865c6151e573b3e7fa5d3b8458b
    829951ec19 docs: api: /containers/{id}/attach/ws: remove unsupported query-args < v1.42
    6cbe73bfc0 Rename Reservation to Reservations in the open API
    d9ed3d7e28 update runc binary to v1.1.2
    a15acb4bd6 [20.10] vendor: golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
    5f2e0b79ad [20.10] update golang to 1.17.10

Bumping libnetwork to version v0.7.0-dev.3-1835-gf6ccccb1, which comprises the following commits:

    af0c46d8 Apply peformance tuning to new sandboxes also
    23ffb31f Set ExternalPortReserved for dummy proxy
    9b82e422 Bump hcsshim
    9db86fb7 Only check if route overlaps routes with scope: LINK

Bumping docker-cli to version v20.10.17, which comprises the following commits:

    7502d7e56 Fix dead external link
    308624c3b fix: remove asterisk from docker command suggestions
    de7d866b6 [20.10] update golang to 1.17.11
    240e4b550 [20.10] vendor: golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
    5d4776bd9 [20.10] update golang to 1.17.10
    49e9c2ae3 vendor: golang.org/x/sys  63515b42dcdf9544f4e6a02fd7632793fde2f72d (for Go 1.17)
    87a3ce269 vendor: golang.org/x/sys d19ff857e887eacb631721f188c7d365c2331456
    1d8abed17 vendor: update x/sys to 134d130e
    31dad66f9 [20.10] update golang to 1.17.9
    80f673bf9 gofmt with go1.17
    3d4cc8e69 [20.10] update remaining files to go1.17.8
    30277a8f8 update go to 1.17.8
    cfef3a7dc docs: deprecated: add entry for "fluent-async-connect" log-opt
    53426025c [20.10] docs: reformat table for compatibility
    573a66463 Describe privileged mode in terms of capabilities
    cf0ab7ac4 [20.10] vendor: github.com/docker/distribution v2.8.1
    d05fd4ffc [20.10] vendor: github.com/opencontainers/image-spec v1.0.2
    870f13825 [20.10] vendor: github.com/docker/docker v20.10.14
    198d6b872 [20.10] circleci: update buildx to v0.8.2
    55a14ec85 [20.10] update remaining Dockerfiles to go 1.16.15
    1f9a0df05 e2e: update docker-compose to 1.29.2
    4ae338b33 docs: reference: remove trailing space to fix yaml formatting
    6380142dd docs: fix (table) formatting, fix some broken links
    82f422fcf docs: build: fix minor markdown and syntax issues
    80fd77903 Update the list of log drivers
    c3d4d623c Fix CMD --ignored-param1 example
    2e82d11de docs: dockerd: fix broken link in blockquote area
    738a6ee1c improve cp documentation with some illustration examples
    246d96bb6 docs: unify "docker create" and "docker run" reference
    2fd0f1705 docs: add missing documentation for --pull flag
    5fa500000 Fix incorrect pointer inputs to `json.Unmarshal`
    1e6a8ce2b Dockerfile: update xx to 1.1
    6f7a931a2 [20.10] use GO_LDFLAGS instead of LDFLAGS to prevent inheriting unrelated options
    91bab605f [20.10] vendor.conf: don't use git:// protocol
    a282e0c5d [20.10] update to go 1.16.15 to address CVE-2022-24921
    700364e30 Fix mistake with env var example in docker run docs
    62d27c32f Update WORKDIR command information
    c0e952cf0 Fix the (dead) link for docs for Dockerfile syntax reference
    04104a04d Update dockerd.md
    b721998b7 Fixing typo (his --> its)
    4065e1246 format create.md table
    f1002eb9f Fix typo
    e97c7b240 added missing closing parenthese
    aa7893763 Update stats.md add example json output
    40fe0573a Update Ubuntu version number references in push.md
    c9737e1c3 docs/daemon: replace deprecated '-g' option for '--data-root'
    5c6723d08 Correct device syntax to --gpus
    fd5fc61ec [20.10] Update Go to 1.16.14
    3624019d8 [20.10] update Go to 1.16.13
    f3ff8e6ad [20.10] vendor: compose-on-kubernetes v0.5.0 to remove github.com/golang/glog
    ee1ac1b31 fix innocuous data-race when config.Load called in parallel
    38dd744a1 [20.10] Update Go to 1.16.12
    4de40a825 Update Go to 1.16.11
    03fa8f92c Update Go to 1.16.10
    9989fdbc4 Update most links in docs to use https by default
    0e20c1fd2 Update Go to 1.16.9
    1c0927a04 Dockerfile: update tonistiigi/xx to 1.0.0-rc.2, add XX_VERSION arg
    82f9d5921 info: skip client-side warning about seccomp profile on API >= 1.42
    adb01ca79 docs: some minor touch-ups in checkpoint reference
    8260476a0 docs: remove trailing space to fix generated YAML format
    bce2e1f95 docs: create.md: typo fix
    44064f51c Fix typo in documentation - build.md
    292779add Add doc for BUILDKIT_PROGRESS env var
    f2e79b826 docs: use "console" code-hint for shell examples
    fa46b9236 docs: rewrite reference docs for --stop-signal and --stop-timeout
    400f81089 experimental: fix broken link to "checkpoint and restore" page
    c72057c8d docs: move checkpoint/restore doc from experimental into reference
    77db97d59 Use private network address for default-address-pools setting in daemon.json example
    cbf0d2b7b docs: fix some broken anchors
    d0014a86b docs: fix description of restart-delay to mention max (1 minute)
    6c1c8b55a docs: fix search results by filterd is-official
    44fdac11f Update Go to 1.16.8
    061051c24 docs: add missing redirect, and remove /go/experimental redirect
    2012fbf11 Update Go to 1.16.7
    42d1c0275 registry: ensure default auth config has address

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-ce_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 27cb962..b36ac0d 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -31,9 +31,9 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_docker = "f756502055d2e36a84f2068e6620bea5ecf09058"
-SRCREV_libnetwork = "339b972b464ee3d401b5788b2af9e31d09d6b7da"
-SRCREV_cli = "62eae52c2a76f4c1dcf79dfc7b5ea3bf5eebab8b"
+SRCREV_docker = "3949ff121ee486eb73484f6c4708d199f68c930e"
+SRCREV_libnetwork = "f6ccccb1c082a432c2a5814aaedaca56af33d9ea"
+SRCREV_cli = "100c70180fde3601def79a59cc3e996aa553c9b9"
 SRCREV_FORMAT = "docker_libnetwork"
 SRC_URI = "\
 	git://github.com/docker/docker.git;branch=20.10;name=docker;protocol=https \
@@ -51,7 +51,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.16-ce"
+DOCKER_VERSION = "20.10.17-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 CVE_PRODUCT = "docker"
-- 
2.38.1


