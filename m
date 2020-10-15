Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.5259.1602734699041058578
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 21:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PQZH8LB0;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id cm24so627619edb.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Oct 2020 21:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNg4YCJyMcp5d0jqStP8a7hJUNGyz2BUonSxIat347w=;
        b=PQZH8LB02IwTqkezhFoungAv4kefj7WZbS04XVaau4bQGNdAxW65V2QPmtRzH5kbWf
         79xaib2GifjgAyP4DhCt5Pk0Sl3EzSPvrC/+G2+39lA2/KgBZxI2SbK4+3AxxuDM2JYe
         3o0y5vGRV5CPEzy8rKoyaIyEWSeY+lgHoOch4ErZjd2KNud4wOP9Ivf5KJBrBCrfre+y
         MRpATMipsHm7IidXsxgN3ZKuq7ZLNTPe0+lBbn0tEW1PZOnbbUBZM3G4hit+8mVSdsco
         ZDcIASfJXCA6JrpsKWbY6GOG/Bot9zTEKpCgiuISK7BKTRHmritIfCfEA4KrTi5iX9J1
         /0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNg4YCJyMcp5d0jqStP8a7hJUNGyz2BUonSxIat347w=;
        b=LNsiwmbWezZD6mnH+rkuGJ8gDMZ5wRxGAtT1EMxK9+1gGxo8Zh5qDC0zQV9k+j5hIM
         cSsT+iycPI4gW0Eprr/2ivuq0UVxLgyr0raBTG6Py2dEjiaZEg5s46cdv3LYL5FifTxF
         bXFKuBBTN2M0nTMSp+YraFExTy8QF746lEPRBIPDj5eaPc4uxNNmL2Q8P9QK+FNyvbZC
         LESDtd8HCXqI46xklBGul7R0u4/xS75pYL2JTVMEZ8EpnSgVh8oxsi8s6jxyES6KtU+w
         jKnwJCWh7wNgBko+C+CIQ8EPVrOYjvmUqKCIMJL1eXzchPcwvsJOCMcQRJgRDOLD1Xcp
         kY2A==
X-Gm-Message-State: AOAM5305qHueTVlWhh6rlLSmATJL6b7TPDuieP7lSFb7/DXM1N5mUx7T
	ADWRcNeAJf2LBVbO+p5nxAHmS/B1FJACk1WuQtU=
X-Google-Smtp-Source: ABdhPJxUGHpZFlqraq8pGDmTEXz5L3vqSkPsrhdN2yBgNgCgpTfJ69/CNN1Q+g2GIK3Smkfw+SQbuwdH+DFqbvLkiuk=
X-Received: by 2002:a05:6402:13d7:: with SMTP id a23mr2234798edx.352.1602734697480;
 Wed, 14 Oct 2020 21:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <816fba5d-6d9a-3a90-65ca-91e86a135c4c@optimcloud.com>
In-Reply-To: <816fba5d-6d9a-3a90-65ca-91e86a135c4c@optimcloud.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 15 Oct 2020 00:04:46 -0400
Message-ID: <CADkTA4N=GQtGh7+7O7Qp67u8=ccKEiAvgEYzoKF2jT_+wUxgyQ@mail.gmail.com>
Subject: Re: [meta-virtualization] lastest commit break ERROR: containerd-opencontainers
To: Yocto <yocto@optimcloud.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000050076705b1adc05e"

--00000000000050076705b1adc05e
Content-Type: text/plain; charset="UTF-8"

Indeed.

x86-64 containerd 1.4.x is broken.

I'm putting together a fix, or will revert the upgrade.

Bruce

On Wed, Oct 14, 2020 at 10:08 PM Yocto <yocto@optimcloud.com> wrote:

> Build Configuration:
> BB_VERSION           = "1.47.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "fedora-32"
> TARGET_SYS           = "x86_64-overc-linux"
> MACHINE              = "intel-corei7-64"
> DISTRO               = "overc"
> DISTRO_VERSION       = "1.0"
> TUNE_FEATURES        = "m64 corei7"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"
> meta-oe
> meta-python
> meta-networking
> meta-filesystems
> meta-multimedia
> meta-perl            = "master:2258c9a767391e4529665cd6508e4b32bd18d130"
> meta-overc
> meta-cube            = "master:264d1d0949fb5e9ec8e39b1f7604086d59ec2047"
> meta-intel           = "master:4abd867159f2ea0cd560c34c574a6fe3dd252691"
> meta-virtualization  = "master:1d861978463fdc247a7a57464b8349debba51912"
> meta-cloud-services  = "master:910195eb791d754d394ba1013a258ab120c995e9"
> meta-security        = "master:3ce8b759c97706d6f78928c38b6ebac4edfd95a5"
> meta-selinux         = "master:6e1100d29aec118df2025c46c77f4c8aa8da4e76"
> meta-gnome
> meta-xfce            = "master:2258c9a767391e4529665cd6508e4b32bd18d130"
> meta-awnix           = "master:c616414c6ed4f6f2ab75703ce5a3e84acacd3c47"
> workspace            = "master:32f1010ad0d36b886ecde57290061558fc22929a"
>
> Initialising tasks: 100%
> |######################################################################################################################|
>
> Time: 0:00:11
> Sstate summary: Wanted 4286 Found 0 Missed 4286 Current 0 (0% match, 0%
> complete)
> NOTE: Executing Tasks
> ERROR: containerd-opencontainers-v1.4.1+gitAUTOINC+e44e8ebeaa-r0
> do_compile: oe_runmake failed
> ERROR: containerd-opencontainers-v1.4.1+gitAUTOINC+e44e8ebeaa-r0
> do_compile: Execution of
> '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140'
>
> failed with exit code 1:
> + bin/ctr
> + bin/containerd
> + bin/containerd-stress
> + bin/containerd-shim
> + bin/containerd-shim-runc-v1
> + bin/containerd-shim-runc-v2
> #
>
> _/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-shim
> cannot find package runtime/cgo (using -importcfg)
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x86_64-overc-linux/go/pkg/tool/linux_amd64/link:
>
> cannot open file : open : no such file or directory
> make: *** [Makefile:201: bin/containerd-shim] Error 2
> make: *** Waiting for unfinished jobs....
> WARNING:
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237
>
> exit 1 from 'exit 1'
> WARNING: Backtrace (BB generated script):
>      #1: bbfatal_log,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 237
>      #2: die,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 212
>      #3: oe_runmake,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 207
>      #4: do_compile,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 202
>      #5: main,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 241
>
> Backtrace (metadata-relative locations):
>      #1: bbfatal_log,
> /var/home/dingo/overc/poky/meta/classes/logging.bbclass, line 72
>      #2: die, /var/home/dingo/overc/poky/meta/classes/base.bbclass, line 56
>      #3: oe_runmake,
> /var/home/dingo/overc/poky/meta/classes/base.bbclass, line 65
>      #4: do_compile,
> /var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/containerd.inc,
>
> line 70
> ERROR: Logfile of failure stored in:
>
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/log.do_compile.3449140
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 16 GODEBUG=1 binaries
> | + bin/ctr
> | + bin/containerd
> | + bin/containerd-stress
> | + bin/containerd-shim
> | + bin/containerd-shim-runc-v1
> | + bin/containerd-shim-runc-v2
> | #
>
> _/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-shim
> | cannot find package runtime/cgo (using -importcfg)
> |
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x86_64-overc-linux/go/pkg/tool/linux_amd64/link:
>
> cannot open file : open : no such file or directory
> | make: *** [Makefile:201: bin/containerd-shim] Error 2
> | make: *** Waiting for unfinished jobs....
> | ERROR: oe_runmake failed
> | WARNING:
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237
>
> exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> |     #1: bbfatal_log,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 237
> |     #2: die,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 212
> |     #3: oe_runmake,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 207
> |     #4: do_compile,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 202
> |     #5: main,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 241
> | ERROR: Execution of
> '/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140'
>
> failed with exit code 1:
> | + bin/ctr
> | + bin/containerd
> | + bin/containerd-stress
> | + bin/containerd-shim
> | + bin/containerd-shim-runc-v1
> | + bin/containerd-shim-runc-v2
> | #
>
> _/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-shim
> | cannot find package runtime/cgo (using -importcfg)
> |
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x86_64-overc-linux/go/pkg/tool/linux_amd64/link:
>
> cannot open file : open : no such file or directory
> | make: *** [Makefile:201: bin/containerd-shim] Error 2
> | make: *** Waiting for unfinished jobs....
> | WARNING:
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237
>
> exit 1 from 'exit 1'
> | WARNING: Backtrace (BB generated script):
> |     #1: bbfatal_log,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 237
> |     #2: die,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 212
> |     #3: oe_runmake,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 207
> |     #4: do_compile,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 202
> |     #5: main,
> /var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140,
>
> line 241
> |
> | Backtrace (metadata-relative locations):
> |     #1: bbfatal_log,
> /var/home/dingo/overc/poky/meta/classes/logging.bbclass, line 72
> |     #2: die, /var/home/dingo/overc/poky/meta/classes/base.bbclass, line
> 56
> |     #3: oe_runmake,
> /var/home/dingo/overc/poky/meta/classes/base.bbclass, line 65
> |     #4: do_compile,
> /var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/containerd.inc,
>
> line 70
> ERROR: Task
>
> (/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/containerd-opencontainers_git.bb:do_compile)
>
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 7546 tasks of which 8 didn't need to be
> rerun and 1 failed.
>
> Summary: 1 task failed:
>
> /var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/containerd-opencontainers_git.bb:
> do_compile
> Summary: There were 4 WARNING messages shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000050076705b1adc05e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Ind=
eed.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">x86-64 containerd 1.=
4.x is broken.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m pu=
tting together=C2=A0a fix, or will revert the upgrade.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 14, 2020 at 10:08 PM Y=
octo &lt;<a href=3D"mailto:yocto@optimcloud.com">yocto@optimcloud.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Build =
Configuration:<br>
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 &quot;1.47.0&quot;<br>
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;fedora-32&quot;<br=
>
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 &quot;x86_64-overc-linux&quot;<br>
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;intel-corei7-64&quot;<br>
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D &quot;overc&quot;<br>
DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.0&quot;<br>
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;m64 core=
i7&quot;<br>
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 &quot;&quot;<br>
meta<br>
meta-poky<br>
meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:ad30a6=
d470eca0f5be5c037ba37fad72e55a128c&quot;<br>
meta-oe<br>
meta-python<br>
meta-networking<br>
meta-filesystems<br>
meta-multimedia<br>
meta-perl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;master:2258c9a767391e4529665cd6508e4b32bd18d130&quot;<br>
meta-overc<br>
meta-cube=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;master:264d1d0949fb5e9ec8e39b1f7604086d59ec2047&quot;<br>
meta-intel=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 &quot;master:4abd867159f2ea0cd560c34c574a6fe3dd252691&quot;<br>
meta-virtualization=C2=A0 =3D &quot;master:1d861978463fdc247a7a57464b8349d=
ebba51912&quot;<br>
meta-cloud-services=C2=A0 =3D &quot;master:910195eb791d754d394ba1013a258ab=
120c995e9&quot;<br>
meta-security=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:3=
ce8b759c97706d6f78928c38b6ebac4edfd95a5&quot;<br>
meta-selinux=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;mas=
ter:6e1100d29aec118df2025c46c77f4c8aa8da4e76&quot;<br>
meta-gnome<br>
meta-xfce=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;master:2258c9a767391e4529665cd6508e4b32bd18d130&quot;<br>
meta-awnix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 &quot;master:c616414c6ed4f6f2ab75703ce5a3e84acacd3c47&quot;<br>
workspace=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;master:32f1010ad0d36b886ecde57290061558fc22929a&quot;<br>
<br>
Initialising tasks: 100% <br>
|#########################################################################=
#############################################| <br>
Time: 0:00:11<br>
Sstate summary: Wanted 4286 Found 0 Missed 4286 Current 0 (0% match, 0% <b=
r>
complete)<br>
NOTE: Executing Tasks<br>
ERROR: containerd-opencontainers-v1.4.1+gitAUTOINC+e44e8ebeaa-r0 <br>
do_compile: oe_runmake failed<br>
ERROR: containerd-opencontainers-v1.4.1+gitAUTOINC+e44e8ebeaa-r0 <br>
do_compile: Execution of <br>
&#39;/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd=
-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140=
&#39; <br>
failed with exit code 1:<br>
+ bin/ctr<br>
+ bin/containerd<br>
+ bin/containerd-stress<br>
+ bin/containerd-shim<br>
+ bin/containerd-shim-runc-v1<br>
+ bin/containerd-shim-runc-v2<br>
# <br>
_/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-ope=
ncontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-s=
him<br>
cannot find package runtime/cgo (using -importcfg)<br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x8=
6_64-overc-linux/go/pkg/tool/linux_amd64/link: <br>
cannot open file : open : no such file or directory<br>
make: *** [Makefile:201: bin/containerd-shim] Error 2<br>
make: *** Waiting for unfinished jobs....<br>
WARNING: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237 =
<br>
exit 1 from &#39;exit 1&#39;<br>
WARNING: Backtrace (BB generated script):<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #1: bbfatal_log, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 237<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #2: die, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 212<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #3: oe_runmake, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 207<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #4: do_compile, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 202<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #5: main, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 241<br>
<br>
Backtrace (metadata-relative locations):<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #1: bbfatal_log, <br>
/var/home/dingo/overc/poky/meta/classes/logging.bbclass, line 72<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #2: die, /var/home/dingo/overc/poky/meta/classes/=
base.bbclass, line 56<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #3: oe_runmake, <br>
/var/home/dingo/overc/poky/meta/classes/base.bbclass, line 65<br>
=C2=A0=C2=A0=C2=A0=C2=A0 #4: do_compile, <br>
/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/co=
ntainerd.inc, <br>
line 70<br>
ERROR: Logfile of failure stored in: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/log.do_compile.3449140<br>
Log data follows:<br>
| DEBUG: Executing shell function do_compile<br>
| NOTE: make -j 16 GODEBUG=3D1 binaries<br>
| + bin/ctr<br>
| + bin/containerd<br>
| + bin/containerd-stress<br>
| + bin/containerd-shim<br>
| + bin/containerd-shim-runc-v1<br>
| + bin/containerd-shim-runc-v2<br>
| # <br>
_/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-ope=
ncontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-s=
him<br>
| cannot find package runtime/cgo (using -importcfg)<br>
| <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x8=
6_64-overc-linux/go/pkg/tool/linux_amd64/link: <br>
cannot open file : open : no such file or directory<br>
| make: *** [Makefile:201: bin/containerd-shim] Error 2<br>
| make: *** Waiting for unfinished jobs....<br>
| ERROR: oe_runmake failed<br>
| WARNING: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237 =
<br>
exit 1 from &#39;exit 1&#39;<br>
| WARNING: Backtrace (BB generated script):<br>
| =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 237<br>
| =C2=A0=C2=A0=C2=A0 #2: die, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 212<br>
| =C2=A0=C2=A0=C2=A0 #3: oe_runmake, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 207<br>
| =C2=A0=C2=A0=C2=A0 #4: do_compile, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 202<br>
| =C2=A0=C2=A0=C2=A0 #5: main, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 241<br>
| ERROR: Execution of <br>
&#39;/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd=
-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140=
&#39; <br>
failed with exit code 1:<br>
| + bin/ctr<br>
| + bin/containerd<br>
| + bin/containerd-stress<br>
| + bin/containerd-shim<br>
| + bin/containerd-shim-runc-v1<br>
| + bin/containerd-shim-runc-v2<br>
| # <br>
_/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-ope=
ncontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-s=
him<br>
| cannot find package runtime/cgo (using -importcfg)<br>
| <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x8=
6_64-overc-linux/go/pkg/tool/linux_amd64/link: <br>
cannot open file : open : no such file or directory<br>
| make: *** [Makefile:201: bin/containerd-shim] Error 2<br>
| make: *** Waiting for unfinished jobs....<br>
| WARNING: <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237 =
<br>
exit 1 from &#39;exit 1&#39;<br>
| WARNING: Backtrace (BB generated script):<br>
| =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 237<br>
| =C2=A0=C2=A0=C2=A0 #2: die, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 212<br>
| =C2=A0=C2=A0=C2=A0 #3: oe_runmake, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 207<br>
| =C2=A0=C2=A0=C2=A0 #4: do_compile, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 202<br>
| =C2=A0=C2=A0=C2=A0 #5: main, <br>
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-open=
containers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, <br=
>
line 241<br>
|<br>
| Backtrace (metadata-relative locations):<br>
| =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, <br>
/var/home/dingo/overc/poky/meta/classes/logging.bbclass, line 72<br>
| =C2=A0=C2=A0=C2=A0 #2: die, /var/home/dingo/overc/poky/meta/classes/base=
.bbclass, line 56<br>
| =C2=A0=C2=A0=C2=A0 #3: oe_runmake, <br>
/var/home/dingo/overc/poky/meta/classes/base.bbclass, line 65<br>
| =C2=A0=C2=A0=C2=A0 #4: do_compile, <br>
/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/co=
ntainerd.inc, <br>
line 70<br>
ERROR: Task <br>
(/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/c=
ontainerd-opencontainers_git.bb:do_compile) <br>
failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 7546 tasks of which 8 didn&#39;t need to be=
 <br>
rerun and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/co=
ntainerd-opencontainers_git.bb:do_compile<br>
Summary: There were 4 WARNING messages shown.<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code=
.<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--00000000000050076705b1adc05e--
