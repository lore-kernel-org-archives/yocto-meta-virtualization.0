Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4ABC7EE2D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 15:27:53 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.92034.1684164468843501361
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 May 2023 08:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=I+EkUnG6;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-96622bca286so2053717966b.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684164467; x=1686756467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZahmeuYPCwWTNN5/jMfQ/8GRRqLyCjbZY5l0kMSLc0=;
        b=I+EkUnG6sgn6sAyNwZJPwJp9Afbx22BYJyg+jhI5yVeDoeA/CY4DRr1oi6jejrZbvo
         0LbgPHMbKChqnDDe1GgUDikP8JfE2jWPnp+ptqnZjvXZ1QR2KqFAM+vqmTOI65XHSnEp
         XrWGj5C+XtAaNCx1CRJ4w6W4/EF+R5BnP97M7oYXkEtN/1AyhCtteTQcBwYnPQdBy0tH
         NhjhWY7QBt6pk2ffT7PZnn13yA2Bj+P7s5g4v/D0dOq7o39Bf5nMXaAAh/8KXepI2ufw
         uJIpYUn1khFz8Ny9G9mucX+AzvUTkKkzaL5DhZ++yZj2RMBchqV5W4U3q/o6ypLZapkF
         DaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684164467; x=1686756467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZahmeuYPCwWTNN5/jMfQ/8GRRqLyCjbZY5l0kMSLc0=;
        b=Ou7hidyflWv2nMXCyms+g2o6rqo6c3Ay0FwGXgH2noNkDUUbvpZwJIPHMR/lnpjf/i
         3gMIAdHLbVv0FDA4ymQWNbi9sMbKp2xmOigSc6cMMrUj5SKwuvKHx7xrZVSUa0HSUYof
         O+j64wPXaOZ3YHBQlvEuDvJuoi03ommUK2u/Ps6kdc8pOGP+TW0YUt6Y9RUvsS8yNoTA
         nM7fnD9TEHuGUmtuUcLWlv6HR4fyywbkLz2jxzr/uaBS4LRN6u2ECrX841oTa5OF8I+B
         2vQls77DDnF/f0NlKVD10TX2AX8Xaw/AhwI7uMV6qcYq1fRdAQxZ/Fd7eLt1UlkH9Gy7
         39Xw==
X-Gm-Message-State: AC+VfDyJPKXRlJbfTD5PYeaoBjHlYjRkiiYOZ5ce5GLyoGnyrJ7BVnli
	LotO13WuwvK0hcXPtyUr5QSzr+eNOxU=
X-Google-Smtp-Source: ACHHUZ7mUxiq6/+4OfmvSScPzVmJu9Bzww9y/YhAdAcU5ct8lzEDLxWhqGoe+gAmR68uBzi2BWexfw==
X-Received: by 2002:a17:907:9724:b0:96a:1260:dbf5 with SMTP id jg36-20020a170907972400b0096a1260dbf5mr19393925ejc.45.1684164466780;
        Mon, 15 May 2023 08:27:46 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id ze12-20020a170906ef8c00b009659fa6eeddsm9690128ejb.196.2023.05.15.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 08:27:46 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][PATCH 4/5] runc-opencontainers: update to 1.1.7
Date: Mon, 15 May 2023 17:26:23 +0200
Message-Id: <20230515152624.138713-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515152624.138713-1-adrian.freihofer@siemens.com>
References: <20230515152624.138713-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 15:27:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8055

Bumping runc to version v1.1.7, which comprises the following commits:

    860f061b (HEAD -> release-1.1, tag: v1.1.7) VERSION: release 1.1.7
    26480338 Merge pull request #3838 from cyphar/1.1-release-gpgkeys
    f72cd0a6 Merge pull request #3845 from kolyshkin/1.1-rm-warning
    c1063b1c runc.keyring: add Akihiro Suda
    b0fae8c4 scripts: keyring validate: print some more information
    79a52b43 libct/cg/sd: use systemd version when generating dev props
    6a806d4d runc.keyring: add Kolyshkin
    b6f686f2 keyring: add Aleksa's <cyphar@cyphar.com> signing key
    63355bf8 keyring: add Aleksa's <asarai@suse.com> signing key
    3bdb63bf keyring: verify runc.keyring has legitimate maintainer keys
    853d5e38 scripts: release: add verification checks for signing keys
    bd1d5370 release: add runc.keyring file and script
    6ccf104a merge #3818 into release-1.1
    7cd72cc3 VERSION: go back to development
    0f48801a (tag: v1.1.6) VERSION: release 1.1.6
    0690c4ec merge #3823 into release-1.1
    e4ce94e2 libct/cg: add misc controller to v1 drivers
    53333a55 Merge pull request #3811 from haircommander/root-cgroup-no-init-1.1
    10cfd816 libctr/cgroups: don't take init's cgroup into account
    9c1c8446 Merge pull request #3817 from kolyshkin/1.1-user-exec
    d30d240b tests/int: test for CAP_DAC_OVERRIDE
    840b9539 Fix runc run "permission denied" when rootless
    c7a72aba Merge pull request #3808 from kolyshkin/1.1-cpuset-byte-order
    165d2323 tests/int: add a "update cpuset cpus range via v2 unified map" test
    26a58fdb cgroups: cpuset: fix byte order while parsing cpuset range to bits
    add2f548 Merge pull request #3791 from kolyshkin/1.1-refresh-ci
    c0647d3a Merge pull request #3807 from kolyshkin/1.1-skip-flaky-ce7
    8d9d1d25 libct/int: make TestFdLeaks more robust
    b66d6d56 libct/int: wording nits
    ddbb6d41 libc/int: add/use runContainerOk wrapper
    3531cc2d ci: add call to check-config.sh
    ed9a0e1d ci/gha: bump actions/cache to v3
    7683e508 ci/gha: switch to Go 1.19.x for validate
    568d4407 ci/gha: bump golangci-lint to 1.48
    1f9e36c0 libct: fixes for godoc 1.19
    50f06554 ci: bump golangci-lint to 1.46
    77472ef6 libct: fix staticcheck warning
    9994fe3f libct: suppress strings.Title deprecation warning
    403ea1f0 ci/gha: convert lint-extra from a job to a step
    d2c83bdf ci/gha: switch to Go 1.18.x for validate
    03a631df ci: switch to golangci-lint 1.45
    e5a5522a Add supported Go releases (1.19, 1.20)
    3ce12483 Dockerfile: fix build wrt new git
    bac06cf6 ci/gha: remove stable: when installing Go
    e74040e0 build(deps): bump actions/setup-go from 2 to 3
    55462355 Require Go 1.17, bump x/sys and x/net
    3ce9c1e2 tests: Fix weird error on centos-9
    abd6adde ci: bump shfmt to 3.5.1, simplify CI setup
    1a4bf049 man/*sh: fix shellcheck warnings, add to shellcheck
    9201794a script/check-config.sh: fix remaining shellcheck warnings
    8b976428 shfmt: add more files
    b0fbd2f8 script/check-config.sh: fix SC2166 warnings
    7f8cb3d6 script/check-config.sh: fix wrap_color usage
    f6562f19 [1.1] libct/cg/dev: skip flaky test of CentOS 7
    55b2dbf0 Merge pull request #3806 from kolyshkin/1.1-fix-sd-start
    12f2f03f [1.1] runc run: refuse a non-empty cgroup for systemd driver
    e618ec36 libct/cg/sd: reset-failed and retry startUnit on UnitExists
    931b9bf3 libct/cg/sd: ignore UnitExists only for Apply(-1)
    b46ac860 libct/cg/sd: refactor startUnit
    060a61c6 merge branch 'pr-3796' into release-1.1
    822623b6 CHANGELOG.md: move 1.1.5 CVEs to Security section
    54cfb25d Makefile: add verify-changelog as release dependency
    7b3ac330 verify-changelog: allow non-ASCII
    37e586ab CHANGELOG: fix a typo
    de0c2277 [1.1] CHANGELOG: fix 1.1.5 git compare link
    16e5d1d4 merge branch 'pr-3799' into release-1.1
    1fe2ec53 tests/int/mounts: only check non-shadowed mounts
    9b8ebe4d tests/int/mount: fix issues with ro cgroup test

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 recipes-containers/runc/runc-opencontainers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
index a5a2f11..045d75c 100644
--- a/recipes-containers/runc/runc-opencontainers_git.bb
+++ b/recipes-containers/runc/runc-opencontainers_git.bb
@@ -1,10 +1,10 @@
 include runc.inc
 
-SRCREV = "17a2d451d635e5eda2e4902324428f1bc65b0364"
+SRCREV = "860f061b76bb4fc671f0f9e900f7d80ff93d4eb7"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.1;protocol=https \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.1.5"
+RUNC_VERSION = "1.1.7"
 
 CVE_PRODUCT = "runc"
-- 
2.40.1


