Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43548C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:38:56 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web12.31162.1660754329365544767
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Aug 2022 09:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=rAF2Eoob;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 9D1B63200956;
	Wed, 17 Aug 2022 12:38:48 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 12:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1660754328; x=1660840728; bh=MUcMLVRQnJ
	ZjB3CPm/WA3O1XrM1Q307k/7rWwCM1eY4=; b=rAF2Eoob8gj503OizBRKv3YCSi
	he+u3TyXfF0OquoPS7ZwBn3UZUO7Ke29bv7hBmqfqC20g8pkyjRoDmQV849QAlaZ
	imOwFI4Yn4vUQQAfpObKoUkSlrrYkSi7YDzneEtvKg0xo931eZWSzQ0fFUGWS/k0
	x64m4RA/zdyAxZDCiu6UB4ErbPap6g5SRG/uHcYMSDfaZUFU+D04tqcDmcVD9zZY
	K27qV8KShlFYUtJo8Oe46Pz8LPS+rbllRwVBy0COo8mtExEbJNzx06TznpnBkJ/c
	DdZVAVXEWe7LDXzRdrhy5Ar8z5RuZ6Z+/86gixkD4yjJqEQI/+xSb6cos2hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660754328; x=1660840728; bh=MUcMLVRQnJZjB3CPm/WA3O1XrM1Q
	307k/7rWwCM1eY4=; b=MCeftfHgN+DqMdZnMqJ32ii+MwGeh7IXXrc5od87muNy
	9szo5t0YUMj4YrlO/zLX7B7ew3WbRSMF0y+5xYWjIOJrpDVAxHU+0AM74teB287K
	iUoH2durBDbHVkWUXa2ZJ988lMTu9xubrBagHV8mWTOnUYqIyq6T4YE4R9SdNpsq
	3ZAjIb+hFZ65SCp/6YcCtJdYf9j56V7k+SQhKpL1W3+GYp88qE2J+uON6LejkfME
	lLzavJfVfV48J7fCKDZvRNh+ubXOinswcVSH4Q5BfZM0Bpm+MaEE13vtXFrv3pR3
	34+KhgQuMySdhsa3zclCPnyrA2kDTxQ5xCfY2JQBnA==
X-ME-Sender: <xms:mBn9YrCkKfNf8db1zzr895kTN8x6igN6D9A9zUM66AQNOXIZyD3G9A>
    <xme:mBn9Yhhb56wskdkHGaUN0LbE0TNJRZB5LKm2IMLUQyOhHe8MZD5AA08NeWrMJjPH2
    WdiExtgT7Y0OIifWEA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekgeegfefhgfehjefftdetkeelkefhleffvdehjeegffeu
    veffleekhfekfeehheenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
    vghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:mBn9Ymmx2TuAZX35J7-UmEubZSsa4lw_xT4CccMfVgYzaMK_-b3NbA>
    <xmx:mBn9YtxLxPA5El0rZwYkKFCFG9GIcoN7thd83WOSJ_1vIRrmZ71vtQ>
    <xmx:mBn9YgS5z9Jyp9OS6PHRP-FVSxktLRH-rhkfx7wtWao2SYFxYLDS2w>
    <xmx:mBn9Yp4yuu9Qy3hWnNug2XIeTJRb0prZqkddKyDRtj_g-xaFmvyW2A>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0D7BC2340077; Wed, 17 Aug 2022 12:38:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <6c9a52a0-8dc6-483a-9726-1a4f6fc829ec@www.fastmail.com>
In-Reply-To: 
 <CAMKF1sr2EN_iZRKV6jpmR03Pvqs1=PNYR_1238xiOQWhErE-5A@mail.gmail.com>
References: <20220817115051.353409-1-andrei@gherzan.com>
 <CAMKF1sp61KuH21-T=Oqdq52DDAP6-uOjPbXZJQ1K-EGUL0Y0Aw@mail.gmail.com>
 <1a401d8a-cd6d-4948-ae9d-5baba6deca52@www.fastmail.com>
 <CAMKF1sr2EN_iZRKV6jpmR03Pvqs1=PNYR_1238xiOQWhErE-5A@mail.gmail.com>
Date: Wed, 17 Aug 2022 17:38:26 +0100
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
 <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Aug 2022 16:38:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7538

On Wed, 17 Aug 2022, at 15:59, Khem Raj wrote:
> On Wed, Aug 17, 2022 at 7:15 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> On Wed, 17 Aug 2022, at 15:09, Khem Raj wrote:
>> > On Wed, Aug 17, 2022 at 4:51 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>> >>
>> >> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> >>
>> >> This recipe explicitely rdepends on glibc so trying to build this with
>> >> musl will break world builds.
>> >>
>> >
>> > do you know why is it marked as glibc only.
>>
>> I've tried to figure it out but I couldn't find anything obvious.
>>
>> https://git.yoctoproject.org/meta-virtualization/commit/recipes-containers/singularity/singularity_git.bb?id=06bc17d1f0650ad2cb134b09b25133bcd641d473
>>
>
> maybe that rdep on glibc is bogus. Its not normal to depends on glibc
> like that, in some cases e.g. locales etc it maybe that we need them
> but thats usually for ptests etc.
> can you try to remove the rdep and see if it builds ok with musl too ?

It built alright but I didn't check any runtime behaviour. I do find this a bit orthogonal at this point but I've sent both patches so Bruce can pick any - both approaches are working for me.

Andrei

