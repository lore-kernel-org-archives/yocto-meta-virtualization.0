Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B83C19F2B
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:12:11 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web09.4089.1659431523343481796
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 02:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=PTfTiPQ6;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24,
 mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 94BFE3200902;
	Tue,  2 Aug 2022 05:12:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 02 Aug 2022 05:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1659431522; x=1659517922; bh=LB
	nxluB8eCFnZ1nk06d/DySn1uHzAw1/Yt5T/L5zFtQ=; b=PTfTiPQ6+7b3wTGUG+
	T7mnfADJy4cLpABOSQr/SwEBYQDLENwX35h73i1gpvUY7KU0JS/zPRe4h39j58M5
	7Xlk1K+3lR+JaXPAXWns+b3+gmBvyHntuV4ULTs9/FrcVQqil2TzlCETsdHQO4x7
	tUMDj02/YaztOf9XJx3RJoKa+e6vf5UTnTyI6Mtp/jxwnDCRtT0l1J7PF3qhhumJ
	d23zvfbAYwxiheCyc4GV/euXbToVfskVzXtZaGYflW/7dTihPCBPwWGuVEPwmeXi
	Got3bhZxsufsQdE5mZPZPd4BCGWIyKIdnCJO8BSBzcQLJaALIy5CeJLweOxzPGZ0
	ZLNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1659431522; x=1659517922; bh=LBnxluB8eCFnZ
	1nk06d/DySn1uHzAw1/Yt5T/L5zFtQ=; b=t3fILRUsccMhb6y0UprihWNyDBcH7
	WXMJLWedkrdAAH4CoWa5kYIIxN0IdawSTH1gJhPPUAqF6AOuBWYQrNErpJU8R0S4
	GzExlTJoc/nvusB9uKEUyxJDX6N9blYLWa/IAofyxDLMCdiPlJQjxaAyBJo5W/1n
	pxAxzFWX3p6ecMV6h7S4tqwy29APT06671yQpiAeGNK3rb0tKWlXMgowUZSDI7/E
	8Lqht5oQgPfyV9keCaLvbpa8oyHv/tDE9BihuM7JnqEkzy5h50zO5QKNg0aldnAJ
	mFVx/E745AdOjCe4s53HTFQuySt7GOSMMC6LbhMW7UmF5e6y7vbW8ABXw==
X-ME-Sender: <xms:YeroYonhGL3mNjDD_0IkWQkDoZ7m_0NvSm4NKR7J4zwiTrxs6GF_XQ>
    <xme:YeroYn05e94fmSTW_-evevvRWkvs_7f25zvCvNEMOqq00z0MDYL4PSGx5TnoZgXTG
    uAKX1kXzcn4lZ_qsnc>
X-ME-Received: 
 <xmr:YeroYmoguswDz_Yz205S9ip7_jCZafQq3u73Fc3ZDqIQiY_9Rci8Of7ehFBtyRHYYtkfYV3nPAvQkN5XLlxHMQo1R8wWIcTvAiwI13qeNGTvZc_ZlW2pyl-u>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvddvhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:YeroYkl1-nZ6P9b0GSPvbKk6OuREkzPqrnA_owi0sXVUyQbElcoC-g>
    <xmx:YeroYm1Kk1ceP4hoGyn_68GIFaFLQ999s9s-_EG-ODrGhtKxdSGzqA>
    <xmx:YeroYrs690EoYTIuTrakKaPNcpNs6ZJeVRlJfo-p03UsR81fr9afng>
    <xmx:YuroYr-ABUtQvBu_n1ZJ2JNnZ8Mm-urXqPdiF84hvkcj2zbGrrT5fg>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 05:12:00 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH 3/4] podman: Use gcc-based toolchain
Date: Tue,  2 Aug 2022 11:09:39 +0200
Message-Id: <20220802090940.3692953-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802090940.3692953-1-andrei@gherzan.com>
References: <20220802090940.3692953-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Aug 2022 09:12:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7484

From: Andrei Gherzan <andrei.gherzan@huawei.com>

clang-based builds are still broken due to:
https://github.com/llvm/llvm-project/issues/53999

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-containers/podman/podman_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 2bbc4dc..9b92094 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -44,6 +44,9 @@ exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"
 # overide LDFLAGS to allow podman to build without: "flag provided but not # defined: -Wl,-O1
 export LDFLAGS=""
 
+# https://github.com/llvm/llvm-project/issues/53999
+TOOLCHAIN = "gcc"
+
 inherit go goarch
 inherit systemd pkgconfig
 
-- 
2.25.1


