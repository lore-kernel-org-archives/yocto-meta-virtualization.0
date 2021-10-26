Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.12622.1635257295608266707
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 07:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jxufj+8K;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id z20so1053907edi.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Oct 2021 07:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F5Sdy7geYmJOGxqP+CrrgoCDMD8t9kuijqMJ0xNw7/M=;
        b=jxufj+8KO7TIPKDJJdMVPkNyW51L1vg+EzS++Snb7cczG3qYClP8G0LUjgoQ4iUj9c
         b/EfiCMaWEBx1Xay1rujEciaRQHLAlr8roQPsvRluJguR71HLTg/eZwUDLCOgClq0Bd9
         yTgF2mrVCAXuWZau007XKUyMPQnk/sLtgddNpLmebBmyKLTC1gsY/FT2P4yl4t2m9ATA
         GxbnldE3jlepUwFr0ciBYo8mgy3UIbXbrTtktDxc4ps9SGiD8tXrLp/7WBCbCOSpDeL3
         iW65y1gtSeslFS/mGl4+KxxVDsiv4nmVpIH4E13GNdBwZ7jQ37hPh2/CH9+22Y6f1zcH
         3Ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F5Sdy7geYmJOGxqP+CrrgoCDMD8t9kuijqMJ0xNw7/M=;
        b=I0vF6Heof+Psg3acGO7zWuB5GAtPfW1lR3dX8JSggU62iOgNYwb3NdB4+QHsLF8jjR
         5Msp2+FjaKmEK/k6w8TQi1X+qbZ0Z3mTpKbUc0VynnO0cwnEFZ1hkuaEipOYOSKEF7cI
         Pdj/MvRclXgTh3/aZlvu1qXdg3RTXqTmUCIwmrCEx+OMTx00fp9KnkkOalLIwMfj4SbM
         e/H11SBlTjjhAzJ07yYC50m0QGpkjIcdUFbypPztczvmICYIxqD6Ldd9q6reqc7JmK/K
         SHYOlY9bAlWZvOjC+jkrJIXZBC+svqNwXM2Hg7z3SkMwdh8QekhUoxd6ONvgZ+OL99ke
         yvAA==
X-Gm-Message-State: AOAM530FCIqvRm0CCdzpDlX0P2PCfQciwJdnK41NGPwF/oPHoI1H5IND
	nwU8mck0pJzV3QwMIr9AcH/ke5JOYfp5donn1fA=
X-Google-Smtp-Source: ABdhPJzxFkYLrTkqI4//+/OL0rcibiHtFXR7ie/Tov0yudgr8TEtvvf8uwqyEUlRhOOQIY5Dad3iEY2q5SqTLQS1B8s=
X-Received: by 2002:a17:906:9bf9:: with SMTP id de57mr14824948ejc.35.1635257179098;
 Tue, 26 Oct 2021 07:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211026133204.335413-1-Edward.Pickup@arm.com>
In-Reply-To: <20211026133204.335413-1-Edward.Pickup@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 26 Oct 2021 10:06:08 -0400
Message-ID: <CADkTA4N__a7OO1KRF-fcRpui3Vd2h2S8uai_Uuy+Y--YRVgpWQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen,xen-tools: update xen to new releases
To: Edward Pickup <edward.pickup@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.w.clark@gmail.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="00000000000046db4d05cf41fbb9"

--00000000000046db4d05cf41fbb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 9:32 AM Edward Pickup <edward.pickup@arm.com> wrote=
:

> Update the SHA in recipes for xen and xen-tools to use the latest release=
s;
> update xen 4.14 to xen 4.14.3 release, update xen 4.15 to 4.15.1 release,
> and
> xen 4.16 to the current master version.
>
> Add a comment to each recipe indicating which version of Xen is used in
> recipe.
>
> Do not apply patches that have been merged/solved in Xen and remove patch
> files
> not needed anymore.
>
> Create a test package to pack new tests introduced in 4.16.
>
> Add a depencency to util-linux-prlimit, as the xen 4.16 x86 requires
> prlimit,
> without this boot of dom0 fails.
>


Given your other email, I assume that the 4.16 bump isn't building for
qemuarm64 ? Otherwise, they are all building for the supported targets ?

Bruce


>
> Signed-off-by: Edward Pickup <Edward.Pickup@arm.com>
> ---
>  ...ry-Fix-osdep_xenforeignmemory_map-pr.patch |  33 ------
>  ...x86-make-hypervisor-build-with-gcc11.patch | 111 ------------------
>  ...-around-build-issue-with-GNU-ld-2.37.patch |  36 ------
>  recipes-extended/xen/xen-tools.inc            |  29 +++++
>  recipes-extended/xen/xen-tools_4.14.bb        |   5 +-
>  recipes-extended/xen/xen-tools_4.15.bb        |   5 +-
>  recipes-extended/xen/xen-tools_git.bb         |   5 +-
>  recipes-extended/xen/xen_4.14.bb              |   4 +-
>  recipes-extended/xen/xen_4.15.bb              |   5 +-
>  recipes-extended/xen/xen_git.bb               |   5 +-
>  10 files changed, 41 insertions(+), 197 deletions(-)
>  delete mode 100644
> recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignme=
mory_map-pr.patch
>  delete mode 100644
> recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patc=
h
>  delete mode 100644
> recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld-2=
.37.patch
>
> diff --git
> a/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeign=
memory_map-pr.patch
> b/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeign=
memory_map-pr.patch
> deleted file mode 100644
> index 2e3b1a6..0000000
> ---
> a/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeign=
memory_map-pr.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001
> -From: Anthony PERARD <anthony.perard@citrix.com>
> -Date: Tue, 1 Jun 2021 16:41:47 +0100
> -Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map
> prototype
> -
> -Commit cf8c4d3d13b8 made some preparation to have one day
> -variable-length-array argument, but didn't declare the array in the
> -function prototype the same way as in the function definition. And now
> -GCC 11 complains about it.
> -
> -Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length
> argument to map forward")
> -Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> -Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ----
> - tools/libs/foreignmemory/private.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tools/libs/foreignmemory/private.h
> b/tools/libs/foreignmemory/private.h
> -index 1ee3626dd2..5bb0cefb09 100644
> ---- a/tools/libs/foreignmemory/private.h
> -+++ b/tools/libs/foreignmemory/private.h
> -@@ -32,7 +32,7 @@ int
> osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem);
> - void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
> -                                  uint32_t dom, void *addr,
> -                                  int prot, int flags, size_t num,
> --                                 const xen_pfn_t arr[num], int err[num]=
);
> -+                                 const xen_pfn_t arr[/*num*/], int
> err[/*num*/]);
> - int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
> -                                  void *addr, size_t num);
> -
> ---
> -2.25.1
> -
> diff --git
> a/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.pa=
tch
> b/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.pa=
tch
> deleted file mode 100644
> index 72592c4..0000000
> ---
> a/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.pa=
tch
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -From 722f59d38c710a940ab05e542a83020eb5546dea Mon Sep 17 00:00:00 2001
> -From: Jan Beulich <jbeulich@suse.com>
> -Date: Thu, 27 May 2021 14:40:29 +0200
> -Subject: [PATCH] x86: make hypervisor build with gcc11
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Gcc 11 looks to make incorrect assumptions about valid ranges that
> -pointers may be used for addressing when they are derived from e.g. a
> -plain constant. See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D10068=
0.
> -
> -Utilize RELOC_HIDE() to work around the issue, which for x86 manifests
> -in at least
> -- mpparse.c:efi_check_config(),
> -- tboot.c:tboot_probe(),
> -- tboot.c:tboot_gen_frametable_integrity(),
> -- x86_emulate.c:x86_emulate() (at -O2 only).
> -The last case is particularly odd not just because it only triggers at
> -higher optimization levels, but also because it only affects one of at
> -least three similar constructs. Various "note" diagnostics claim the
> -valid index range to be [0, 2=E2=81=B6=C2=B3-1].
> -
> -Signed-off-by: Jan Beulich <jbeulich@suse.com>
> -Tested-by: Jason Andryuk <jandryuk@gmail.com>
> -Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ----
> - tools/tests/x86_emulator/x86-emulate.c | 7 +++++++
> - xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
> - xen/include/asm-x86/fixmap.h           | 2 +-
> - xen/include/xen/compiler.h             | 6 ++++++
> - xen/include/xen/pdx.h                  | 2 +-
> - 5 files changed, 16 insertions(+), 3 deletions(-)
> -
> -diff --git a/tools/tests/x86_emulator/x86-emulate.c
> b/tools/tests/x86_emulator/x86-emulate.c
> -index 07f892dbbb..ea286d6ad8 100644
> ---- a/tools/tests/x86_emulator/x86-emulate.c
> -+++ b/tools/tests/x86_emulator/x86-emulate.c
> -@@ -8,6 +8,13 @@
> -
> - #define ERR_PTR(val) NULL
> -
> -+/* See gcc bug 100680, but here don't bother making this version
> dependent. */
> -+#define gcc11_wrap(x) ({                  \
> -+    unsigned long x_;                     \
> -+    __asm__ ( "" : "=3Dg" (x_) : "0" (x) ); \
> -+    (typeof(x))x_;                        \
> -+})
> -+
> - #define cpu_has_amd_erratum(nr) 0
> - #define cpu_has_mpx false
> - #define read_bndcfgu() 0
> -diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c
> b/xen/arch/x86/x86_emulate/x86_emulate.c
> -index c25d88d0d8..31fdec030c 100644
> ---- a/xen/arch/x86/x86_emulate/x86_emulate.c
> -+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> -@@ -726,7 +726,7 @@ union vex {
> - #define copy_VEX(ptr, vex) ({ \
> -     if ( !mode_64bit() ) \
> -         (vex).reg |=3D 8; \
> --    (ptr)[0 - PFX_BYTES] =3D ext < ext_8f08 ? 0xc4 : 0x8f; \
> -+    gcc11_wrap(ptr)[0 - PFX_BYTES] =3D ext < ext_8f08 ? 0xc4 : 0x8f; \
> -     (ptr)[1 - PFX_BYTES] =3D (vex).raw[0]; \
> -     (ptr)[2 - PFX_BYTES] =3D (vex).raw[1]; \
> -     container_of((ptr) + 1 - PFX_BYTES, typeof(vex), raw[0]); \
> -diff --git a/xen/include/asm-x86/fixmap.h b/xen/include/asm-x86/fixmap.h
> -index 0db314baeb..20746afd0a 100644
> ---- a/xen/include/asm-x86/fixmap.h
> -+++ b/xen/include/asm-x86/fixmap.h
> -@@ -78,7 +78,7 @@ extern void __set_fixmap(
> -
> - #define clear_fixmap(idx) __set_fixmap(idx, 0, 0)
> -
> --#define __fix_to_virt(x) (FIXADDR_TOP - ((x) << PAGE_SHIFT))
> -+#define __fix_to_virt(x) gcc11_wrap(FIXADDR_TOP - ((x) << PAGE_SHIFT))
> - #define __virt_to_fix(x) ((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_SHIFT=
)
> -
> - #define fix_to_virt(x)   ((void *)__fix_to_virt(x))
> -diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> -index 17cf00e1ec..696c7eb89e 100644
> ---- a/xen/include/xen/compiler.h
> -+++ b/xen/include/xen/compiler.h
> -@@ -140,6 +140,12 @@
> -     __asm__ ("" : "=3Dr"(__ptr) : "0"(ptr));      \
> -     (typeof(ptr)) (__ptr + (off)); })
> -
> -+#if CONFIG_GCC_VERSION >=3D 110000 /* See gcc bug 100680. */
> -+# define gcc11_wrap(x) RELOC_HIDE(x, 0)
> -+#else
> -+# define gcc11_wrap(x) (x)
> -+#endif
> -+
> - #ifdef __GCC_ASM_FLAG_OUTPUTS__
> - # define ASM_FLAG_OUT(yes, no) yes
> - #else
> -diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> -index 770fadc06c..9fcfb0ce52 100644
> ---- a/xen/include/xen/pdx.h
> -+++ b/xen/include/xen/pdx.h
> -@@ -19,7 +19,7 @@ extern u64 pdx_region_mask(u64 base, u64 len);
> - extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
> -
> - #define page_to_pdx(pg)  ((pg) - frame_table)
> --#define pdx_to_page(pdx) (frame_table + (pdx))
> -+#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
> -
> - bool __mfn_valid(unsigned long mfn);
> -
> ---
> -2.25.1
> -
> diff --git
> a/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld=
-2.37.patch
> b/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld=
-2.37.patch
> deleted file mode 100644
> index f5108be..0000000
> ---
> a/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-ld=
-2.37.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 58ad654ebce7ccb272a3f4f3482c03aaad850d31 Mon Sep 17 00:00:00 2001
> -From: Jan Beulich <jbeulich@suse.com>
> -Date: Thu, 22 Jul 2021 11:20:38 +0200
> -Subject: [PATCH] x86: work around build issue with GNU ld 2.37
> -
> -I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
> -which broke the hypervisor build, by no longer accepting section names
> -with a dash in them inside ADDR() (and perhaps other script directives
> -expecting just a section name, not an expression): .note.gnu.build-id
> -is such a section.
> -
> -Quoting all section names passed to ADDR() via DECL_SECTION() works
> -around the regression.
> -
> -Signed-off-by: Jan Beulich <jbeulich@suse.com>
> -Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ----
> - xen/arch/x86/xen.lds.S | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> -index 9c6c1c8005..955d5cf4a0 100644
> ---- a/xen/arch/x86/xen.lds.S
> -+++ b/xen/arch/x86/xen.lds.S
> -@@ -18,7 +18,7 @@ ENTRY(efi_start)
> - #else /* !EFI */
> -
> - #define FORMAT "elf64-x86-64"
> --#define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
> -+#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
> -
> - ENTRY(start_pa)
> -
> ---
> -2.25.1
> -
> diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> index 614f557..d831941 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -102,6 +102,7 @@ RSUGGESTS:${PN}-xencov =3D "${PN}-xencov-split"
>
>  RDEPENDS:${PN}-xencommons =3D "\
>      bash \
> +    util-linux-prlimit \
>      ${PN}-console \
>      ${PN}-xenstore \
>      virtual/xenstored \
> @@ -213,6 +214,9 @@ PACKAGES =3D " \
>      ${PN}-xm-examples \
>      ${PN}-xen-access \
>      ${PN}-xen-memshare \
> +    ${PN}-test \
> +    ${PN}-xen-vmtrace \
> +    ${PN}-xen-mceinj \
>      "
>
>  PROVIDES =3D+ " \
> @@ -684,6 +688,31 @@ FILES:${PN}-xen-memshare +=3D "\
>  # memshare is only built for x86, so allow empty package for other archs
>  ALLOW_EMPTY:${PN}-xen-memshare =3D "1"
>
> +FILES:${PN}-test +=3D "\
> +    ${libdir}/xen/bin/test-xenstore \
> +    ${libdir}/xen/bin/test-resource \
> +    ${libdir}/xen/bin/test-cpu-policy \
> +    ${libdir}/xen/bin/test-tsx \
> +    "
> +
> +# test-xenstore and test-resource currently only exist in 4.16
> +# test-cpu-policy and test-tsx only exist in 4.16 for x86
> +ALLOW_EMPTY:${PN}-test =3D "1"
> +
> +FILES:${PN}-xen-mceinj +=3D"\
> +    ${sbindir}/xen-mceinj \
> +    "
> +
> +# xen-mceinj is only built for x86 4.16, so allow empty package
> +ALLOW_EMPTY:${PN}-xen-mceinj =3D "1"
> +
> +FILES:${PN}-xen-vmtrace +=3D"\
> +    ${sbindir}/xen-vmtrace \
> +    "
> +
> +# xen-vmtrace is only built for x86 4.16, so allow empty package
> +ALLOW_EMPTY:${PN}-xen-vmtrace =3D "1"
> +
>  INSANE_SKIP:${PN} =3D "already-stripped"
>
>  # configure init.d scripts
> diff --git a/recipes-extended/xen/xen-tools_4.14.bb
> b/recipes-extended/xen/xen-tools_4.14.bb
> index ce5dc2e..9d78e44 100644
> --- a/recipes-extended/xen/xen-tools_4.14.bb
> +++ b/recipes-extended/xen/xen-tools_4.14.bb
> @@ -1,4 +1,5 @@
> -SRCREV ?=3D "b6a8c4f72def4d1135ff42660a86276ce2565c8c"
> +# 4.14.3 release SHA
> +SRCREV ?=3D "9f2b6c5ec2ded4c1caf149743e862c5f15d6d083"
>
>  XEN_REL ?=3D "4.14"
>  XEN_BRANCH ?=3D "stable-${XEN_REL}"
> @@ -8,8 +9,6 @@ SRC_URI =3D " \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>
>  file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch=
 \
>
>  file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patc=
h \
> -
> file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
> -    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>
>  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> diff --git a/recipes-extended/xen/xen-tools_4.15.bb
> b/recipes-extended/xen/xen-tools_4.15.bb
> index e9c3bd6..840f162 100644
> --- a/recipes-extended/xen/xen-tools_4.15.bb
> +++ b/recipes-extended/xen/xen-tools_4.15.bb
> @@ -1,4 +1,5 @@
> -SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> +# xen 4.15.1 release sha
> +SRCREV ?=3D "84fa99099b920f7bcde8899e1a9b756078719d7d"
>
>  XEN_REL ?=3D "4.15"
>  XEN_BRANCH ?=3D "stable-${XEN_REL}"
> @@ -6,8 +7,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
>  SRC_URI =3D " \
>      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=3D$%7BXEN_BRANCH%7D> \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> -
> file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
> -    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>
>  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen=
/
> xen-tools_git.bb
> index 6926bd9..8ff9c4c 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,4 +1,5 @@
> -SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
> +# master status on 2020-10-21
> +SRCREV ?=3D "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
>
>  XEN_REL ?=3D "4.16"
>  XEN_BRANCH ?=3D "master"
> @@ -6,8 +7,6 @@ XEN_BRANCH ?=3D "master"
>  SRC_URI =3D " \
>      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=3D$%7BXEN_BRANCH%7D> \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> -
> file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
> -    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>
>  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/
> xen_4.14.bb
> index 291ba16..0d7d20b 100644
> --- a/recipes-extended/xen/xen_4.14.bb
> +++ b/recipes-extended/xen/xen_4.14.bb
> @@ -1,4 +1,5 @@
> -SRCREV ?=3D "b6a8c4f72def4d1135ff42660a86276ce2565c8c"
> +# 4.14.3 release SHA
> +SRCREV ?=3D "9f2b6c5ec2ded4c1caf149743e862c5f15d6d083"
>
>  XEN_REL ?=3D "4.14"
>  XEN_BRANCH ?=3D "stable-${XEN_REL}"
> @@ -7,7 +8,6 @@ SRC_URI =3D " \
>      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=3D$%7BXEN_BRANCH%7D> \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
>
>  file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location=
.patch
> \
> -    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>
>  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/
> xen_4.15.bb
> index 0605441..0cfaf0c 100644
> --- a/recipes-extended/xen/xen_4.15.bb
> +++ b/recipes-extended/xen/xen_4.15.bb
> @@ -1,4 +1,5 @@
> -SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
> +# xen 4.15.1 release sha
> +SRCREV ?=3D "84fa99099b920f7bcde8899e1a9b756078719d7d"
>
>  XEN_REL ?=3D "4.15"
>  XEN_BRANCH ?=3D "stable-${XEN_REL}"
> @@ -7,8 +8,6 @@ SRC_URI =3D " \
>      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=3D$%7BXEN_BRANCH%7D> \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
>
>  file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location=
.patch
> \
> -    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
> -    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>
>  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
> xen_git.bb
> index 12c9403..20227e0 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,4 +1,5 @@
> -SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
> +# master status on 2020-10-21
> +SRCREV ?=3D "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
>
>  XEN_REL ?=3D "4.16"
>  XEN_BRANCH ?=3D "master"
> @@ -7,8 +8,6 @@ SRC_URI =3D " \
>      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=3D$%7BXEN_BRANCH%7D> \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
>
>  file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location=
.patch
> \
> -    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
> -    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
>      "
>
>  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> --
> 2.25.1
>
>
>=20
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000046db4d05cf41fbb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 9:32 AM Edward Pickup &lt;<=
a href=3D"mailto:edward.pickup@arm.com">edward.pickup@arm.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Update the SHA=
 in recipes for xen and xen-tools to use the latest releases;<br>
update xen 4.14 to xen 4.14.3 release, update xen 4.15 to 4.15.1 release, a=
nd<br>
xen 4.16 to the current master version.<br>
<br>
Add a comment to each recipe indicating which version of Xen is used in rec=
ipe.<br>
<br>
Do not apply patches that have been merged/solved in Xen and remove patch f=
iles<br>
not needed anymore.<br>
<br>
Create a test package to pack new tests introduced in 4.16.<br>
<br>
Add a depencency to util-linux-prlimit, as the xen 4.16 x86 requires prlimi=
t,<br>
without this boot of dom0 fails.<br></blockquote><div><br></div><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">Given your =
other email, I assume that the 4.16 bump isn&#39;t building for qemuarm64 ?=
 Otherwise, they are all building for the supported targets ?</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Bruce</div></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Edward Pickup &lt;<a href=3D"mailto:Edward.Pickup@arm.com" t=
arget=3D"_blank">Edward.Pickup@arm.com</a>&gt;<br>
---<br>
=C2=A0...ry-Fix-osdep_xenforeignmemory_map-pr.patch |=C2=A0 33 ------<br>
=C2=A0...x86-make-hypervisor-build-with-gcc11.patch | 111 -----------------=
-<br>
=C2=A0...-around-build-issue-with-GNU-ld-2.37.patch |=C2=A0 36 ------<br>
=C2=A0recipes-extended/xen/xen-tools.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 29 +++++<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_4.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_4.15.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A05 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.14.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.15.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A010 files changed, 41 insertions(+), 197 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/0001-libs-foreignmemory=
-Fix-osdep_xenforeignmemory_map-pr.patch<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/0001-x86-make-hyperviso=
r-build-with-gcc11.patch<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/0001-x86-work-around-bu=
ild-issue-with-GNU-ld-2.37.patch<br>
<br>
diff --git a/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_x=
enforeignmemory_map-pr.patch b/recipes-extended/xen/files/0001-libs-foreign=
memory-Fix-osdep_xenforeignmemory_map-pr.patch<br>
deleted file mode 100644<br>
index 2e3b1a6..0000000<br>
--- a/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforei=
gnmemory_map-pr.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001<br>
-From: Anthony PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.com" targ=
et=3D"_blank">anthony.perard@citrix.com</a>&gt;<br>
-Date: Tue, 1 Jun 2021 16:41:47 +0100<br>
-Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map protot=
ype<br>
-<br>
-Commit cf8c4d3d13b8 made some preparation to have one day<br>
-variable-length-array argument, but didn&#39;t declare the array in the<br=
>
-function prototype the same way as in the function definition. And now<br>
-GCC 11 complains about it.<br>
-<br>
-Fixes: cf8c4d3d13b8 (&quot;tools/libs/foreignmemory: pull array length arg=
ument to map forward&quot;)<br>
-Signed-off-by: Anthony PERARD &lt;<a href=3D"mailto:anthony.perard@citrix.=
com" target=3D"_blank">anthony.perard@citrix.com</a>&gt;<br>
-Reviewed-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
----<br>
- tools/libs/foreignmemory/private.h | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory=
/private.h<br>
-index 1ee3626dd2..5bb0cefb09 100644<br>
---- a/tools/libs/foreignmemory/private.h<br>
-+++ b/tools/libs/foreignmemory/private.h<br>
-@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle=
 *fmem);<br>
- void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t dom, void *addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int prot, int flags, size_t n=
um,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const xen_pfn_t arr[num], int =
err[num]);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const xen_pfn_t arr[/*num*/], =
int err[/*num*/]);<br>
- int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *addr, size_t num);<br>
- <br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with=
-gcc11.patch b/recipes-extended/xen/files/0001-x86-make-hypervisor-build-wi=
th-gcc11.patch<br>
deleted file mode 100644<br>
index 72592c4..0000000<br>
--- a/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.=
patch<br>
+++ /dev/null<br>
@@ -1,111 +0,0 @@<br>
-From 722f59d38c710a940ab05e542a83020eb5546dea Mon Sep 17 00:00:00 2001<br>
-From: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blan=
k">jbeulich@suse.com</a>&gt;<br>
-Date: Thu, 27 May 2021 14:40:29 +0200<br>
-Subject: [PATCH] x86: make hypervisor build with gcc11<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Gcc 11 looks to make incorrect assumptions about valid ranges that<br>
-pointers may be used for addressing when they are derived from e.g. a<br>
-plain constant. See <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D100680" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzil=
la/show_bug.cgi?id=3D100680</a>.<br>
-<br>
-Utilize RELOC_HIDE() to work around the issue, which for x86 manifests<br>
-in at least<br>
-- mpparse.c:efi_check_config(),<br>
-- tboot.c:tboot_probe(),<br>
-- tboot.c:tboot_gen_frametable_integrity(),<br>
-- x86_emulate.c:x86_emulate() (at -O2 only).<br>
-The last case is particularly odd not just because it only triggers at<br>
-higher optimization levels, but also because it only affects one of at<br>
-least three similar constructs. Various &quot;note&quot; diagnostics claim=
 the<br>
-valid index range to be [0, 2=E2=81=B6=C2=B3-1].<br>
-<br>
-Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
-Tested-by: Jason Andryuk &lt;<a href=3D"mailto:jandryuk@gmail.com" target=
=3D"_blank">jandryuk@gmail.com</a>&gt;<br>
-Acked-by: Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com"=
 target=3D"_blank">roger.pau@citrix.com</a>&gt;<br>
----<br>
- tools/tests/x86_emulator/x86-emulate.c | 7 +++++++<br>
- xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-<br>
- xen/include/asm-x86/fixmap.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 =
+-<br>
- xen/include/xen/compiler.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 6 ++++++<br>
- xen/include/xen/pdx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
- 5 files changed, 16 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/tools/tests/x86_emulator/x86-emulate.c b/tools/tests/x86_emul=
ator/x86-emulate.c<br>
-index 07f892dbbb..ea286d6ad8 100644<br>
---- a/tools/tests/x86_emulator/x86-emulate.c<br>
-+++ b/tools/tests/x86_emulator/x86-emulate.c<br>
-@@ -8,6 +8,13 @@<br>
- <br>
- #define ERR_PTR(val) NULL<br>
- <br>
-+/* See gcc bug 100680, but here don&#39;t bother making this version depe=
ndent. */<br>
-+#define gcc11_wrap(x) ({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
-+=C2=A0 =C2=A0 unsigned long x_;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+=C2=A0 =C2=A0 __asm__ ( &quot;&quot; : &quot;=3Dg&quot; (x_) : &quot;0&qu=
ot; (x) ); \<br>
-+=C2=A0 =C2=A0 (typeof(x))x_;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+})<br>
-+<br>
- #define cpu_has_amd_erratum(nr) 0<br>
- #define cpu_has_mpx false<br>
- #define read_bndcfgu() 0<br>
-diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emu=
late/x86_emulate.c<br>
-index c25d88d0d8..31fdec030c 100644<br>
---- a/xen/arch/x86/x86_emulate/x86_emulate.c<br>
-+++ b/xen/arch/x86/x86_emulate/x86_emulate.c<br>
-@@ -726,7 +726,7 @@ union vex {<br>
- #define copy_VEX(ptr, vex) ({ \<br>
-=C2=A0 =C2=A0 =C2=A0if ( !mode_64bit() ) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(vex).reg |=3D 8; \<br>
--=C2=A0 =C2=A0 (ptr)[0 - PFX_BYTES] =3D ext &lt; ext_8f08 ? 0xc4 : 0x8f; \=
<br>
-+=C2=A0 =C2=A0 gcc11_wrap(ptr)[0 - PFX_BYTES] =3D ext &lt; ext_8f08 ? 0xc4=
 : 0x8f; \<br>
-=C2=A0 =C2=A0 =C2=A0(ptr)[1 - PFX_BYTES] =3D (vex).raw[0]; \<br>
-=C2=A0 =C2=A0 =C2=A0(ptr)[2 - PFX_BYTES] =3D (vex).raw[1]; \<br>
-=C2=A0 =C2=A0 =C2=A0container_of((ptr) + 1 - PFX_BYTES, typeof(vex), raw[0=
]); \<br>
-diff --git a/xen/include/asm-x86/fixmap.h b/xen/include/asm-x86/fixmap.h<b=
r>
-index 0db314baeb..20746afd0a 100644<br>
---- a/xen/include/asm-x86/fixmap.h<br>
-+++ b/xen/include/asm-x86/fixmap.h<br>
-@@ -78,7 +78,7 @@ extern void __set_fixmap(<br>
- <br>
- #define clear_fixmap(idx) __set_fixmap(idx, 0, 0)<br>
- <br>
--#define __fix_to_virt(x) (FIXADDR_TOP - ((x) &lt;&lt; PAGE_SHIFT))<br>
-+#define __fix_to_virt(x) gcc11_wrap(FIXADDR_TOP - ((x) &lt;&lt; PAGE_SHIF=
T))<br>
- #define __virt_to_fix(x) ((FIXADDR_TOP - ((x)&amp;PAGE_MASK)) &gt;&gt; PA=
GE_SHIFT)<br>
- <br>
- #define fix_to_virt(x)=C2=A0 =C2=A0((void *)__fix_to_virt(x))<br>
-diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h<br>
-index 17cf00e1ec..696c7eb89e 100644<br>
---- a/xen/include/xen/compiler.h<br>
-+++ b/xen/include/xen/compiler.h<br>
-@@ -140,6 +140,12 @@<br>
-=C2=A0 =C2=A0 =C2=A0__asm__ (&quot;&quot; : &quot;=3Dr&quot;(__ptr) : &quo=
t;0&quot;(ptr));=C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0(typeof(ptr)) (__ptr + (off)); })<br>
- <br>
-+#if CONFIG_GCC_VERSION &gt;=3D 110000 /* See gcc bug 100680. */<br>
-+# define gcc11_wrap(x) RELOC_HIDE(x, 0)<br>
-+#else<br>
-+# define gcc11_wrap(x) (x)<br>
-+#endif<br>
-+<br>
- #ifdef __GCC_ASM_FLAG_OUTPUTS__<br>
- # define ASM_FLAG_OUT(yes, no) yes<br>
- #else<br>
-diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h<br>
-index 770fadc06c..9fcfb0ce52 100644<br>
---- a/xen/include/xen/pdx.h<br>
-+++ b/xen/include/xen/pdx.h<br>
-@@ -19,7 +19,7 @@ extern u64 pdx_region_mask(u64 base, u64 len);<br>
- extern void set_pdx_range(unsigned long smfn, unsigned long emfn);<br>
- <br>
- #define page_to_pdx(pg)=C2=A0 ((pg) - frame_table)<br>
--#define pdx_to_page(pdx) (frame_table + (pdx))<br>
-+#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))<br>
- <br>
- bool __mfn_valid(unsigned long mfn);<br>
- <br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/recipes-extended/xen/files/0001-x86-work-around-build-issue-wi=
th-GNU-ld-2.37.patch b/recipes-extended/xen/files/0001-x86-work-around-buil=
d-issue-with-GNU-ld-2.37.patch<br>
deleted file mode 100644<br>
index f5108be..0000000<br>
--- a/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GNU-=
ld-2.37.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 58ad654ebce7ccb272a3f4f3482c03aaad850d31 Mon Sep 17 00:00:00 2001<br>
-From: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blan=
k">jbeulich@suse.com</a>&gt;<br>
-Date: Thu, 22 Jul 2021 11:20:38 +0200<br>
-Subject: [PATCH] x86: work around build issue with GNU ld 2.37<br>
-<br>
-I suspect it is commit 40726f16a8d7 (&quot;ld script expression parsing&qu=
ot;)<br>
-which broke the hypervisor build, by no longer accepting section names<br>
-with a dash in them inside ADDR() (and perhaps other script directives<br>
-expecting just a section name, not an expression): .note.gnu.build-id<br>
-is such a section.<br>
-<br>
-Quoting all section names passed to ADDR() via DECL_SECTION() works<br>
-around the regression.<br>
-<br>
-Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com" target=
=3D"_blank">jbeulich@suse.com</a>&gt;<br>
-Acked-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" t=
arget=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
----<br>
- xen/arch/x86/xen.lds.S | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S<br>
-index 9c6c1c8005..955d5cf4a0 100644<br>
---- a/xen/arch/x86/xen.lds.S<br>
-+++ b/xen/arch/x86/xen.lds.S<br>
-@@ -18,7 +18,7 @@ ENTRY(efi_start)<br>
- #else /* !EFI */<br>
- <br>
- #define FORMAT &quot;elf64-x86-64&quot;<br>
--#define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)<br>
-+#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)<br>
- <br>
- ENTRY(start_pa)<br>
- <br>
--- <br>
-2.25.1<br>
-<br>
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc<br>
index 614f557..d831941 100644<br>
--- a/recipes-extended/xen/xen-tools.inc<br>
+++ b/recipes-extended/xen/xen-tools.inc<br>
@@ -102,6 +102,7 @@ RSUGGESTS:${PN}-xencov =3D &quot;${PN}-xencov-split&quo=
t;<br>
<br>
=C2=A0RDEPENDS:${PN}-xencommons =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0bash \<br>
+=C2=A0 =C2=A0 util-linux-prlimit \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-console \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-xenstore \<br>
=C2=A0 =C2=A0 =C2=A0virtual/xenstored \<br>
@@ -213,6 +214,9 @@ PACKAGES =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-xm-examples \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-xen-access \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-xen-memshare \<br>
+=C2=A0 =C2=A0 ${PN}-test \<br>
+=C2=A0 =C2=A0 ${PN}-xen-vmtrace \<br>
+=C2=A0 =C2=A0 ${PN}-xen-mceinj \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0PROVIDES =3D+ &quot; \<br>
@@ -684,6 +688,31 @@ FILES:${PN}-xen-memshare +=3D &quot;\<br>
=C2=A0# memshare is only built for x86, so allow empty package for other ar=
chs<br>
=C2=A0ALLOW_EMPTY:${PN}-xen-memshare =3D &quot;1&quot;<br>
<br>
+FILES:${PN}-test +=3D &quot;\<br>
+=C2=A0 =C2=A0 ${libdir}/xen/bin/test-xenstore \<br>
+=C2=A0 =C2=A0 ${libdir}/xen/bin/test-resource \<br>
+=C2=A0 =C2=A0 ${libdir}/xen/bin/test-cpu-policy \<br>
+=C2=A0 =C2=A0 ${libdir}/xen/bin/test-tsx \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+# test-xenstore and test-resource currently only exist in 4.16<br>
+# test-cpu-policy and test-tsx only exist in 4.16 for x86<br>
+ALLOW_EMPTY:${PN}-test =3D &quot;1&quot;<br>
+<br>
+FILES:${PN}-xen-mceinj +=3D&quot;\<br>
+=C2=A0 =C2=A0 ${sbindir}/xen-mceinj \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+# xen-mceinj is only built for x86 4.16, so allow empty package<br>
+ALLOW_EMPTY:${PN}-xen-mceinj =3D &quot;1&quot;<br>
+<br>
+FILES:${PN}-xen-vmtrace +=3D&quot;\<br>
+=C2=A0 =C2=A0 ${sbindir}/xen-vmtrace \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+# xen-vmtrace is only built for x86 4.16, so allow empty package<br>
+ALLOW_EMPTY:${PN}-xen-vmtrace =3D &quot;1&quot;<br>
+<br>
=C2=A0INSANE_SKIP:${PN} =3D &quot;already-stripped&quot;<br>
<br>
=C2=A0# configure init.d scripts<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_4.14.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_4.14.bb</a> b/recipes-extended/=
xen/<a href=3D"http://xen-tools_4.14.bb" rel=3D"noreferrer" target=3D"_blan=
k">xen-tools_4.14.bb</a><br>
index ce5dc2e..9d78e44 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen-tools_4.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.14.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen-tools_4.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.14.bb</a><br>
@@ -1,4 +1,5 @@<br>
-SRCREV ?=3D &quot;b6a8c4f72def4d1135ff42660a86276ce2565c8c&quot;<br>
+# 4.14.3 release SHA<br>
+SRCREV ?=3D &quot;9f2b6c5ec2ded4c1caf149743e862c5f15d6d083&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.14&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
@@ -8,8 +9,6 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-firmware-provide-a-stand-alone-set-of-heade=
rs-Xen-4.14.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-tools-firmware-Build-firmware-as-ffreestand=
ing-Xen-4.14.patch \<br>
-=C2=A0 =C2=A0 file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_ma=
p-pr.patch \<br>
-=C2=A0 =C2=A0 file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b45=
01338e44a4e5&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_4.15.bb</a> b/recipes-extended/=
xen/<a href=3D"http://xen-tools_4.15.bb" rel=3D"noreferrer" target=3D"_blan=
k">xen-tools_4.15.bb</a><br>
index e9c3bd6..840f162 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen-tools_4.15.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.15.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen-tools_4.15.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.15.bb</a><br>
@@ -1,4 +1,5 @@<br>
-SRCREV ?=3D &quot;e25aa9939ae0cd8317605be3d5c5611b76bc4ab4&quot;<br>
+# xen 4.15.1 release sha<br>
+SRCREV ?=3D &quot;84fa99099b920f7bcde8899e1a9b756078719d7d&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.15&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
@@ -6,8 +7,6 @@ XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://xenbits.xen.org/xen.git;branch=
=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/=
xen.git;branch=3D${XEN_BRANCH}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch=
 \<br>
-=C2=A0 =C2=A0 file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_ma=
p-pr.patch \<br>
-=C2=A0 =C2=A0 file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b45=
01338e44a4e5&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a> b/recipes-extended/x=
en/<a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>xen-tools_git.bb</a><br>
index 6926bd9..8ff9c4c 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a><br>
@@ -1,4 +1,5 @@<br>
-SRCREV ?=3D &quot;e680cc48b7184d3489873d6776f84ba1fc238ced&quot;<br>
+# master status on 2020-10-21<br>
+SRCREV ?=3D &quot;23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.16&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;master&quot;<br>
@@ -6,8 +7,6 @@ XEN_BRANCH ?=3D &quot;master&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://xenbits.xen.org/xen.git;branch=
=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/=
xen.git;branch=3D${XEN_BRANCH}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch=
 \<br>
-=C2=A0 =C2=A0 file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_ma=
p-pr.patch \<br>
-=C2=A0 =C2=A0 file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b45=
01338e44a4e5&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">xen_4.14.bb</a> b/recipes-extended/xen/<a href=
=3D"http://xen_4.14.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.14.bb</a=
><br>
index 291ba16..0d7d20b 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_4.14.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.14.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.14.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.14.bb</a><br>
@@ -1,4 +1,5 @@<br>
-SRCREV ?=3D &quot;b6a8c4f72def4d1135ff42660a86276ce2565c8c&quot;<br>
+# 4.14.3 release SHA<br>
+SRCREV ?=3D &quot;9f2b6c5ec2ded4c1caf149743e862c5f15d6d083&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.14&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
@@ -7,7 +8,6 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://xenbits.xen.org/xen.git;branch=
=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/=
xen.git;branch=3D${XEN_BRANCH}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://xen-arm64-implement-atomic-fetch-add.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-menuconfig-mconf-cfg-Allow-specification-of=
-ncurses-location.patch \<br>
-=C2=A0 =C2=A0 file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b45=
01338e44a4e5&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">xen_4.15.bb</a> b/recipes-extended/xen/<a href=
=3D"http://xen_4.15.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.15.bb</a=
><br>
index 0605441..0cfaf0c 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_4.15.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.15.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.15.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.15.bb</a><br>
@@ -1,4 +1,5 @@<br>
-SRCREV ?=3D &quot;e25aa9939ae0cd8317605be3d5c5611b76bc4ab4&quot;<br>
+# xen 4.15.1 release sha<br>
+SRCREV ?=3D &quot;84fa99099b920f7bcde8899e1a9b756078719d7d&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.15&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
@@ -7,8 +8,6 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://xenbits.xen.org/xen.git;branch=
=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/=
xen.git;branch=3D${XEN_BRANCH}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://xen-arm64-implement-atomic-fetch-add.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-menuconfig-mconf-cfg-Allow-specification-of=
-ncurses-location.patch \<br>
-=C2=A0 =C2=A0 file://0001-x86-make-hypervisor-build-with-gcc11.patch \<br>
-=C2=A0 =C2=A0 file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b45=
01338e44a4e5&quot;<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen_git.bb</a> b/recipes-extended/xen/<a href=3D"=
http://xen_git.bb" rel=3D"noreferrer" target=3D"_blank">xen_git.bb</a><br>
index 12c9403..20227e0 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a><br>
@@ -1,4 +1,5 @@<br>
-SRCREV ?=3D &quot;e680cc48b7184d3489873d6776f84ba1fc238ced&quot;<br>
+# master status on 2020-10-21<br>
+SRCREV ?=3D &quot;23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9&quot;<br>
<br>
=C2=A0XEN_REL ?=3D &quot;4.16&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;master&quot;<br>
@@ -7,8 +8,6 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://xenbits.xen.org/xen.git;branch=
=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/=
xen.git;branch=3D${XEN_BRANCH}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://xen-arm64-implement-atomic-fetch-add.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-menuconfig-mconf-cfg-Allow-specification-of=
-ncurses-location.patch \<br>
-=C2=A0 =C2=A0 file://0001-x86-make-hypervisor-build-with-gcc11.patch \<br>
-=C2=A0 =C2=A0 file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b45=
01338e44a4e5&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000046db4d05cf41fbb9--
