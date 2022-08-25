Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCCCECAA24
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 17:34:00 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web08.27035.1661448832702772468
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 10:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=3YaIKwxi;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 0E3EE5C00A7;
	Thu, 25 Aug 2022 13:33:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 25 Aug 2022 13:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1661448832; x=1661535232; bh=fhKO4hH75qEKPQ0zrsdL68qfF
	czhVZENweGrv8XaYB4=; b=3YaIKwxiP3gDCFOumYhSgqlWDwmZqeYlHTem/pZDy
	aeb3Gl5NX5+FMAbNSI+AbYnkL4JCebBsvo8AcryhC3YC538bLPGkA1sIYq1DrDre
	J2YDeeqaKGAPVqKgy0JIvzpbz4kxiB5lbO6xaXi12pISwSmCuMH8MQGIGWUGFti+
	guCOtqhHpyD6QXp3R14xvkAaZXe8cOUxQXeFPctGJHcFxmYqBIVBmG4lS2B6zP3a
	PBJPrWNpK/mdXZcLbgwa28Y+WMV3YYJAgedLZXBRiO2J/7gMs5H2dVjKCoBkqa3R
	VmRWIXnMBfYbgruVCmrjW6aBXlNL4iqwdO87f5/O9wjwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1661448832; x=1661535232; bh=fhKO4hH75qEKPQ0zrsdL68qfFczhVZENweG
	rv8XaYB4=; b=haL3T1yb7cLd8mmDJzRowACbq0ocFZ6aW0TrxRsbdSF2VeXGptI
	T13JUOb/raVyNFQAueJDqj2aX1s0FEhTxGBXZQppLBl8X3vqQ4hjVtW2HiyojTaE
	K26pxoHfJ+NOnqmE101m1qdhzu/Og40GT/vtdvwQ07U9I0oXbCJSxcgtd7kZE1gz
	jgy2xInnMIUDq/hpSKfx9cGEf8hYAeWpiVnbf6cHmZRh2KaIrhq525PCDVW0quMf
	0cr1VSXGfIyksizWfkad7dUKVdlnknrZhSXspx8wP0TLKOHhv/9nOzpbqBt3DSSp
	3QKzW8uMZ10AkWjuVuZPzuBs2xJZyAJuHvg==
X-ME-Sender: <xms:f7IHY3-qorBF85Rb6CKhvhY4GX-g4oVI9PRjpgpF-Au-1XqdpRysDA>
    <xme:f7IHYzvOevEWzFV06RBOYeAzbe5bd_8LmJQeYasF5wxeeVZdhKuzVShGeEm0r8cA7
    hfYUOZZkZZfGD22RKw>
X-ME-Received: 
 <xmr:f7IHY1ApV2b2O69PpNZKFt-QvjTnfDtRpvtnPWTcth4sRLwlJ-ewAc4N_DhWGhU8qu1WPijEvfRnduTd4enoKXyRXgIZSpSu_FGmQKJubDNpUV-ZklD9bCiH>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeutdeggeefiefhhfejgefgle
    ekieelgfdvveevteffgffggedvgefgleefffekkeenucffohhmrghinhepghhithhhuhgs
    rdgtohhmpdhrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:f7IHYzfj3ZxkPDF6ld0-TTi4zCZAFKJPmBH-K51yiGQGmiDCwqZttA>
    <xmx:f7IHY8PslIlv4FwbsnTPxVv1yTWliGfk7qKVib25rtT68LTXMif-2Q>
    <xmx:f7IHY1mdyj-Pr_PzUeuqEVVozXYcnRRI7lOai2JxHgnjMFAJ7Ayljw>
    <xmx:gLIHY21-AyTJSXfp2sYhqFO8i_iDAdEis9B7jLKmgPCrUeKMZ9OzJg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 13:33:51 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [kirkstone][PATCH] skopeo: Mark CVE-2019-10214 as fixed
Date: Thu, 25 Aug 2022 19:33:42 +0200
Message-Id: <20220825173342.1220887-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Aug 2022 17:34:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7567

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
index 35377a8..d32c525 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -35,6 +35,12 @@ S = "${WORKDIR}/git"
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


