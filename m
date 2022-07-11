Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73ADC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:45:00 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.28663.1657547097058230832
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=kPtkjqO6;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 629C15C0112;
	Mon, 11 Jul 2022 09:44:56 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 09:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657547096; x=1657633496; bh=SWNZCO9KGc
	9HHDDB5N39QAvj7ZR/iRgzIJwFY1nm5rs=; b=kPtkjqO6DZen3PL2xvit2niaE6
	OvZsjsjxVaHKMZ1YgH7ZLCFH7lA0ldwYg1l9ZG93582iTKBBqGZjU2nVyA90B7WM
	+0bhyIqkWxEvY1qCI5PCPkhFaA9yr7FPinmsimS90YIlmD4n3hhim5bt5ka0zPTp
	J6+w68Fr1cZ3UepEuzlRl5InTPCwiuUOxIPJQDm+Uv5cM6z72mdvFnBvqrh4gyLE
	3ru8a6xflsRlMkbVzS4feCXmYI7AZq32g9e9+b0rfxL+DRvr355grT995SKJhC6V
	FEJKoIrsV/4e7/jNwcMhrFC3V5DzofIcGZDtlWSjt3UnxI+Hjf9R8eZL+7fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657547096; x=1657633496; bh=SWNZCO9KGc9HHDDB5N39QAvj7ZR/
	iRgzIJwFY1nm5rs=; b=MIrtFFO5CSaE0G63/gZd26O8VrZDsdZmsrenOhGwOIgo
	3OXtdJ4U2Ysqlk7SVC0+65lzitnRorMtjBgMqZHw+mWqKtY0azfD27p73HUKWXdK
	EFWRq+rz9HgMAnAveiqx1mgvlHTQVMeDk2v3vTAOK85GRlhGk5jmaeN3kgrTFR/C
	pEzviBCioGMqDU39+lFCxeHBmDHvc7PIc5w6zocaS7dg3DA2f+vfsikbmUO3wPZb
	q1O+u9tjYIpih+mIzr0TFwg0OnwZrJ4fJL1n6N7xcm1znxi/j/i3bQcf/5L5wn23
	C08BrnDPmK60yBprrbcDyC1DRqAF7jUd5B4r+qGq/A==
X-ME-Sender: <xms:WCnMYt3dK_oYHjC_2YsdlpzsMZmZVwOCwpgMRgLoyBQnR7UT8urRWw>
    <xme:WCnMYkEhtGPvQm_iMSZLGpsr5xF4ZiIC_ybZcZxshsKS98aMPZgylcYcHbkjLW5Pd
    yeU0hlyzjAQp2My0V0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:WCnMYt7m3kZE45No4lRiQRYpJ4v5Art7aclNuWzS6SanIAkF9Sxw0g>
    <xmx:WCnMYq0s3w0SPHRV3VnSvT1yKtp2msrGQx2Q5yjnGFjIBbJ0yslasA>
    <xmx:WCnMYgE46dskeJTQs3WtgXHYgnVjHOuvVEUdqRdimlY6ocouaMcHIg>
    <xmx:WCnMYrPBgvx9veO6oHhCbCucMPHaVjAnrXZQduzVPQVJ2rsnT827ig>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 33CAF2340077; Mon, 11 Jul 2022 09:44:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-720-gbf5afa95ff-fm-20220708.001-gbf5afa95
Mime-Version: 1.0
Message-Id: <1d953b0a-59b8-4620-ad4d-9daed49a2d95@www.fastmail.com>
In-Reply-To: 
 <CADkTA4Ok1GrK3hRD7dzA+G_-U5Dvu7bhj_eGm8ajx8kBBUjeEg@mail.gmail.com>
References: <20220711130110.3264816-1-andrei@gherzan.com>
 <20220711130110.3264816-3-andrei@gherzan.com>
 <CADkTA4PMRv54fcxXz_+NtzJrbH6wf9XMA=0nzQaRSmLX8YCGDA@mail.gmail.com>
 <45eee3f1-8e1e-4606-94ae-08c9001381a7@www.fastmail.com>
 <CADkTA4Ok1GrK3hRD7dzA+G_-U5Dvu7bhj_eGm8ajx8kBBUjeEg@mail.gmail.com>
Date: Mon, 11 Jul 2022 14:44:35 +0100
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
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:45:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7434

On Mon, 11 Jul 2022, at 14:42, Bruce Ashfield wrote:
> On Mon, Jul 11, 2022 at 9:39 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> On Mon, 11 Jul 2022, at 14:31, Bruce Ashfield wrote:
>> > This is new functionality ... and while we don't have a strict rule
>> > about not adding new features to existing releases, this is stretching
>> > the definition, since it does have the potential to cause issues.
>> >
>> > It is definitely fine for master, but I'm not particularly keen to
>> > start adding new features to kirkstone.
>>
>> That makes sense. Would you accept it with a disabled default in kirkstone?
>
> I think that's ok .. it's a balance between keeping kirkstone useful,
> and not requiring folks to carry too many changes in their layers.
> It's easy enough by inspection to show that the disabled feature won't
> impact existing functionality or break anything.
>
> On further thought, we should keep it disabled by default even in
> master, so from that point of view, we can keep them in alignment.

Deal. I'll do this in the next v.

Andrei

