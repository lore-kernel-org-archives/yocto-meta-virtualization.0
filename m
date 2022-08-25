Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B135ECAA25
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 16:33:30 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.26261.1661445202635415279
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 09:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=e6F4vBfT;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 0832D5C00B1;
	Thu, 25 Aug 2022 12:33:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 25 Aug 2022 12:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661445202; x=1661531602; bh=qcblK65KEYbnQpoe5GpxHZyTA
	qpXBwqvBUf+NXQISF8=; b=e6F4vBfTZp8z4a/BcQM4VSkp/LgT6nDNfTX2qUJif
	R9UQOYBpR8YNmFapKMI2LgoZfGughcxj87VYbbx3+AzuPaWAUwI6hk24PAAfvadJ
	rTiAAwjkgA7TlGreDYMCQRL9qZ33NwJv9PfWuRE88cSk0peIiYWjRDU0rVx86OUK
	Aa1JYH1A8SfLfAkep4Xd01x4S8GMVJilaJQNHTyo8eyFx/LvV1I60LNYuX7+J+md
	sK3aytF7SDa3XY4JnFnIVYQaAZ2ZKTzAon3IJe6kxwOVRngxR+fZ4e5putMSuthh
	VSN5YGCOOSEWAlT3pi0P1JluA79jvQnNsywfrfiq0M9yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661445202; x=1661531602; bh=qcblK65KEYbnQpoe5GpxHZyTAqpXBwqvBUf
	+NXQISF8=; b=zZV+JqTb7XHwK4JhLTFILhldhdAwY1+Vzc4aZYU+QoqfXm6Mtip
	7wUwOCKYaGQ7ulZMh2u20gvsPcWfMbZfmv4iIeh3P7x3sicQHBKlGqaHbKGdRAjp
	Hplj/mCe1OnhMS74UeZj3yQ/kj/HBZS6CEd3DZ+k22nH+UWUUnW4w9Eymt0JbOAJ
	N/Nyu7m45rCPrS/Z4/m/I+HP+9FRgLRLZAkCvXeTSHJ1VZdQDQAdKNYf52rxLTrN
	tJx4/p676uTse1drg/fFHWQEW23uhU/Fm86Rz4u5a0O3Sk8nHy9h0tW6bqfnKmOv
	PMSIh5NRbS9pygEeWx65lMJrFBQbfIMSwXg==
X-ME-Sender: <xms:UaQHY5GaNEwSIWjdbhxnmxbQb2Y7EHTrwXplcappmo9mtFwi7QEa2g>
    <xme:UaQHY-Ux5jjong9HwEMmT1zZAbWODu3SwE6_bPezCFwl_3xjKSGyQxDULFtTfH60O
    NjbQ4wQGh4N2oDaFIU>
X-ME-Received: 
 <xmr:UaQHY7JUU5fvpO1ur0S98JWcl4Cg51161IohBlkgu-BMtmzTd2HCNsbw6xj-aSk1HhBNs30D_AR6eoQfwF__uBilzK1EldwyDrBSQHRb8KgkOlgKf_JnnZnt>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeejffevleelieegvdeiieduvd
    dtffeltedtiedtgfffjefhieegkedvudevhfettdenucffohhmrghinhepghhithhhuhgs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:UaQHY_FnjgH9upoIvxWjA5LYFzHsGx_Z_U_szDgqBA3OEmLO3zGHcg>
    <xmx:UaQHY_WLdKdCBJB-wV0AlTzwzATfiMZr_wGNQqk8fB6peLWLWWs2cg>
    <xmx:UaQHY6NRIP_8qBh96sXfcKGMw9hYTF0cWYljwLwyBFeLWuEdCMEbIA>
    <xmx:UqQHY2cgFna7jRIry4k5mZAC_1D_Xif7ySn3iRhhtJQv3Zzo6_mJmw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 12:33:21 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH] podman: Rename
 podman-rootless.conf sysctl file to aid overrides
Date: Thu, 25 Aug 2022 18:33:10 +0200
Message-Id: <20220825163310.841981-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Aug 2022 16:33:30 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7563

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Files are sorted in lexicographic order. Moving podman-rootless.conf to
something greater then '00' would help with systems providing default
values in other configuration files that can be overridden by
podman-rootless.conf.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../{00-podman-rootless.conf => 50-podman-rootless.conf}      | 0
 recipes-containers/podman/podman_git.bb                       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/podman/podman/{00-podman-rootless.conf => 50-podman-rootless.conf} (100%)

diff --git a/recipes-containers/podman/podman/00-podman-rootless.conf b/recipes-containers/podman/podman/50-podman-rootless.conf
similarity index 100%
rename from recipes-containers/podman/podman/00-podman-rootless.conf
rename to recipes-containers/podman/podman/50-podman-rootless.conf
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index e155c7b..aedb988 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -22,7 +22,7 @@ SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
     file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
-    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://00-podman-rootless.conf', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
 "
 
 LICENSE = "Apache-2.0"
@@ -105,7 +105,7 @@ do_install() {
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'true', 'false', d)}; then
 		install -d "${D}${sysconfdir}/sysctl.d"
-		install -m 0644 "${WORKDIR}/00-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
+		install -m 0644 "${WORKDIR}/50-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
 	fi
 }
 
-- 
2.25.1


