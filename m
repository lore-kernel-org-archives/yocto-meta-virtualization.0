Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.3046.1618952457618331182
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 14:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pUKqoife;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id y12so29763535qtx.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Apr 2021 14:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MDR3oZ1WD/bRspZn6rU8q8MJz5NX63JDDEhKBNjgEPY=;
        b=pUKqoifeLkLQvEkGq73lfVqT2V1/ycDQ4eGd1QTl9n6dfsHG7a3W59jN058RgcgbeH
         fwD4bkZ9ksT+IUbuyoa6TkcBqdJn0A43ePhPyAFpcOHvudR7VePeYZ6PIZ9EKd4Q2mFx
         JnfLRFMywRU4Z+HWD9GZ4iGxDfnbePlnGD7QJqDMzNd/jOpSr0vyXREtdGJx7G6ws0Xy
         Ngo+iAb4ty5OJQUx2BigazerCNdSAoSiGN+QmEBOyV+WvRDGLHXQDVWu1eiTCXOpw+8l
         HN+FQP0/c1uAL0IJQELFiqR6/w2iViy/2kDznSjNUyqnAdePjSWQXgf2Ka0bXAl/xFa9
         hVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MDR3oZ1WD/bRspZn6rU8q8MJz5NX63JDDEhKBNjgEPY=;
        b=ZyGythSaXW9ABsEKq0nQ01tB3YqQ0/DyC1+HTGrDGI9FD4qnipLV+3S+DPYXMYA0b+
         FRmLlygZO7fjI3eupXopF8WVULCOVdoyGl8pU8q7bOMHsoAxt/Pk/LIaFjRT6grd/rWt
         h9k6fYyFOZu5kbwe0nvy2I6tt5wj5UfzHhidhhSBq9nlhad1XPgX5XMW1ktIyqh7k7N/
         U81lEqvCv5MIZRJBGedBqQjV0N3hmes04ZkFBYFjsB5HP/IrkI1vZxnch11fC0fUv1au
         9DOqqzATvVhctwIp5toBha6NpAkk+Vt//TrvRJDklHV/S/UcOC8KLGWzOkGhCbXr4KKb
         aAvA==
X-Gm-Message-State: AOAM533Z8IXExnbJFSHvpFdPP5J7jOVOUIXiKkxnb2eo1+DeMXIuxYnj
	NY4+m6BGRRcV2CaPI0IUFw8=
X-Google-Smtp-Source: ABdhPJz5TN3nNUbhb+5iu9lAGe3tB2NISSmqhR5AlDVzHsJCfcNZUgUXJS6kCUOzVWJLYOTKgq6+sg==
X-Received: by 2002:a05:622a:2d2:: with SMTP id a18mr19582768qtx.146.1618952456695;
        Tue, 20 Apr 2021 14:00:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 190sm219779qki.115.2021.04.20.14.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 14:00:56 -0700 (PDT)
Date: Tue, 20 Apr 2021 17:00:54 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	bertrand.marquis@arm.com
Subject: Re: [meta-virtualization][PATCH 1/3] xen-tools: add patches for 4.14 to enable dropping multilib build
Message-ID: <20210420210051.GA1997@gmail.com>
References: <20210419230854.121217-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210419230854.121217-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

These look good to me.

I've queued them on master .. were you also interested in
getting them into hardknott ?

Bruce

In message: [meta-virtualization][PATCH 1/3] xen-tools: add patches for 4.14 to enable dropping multilib build
on 19/04/2021 Christopher Clark wrote:

> Backport Xen patches to enable hvmloader to be built without needing
> 32-bit glibc.
> 
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ++++++++++++++++++
>  ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 ++++++++
>  recipes-extended/xen/xen-tools_4.14.bb        |   2 +
>  3 files changed, 263 insertions(+)
>  create mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch
>  create mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
> 
> diff --git a/recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch b/recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch
> new file mode 100644
> index 0000000..7b062b7
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch
> @@ -0,0 +1,178 @@
> +From 73b13705af7c3bb8fdf11932eb68788d090a443f Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
> +Date: Thu, 4 Mar 2021 16:49:00 +0100
> +Subject: [PATCH] firmware: provide a stand alone set of headers
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The current build of the firmware relies on having 32bit compatible
> +headers installed in order to build some of the 32bit firmware.
> +Usually this can be solved by using the -ffreestanding compiler option
> +which drops the usage of the system headers in favor of a private set
> +of freestanding headers provided by the compiler itself that are not
> +tied to libc.
> +
> +However such option is broken at least in the gcc compiler provided in
> +Alpine Linux, as the system include path (ie: /usr/include) takes
> +precedence over the gcc private include path:
> +
> +#include <...> search starts here:
> + /usr/include
> + /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
> +
> +And the headers in /usr/include are exclusively 64bit.
> +
> +Since -ffreestanding is currently broken on at least that distro, and
> +for resilience against future compilers also having the option broken
> +provide a set of stand alone 32bit headers required for the firmware
> +build.
> +
> +Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> +Reviewed-by: Jan Beulich <jbeulich@suse.com>
> +Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> +Applied to Xen 4.14 by: Christopher Clark <christopher.w.clark@gmail.com>
> +---
> + tools/firmware/Rules.mk                       | 13 +++++++
> + tools/firmware/include/stdarg.h               | 10 +++++
> + tools/firmware/include/stdbool.h              |  9 +++++
> + tools/firmware/include/stddef.h               | 10 +++++
> + tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
> + tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
> + 6 files changed, 82 insertions(+), 3 deletions(-)
> + create mode 100644 tools/firmware/include/stdarg.h
> + create mode 100644 tools/firmware/include/stdbool.h
> + create mode 100644 tools/firmware/include/stddef.h
> + create mode 100644 tools/firmware/include/stdint.h
> +
> +diff --git a/tools/firmware/include/stdarg.h b/tools/firmware/include/stdarg.h
> +new file mode 100644
> +index 0000000000..c5e3761cd2
> +--- /dev/null
> ++++ b/tools/firmware/include/stdarg.h
> +@@ -0,0 +1,10 @@
> ++#ifndef _STDARG_H_
> ++#define _STDARG_H_
> ++
> ++typedef __builtin_va_list va_list;
> ++#define va_copy(dest, src) __builtin_va_copy(dest, src)
> ++#define va_start(ap, last) __builtin_va_start(ap, last)
> ++#define va_end(ap) __builtin_va_end(ap)
> ++#define va_arg __builtin_va_arg
> ++
> ++#endif
> +diff --git a/tools/firmware/include/stdbool.h b/tools/firmware/include/stdbool.h
> +new file mode 100644
> +index 0000000000..0cf76b106c
> +--- /dev/null
> ++++ b/tools/firmware/include/stdbool.h
> +@@ -0,0 +1,9 @@
> ++#ifndef _STDBOOL_H_
> ++#define _STDBOOL_H_
> ++
> ++#define bool _Bool
> ++#define true 1
> ++#define false 0
> ++#define __bool_true_false_are_defined 1
> ++
> ++#endif
> +diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
> +new file mode 100644
> +index 0000000000..c7f974608a
> +--- /dev/null
> ++++ b/tools/firmware/include/stddef.h
> +@@ -0,0 +1,10 @@
> ++#ifndef _STDDEF_H_
> ++#define _STDDEF_H_
> ++
> ++typedef __SIZE_TYPE__ size_t;
> ++
> ++#define NULL ((void*)0)
> ++
> ++#define offsetof(t, m) __builtin_offsetof(t, m)
> ++
> ++#endif
> +diff --git a/tools/firmware/include/stdint.h b/tools/firmware/include/stdint.h
> +new file mode 100644
> +index 0000000000..16a0b6de19
> +--- /dev/null
> ++++ b/tools/firmware/include/stdint.h
> +@@ -0,0 +1,39 @@
> ++#ifndef _STDINT_H_
> ++#define _STDINT_H_
> ++
> ++#if defined(__LP64__) || defined(__P64__)
> ++#error "32bit only header"
> ++#endif
> ++
> ++typedef unsigned char uint8_t;
> ++typedef signed char int8_t;
> ++
> ++typedef unsigned short uint16_t;
> ++typedef signed short int16_t;
> ++
> ++typedef unsigned int uint32_t;
> ++typedef signed int int32_t;
> ++
> ++typedef unsigned long long uint64_t;
> ++typedef signed long long int64_t;
> ++
> ++#define INT8_MIN        (-0x7f-1)
> ++#define INT16_MIN       (-0x7fff-1)
> ++#define INT32_MIN       (-0x7fffffff-1)
> ++#define INT64_MIN       (-0x7fffffffffffffffll-1)
> ++
> ++#define INT8_MAX        0x7f
> ++#define INT16_MAX       0x7fff
> ++#define INT32_MAX       0x7fffffff
> ++#define INT64_MAX       0x7fffffffffffffffll
> ++
> ++#define UINT8_MAX       0xff
> ++#define UINT16_MAX      0xffff
> ++#define UINT32_MAX      0xffffffffu
> ++#define UINT64_MAX      0xffffffffffffffffull
> ++
> ++typedef uint32_t uintptr_t;
> ++
> ++#define UINTPTR_MAX     UINT32_MAX
> ++
> ++#endif
> +diff --git a/tools/firmware/rombios/32bit/rombios_compat.h b/tools/firmware/rombios/32bit/rombios_compat.h
> +index 3fe7d67721..8ba4c17ffd 100644
> +--- a/tools/firmware/rombios/32bit/rombios_compat.h
> ++++ b/tools/firmware/rombios/32bit/rombios_compat.h
> +@@ -8,9 +8,7 @@
> + 
> + #define ADDR_FROM_SEG_OFF(seg, off)  (void *)((((uint32_t)(seg)) << 4) + (off))
> + 
> +-typedef unsigned char uint8_t;
> +-typedef unsigned short int uint16_t;
> +-typedef unsigned int uint32_t;
> ++#include <stdint.h>
> + 
> + typedef uint8_t  Bit8u;
> + typedef uint16_t Bit16u;
> +diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
> +index 26bbddccd4..cb388b7011 100644
> +--- a/tools/firmware/Rules.mk
> ++++ b/tools/firmware/Rules.mk
> +@@ -17,3 +17,16 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> + 
> + # Extra CFLAGS suitable for an embedded type of environment.
> + CFLAGS += -fno-builtin -msoft-float
> ++
> ++# Use our own set of stand alone headers to build firmware.
> ++#
> ++# Ideally using -ffreestanding should be enough, but that relies on the
> ++# compiler having the right order for include paths (ie: compiler private
> ++# headers before system ones) or the libc headers having proper arch-agnostic
> ++# freestanding support. This is not the case in Alpine at least which searches
> ++# system headers before compiler ones and has arch-specific libc headers. This
> ++# has been reported upstream:
> ++# https://gitlab.alpinelinux.org/alpine/aports/-/issues/12477
> ++# In the meantime (and for resilience against broken systems) use our own set
> ++# of headers that provide what's needed for the firmware build.
> ++CFLAGS += -nostdinc -I$(XEN_ROOT)/tools/firmware/include
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch b/recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
> new file mode 100644
> index 0000000..001b196
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
> @@ -0,0 +1,83 @@
> +From 0eae016b6e3dce69e3fb86aca5c4f221591a2f12 Mon Sep 17 00:00:00 2001
> +From: Andrew Cooper <andrew.cooper3@citrix.com>
> +Date: Thu, 25 Feb 2021 19:15:08 +0000
> +Subject: [PATCH] tools/firmware: Build firmware as -ffreestanding
> +
> +firmware should always have been -ffreestanding, as it doesn't execute in the
> +host environment.  -ffreestanding implies -fno-builtin, so replace the option.
> +
> +inttypes.h isn't a freestanding header, but the 32bitbios_support.c only wants
> +the stdint.h types so switch to the more appropriate include.
> +
> +This removes the build time dependency on a 32bit libc just to compile the
> +hvmloader and friends.
> +
> +Update README and the TravisCI configuration.
> +
> +Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> +Reviewed-by: Jan Beulich <jbeulich@suse.com>
> +Reviewed-by: Ian Jackson <iwj@xenproject.org>
> +Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> +Applied to m-v Xen 4.14 series: Christopher Clark <christopher.w.clark@gmail.com>
> +---
> + .travis.yml                                  | 1 -
> + README                                       | 3 ---
> + tools/firmware/Rules.mk                      | 2 +-
> + tools/firmware/hvmloader/32bitbios_support.c | 2 +-
> + 4 files changed, 2 insertions(+), 6 deletions(-)
> +
> +diff --git a/.travis.yml b/.travis.yml
> +index 15ca9e9047..2362475f7a 100644
> +--- a/.travis.yml
> ++++ b/.travis.yml
> +@@ -58,7 +58,6 @@ addons:
> +             - acpica-tools
> +             - bin86
> +             - bcc
> +-            - libc6-dev-i386
> +             - libnl-3-dev
> +             - ocaml-nox
> +             - libfindlib-ocaml-dev
> +diff --git a/README b/README
> +index 6e15242ae1..8c99c30986 100644
> +--- a/README
> ++++ b/README
> +@@ -62,9 +62,6 @@ provided by your OS distributor:
> +     * GNU bison and GNU flex
> +     * GNU gettext
> +     * ACPI ASL compiler (iasl)
> +-    * Libc multiarch package (e.g. libc6-dev-i386 / glibc-devel.i686).
> +-      Required when building on a 64-bit platform to build
> +-      32-bit components which are enabled on a default build.
> + 
> + In addition to the above there are a number of optional build
> + prerequisites. Omitting these will cause the related features to be
> +diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
> +index cb388b7011..9f78a7dec9 100644
> +--- a/tools/firmware/Rules.mk
> ++++ b/tools/firmware/Rules.mk
> +@@ -16,7 +16,7 @@ CFLAGS += -Werror
> + $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> + 
> + # Extra CFLAGS suitable for an embedded type of environment.
> +-CFLAGS += -fno-builtin -msoft-float
> ++CFLAGS += -ffreestanding -msoft-float
> + 
> + # Use our own set of stand alone headers to build firmware.
> + #
> +diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmware/hvmloader/32bitbios_support.c
> +index 114135022e..ef681d4f57 100644
> +--- a/tools/firmware/hvmloader/32bitbios_support.c
> ++++ b/tools/firmware/hvmloader/32bitbios_support.c
> +@@ -20,7 +20,7 @@
> +  * this program; If not, see <http://www.gnu.org/licenses/>.
> +  */
> + 
> +-#include <inttypes.h>
> ++#include <stdint.h>
> + #include <elf.h>
> + #ifdef __sun__
> + #include <sys/machelf.h>
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
> index a79b41d..10982a2 100644
> --- a/recipes-extended/xen/xen-tools_4.14.bb
> +++ b/recipes-extended/xen/xen-tools_4.14.bb
> @@ -6,6 +6,8 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> +    file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch \
> +    file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch \
>      "
>  
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> -- 
> 2.25.1
> 
