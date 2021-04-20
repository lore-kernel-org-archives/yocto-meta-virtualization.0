Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web08.3737.1618955506542536815
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 14:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GafKBC2V;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id h11so8992304pfn.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Apr 2021 14:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=u/VPHJBYZ2LyF5tAMSMgNCQvjdkeChcePkgnlfvJgV8=;
        b=GafKBC2V68aSffzW4mGBZ9UvT9SAKfz+xYQsOFLMYFwMgm4033YwhIoGS/yHz3Tu0R
         wm/khk1MMjeEIqR3hfLYHcQbUkPlLoQhRwOVq4XYNgRn87JjFKr78FBa4m5f5JsS02Zx
         rbV+FaTmTQLwUnbl/8R+1mh/y0McECK3zz4GqSOYd35DKqmRoyf/yI6iqcxXUx1Esjsx
         4oTSUDavzphVrC46+9LAoYL9t9J8XLB2sTVO79xxhxs6kUgXzu4VIH08D1jWOmmiSslg
         2Y3uV/gGlPEEJ07D3UDNY/xIchRmwYU2rfzXn7vKl+qABwRyFxCYIxF7hi2bmfzYT4DW
         UlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=u/VPHJBYZ2LyF5tAMSMgNCQvjdkeChcePkgnlfvJgV8=;
        b=ZwsqU3RE4788RU9iwCgHvFBnVuXuAwpVh9/SlnrGH7Dibu4PeSZZXUehf+bAwy/3jn
         bRUy9Nq0FoYU3i5yt3aOjQdR0iY88vGxjBu1ualDLaOu0EfMT+dPxKzvDWwvUnGVF+RL
         1MjQzg9JTK7azet1KEzR2fTou6cZReKa60tnlx6RsogLhQaMjMbRO0KTVxSuko+Ioznt
         P8kvPVKJXL+LVr9ziRu3WMVNl3zv4NUC8RPmv85+JBAAOaeWE1ePW953BXJPk4590vqi
         dBXxFjXMq3DKJCyW7F7UeXytzdiINGw0L4+3+yJQaRLfxk4SLRx0lNU61tWmQbQLiMV2
         V4lg==
X-Gm-Message-State: AOAM531ATg3jgLmHY9jd7/Pn6tjyWvBTdrv9ssgE3zRW+cg6mXuALN7d
	ETooHYncaBFWZJJQmeHeHyU=
X-Google-Smtp-Source: ABdhPJyx3bY3gwV52yOWmN/l3/jxybJbtjs7NsYwmrSUOcOktidVlt/l2QXmF1mZKtLZuux82PpyjA==
X-Received: by 2002:a63:120a:: with SMTP id h10mr19111923pgl.212.1618955505928;
        Tue, 20 Apr 2021 14:51:45 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from [10.209.143.221] (mobile-166-176-184-159.mycingular.net. [166.176.184.159])
        by smtp.gmail.com with ESMTPSA id i9sm90206pjh.9.2021.04.20.14.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 14:51:45 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [meta-virtualization][PATCH 1/3] xen-tools: add patches for 4.14 to enable dropping multilib build
Date: Tue, 20 Apr 2021 14:51:09 -0700
Message-Id: <E8BE86C1-5C34-40E3-94D2-DA445243A28C@gmail.com>
References: <20210420210051.GA1997@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
 Bertrand.Marquis@arm.com
In-Reply-To: <20210420210051.GA1997@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: iPhone Mail (18D52)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Apr 20, 2021, at 2:00 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>=20
> =EF=BB=BFThese look good to me.
>=20
> I've queued them on master .. were you also interested in
> getting them into hardknott ?

Yes, I am. I=E2=80=99d appreciate any test reports too.

Christopher=20

>=20
> Bruce
>=20
> In message: [meta-virtualization][PATCH 1/3] xen-tools: add patches for 4.=
14 to enable dropping multilib build
>> on 19/04/2021 Christopher Clark wrote:
>>=20
>> Backport Xen patches to enable hvmloader to be built without needing
>> 32-bit glibc.
>>=20
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> ---
>> ...-stand-alone-set-of-headers-Xen-4.14.patch | 178 ++++++++++++++++++
>> ...d-firmware-as-ffreestanding-Xen-4.14.patch |  83 ++++++++
>> recipes-extended/xen/xen-tools_4.14.bb        |   2 +
>> 3 files changed, 263 insertions(+)
>> create mode 100644 recipes-extended/xen/files/0001-firmware-provide-a-sta=
nd-alone-set-of-headers-Xen-4.14.patch
>> create mode 100644 recipes-extended/xen/files/0001-tools-firmware-Build-f=
irmware-as-ffreestanding-Xen-4.14.patch
>>=20
>> diff --git a/recipes-extended/xen/files/0001-firmware-provide-a-stand-alo=
ne-set-of-headers-Xen-4.14.patch b/recipes-extended/xen/files/0001-firmware-=
provide-a-stand-alone-set-of-headers-Xen-4.14.patch
>> new file mode 100644
>> index 0000000..7b062b7
>> --- /dev/null
>> +++ b/recipes-extended/xen/files/0001-firmware-provide-a-stand-alone-set-=
of-headers-Xen-4.14.patch
>> @@ -0,0 +1,178 @@
>> +=46rom 73b13705af7c3bb8fdf11932eb68788d090a443f Mon Sep 17 00:00:00 2001=

>> +From: =3D?UTF-8?q?Roger=3D20Pau=3D20Monn=3DC3=3DA9?=3D <roger.pau@citrix=
.com>
>> +Date: Thu, 4 Mar 2021 16:49:00 +0100
>> +Subject: [PATCH] firmware: provide a stand alone set of headers
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The current build of the firmware relies on having 32bit compatible
>> +headers installed in order to build some of the 32bit firmware.
>> +Usually this can be solved by using the -ffreestanding compiler option
>> +which drops the usage of the system headers in favor of a private set
>> +of freestanding headers provided by the compiler itself that are not
>> +tied to libc.
>> +
>> +However such option is broken at least in the gcc compiler provided in
>> +Alpine Linux, as the system include path (ie: /usr/include) takes
>> +precedence over the gcc private include path:
>> +
>> +#include <...> search starts here:
>> + /usr/include
>> + /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
>> +
>> +And the headers in /usr/include are exclusively 64bit.
>> +
>> +Since -ffreestanding is currently broken on at least that distro, and
>> +for resilience against future compilers also having the option broken
>> +provide a set of stand alone 32bit headers required for the firmware
>> +build.
>> +
>> +Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> +Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> +Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>> +Applied to Xen 4.14 by: Christopher Clark <christopher.w.clark@gmail.com=
>
>> +---
>> + tools/firmware/Rules.mk                       | 13 +++++++
>> + tools/firmware/include/stdarg.h               | 10 +++++
>> + tools/firmware/include/stdbool.h              |  9 +++++
>> + tools/firmware/include/stddef.h               | 10 +++++
>> + tools/firmware/include/stdint.h               | 39 +++++++++++++++++++
>> + tools/firmware/rombios/32bit/rombios_compat.h |  4 +-
>> + 6 files changed, 82 insertions(+), 3 deletions(-)
>> + create mode 100644 tools/firmware/include/stdarg.h
>> + create mode 100644 tools/firmware/include/stdbool.h
>> + create mode 100644 tools/firmware/include/stddef.h
>> + create mode 100644 tools/firmware/include/stdint.h
>> +
>> +diff --git a/tools/firmware/include/stdarg.h b/tools/firmware/include/st=
darg.h
>> +new file mode 100644
>> +index 0000000000..c5e3761cd2
>> +--- /dev/null
>> ++++ b/tools/firmware/include/stdarg.h
>> +@@ -0,0 +1,10 @@
>> ++#ifndef _STDARG_H_
>> ++#define _STDARG_H_
>> ++
>> ++typedef __builtin_va_list va_list;
>> ++#define va_copy(dest, src) __builtin_va_copy(dest, src)
>> ++#define va_start(ap, last) __builtin_va_start(ap, last)
>> ++#define va_end(ap) __builtin_va_end(ap)
>> ++#define va_arg __builtin_va_arg
>> ++
>> ++#endif
>> +diff --git a/tools/firmware/include/stdbool.h b/tools/firmware/include/s=
tdbool.h
>> +new file mode 100644
>> +index 0000000000..0cf76b106c
>> +--- /dev/null
>> ++++ b/tools/firmware/include/stdbool.h
>> +@@ -0,0 +1,9 @@
>> ++#ifndef _STDBOOL_H_
>> ++#define _STDBOOL_H_
>> ++
>> ++#define bool _Bool
>> ++#define true 1
>> ++#define false 0
>> ++#define __bool_true_false_are_defined 1
>> ++
>> ++#endif
>> +diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/st=
ddef.h
>> +new file mode 100644
>> +index 0000000000..c7f974608a
>> +--- /dev/null
>> ++++ b/tools/firmware/include/stddef.h
>> +@@ -0,0 +1,10 @@
>> ++#ifndef _STDDEF_H_
>> ++#define _STDDEF_H_
>> ++
>> ++typedef __SIZE_TYPE__ size_t;
>> ++
>> ++#define NULL ((void*)0)
>> ++
>> ++#define offsetof(t, m) __builtin_offsetof(t, m)
>> ++
>> ++#endif
>> +diff --git a/tools/firmware/include/stdint.h b/tools/firmware/include/st=
dint.h
>> +new file mode 100644
>> +index 0000000000..16a0b6de19
>> +--- /dev/null
>> ++++ b/tools/firmware/include/stdint.h
>> +@@ -0,0 +1,39 @@
>> ++#ifndef _STDINT_H_
>> ++#define _STDINT_H_
>> ++
>> ++#if defined(__LP64__) || defined(__P64__)
>> ++#error "32bit only header"
>> ++#endif
>> ++
>> ++typedef unsigned char uint8_t;
>> ++typedef signed char int8_t;
>> ++
>> ++typedef unsigned short uint16_t;
>> ++typedef signed short int16_t;
>> ++
>> ++typedef unsigned int uint32_t;
>> ++typedef signed int int32_t;
>> ++
>> ++typedef unsigned long long uint64_t;
>> ++typedef signed long long int64_t;
>> ++
>> ++#define INT8_MIN        (-0x7f-1)
>> ++#define INT16_MIN       (-0x7fff-1)
>> ++#define INT32_MIN       (-0x7fffffff-1)
>> ++#define INT64_MIN       (-0x7fffffffffffffffll-1)
>> ++
>> ++#define INT8_MAX        0x7f
>> ++#define INT16_MAX       0x7fff
>> ++#define INT32_MAX       0x7fffffff
>> ++#define INT64_MAX       0x7fffffffffffffffll
>> ++
>> ++#define UINT8_MAX       0xff
>> ++#define UINT16_MAX      0xffff
>> ++#define UINT32_MAX      0xffffffffu
>> ++#define UINT64_MAX      0xffffffffffffffffull
>> ++
>> ++typedef uint32_t uintptr_t;
>> ++
>> ++#define UINTPTR_MAX     UINT32_MAX
>> ++
>> ++#endif
>> +diff --git a/tools/firmware/rombios/32bit/rombios_compat.h b/tools/firmw=
are/rombios/32bit/rombios_compat.h
>> +index 3fe7d67721..8ba4c17ffd 100644
>> +--- a/tools/firmware/rombios/32bit/rombios_compat.h
>> ++++ b/tools/firmware/rombios/32bit/rombios_compat.h
>> +@@ -8,9 +8,7 @@
>> +=20
>> + #define ADDR_FROM_SEG_OFF(seg, off)  (void *)((((uint32_t)(seg)) << 4) +=
 (off))
>> +=20
>> +-typedef unsigned char uint8_t;
>> +-typedef unsigned short int uint16_t;
>> +-typedef unsigned int uint32_t;
>> ++#include <stdint.h>
>> +=20
>> + typedef uint8_t  Bit8u;
>> + typedef uint16_t Bit16u;
>> +diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
>> +index 26bbddccd4..cb388b7011 100644
>> +--- a/tools/firmware/Rules.mk
>> ++++ b/tools/firmware/Rules.mk
>> +@@ -17,3 +17,16 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLA=
GS))
>> +=20
>> + # Extra CFLAGS suitable for an embedded type of environment.
>> + CFLAGS +=3D -fno-builtin -msoft-float
>> ++
>> ++# Use our own set of stand alone headers to build firmware.
>> ++#
>> ++# Ideally using -ffreestanding should be enough, but that relies on the=

>> ++# compiler having the right order for include paths (ie: compiler priva=
te
>> ++# headers before system ones) or the libc headers having proper arch-ag=
nostic
>> ++# freestanding support. This is not the case in Alpine at least which s=
earches
>> ++# system headers before compiler ones and has arch-specific libc header=
s. This
>> ++# has been reported upstream:
>> ++# https://gitlab.alpinelinux.org/alpine/aports/-/issues/12477
>> ++# In the meantime (and for resilience against broken systems) use our o=
wn set
>> ++# of headers that provide what's needed for the firmware build.
>> ++CFLAGS +=3D -nostdinc -I$(XEN_ROOT)/tools/firmware/include
>> +--=20
>> +2.25.1
>> +
>> diff --git a/recipes-extended/xen/files/0001-tools-firmware-Build-firmwar=
e-as-ffreestanding-Xen-4.14.patch b/recipes-extended/xen/files/0001-tools-fi=
rmware-Build-firmware-as-ffreestanding-Xen-4.14.patch
>> new file mode 100644
>> index 0000000..001b196
>> --- /dev/null
>> +++ b/recipes-extended/xen/files/0001-tools-firmware-Build-firmware-as-ff=
reestanding-Xen-4.14.patch
>> @@ -0,0 +1,83 @@
>> +=46rom 0eae016b6e3dce69e3fb86aca5c4f221591a2f12 Mon Sep 17 00:00:00 2001=

>> +From: Andrew Cooper <andrew.cooper3@citrix.com>
>> +Date: Thu, 25 Feb 2021 19:15:08 +0000
>> +Subject: [PATCH] tools/firmware: Build firmware as -ffreestanding
>> +
>> +firmware should always have been -ffreestanding, as it doesn't execute i=
n the
>> +host environment.  -ffreestanding implies -fno-builtin, so replace the o=
ption.
>> +
>> +inttypes.h isn't a freestanding header, but the 32bitbios_support.c only=
 wants
>> +the stdint.h types so switch to the more appropriate include.
>> +
>> +This removes the build time dependency on a 32bit libc just to compile t=
he
>> +hvmloader and friends.
>> +
>> +Update README and the TravisCI configuration.
>> +
>> +Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> +Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> +Reviewed-by: Ian Jackson <iwj@xenproject.org>
>> +Release-Acked-by: Ian Jackson <iwj@xenproject.org>
>> +Applied to m-v Xen 4.14 series: Christopher Clark <christopher.w.clark@g=
mail.com>
>> +---
>> + .travis.yml                                  | 1 -
>> + README                                       | 3 ---
>> + tools/firmware/Rules.mk                      | 2 +-
>> + tools/firmware/hvmloader/32bitbios_support.c | 2 +-
>> + 4 files changed, 2 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/.travis.yml b/.travis.yml
>> +index 15ca9e9047..2362475f7a 100644
>> +--- a/.travis.yml
>> ++++ b/.travis.yml
>> +@@ -58,7 +58,6 @@ addons:
>> +             - acpica-tools
>> +             - bin86
>> +             - bcc
>> +-            - libc6-dev-i386
>> +             - libnl-3-dev
>> +             - ocaml-nox
>> +             - libfindlib-ocaml-dev
>> +diff --git a/README b/README
>> +index 6e15242ae1..8c99c30986 100644
>> +--- a/README
>> ++++ b/README
>> +@@ -62,9 +62,6 @@ provided by your OS distributor:
>> +     * GNU bison and GNU flex
>> +     * GNU gettext
>> +     * ACPI ASL compiler (iasl)
>> +-    * Libc multiarch package (e.g. libc6-dev-i386 / glibc-devel.i686).
>> +-      Required when building on a 64-bit platform to build
>> +-      32-bit components which are enabled on a default build.
>> +=20
>> + In addition to the above there are a number of optional build
>> + prerequisites. Omitting these will cause the related features to be
>> +diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
>> +index cb388b7011..9f78a7dec9 100644
>> +--- a/tools/firmware/Rules.mk
>> ++++ b/tools/firmware/Rules.mk
>> +@@ -16,7 +16,7 @@ CFLAGS +=3D -Werror
>> + $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>> +=20
>> + # Extra CFLAGS suitable for an embedded type of environment.
>> +-CFLAGS +=3D -fno-builtin -msoft-float
>> ++CFLAGS +=3D -ffreestanding -msoft-float
>> +=20
>> + # Use our own set of stand alone headers to build firmware.
>> + #
>> +diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmwa=
re/hvmloader/32bitbios_support.c
>> +index 114135022e..ef681d4f57 100644
>> +--- a/tools/firmware/hvmloader/32bitbios_support.c
>> ++++ b/tools/firmware/hvmloader/32bitbios_support.c
>> +@@ -20,7 +20,7 @@
>> +  * this program; If not, see <http://www.gnu.org/licenses/>.
>> +  */
>> +=20
>> +-#include <inttypes.h>
>> ++#include <stdint.h>
>> + #include <elf.h>
>> + #ifdef __sun__
>> + #include <sys/machelf.h>
>> +--=20
>> +2.25.1
>> +
>> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xe=
n/xen-tools_4.14.bb
>> index a79b41d..10982a2 100644
>> --- a/recipes-extended/xen/xen-tools_4.14.bb
>> +++ b/recipes-extended/xen/xen-tools_4.14.bb
>> @@ -6,6 +6,8 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
>> SRC_URI =3D " \
>>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>>     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>> +    file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.p=
atch \
>> +    file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.=
patch \
>>     "
>>=20
>> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a=
4e5"
>> --=20
>> 2.25.1
>>=20
