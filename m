Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.6308.1621391937771765679
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 May 2021 19:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oax7/0hZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id lg14so17658009ejb.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 18 May 2021 19:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AkAxk14exj0LZFCHgt0OwHPlj/7zpvliUuVRNygGk+8=;
        b=oax7/0hZ1vj+qbISh7qJLtIvyUSHzsvNGTsFYuWRvKJ6Qs78RNwNxklqQDrlK0APiV
         L3S6zK8eKNooAxKJ3aoiBmN0VrGD76yiWQ5yxWiG50ARUjA9b9y110MahFw08NS7UIvr
         AZatW5kqSixVKos10tCqx3K1wdM3QIqOtJ1msm59c1e/6XW6KsoaB68zV1WC8DHGes2D
         sRvFSVsjDnykYQ5c2rDf2r7cn4w6hM2qs/S30ciqyNhi90JPSRWiYrTHpPAA98QaFsxi
         YncmDp1tgIVl5J7ayTZ9We0n7z3OhF6vMy6OncA9kVd9pcdnsfrKfPQ5lhP/Xzf24cIv
         +XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AkAxk14exj0LZFCHgt0OwHPlj/7zpvliUuVRNygGk+8=;
        b=P07IRaAVNwNIaZBFidcLEHWxj083Mcip316KbGRm/fU6mvHYqB85cKZT5AEsU+s0/4
         cDXWLbWjzAAkDsjDmuzWfHhaEj8y2CJFmFabYwX9n8jFULh9oRLlZoCztwz619vqYwHt
         UiE2otGx3It/ESGxrD5wz7q0SdGe72+T3X1tdH/pXPB23YZOpjFSCRR2a+fSAjQRy4Ht
         Da54ffivGCpoYR5Q2kEOJwQkrd8Mumo5i4vKZ1uzfbBjfovfoCrltmb7SjgxT3sF4FYN
         t/kwkk8bfYP3XnMuYbgLi9gAkmRnLv5r7t37I2wv6BwWLgoS481LLrXpjRAsUWLJklJK
         /LAg==
X-Gm-Message-State: AOAM532bRHl6R/l8fAUmOMxJUB2MH8gbhspvH/vjThfJE2zVH5QDtJTc
	U90x2/M8B6K0QpIEpQmsSiAIRCHKvcd8y42DLKQ=
X-Google-Smtp-Source: ABdhPJy9vswKNNmpmjNmYjghLOs/nuIUCBS/uYmoNqaB6d2FIM0Epq7kh9A3thl1Ckh8gTc+uCnqgeYqau0hHi8qZrs=
X-Received: by 2002:a17:906:2ac5:: with SMTP id m5mr9533570eje.517.1621391935327;
 Tue, 18 May 2021 19:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210518045546.57617-1-Qi.Chen@windriver.com> <CADkTA4MR2hnoB73ohuDrwK7_aSy0ak8mkftb-iev-LyXh6NvXQ@mail.gmail.com>
 <f99fa35d-0f7d-6340-8e62-863588b6a4dc@windriver.com>
In-Reply-To: <f99fa35d-0f7d-6340-8e62-863588b6a4dc@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 18 May 2021 22:38:44 -0400
Message-ID: <CADkTA4M2cxRadTv_C49PvcNLQg-w-oJwfEThVi0oLhUjf-vAog@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] nativesdk-sloci-image: add recipe
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, May 18, 2021 at 9:23 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 05/18/2021 08:03 PM, Bruce Ashfield wrote:
> > On Tue, May 18, 2021 at 12:55 AM Chen Qi <Qi.Chen@windriver.com> wrote:
> >> Add nativesdk-sloci-image recipe which is basically from the
> >> sloci-image-native recipe.
> >>
> > Copying the recipe is a bad idea.
> >
> > What's wrong with just adding the inherit nativesdk in the existing
> > sloci recipe ?
> >
> > Bruce
>
> Hi Bruce,
>
> This is because a recipe cannot inherit native and nativesdk at the same
> time.
> Hongxu once sent a patch to rename the native recipe to
> sloci-image_git.bb and use BBCLASSEXTEND = "native nativesdk", but that
> patch was rejected.

It wasn't rejected .. I gave feedback that it shouldn't drop the -native from
the name, but that it could be both nativesdk and native.

At the time, the recipe needed to be clear that it wasn't for on-target use,
and was build side only. Having -native in the name was the clarity I was
looking for (as was the inherit native).

Last I checked, the recipe name could still be -native (it's just a
name after all),
but have the BBCLASSEXTEND instead of the include line.

And a quick test with the following change, allowed me to build
sloci-image-native
and nativesdk-sloci-image-native:

>>>>>>>>>>>>>>>>>>>>>>
diff --git a/recipes-containers/sloci-image/sloci-image-native_git.bb
b/recipes-containers/sloci-image/sloci-image-native_git.bb
index a68c6d9..fc3c329 100644
--- a/recipes-containers/sloci-image/sloci-image-native_git.bb
+++ b/recipes-containers/sloci-image/sloci-image-native_git.bb
@@ -11,8 +11,6 @@ DEPENDS = ""
 SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
 PV = "v0.1.0+git${SRCPV}"

-inherit native
-
 S = "${WORKDIR}/git"

 do_compile() {
@@ -25,3 +23,5 @@ do_install() {
 }

 CLEANBROKEN = "1"
+
+BBCLASSEXTEND = "native nativesdk"
>>>>>>>>>>>>>>>>>>

I'm actually just finishing up some work on OCI image backend switching and
have some reworking of the sloci-image recipe ... and there are some
use cases where it can be used on-target (whereas that wasn't the case before).

So the rename to _git is possible, as are the BBCLASSEXTEND changes to
the newly named sloci-image_git.bb

Luckily we still have sloci-image-native as an available build target,
so nothing
breaks with that rename.

I can take care of that change right now, if that sounds like it meets what you
are looking for (that change being the BBCLASSEXTEND in a renamed sloci
recipe).

Bruce

> So I figured that adding a nativesdk-sloci-image recipe is only
> remaining way to enable nativesdk support.
>
> Maybe I should extract the common part to sloci-image.inc, and the
> native/nativesdk recipe only contains two lines like below:
> require sloci-image.inc
> inherit native (or inherit nativesdk)
>
> What do you think?
>
> Best Regards,
> Chen Qi
>
>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   .../sloci-image/nativesdk-sloci-image_git.bb  | 27 +++++++++++++++++++
> >>   1 file changed, 27 insertions(+)
> >>   create mode 100644 recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
> >>
> >> diff --git a/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb b/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
> >> new file mode 100644
> >> index 0000000..3c2b539
> >> --- /dev/null
> >> +++ b/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
> >> @@ -0,0 +1,27 @@
> >> +SUMMARY = "A simple CLI tool for packing rootfs into a single-layer OCI image"
> >> +LICENSE = "MIT"
> >> +LIC_FILES_CHKSUM = "file://LICENSE;md5=948cd8e59069fad992b0469af9ad7966"
> >> +SRC_URI = "git://github.com/jirutka/sloci-image.git \
> >> +           file://0001-sloci-image-fix-variant-quoting.patch \
> >> +          "
> >> +
> >> +
> >> +DEPENDS = ""
> >> +
> >> +SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
> >> +PV = "v0.1.0+git${SRCPV}"
> >> +
> >> +inherit nativesdk
> >> +
> >> +S = "${WORKDIR}/git"
> >> +
> >> +do_compile() {
> >> +       :
> >> +}
> >> +
> >> +do_install() {
> >> +       cd ${S}
> >> +        make PREFIX="${exec_prefix}" DESTDIR=${D} install
> >> +}
> >> +
> >> +CLEANBROKEN = "1"
> >> --
> >> 2.30.2
> >>
> >>
> >> 
> >>
> >
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
