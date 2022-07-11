Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7A9C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:01:20 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.28139.1657544475757343023
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=PFOdbZkD;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 1D38E5C009E;
	Mon, 11 Jul 2022 09:01:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 09:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1657544475; x=1657630875; bh=7kGEOmPvT4bi3GG1/oOQkGMYz
	pjXs55EyIxXbi1Pf/8=; b=PFOdbZkDXPYVlEYoN+gr8nRX6sFB+qeOZO09rfsNF
	Q6lk9BMYf2HqS0G8dNVIWN83oFQYOx36SbYirPHmWFKNmgUdZgZu0vzLZPRtjdRD
	CNePlnmnKQy60Z3XUueMw1B8FfDpltAypUddrIcwe1x2WWukVkAoiR7z1B5zPNNn
	l/TRn/Xjy48T1pWjDwIg8SEAl+msNten7MEA5hPX1mvETNB943X/CzDvmpXVGoXs
	N45hTnE2Mq3KZnFtCt7qRubUiUNk+9rxYQbTJQqJv+09OQPVn83PygLiHIeotfcL
	TKvMJf5VnYxMW+fJRmq07fPhchwx7/eGls+/E5LJUvUmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1657544475; x=1657630875; bh=7kGEOmPvT4bi3GG1/oOQkGMYzpjXs55EyIx
	Xbi1Pf/8=; b=E7j9beBsneKh+3Ndiqtqyr4wpfE0HyB+iWTaoxjDxXK+UExA02o
	UXvlQ5amHVJAwOzxq4ucqJMk7Sr887LzJw4cDkL5I2jlce4YV5TuvNYIcajHcxc7
	MoV2DsIj63NfacFpP+JXXg4yaNLOXi98PJpQ0Stq2dE72yX5gTOOPrup+THTW1PU
	ydrWip4bgphdX5lyjDU9mC0bS1k23gOKoFMYL6+0gUeuhVw5mXYVSFmP0b7LPUvV
	1a7GF/yoG//EcoyxKs+Qq6pfrq8ZyHBReYqT/e8W2WX4VcAFL8Pju20zzJ6kHK6V
	LDuQ0k1tPmD5FDovmNFAOM2T7SKaEmgg4PQ==
X-ME-Sender: <xms:Gh_MYoTy7ncDmrRIKe-CyQXaXWJL3Yn0Ulhwv0Bd8Xa51oFgOG5LQQ>
    <xme:Gh_MYlz2RRBzzrvMJTuXpoFtMA07iwpF5mFueIXjCdt-h1bx9NXq3xK_rl_C1ud7a
    2BhmqUmvGXpV9PGxgQ>
X-ME-Received: 
 <xmr:Gh_MYl3lUKWWSVnEViWpKzHLexZ-f-FHKBjeVw7XjMl2m_9C9CDqjSb_hOdSfHqJLUoARlyqb4jZnTcFP516irNDKck-xepARqF5NsgarAMCw_3Y6nMGRSpS>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:Gh_MYsCiIm7mx0TBtyv6E3hP8YYTufRw_dVC1fizCt7dMe612fAAOg>
    <xmx:Gh_MYhiQO8iP7rIGlZtKSEWLgB0UdjoqX61oYSH22dmle9PCP9CDug>
    <xmx:Gh_MYoqG2OtUxbzsHZ1XLfVBl6InwEse7WiXTH5FzWXXeXbBjDlRmQ>
    <xmx:Gx_MYhZGo5YPcdOacKdUp8nlOdOwyDukM1pBrWhk5CZWYecrTlNulA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 09:01:14 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 1/3] slirp4netns: Require tun
 kernel module
Date: Mon, 11 Jul 2022 15:01:08 +0200
Message-Id: <20220711130110.3264816-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:01:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7424

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


