Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.7577.1620377036144654875
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 May 2021 01:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fpcE5/Po;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id h10so9253033edt.13
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 May 2021 01:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VdUrTOTOOkhXPlkRgngzseoHSiBQy1SmnLJIC6ltyfM=;
        b=fpcE5/PoFANlkAJd1bTgosSCaS4KaEYcZTRT1qPvcEtQS5ksRJtwkwrAaHmfyiDpmp
         SWqkheJaMhuCMeWdjP2l7kjK2H8oIpxowdx1G9PLxEc6twAMwhjdnpUZzBYQCrhfTSxb
         UvlzU7A4ADXurZfTzJe63P1Am5lm+iyDrWq5PeRzkWBxnLQKDRhPoTJcjfgff6RTRcU0
         CZdtH6vVz+xxcKsc7tHyYrGIRUy0UwjylQzBHqMDZO6b9OEgByYyaGDU1JEc1OvSapWw
         eUN7Nn27XhEyy5rSOT0L8DaQF9YkdxB+cOjgSHXybdRQELZfDrxvlPr8wWeU5tWNvbsY
         Eq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VdUrTOTOOkhXPlkRgngzseoHSiBQy1SmnLJIC6ltyfM=;
        b=e8La6uoWVPOpEk/APztpHJNGS6AT0fqVW9RL1Vygb1uUxdHorTdOGQzIae/m93aGyk
         tnWv8FLAd7fDLQdh93wjKomF8LBXPqicVlokKCoypXFYrDYPQg5eY4AHpUIwbql9cb4a
         d4LJNuOV9YnIg2gw9AQo7Af+henxWtplW9YNFemMs4vPoJuGYB+DY70i5sDkuND0zylC
         S+CaijuHQrE3m1Hj1ZotFffYcSvHpMSZl9sdY5E7aYyVtmTn2o/2BJ3yyUVpsC86l0qj
         JdSpSTJsnvTjz+p6omr7RtOvGaYP+u0nBDoWmwHTMt4LoRItAzeWpWqn6YAarfvWawxZ
         fw8Q==
X-Gm-Message-State: AOAM530DOR3GnC1VhiTbOzPnLxcgcef58OerVsb6kxAl6L/Uk46ClHw7
	6aRPsey/W4RIobEurkWUcus5DABEg03gpn/ljhM=
X-Google-Smtp-Source: ABdhPJytzNMFun2ZaboREJbBlZki4zUA/MlLQt9zgRARAyPVJYGUOQROoSrWa66Cxx2s00QnSCQLrM1PswOwCccEh5Q=
X-Received: by 2002:a05:6402:652:: with SMTP id u18mr10055516edx.388.1620377034577;
 Fri, 07 May 2021 01:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210503134041.2962422-1-Martin.Jansa@gmail.com> <CADkTA4N_oGkK25k=H1SJ13idCpy8ti3WZV1L7WS47yTswC+igQ@mail.gmail.com>
In-Reply-To: <CADkTA4N_oGkK25k=H1SJ13idCpy8ti3WZV1L7WS47yTswC+igQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 7 May 2021 10:43:43 +0200
Message-ID: <CA+chaQfVsZ9vWDhpyKyTthdS_d9sGYA7=WhOPxqpMys3gsu3qg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] runc-opencontainers: use bfd even with ld-is-gold
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008c5bbe05c1b96dcc"

--0000000000008c5bbe05c1b96dcc
Content-Type: text/plain; charset="UTF-8"

Thanks Bruce, yes it's still needed as work around for those with
ld-is-gold in DISTRO_FEATURES. Once binutils are upgraded in oe-core I'll
retest and send removal of this once it starts working fine again.

On Fri, May 7, 2021 at 5:08 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> This is on master-next now.
>
> From the follow ups, I assume that this is still needed. Once I get a
> bit of soak and runtime testing done on some other queued changes,
> this will be part of my next push.
>
> Bruce
>
> On Mon, May 3, 2021 at 9:40 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > * just a work around for internal error in binutils-2.36 gold:
> >   http://errors.yoctoproject.org/Errors/Details/580099/
> >   CGO_ENABLED=1 x86_64-oe-linux-go build -trimpath  -tags "seccomp
> seccomp                       netgo osusergo" -ldflags "-w -extldflags
> -static -X main.gitCommit="fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty"
> -X main.version=1.0.0-rc93+dev " -o runc .
> >
>  TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld:
> internal error in format_file_lineno, at ../../gold/dwarf_reader.cc:2278
> >   collect2: error: ld returned 1 exit status
> >
> > * it fails like this only together with gcc-11, with gcc-10.3 it
> >   builds fine even with gold
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-containers/runc/runc-opencontainers_git.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
> b/recipes-containers/runc/runc-opencontainers_git.bb
> > index f3ff9a8..51ba7c9 100644
> > --- a/recipes-containers/runc/runc-opencontainers_git.bb
> > +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> > @@ -8,3 +8,10 @@ SRC_URI = " \
> >  RUNC_VERSION = "1.0.0-rc93"
> >
> >  CVE_PRODUCT = "runc"
> > +
> > +# use BFD when ld-is-gold is used to work around:
> > +# http://errors.yoctoproject.org/Errors/Details/580099/
> > +# CGO_ENABLED=1 x86_64-oe-linux-go build -trimpath  -tags "seccomp
> seccomp                       netgo osusergo" -ldflags "-w -extldflags
> -static -X main.gitCommit="fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty"
> -X main.version=1.0.0-rc93+dev " -o runc .
> > +#
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld:
> internal error in format_file_lineno, at ../../gold/dwarf_reader.cc:2278
> > +# collect2: error: ld returned 1 exit status
> > +LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> ' -fuse-ld=bfd ', '', d)}"
> > --
> > 2.30.2
> >
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

--0000000000008c5bbe05c1b96dcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Bruce, yes it&#39;s still needed as work around for=
 those with ld-is-gold in DISTRO_FEATURES. Once binutils are upgraded in oe=
-core I&#39;ll retest and send removal of this once it starts working fine =
again.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, May 7, 2021 at 5:08 AM Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">This is on master-next now=
.<br>
<br>
From the follow ups, I assume that this is still needed. Once I get a<br>
bit of soak and runtime testing done on some other queued changes,<br>
this will be part of my next push.<br>
<br>
Bruce<br>
<br>
On Mon, May 3, 2021 at 9:40 AM Martin Jansa &lt;<a href=3D"mailto:Martin.J=
ansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * just a work around for internal error in binutils-2.36 gold:<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Details/=
580099/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.or=
g/Errors/Details/580099/</a><br>
&gt;=C2=A0 =C2=A0CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath=C2=A0 =
-tags &quot;seccomp seccomp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netgo osusergo&quot; -ldflags &quot;-w -=
extldflags -static -X main.gitCommit=3D&quot;fce58ab2d5c488bc573d02712db476=
a6daa9a60c-dirty&quot; -X main.version=3D1.0.0-rc93+dev &quot; -o runc .<br=
>
&gt;=C2=A0 =C2=A0TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontaine=
rs/1.0.0-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64=
-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: inte=
rnal error in format_file_lineno, at ../../gold/dwarf_reader.cc:2278<br>
&gt;=C2=A0 =C2=A0collect2: error: ld returned 1 exit status<br>
&gt;<br>
&gt; * it fails like this only together with gcc-11, with gcc-10.3 it<br>
&gt;=C2=A0 =C2=A0builds fine even with gold<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/runc/<a href=3D"http://runc-opencontainers_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a> =
| 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/runc/<a href=3D"http://runc-openconta=
iners_git.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.=
bb</a> b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.=
bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><br>
&gt; index f3ff9a8..51ba7c9 100644<br>
&gt; --- a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><=
br>
&gt; +++ b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><=
br>
&gt; @@ -8,3 +8,10 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 RUNC_VERSION =3D &quot;1.0.0-rc93&quot;<br>
&gt;<br>
&gt;=C2=A0 CVE_PRODUCT =3D &quot;runc&quot;<br>
&gt; +<br>
&gt; +# use BFD when ld-is-gold is used to work around:<br>
&gt; +# <a href=3D"http://errors.yoctoproject.org/Errors/Details/580099/" =
rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/=
Details/580099/</a><br>
&gt; +# CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath=C2=A0 -tags &qu=
ot;seccomp seccomp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0netgo osusergo&quot; -ldflags &quot;-w -extldfl=
ags -static -X main.gitCommit=3D&quot;fce58ab2d5c488bc573d02712db476a6daa9a=
60c-dirty&quot; -X main.version=3D1.0.0-rc93+dev &quot; -o runc .<br>
&gt; +# TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-=
rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux=
/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal erro=
r in format_file_lineno, at ../../gold/dwarf_reader.cc:2278<br>
&gt; +# collect2: error: ld returned 1 exit status<br>
&gt; +LDFLAGS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;ld-is-gold&#39;, &#39; -fuse-ld=3Dbfd &#39;, &#39;&#39;, d)}&quot=
;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000008c5bbe05c1b96dcc--
