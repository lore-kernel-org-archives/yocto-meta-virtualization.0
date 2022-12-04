Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB6AC3A5A7
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 21:38:48 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.139153.1670189921598182484
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Dec 2022 13:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dPK8tBPt;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id n21so23539280ejb.9
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Dec 2022 13:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vr+LfWjYiZiFHmWBuLiWlR1BDmdscFB7+bN9zyYt1kE=;
        b=dPK8tBPtOQVzFxUgWh31PFlN+N1Aap3CUxVj+rGFDlIYWJD4oxfZ/Vl7uCbIEZbBNw
         XNRVn8oa8hCNalPjGAutICX2ozc92BUd92Obw/BxGWh38aAG4pJfLu5dnwHqqDJjD3Fu
         hbhmF/k74duElzS309VSuVFgRF1qBEewXQgYeuCIrfZP0VhO84M2eavirraqaTaPiBP8
         44Ir8gOFbhDI0xT5rqG8TzAn3GOelR20ItviD51bamiwsibrhMh3px6r1WRdydvOTc7V
         TZ5TNAjhBNijsBKtcjzfKQP9iw8yYEtkNK85tgduiFqLXn8ff84qyN7G6NAR5lYbicta
         VLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vr+LfWjYiZiFHmWBuLiWlR1BDmdscFB7+bN9zyYt1kE=;
        b=x/9FtgkFie0sHBbPaVqt9nywkTD2Bc7++jivv/4jVCzCAlLpjpl/blamsMuwt2vskV
         rqFS8fHH0mxS6VIAIfDS+Sy8u0BIN2aVIa/bIDiJuZI1+iJGDBqPXJMePpzgEx1f5Zc8
         y+ECgDV73nw6fFnVirxmDwsmLDAPoRkunfigRZUzfBx1HFB6aqjWz7TB9Dng3w8KP/Xr
         8cppTEyy6RtgZ5ZWuomZb8rWUWZ2rMWbKL4B0eaUKxXU81p2S2OZExsLGSnmZslHRlBe
         4GaONMU2KZe9EOgsGSO96UKarTXjZZLMwdZXH6knA8SMPDSBhqUrDh1rVmr4eglWHPOX
         KWfg==
X-Gm-Message-State: ANoB5pn9RnVrzJ3rnedLJb7KpUoi2BwtXlVE+jFAwt0FBLC9v5BW1Z2Y
	+mD7EGbq/rBgAMq8f6GPtDFGnF8C+aY=
X-Google-Smtp-Source: AA0mqf7/FMwjRAnEUDpJqsgzLF8d9ktd6TvIldlNXTlDAND40biPhVqf1KcGSTxsoBZq5Kh2spI95Q==
X-Received: by 2002:a17:906:5a8b:b0:7c0:bf7c:a56b with SMTP id l11-20020a1709065a8b00b007c0bf7ca56bmr10525471ejq.306.1670189919871;
        Sun, 04 Dec 2022 13:38:39 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id dt13-20020a170906b78d00b0078d3f96d293sm5544179ejb.30.2022.12.04.13.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 13:38:39 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][kirkstone][PATCH 2/3]  containerd-opencontainers: update to 1.6.9
Date: Sun,  4 Dec 2022 22:38:08 +0100
Message-Id: <20221204213809.483131-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204213809.483131-1-adrian.freihofer@siemens.com>
References: <20221204213809.483131-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Dec 2022 21:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7735

1c90a4424 (tag: v1.6.9) Merge pull request #7573 from samuelkarp/release/1.6.9
96929a5d3 Merge pull request #7574 from swagatbora90/backport-cap-bpf-perfmon
f1493f665 Prepare release notes for v1.6.9
346412f5a adding support of CAP_BPF and CAP_PERFMON
99578d1fc Update mailmap
8b9c35a19 Merge pull request #7571 from sophieliu15/release/1.6
a956d8415 Add logging volume metrics to Containerd CRI plugin
8658d0b51 Merge pull request #7562 from dcantah/cp-concurrent-closech
29e2dea50 fix pusher concurrent close channel
9a194f78b Merge pull request #7557 from kzys/backport/1.6/stats-nil
9edb14386 Merge pull request #7551 from samuelkarp/ip-leakage-flake/1.6
8a9d69385 [release/1.6] Stats() shouldn't assume s.container is non-nil
74e9e4c43 Merge pull request #7549 from SergeyKanzhelev/switchToRegistry
a9adc7938 cri: PodSandboxStatus should tolerate missing task
b66eb726a migrate from k8s.gcr.io to registry.k8s.io
6afbeac96 Merge pull request #7518 from kzys/backport/1.6/continuity-fix
5b40993a5 [release/1.6] upgrade containerd/continuity from v0.2.2 to v0.3.0
dccb15294 Merge pull request #7505 from qiutongs/backport-netns-1.6
f2376e659 Update container with sandbox metadata after NetNS is created
d9e2ba255 Merge pull request #7490 from samuelkarp/archive-dgst-validate/1.6
06f82efef archive: validate digests before use
1eb637f95 Merge pull request #7475 from thaJeztah/1.6_bump_go_1.18.7
6496ac61e Merge pull request #7461 from akhilerm/cherry-pick-6995-1.6
28324c529 [release/1.6] Update go 1.18.7, addresses CVE-2022-2879, CVE-2022-2880, CVE-2022-41715
0aeeb62cb [release/1.6] update golangci-lint to v1.19.0
7db9d1f76 Fix linter warnings
4dc932e62 [release/1.6] gofmt with go1.19
7b8d679ad [release/1.6] integration: remove use of deprecated io/ioutil
a91dd679b Merge pull request #7456 from qiutongs/backport-ip-leakage-1.6
926b9c72f retry request on writer reset
b9a35c6af Add integration tests with failpoint
1f29fac48 Persist container and sandbox if resource cleanup fails, like teardownPodNetwork
6338ef8d1 Merge pull request #7455 from qiutongs/backport-failpoint-1.6
a85709c6c integration: simplify CNI-fp and add README.md
d89a8d223 pkg/failpoint: add FreeBSD link and update pkg doc
b0ce2965a integration: Add injected failpoint testing for RunPodSandbox
a7f956d86 integration: CNI bridge wrapper with failpoint
07c479471 pkg/failpoint: add DelegatedEval API
4a5bc05aa runtime/v2/shim: return if error in load plugin
71ee7de24 bin/ctr,integration: new runc-shim with failpoint
3e2e77849 runtime/v2: manager supports server interceptor
cb935bf49 pkg/failpoint: init failpoint package
2cbb524b9 Merge pull request #7447 from estesp/cp-7094-1.6
2fdfd564c make xattr EPERM non-fatal in createTarFile
7b93a228e Merge pull request #7438 from Iceber/skip_verify_1.6
89e49609d remotes/docker/config: Skipping TLS verification for localhost
bf1b93eac Merge pull request #7427 from fuweid/16-cp-7369-7416
b720be2ce remove stray .zuul.yaml
6b30bc4b4 .zuul: remove the zuul because it is offline
3228848c6 Merge pull request #7421 from ruiwen-zhao/release-1.6-grpc
0f7e258ee Set grpc code for unimplemented cri-api methods
462caf1eb Merge pull request #7410 from ruiwen-zhao/container_resource_1.6
fb753e5cd update intergration
6ee5bb7ea bump cri-api
ae8598615 ContainerStatus to return container resources
d3c7e31c8 Update CRI-API
23d2278a2 Merge pull request #7340 from dcermak/backport-golang-x-crypto-vendor
5b44c5271 vendor: golang.org/x/crypto v0.0.0-20220315160706-3147a52a75dd
de1a1905d Merge pull request #7333 from thaJeztah/1.6_backport_runc
3507d600b update runc binary to v1.1.4
579a6380e Merge pull request #7299 from samuelkarp/ci-workflow-goproxy/1.6
1be2cb348 Merge pull request #7298 from deckhouse/docker-compat-1.6
1efd8b947 ci: remove GOPROXY environment variable due to https://github.com/go-yaml/yaml/issues/887
0448673af Do not append []string{""} to command to preserve Docker compatibility
9ff72800f Merge pull request #7274 from mxpv/critest
5c230ece0 Fix cleanup in critest
026ac1c17 Merge pull request #7268 from thaJeztah/1.6_backport_no_tun
9cd3357b7 (tag: v1.6.8) Merge pull request #7263 from dmcgowan/prepare-1.6.8
ed9d3dc37 oci: WithDefaultUnixDevices(): remove tun/tap from the default devices
3364f411e Prepare release notes for v1.6.8
a76f3c831 Merge pull request #7261 from samuelkarp/release-workflow/1.6
390920429 release workflow: remove Go setup action
cf48ba6e8 release workflow: increase timeout to 30 minutes
76f5db42f Merge pull request #7260 from samuelkarp/fix-7255/1.6
57873e652 release: rollback Ubuntu to 18.04 (except for riscv64)
0197261a3 (tag: v1.6.7) Merge pull request #7250 from dmcgowan/release-1.6-update-build-timeout
eccb82f6d Update release build timeout to 20 minutes
5f242b5bf Merge pull request #7225 from dcantah/v1.6.7-rnotes
6a854d4b5 Update mailmap
61612e1a2 Prepare release notes for 1.6.7
78f438957 Merge pull request #7244 from dcantah/update-go-1.17.13
d199ee462 Update golang to 1.17.13
d97553c9a Merge pull request #7242 from dcantah/cp-windows-svc-osstderr
0578d20c5 Change os.Stderr reassign for Windows service
7438c0a7b Merge pull request #7230 from estesp/cp-7206
2e236d4fc Merge pull request #7227 from dcantah/cp-hpcstats-test
12cae4961 Update Vagrant CI to macos-12
bc4091aae chore: bump macos runner version
cb73bd050 Windows HostProcess container CRI stats test
ac388525a Add validations for Windows HostProcess CRI configs
d97257190 Merge pull request #7200 from dcantah/1.6-hcsshim-v0.9.4
0007f40fe [release/1.6] go.mod: Bump hcsshim to v0.9.4
6ae451b97 Merge pull request #7217 from estesp/update-fedora
c9607e78c Update Fedora version to 36
1f5ca004e Merge pull request #7170 from AkihiroSuda/riscv64-1.6
2952b66c0 CI: add riscv64 builds
6b2dc9a37 release/Dockerfile: update Ubuntu to 22.04 for supporting riscv64
745dc07c4 seccomp: support riscv64
c2f841f21 Create ppc64le release
73b85c0c5 Merge pull request #7171 from AkihiroSuda/cherrypick-6810-1.6
0a0a154d6 Merge pull request #7172 from AkihiroSuda/cherrypick-7149-1.6
86b55bd8d seccomp: allow clock_settime64 when CAP_SYS_TIME is added
f3da3e51f allow ptrace(2) by default for kernel >= 4.8
604d0bdf5 Merge pull request #7160 from thaJeztah/1.6_update_go
aa1101068 [release/1.6] update golang to 1.17.12
4e92d8e7e Merge pull request #7131 from kzys/backport/1.6/7126
37dfc5c9d [release/1.6] Fix WWW-Authenticate parsing
288440aad Merge pull request #7133 from kzys/backport/1.6/7106
fa2016d58 [release/1.6] Downgrade MinGW to version 10.2.0
6309dc487 Merge pull request #7051 from Iceber/fix-run-controller-manager-1.6
99c56d217 ctr: fix label args used in NewContainer
3dce36e42 Merge pull request #7045 from kzys/backport/1.6/7022
51de785f8 [release/1.6] Make building static binaries simpler
9abd4b3f3 Merge pull request #7036 from thaJeztah/1.6_update_runc2
2ea4e6348 update runc binary to v1.1.3

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../containerd/containerd-opencontainers_git.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 35a27d4..6d0a287 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "4e92d8e7e439530f5bb17e57a77481e9aa3da851"
+SRCREV = "6c41694da9eb09c2f1f49a5a5fbec4e970cfb460"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https \
            file://0001-Add-build-option-GODEBUG-1.patch \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.6.6"
-CVE_VERSION = "1.6.6"
+CONTAINERD_VERSION = "v1.6.9"
+CVE_VERSION = "1.6.9"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.38.1


