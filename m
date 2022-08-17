Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F8EC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:15:35 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.29297.1660745732976112897
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 07:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=QzXYKz6d;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 05D9A32009D2;
	Wed, 17 Aug 2022 10:15:31 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 10:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1660745731; x=1660832131; bh=oKbHi40NtW
	kBBSCIa2LFpxXNTiq8ZXc8TYMlJBqgL9c=; b=QzXYKz6donFmQNwf84ieGKqr1T
	QF0aNBH7/1dF8eHGPuOCvOK/pFrn63Kd6qRxWb/GE/kVRPYVxDoBhLouvhOgKkrz
	4H8RLSYYXfIWThM2+9Fod+Gq/bmfAHwjICWjAlmk055bRpFr/iUrrF8OTwWW1Sfz
	7BbBfxXOrBkKut9VQWLLI8qWzQuePfKW/owuSakoNh9sii13u0eW6NZPBNHTfaWE
	86WO/OHtkpkRNt26H7qkO87ZHYy6YQ9veTeT8lBn2d9PiSOdLb5XMxsBn/V4fUK+
	Lu8HA7GJeCp9jZo1XQSSYIw91zAOJWqTcpE8nfcPlo/uzqnG3G8QWm5udmfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660745731; x=1660832131; bh=oKbHi40NtWkBBSCIa2LFpxXNTiq8
	ZXc8TYMlJBqgL9c=; b=tk6+iIFeLYTT8qXJjMvG7Mx1Vx9jdkLlpUDuM6manBlo
	6+uwsuXdCAwamqz7my47Q0cyKbDzPQe7Op4ryt8PAzrEvLNp3KNN0beLIgetMUrJ
	D1UEPtHDcr72K+zZcYI+l2UHmPVEUNlBEznJal8PrU4y3etVtsQ6MRGxzt0IL53F
	j/AVFLtEcOfQjjN5jfjKhuonfJWtQHd0Y9d+5Cv3aWuhBfEFMp2KWkbdzMCvUhm7
	lVgF2JceG7dJ9p8qM4o43fE3ax7izGqLgYQDkObuLIMualgqmlx/zugA73XGl/d1
	NUfA6meRQfkuYznSNUkZ7bAIZO0fK/nyL9SLeTCpAQ==
X-ME-Sender: <xms:A_j8Yuxcf3WID-c3kFUjimihK3RfIsp9npI2PI9C5zb8nZ4cIg32MQ>
    <xme:A_j8YqS0PA7OSOBMG6FSHCTCQ4-76Bus6UMs5ov3yCvBwMmF1wxt0xxOnol7jgN1p
    ICH3VBUIpTx37UbkF4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnhepkeeggeefhffgheejffdtteekleekhfelffdvheejgeffueev
    ffelkefhkeefheehnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:A_j8YgWatFAGJQI5Oq0T0SgUOCBTjyWpeXnMwpWAi9gZCicZw8mGYA>
    <xmx:A_j8Ykh-xTZgSkXFMXWuDXTcu_LdFzxRLpNvCr4STQLKp27wO_9bWA>
    <xmx:A_j8YgA5L9j4eDeqa6LriedhqSHr6diyMqq_xyWdTS63i3S5oBJKDA>
    <xmx:A_j8YroS9xjNmZdgqplTp4WFDxlYSMnBANrR90JcX8cTWl-qaHzjbg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 39F0D234007B; Wed, 17 Aug 2022 10:15:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <1a401d8a-cd6d-4948-ae9d-5baba6deca52@www.fastmail.com>
In-Reply-To: 
 <CAMKF1sp61KuH21-T=Oqdq52DDAP6-uOjPbXZJQ1K-EGUL0Y0Aw@mail.gmail.com>
References: <20220817115051.353409-1-andrei@gherzan.com>
 <CAMKF1sp61KuH21-T=Oqdq52DDAP6-uOjPbXZJQ1K-EGUL0Y0Aw@mail.gmail.com>
Date: Wed, 17 Aug 2022 15:15:10 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][PATCH] singularity: Skip recipe on musl
 builds
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 14:15:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7531

On Wed, 17 Aug 2022, at 15:09, Khem Raj wrote:
> On Wed, Aug 17, 2022 at 4:51 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>
>> This recipe explicitely rdepends on glibc so trying to build this with
>> musl will break world builds.
>>
>
> do you know why is it marked as glibc only.

I've tried to figure it out but I couldn't find anything obvious.

https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/singularity/singularity_git.bb?id=06bc17d1f0650ad2cb134b09b25133bcd641d473

Andrei

