Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.1239.1625023686030834806
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 20:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HaEUVRzt;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id s15so1075553edt.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Jun 2021 20:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+1LJFeaaO2jewedC12K9N/ZWsTnT4id0IvCAz0LFPCw=;
        b=HaEUVRztwPvgGlKuV4Vbz+3v9HEkOe6TMg/jMAwrdPKuXrtiKslF/t57hv46NeeQdI
         UZVQ9PJOL2A8e3KLMSKMxULy15MK2rXrw0EsauG8urGkDooEVRrcQ7G9geQV/hJyW2R0
         Ia4UFDpYG5k59lRl9Wz4ozAbkU6VYiCV4nt3SRLL5FQHo4mtsznt5ioWDznSfxEuyzHm
         1K/LuoZKj7suJTq5YerOG0+idyT+m/ZIKV8uHwcaIDyYk6klicToMv4Ct5Dcq8Hcx6br
         ymERFYGYL/gQjFO2zf0aFKiA8Xa1N/zKy/yYt7JJ4v7/U3M3bq7QdNGyMG0BB+I/2x3I
         szcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+1LJFeaaO2jewedC12K9N/ZWsTnT4id0IvCAz0LFPCw=;
        b=nEykHdcNIa20CgfjOFkRYSmglr/H9TJdI5jrubt1zCZ3NkHRZDg7XlMVnFfB2xdh1h
         9wLVautS5bvBQfUe1nR9XErTFkcahrtVY5WqJje+Bf1chKfUFsWYQ9dJM72A4gN8i7N7
         EpQ+AaI4Jmvzw9CwSKMOQpxoArBn9RBVeSUxusegC/AmwFAB7LiYyJ8KEFLy1rd9r6KR
         O/MSLaIz13yi76AqsfzJ3q5sGJSHjxlwRJkTJklltPSFWQnj7tr3rCI65aJ7PHICuM8o
         Ih5wSN6tY0eTUQNt3xHo5DZ0MpCw7mc5fVlbTGKxrB6rte7Xj+6PVpWV76A/IYAp00jG
         n5ig==
X-Gm-Message-State: AOAM533n+NhJSHpXwIw1bk2NpgFaHMlu4HKr3C5BesoHFnStjHkms3ER
	N168MEgf/mBv8iEx07NPswLlWcZQuLxFa8gbH6M=
X-Google-Smtp-Source: ABdhPJyujwyxJshDhpEdFj5Nn740C2v6RUH7F6rY2aWr23F0CYJkXvEH605Fe4+pBvN9vBW7r+vfa4tItUh2fpve7Xs=
X-Received: by 2002:a50:fb01:: with SMTP id d1mr44442446edq.347.1625023684417;
 Tue, 29 Jun 2021 20:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
 <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
 <CA+chaQeZG57ZxMd+wOc4pUfNJLF61ZK8tOkKPmN6Eph9iiDYHg@mail.gmail.com>
 <AM6PR08MB34615D753470426E1679E0A192069@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <168BDC4B6AEEB1F5.20368@lists.yoctoproject.org> <168BDC756BE2FF71.10690@lists.yoctoproject.org>
In-Reply-To: <168BDC756BE2FF71.10690@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 29 Jun 2021 23:27:53 -0400
Message-ID: <CADkTA4PNTH0nUb8XH-UcD2+vfA6zYbRVu9ETy9M7HhrC9QMiTw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, Martin Jansa <martin.jansa@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 11:21 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, Jun 25, 2021 at 11:18 AM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Fri, Jun 25, 2021 at 10:16 AM Diego Sueiro <Diego.Sueiro@arm.com> w=
rote:
> > >
> > > I was getting the following when passing `--machines mymachine`:
> > > ```
> > > ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipe=
s-containers/podman/podman_git.bb, meta-virtualization/recipes-networking/s=
lirp4netns/slirp4netns_0.4.1.bb DEPENDS on or otherwise requires it)
> > >
> > > libseccomp was skipped: missing required distro feature 'seccomp' (n=
ot in DISTRO_FEATURES)
> > > ```
> > >
> > >
> > >
> > > In a deeper investigation I found that the way mymachine was setting=
 the DISTRO_FEATURES (with `+=3D`) it was preventing the inclusion of the `=
DISTRO_FEATURES_DEFAULT`
> > >
> > >
> > >
> > > But still, since in `meta/recipes-support/libseccomp/libseccomp_2.5.=
1.bb` we have `REQUIRED_DISTRO_FEATURES =3D "seccomp"` don=E2=80=99t we nee=
d to add this check on the recipes that depends on it?
> > > In a quick grep on meta-virt, I suppose that if this is the case, we=
 will also need to update for cri-o_git.bb and crun_git.bb recipes.
> > >
> >
> > Yes .. exactly :D
> >
> > >
> > >
> > > Or we can just remove `REQUIRED_DISTRO_FEATURES =3D "seccomp"` from =
`meta/recipes-support/libseccomp/libseccomp_2.5.1.bb`?
> > >
> >
> > That is the core of what I was asking. A package that is now in core,
> > why is it only enabled by a distro feature ?
> >
>
> And for clarity, I realize that the systemd recipe checks for the
> systemd distro feature .. so that is similar. But systemd is one of
> many init managers, so I can see why it is used.

I still don't have a better solution to this, and while I see about
getting seccomp behaviour changed in core, I can get this into the
tree.

I've added the extra seccomp dependent recipes and expect to merge
this on Wednesday.

Bruce

>
> Bruce
>
> > That is causing the proliferation of checks in meta-virt (and other
> > layers as well). With CNCF, seccomp is becoming required for proper
> > operation on many different runtimes, so it really isn't optional.
> >
> > I was hoping for something centralized in the layer, but that of
> > course forces seccomp on kvm/lxc/xen and other use cases that still
> > (but I bet they will) don't need seccomp.
> >
> > Alternatively, I was thinking the core distro feature could drop, or
> > that a backfill could be used .. but neither of those solve the short
> > term issue with a no-seccomp distro.
> >
> > So I'm coming up empty in my search for something better, and will
> > likely just apply the patch and continue to see about those other
> > options.
> >
> > Bruce
> >
> > >
> > >
> > > --
> > >
> > > Diego
> > >
> > >
> > >
> > > From: Martin Jansa <martin.jansa@gmail.com>
> > > Sent: 25 June 2021 13:49
> > > To: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-virtualization@lists.y=
octoproject.org; nd <nd@arm.com>
> > > Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as=
 REQUIRED_DISTRO_FEATURES
> > >
> > >
> > >
> > > AB would use the new default DISTRO_FEATURES which already contain s=
eccomp.
> > >
> > >
> > >
> > > On Fri, Jun 25, 2021 at 2:46 PM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
> > >
> > > On Fri, Jun 25, 2021 at 4:11 AM Diego Sueiro <Diego.Sueiro@arm.com> =
wrote:
> > > >
> > > > >-----Original Message-----
> > > > >From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >Sent: 25 June 2021 03:49
> > > > >To: Martin Jansa <martin.jansa@gmail.com>
> > > > >Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-
> > > > >virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> > > > >Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp=
 as
> > > > >REQUIRED_DISTRO_FEATURES
> > > > >
> > > > >On Thu, Jun 24, 2021 at 5:01 PM Martin Jansa <martin.jansa@gmail.=
com>
> > > > >wrote:
> > > > >>
> > > > >> This change is correct, libseccomp still requires seccomp in
> > > > >DISTRO_FEATURES, so anything depending on it should have the same
> > > > >restriction.
> > > > >>
> > > > >
> > > > >Right, I understand how/why it works like this .. but it is super=
 clunky when we
> > > > >can't just depend on something that is now in core, without needi=
ng to
> > > > >sprinkle distro checks everywhere.
> > > > >
> > > > >As the list of recipes gets larger with that check, it really isn=
't an optional distro
> > > > >feature for using meta virt at all, and it would be nice if we co=
uld just do the
> > > > >check once and be done with it.
> > > >
> > > > Just a side note that these patches fix issues with yocto-check-la=
yer.
> > >
> > > I've disagreed with check-layer before (and we've changed how it wor=
ks)
> > >
> > > That being said, the layer is checked on the AB, and Richard hasn't
> > > reported any issues. So clearly there's something wrong with the AB
> > > test or with something else.
> > >
> > >
> > >
> > > Bruce
> > >
> > > >
> > > > Diego
> > > >
> > > > >
> > > > >Bruce
> > > > >
> > > > >> seccomp is now in default DISTRO_FEATURES, but not through BACK=
FILL
> > > > >feature, so many existing DISTROs didn't get it automatically add=
ed and
> > > > >requiring it is the right way to automatically skip such recipes.
> > > > >>
> > > > >> On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield
> > > > ><bruce.ashfield@gmail.com> wrote:
> > > > >>>
> > > > >>> What branch are you working with ?
> > > > >>>
> > > > >>> Now that seccomp is in core, we no longer have those restricti=
ons, so
> > > > >>> I assume this is on an older branch ?
> > > > >>>
> > > > >>> Bruce
> > > > >>>
> > > > >>> On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm=
.com>
> > > > >wrote:
> > > > >>> >
> > > > >>> > The libseccomp package is only available if seccomp is in
> > > > >DISTRO_FEATURES.
> > > > >>> >
> > > > >>> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > > > >>> > ---
> > > > >>> >  recipes-containers/podman/podman_git.bb | 3 +++
> > > > >>> >  1 file changed, 3 insertions(+)
> > > > >>> >
> > > > >>> > diff --git a/recipes-containers/podman/podman_git.bb
> > > > >>> > b/recipes-containers/podman/podman_git.bb
> > > > >>> > index 9dcb21c..351f38b 100644
> > > > >>> > --- a/recipes-containers/podman/podman_git.bb
> > > > >>> > +++ b/recipes-containers/podman/podman_git.bb
> > > > >>> > @@ -6,6 +6,9 @@ DESCRIPTION =3D "Podman is a daemonless cont=
ainer
> > > > >engine for developing, \
> > > > >>> >      `alias docker=3Dpodman`. \
> > > > >>> >      "
> > > > >>> >
> > > > >>> > +inherit features_check
> > > > >>> > +REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
> > > > >>> > +
> > > > >>> >  DEPENDS =3D " \
> > > > >>> >      go-metalinter-native \
> > > > >>> >      go-md2man-native \
> > > > >>> > --
> > > > >>> > 2.17.1
> > > > >>> >
> > > > >>> >
> > > > >>> >
> > > > >>> >
> > > > >>>
> > > > >>>
> > > > >>> --
> > > > >>> - Thou shalt not follow the NULL pointer, for chaos and madnes=
s await
> > > > >>> thee at its end
> > > > >>> - "Use the force Harry" - Gandalf, Star Trek II
> > > > >>>
> > > > >>>
> > > > >>>
> > > > >
> > > > >
> > > > >--
> > > > >- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at
> > > > >its end
> > > > >- "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
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
