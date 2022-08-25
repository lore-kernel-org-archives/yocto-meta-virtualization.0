Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230F3ECAA25
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 16:37:40 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.26304.1661445456873177109
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 09:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=ALFXus7V;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 24A445C015E;
	Thu, 25 Aug 2022 12:37:34 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Thu, 25 Aug 2022 12:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661445454; x=1661531854; bh=+GWOaGrPQ4
	MNzY85QapnCYcidYnmJZMQENNOI8iGebk=; b=ALFXus7VafPEP2pPJfO5dsQXDE
	838rw9NJFZ1sebbJhRgd1unob/HX2t/+cQq3E4h5qzTYIar8kbzT/Wl2vlEZRX0y
	ypVS1hev8xkehZ7jbrPWeBjBYxWIoJTrusDfcXbQLLCOl9p2IWGFQOOWM9WRwQU3
	+pNWpxQo6pyVV+FcKhqX+xhqTfiN/BECMO1yF0k2xdGe47thqltxc62lnY0Hi1aV
	Xaz7MJQUUzTrDaZmeIi0fUucbXsIvs3OhrOdKDZYQNAgAc387FCmwZ+pUFMeTd4i
	J/xasJ3Nc1r4slJsV0xqrDgNaKr/XmyK/P6VEDwPfMxpOxMlmBrSXfA4zgNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661445454; x=1661531854; bh=+GWOaGrPQ4MNzY85QapnCYcidYnm
	JZMQENNOI8iGebk=; b=Wtmd0fYZcUe3xI8IfqSj4AiJIaBTAwaf03pFZO78tlEZ
	tvjYtW2rOnt777Rh1Flq8shG/6IUw2CYo2+Hc22u1xAUbtKOQB4fi50aomN3IYuT
	nLfClXBN3gDvE6HK1IFcjRdBJRsXz58pMw/SKCFdvDskoyrsZxvdqc88YET5HioU
	YyuCF446OjwfTjKc83eA5xq5CPYH9djjZzNd03/p5bl7KT78GZ2yGdAZeScQYivj
	mBgD+KHsWNwrxw+WSYj1F3aJ78QKfgTjb8683bZhnhvuxJuw+jiW2c+xRfASgFsl
	tOaOk/H5tqwOVvo2lWmWYUyG6AG8BZOJLpl8XuC7hQ==
X-ME-Sender: <xms:TaUHYyb8GzH0U298Mlmy3gC6TyPftvW3IUU1OjMgzvFTmgBk4ZE_Fw>
    <xme:TaUHY1accrwnBXFFz4q4XvT0CqLfui1LMYlvUluTAXFKWCGQMVE4pBtV11PSNdymQ
    EHW8umBROq25ERaJ_g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejfedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekgeegfefhgfehjefftdetkeelkefhleffvdehjeegffeu
    veffleekhfekfeehheenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
    vghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:TqUHY88s6t8VO0gdqg5GRerotyLVpPKRRcS9yfJVwvpS5au6hayEyg>
    <xmx:TqUHY0p6rtBjNhxoDbx_XAaD598P4Ah0RW4dhX4zq9hgnG0-lihbBA>
    <xmx:TqUHY9pRpMBfbrBCNukv-RvoMd1taG9m7eeKgVNOkjgqAqMuyzqHvw>
    <xmx:TqUHY_HDEew5-40thKrKfl3aMvM0ONcBcchSEoFj849hILg5ZMla2Q>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DA72F2340077; Thu, 25 Aug 2022 12:37:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <e5aa54d8-6f2d-48dd-a8a9-919d49fb06d5@www.fastmail.com>
In-Reply-To: <e0d3e917-3230-45ab-b69a-eb874300c8e0@www.fastmail.com>
References: <20220824000719.2495588-1-andrei@gherzan.com>
 <20220824014814.GB3948@gmail.com>
 <e0d3e917-3230-45ab-b69a-eb874300c8e0@www.fastmail.com>
Date: Thu, 25 Aug 2022 17:37:12 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: Rename podman-rootless.conf
 sysctl
 file to aid overrides
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Aug 2022 16:37:40 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7564

On Wed, 24 Aug 2022, at 10:40, Andrei Gherzan wrote:
> On Wed, 24 Aug 2022, at 02:48, Bruce Ashfield wrote:
>> merged.
>
> Thanks, Bruce. Can you also cherry-pick this into kirkstone?

For clarity, I've sent a kirkstone patch too: https://lists.yoctoproject.org/g/meta-virtualization/message/7556

Andrei

