Return-Path: <ali.oezaslan@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1674CE7AA3
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 16:31:43 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.65619.1695659502171156192
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Sep 2023 09:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rJ/p8VRf;
 spf=pass (domain: linaro.org, ip: 209.85.128.54, mailfrom: ali.oezaslan@linaro.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-404800222d2so17038315e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Sep 2023 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695659500; x=1696264300; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eEirU3yQbjp0TcA+ScRI/4RW2/A9wHhtAUq6N26xrvw=;
        b=rJ/p8VRfpqE2m8uI3VR65VRXYPJ/RGm6TR+9s7PY6dInGPgOytijytqZnIvUo5wAYf
         l2dLVCdVsMVgbjkGH0hSPv07MoE4cJ2AiN/dNZasoFI0k/wNHcaAbIGcTvqslqLM34uP
         uIcqAI+h7/eud6/fYExiA7B6j2L+TzTPQjLYVCFnB9WFws7brS1NZc03pHrq13wFA0kL
         syI9KgZh6vdlv3gOpFuawJPstlG4H6e2lgrxZPIPii+kfy9NeCnBkVJxSEeC7t0yl//0
         IXSb45tKdfxqaH3Uvhrd5cVjReJTIREq5DYX5sqeM8EvDBPBj2H92u0nsZLzrnv8JvZP
         iJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695659500; x=1696264300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEirU3yQbjp0TcA+ScRI/4RW2/A9wHhtAUq6N26xrvw=;
        b=ZHZtkucxOJZDHj17Q7BVt5LbDPEbBx3F2hpP9NYzOjpNTCISMu+q1oXbXogZRTxwVH
         0PArzEhYJ6BbrIO9yvB5OZO28mGSXJagBQx2IbyU4gqKLkZFe0AFJG8ixayyJZAAFFS6
         s89HWGlvxF1kv4PXbzx96lBm1V5BQvkQ8+AgbcAnCU2XWRBIpIYuJZKp2T54yxA15s57
         ToKpd1HmahZU96LNlADEMHZh3HP1DlP30fDgarvl7r9oMxMh3+lvVrlzzeHn6fJQzK/1
         n2fUKRvdW1CJ1QlgFBipMUQqkFrdVDvw9zWJjkyMBDKuFZ8dxJ8GwumjMnyd/X72ncyA
         7MAw==
X-Gm-Message-State: AOJu0YyqBbDYqQdcHDNVz+Xjw2Zt51iHDa5xKWwgmWAC4P8YFKpoH2au
	S98sLurJOx6Cz4mlVU0WPEGAyH4edauFV0h2qI0=
X-Google-Smtp-Source: AGHT+IHnxQH8hfQCq8j3Aej+Jlsmttx00y5ZTYcaT0C2NxQ9r6eTFbnkY2m3odZ5XFuw2EbwbR+9WQ==
X-Received: by 2002:a05:600c:1c2a:b0:404:7606:a871 with SMTP id j42-20020a05600c1c2a00b004047606a871mr6859410wms.2.1695659500274;
        Mon, 25 Sep 2023 09:31:40 -0700 (PDT)
Received: from PW05BKJD.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b003feae747ff2sm15426908wmh.35.2023.09.25.09.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:31:40 -0700 (PDT)
From: Ali Can Ozaslan <ali.oezaslan@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Cc: patches@linaro.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][mickledore][PATCH 1/2] moby: update to v24.0.2
Date: Mon, 25 Sep 2023 17:31:15 +0100
Message-Id: <20230925163116.1060-1-ali.oezaslan@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Sep 2023 16:31:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8320

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping moby to version v24.0.2-56-gd7aa1e14e5, which comprises the following commits:

    5652c59647 testing: temporarily pin docker-py tests to use "bullseye"
    789a8755b8 run `getent` with a noop stdin
    f7298b326e vendor: github.com/sirupsen/logrus v1.9.3
    1c18ad6ca6 vendor: github.com/rootless-containers/rootlesskit v1.1.1
    ae4a10df67 update RootlessKit to v1.1.1
    24c882c3e0 update go to go1.20.5
    b3133d7471 contrib/check-config: move xt_bpf check to overlay section
    8c552012ae contrib/check-config: check for xt_bpf
    61d547fd06 Dockerfile: Move dockercli to base-dev
    e5fbc3f75a hack/cli.sh: Quiet origin cleanup
    1a078977e1 Dockerfile/shell: Install buildx cli plugin
    c4198e6053 Dockerfile: Use separate cli for shell and integration-cli
    647ba03224 builder-next: Set moby exporter as default
    961fe27408 c8d/handlers: Handle error in walkPresentChildren
    087cf6f238 c8d/load: Don't unpack pseudo images
    0b9d68f59d c8d/load: Use walkImageManifests
    cbf0779bfc c8d/list: Use walkImageManifests
    0139309fef c8d: Add walkImageManifests and ImageManifest wrapper
    e1c7956764 Dockerfile: use COPY --link for source code as well
    75afe3201b containerd: add c8d version and storage-driver to User-Agent
    8018ee4689 dockerversion: DockerUserAgent(): allow custom versions to be passed
    ed376a603f dockerversion: remove insertUpstreamUserAgent()
    1d45ea52f4 dockerversion: simplify escapeStr()
    a27b0381a6 dockerversion: add a basic unit-test
    1fc19772e0 Make sure the image is unpacked for the current snapshotter
    4217d9ea0a Dockerfile: use COPY --link to copy artifacts from build-stages
    4c6b8e737f added alias validation
    e370f224ae fixing consistent aliases for OCI spec imports
    ac1a867282 vendor: github.com/mistifyio/go-zfs/v3 v3.0.1
    2949fee1d3 containerd: set user-agent when pushing/pulling images
    f9c68e5fbc libn: fix resolver restore w/ chatty 'iptables -C'
    3452a76589 libnetwork: fix sandbox restore
    fec801a103 libnetwork: log why osl sandbox restore failed
    d9e39914a7 Fix npe in exec resize when exec errored
    042f0799db libn/d/overlay: support encryption on any port
    ec8ec9056c builder/remotecontext: deprecate CachableSource, NewCachableSource
    7a4ea19803 libcontainerd: work around exec start bug in c8d
    ae6e9333c0 vendor: github.com/moby/buildkit v0.11.7-0.20230525183624-798ad6b0ce9f
    0d9acd24fe c8d/inspect: Fill `Created` time if available
    04eccf8165 vendor: github.com/containerd/go-runc v1.1.0
    d64bab35ee daemon: lock in snapshotter setting at daemon init
    329d671aef Dockerfile: temporarily skip CRIU stage
    4cc2081119 integration: Add TestImageInspectEmptyTagsAndDigests
    27df42255c hack: Rename .ensure-emptyfs to .build-empty-images
    9ee7d30aef hack/ensure-emptyfs: Create dangling image
    8a4b7c5af8 Add testenv.UsingSnapshotter utility
    a753ca64e2 hack/make/.binary: don't use "netgo" when building Windows binaries
    5276c2b6e0 c8d/pull: Use same progress action as distribution
    baf1fd1c3f libnetwork: check for netns leaks from prior tests
    992dc33fc5 libnetwork/osl: restore the right thread's netns
    ef1545ed4a libnetwork: leave global logger alone in tests
    876f5eda51 libnetwork: make resolver tests less confusing
    47a3dad256 c8d/list: Show layerless images
    0869b089e4 libnetwork: just forward the external DNS response
    3467ba6451 reorder load funcs to match newServiceConfig()'s order
    f9b886c01b add mirror to daemon reload test for insecure registries
    07140c0eca build: use daemon id as worker id for the graph driver controller
    d5ad186d49 ci(bin-image): distribute build across runners
    4d924c35f7 api/server: allow empty body for POST /commit again
    68b7ba0d03 api/inspect: Fix nil RepoTags and RepoDigests
    5ea7b8d091 fix: `docker pull` with platform checks wrong image tag

Bumping docker-cli to version v24.0.2-9-g0823df7da, which comprises the following commits:

    11af1189d docs: add "--detach-keys" example to docker run reference
    f118c05e8 docs: move "--detach-keys" example to examples section
    f66f7ed7f cli/command: fix GoDoc referencing wrong const
    2814c01b0 Dockerfile.vendor: update GOPROXY to use default with fallback
    32f66cbe5 vendor: github.com/docker/docker v24.0.2
    dc4707edb [24.0] vendor: github.com/docker/docker v24.0.1
    298e67926 docs: fix example for proxies in daemon.json
    9175ffa9b man: remove devicemapper from examples
    beb0330a7 Correct "ps --no-trunc" example output
    405be9063 docs: remove AuFS from glossary
    7a269817b docs: remove Docker Toolbox from glossary
    41ef7c45c docs: remove boot2docker and docker-machine from glossary
    c184a61da docs/deprecated: remove "disabled by default" for AuFS, overlay
    e7a60449f docs: remove aufs and legacy overlay
    77541afea contrib/completion: remove aufs, legacy overlay
    e67a7acd0 docs/deprecated: remove .patch release from deprecation status
    fb6ae356c vendor: github.com/docker/docker v24.0.0-rc.3

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-moby_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 70f3692..b417da4 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -34,9 +34,9 @@ DESCRIPTION = "Linux container runtime \
 #   - The common components of this recipe and docker-ce do need to be moved
 #     to a docker.inc recipe
 
-SRCREV_moby = "821e4ec4c7b13c28dbb1424f024980aed4535384"
+SRCREV_moby = "d7aa1e14e521af24c0aca800a837866f514f46f7"
 SRCREV_libnetwork = "3f0048413d95802b9c6c836eba06bfc54f9dbd03"
-SRCREV_cli = "98fdcd769bcd137f7538f898b37348f919536ea4"
+SRCREV_cli = "0823df7daa197bba96f2f2a85b9cbe156df78d43"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
 	git://github.com/moby/moby.git;branch=24.0;name=moby;protocol=https \
@@ -56,7 +56,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "24.0.0"
+DOCKER_VERSION = "24.0.2"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
-- 
2.34.1


