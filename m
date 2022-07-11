Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F888C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:00:50 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web11.28244.1657544444631679812
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=dwnhV0G8;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E560C5C0132;
	Mon, 11 Jul 2022 09:00:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 11 Jul 2022 09:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1657544443; x=1657630843; bh=7kGEOmPvT4bi3GG1/oOQkGMYz
	pjXs55EyIxXbi1Pf/8=; b=dwnhV0G87mjPDDenhCeTLfHUH5gSBZvn7M4NOrp3M
	GTfakZ2REZd9+F7W8/RiKsYXg2WNDwfxZ4/JftawA2sIEKBv/K/qQrFA3AIwE2uH
	oue+29aejcgst8TxYRg3i1SUXwtTRG7d49pm9pgb9lVaWVisq/qywpheSdcu3xZA
	NwJFbIs27QZEHA166PvfUQUl+DTrITiWd0VHeQNuCv6ckG/PJXVl+xxR0CxiveHL
	+gqTrCbaXQWI9E1uOHu6uf1sxievH7WPmldOHiyekMJDAVI0l2Mx9LwybwYkChvf
	6Yex0mwrL7gqz8ivNuHtbSJmlffim2TmuwLOD8wRry7SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1657544443; x=1657630843; bh=7kGEOmPvT4bi3GG1/oOQkGMYzpjXs55EyIx
	Xbi1Pf/8=; b=hEdfUzWgsH1GYkW/Y44CgWifvHtXBeDz1/C/6utgKKBwYy5A3AV
	YhV/j64lANvZhKSH6tym3R7M4qYrT+1cx951x2UCyny3SWaV/sgPxyeCPo/BRPLA
	CPI1qNxLzJbC91GtYRczVTRQ6/BNCCmOBbc0IO7lzGrvJ0XBF1/P1pkZdYFgdsp+
	QA8C6dRivozRcsM/+8MIqQktLWw6rmBgs311V+yR8L/D7cd2WxCt4kKs6Kb3JyW4
	UocekdBtJrUXnxyQDa4bK63YGEfhYJRmj7HbFKkA0dy9xlSC+sGmWmAZnftMuffF
	r788PP3JIEjdJuCdJaFhCPURgKPZlM6OcjQ==
X-ME-Sender: <xms:-x7MYrdaBv5Y4TdegRf7emciHns7Wfhg7lTwlUEqKC_RszNhXpz-_A>
    <xme:-x7MYhMm33gyEFzlw4wfnGlNRAwCpYF9uDmMkIvbbZNg4fuZHH2tKb4nyVfchRTfO
    rCHjYdb11AgOTLz5nY>
X-ME-Received: 
 <xmr:-x7MYkigHH5KWpOgU6Yj-O39e0vJk08_sTO2dhyiN5Rgj31CVNRApZQ1AgDBf_U1Fn6NdrVkCd6IlRWzP0mJnuVLsWR2FfOtWyYrGK9osEqcOA3KB2KFbP5g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:-x7MYs9adOFSGJSNFre3JyB1XVG-ydbrbjljmjYmo8cc7oLFZehI-w>
    <xmx:-x7MYntoOP1s8rTib6aP9w80CxmhBZUNdq8dpztvmZFV-PYc1M4G3Q>
    <xmx:-x7MYrGaLfvnkjwxACaNbB81ypsBc87VVee1FM6KZ6C6DUSIrPkNnA>
    <xmx:-x7MYgVRqCDq5Ne6u-quCBagMMv9X_RGD8OSvpwfLx9tcGhxuDS2XQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 09:00:42 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH 1/3] slirp4netns: Require tun kernel
 module
Date: Mon, 11 Jul 2022 15:00:20 +0200
Message-Id: <20220711130022.3264142-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:00:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7421

From: Andrei Gherzan <andrei.gherzan@huawei.com>

slirp4netns uses a TAP device to connect to the internet in an
unprivileged way. Without the required kernel support (TAP/TUN),
slirp4netns will fail at runtime.

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-networking/slirp4netns/slirp4netns_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-networking/slirp4netns/slirp4netns_git.bb b/recipes-networking/slirp4netns/slirp4netns_git.bb
index a63871c..4bf25b8 100644
--- a/recipes-networking/slirp4netns/slirp4netns_git.bb
+++ b/recipes-networking/slirp4netns/slirp4netns_git.bb
@@ -18,4 +18,6 @@ DEPENDS = "glib-2.0 libcap libseccomp libslirp"
 
 S = "${WORKDIR}/git"
 
+RDEPENDS:${PN} += "kernel-module-tun"
+
 inherit autotools pkgconfig
-- 
2.25.1


