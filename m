Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.79565.1638292295840045936
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Nov 2021 09:11:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b0yaAsdD;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id w1so89959730edc.6
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Nov 2021 09:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CjotA9DX9fVUIy9tiAyTW8EOuRTGgwx2vScjinS+Agg=;
        b=b0yaAsdD87ZcrbccKHHsQ0Els8V7BHQf5dYjCyLL+wD3k3Ng4/WCqq8SbVGvQQUl1U
         R3uqH2bIRMxgwjawu1RTQVnf7JxScqzZq74gAJMtK6IVAIe94B2BGFc9XyeR1fFfHpZ3
         6/LbNiwPWVrH75Nx98HiCL0q5tbBK/AsqedBDfjuHOIfM73tYpepGPlEaFa1lekSYaM3
         K6IM44CsoIt3cOjPw8RSbqXy8k2gNM6Xx+6uL6L5PsXpxWkXNMx+SwV5dZC4iLVTs5Rx
         OZ6hjUuDeUDFRQq0hgbBzbbISRCJy7N5sWBXucMF1mKCcSnYaxop7vaqCBHWbyqKAEdB
         cENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CjotA9DX9fVUIy9tiAyTW8EOuRTGgwx2vScjinS+Agg=;
        b=wFnoNDk/QVW+B8saz+CIvOPu0wlnsvx3vaB/3jNPdJi48vgpETufq1lchjMqK7KQtf
         usPR9wZaaGCixj05A4EOSW1eET7yITqWr05VGn72hQUgfkG+b9bkdQ1g4D3C8D++5Vbk
         mWB1rvP7EuPEa/7nbsNc7i7IqOk9w86ri/KHdsW3S0Ip+O741j9gNxhwcqK7ExfZJWrk
         hiN43VeYzHLb2InlDPkmg4AH9Vc87gh4RqSJ1A29C8nKoRnFuAdbJDlpBRi6A3akYRul
         Ht7BhpJHRaxkveLmMkyhwaArTghlIZYM3Wb6KmOf/Am4f1wdUrSmUJNI2URMh/ElN8hT
         oFhg==
X-Gm-Message-State: AOAM533sMWhCLWt8i0fxn5g02qzdM7zMb6eHhLqDsaPEhsYx/qtCksdh
	ySJsZSRUh7nfdIIeRxqs1SDmz+g6i8xApejEmMc=
X-Google-Smtp-Source: ABdhPJxvEL61TK3a3Fvk82khhjcfYkWcgyrO78mjvZIiOXef4QlIcnkqNjWBWUO53ENJwQ2bNvn4qRLD0CFlKQZA9S8=
X-Received: by 2002:a17:906:5951:: with SMTP id g17mr393337ejr.315.1638292293958;
 Tue, 30 Nov 2021 09:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20211130164736.43609-1-Martin.Jansa@gmail.com> <20211130164736.43609-2-Martin.Jansa@gmail.com>
In-Reply-To: <20211130164736.43609-2-Martin.Jansa@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 30 Nov 2021 12:11:23 -0500
Message-ID: <CADkTA4N4jWNQCKey5oAG90U-nq9LtbVM5U0MN+mzyVO8uJpBxA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCHv2 2/2] uxen-guest-tools: fix -DMODULE not working when building uxenhc module
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Confirmed. These fix my build as well.

I've merged them to master.

Thanks for the help on these, most appreciated.

Bruce

On Tue, Nov 30, 2021 at 11:47 AM Martin Jansa <Martin.Jansa@gmail.com> wrot=
e:
>
> * undo the unnecessary and incomplete changes from 0001-vm-support-fix-bu=
ild-for-kernel-s-5.4.patch
>   because with 5.15 it was still failing with:
>   ERROR: modpost: missing MODULE_LICENSE() in uxen-guest-tools/4.1.8-r0/u=
xen-4.1.8-72a4af9/vm-support/linux/uxenhc/uxenhc.o
>
>   fix it properly in 0004-uxenhc-fix-DMODULE-not-working-on-module-build-=
comma.patch
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...m-support-fix-build-for-kernel-s-5.4.patch | 13 -----
>  ...LE-not-working-on-module-build-comma.patch | 56 +++++++++++++++++++
>  .../uxen/uxen-guest-tools_4.1.8.bb            |  1 +
>  3 files changed, 57 insertions(+), 13 deletions(-)
>  create mode 100644 recipes-extended/uxen/uxen-guest-tools/0004-uxenhc-fi=
x-DMODULE-not-working-on-module-build-comma.patch
>
> diff --git a/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-b=
uild-for-kernel-s-5.4.patch b/recipes-extended/uxen/uxen-guest-tools/0001-v=
m-support-fix-build-for-kernel-s-5.4.patch
> index a3325ce..287170c 100644
> --- a/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-fo=
r-kernel-s-5.4.patch
> +++ b/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-fo=
r-kernel-s-5.4.patch
> @@ -34,19 +34,6 @@ index 0b9ef3f..04957a8 100644
>           if (!uxen_hcbase) {
>               ret =3D -ENOMEM;
>               goto out;
> -@@ -149,8 +154,11 @@ static void __exit uxen_hypercall_exit(void)
> - {
> - }
> -
> -+
> -+#define KBUILD_MODFILE "uxenhc"
> -+
> - module_init(uxen_hypercall_init);
> - module_exit(uxen_hypercall_exit);
> -+MODULE_LICENSE("GPL");
> - MODULE_AUTHOR("paulian.marinca@bromium.com");
> - MODULE_DESCRIPTION("uXen hypercall support");
> --MODULE_LICENSE("GPL");
>  diff --git a/v4vvsock/v4v_vsock.c b/v4vvsock/v4v_vsock.c
>  index 8d80d7d..cd7e8ce 100644
>  --- a/v4vvsock/v4v_vsock.c
> diff --git a/recipes-extended/uxen/uxen-guest-tools/0004-uxenhc-fix-DMODU=
LE-not-working-on-module-build-comma.patch b/recipes-extended/uxen/uxen-gue=
st-tools/0004-uxenhc-fix-DMODULE-not-working-on-module-build-comma.patch
> new file mode 100644
> index 0000000..60018f0
> --- /dev/null
> +++ b/recipes-extended/uxen/uxen-guest-tools/0004-uxenhc-fix-DMODULE-not-=
working-on-module-build-comma.patch
> @@ -0,0 +1,56 @@
> +From 732791cb353289e37448d84503a7d62ca156f29f Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Tue, 30 Nov 2021 16:33:14 +0000
> +Subject: [PATCH] uxenhc: fix -DMODULE not working on module build comman=
d line
> +
> +* ATTOXEN_API_INC isn't defined anywhere in our OE builds, so the comman=
d line ends like this:
> +
> +  x86_64-oe-linux-gcc  -fuse-ld=3Dbfd -fmacro-prefix-map=3D/OE/work/qemu=
x86_64-oe-linux/uxen-guest-tools/4.1.8-r0=3D/usr/src/debug/uxen-guest-tools=
/4.1.8-r0                      -fdebug-prefix-map=3D/OE/work/qemux86_64-oe-=
linux/uxen-guest-tools/4.1.8-r0=3D/usr/src/debug/uxen-guest-tools/4.1.8-r0 =
                     -fdebug-prefix-map=3D/OE/work/qemux86_64-oe-linux/uxen=
-guest-tools/4.1.8-r0/recipe-sysroot=3D                      -fdebug-prefix=
-map=3D/OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/recipe-sysroo=
t-native=3D  -fdebug-prefix-map=3D/OE/work-shared/qemux86-64/kernel-source=
=3D/usr/src/kernel -Wp,-MMD,/OE/work/qemux86_64-oe-linux/uxen-guest-tools/4=
.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/.hypercall.o.d -I/OE/wor=
k/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-suppo=
rt/linux/include/ -I/OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/=
uxen-4.1.8-72a4af9/vm-support/linux/include/uxen -I/OE/work/qemux86_64-oe-l=
inux/uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/include/=
uxen/xen -I/OE/work-shared/qemux86-64/kernel-source/arch/x86/include -I./ar=
ch/x86/include/generated -I/OE/work-shared/qemux86-64/kernel-source/include=
 -I./include -I/OE/work-shared/qemux86-64/kernel-source/arch/x86/include/ua=
pi -I./arch/x86/include/generated/uapi -I/OE/work-shared/qemux86-64/kernel-=
source/include/uapi -I./include/generated/uapi -include /OE/work-shared/qem=
ux86-64/kernel-source/include/linux/compiler-version.h -include /OE/work-sh=
ared/qemux86-64/kernel-source/include/linux/kconfig.h -include /OE/work-sha=
red/qemux86-64/kernel-source/include/linux/compiler_types.h -D__KERNEL__ -f=
macro-prefix-map=3D/OE/work-shared/qemux86-64/kernel-source/=3D -Wall -Wund=
ef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-com=
mon -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=
=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu89 -mn=
o-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=3Dnone -m64 -f=
align-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred=
-stack-boundary=3D3 -mskip-rax-setup -march=3Dcore2 -mno-red-zone -mcmodel=
=3Dkernel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-bran=
ch=3Dthunk-extern -mindirect-branch-register -fno-jump-tables -fno-delete-n=
ull-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-ov=
erflow -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wfram=
e-larger-than=3D2048 -fstack-protector-strong -Wimplicit-fallthrough=3D5 -W=
no-main -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-f=
rame-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -pg -m=
record-mcount -mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement -Wvl=
a -Wno-pointer-sign -Wno-stringop-truncation -Wno-zero-length-bounds -Wno-a=
rray-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -=
fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wno-packed-n=
ot-aligned -DLX_TARGET_STANDARDVM -g -Wall -I  -DMODULE  -DKBUILD_BASENAME=
=3D'"hypercall"' -DKBUILD_MODNAME=3D'"uxenhc"' -D__KBUILD_MODNAME=3Dkmod_ux=
enhc -c -o /OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/uxen-4.1.=
8-72a4af9/vm-support/linux/uxenhc/hypercall.o /OE/work/qemux86_64-oe-linux/=
uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/hyperc=
all.c
> +
> +  the important part is "-I  -DMODULE" which breaks include/linux/module=
.h behavior:
> +
> +  /*
> +   * MODULE_FILE is used for generating modules.builtin
> +   * So, make it no-op when this is being built as a module
> +   */
> +  #ifdef MODULE
> +  #define MODULE_FILE
> +  #else
> +  #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> +  #endif
> +
> +  resulting in:
> +
> +  In file included from /OE/work-shared/qemux86-64/kernel-source/include=
/linux/module.h:22,
> +                   from /OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.=
1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/hypercall.c:3:
> +  /OE/work-shared/qemux86-64/kernel-source/include/linux/module.h:183:43=
: error: expected ',' or ';' before 'KBUILD_MODFILE'
> +    183 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> +        |                                           ^~~~~~~~~~~~~~
> +  /OE/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:2=
6:61: note: in definition of macro '__MODULE_INFO'
> +     26 |                 =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D=
" info
> +        |                                                             ^~=
~~
> +  /OE/work-shared/qemux86-64/kernel-source/include/linux/module.h:183:25=
: note: in expansion of macro 'MODULE_INFO'
> +    183 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
> +        |                         ^~~~~~~~~~~
> +  /OE/work-shared/qemux86-64/kernel-source/include/linux/module.h:230:34=
: note: in expansion of macro 'MODULE_FILE'
> +    230 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(licen=
se, _license)
> +        |                                  ^~~~~~~~~~~
> +  /OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4=
af9/vm-support/linux/uxenhc/hypercall.c:161:1: note: in expansion of macro =
'MODULE_LICENSE'
> +    161 | MODULE_LICENSE("GPL");
> +        | ^~~~~~~~~~~~~~
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + uxenhc/Kbuild | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/uxenhc/Kbuild b/uxenhc/Kbuild
> +index e418096..ef1b145 100644
> +--- a/uxenhc/Kbuild
> ++++ b/uxenhc/Kbuild
> +@@ -1,4 +1,3 @@
> + obj-m +=3D uxenhc.o
> +
> + uxenhc-y :=3D hypercall.o
> +-CFLAGS_hypercall.o :=3D -I$(ATTOXEN_API_INC)
> +\ No newline at end of file
> diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb b/recipes-ex=
tended/uxen/uxen-guest-tools_4.1.8.bb
> index 841c71a..529efdb 100644
> --- a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
> +++ b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D " \
>      file://0001-vm-support-fix-build-for-kernel-s-5.4.patch \
>      file://0002-vm-support-fix-build-for-kernel-s-5.15.patch \
>      file://0003-vm-support-fix-build-for-kernel-s-5.14.patch \
> +    file://0004-uxenhc-fix-DMODULE-not-working-on-module-build-comma.pat=
ch \
>  "
>
>  SRC_URI[uxen.sha384sum] =3D "be2233bc6506a23350d76c03ac28ea7ea381e1dc6ed=
5ce996e8ac71e6a3316fcaa2ed070c622618bd226f43a4d6db5d4"
> --
> 2.32.0
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
