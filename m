Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D0AC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 07:31:47 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7740.1670571101226562528
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 23:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qvltSrQj;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id bj12so9448883ejb.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Dec 2022 23:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NHAWT+f//16+JTYklj3+taYdZ+GMgGvoOqv5XciqFx4=;
        b=qvltSrQjbDKotMVcSnm6h2SCLZnX5gfTRyXTJornlrNDMmSy/TN0xT+Rvw7gEp/jDs
         jymA1LMVf2eibhxqsdqcfYFKDfjCnJN+v6irBicOASRKFwtYHGmZWz8Okqdd+4D0Lp5Q
         P7lUe95UgQxStx8XruQamKNma3HBK6AVMN/9LBrWAb4qjG8Pt3TGJeAVk/zxhtGX6yKs
         PX0Ma1IZDC4JGUkhfGsUJ3rj0RSXD2UTFa8tXkjzZvEUGeocaNb9vdiZYRcGZ74u0byK
         XHIX9+H/BaVyT1mcW9deaf7C/QIrqBePwVXqpqak74sYanL0iqrTvIcl9Tthpj3R4z5+
         OE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHAWT+f//16+JTYklj3+taYdZ+GMgGvoOqv5XciqFx4=;
        b=GetWewhL3EwAUpnjw/L6EMZ6iPSgYhRH34N9qgYuKxanli08QoQiKhopMTEwj1oXCJ
         51Buel2w8fpOJWgzm9T/hk7hWCzvJIJujbgCgaOkVh9DaGRxCW+qsVOvFNEEATbdtQwk
         gvw9HxLGvIWyfsKO0y+yXeDSmC+WLa7dhkfjt0FQ1h////xatkB8fm+uclCeQpD2A+hS
         RvPgAU8wfIWDNgY9Nbzhg/1ziHM/Pq9Pv5fNPf/Ibe0t3Ss8/w8PiuxxbCt52HaqATdx
         6SzpLuy1zH5mwZ+E/D6f+6Xvz+QvZR1OngTWVqZvpMWdp82cqJg6nX7nVRw8DtRKycsk
         riQg==
X-Gm-Message-State: ANoB5plsBkG1BGhbFqR2/vwAaTsfkvWqlNxxIOisxIW305gNfA9u37tO
	axzPDZiEJYta9GV8BTotNeE=
X-Google-Smtp-Source: AA0mqf5Yl3Jrstq1MLPsJB6Q05AFKGtz0h6zm0B6JuAkesksZ56Xmpg6aTuRQc5TbBLDnIarJycL5g==
X-Received: by 2002:a17:906:c083:b0:78d:f454:37a0 with SMTP id f3-20020a170906c08300b0078df45437a0mr4029499ejz.67.1670571099544;
        Thu, 08 Dec 2022 23:31:39 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ss23-20020a170907039700b007c0aa8eaf47sm235550ejb.116.2022.12.08.23.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 23:31:39 -0800 (PST)
Message-ID: <ee926c5142aa5181b2c3bfa646620cc76801988f.camel@gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 0/3] docker updates
From: adrian.freihofer@gmail.com
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Date: Fri, 09 Dec 2022 08:31:38 +0100
In-Reply-To: <CADkTA4MDDd9mupbD-GvAjufDcPQoTK_67yF2ZDBVqOX0icTyFQ@mail.gmail.com>
References: <20221204213809.483131-1-adrian.freihofer@siemens.com>
	 <CADkTA4MDDd9mupbD-GvAjufDcPQoTK_67yF2ZDBVqOX0icTyFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 09 Dec 2022 07:31:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7751

On Wed, 2022-12-07 at 16:51 -0500, Bruce Ashfield wrote:
> On Sun, Dec 4, 2022 at 4:38 PM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> >=20
> > Bring docker on the kirkstone branch to the same commits as they
> > are on
> > master-next. Just let me know if you think this is not the right
> > way. I
> > can easily maintain this on my own layer. But there are some bugs
> > and
> > CVEs in Docker which make this update kind of mandatory for the LTS
> > branch as well.
>=20
> I need to have a closer look at the changelogs to confirm just bug
> fixes
> in the commits. I got bogged down in yocto summit things, which is
> why
> master-next has cooked longer than it normally does.
>=20
> I'm completing more updates now, so I'll clear the existing master
> next
> shortly, before staging more.
>=20
> >=20
> > Some findings:
> > * runc-docker RUNC_VERSION is on 1.1.2 on master-next. I set it to
> > 1.1.4
> > =C2=A0 bcause this looks correct to me.
>=20
> I'm not sure where you are seeing this. I see one shortlog that is
> wrong, but
> the versions are 1.1.4 in both of the runc recipes in master-next as
> it sits
> on the server and locally.
>=20
> https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&=
id=3D6dba10357ce8906c95b81d3256e945c617999aa8

My comment is a bit misleading because I picked just one of the two
commits which results in a broken state.
The final result is correct. But commit "runc-docker: update to 1.1.4-
tip" updates RUNC_VERSION of runc-opencontainers bb and the commit
"runc: update to 1.1.4-tip" updates the RUNC_VERSION of runc-docker bb.

>=20
> > * docker: SRCREV_moby is used by do_compile. For docker-ce the
> > variable
> > =C2=A0 is undefined on master-next. Here it is initialized to
> > SRCREV_docker.
>=20
> Do you mean in the .inc ? That's been a bug for a while, I switched
> to a generic
> value on master-next:
>=20
> https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&=
id=3Dd3acb1a378e644fe2784a8357390b19695640f78

The DOCKER_COMMIT variable looks good now.

>=20
> > * docker: Upstream updated to go 1.8 which does no longer compile
> > with
> > =C2=A0 Yocto's go 1.7. There is a patch to revert the go update. It's
> > working
> > =C2=A0 but not sure how long this way will work.
>=20
> So only a problem on the older branch. We could carry a change for
> that, but it needs
> to be in a separate commit.
>=20
> That last comment leads me to a general comment. The series is fine
> in
> spirit, but
> the changes should be kept separate and should be cherry-picks
> whenever
> possible. i.e. the updates to the 3rd digit versions need to be
> separate, and be
> cherry picks from master. That means they include the git hash they
> are cherry
> picked from, as well as the original sign-offs.
>=20
> That obviously also means they cannot run ahead of the master version
> updates
> (unless I bump a major version in master). As I mentioned above, I'm
> going back
> through minor updates now, and will stack them on master-next once
> the current
> batch completes some final testing.
>=20
> Things that need to be done to adapt to cherry-picked commits to the
> older
> branches, need to be separate commits.
>=20
> Bruce

Thank you for the explanation. I will send you a V2 with the same
spirit but completely different commits. It's almost ready.

Regards,
Adrian


>=20
> > * Testing: docker-ce running on a arm64 device can run a Debian
> > =C2=A0 container. We will do more tests in the future. But that's what =
I
> > did
> > =C2=A0 so far.
> >=20
> > Adrian Freihofer (3):
> > =C2=A0 runc-docker: update to 1.1.4-tip
> > =C2=A0 containerd-opencontainers: update to 1.6.9
> > =C2=A0 docker: update from 20.10.12 to 20.10.21
> >=20
> > =C2=A0.../containerd-opencontainers_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +-
> > =C2=A0recipes-containers/docker/docker-ce_git.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 30 +-
> > =C2=A0recipes-containers/docker/docker-moby_git.bb=C2=A0 |=C2=A0=C2=A0 =
27 +-
> > =C2=A0recipes-containers/docker/docker.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +-
> > =C2=A0.../files/0001-revert-go-1.8-update.patch=C2=A0=C2=A0=C2=A0=C2=A0=
 | 1218
> > +++++++++++++++++
> > =C2=A0...efine-ActKillThread-equal-to-ActKill.patch |=C2=A0=C2=A0 90 --
> > =C2=A0recipes-containers/runc/runc-docker_git.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 4 +-
> > =C2=A0.../runc/runc-opencontainers_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +-
> > =C2=A08 files changed, 1261 insertions(+), 125 deletions(-)
> > =C2=A0create mode 100644 recipes-containers/docker/files/0001-revert-go=
-
> > 1.8-update.patch
> > =C2=A0delete mode 100644 recipes-containers/runc/files/0002-Define-
> > ActKillThread-equal-to-ActKill.patch
> >=20
> > --
> > 2.38.1
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7733):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/7733
> > Mute This Topic: https://lists.yoctoproject.org/mt/95455895/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> > https://lists.yoctoproject.org/g/meta-virtualization/unsub=C2=A0[
> > bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


