Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC69EC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:51:14 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.27589.1660737065382838886
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 04:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=jR0zxuJB;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id A74455C004B;
	Wed, 17 Aug 2022 07:51:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 17 Aug 2022 07:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660737064; x=1660823464; bh=SjD0RKbRpRO0aL2H5E1d13WQI
	71qEyxHiL66KDvLyOM=; b=jR0zxuJBoohAWQ1aImW1m7bvCASnPn2Lcqx/9vhbT
	lCDpRrEIQd/l2wZrObIb5lvmXrJmZsUTtGrG8zFmUDD4Gj8wEoNgTThKAaVQIbhg
	m881x0zKFeHzxbzb2NaUECPn6Jz78m6t1N937pb6UOGTXK8+WxFT2aOryTyXryPG
	XjSjnp0tWCrzBs8avp8Qj6Qz5W32EAaGSIpK8DxRpnkWn8Y8JIP6yvfr9WIFO6Gp
	ACNSfRJ415SqD0kIh+AmPs/GQR2uH6WzVRQzyHmOX1ATvnPtHwX94TEd7Wp4sYii
	7hc31PCyOJOfPSMxqlrudfCvz4CZ5NHxmUdUr2GmxgtaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660737064; x=1660823464; bh=SjD0RKbRpRO0aL2H5E1d13WQI71qEyxHiL6
	6KDvLyOM=; b=RyKCzsZA4sBoVQDRx/fiXVn0k22Idq31GJsC19N4JYBC9cs+MHo
	kmtCVmDi0Yasc7UpeoT4j65ioDkjea3pASV5j4EwyDDZPSSCcD2DZL7rxmHKJgtT
	vYh792Xe3LHrIC3YKsqnZ1o3WzzP6ePprfa6c9T5pKjPqthFShHl0+ASuQ8ntlaW
	m0uVjwSSVNfpcTEeQ7wq61E/2assYJrK0tE6mZSmHDY9WAYoERIzpt9nK4x5387e
	LjtP0NlA9OUZFv0rFwQ6L/xUDwhGQFHGctwWvA95LzlXqPLibKOjr3As2hNxDDcB
	3Y0lt8MdXu7rkFXK0542jsgINqJQZIAJF4A==
X-ME-Sender: <xms:KNb8Yi1_mNF6-Vl667YmdyHuMaN4Bva3SAe4yzT-pnj9VSFB9dYg8w>
    <xme:KNb8YlGwoss233-UwYqpagBuim0F1Mqpd1WOI39jnFOpzqnmTSLUrahleQU1H5qqO
    X1hRBEyCz0IlA-FEbU>
X-ME-Received: 
 <xmr:KNb8Yq4wup7UrcaruC7XZGussP2AhRT_tIQCTQgXwvOwyp3LDrAPAuEuxa6lpUprV8nPa3bgmysdLcyMu6HjuJSfEb1nJRYGXwhDIy6Q8Avod4rRgt0EjtaZ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:KNb8Yj16TuYSlKgMJS-D8WOlli6qNuI0UTKq9KHgyF664K5Uno84_A>
    <xmx:KNb8YlGevGMHPAYf_Mk3Pvd6OyZNKovJBHJpSBPOeZr2pm31Enqr6g>
    <xmx:KNb8Ys_KHp8jyU7GA1Ow36uzIUVjyG2AFj_oP89YseHh1ovPeVyRGA>
    <xmx:KNb8YjOwMRfKYsp9Znv1X6j-n10y1Vhn3QYs61_Jv8h6hnAcIk2v1w>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:51:03 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH] singularity: Skip recipe on musl builds
Date: Wed, 17 Aug 2022 13:50:51 +0200
Message-Id: <20220817115051.353409-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 11:51:14 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7526

From: Andrei Gherzan <andrei.gherzan@huawei.com>

This recipe explicitely rdepends on glibc so trying to build this with
musl will break world builds.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/singularity/singularity_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/singularity/singularity_git.bb b/recipes-containers/singularity/singularity_git.bb
index 321a9a6..8e7ab76 100644
--- a/recipes-containers/singularity/singularity_git.bb
+++ b/recipes-containers/singularity/singularity_git.bb
@@ -28,3 +28,5 @@ pkg_postinst:${PN}() {
     rm -r $D${libdir}/ssl/certs
     ln -sr $D${sysconfdir}/ssl/certs $D${libdir}/ssl
 }
+
+COMPATIBLE_HOST:libc-musl:class-target = "null"
-- 
2.25.1


