Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3882EC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:35:26 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web12.31116.1660754119822259192
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 09:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=XpPU9MLm;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id BFBEF3200908;
	Wed, 17 Aug 2022 12:35:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 17 Aug 2022 12:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660754117; x=1660840517; bh=jZoZyujw2gonhsd992IHCi+aG
	wYSZFl28iJco9K7OUk=; b=XpPU9MLmqhCBWChI4wGAtxBhSU6tBJTFGjBeG64/g
	TOg3dpuZc65jzTYArkLnNTaFKnxIvoWzPRaRM9svqFo/hCHM6ljoG69XAYN6YSHe
	2oZjCvxnXvC3IhHgMKbzvvPcXoB9GUex0npgeVEu1haZpmvw/lXGQdMXTm4plc0D
	YRiMBsC+jIbvtC27Vu/tHWgMvgWDWKOxNiKdH4KJEXxTuHhiCH4dhEN17ssYDrQ4
	fkM5w7mTf/lL00/SliNMzHvpRzCvFTLR1F2SgYKzcvFCNXuDrTVxkOcORJIL/ToW
	IvB9hZh5VGZcN3vHoWijwkgSSLSkp4wPt8wenl/eBl8qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660754117; x=1660840517; bh=jZoZyujw2gonhsd992IHCi+aGwYSZFl28iJ
	co9K7OUk=; b=1k3xnUNELG0l0BwCl+OnjBQsRyL51/VgynOdRDCkMKX/9NnZlAO
	Wq4P7A0+8mBv3bYunod9IWapro7qLY9FrOD+ZCe4h/Rt/VKaaUzGriJPncaloX4C
	VYcsTUJtIAEBu7Ywpcr3VUynRPuUfBSLjTeAZQnfWO3RexPHiRdiBGOJ4oD/AEeA
	DoLHnCMQpkSvXXtiigBFc+2ikDD6HYCXwJ2DMWCzAXu36vbsycH/OdwlEN/VCIYr
	qhdhD6h/7yJC9nz62eqHNvcWbbvMpySAzHR+mzySy/qg2orFJxwTlm1h1l6ePANK
	yE2I4EXIkVhsyDpSF1MKesldXR/ITeGbmEw==
X-ME-Sender: <xms:xRj9YhNe7FVIOn87aIafhkK_AoNAO_arGNk1JriOlF9OlN-9aTVxMw>
    <xme:xRj9Yj88o22yS2PYyX-_AVsWaDC2udw88TOa-h3ynV3QdiUQKGsXEsUqzpxaOEpue
    87L8496mNj8wvUxCi0>
X-ME-Received: 
 <xmr:xRj9YgSZFXp1fMuePLztqS-EP_FGMAzF-f1HrlzNZoWF3Dd984iDT19PQeOzPzlyPKmZrtkmY_L_mQUiWvd7dAPsnHsvRRfZhvGaanPt1sHw_u5p_OvkkKSh>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeelhfevveelffevgeefte
    eljeetvdegjedttdehhffhtdeihfevgeffgeegkeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:xRj9YtsqPy_zaKeJk3HDRFkwnsgUSX4UPMBcy0mlfGiRDa6cqTiChQ>
    <xmx:xRj9YpfFjYYLTFSXJTbJlacZNSXr_z3pKeXGCcopUJcZ2evZ6ebEWQ>
    <xmx:xRj9Yp1n_UOVO44ZRfqqlGft4_PbZWLiXOb9fovbk_yDCNBVfBG2qQ>
    <xmx:xRj9YpGWwKT2F0dQVvUeuj5tMG2QvqsAWCL4MGFvInahFSwBG1dmXg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 12:35:16 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH] singularity: Drop explicit
 runtime dep glibc
Date: Wed, 17 Aug 2022 18:34:59 +0200
Message-Id: <20220817163459.557437-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 16:35:26 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7536

From: Andrei Gherzan <andrei.gherzan@huawei.com>

There is no need we can see for this dependency to be provided as such -
especially forcing this to using glibc.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/singularity/singularity_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
index 321a9a6..e3903ec 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -2,7 +2,7 @@
 # Singularity build / config: read up on the dev-so test for more info)
 INSANE_SKIP:${PN} += "dev-so"
 
-RDEPENDS:${PN} += "glibc python3 ca-certificates openssl bash e2fsprogs-mke2fs"
+RDEPENDS:${PN} += "python3 ca-certificates openssl bash e2fsprogs-mke2fs"
 
 LICENSE = "BSD-3-Clause | Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYRIGHT.md;md5=be78c34e483dd7d8439358b1e024b294 \
-- 
2.25.1


