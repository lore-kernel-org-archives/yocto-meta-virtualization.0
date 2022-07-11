Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B060EC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:39:30 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web09.28638.1657546768873436164
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=DTSBzhhl;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3D3165C00E9;
	Mon, 11 Jul 2022 09:39:28 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Mon, 11 Jul 2022 09:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657546768; x=1657633168; bh=2UPSyuxhF/
	EeEdU7o2BS/9axN+oKn4nBltGz9DDaEAY=; b=DTSBzhhlRGmjp/4gKomyE8tbc/
	IcFgqDf3hB/vL7zAnYv7/Lv+3PWH+ZOhx0QEN9yZHU2oRdZP78mOcu3lDxYZPfiT
	qCy6V0Ozo7/GwTGbdCv0ewaKauXxJZvcoyqyuO3Vkx6CsIFtL8R4V/e4j2Dqrgt4
	mSZUmxwAxFJEywi+PyDgfmtKKmGznhSIhPuuHhVqy/UIUG7cx/ITL/JEJRXWRbFY
	FgRCFuGNCWk9N4Qvz3LD/eX2TDPLMpN+TghGfOtJ4Z2ITfhT3JtTxY/RutBR1PIE
	UX/mEW5jNmwwyxyXRM6p9VSRDPBD0/d56FKd8nEUTa8NkCz2DfeDsdYHHXbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657546768; x=1657633168; bh=2UPSyuxhF/EeEdU7o2BS/9axN+oK
	n4nBltGz9DDaEAY=; b=od9m9HK5LYFjuHQ1FEE/yZ6W0XUxPS/3wbKTohdEozEQ
	+QyoAnaqs18iR+8cOO75pyEisVSQMIi+xd94P78mE+P2kRwRkt/aWOudkkLytZ5e
	9uS9pC4g1Mb6ax1pCwIfZ6c9q+L1oZ3OMEsLkSmFCsFkweusOt7qCpeElCPLLRn/
	d4VEux0ruaBc4g0Pab37pWyRfkCj8wS3vMIN3+K7gKmX0aaqs1iRcATq3OvSy/5o
	WxDMZ5PREM0Jh4+sbr1xZfy+ZrcxD3X8L4vGq92fdl4Mt6ITNqUuD1ST3roAWe/W
	O/417IQAXmuaTLbqPqXYdobY4eRBT8qhXN7AC2o2yw==
X-ME-Sender: <xms:ECjMYqfkmIan-vCEnlvjpx-XG7cVEv8bw9Kp0OmI7Qs16Zb4B0DLvw>
    <xme:ECjMYkOBcZBkJTHc-V2YPr9IQErmkasUpAlwzemCOyjSK5it-nsqz-3OCktwtLSWI
    I-2EqRqnDDMUO1rH_Y>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:ECjMYriTmrVkIMh-xn3pOOrD_e0pm81gKZfOAUbJLf5TjXv2F3kMcA>
    <xmx:ECjMYn-hCzaxXpv2ZMks2IZqLDx5J7a5DIDF07ZdZxX_zAnnD9KIXw>
    <xmx:ECjMYmuhY7VZEFzvGZ3OvlNGd_YLW67pKCo0RKJ_4nD7_tqXBqI0Cg>
    <xmx:ECjMYs1vkTS0oK83YIZtDtCx99Zk0arvVlKoOsBdtJ72WDYDbGvqdg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0C2612340077; Mon, 11 Jul 2022 09:39:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-720-gbf5afa95ff-fm-20220708.001-gbf5afa95
Mime-Version: 1.0
Message-Id: <a835deb9-a0e0-4655-9371-686fa55ea284@www.fastmail.com>
In-Reply-To: 
 <CADkTA4MZOuSQYfyPZYt_pVH_aa2xzQfj=sRjw7yxBCi_0GiBAw@mail.gmail.com>
References: <20220711130022.3264142-1-andrei@gherzan.com>
 <CADkTA4MZOuSQYfyPZYt_pVH_aa2xzQfj=sRjw7yxBCi_0GiBAw@mail.gmail.com>
Date: Mon, 11 Jul 2022 14:39:07 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][PATCH 1/3] slirp4netns: Require tun kernel
 module
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:39:30 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7431

On Mon, 11 Jul 2022, at 14:26, Bruce Ashfield wrote:
> On Mon, Jul 11, 2022 at 9:00 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>
>> slirp4netns uses a TAP device to connect to the internet in an
>> unprivileged way. Without the required kernel support (TAP/TUN),
>> slirp4netns will fail at runtime.
>>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> ---
>>  recipes-networking/slirp4netns/slirp4netns_git.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-networking/slirp4netns/slirp4netns_git.bb b/recipes-networking/slirp4netns/slirp4netns_git.bb
>> index a63871c..4bf25b8 100644
>> --- a/recipes-networking/slirp4netns/slirp4netns_git.bb
>> +++ b/recipes-networking/slirp4netns/slirp4netns_git.bb
>> @@ -18,4 +18,6 @@ DEPENDS = "glib-2.0 libcap libseccomp libslirp"
>>
>>  S = "${WORKDIR}/git"
>>
>> +RDEPENDS:${PN} += "kernel-module-tun"
>
> This needs to be a RRECOMMENDS, since we can suggest, but not enforce
> a specific configuration.

Agreed.

-- 
Andrei Gherzan 
gpg: rsa4096/D4D94F67AD0E9640

