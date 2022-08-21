Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B44C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 08:14:27 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.4830.1661069659295905264
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 21 Aug 2022 01:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=gRklFD5o;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 738B15C0080;
	Sun, 21 Aug 2022 04:14:18 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Sun, 21 Aug 2022 04:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661069658; x=1661156058; bh=Z98UGFcv9q
	MC4i1/2JNRVnYyNnMBeo/np4wQjl1twhc=; b=gRklFD5o1XrgxuYcwdNUImWhLZ
	rw6Y6Y3zttorGvw9mT/AHZ75zU/A/sm4bB7b4VIPj1X23igkub71aSvKT/vcFB0N
	PKAPT6uiA2tP88Xd2ddxk8Y8PciuJQb0pVBx52R9RmZpUO4CY+u5Q8Np3yx+30ot
	y9ylb8o+ObEE9tE6soggGPU17uylVi+94b6NuZkjKzwCBppLanJHxs4mHLyonE1I
	iyMnOtepCDfDGNJ+qa0b4LnO9KcqjNh+L+Lz43kVOO1LfuUd441Gf9wZzMbUynqS
	kqOZrsQbLbZBIz/U1PdW7Sfrh++zcfURCBtw+uoQwzvvaxS5Ta40LFl1Gs5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661069658; x=1661156058; bh=Z98UGFcv9qMC4i1/2JNRVnYyNnMB
	eo/np4wQjl1twhc=; b=SUELxqFuhxwHJ8mpQSI34YWvJUEK3HzLyqTzpVz8Sk9U
	HwnXVnOq+ipEsX7Zyj9h9TZo1b0LMrK+BVo/BnkGdgor0sDiMr1cYH4/Vf5Z+xQ8
	i0TcTDeHa4rOxO5rSlvYinA89eq9RCzzGxpmIYWX4bkDXhX/9LNuC3L8I4fRpI12
	YHTRC8Wz3PP3rHvvAiMM7R4+8lpvYJVDly+4tJVPMZFLzlesTnXmA4HlNkVrKdUX
	VdYbTTIjgZDx0o5woURcoSL5TDN4/lW+38fX6hHh8nuCaw8k5Kb2K8F+Us5CM2vH
	swVo9vCaxNzeTKKr8aijdr0V3jDAFaEEbRzLh3U5og==
X-ME-Sender: <xms:WekBY2t9jcBtMqXLkTjznHLiEoUFJLi3D0GGZY0QNHHD8XuCIQ8bVQ>
    <xme:WekBY7ekhssgVkk36ds5Or9YKV36KJpC7kEmwk9Le3uDxnHf3zBKTOhu1jescAZGH
    O0k2lWZmTa5M1nsL-g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeihedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnhepkeeggeefhffgheejffdtteekleekhfelffdvheejgeffueev
    ffelkefhkeefheehnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:WekBYxzkZCLqn1dXNNEfy20UH5jNra7SzJp7nlBYm6CXG05fsaOSsA>
    <xmx:WekBYxO0mSCCerrSwSHRGtuUqll6TZDBoNkSkMTRVbyMQmSVpCrWJQ>
    <xmx:WekBY2-CArHMXKcOS2k_5by_gq7Tc9gDrSB8EthxHBPp2f7xPmKlnw>
    <xmx:WukBY7HoB53s-7JBypGdsyxElTvxgvxR3EQw7IO9ttWBhHvnGD5ZjA>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D9DCA2340077; Sun, 21 Aug 2022 04:14:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <ab453b9d-3ab4-40cc-89db-835a456d6c10@www.fastmail.com>
In-Reply-To: <20220821032102.GA57389@gmail.com>
References: <20220817115051.353409-1-andrei@gherzan.com>
 <CAMKF1sp61KuH21-T=Oqdq52DDAP6-uOjPbXZJQ1K-EGUL0Y0Aw@mail.gmail.com>
 <1a401d8a-cd6d-4948-ae9d-5baba6deca52@www.fastmail.com>
 <CAMKF1sr2EN_iZRKV6jpmR03Pvqs1=PNYR_1238xiOQWhErE-5A@mail.gmail.com>
 <6c9a52a0-8dc6-483a-9726-1a4f6fc829ec@www.fastmail.com>
 <20220821032102.GA57389@gmail.com>
Date: Sun, 21 Aug 2022 09:13:59 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: "Khem Raj" <raj.khem@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] singularity: Skip recipe on musl
 builds
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 21 Aug 2022 08:14:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7552

On Sun, 21 Aug 2022, at 04:21, Bruce Ashfield wrote:
> In message: Re: [meta-virtualization][PATCH] singularity: Skip recipe 
> on musl builds
> on 17/08/2022 Andrei Gherzan wrote:
>
>> On Wed, 17 Aug 2022, at 15:59, Khem Raj wrote:
>> > On Wed, Aug 17, 2022 at 7:15 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>> >>
>> >> On Wed, 17 Aug 2022, at 15:09, Khem Raj wrote:
>> >> > On Wed, Aug 17, 2022 at 4:51 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>> >> >>
>> >> >> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> >> >>
>> >> >> This recipe explicitely rdepends on glibc so trying to build this with
>> >> >> musl will break world builds.
>> >> >>
>> >> >
>> >> > do you know why is it marked as glibc only.
>> >>
>> >> I've tried to figure it out but I couldn't find anything obvious.
>> >>
>> >> https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/singularity/singularity_git.bb?id=06bc17d1f0650ad2cb134b09b25133bcd641d473
>> >>
>> >
>> > maybe that rdep on glibc is bogus. Its not normal to depends on glibc
>> > like that, in some cases e.g. locales etc it maybe that we need them
>> > but thats usually for ptests etc.
>> > can you try to remove the rdep and see if it builds ok with musl too ?
>> 
>> It built alright but I didn't check any runtime behaviour. I do find this a bit orthogonal at this point but I've sent both patches so Bruce can pick any - both approaches are working for me.
>
> I've gone for the removal of the glibc dep, singluarity needs quite a bit of
> runtime work .. so we'll do with that, and see if anyone notices.
>
> merged to master and kirkstone.

Thanks, Bruce.

Andrei

