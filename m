Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B876EC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:41:11 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.9038.1661334062091931850
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Aug 2022 02:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=4l0xORrY;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5C7DC5C00D5;
	Wed, 24 Aug 2022 05:41:01 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 24 Aug 2022 05:41:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661334061; x=1661420461; bh=7LnV5V76Jb
	638jMukfU7JXAo7WNd45Ye8x1kjMvhJ/Y=; b=4l0xORrY8ZIBs7z+/sTPNu7jwq
	WPS3c3ONuTbr+0SJjQdQ7JXZ5IXxjnmwBVKl/hvBwKL3n1U5A8+ZPn65JDZwel/W
	pFzZnHB307hCuRb0PWNNol2Vktraj6cQn5TNb7yWos+DXj2Ej8zG6ZYoJO+KA4tK
	n8ze0ynl6+aSZXomqe+cSVMCKGUswqMT3pgpu/hdSw8qVhgpiLkuarzd2D/dUvj0
	SnsJC4PphnAzERYkEmRCmfJdL4+hVbsqGKcMbDgKvW6E5SZIFNs2y3PfU49g2K1D
	4iVubsoQonuolNWftyDTc9Xfsss17CZSrlXI1sdV4xdsJ8pLld+qK42/FI/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661334061; x=1661420461; bh=7LnV5V76Jb638jMukfU7JXAo7WNd
	45Ye8x1kjMvhJ/Y=; b=HJEU6jgOOGbwj5hAPlhWiHIjpXh+5R/I7sDDc+KzoY1B
	vF0juI4lNDIT5SEJwW6oYhjspc+69uw9ACZnDIEcqMXp1GZxhh+vMBaYzM4WYBUU
	mujaoTFnLOLUSXYT54uduVxJD78dLyJE5gw6vv0dd6lpQtK7480ELpwRPeMJxlbd
	pYCQmVsX7Re7rkGC9E+2ISdR7fkPifHxPJTRE+6cm4kH4I35MrzTZz+iDtk0w4ue
	ZaBmZ6N89huiiVt1fTGubx3iKHR4azPgalWWoNMDXZhi/uPzqDTK3e9YNjpU6DOv
	CZ73DIG3kpsi6mDRFhgoZ1woxbU6y9tS3DCV6hC0Eg==
X-ME-Sender: <xms:LfIFYz5GA1pveHZLvN1DR0olpdAu8xAWy7IP_d-VchN03eGAvv2Z-w>
    <xme:LfIFY464nhEIIrPep3s9-EVDcvsuMFcOdnwlnhU70vJ7Pyz5_ROnP_Yn3pwwm-U0h
    6am5zsDWCxpwdhwaio>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:LfIFY6eArFjLl1FHqRhdtWBMGZpz0L15C2s9uWih2GETgCFmuLW1sA>
    <xmx:LfIFY0I94G3EU_tLoTnr6hMcLd66bVI7xO7RPgGuXXuAtCeEKY8I_w>
    <xmx:LfIFY3IlnzDIaJLxPv8fyjOW3K1tolAl7ofbj_BlD3ZOmFn37kiqKw>
    <xmx:LfIFYykvYChCb6jkr-O73JuqYuxS1k7UQ4RPMa4w1NSQ4pk2FrENjQ>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 251942340077; Wed, 24 Aug 2022 05:41:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <e0d3e917-3230-45ab-b69a-eb874300c8e0@www.fastmail.com>
In-Reply-To: <20220824014814.GB3948@gmail.com>
References: <20220824000719.2495588-1-andrei@gherzan.com>
 <20220824014814.GB3948@gmail.com>
Date: Wed, 24 Aug 2022 10:40:39 +0100
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
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Aug 2022 09:41:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7559

On Wed, 24 Aug 2022, at 02:48, Bruce Ashfield wrote:
> merged.

Thanks, Bruce. Can you also cherry-pick this into kirkstone?

Andrei

