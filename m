Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BC9C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 10:06:03 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web10.5877.1662545159150858984
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 03:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=uF1lhHTd;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7B5DD5C00E8;
	Wed,  7 Sep 2022 06:05:58 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 07 Sep 2022 06:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1662545158; x=1662631558; bh=wJj2uVBb4b
	xoiMVi1uZhxrfU+YkSFZFjTHKC7INwxKM=; b=uF1lhHTd7ZjRK5qD0VDsMz4GUP
	XX5J/hcHEwdhxawPHX3NAV0OIr7zH6BWxJTsczL/kc0bW8eQb6n0NVjxLx3AtPq6
	ioVaeLgQLzeO36YlO2+7IQ48U4j11cJaIToN5KQt4UfvRXtDLxGTotRJjKiKdGXP
	T5r+jIZNMlpOuf0cC2ItsCVxh3nraTteJSR6Mvo4J/qiQIlV3yUvioDm05FSM5NL
	co2H04PcpzaRw2YRsNguCFW0tAO//AmT8/ejpZ5mHORGwjrrJhvluGZq6fkkwCtn
	KqokdRFem7dGIC7y2YqCWynthTn3IJH6KezxXbsMRVztsVjVZYYdyFOigzEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1662545158; x=1662631558; bh=wJj2uVBb4bxoiMVi1uZhxrfU+YkS
	FZFjTHKC7INwxKM=; b=aJEVhX07R3xgpu2WVBxfLuDTtlubvD8fnk8YCi6xwX/J
	fJ7lDGd37BY38NlQoJurPchrTp4LxHfbxGRxG7/uHuBY8ua/4W7eumrSonsJQwPc
	/mdNTKsoy9m6p0oJUc/9nEpd8UAR6Hf2LpaPAKpgyvhNEcRlGksthiOgeX6UFS58
	PkahuO3GXVRBKjI5y3idlVPIDBcZ/QiXU4A5KW3M8RYhCjl18j2KDfGnwbZ6vsCC
	Rb6ynDwrgpOXmiDa3fFEttns3QmkfR71XMw88tStEdhppYB6hJXSR4pfvCWf6QG4
	aZphcZ4E5iwZsgBhCzCsKWn0P1YyyfUX3ssmDOHqWg==
X-ME-Sender: <xms:BW0YY1DOty7Av1_ayHJ2VG5bhq34dWi6V0mgj0OAOBQJhSfabgD2vg>
    <xme:BW0YYzjUVOG5B3L13n_DhCj1bKo54fkok_23S5EhyScIgigQ2iDtPamV_FBxSQo_h
    ENN3h2UZggWiTNEP9s>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:Bm0YYwkEyVLjnRhKk8t3iYqtoZvXBF-pe3nvya7LKgR9hT_aWG4kDg>
    <xmx:Bm0YY_w5ZqQ1KjA6av4RBz8LoUwHPJ6nVeuMQmU3SPjZkwWYBJPidA>
    <xmx:Bm0YY6TcMhCgWKDJ6v7xmt9VPIYAv4G_m36d6dkEt3LNnZk-v4nm6A>
    <xmx:Bm0YYz45BdoSzlhE1CALucVpEDafYV0iO_ryQ50LTJxxQ-dC8UzHPg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E38392340080; Wed,  7 Sep 2022 06:05:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <1cb62eb8-e0fd-484d-902f-d3eae6109ccf@www.fastmail.com>
In-Reply-To: 
 <CADkTA4Nvw4MOQGygA6qvByjRY5u-nzcvtVNPjnQwajTypZDBeQ@mail.gmail.com>
References: <20220905113116.1766939-1-andrei@gherzan.com>
 <CADkTA4Nvw4MOQGygA6qvByjRY5u-nzcvtVNPjnQwajTypZDBeQ@mail.gmail.com>
Date: Wed, 07 Sep 2022 11:05:37 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 "sakib.sajal@windriver.com" <sakib.sajal@windriver.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/3] buildah: add recipe
 for
 buildah v1.26
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Sep 2022 10:06:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7606

On Wed, 7 Sep 2022, at 03:39, Bruce Ashfield wrote:
> Technically we don't add new packages to old branches, without a very
> good reason.
>
> Sure, this can't break anything that already exists in kirkstone, but
> it is a new feature when you consider supported hosts, etc.
>
> The changes to master look fine, but I need to consider this a bit longer.

That is absolutely fine and understandable. I will import them in local layers if they don't reach kirkstone.

Regards,
Andrei

