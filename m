Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE0EFF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:24:14 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11770.1777379050018140082
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 05:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=RpR6v4qz;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g4fkF5W4Lz9vNs;
	Tue, 28 Apr 2026 14:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777379045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSdd8m20gYgFyFebRdsuZ3ouSRAZ5+8Jz9YiUS/NlyY=;
	b=RpR6v4qz0DLDDOMxu3Y+glu4dWncPW4jtAKpH25Q/omAyJjreaIi1IOPxUD0+S15mYsE4S
	WjtWgdSp4BJOuksdhyN8o9gS4YyM06M8C5PZGGavBXiGE56yER7MZFiR0UO1cp0xS8DmGP
	Ph/8kqot6T+i6vzvr47BNDyxyFtOmWJyy8LpVp1VfEBF5/OhZlBPk7rSgavMaMowaJtujI
	hPOomHw+h5cKeRZ1e84Y3PzBLsb09TDkLBBd5uAiOl9N/otwn+8+ZmleedUVygM0lB+Iw7
	xcp9dngdkBL7HkjVxaS+TwXlOBPnFmjUUNA3bxZz60y0wElVOI4rWMntR3TO1g==
Date: Tue, 28 Apr 2026 14:24:04 +0200 (CEST)
From: patrick.vogelaar.dev@mailbox.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: peter.marko@siemens.com, "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Message-ID: <499640415.413126.1777379044423@app.mailbox.org>
In-Reply-To: <CADkTA4OtD2a9yJWxWmU7Y8BFjTXy3rREDLbe19uOLDtwjnZo3g@mail.gmail.com>
References: <255898079.381409.1777353521045@app.mailbox.org>
 <AS1PR10MB5697C73C24228D7555130AF9FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <18AA811AD1565891.1885982@lists.yoctoproject.org>
 <CADkTA4OtD2a9yJWxWmU7Y8BFjTXy3rREDLbe19uOLDtwjnZo3g@mail.gmail.com>
Subject: Re: [meta-virtualization] Podman version mismatch
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-MBO-RS-META: 37yu5j8nrf6au55of6cun58eabuyfzwk
X-MBO-RS-ID: 0c5c1a33923897ecf80
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 12:24:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9774


> Bruce Ashfield <bruce.ashfield@gmail.com> hat am 28.04.2026 13:23 CEST ge=
schrieben:
>=20
>=20
>=20
>=20
>=20
> On Tue, Apr 28, 2026 at 7:15=E2=80=AFAM Bruce Ashfield via lists.yoctopro=
ject.org (http://lists.yoctoproject.org) <bruce.ashfield=3Dgmail.com@lists.=
yoctoproject.org> wrote:
> >=20
> >=20
> >=20
> > On Tue, Apr 28, 2026 at 2:11=E2=80=AFAM Peter Marko via lists.yoctoproj=
ect.org (http://lists.yoctoproject.org) <peter.marko=3Dsiemens.com@lists.yo=
ctoproject.org> wrote:
> > > meta-virtualization has hardly any recipe which fetches exactly git t=
ag.
> > >  So things like this are unfortunately expected.
> > >  In the past I have sent couple updates to mailing list to use real v=
ersions, but without success, so I gave up.
> > > =20
> >=20
> > Thanks for the encouragement of the 10+ years of maintaining=C2=A0meta-=
virtualization!
> >=20
> > The reason they aren't exact git tags or exact releases is that those h=
ashes stay valid
> > for such a short time that it simply isn't worth it. And there's certai=
ning no value in
> > constantly bouncing the files through _<version>.bb and the _git.bb (ht=
tp://git.bb) every time I
> > move off an exact release tag.
> >=20
> > Maintaining all this many recipes, that move this quickly by stacking p=
atches on to
> > languages that don't patch all that way would simply be chaos.
> >=20
> > Patrick: there's nothing wrong with script that was intentional on the =
version.
> >=20
>=20
> In this case, I looked a bit more closely, upstream is doing something di=
fferent
> which did in fact make the script report a different version than the ver=
sion in
> the code:
>=20
> build4 [/home/bruc...git/libpod]> git describe --tags
> v5.8.2-5-g88c5aaeec6
> build4 [/home/bruc...git/libpod]> git describe=20
> v5.8.2-5-g88c5aaeec6
>=20
>=20
> Which is what my script uses to pick up the base version. But the top com=
mit
> on the 5.8 branch:
>=20
> commit 88c5aaeec667af94c4fe3a5c2c7a42f8cf308b93 (from 28d04eeb8ec047464c3=
5cc6fbe766ca63b49d338) (HEAD -> v5.8, origin/v5.8)
> Merge: 28d04eeb8e 7a47175665
> Author: Paul Holzinger <pholzing@redhat.com>
> Date: Wed Apr 15 12:01:24 2026 +0200
>=20
>  Merge pull request #28510 from podmanbot/bump-5.8.3-dev
> =20
>  Bump Podman to v5.8.3-dev
>=20
> :100644 100644 9aba2b5c22 39273508b8 M version/rawversion/version.go
>=20
> Which is of course what the build is picking up.
>=20
> I'll have to add a condition to the upgrade tests to pick that up, and/or=
 see
> if I can put it into the scripting logic (it just won't hold across all t=
he languages
> that are used, so it'll be a bit fiddly).
>=20
> For now, I've manually updated the recipe to match the golang version.
>=20
> Thanks for catching that!
>=20
> Bruce
>=20

Thanks for having a closer look. I have no opinion on the reporting but for=
 me it would be important the version from the recipe matches the version f=
rom the sources.

Patrick

>=20
> > Which would be easier in your scenario ? (and by your scenario, I mean =
me changing
> > the version reporting in the recipe.
>=20
>=20
> >=20
> > - adding the -dev into the PV
> > - injecting the "base" version into the build via -X (or whatever mecha=
nism the
> > buld needs) ?
> >=20
> > Bruce
> >=20
> >=20
> > > Having the coming regulations in mind (requiring accurate sbom and cv=
e tracking), I'd recommend everyone using meta-virtualization to just copy =
any used recipe, correct git hash and update crates.inc.
> >=20
> > > Peter
> > > =20
> > >  > -----Original Message-----
> > >  > From: meta-virtualization@lists.yoctoproject.org <meta-
> > >  > virtualization@lists.yoctoproject.org> On Behalf Of Patrick Vogela=
ar via
> > >  > lists.yoctoproject.org (http://lists.yoctoproject.org)
> > >  > Sent: Tuesday, April 28, 2026 7:19 AM
> > >  > To: meta-virtualization@lists.yoctoproject.org
> > >  > Subject: [meta-virtualization] Podman version mismatch
> > >  >=20
> > >  > Hi,
> > >  >=20
> > >  > I gave the newly upgraded podman recipe a try but it seems that th=
ere is still a
> > >  > version mismatch.
> > >  > PV =3D "5.8.2" but: podman -v
> > >  > podman version 5.8.3-dev
> > >  >=20
> > >  > Do you want me to send a patch or do you want to have a look at yo=
ur update
> > >  > script?
> > >  >=20
> > >  > Patrick
> > > =20
> > > =20
> > > =20
> > >=20
> >=20
> >=20
> > --
> >=20
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >=20
> >=20
> >  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >  Links: You receive all messages sent to this group.
> >  View/Reply Online (#9756): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/9756
> >  Mute This Topic: https://lists.yoctoproject.org/mt/119043966/1050810
> >  Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >  Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
> >  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > =20
> >=20
>=20
>=20
> --
>=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

