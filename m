Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.6550.1621393801898638891
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 May 2021 20:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h3EZxN+z;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id z12so16285122ejw.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 18 May 2021 20:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ofUbmWPK2GezaDsgHWjK+Tg9S8DExyN8+jbmgFajcM4=;
        b=h3EZxN+z1SgeEVv9nFqVAzRC26zQVob8VqVePrcF9jdDUvTSDzuomrGIUb7aw7B3Ms
         zn0PxjKYLfVEGbr6kdMDrPQZxPGTZuJWbjJoGT+Ew+t5BHPqAQCKypireCBadvrM1gbG
         swF0X9tv2BghXy52QjWWSXDkN1iWadFRT5hx569XHBdb+cFELAwz42d0NTK3oaEX3nxi
         g7q035sST7UdmTA61tuZB+APWH/yhBgb1+A9NNgzVQnhEQXlGDMVGstULAoVnF8EKlUA
         fLo/6e1jx+Eyh1aK7icVt8L6c+Yd5eGGjBmRV7AMIgWrHqinApJgvmtZkzIXzRpqFeCO
         +RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ofUbmWPK2GezaDsgHWjK+Tg9S8DExyN8+jbmgFajcM4=;
        b=jX83ZKf/9vNNfnFML2KM6hs9dHJvtoeRgsr38jjhgLl1aLxzPRcs0MHxe3diPLt637
         EySCVAQS2+mqFUPgGlxTBYTtmocazmlLFyHF+NpRYYDIne8+NNCyG52FKROPpmqM1giD
         syG7MpKHE+Tyk0PcgxsVevXuakePkhlnKLlabIrfuXkeUHOOh4tnD022nR5snvAkQlJP
         rY85t4QQ9+unsiUjPtvVyT8oVAamdOm8misKkENIXq/ZNy+iXhLvsZNik6IIkUFhDvUf
         Sa3HwrigjQ2s+ntWtSJBBiNAN2oTRdhikWPwUUu321HfAb3Ly3vUnNu+nD0qGiEiGMNK
         k6bg==
X-Gm-Message-State: AOAM531xC9HtTbje1Hie/eb5XsdgtTy8uRluIa1MEv3fC7dsMd2etdv6
	zLA011j9PsOZB4kVy5HtbDVoenODePtwiyjFUeY=
X-Google-Smtp-Source: ABdhPJwI7iTIaC5b476hSv96z0H2xodk2CL8gBXC0AuIJ9SzhzRzlIhp8gNyOyWhOf8ZwSvt3VropCkFfwGLraCGfVU=
X-Received: by 2002:a17:906:3c1a:: with SMTP id h26mr9593433ejg.22.1621393800164;
 Tue, 18 May 2021 20:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210518045546.57617-1-Qi.Chen@windriver.com> <CADkTA4MR2hnoB73ohuDrwK7_aSy0ak8mkftb-iev-LyXh6NvXQ@mail.gmail.com>
 <f99fa35d-0f7d-6340-8e62-863588b6a4dc@windriver.com> <CADkTA4M2cxRadTv_C49PvcNLQg-w-oJwfEThVi0oLhUjf-vAog@mail.gmail.com>
 <fac74f8a-1d58-1bfb-9202-45dc4f23c93c@windriver.com>
In-Reply-To: <fac74f8a-1d58-1bfb-9202-45dc4f23c93c@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 18 May 2021 23:09:49 -0400
Message-ID: <CADkTA4PCfaOUW5BTJ_4yqA7xmy+gxbU0+Uut60rkCD3okJ_nxA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nativesdk-sloci-image: add recipe
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 11:02 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 05/19/2021 10:38 AM, Bruce Ashfield wrote:
> > On Tue, May 18, 2021 at 9:23 PM ChenQi <Qi.Chen@windriver.com> wrote:
> >> On 05/18/2021 08:03 PM, Bruce Ashfield wrote:
> >>> On Tue, May 18, 2021 at 12:55 AM Chen Qi <Qi.Chen@windriver.com> wro=
te:
> >>>> Add nativesdk-sloci-image recipe which is basically from the
> >>>> sloci-image-native recipe.
> >>>>
> >>> Copying the recipe is a bad idea.
> >>>
> >>> What's wrong with just adding the inherit nativesdk in the existing
> >>> sloci recipe ?
> >>>
> >>> Bruce
> >> Hi Bruce,
> >>
> >> This is because a recipe cannot inherit native and nativesdk at the s=
ame
> >> time.
> >> Hongxu once sent a patch to rename the native recipe to
> >> https://urldefense.com/v3/__http://sloci-image_git.bb__;!!AjveYdw8EvQ=
!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D21g_xdpSg$  and u=
se BBCLASSEXTEND =3D "native nativesdk", but that
> >> patch was rejected.
> > It wasn't rejected .. I gave feedback that it shouldn't drop the -nati=
ve from
> > the name, but that it could be both nativesdk and native.
> >
> > At the time, the recipe needed to be clear that it wasn't for on-targe=
t use,
> > and was build side only. Having -native in the name was the clarity I =
was
> > looking for (as was the inherit native).
> >
> > Last I checked, the recipe name could still be -native (it's just a
> > name after all),
> > but have the BBCLASSEXTEND instead of the include line.
> >
> > And a quick test with the following change, allowed me to build
> > sloci-image-native
> > and nativesdk-sloci-image-native:
> >
> > diff --git a/recipes-containers/sloci-image/https://urldefense.com/v3/=
__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jv=
B1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> > b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sl=
oci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zm=
v-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> > index a68c6d9..fc3c329 100644
> > --- a/recipes-containers/sloci-image/https://urldefense.com/v3/__http:=
//sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWM=
X8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> > +++ b/recipes-containers/sloci-image/https://urldefense.com/v3/__http:=
//sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWM=
X8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> > @@ -11,8 +11,6 @@ DEPENDS =3D ""
> >   SRCREV =3D "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
> >   PV =3D "v0.1.0+git${SRCPV}"
> >
> > -inherit native
> > -
> >   S =3D "${WORKDIR}/git"
> >
> >   do_compile() {
> > @@ -25,3 +23,5 @@ do_install() {
> >   }
> >
> >   CLEANBROKEN =3D "1"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > I'm actually just finishing up some work on OCI image backend switchin=
g and
> > have some reworking of the sloci-image recipe ... and there are some
> > use cases where it can be used on-target (whereas that wasn't the case=
 before).
> >
> > So the rename to _git is possible, as are the BBCLASSEXTEND changes to
> > the newly named https://urldefense.com/v3/__http://sloci-image_git.bb_=
_;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D21=
g_xdpSg$
> >
> > Luckily we still have sloci-image-native as an available build target,
> > so nothing
> > breaks with that rename.
> >
> > I can take care of that change right now, if that sounds like it meets=
 what you
> > are looking for (that change being the BBCLASSEXTEND in a renamed sloc=
i
> > recipe).
> >
> > Bruce
>
> Yes. Definitely! What I need is native and nativesdk support of sloci-im=
age.
> That would be great! Many thanks!

The change is pushed. Let me know if it causes any issues.

Bruce

>
> Best Regards,
> Chen Qi
>
> >> So I figured that adding a nativesdk-sloci-image recipe is only
> >> remaining way to enable nativesdk support.
> >>
> >> Maybe I should extract the common part to sloci-image.inc, and the
> >> native/nativesdk recipe only contains two lines like below:
> >> require sloci-image.inc
> >> inherit native (or inherit nativesdk)
> >>
> >> What do you think?
> >>
> >> Best Regards,
> >> Chen Qi
> >>
> >>
> >>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>>> ---
> >>>>    .../sloci-image/https://urldefense.com/v3/__http://nativesdk-slo=
ci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLx=
OY5eE1caxW8R3D22nEkW98w$   | 27 +++++++++++++++++++
> >>>>    1 file changed, 27 insertions(+)
> >>>>    create mode 100644 recipes-containers/sloci-image/https://urldef=
ense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nz=
zta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
> >>>>
> >>>> diff --git a/recipes-containers/sloci-image/https://urldefense.com/=
v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO0=
3JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$  b/recipes-containers/slo=
ci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;=
!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nE=
kW98w$
> >>>> new file mode 100644
> >>>> index 0000000..3c2b539
> >>>> --- /dev/null
> >>>> +++ b/recipes-containers/sloci-image/https://urldefense.com/v3/__ht=
tp://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB=
1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
> >>>> @@ -0,0 +1,27 @@
> >>>> +SUMMARY =3D "A simple CLI tool for packing rootfs into a single-la=
yer OCI image"
> >>>> +LICENSE =3D "MIT"
> >>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D948cd8e59069fad992b0469=
af9ad7966"
> >>>> +SRC_URI =3D "git://github.com/jirutka/sloci-image.git \
> >>>> +           file://0001-sloci-image-fix-variant-quoting.patch \
> >>>> +          "
> >>>> +
> >>>> +
> >>>> +DEPENDS =3D ""
> >>>> +
> >>>> +SRCREV =3D "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
> >>>> +PV =3D "v0.1.0+git${SRCPV}"
> >>>> +
> >>>> +inherit nativesdk
> >>>> +
> >>>> +S =3D "${WORKDIR}/git"
> >>>> +
> >>>> +do_compile() {
> >>>> +       :
> >>>> +}
> >>>> +
> >>>> +do_install() {
> >>>> +       cd ${S}
> >>>> +        make PREFIX=3D"${exec_prefix}" DESTDIR=3D${D} install
> >>>> +}
> >>>> +
> >>>> +CLEANBROKEN =3D "1"
> >>>> --
> >>>> 2.30.2
> >>>>
> >>>>
> >>>>=20
> >>>>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
