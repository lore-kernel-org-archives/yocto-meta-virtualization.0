Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDDDCCA47F
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 18:53:37 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web09.306.1657565607508326063
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 11:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=GdIOqKed;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 99FDF5C014F;
	Mon, 11 Jul 2022 14:53:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 11 Jul 2022 14:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1657565606; x=1657652006; bh=+IOGSc4rz0zlcDcCwxR+VVWQI
	uSAlMF9ZQkWRftF5tU=; b=GdIOqKedxSRZCLL3qkWtBoJ5q8r8kQYqloWnSKhYz
	d644Vh918apjgZwgeojCR2U6jhmPC39dkuD0MUUdkDQRTWecAsV5iPZrHb1RWamp
	3CzgdgGNTS0dK/uUnZGdd/ybS8Mil6FYK6Ws65vQ0kAWuACmL8ZNLJsSCIL1Uh+/
	COaHldD+q1qMS4+1aTXqwGqqmrWPY7yuwn6SLW0jNnxxu34NtVhKDFlrqMPs7UJs
	y1DwczXaVahjLxeccyr7Pnt9JqBq6HplfX1rD5XnslnaH9bLlzEp/SvPE3l6qlgq
	sVW5b7pZOnBjwC9PpT4JyYei4M/HYlydDnC/lebenWwBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1657565606; x=1657652006; bh=+IOGSc4rz0zlcDcCwxR+VVWQIuSAlMF9ZQk
	WRftF5tU=; b=gdWegEFR42iMjvdvDLKLGLn5JM3u9DV5JD5EOZfoVYQpiBd+Dss
	KieJkziSPGKUFlcuOwWZt7Bidmbk2oYj7Cy8VIEI5SKpsh888cGenrgeOT5quhkv
	YdAKMdHhyNTei8cALm2UUkHJdOqvMG9O9YlbZlCf+icBDTCCMCbP31F51POWjkqL
	RO3Rp5aP3TGJKH8/K3vr0wWDNy1m6Gvwc/BQ6OtWGuLrbHfJ2kOQ1Zi8okMYG/ge
	CMmzK9F3H09fG7xD+JBggQ3raDbVYpGQFGyh88Ltigw+QRGuryyEeyeYn4h3Oq8B
	7o949cvsVxCz2qI2p/C/Dj9EJiMwoTJkF9g==
X-ME-Sender: <xms:pXHMYodBBIUd4zpNg6MIUoYKBuETBNHB6VHFTfygmZPrUV65q2LkuA>
    <xme:pXHMYqNMGTiPax2J8V-SCYzPXnuhj_vulqIIurVd5vQYwKLCnhQ66RMvXAZHKJCVn
    uYSQ5lqdhQqD16zTzA>
X-ME-Received: 
 <xmr:pXHMYphrRJWcTNgALFUwfmM_Rn2tv9DAOpfPzM33WxoofhrE-wr543j_5kg9wffhXlJ0H6tAr0es2BglwTCIkCjmd-dJRtveTHekb7-F0tQihrZXE-YcXNZK>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeelhfevveelffevgeefte
    eljeetvdegjedttdehhffhtdeihfevgeffgeegkeenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:pXHMYt_Lz0s2Ai8gSbX1tAzv8XTVdFKqOymv_8sxAo9HMYXnYX4SCA>
    <xmx:pXHMYkvse4gZTgFeqZzXhytABnvn4SzHtK4TOLizKOP-GjRJyKpKRw>
    <xmx:pXHMYkGaGdMalPZZyJqK0eEHKBa6RBWwEaKhSKntQhhuSeZZC7qLUA>
    <xmx:pnHMYhXU-ug7pN0KgXDBoWI-p0OW4HpGy2J7ABm-OvywPcWWvdobCw>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 14:53:25 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH v2 1/4] slirp4netns: Runtime recommend
 the tun kernel module
Date: Mon, 11 Jul 2022 20:53:02 +0200
Message-Id: <20220711185305.705539-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 18:53:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7436

From: Andrei Gherzan <andrei.gherzan@huawei.com>

slirp4netns uses a TAP device to connect to the internet in an
unprivileged way. Without the required kernel support (TAP/TUN),
slirp4netns will fail at runtime.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-networking/slirp4netns/slirp4netns_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-networking/slirp4netns/slirp4netns_git.bb b/recipes-networking/slirp4netns/slirp4netns_git.bb
index a63871c..6526d39 100644
--- a/recipes-networking/slirp4netns/slirp4netns_git.bb
+++ b/recipes-networking/slirp4netns/slirp4netns_git.bb
@@ -18,4 +18,6 @@ DEPENDS = "glib-2.0 libcap libseccomp libslirp"
 
 S = "${WORKDIR}/git"
 
+RRECOMMENDS:${PN} += "kernel-module-tun"
+
 inherit autotools pkgconfig
-- 
2.25.1


