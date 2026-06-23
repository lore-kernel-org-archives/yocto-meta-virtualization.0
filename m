Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C8CCDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 12:58:25 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20043.1782219501629270369
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 05:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T5cbtkfK;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37d82f3a244so1315361a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2026 05:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782219501; cv=none;
        d=google.com; s=arc-20240605;
        b=JtAnDfpHBpv3ehddD7A+Y6C8l+Lb9+S5Wi4yqPtWaLleoA+Tz6SlSzcoLZJt4r6q3w
         5fAmxKCNnZX5hHb/NoqlU5EHkYsStQYJQoKwvhlS5F9wFpAujVOLqpIU7Hw0XtQetqLh
         m3RPSWbo9a+NPqn4giNWaofAeIvURDfL4f3KTQfON7c2wJHDULwieXZS+JNuvnIxMYwu
         6crRZoxNF3BjCwgKZxKdUEYWNYp0EgFWbrkmvQn6zxVQtsSijfcGt7C1JrANlMX8Da7t
         9QhzWOLi3b7MD+Jd/fupdQOzkJfIHuwxyRqD3yf/JHpFdH4/mJWyl/46tJ4erFeAUJ2c
         f+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2cJVuoq+DsvyWIVdYgN2YOz6/vhD2YzxA8WvxeoF0NI=;
        fh=IvgK5mA/7GxE9/Xa4WYU0KQjCG9HpJVnT9i3Tv+bmG4=;
        b=IBz026O0LOeDUiPCVL8Yamg0T0A7K07XA1BFGqD9NbevGePcAE6S4yrSM4H5ApcxcF
         SMXbi2bKKgEgwjdpSIU1ptKrE2aUSDa4x1LkRa/nZ6wEpolKL3sXVIAUlPs3muVOG+QZ
         xgFiPM4EqOSi6bQWhK2Pfz0hn3j3+OkK6rhf+WJyhKyVL0FdtR+VAytB9U+A46ajQTt7
         +qriMia9ds8CwtUIUd/0IvMhE41IMBOTCngKZzU+efVVi9je59cHt4yWlHMRKLJPst88
         My9pSmPD7DMerC34Fo1i0Vp6ddBhh2r1BsAG9GluouuNaloVAjpapxcL03vPjuUu0bzt
         Hqcg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219501; x=1782824301; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2cJVuoq+DsvyWIVdYgN2YOz6/vhD2YzxA8WvxeoF0NI=;
        b=T5cbtkfK4D0ddnWQan4SuWWtxN9bD8RNck+EqiVR6SqversPljHfzFHMoIWn1QHEJ2
         eK0DRgp3g8pYhIpzjxRP1XyVj6OJ0wMufg1XVVCrZn/cgewGDrBgqcija/pFDMokzr+p
         ghj3oW7xi+NPeyIVPdqOjszqvZRru2G2QFNme+j76XS40CzMaytrbBm5FeFPhpca6As4
         w0IKbXc13lUpTrreVFhntPDZlgB0KdM5VZJBQUwP2OrTOrOB5JOIF2ye2aJ5IisG8N7H
         WJvYURzYNpoX7e98RTiQNUu6oIaFsI+2qgIlgOPLte9sLEf1b2pGp8Zx51Oxw4XpZpJJ
         oKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219501; x=1782824301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cJVuoq+DsvyWIVdYgN2YOz6/vhD2YzxA8WvxeoF0NI=;
        b=T8V9LG1A4QwV3UaM8jrMuEovkTEHznbVdmS+VERCj6Sj4w9Jhx6zVCJjm3QhZnQr66
         j9YA+RhBQZK/MfhiqYqgC0RnQhpRT3LW8ZVRhWWMKgpVG573i3vvzlfq/Ox/FODgysye
         eltUbl/YlZ0q7K+I8wZWjcJuO2V8tT85iMM4bgo6ZY/wF1pBhf1pJJPZ1+K3e5q6DwgU
         iF0phEmDCxypHTTQbg8rE5/7hU6W2F9JVbbdEvhGQXYENX43paqshg5FnqdJrblvf2PW
         Fi4JqkqGZ6VhdjF3CZW+VV00GDWZQFjRgqZBjY1rMfjFYp0OQwm5mLbn66ew7Phk6OSH
         SzTw==
X-Gm-Message-State: AOJu0Yytv+6uvYjIZbWmmpvBfj1bjS2/sflluT1AVRo8FHDj5K3ujQvi
	NcaTaulXs3hVSNaK3DLQT8RjZi6xEKhxea0mAsmh8G+E9agTat0OEpJ3uUFG24/wTJCMylQoF1e
	dW2CegK9FbCbCvyegCDOJYKy331bj2/o=
X-Gm-Gg: AfdE7cmtC5k2Ad70djNp5c79dCUy5xeIN6QQw7VvKRApS2NBwiS+JO2JbtC/Tl9Ouab
	VNZhGPS2vnkIpxjF/vir9eoUFzVZUuh4nSyI2j32f7Ln3oYUVDg+XhBCEI+nDQ7BFywMVYr3Thq
	drUkojNiJZS1oepLSAdlh7Fe3x2Wh+wFU+7pilgcFskH9nX6E/Cr5kLEqtKJr7sJ7rm9+9S2f34
	BvAyf5VqquIlxismQn9t2O5Vvr0bgdZ+paqG3CKeq3hxofN8FMjt0Jmq0yGU6SESZqclqfHH2Y7
	aIcwzfm6mCUvRkKilgbQiwiylkDHfbvS+4yIkYq5VwLxJyQoe+3aCmJrSD5abZB3sEA0tijsvrl
	Wq6ChbLg9diB/76R1INr+Ar7egg==
X-Received: by 2002:a17:90b:55d0:b0:36a:95c:7613 with SMTP id
 98e67ed59e1d1-37d4d94047dmr15053514a91.10.1782219500827; Tue, 23 Jun 2026
 05:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-2-kraghava@qti.qualcomm.com> <6a360c2b.eef12218.262e9b.f8ea@mx.google.com>
 <CH8PR02MB10971460B68EFD02FD19E40DDF3EF2@CH8PR02MB10971.namprd02.prod.outlook.com>
 <6a399fd2.40ff4c04.83ff5.dffb@mx.google.com> <CH8PR02MB109712F19227670A82BC626ECF3EE2@CH8PR02MB10971.namprd02.prod.outlook.com>
In-Reply-To: <CH8PR02MB109712F19227670A82BC626ECF3EE2@CH8PR02MB10971.namprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Jun 2026 08:58:09 -0400
X-Gm-Features: AVVi8CdLF28NRRFvgwNu15dr5fl3IaU5ox5IG0M26riYhGZlDrXhw0lKBEVqKhM
Message-ID: <CADkTA4NykhXNe9xahCc76OBc5B4D9TfLCHSw847Y9JHJnx2=QQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
To: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Viswanath Kraleti <vkraleti@qti.qualcomm.com>, Anuj Mittal <anujmitt@qti.qualcomm.com>, 
	Sourabh Banerjee <sbanerje@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000004239300654eb50c3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Jun 2026 12:58:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9904

--0000000000004239300654eb50c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 6:23=E2=80=AFAM Keerthivasan Raghavan <
kraghava@qti.qualcomm.com> wrote:

>
> Hi Bruce,
>
> Thank you for the guidance and suggestions.
>
> I reviewed another recipe that uses bindgen for creating sys crates:
>
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-suppo=
rt/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb
>
> I would like to propose using:
>
> export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
> --target=3D${TARGET_SYS}"
>
> instead of:
>
> export BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${STAGING_DIR_HOST}"
>
> Rationale:
>
> - HOST_CC_ARCH: Specifies architecture-specific compiler flags passed to
> the C compiler.
>   Reference:
> https://docs.yoctoproject.org/ref-manual/variables.html#term-HOST_CC_ARCH
>
> - TOOLCHAIN_OPTIONS: Holds additional options passed to the compiler and
> linker. For non-native recipes, these point to the custom sysroot via
> RECIPE_SYSROOT.
>   Reference:
> https://docs.yoctoproject.org/ref-manual/variables.html#term-TOOLCHAIN_OP=
TIONS
>
> - TARGET_SYS: Specifies the target system (architecture and operating
> system) for which the build is being performed.
>   Reference:
> https://docs.yoctoproject.org/ref-manual/variables.html#term-TARGET_SYS
>
> Given their intended purposes, using these variables makes the toolchain
> and target configuration more explicit. This helps prevent accidental
> "noise" or "crosstalk" with build host directories.
>
> With this approach, bindgen (via libclang/clang frontend) will resolve
> system headers using the correct toolchain configuration, including all
> relevant compiler and target options. This should ensure consistent and
> correct header resolution, especially when extending the recipe class for
> native builds.
>
>
I value simplicity. Passing the sysroot, which is a valid option to bindgen
is a single argument and fixes the build. No extended researching of
variables and dumping the environment to know what you are passing.

I'm curious as to how you hadn't hit this previously ?  my build broke
without something fixing it up.

Bruce


> Overall, this feels more robust than specifying only the sysroot location=
.
>
> Thank you,
> Keerthivasan Raghavan
>
>
>
>



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004239300654eb50c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 23, 2026 at 6:23=
=E2=80=AFAM Keerthivasan Raghavan &lt;<a href=3D"mailto:kraghava@qti.qualco=
mm.com">kraghava@qti.qualcomm.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
Hi Bruce,<br>
<br>
Thank you for the guidance and suggestions.<br>
<br>
I reviewed another recipe that uses bindgen for creating sys crates:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-oe/reci=
pes-support/thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openemb=
edded/tree/meta-oe/recipes-support/thin-provisioning-tools/thin-provisionin=
g-tools_1.3.1.bb</a><br>
<br>
I would like to propose using:<br>
<br>
export BINDGEN_EXTRA_CLANG_ARGS =3D &quot;${HOST_CC_ARCH}${TOOLCHAIN_OPTION=
S} --target=3D${TARGET_SYS}&quot;<br>
<br>
instead of:<br>
<br>
export BINDGEN_EXTRA_CLANG_ARGS =3D &quot;--sysroot=3D${STAGING_DIR_HOST}&q=
uot;<br>
<br>
Rationale:<br>
<br>
- HOST_CC_ARCH: Specifies architecture-specific compiler flags passed to th=
e C compiler.<br>
=C2=A0 Reference: <a href=3D"https://docs.yoctoproject.org/ref-manual/varia=
bles.html#term-HOST_CC_ARCH" rel=3D"noreferrer" target=3D"_blank">https://d=
ocs.yoctoproject.org/ref-manual/variables.html#term-HOST_CC_ARCH</a><br>
<br>
- TOOLCHAIN_OPTIONS: Holds additional options passed to the compiler and li=
nker. For non-native recipes, these point to the custom sysroot via RECIPE_=
SYSROOT.<br>
=C2=A0 Reference: <a href=3D"https://docs.yoctoproject.org/ref-manual/varia=
bles.html#term-TOOLCHAIN_OPTIONS" rel=3D"noreferrer" target=3D"_blank">http=
s://docs.yoctoproject.org/ref-manual/variables.html#term-TOOLCHAIN_OPTIONS<=
/a><br>
<br>
- TARGET_SYS: Specifies the target system (architecture and operating syste=
m) for which the build is being performed.<br>
=C2=A0 Reference: <a href=3D"https://docs.yoctoproject.org/ref-manual/varia=
bles.html#term-TARGET_SYS" rel=3D"noreferrer" target=3D"_blank">https://doc=
s.yoctoproject.org/ref-manual/variables.html#term-TARGET_SYS</a><br>
<br>
Given their intended purposes, using these variables makes the toolchain an=
d target configuration more explicit. This helps prevent accidental &quot;n=
oise&quot; or &quot;crosstalk&quot; with build host directories.<br>
<br>
With this approach, bindgen (via libclang/clang frontend) will resolve syst=
em headers using the correct toolchain configuration, including all relevan=
t compiler and target options. This should ensure consistent and correct he=
ader resolution, especially when extending the recipe class for native buil=
ds.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I value simplicity. Passing the sysroot, which is a valid =
option to bindgen is a single argument and fixes the build. No extended res=
earching of variables and dumping the environment to know what you are pass=
ing.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
</div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m curiou=
s as to how you hadn&#39;t hit this previously ?=C2=A0=C2=A0my build broke =
without something fixing it up.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Overall, this feels more robust than specifying only the sysroot location.<=
br>
<br>
Thank you,<br>
Keerthivasan Raghavan<br>
<br>
<br>
<br>
=C2=A0</blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--0000000000004239300654eb50c3--

