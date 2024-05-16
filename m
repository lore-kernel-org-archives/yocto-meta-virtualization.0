Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939C6C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 13:40:28 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.14035.1715866825693887113
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 May 2024 06:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=MWpFz6xd;
 spf=pass (domain: snapchat.com, ip: 209.85.208.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-572e48f91e9so3760595a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 May 2024 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1715866823; x=1716471623; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBbEpMk10aMhMFeO9ZNSv4j8qwk94gG9/fftGstV7L4=;
        b=MWpFz6xdy2c2gZstjlBV0FkmI90RNoCdgRj/ckx2nk+kAFtg1F06ZP7P9jK0x7Xbpc
         G52qemTOiSDMy4/B/FaDWHBAV1+TzVALoUcuQuECteQJ9FplhtHRmYzzdPFR6vMgGcrw
         jqIRGiaMWAuFiHt/hZAy7QbDEbaz2MD13i4wA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715866823; x=1716471623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBbEpMk10aMhMFeO9ZNSv4j8qwk94gG9/fftGstV7L4=;
        b=BACWBCt6qj+Q572z+P30zgsoFavoxc33ZjD9w7Lo7zgidFSlhAFPTe3kbthLK3sNqR
         +/AKWtsEn9KeqmFSaEQA9b4dRI1wchTX5rvVUQicGn/ey4o3x3dXFENbAA6YDBqI0hf5
         MKaYedV85WtAG/GDxa3ySz00q8aw7oH2aMZItupOLiG+AjxVTX8SjlGbnWf5/EbkiuCG
         NKeCnomcPYxw0ijP1NNItP1PSeX46rporIplcJO6FVSkJDnZz+WFXTtV5HBBdV5tcWzS
         +6YIZ/6kgBlv8L2daDVTuFkcfSb26Zt8AWdreYjlU6CNT/RKCNFnqLW7V4tnN2XjegKY
         KThg==
X-Gm-Message-State: AOJu0YzUOxH2/ChFQ0TUaQFcoq/B2A7iFnGyRnhBQ9y12K/l7xRSJQHO
	Ia3DCqkSzyhXfl4i0DdXF4ORPCY8Eowl28ENVcPYt69E1mfktSYci5m6a66yXPL9rKZu6wHHCAS
	SafXnZc0Q
X-Google-Smtp-Source: AGHT+IGbhZmjUqk/50j1MPbZ4XUR/9Yt32DR3jyUN5HcDuPZL55VF0JDOBXij6jJVA46hq3RELnYUw==
X-Received: by 2002:a50:99c7:0:b0:56e:2e10:7dad with SMTP id 4fb4d7f45d1cf-574f831f472mr3465065a12.35.1715866823273;
        Thu, 16 May 2024 06:40:23 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733bea65aasm10523148a12.5.2024.05.16.06.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 06:40:22 -0700 (PDT)
From: ecordonnier@snap.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-virtualization][PATCH] crun: update to v1.15
Date: Thu, 16 May 2024 15:40:07 +0200
Message-Id: <20240516134007.653981-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 May 2024 13:40:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8725

From: Etienne Cordonnier <ecordonnier@snap.com>

Bumping crun to version 1.15-0-ge6eacaf, which comprises the following commits:

    e6eacaf NEWS: tag 1.15
    f904485 Merge pull request #1459 from lsm5/packit-centos
    08b5e78 Packit: Enable c10s downstream sync, rhel / centos separation in tests
    73cb769 Merge pull request #1456 from martinetd/cleanup_cgroup_mount
    4618d50 status: rmdirfd: try harder to remove mount points
    c72bf7f linux: cgroups: cleanup unused mount if move failed
    1f5fa44 Merge pull request #1457 from giuseppe/fix-compiler-warning
    ff321e1 tests: install slirp4netns
    a946f04 utils: fix a compiler warning
    6df8cef Merge pull request #1449 from lsm5/rpm-rhel-wasm
    aa72cc4 Packit/TMT: add centos-stream-10, cleanup tests
    d075e53 Merge pull request #1455 from giuseppe/update-npm
    f39bc4a tests, oci-validation: use perl tap driver
    f5548f2 tests, oci-validation: use tap-18
    18e84a1 tests, oci-validation: use git clone
    b4539b5 Merge pull request #1453 from saschagrunert/s390x-musl
    49090f2 Build s390x binaries using musl libc
    8cd3e02 Merge pull request #1454 from saschagrunert/clang-format
    307d35e Fix clang format test
    37670c8 Merge pull request #1451 from containers/dependabot/github_actions/uraimo/run-on-arch-action-2.7.2
    4b8f7c9 build(deps): bump uraimo/run-on-arch-action from 2.7.1 to 2.7.2
    68df083 Merge pull request #1448 from Ecordonnier/eco/bump-libocispec
    e6a8d51 libocispec: update
    a1ed024 Merge pull request #1447 from giuseppe/bump-tap
    1809973 tests: use npm-18
    7202095 Merge pull request #1444 from haircommander/potentially_unsafe_config_annotations
    475a3fd features: add support for potentiallyUnsafeConfigAnnotations
    a32cc45 Merge pull request #1432 from sohankunkerkar/add-preload-option
    4f5479e src/libcrun/handlers: add option to load wasi-nn plugin for wasmedge
    c90b8c9 Merge pull request #1443 from giuseppe/use-zstd-instead-of-xz-for-releases
    631e767 release: use zstd instead of xz
    0722689 release.sh: generate .zst release instead of .xz
    d05a5dd Merge pull request #1441 from kolyshkin/fixup
    3ad68ed linux: fixup libcrun_safe_chdir
    dcbdf9d Merge pull request #1440 from lsm5/rpm-remove-eln
    699564b rpm: remove eln macro
    d43d79f Merge pull request #1439 from lsm5/packit-failure-comment-reuse
    f50da23 Packit: reuse non-RHEL failure message notification on RHEL
    c4afd9c Merge pull request #1425 from lsm5/podman-revdep-tests
    0b7fc08 packit: podman reverse dependency tests
    64ee22c Merge pull request #1431 from flouthoc/use-runtimespec-v1.2.0
    0dbb353 Merge pull request #1430 from giuseppe/make-error-clearer
    820471a libocispec: use runtime-spec v1.2.0
    9eea9ff cgroup: make error clearer
    cde8f10 Merge pull request #1429 from giuseppe/add-flag-keep-to-run
    59ad70a container: validate option flags
    7918dca container: split create and run options
    8894495 crun: add option --keep to run
    35dccc3 libcrun, run: add option to not delete containers
    f04eebe Merge pull request #1427 from giuseppe/tag-1.14.4
    a220ca6 NEWS: tag 1.14.4
    31aab34 Merge pull request #1424 from saschagrunert/s390x
    6cd74cb Add support for s390x
    89d4446 Merge pull request #1422 from giuseppe/find-rro-bind-mount-from-file
    5884fd4 linux: fix mount of file with recursive flags
    b9e87e7 tests: test bind mounts of files
    3a07f6e Merge pull request #1415 from debarshiray/wip/rishi/rpm-relative-not-absolute-symlink
    e81086b rpm: Use relative, not absolute, symbolic links
    be5feff Merge pull request #1420 from giuseppe/enable-parallel-nix-builds
    9079a6d release: enable parallel builds
    d8aabe5 Merge pull request #1419 from giuseppe/drop-check-version

crun/libocispec: update to -tip:

    c715dcd Merge pull request #133 from Ecordonnier/eco/clang17
    86650dc fix compilation error with clang++17
    20d3936 helpers.py: remove __str__()
    afed951 generate.py: fix some typos
    f76be64 Merge pull request #131 from flouthoc/sync-runtime-spec
    daeb197 runtime-spec: use version v1.2.0
    3d16826 Merge pull request #130 from Ilya-source/optimize_strings_handling
    66f6f71 optimize writefile
    e9a99a8 Optimize headers writefile
    7a5f2b6 Refresh strings format sources
    210f4d3 Refresh strings format headers

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 recipes-containers/crun/crun_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 89ba21b4..4dde55c6 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -3,8 +3,8 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PRIORITY = "optional"
 
-SRCREV_crun = "89d44467e3b410b73f2065756a12789be45b855b"
-SRCREV_libocispec = "19c05670c37a42c217caa7b141bcaada7867cc15"
+SRCREV_crun = "e6eacaf4034e84185fd8780ac9262bbf57082278"
+SRCREV_libocispec = "c715dcdbab8fe592daa8a11cbabc75aa76534c80"
 SRCREV_ispec = "9615142d016838b5dfe7453f80af0be74feb5c7c"
 SRCREV_rspec = "720792f25ae6e9ee6b1332db698f37659e69ce8d"
 SRCREV_yajl = "f344d21280c3e4094919fd318bc5ce75da91fc06"
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
            git://github.com/containers/yajl.git;branch=main;name=yajl;destsuffix=git/libocispec/yajl;protocol=https \
           "
 
-PV = "v1.14.3+git${SRCREV_crun}"
+PV = "v1.15+git${SRCREV_crun}"
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES ?= "systemd seccomp"
-- 
2.36.1.vfs.0.0


