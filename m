Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.7900.1620994866971482394
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 May 2021 05:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=orCO2WCC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id a25so10343805edr.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 May 2021 05:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=18u3p97I7WqrTGJfLFpIV3zSK8izLJc+fKCsG9VC+Wc=;
        b=orCO2WCCEVXtSSPJIKx6OngjbYlZqhvt32eQJbZk6+yom/jpjLeuaM8g8ILB+7M/hi
         dD9pleW6ByztABkMJ9fH3d/YzXIVwev1SuJS7O5fEDTyQG39mciTf85Z8qGPrAcb54uA
         pOyF5jZa5ddiy3W/nJVzPHydSqKBWgsMeqLnJZtbQfDm12lqJHlu8J1NiPapQXE8Jjv1
         Gdco/CHpt02APp2aj/Asn2JRiHFV9KaaqNFaK9M3NcdgjgQB0pJv23x5CpYcBpJaeE55
         RNj1SMA+tZTPgwInyfZxuNbVVN3oAu9j5VG8R0BeYVXwW3L5Vhz6GR3Iva76urRvfGs8
         6vXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=18u3p97I7WqrTGJfLFpIV3zSK8izLJc+fKCsG9VC+Wc=;
        b=t2v1/LqOHjFmsD3U0mtghCTuZ9DuSLxszLUD9oZYAFittw0AkOYgIh525pEX81fDIX
         O94/Xf/zAyE4c0hpzml+4bhqPOmovnotNnEYZccSykyXM11V75ZkVYevp5neEwX7c4gY
         jzjTZPRdXWlOEIL36OfQeTTC8mwRd4tZyn6y6ttZSSjDzA00AYkF0HWwWjRI3C+xgq4U
         9SBBHSF1GEPr1YQ1Ey8jZmNABIiDJWpL5Pazvw3OEfJNoy/7RWYrgsFjSnyklFCuJEMo
         7ALd1b5emdz57SMs9v6qU97AJzH/Uy+7AxSlZ7sgSvbHGdCvnHiuJWXhX4CIV4jasj8B
         kZdQ==
X-Gm-Message-State: AOAM531ZTby8TfgKCKOhZAVXVDm7hBo1dKxoKWgTIoGzXUTpNi0WUoo2
	vtjKNVXUMHieM7xIpPspQmWzePXjJBrhJaR2968=
X-Google-Smtp-Source: ABdhPJx3RdvJpkyHXVH+ZVlNKbpr5ZkhkMusNq1+T7StBnWLMqDMnxQVwrplFCtwl1WD9o/hlo5D0YJ44GyWOiKaAhM=
X-Received: by 2002:a05:6402:11c7:: with SMTP id j7mr56665238edw.129.1620994865395;
 Fri, 14 May 2021 05:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210513105212.1446927-1-Martin.Jansa@gmail.com>
 <CADkTA4MirjyDNy-+oV1zrJf5H1XeWsNFqszC4ViY6cW9qK5wRQ@mail.gmail.com> <20210514065018.oyfzrvriattx2zyl@jama>
In-Reply-To: <20210514065018.oyfzrvriattx2zyl@jama>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 14 May 2021 08:20:54 -0400
Message-ID: <CADkTA4MKNO+eWYPbfXxJhptEvEu=wKh6MVQJhAPLYjPPFsP6aA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Revert "runc-opencontainers: use bfd even with ld-is-gold"
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Something went insane with my setup and my master-wip branch was
pushed to master.

I just did a history reset, because the recipes that were on that
master push were so bad, they needed more than a reset.

Apologies if this throws anyone's fetches into chaos, but I just
didn't want those bad/broken commits around at all.

Bruce

On Fri, May 14, 2021 at 2:50 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>
> On Thu, May 13, 2021 at 11:08:50PM -0400, Bruce Ashfield wrote:
> > merged.
>
> Thanks for merge, now please push it as well :).
>
> ("xen, rpi4: fix typo in raspberrypi dynamic-layers inclusion" is also
> missing in master branch)
>
> Cheers,
>
> > On Thu, May 13, 2021 at 6:52 AM Martin Jansa <Martin.Jansa@gmail.com> =
wrote:
> > >
> > > This reverts commit dda5ae36b44c61e61439341ea3153e6be5cb015e.
> > >
> > > binutils gold linker was fixed with:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3Dd07d4d73=
9ae17787017f771dd2068fda0e836722
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  recipes-containers/runc/runc-opencontainers_git.bb | 7 -------
> > >  1 file changed, 7 deletions(-)
> > >
> > > diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/re=
cipes-containers/runc/runc-opencontainers_git.bb
> > > index 51ba7c9..f3ff9a8 100644
> > > --- a/recipes-containers/runc/runc-opencontainers_git.bb
> > > +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> > > @@ -8,10 +8,3 @@ SRC_URI =3D " \
> > >  RUNC_VERSION =3D "1.0.0-rc93"
> > >
> > >  CVE_PRODUCT =3D "runc"
> > > -
> > > -# use BFD when ld-is-gold is used to work around:
> > > -# http://errors.yoctoproject.org/Errors/Details/580099/
> > > -# CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath  -tags "seccom=
p seccomp                       netgo osusergo" -ldflags "-w -extldflags -s=
tatic -X main.gitCommit=3D"fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty" =
-X main.version=3D1.0.0-rc93+dev " -o runc .
> > > -# TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0=
-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linu=
x/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal err=
or in format_file_lineno, at ../../gold/dwarf_reader.cc:2278
> > > -# collect2: error: ld returned 1 exit status
> > > -LDFLAGS_append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-=
gold', ' -fuse-ld=3Dbfd ', '', d)}"
> > > --
> > > 2.30.2
> > >
> > >
> > >=20
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
