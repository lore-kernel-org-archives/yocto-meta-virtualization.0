Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3082DECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 23:15:26 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.714.1663370120234614500
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 16:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=JSTsqFTc;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 955795C0125;
	Fri, 16 Sep 2022 19:15:19 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Fri, 16 Sep 2022 19:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1663370119; x=1663456519; bh=OCalNFqBiH
	JO9zJFGJs+7O3ygLsEf3H9mSg+nxjE9tM=; b=JSTsqFTc2Itrw6wdkuj9MRrL7F
	RRtinWyx01iyTttnY7V2fEbbAgyiFwpCKmFNNjwcHl4IXWe4ZOpUB2UI1yKdIxDP
	SokDNqt2GopDDRd62UJ5DtPREtwbx+5Z1NXk+GCVGJR0HabCt7Q7zoAkGZGzwWO2
	2MpKXT6E6r74Miz8HUgMEtTWmRB65vy3W1sVHGTA7lFDz1OZQRkzFH1G+yQuypW3
	s3YL9sTR2mHtKRI4mmbgkQXM+e3Cdn8vE7ndR5NoA1cWdmpeUEnk2jH0ex+N4K9L
	DwMiCSOzcKc8m2XSNjWrK1AIwuM19gXv3N8s0LAnFbF1OMkG4EQpIUv10/yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663370119; x=1663456519; bh=OCalNFqBiHJO9zJFGJs+7O3ygLsE
	f3H9mSg+nxjE9tM=; b=tsk+VW9uKwRfhWFitQe58jGYTKq8luSX2YbS2zzn9pru
	A6WuO8RnHq6jV/jI1Tk+8D+dz2FWM+sxlDXukCOWkmzUTQiWxpDvEuzEDZ+P2JoP
	n9YlZ1cK/YEUyuRkKBCZD82TwDfJKkCiAwpr6wFuayaeHJNUWiw1136vueFGt4rs
	9YFCQk6HBWkclPuSHHJI8d0eEn8KYWKC00TJtstOMPhS0hu34FfwY69C7KUkZr4P
	lG8DAxuAXMkVfrtAB1PD1HiETHfg6DB9T+qW/1lXNLrFzPR7GUJZ3Cdo47mwQLjh
	TqGDro96YOc7VMbrjQt9wYIaTOAmLn7bDWVuaXb/Ww==
X-ME-Sender: <xms:hwMlYxIl29CNc3LRR4guNAKv8LQ9uw_7Fuvw_TCw5nNcWisXocGP4Q>
    <xme:hwMlY9IQK-HGmGwSJSBguuJOwS8txL8-t0TZItr0xzhSrYol03SV4xRV_BqdvcrkP
    Ut1OIcwr3Tc1NI8rbk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:hwMlY5stayWwmluOUp5wn7igKQj_jeDu3nYZSe-Prg1Bv8DFfUnHTQ>
    <xmx:hwMlYyYZY_MT_X75LOx8XLLmE6ZftHAh9qtNvSugwfj3eLAPUUKBaQ>
    <xmx:hwMlY4adFQl-KoW_5BYSs4NRX2RFJQ45Z5kNzeDE5auI55E-bRDQDg>
    <xmx:hwMlY-3LHRJz7RQFH7aa06VcIq5YxQAdpQw2GSKa-yebOwfnne-1xw>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 56A822340082; Fri, 16 Sep 2022 19:15:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <ce799b82-dbcb-4247-b217-dc1929038386@www.fastmail.com>
In-Reply-To: <20220916152356.GA33896@gmail.com>
References: <20220916152356.GA33896@gmail.com>
Date: Sat, 17 Sep 2022 00:15:01 +0100
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
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Sep 2022 23:15:26 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7616

Hi Bruce,

On Fri, 16 Sep 2022, at 16:23, Bruce Ashfield wrote:
> These two changes are merged to master.
>
> With respect to kirkstone, the issue is that by default the ptests
> are built .. as such we are bringing in new dependencies to the
> default build. That carries a bit of risk.
>
> If there was a way to make the ptest build and dependencies optional,
> and disabled by default, I'd be willing to merge that to kirkstone.

That is understandable and we will manage this for now as part of our layer(s). Thanks for looking into it.

Regards,
Andrei

