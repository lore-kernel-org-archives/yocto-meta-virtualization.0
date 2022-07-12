Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9A9C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:20:20 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web11.9575.1657635617895463961
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=lNpKH9tK;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 293553200922;
	Tue, 12 Jul 2022 10:20:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 12 Jul 2022 10:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1657635616; x=1657722016; bh=+IOGSc4rz0zlcDcCwxR+VVWQI
	uSAlMF9ZQkWRftF5tU=; b=lNpKH9tKlxImFbzi310MqjKp7yp0aSMcJBwHbOGcL
	GAoVB1/kd9o/w2Py69O8MIrMv/Him7WvwdcGEazWQPwT2SwrQKV21P2Y9Fq2WSBc
	SJbvSwx5wHQGInXccDQZPo82mSTHPNKsq6WBovFeVTCytBBllW32k4FNO96Mpj5f
	oHxkzWfJ4b0ao652SlgheCXx9uohwiE88I0LQ6CVqEGNczqPwWY5VZXJg0RIfpfG
	gFzrU8pXXF0IpMYKyAna1U6qafksG3UAO9enjjwri40CGEX5Cp3dcj83h1yE/qlU
	WGRn8qblgES5trFG2jkHvsAKGqjaXp9zTn11FIngnLImw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1657635616; x=1657722016; bh=+IOGSc4rz0zlcDcCwxR+VVWQIuSAlMF9ZQk
	WRftF5tU=; b=JF+SwPJAY5TZ8J7E0iUKSnrV2VPFsEKkbz0VdhgGUkvu+eEzfmV
	uCggNg44BJiKSFjbvtJoui1cACOZMu4QwCVlFp1ExX6OVcY9rcZ5s/ykUePSdHOM
	1aZatJYnqZgx45PxrViUqpoJxc62vwmAPe8bP4NAot/TsYm2KvpVgEbivjMU4ZQs
	pNOsAvi6aDubAYmXyZLLkA+Dy3ymtBy6+gg+kZHpgGYaSj9OqPczi9s3V/1GUM6B
	JrqAgvXNecIPElmTCPVbGUwHrMbpu3xKU0YeoFhHQwZG3pUuHlmgUOPwpAmBvLxm
	1vXsWVjyFDiwoYByXnKJQGOUXy0eQKaOpRg==
X-ME-Sender: <xms:IIPNYv0E1nxMuhzsx-cXuu37gDFwxJbTP7Yl4I2gO3wRaBrQOGhhlQ>
    <xme:IIPNYuGJzbaVMfKlEQCl7ZTth0lHsjYTMxa5GqKmGtzYIWEujzr7iSjmexVhulwSJ
    KY_3UAnG8K7d4DanQk>
X-ME-Received: 
 <xmr:IIPNYv4yMLCNgi_2cWqV_8O6lN6-4454JEz85i9-xtUrDMKe94kL-wwy14hoDSkPSYl2rezyVyWWOySirxINNGtwJzwtx6qoWRY9JJwesuEKs4FLgyCEbAUC>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihesghhh
    vghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepieejlefhveevleffveegfeetle
    ejtedvgeejtddthefhhfdtiefhveegffeggeeknecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:IIPNYk1WYd1lw_gG-UujbpL3FsIYYPqjnreBtnEBo_TcQdNcYaYzDw>
    <xmx:IIPNYiGxOkcPqQ6otZD474wo9IF_F48SJY2DQ-axtwCGHvaUzuLfCg>
    <xmx:IIPNYl-tc3jMPD3apRQxTohxINsTXXFzybpMaJhw_LLjNDUjlcdUqw>
    <xmx:IIPNYkP-nWVmqFwd1IE9byrBcDkJcAKOhftuDj2TemdnzW8BotsErQ>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 10:20:15 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH v2 1/4] slirp4netns: Runtime
 recommend the tun kernel module
Date: Tue, 12 Jul 2022 16:19:58 +0200
Message-Id: <20220712142001.881461-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:20:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7445

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


