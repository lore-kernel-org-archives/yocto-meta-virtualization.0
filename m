Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D72CFDEE4E
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 21:02:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7695.1776978139078373975
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 14:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=VbTy6oZ9;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E10C43432;
	Thu, 23 Apr 2026 21:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CA9DC2BCAF;
	Thu, 23 Apr 2026 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776978138;
	bh=l9xKUXmdY3AVrlbSL89+dTSiInclADC2i2QxT4/r3/Q=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VbTy6oZ9JK3Xl/WJR1Jgc4zLsfAvkToHkHjpTcnu6Q5gVQgmI5X0lJi17Kab5Toxo
	 r8tqQj3JlN7qiqB3axoLjOGjn8yrpB+ghc1B35VBrCGiKN4XCF3xe+AfIH4wC2OAew
	 zQKPJUdo8l62NTF6Ztj3uVLHhLe7EKJ+dWUsMpctY3iwqOmvWgcYnHDLIJjaOZJbm5
	 Lv+iT1e1bi2iGIopeQJ2Q6eAr9tMAIiCImbtOSvKj0/uFlXDkl6wOnbMHRBzmNxKvB
	 r9o+esCOeKB/rQF4bj4iHwsnZ4lmZBoeM8yiFHCLId4AJSs/EIod3hnya8SWDp9l7z
	 xN+RO0F/VrW9A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCFBFDEE3B;
	Thu, 23 Apr 2026 21:02:17 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Subject: [PATCH meta-virtualization 0/2] Two small changes for podman
Date: Thu, 23 Apr 2026 23:02:03 +0200
Message-Id: <20260423-podman-fixes-v1-0-3ffa0badf612@belden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMuI6mkC/x2MsQqDQAxAf0UyN2CjqHQrXTp26CYOwYttoJ5yd
 xVR/PeGjo/HeztECSoRLtkOQRaNOnmD8ymD/s3+JajOGCinKi+pwHlyI3scdJWIjRBTXZV9MTi
 wZA7yF1a0MEpiXDSkL39042Tnrn1cn7c7dMfxA7IICa16AAAA
To: meta-virtualization@lists.yoctoproject.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>, 
 patrick.vogelaar.dev@mailbox.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776978137; l=513;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=l9xKUXmdY3AVrlbSL89+dTSiInclADC2i2QxT4/r3/Q=;
 b=SfKeMvuKnnvpm0rEmgZ8P4es4c/5ozTRTO2xC7mJOIMBeOnhdZSPx2pNyfaqlgqEviOZ3sC+L
 2WmWUKtvf21DklZFD8woejFZDUHEqZrVOIpj3c21wuVQsoVr13zhGDf
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9729

First one is a bugfix and the second one more of a cosmetic change.

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
Patrick Vogelaar (2):
      podman: fix PV to right version
      podman: update SRC_URI

 recipes-containers/podman/podman_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 2e0704ee9282e4e86c13180334cb7ce118e55dd9
change-id: 20260423-podman-fixes-8e2a2764c3fd

Best regards,
-- 
Patrick Vogelaar <patrick.vogelaar@belden.com>



