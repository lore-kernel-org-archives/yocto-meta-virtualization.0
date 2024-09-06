Return-Path: <a-singh21@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8622CE7B19
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:55:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.35257.1725630943740933309
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Sep 2024 06:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=kTM/Y5LE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-singh21@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 486DtgVN098780;
	Fri, 6 Sep 2024 08:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725630942;
	bh=Pk1pwT746Myl4LnMvXO9r9qZ09FdjTTeGWV6w5k8Au8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=kTM/Y5LEPuQNnnUbM/Yo/d1UIbZ6zycHxteBgjvkfMjAcK63U5Al3Q+hRFCw+ZeDv
	 +3jX6Qgf7A+eOgy5UpOMVzPS3DkiFt+bnuUAZH0ruocQ9vdK9hVY91aImITqkDiXrt
	 HJj2O60tf7RpAiurm35hIcaiTFqbi84uC3q71st0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486DtgLj110369;
	Fri, 6 Sep 2024 08:55:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 08:55:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 08:55:42 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.72.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486Dtft8083541;
	Fri, 6 Sep 2024 08:55:41 -0500
Date: Fri, 6 Sep 2024 19:25:40 +0530
From: Amneesh Singh <a-singh21@ti.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: <meta-virtualization@lists.yoctoproject.org>
Subject: Re: Backporting Xen 4.19 to scarthgap
Message-ID: <xgoj4nxhjxlk7xsmaq3yd7w5t5wwbhrgcjhtqziiwuzr3hue26@2oefjdiwaw4k>
References: <g6fqs7n55g3tl5f3iqq4evfjvdbo3p33eyhmpqkwbtpqnwt6m5@sj4psvs2kglu>
 <CADkTA4NwyiEzkXuSwV5Uow679-3hq2mh7MpQxT-f4WwSaiS8-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CADkTA4NwyiEzkXuSwV5Uow679-3hq2mh7MpQxT-f4WwSaiS8-Q@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 486DtgVN098780
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 13:55:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8875

On 09:44-20240906, Bruce Ashfield wrote:
> On Fri, Sep 6, 2024 at 9:37=E2=80=AFAM Amneesh Singh <a-singh21@ti.com>=
 wrote:
>=20
> > Hello,
> >
> > Is backporting Xen 4.19+stable to scarthgap a possibility?
> >
>=20
> I don't hold quite as strictly to the "no new major versions in stable
> branches"

I agree, freezing Xen to 4.18, would limit things in my opinion.

> as OE core does.  In particular for recipes that I carry multiple versi=
ons
> of.
>=20
> Xen does fall into that category, if there's a compelling reason (i.e. =
a
> feature we can't backport that is required), then 4.19 could be added, =
but
> not made the default version (that would break policy).

I am mostly interested in dynamic node programming using overlay dtbo.
Although, I have not tried it with dom0less domains yet.

Other than that, I have a patchset which I'll have to rewrite to make it
work with 4.18 :p, so I was trying to avoid that.

What do you think? Is it possible to make this work?

>=20
> Bruce
>=20

Regards
Amneesh

