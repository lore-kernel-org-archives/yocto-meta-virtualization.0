Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AA4D609DF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 19:39:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2645.1765913974687552494
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 11:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=CTBmpxFm;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WsPaW63akk5U0Jj6EVtEhoFIGu+M5/IAtoJ+F6oZ2R8=; b=CTBmpxFmP1Sr2K0tGE10rE2Vet
	5qvaqL3/Kyn6GQy7sG91lhQDxdZeyFDo8IQCCKgku7NvPLGnIuwo3sZINuGyVG4QUg/gHV/PxFEWX
	tR5CclEnv+0AjS4eJmBQnNc6YK4fTI8BvpDm+uTlsXVSLdSualhmluEVc/6t0un00T25mLi5wdpXJ
	quXSx5QhgEtM/7fgEOY+RoU9Mpdn4jlQDPLbTtLvXOxDTLxY2ZUyUzPj10FE2OIG/MzQqrkAZv79C
	o7AOnqX5ECYl7vLnIAY/8qRT1PhOTy73JvX9CnEjUH1DRlnLe7EyKRnjarRxiLqmJZH/wNr47dyAX
	BvAkfB+A==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:48350 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vVatN-0000000830E-3PoX;
	Tue, 16 Dec 2025 14:39:33 -0500
Date: Tue, 16 Dec 2025 14:41:19 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: christopher.w.clark@gmail.com
cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] Why do *all* xen-tools recipes set
 DEFAULT_PREFERENCE to '-1'?
In-Reply-To: <CACMJ4GYXidSqvQtQC9iizONhj4mK15hzS7Y_dswgsf4uEnVQzA@mail.gmail.com>
Message-ID: <61692bd6-405f-9034-3745-0408ec03419c@crashcourse.ca>
References: <7a68aa42-0904-18cf-7619-c97b4bf310b1@crashcourse.ca> <CACMJ4GYXidSqvQtQC9iizONhj4mK15hzS7Y_dswgsf4uEnVQzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-7991155-1765914092=:106698"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 16 Dec 2025 19:39:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9487

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-7991155-1765914092=:106698
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 15 Dec 2025, Christopher Clark via lists.yoctoproject.org wrote:

> On Thu, Dec 4, 2025 at 8:23 PM Robert P. J. Day via
> lists.yoctoproject.org <rpjday=crashcourse.ca@lists.yoctoproject.org>
> wrote:
> >
> >   Working on enhancing some documentation and, regarding
> > DEFAULT_PREFERENCE, I noticed that *every* version of the xen-tools
> > recipes sets this variable weakly to "-1":
> >
> > https://git.yoctoproject.org/meta-virtualization/tree/recipes-extended/xen
> >
> >   Is there some rationale for this that isn't obvious?
>
> I don't believe so, just maintenance involved when looking at which version is
> most appropriate around time of releases. From testing with the latest Xen
> recipes, there is work we can do to make the recipes better to work with:
>
> Current x86 Xen host images are building in a wic task, introduced to build
> multi-partition disk images via tooling integrated into OE.
>
> With experience:
>
> - the kickstart files aren't bringing much benefit in practice
>
> - the implementation ends up distributed between wic, the wic plugin,
>   kickstart files, image recipe and OE classes
>
> - static bootloader configs aren't viable, because they're brittle:
>   eg. need to be dynamic to respect KERNEL_IMAGETYPE
>   and configuration is typically affected by settings from multiple places.
>
> - the hddimg IMAGE_FSTYPE alternative only supports single-partition
>   FAT filesystems, not sufficient for many systems, and not designed for
>   flexible inclusion of guest VM images
>
> We can make it easier: replace the use of wic by adding a class for a new
> IMAGE_FSTYPE: it can write multi-partition output and enable simpler recipes.
> Should be more capable than hddimg for systems with more advanced filesystems
> and boot requirements, with more accessible configuration than the
> wic + kickstart + oe classes + image recipe machinery.
>
> Thoughts?

  I don't have a lot to add to this, I just made the observation; if
someone else higher up the food chain wants to clean things up, I will
offer all the long-distance moral support I can muster.

rday
--8323329-7991155-1765914092=:106698--

