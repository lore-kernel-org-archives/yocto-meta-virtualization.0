Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4A0C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:05:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92738.1783083909620710317
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 06:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dtZVi5DR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2371C79ABE;
	Fri,  3 Jul 2026 13:05:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07A1660300;
	Fri,  3 Jul 2026 13:05:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E47C104C9464;
	Fri,  3 Jul 2026 15:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783083906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=k06XnkB1qXItxQwgSeqLON0OVph9oVcy17t3EIrLXIk=;
	b=dtZVi5DRk00XiYHZgfCFaIy1iP/dF39MSrIFR55tSmwqAohZpPwkNj0IU613RlYtuSPSOp
	6gwLDLR9KS/nrO+SQGnwG8qsOI7NJqSOrtxYgvtyVYaV3HPLsK+ExOm4ruKJStSaXgAvXF
	IuOZc/RHZmh87vl6s5vkPMghYkT8XXnv7RN1S9Il70q3alZfT5zOP2lIJn4grw+0V2ReO1
	9OCqPuwFnSxkdAnKwvjlqz4cNwE9NgIp+AAQMY1OzPn6KYruHlhvASRm8EpQ/MSmP6caGJ
	rd5NBen/L828reBgo1D49+ITifWxAdj72C4GGj/BDF+/3j8dwwetX/krd9IOUw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 03 Jul 2026 15:05:02 +0200
Subject: [scarthgap][PATCH] containerd: update to v2.0.10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-containerd-update-v1-1-dae635875482@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ7CMAxA0atUnomUBoERV6k6uIlpzZBGdoqQq
 t6dAOMb/t/BWIUN7t0Oyi8xWXNDf+ogLpRndpKaIfhw9ejPLq65kmTW5LaSqLIj7ClMeLtgQGh
 dUX7I+/ccxr9tm54c63c0WCSty0xlhOP4ABixRryAAAAA
X-Change-ID: 20260703-containerd-update-a71a2b785727
To: meta-virtualization@lists.yoctoproject.org
Cc: olivier.benjamin@bootlin.com, pascal.eberhard@se.com, 
 wahid.essid@se.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 13:05:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9910

Bumping containerd to version v2.0.10, which comprises the following
commits since v2.0.7:

03a19324f990 Bound user-database file reads in openBoundedUserFile
bbf4a2b8e6c8 Do not propagate reserved labels from image configs
a15e98122d25 update runc binary to v1.3.6
ba2ed2a5e5b5 [release/2.2] update runc binary to v1.3.5
474184497e5b runc: Update runc binary to v1.3.4
becbb802ec9a update go to 1.26.4/1.25.11
55bdc8bc5b0d Configure udevd children-max for root-test
6d81e88679f8 Clean up disk space in node e2e workflow
1a3d1c85e0d0 oci: return explicit error for out-of-range USER values
fa2a97505844 seccomp: Block AF_ALG in default socket policy
4b2b07879d7c seccomp: Document socket rule scope and socketcall limitation
ea56c960571d Support both styles of volatile mount option
3d34dc82065b sandbox: forward Create fields, fix event topics
4b260843e3f6 apparmor: Set abi conditionally
3e9c4d1e0c12 Add GitHub Action for k8s node e2e tests
cf73e68731f8 Fix TOCTOU race bug in tar extraction
2320b319e096 cri:fix lost container exit events if they arrive before info is cached
fde1480df4c6 update github.com/moby/spdystream v0.5.1
5b2eee8a2936 update to Go 1.25.9, 1.26.2
c579db16e210 update golangci-lint to v2.9.0 with go1.26 support
185ddcfd0cda remove windows/arm from cross build
8538158dfacc Ignore warnings for golangci-lint bump
1cff32695c41 ci: bump golangci from 6.5.2 to 7.0.0
2e02b8bb316e Skip github.com/cyphar/filepath-securejoin license checks
e71fc560b19b Updating selinux to v1.13.1
868869eb9eff fix: sanitize error before gRPC return to prevent credential leak in pod events
40632e4f2aa7 fix: redact all query parameters in CRI error logs
85c3b2b0276b CODEOWNERS: mark Sam and Chris as owners for 2.0
902d804c9914 Update github.com/moby/spdystream v0.4.0->v0.5.0
e92d7b131182 make linter happy in release
12fc0e6ca205 add integration test for cni result nil
8d912c6a2be3 address comment
742f8b8f60a2 fix issue where cni del is never executed
f246535975c9 Ignore NOCHANGE error
9c656fab42dc ci: update CIFuzz actions to support Ubuntu 24.04
c71c4a091aeb integration: Fix TestImageLoad() failure on CI
bfee299990b4 ci: modprobe xt_comment on almalinux

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 recipes-containers/containerd/containerd-opencontainers_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 4ecc915a9c35..bd2a9117b098 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "4ac6c20c7bbf8177f29e46bbdc658fec02ffb8ad"
+SRCREV = "ffa3ba0cfc08e443758c01c73a69db403d31ad1b"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
@@ -15,8 +15,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v2.0.7"
-CVE_VERSION = "2.0.7"
+CONTAINERD_VERSION = "v2.0.10"
+CVE_VERSION = "2.0.10"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 

---
base-commit: 9d0007a369deb4a6346f5ab7a9e6d432a8ed14fe
change-id: 20260703-containerd-update-a71a2b785727

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


