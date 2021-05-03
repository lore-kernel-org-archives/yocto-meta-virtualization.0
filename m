Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.35500.1620056363080499485
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 May 2021 08:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VIXBgpZ/;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id b25so8546046eju.5
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 03 May 2021 08:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H8/KMElLVdE1kDZs74vTSxxcA1LbBz69NbdY1yU0lWo=;
        b=VIXBgpZ/B9EpwGkkHoKj7GSpRp9XPMeDCa9fJ5nMOYeQ1njsS9O/jiu1ObcH7H/3G7
         FeD7dV659VX13d90SD2/DquXZfcwTV0xgSJAm9EzooVs6MJPcmeZ+ODzpLC08u2l8zg9
         hsdAOQoGgMTYhemWfxg+IDkRM/kz5Uv7ThGERZOH5VgTg3A0g/QSq3t+IAM8403oob4X
         jgMSwFBjshBW03i8vBa74Un1n+dvClBliLrV75fJtmaESClFOoCsfd5Rk7R/w8l8T5sH
         LIOHOyRnFp/zgB7VGLgomW/DWIhtdsxd+ZSuFAVKVz4XXdT4m/nSHfb9q0vTEI0QZQKz
         wq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H8/KMElLVdE1kDZs74vTSxxcA1LbBz69NbdY1yU0lWo=;
        b=Hq4JlVr5OVWhuBAlmXWTto5wHTxDLqYvMQWnNHa174IFtc7qvVY9QabckQTKobwguv
         xaqFy+K/HFO+FVOxMh9T5jGSUInyIUkIpy7RzlK1B9zj48Au5lN/DQuDbz62rcfB2wdz
         BVCZIaxANnSJE6GqP7AUenoE3mijqgIWnhKQPLy5DVSVc2oTicjuTImydKpMIpsNfcD1
         hUCy0Aei5MVeVbFc0E1ckrxgo5oI3E8tKJ2SJRZb3W0IbrMAxfqu3B0KrJ3q2eosWGYK
         gsnGRkqCUYIOLL53Hm+8npdNNmK9m6PgsZG8VU77dQLm396595JhTDHvF8qnUMat2dgM
         0HHQ==
X-Gm-Message-State: AOAM532H7P1iFAuLjZJESSgbzkcAVM1Xer5JWn6q9a+yx/Bh1pAnLMuy
	2DSPc2yrIECA8EJm5QFDBxLAYizdwICSxZdeWcY=
X-Google-Smtp-Source: ABdhPJyPNGcOx62gMlAodH+uOyDGl4A0exh1sHmEJ2KGhqySAkrUOwArHCvNGvZD0xwsfsoB5rRLxSiKQwpTsKSuWXE=
X-Received: by 2002:a17:906:9818:: with SMTP id lm24mr17731738ejb.541.1620056361541;
 Mon, 03 May 2021 08:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210503134041.2962422-1-Martin.Jansa@gmail.com> <f58ef464-89ce-755a-988b-5ebc6fc28fbe@gmail.com>
In-Reply-To: <f58ef464-89ce-755a-988b-5ebc6fc28fbe@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 3 May 2021 17:39:10 +0200
Message-ID: <CA+chaQd0iksoOgFerw52jgf8SXJCV=mv20GePr_CFyVrUWFK9w@mail.gmail.com>
Subject: Re: [PATCH] runc-opencontainers: use bfd even with ld-is-gold
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f224f805c16ec31d"

--000000000000f224f805c16ec31d
Content-Type: text/plain; charset="UTF-8"

runc-opencontainers is the only recipe currently failing like this for me
with gold, so instead of switching system linker I would prefer to force
bfd only here.

But there is also one more issue which is probably introduced by gcc-11 (I
had older version of your patches with 11.0.1 in my branches, so waiting
for build to confirm if it's reproducible with 11.1.0 as well):

NOTE: > Executing update_font_cache intercept ...
NOTE: Exit code 132. Output:
+ '[' True = False -a qemuwrapper-cross '!=' nativesdk-qemuwrapper-cross ']'
+ qemu-i386 -r 3.2.0 -E
LD_LIBRARY_PATH=/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs/usr/lib:/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs/lib
-L
/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs
-E FC_DEBUG=16
/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs/usr/libexec/fc-cache
--sysroot=/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs
--system-only -v
qemu: uncaught target signal 4 (Illegal instruction) - core dumped



On Mon, May 3, 2021 at 5:25 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 5/3/21 6:40 AM, Martin Jansa wrote:
> > * just a work around for internal error in binutils-2.36 gold:
> >    http://errors.yoctoproject.org/Errors/Details/580099/
> >    CGO_ENABLED=1 x86_64-oe-linux-go build -trimpath  -tags "seccomp
> seccomp                       netgo osusergo" -ldflags "-w -extldflags
> -static -X main.gitCommit="fce58ab2d5c488bc573d02712db476a6daa9a60c-dirty"
> -X main.version=1.0.0-rc93+dev " -o runc .
> >
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld:
> internal error in format_file_lineno, at ../../gold/dwarf_reader.cc:2278
> >    collect2: error: ld returned 1 exit status
> >
> > * it fails like this only together with gcc-11, with gcc-10.3 it
> >    builds fine even with gold
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   recipes-containers/runc/runc-opencontainers_git.bb | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
> b/recipes-containers/runc/runc-opencontainers_git.bb
> > index f3ff9a8..51ba7c9 100644
> > --- a/recipes-containers/runc/runc-opencontainers_git.bb
> > +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> > @@ -8,3 +8,10 @@ SRC_URI = " \
> >   RUNC_VERSION = "1.0.0-rc93"
> >
> >   CVE_PRODUCT = "runc"
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
>
> this is because of dwarf-5 defaults in gcc 11 and gold has gotten some
> fixed recently fixes these issues, but we are not backporting them yet
> and perhaps will wait for binutils 2.37 to get it all. Maybe you should
> not use gold as system linker until then to avoid these pitfalls.
>
> > +LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> ' -fuse-ld=bfd ', '', d)}"
> >
>

--000000000000f224f805c16ec31d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">runc-opencontainers is the only recipe currently failing l=
ike this for me with gold, so instead of switching system linker I would pr=
efer to force bfd only here.<div><br></div><div>But there is also one more =
issue which is probably introduced by gcc-11 (I had older version of your p=
atches with 11.0.1 in my branches, so waiting for build to confirm if it&#3=
9;s reproducible with 11.1.0 as well):</div><div><br></div><div>NOTE: &gt; =
Executing update_font_cache intercept ...<br>NOTE: Exit code 132. Output:<b=
r>+ &#39;[&#39; True =3D False -a qemuwrapper-cross &#39;!=3D&#39; nativesd=
k-qemuwrapper-cross &#39;]&#39;<br>+ qemu-i386 -r 3.2.0 -E LD_LIBRARY_PATH=
=3D/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-=
image-ros-world/1.0-r3/rootfs/usr/lib:/jenkins/mjansa/build/ose/honister/BU=
ILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs/lib -L /je=
nkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-=
ros-world/1.0-r3/rootfs -E FC_DEBUG=3D16 /jenkins/mjansa/build/ose/honister=
/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs/usr/lib=
exec/fc-cache --sysroot=3D/jenkins/mjansa/build/ose/honister/BUILD/work/qem=
ux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs --system-only -v<br>qe=
mu: uncaught target signal 4 (Illegal instruction) - core dumped<br></div><=
div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, May 3, 2021 at 5:25 PM Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 5/3/21 6:40 AM, Martin Jansa wrote:<br>
&gt; * just a work around for internal error in binutils-2.36 gold:<br>
&gt;=C2=A0 =C2=A0 <a href=3D"http://errors.yoctoproject.org/Errors/Details/=
580099/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.or=
g/Errors/Details/580099/</a><br>
&gt;=C2=A0 =C2=A0 CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath=C2=A0 =
-tags &quot;seccomp seccomp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netgo osusergo&quot; -ldflags &quot;-w -=
extldflags -static -X main.gitCommit=3D&quot;fce58ab2d5c488bc573d02712db476=
a6daa9a60c-dirty&quot; -X main.version=3D1.0.0-rc93+dev &quot; -o runc .<br=
>
&gt;=C2=A0 =C2=A0 TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontaine=
rs/1.0.0-rc93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64=
-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: inte=
rnal error in format_file_lineno, at ../../gold/dwarf_reader.cc:2278<br>
&gt;=C2=A0 =C2=A0 collect2: error: ld returned 1 exit status<br>
&gt; <br>
&gt; * it fails like this only together with gcc-11, with gcc-10.3 it<br>
&gt;=C2=A0 =C2=A0 builds fine even with gold<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0recipes-containers/runc/<a href=3D"http://runc-opencontain=
ers_git.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb=
</a> | 7 +++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+)<br>
&gt; <br>
&gt; diff --git a/recipes-containers/runc/<a href=3D"http://runc-opencontai=
ners_git.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.b=
b</a> b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.b=
b" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><br>
&gt; index f3ff9a8..51ba7c9 100644<br>
&gt; --- a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><b=
r>
&gt; +++ b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><b=
r>
&gt; @@ -8,3 +8,10 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0RUNC_VERSION =3D &quot;1.0.0-rc93&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0CVE_PRODUCT =3D &quot;runc&quot;<br>
&gt; +<br>
&gt; +# use BFD when ld-is-gold is used to work around:<br>
&gt; +# <a href=3D"http://errors.yoctoproject.org/Errors/Details/580099/" r=
el=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/D=
etails/580099/</a><br>
&gt; +# CGO_ENABLED=3D1 x86_64-oe-linux-go build -trimpath=C2=A0 -tags &quo=
t;seccomp seccomp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0netgo osusergo&quot; -ldflags &quot;-w -extldfla=
gs -static -X main.gitCommit=3D&quot;fce58ab2d5c488bc573d02712db476a6daa9a6=
0c-dirty&quot; -X main.version=3D1.0.0-rc93+dev &quot; -o runc .<br>
&gt; +# TOPDIR/tmp-glibc/work/core2-64-oe-linux/runc-opencontainers/1.0.0-r=
c93+gitAUTOINC+fce58ab2d5-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/=
../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/11.0.1/ld: internal error=
 in format_file_lineno, at ../../gold/dwarf_reader.cc:2278<br>
&gt; +# collect2: error: ld returned 1 exit status<br>
<br>
this is because of dwarf-5 defaults in gcc 11 and gold has gotten some <br>
fixed recently fixes these issues, but we are not backporting them yet <br>
and perhaps will wait for binutils 2.37 to get it all. Maybe you should <br=
>
not use gold as system linker until then to avoid these pitfalls.<br>
<br>
&gt; +LDFLAGS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;ld-is-gold&#39;, &#39; -fuse-ld=3Dbfd &#39;, &#39;&#39;, d)}&quot;=
<br>
&gt; <br>
</blockquote></div>

--000000000000f224f805c16ec31d--
