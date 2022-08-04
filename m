Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E295C19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 10:28:34 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.3131.1659608908109770728
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 03:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=IGmuEGj7;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6FE3D5C01A9;
	Thu,  4 Aug 2022 06:28:27 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Thu, 04 Aug 2022 06:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1659608907; x=1659695307; bh=CXjYq0o54N
	3VZVZro5Sa8Z/iKzI2gjAXAHcSaCJwS0A=; b=IGmuEGj7KX5LXzTFIHEwyoPtLU
	+LhVvQ+iEU5hq1Szta12B2Qjc3QPtczrpiYw9qe0Bcx86cCqCGgK3g80nS8sTMdI
	b/Ikw5/dly7RgY34sp1B4VQR3RTLT5exbZaTc/VJ7Yx0CAS/fc5foDIq3ZfCKTXe
	9d51yB2CN5nARWhTl5g6js6TLlUDZMd0rNE+MhywTE9ZkkYJO/Cqn8T0kGortBCV
	AECIO5D070SWyRFxe2dgVFpx1yXBAH0s7XhdWNdwHyL9cQFGDNHyTZCEyw3RWGT6
	9Z4aoV3drbozA/i5sZohTCTyvzFZ20eK0Da/cWeREYhnxCCZT6IUWUVkFR3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659608907; x=1659695307; bh=CXjYq0o54N3VZVZro5Sa8Z/iKzI2
	gjAXAHcSaCJwS0A=; b=RT0vY7KJXp50xYcARyafPRksvAvJj89yblvmnE/+GXn2
	03lzUiScCg14pMR2fy5WIPskoshnMAT+Yh5pGOB9+jTC91ujaq4O7JLYVOMO0iRt
	9vqZWO3OxdqUgiCbRfVpaMmu8/jEXwL4150UL2pDJJYOF8naJxif7i26k+qP1P3H
	Es1jHG+5V8ngLGXWynG5yIUlky79y5tiWl0oSTLiatBK5HBul9VMwU8nMXi0lcpU
	hGTqNjn9HMyFVPf21IPDpUFORMMKFcQjj6jH1JuP5m6tV/HdfVvQcZc4Nca21VPV
	mmH1yaATWiUrsQFW6Ff+iyBfoW7sWLQRvdhU7ghq3g==
X-ME-Sender: <xms:Sp_rYvu-4slV6GkHab6VkmTvhiHq6n1udmDrGbChT4Zs6vWEPgCiKw>
    <xme:Sp_rYgfveq5N3HJw__Xd7D9p6cr7jLuuC7VHy6gOQgDJbBAGfqHIFhR-0WHSu9lK7
    z33LBRN1g6id8aNKb0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:Sp_rYixo7CDD3Xte2x57lWDaJJCZp1KXWAfBwd8K7jtPWQNSdnQYIw>
    <xmx:Sp_rYuNOs9946hbHclVDuyIDAjMQjKQpcR4pHgmDrWjrpcHi42Mp9Q>
    <xmx:Sp_rYv9MwCc0t_l9DWR_eCS-uZTJnoA3O78lJePv2pTd4y6NwjZ9yw>
    <xmx:S5_rYsHe1Z3CM8au9kOTf3xUpiPklnajzNIaQsFemuBzWFBaScqtDg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CBA852340077; Thu,  4 Aug 2022 06:28:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <bf4d1a6d-e898-4161-a6e5-51719b1391d8@www.fastmail.com>
In-Reply-To: <20220804031736.GB14549@gmail.com>
References: <20220802090940.3692953-1-andrei@gherzan.com>
 <20220804031736.GB14549@gmail.com>
Date: Thu, 04 Aug 2022 11:28:05 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][PATCH 1/4] runc: Backport patch to fix
 duplicate
 switch statements
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Aug 2022 10:28:34 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7492

On Thu, 4 Aug 2022, at 04:17, Bruce Ashfield wrote:
> I have a bump of runc pending in master-next, and from my
> check, it has this change already. kirkstone of course, doesn't
> have that, so I've queued the similar patch there.
>

Right. I did see it in the later vendored version but I didn't have the time to test it out.

> But I've pulled the other three into testing, and will have
> them merged shortly.

Cheers for this.

Andrei

