Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56BCECAAA1
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 16:56:35 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web10.490.1663433788251701168
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 17 Sep 2022 09:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm3
 header.b=tmSsbgNU;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 9A9C75C01F9;
	Sat, 17 Sep 2022 12:56:27 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Sat, 17 Sep 2022 12:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1663433787; x=1663520187; bh=ivhGwlwJSM
	/OiWNgQyDUsAacI1zaYDp7CX9BVTe3xp0=; b=tmSsbgNUaV1zNQDaizIXdrksjR
	2XOC2SHKTUEAF8ysQtwpBozDjJKO26TXGNy/Zqp1Cptxwx2u5wrx0mEB+S1QDojI
	FKhkumGgj37apHDC1tFdeLj4gd+592VL5oa4PkwNsyUGLxDrYJpramWksc/u0i8h
	N5hv85bRVw0Ly+1yQxTSRCSFS9rLGHW7ktLkHweT8kUg4xNVJSGGBq0hEo7CkxTh
	NcG9R9loScWw/JY8pg2zf20jfFxwLFtUWyCwAckHZAOlTjqZMl07F1B9fP5QK+J3
	zgnm+aM66FjrmVfsdgXav0ZMDOnU9y6whN37cDrqgbqwzyR+Aov5AlTkRb0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663433787; x=1663520187; bh=ivhGwlwJSM/OiWNgQyDUsAacI1za
	YDp7CX9BVTe3xp0=; b=LhSEwnHlByFX/djGzq5uQLuoD92ivKLUz5azr9xVsQsZ
	RPMrpkGSe544omucadILXvM0gX1TKiG/UAxlAR/6EgsXNQ143PyDQwPdf+/5Qdrs
	Bm8c/WXQawlWxXKspmnNzulQLvy9ini2tXZ5g8LvxQXck8kzC+Jm/l6/8iPRNFF0
	p7jV0e8N9Tt9ll2ImkuMXoSBa2LhPHDZdxoJuFyQCXkjA49fWew8SZq/zC0D/sm8
	xYsfbVGF8NRkALTTZc1Zvs1fZoCkNu8rZ0vKvDcP03JPcCY93lXOAXBE4r67rFwR
	cg1ojGCamA+xZRotyXCLk/Ty+HvrKNfRCJzQ/6lRoA==
X-ME-Sender: <xms:O_wlY0y3wM0cM73nTt-p9-PflY6YJSwvG9dqgty6uBwWZXxDe-63yQ>
    <xme:O_wlY4RvwunsdXmnG8N4mCXbII_cxA2Dh4Izjk0HfzhUe3hQQX2qp2jgf2s4GBHch
    9mt2nkhP8cklCCwHx4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrfedvvddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqe
    enucggtffrrghtthgvrhhnpeelhfeljeetuedvuefhjeffiefgudeilefgudeuffeutefh
    geegtedvveffffeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:O_wlY2VrCnXeoCLJdrS2aayq9Q9hnC_MzlDKYTdQ6hjnXUrYAiGrEg>
    <xmx:O_wlYyjk6w2jpmvJYkmkWVWszilb5abar6PI03GVqoOYmQj2a4nF9A>
    <xmx:O_wlY2DZjx3kywnUfXpl8D3VTnNwjqPZPxGltmYFvnVhZ4v6oENPow>
    <xmx:O_wlY9-OK29g1Dg6HkOS-E9s46SwcEuI25V360namtAJw1DuUvpKvQ>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4450D234007E; Sat, 17 Sep 2022 12:56:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <190a972b-ce8b-4ec1-b25f-b880b995ca9e@www.fastmail.com>
In-Reply-To: 
 <CADkTA4Ma=LBNhQ=Eg7hRi_n5xx0kQMEkfdTcBW-g+H6iX+t53A@mail.gmail.com>
References: <20220916152356.GA33896@gmail.com>
 <ce799b82-dbcb-4247-b217-dc1929038386@www.fastmail.com>
 <CADkTA4Ma=LBNhQ=Eg7hRi_n5xx0kQMEkfdTcBW-g+H6iX+t53A@mail.gmail.com>
Date: Sat, 17 Sep 2022 17:56:06 +0100
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
 <meta-virtualization@lists.yoctoproject.org>; Sat, 17 Sep 2022 16:56:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7618

On Sat, 17 Sep 2022, at 00:46, Bruce Ashfield wrote:
> On Fri, Sep 16, 2022 at 7:15 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> Hi Bruce,
>>
>> On Fri, 16 Sep 2022, at 16:23, Bruce Ashfield wrote:
>> > These two changes are merged to master.
>> >
>> > With respect to kirkstone, the issue is that by default the ptests
>> > are built .. as such we are bringing in new dependencies to the
>> > default build. That carries a bit of risk.
>> >
>> > If there was a way to make the ptest build and dependencies optional,
>> > and disabled by default, I'd be willing to merge that to kirkstone.
>>
>> That is understandable and we will manage this for now as part of our layer(s). Thanks for looking into it.
>>
>
> What about just the new packages ? (buildah and catatonit) ? Does
> having just the packages but not the ptest change make things easier
> on your end?

Absolutely. That would be a step forward. Thanks.

Andrei

