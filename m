Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.12601.1619619140144653512
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Apr 2021 07:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eaVCpMi/;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id s15so74450467edd.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Apr 2021 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OT9VsOtHVn4U4bmF3aqLVogPOW4y9JamSVAe/CIBnco=;
        b=eaVCpMi/REf/1h+rDfBVsa0MiIruGUeNNdEtGk1JiM4hlPuF9hRSVTC08j5H2q4NNm
         PoOqBdIg+G91rD/bWAH+fJP2cgYWMBZJ0kXWhP2RYmYoss5IxOuFCihY8E+olPEtRLF+
         oNeDwXACV1IRJRLuqol/07arKre32pUA5WESVox9KcBiYwWuP7vKsAmzu9+G+6mbZBHJ
         cn2ElRbkVSM6+Ci0I006F5gzQSjGayykJ6Oe0q0j54bgTxAyhojsLn9wpTxYMNIaAmyM
         LZl5OmU6sEFf/fSwyYCp47DKaiFRGY1iJM00cxMyjrjENnJ9OM4A+PdndzdWSeXH46zr
         csvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OT9VsOtHVn4U4bmF3aqLVogPOW4y9JamSVAe/CIBnco=;
        b=Ta8WN1IrLeH38Bs0++GfCYunRRM/kY+bujwcyjJ+e8NLCnJnXtqlgtOAWOnTxQNjO3
         ViP22GasoWMkIXDc6lten548IZQz9DmoGKsOGAAyWq+OfwlFCxN0HdSYcaPJJIzYuSqp
         zrYLzixF//Ql8YdBmzjuKhdB1sZZoVsjCRi9e0eq6gUhnUBTB/8G3Q/bAz3R1rmDAocw
         3qAMzoPXPForZKtV46v4g1lpLjmbwjtVULy8D+EhN10m4sI0djQexaykxa2aHULnBpUB
         sLoM+bgnQ0yWrcyFc3GIVdi2Tc4OqWZPUdi+P7F0tqDbLS0Js9tH9HN3pZ7oJOUQTBSb
         t+KA==
X-Gm-Message-State: AOAM530OMxmgKio7TKGu5wt32uUyPxqMXsgLgov4FLvDCbiV6MyF+OZi
	ESs/zyrFdqz24O19Tee67ezlpgUPDoO//je3t4M=
X-Google-Smtp-Source: ABdhPJypt8S7FsFjjJbEOrzQvCtvjf3RZNXejdXPUz1VZH1JuBu7cZlVvnyegqfFHUsiKKl02LcR+YUt5tZFyQgafK0=
X-Received: by 2002:aa7:d54c:: with SMTP id u12mr12116295edr.234.1619619138565;
 Wed, 28 Apr 2021 07:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR11MB42022546C341761BE3193E74FF419@DM6PR11MB4202.namprd11.prod.outlook.com>
 <CADkTA4Otjn5uujw4Am89nsxPjAroTHVFUw1X-Ai73wq6YZeMYQ@mail.gmail.com> <DM6PR11MB420281956331ED9A9C71E07FFF409@DM6PR11MB4202.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB420281956331ED9A9C71E07FFF409@DM6PR11MB4202.namprd11.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 28 Apr 2021 10:12:07 -0400
Message-ID: <CADkTA4M7BQZHh9qxKGbvbM8D6-QuU1ZBZroAaYEMJEWjoGiWhQ@mail.gmail.com>
Subject: Re: Help on openvswitch
To: "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 11:41 PM Zhang, Qiang <Qiang.Zhang@windriver.com> w=
rote:
>
>
>
> ________________________________________
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Bruce Ashfield <bruce.ashfield@gmail.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2021=E5=B9=B44=E6=9C=8828=E6=97=A5 =
10:41
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Zhang, Qiang
> =E6=8A=84=E9=80=81: meta-virtualization@lists.yoctoproject.org
> =E4=B8=BB=E9=A2=98: Re: Help on openvswitch
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Tue, Apr 27, 2021 at 2:54 AM Zhang, Qiang <Qiang.Zhang@windriver.com> =
wrote:
> >
> > Hello Bruce
> >
> > when openvswitch enable DPDK, the do_configure will trigger follow erro=
r:
> >
> > checking whether dpdk is enabled... yes
> > | checking for rte_config.h... yes
> > | checking whether RTE_LIBRTE_VHOST_NUMA is declared... no
> > | checking whether RTE_EAL_NUMA_AWARE_HUGEPAGES is declared... no
> > | checking whether RTE_LIBRTE_PMD_PCAP is declared... no
> > | checking whether RTE_LIBRTE_PMD_AF_XDP is declared... no
> > | checking whether RTE_LIBRTE_VHOST_NUMA is declared... (cached) no
> > | checking whether RTE_LIBRTE_MLX5_PMD is declared... no
> > | checking whether RTE_LIBRTE_MLX4_PMD is declared... no
> > | checking for library containing dlopen... -ldl
> > | checking whether linking with dpdk works... no
> > | configure: error: Could not find DPDK library in default search path,=
 update PKG_CONFIG_PATH for pkg-config to find the .pc file in non-standard=
 location
> > | WARNING: exit code 1 from a shell command.
> >
> > I didn't find out why,  have you repeated the question?
> >
>
> >I have seen this with other packages in the past, but can't >find the
> >references to specific fixes now.
> >
> >Have you looked to see if dpdk is in fact producing a .pc file >? We
> >kind of overload package config in OE where it is a general >set of
> >options for recipes, and also the actual pkg-config >application (that
> >needs those .pc files).
> >
> >A quick check shows that openvswitch isn't inheriting the >pkgconfig
> >bbclass, which means our pkg-config-native isn't in the >dependency
> >chain.
>
> Hello Bruce
>
> The 2.15 openvswitch parameter  --with-dpdk=3D must be 'static' or 'share=
d'.   before  parameter --with-dpdk=3D be set a path.
>
>  I made the following changes
>
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -1,6 +1,6 @@
>  require openvswitch.inc
>
> -DEPENDS +=3D "virtual/kernel"
> +DEPENDS +=3D "virtual/kernel pkgconfig-native"
>
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>
> @@ -35,7 +35,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ce5d23a6429=
dff345518758f13aaeab"
>  DPDK_INSTALL_DIR ?=3D "/opt/dpdk"
>
>  PACKAGECONFIG ?=3D "libcap-ng"
> -PACKAGECONFIG[dpdk] =3D "--with-dpdk=3D${STAGING_DIR_TARGET}${DPDK_INSTA=
LL_DIR}/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,dpdk"
> +PACKAGECONFIG[dpdk] =3D "--with-dpdk=3Dstatic,,dpdk,dpdk"
>  PACKAGECONFIG[libcap-ng] =3D "--enable-libcapng,--disable-libcapng,libca=
p-ng,"
>  PACKAGECONFIG[ssl] =3D ",--disable-ssl,openssl,"
>
>  The following error will be generated :
>
> checking for struct tcf_t.firstuse... yes
> | checking whether dpdk is enabled... yes
> | checking for DPDK... no
> | configure: error: Package requirements (libdpdk) were not met:
> |
> | No package 'libdpdk' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables DPDK_CFLAGS
> | and DPDK_LIBS to avoid the need to call pkg-config.

Let me try and summarize,

DPDK has replaced a flag that used to point to the binary with a
static/non-static flag and is using pkg-config to locate the binary.

If the yocto dpdk package isn't producing a valid set of .pc files
that pkg-config is looking for, then it won't find them and that
doesn't help us.

So we need to see if the dpdk package is producing them, and if so,
why aren't they in the right place.

If we don't want to go that route, did you try setting the DPDK_CFLAGS
and DPDK_LIBS to the path to where the libraries have been installed
in the package sysroot ?

Bruce

> | See the pkg-config man page for more details.
> | WARNING: exit code 1 from a shell command.
>
> Qiang
>
> >I'd start there.
> >
> >Bruce
>
> > Thanks
> > Qiang
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
