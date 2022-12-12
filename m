Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE89CC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 08:00:08 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.37861.1670831998658516936
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FE6r67J7;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id ud5so25832917ejc.4
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZN/or33G7YIAzprI+1578zhvLbPZs4kVmonJGTN+zA8=;
        b=FE6r67J7hvtIIvFJBxt/kSCtNgYsQnyVr6KeFfw6Uepfc56NTCzoUC3enETNn22fi5
         kSHEMn5FUhVdvojVyzdt4OXMI4AqkUuMu0H0S12A0s+tPrI3HtolnveslWEYzCfrK/ih
         tSIxHoWaBViMBefRvxR6rvSxzT1fO7xLUlDFEyWch0317w7E4L9P8+Ja4RZLSV8OYNU5
         ns5rNfDc6mZdXz5TvK8g9eFJwqQw22Kfdcxp2cQPkxQbGOtYANuIBOMHcID+FdTfegrf
         EoexRJxfu3SbLmwMMfxs4Y/vSh7npbCiijT312qGMu5jWkPerGqw/U0WcmNHlkrfPggT
         r4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZN/or33G7YIAzprI+1578zhvLbPZs4kVmonJGTN+zA8=;
        b=F2q5Q4XY6c6NFt6bSkJHiosRasVdESVQ35WleCRC56jJaRuqGN0sWFNb/zbnPmojhK
         gjENl0z2xfyPOFjW4WvKKxuJ0NFrOFCqbRNSDj3QN+G80jZoPwTjQkEf8rsJOBzaVjmM
         7nbONz/tSZYKWcIAh7Dq+Ldn7zVRcJJroCf9w/QMvhcHHOQw4/CCMKhPnEj6IA3hCURM
         yFv4+m9NmqZt6Q5e0rJUgWR748jUl5Y1ajyCX7mY7DzqApNgejGPU0SwHmT19FoQIYZ/
         8CrmDBQFnYjo+XwLk46/8Jm1p2TC9eyHZUO6EHL60JiDOzrtVDKdEl6VE9oGiyXpeSpa
         aGJg==
X-Gm-Message-State: ANoB5pkdGv23Y7GJH3d5eP31TIB1fPIekLkwimhKPRUVg6TjUumCadzn
	4gZti/Z55b3uJIZ6tLVnRouWkT9Aefc=
X-Google-Smtp-Source: AA0mqf5IksIHeQgF5jlLDvWNd9H+z6lHk6iSBxukki0dq9MG+9FdLyiU8/6zorMwyqbwg2YH0rODuA==
X-Received: by 2002:a17:906:844:b0:7ad:fd3e:8fd4 with SMTP id f4-20020a170906084400b007adfd3e8fd4mr11651120ejd.69.1670831996868;
        Sun, 11 Dec 2022 23:59:56 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:56 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 17/21] containerd: update to v1.6.9
Date: Mon, 12 Dec 2022 08:58:53 +0100
Message-Id: <20221212075857.1065221-18-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
References: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 08:00:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7770

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping containerd to version v1.6.9-12-g6c41694da, which comprises the following commits:

    5af8d89ce overlayutils: Add fastpath for userxattr check
    303f608dd [release/1.6] update to Go 1.18.8 to address CVE-2022-41716
    3f9f9508d ctr export strictly match default platform
    df73acad5 [release/1.6] go.mod: Bump hcsshim to v0.9.5
    658490b78 ctr import: strictly match platform
    4907b4d72 Migrate away from GitHub actions set-output
    f1493f665 Prepare release notes for v1.6.9
    346412f5a adding support of CAP_BPF and CAP_PERFMON
    99578d1fc Update mailmap
    a956d8415 Add logging volume metrics to Containerd CRI plugin
    29e2dea50 fix pusher concurrent close channel
    8a9d69385 [release/1.6] Stats() shouldn't assume s.container is non-nil
    a9adc7938 cri: PodSandboxStatus should tolerate missing task
    b66eb726a migrate from k8s.gcr.io to registry.k8s.io
    5b40993a5 [release/1.6] upgrade containerd/continuity from v0.2.2 to v0.3.0
    f2376e659 Update container with sandbox metadata after NetNS is created
    06f82efef archive: validate digests before use
    28324c529 [release/1.6] Update go 1.18.7, addresses CVE-2022-2879, CVE-2022-2880, CVE-2022-41715
    0aeeb62cb [release/1.6] update golangci-lint to v1.19.0
    7db9d1f76 Fix linter warnings
    4dc932e62 [release/1.6] gofmt with go1.19
    7b8d679ad [release/1.6] integration: remove use of deprecated io/ioutil
    926b9c72f retry request on writer reset
    b9a35c6af Add integration tests with failpoint
    1f29fac48 Persist container and sandbox if resource cleanup fails, like teardownPodNetwork
    a85709c6c integration: simplify CNI-fp and add README.md
    d89a8d223 pkg/failpoint: add FreeBSD link and update pkg doc
    b0ce2965a integration: Add injected failpoint testing for RunPodSandbox
    a7f956d86 integration: CNI bridge wrapper with failpoint
    07c479471 pkg/failpoint: add DelegatedEval API
    4a5bc05aa runtime/v2/shim: return if error in load plugin
    71ee7de24 bin/ctr,integration: new runc-shim with failpoint
    3e2e77849 runtime/v2: manager supports server interceptor
    cb935bf49 pkg/failpoint: init failpoint package
    2fdfd564c make xattr EPERM non-fatal in createTarFile
    89e49609d remotes/docker/config: Skipping TLS verification for localhost
    b720be2ce remove stray .zuul.yaml
    6b30bc4b4 .zuul: remove the zuul because it is offline
    0f7e258ee Set grpc code for unimplemented cri-api methods
    fb753e5cd update intergration
    6ee5bb7ea bump cri-api
    ae8598615 ContainerStatus to return container resources
    d3c7e31c8 Update CRI-API
    5b44c5271 vendor: golang.org/x/crypto v0.0.0-20220315160706-3147a52a75dd
    3507d600b update runc binary to v1.1.4
    1efd8b947 ci: remove GOPROXY environment variable due to https://github.com/go-yaml/yaml/issues/887

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../containerd/containerd-opencontainers_git.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 8847f31..e95ca17 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "579a6380ec93ab92a6e7f26167fe4f18dfcf2a4b"
+SRCREV = "6c41694da9eb09c2f1f49a5a5fbec4e970cfb460"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.6.8"
-CVE_VERSION = "1.6.8"
+CONTAINERD_VERSION = "v1.6.9"
+CVE_VERSION = "1.6.9"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.38.1


