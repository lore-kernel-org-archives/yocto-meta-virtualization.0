Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.12640.1638543246348865351
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 06:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JcTHx1Sz;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id e3so12664791edu.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Dec 2021 06:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l+5dT2QeC3o56neJHL2KWj/1URIVjTCNdE8qBgFd4GI=;
        b=JcTHx1SzGMUObfjpKYTNUACUz937H2TGfBk8egGW+u2ievmbGzUZ0H/ZXGv169X1jN
         9WYRZ1Yr7Px/J9TnoMOPBsPhjccHWRBUBO5qVRUsoxn5F+OByAhEnNns1q2c77y/E0rQ
         m2Nui6scOPGAz6rDWJkycJspGzekNWaCmwdArQr57uLc3M4lffdUE2RiYqUSLoooK/nd
         flRAMvqLmoCXZkmTM1fS5PddxpXx/nhZXRrnV4sYm0juKYq/z8UTHDQwE72hiV5fCg81
         lh0bh5MO7vSV2H03NRVex3HTSvVRYdVgHwQSoVnm1m6XdsugbdSpdkxQcE5fVo4yIaf7
         r9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l+5dT2QeC3o56neJHL2KWj/1URIVjTCNdE8qBgFd4GI=;
        b=R3ydL9WMO3PGmhJs692A887R8DXGtAXTqZk3pgGJSQEc7Dmn/aCg5Kwe+k8Nw+lpPd
         zfCrXd3XG4BVVeR/DxuCB6OV/XKkeNNBC/yJicAj2P41ywnhzG+40biYKcZQh0yi/D+u
         6AmsHR98XLjDIW24CQK0yH0ggSzFS7OXz/COUUKIvZOA9gEAeSfKc9+grzSHTVJ/qV6T
         RRnQLqcE/PEPvaEftL6M60Mxu48qdXlI02kv3HwinvGS4k7BzqzsoSHxDCwYqo7wWHQY
         bbzA+op2PEaAZr8782beU6E9SQFEfDmmcTxDt0FE0EJMHu+yO6+ftKaQpBWmijnt73GC
         Y1Xg==
X-Gm-Message-State: AOAM533IbOMDGPTUtCAaAa5cmEExfmFo2lgBcZyCz66z7rm3DtwAl+tV
	R+BK66prJpwl/t+mBYFBZe61sJb9TD9xTD2nVME=
X-Google-Smtp-Source: ABdhPJyxAUHLdIaWyDM/1v82gtQSFXl/Bg5FDhmqnoFVdmYx3kSIKv3TXp8IQRis3u8WU0gx4+L0dw9H7tOgfgNm9Wg=
X-Received: by 2002:a05:6402:4394:: with SMTP id o20mr26756943edc.342.1638543244180;
 Fri, 03 Dec 2021 06:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20211203130427.8027-1-s.mueller-klieser@phytec.de>
 <CADkTA4OWD+Goy7XBZUFaW60fnD-wpFjaBVKLKc1t978g9u+mSw@mail.gmail.com> <9a41f678-a9b9-4540-9ff1-08144cdf2221@phytec.de>
In-Reply-To: <9a41f678-a9b9-4540-9ff1-08144cdf2221@phytec.de>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 3 Dec 2021 09:53:53 -0500
Message-ID: <CADkTA4PWoiV4e7JsxzSxKvaKTRq4-g_abUW2d15BmsvSuFPbfw@mail.gmail.com>
Subject: Re: [meta-virtualization][hardknott][PATCH] oci-runtime-spec: fix url
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 3, 2021 at 9:36 AM Stefan M=C3=BCller-Klieser
<s.mueller-klieser@phytec.de> wrote:
>
> On 03.12.21 15:07, Bruce Ashfield wrote:
> > Since we already have these changes in master, this is fundamentally a
> > cherrypick / backport request.
>
> true, I did not follow, sorry
>
> >
> > There are a couple of larger/group patches for the protocol and branch
> > changes, but there's an individual one for the switch to main.
> >
> > I cherry-picked and modified everything, and pushed it to
> > hardknott-next .. have a look and let me know if anything needs
> > adjustment.
>
> I just put hardknott-next in the build and it looks good. That is all I
> needed. Thanks a lot for the quick reply and the quick fix! Have a good
> weekend!

Good enough for me! I've pushed -next to hardknott.

Bruce

>
> Cheers, Stefan
>
> >
> > Bruce
> >
> > On Fri, Dec 3, 2021 at 8:04 AM Stefan Mueller-Klieser
> > <S.Mueller-Klieser@phytec.de> wrote:
> >>
> >> Upstream renamed master to main and github will remove the git protoco=
l.
> >>
> >> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de=
>
> >> ---
> >>   recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.=
bb b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> >> index c4083c09d818..99f309772310 100644
> >> --- a/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> >> +++ b/recipes-containers/oci-runtime-spec/oci-runtime-spec_git.bb
> >> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;m=
d5=3Db355a61a394a504dacde901c9
> >>   SRCNAME =3D "runtime-spec"
> >>
> >>   PKG_NAME =3D "github.com/opencontainers/${SRCNAME}"
> >> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME}"
> >> +SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps;des=
tsuffix=3Dgit/src/${PKG_NAME}"
> >>
> >>   SRCREV =3D "78ab98c0761136f84e6e21b24b4dcd0be68ab782"
> >>   PV =3D "v1.0.1+git${SRCPV}"
> >> --
> >> 2.20.1
> >>
> >>
> >>=20
> >>
> >
> >
>
> --
> Dipl.-Phys. Stefan M=C3=BCller-Klieser
> -Gruppenleiter Software-
> Tel.: +49 (0)6131 9221-0
> s.mueller-klieser@phytec.de
> www.phytec.de
>
> Sie finden uns auch auf: Facebook, LinkedIn, Xing, YouTube
>
> PHYTEC Messtechnik GmbH | Robert-Koch-Str. 39 | 55129 Mainz, Germany
> Gesch=C3=A4ftsf=C3=BChrer: Dipl.-Ing. Michael Mitezki, Dipl.-Ing. Bodo Hu=
ber |
> Handelsregister Mainz HRB 4656 | Finanzamt Mainz| St.Nr. 266500608, DE
> 149059855
> This E-Mail may contain confidential or privileged information. If you
> are not the intended recipient (or have received this E-Mail in error)
> please notify the sender immediately and destroy this E-Mail. Any
> unauthorized copying, disclosure or distribution of the material in
> this E-Mail is strictly forbidden.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
