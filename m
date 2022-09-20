Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAA0C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 12:04:07 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.10972.1663675440182825442
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 05:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=J2QESPOU;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 7253A5C004B;
	Tue, 20 Sep 2022 08:03:59 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Tue, 20 Sep 2022 08:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1663675439; x=1663761839; bh=1WGeuAeLsk
	nWgt9/587XaRPnkZ56GZluwAdyaqdWD28=; b=J2QESPOUZFV8F2OlPnBygrtr9E
	pyOsfm2kEQCRY0kmIpjGw5Nl7dKB2JzXi4qoTz74bWdJzxXIMbrSl96Nrc7+ZSAe
	p8fE1oGPX2jclvyH36Yc7IMPhU4RCqsE15D1RVOVex8E6Emj1y6zbqMa4W6SF51H
	niVtbRLOatXkOqvB90RTGVe1oodoeFGAb9rDgL1IofDTSp1iTJ3uFSNH6ttS+6Hi
	Zke8GE0kTo104mZvx51Lx04HT025yFgr4P2u+z8ADe0stUcW7OcfzQ2DBDJDZbuA
	Bkho9iO2njXef8alRs2uabxIqsoD5Y5arH8HbuT7ib0YFyTi9XGCA0o1Dp/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663675439; x=1663761839; bh=1WGeuAeLsknWgt9/587XaRPnkZ56
	GZluwAdyaqdWD28=; b=NdN/HlL/QMU1qSaEZwbCU632w+e+SIEu762wO9rWPbDZ
	7muBZCHLtM3ASTm8DS1RYtQ0FRQ/ZHyYlysrpjRMLy09WFp87VUKsrcYRFty2ZLJ
	ncgBJlPlj2vJttnJETclLcJoFvZFMdP2MjT6YvZyj2ldMaPc7/ftv6khLwLEniuM
	tr+bizbS5nYEojnPGmq/KzZMXOjrl/As5yYcWA0in/p2JK4o6mW5DYRRVfNVQdKC
	AWlkLhkUej9YU3JksgdEpJkcKDEnJClju33UHiwTDNM6D2czGHfVcQwSzGb+WUYF
	r2hbVN6P1Q0XeJVbgMaglRtkc6tyXsirJccZ1V5dfQ==
X-ME-Sender: <xms:L6wpYzcN2yZIoCSpWekYC5x72di9qaDOO7inrU5RVLkX0QZDaT0QFA>
    <xme:L6wpY5MmzoGoA3Az7uh_nSvenvQa3YAqfcl-BzrmlXFlTTT9lSFuKnoRc0nvJqO7r
    UXEfG_ntjKMwe55Bio>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:L6wpY8jWUnwNdUA2O_8O-kgycul-iXXo_PRzom9WD71L9g5A3xwKBQ>
    <xmx:L6wpY0-PgBHiA9OasBHaHiOF3RDb2EkCDoLP9AF8puHxuYyzZBYQRw>
    <xmx:L6wpY_vClc8cXjeIAtAYJ52muS1UgF7GZg4p9fg8h6xG2bg758Metw>
    <xmx:L6wpY854ixWipn3nFrQIz5xS5Owk5nDafOGqvi0yg2GoXmJZr2sNXA>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 38FE0234007B; Tue, 20 Sep 2022 08:03:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <d813349e-1371-4da6-878a-fae289ce83ad@www.fastmail.com>
In-Reply-To: 
 <CADkTA4OUsRsDM-FuAJcnREkdfGeDsxOJ_xfznicuANOba7tSwA@mail.gmail.com>
References: <20220916152356.GA33896@gmail.com>
 <ce799b82-dbcb-4247-b217-dc1929038386@www.fastmail.com>
 <CADkTA4Ma=LBNhQ=Eg7hRi_n5xx0kQMEkfdTcBW-g+H6iX+t53A@mail.gmail.com>
 <190a972b-ce8b-4ec1-b25f-b880b995ca9e@www.fastmail.com>
 <CADkTA4OUsRsDM-FuAJcnREkdfGeDsxOJ_xfznicuANOba7tSwA@mail.gmail.com>
Date: Tue, 20 Sep 2022 13:03:39 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][PATCH 1/2] catatonit: Integrate
 version
 0.1.7
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Sep 2022 12:04:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7623

On Mon, 19 Sep 2022, at 15:31, Bruce Ashfield wrote:
> On Sat, Sep 17, 2022 at 12:56 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> On Sat, 17 Sep 2022, at 00:46, Bruce Ashfield wrote:
>> > On Fri, Sep 16, 2022 at 7:15 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>> >>
>> >> Hi Bruce,
>> >>
>> >> On Fri, 16 Sep 2022, at 16:23, Bruce Ashfield wrote:
>> >> > These two changes are merged to master.
>> >> >
>> >> > With respect to kirkstone, the issue is that by default the ptests
>> >> > are built .. as such we are bringing in new dependencies to the
>> >> > default build. That carries a bit of risk.
>> >> >
>> >> > If there was a way to make the ptest build and dependencies optional,
>> >> > and disabled by default, I'd be willing to merge that to kirkstone.
>> >>
>> >> That is understandable and we will manage this for now as part of our layer(s). Thanks for looking into it.
>> >>
>> >
>> > What about just the new packages ? (buildah and catatonit) ? Does
>> > having just the packages but not the ptest change make things easier
>> > on your end?
>>
>> Absolutely. That would be a step forward. Thanks.
>
> Those two commits are now on kirkstone.

Thnks Bruce. Approciated.

Andrei

