Return-Path: <ali.oezaslan@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16CBCE7AA4
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 16:31:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.65914.1695659502582061870
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Sep 2023 09:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jkUatgNq;
 spf=pass (domain: linaro.org, ip: 209.85.128.47, mailfrom: ali.oezaslan@linaro.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40471c054f9so21378675e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Sep 2023 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695659501; x=1696264301; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FveCQz0vvzCqwVS9B2SRUuhUf76v+EX15I6yW7TSYmw=;
        b=jkUatgNq0vLH9+W6VbNokjcJfGwEM6A1SFVqKOkf0lE3axWuq7ZRXiIjhl8ahDfqjt
         5G1aY3VWgi7gnr4utyFFuDMnK/CgROoo9TuPuFcwaC4r684W8n8juUwGqhz4EXNHUDVw
         ZyEY5bjBFB9V9QYSnLorJsslZV5ThWNswNsUbq+RE7XDSz4w++6AqiiiEPCpnreexHFU
         nBjNTFgYsaSFcf/ucDXqrvAjx4yZjA8MSNRhGOK8tzRC+BlmiunVSO7OHnhoWytq3sNn
         6Iuh/1xFjWh1Fasntt36f5eN5247Q2R/yvVCk7zvLWZ3FcPFSyjXS/84yxPcjHDzHPka
         FujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695659501; x=1696264301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FveCQz0vvzCqwVS9B2SRUuhUf76v+EX15I6yW7TSYmw=;
        b=mrP4NHI39tWFVheu0as7brjvx+QZX8fu1t+9KCncEPPbVILdMjCfiDHRrlP350+ee2
         abSQ7SaFqJnSQEYqhD3Y/53T2m3Uk+uhX5FGTiDPyCXcAM1P2pfUcTGB1Y5S0r6LJWcP
         xpeOXombCxYNe2Z8ASAyktdZY777wZFfDsCWx0mn0KXmO4acrHsJ9QAKWLLNBwGs33X2
         YyWCwmtXKJwzeNVx/JvRltEXWVHlDiaHGazHIhDvud6/BUXP7S4uezx5jMbxnC5zjmcm
         IMxQ6MGh3sV8sT/fSWsQPZ7mAqZ82I0v+XsgWHTKjXIRc+DTcgefWENJrdv8gbHsTChU
         Nt9w==
X-Gm-Message-State: AOJu0Yy6kGSgFwKVqMhF++iOTyShDAAHZUPYw0EGLKzfGfULtamD1eGx
	dsGaNmdeoa7JkhkIhhjTk8DuIg6hrqWdycDYvsQ=
X-Google-Smtp-Source: AGHT+IHkHFjqrNaoz932rtwiF0vUM4ldQcPky4IwqpOq21DKUAi709DbLzhN7ekOFAYDZRGH5rv+6A==
X-Received: by 2002:a05:600c:1d82:b0:401:c07f:72bd with SMTP id p2-20020a05600c1d8200b00401c07f72bdmr6365721wms.4.1695659500744;
        Mon, 25 Sep 2023 09:31:40 -0700 (PDT)
Received: from PW05BKJD.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b003feae747ff2sm15426908wmh.35.2023.09.25.09.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:31:40 -0700 (PDT)
From: Ali Can Ozaslan <ali.oezaslan@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: patches@linaro.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][mickledore][PATCH 2/2] moby: update to v24.0.5
Date: Mon, 25 Sep 2023 17:31:16 +0100
Message-Id: <20230925163116.1060-2-ali.oezaslan@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925163116.1060-1-ali.oezaslan@linaro.org>
References: <20230925163116.1060-1-ali.oezaslan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Sep 2023 16:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8321

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping moby to version v24.0.5-20-g00e46f85f6, which comprises the following commits:

    b7c5385b81 update to go1.20.7
    6be708aa7d vendor: gotest.tools/v3 v3.5.0
    b6568d2dd5 api/types/filters: fix errors not being matched by errors.Is()
    02241b05fc update containerd binary to v1.7.3
    3a6899c6fd update containerd binary to v1.7.2
    7927cae910 c8d/container: Follow snapshot parents for size calculation
    45ba926c6d daemon/list: Drop unused arg from containerReducer
    6c4121a943 daemon/list: Refactor refreshImage
    fcb68e55fa daemon/list: Replace ErrImageDoesNotExist check
    3029f554cc c8d/readConfig: Translate c8d NotFound to errdefs
    35a8b00b18 hack/integration: Add TEST_INTEGRATION_FAIL_FAST
    fed26d5b3c vendor: github.com/moby/buildkit v0.11.7-dev
    eede7f09c7 Remove Upstart scripts
    907f838603 Remove Upstart and cgroups bits from Debian sysvinit script
    f022632503 Dockerfile: update runc binary to v1.1.8
    98a6422cbc c8d/inspect: Include platform Variant
    aab94fb340 Dockerfile: update buildx to v0.11.2
    1be48ec553 c8d: Make sure the content isn't removed while we export
    ff0144de3b ci(buildkit): remove early-return from buildkit-ref
    a936ae7e98 ci(buildkit): remove misleading code from buildkit-ref
    4c29864b02 hack/with-go-mod.sh: warn on stderr
    3c5c192baf c8d/resolveImage: Fix Digested and Named reference
    572de8764e c8d/inspect: Don't duplicate digested ref
    5dded3340c ci: extract buildkit version correctly with replace-d modules
    bd1ae65aab quota: remove gotest.tools from testhelpers
    544032f7a4 hack/d/cli.sh: properly handle errors in curl
    0df2e1bdd8 Dockerfile: improve CLI/rootlesskit caching
    05f82fdd00 Dockerfile(.simple): align APT_MIRROR support
    151686a5c8 Makefile: pass through APT_MIRROR
    31567e0973 Dockerfile: use default apt mirrors
    d94f2dcab2 client: Client.postHijacked: use Client.buildRequest
    bff68bf2cc client: Client.setupHijackConn: explicitly ignore errors
    8bdf6d1baf ci(bin-image): add SHA-based tags
    26a457e7a3 ci(bin-image): fix meta step
    b9904ba319 ci(bin-image): fix typo
    e7c333cb6e ci(bin-image): don't set tags when pushing by digest
    fcb87e8ae1 ci: push bin image to Docker Hub
    68c0cec772 Disable tls when launching dockerd through hack/make.sh
    738d8417e0 libnet: Return a 403 when overlay network isn't allowed
    a5c0fda157 libnet: Return proper error when overlay network can't be created
    deea880581 pkg/jsonmessage: use string-literals for easier grep'ing
    962a4f434f pkg/ioutils: use string-literals for easier grep'ing
    cea5829402 pkg/idtools: use string-literals for easier grep'ing
    69d77bc150 opts: use string-literals for easier grep'ing
    ff667ed932 integration: use string-literals for easier grep'ing
    efe9e90ef5 libnetwork: use string-literals for easier grep'ing
    2d2df4376b daemon/cluster: use string-literals for easier grep'ing
    ae8e3294dd client: use string-literals for easier grep'ing
    892857179a cli/debug: use string-literals for easier grep'ing
    147b87a03e daemon: use string-literals for easier grep'ing
    a3f1f4eeb0 integration-cli: use string-literals for easier grep'ing
    5bba60b1bb builder/builder-next: use string-literals for easier grep'ing
    632fc235d6 builder/dockerfile: use string-literals for easier grep'ing
    75a90f85ad gha: add note about buildkit using older go version
    fa909dfaf4 update go to go1.20.6
    bdaadec788 testutil: use dummyhost for non-tcp connections
    547ea18fbb pkg/plugins: use a dummy hostname for local connections
    597a5f9794 client: define a "dummy" hostname to use for local connections
    fee4db80a0 client: TestSetHostHeader: don't use un-keyed literals
    959889efd9 integration: Don't env cleanup before parallel subtests
    6c5144d3e5 Add t.Helper() to the cli test helper functions
    9ff2c3918c ci(buildkit): match moby go version for buildkit tests
    a4b1a5aef4 vendor: github.com/moby/buildkit@v0.11 0a0807e
    6c7f6c2d47 daemon/containerd: fix assignment to entry in nil map during commit
    0e88c57c47 integration: disable iptables in parallel tests
    a3049653c1 pkg/plugins: make unit test less time sensitive
    d3893b58ff daemon: daemon.prepareMountPoints(): fix panic if mount is not a volume
    5892aae60f docs: api  v1.28 - v1.40: add missing "force" query arg on plugin disable
    7adb590e16 docs: api v1.41: add missing "force" query arg on plugin disable
    b5aacf8161 docs: api v1.42: add missing "force" query arg on plugin disable
    b732cfd392 docs: api v1.43: add missing "force" query arg on plugin disable
    50fb65f0f5 docs: api: amend changelog for API 1.28 for "force" option
    32bcbdfe65 api: swagger: add missing "force" query arg on plugin disable
    f66ef31605 docs: api v1.41: remove outdated information from ServerVersion
    acb95e4544 docs: api v1.42: remove outdated information from ServerVersion
    335ed29345 docs: api v1.43: remove outdated information from ServerVersion
    0ef846ce2e api: remove outdated information from ServerVersion
    af25852baa docs: api v1.42: remove "ClusterStore" and "ClusterAdvertise" fields
    7a9c831e6a docs: api v1.43: remove "ClusterStore" and "ClusterAdvertise" fields
    649bb2b9b8 api: remove "ClusterStore" and "ClusterAdvertise" fields
    457399013b vendor: github.com/containerd/cgroups/v3 v3.0.2
    016ad9b3e8 c8d/prune: Handle containers started from image id
    87778af711 c8d/prune: Exclude dangling tag of the images used by containers
    8bf037b246 c8d/softDelete: Deep copy Labels
    8afe75ffa9 c8d/softDelete: Extract ensureDanglingImage
    e2bade43e7 testutil/environment: Add GetTestDanglingImageId
    e0091d6616 c8d: ImageService.softImageDelete: rename var that collided with import
    42f3f7ed86 c8d: ImageService.softImageDelete: use OCI and containerd constants
    aace62f6d3 pkg/fileutils: GetTotalUsedFds(): use fast-path for Kernel 6.2 and up
    bb50485dfd pkg/fileutils: GetTotalUsedFds: reduce allocations
    5dcea89ce1 pkg/fileutils: add BenchmarkGetTotalUsedFds
    01eb4835c9 pkg/fileutils: GetTotalUsedFds(): don't pretend to support FreeBSD
    cd44aba8db [24.0] pkg/fileutils: switch to use containerd log pkg
    ee29fd944b gha: don't fail if no daemon.json is present
    b8ee9a7829 c8d/images: handle images without manifests for default platform
    d9e097e328 vendor: github.com/opencontainers/image-spec v1.1.0-rc3
    806849eb62 seccomp: add name_to_handle_at to allowlist
    c24c37bd8a Restore active mount counts on live-restore
    c306276ab1 remove name_to_handle_at(2) from filtered syscalls
    d5e31e03b6 gha: Setup Runner: add missing sudo
    85ad299668 Dockerfile: make cli stages more resilient against unclean termination
    e84365f967 Skip cache lookup for "FROM scratch" in containerd
    96534f015d integration-cli: don't use pkg/homedir in test
    6424ae830b Dockerfile: update buildx to v0.11.0
    6055b07292 Fix missing Topology in NodeCSIInfo
    2f379ecfd6 daemon: fix restoring container with missing task
    136893e33b daemon: fix double-unlock in health check probe
    290fc0440c daemon: fix panic on failed exec start
    0556ba23a4 daemon: handleContainerExit(): use logrus.WithFields
    35a29c7328 builder: pass host-gateway IP as worker label
    210c4d6f4b daemon: ensure OCI options play nicely together
    f50cb0c7bd daemon: stop setting container resources to zero
    0a6a5a9140 daemon: modernize oci_linux_test.go
    c92fd5220a c8d: mark stargz as requiring reference-counted mounts
    5e48bbd14c contrib/busybox: Update to FRP-5007-g82accfc19
    6776279896 daemon: registerName(): don't reserve name twice
    7db3243e34 don't cancel container stop when cancelling context
    aec7a80c6f c8d: Use reference counting while mounting a snapshot
    5652c59647 testing: temporarily pin docker-py tests to use "bullseye"
    aa47b29dbc vendor: github.com/moby/swarmkit/v2 v2.0.0-20230531205928-01bb7a41396b

Bumping libnetwork to version v0.7.0-dev.3-1874-g67e0588f, which comprises the following commits:

    11eaf1f0 sync MAINTAINERS file with new moby maintainers
    dbbf124d Clean up inDelete network atomically

Bumping docker-cli to version v24.0.5-6-gb74562d91, which comprises the following commits:

    c0e376854 update to go1.20.7
    1481c8ce9 vendor: gotest.tools/v3 v3.5.0
    e97c76557 vendor: github.com/docker/docker v24.0.5
    1ee40e2c7 configfile: Initialize nil AuthConfigs
    3bd6d6902 Dockerfile: update buildx to v0.11.2
    05bf7fbcc vendor: github.com/docker/docker v24.0.5-0.20230718221249-d4a26c153000
    8b5023dd2 vendor: github.com/docker/docker v24.0.5-0.20230717072055-8443a06149b5
    2a6348d1b Dockerfile: update buildx to v0.11.1
    f4782b325 update go to go1.20.6
    7d06f6b2f vendor: github.com/docker/docker v24.0.5-0.20230714235725-36e9e796c6fc
    1447974b8 docs: rephrase section on credential stores for docker login
    46293e97f Dockerfile: update to xx 1.2.1
    bfe2ff820 cli/container: Don't ignore error when parsing volume spec
    b40742962 vendor: github.com/docker/docker v24.0.4
    79c42c0b9 vendor: golang.org/x/net v0.10.0
    a96d0a526 vendor: golang.org/x/text v0.9.0
    5c5c50d71 vendor: golang.org/x/term v0.8.0
    4bf11b756 vendor: golang.org/x/sys v0.8.0
    224c7dbec vendor: github.com/sirupsen/logrus v1.9.3
    e25d5c64c vendor: github.com/opencontainers/image-spec v1.1.0-rc3
    419e94df4 vendor: github.com/moby/swarmkit/v2 v2.0.0-20230531205928-01bb7a41396b
    2d5f041bd commandconn: return original error while closing
    520e3600e commandconn: don't return error if command closed successfully
    cd68c8f00 docker info: fix condition for printing debug information
    a78fd6ca6 docs: update link location for the overlay driver
    9cd335d44 docs: fix static ip example, network needs a subnet
    d61e4fe87 docs: fix broken link
    8e3a2942a cli/command/context: don't use pkg/homedir in test
    c3ef1cead docs: update the runtime configuration section
    44eebb8bc Dockerfile: update buildx to v0.11.0
    7ecfa2e7f Dockerfile: update gotestsum to v1.10.0
    f11f30909 update go to go1.20.5
    3a6c11773 Dockerfile: update ALPINE_VERSION to 3.17
    11af1189d docs: add "--detach-keys" example to docker run reference
    f118c05e8 docs: move "--detach-keys" example to examples section

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-moby_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index b417da4..9483f68 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -34,9 +34,9 @@ DESCRIPTION = "Linux container runtime \
 #   - The common components of this recipe and docker-ce do need to be moved
 #     to a docker.inc recipe
 
-SRCREV_moby = "d7aa1e14e521af24c0aca800a837866f514f46f7"
-SRCREV_libnetwork = "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
-SRCREV_cli = "0823df7daa197bba96f2f2a85b9cbe156df78d43"
+SRCREV_moby = "00e46f85f6e46bb4b02c33da253f901c473794e9"
+SRCREV_libnetwork = "67e0588f1ddfaf2faf4c8cae8b7ea2876434d91c"
+SRCREV_cli = "b74562d917779426ae5010dd8d8bd9140075a741"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
 	git://github.com/moby/moby.git;branch=24.0;name=moby;protocol=https \
@@ -56,7 +56,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "24.0.2"
+DOCKER_VERSION = "24.0.5"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
-- 
2.34.1


