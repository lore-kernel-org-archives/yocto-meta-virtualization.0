Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348B8CCA47B
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 10:18:47 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web09.82914.1657016321345598895
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Jul 2022 03:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=hxTJz5XI;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AC5EF5C0127;
	Tue,  5 Jul 2022 06:18:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 05 Jul 2022 06:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1657016320; x=1657102720; bh=SC
	srAdLav1D8hAk3ru5FRcWwFEq98hS46DYmNGB91Vs=; b=hxTJz5XI5jcZL2oPK/
	Q4RtzR4Oiupwv22eJAMtFljl7yiEFAVNy4HHa/8iun8ZdOB6wl3SZijI+d1xmhzZ
	iRH33rQv6SMGeVzUkGXdeokCE1ZztAwPXpSa3RtoXWDggeHMYqJP5VXfWekolqSh
	XzFKnLtb5FvquOOKUkZ94xDIAx2JHuhiy2xPZ6f9nBnMr6YGOCIHxBHx5ufkzCJ1
	fC005CGGLUFz4baNYs0DMK2E6lLGqavfGOIkdu6g+C/WIoPBSqo9akHFZxpP5SxN
	Qv02bGjrKa+PtdVfQjhBKPLd6VZV0Xd4TnTQ+CdXm5NKO3iOpK5uS2s40KdoJy3d
	Nx5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1657016320; x=1657102720; bh=SCsrAdLav1D8h
	Ak3ru5FRcWwFEq98hS46DYmNGB91Vs=; b=hCrmsx/UQt6BbSbaZykUZ4v5zwwLw
	wnE2l0Y3YdW3yE9YP8OV7ckK5C+rHEBmeQBBpE+HO2a6j9Sa7eImrW4CnNh90Wet
	+orx+oJmR00tZMX0TOLXXrhw0HCujOavLHKBoJp7YFDGoi2R0aTMVtqaKsP8jjRC
	1wMIDq6CP0JwCnjRw/ma4OSOEUxGIpFGe4FuaU4fpnjxniK8X3mXc2M72V4slt5Z
	Vv5LXS+W3Xie/T1MoPE9l8K5/QyvD6ia6Vsy3rGVvxkPRCJQ482lRlxQNX9xTbZE
	8pfSkyjQuveDJFEAD2X14J2e3qDc/k1wIATV9Vep1iWo78Hho7PsNM24A==
X-ME-Sender: <xms:ABDEYqvqVWIKgDwAPpuTxGkA3sTRYGIV_PO8pviAfMYJ4z_H0yRK1g>
    <xme:ABDEYveoBPfu3UOBh3pBEKVnjLoqBgQtUnA65ACk-pnFzF0ra8AIW8T8oF3OMRxcu
    eYDGVeREO_RRxIXUQk>
X-ME-Received: 
 <xmr:ABDEYlwz3kmKcRpm1LVTGtqS5I8DyLmeYOTQ_P3mO3CLlE-PdPt4O9Pu5FBxlK0k4kP_OCyUIolW513CnPi0tF_Flipv6MW-j8_DFjgoxl4LXVMU7v6Yxjxp>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:ABDEYlPyc3s2JgtfmrKamxktuvBv02C6HMxyKireL-5NgQMdhmbKxQ>
    <xmx:ABDEYq-D3Fap7pu7iQWG_Tnhu7hzq-oDdQkpFcAjx9gahvzGXEJ2bg>
    <xmx:ABDEYtXnbcIgTNReyLYkKXJXhte_VjXx4OMGIgFJ4g_LFi1sRl-owQ>
    <xmx:ABDEYgnVyZsXaGiHyILxmhkcLRZ3SDw9cbk1bOTYs7Qx1g9pFv7nYA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 06:18:39 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 2/3] oci-image-tools: Add
 Upstream-Status to patch 0001
Date: Tue,  5 Jul 2022 12:18:29 +0200
Message-Id: <20220705101830.1729681-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705101830.1729681-1-andrei@gherzan.com>
References: <20220705101830.1729681-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Jul 2022 10:18:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7405

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


