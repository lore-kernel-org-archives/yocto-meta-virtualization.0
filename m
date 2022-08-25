Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED43ECAA25
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 17:32:50 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.26822.1661448765843702690
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 10:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=iVpLMZlf;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 3430B5C00AD;
	Thu, 25 Aug 2022 13:32:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 25 Aug 2022 13:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661448765; x=1661535165; bh=vKCp5DO5P6EWb8vVNMgfsMocm
	2Y96MXUOaZ423bz3fw=; b=iVpLMZlfH+CatuMzB4v0gHBKD0NKifVKAGXq4MlXc
	AtihDbdDIVYz9MHjS+pFlIpaauClUQITFZYf3E7boiiUkNmoEw0ACEjhmqSyHFYL
	nUNdySP1P71eaKIN6SwrfS6T4d4EMVDeW4X37xZF3HGmeL/pMva+UrYiqMFAfMwH
	THGlLZIkvhs0n2frV1JUfWY8DpG1PSvo1ZS8jt2qKlOV9QVXy4DEHP3tKc4ZrbAZ
	6NelIMqPA/WfqlVavftLa4h+9Kqe5tl+y2djzbzVxBAoFaYtGmn1cn5HuM6uJGxT
	CZCMceq0f85NkyKwaiqSQQh4/hCw4vMaRRTOBTmZHIgAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661448765; x=1661535165; bh=vKCp5DO5P6EWb8vVNMgfsMocm2Y96MXUOaZ
	423bz3fw=; b=Fm/985UB7xpB21sHfeeGGiCQ38r/6INAWPY81CJQdAzlLbEgHbQ
	jrgReprjuWAL5v0qhcTCuYI/4blMQgUn2bmcU2/738ndESTUmGBcwoitR3kD/qBu
	DIsmDageiWVcOxw23Bl6LWm4R+EQ6ZeB/irMoOJlJL/dDcZdj26waAYe76/u44tv
	UlSRAsbLo9WWxqw991/PZPX6iJmDhAl0Av5ZAK5GzQF5K4G6KP5C3f8bFuC1M5X9
	2Lupes1OjGi+J3YQ1vZUPIA7IB7/PMwnE97NMltPCtOuMBLkpMzC44zTzWf4GVrw
	5OgUCYRZnjmMQgWYqu6z0KM7YCl9wS4XCOA==
X-ME-Sender: <xms:PLIHY25hQtCjyAWiGNjHliDLzNI4eiMrSjb474d6X28K2LQhfxkUuQ>
    <xme:PLIHY_5rKs0J8eBaoQ5QlMqtmwcP4eZlgGA_B1m8wfkHMAFNQZFCQQZzQjUxZxxYk
    TlnU7IXBVpFjsRcbRc>
X-ME-Received: 
 <xmr:PLIHY1eHnkFiEQo-wrhMYEjMsE91dm6yNPmnWc9TvA8Xkkz6RVr8RUf2QnzBMslnkVXPliocj_LZSon7_QPzdgLluZPpBoZYyy-rD8W9Ij8xPLkHxb0rcWpa>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeutdeggeefiefhhfejgefgle
    ekieelgfdvveevteffgffggedvgefgleefffekkeenucffohhmrghinhepghhithhhuhgs
    rdgtohhmpdhrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:PLIHYzI2L9mri_EvoY2wCHTsBBjw0gMm5e1UvijU0bE2YPv7e_6TjQ>
    <xmx:PLIHY6LDJnL8ohuWosxEqBWPxqQcHV5mRbyTQIj9FkwrhDNnIK4Z0Q>
    <xmx:PLIHY0x0g8S1s1dacNoM_vO2Z3CsQvnyTty5wWodcHqDF454yvgWRg>
    <xmx:PbIHY8gVUFDlDFzLwl2TLrOnILK08cXKs_kJCjog87Z5pyiPkkhVHA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 13:32:44 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH] skopeo: Mark CVE-2019-10214 as fixed
Date: Thu, 25 Aug 2022 19:32:26 +0200
Message-Id: <20220825173226.1215646-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Aug 2022 17:32:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7566

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This CVE was fixed[1] in the container image go library skopeo is using
(vendoring). The current version of the image go module is v5.20.0 while
the fix landed since v3.0.0[2].

See RedHat's resolution[3] for more details.

[1] https://github.com/containers/image/issues/654
[2] https://github.com/containers/image/pull/669/commits/a3d69a4a89244803d2f5350aca6dd0fcbe444551
[3] https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10214

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 9d19675..d426b4f 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -34,6 +34,12 @@ S = "${WORKDIR}/git"
 inherit goarch
 inherit pkgconfig
 
+# This CVE was fixed in the container image go library skopeo is using.
+# See:
+# https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10214
+# https://github.com/containers/image/issues/654
+CVE_CHECK_IGNORE += "CVE-2019-10214"
+
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
 EXTRA_OEMAKE="BUILDTAGS=''"
-- 
2.25.1


