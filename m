Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B03FC2A062
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 16:56:54 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46116.1767545809084909063
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Jan 2026 08:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+jroV3Z;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34abc7da414so10680020a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 08:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767545808; x=1768150608; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQn9MWXpEPtOJIMBueda99knkFEWkMvWJDbaLy27iZk=;
        b=j+jroV3ZJ6OBzSsUwXfhEfHrundr6/zd78cGc5GxX/sPPAsulLoa13xiI2Ohma+rCJ
         E/MqCcZ6dMLKzY+qA35Tub/mkxDDzg4xIv2qtyCRMG+gvJRMAK6CIdTh4blV98mNDCc9
         NGTyn26ZvKCqArvuUcTCZPhUwRr1cNPYmbKX/Yo70BXUwmjeMRtB8LrzvPUQK/jGOW2d
         rYu43nAua8O4i0ef0ZaB36NJcNpBC4yFOB3FL9JZ1qcBCWyHXhq/DYrFm54OhdyHC1Cj
         I8m6lbNEgkWJHwHmj7m/LemheZMf8J4gKQkFHbyy5hnfksetfsy/QqPDO4ZSTv+9T8CC
         u3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767545808; x=1768150608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQn9MWXpEPtOJIMBueda99knkFEWkMvWJDbaLy27iZk=;
        b=te9rmFUJuOAVt2ZvbsZhoShs7RGMZ4/tzJzfJnkXeV/10FzMHVTZdxikydIz/tetzw
         MQCMtnytsY+0CiPHOpCU/bk3/FwAQGr3o49D+c0q4h5Zg4xR7PjfSSp/Qsjeobz7N8MM
         0VU93iedJPoQN2DsJGFQ4rV2GMXNu3whLJjup3pVxas/aFn8NruapHzLs/KEp/24UQs8
         xVSwWf0RZLqByHli+3OmFROKu0+BPCZ66ppHwRSudReR+EG0Wbumiv6VcdGVTPYbUbJc
         OsT8365nR0qm3YelRKLpLn1YYd75wVPKbJV4YbGUngzP6wnmvGATK7iZTKoVmdfGbRza
         /+hA==
X-Forwarded-Encrypted: i=1; AJvYcCWu48UvoerkH/lC1uVbUPwa8lBOCi1eh/iyQa0aGV7feebig3ZSRZAN7X5EzF6akATX4E3gqLCmwKS3aMXJelL3RWTH@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw7vN8Q1/TnVBoEwhT2nP5tnbRMW1yne1IdQ9WxjEhW4erqM+ku
	UUe7Te27Zp0iGYlnlGIeg3DSurVRxp0TFJS+l3vTKjZlU1aK3Uz5lFTWXhpZFb9RSZM4XXM7e0f
	Xk3G3jg9TF2DLSGqgg2zSImKmE1qTnrw=
X-Gm-Gg: AY/fxX7DOEshG846P2vDpAhvKPFMBuzZnOyai0VUn9QqxsYGHCpg7a+j8ANcO6/lXEs
	95mipzdOTRiVrv+T+fN7NraI3C4T2Uj3smnhSEgr8bgBV1OvdeaKHsbEzHju4RJdiqmW+rQXI92
	5d0bAPJfG8ICoMi0qEcuC8f5xxQpAQ3fl4ox6jpQjHI0/NlftGDN8QLauyL85pRIGkuwRkKPZGr
	cpCe7Ah7Zt/Spk2iHsHA9K9p7+6EtcJRLBJ7r53UveyPptmP3qS6fS6xyUcuVL+n7QENUWk
X-Google-Smtp-Source: AGHT+IEsYr46+1Tz54ddB5QfEsr0bO8lybaoVTEvrzH2zwwBexjNqIVbtYvFfqniiH3SgAdMtAANsetn9kMnu5iUQmI=
X-Received: by 2002:a17:90b:3c47:b0:34c:fe7e:84fe with SMTP id
 98e67ed59e1d1-34e921cbcdbmr38696228a91.28.1767545808329; Sun, 04 Jan 2026
 08:56:48 -0800 (PST)
MIME-Version: 1.0
References: <CO6PR11MB5602B543BFFC3DF6C86DD99BEDBCA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <1885E2DCAB6244C8.1706869@lists.yoctoproject.org> <CADkTA4OS8wGT5VG=uBpybZamkSWk4Mxv9ReUaGt2t3q8J80D5A@mail.gmail.com>
 <b107ec79-2ef6-4e60-8af8-bcc97d30b12c@windriver.com> <18876F8CAA6DE5B7.2355985@lists.yoctoproject.org>
In-Reply-To: <18876F8CAA6DE5B7.2355985@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 4 Jan 2026 11:56:36 -0500
X-Gm-Features: AQt7F2qRun4jDoDqnStzIEY0gTqj0gmCqw_80J6_Or5MjUMNL37oWCs37360_6U
Message-ID: <CADkTA4Mn5nAdwmFWNorpnBGH1BxQVTNy7isQUXSLXZ2z7sVpwA@mail.gmail.com>
Subject: Re: [meta-virtualization] Issues with the new go-mod-vcs
To: bruce.ashfield@gmail.com
Cc: ChenQi <Qi.Chen@windriver.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 16:56:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9517

On Sun, Jan 4, 2026 at 12:20=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Sat, Jan 3, 2026 at 11:44=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wr=
ote:
> >
> > Hi Bruce,
> >
> > Thanks a lot for your prompt response and efforts.
> >
> > The BB_GIT_SHALLOW_EXTRA_REFS is the only one that actually breaks buil=
d.
> > Switching to the tag parameter looks like a good approach.
> > In case you want to check if things work for that new approach:
> > 1. Add in local.conf:
> > BB_GENERATE_SHALLOW_TARBALLS =3D "1"
> > BB_GIT_SHALLOW =3D "1"
> > 2. bitbake cni -c fetch
>
> I have updates to the hybrid fetcher (it was missing some
> de-duplication logic that
> is part of the go fetcher), and regenerations to all the recipes complete=
d.
>
> The recipes all have BB_GIT_SHALLOW =3D "1" now (for testing), and use ta=
g=3D
> when the discovery hasn't "unshallowed" a clone and the reference is a ta=
g.
>
> shallow=3D1 is still in the src_uri entries, as I mentioned it is an
> indication of intent
> that I'm going to leverage in the future. It simply means, the
> go-mod-vcs process
> thinks that this repository will work in shallow mode.

The changes are on master-next. I also confirmed that:

BB_GENERATE_SHALLOW_TARBALLS =3D "1"
BB_GIT_SHALLOW =3D "1"
bitbake cni -c fetch

Passes for me.

Bruce

>
> Cheers,
>
> Bruce
>
> >
> > Regards,
> > Qi
> >
> > On 12/30/25 20:33, Bruce Ashfield wrote:
> >
> >
> >
> > On Tue, Dec 30, 2025 at 12:11=E2=80=AFAM Bruce Ashfield via lists.yocto=
project.org <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>
> >>
> >>
> >> On Mon, Dec 29, 2025 at 11:23=E2=80=AFPM Chen, Qi <Qi.Chen@windriver.c=
om> wrote:
> >>>
> >>> Hi Bruce,
> >>>
> >>>
> >>>
> >>> The new go-mod-vcs recently introduced in meta-virt  has some some pr=
oblems.
> >>>
> >>>
> >>>
> >>> The first and most significant one is the misuse of BB_GIT_SHALLOW_EX=
TRA_REFS. It causes fetching failure when shallow tarball generation is ena=
bled.
> >>
> >>
> >> I wouldn't call it a misuse, it is actually required to make the suppo=
rt work
> >> and attempt to save some download space. There are thousands of depend=
encies
> >> for some of the recipes and MANY of them have tags that aren't on bran=
ches, or
> >> aren't at the tip of branches, so those refs are there to force a deep=
 enough fetch
> >> or to ensure that bitbake does the same "deshallowing"  as was done du=
ring
> >> generation.
> >>
> >> I could probably switch it out for tag=3D in the different entries. I'=
ve made that
> >> tweak and will run some tests.
> >>
> >>
> >>>
> >>> Use the following steps to reproduce the error:
> >>>
> >>> Add in local.conf:
> >>>
> >>> BB_GENERATE_SHALLOW_TARBALLS =3D "1"
> >>>
> >>> BB_GIT_SHALLOW =3D "1"
> >>>
> >>> bitbake cni -c fetch
> >>>
> >>>
> >>>
> >>> Error message: fatal: couldn't find remote ref v0.0.4
> >>>
> >>> Root cause: the repos specified in SRC_URI does not contain the requi=
red extra refs specified by BB_GIT_SHALLOW_EXTRA_REFS.
> >>
> >> I run with that all the time, I've never seen it, those BB_GIT_SHALLOW=
_EXTRA_REFS are
> >> not magic, they come directly from the repositories during discovery a=
nd are required to deshallow
> >> a repository.
> >>
> >> My tests with the tag parameter may solve the issue. So stay tuned, I =
have that and several other
> >> changes pending. But none of them will be until the end of next week o=
nce I am back in the office.
> >>
> >>>
> >>>
> >>>
> >>> The second one is the duplicate entries in SRC_URI. Example: errdefs =
in docker-compose.
> >>>
> >>>
> >>
> >>
> >> It builds fine here, what issues are you seeing with it ? Are you usin=
g VCS
> >> mode ? or hybrid ?
> >
> >
> > There are multiple places that the vcs generator looks for (and removes=
 duplicates).
> > I added another and am testing it. So once I fix the shallow clone logi=
c, I can push
> > this as well.
> >
> > I was able to build both modes locally, so it is a cosmetic fix, but wo=
rth doing.
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >>
> >>
> >> You can be assured that anything I pushed has been built many times, a=
nd has
> >> been runtime tested. So the first information you need to provide is m=
ore details
> >> about what you are building, so I can track down the differences.
> >>
> >>>
> >>> The third one is the =E2=80=98shallow=3D1=E2=80=99 parameter in SRC_U=
RI. The problem is that git fetcher does not support such parameter.
> >>>
> >>> In fetch2/git.py: ud.shallow =3D d.getVar("BB_GIT_SHALLOW") =3D=3D "1=
"
> >>>
> >>> So I guess these could be removed? And switching to use BB_GIT_SHALLO=
W:pn-xxx =3D =E2=80=9C1=E2=80=9D?
> >>
> >>
> >> No. I plan to add more support for that later, it just isn't ready yet=
. They will stay.
> >>
> >>>
> >>>
> >>> P.S.
> >>>
> >>> I sent a related patch to bitbake: https://lists.openembedded.org/g/b=
itbake-devel/message/18656
> >>>
> >>> The problem in bitbake is revealed by the current SRC_URI settings in=
 meta-virt.
> >>>
> >>> If you get similar error, you can apply the above patch.
> >>
> >>
> >> If I was going to see that error, I would have already ...
> >>
> >> Bruce
> >>
> >>
> >>>
> >>>
> >>>
> >>> Regards,
> >>>
> >>> Qi
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >>
> >>
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9514): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9514
> Mute This Topic: https://lists.yoctoproject.org/mt/116993898/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

