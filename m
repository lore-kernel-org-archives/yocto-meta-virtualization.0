Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351E7C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 10:18:17 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.82478.1657016289953280558
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 03:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=w9OeYEct;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 4C2E65C008F;
	Tue,  5 Jul 2022 06:18:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 05 Jul 2022 06:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1657016289; x=1657102689; bh=SC
	srAdLav1D8hAk3ru5FRcWwFEq98hS46DYmNGB91Vs=; b=w9OeYEctsi6hoN8Qe+
	DNUOZRWPerZRkCScxC6PCjDcBKhz3/c7gKtk0gLu4roiKvrK1TwQ09oPKGxCDO3d
	kU4vjtk8EQEBLHiG0WZDtDN9Q2A1joXWe+4Pe+WW08goFUExF9FCQLTSO2Lz9SQI
	yz3BB+PirCQoh06bwR0nrptw0p3xDcPFvIBpYINIRzdMIX20jLsXe9xeoM29dYTd
	dMCO4Oq4O8FSvL3CQFwLUUmWKYb85vg2Qdckw/Bx2KMB8hJZMvo+X74WSMLlWSlO
	C/nvtyGo+xnafV3JrlR8s4nyK9XYCFXzXqxr/Wr3H5R5ZFLS2mNd8B2WkktDbQXB
	J7eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1657016289; x=1657102689; bh=SCsrAdLav1D8h
	Ak3ru5FRcWwFEq98hS46DYmNGB91Vs=; b=i4Vt/yRIXoscNwWhLw/niuXoAZSR1
	SlnfS23qjrv+MYxmXz73V5mZIcsuRnEvrERF2HgBOPQiilUB9BNs5bpiJ6gvzKwE
	jw2WJ7WcghlDXhNOqaa+If11/G8/nPnfpCocwRMfezHsx7MpQIJSbdM8zE84P38t
	rfLe1aDznMKMnVMhRGpEc1LZTcb694kJohqMes2U3zjSm3IYffMI/NKi8IdrVhBT
	Bs+ns6QyNTJXMuHlYgGBL5yrKxUyRzGsz4hfZR3Zb86DHR8xwytPp7y9W0nYaOx1
	tMs8UFX3sHfYRv72gdnCYtSIlm09ktSi9x3EGGlysAs4RmgdWgZGaF5ig==
X-ME-Sender: <xms:4Q_EYnL7oeh6rBKRmkBNfBhSbqdS_1DH62InB2ESnn3wS-trxLYrgg>
    <xme:4Q_EYrKX7oUFXEz1jtfvtVjFSVJNMId4deU23Rf6SKakr_Klfcb_iRvdxCXzlTKpF
    ZJ2m5xP8l_qlWFR5YE>
X-ME-Received: 
 <xmr:4Q_EYvvaWI5G3SjCwAJOZJr4b5F-jL5brVXqAOxcIGpl193ESkupmkY2qaj6W3yz0iUo6h4wFQ4FCYgPml_iw3_VWNY7PKHiyOUFvyfG20cg9U6gkKzgCGwY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:4Q_EYgYr2j6qZpWuDgMHHIxmEJJ6aU-OAv62GcFdCdGv_I-cOQXflA>
    <xmx:4Q_EYuZ5V99U-a30EYmTHXaIldhP2M4McpSL8-y1zax9sQ529yRJQw>
    <xmx:4Q_EYkAnsgTIUNgn5I-uLC7xyWzKVQiDAL-jSf_tpf4UIOvfe4M37w>
    <xmx:4Q_EYhxRDahvBv0SZs8o2jqSFtHRHmuUa7Z11awcWTdQpfjMWhtW8g>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 06:18:08 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH 2/2] oci-image-tools: Add Upstream-Status
 to patch 0001
Date: Tue,  5 Jul 2022 12:17:50 +0200
Message-Id: <20220705101750.1729143-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705101750.1729143-1-andrei@gherzan.com>
References: <20220705101750.1729143-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jul 2022 10:18:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7403

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.patch    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/oci-image-tools/files/0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.patch b/recipes-containers/oci-image-tools/files/0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.patch
index 7e0b2a1..956bb2c 100644
--- a/recipes-containers/oci-image-tools/files/0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.patch
+++ b/recipes-containers/oci-image-tools/files/0001-tool-respect-GO-and-GOBUILDFLAGS-when-building.patch
@@ -8,6 +8,7 @@ build flags from our environemnt. Otherwise, we'll use the host
 settings for each and end up with a binary that cannot be run on
 the target.
 
+Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
  Makefile | 2 +-
-- 
2.25.1


