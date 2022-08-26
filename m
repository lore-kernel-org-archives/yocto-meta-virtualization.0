Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB841ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 11:38:25 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web09.36065.1661513900059321806
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 04:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=np+fPsiY;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 66A605C03C0;
	Fri, 26 Aug 2022 07:38:19 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Fri, 26 Aug 2022 07:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661513899; x=1661600299; bh=YGJvQ1BBFV
	3DKtemOzCRI5IlnvsCP2Xgi6FYsNjffB0=; b=np+fPsiY4kJebw4J2wjJUcEciZ
	1Sc2PvBYWaSLJirsWXQf+Nw+B+EtLquoIHz2hz/4DHvJjAUXDvfyS19FMfL8QdyW
	25t4k+Xk/hcvOe2eSdZ5ucS5rLJ0gzvxDAZV21BwIHD7yExqv6AGo88zBL6+lxdh
	fxWF7IJY585FPxCqaXJvIyqVosg+Yok/2ZxBtNcqQPPQDojX+FsZGMLOJvuNupJU
	y4DOY+jtIbu4Fv7VoTJb5auQKnnq4l54DbCunYKwlSivt+oY+UgzIRGJGv6kqsCA
	qLWcSp6ZoATfhK7Az4sECgjAhrI4G+2Tml3H+AQgDNLU/XCNLOAIIYPmkLLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661513899; x=1661600299; bh=YGJvQ1BBFV3DKtemOzCRI5IlnvsC
	P2Xgi6FYsNjffB0=; b=Wb6nv0lDS6z1MQ7FPiZ5HivK048ULu9RA/zieuifvkHb
	VoLvj3q003yamagoncvIBwensjIV64W2o5wxag/4HBw9Dqpg7AwDqPGTCmYGc375
	lL7dBdmptzoQqsPNchG8u7ai21+WkHw2XznXllad8/Mx+MSFpP7OxLCx/cJBtxzZ
	zRmCvLlnzfTbjlURe/EMP+KbUWrbRq9RR1VJN5DX8ck0WAJO3oL+pwmnCp7svrSd
	1z7U9DLTpTwzoYbd4GmMyXOfUtvbfqZjn9FwFz2dyxFE86mPkKKG/s1gU1MrwNc7
	kcrekCQYAmZ1UCBhKlesp+qLyQGgQ7O2OwuB75NfMQ==
X-ME-Sender: <xms:qrAIY4KsczDX94xwwbq8DRk-UaLa4oIEHw_CZWp3B5PefeRXfd_r8Q>
    <xme:qrAIY4JbC5ob_jnAmezews2qrMFxOT_4nCJO-RnKhg3haGbOd4tgxs7MqCcV8fW8f
    magbbPPm6NVllk_gM0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnhepkeeggeefhffgheejffdtteekleekhfelffdvheejgeffueev
    ffelkefhkeefheehnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:qrAIY4saRdpydrQERjLspATCxUYk1R6AjpSSlmuZVtpJyxoie6KGHA>
    <xmx:qrAIY1abTEyc4990aGBjPT6vtgqajqJnJNRKJci3KrLOeuatHhwDtA>
    <xmx:qrAIY_YruVMKUpro-3zlIsv5pSjrXPfpJcqtiBCOsHp7dQlm1KGTjQ>
    <xmx:q7AIYwDeyGHcYV1i9NRhShUp3l2bRj0n5F--kjIl0vGX_B9FlDqL_g>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E4DEE2340077; Fri, 26 Aug 2022 07:38:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <70bdaadb-e6a2-47ad-aefd-5aee5ec35b0b@www.fastmail.com>
In-Reply-To: <20220826025610.GE23530@gmail.com>
References: <20220825170933.1046874-1-andrei@gherzan.com>
 <20220826025610.GE23530@gmail.com>
Date: Fri, 26 Aug 2022 12:37:58 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH] podman: Patch for
 CVE-2022-27649
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 11:38:25 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7574

On Fri, 26 Aug 2022, at 03:56, Bruce Ashfield wrote:
> This doesn't apply to my kirkstone branches, can you double
> check the patch ?

Right. There was a conflict with the other commit I sent for podman (sysctl cfg ordering filename). Fixed and repushed as v2: https://lists.yoctoproject.org/g/meta-virtualization/message/7573

Thanks,
Andrei

