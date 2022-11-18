Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453DFC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 10:54:50 +0000 (UTC)
Received: from srv.signum-media.de (srv.signum-media.de [159.69.219.184])
 by mx.groups.io with SMTP id smtpd.web11.8832.1668768884394101460
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Nov 2022 02:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@signum-media.de header.s=20221012 header.b=bPiyOA4X;
 spf=pass (domain: signum-media.de, ip: 159.69.219.184, mailfrom: g.meyer@signum-media.de)
Received: from serenity.localnet (muedsl-82-207-231-140.citykom.de [82.207.231.140])
	by srv.signum-media.de (Postfix) with ESMTPSA id 7FC101FA06
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Nov 2022 11:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 srv.signum-media.de 7FC101FA06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=signum-media.de;
	s=20221012; t=1668768881;
	bh=hOb6L9rqdTRAPGv9T0GzcCqU3j9KALXW5xhLFOxnyXE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bPiyOA4X4iwjiG9ZoC4L67mCEyYHNsAAqLtUmeQThloReP0a4TJXv2uiCZpJQRzC5
	 tBjBqX+K4PBnFiXPa6q+GuDfGdBECBYBRxHIsSEuNpdFZc1bt3Bfi93fAkMxLlzZrX
	 /ghCbOYT+Hh58tSUXyTYiVcPV3nB7+O0duPeVHfnb6C5QuotRiFW1MUjQSWCemPfhK
	 UP99ykC9LGgDq2NOYkM0l2ByN9heZ088z+67C+QXW9mdVtB1QskZI+ATyg7tePQvG/
	 rFgFiBvtZkCBJD9TbUUO/kKpSKYiKmuoeTrSUA4ihoiE/ijGLTx+0++5Z5TY4PhUav
	 8ryZJg74sqyFw==
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] nerdctl: renamed upstream branch master to main
Date: Fri, 18 Nov 2022 11:54:40 +0100
Message-ID: <2337934.gR67lt3PR5@serenity>
Organization: Signum Media
In-Reply-To: <CADkTA4P8s4Eq9J-O3d7Me=0hxaowjS2exwYUhN8Nx+RbAgxUeQ@mail.gmail.com>
References: <3130543.zt3vOreWX6@serenity> <3063635.q5XDOhcSLO@serenity> <CADkTA4P8s4Eq9J-O3d7Me=0hxaowjS2exwYUhN8Nx+RbAgxUeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart19235908.1RHo84K0Qk"; micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Nov 2022 10:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7687

--nextPart19235908.1RHo84K0Qk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Date: Fri, 18 Nov 2022 11:54:40 +0100
Message-ID: <2337934.gR67lt3PR5@serenity>
Organization: Signum Media
Disposition-Notification-To: Guenther Meyer <g.meyer@signum-media.de>
MIME-Version: 1.0

On Freitag, 18. November 2022 00:32:52 CET Bruce Ashfield wrote:
> On Thu, Nov 17, 2022 at 4:25 PM Guenther Meyer <g.meyer@signum-media.de> 
wrote:
> > On Donnerstag, 17. November 2022 19:23:08 CET Bruce Ashfield wrote:
> > > The change itself is fine, but your patch came through mangled, and it
> > > doesn't apply to the repository.
> > > 
> > > I could make the change myself, but it is probably worth sorting out
> > > which part of the patch sending chain caused the corruption.
> > 
> > Ok, what's thew problem? What can I do?
> 
> How did you relay the patch ? Was it via git-send-email or something else ?

I did a "git format-patch -1 HEAD" and pasted the result (without the header 
lines) into my MUA. As this looked similar to other patch emails, I thought, 
that would be fine.

> 
> Following my normal workflow and scripts, the patch is definitely
> garbled/line wrapped:

Ah ok, my MUA wraps lines at column 78, maybe that's the problem.
I will send the patch again.


-- 
Signum-Media Softwareentwicklung
https://www.signum-media.de
Telefon: +49 89 215 443 28

--nextPart19235908.1RHo84K0Qk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMriC4l7RumrDsZEievmd2d8CKRIFAmN3ZHAACgkQevmd2d8C
KRL4MQ//bLmPrn/07rnkSj1xIMno5Tr+huFizutPqQjTKzXurXKSIr+MD1ftg4fr
qp9AuHPCDPaY/rnY1tQMsa0thZQmKeAEbTVopbjvC82LEjFljlsqaIH2sg+XZkl8
ufZ+vJF5DXnxh/Ll1pmu3Lk43IavBu3yOSDsiyFkTEYzf9W0kMynOoyVeELhU6dl
OhspGFnNm1xlsY2WGGMxChbnckZLqR/gymIGL4h26C4RiNZkBM9vI9u+ZbhTGnnf
+Pgn+BMighJXG6vGKwDn+9UNYXTHZVmZtCCoxXHZPVj1mU5kbljp9n059hQ7bNxC
AoD4SVg/Fnhi/Oi1vjkQuniXI9i41xO8JT8vPB+pv2vp0Z1G/J854NnTTuQd4p49
IUBm6SzR0v5Ndl1pHo96h5x+2ptQ108Y/bP/Em3/RD7PC7x4MWKTd2bWm1KeAqPN
USZn9clvneeugF+sCGWZZE1CYQOZ1f8fw8fqbTlUc0xs8mlISz1EIdzfmUfdUKxf
Sc22UL0t5ygY86u9PnLpzIMzlkZi/gPt7EbBeem4VLVXzfmonyfiG2QHLTg2j6Fy
NM60h468kEBC+96AMPuj1lKYXbKVmFCTY/kbCIFPc62l8kTEYKUoUhQO7Fc4S5UY
eMwXoQvDMRUxtlRXDaK7Disgix+liHS0GUyYS4T5XdELlZq/gsY=
=RUiT
-----END PGP SIGNATURE-----

--nextPart19235908.1RHo84K0Qk--




