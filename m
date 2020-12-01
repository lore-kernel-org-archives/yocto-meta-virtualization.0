Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.3920.1606787063412196256
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Nov 2020 17:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=GsRTOTxa;
 spf=pass (domain: foundries.io, ip: 209.85.160.176, mailfrom: ricardo@foundries.io)
Received: by mail-qt1-f176.google.com with SMTP id v11so39474qtq.12
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Nov 2020 17:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4U4HAQqd/sog5+mrfVlgOtCHMAXeLtg8l99pBKBv5JA=;
        b=GsRTOTxaZ8L3zTh6cLy96HXkGSbEMsXwu5Z7xReh2MGsZrxkmb8J2YXPNvUkkIbuqQ
         e7L7Ry5Q4S9tJMQ0gmshd2cuPrEnXmc2S2JqWotECLgwJ0B1m9PvCwtxDDfmfQD5LpZ3
         TKKEDdZ6CCIQ2Vbt6Ncovqz7I8xVfjtk/xUSoy6uj24wqxx1xV6keZfVpyMpEnlKlnyx
         L5txR/9jr9i9Dt1Q1lb0+c4cHtzhT02/8qxPNUeL+JQYTabADlKVw3EaFNBJRGKVu+sP
         +vKrJ46XdDAYUMBss/mOyf+emZfn/27i10WxrrsvkVxUASDzc2df0yQUGj/7uroZB4fI
         ijWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4U4HAQqd/sog5+mrfVlgOtCHMAXeLtg8l99pBKBv5JA=;
        b=MafkGHV59EAfkorxHtpEkg17+OhbXvhZOcRl37i1qWA0o591aGCKyPFuyWCnqRv9Ng
         AX0/AXnQ36aWkMf4+qyooxSDfnV3gJcEPBYt94SZCoRd/Q3mFVPGfU1orPmoJiZWdaTS
         eENqWvpBxR7tUhp4uw/98n4/Na1mwW7tGd2aRh55emmo42WfKu5a6fuvcZxGe/RFsSnq
         yVHfKOJxTyqD/2qO7aDMD0tF/gefywZeQwaQZ+Y8XZcNLm1MNKoxDPqejYU4CqdN3guk
         cGzztoBUe20DrirkCkrvhUln6H4ojWEpmGu+yi543RiN61wa9DZ28otvxOEC/2AGbrSL
         wVNg==
X-Gm-Message-State: AOAM531qf5HNKAKnM7O6gpN/1l6N+tkBKFoADA6Pv9n5eyMqBy6Fc9nF
	UHId54Ekqcl5P5L5hKThBJDyvLzQeQgV
X-Google-Smtp-Source: ABdhPJyFcWD2oiEeaLe7BG6RFe1gbLMPJC92c6T78Hm/U6kQJIhjF/Kzut2tTesnbcLtBAo2w0NPWA==
X-Received: by 2002:ac8:5901:: with SMTP id 1mr422816qty.350.1606787062031;
        Mon, 30 Nov 2020 17:44:22 -0800 (PST)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:e2f8:f868:9671:3e53:1905])
        by smtp.gmail.com with ESMTPSA id b33sm404026qta.62.2020.11.30.17.44.20
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 17:44:21 -0800 (PST)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] containerd: update to v1.4.3
Date: Mon, 30 Nov 2020 22:44:08 -0300
Message-Id: <20201201014408.26562-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Relevant changes:
- 269548fa2 Merge pull request from GHSA-36xw-fx78-c5r4
- 727e1728d Prepare 1.4.3 release notes
- ae3a64aa1 containerd-shim: use path-based unix socket
- 428f10fd2 Use path based unix socket for shims
- b321d358e Merge pull request #4768 from dmcgowan/prepare-1.4.2
- f2e4291b6 Prepare 1.4.2 release
- 76f3d1955 Update mailmap for 1.4.2 release
- ca9950755 Update cri version to pickup unknown state fix
- 21baf7109 Merge pull request #4767 from dmcgowan/update-1.4-cri
- 3458984bb Merge pull request #4766 from dmcgowan/backport-4765
- 0b97c6204 Update cri plugin
- c0f1add3c Fix Windows service panic file to not be read-only
- 9c24574c9 Merge pull request #4763 from estesp/cp-tests-fix-1.4
- fbe18caa1 Update btrfs vendor for chkptr fix for Go >= 1.14
- cbbf257ab Add Go test runs to GitHub Actions CI
- 19776b75b Adjust overlay tests to expect "index=off"
- 7eb852214 Allow oom adj test to run in environments with a score
- 036ede698 Import crypto for all snapshotters during testsuite
- 8d839c4b3 Merge pull request #4751 from amrmahdi/amrh/cherry-pick-cc3785-1.4
- 31bbc1f7d Merge pull request #4754 from thaJeztah/1.4_restore_nil_pointer
- 5618423a0 Add comments clarifying copyWithBuffer implementation
- a2ebee357 replicate io.Copy optimizations
- 9b2156aa8 Improve image pull performance from http 1.1 container registries
- 7fe3f1301 Merge pull request #4749 from thaJeztah/1.4_backport_windows_int_overflow
- 56291a221 bug fix:#3448
- 16e51fc31 Fix integer overflow on windows
- 957bcaa9f Merge pull request #4746 from estesp/cp-4745-1.4
- 6ebd9a94a Update other actions for env/path CVE fix
- 49889957e Merge pull request #4743 from estesp/fix-ci
- 0a3488c71 Fix GH Actions CI deprecations
- 882e39618 Merge pull request #4733 from thaJeztah/1.4_backport_update_seccomp_profile
- da9705a64 Merge pull request #4736 from AkihiroSuda/go-1.15.5-containerd-1.4
- cc3be9ae3 Bump Golang 1.15.5
- ebffce3ad seccomp: add pidfd_getfd syscall (gated by CAP_SYS_PTRACE)
- 229f5ea4e seccomp: add pidfd_open and pidfd_send_signal
- 457dafa4c Merge pull request #4711 from AkihiroSuda/go115-1.4
- e45f41e3a update to golang 1.15.2
- f8c187fcf Merge pull request #4696 from estesp/cp-4692-1.4
- 695516287 Remove setuid gosu in favor of "sudo -E PATH=$PATH ..."
- c562e8d2b Merge pull request #4690 from samuelkarp/backport1.4-critest
- 77931f801 ci: run critest target for all runtimes
- e46c29945 Merge pull request #4689 from estesp/cp-4665
- c745d237e Revendor CRI to get disabled annotation config default
- ded2577d6 Merge pull request #4660 from kevpar/1.4-update-hcsshim
- 8b8494ec0 Merge pull request #4661 from kevpar/1.4-lcow-tar
- 88e7f23bc Read trailing data from tar reader
- 856a12fca Update github.com/Microsoft/hcsshim to v0.8.10
- 013411ac1 Merge pull request #4650 from estesp/cp-4645-1.4
- cc6f72a00 Check if a process exists before returning it

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../containerd/containerd-opencontainers_git.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index d0ea715..2279a74 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -1,4 +1,4 @@
-SRCREV = "e44e8ebeaaa2d605f539dffa3788a53c92458c4d"
+SRCREV = "269548fa27e0089a8b8278fc4fc781d7f65a939b"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
            file://0001-build-use-oe-provided-GO-and-flags.patch \
            file://0001-Add-build-option-GODEBUG-1.patch \
@@ -8,7 +8,7 @@ include containerd.inc
 
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.4.1"
+CONTAINERD_VERSION = "v1.4.3"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.29.2

