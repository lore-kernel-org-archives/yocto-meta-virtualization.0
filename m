Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web12.8220.1583258084315933060
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Mar 2020 09:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n8/F694q;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alistair23@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id t20so1470511uao.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Mar 2020 09:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2iOlzSbboQd1GMNLpgR6CocGnhRHuJqs5ZXjOnuTeLw=;
        b=n8/F694qgbVDxIKaZn6uuwdLmBtijTLFGrvXw8jYDzLaVVp0uxXGpXa4EC4mnBF4td
         aYZcI4+o74rki0PIxV9++oC4qOhKMOBdxcslF6Gr3UIj91f/8N2GLRzmRpM/iHN3R+0c
         iP/EBYniugAn5opK65pHLjTvfS3DQR0iKSN+7SK9gUMNJOw//vMzIg6k2CxcmdCl+Jck
         FxlFjmijwY9odZF1ZgcO/l2C+PjkV373IkGLBjVlcQWkp9dBF+gH1RPOJgBwclyMWGxO
         Edi9nXDc5C7jqsWFCWVv00cVpWqnzTi7qx2myoOINg2s968NWns0p6xnIoE008PeC9KQ
         +DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2iOlzSbboQd1GMNLpgR6CocGnhRHuJqs5ZXjOnuTeLw=;
        b=pCKEHAke7TC0i2Fz+OTZn8jyHRGvwBT98T0Awdg6AakuEa8JeszBQ08/GJEUeW5pBJ
         lNjCDH7x0syNvrOL+f4LM88usBHYv6r4D7bZAPlPebymcBu58Ajs19EN26mN4loUNgO9
         Zn/reuZ76dv0Fo/SEKb8AEHU3ExrF0b+WXeFF+toY/of2rawFVhnUDs2zCjFkU6x+CSj
         Ldwutmr1GqV+K+ancKUnnmOwOlJhjeQCdapipI9w0IW0GBikbTQv5tAvkmTmD8I78hYk
         ccMLI/1msSS8/vBs+U+boLoC445WczUdXxhqojDjCw+EfPD9TfILe6o0RcSMW5/gfGJ4
         p+bQ==
X-Gm-Message-State: ANhLgQ0tXlpzpy8lRw+FNy9MUtQyC++pvcqTWqivf2AqiGRyphIQ1/bL
	pGb+i4KEVJ6IVdL5PZl9ICBpjFwHzIYyFo6i85A=
X-Google-Smtp-Source: ADFU+vvhNEfq5fmea86OgZT292Ri8xbIznpCZMhpb4Sb0XfT5ZbfHy58kh3gBLcAu73id0hBcv+fLkbjJOMCEhXkkuY=
X-Received: by 2002:ab0:2302:: with SMTP id a2mr3402676uao.21.1583258083300;
 Tue, 03 Mar 2020 09:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20200203215011.6642-1-alistair.francis@wdc.com>
 <20200203215011.6642-2-alistair.francis@wdc.com> <20200211210433.GA36395@gmail.com>
In-Reply-To: <20200211210433.GA36395@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Tue, 3 Mar 2020 09:47:04 -0800
Message-ID: <CAKmqyKMqyD7cpVFy1rGdgKKX47g=6v8CevbMVT8SZR=sO5q27Q@mail.gmail.com>
Subject: Re: [PATCH] xvisor: Initial commit of Xvisor Hypervisor
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 1:04 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> In message: [PATCH] xvisor: Initial commit of Xvisor Hypervisor
> on 03/02/2020 Alistair Francis wrote:
>
> > This commit adds support for building the baremetal Xvisor Hypervisor.
> >
> > I have only tested this with RISC-V so currently only RISC-V is marked
> > as a COMPATIBLE_HOST, although Xvisor does support multiple other
> > architectures.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  ...n-t-specify-mabi-or-march-for-RISC-V.patch | 34 ++++++++++++++
> >  recipes-extended/xvisor/xvisor-configs.inc    | 25 +++++++++++
> >  recipes-extended/xvisor/xvisor_0.3.0.bb       | 44 +++++++++++++++++++
> >  3 files changed, 103 insertions(+)
> >  create mode 100644 recipes-extended/xvisor/files/0001-TESTS-Don-t-spec=
ify-mabi-or-march-for-RISC-V.patch
> >  create mode 100644 recipes-extended/xvisor/xvisor-configs.inc
> >  create mode 100644 recipes-extended/xvisor/xvisor_0.3.0.bb
> >
> > diff --git a/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mab=
i-or-march-for-RISC-V.patch b/recipes-extended/xvisor/files/0001-TESTS-Don-=
t-specify-mabi-or-march-for-RISC-V.patch
> > new file mode 100644
> > index 0000000..2e53943
> > --- /dev/null
> > +++ b/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-ma=
rch-for-RISC-V.patch
> > @@ -0,0 +1,34 @@
> > +From 022c885d077dce6fad3eca5fd2f54b2070c375d2 Mon Sep 17 00:00:00 2001
> > +From: Alistair Francis <alistair.francis@wdc.com>
> > +Date: Fri, 17 May 2019 14:21:44 -0700
> > +Subject: [PATCH] TESTS: Don't specify mabi or march for RISC-V
> > +
> > +To avoid
> > +    can't link double-float modules with soft-float modules
> > +errors when building 32-bit baremetal guests don't specify mabi
> > +or march.
> > +
> > +Upstream-Status: Inappropriate [Fixes a 32-bit Yocto flow bug]
> > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > +---
> > + tests/riscv/common/basic/Makefile.inc | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/tests/riscv/common/basic/Makefile.inc b/tests/riscv/commo=
n/basic/Makefile.inc
> > +index 9fa5abed..f3ff1864 100644
> > +--- a/tests/riscv/common/basic/Makefile.inc
> > ++++ b/tests/riscv/common/basic/Makefile.inc
> > +@@ -24,8 +24,8 @@
> > + ARCH_CPPFLAGS=3D$(board_cppflags) -DFIRMWARE_BOOT
> > + ARCH_CPPFLAGS+=3D-DTEXT_START=3D$(board_text_start)
> > + ifeq ($(board_32bit),y)
> > +-ARCH_CFLAGS=3D$(board_cflags) -fno-omit-frame-pointer -fno-optimize-s=
ibling-calls -mno-save-restore -mstrict-align -mabi=3Dilp32 -march=3Drv32im=
afdc -mcmodel=3Dmedany
> > +-ARCH_ASFLAGS=3D$(board_asflags) -fno-omit-frame-pointer -fno-optimize=
-sibling-calls -mno-save-restore -mstrict-align -mabi=3Dilp32 -march=3Drv32=
imafdc -mcmodel=3Dmedany
> > ++ARCH_CFLAGS=3D$(board_cflags) -fno-omit-frame-pointer -fno-optimize-s=
ibling-calls -mno-save-restore -mstrict-align -mcmodel=3Dmedany
> > ++ARCH_ASFLAGS=3D$(board_asflags) -fno-omit-frame-pointer -fno-optimize=
-sibling-calls -mno-save-restore -mstrict-align -mcmodel=3Dmedany
> > + else
> > + ARCH_CFLAGS=3D$(board_cflags) -fno-omit-frame-pointer -fno-optimize-s=
ibling-calls -mno-save-restore -mstrict-align -mabi=3Dlp64 -march=3Drv64ima=
fdc -mcmodel=3Dmedany
> > + ARCH_ASFLAGS=3D$(board_asflags) -fno-omit-frame-pointer -fno-optimize=
-sibling-calls -mno-save-restore -mstrict-align -mabi=3Dlp64 -march=3Drv64i=
mafdc -mcmodel=3Dmedany
> > +--
> > +2.21.0
> > +
> > diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-exten=
ded/xvisor/xvisor-configs.inc
> > new file mode 100644
> > index 0000000..099128d
> > --- /dev/null
> > +++ b/recipes-extended/xvisor/xvisor-configs.inc
> > @@ -0,0 +1,25 @@
> > +def get_oemake_config(d):
> > +    plat =3D d.getVar('XVISOR_PLAT')
> > +
> > +    if plat is None:
> > +        return ""
> > +
> > +    if 'riscv/virt32' in plat:
> > +        return "generic-32b-defconfig"
> > +    if 'riscv/virt64' in plat:
> > +        return "generic-64b-defconfig"
> > +
> > +    return ""
> > +
> > +def map_xvisor_arch(a, d):
> > +    import re
> > +
> > +    if   re.match('(i.86|x86.64)$', a):  return 'x86'
> > +    elif re.match('armeb$', a):                 return 'arm'
> > +    elif re.match('aarch64$', a):               return 'arm'
> > +    elif re.match('aarch64_be$', a):            return 'arm'
> > +    elif re.match('aarch64_ilp32$', a):         return 'arm'
> > +    elif re.match('aarch64_be_ilp32$', a):      return 'arm'
> > +    elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
> > +    else:
> > +        bb.error("cannot map '%s' to a Xvisor architecture" % a)
>
> This all looks fine to me (for the 1st revision), I did wonder if the
> mappings are any different than the kernel mappings (but didn't check) ..
> and if so, we could avoid the code to map the arch.

They are similar but not the same, for example Xvisor uses "arm" for
ARMv7 and AArch64.

>
> It would also be nice to eventually have a README or some other test
> information captured in the layer, that way people can have an idea
> about why they'd want to use this, some expected behaviour and how
> they can boot it.

Where do you think this should go?

Alistair

>
> Bruce
>
> > diff --git a/recipes-extended/xvisor/xvisor_0.3.0.bb b/recipes-extended=
/xvisor/xvisor_0.3.0.bb
> > new file mode 100644
> > index 0000000..66ad618
> > --- /dev/null
> > +++ b/recipes-extended/xvisor/xvisor_0.3.0.bb
> > @@ -0,0 +1,44 @@
> > +SUMMARY =3D "Xvisor is an open-source type-1 hypervisor, which aims at=
 providing a monolithic, light-weight, portable, and flexible virtualizatio=
n solution."
> > +DESCRIPTION =3D "Xvisor primarily supports Full virtualization hence, =
supports a wide range of unmodified guest operating systems. Paravirtualiza=
tion is optional for Xvisor and will be supported in an architecture indepe=
ndent manner (such as VirtIO PCI/MMIO devices) to ensure no-change in guest=
 OS for using paravirtualization."
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> > +DEPENDS +=3D "dtc-native dosfstools-native mtools-native"
> > +
> > +require xvisor-configs.inc
> > +
> > +inherit autotools-brokensep
> > +
> > +SRCREV =3D "58592ef18c71526a0045935d1e8eed5e8553b7d6"
> > +SRC_URI =3D "git://github.com/xvisor/xvisor.git \
> > +           file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.pa=
tch \
> > +          "
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +EXTRA_OEMAKE +=3D "ARCH=3D\"${@map_xvisor_arch(d.getVar('TARGET_ARCH')=
, d)}\" I=3D${D}"
> > +
> > +CONFIG =3D "${@get_oemake_config(d)}"
> > +
> > +do_configure() {
> > +    oe_runmake ${CONFIG}
> > +}
> > +
> > +do_install_append() {
> > +    install -d ${D}
> > +    install -m 755 ${B}/build/vmm.* ${D}/
> > +
> > +    # We don't need this
> > +    rm ${D}/system.map
> > +}
> > +
> > +do_deploy () {
> > +    install -d ${DEPLOY_DIR_IMAGE}
> > +    install -m 755 ${D}/vmm.* ${DEPLOY_DIR_IMAGE}/
> > +}
> > +
> > +addtask deploy after do_install
> > +
> > +FILES_${PN} +=3D "/vmm.*"
> > +
> > +COMPATIBLE_HOST =3D "(riscv64|riscv32).*"
> > +INHIBIT_PACKAGE_STRIP =3D "1"
> > --
> > 2.25.0
> >
