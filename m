Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.9254.1624634486950025018
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Jun 2021 08:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UZLivnDO;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id i24so13895170edx.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Jun 2021 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rNGXvVQuduEMlnu8xlIvOQ8WS5I7kwGz8N8EUNEGdrE=;
        b=UZLivnDO3LtZCqAYXWj0rjNgLCHaE2JTshiyt9hXMDOB61gQOB7hPAytmEedt/hxdC
         p/NF8KYiRUfWo+nNBrUDVsRlbu9te4Xrmw03StIMv7tisHwCzS1Z0yohaKg1/o+FkD35
         SSbEIIrThgC4RPUHcJkjcDMEKnC5uRKIP8+C+IcvvcUynp7t8UHyw89lSWTNBofC5P/W
         RfZpQosrbnW2HlVGfO4NOy3Sy3gk8L8AftuBJBjlczX5gLxbj0lZDbSxK5ssuUnjjQk8
         Pn5WEZbgywKMn1NV7LJZ5QxXTRxxRgkEI3ZPXAT2HSSS0sm++ZBluW9OHaEuC8ruX+TI
         Hocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rNGXvVQuduEMlnu8xlIvOQ8WS5I7kwGz8N8EUNEGdrE=;
        b=kVY+L5g5ILotUMhMuxnQUtgYgOxj3RW4zRBPUpuSBp2N7DhvF3Zc7K0g1G//vQoADT
         BifF7rY36KhSh8TkV1VtMAEuO8OP5eQrPYKB53g6c4QjoBWzN3rPg6C9NVWwVqyRqF8a
         z1NSB9mDosZ1EQcIw6gWrg9Am2oSr4oHHJWJmZiBL2LuHKSbRFyzA9Zp7CCqLEzek6ho
         y4VzZpyWxYcu8kYkfS631mSS6H8fsrNhHQuhYNxpvPipwFCI/C4lIwliC4O+h4SjvAnb
         09seTf6pTpzGvTX1OeBXZ/k8GQDqHJ20nmwg9zFWYPDyFqM/qYne1Rgm3ROPyPpl4Vva
         T5pQ==
X-Gm-Message-State: AOAM533uQJNynq0mI8Y0snH/gul9JKvJ5MZnDOSajVlKZf+FW6wPv2K8
	01H4vxFN4QQnDXor90/WNJZBAv5sew69GkZ96DA=
X-Google-Smtp-Source: ABdhPJyrThHr0hhS+FVutd8qTBKonlo4C/ED+L18KwTcvP1UDmj36iSbTvwLsuVLJZ+x6zj+i241xsw0seLgsWxTq8g=
X-Received: by 2002:a50:fb01:: with SMTP id d1mr15553551edq.347.1624634485371;
 Fri, 25 Jun 2021 08:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
 <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
 <CA+chaQeZG57ZxMd+wOc4pUfNJLF61ZK8tOkKPmN6Eph9iiDYHg@mail.gmail.com>
 <AM6PR08MB34615D753470426E1679E0A192069@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <168BDC4B6AEEB1F5.20368@lists.yoctoproject.org>
In-Reply-To: <168BDC4B6AEEB1F5.20368@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 25 Jun 2021 11:21:14 -0400
Message-ID: <CADkTA4Mh2p-8XrvQvmKQuZN_SEnG=CyJNSSVgQM4AQD87-+j0g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, Martin Jansa <martin.jansa@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 11:18 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, Jun 25, 2021 at 10:16 AM Diego Sueiro <Diego.Sueiro@arm.com> wro=
te:
> >
> > I was getting the following when passing `--machines mymachine`:
> > ```
> > ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipes-=
containers/podman/podman_git.bb, meta-virtualization/recipes-networking/sli=
rp4netns/slirp4netns_0.4.1.bb DEPENDS on or otherwise requires it)
> >
> > libseccomp was skipped: missing required distro feature 'seccomp' (not=
 in DISTRO_FEATURES)
> > ```
> >
> >
> >
> > In a deeper investigation I found that the way mymachine was setting t=
he DISTRO_FEATURES (with `+=3D`) it was preventing the inclusion of the `DI=
STRO_FEATURES_DEFAULT`
> >
> >
> >
> > But still, since in `meta/recipes-support/libseccomp/libseccomp_2.5.1.=
bb` we have `REQUIRED_DISTRO_FEATURES =3D "seccomp"` don=E2=80=99t we need =
to add this check on the recipes that depends on it?
> > In a quick grep on meta-virt, I suppose that if this is the case, we w=
ill also need to update for cri-o_git.bb and crun_git.bb recipes.
> >
>
> Yes .. exactly :D
>
> >
> >
> > Or we can just remove `REQUIRED_DISTRO_FEATURES =3D "seccomp"` from `m=
eta/recipes-support/libseccomp/libseccomp_2.5.1.bb`?
> >
>
> That is the core of what I was asking. A package that is now in core,
> why is it only enabled by a distro feature ?
>

And for clarity, I realize that the systemd recipe checks for the
systemd distro feature .. so that is similar. But systemd is one of
many init managers, so I can see why it is used.

Bruce

> That is causing the proliferation of checks in meta-virt (and other
> layers as well). With CNCF, seccomp is becoming required for proper
> operation on many different runtimes, so it really isn't optional.
>
> I was hoping for something centralized in the layer, but that of
> course forces seccomp on kvm/lxc/xen and other use cases that still
> (but I bet they will) don't need seccomp.
>
> Alternatively, I was thinking the core distro feature could drop, or
> that a backfill could be used .. but neither of those solve the short
> term issue with a no-seccomp distro.
>
> So I'm coming up empty in my search for something better, and will
> likely just apply the patch and continue to see about those other
> options.
>
> Bruce
>
> >
> >
> > --
> >
> > Diego
> >
> >
> >
> > From: Martin Jansa <martin.jansa@gmail.com>
> > Sent: 25 June 2021 13:49
> > To: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-virtualization@lists.yoc=
toproject.org; nd <nd@arm.com>
> > Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as R=
EQUIRED_DISTRO_FEATURES
> >
> >
> >
> > AB would use the new default DISTRO_FEATURES which already contain sec=
comp.
> >
> >
> >
> > On Fri, Jun 25, 2021 at 2:46 PM Bruce Ashfield <bruce.ashfield@gmail.c=
om> wrote:
> >
> > On Fri, Jun 25, 2021 at 4:11 AM Diego Sueiro <Diego.Sueiro@arm.com> wr=
ote:
> > >
> > > >-----Original Message-----
> > > >From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >Sent: 25 June 2021 03:49
> > > >To: Martin Jansa <martin.jansa@gmail.com>
> > > >Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-
> > > >virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> > > >Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp a=
s
> > > >REQUIRED_DISTRO_FEATURES
> > > >
> > > >On Thu, Jun 24, 2021 at 5:01 PM Martin Jansa <martin.jansa@gmail.co=
m>
> > > >wrote:
> > > >>
> > > >> This change is correct, libseccomp still requires seccomp in
> > > >DISTRO_FEATURES, so anything depending on it should have the same
> > > >restriction.
> > > >>
> > > >
> > > >Right, I understand how/why it works like this .. but it is super c=
lunky when we
> > > >can't just depend on something that is now in core, without needing=
 to
> > > >sprinkle distro checks everywhere.
> > > >
> > > >As the list of recipes gets larger with that check, it really isn't=
 an optional distro
> > > >feature for using meta virt at all, and it would be nice if we coul=
d just do the
> > > >check once and be done with it.
> > >
> > > Just a side note that these patches fix issues with yocto-check-laye=
r.
> >
> > I've disagreed with check-layer before (and we've changed how it works=
)
> >
> > That being said, the layer is checked on the AB, and Richard hasn't
> > reported any issues. So clearly there's something wrong with the AB
> > test or with something else.
> >
> >
> >
> > Bruce
> >
> > >
> > > Diego
> > >
> > > >
> > > >Bruce
> > > >
> > > >> seccomp is now in default DISTRO_FEATURES, but not through BACKFI=
LL
> > > >feature, so many existing DISTROs didn't get it automatically added=
 and
> > > >requiring it is the right way to automatically skip such recipes.
> > > >>
> > > >> On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield
> > > ><bruce.ashfield@gmail.com> wrote:
> > > >>>
> > > >>> What branch are you working with ?
> > > >>>
> > > >>> Now that seccomp is in core, we no longer have those restriction=
s, so
> > > >>> I assume this is on an older branch ?
> > > >>>
> > > >>> Bruce
> > > >>>
> > > >>> On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm.c=
om>
> > > >wrote:
> > > >>> >
> > > >>> > The libseccomp package is only available if seccomp is in
> > > >DISTRO_FEATURES.
> > > >>> >
> > > >>> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > >>> > ---
> > > >>> >  recipes-containers/podman/podman_git.bb | 3 +++
> > > >>> >  1 file changed, 3 insertions(+)
> > > >>> >
> > > >>> > diff --git a/recipes-containers/podman/podman_git.bb
> > > >>> > b/recipes-containers/podman/podman_git.bb
> > > >>> > index 9dcb21c..351f38b 100644
> > > >>> > --- a/recipes-containers/podman/podman_git.bb
> > > >>> > +++ b/recipes-containers/podman/podman_git.bb
> > > >>> > @@ -6,6 +6,9 @@ DESCRIPTION =3D "Podman is a daemonless contai=
ner
> > > >engine for developing, \
> > > >>> >      `alias docker=3Dpodman`. \
> > > >>> >      "
> > > >>> >
> > > >>> > +inherit features_check
> > > >>> > +REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
> > > >>> > +
> > > >>> >  DEPENDS =3D " \
> > > >>> >      go-metalinter-native \
> > > >>> >      go-md2man-native \
> > > >>> > --
> > > >>> > 2.17.1
> > > >>> >
> > > >>> >
> > > >>> >
> > > >>> >
> > > >>>
> > > >>>
> > > >>> --
> > > >>> - Thou shalt not follow the NULL pointer, for chaos and madness =
await
> > > >>> thee at its end
> > > >>> - "Use the force Harry" - Gandalf, Star Trek II
> > > >>>
> > > >>>
> > > >>>
> > > >
> > > >
> > > >--
> > > >- Thou shalt not follow the NULL pointer, for chaos and madness awa=
it thee at
> > > >its end
> > > >- "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
