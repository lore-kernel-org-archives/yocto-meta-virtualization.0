Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.9212.1624634306557475046
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 25 Jun 2021 08:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q26wmRd1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id o11so2517894ejd.4
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 25 Jun 2021 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gWMsRmUboMPwcURYAflMVdRd6NEplESMwOkvjDgFj4Q=;
        b=q26wmRd1pp7UIKsNJJpsVn6BvqsvIhVAPXo1vhsdQ0WiqNJ7CjJCE12hMgiOZgMPDs
         iYwftxuskFuK3MaAOh6USGJrfdsprsuAUCW3ED1FfsanzfLrnUHzMob6TO8N9f1wPbVw
         GHWv1RX4odLC/y4m1PrHkFdkx9d/AD29l4mqB4DZKtciO4ZjQbuE7oQvpi3RC1RHSa6f
         gyz4UBY9ayfBvGQaPBX9jOqfNoU656eeOdFqbu3C0+BcKzT4IVco5+Fssbr3kLknSkbu
         gfLV4qdg1uLVfzcCge01frug2hectm7BVu0DQj6/TQeNtKIP66hbIT/z4CC2b8AWe9M/
         aLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gWMsRmUboMPwcURYAflMVdRd6NEplESMwOkvjDgFj4Q=;
        b=PZ7IOJOuh6NdO9TniExm6GFZHst23n0H4i7gTXnugkcOZGepFwuNatqB9frnRJUlDc
         1TVy48pdyGtsdXNDr/7hRZOtvJRcDSm+gsrg1hg3RtYlIqbguM4JaQF0uqJJ5DKifO+r
         HzVFXPDMnpzQ67KIcMWx0+Ge6T/VcHeAJOccPqFe/Z7GKtHr0ELDpiVjzYYXfJOBGhNB
         9Hx88ozlt4TJ0uMElzalV0tEVOl9AilMDa4218g8tK48gVKu/IhSuE8HeA5tl3Bj4tOl
         tWslufRAO2comXQl/qp4H2+XOG5IjHvJZcQO+d8qJU2lzm6Ht2dx34s/O9+qw9YAhJxN
         s0XQ==
X-Gm-Message-State: AOAM532NjdOLjUeVnhFcdPcwauFMKbEdLL6WsUgm5A0P6hY6rtEnh+zi
	MBbjHoDsZ3ru9Q6dWAUhAXfTy4BAMAFvkwEybSk=
X-Google-Smtp-Source: ABdhPJyYDxsA3X6XHXFCHCdlgXoE/k7hcFOpV2gnQeSHw2gadUpvFqKoZzQ64LKhqAFSAAFN40n76FOH8aJq0LqU3mU=
X-Received: by 2002:a17:906:ca17:: with SMTP id jt23mr11667512ejb.334.1624634305031;
 Fri, 25 Jun 2021 08:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <d9bb229282006df4f0bf945346312e1b53145a1e.1624561041.git.diego.sueiro@arm.com>
 <CADkTA4Or9D4H3imLR9Pqgu2CB4VGPJO8Ng8qgReB0ridu=F_yQ@mail.gmail.com>
 <CA+chaQfm5Q4dX8xE42N2GfPKZwWwZa3pR4ttH=jwX34PXkLz1Q@mail.gmail.com>
 <CADkTA4P7gGBGTBdVLTFdSGiX5DDoHZc7ymmrcre+ifPA=vG7fA@mail.gmail.com>
 <AM6PR08MB3461FE3409922F52F7A6ED2592069@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4O5XShSxFr-5EASoKrTdqXY1z2XsJ5CF376cOoR2Ap+Jw@mail.gmail.com>
 <CA+chaQeZG57ZxMd+wOc4pUfNJLF61ZK8tOkKPmN6Eph9iiDYHg@mail.gmail.com> <AM6PR08MB34615D753470426E1679E0A192069@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB34615D753470426E1679E0A192069@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 25 Jun 2021 11:18:14 -0400
Message-ID: <CADkTA4OpJrdnBQ5P-G=TpAHAtF0C4aDBZg32RHYy3F6zqM_7wg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQUIRED_DISTRO_FEATURES
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 10:16 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
> I was getting the following when passing `--machines mymachine`:
> ```
> ERROR: Nothing PROVIDES 'libseccomp' (but meta-virtualization/recipes-co=
ntainers/podman/podman_git.bb, meta-virtualization/recipes-networking/slirp=
4netns/slirp4netns_0.4.1.bb DEPENDS on or otherwise requires it)
>
> libseccomp was skipped: missing required distro feature 'seccomp' (not i=
n DISTRO_FEATURES)
> ```
>
>
>
> In a deeper investigation I found that the way mymachine was setting the=
 DISTRO_FEATURES (with `+=3D`) it was preventing the inclusion of the `DIST=
RO_FEATURES_DEFAULT`
>
>
>
> But still, since in `meta/recipes-support/libseccomp/libseccomp_2.5.1.bb=
` we have `REQUIRED_DISTRO_FEATURES =3D "seccomp"` don=E2=80=99t we need to=
 add this check on the recipes that depends on it?
> In a quick grep on meta-virt, I suppose that if this is the case, we wil=
l also need to update for cri-o_git.bb and crun_git.bb recipes.
>

Yes .. exactly :D

>
>
> Or we can just remove `REQUIRED_DISTRO_FEATURES =3D "seccomp"` from `met=
a/recipes-support/libseccomp/libseccomp_2.5.1.bb`?
>

That is the core of what I was asking. A package that is now in core,
why is it only enabled by a distro feature ?

That is causing the proliferation of checks in meta-virt (and other
layers as well). With CNCF, seccomp is becoming required for proper
operation on many different runtimes, so it really isn't optional.

I was hoping for something centralized in the layer, but that of
course forces seccomp on kvm/lxc/xen and other use cases that still
(but I bet they will) don't need seccomp.

Alternatively, I was thinking the core distro feature could drop, or
that a backfill could be used .. but neither of those solve the short
term issue with a no-seccomp distro.

So I'm coming up empty in my search for something better, and will
likely just apply the patch and continue to see about those other
options.

Bruce

>
>
> --
>
> Diego
>
>
>
> From: Martin Jansa <martin.jansa@gmail.com>
> Sent: 25 June 2021 13:49
> To: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-virtualization@lists.yocto=
project.org; nd <nd@arm.com>
> Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as REQ=
UIRED_DISTRO_FEATURES
>
>
>
> AB would use the new default DISTRO_FEATURES which already contain secco=
mp.
>
>
>
> On Fri, Jun 25, 2021 at 2:46 PM Bruce Ashfield <bruce.ashfield@gmail.com=
> wrote:
>
> On Fri, Jun 25, 2021 at 4:11 AM Diego Sueiro <Diego.Sueiro@arm.com> wrot=
e:
> >
> > >-----Original Message-----
> > >From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >Sent: 25 June 2021 03:49
> > >To: Martin Jansa <martin.jansa@gmail.com>
> > >Cc: Diego Sueiro <Diego.Sueiro@arm.com>; meta-
> > >virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> > >Subject: Re: [meta-virtualization][PATCH 1/3] podman: Add seccomp as
> > >REQUIRED_DISTRO_FEATURES
> > >
> > >On Thu, Jun 24, 2021 at 5:01 PM Martin Jansa <martin.jansa@gmail.com>
> > >wrote:
> > >>
> > >> This change is correct, libseccomp still requires seccomp in
> > >DISTRO_FEATURES, so anything depending on it should have the same
> > >restriction.
> > >>
> > >
> > >Right, I understand how/why it works like this .. but it is super clu=
nky when we
> > >can't just depend on something that is now in core, without needing t=
o
> > >sprinkle distro checks everywhere.
> > >
> > >As the list of recipes gets larger with that check, it really isn't a=
n optional distro
> > >feature for using meta virt at all, and it would be nice if we could =
just do the
> > >check once and be done with it.
> >
> > Just a side note that these patches fix issues with yocto-check-layer.
>
> I've disagreed with check-layer before (and we've changed how it works)
>
> That being said, the layer is checked on the AB, and Richard hasn't
> reported any issues. So clearly there's something wrong with the AB
> test or with something else.
>
>
>
> Bruce
>
> >
> > Diego
> >
> > >
> > >Bruce
> > >
> > >> seccomp is now in default DISTRO_FEATURES, but not through BACKFILL
> > >feature, so many existing DISTROs didn't get it automatically added a=
nd
> > >requiring it is the right way to automatically skip such recipes.
> > >>
> > >> On Thu, Jun 24, 2021 at 12:45 PM Bruce Ashfield
> > ><bruce.ashfield@gmail.com> wrote:
> > >>>
> > >>> What branch are you working with ?
> > >>>
> > >>> Now that seccomp is in core, we no longer have those restrictions,=
 so
> > >>> I assume this is on an older branch ?
> > >>>
> > >>> Bruce
> > >>>
> > >>> On Thu, Jun 24, 2021 at 3:00 PM Diego Sueiro <diego.sueiro@arm.com=
>
> > >wrote:
> > >>> >
> > >>> > The libseccomp package is only available if seccomp is in
> > >DISTRO_FEATURES.
> > >>> >
> > >>> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > >>> > ---
> > >>> >  recipes-containers/podman/podman_git.bb | 3 +++
> > >>> >  1 file changed, 3 insertions(+)
> > >>> >
> > >>> > diff --git a/recipes-containers/podman/podman_git.bb
> > >>> > b/recipes-containers/podman/podman_git.bb
> > >>> > index 9dcb21c..351f38b 100644
> > >>> > --- a/recipes-containers/podman/podman_git.bb
> > >>> > +++ b/recipes-containers/podman/podman_git.bb
> > >>> > @@ -6,6 +6,9 @@ DESCRIPTION =3D "Podman is a daemonless containe=
r
> > >engine for developing, \
> > >>> >      `alias docker=3Dpodman`. \
> > >>> >      "
> > >>> >
> > >>> > +inherit features_check
> > >>> > +REQUIRED_DISTRO_FEATURES ?=3D "seccomp"
> > >>> > +
> > >>> >  DEPENDS =3D " \
> > >>> >      go-metalinter-native \
> > >>> >      go-md2man-native \
> > >>> > --
> > >>> > 2.17.1
> > >>> >
> > >>> >
> > >>> >
> > >>> >
> > >>>
> > >>>
> > >>> --
> > >>> - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
> > >>> thee at its end
> > >>> - "Use the force Harry" - Gandalf, Star Trek II
> > >>>
> > >>>=20
> > >>>
> > >
> > >
> > >--
> > >- Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at
> > >its end
> > >- "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
