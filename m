Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web09.1521.1583281638272313680
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 16:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jnKBZz9Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id g19so80659eds.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 16:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/TRXTKfB+Xcli79XykqVcrWTmgIceeyUK7WBx9bR8DA=;
        b=jnKBZz9Y/yGeSrJdX8yejsGkJgoZhfwaEjz8fiskiQoxtmVWd8mlD68Q5MAg8wRZDV
         sAtnXq9FkalelWS9lMHCkJEDsO6aEjaCRIV/NUuI2DZi7BDItOhaRQdzHQZG/HikXD+5
         3KtBseeozpl/C5/gB9Jt6WxAv6SF0KpK2Ima90biprdN8jfGiVWPIh579kO1PdPDJJGC
         sZvPCRsHjV26H/53i2S9J4B1qDr96oIrfjejdByttZ6+lousj667lxkw11QcFGl1BoT6
         wmJKjKR6dtA3lK9kvnMb6jKyZ04QQ27Wz6V2iDRGjfMgdxgxmhOJf9hZIROpNJ7LPBRs
         b16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/TRXTKfB+Xcli79XykqVcrWTmgIceeyUK7WBx9bR8DA=;
        b=jrdSBuuDdg/chnCjEZBPt68X+HeYE0mFjJyd75kKuiKZfjq1FAVOUXnS7FyNAF9nM6
         lrS3meyuxng54keQam7L4XoT9n1ZW9Tg7VUf839iNlxPnuLbPJ2nALiOUDa+loZjLeJK
         laJWn/hnhEC4L4QAuBo0/xes9tQXjO/Qs6o5vPbNENA1zL0gsZVUv+YF/Gyu1WpvWVhH
         Rbzb50As911NjGUvlvmvr3ZQaWrBZJn5X0YilGT1WVVmA4jse3eTSZ12LUzoGUzyNy+I
         UHucrpqUsczOnkBPlqnjcu4yk0wYsDdvLAK5FIuWg2/1dp15R3CmTt/+7fsIB9dkpKaz
         avnA==
X-Gm-Message-State: ANhLgQ2amKa0yhHsUP81MG2z8NoIDlEp5hGpW0wrzK4CsYuBjO2Btnea
	dW9H/ySTgIAE+Pdj8VlcYif0Fo+BGDglwj842Ak=
X-Google-Smtp-Source: ADFU+vtNB9fvwsIGR2sCBxlpUwcfGGGOf5tQhKi1YBwXCXv8f2z3A5tDHjIIQQmDjwRalqEu0Lgs8BJ4/u3nYWwHoco=
X-Received: by 2002:a50:ed8f:: with SMTP id h15mr332252edr.352.1583281636721;
 Tue, 03 Mar 2020 16:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20200203215011.6642-1-alistair.francis@wdc.com>
 <20200203215011.6642-2-alistair.francis@wdc.com> <20200211210433.GA36395@gmail.com>
 <CAKmqyKMqyD7cpVFy1rGdgKKX47g=6v8CevbMVT8SZR=sO5q27Q@mail.gmail.com>
In-Reply-To: <CAKmqyKMqyD7cpVFy1rGdgKKX47g=6v8CevbMVT8SZR=sO5q27Q@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 3 Mar 2020 19:27:05 -0500
Message-ID: <CADkTA4Oq+b==AYoBsusLT14dV02Fsg1ETN2EFrw1PowcNxEGuQ@mail.gmail.com>
Subject: Re: [PATCH] xvisor: Initial commit of Xvisor Hypervisor
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2020 at 12:54 PM Alistair Francis <alistair23@gmail.com> wro=
te:
>
> On Tue, Feb 11, 2020 at 1:04 PM Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
> >
> > In message: [PATCH] xvisor: Initial commit of Xvisor Hypervisor
> > on 03/02/2020 Alistair Francis wrote:
> >
> > > This commit adds support for building the baremetal Xvisor Hypervisor=
.
> > >
> > > I have only tested this with RISC-V so currently only RISC-V is marke=
d
> > > as a COMPATIBLE_HOST, although Xvisor does support multiple other
> > > architectures.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  ...n-t-specify-mabi-or-march-for-RISC-V.patch | 34 ++++++++++++++
> > >  recipes-extended/xvisor/xvisor-configs.inc    | 25 +++++++++++
> > >  recipes-extended/xvisor/xvisor_0.3.0.bb       | 44 +++++++++++++++++=
++
> > >  3 files changed, 103 insertions(+)
> > >  create mode 100644 recipes-extended/xvisor/files/0001-TESTS-Don-t-sp=
ecify-mabi-or-march-for-RISC-V.patch
> > >  create mode 100644 recipes-extended/xvisor/xvisor-configs.inc
> > >  create mode 100644 recipes-extended/xvisor/xvisor_0.3.0.bb
> > >
> > > diff --git a/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-m=
abi-or-march-for-RISC-V.patch b/recipes-extended/xvisor/files/0001-TESTS-Do=
n-t-specify-mabi-or-march-for-RISC-V.patch
> > > new file mode 100644
> > > index 0000000..2e53943
> > > --- /dev/null
> > > +++ b/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-=
march-for-RISC-V.patch
> > > @@ -0,0 +1,34 @@
> > > +From 022c885d077dce6fad3eca5fd2f54b2070c375d2 Mon Sep 17 00:00:00 20=
01
> > > +From: Alistair Francis <alistair.francis@wdc.com>
> > > +Date: Fri, 17 May 2019 14:21:44 -0700
> > > +Subject: [PATCH] TESTS: Don't specify mabi or march for RISC-V
> > > +
> > > +To avoid
> > > +    can't link double-float modules with soft-float modules
> > > +errors when building 32-bit baremetal guests don't specify mabi
> > > +or march.
> > > +
> > > +Upstream-Status: Inappropriate [Fixes a 32-bit Yocto flow bug]
> > > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > +---
> > > + tests/riscv/common/basic/Makefile.inc | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/tests/riscv/common/basic/Makefile.inc b/tests/riscv/com=
mon/basic/Makefile.inc
> > > +index 9fa5abed..f3ff1864 100644
> > > +--- a/tests/riscv/common/basic/Makefile.inc
> > > ++++ b/tests/riscv/common/basic/Makefile.inc
> > > +@@ -24,8 +24,8 @@
> > > + ARCH_CPPFLAGS=3D$(board_cppflags) -DFIRMWARE_BOOT
> > > + ARCH_CPPFLAGS+=3D-DTEXT_START=3D$(board_text_start)
> > > + ifeq ($(board_32bit),y)
> > > +-ARCH_CFLAGS=3D$(board_cflags) -fno-omit-frame-pointer -fno-optimize=
-sibling-calls -mno-save-restore -mstrict-align -mabi=3Dilp32 -march=3Drv32=
imafdc -mcmodel=3Dmedany
> > > +-ARCH_ASFLAGS=3D$(board_asflags) -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -mno-save-restore -mstrict-align -mabi=3Dilp32 -march=3Drv=
32imafdc -mcmodel=3Dmedany
> > > ++ARCH_CFLAGS=3D$(board_cflags) -fno-omit-frame-pointer -fno-optimize=
-sibling-calls -mno-save-restore -mstrict-align -mcmodel=3Dmedany
> > > ++ARCH_ASFLAGS=3D$(board_asflags) -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -mno-save-restore -mstrict-align -mcmodel=3Dmedany
> > > + else
> > > + ARCH_CFLAGS=3D$(board_cflags) -fno-omit-frame-pointer -fno-optimize=
-sibling-calls -mno-save-restore -mstrict-align -mabi=3Dlp64 -march=3Drv64i=
mafdc -mcmodel=3Dmedany
> > > + ARCH_ASFLAGS=3D$(board_asflags) -fno-omit-frame-pointer -fno-optimi=
ze-sibling-calls -mno-save-restore -mstrict-align -mabi=3Dlp64 -march=3Drv6=
4imafdc -mcmodel=3Dmedany
> > > +--
> > > +2.21.0
> > > +
> > > diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-ext=
ended/xvisor/xvisor-configs.inc
> > > new file mode 100644
> > > index 0000000..099128d
> > > --- /dev/null
> > > +++ b/recipes-extended/xvisor/xvisor-configs.inc
> > > @@ -0,0 +1,25 @@
> > > +def get_oemake_config(d):
> > > +    plat =3D d.getVar('XVISOR_PLAT')
> > > +
> > > +    if plat is None:
> > > +        return ""
> > > +
> > > +    if 'riscv/virt32' in plat:
> > > +        return "generic-32b-defconfig"
> > > +    if 'riscv/virt64' in plat:
> > > +        return "generic-64b-defconfig"
> > > +
> > > +    return ""
> > > +
> > > +def map_xvisor_arch(a, d):
> > > +    import re
> > > +
> > > +    if   re.match('(i.86|x86.64)$', a):  return 'x86'
> > > +    elif re.match('armeb$', a):                 return 'arm'
> > > +    elif re.match('aarch64$', a):               return 'arm'
> > > +    elif re.match('aarch64_be$', a):            return 'arm'
> > > +    elif re.match('aarch64_ilp32$', a):         return 'arm'
> > > +    elif re.match('aarch64_be_ilp32$', a):      return 'arm'
> > > +    elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
> > > +    else:
> > > +        bb.error("cannot map '%s' to a Xvisor architecture" % a)
> >
> > This all looks fine to me (for the 1st revision), I did wonder if the
> > mappings are any different than the kernel mappings (but didn't check) =
..
> > and if so, we could avoid the code to map the arch.
>
> They are similar but not the same, for example Xvisor uses "arm" for
> ARMv7 and AArch64.

cool.

>
> >
> > It would also be nice to eventually have a README or some other test
> > information captured in the layer, that way people can have an idea
> > about why they'd want to use this, some expected behaviour and how
> > they can boot it.
>
> Where do you think this should go?

there's a little used "docs" directory at the root of the layer, I
have plans to gather more things like this in that directory.

I'm writing up similar information for microk8s and k3s as I work on them.

Bruce

>
> Alistair
>
> >
> > Bruce
> >
> > > diff --git a/recipes-extended/xvisor/xvisor_0.3.0.bb b/recipes-extend=
ed/xvisor/xvisor_0.3.0.bb
> > > new file mode 100644
> > > index 0000000..66ad618
> > > --- /dev/null
> > > +++ b/recipes-extended/xvisor/xvisor_0.3.0.bb
> > > @@ -0,0 +1,44 @@
> > > +SUMMARY =3D "Xvisor is an open-source type-1 hypervisor, which aims =
at providing a monolithic, light-weight, portable, and flexible virtualizat=
ion solution."
> > > +DESCRIPTION =3D "Xvisor primarily supports Full virtualization hence=
, supports a wide range of unmodified guest operating systems. Paravirtuali=
zation is optional for Xvisor and will be supported in an architecture inde=
pendent manner (such as VirtIO PCI/MMIO devices) to ensure no-change in gue=
st OS for using paravirtualization."
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> > > +DEPENDS +=3D "dtc-native dosfstools-native mtools-native"
> > > +
> > > +require xvisor-configs.inc
> > > +
> > > +inherit autotools-brokensep
> > > +
> > > +SRCREV =3D "58592ef18c71526a0045935d1e8eed5e8553b7d6"
> > > +SRC_URI =3D "git://github.com/xvisor/xvisor.git \
> > > +           file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.=
patch \
> > > +          "
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +EXTRA_OEMAKE +=3D "ARCH=3D\"${@map_xvisor_arch(d.getVar('TARGET_ARCH=
'), d)}\" I=3D${D}"
> > > +
> > > +CONFIG =3D "${@get_oemake_config(d)}"
> > > +
> > > +do_configure() {
> > > +    oe_runmake ${CONFIG}
> > > +}
> > > +
> > > +do_install_append() {
> > > +    install -d ${D}
> > > +    install -m 755 ${B}/build/vmm.* ${D}/
> > > +
> > > +    # We don't need this
> > > +    rm ${D}/system.map
> > > +}
> > > +
> > > +do_deploy () {
> > > +    install -d ${DEPLOY_DIR_IMAGE}
> > > +    install -m 755 ${D}/vmm.* ${DEPLOY_DIR_IMAGE}/
> > > +}
> > > +
> > > +addtask deploy after do_install
> > > +
> > > +FILES_${PN} +=3D "/vmm.*"
> > > +
> > > +COMPATIBLE_HOST =3D "(riscv64|riscv32).*"
> > > +INHIBIT_PACKAGE_STRIP =3D "1"
> > > --
> > > 2.25.0
> > >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
