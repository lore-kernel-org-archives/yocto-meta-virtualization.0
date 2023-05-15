Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A428C7EE26
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 15:27:53 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.92033.1684164468247996315
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 May 2023 08:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jpMXDbHo;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-94a342f7c4cso2355184666b.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684164466; x=1686756466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQaJ6Fc20BVnUoU3E8Nuc53jWOwO36CFsj/49lPvBUA=;
        b=jpMXDbHowg9Gq5z7gucyh1dHcHdUENefR64Rlr3dmwhwoPF1wKMegKKpQfk/ur4YP/
         UML4XgUQthwMRidc3WUuAMWhs9Nt+qX873kcDU8z0on63DUg0Z8TwtTjKixwrlaT77ce
         2b4nJgDq1ZHPBOtVwRYgzDBNiJfva2RfbFhdakjofkhYx3VzIlg7aOnZ53K8lIUknEio
         Gb1/MqBUcRyTDF9KV8r3Q+/W8OdqV5ZQA9O9pske+ENNcCN88kYWAoeAAG/VhwcV67tW
         n3wslv04wJw//0jN1r1TnzoAvPArx13utawA+P0jW97KEMbIhMQsTdqQSjtmkp0LvEwN
         GU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684164466; x=1686756466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQaJ6Fc20BVnUoU3E8Nuc53jWOwO36CFsj/49lPvBUA=;
        b=ZKItYPLpqDMmou3YLKuXLR5j2fS14jZ54nPTu2MkKI6vLS+YSvz95caOCnPIACWttY
         r27awuZCTeN+jv9DDBxf5bFEtCk8wKHiJo/EEe7w+CBjIH/bB9+XK6kQgC26C6JRYEOB
         v26WGMm7v8n115eNTPSJRR3PNUirSrsZVmw7uCEdx1O4Vagl3eKtzgUYd2GK0aZGpujY
         5yFfytrhQsSLTKUmArqGLPxzhABxqxlKex1SIV3xLNnOqyAq3DlxbpDHkB+aK2PT9nKF
         AwKKYoYZRxS6eyHtB5iZjwNLEvz5eqc7F6yBHm9CEDlrFMTo0FZkqKC/4KIReHg0U5bX
         GoBw==
X-Gm-Message-State: AC+VfDyxPFgLROzOPojATOUe0EPah/NnEnb8a5t8IPeQ4t9Z7E/7KWPG
	UITQwt/Xt+t0Mw+gme3CZ8acERBC2lQ=
X-Google-Smtp-Source: ACHHUZ4VTflFEuWrEP562qaf2y+KDzXn0kut9NejMlm+j9Wx/z2BzfoqEmnSCPDVMugEZVBxe/SOyw==
X-Received: by 2002:a17:907:97c9:b0:96a:1348:7a27 with SMTP id js9-20020a17090797c900b0096a13487a27mr21804921ejc.12.1684164466170;
        Mon, 15 May 2023 08:27:46 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id ze12-20020a170906ef8c00b009659fa6eeddsm9690128ejb.196.2023.05.15.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 08:27:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][PATCH 3/5] moby: update to v23.0.6
Date: Mon, 15 May 2023 17:26:22 +0200
Message-Id: <20230515152624.138713-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515152624.138713-1-adrian.freihofer@siemens.com>
References: <20230515152624.138713-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 15:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8054

Bumping moby to version v23.0.6, which comprises the following commits:

    9dbdbd4b6d (HEAD -> 23.0, tag: v23.0.6, origin/23.0) Merge pull request #45371 from thaJeztah/23.0_backport_runc_binary_1.1.6
    6030355735 Merge pull request #45478 from thaJeztah/23.0_containerd_binary_1.6.21
    e1c053637b Merge pull request #45477 from thaJeztah/23.0_backport_vendor_containerd_1.6.21
    e73310d8c9 update runc binary to v1.1.7
    3f0402cb68 update runc binary to v1.1.6
    edadebe177 update containerd binary to v1.6.21
    14661fc010 vendor: github.com/containerd/containerd v1.6.21
    e00f6efb20 Vendor containerd 1.6.x with the readonly mount fix
    bd4620f6ee vendor: github.com/containerd/containerd v1.6.20
    d06cf03729 vendor: re-vendor to add missing file
    cf7742ea7c vendor: opencontainers/image-spec v1.1.0-rc2.0.20221005185240-3a7f492d3f1b
    382e9ebbf6 vendor: github.com/containerd/ttrpc v1.1.1
    e0843f264d Update `github.com/containerd/containerd` to the HEAD of `release/1.6` and vendor
    24fd7c5eb8 Merge pull request #45465 from corhere/backport-23.0/copy-xattr-notsupp
    94fcd2d2ef d/graphdriver/copy: support src fs w/o xattr support
    c5197fe6c5 Merge pull request #45455 from thaJeztah/23.0_update_go1.19.9
    70dbd2c870 [23.0] update go to go1.19.9
    94d3ad69cc (tag: v23.0.5) Merge pull request #45410 from rumpl/23.0_backport-fix-buildx-tag-events
    933a9f83b7 Merge pull request #45407 from thaJeztah/23.0_backport_vendor_runc_1.1.5
    fe0a414613 Use the image service instead of the reference store for tagging
    1b1230eaaf Merge pull request #45375 from thaJeztah/23.0_backport_bump_swarmkit
    1b263035af Merge pull request #45374 from thaJeztah/23.0_backport_stfu_grpc
    682542fd08 Merge pull request #45373 from thaJeztah/23.0_backport_assorted_test_and_packaging
    40ec0eb9fe vendor: github.com/opencontainers/runc v1.1.5
    9af6762d34 Merge pull request #45403 from akerouanton/23.0-cherrypick-2d31697
    0b6449a477 Merge pull request #45376 from thaJeztah/23.0_backport_delete_network_more_atomically
    227d3f39a3 daemon: set docker0 subpool as the IPAM pool
    6f83b8c3f4 Merge pull request #45372 from thaJeztah/23.0_backport_really_deprecate_newclient
    c82be35412 libnetwork: clean up inDelete network atomically
    ccccb7a170 vendor: github.com/moby/swarmkit/v2 v2.0.0-20230315203717-e28e8ba9bc83
    8a6bec6e16 Silence GRPC logs unless our log level is debug
    844fd50c67 Added timeout to validate job in github actions
    8cec683574 Dockerfile: update xx to 1.2.1
    7ff53c3c78 Update delve version
    4d57ee692d TestLogs: Increase stop check poll timeout on Windows
    838d5ea058 chore: use http constants to replace numbers
    61d084593c client: deprecate NewClient properly
    8fdca288c5 Merge pull request #45350 from PettitWesley/awslogs-non-blocking-bug-23.0
    28b694d32d awslogs: fix non-blocking log drop bug
    cbce331930 (tag: v23.0.4) Merge pull request #45330 from kevingentile/buildkit-3770
    5f684cb072 Merge pull request #45331 from thaJeztah/23.0_backport_rootless_script_bugs
    3731ce10d4 Fix argument quoting bugs in dockerd-rootless.sh
    23774ada04 vendor: github.com/moby/buildkit v0.10.7-0.20230412161310-d52b2d584242
    90e8a0bbf5 Merge pull request #45323 from thaJeztah/23.0_backport_vendor_sctp
    9277e64444 vendor: github.com/ishidawataru/sctp v0.0.0-20230406120618-7ff4192f6ff2
    cdb6200887 Merge pull request #45293 from AkihiroSuda/backport-45283-23
    09fbbd5677 docker-rootless-setuptools.sh: improve readability of messages
    4ca4705bf7 Merge pull request #45277 from thaJeztah/23.0_bump_go1.19.8
    d3e52936c3 [23.0] update go to go1.19.8
    347bce43e9 Merge pull request #45279 from thaJeztah/23.0_fix_vendor
    a0a597cbbe [23.0] fix vendor.mod: add hashicorp/go-multierror as direct dependency
    c9f6343c24 Merge pull request #45220 from vvoland/test-windows-execstartfails-23
    0ce1e22243 Merge pull request #45237 from thaJeztah/23.0_backport_update_runc_binary_1.1.5
    3648a4915c Merge pull request #45240 from akerouanton/cherrypick-45211
    aaa102b30f Merge pull request #45245 from thaJeztah/23.0_containerd_binary_1.6.20
    15d6037c1e Merge pull request #45246 from akerouanton/cherrypick-44827
    59118bff50 (tag: v23.0.3) Merge pull request from GHSA-232p-vwff-86mp
    063d3a6f1a daemon: let libnetwork assign default bridge IPAM
    389e18081d update containerd binary to v1.6.20
    348544e6e8 libnet/d/windows: log EnableInternalDNS val after setting it
    3923e302a4 update runc binary to v1.1.5
    f3946c14fe integration-cli: Enable TestExecStartFails on Windows
    b87f7f18b8 libnet/d/overlay: insert the input-drop rule
    98cbcb8003 libnet/d/overlay: add BPF-powered VNI matcher
    5c5fac2374 libnet/d/overlay: extract VNI match rule builder
    c492a22287 libn/d/overlay: enforce encryption on sandbox init
    018edb0284 libnet/d/overlay: document some encryption code

Bumping libnetwork to version v0.7.0-dev.3-1872-g3f004841, which comprises the following commits:

    3f004841 (HEAD -> master, origin/master, origin/HEAD) Merge pull request #2677 from corhere/backport-20.10/delete-network-more-atomically
    dbbf124d Clean up inDelete network atomically
    0d7f33e1 Merge pull request from GHSA-gvm4-2qqg-m333
    a584d5df Merge pull request #2676 from corhere/backport/fix-windows-log
    d4d07f4a d/windows: log EnableInternalDNS val after setting it
    c5aa85f9 drivers/overlay: insert the input-drop rule
    bef66946 drivers/overlay: appease the old deprecated linter
    a94fe95b drivers/overlay: add BPF-powered VNI matcher
    e0376b6c drivers/overlay: extract VNI match rule builder
    f1945d37 drivers/overlay: enforce encryption on sandbox init
    97442407 drivers/overlay: document some encryption code

docker-moby/cli: update to v23.0.6

    ef23cbc431 (HEAD -> 23.0, tag: v23.0.6) Merge pull request #4254 from thaJeztah/23.0_update_go1.19.9
    c769f20797 [23.0] update go to go1.19.9
    fcab2d0f9a Merge pull request #4234 from thaJeztah/23.0_update_engine
    802f174889 [23.0] vendor: github.com/docker/docker v23.0.5
    498743aed2 [23.0] vendor: github.com/moby/swarmkit/v2 v2.0.0-20230315203717-e28e8ba9bc83
    fde09d1d87 [23.0] vendor: github.com/opencontainers/runc v1.1.5
    bc4487a59e (tag: v23.0.5) Merge pull request #4233 from thaJeztah/23.0_update_engine
    f332962161 Merge pull request #4232 from thaJeztah/23.0_backport_docs_fixes
    3cda7c30c6 [23.0] vendor: github.com/docker/docker v23.0.4
    6c0f9022c8 Docs freshness updates
    776388cc19 Merge pull request #4229 from thaJeztah/23.0_backport_volumes_prune_all
    8e00eb4a69 Merge pull request #4230 from thaJeztah/23.0_backport_docker_info_json
    91b7318833 Merge pull request #4231 from thaJeztah/23.0_backport_test_fixes
    17357a7783 build(deps): bump docker/bake-action from 2 to 3
    2cf68537d7 ci: remove fetch depth 0 for validate jobs
    4a42917081 ci: add validation for generated markdown
    f914316a97 fix docker version --format=json not outputting json format
    9dfe5a29ee cli/command/system: make default version template a const
    2c1fde2239 fix docker info --format=json not outputting json format
    99124087e0 cli/command/formatter: export JSONFormat const
    86e79b55ed volumes: prune: add --all / -a option
    ada43812d0 cli/command/volume: suppress err output in tests
    ced769fc12 Merge pull request #4217 from vvoland/buildkit-empty-23
    c648e0b065 Handle empty DOCKER_BUILDKIT like unset
    f480fb1e37 (tag: v23.0.4) Merge pull request #4202 from thaJeztah/23.0_backport_docs_daemon_proxy_config
    ad7ae5a894 Merge pull request #4196 from thaJeztah/23.0_backport_registry_fix_ResolveAuthConfig_docs
    b6cd3c85b5 docs: update dockerd usage output for new proxy-options
    aa85421ff8 docs/reference: dockerd: remove default oom-score-adjust
    6bc4bf4f05 docs/reference: dockerd: update seccomp flag description
    8a35f92fff docs/reference: dockerd: use table for env-vars
    2cb152c41d docs/reference: use table for proxy env-vars
    623da1997e docs/reference: reformat env-vars table, and simplify
    e76242fff2 docs/reference: remove mention of DOCKER_NOWARN_KERNEL_VERSION
    0b3f54066c Merge pull request #4195 from thaJeztah/23.0_backport_fix_deprecation_version
    4b4d7e2b48 cli/command: fix documentation for ResolveAuthConfig
    e67e5559d5 docs: deprecated: fix version (23.1.0 -> 24.0.0)
    8b783cc22a Merge pull request #4172 from thaJeztah/23.0_backport_fix_mddocs
    9d4a21cd79 Merge pull request #4175 from thaJeztah/23.0_backport_ci_split_build
    d45284a65d Merge pull request #4176 from thaJeztah/23.0_backport_fix_docs_grammar
    fe7eb06263 Merge pull request #4182 from thaJeztah/23.0_backport_no_2206
    7192601845 Merge pull request #4178 from thaJeztah/23.0_engine_23.0.3
    726dfe92ec Merge pull request #4177 from thaJeztah/23.0_backport_fix_bash_file_completion
    a8e3b4b852 docs: update engine versions in some examples
    f88c159c7a [23.0] vendor: github.com/docker/docker v23.0.3
    6c052fcda3 vendor: github.com/docker/docker v23.0.2
    079e80889d vendor: golang.org/x/net v0.7.0
    ff448ff455 vendor: golang.org/x/term v0.5.0
    476933b68b vendor: golang.org/x/time v0.3.0
    6131fe9e45 vendor: golang.org/x/text v0.7.0
    bbc791ed7d vendor: golang.org/x/sys v0.5.0
    dd6f77bbaa vendor: github.com/moby/swarmkit/v2 v2.0.0-20230309194213-a745a8755ce3
    cb338ec972 vendor: github.com/containerd/containerd v1.6.19
    ffafb38e30 vendor: github.com/docker/docker v23.0.1
    a763e51147 Fix plugin completion parsing for plugins using `ShellCompDirectiveFilterFileExt`
    3c7de64541 Fix grammar in docs by adding omitted word
    3d0d576af7 ci: enhanced build workflow
    2609bd23ff docs: regenerate markdown docs
    5fd2c08502 scripts/docs/generate-md.sh: fix location of generate code
    24d608d5f1 Merge pull request #4164 from thaJeztah/23.0_bump_go1.19.8
    06ab5992dc Merge pull request #4154 from thaJeztah/23.0_backport_fix_deprecation_message
    5cd7710a04 update go to go1.19.8
    683b099613 Merge pull request #4157 from cpuguy83/23.0_improve_cp_progress
    391b2f0fab Merge pull request #4141 from crazy-max/23.0_backport_fix-perf-reg
    209e9c0c13 cp: Do not block transfer on writing to terminal
    ce68ce7ae8 cp: Make gocyclo happy
    c28cb35c42 cp: Reduce number of progress updates
    948dfa91c9 cp: reduce branching in progress printer
    f813c9639f cp: Improve tty flashing on progress updates
    97d91f13aa cp: do not emit progress if stderr is not a term
    6efc4eaccb cli/command: fix deprecation comments for Stream types
    c7cdab58d2 improve plugins listing performance
    d93d78588d load plugin command stubs when required
    3e7cbfdee1 (tag: v23.0.3) Merge pull request #4139 from thaJeztah/23.0_backport_fix_go_version
    8e38271f23 gha: align stray go 1.19.4 version

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 recipes-containers/docker/docker-moby_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 0738e2d..c41f8ac 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -44,9 +44,9 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_moby = "219f21bf07502b447095649b5a2764661737f164"
-SRCREV_libnetwork = "25ec449c45d2075c85fb3688ef4c1730be0466e0"
-SRCREV_cli = "569dd73db13099a7c3104d73aa15117b359045bc"
+SRCREV_moby = "9dbdbd4b6d7681bd18c897a6ba0376073c2a72ff"
+SRCREV_libnetwork = "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
+SRCREV_cli = "ef23cbc4315ae76c744e02d687c09548ede461bd"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
 	git://github.com/moby/moby.git;branch=23.0;name=moby;protocol=https \
@@ -66,7 +66,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "23.0.2"
+DOCKER_VERSION = "23.0.6"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
-- 
2.40.1


