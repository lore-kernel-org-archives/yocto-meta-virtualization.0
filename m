Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFB5ECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 10:36:10 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.24050.1661942153511776685
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 03:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=KU98YZeV;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 968A15C00CB;
	Wed, 31 Aug 2022 06:35:52 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 31 Aug 2022 06:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661942152; x=1662028552; bh=v1Mjoa2Q4j
	ePwmxvQn0UKwhyZXuFYTE8Jyjbs2WQpYo=; b=KU98YZeV2GGC8P4FGX6+RSoIpq
	oK22UnQ1D0CE+QBstdnIwFgJyVIMn0rWJKI8HWvcSRbY4vVaqPjSnNBGCOpZvHcu
	dqEEJE/qiCjFP4aqPNlzsSwfloDEcpHqpdRME/MEKZVSpYJUM43JAEpvoMJ2qoMJ
	tIuZlQJmYH3UyxyJjLrSbLmvS+iDvf6t/vgiJ837FaTlEhK5y2iR/uBMC8+iLakm
	siA/iGbtGNCtcOEirqBF7ERcB45WCuzYqrdFo60fRtnVjMRekOjzqAfwMCYoy8mE
	UQmZJDhE0hJtTId1lG49BjoZVGLZJULT+MirfrsGkaGH9TDlT4eTaiPG6wRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661942152; x=1662028552; bh=v1Mjoa2Q4jePwmxvQn0UKwhyZXuF
	YTE8Jyjbs2WQpYo=; b=CvKwCJZNiC2wEcyInH62o6fAuzN/LwDwEeFithBL5vQX
	XSl7X3DbF+GItfiX32rAvn/r7MMmvWJsbcEfiOfZOa6GWTr7+4YT48p7prbEyM7K
	tQ9XArRZPJxxXwnOaBI1xkgrdYvhZ8on2+OrGZIj0L3wjTQZnxGjre5CmtIcAJ+l
	EAj9rcndrB6XBthzqTFoNQsu16Hwy3wHRucKv7ohhhGJ/Vkn/3Bkhrz7dYci+pv8
	vrgWQjAfrnHShWXbLn3Sa0o3KlR5aXrUHrFYWXGZ7/ywkdDhuAcK4E+VfbeCWYOl
	ygsVplR7AqDdsLWCamfbE6RmfNxO9T78jMMyC2PpDw==
X-ME-Sender: <xms:iDkPYzAZrokbfoQgvq0oCt9DuYNLZZEydGB6_3LYsSchG62zcM8m1w>
    <xme:iDkPY5j19ykKFuHGfAdHhrWL5nBKadO8YxxrUlMhtX8CmQRLmtoEAfkB8IKDMco_b
    suI6JFRIAmSb8xN1ok>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekiedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:iDkPY-l5utTn6_6_hkOayAK-T1mh7IdeyCknbFL1JdXsXEahvFIqNQ>
    <xmx:iDkPY1yqnNKspEryLf1sXog5FAdudWYry7FHc9wV2mokZQsWmj3evA>
    <xmx:iDkPY4T11n7UWnyFcAKsVMOLNmy-yTDTLbd7quqtOxmec31dLxeI5Q>
    <xmx:iDkPY3NDPMFWWX-2RSfo_9vpOgIUICiHLJ7gWwlhg72jddL70ibINg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5AE942340077; Wed, 31 Aug 2022 06:35:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <da953f67-644c-49e1-8446-407d5a1e023c@www.fastmail.com>
In-Reply-To: <20220831014708.GA17114@gmail.com>
References: <20220826113319.1269257-1-andrei@gherzan.com>
 <20220831014708.GA17114@gmail.com>
Date: Wed, 31 Aug 2022 11:35:31 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [kirkstone][PATCH v2] podman: Patch for
 CVE-2022-27649
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 31 Aug 2022 10:36:10 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7586

On Wed, 31 Aug 2022, at 02:47, Bruce Ashfield wrote:
> merged!

Very much appreciated.

Andrei

