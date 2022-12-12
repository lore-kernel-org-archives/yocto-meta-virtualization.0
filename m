Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8C5C3DA6D
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.37929.1670831991214555364
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jg72N8Lj;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id kw15so25789640ejc.10
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM83TG9+XnUfEnbUfCIexy/4N3MXE7s2xp2fhVPB9rY=;
        b=jg72N8Ljce53V6namdWbCVm/yylR3jeA103fADgxjYtagVQfEgsDXq3vfB00bsUL1j
         /5dpscgDp0fb69wge0TNTFODNFSgkNn88nyuOj2vURM0s46oot7T5muKB+fpE3rp/tyb
         SICHBg2GHNpSV5MIIn+P4zxJLPq4S3R964ccf8JR369g0HeuAjZJal2z6FzheHoKcOzL
         Wd4yRfWYHlLIJyKWXY0co4dFUSKgvUozxHzrTn8dGGlScUvGo0pA8UUtwdgZ74QUp/p1
         42VTh7BruZ3b2g0FbE765PjbS4FW+An6d9hqDZIRRwbTC4q9uOfdmNJkvyTniZmsqmbV
         uGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM83TG9+XnUfEnbUfCIexy/4N3MXE7s2xp2fhVPB9rY=;
        b=fI0dItze/ypSbFYQ/ikHfn/N3TlJX4HyiSOTOUHEBk7uszRXe6q48XTBZvwp2kgaaZ
         OYSjCaH1hubyqmuEYU2JwdsAdXTRHMmEB9lChtNF0iheZBdt7IKZ8pVWvB3FA26TRPPW
         HNDJptd1IlJfhrB+JkJ+8wv/Wi5VvbjALnZwgTiE/5OS+GCAr1lgOK9g6pleCcLzXHwj
         32UC3azHPXpPgBtHc8QVdj3LbMHoqfNhCxHvgQKDWWNU6gxDgOfO2JHjVpusDXFFYxY4
         m+DNLVUgS7LpG11eOPN8/YGH7L0CSn/QIcRKOt/c/IrSU8Rdbxi+zoQkns1yUw2Vw6/3
         FnxA==
X-Gm-Message-State: ANoB5pnXw86vBMwJ4vKPJ9HMgAJE1xJxhrgMBr3jqwMdLW7fZzcOWb2I
	DjD0GQHVBcPnYvOX+/HIihH3JUeXm3M=
X-Google-Smtp-Source: AA0mqf7tuTcKsxhsctUNHyesx6W9Aihemc3ROTTaaQ/r1kbIGyN1ThH6MRwA+OL3TIgXw/sjH/Bi6w==
X-Received: by 2002:a17:906:4ccc:b0:78d:f454:ba3d with SMTP id q12-20020a1709064ccc00b0078df454ba3dmr11768100ejt.60.1670831989502;
        Sun, 11 Dec 2022 23:59:49 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:49 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 07/21] docker-moby: update to 20.10.17
Date: Mon, 12 Dec 2022 08:58:43 +0100
Message-Id: <20221212075857.1065221-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7760

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

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-moby_git.bb      |  8 ++++----
 ...-external-GO111MODULE-and-cross-compiler.patch | 15 ++++++---------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index f7f0f6f..dea5a8e 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -34,9 +34,9 @@ DESCRIPTION = "Linux container runtime \
 #   - The common components of this recipe and docker-ce do need to be moved
 #     to a docker.inc recipe
 
-SRCREV_moby = "f756502055d2e36a84f2068e6620bea5ecf09058"
-SRCREV_libnetwork = "339b972b464ee3d401b5788b2af9e31d09d6b7da"
-SRCREV_cli = "a224086349269551becacce16e5842ceeb2a98d6"
+SRCREV_moby = "3949ff121ee486eb73484f6c4708d199f68c930e"
+SRCREV_libnetwork = "f6ccccb1c082a432c2a5814aaedaca56af33d9ea"
+SRCREV_cli = "100c70180fde3601def79a59cc3e996aa553c9b9"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
 	git://github.com/moby/moby.git;branch=20.10;name=moby;protocol=https \
@@ -54,7 +54,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.16"
+DOCKER_VERSION = "20.10.17"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker"
diff --git a/recipes-containers/docker/files/0001-cli-use-external-GO111MODULE-and-cross-compiler.patch b/recipes-containers/docker/files/0001-cli-use-external-GO111MODULE-and-cross-compiler.patch
index dc32261..16b5f9e 100644
--- a/recipes-containers/docker/files/0001-cli-use-external-GO111MODULE-and-cross-compiler.patch
+++ b/recipes-containers/docker/files/0001-cli-use-external-GO111MODULE-and-cross-compiler.patch
@@ -8,20 +8,17 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  git/cli/scripts/build/binary | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
-diff --git git/cli/scripts/build/binary git/cli/scripts/build/binary
-index e4c5e12a6b..7c47b75c2f 100755
---- git/cli/scripts/build/binary
+Index: git/cli/scripts/build/binary
+===================================================================
+--- git.orig/cli/scripts/build/binary
 +++ git/cli/scripts/build/binary
-@@ -73,8 +73,7 @@ fi
+@@ -73,8 +73,7 @@
  
  echo "Building $GO_LINKMODE $(basename "${TARGET}")"
  
 -export GO111MODULE=auto
  
--go build -o "${TARGET}" -tags "${GO_BUILDTAGS}" --ldflags "${LDFLAGS}" ${GO_BUILDMODE} "${SOURCE}"
-+${GO} build -o "${TARGET}" -tags "${GO_BUILDTAGS}" --ldflags "${LDFLAGS}" ${GO_BUILDMODE} "${SOURCE}"
+-go build -o "${TARGET}" -tags "${GO_BUILDTAGS}" --ldflags "${GO_LDFLAGS}" ${GO_BUILDMODE} "${SOURCE}"
++${GO} build -o "${TARGET}" -tags "${GO_BUILDTAGS}" --ldflags "${GO_LDFLAGS}" ${GO_BUILDMODE} "${SOURCE}"
  
  ln -sf "$(basename "${TARGET}")" "$(dirname "${TARGET}")/docker"
--- 
-2.19.1
-
-- 
2.38.1


