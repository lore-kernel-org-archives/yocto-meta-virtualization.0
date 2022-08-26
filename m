Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E17ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 12:57:36 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.36370.1661518655013491183
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 26 Aug 2022 05:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=pZv5JJZN;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D95B05C02A3;
	Fri, 26 Aug 2022 08:57:33 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Fri, 26 Aug 2022 08:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661518653; x=1661605053; bh=wppE++2a8c
	yV5C2xgloHG9Sdbeh+vEBIEqKoimWtYQw=; b=pZv5JJZNikVGQlONu93MZRWjDG
	H2wQqrDNckMq8sHrNuvkYCBX7xtQb6DItxuhMTW/XeIK6O/JVouOoCc0FVUXtoEI
	zslbrTXWOIpaBWNUh1tQiwFV3KOAj45o1jgdZqH9Z193Go4gj3PK3CuAT1a7l5tK
	r9fRe3bJzrta3zFOJkrb/FCDUqxPTRBiRq9SVIlT1sPHsRU/QhMeMdxrQv2550Ts
	JxOMVbzkUdcbcwawir6xqBsvfmEnVaUtdCTgoEtThWy5SqsHGCsOaMr3TTu80OTJ
	jG+UoT7RR49Lav9a2U15Q7IfNec+oG++lPwbsPK9EFEtSDs5ne3rpWaEDdTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661518653; x=1661605053; bh=wppE++2a8cyV5C2xgloHG9Sdbeh+
	vEBIEqKoimWtYQw=; b=uUrr4tqaPIc9VA3L0ziPPfinRwzjkim/A9pcjXrUZAXF
	y51FSDzxKBb/SanuQBtOFdcxuUQRuUMpMz9RRIuFahtSbAVB20y86NPwQSzSGqHo
	jDzDSrmxNsqCZw2enJXtNkn0v6wD+rYQBXiLUhzm8x+R6n5rkQL3D/6U6i2WSbsq
	/kkA8BeQdi7NwoeehNYuITwlsorTAOTMXBIG+0HkKdoMDDyBCJ9Nojpza8Q9gKZw
	+4vK9032PwiXy7fXsJp4MQZWzqEq39qzZ7pcXxS4c3ZhTxHLEA5/jUVgLwP7dRvZ
	VSQPR99zxuX4RpIHwN7DcaPhVbtsKSSkaW9V/wMtrw==
X-ME-Sender: <xms:PcMIY5SDYYst2MySWLm9jVQR7GSMmwX6I8AFa6bJdKyyhgF4vfPMwQ>
    <xme:PcMIYywaIuHod6OdVUx9Y8M0w2sss1HX6edCIicMyGUwSkmer0tBPGT6HndTnK2Wy
    2SM3TLGHfNrvzZWbpE>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnhepkeeggeefhffgheejffdtteekleekhfelffdvheejgeffueev
    ffelkefhkeefheehnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:PcMIY-0E-b5zqW7WkuaQSHkLwE3K6WIjsn19Bs4EqJsuEOVU8kg6Pg>
    <xmx:PcMIYxBz01_HRoY8p9EtUKCpeXDnFQ1XNNkB-tjYw5VfVSx_RdrkuQ>
    <xmx:PcMIYygibPVoPqZMpJxgPPdcKy1v47mIzpTPjaSShXjzW8XOuINEDA>
    <xmx:PcMIY4fmxr_ynfssB-fdsdK7cVzYGK-N42m_kpkKfe25N0mQvtXpmA>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A29B92340077; Fri, 26 Aug 2022 08:57:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <ff6ea9d7-9974-4f79-a54c-192c224362e4@www.fastmail.com>
In-Reply-To: 
 <CADkTA4MmzFSEpta+mvqCai95-bO2g_PbMHQGknLqjz7d_Q2GeQ@mail.gmail.com>
References: <20220825170933.1046874-1-andrei@gherzan.com>
 <20220826025610.GE23530@gmail.com>
 <70bdaadb-e6a2-47ad-aefd-5aee5ec35b0b@www.fastmail.com>
 <CADkTA4MmzFSEpta+mvqCai95-bO2g_PbMHQGknLqjz7d_Q2GeQ@mail.gmail.com>
Date: Fri, 26 Aug 2022 13:57:14 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [kirkstone][PATCH] podman: Patch for
 CVE-2022-27649
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Aug 2022 12:57:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7576

On Fri, 26 Aug 2022, at 13:54, Bruce Ashfield wrote:
> On Fri, Aug 26, 2022 at 8:38 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> On Fri, 26 Aug 2022, at 03:56, Bruce Ashfield wrote:
>> > This doesn't apply to my kirkstone branches, can you double
>> > check the patch ?
>>
>> Right. There was a conflict with the other commit I sent for podman (sysctl cfg ordering filename). Fixed and repushed as v2: https://lists.yoctoproject.org/g/meta-virtualization/message/7573
>
> I'm out of the office and don't have my normal environment, or
> otherwise I would have sorted it out and done the merge .. so thanks
> for fixing it up for me!

Don't even mention it! Enjoy your weekend!

Andrei

