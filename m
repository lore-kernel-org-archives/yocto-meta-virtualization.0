Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.20630.1593608030496151329
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jul 2020 05:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kRIp4vxm;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CE2DE01DC8; Wed,  1 Jul 2020 05:53:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5604AE01D86
	for <meta-virtualization@yoctoproject.org>; Wed,  1 Jul 2020 05:53:47 -0700 (PDT)
Received: by mail-ed1-f65.google.com with SMTP id h28so19607060edz.0
        for <meta-virtualization@yoctoproject.org>; Wed, 01 Jul 2020 05:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wFUuHOiM8CU5dZrH7yPYro/kop+h/EvgIx5GGj0ABHA=;
        b=kRIp4vxmWv4VttX9kWBdwZFoeJ1PawdtRTSbPIz2GKSGR2NT9kXqS1kWNZ82M3m3av
         /fvMA5J29O5E58t4A1ueWrvsZJWDLKTuS3oVFAEaPDkPJPxeskBG3g51qWnGR/a2Zav6
         9IzrV/w2GgxhRHVQqdf+rJ5Nf4tg2kWUPSMapmp8Axw5YbFq6K49uufDid18JH9Ka3cd
         ECvTxx1RAB0whBB0ZgOmjIjp8tkrQsNza6Igr2+kw7AOpIqhAq4xGTfBJiA9dfnXMgwj
         3JAbJoOVWVG3EdYGTUDLhLLWpyAg2Mdhvjf/a5wKKvLIul9R+GYWIlb98lxTIa2Jypyt
         s3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wFUuHOiM8CU5dZrH7yPYro/kop+h/EvgIx5GGj0ABHA=;
        b=ttciggmVxh7WcJ+Dqe3EiCUfsrvisGmUHdTQ8qqIowNtFSO4l1m8AW3t3lLV74fXva
         A2ymwcQcRr9OS3xfAkUO1I77pXNwt3WUFE4g7B9p9z/cgZmfE8u2bnkRBSquCESGk/lG
         TFQygZRUi+kBQOsPiT1ZmtBzfYd5teM96IXpb2tLPoBr/a+YZCP5wxBcwM8biufcSnrH
         vWDAQEegLojGeU0sF8ERFztG4h+gsODcQHBDEie5/wCDD90Ra+w+eGIdeJexk6msGTPT
         hYBpYmFsjdZgoDDc2IuVLMR7LiYugJKlKOzBBpGquCVTib3eM5YOlmKrRtaVfKqaF8Gq
         +zuw==
X-Gm-Message-State: AOAM530K4hZQNLjbeWRGSttOXcbt5KqHWIeGciXzAU1xpzY44Ycbf2k1
	9G/m8HmQS4X9gONCgrMBehXf9PgYmg7EUVicTlA=
X-Google-Smtp-Source: ABdhPJzmiJjKAtd7MlRZDChCFRqvCWPgbER5wNrBwxaMCLMBqRMm+wpIqj17fAQG4rXrajHRuYUbR0h5qWUO/xnTrQI=
X-Received: by 2002:a50:e04e:: with SMTP id g14mr24046197edl.352.1593608026131;
 Wed, 01 Jul 2020 05:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200630015454.10151-1-christopher.w.clark@gmail.com>
 <EB4F91E7-AEB9-428E-9483-A43192462ED8@arm.com> <CACMJ4GYg8yGgbDUgx5arnxuMqEbO2VvzE-sD_a9o6bf2H0LNDg@mail.gmail.com>
 <24C8EAE3-DF44-43D4-88EE-19472B3B0F84@arm.com>
In-Reply-To: <24C8EAE3-DF44-43D4-88EE-19472B3B0F84@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 1 Jul 2020 08:53:34 -0400
Message-ID: <CADkTA4P0C-UpMB6vT=dMwTamB7qb6Q6YP-JJNAOy0Ev_DhGxrg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 00/11] Xen on Raspberry Pi 4
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	"meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>, 
	Corey Minyard <cminyard@mvista.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2020 at 6:04 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Christopher,
>
> > On 1 Jul 2020, at 06:52, Christopher Clark <christopher.w.clark@gmail.=
com> wrote:
> >
> > On Tue, Jun 30, 2020 at 1:13 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> HI
> >>
> >>> On 30 Jun 2020, at 02:54, Christopher Clark via lists.yoctoproject.o=
rg <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
> >>>
> >>> This series introduces support for running Xen on the Raspberry Pi 4
> >>> board, with meta-virtualization and meta-raspberrypi, using the
> >>> linux-raspberrypi kernel at version 5.4 which is the current
> >>> linux-yocto kernel version supported in this layer.
> >>>
> >>> It introduces use of dynamic layers to handle configuration that is
> >>> both Xen and Raspberry Pi specific, and inclusion of Xen-specific
> >>> configuration when the 'xen' DISTRO_FEATURE is enabled to simplify
> >>> Xen image builds.
> >>>
> >>> It applies a backported set of Xen-specific Linux kernel patches,
> >>> developed by upstream Xen developers working with the Linux Foundati=
on
> >>> Eve Project, that are currently being iterated on for inclusion in t=
he
> >>> Linux kernel.
> >>>
> >>> Xen is uprev'd to version 4.13; this is currently compile-and-boot-t=
ested
> >>> only on this RPi4 board.
> >>
> >>
> >> Could you give a sumup of what was changed in v2 ?
> >> That=E2=80=99s a big serie and reviewing it would be easier with some=
 infos on what has been changed.
> >
> > Hi Bertrand,
> >
> > Thanks for your interest. I think your reply just clipped the start of
> > my message that contained the summary of the changes in v2? The text
> > was:
> >
> > Changes since v1:
> > - rebased on to current meta-virtualization, meta-openembedded, poky
> > - updated Xen revision to the tip of stable 4.13
> > - fixed Xen build on ARM64 with gcc 10.1.0
> > - added upstream debugger patch to fix compiler warning
> >
> > ie. The most notable change is that this series applies and build to
> > completion with much more up to date poky and meta-openembedded repos.
> > The last patch in the series is necessary to enable that: it adds a
> > new implementation of an atomic primitive to Xen for the spinlock
> > implementation on ARM64, replacing use of a builtin which the newer
> > compiler does not make available for the current Xen build, possibly
> > since -fno-builtin is presented as a compiler option.
> > I've also pulled the Xen revision closer to the tip of stable 4.13
> > branch and applied handling for warnings that the new gcc version
> > reports.
> >
>
> Thanks, this is a very interesting serie which could define how boards s=
pecific support could be handled.
>
> I am not quite sure if the dynamic layer should be in meta-virtualizatio=
n and activate if meta-rpi4 is there or in meta-rpi4 activated if meta-virt=
ualization is there.
>
> @Bruce: Do you think it is ok to start defining dynamic layers this way =
in meta-virtualization ?

Yes, this is the way we decided to do it in previous discussions.

We'd (for now) rather have the full stack in one place, versus having
it spread across multiple repos.  The test matrix starts to get very
difficult if we have things spread about, and with this out statement
of what has been tested is very clear.

I'll be testing it and so will Christopher.

If the model breaks, we'll of course revisit it and adjust as necessary :D

Bruce

>
> I would see a risk of them not being maintained or tested.
>
> Bertrand
>
>
> > Christopher
> >
> >>
> >> Thanks
> >> Bertrand
> >>
> >>>
> >>> Christopher
> >>>
> >>> Christopher Clark (11):
> >>> xen: apply layer settings when xen DISTRO_FEATURE is enabled
> >>> xen-tools: add RRECOMENDS qemu on ARM and x86 when HVM is enabled
> >>> xen-tools: use non-busybox ifupdown tool if available
> >>> xen, xen-tools: update revision to Xen 4.13
> >>> meta-virt-xen.inc: add Raspberry Pi settings
> >>> xen, raspberry pi: add dynamic-layer for Xen configuration for Rpi4
> >>> xen, raspberry pi 4: provide a default defconfig for raspberrypi4
> >>> xen, linux-raspberrypi: add Linux kernel 5.4 patches for Xen support
> >>> xen, raspberry pi: add Xen-specific SD card class
> >>> linux-raspberrypi: prefer kernel version 5.4
> >>> xen: add patch to fix build on ARM64 with gcc 10.1.0
> >>>
> >>> classes/meta-virt-xen-cfg.bbclass             |   6 +
> >>> classes/sdcard_image-rpi-xen.bbclass          | 120 ++++
> >>> conf/distro/include/meta-virt-xen.inc         |  19 +
> >>> conf/layer.conf                               |  19 +-
> >>> .../bootfiles/rpi-config_git.bbappend         |   6 +
> >>> .../rpi-u-boot-scr/files/boot.cmd.xen.in      |  49 ++
> >>> .../rpi-u-boot-scr/rpi-u-boot-scr.bbappend    |  17 +
> >>> .../xen/files/defconfig_raspberrypi4-64       | 117 ++++
> >>> .../recipes-extended/xen/xen_git.bbappend     |  11 +
> >>> ...vmalloc_to_page-on-vmalloc-virt-addr.patch |  44 ++
> >>> ...02-swiotlb-xen-remove-start_dma_addr.patch |  47 ++
> >>> ...struct-device-parameter-to-xen_phys_.patch |  78 +++
> >>> ...struct-device-parameter-to-xen_bus_t.patch |  66 +++
> >>> ...struct-device-parameter-to-is_xen_sw.patch |  57 ++
> >>> ...oduce-phys_to_dma-dma_to_phys-transl.patch |  88 +++
> >>> ...translations-in-xen_dma_s_kernel_5.4.patch |  68 +++
> >>> ..._to_phys-on-the-dma_addr_t-parameter.patch |  75 +++
> >>> .../0011-adding-page-coherent-patch.patch     |  39 ++
> >>> .../linux/linux-raspberrypi_%.bbappend        |   5 +
> >>> .../linux/linux-raspberrypi_5.4.bbappend      |  19 +
> >>> ...xen-build-temporarily-inhibit-Werror.patch |  18 +-
> >>> ...xen-arm64-implement-atomic-fetch-add.patch |  50 ++
> >>> ...g-0-arrays-to-access-packet-contents.patch |  60 ++
> >>> .../files/xen-tools-libxl-gentypes-py3.patch  | 140 -----
> >>> ...tools-pygrub-change-tabs-into-spaces.patch |  40 --
> >>> ...-python-scripts-work-with-2.6-and-up.patch | 529 ----------------=
--
> >>> .../xen/files/xen-tools-pygrub-py3.patch      | 233 --------
> >>> ...ls-python-fix-Wsign-compare-warnings.patch | 136 -----
> >>> ...n-tools-update-python-scripts-to-py3.patch | 140 -----
> >>> recipes-extended/xen/xen-tools.inc            |  16 +
> >>> recipes-extended/xen/xen-tools_git.bb         |  13 +-
> >>> recipes-extended/xen/xen_git.bb               |  11 +-
> >>> 32 files changed, 1102 insertions(+), 1234 deletions(-)
> >>> create mode 100644 classes/meta-virt-xen-cfg.bbclass
> >>> create mode 100644 classes/sdcard_image-rpi-xen.bbclass
> >>> create mode 100644 conf/distro/include/meta-virt-xen.inc
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/bootfiles/=
rpi-config_git.bbappend
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot=
-scr/files/boot.cmd.xen.in
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-bsp/rpi-u-boot=
-scr/rpi-u-boot-scr.bbappend
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/f=
iles/defconfig_raspberrypi4-64
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-extended/xen/x=
en_git.bbappend
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0001-swiotlb-xen-use-vmalloc_to_page-on-vmalloc-virt-addr.patch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0002-swiotlb-xen-remove-start_dma_addr.patch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0003-swiotlb-xen-add-struct-device-parameter-to-xen_phys_.patch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0004-swiotlb-xen-add-struct-device-parameter-to-xen_bus_t.patch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0007-swiotlb-xen-add-struct-device-parameter-to-is_xen_sw.patch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0008-swiotlb-xen-introduce-phys_to_dma-dma_to_phys-transl.patch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0009-xen-arm-introduce-phys-dma-translations-in-xen_dma_s_kernel_5.4.p=
atch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0010-xen-arm-call-dma_to_phys-on-the-dma_addr_t-parameter.patch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/f=
iles/0011-adding-page-coherent-patch.patch
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/l=
inux-raspberrypi_%.bbappend
> >>> create mode 100644 dynamic-layers/raspberrypi/recipes-kernel/linux/l=
inux-raspberrypi_5.4.bbappend
> >>> create mode 100644 recipes-extended/xen/files/xen-arm64-implement-at=
omic-fetch-add.patch
> >>> create mode 100644 recipes-extended/xen/files/xen-tools-kdd-stop-usi=
ng-0-arrays-to-access-packet-contents.patch
> >>> delete mode 100644 recipes-extended/xen/files/xen-tools-libxl-gentyp=
es-py3.patch
> >>> delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-chang=
e-tabs-into-spaces.patch
> >>> delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-make-=
python-scripts-work-with-2.6-and-up.patch
> >>> delete mode 100644 recipes-extended/xen/files/xen-tools-pygrub-py3.p=
atch
> >>> delete mode 100644 recipes-extended/xen/files/xen-tools-python-fix-W=
sign-compare-warnings.patch
> >>> delete mode 100644 recipes-extended/xen/files/xen-tools-update-pytho=
n-scripts-to-py3.patch
> >>>
> >>> --
> >>> 2.17.1
> >>>
> >>>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
