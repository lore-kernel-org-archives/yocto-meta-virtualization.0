Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A700FDEE50
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 21:02:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7907.1776978139077094105
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 14:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oXU95dSq;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E596438B2;
	Thu, 23 Apr 2026 21:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DD07C2BCB4;
	Thu, 23 Apr 2026 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776978138;
	bh=G3pjpoU8kvoeo/+2ar6XgyIn2h4LN1Pcg/ryYBd+9gM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oXU95dSq3ORvdHQXZfDr4/AkIkci28lewqEatDck4ikW90ggG9zWKGgwtFrt5sX65
	 0BKrG6TZet5lCDNxS0DkKSbIqkKYQWsrf2LMJ/XHfk649dbJ0aZFnUPcndBZmOSbYE
	 dnQ+fVHJNe/0iO05QfJwQiLYtKkfoFgQfSVKlaMZU7y/a/BBOJmlIke9cPqFDRy+MH
	 R2qt89tUAEVV316ZRZJBh8KshsK9GcUZuQK1KS1+rnQOLVHAlkITsLnSDp+0UUVE0Q
	 +Yd5eTuq+MA3OmlDZZun06otjFabU+avn0sR6z1D9xo2GyQKCixzKPZFvM0dvR6jaT
	 0ZXOZ1KzuZxqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C3EFDEE49;
	Thu, 23 Apr 2026 21:02:18 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Date: Thu, 23 Apr 2026 23:02:04 +0200
Subject: [PATCH meta-virtualization][PATCH 1/2] podman: fix PV to right
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-podman-fixes-v1-1-3ffa0badf612@belden.com>
References: <20260423-podman-fixes-v1-0-3ffa0badf612@belden.com>
In-Reply-To: <20260423-podman-fixes-v1-0-3ffa0badf612@belden.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>, 
 patrick.vogelaar.dev@mailbox.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776978137; l=895;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=3dEjye6kkclmDTUzTAvsaM4X6/mfANGzqzb9BtRfOWw=;
 b=tHT3fAz/NiMZJm5Ii7Z0khjWwFYDOB9zLoYd24AKwxrrH/1zmQG12bvIJhQSW+83kI2uRZZPU
 x8WHHV8DO4PB0A7KvXBXl90WQNJmywtU2DVRLyEg9PBcCUeRBviMYYs
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9730

From: Patrick Vogelaar <patrick.vogelaar@belden.com>

Commit 3b9ff919799daa5eccd56b481cefd61db652ab99 updated the SRCREV as well as
the branch in the SRC_URI but left PV untouched. This now sets PV to v5.8.1
which corresponds with the SRCREV.

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 recipes-containers/podman/podman_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index df333dfc..fd0cd908 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=3d9b931fa23ab1cacd0087f9e2ee12
 
 GO_IMPORT = "import"
 
-PV = "v5.7.1"
+PV = "v5.8.1"
 
 CVE_STATUS[CVE-2022-2989] = "fixed-version: fixed since v4.3.0"
 CVE_STATUS[CVE-2023-0778] = "fixed-version: fixed since v4.5.0"

-- 
2.43.0



