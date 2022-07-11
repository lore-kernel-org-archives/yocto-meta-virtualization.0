Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6D5C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:39:20 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web09.28631.1657546750704118521
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=C3a4bOkS;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 137565C00EC;
	Mon, 11 Jul 2022 09:39:10 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 09:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657546750; x=1657633150; bh=IaAxkHaLaH
	bluy2JNFVoa5LZ420dGu7dO2MEB3xStGA=; b=C3a4bOkSmZD5BuIBCo9y73foip
	tNFRWRInDbLD8Yyz04VNsVUMpxDxM3AHe7H15dUCCTRnaeJRbAnw5K/sFHAeK1sE
	j0OVirQJt8gR6yyryIOnLEg8scq+vTY0nZDjOf0XNtwLWQsY9H3rrN4TbSc13XC6
	oFF1sxvA7xSPClvGhjxpG/swCH65OyzGPlW+IieBr60rCZvrOs4eEq0Oit7xjLxf
	LyHK5TFrsPJrWjMMPMnbaslpEe/DEnnG//bTg7IfMpgJPZ6v8iBnP58lnYzloXiu
	LtfMe9+rleLxrolC+SWZIeWQFc9TbDhoGqq0Cs0djo9/HM2fjB4JJSpZhtHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657546750; x=1657633150; bh=IaAxkHaLaHbluy2JNFVoa5LZ420d
	Gu7dO2MEB3xStGA=; b=Gbc4+Vao2n84cRDPRHEcNcH/g47YzzoCaksAZYi8AOXv
	fFS2VE4F1lEnj/RzgFyqaWV66PwdyHlXJ0X5aSQE7IoI6QB7BTi4AGl0pYN3MgN4
	eaBce+OcLBGgb0a3bWwd1vLvnMr7hjFenJbtcoaI+vBJyLrJ2vR83vkQQ7N0P8d9
	e/my2VLCqKXd+2QyXdV4KOBFB0aY4TfFgVBg0iLrYnAuj9RkDvajncbQNL/2Kx5k
	a37CdVaxfeN3BxAaPdRcZLeDi9O6LWW2XL21GHfUL0hEaEuOA1aoJoJorETiGsSY
	z5Cjuqh3l8ky4x0QQDZUuNyAY3wDGaTYwgAsuuF9+A==
X-ME-Sender: <xms:_SfMYomNOtGPRxCTaaQ-nkjbu8Jq1FWzg2OO9JGA9x2k7dFQypn-SA>
    <xme:_SfMYn11WUEzEK40Tk-NhkSsNS5TBn3wpInCecp2fqD5m2tM7Zw_po_LKVvg4j34g
    P1jO2lOpTAVdg-HBJY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:_SfMYmqsQd-G4Dhto-ZGBU1zEuIjBk6g5LW7zpPAUJ5LUXQwPBM-TQ>
    <xmx:_SfMYkkReTIrcrzuKZFTfTjqnF1LFjDXo-Kl0tzn6cEpTuhSCcvKDQ>
    <xmx:_SfMYm22o7zDu5kgG2M7ofSZ-0SH6EOik2Twi5qLoxuHYRO7gIxBhw>
    <xmx:_ifMYr8sLHtmRaA7e530OZsCs68FuptQ4uLSRNs6hrD1TXxH4hP_mA>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CE3E7234007B; Mon, 11 Jul 2022 09:39:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-720-gbf5afa95ff-fm-20220708.001-gbf5afa95
Mime-Version: 1.0
Message-Id: <45eee3f1-8e1e-4606-94ae-08c9001381a7@www.fastmail.com>
In-Reply-To: 
 <CADkTA4PMRv54fcxXz_+NtzJrbH6wf9XMA=0nzQaRSmLX8YCGDA@mail.gmail.com>
References: <20220711130110.3264816-1-andrei@gherzan.com>
 <20220711130110.3264816-3-andrei@gherzan.com>
 <CADkTA4PMRv54fcxXz_+NtzJrbH6wf9XMA=0nzQaRSmLX8YCGDA@mail.gmail.com>
Date: Mon, 11 Jul 2022 14:38:48 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 3/3] podman: Add support
 for
 rootless mode
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:39:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7430

On Mon, 11 Jul 2022, at 14:31, Bruce Ashfield wrote:
> This is new functionality ... and while we don't have a strict rule
> about not adding new features to existing releases, this is stretching
> the definition, since it does have the potential to cause issues.
>
> It is definitely fine for master, but I'm not particularly keen to
> start adding new features to kirkstone.

That makes sense. Would you accept it with a disabled default in kirkstone?

-- 
Andrei Gherzan 
gpg: rsa4096/D4D94F67AD0E9640

