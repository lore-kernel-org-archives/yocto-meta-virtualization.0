Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4B7C10F31
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 08:00:08 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.37865.1670832003169752794
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 00:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jxg+W0UW;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id gh17so25824277ejb.6
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 00:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmwlOCoda18JtJYbcNYcJb8eFWFoxFEzKcW6/qgSy+w=;
        b=Jxg+W0UWMH2eBm7AHEBUTGKRxJ595qijxGXcKuiQs8s1bWykS0NdE5eTrfxiGWF/XA
         PXVKX0VA+MHcNxqXftYK/CW7whZsUleoRQmmLMVr03d/hRLRNzr29xXyVhQUrN9b7Jg4
         390D5/nXOxgxwEicT3CWqbW4ND1jXtTwGMzbeojLOvIgZZ08ApGnAv7pFF5wlFWx4ejf
         Ze9rB+QxKl9p6fjTzjfBwxwZM5GuO79EWilVAbu4WWfQVf3TR2uSgyBLs1LLfbRrKZH4
         1IYqRUAK+QL+mX+V6htwGp27/Gw0ZyDX0vanny/OGZEvfJXl/SRJfJomz3RZhwG+5wkw
         WrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmwlOCoda18JtJYbcNYcJb8eFWFoxFEzKcW6/qgSy+w=;
        b=TLYvuqiro9dEGQNeK2RWR53OReW5lcTmmWbC/8F5FBB8Sn6NeCBKCZ2HTwJKJDOENe
         jQZvphxKKszAivuvMamZyddoH46NmylC9aEnMbuftdEHGk6QX3FdVAiG21FMmpPQaobl
         iMhIC72T0xmFKx6f2xUWh0uzPXWO5+/Lv6Xu2uuPevzzlmOcWBsygVoD7xV818MUkQhk
         zRjdZhuoZo8TNM6zeXp01Zgi9Sq/BZUnFyH9g1+7DVc3nFWhqSqeVFpJJxwV23ACzXPA
         +7bc5sD1+TT2OKaKhW5Oa0x3PN+UOoV8hBryMFLanFVQdrI3EQGfeEttx/LI454JqblD
         EiMw==
X-Gm-Message-State: ANoB5pkrD6rMzaiIleVqW2cg2bOayxkS/HVtRBuo1sf5ZvqJiZLe2ukQ
	tI3Pb1mekeIKfdgxxhExGarBX9ZGQf0=
X-Google-Smtp-Source: AA0mqf4qN5fJhYBGFlp5mc6NkSYdESXIxe5l1bi73K5qkns+1G2JgmVf27z69wckD5V1zBBCdVEydQ==
X-Received: by 2002:a17:906:f50:b0:7b2:c227:126d with SMTP id h16-20020a1709060f5000b007b2c227126dmr11580548ejj.20.1670831999839;
        Sun, 11 Dec 2022 23:59:59 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:59 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 21/21] moby: update to v20.10.21
Date: Mon, 12 Dec 2022 08:58:57 +0100
Message-Id: <20221212075857.1065221-22-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 08:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7774

Bumping moby to version v20.10.21, which comprises the following commits:

        f99cb8297b integration: download busybox-w32 from GitHub Release
        3f9dc25f5c update containerd binary to v1.6.9
        87ccd38cea vendor: moby/term, Azure/go-ansiterm for golang.org/x/sys/windows compatibility
        e83e465ae2 [20.10] vendor: github.com/moby/buildkit eeb7b65ab7d651770a5ec52a06ea7c96eb97a249 (v0.8 branch)
        9c84417c1b skip TestImagePullStoredfDigestForOtherRepo() on Windows and rootless
        5b5b5c6f13 builder: add missing doc comment
        05e25f7892 builder: fix running git commands on Windows
        2f3bf18014 [20.10] vendor moby/buildkit v0.8.3-31-gc0149372
        6699afa549 registry: allow "allow-nondistributable-artifacts" for Docker Hub
        4b9902bad4 Validate digest in repo for pull by digest
        c0d1188c14 builder: make git config isolation opt-in
        9f5f3abcee builder: isolate git from local system
        10db4c2db7 builder: explicitly set CWD for all git commands
        8816c3c2aa builder: modernize TestCheckoutGit
        11bdbf40b9 [20.10] Update to go 1.18.7 to address CVE-2022-2879, CVE-2022-2880, CVE-2022-41715
        66ddb7f91c Fix live-restore w/ restart policies + volume refs
        c003392582 contrib: make dockerd-rootless-setuptool.sh more robust
        53313be0f3 docker-rootless-setuptools.sh: use context after install
        9c486bd267 swagger: update links to logo
        fa17fab895 vendor: github.com/containerd/console v1.0.2
        481bee51b5 vendor: github.com/armon/go-metrics v0.4.1
        39ba2873e8 vendor: github.com/google/btree v1.1.2
        c2755f40cd vendor: github.com/hasicorp/memberlist v0.4.0
        5ba3208ec7 Dockerfile: Update Dockerfile syntax, switch to bullseye, add missing libseccomp-dev, remove build pack
        6d6a236286 [20.10] Update uses of Image platform fields in OCI image-spec
        2570784169 [20.10] vendor: github.com/moby/buildkit 3a1eeca59a9263613d996ead67d53a4b7d45723d (v0.8 branch)
        fcd4df906b Update some tests for supplementary group permissions
        6a0186b357 Wrap local calls to the content and lease service
        3d4616f943 Update to go 1.18.6 to address CVE-2022-27664, CVE-2022-32190
        23c7d84b84 docs: api: adjust ContainerWaitResponse error as optional
        3e9e79d134 docs: api: document ImageSummary fields (api v1.39-v1.41)
        fdd438ae03 api: docs: improve documentation of ContainerConfig type (API v1.30-v1.41)
        97014a8db5 namesgenerator: remove Valentina Tereshkova
        e44d7f735e AdditionalGids must include effective group ID
        9e7662e4a7 [20.10] vendor: update containerd to latest of docker-20.10 branch
        7dac25a3a9 vendor: update tar-split to v0.11.2
        8bd86a0699 update containerd binary to v1.6.8
        6c8dd6a6f2 update runc to v1.1.4
        418c141e64 [20.10 backport] daemon: kill exec process on ctx cancel
        d127287d92 Allow different syscalls from kernels 5.12 -> 5.16
        57db169641 seccomp: add support for Landlock syscalls in default policy
reverted by patch: 7ba8ca042c Update golang to 1.18.5
reverted by patch: f2a3c3bcef update golang to 1.18.4
reverted by patch: a99c9cd852 update golang to 1.18.3
reverted by patch: 82939f536b update golang to 1.18.2
reverted by patch: ecd1aa081f update golang to 1.18.1
reverted by patch: 7ba67d05a8 [20.10] vendor: update archive/tar for go 1.18
reverted by patch: 0bc432241e update golang to 1.18.0
        bb95d09f9a staticcheck: ignore "SA1019: strings.Title is deprecated"
        a7299ae72c Dockerfile: update golangci-lint v1.44.0
        d97fd533cf integration-cli: SA5011: possible nil pointer dereference (staticcheck)
        e6aee04a88 client.NewClientWithOpts(): remove redundant type assertion (gosimple)
        0523323c28 daemon/logger/awslogs: suppress false positive on hardcoded creds (gosec)
        adeb29c64c client/request.go:157:8: SA1019: err.Temporary is deprecated (staticcheck)
        50361d91a6 registry: trimV1Address(): simplify trimming trailing slash
        ae3a9337dd golangci.yml: do not limit max reported issues
        9820255a1c golangci.yml: skip some tests
        d223f37300 golangci.yml: update regex for ignoring SA1019
        ec3bfba89d graphdriver: temporarily ignore unsafeptr: possible misuse of reflect.SliceHeader
        f2f387b131 daemon: var-declaration: should omit type bool (revive)
        2fb7c9fea7 daemon/config: error strings should not be capitalized
        fa6954cb98 reformat "nolint" comments
        45fa675a35 if-return: redundant if ...; err != nil check (revive)
        9e88f8435a daemon/splunk: ignore G402: TLS MinVersion too low for now
        2de90ebbe4 pkg/archive: RebaseArchiveEntries(): ignore G110
        14b475d091 daemon/stats: fix notRunningErr / notFoundErr detected as unused (false positive)
        db7b3f4737 unused: ignore false positives
        b6de0ca7c5 G601: Implicit memory aliasing in for loop
        e8b838e99f gosec: G601: Implicit memory aliasing in for loop
        2ddf6e598a gosimple: S1039: unnecessary use of fmt.Sprintf
        fadf8bbdff staticcheck: SA4001: &*x will be simplified to x. It will not copy x
        7573e32577 client: S1031: unnecessary nil check around range (gosimple)
        e738a57a6d daemon/logger/journald: fix linting errors
        34f6b94255 gosec: G404: Use of weak random number generator
        a6d7b61c8b update containerd binary to v1.6.7
        b4ba1ee22f update runc binary to v1.1.3
        da8828c4b3 api: swagger: fix invalid example value (API v1.39-v1.41)
        9501d91e19 api: swagger: document BuildCache fields (API v1.39-v1.41)
        61fdea902b api: swagger: document BuildCache fields.
        c77432c889 [20.10] Update golang to 1.17.13
        2833aa1e4b docs: api: add missing "platform" query-arg on create (v1.41)
        a8c28260ad api: swagger: add missing "platform" query-arg on create
        cfdc075b1c Fix file capabilities droping in Dockerfile
        2daa6bb6b3 Windows: Re-create custom NAT networks after restart if missing from HNS
        903cd53ce4 vendor: libnetwork 0dde5c895075df6e3630e76f750a447cf63f4789
        eccaf6d368 [20.10] update golang to 1.17.12
        ff7feeac37 vendor: github.com/containerd/continuity v0.3.0

    Bumping libnetwork to version v0.7.0-dev.3-1841-gdcdf8f17, which comprises the following commits:

        5e08bdb1 Revert: Added API to set ephemeral port allocator range
        563fe8e2 README.md: repo was moved to https://github.com/moby/moby/tree/master/libnetwork
        bea0bcf5 libnetwork: skip firewalld management for rootless
        af0c46d8 Apply peformance tuning to new sandboxes also

    Bumping docker-cli to version v20.10.21, which comprises the following commits:

        3e3677e47d docs: fix links to BuildKit backend
        20e3951aeb Remove "experimental" gates around "--platform" in bash completion
        75d7ce92a2 fixed the plugin command docker-runc
        a12c535f6e [20.10] vendor docker 03df974ae9e6c219862907efdd76ec2e77ec930b (v20.10.20)
        d18a3e9004 [20.10] vendor moby/buildkit v0.8.3-31-gc0149372
        932ca73874 [20.10] vendor: github.com/docker/docker v20.10.19
        7d51e65e72 [20.10] vendor: github.com/moby/buildkit 3a1eeca59a9263613d996ead67d53a4b7d45723d (v0.8 branch)
        1ea8d69d6f feat(docker): add context argument completion
        e82aa85741 [20.10] vendor: github.com/docker/docker v20.10.18
        e9176b36cc [20.10] vendor: github.com/containerd/continuity v0.3.0
        bc6ff39e42 docs/reference: run.md update confusing example name
        3fa7a8654f docs: update deprecation status for "overlay2.override_kernel_check"
        3e06ce8bfa [20.10] Update go 1.18.7 to address CVE-2022-2879, CVE-2022-2880, CVE-2022-41715
        93eead45ee Update to go 1.18.6 to address CVE-2022-27664, CVE-2022-32190
        45075ea08c [20.10] vendor: github.com/docker/docker v20.10.17
        c2dcaecf19 make compose plugin detection in bash completion work on Mac OS
        613b9362d0 Detect compose plugin
        b30d250320 Add completion for docker-compose plugin
        6b25bc3003 fix race condition in TestRemoveForce
        bdac0b38d9 Update golang to 1.18.5
        c70b01ec1f update golang to 1.18.4
        0389090aeb update golang to 1.18.3
        c904936d69 update golang to 1.18.2
        386d50c2e9 update golang to 1.18.1
        990186f2f6 update go to 1.18.0
        86bf1966e2 staticcheck: ignore SA1019: strings.Title is deprecated
        b3022b91d1 [20.10] Dockerfile.lint: use go install
        f14ba9f5d7 [20.10] Dockerfile: use syntax=docker/dockerfile:1
        c189c4dbea [20.10] vendor: github.com/json-iterator/go v1.1.12 for Go 1.18 compatibility
        0c46ffc1f9 [20.10] vendor: github.com/modern-go/reflect2 v1.0.2 for Go 1.18 compatibility
        6be9ce798e [20.10] vendor: github.com/google/gofuzz v1.0.0
        779ed309a8 lint: update golangci-lint to v1.45.2
        2f7e84be65 linting: fix incorrectly formatted errors (revive)
        e628209d9b linting: ignore some "G101: Potential hardcoded credentials" warnings
        80a3add604 cli/command/container: unnecessary use of fmt.Sprintf (gosimple)
        80fb0d575e [20.10] Update golang to 1.17.13
        d72bef2088 [20.10] update golang to 1.17.12
        7502d7e560 Fix dead external link
        308624c3b1 fix: remove asterisk from docker command suggestions
        de7d866b6a [20.10] update golang to 1.17.11
        240e4b5501 [20.10] vendor: golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
        5d4776bd90 [20.10] update golang to 1.17.10
        49e9c2ae3d vendor: golang.org/x/sys  63515b42dcdf9544f4e6a02fd7632793fde2f72d (for Go 1.17)
        87a3ce2699 vendor: golang.org/x/sys d19ff857e887eacb631721f188c7d365c2331456
        1d8abed17d vendor: update x/sys to 134d130e
        31dad66f9a [20.10] update golang to 1.17.9
        80f673bf9e gofmt with go1.17
        3d4cc8e699 [20.10] update remaining files to go1.17.8
        30277a8f80 update go to 1.17.8
        cfef3a7dc1 docs: deprecated: add entry for "fluent-async-connect" log-opt
        53426025c3 [20.10] docs: reformat table for compatibility
        573a664639 Describe privileged mode in terms of capabilities
        cf0ab7ac4c [20.10] vendor: github.com/docker/distribution v2.8.1
        d05fd4ffc8 [20.10] vendor: github.com/opencontainers/image-spec v1.0.2
        870f138250 [20.10] vendor: github.com/docker/docker v20.10.14
        198d6b8724 [20.10] circleci: update buildx to v0.8.2
        55a14ec851 [20.10] update remaining Dockerfiles to go 1.16.15
        1f9a0df05a e2e: update docker-compose to 1.29.2
        4ae338b33a docs: reference: remove trailing space to fix yaml formatting
        6380142dd4 docs: fix (table) formatting, fix some broken links
        82f422fcf3 docs: build: fix minor markdown and syntax issues
        80fd77903b Update the list of log drivers
        c3d4d623c8 Fix CMD --ignored-param1 example
        2e82d11def docs: dockerd: fix broken link in blockquote area
        738a6ee1cc improve cp documentation with some illustration examples
        246d96bb6c docs: unify "docker create" and "docker run" reference
        2fd0f17057 docs: add missing documentation for --pull flag
        5fa500000a Fix incorrect pointer inputs to `json.Unmarshal`
        1e6a8ce2b7 Dockerfile: update xx to 1.1
        6f7a931a2d [20.10] use GO_LDFLAGS instead of LDFLAGS to prevent inheriting unrelated options
        91bab605f7 [20.10] vendor.conf: don't use git:// protocol
        a282e0c5d2 [20.10] update to go 1.16.15 to address CVE-2022-24921
        700364e304 Fix mistake with env var example in docker run docs
        62d27c32ff Update WORKDIR command information
        c0e952cf04 Fix the (dead) link for docs for Dockerfile syntax reference
        04104a04d3 Update dockerd.md
        b721998b7b Fixing typo (his --> its)
        4065e1246e format create.md table
        f1002eb9fb Fix typo
        e97c7b240e added missing closing parenthese
        aa78937634 Update stats.md add example json output
        40fe0573aa Update Ubuntu version number references in push.md
        c9737e1c37 docs/daemon: replace deprecated '-g' option for '--data-root'
        5c6723d080 Correct device syntax to --gpus
        fd5fc61ecd [20.10] Update Go to 1.16.14
        3624019d83 [20.10] update Go to 1.16.13
        f3ff8e6ad6 [20.10] vendor: compose-on-kubernetes v0.5.0 to remove github.com/golang/glog
        ee1ac1b319 fix innocuous data-race when config.Load called in parallel
        38dd744a11 [20.10] Update Go to 1.16.12
        4de40a825e Update Go to 1.16.11
        03fa8f92c8 Update Go to 1.16.10
        9989fdbc40 Update most links in docs to use https by default
        0e20c1fd21 Update Go to 1.16.9
        1c0927a041 Dockerfile: update tonistiigi/xx to 1.0.0-rc.2, add XX_VERSION arg
        82f9d5921b info: skip client-side warning about seccomp profile on API >= 1.42
        adb01ca79d docs: some minor touch-ups in checkpoint reference
        8260476a06 docs: remove trailing space to fix generated YAML format
        bce2e1f953 docs: create.md: typo fix
        44064f51c8 Fix typo in documentation - build.md
        292779add5 Add doc for BUILDKIT_PROGRESS env var
        f2e79b826c docs: use "console" code-hint for shell examples
        fa46b92361 docs: rewrite reference docs for --stop-signal and --stop-timeout
        400f81089a experimental: fix broken link to "checkpoint and restore" page
        c72057c8db docs: move checkpoint/restore doc from experimental into reference
        77db97d595 Use private network address for default-address-pools setting in daemon.json example
        cbf0d2b7b7 docs: fix some broken anchors
        d0014a86bc docs: fix description of restart-delay to mention max (1 minute)
        6c1c8b55aa docs: fix search results by filterd is-official
        44fdac11f5 Update Go to 1.16.8
        061051c24d docs: add missing redirect, and remove /go/experimental redirect
        2012fbf111 Update Go to 1.16.7
        42d1c02750 registry: ensure default auth config has address
        0b924e51fc Update to go1.16.6
        6288e8b1ac change TestNewAPIClientFromFlagsWithHttpProxyEnv to an e2e test
        1e9575e81a cli/config/configfile: various test cleanups
        c98e9c47ca Use designated test domains (RFC2606) in tests
        8437cfefae context: deprecate support for encrypted TLS private keys
        68a5ca859f cli/context: ignore linting warnings about RFC 1423 encryption
        8a64739631 Update Dockerfiles to latest syntax, remove "experimental"
        1d37fb3027 Deprecate Kubernetes context support
        0793f96394 Deprecate Kubernetes stack support
        b639ea8b89 Deprecate Kubernetes stack support

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 recipes-containers/docker/docker-ce_git.bb    |    9 +-
 recipes-containers/docker/docker-moby_git.bb  |    9 +-
 .../files/0001-revert-go-1.8-update.patch     | 1218 +++++++++++++++++
 3 files changed, 1228 insertions(+), 8 deletions(-)
 create mode 100644 recipes-containers/docker/files/0001-revert-go-1.8-update.patch

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 4561687..a41e83a 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -31,9 +31,9 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_docker = "3949ff121ee486eb73484f6c4708d199f68c930e"
-SRCREV_libnetwork = "f6ccccb1c082a432c2a5814aaedaca56af33d9ea"
-SRCREV_cli = "100c70180fde3601def79a59cc3e996aa553c9b9"
+SRCREV_docker = "3056208812eb5e792fa99736c9167d1e10f4ab49"
+SRCREV_libnetwork = "dcdf8f176d1e13ad719e913e796fb698d846de98"
+SRCREV_cli = "baeda1f82a10204ec5708d5fbba130ad76cfee49"
 SRCREV_FORMAT = "docker_libnetwork"
 SRC_URI = "\
 	git://github.com/docker/docker.git;branch=20.10;name=docker;protocol=https \
@@ -43,6 +43,7 @@ SRC_URI = "\
 	file://docker.init \
         file://0001-dynbinary-use-go-cross-compiler.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
+    file://0001-revert-go-1.8-update.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_docker}"
@@ -53,7 +54,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.17-ce"
+DOCKER_VERSION = "20.10.21-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 8a35290..b048208 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -34,9 +34,9 @@ DESCRIPTION = "Linux container runtime \
 #   - The common components of this recipe and docker-ce do need to be moved
 #     to a docker.inc recipe
 
-SRCREV_moby = "3949ff121ee486eb73484f6c4708d199f68c930e"
-SRCREV_libnetwork = "f6ccccb1c082a432c2a5814aaedaca56af33d9ea"
-SRCREV_cli = "100c70180fde3601def79a59cc3e996aa553c9b9"
+SRCREV_moby = "3056208812eb5e792fa99736c9167d1e10f4ab49"
+SRCREV_libnetwork = "dcdf8f176d1e13ad719e913e796fb698d846de98"
+SRCREV_cli = "baeda1f82a10204ec5708d5fbba130ad76cfee49"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
 	git://github.com/moby/moby.git;branch=20.10;name=moby;protocol=https \
@@ -46,6 +46,7 @@ SRC_URI = "\
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch \
+    file://0001-revert-go-1.8-update.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
@@ -56,7 +57,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.17"
+DOCKER_VERSION = "20.10.21"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/files/0001-revert-go-1.8-update.patch b/recipes-containers/docker/files/0001-revert-go-1.8-update.patch
new file mode 100644
index 0000000..0298c31
--- /dev/null
+++ b/recipes-containers/docker/files/0001-revert-go-1.8-update.patch
@@ -0,0 +1,1218 @@
+From 575302e9c6567b8547b308b2b0c6a07b27e3be3b Mon Sep 17 00:00:00 2001
+From: Adrian Freihofer <adrian.freihofer@siemens.com>
+Date: Sun, 4 Dec 2022 18:02:54 +0100
+Subject: [PATCH] Revert "Merge pull request #43976 from
+ thaJeztah/20.10_backport_bump_golang_1.18"
+
+Upstream-Status: Inapropriate
+
+Updating this patch:
+  git revert -m 1 7d4cc78c0289edbb4727e3d50d4b130ce0f9c47e
+
+This reverts commit 7d4cc78c0289edbb4727e3d50d4b130ce0f9c47e, reversing
+changes made to 32debe0986f4516bfe17bf9122447f0c735e61b4.
+---
+ Dockerfile                            |   2 +-
+ Dockerfile.e2e                        |   2 +-
+ Dockerfile.simple                     |   2 +-
+ Dockerfile.windows                    |   2 +-
+ daemon/logger/templates/templates.go  |   2 +-
+ pkg/plugins/pluginrpc-gen/template.go |   2 +-
+ vendor/archive/tar/common.go          |  40 ++++----
+ vendor/archive/tar/format.go          | 138 +++++++++++++-------------
+ vendor/archive/tar/fuzz_test.go       |  80 ---------------
+ vendor/archive/tar/reader.go          | 102 ++++++++++---------
+ vendor/archive/tar/reader_test.go     |  30 +++---
+ vendor/archive/tar/stat_actime1.go    |   1 +
+ vendor/archive/tar/stat_actime2.go    |   1 +
+ vendor/archive/tar/stat_unix.go       |   1 +
+ vendor/archive/tar/strconv.go         |  43 +++++---
+ vendor/archive/tar/tar_test.go        |   2 +-
+ vendor/archive/tar/writer.go          |  89 ++++++++---------
+ vendor/archive/tar/writer_test.go     |  24 +++--
+ 18 files changed, 251 insertions(+), 312 deletions(-)
+ delete mode 100644 vendor/archive/tar/fuzz_test.go
+
+diff --git a/Dockerfile b/Dockerfile
+index 9472c512a6..f3f7956414 100644
+--- a/Dockerfile
++++ b/Dockerfile
+@@ -3,7 +3,7 @@
+ ARG CROSS="false"
+ ARG SYSTEMD="false"
+ # IMPORTANT: When updating this please note that stdlib archive/tar pkg is vendored
+-ARG GO_VERSION=1.18.7
++ARG GO_VERSION=1.17.13
+ ARG DEBIAN_FRONTEND=noninteractive
+ ARG VPNKIT_VERSION=0.5.0
+ ARG DOCKER_BUILDTAGS="apparmor seccomp"
+diff --git a/Dockerfile.e2e b/Dockerfile.e2e
+index f92bec85b0..d0f0b08acd 100644
+--- a/Dockerfile.e2e
++++ b/Dockerfile.e2e
+@@ -1,4 +1,4 @@
+-ARG GO_VERSION=1.18.7
++ARG GO_VERSION=1.17.13
+ 
+ FROM golang:${GO_VERSION}-alpine AS base
+ ENV GO111MODULE=off
+diff --git a/Dockerfile.simple b/Dockerfile.simple
+index 8aa6d7ff94..1db20c1e35 100644
+--- a/Dockerfile.simple
++++ b/Dockerfile.simple
+@@ -5,7 +5,7 @@
+ 
+ # This represents the bare minimum required to build and test Docker.
+ 
+-ARG GO_VERSION=1.18.7
++ARG GO_VERSION=1.17.13
+ 
+ FROM golang:${GO_VERSION}-buster
+ ENV GO111MODULE=off
+diff --git a/Dockerfile.windows b/Dockerfile.windows
+index 6f8242decc..b0ee068aab 100644
+--- a/Dockerfile.windows
++++ b/Dockerfile.windows
+@@ -165,7 +165,7 @@ FROM microsoft/windowsservercore
+ # Use PowerShell as the default shell
+ SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
+ 
+-ARG GO_VERSION=1.18.7
++ARG GO_VERSION=1.17.13
+ ARG GOTESTSUM_VERSION=v1.7.0
+ 
+ # Environment variable notes:
+diff --git a/daemon/logger/templates/templates.go b/daemon/logger/templates/templates.go
+index d8b4ce5d85..ab76d0f1c2 100644
+--- a/daemon/logger/templates/templates.go
++++ b/daemon/logger/templates/templates.go
+@@ -20,7 +20,7 @@ var basicFunctions = template.FuncMap{
+ 	},
+ 	"split":    strings.Split,
+ 	"join":     strings.Join,
+-	"title":    strings.Title, //nolint:staticcheck // SA1019: strings.Title is deprecated: The rule Title uses for word boundaries does not handle Unicode punctuation properly. Use golang.org/x/text/cases instead.
++	"title":    strings.Title,
+ 	"lower":    strings.ToLower,
+ 	"upper":    strings.ToUpper,
+ 	"pad":      padWithSpace,
+diff --git a/pkg/plugins/pluginrpc-gen/template.go b/pkg/plugins/pluginrpc-gen/template.go
+index c34a5add11..50ed9293c1 100644
+--- a/pkg/plugins/pluginrpc-gen/template.go
++++ b/pkg/plugins/pluginrpc-gen/template.go
+@@ -64,7 +64,7 @@ func title(s string) string {
+ 	if strings.ToLower(s) == "id" {
+ 		return "ID"
+ 	}
+-	return strings.Title(s) //nolint:staticcheck // SA1019: strings.Title is deprecated: The rule Title uses for word boundaries does not handle Unicode punctuation properly. Use golang.org/x/text/cases instead.
++	return strings.Title(s)
+ }
+ 
+ var generatedTempl = template.Must(template.New("rpc_cient").Funcs(templFuncs).Parse(`
+diff --git a/vendor/archive/tar/common.go b/vendor/archive/tar/common.go
+index c99b5c1920..c667cfc872 100644
+--- a/vendor/archive/tar/common.go
++++ b/vendor/archive/tar/common.go
+@@ -316,10 +316,10 @@ func invertSparseEntries(src []sparseEntry, size int64) []sparseEntry {
+ // fileState tracks the number of logical (includes sparse holes) and physical
+ // (actual in tar archive) bytes remaining for the current file.
+ //
+-// Invariant: logicalRemaining >= physicalRemaining
++// Invariant: LogicalRemaining >= PhysicalRemaining
+ type fileState interface {
+-	logicalRemaining() int64
+-	physicalRemaining() int64
++	LogicalRemaining() int64
++	PhysicalRemaining() int64
+ }
+ 
+ // allowedFormats determines which formats can be used.
+@@ -413,22 +413,22 @@ func (h Header) allowedFormats() (format Format, paxHdrs map[string]string, err
+ 
+ 	// Check basic fields.
+ 	var blk block
+-	v7 := blk.toV7()
+-	ustar := blk.toUSTAR()
+-	gnu := blk.toGNU()
+-	verifyString(h.Name, len(v7.name()), "Name", paxPath)
+-	verifyString(h.Linkname, len(v7.linkName()), "Linkname", paxLinkpath)
+-	verifyString(h.Uname, len(ustar.userName()), "Uname", paxUname)
+-	verifyString(h.Gname, len(ustar.groupName()), "Gname", paxGname)
+-	verifyNumeric(h.Mode, len(v7.mode()), "Mode", paxNone)
+-	verifyNumeric(int64(h.Uid), len(v7.uid()), "Uid", paxUid)
+-	verifyNumeric(int64(h.Gid), len(v7.gid()), "Gid", paxGid)
+-	verifyNumeric(h.Size, len(v7.size()), "Size", paxSize)
+-	verifyNumeric(h.Devmajor, len(ustar.devMajor()), "Devmajor", paxNone)
+-	verifyNumeric(h.Devminor, len(ustar.devMinor()), "Devminor", paxNone)
+-	verifyTime(h.ModTime, len(v7.modTime()), "ModTime", paxMtime)
+-	verifyTime(h.AccessTime, len(gnu.accessTime()), "AccessTime", paxAtime)
+-	verifyTime(h.ChangeTime, len(gnu.changeTime()), "ChangeTime", paxCtime)
++	v7 := blk.V7()
++	ustar := blk.USTAR()
++	gnu := blk.GNU()
++	verifyString(h.Name, len(v7.Name()), "Name", paxPath)
++	verifyString(h.Linkname, len(v7.LinkName()), "Linkname", paxLinkpath)
++	verifyString(h.Uname, len(ustar.UserName()), "Uname", paxUname)
++	verifyString(h.Gname, len(ustar.GroupName()), "Gname", paxGname)
++	verifyNumeric(h.Mode, len(v7.Mode()), "Mode", paxNone)
++	verifyNumeric(int64(h.Uid), len(v7.UID()), "Uid", paxUid)
++	verifyNumeric(int64(h.Gid), len(v7.GID()), "Gid", paxGid)
++	verifyNumeric(h.Size, len(v7.Size()), "Size", paxSize)
++	verifyNumeric(h.Devmajor, len(ustar.DevMajor()), "Devmajor", paxNone)
++	verifyNumeric(h.Devminor, len(ustar.DevMinor()), "Devminor", paxNone)
++	verifyTime(h.ModTime, len(v7.ModTime()), "ModTime", paxMtime)
++	verifyTime(h.AccessTime, len(gnu.AccessTime()), "AccessTime", paxAtime)
++	verifyTime(h.ChangeTime, len(gnu.ChangeTime()), "ChangeTime", paxCtime)
+ 
+ 	// Check for header-only types.
+ 	var whyOnlyPAX, whyOnlyGNU string
+@@ -538,7 +538,7 @@ type headerFileInfo struct {
+ func (fi headerFileInfo) Size() int64        { return fi.h.Size }
+ func (fi headerFileInfo) IsDir() bool        { return fi.Mode().IsDir() }
+ func (fi headerFileInfo) ModTime() time.Time { return fi.h.ModTime }
+-func (fi headerFileInfo) Sys() any           { return fi.h }
++func (fi headerFileInfo) Sys() interface{}   { return fi.h }
+ 
+ // Name returns the base name of the file.
+ func (fi headerFileInfo) Name() string {
+diff --git a/vendor/archive/tar/format.go b/vendor/archive/tar/format.go
+index 8898c438b5..6642364de1 100644
+--- a/vendor/archive/tar/format.go
++++ b/vendor/archive/tar/format.go
+@@ -160,28 +160,28 @@ var zeroBlock block
+ type block [blockSize]byte
+ 
+ // Convert block to any number of formats.
+-func (b *block) toV7() *headerV7       { return (*headerV7)(b) }
+-func (b *block) toGNU() *headerGNU     { return (*headerGNU)(b) }
+-func (b *block) toSTAR() *headerSTAR   { return (*headerSTAR)(b) }
+-func (b *block) toUSTAR() *headerUSTAR { return (*headerUSTAR)(b) }
+-func (b *block) toSparse() sparseArray { return sparseArray(b[:]) }
++func (b *block) V7() *headerV7       { return (*headerV7)(b) }
++func (b *block) GNU() *headerGNU     { return (*headerGNU)(b) }
++func (b *block) STAR() *headerSTAR   { return (*headerSTAR)(b) }
++func (b *block) USTAR() *headerUSTAR { return (*headerUSTAR)(b) }
++func (b *block) Sparse() sparseArray { return sparseArray(b[:]) }
+ 
+ // GetFormat checks that the block is a valid tar header based on the checksum.
+ // It then attempts to guess the specific format based on magic values.
+ // If the checksum fails, then FormatUnknown is returned.
+-func (b *block) getFormat() Format {
++func (b *block) GetFormat() Format {
+ 	// Verify checksum.
+ 	var p parser
+-	value := p.parseOctal(b.toV7().chksum())
+-	chksum1, chksum2 := b.computeChecksum()
++	value := p.parseOctal(b.V7().Chksum())
++	chksum1, chksum2 := b.ComputeChecksum()
+ 	if p.err != nil || (value != chksum1 && value != chksum2) {
+ 		return FormatUnknown
+ 	}
+ 
+ 	// Guess the magic values.
+-	magic := string(b.toUSTAR().magic())
+-	version := string(b.toUSTAR().version())
+-	trailer := string(b.toSTAR().trailer())
++	magic := string(b.USTAR().Magic())
++	version := string(b.USTAR().Version())
++	trailer := string(b.STAR().Trailer())
+ 	switch {
+ 	case magic == magicUSTAR && trailer == trailerSTAR:
+ 		return formatSTAR
+@@ -194,23 +194,23 @@ func (b *block) getFormat() Format {
+ 	}
+ }
+ 
+-// setFormat writes the magic values necessary for specified format
++// SetFormat writes the magic values necessary for specified format
+ // and then updates the checksum accordingly.
+-func (b *block) setFormat(format Format) {
++func (b *block) SetFormat(format Format) {
+ 	// Set the magic values.
+ 	switch {
+ 	case format.has(formatV7):
+ 		// Do nothing.
+ 	case format.has(FormatGNU):
+-		copy(b.toGNU().magic(), magicGNU)
+-		copy(b.toGNU().version(), versionGNU)
++		copy(b.GNU().Magic(), magicGNU)
++		copy(b.GNU().Version(), versionGNU)
+ 	case format.has(formatSTAR):
+-		copy(b.toSTAR().magic(), magicUSTAR)
+-		copy(b.toSTAR().version(), versionUSTAR)
+-		copy(b.toSTAR().trailer(), trailerSTAR)
++		copy(b.STAR().Magic(), magicUSTAR)
++		copy(b.STAR().Version(), versionUSTAR)
++		copy(b.STAR().Trailer(), trailerSTAR)
+ 	case format.has(FormatUSTAR | FormatPAX):
+-		copy(b.toUSTAR().magic(), magicUSTAR)
+-		copy(b.toUSTAR().version(), versionUSTAR)
++		copy(b.USTAR().Magic(), magicUSTAR)
++		copy(b.USTAR().Version(), versionUSTAR)
+ 	default:
+ 		panic("invalid format")
+ 	}
+@@ -218,17 +218,17 @@ func (b *block) setFormat(format Format) {
+ 	// Update checksum.
+ 	// This field is special in that it is terminated by a NULL then space.
+ 	var f formatter
+-	field := b.toV7().chksum()
+-	chksum, _ := b.computeChecksum() // Possible values are 256..128776
++	field := b.V7().Chksum()
++	chksum, _ := b.ComputeChecksum() // Possible values are 256..128776
+ 	f.formatOctal(field[:7], chksum) // Never fails since 128776 < 262143
+ 	field[7] = ' '
+ }
+ 
+-// computeChecksum computes the checksum for the header block.
++// ComputeChecksum computes the checksum for the header block.
+ // POSIX specifies a sum of the unsigned byte values, but the Sun tar used
+ // signed byte values.
+ // We compute and return both.
+-func (b *block) computeChecksum() (unsigned, signed int64) {
++func (b *block) ComputeChecksum() (unsigned, signed int64) {
+ 	for i, c := range b {
+ 		if 148 <= i && i < 156 {
+ 			c = ' ' // Treat the checksum field itself as all spaces.
+@@ -240,68 +240,68 @@ func (b *block) computeChecksum() (unsigned, signed int64) {
+ }
+ 
+ // Reset clears the block with all zeros.
+-func (b *block) reset() {
++func (b *block) Reset() {
+ 	*b = block{}
+ }
+ 
+ type headerV7 [blockSize]byte
+ 
+-func (h *headerV7) name() []byte     { return h[000:][:100] }
+-func (h *headerV7) mode() []byte     { return h[100:][:8] }
+-func (h *headerV7) uid() []byte      { return h[108:][:8] }
+-func (h *headerV7) gid() []byte      { return h[116:][:8] }
+-func (h *headerV7) size() []byte     { return h[124:][:12] }
+-func (h *headerV7) modTime() []byte  { return h[136:][:12] }
+-func (h *headerV7) chksum() []byte   { return h[148:][:8] }
+-func (h *headerV7) typeFlag() []byte { return h[156:][:1] }
+-func (h *headerV7) linkName() []byte { return h[157:][:100] }
++func (h *headerV7) Name() []byte     { return h[000:][:100] }
++func (h *headerV7) Mode() []byte     { return h[100:][:8] }
++func (h *headerV7) UID() []byte      { return h[108:][:8] }
++func (h *headerV7) GID() []byte      { return h[116:][:8] }
++func (h *headerV7) Size() []byte     { return h[124:][:12] }
++func (h *headerV7) ModTime() []byte  { return h[136:][:12] }
++func (h *headerV7) Chksum() []byte   { return h[148:][:8] }
++func (h *headerV7) TypeFlag() []byte { return h[156:][:1] }
++func (h *headerV7) LinkName() []byte { return h[157:][:100] }
+ 
+ type headerGNU [blockSize]byte
+ 
+-func (h *headerGNU) v7() *headerV7       { return (*headerV7)(h) }
+-func (h *headerGNU) magic() []byte       { return h[257:][:6] }
+-func (h *headerGNU) version() []byte     { return h[263:][:2] }
+-func (h *headerGNU) userName() []byte    { return h[265:][:32] }
+-func (h *headerGNU) groupName() []byte   { return h[297:][:32] }
+-func (h *headerGNU) devMajor() []byte    { return h[329:][:8] }
+-func (h *headerGNU) devMinor() []byte    { return h[337:][:8] }
+-func (h *headerGNU) accessTime() []byte  { return h[345:][:12] }
+-func (h *headerGNU) changeTime() []byte  { return h[357:][:12] }
+-func (h *headerGNU) sparse() sparseArray { return sparseArray(h[386:][:24*4+1]) }
+-func (h *headerGNU) realSize() []byte    { return h[483:][:12] }
++func (h *headerGNU) V7() *headerV7       { return (*headerV7)(h) }
++func (h *headerGNU) Magic() []byte       { return h[257:][:6] }
++func (h *headerGNU) Version() []byte     { return h[263:][:2] }
++func (h *headerGNU) UserName() []byte    { return h[265:][:32] }
++func (h *headerGNU) GroupName() []byte   { return h[297:][:32] }
++func (h *headerGNU) DevMajor() []byte    { return h[329:][:8] }
++func (h *headerGNU) DevMinor() []byte    { return h[337:][:8] }
++func (h *headerGNU) AccessTime() []byte  { return h[345:][:12] }
++func (h *headerGNU) ChangeTime() []byte  { return h[357:][:12] }
++func (h *headerGNU) Sparse() sparseArray { return sparseArray(h[386:][:24*4+1]) }
++func (h *headerGNU) RealSize() []byte    { return h[483:][:12] }
+ 
+ type headerSTAR [blockSize]byte
+ 
+-func (h *headerSTAR) v7() *headerV7      { return (*headerV7)(h) }
+-func (h *headerSTAR) magic() []byte      { return h[257:][:6] }
+-func (h *headerSTAR) version() []byte    { return h[263:][:2] }
+-func (h *headerSTAR) userName() []byte   { return h[265:][:32] }
+-func (h *headerSTAR) groupName() []byte  { return h[297:][:32] }
+-func (h *headerSTAR) devMajor() []byte   { return h[329:][:8] }
+-func (h *headerSTAR) devMinor() []byte   { return h[337:][:8] }
+-func (h *headerSTAR) prefix() []byte     { return h[345:][:131] }
+-func (h *headerSTAR) accessTime() []byte { return h[476:][:12] }
+-func (h *headerSTAR) changeTime() []byte { return h[488:][:12] }
+-func (h *headerSTAR) trailer() []byte    { return h[508:][:4] }
++func (h *headerSTAR) V7() *headerV7      { return (*headerV7)(h) }
++func (h *headerSTAR) Magic() []byte      { return h[257:][:6] }
++func (h *headerSTAR) Version() []byte    { return h[263:][:2] }
++func (h *headerSTAR) UserName() []byte   { return h[265:][:32] }
++func (h *headerSTAR) GroupName() []byte  { return h[297:][:32] }
++func (h *headerSTAR) DevMajor() []byte   { return h[329:][:8] }
++func (h *headerSTAR) DevMinor() []byte   { return h[337:][:8] }
++func (h *headerSTAR) Prefix() []byte     { return h[345:][:131] }
++func (h *headerSTAR) AccessTime() []byte { return h[476:][:12] }
++func (h *headerSTAR) ChangeTime() []byte { return h[488:][:12] }
++func (h *headerSTAR) Trailer() []byte    { return h[508:][:4] }
+ 
+ type headerUSTAR [blockSize]byte
+ 
+-func (h *headerUSTAR) v7() *headerV7     { return (*headerV7)(h) }
+-func (h *headerUSTAR) magic() []byte     { return h[257:][:6] }
+-func (h *headerUSTAR) version() []byte   { return h[263:][:2] }
+-func (h *headerUSTAR) userName() []byte  { return h[265:][:32] }
+-func (h *headerUSTAR) groupName() []byte { return h[297:][:32] }
+-func (h *headerUSTAR) devMajor() []byte  { return h[329:][:8] }
+-func (h *headerUSTAR) devMinor() []byte  { return h[337:][:8] }
+-func (h *headerUSTAR) prefix() []byte    { return h[345:][:155] }
++func (h *headerUSTAR) V7() *headerV7     { return (*headerV7)(h) }
++func (h *headerUSTAR) Magic() []byte     { return h[257:][:6] }
++func (h *headerUSTAR) Version() []byte   { return h[263:][:2] }
++func (h *headerUSTAR) UserName() []byte  { return h[265:][:32] }
++func (h *headerUSTAR) GroupName() []byte { return h[297:][:32] }
++func (h *headerUSTAR) DevMajor() []byte  { return h[329:][:8] }
++func (h *headerUSTAR) DevMinor() []byte  { return h[337:][:8] }
++func (h *headerUSTAR) Prefix() []byte    { return h[345:][:155] }
+ 
+ type sparseArray []byte
+ 
+-func (s sparseArray) entry(i int) sparseElem { return sparseElem(s[i*24:]) }
+-func (s sparseArray) isExtended() []byte     { return s[24*s.maxEntries():][:1] }
+-func (s sparseArray) maxEntries() int        { return len(s) / 24 }
++func (s sparseArray) Entry(i int) sparseElem { return sparseElem(s[i*24:]) }
++func (s sparseArray) IsExtended() []byte     { return s[24*s.MaxEntries():][:1] }
++func (s sparseArray) MaxEntries() int        { return len(s) / 24 }
+ 
+ type sparseElem []byte
+ 
+-func (s sparseElem) offset() []byte { return s[00:][:12] }
+-func (s sparseElem) length() []byte { return s[12:][:12] }
++func (s sparseElem) Offset() []byte { return s[00:][:12] }
++func (s sparseElem) Length() []byte { return s[12:][:12] }
+diff --git a/vendor/archive/tar/fuzz_test.go b/vendor/archive/tar/fuzz_test.go
+deleted file mode 100644
+index e73e0d2609..0000000000
+--- a/vendor/archive/tar/fuzz_test.go
++++ /dev/null
+@@ -1,80 +0,0 @@
+-// Copyright 2021 The Go Authors. All rights reserved.
+-// Use of this source code is governed by a BSD-style
+-// license that can be found in the LICENSE file.
+-
+-package tar
+-
+-import (
+-	"bytes"
+-	"io"
+-	"testing"
+-)
+-
+-func FuzzReader(f *testing.F) {
+-	b := bytes.NewBuffer(nil)
+-	w := NewWriter(b)
+-	inp := []byte("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
+-	err := w.WriteHeader(&Header{
+-		Name: "lorem.txt",
+-		Mode: 0600,
+-		Size: int64(len(inp)),
+-	})
+-	if err != nil {
+-		f.Fatalf("failed to create writer: %s", err)
+-	}
+-	_, err = w.Write(inp)
+-	if err != nil {
+-		f.Fatalf("failed to write file to archive: %s", err)
+-	}
+-	if err := w.Close(); err != nil {
+-		f.Fatalf("failed to write archive: %s", err)
+-	}
+-	f.Add(b.Bytes())
+-
+-	f.Fuzz(func(t *testing.T, b []byte) {
+-		r := NewReader(bytes.NewReader(b))
+-		type file struct {
+-			header  *Header
+-			content []byte
+-		}
+-		files := []file{}
+-		for {
+-			hdr, err := r.Next()
+-			if err == io.EOF {
+-				break
+-			}
+-			if err != nil {
+-				return
+-			}
+-			buf := bytes.NewBuffer(nil)
+-			if _, err := io.Copy(buf, r); err != nil {
+-				continue
+-			}
+-			files = append(files, file{header: hdr, content: buf.Bytes()})
+-		}
+-
+-		// If we were unable to read anything out of the archive don't
+-		// bother trying to roundtrip it.
+-		if len(files) == 0 {
+-			return
+-		}
+-
+-		out := bytes.NewBuffer(nil)
+-		w := NewWriter(out)
+-		for _, f := range files {
+-			if err := w.WriteHeader(f.header); err != nil {
+-				t.Fatalf("unable to write previously parsed header: %s", err)
+-			}
+-			if _, err := w.Write(f.content); err != nil {
+-				t.Fatalf("unable to write previously parsed content: %s", err)
+-			}
+-		}
+-		if err := w.Close(); err != nil {
+-			t.Fatalf("Unable to write archive: %s", err)
+-		}
+-
+-		// TODO: We may want to check if the archive roundtrips. This would require
+-		// taking into account addition of the two zero trailer blocks that Writer.Close
+-		// appends.
+-	})
+-}
+diff --git a/vendor/archive/tar/reader.go b/vendor/archive/tar/reader.go
+index e609c15f27..f645af8016 100644
+--- a/vendor/archive/tar/reader.go
++++ b/vendor/archive/tar/reader.go
+@@ -65,7 +65,7 @@ func (tr *Reader) next() (*Header, error) {
+ 	format := FormatUSTAR | FormatPAX | FormatGNU
+ 	for {
+ 		// Discard the remainder of the file and any padding.
+-		if err := discard(tr.r, tr.curr.physicalRemaining()); err != nil {
++		if err := discard(tr.r, tr.curr.PhysicalRemaining()); err != nil {
+ 			return nil, err
+ 		}
+ 		if _, err := tryReadFull(tr.r, tr.blk[:tr.pad]); err != nil {
+@@ -355,7 +355,7 @@ func (tr *Reader) readHeader() (*Header, *block, error) {
+ 	}
+ 
+ 	// Verify the header matches a known format.
+-	format := tr.blk.getFormat()
++	format := tr.blk.GetFormat()
+ 	if format == FormatUnknown {
+ 		return nil, nil, ErrHeader
+ 	}
+@@ -364,30 +364,30 @@ func (tr *Reader) readHeader() (*Header, *block, error) {
+ 	hdr := new(Header)
+ 
+ 	// Unpack the V7 header.
+-	v7 := tr.blk.toV7()
+-	hdr.Typeflag = v7.typeFlag()[0]
+-	hdr.Name = p.parseString(v7.name())
+-	hdr.Linkname = p.parseString(v7.linkName())
+-	hdr.Size = p.parseNumeric(v7.size())
+-	hdr.Mode = p.parseNumeric(v7.mode())
+-	hdr.Uid = int(p.parseNumeric(v7.uid()))
+-	hdr.Gid = int(p.parseNumeric(v7.gid()))
+-	hdr.ModTime = time.Unix(p.parseNumeric(v7.modTime()), 0)
++	v7 := tr.blk.V7()
++	hdr.Typeflag = v7.TypeFlag()[0]
++	hdr.Name = p.parseString(v7.Name())
++	hdr.Linkname = p.parseString(v7.LinkName())
++	hdr.Size = p.parseNumeric(v7.Size())
++	hdr.Mode = p.parseNumeric(v7.Mode())
++	hdr.Uid = int(p.parseNumeric(v7.UID()))
++	hdr.Gid = int(p.parseNumeric(v7.GID()))
++	hdr.ModTime = time.Unix(p.parseNumeric(v7.ModTime()), 0)
+ 
+ 	// Unpack format specific fields.
+ 	if format > formatV7 {
+-		ustar := tr.blk.toUSTAR()
+-		hdr.Uname = p.parseString(ustar.userName())
+-		hdr.Gname = p.parseString(ustar.groupName())
+-		hdr.Devmajor = p.parseNumeric(ustar.devMajor())
+-		hdr.Devminor = p.parseNumeric(ustar.devMinor())
++		ustar := tr.blk.USTAR()
++		hdr.Uname = p.parseString(ustar.UserName())
++		hdr.Gname = p.parseString(ustar.GroupName())
++		hdr.Devmajor = p.parseNumeric(ustar.DevMajor())
++		hdr.Devminor = p.parseNumeric(ustar.DevMinor())
+ 
+ 		var prefix string
+ 		switch {
+ 		case format.has(FormatUSTAR | FormatPAX):
+ 			hdr.Format = format
+-			ustar := tr.blk.toUSTAR()
+-			prefix = p.parseString(ustar.prefix())
++			ustar := tr.blk.USTAR()
++			prefix = p.parseString(ustar.Prefix())
+ 
+ 			// For Format detection, check if block is properly formatted since
+ 			// the parser is more liberal than what USTAR actually permits.
+@@ -396,23 +396,23 @@ func (tr *Reader) readHeader() (*Header, *block, error) {
+ 				hdr.Format = FormatUnknown // Non-ASCII characters in block.
+ 			}
+ 			nul := func(b []byte) bool { return int(b[len(b)-1]) == 0 }
+-			if !(nul(v7.size()) && nul(v7.mode()) && nul(v7.uid()) && nul(v7.gid()) &&
+-				nul(v7.modTime()) && nul(ustar.devMajor()) && nul(ustar.devMinor())) {
++			if !(nul(v7.Size()) && nul(v7.Mode()) && nul(v7.UID()) && nul(v7.GID()) &&
++				nul(v7.ModTime()) && nul(ustar.DevMajor()) && nul(ustar.DevMinor())) {
+ 				hdr.Format = FormatUnknown // Numeric fields must end in NUL
+ 			}
+ 		case format.has(formatSTAR):
+-			star := tr.blk.toSTAR()
+-			prefix = p.parseString(star.prefix())
+-			hdr.AccessTime = time.Unix(p.parseNumeric(star.accessTime()), 0)
+-			hdr.ChangeTime = time.Unix(p.parseNumeric(star.changeTime()), 0)
++			star := tr.blk.STAR()
++			prefix = p.parseString(star.Prefix())
++			hdr.AccessTime = time.Unix(p.parseNumeric(star.AccessTime()), 0)
++			hdr.ChangeTime = time.Unix(p.parseNumeric(star.ChangeTime()), 0)
+ 		case format.has(FormatGNU):
+ 			hdr.Format = format
+ 			var p2 parser
+-			gnu := tr.blk.toGNU()
+-			if b := gnu.accessTime(); b[0] != 0 {
++			gnu := tr.blk.GNU()
++			if b := gnu.AccessTime(); b[0] != 0 {
+ 				hdr.AccessTime = time.Unix(p2.parseNumeric(b), 0)
+ 			}
+-			if b := gnu.changeTime(); b[0] != 0 {
++			if b := gnu.ChangeTime(); b[0] != 0 {
+ 				hdr.ChangeTime = time.Unix(p2.parseNumeric(b), 0)
+ 			}
+ 
+@@ -439,8 +439,8 @@ func (tr *Reader) readHeader() (*Header, *block, error) {
+ 			// See https://golang.org/issues/21005
+ 			if p2.err != nil {
+ 				hdr.AccessTime, hdr.ChangeTime = time.Time{}, time.Time{}
+-				ustar := tr.blk.toUSTAR()
+-				if s := p.parseString(ustar.prefix()); isASCII(s) {
++				ustar := tr.blk.USTAR()
++				if s := p.parseString(ustar.Prefix()); isASCII(s) {
+ 					prefix = s
+ 				}
+ 				hdr.Format = FormatUnknown // Buggy file is not GNU
+@@ -465,38 +465,38 @@ func (tr *Reader) readOldGNUSparseMap(hdr *Header, blk *block) (sparseDatas, err
+ 	// Make sure that the input format is GNU.
+ 	// Unfortunately, the STAR format also has a sparse header format that uses
+ 	// the same type flag but has a completely different layout.
+-	if blk.getFormat() != FormatGNU {
++	if blk.GetFormat() != FormatGNU {
+ 		return nil, ErrHeader
+ 	}
+ 	hdr.Format.mayOnlyBe(FormatGNU)
+ 
+ 	var p parser
+-	hdr.Size = p.parseNumeric(blk.toGNU().realSize())
++	hdr.Size = p.parseNumeric(blk.GNU().RealSize())
+ 	if p.err != nil {
+ 		return nil, p.err
+ 	}
+-	s := blk.toGNU().sparse()
+-	spd := make(sparseDatas, 0, s.maxEntries())
++	s := blk.GNU().Sparse()
++	spd := make(sparseDatas, 0, s.MaxEntries())
+ 	for {
+-		for i := 0; i < s.maxEntries(); i++ {
++		for i := 0; i < s.MaxEntries(); i++ {
+ 			// This termination condition is identical to GNU and BSD tar.
+-			if s.entry(i).offset()[0] == 0x00 {
++			if s.Entry(i).Offset()[0] == 0x00 {
+ 				break // Don't return, need to process extended headers (even if empty)
+ 			}
+-			offset := p.parseNumeric(s.entry(i).offset())
+-			length := p.parseNumeric(s.entry(i).length())
++			offset := p.parseNumeric(s.Entry(i).Offset())
++			length := p.parseNumeric(s.Entry(i).Length())
+ 			if p.err != nil {
+ 				return nil, p.err
+ 			}
+ 			spd = append(spd, sparseEntry{Offset: offset, Length: length})
+ 		}
+ 
+-		if s.isExtended()[0] > 0 {
++		if s.IsExtended()[0] > 0 {
+ 			// There are more entries. Read an extension header and parse its entries.
+ 			if _, err := mustReadFull(tr.r, blk[:]); err != nil {
+ 				return nil, err
+ 			}
+-			s = blk.toSparse()
++			s = blk.Sparse()
+ 			continue
+ 		}
+ 		return spd, nil // Done
+@@ -678,13 +678,11 @@ func (fr *regFileReader) WriteTo(w io.Writer) (int64, error) {
+ 	return io.Copy(w, struct{ io.Reader }{fr})
+ }
+ 
+-// logicalRemaining implements fileState.logicalRemaining.
+-func (fr regFileReader) logicalRemaining() int64 {
++func (fr regFileReader) LogicalRemaining() int64 {
+ 	return fr.nb
+ }
+ 
+-// logicalRemaining implements fileState.physicalRemaining.
+-func (fr regFileReader) physicalRemaining() int64 {
++func (fr regFileReader) PhysicalRemaining() int64 {
+ 	return fr.nb
+ }
+ 
+@@ -696,9 +694,9 @@ type sparseFileReader struct {
+ }
+ 
+ func (sr *sparseFileReader) Read(b []byte) (n int, err error) {
+-	finished := int64(len(b)) >= sr.logicalRemaining()
++	finished := int64(len(b)) >= sr.LogicalRemaining()
+ 	if finished {
+-		b = b[:sr.logicalRemaining()]
++		b = b[:sr.LogicalRemaining()]
+ 	}
+ 
+ 	b0 := b
+@@ -726,7 +724,7 @@ func (sr *sparseFileReader) Read(b []byte) (n int, err error) {
+ 		return n, errMissData // Less data in dense file than sparse file
+ 	case err != nil:
+ 		return n, err
+-	case sr.logicalRemaining() == 0 && sr.physicalRemaining() > 0:
++	case sr.LogicalRemaining() == 0 && sr.PhysicalRemaining() > 0:
+ 		return n, errUnrefData // More data in dense file than sparse file
+ 	case finished:
+ 		return n, io.EOF
+@@ -748,7 +746,7 @@ func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error) {
+ 
+ 	var writeLastByte bool
+ 	pos0 := sr.pos
+-	for sr.logicalRemaining() > 0 && !writeLastByte && err == nil {
++	for sr.LogicalRemaining() > 0 && !writeLastByte && err == nil {
+ 		var nf int64 // Size of fragment
+ 		holeStart, holeEnd := sr.sp[0].Offset, sr.sp[0].endOffset()
+ 		if sr.pos < holeStart { // In a data fragment
+@@ -756,7 +754,7 @@ func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error) {
+ 			nf, err = io.CopyN(ws, sr.fr, nf)
+ 		} else { // In a hole fragment
+ 			nf = holeEnd - sr.pos
+-			if sr.physicalRemaining() == 0 {
++			if sr.PhysicalRemaining() == 0 {
+ 				writeLastByte = true
+ 				nf--
+ 			}
+@@ -781,18 +779,18 @@ func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error) {
+ 		return n, errMissData // Less data in dense file than sparse file
+ 	case err != nil:
+ 		return n, err
+-	case sr.logicalRemaining() == 0 && sr.physicalRemaining() > 0:
++	case sr.LogicalRemaining() == 0 && sr.PhysicalRemaining() > 0:
+ 		return n, errUnrefData // More data in dense file than sparse file
+ 	default:
+ 		return n, nil
+ 	}
+ }
+ 
+-func (sr sparseFileReader) logicalRemaining() int64 {
++func (sr sparseFileReader) LogicalRemaining() int64 {
+ 	return sr.sp[len(sr.sp)-1].endOffset() - sr.pos
+ }
+-func (sr sparseFileReader) physicalRemaining() int64 {
+-	return sr.fr.physicalRemaining()
++func (sr sparseFileReader) PhysicalRemaining() int64 {
++	return sr.fr.PhysicalRemaining()
+ }
+ 
+ type zeroReader struct{}
+diff --git a/vendor/archive/tar/reader_test.go b/vendor/archive/tar/reader_test.go
+index 140c736429..5a644a43a4 100644
+--- a/vendor/archive/tar/reader_test.go
++++ b/vendor/archive/tar/reader_test.go
+@@ -1030,12 +1030,12 @@ func TestParsePAX(t *testing.T) {
+ 
+ func TestReadOldGNUSparseMap(t *testing.T) {
+ 	populateSparseMap := func(sa sparseArray, sps []string) []string {
+-		for i := 0; len(sps) > 0 && i < sa.maxEntries(); i++ {
+-			copy(sa.entry(i), sps[0])
++		for i := 0; len(sps) > 0 && i < sa.MaxEntries(); i++ {
++			copy(sa.Entry(i), sps[0])
+ 			sps = sps[1:]
+ 		}
+ 		if len(sps) > 0 {
+-			copy(sa.isExtended(), "\x80")
++			copy(sa.IsExtended(), "\x80")
+ 		}
+ 		return sps
+ 	}
+@@ -1043,19 +1043,19 @@ func TestReadOldGNUSparseMap(t *testing.T) {
+ 	makeInput := func(format Format, size string, sps ...string) (out []byte) {
+ 		// Write the initial GNU header.
+ 		var blk block
+-		gnu := blk.toGNU()
+-		sparse := gnu.sparse()
+-		copy(gnu.realSize(), size)
++		gnu := blk.GNU()
++		sparse := gnu.Sparse()
++		copy(gnu.RealSize(), size)
+ 		sps = populateSparseMap(sparse, sps)
+ 		if format != FormatUnknown {
+-			blk.setFormat(format)
++			blk.SetFormat(format)
+ 		}
+ 		out = append(out, blk[:]...)
+ 
+ 		// Write extended sparse blocks.
+ 		for len(sps) > 0 {
+ 			var blk block
+-			sps = populateSparseMap(blk.toSparse(), sps)
++			sps = populateSparseMap(blk.Sparse(), sps)
+ 			out = append(out, blk[:]...)
+ 		}
+ 		return out
+@@ -1368,11 +1368,11 @@ func TestFileReader(t *testing.T) {
+ 			wantCnt int64
+ 			wantErr error
+ 		}
+-		testRemaining struct { // logicalRemaining() == wantLCnt, physicalRemaining() == wantPCnt
++		testRemaining struct { // LogicalRemaining() == wantLCnt, PhysicalRemaining() == wantPCnt
+ 			wantLCnt int64
+ 			wantPCnt int64
+ 		}
+-		testFnc any // testRead | testWriteTo | testRemaining
++		testFnc interface{} // testRead | testWriteTo | testRemaining
+ 	)
+ 
+ 	type (
+@@ -1385,7 +1385,7 @@ func TestFileReader(t *testing.T) {
+ 			spd     sparseDatas
+ 			size    int64
+ 		}
+-		fileMaker any // makeReg | makeSparse
++		fileMaker interface{} // makeReg | makeSparse
+ 	)
+ 
+ 	vectors := []struct {
+@@ -1605,11 +1605,11 @@ func TestFileReader(t *testing.T) {
+ 					t.Errorf("test %d.%d, expected %d more operations", i, j, len(f.ops))
+ 				}
+ 			case testRemaining:
+-				if got := fr.logicalRemaining(); got != tf.wantLCnt {
+-					t.Errorf("test %d.%d, logicalRemaining() = %d, want %d", i, j, got, tf.wantLCnt)
++				if got := fr.LogicalRemaining(); got != tf.wantLCnt {
++					t.Errorf("test %d.%d, LogicalRemaining() = %d, want %d", i, j, got, tf.wantLCnt)
+ 				}
+-				if got := fr.physicalRemaining(); got != tf.wantPCnt {
+-					t.Errorf("test %d.%d, physicalRemaining() = %d, want %d", i, j, got, tf.wantPCnt)
++				if got := fr.PhysicalRemaining(); got != tf.wantPCnt {
++					t.Errorf("test %d.%d, PhysicalRemaining() = %d, want %d", i, j, got, tf.wantPCnt)
+ 				}
+ 			default:
+ 				t.Fatalf("test %d.%d, unknown test operation: %T", i, j, tf)
+diff --git a/vendor/archive/tar/stat_actime1.go b/vendor/archive/tar/stat_actime1.go
+index c4c2480fee..4fdf2a04b3 100644
+--- a/vendor/archive/tar/stat_actime1.go
++++ b/vendor/archive/tar/stat_actime1.go
+@@ -3,6 +3,7 @@
+ // license that can be found in the LICENSE file.
+ 
+ //go:build aix || linux || dragonfly || openbsd || solaris
++// +build aix linux dragonfly openbsd solaris
+ 
+ package tar
+ 
+diff --git a/vendor/archive/tar/stat_actime2.go b/vendor/archive/tar/stat_actime2.go
+index f76d6be220..5a9a35cbb4 100644
+--- a/vendor/archive/tar/stat_actime2.go
++++ b/vendor/archive/tar/stat_actime2.go
+@@ -3,6 +3,7 @@
+ // license that can be found in the LICENSE file.
+ 
+ //go:build darwin || freebsd || netbsd
++// +build darwin freebsd netbsd
+ 
+ package tar
+ 
+diff --git a/vendor/archive/tar/stat_unix.go b/vendor/archive/tar/stat_unix.go
+index b743c76b8c..4a5bca0312 100644
+--- a/vendor/archive/tar/stat_unix.go
++++ b/vendor/archive/tar/stat_unix.go
+@@ -3,6 +3,7 @@
+ // license that can be found in the LICENSE file.
+ 
+ //go:build aix || linux || darwin || dragonfly || freebsd || openbsd || netbsd || solaris
++// +build aix linux darwin dragonfly freebsd openbsd netbsd solaris
+ 
+ package tar
+ 
+diff --git a/vendor/archive/tar/strconv.go b/vendor/archive/tar/strconv.go
+index 275db6f026..f0b61e6dba 100644
+--- a/vendor/archive/tar/strconv.go
++++ b/vendor/archive/tar/strconv.go
+@@ -14,7 +14,7 @@ import (
+ 
+ // hasNUL reports whether the NUL character exists within s.
+ func hasNUL(s string) bool {
+-	return strings.Contains(s, "\x00")
++	return strings.IndexByte(s, 0) >= 0
+ }
+ 
+ // isASCII reports whether the input is an ASCII C-style string.
+@@ -201,7 +201,10 @@ func parsePAXTime(s string) (time.Time, error) {
+ 	const maxNanoSecondDigits = 9
+ 
+ 	// Split string into seconds and sub-seconds parts.
+-	ss, sn, _ := strings.Cut(s, ".")
++	ss, sn := s, ""
++	if pos := strings.IndexByte(s, '.'); pos >= 0 {
++		ss, sn = s[:pos], s[pos+1:]
++	}
+ 
+ 	// Parse the seconds.
+ 	secs, err := strconv.ParseInt(ss, 10, 64)
+@@ -251,32 +254,48 @@ func formatPAXTime(ts time.Time) (s string) {
+ // return the remainder as r.
+ func parsePAXRecord(s string) (k, v, r string, err error) {
+ 	// The size field ends at the first space.
+-	nStr, rest, ok := strings.Cut(s, " ")
+-	if !ok {
++	sp := strings.IndexByte(s, ' ')
++	if sp == -1 {
+ 		return "", "", s, ErrHeader
+ 	}
+ 
+ 	// Parse the first token as a decimal integer.
+-	n, perr := strconv.ParseInt(nStr, 10, 0) // Intentionally parse as native int
+-	if perr != nil || n < 5 || n > int64(len(s)) {
++	n, perr := strconv.ParseInt(s[:sp], 10, 0) // Intentionally parse as native int
++	if perr != nil || n < 5 || int64(len(s)) < n {
+ 		return "", "", s, ErrHeader
+ 	}
+-	n -= int64(len(nStr) + 1) // convert from index in s to index in rest
+-	if n <= 0 {
++
++	afterSpace := int64(sp + 1)
++	beforeLastNewLine := n - 1
++	// In some cases, "length" was perhaps padded/malformed, and
++	// trying to index past where the space supposedly is goes past
++	// the end of the actual record.
++	// For example:
++	//    "0000000000000000000000000000000030 mtime=1432668921.098285006\n30 ctime=2147483649.15163319"
++	//                                  ^     ^
++	//                                  |     |
++	//                                  |  afterSpace=35
++	//                                  |
++	//                          beforeLastNewLine=29
++	// yet indexOf(firstSpace) MUST BE before endOfRecord.
++	//
++	// See https://golang.org/issues/40196.
++	if afterSpace >= beforeLastNewLine {
+ 		return "", "", s, ErrHeader
+ 	}
+ 
+ 	// Extract everything between the space and the final newline.
+-	rec, nl, rem := rest[:n-1], rest[n-1:n], rest[n:]
++	rec, nl, rem := s[afterSpace:beforeLastNewLine], s[beforeLastNewLine:n], s[n:]
+ 	if nl != "\n" {
+ 		return "", "", s, ErrHeader
+ 	}
+ 
+ 	// The first equals separates the key from the value.
+-	k, v, ok = strings.Cut(rec, "=")
+-	if !ok {
++	eq := strings.IndexByte(rec, '=')
++	if eq == -1 {
+ 		return "", "", s, ErrHeader
+ 	}
++	k, v = rec[:eq], rec[eq+1:]
+ 
+ 	if !validPAXRecord(k, v) {
+ 		return "", "", s, ErrHeader
+@@ -314,7 +333,7 @@ func formatPAXRecord(k, v string) (string, error) {
+ // for the PAX version of the USTAR string fields.
+ // The key must not contain an '=' character.
+ func validPAXRecord(k, v string) bool {
+-	if k == "" || strings.Contains(k, "=") {
++	if k == "" || strings.IndexByte(k, '=') >= 0 {
+ 		return false
+ 	}
+ 	switch k {
+diff --git a/vendor/archive/tar/tar_test.go b/vendor/archive/tar/tar_test.go
+index a476f5eb01..e9fafc7cc7 100644
+--- a/vendor/archive/tar/tar_test.go
++++ b/vendor/archive/tar/tar_test.go
+@@ -23,7 +23,7 @@ import (
+ 
+ type testError struct{ error }
+ 
+-type fileOps []any // []T where T is (string | int64)
++type fileOps []interface{} // []T where T is (string | int64)
+ 
+ // testFile is an io.ReadWriteSeeker where the IO operations performed
+ // on it must match the list of operations in ops.
+diff --git a/vendor/archive/tar/writer.go b/vendor/archive/tar/writer.go
+index 9b2e3e25d4..893eac00ae 100644
+--- a/vendor/archive/tar/writer.go
++++ b/vendor/archive/tar/writer.go
+@@ -50,7 +50,7 @@ func (tw *Writer) Flush() error {
+ 	if tw.err != nil {
+ 		return tw.err
+ 	}
+-	if nb := tw.curr.logicalRemaining(); nb > 0 {
++	if nb := tw.curr.LogicalRemaining(); nb > 0 {
+ 		return fmt.Errorf("archive/tar: missed writing %d bytes", nb)
+ 	}
+ 	if _, tw.err = tw.w.Write(zeroBlock[:tw.pad]); tw.err != nil {
+@@ -117,8 +117,8 @@ func (tw *Writer) writeUSTARHeader(hdr *Header) error {
+ 	// Pack the main header.
+ 	var f formatter
+ 	blk := tw.templateV7Plus(hdr, f.formatString, f.formatOctal)
+-	f.formatString(blk.toUSTAR().prefix(), namePrefix)
+-	blk.setFormat(FormatUSTAR)
++	f.formatString(blk.USTAR().Prefix(), namePrefix)
++	blk.SetFormat(FormatUSTAR)
+ 	if f.err != nil {
+ 		return f.err // Should never happen since header is validated
+ 	}
+@@ -211,7 +211,7 @@ func (tw *Writer) writePAXHeader(hdr *Header, paxHdrs map[string]string) error {
+ 	var f formatter // Ignore errors since they are expected
+ 	fmtStr := func(b []byte, s string) { f.formatString(b, toASCII(s)) }
+ 	blk := tw.templateV7Plus(hdr, fmtStr, f.formatOctal)
+-	blk.setFormat(FormatPAX)
++	blk.SetFormat(FormatPAX)
+ 	if err := tw.writeRawHeader(blk, hdr.Size, hdr.Typeflag); err != nil {
+ 		return err
+ 	}
+@@ -253,10 +253,10 @@ func (tw *Writer) writeGNUHeader(hdr *Header) error {
+ 	var spb []byte
+ 	blk := tw.templateV7Plus(hdr, f.formatString, f.formatNumeric)
+ 	if !hdr.AccessTime.IsZero() {
+-		f.formatNumeric(blk.toGNU().accessTime(), hdr.AccessTime.Unix())
++		f.formatNumeric(blk.GNU().AccessTime(), hdr.AccessTime.Unix())
+ 	}
+ 	if !hdr.ChangeTime.IsZero() {
+-		f.formatNumeric(blk.toGNU().changeTime(), hdr.ChangeTime.Unix())
++		f.formatNumeric(blk.GNU().ChangeTime(), hdr.ChangeTime.Unix())
+ 	}
+ 	// TODO(dsnet): Re-enable this when adding sparse support.
+ 	// See https://golang.org/issue/22735
+@@ -296,7 +296,7 @@ func (tw *Writer) writeGNUHeader(hdr *Header) error {
+ 			f.formatNumeric(blk.GNU().RealSize(), realSize)
+ 		}
+ 	*/
+-	blk.setFormat(FormatGNU)
++	blk.SetFormat(FormatGNU)
+ 	if err := tw.writeRawHeader(blk, hdr.Size, hdr.Typeflag); err != nil {
+ 		return err
+ 	}
+@@ -324,28 +324,28 @@ type (
+ // The block returned is only valid until the next call to
+ // templateV7Plus or writeRawFile.
+ func (tw *Writer) templateV7Plus(hdr *Header, fmtStr stringFormatter, fmtNum numberFormatter) *block {
+-	tw.blk.reset()
++	tw.blk.Reset()
+ 
+ 	modTime := hdr.ModTime
+ 	if modTime.IsZero() {
+ 		modTime = time.Unix(0, 0)
+ 	}
+ 
+-	v7 := tw.blk.toV7()
+-	v7.typeFlag()[0] = hdr.Typeflag
+-	fmtStr(v7.name(), hdr.Name)
+-	fmtStr(v7.linkName(), hdr.Linkname)
+-	fmtNum(v7.mode(), hdr.Mode)
+-	fmtNum(v7.uid(), int64(hdr.Uid))
+-	fmtNum(v7.gid(), int64(hdr.Gid))
+-	fmtNum(v7.size(), hdr.Size)
+-	fmtNum(v7.modTime(), modTime.Unix())
++	v7 := tw.blk.V7()
++	v7.TypeFlag()[0] = hdr.Typeflag
++	fmtStr(v7.Name(), hdr.Name)
++	fmtStr(v7.LinkName(), hdr.Linkname)
++	fmtNum(v7.Mode(), hdr.Mode)
++	fmtNum(v7.UID(), int64(hdr.Uid))
++	fmtNum(v7.GID(), int64(hdr.Gid))
++	fmtNum(v7.Size(), hdr.Size)
++	fmtNum(v7.ModTime(), modTime.Unix())
+ 
+-	ustar := tw.blk.toUSTAR()
+-	fmtStr(ustar.userName(), hdr.Uname)
+-	fmtStr(ustar.groupName(), hdr.Gname)
+-	fmtNum(ustar.devMajor(), hdr.Devmajor)
+-	fmtNum(ustar.devMinor(), hdr.Devminor)
++	ustar := tw.blk.USTAR()
++	fmtStr(ustar.UserName(), hdr.Uname)
++	fmtStr(ustar.GroupName(), hdr.Gname)
++	fmtNum(ustar.DevMajor(), hdr.Devmajor)
++	fmtNum(ustar.DevMinor(), hdr.Devminor)
+ 
+ 	return &tw.blk
+ }
+@@ -354,7 +354,7 @@ func (tw *Writer) templateV7Plus(hdr *Header, fmtStr stringFormatter, fmtNum num
+ // It uses format to encode the header format and will write data as the body.
+ // It uses default values for all of the other fields (as BSD and GNU tar does).
+ func (tw *Writer) writeRawFile(name, data string, flag byte, format Format) error {
+-	tw.blk.reset()
++	tw.blk.Reset()
+ 
+ 	// Best effort for the filename.
+ 	name = toASCII(name)
+@@ -364,15 +364,15 @@ func (tw *Writer) writeRawFile(name, data string, flag byte, format Format) erro
+ 	name = strings.TrimRight(name, "/")
+ 
+ 	var f formatter
+-	v7 := tw.blk.toV7()
+-	v7.typeFlag()[0] = flag
+-	f.formatString(v7.name(), name)
+-	f.formatOctal(v7.mode(), 0)
+-	f.formatOctal(v7.uid(), 0)
+-	f.formatOctal(v7.gid(), 0)
+-	f.formatOctal(v7.size(), int64(len(data))) // Must be < 8GiB
+-	f.formatOctal(v7.modTime(), 0)
+-	tw.blk.setFormat(format)
++	v7 := tw.blk.V7()
++	v7.TypeFlag()[0] = flag
++	f.formatString(v7.Name(), name)
++	f.formatOctal(v7.Mode(), 0)
++	f.formatOctal(v7.UID(), 0)
++	f.formatOctal(v7.GID(), 0)
++	f.formatOctal(v7.Size(), int64(len(data))) // Must be < 8GiB
++	f.formatOctal(v7.ModTime(), 0)
++	tw.blk.SetFormat(format)
+ 	if f.err != nil {
+ 		return f.err // Only occurs if size condition is violated
+ 	}
+@@ -514,13 +514,10 @@ func (fw *regFileWriter) ReadFrom(r io.Reader) (int64, error) {
+ 	return io.Copy(struct{ io.Writer }{fw}, r)
+ }
+ 
+-// logicalRemaining implements fileState.logicalRemaining.
+-func (fw regFileWriter) logicalRemaining() int64 {
++func (fw regFileWriter) LogicalRemaining() int64 {
+ 	return fw.nb
+ }
+-
+-// logicalRemaining implements fileState.physicalRemaining.
+-func (fw regFileWriter) physicalRemaining() int64 {
++func (fw regFileWriter) PhysicalRemaining() int64 {
+ 	return fw.nb
+ }
+ 
+@@ -532,9 +529,9 @@ type sparseFileWriter struct {
+ }
+ 
+ func (sw *sparseFileWriter) Write(b []byte) (n int, err error) {
+-	overwrite := int64(len(b)) > sw.logicalRemaining()
++	overwrite := int64(len(b)) > sw.LogicalRemaining()
+ 	if overwrite {
+-		b = b[:sw.logicalRemaining()]
++		b = b[:sw.LogicalRemaining()]
+ 	}
+ 
+ 	b0 := b
+@@ -562,7 +559,7 @@ func (sw *sparseFileWriter) Write(b []byte) (n int, err error) {
+ 		return n, errMissData // Not possible; implies bug in validation logic
+ 	case err != nil:
+ 		return n, err
+-	case sw.logicalRemaining() == 0 && sw.physicalRemaining() > 0:
++	case sw.LogicalRemaining() == 0 && sw.PhysicalRemaining() > 0:
+ 		return n, errUnrefData // Not possible; implies bug in validation logic
+ 	case overwrite:
+ 		return n, ErrWriteTooLong
+@@ -584,12 +581,12 @@ func (sw *sparseFileWriter) ReadFrom(r io.Reader) (n int64, err error) {
+ 
+ 	var readLastByte bool
+ 	pos0 := sw.pos
+-	for sw.logicalRemaining() > 0 && !readLastByte && err == nil {
++	for sw.LogicalRemaining() > 0 && !readLastByte && err == nil {
+ 		var nf int64 // Size of fragment
+ 		dataStart, dataEnd := sw.sp[0].Offset, sw.sp[0].endOffset()
+ 		if sw.pos < dataStart { // In a hole fragment
+ 			nf = dataStart - sw.pos
+-			if sw.physicalRemaining() == 0 {
++			if sw.PhysicalRemaining() == 0 {
+ 				readLastByte = true
+ 				nf--
+ 			}
+@@ -619,18 +616,18 @@ func (sw *sparseFileWriter) ReadFrom(r io.Reader) (n int64, err error) {
+ 		return n, errMissData // Not possible; implies bug in validation logic
+ 	case err != nil:
+ 		return n, err
+-	case sw.logicalRemaining() == 0 && sw.physicalRemaining() > 0:
++	case sw.LogicalRemaining() == 0 && sw.PhysicalRemaining() > 0:
+ 		return n, errUnrefData // Not possible; implies bug in validation logic
+ 	default:
+ 		return n, ensureEOF(rs)
+ 	}
+ }
+ 
+-func (sw sparseFileWriter) logicalRemaining() int64 {
++func (sw sparseFileWriter) LogicalRemaining() int64 {
+ 	return sw.sp[len(sw.sp)-1].endOffset() - sw.pos
+ }
+-func (sw sparseFileWriter) physicalRemaining() int64 {
+-	return sw.fw.physicalRemaining()
++func (sw sparseFileWriter) PhysicalRemaining() int64 {
++	return sw.fw.PhysicalRemaining()
+ }
+ 
+ // zeroWriter may only be written with NULs, otherwise it returns errWriteHole.
+diff --git a/vendor/archive/tar/writer_test.go b/vendor/archive/tar/writer_test.go
+index 640264984a..4e709e5cac 100644
+--- a/vendor/archive/tar/writer_test.go
++++ b/vendor/archive/tar/writer_test.go
+@@ -67,7 +67,7 @@ func TestWriter(t *testing.T) {
+ 		testClose struct { // Close() == wantErr
+ 			wantErr error
+ 		}
+-		testFnc any // testHeader | testWrite | testReadFrom | testClose
++		testFnc interface{} // testHeader | testWrite | testReadFrom | testClose
+ 	)
+ 
+ 	vectors := []struct {
+@@ -987,9 +987,11 @@ func TestIssue12594(t *testing.T) {
+ 		// The prefix field should never appear in the GNU format.
+ 		var blk block
+ 		copy(blk[:], b.Bytes())
+-		prefix := string(blk.toUSTAR().prefix())
+-		prefix, _, _ = strings.Cut(prefix, "\x00") // Truncate at the NUL terminator
+-		if blk.getFormat() == FormatGNU && len(prefix) > 0 && strings.HasPrefix(name, prefix) {
++		prefix := string(blk.USTAR().Prefix())
++		if i := strings.IndexByte(prefix, 0); i >= 0 {
++			prefix = prefix[:i] // Truncate at the NUL terminator
++		}
++		if blk.GetFormat() == FormatGNU && len(prefix) > 0 && strings.HasPrefix(name, prefix) {
+ 			t.Errorf("test %d, found prefix in GNU format: %s", i, prefix)
+ 		}
+ 
+@@ -1054,11 +1056,11 @@ func TestFileWriter(t *testing.T) {
+ 			wantCnt int64
+ 			wantErr error
+ 		}
+-		testRemaining struct { // logicalRemaining() == wantLCnt, physicalRemaining() == wantPCnt
++		testRemaining struct { // LogicalRemaining() == wantLCnt, PhysicalRemaining() == wantPCnt
+ 			wantLCnt int64
+ 			wantPCnt int64
+ 		}
+-		testFnc any // testWrite | testReadFrom | testRemaining
++		testFnc interface{} // testWrite | testReadFrom | testRemaining
+ 	)
+ 
+ 	type (
+@@ -1071,7 +1073,7 @@ func TestFileWriter(t *testing.T) {
+ 			sph     sparseHoles
+ 			size    int64
+ 		}
+-		fileMaker any // makeReg | makeSparse
++		fileMaker interface{} // makeReg | makeSparse
+ 	)
+ 
+ 	vectors := []struct {
+@@ -1317,11 +1319,11 @@ func TestFileWriter(t *testing.T) {
+ 					t.Errorf("test %d.%d, expected %d more operations", i, j, len(f.ops))
+ 				}
+ 			case testRemaining:
+-				if got := fw.logicalRemaining(); got != tf.wantLCnt {
+-					t.Errorf("test %d.%d, logicalRemaining() = %d, want %d", i, j, got, tf.wantLCnt)
++				if got := fw.LogicalRemaining(); got != tf.wantLCnt {
++					t.Errorf("test %d.%d, LogicalRemaining() = %d, want %d", i, j, got, tf.wantLCnt)
+ 				}
+-				if got := fw.physicalRemaining(); got != tf.wantPCnt {
+-					t.Errorf("test %d.%d, physicalRemaining() = %d, want %d", i, j, got, tf.wantPCnt)
++				if got := fw.PhysicalRemaining(); got != tf.wantPCnt {
++					t.Errorf("test %d.%d, PhysicalRemaining() = %d, want %d", i, j, got, tf.wantPCnt)
+ 				}
+ 			default:
+ 				t.Fatalf("test %d.%d, unknown test operation: %T", i, j, tf)
+-- 
+2.38.1
+
-- 
2.38.1


