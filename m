Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98197C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:48 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.37855.1670831987304699300
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WLNqYdTn;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id vv4so25830799ejc.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkVmXNGEBgC7B0ALfZLW2xTyZmFoDPtvRJ7EFic6uWY=;
        b=WLNqYdTnjGfOkL9Z2kVJ1SW+yWfiZV8QxK/KNUuaK9TXQfzTPTcPLByMIPjzPyOoNI
         oiGhWKECwieCaQl5EpURvdDk31WuJdMqvRs8UXogIN7H2JZQM9J4tOpyYxfQLQ9ZRwAo
         Po6auW1TXwH46Ciric3/4OlyIMY21ZMJiwXU+IjZk860Rpbhmqug9JE9ANFQBvGZfMjX
         EmCKyPVN5GuAOXWi6qCUqmYeMffvHQfxhHgXHJkU6jheQ/S6IFjRx7Jf3b1ygWpOrNCB
         eCJgISJgTSyoTyCoup/fGvL+4lUhW1fMYXgH4B8HVq8JYYo4RfzXRONoNcbbPXT99oca
         KoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkVmXNGEBgC7B0ALfZLW2xTyZmFoDPtvRJ7EFic6uWY=;
        b=lMCdaQOeKvmC58selnSYroHNoexQHg7wc36zo6WIF0rb4gO0RvFqb9DnHiCEYEG8PS
         W9jnYWSl1zQlgKV5HXiEixuEHCOxtD4+5YKeSPhXLd01Ieo2siA/lo92WeSx7UAbV8OP
         M2vAGF8zSdVZ9FmcyCaJLr52ypUwmaYrXSdMGA4lkQ85Ijl/YG0/7ge8OuEnFYPML89f
         xYCT8rzNFjg7x7UXFSYHnkmiIRXN4N3p09KqIR3YB2KKDs7ULP8o3MM/oyV+3IisT3Ur
         qdQfjbIFYSuOY15JeK2qQXGT5f8UZFy67kVmKT0T2/IdJ5H//Daah2j8FmFX7Y7mn6Jp
         rfBg==
X-Gm-Message-State: ANoB5pkd6lVIquYE8S3Yd6deUzuWCTRD3jybz2+yvDxkKSBsflbWncz0
	+gx6KV4QMCSsbQJb7N5qPqkFjA+ab8I=
X-Google-Smtp-Source: AA0mqf7yWTctY8Az8mjbh4lVEekUCDiwPr+3pMx4WXc8e66uDzNGBCVvSnptv4PSAbrfDyJmK2S8gw==
X-Received: by 2002:a17:906:351b:b0:7c0:a6a9:64e9 with SMTP id r27-20020a170906351b00b007c0a6a964e9mr16540781eja.36.1670831985507;
        Sun, 11 Dec 2022 23:59:45 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:45 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 01/21] docker/moby: update to 20.10.16
Date: Mon, 12 Dec 2022 08:58:37 +0100
Message-Id: <20221212075857.1065221-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7754

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping moby to version v20.10.16, which comprises the following commits:

    a15acb4bd6 [20.10] vendor: golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
    5f2e0b79ad [20.10] update golang to 1.17.10
    be7855fdbe vendor: update github.com/containerd/cgroups and github.com/cilium/ebpf
    414a9e24a7 update containerd binary to v1.6.4
    47b6a924b6 update containerd binary to v1.6.3
    6d7c2b2d26 update containerd binary to v1.6.2
    91708bf704 update containerd binary to v1.6.1
    53ae17008e Revert "[20.10] update containerd binary to 1.5.11"
    961b9a78d5 update runc binary to v1.1.1
    97972dac5f update runc binary to v1.1.0
    033a819714 [20.10] update golang to 1.17.9
    a80884126b Jenkinsfile: add workaround for CVE-2022-24765
    09d6fcdfec update to go 1.17.8 to address CVE-2022-24921
    5957684b2c Update Go to 1.17.7
    55b72c70ba Update Go to 1.17.6
    fdf3020bd5 Update Go to 1.17.5
    36e164ba80 Update Go to 1.17.4
    ecfba8f588 Update Go to 1.17.3
    4e14dcc125 Update Go to 1.17.2
    c32b5ece31 Update Go to 1.17.1
    7096508811 vendor: update archive/tar to match Go 1.17.0
    a1150245cc Update to Go 1.17.0, and gofmt with Go 1.17
    95cc7115fb hack/vendor.sh: allow go version to be specified with .0
    949c33b1c5 vendor: golang.org/x/sys  63515b42dcdf9544f4e6a02fd7632793fde2f72d (for Go 1.17)
    8392285876 vendor: golang.org/x/sys d19ff857e887eacb631721f188c7d365c2331456
    4e81bcf380 Makefile: update buildx to v0.8.2
    74e699c8d3 Makefile: update buildx version to v0.6.0
    bc3cc2e7ac Makefile: install buildx from binary release, instead of building
    492fac20af api: docs: fix indentation of HostConfig.SecurityOpt (v1.39-v1.41)
    3cba2682d8 api: docs: move ContainerWaitResponse to definitions (v1.39-v1.41)
    55e71450ae api: docs: move VolumeCreateOptions to definitions (v1.39-v1.41)
    c54362cd64 api: docs: move Volume examples inline (v1.39-v1.41)
    c60ff9b296 doc: server API Correct ImagesCreate - platform parameter added in 1.32
    7a45f7a8cc docs: cleanup swagger API with multiple examples (v1.25-v1.41)
    29bb9204bf api: docs: add IPAMConfig on IPAM (v1.41)
    77f6564369 api: docs: document MountPoint fields (v1.25-v1.41)
    51ea235ab8 api: docs: remove deprecated RootFS.BaseLayer (API v1.25-v1.41)
    3d6b4ae572 Correct type of Mounts in ContainerSummary in docs (v1.25-v1.40)
    6e8b9809b7 Correct type of Mounts in ContainerSummary in docs
    621a98dac0 api: docs: fix warning about comment indentation (API v1.40-v1.41)
    bb9ef98060 api: docs: update docs for /images/{name}/json (API v1.39-v1.41)
    88ca5cec4e daemon: fix error-message for minimum allowed kernel-memory limit
    3ea996abd7 docs: add missing KernelMemoryTCP to api v1.40 and v1.41
    b475bc95cd docs/api: add missing 400 response for POST /containers/{id}/wait
    ae07b3cc96 docs/api: update /containers/{id}/wait "condition" parameter (v1.30-v1.41)
    19555fa92d [20.10] vendor: github.com/docker/distribution v2.8.1
    32fe0bbb91 daemon: use RWMutex for stateCounter
    ed8fb00b65 errdefs: move GetHTTPErrorStatusCode to api/server/httpstatus
    3bd611d7a5 log error message when receiving an unexpected type error
    7dfe7a1752 [20.10] update containerd binary to 1.5.11
    af953d2f38 [20.10] vendor: containerd 7cfa023d95d37076d5ab035003d4839f4b6ba791
    5f9753ae73 client: remove containerd "platform" dependency
    4df345e65d client: remove unused Platform field from configWrapper
    dd38613d0c oci: inheritable capability set should be empty
    2825bf7123 Only check if route overlaps routes with scope: LINK
    f5c56eaca8 [20.10] bump swarmkit for config size increase
    ce3b6d1ae9 distribution: retry downloading schema config on retryable error

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/docker/docker-moby_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 0a0ffd6..4685550 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -34,7 +34,7 @@ DESCRIPTION = "Linux container runtime \
 #   - The common components of this recipe and docker-ce do need to be moved
 #     to a docker.inc recipe
 
-SRCREV_moby = "906f57ff5b7100013dfef066ea8fe367706468df"
+SRCREV_moby = "f756502055d2e36a84f2068e6620bea5ecf09058"
 SRCREV_libnetwork = "64b7a4574d1426139437d20e81c0b6d391130ec8"
 SRCREV_cli = "a224086349269551becacce16e5842ceeb2a98d6"
 SRCREV_FORMAT = "moby_libnetwork"
@@ -54,7 +54,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.12"
+DOCKER_VERSION = "20.10.16"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker"
-- 
2.38.1


