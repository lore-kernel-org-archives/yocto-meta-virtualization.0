Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DAACCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:01:20 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.28140.1657544476720267446
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=Cbhf8t3K;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1431F5C0134;
	Mon, 11 Jul 2022 09:01:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 11 Jul 2022 09:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1657544476; x=1657630876; bh=Xt
	6EkqSBpagSt0PeKLrWC3rRH7JPJrLdwqCakjpQ97c=; b=Cbhf8t3KZQXWOuyUMZ
	VEWu4PRpCh352qhnv8bKepbe6polfqw++JGDTp77uuycLIMpJ46LWGU3nBWIrXSG
	ps8B3NfDb8zp89Y5d651GmCz3ZmQcNrmPaHwMmBOpqGik2tF3cZJZOCCUbtAp6jw
	NYLDZhMSeSki8xJ66sD5El19btsbq4zr+lGLxm4GKmiq4e3TFlEZ+bRBfP4lk9W8
	Y52AANX1PapjRlyCMLgZLJY4kv1/5oCnZKICwcqnHPfEWd9HLfVisGOI+qw96xrq
	VVZb/xWAT7Tpg//G/21TDq+y4lHmoycA4ACUgM8I2a0z/ZJdpriAmanu8yXJqjm2
	xTjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1657544476; x=1657630876; bh=Xt6EkqSBpagSt
	0PeKLrWC3rRH7JPJrLdwqCakjpQ97c=; b=OpgabIVH1YnzAzyB/q7i8r8QpGOgE
	YZZkee6DznQmk5CQK9qcZOl9l6tozVQ9mAjTntmjNEDXVAd/0VPRh8P1WPJzYJmo
	3w1dDd4Cwk5iwKQNq/skwIA9V0slZeRB5VPO1GX/jaekKnF6Dh73wqODTkak+Yts
	4pKOIppdpvekcMXTGoVm5P+dEOaVL6wXrJyhYau1rpy/Uf5usM8raUrxKqx+TNpB
	9y1d24sEkiQ1LpuqNoYElv9nXEz/E1ttyU9I2Cr4/S/B/W99IMglT2rF9l/cQnJc
	X/asuC1ItnkVzFH8nOVpHI7tff2+rO5OZxqtDMjWhsq10tKSYmRP8Ez2A==
X-ME-Sender: <xms:Gx_MYjcpGIaERt-XemVLHSGZFL-cT-CZ5luT_BxYW5RJHef80WEjrA>
    <xme:Gx_MYpMS-8Wfm6HO5cJGhk7x-7f1woFwG3EsjFdkyaMJMHrZZqVME9fheXaxKwm5l
    ayFw-9VfjOddd7fgqo>
X-ME-Received: 
 <xmr:Gx_MYshSe28N9pBIsb-00JW_Dhy0Fh1rkKEGKYzjHWGwxT_QWfNGxlesmxW6j2Y15eea9RKM8LsAFDrTsOY4C6tY2tRjGUVDXJGb0oGbcyGso5rF3mdcXhvK>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepjefhvefhgefgffejgeelke
    ejleeiffejgffgkeeggfffgfffieeffeeghefhtdffnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:Gx_MYk9bJUkPFouDzcAVxNZCPDHMpqnWvTQiVTFLVpKdo_IN-XrfQg>
    <xmx:Gx_MYvueCKAQSCBi9j5g5ckA7_2TqpZew9hxsOGkuquuC1QBG6rZ1A>
    <xmx:Gx_MYjHPy5xEsEwy1WcoDBvyhxhRNdsNwBYgwqJ046oESwfTPMmLyg>
    <xmx:HB_MYoXhSAAvgHB7Td2cM8zm_Q1DaOqLOB50297Ey0LlfBxwj1ZYLg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 09:01:15 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 2/3] podman: Silence docker
 emulation warnings
Date: Mon, 11 Jul 2022 15:01:09 +0200
Message-Id: <20220711130110.3264816-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711130110.3264816-1-andrei@gherzan.com>
References: <20220711130110.3264816-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:01:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7425

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Podman can run in via a docker symlink emulating docker commands. By
default this generates a runtime warning. This change silences it via
the provided interface.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 727a298..4693bd6 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -93,6 +93,10 @@ do_install() {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'docker', 'true', 'false', d)}; then
 		oe_runmake install.docker DESTDIR="${D}"
 	fi
+
+	# Silence docker emulation warnings.
+	mkdir -p ${D}/etc/containers
+	touch ${D}/etc/containers/nodocker
 }
 
 FILES:${PN} += " \
-- 
2.25.1


