Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451D3C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:12:11 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web09.4090.1659431527381398707
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Aug 2022 02:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=DjxMhhtV;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 9CC0B3200922;
	Tue,  2 Aug 2022 05:12:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 02 Aug 2022 05:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1659431526; x=1659517926; bh=Ry
	gI+gKCleAKIr5s1LWQ9pxwjG3omEhSFXipNCHVIHI=; b=DjxMhhtVvr2piAjYGJ
	h1gs9CSLAH7vAp+ZhWfWzdVpigThs2f6rsfO7gny/MSSK9GH4kNBl1YV0Ejwj5aW
	NxHM+cjHEGA7PmNU3NLIXuE8zSR53+0G4M3vESL/tgacuuNoXe32gBxkFaoQ9cSQ
	tR5yLbDCWIPZGgAppzJMwoeUGQAX5iOHJsFGybuywIvo6dtVoM8sNuKolEfIM+FU
	dTSDQv+1VZNn45PIkBsPIGHJIQePNo+q5yoZBh4qIDtGCyl3voFYOW42J9GOu+tf
	K/Tp5pEKY4AKEleH+5/pE0OJs8/LopZBQqV1s6IJx+69Nz5Jj13uLey02XAqC6Z8
	FlMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1659431526; x=1659517926; bh=RygI+gKCleAKI
	r5s1LWQ9pxwjG3omEhSFXipNCHVIHI=; b=naU/GNr3NnvXG4/cvjBXRI4SD/jsk
	K/QRx+p6ACyz5NBfdHdjXxMg3adOyEufcz6bMVVV93CDq9Qmw/k6wQlRZdr+rSse
	4U86zYtAcLAZOwUfjS+tAPc4dME39u3+NlBGTBlGKqtrWSeiFr0gINIzTbrHco3U
	zTOTJpgglMvCF9gWgkJZGxr80M6EwbbrvjaFFXRIn610utKVOR+61ORh+5ZAvFwC
	T2LrvlEwiZrbgS7/4x3xc9xRlPdZk82vdyZHayxT7vjS17QmCIOP+RXCE4nMvKC6
	4ZlQVa1qVUFutZSVhe3fm6dW12fbZIw6xBmvGpYpzyZCdZDBIHjEGGbYg==
X-ME-Sender: <xms:ZeroYqPBqwLvXEqoDe7KZU-4KGh0Kp01G48r7CuV-VsJ7RRflBgSsg>
    <xme:ZeroYo8AVJdBBDsHGhfHZjpdvoMNmf8RjHYJQ3vabr6XQFSHj4cZ1RWrf4_kNZqPy
    PSTq2Lu0yyVjAFVhm0>
X-ME-Received: 
 <xmr:ZeroYhQPeWS9Bynn4TLb3xnre7dWQ3DF7WrPBEkFgxHU5V7gpmurEFtm734Ie81E9QJc1r_UnnbryjGg2f7yEKXdj8O5791q-zFQGE_z92Y6_wcT2okZJzZX>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvddvhedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeetnhgurhgvihcuifhhvghriigrnhcuoegrnhgurhgvihes
    ghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepueelheegjeehgeefgfduie
    ekgeegfedvledtleejtefgledvkefhffeuvdejudfgnecuffhomhgrihhnpehgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:ZeroYqvPag4G__P3w3lODaw-ilqss-QXpKVVInkbxit_AatqyCY7LA>
    <xmx:ZeroYifS9RHJwHOo0R8kymAy4a-z9nz__A9uVVUU07GtnrNgN79iIQ>
    <xmx:ZeroYu0gVI8hULJ8kItsDnq8Tkv3tv3njHPR76Q9JZVsl7zcyP3bgA>
    <xmx:ZuroYmEFzoY7NDI4dQ4toRzsjmykE63mO9ovf8cCZVrlOiJxZhv9Ig>
Feedback-ID: i68994715:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 05:12:04 -0400 (EDT)
From: Andrei Gherzan <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-virtualization][PATCH 4/4] cni: Use gcc-based toolchain
Date: Tue,  2 Aug 2022 11:09:40 +0200
Message-Id: <20220802090940.3692953-4-andrei@gherzan.com>
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
 https://lists.yoctoproject.org/g/meta-virtualization/message/7485

From: Andrei Gherzan <andrei.gherzan@huawei.com>

clang-based builds are still broken due to:
https://github.com/llvm/llvm-project/issues/53999

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 recipes-networking/cni/cni_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 7749312..81988ce 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -28,6 +28,9 @@ PV = "v1.1.0+git${SRCREV_cni}"
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


