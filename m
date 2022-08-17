Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EFEC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 11:51:24 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.27724.1660737080898572612
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 04:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=F6ecE7SM;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 3EBBF5C00A7;
	Wed, 17 Aug 2022 07:51:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 17 Aug 2022 07:51:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1660737080; x=1660823480; bh=SjD0RKbRpRO0aL2H5E1d13WQI
	71qEyxHiL66KDvLyOM=; b=F6ecE7SMT7gXRuJmrz3U5VhkFAL40N7AwFL/J0LAB
	gIrGAm1rgBx8DFkNTlIK+by3IXTTbfBUNSKfbYIwF9Q3VS3YUVINJGcInmR0HQTC
	i8rpgA0jdlTC/zVgo/O3q5IJrwUcKFI0PU5m8mMCfkf8qNl8rMqA6cqyUcunJqFb
	3zfrk2Vc2PvLSuDmy+i1hy9gwDeML3Vr4JlGSb3i9Mns1njiuSYKO0qHx25GOX7K
	2Kq/HumfFbbP2ugPhXEXQObIc+t6G+d2nwQYpp8s3eJ31iWiwVLuxy2Ex50goLzu
	DJI5O27xMSSmlNlt4c7Id0KExv5Z4CpgfzCuAthq3LQKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1660737080; x=1660823480; bh=SjD0RKbRpRO0aL2H5E1d13WQI71qEyxHiL6
	6KDvLyOM=; b=jtcGlI27SNcoEjwRdcp7aYVgJnDDiMKWSAfZBusM8UjvGHZ9opq
	I7O4iMb+UBHG2RUDE/XIPjPJ6O019r/9de0rSrSTMGumyKgBNsLU85veYE1Ibcxb
	eCsjuaQ3cnbegL5lHgCrXL+vIydxWJwKR1Eay7Cbg96wthrrOXW46m6zaGgjZTU8
	mh1K2uOs9bFMNanAagYXBe/BZPgB6mrCLtFzh3LFnL5aoX+UjvFLrRixZOCr73nP
	nkE2Ve276hORzxCeD5lO9g5/J6qtPRta5bvwPrhSylDj9lcKxkTzrLxuRRd/xiIU
	Vj83qZmpTA3mM4Qv2gnNsaNRboCbq726lDQ==
X-ME-Sender: <xms:ONb8Ykc8YAf09BfklAeyOD97OZsOOPpEifZtlqYyu_Ye_-MC2jMzvQ>
    <xme:ONb8YmOQiwW4D-VJ39AREzKwdquYhN0Laa2CA33WSwl4u3bJ-SeSX-2yS1jYRNK8D
    doBzPY70SMLQ1XikqU>
X-ME-Received: 
 <xmr:ONb8YljEyazC3bbk15a-mNn5tBypOUvLm0ukPeXRFt-oRH44Q4UIw9Wq4bQIVLSiionsKPFl9spcwlq5976sJwswwkoyeqF78_EzcQoWQra1yEb8al2D1sUg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:ONb8Yp8VU24g6U2SiNYHbxVRfrZitQbwhZcjC9HTurbu0dS9cFs9JQ>
    <xmx:ONb8YgvTpKtPWmdrMXPv40ZjKesPB9bCrTkhT7hMxR5RdT591mSrZw>
    <xmx:ONb8YgFa1MPrmeLgN3vK75nSYi9m3Lgofz3OF0H4-qj5GhUC6f9nUw>
    <xmx:ONb8YtWVdc_0WMONHXnq1ET2WN5I_jcdbhsOnvOygJlpnMR3VWAoQg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:51:19 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH] singularity: Skip recipe on
 musl builds
Date: Wed, 17 Aug 2022 13:51:15 +0200
Message-Id: <20220817115115.353734-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 11:51:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7527

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


