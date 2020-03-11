Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.2111.1583968515564179700
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Mar 2020 16:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="key unavailable" header.i=@agner.ch header.s=dkim header.b=xxxz8jq3;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch [31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 2EE435C29E2;
	Thu, 12 Mar 2020 00:15:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1583968513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMOBm3dJGGhoG/l/fIssdOhlJkC43Ujxwel69C4FJ2s=;
	b=xxxz8jq3vBWnefj/VW9ZakRZqzoClfpi0aNuh237/xIZnwys4xoHtf9UCFrzOW6lQ6R4Oj
	AMtecFSYOJ5RFa5VPGQZ/LS9OcvUaBlSmjJDpjeZDKg8ES9mk/Vy5tgJWTVTa4WdZS3BDh
	9BIfWjtgHu474Z6vSQ0oIWSAAzXW8hc=
From: "Stefan Agner" <stefan@agner.ch>
To: meta-virtualization@lists.yoctoproject.org
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-virtualization][PATCH 2/3] podman: bump to the latest version 1.8.1
Date: Wed, 11 Mar 2020 23:15:03 +0000
Message-Id: <20200311231504.3535-2-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311231504.3535-1-stefan@agner.ch>
References: <20200311231504.3535-1-stefan@agner.ch>

From: Stefan Agner <stefan.agner@toradex.com>

Bump to the newest podman release 1.8.1. Many new networking features
and a new HTTP API has been added since 1.6.1.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 5db9ed2..c996028 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,7 +24,7 @@ python __anonymous() {
         raise bb.parse.SkipRecipe(msg)
 }
 
-SRCREV = "b7ce1157b00af09f4a09e39b377aa3abff46ee05"
+SRCREV = "444a19cdd2e6108c75f6c1aadc1a2a9138a8bd73"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=master \
 "
@@ -36,7 +36,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "1.7.0+git${SRCREV}"
+PV = "1.8.1+git${SRCREV}"
 
 PACKAGES =+ "${PN}-contrib"
 
-- 
2.17.1

