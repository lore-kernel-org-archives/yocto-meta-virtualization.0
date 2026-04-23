Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9066DFDEE52
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 21:02:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7908.1776978139594048954
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 14:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Uj0ZI0x3;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D8AF60018;
	Thu, 23 Apr 2026 21:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23890C2BCB2;
	Thu, 23 Apr 2026 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776978138;
	bh=fl9TGtZgXRH2Sc0eNxqux+VWEykKHOmf6LZt6C+j5HI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uj0ZI0x3mrq3NyiTrQwupS/ywUg3n1j8XfTB3geicbG68YAU0yORyleOPkP0uqXPu
	 O+JE1Y0OmMVxpV6Hy/cp9ljnHmnqwK9i5RzGHSByhPBKnYpX0831B6r/t0AOiw3a1u
	 UtV1tO5wYPe0HZWG/4zCsQpqarQLarMleSFozdReoJ2hHQd/QrHF08uLYCJD4HvMCA
	 WJnMTvRGocl+gJA55rmkYll/639Ng1e5RyoSd78uGQK6D909sgNJfQm4POD+ZG9LfU
	 ygqoVUnjkS9+6xBDUgzD5r8qtmjXliRRFjxXF4VbTynPdZbStTgHxwNuNiX29crbhk
	 LHkESHDlWDo1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1402EFDEE4E;
	Thu, 23 Apr 2026 21:02:18 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Date: Thu, 23 Apr 2026 23:02:05 +0200
Subject: [PATCH meta-virtualization][PATCH 2/2] podman: update SRC_URI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-podman-fixes-v1-2-3ffa0badf612@belden.com>
References: <20260423-podman-fixes-v1-0-3ffa0badf612@belden.com>
In-Reply-To: <20260423-podman-fixes-v1-0-3ffa0badf612@belden.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>, 
 patrick.vogelaar.dev@mailbox.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776978137; l=1439;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=yO29jiJJsf/MoZvBQEld2qyQLCDdtYNhT/accy+vUbQ=;
 b=Iobn5nn+f1sz774eOJPLwCKEmil0s6eXOfddUllf7/A95R95HQWEP2F3ukzMIvFS7GIREMHVW
 5ROXjaegxfQAO7FXzpfpfuE0oUQqeVSzPfIrkjG1mqfadyRZgahFpmS
X-Developer-Key: i=patrick.vogelaar@belden.com; a=ed25519;
 pk=w0QU8RmOR3hQv1DxMcz6KmySeE8yqbvO0xC1ZSSUNqY=
X-Endpoint-Received: by B4 Relay for patrick.vogelaar@belden.com/20240201
 with auth_id=125
X-Original-From: Patrick Vogelaar <patrick.vogelaar@belden.com>
Reply-To: patrick.vogelaar@belden.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 21:02:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9731

From: Patrick Vogelaar <patrick.vogelaar@belden.com>

Podman is hosted under github as podman and not libpod. Accessing
github.com/containers/libpod automatically forwards to
github.com/containers/podman.

This commit does not really fix a problem but reflects more the current
repository name.

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index fd0cd908..8e108c4e 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -18,7 +18,7 @@ DEPENDS = " \
 
 SRCREV = "9d66b48e1c9bc1f4e757384f44c4ecb2838138d7"
 SRC_URI = " \
-    git://github.com/containers/libpod.git;branch=v5.8;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+    git://github.com/containers/podman.git;branch=v5.8;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
 "
 
@@ -34,7 +34,7 @@ CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"
 
 PACKAGES =+ "${PN}-contrib"
 
-PODMAN_PKG = "github.com/containers/libpod"
+PODMAN_PKG = "github.com/containers/podman"
 
 BUILDTAGS_EXTRA ?= "${@bb.utils.contains('VIRTUAL-RUNTIME_container_networking','cni','cni','',d)}"
 BUILDTAGS ?= "seccomp varlink \

-- 
2.43.0



