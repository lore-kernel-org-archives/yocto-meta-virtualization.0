Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.34924.1597627151935540456
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 16 Aug 2020 18:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VM/V8O4K;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id p25so13691387qkp.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 16 Aug 2020 18:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=+A7bdT30IMk5VgnoBn/Om35lmBGWNRt02i8qaDyikfk=;
        b=VM/V8O4KWKu4RH/uJdn2u+c6eMhL+rIcZIC/HmkaUVs1DRSPDCaR44ZJH4g0qiJ2ll
         8MfLmNuO/VaW8J4Jvi0Qr2Ts1oWIcJf4wC851XS0XhKAfMNLBu2W9TxhUrxBZbao9ezz
         RhCZS5odUQlTAH531F3EBdK3r3MOfGycssW9UfkwbBmOtuji3EXiCkfvE04XVyI/ZBYD
         nOGZZackN1svoZ/8FARuaOMTY7ueWXCFOPBBXOdlavyLtAuT3exZ73ojUilyuJnvQ2ug
         M98BrSW+XjQrZpy8AEMifjxD4NuUISGijhvEQA5ixVpMlIamkv8DL2/ceutPHZ+KobUf
         uUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+A7bdT30IMk5VgnoBn/Om35lmBGWNRt02i8qaDyikfk=;
        b=N1yFQDqdP0AJ4j9jDjwO25yhqAXJW0PFNV7Hp0XFcqDLtxjoIP3QwP96l/9ZxsXVPL
         ork6zXWLvuwki+CWa9vkcMbjNwjCYZAHicu4UtLdZiKCwjfS5jw/WwijMA9iSyZ7oyRd
         kFqcAg9W11kkp3X85LUtFPNLRnKSQ5kQNV1BwbGNtpRmdAxFC1XJd7om2KjUCdDrInJO
         lnCwKJBf36hh6BWgE+dyaSjcY9mKhbM0+CxClHgrqn0pfrX2RzJfMLS5jkx1V/+bZVWc
         i2kvgGl42C5oRECG7F383/LJd9KHk3zpef1HknkgHkJ570YDqGuTYQTrNXUQcVMTobcO
         NMlg==
X-Gm-Message-State: AOAM532iSV/EA4GFfUMBqbN7QHrrSdsQj795mXGlBf+bYef+KlLgSYOC
	6VTJYP/GOyqlCGGqLuDozX4=
X-Google-Smtp-Source: ABdhPJzQvGhhcCQk8K9dIi0dwKqEJYp7/oQg+dxuHRnQgVfK795vS3FN1Bkc12QzdSrtn+kl66tcZA==
X-Received: by 2002:a37:b787:: with SMTP id h129mr10333266qkf.402.1597627151021;
        Sun, 16 Aug 2020 18:19:11 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id o187sm15275174qkf.14.2020.08.16.18.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 18:19:10 -0700 (PDT)
Date: Sun, 16 Aug 2020 21:19:08 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, alistair23@gmail.com
Subject: Re: [PATCH 1/4] xvisor: Bump to a git release
Message-ID: <20200817011906.GA12996@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200813220814.3110999-2-alistair.francis@wdc.com>
 <20200813220814.3110999-3-alistair.francis@wdc.com>
 <20200813220814.3110999-4-alistair.francis@wdc.com>
 <20200813220814.3110999-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks Alistair,

Looks good to me, in particular the starting of the doc with the
instructions.

This is now merged.

Bruce

In message: [PATCH 1/4] xvisor: Bump to a git release
on 13/08/2020 Alistair Francis wrote:

> Bump the Xvisor SHA to a git release with RISC-V 0.5.0 Hypversior
> extension support.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  recipes-extended/xvisor/{xvisor_0.3.0.bb => xvisor_git.bb} | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename recipes-extended/xvisor/{xvisor_0.3.0.bb => xvisor_git.bb} (88%)
> 
> diff --git a/recipes-extended/xvisor/xvisor_0.3.0.bb b/recipes-extended/xvisor/xvisor_git.bb
> similarity index 88%
> rename from recipes-extended/xvisor/xvisor_0.3.0.bb
> rename to recipes-extended/xvisor/xvisor_git.bb
> index 66ad618..45a7baf 100644
> --- a/recipes-extended/xvisor/xvisor_0.3.0.bb
> +++ b/recipes-extended/xvisor/xvisor_git.bb
> @@ -8,8 +8,9 @@ require xvisor-configs.inc
>  
>  inherit autotools-brokensep
>  
> -SRCREV = "58592ef18c71526a0045935d1e8eed5e8553b7d6"
> -SRC_URI = "git://github.com/xvisor/xvisor.git \
> +# This version support the RISC-V v0.5.0 Hypervisor extensions
> +SRCREV = "b3dac5b1f61f23f21dc59b3880897cff78f3b618"
> +SRC_URI = "git://github.com/avpatel/xvisor-next.git \
>             file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
>            "
>  
> -- 
> 2.27.0
> 

In message: [meta-virtualization] [PATCH 4/4] docs: Add initial Xvisor doc
on 13/08/2020 Alistair Francis wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  docs/00-INDEX   |  3 +++
>  docs/xvisor.txt | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 docs/xvisor.txt
> 
> diff --git a/docs/00-INDEX b/docs/00-INDEX
> index a2ffd99..5aa1b3c 100644
> --- a/docs/00-INDEX
> +++ b/docs/00-INDEX
> @@ -10,3 +10,6 @@ alphabetical order as well.
>  
>  openvswitch.txt
>  	- example on how to setup openvswitch with qemu/kvm.
> +
> +xvisor.txt
> +	- example on how to setup Xvisor for RISC-V QEMU.
> diff --git a/docs/xvisor.txt b/docs/xvisor.txt
> new file mode 100644
> index 0000000..6f31f22
> --- /dev/null
> +++ b/docs/xvisor.txt
> @@ -0,0 +1,16 @@
> +Simple setup for starting Xvisor on RISC-V QEMU
> +===============================================
> +
> +This is a simple starting point for running Xvisor on RISC-V QEMU.
> +
> +Currently meta-virtualisation supports running Xvisor on QEMU using the v0.5.0 RISC-V Hypervisor extensions.
> +
> +Support is still experimental.
> +
> +Build the images
> +================
> +$ MACHINE=qemuriscv64 bitbake xvisor-image-minimal
> +
> +Run the images
> +==============
> +$ MACHINE=qemuriscv64 runqemu xvisor-image-minimal slirp nographic
> -- 
> 2.27.0
> 

> 


In message: [PATCH 3/4] xvisor: Add support for building AArch64
on 13/08/2020 Alistair Francis wrote:

> Add support for building for AArch64, also remove the requirement to
> specify a platform.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  recipes-extended/xvisor/xvisor-configs.inc | 22 +++++++++++-----------
>  recipes-extended/xvisor/xvisor_git.bb      |  9 +++++++--
>  2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/recipes-extended/xvisor/xvisor-configs.inc b/recipes-extended/xvisor/xvisor-configs.inc
> index 099128d..f53bba2 100644
> --- a/recipes-extended/xvisor/xvisor-configs.inc
> +++ b/recipes-extended/xvisor/xvisor-configs.inc
> @@ -1,15 +1,15 @@
> -def get_oemake_config(d):
> -    plat = d.getVar('XVISOR_PLAT')
> -
> -    if plat is None:
> -        return ""
> -
> -    if 'riscv/virt32' in plat:
> -        return "generic-32b-defconfig"
> -    if 'riscv/virt64' in plat:
> -        return "generic-64b-defconfig"
> +def get_oemake_config(a, d):
> +    import re
>  
> -    return ""
> +    if   re.match('armeb$', a):               return 'generic-v7-defconfig'
> +    elif re.match('aarch64$', a):             return 'generic-v8-defconfig'
> +    elif re.match('aarch64_be$', a):          return 'generic-v8-defconfig'
> +    elif re.match('aarch64_ilp32$', a):       return 'generic-v8-defconfig'
> +    elif re.match('aarch64_be_ilp32$', a):    return 'generic-v8-defconfig'
> +    elif re.match('riscv32(eb|)$', a):        return 'generic-32b-defconfig'
> +    elif re.match('riscv64(eb|)$', a):        return 'generic-64b-defconfig'
> +    else:
> +        bb.error("cannot map '%s' to a Xvisor defconfig" % a)
>  
>  def map_xvisor_arch(a, d):
>      import re
> diff --git a/recipes-extended/xvisor/xvisor_git.bb b/recipes-extended/xvisor/xvisor_git.bb
> index 45a7baf..64b0f22 100644
> --- a/recipes-extended/xvisor/xvisor_git.bb
> +++ b/recipes-extended/xvisor/xvisor_git.bb
> @@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
>  
>  EXTRA_OEMAKE += "ARCH=\"${@map_xvisor_arch(d.getVar('TARGET_ARCH'), d)}\" I=${D}"
>  
> -CONFIG = "${@get_oemake_config(d)}"
> +CONFIG = "${@get_oemake_config(d.getVar('TARGET_ARCH'), d)}"
>  
>  do_configure() {
>      oe_runmake ${CONFIG}
> @@ -35,11 +35,16 @@ do_install_append() {
>  do_deploy () {
>      install -d ${DEPLOY_DIR_IMAGE}
>      install -m 755 ${D}/vmm.* ${DEPLOY_DIR_IMAGE}/
> +
> +    if [[ -f "${D}/*.dtb" ]]; then
> +        install -m 755 ${D}/*.dtb ${DEPLOY_DIR_IMAGE}/
> +    fi
>  }
>  
>  addtask deploy after do_install
>  
>  FILES_${PN} += "/vmm.*"
> +FILES_${PN} += "/*.dtb"
>  
> -COMPATIBLE_HOST = "(riscv64|riscv32).*"
> +COMPATIBLE_HOST = "(aarch64|riscv64|riscv32).*"
>  INHIBIT_PACKAGE_STRIP = "1"
> -- 
> 2.27.0
> 

In message: [PATCH 2/4] xvisor-image-minimal: Initial commit of a Xvisor image
on 13/08/2020 Alistair Francis wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../images/xvisor-image-minimal.bb            | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 recipes-extended/images/xvisor-image-minimal.bb
> 
> diff --git a/recipes-extended/images/xvisor-image-minimal.bb b/recipes-extended/images/xvisor-image-minimal.bb
> new file mode 100644
> index 0000000..4c4a2fc
> --- /dev/null
> +++ b/recipes-extended/images/xvisor-image-minimal.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "A minimal Xvisor image"
> +
> +INITRD_IMAGE = "core-image-minimal-initramfs"
> +
> +IMAGE_INSTALL += " \
> +    packagegroup-core-boot \
> +    packagegroup-core-ssh-openssh \
> +    "
> +
> +# The hypervisor may not be within the dom0 filesystem image but at least
> +# ensure that it is deployable:
> +do_build[depends] += "xvisor:do_deploy"
> +
> +LICENSE = "MIT"
> +
> +inherit core-image
> +
> +# Enable runqemu. eg: runqemu xvisor-image-minimal nographic slirp
> +QB_DEFAULT_KERNEL = "vmm.bin"
> +QB_OPT_APPEND_append_riscv64 = " -cpu rv64,x-h=true "
> -- 
> 2.27.0
> 

