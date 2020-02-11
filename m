Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web09.16551.1581455096994410803
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 13:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CKjccbJu;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id c188so11605985qkg.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2020 13:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aeNXrHOzwdOxh5N0R2CpkaBqIKXVf2FuivoH3BDZ/lI=;
        b=CKjccbJujmSDTMvM6V8EQ6+SsmFNu4cj1atV10NGaa0y0Qm0KqKUhYcv9tu1zLfjWU
         hpm8SExNkeROOcSWSH2j7LaWoSnGYo09lmE4ZLNCf67k+iXrjA+eA/IhPrnzmRv86WrS
         xtj51gE4DB0guJMx8SRKZCuuFzsSVQBBJmIjSkLSDYwJdZWUYEY7SL4+ZFeS+FJP3fa5
         OyboMAzZOQMycaIDwI4x25pK8IeT/JXnAl3a4n1f6CIeKPWLR8fYqnDe4Cx5unn6RIw1
         Ctesj8i1oxpbkOhY+tAM/DGSEju6RM+bEH/zSHNGUkudA8WxZF9schmnbEQsLUwE7EPf
         ev0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aeNXrHOzwdOxh5N0R2CpkaBqIKXVf2FuivoH3BDZ/lI=;
        b=iyJFelZk4Y7DSou0mA539qDuNi4s2tf6kogyxvFXe1/lmFJg97eXXY68AR4Yyhe0NX
         C76hixPOBpParK9cUL2S0jVVHsW9qNKggTVYXwrFPPmAbyxMB4f/lC+BIUHlGaeONibU
         oAmOKd1yBCUq1SBHUbOzEkAnawn/q0izntmr1IU0XP469M4pzF7Wls/t+RjQi87ojv14
         F5xLtNelGfTWoMSoywVyLLquz9i49qn4pZW58csUJt2MW/3Tsgmgpy/mXu0ppzK3ta8Q
         d6bb76Sv9HtE/7F2Ju+lAfD4oFncIWQsGxVhP+p/XojTC/Kw0v8KpsK7ZP8HGR0gnVgz
         LcAw==
X-Gm-Message-State: APjAAAUUxgLct58vcLLmae7pDQl8ua8mkZeXYWpQDC6K+KCGKYuEzKQY
	Yk9ICeKDB4wvX2YyodXA8gU=
X-Google-Smtp-Source: APXvYqwVVc4vRpl3/5hjz3obkLWukxlRstXJXSukUEwSa16TgXNV/62ZBDHvHL1eISeNJVShzKnzgQ==
X-Received: by 2002:a37:5d1:: with SMTP id 200mr4489356qkf.492.1581455096059;
        Tue, 11 Feb 2020 13:04:56 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id 85sm2693013qko.49.2020.02.11.13.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 13:04:50 -0800 (PST)
Date: Tue, 11 Feb 2020 16:04:36 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: meta-virtualization@lists.yoctoproject.org, alistair23@gmail.com
Subject: Re: [PATCH] xvisor: Initial commit of Xvisor Hypervisor
Message-ID: <20200211210433.GA36395@gmail.com>
References: <20200203215011.6642-1-alistair.francis@wdc.com>
 <20200203215011.6642-2-alistair.francis@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200203215011.6642-2-alistair.francis@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [PATCH] xvisor: Initial commit of Xvisor Hypervisor
on 03/02/2020 Alistair Francis wrote:

> This commit adds support for building the baremetal Xvisor Hypervisor.
> 
> I have only tested this with RISC-V so currently only RISC-V is marked
> as a COMPATIBLE_HOST, although Xvisor does support multiple other
> architectures.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...n-t-specify-mabi-or-march-for-RISC-V.patch | 34 ++++++++++++++
>  recipes-extended/xvisor/xvisor-configs.inc    | 25 +++++++++++
>  recipes-extended/xvisor/xvisor_0.3.0.bb       | 44 +++++++++++++++++++
>  3 files changed, 103 insertions(+)
>  create mode 100644 recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch
>  create mode 100644 recipes-extended/xvisor/xvisor-configs.inc
>  create mode 100644 recipes-extended/xvisor/xvisor_0.3.0.bb
> 
> diff --git a/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch b/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch
> new file mode 100644
> index 0000000..2e53943
> --- /dev/null
> +++ b/recipes-extended/xvisor/files/0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch
> @@ -0,0 +1,34 @@
> +From 022c885d077dce6fad3eca5fd2f54b2070c375d2 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Fri, 17 May 2019 14:21:44 -0700
> +Subject: [PATCH] TESTS: Don't specify mabi or march for RISC-V
> +
> +To avoid
> +    can't link double-float modules with soft-float modules
> +errors when building 32-bit baremetal guests don't specify mabi
> +or march.
> +
> +Upstream-Status: Inappropriate [Fixes a 32-bit Yocto flow bug]
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +---
> + tests/riscv/common/basic/Makefile.inc | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/riscv/common/basic/Makefile.inc b/tests/riscv/common/basic/Makefile.inc
> +index 9fa5abed..f3ff1864 100644
> +--- a/tests/riscv/common/basic/Makefile.inc
> ++++ b/tests/riscv/common/basic/Makefile.inc
> +@@ -24,8 +24,8 @@
> + ARCH_CPPFLAGS=$(board_cppflags) -DFIRMWARE_BOOT
> + ARCH_CPPFLAGS+=-DTEXT_START=$(board_text_start)
> + ifeq ($(board_32bit),y)
> +-ARCH_CFLAGS=$(board_cflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mabi=ilp32 -march=rv32imafdc -mcmodel=medany
> +-ARCH_ASFLAGS=$(board_asflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mabi=ilp32 -march=rv32imafdc -mcmodel=medany
> ++ARCH_CFLAGS=$(board_cflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mcmodel=medany
> ++ARCH_ASFLAGS=$(board_asflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mcmodel=medany
> + else
> + ARCH_CFLAGS=$(board_cflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mabi=lp64 -march=rv64imafdc -mcmodel=medany
> + ARCH_ASFLAGS=$(board_asflags) -fno-omit-frame-pointer -fno-optimize-sibling-calls -mno-save-restore -mstrict-align -mabi=lp64 -march=rv64imafdc -mcmodel=medany
> +-- 
> +2.21.0
> +
> diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-extended/xvisor/xvisor-configs.inc
> new file mode 100644
> index 0000000..099128d
> --- /dev/null
> +++ b/recipes-extended/xvisor/xvisor-configs.inc
> @@ -0,0 +1,25 @@
> +def get_oemake_config(d):
> +    plat = d.getVar('XVISOR_PLAT')
> +
> +    if plat is None:
> +        return ""
> +
> +    if 'riscv/virt32' in plat:
> +        return "generic-32b-defconfig"
> +    if 'riscv/virt64' in plat:
> +        return "generic-64b-defconfig"
> +
> +    return ""
> +
> +def map_xvisor_arch(a, d):
> +    import re
> +
> +    if   re.match('(i.86|x86.64)$', a):  return 'x86'
> +    elif re.match('armeb$', a):                 return 'arm'
> +    elif re.match('aarch64$', a):               return 'arm'
> +    elif re.match('aarch64_be$', a):            return 'arm'
> +    elif re.match('aarch64_ilp32$', a):         return 'arm'
> +    elif re.match('aarch64_be_ilp32$', a):      return 'arm'
> +    elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
> +    else:
> +        bb.error("cannot map '%s' to a Xvisor architecture" % a)

This all looks fine to me (for the 1st revision), I did wonder if the
mappings are any different than the kernel mappings (but didn't check) ..
and if so, we could avoid the code to map the arch.

It would also be nice to eventually have a README or some other test
information captured in the layer, that way people can have an idea
about why they'd want to use this, some expected behaviour and how
they can boot it.

Bruce

> diff --git a/recipes-extended/xvisor/xvisor_0.3.0.bb b/recipes-extended/xvisor/xvisor_0.3.0.bb
> new file mode 100644
> index 0000000..66ad618
> --- /dev/null
> +++ b/recipes-extended/xvisor/xvisor_0.3.0.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "Xvisor is an open-source type-1 hypervisor, which aims at providing a monolithic, light-weight, portable, and flexible virtualization solution."
> +DESCRIPTION = "Xvisor primarily supports Full virtualization hence, supports a wide range of unmodified guest operating systems. Paravirtualization is optional for Xvisor and will be supported in an architecture independent manner (such as VirtIO PCI/MMIO devices) to ensure no-change in guest OS for using paravirtualization."
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +DEPENDS += "dtc-native dosfstools-native mtools-native"
> +
> +require xvisor-configs.inc
> +
> +inherit autotools-brokensep
> +
> +SRCREV = "58592ef18c71526a0045935d1e8eed5e8553b7d6"
> +SRC_URI = "git://github.com/xvisor/xvisor.git \
> +           file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE += "ARCH=\"${@map_xvisor_arch(d.getVar('TARGET_ARCH'), d)}\" I=${D}"
> +
> +CONFIG = "${@get_oemake_config(d)}"
> +
> +do_configure() {
> +    oe_runmake ${CONFIG}
> +}
> +
> +do_install_append() {
> +    install -d ${D}
> +    install -m 755 ${B}/build/vmm.* ${D}/
> +
> +    # We don't need this
> +    rm ${D}/system.map
> +}
> +
> +do_deploy () {
> +    install -d ${DEPLOY_DIR_IMAGE}
> +    install -m 755 ${D}/vmm.* ${DEPLOY_DIR_IMAGE}/
> +}
> +
> +addtask deploy after do_install
> +
> +FILES_${PN} += "/vmm.*"
> +
> +COMPATIBLE_HOST = "(riscv64|riscv32).*"
> +INHIBIT_PACKAGE_STRIP = "1"
> -- 
> 2.25.0
> 
