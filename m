Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F54C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:13:11 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web12.3974.1659431582587853926
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 02:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=DZREDu67;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24,
 mailfrom: andrei@gherzan.com)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id CD7DA32005D8;
	Tue,  2 Aug 2022 05:13:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 02 Aug 2022 05:13:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1659431581; x=1659517981; bh=IG
	QVjctJ2bpm9pUaV+LGkfka6Mwyn1Yegd55dP/nDu8=; b=DZREDu67ZtoKhV9EYf
	9LLRi8GnFF4+t/ZxPLiKUsDc3Vg18RTx08yN1MOo4Lx26xYNYy8NcppyKb/ZsIvT
	+6QlvC0X3IUfgmyh9sQf1GBrm3f96sIZH4SScz2f9ad8bfUv0g+yHqrWteJ1ko9r
	CbfOYRSZ96lhGpSmIwK9ciw0fbJYNhCj3Tdtgjvk1YR7vQFoIF/72YHdDdf7V0EE
	3W18adTkSNgyncsNIcZ4YIh2DFhvDQEHSaMJruOHgvbId1ivZn+/p867O2d8T/YV
	WZXMl5lfOBXisoTgeoyarQZDzRIJ0vLkLobwNt5DYQtdZDnkjeVTdzedPXbPeCjS
	KBkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1659431581; x=1659517981; bh=IGQVjctJ2bpm9
	pUaV+LGkfka6Mwyn1Yegd55dP/nDu8=; b=kSkLHgEOf1l1CPXc6eTZbp3BZoLfq
	p947eISy0rb+VEkIdWfhkwpalk0hNKR7tXMOgcSBS0moWgLNvKVax+0XNfkq24mr
	iN9MFy0rgu644ZQt7CuHX37BM0NxBqFiP8fyui+XMIZQCqVX8Xl0TKLc+pRSFQC5
	mSOMxtpU8B3V4nkVO/zmISHFPcAK6TxWl8iPSmhOTdfJPtc8KHpqDLCOUfCr0dwt
	HAjly1jsURwkNhBQ3WsXx4QFQMf/HgzRW1qQCVsmbyEv7ilz+0mfZwuy7Sb/BrS7
	eRZIpemi24/kDusT8Etd9Fm7l2862s5GwzudAA1l8fv2VUQftH41Brdxg==
X-ME-Sender: <xms:neroYti5x8ogYNw8D5Tp8cj_3iFr1jYIp_FORmpzbPGZzGMSKke-QQ>
    <xme:neroYiBNGLNnrlZoiHqy6c0B2I9EeyRZ8jLrxCYm89ILt8_zOA5y9RpH653TRZ85B
    6LFjYXdghZMi2ZbLrM>
X-ME-Received: 
 <xmr:neroYtHug-ft8FUEIkXCS37BuHzdlrkkc7x3vEcxZoVEsIALBBUHUHtW3Mtj00gK3Nd_DgaB_Q9Htw20kmrf6sm4JuJvNKYJqHGEMuMcVoBcLPaS-F6msxR_>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvddvhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:neroYiThS8eeJV0UG37c_XFYoyGGEuurqWFzkk1jytWQHduSeTlu3Q>
    <xmx:neroYqz4CAkJUC5Mea9tOUwYeA-gBTPXdVN1qBQyJfh_Gc5qpgge4w>
    <xmx:neroYo4Fs88XQm01Kyv6W0R6oq04IS_JHMyHPtHy2iBvIjAErQK7hg>
    <xmx:neroYvpsKNOGuPABZd0D6G39zi0zvsPVQZI6gnK-6YUYEKnpIVxGiA>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 05:13:00 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][kirkstone][PATCH 4/4] cni: Use gcc-based
 toolchain
Date: Tue,  2 Aug 2022 11:12:49 +0200
Message-Id: <20220802091249.3695386-4-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802091249.3695386-1-andrei@gherzan.com>
References: <20220802091249.3695386-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Aug 2022 09:13:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7489

From: Andrei Gherzan <andrei.gherzan@huawei.com>

clang-based builds are still broken due to:
https://github.com/llvm/llvm-project/issues/53999

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-networking/cni/cni_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 63c3929..cac62ae 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -29,6 +29,9 @@ PV = "v1.0.1+git${SRCREV_cni}"
 inherit go
 inherit goarch
 
+# https://github.com/llvm/llvm-project/issues/53999
+TOOLCHAIN = "gcc"
+
 do_compile() {
 	mkdir -p ${S}/src/github.com/containernetworking
 	ln -sfr ${S}/src/import ${S}/src/github.com/containernetworking/cni
-- 
2.25.1


