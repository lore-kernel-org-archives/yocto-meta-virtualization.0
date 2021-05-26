Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.2275.1621997514005605212
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 May 2021 19:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=USx6lJgp;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id t3so38643463edc.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 May 2021 19:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PjmF3e7+IyaaVHNAY8k1OXW6uuI84/a5cLaRIoYIpjs=;
        b=USx6lJgpZWsdpNhkk0LvZ7AJ5b6/TVT+KVm8QAplMWjvjbII+ZjLLSvZ+yUoMh/575
         x3l0AeUJ654wbLCWxGl2wZkuz5zovUMrXPY4yY4aZrOWX4nRO7dRuO+kGK45nTMC0jiv
         N773QYG9oh6+w7sFd3zRgTIQzMWmftEffcsheoNVLV8keiGJ+EawlCHxHUV3O+dHRzET
         iRTyFDiGLpXOGpK/J2cD/GRJ8nAS+h9F683dcUDlQK1zXrwgm3UNCwgoNBJ3hhy2JbP5
         5+MWuAhCFoWetcjOO7niA8VsJ9jfn2mHgkjuNJIhn+kVDCQFQ3PJw2Tq/sJmMdp+9JPE
         vjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PjmF3e7+IyaaVHNAY8k1OXW6uuI84/a5cLaRIoYIpjs=;
        b=MIxhUXsoRUh44tHpVAt7BdSd+cxacwl3omdov/MbLaSjlioKiTOxOF1xZEW/qbf2VS
         5JGNC+Rp0lifl/yNOHbKuEHZ4S2BvaAY8Am0CX+fYIOjAKTqA1hf++SI3t0jJZglIO81
         dBn9hG3HfX5+EEdmIsfisDPArZ0lVxadubuDXcN2tCZU1OiNZqvxF+12BnXkt0af0dDY
         CX+X6nWX87PHPXSCpu9s+kGl3I8fOL3yNxDYrOO05nX93ki6x0cOx/59eOFmhbvApIb2
         /hhV98fCpAB5c9VyGEJEt7iiy+sBZjd5hcA7PogH0CYsFkrMG5ya7KQzh8buejY1XaFC
         izRA==
X-Gm-Message-State: AOAM531cG8zPjMm8j5KJQqy4ygYg5K9sBoElkrrEI/obZVZSjhRiJhQu
	ayTlEkSUFKL2XuRCmMkjOuTwKJzC5TPNvOBCxb0=
X-Google-Smtp-Source: ABdhPJwXi9Z23l+J3v3gbfTu4BV46ejTb7iAnTWrYCLk6031aAfJBtLajxF5Txs/03ZiiTnelOvdlBpLA82NXlH/qdY=
X-Received: by 2002:a50:9346:: with SMTP id n6mr35147701eda.365.1621997512219;
 Tue, 25 May 2021 19:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210518045546.57617-1-Qi.Chen@windriver.com> <CADkTA4MR2hnoB73ohuDrwK7_aSy0ak8mkftb-iev-LyXh6NvXQ@mail.gmail.com>
 <f99fa35d-0f7d-6340-8e62-863588b6a4dc@windriver.com> <CADkTA4M2cxRadTv_C49PvcNLQg-w-oJwfEThVi0oLhUjf-vAog@mail.gmail.com>
 <fac74f8a-1d58-1bfb-9202-45dc4f23c93c@windriver.com> <CADkTA4PCfaOUW5BTJ_4yqA7xmy+gxbU0+Uut60rkCD3okJ_nxA@mail.gmail.com>
 <3f3801ea-e2a0-f730-5cfa-f3198c5d1779@windriver.com>
In-Reply-To: <3f3801ea-e2a0-f730-5cfa-f3198c5d1779@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 25 May 2021 22:51:41 -0400
Message-ID: <CADkTA4ORnSYcvoc0KyTLe8bs=+EgwySfke+jyL8pLPbdjdNLYw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nativesdk-sloci-image: add recipe
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 10:12 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> Hi Bruce,
>
> Sorry for the late reply.
> I've tested nativesdk and native. It's working well.
>

Thanks for the follow up!

Bruce

> Best Regards,
> Chen Qi
>
> On 05/19/2021 11:09 AM, Bruce Ashfield wrote:
> > On Tue, May 18, 2021 at 11:02 PM ChenQi <Qi.Chen@windriver.com> wrote:
> >> On 05/19/2021 10:38 AM, Bruce Ashfield wrote:
> >>> On Tue, May 18, 2021 at 9:23 PM ChenQi <Qi.Chen@windriver.com> wrote=
:
> >>>> On 05/18/2021 08:03 PM, Bruce Ashfield wrote:
> >>>>> On Tue, May 18, 2021 at 12:55 AM Chen Qi <Qi.Chen@windriver.com> w=
rote:
> >>>>>> Add nativesdk-sloci-image recipe which is basically from the
> >>>>>> sloci-image-native recipe.
> >>>>>>
> >>>>> Copying the recipe is a bad idea.
> >>>>>
> >>>>> What's wrong with just adding the inherit nativesdk in the existin=
g
> >>>>> sloci recipe ?
> >>>>>
> >>>>> Bruce
> >>>> Hi Bruce,
> >>>>
> >>>> This is because a recipe cannot inherit native and nativesdk at the=
 same
> >>>> time.
> >>>> Hongxu once sent a patch to rename the native recipe to
> >>>> https://urldefense.com/v3/__http://sloci-image_git.bb__;!!AjveYdw8E=
vQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D21g_xdpSg$  and=
 use BBCLASSEXTEND =3D "native nativesdk", but that
> >>>> patch was rejected.
> >>> It wasn't rejected .. I gave feedback that it shouldn't drop the -na=
tive from
> >>> the name, but that it could be both nativesdk and native.
> >>>
> >>> At the time, the recipe needed to be clear that it wasn't for on-tar=
get use,
> >>> and was build side only. Having -native in the name was the clarity =
I was
> >>> looking for (as was the inherit native).
> >>>
> >>> Last I checked, the recipe name could still be -native (it's just a
> >>> name after all),
> >>> but have the BBCLASSEXTEND instead of the include line.
> >>>
> >>> And a quick test with the following change, allowed me to build
> >>> sloci-image-native
> >>> and nativesdk-sloci-image-native:
> >>>
> >>> diff --git a/recipes-containers/sloci-image/https://urldefense.com/v=
3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5=
jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> >>> b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://=
sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8=
Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> >>> index a68c6d9..fc3c329 100644
> >>> --- a/recipes-containers/sloci-image/https://urldefense.com/v3/__htt=
p://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_K=
WMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> >>> +++ b/recipes-containers/sloci-image/https://urldefense.com/v3/__htt=
p://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_K=
WMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> >>> @@ -11,8 +11,6 @@ DEPENDS =3D ""
> >>>    SRCREV =3D "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
> >>>    PV =3D "v0.1.0+git${SRCPV}"
> >>>
> >>> -inherit native
> >>> -
> >>>    S =3D "${WORKDIR}/git"
> >>>
> >>>    do_compile() {
> >>> @@ -25,3 +23,5 @@ do_install() {
> >>>    }
> >>>
> >>>    CLEANBROKEN =3D "1"
> >>> +
> >>> +BBCLASSEXTEND =3D "native nativesdk"
> >>> I'm actually just finishing up some work on OCI image backend switch=
ing and
> >>> have some reworking of the sloci-image recipe ... and there are some
> >>> use cases where it can be used on-target (whereas that wasn't the ca=
se before).
> >>>
> >>> So the rename to _git is possible, as are the BBCLASSEXTEND changes =
to
> >>> the newly named https://urldefense.com/v3/__http://sloci-image_git.b=
b__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D=
21g_xdpSg$
> >>>
> >>> Luckily we still have sloci-image-native as an available build targe=
t,
> >>> so nothing
> >>> breaks with that rename.
> >>>
> >>> I can take care of that change right now, if that sounds like it mee=
ts what you
> >>> are looking for (that change being the BBCLASSEXTEND in a renamed sl=
oci
> >>> recipe).
> >>>
> >>> Bruce
> >> Yes. Definitely! What I need is native and nativesdk support of sloci=
-image.
> >> That would be great! Many thanks!
> > The change is pushed. Let me know if it causes any issues.
> >
> > Bruce
> >
> >> Best Regards,
> >> Chen Qi
> >>
> >>>> So I figured that adding a nativesdk-sloci-image recipe is only
> >>>> remaining way to enable nativesdk support.
> >>>>
> >>>> Maybe I should extract the common part to sloci-image.inc, and the
> >>>> native/nativesdk recipe only contains two lines like below:
> >>>> require sloci-image.inc
> >>>> inherit native (or inherit nativesdk)
> >>>>
> >>>> What do you think?
> >>>>
> >>>> Best Regards,
> >>>> Chen Qi
> >>>>
> >>>>
> >>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>>>>> ---
> >>>>>>     .../sloci-image/https://urldefense.com/v3/__http://nativesdk-=
sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxC=
OLxOY5eE1caxW8R3D22nEkW98w$   | 27 +++++++++++++++++++
> >>>>>>     1 file changed, 27 insertions(+)
> >>>>>>     create mode 100644 recipes-containers/sloci-image/https://url=
defense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht=
5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
> >>>>>>
> >>>>>> diff --git a/recipes-containers/sloci-image/https://urldefense.co=
m/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFV=
O03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$  b/recipes-containers/s=
loci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb_=
_;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22=
nEkW98w$
> >>>>>> new file mode 100644
> >>>>>> index 0000000..3c2b539
> >>>>>> --- /dev/null
> >>>>>> +++ b/recipes-containers/sloci-image/https://urldefense.com/v3/__=
http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5j=
vB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
> >>>>>> @@ -0,0 +1,27 @@
> >>>>>> +SUMMARY =3D "A simple CLI tool for packing rootfs into a single-=
layer OCI image"
> >>>>>> +LICENSE =3D "MIT"
> >>>>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D948cd8e59069fad992b04=
69af9ad7966"
> >>>>>> +SRC_URI =3D "git://github.com/jirutka/sloci-image.git \
> >>>>>> +           file://0001-sloci-image-fix-variant-quoting.patch \
> >>>>>> +          "
> >>>>>> +
> >>>>>> +
> >>>>>> +DEPENDS =3D ""
> >>>>>> +
> >>>>>> +SRCREV =3D "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
> >>>>>> +PV =3D "v0.1.0+git${SRCPV}"
> >>>>>> +
> >>>>>> +inherit nativesdk
> >>>>>> +
> >>>>>> +S =3D "${WORKDIR}/git"
> >>>>>> +
> >>>>>> +do_compile() {
> >>>>>> +       :
> >>>>>> +}
> >>>>>> +
> >>>>>> +do_install() {
> >>>>>> +       cd ${S}
> >>>>>> +        make PREFIX=3D"${exec_prefix}" DESTDIR=3D${D} install
> >>>>>> +}
> >>>>>> +
> >>>>>> +CLEANBROKEN =3D "1"
> >>>>>> --
> >>>>>> 2.30.2
> >>>>>>
> >>>>>>
> >>>>>>=20
> >>>>>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
