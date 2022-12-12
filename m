Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CBFC10F31
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.37856.1670831988598671637
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vd5S7jd2;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id bj12so25753506ejb.13
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0JCj1oHAqLY9vPF1VHBy5iUvKvxipN2CFvXR6EFPbI=;
        b=Vd5S7jd2Y/Sww4yRZzYivUxQojwZQHserkILnE9RdL8pLmIL2tb3CfcMS8gQ80iJag
         5xGuqG8uHgRIotzaOeYLj7IvhPGbdo1EF/YLmjPdrMALzQ8oiSPmEw7O6goBzcnyRHNN
         NLhxCh06YuvVmN+aE7eL05WGBNVOQBHCOoeA7W18nLF2fq10cdVgymM6LQijLN+bllyK
         M+1Tf3ZlQ62M+8I6iaBoM4NelMcUZ+qBxmuRNtAtX/SKvqJtltc5YJ53SDzEJaXBQB5v
         apAm2JyEqfeE3RRaunu394qvz8xvaClafnj8K8tSvg9R54/DSDzud8YnmdusixU9zWkx
         t71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0JCj1oHAqLY9vPF1VHBy5iUvKvxipN2CFvXR6EFPbI=;
        b=wj42UwEEejkXDyQ7YOGl2bwil8pZyBeEaP1W3HaGMJbr5yRrBl69ANREKaLbqTRpOL
         nk7nbfQcdeM0I1TFUTsP44BRRUMowLKOyeShaAurGyTJyj7Sm7HvNDLpI0LKUQqM0PlM
         6RRyBCmfR6y5v5QVOCT4NsW2ClqPujcspwAiRJLrxXH6qfcTDsCvedXHGLloxizPS4BE
         bGQCuSpWgn1Itn7dsP2rftj/8oumCGlAPryZtL+gnUpmp+N2IAhXfxR7pZMkEIaqfRde
         PXZyRnS9nvigaPfhqTIzueOalQqS/DDXID8LgjQs5IMp+Fv3td90xRPHl4SzeM9QPXfd
         Jjdg==
X-Gm-Message-State: ANoB5pmS51xV+6wx/0YzgvRMP1wvcP9EAGSBORU+Nf05DLhgJNbPA9cW
	N9/Iz/bXeg95qbv76wnAIsgPMc25K34=
X-Google-Smtp-Source: AA0mqf7K0Ey9sU6jH84k/0LtdzgvGDDmXa8Z+KhpQhOoGi65Z0QH990KWDGEAWV73xQ+rDRFnh/ugw==
X-Received: by 2002:a17:907:d503:b0:7c0:a99c:485c with SMTP id wb3-20020a170907d50300b007c0a99c485cmr12877512ejc.68.1670831986854;
        Sun, 11 Dec 2022 23:59:46 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:46 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 03/21] docker-ce: update to 20.10.16
Date: Mon, 12 Dec 2022 08:58:39 +0100
Message-Id: <20221212075857.1065221-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7756

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
 recipes-containers/docker/docker-ce_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 12bc73c..27cb962 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -31,8 +31,8 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_docker = "906f57ff5b7100013dfef066ea8fe367706468df"
-SRCREV_libnetwork = "64b7a4574d1426139437d20e81c0b6d391130ec8"
+SRCREV_docker = "f756502055d2e36a84f2068e6620bea5ecf09058"
+SRCREV_libnetwork = "339b972b464ee3d401b5788b2af9e31d09d6b7da"
 SRCREV_cli = "62eae52c2a76f4c1dcf79dfc7b5ea3bf5eebab8b"
 SRCREV_FORMAT = "docker_libnetwork"
 SRC_URI = "\
@@ -51,7 +51,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "20.10.12-ce"
+DOCKER_VERSION = "20.10.16-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 CVE_PRODUCT = "docker"
-- 
2.38.1


