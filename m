Return-Path: <yocto@optimcloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982A5C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:42:32 +0000 (UTC)
Received: from mail.optimvoice.io (mail.optimvoice.io [46.23.82.140])
 by mx.groups.io with SMTP id smtpd.web10.9748.1643985749832313801
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 06:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no public key found in DNS TXT" header.i=@optimcloud.com
 header.s=dkim header.b=W5WI9F7X;
 spf=pass (domain: optimcloud.com, ip: 46.23.82.140,
 mailfrom: yocto@optimcloud.com)
Received: from authenticated-user (mail.optimvoice.io [46.23.82.140])
	by mail.optimvoice.io (Postfix) with ESMTPA id 323B464002D;
	Fri,  4 Feb 2022 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=optimcloud.com;
	s=dkim; t=1643985747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+h01rH7U5McugiQ3Yjb6X1BUezJNQqHNF59TuRmo1c=;
	b=W5WI9F7XtpO29CQdIuyIrwIqFTBl7GNTAKiwS5dtlIQFn3ancaRCipjYmxmOtp3yBddFT3
	T34oOd3tzz0DP3yCXCEM6TcS4kPEhqUD/oq9MDjbqA76FsNxWp8ZnuBDXGwz2QqVIiUYOS
	/ditdwoXPh+DEtc3/yYl/qyzWL8dnbwvJdHXs4EA56O7r4OkY9lMIAY11/ibswTEiq2+Eh
	H8o2zCf5POMts5VBhnBxt34GFt/l4C6iPNqsqB6Hw+Hgf2fZf801tnAkunvLlyEGuzAfsf
	ld4QlpWA2sUYPyuuw8uqTEpbOBz7ig1F80ijQfqkoDGMavFzpVXCRuVHK2RO3g==
Content-Type: text/plain; charset=utf-8
Message-Id: <1643985053428.3389501462.529681158@optimcloud.com>
From: Embedded Devel <yocto@optimcloud.com>
To: =?UTF-8?Q?M=C3=A5ns?= <mans.zigher@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] Docker and GPLv3
Date: Fri, 04 Feb 2022 14:42:20 +0000
In-Reply-To: 
 <CAEhQi8mFNmsjymm6tsFCekZpJzXjbibkdHXA4f0KLP2FHZwnCg@mail.gmail.com>
References: 
 <CAEhQi8mFNmsjymm6tsFCekZpJzXjbibkdHXA4f0KLP2FHZwnCg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Authentication-Results: mail.optimvoice.io;
	auth=pass smtp.auth=yocto@optimcloud.com smtp.mailfrom=yocto@optimcloud.com
X-Spamd-Bar: /
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 14:42:32 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7046



On Friday 04 February 2022 21:23:18 PM (+07:00), M=C3=A5ns wrote:

> Hi,
>
> Well, does GPLv3 not require that a customer should be able to build
> the GPLv3 like bash and deploy it to the target? It is not directly
> secure-boot but the customer has a boot up sequence that starts with
> secure boot and then the rootfs needs to be signed. So it would not be
> possible to open up the device to allow a customer to deploy his own
> version of bash on the target. But I might have misunderstood GPLv3. I
> am not an expert.
>
> BR
> M=C3=A5ns Zigher
ermmm no... my understanding is if a device is bootlocked.. grub or =
secure-boot, then the vendor only needs to provide a way a client having =
ownership of the device
can make, rebuild, duplicate, circumvent the secure-boot. ie... make it =
undoable/bypassable and as long as they allow users to install their own =
secure boot keys

now im not  LAWYER .... However.... if a client can regenerate =
keys/bootloader/image then i believe your safe.

>
> Den fre 4 feb. 2022 kl 15:19 skrev Embedded Devel <yocto@optimcloud.=
com>:
> >
> >
> >
> > On Friday 04 February 2022 15:53:42 PM (+07:00), Mans Zigher wrote:
> >
> > > Hi,
> > >
> > > A client of mine wants to have docker on it's product and they are
> > > having secure boot enabled which prevents us from having any GPLv3
> > > licensed code on the target.
> > Okay, wait, why does enabling secure-boot prevent including GPLv3 =
packages??
> > Ive never heard this before.
>
--=20
Sent with Vivaldi Mail. Download Vivaldi for free at vivaldi.=
com

