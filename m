Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.10583.1625492162580830936
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Jul 2021 06:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s6cwdeRy;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id hr1so25695538ejc.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 05 Jul 2021 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cBPFSTBHljk0KtFWbKt9hfoUbzKmj6SjXUObBt8O1kQ=;
        b=s6cwdeRysNVRtQsn9X9rDHAdFTcdf2Msku+GHUVDtAQ1bjCFUef15eTRtZHt1kcIiy
         wlk52YOTVTfWZSs/YcnxEWS607VtEKr9NMxkYw9HYDr2FkY8GFyPw2esjVdw5XXKJ1zE
         YND+Sr0BQRMIogyDYCBFsAyanPwJQvPyRQT0jRmf0NiOPWqX4vN/REMJ6sx3eRmpDCrg
         0bgqqqGuc9nDrQrnDIm8eZi18YxlH50Jep2386iKC0GesL9toqfdNAbamDHaXAfJHQqT
         7pffmqiGAHoTkm5z14GUiYgg89nuZITuyeE8Ic3sxi0DyMXCAMLwgIB51e2n+9iVFiCs
         ILkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cBPFSTBHljk0KtFWbKt9hfoUbzKmj6SjXUObBt8O1kQ=;
        b=lmhN68ybxqWVUyXJ+582kfOZKSjT1MBcxtSc8sdti5ADx1uzeDc7pePPvEft3PKGGt
         MHDW1V4ZWwl1r6g2ak4k/ZcGMLMooDve7MYL+HrTbTrYvrRn80ptRjwB66dANoSjx1dE
         /2JOSMQ78PHpAEFvOvm0q8Edf9ecHSZVJx2jyaoPhPedcqgGcS8p8mvaod5FyRdHYhMc
         bbSKayQxvGaMbnYYkzni/FURyRIqsfzHfZ/hmohxLUHYdcreVKDn1IBv2qacbf8Zce2w
         UrVIfQg1W5lhv+VrIbZhH9Pm656poi3ewN+QtvI1KxePdE6zdbHmPviuqL1DV8KGFjO3
         eKVQ==
X-Gm-Message-State: AOAM531pAVqhOcGCssb0dw81UDb2z8ULndV4EvP3mqi4MdkI9v3NG0y0
	TON/bm8pWpOkdQPJhl8MdAQNAIb5U1e9mRjyP7M=
X-Google-Smtp-Source: ABdhPJwps+voZelLtDqdeXfat719YP6keA1/W1wGYtYu7oKG2IgPmTrm7Z3loF0OFYCbcJ6hnB7PzD2xR7l+wEC4gK8=
X-Received: by 2002:a17:907:77ca:: with SMTP id kz10mr13506410ejc.22.1625492160767;
 Mon, 05 Jul 2021 06:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210702003206.79756-1-christopher.w.clark@gmail.com>
 <20210702003206.79756-2-christopher.w.clark@gmail.com> <485C80E0-0070-4CD4-963D-69E1422DB882@arm.com>
 <CACMJ4GYuR9iEsFf1ixL1LhALdrQH=2Ov-_f=y94TKjT_Pme9EA@mail.gmail.com>
In-Reply-To: <CACMJ4GYuR9iEsFf1ixL1LhALdrQH=2Ov-_f=y94TKjT_Pme9EA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 5 Jul 2021 09:35:49 -0400
Message-ID: <CADkTA4Pj9ZqYNG8axgcTCaVh91BTcZf5iToZwXOxuXE8BYYy1g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] xen, xen-tools: add upstream patches for gcc11 compilation fixes
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	"cardoe@gentoo.org" <cardoe@gentoo.org>, Diego Sueiro <Diego.Sueiro@arm.com>, 
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>, "persaur@gmail.com" <persaur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 4, 2021 at 5:10 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Fri, Jul 2, 2021 at 5:02 AM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
> >
> > Hi Christopher,
> >
> > > On 2 Jul 2021, at 01:32, Christopher Clark <christopher.w.clark@gmai=
l.com> wrote:
> > >
> > > This allows the -Wno-vla-parameter workaround that was previously
> > > applied (e99974aa57) to be retired.
> > >
> > > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > > ---
> > > ...-rijndaelEncrypt-prototype-for-gcc11.patch |  52 ++++++++
> > > ...ry-Fix-osdep_xenforeignmemory_map-pr.patch |  33 ++++++
> > > ...x86-make-hypervisor-build-with-gcc11.patch | 111 ++++++++++++++++=
++
> > > recipes-extended/xen/xen-tools.inc            |   5 +-
> > > recipes-extended/xen/xen-tools_4.14.bb        |   1 +
> > > recipes-extended/xen/xen-tools_4.15.bb        |   1 +
> > > recipes-extended/xen/xen-tools_git.bb         |   1 +
> > > recipes-extended/xen/xen_4.14.bb              |   2 +
> > > recipes-extended/xen/xen_4.15.bb              |   1 +
> > > recipes-extended/xen/xen_git.bb               |   1 +
> > > 10 files changed, 204 insertions(+), 4 deletions(-)
> > > create mode 100644 recipes-extended/xen/files/0001-crypto-adjust-rij=
ndaelEncrypt-prototype-for-gcc11.patch
> > > create mode 100644 recipes-extended/xen/files/0001-libs-foreignmemor=
y-Fix-osdep_xenforeignmemory_map-pr.patch
> > > create mode 100644 recipes-extended/xen/files/0001-x86-make-hypervis=
or-build-with-gcc11.patch
> > >
> >
> > On my tests git and 4.15 are working and compiling for arm32, arm64 an=
d x86_64 but xen-4.14 does not work:
>
> Thanks, Bertrand -- I appreciate the reviews and testing. I'm taking a
> look into this and will post a v2.

I assume you'll send all three patches in the v2.

If you'd like me to apply any of the others before the v2, just let me kno=
w.

Bruce

>
> Christopher
>
>
> >
> > ERROR: xen-4.14+stableAUTOINC+ad844aa352-r0 do_patch: Command Error: '=
quilt --quiltrc /home/bermar01/Development/xen-dev/build-master/metavirt-ho=
st-arm32-4.14-release.prj/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/xen/=
4.14+stableAUTOINC+ad844aa352-r0/recipe-sysroot-native/etc/quiltrc push' ex=
ited with 0  Output:
> > stdout: Applying patch 0001-crypto-adjust-rijndaelEncrypt-prototype-fo=
r-gcc11.patch
> > patching file xen/include/crypto/rijndael.h
> > Hunk #1 FAILED at 52.
> > 1 out of 1 hunk FAILED -- rejects in file xen/include/crypto/rijndael.=
h
> > Patch 0001-crypto-adjust-rijndaelEncrypt-prototype-for-gcc11.patch doe=
s not apply (enforce with -f)
> >
> > stderr:
> > ERROR: Logfile of failure stored in: /home/bermar01/Development/xen-de=
v/build-master/metavirt-host-arm32-4.14-release.prj/tmp/work/armv7vet2hf-ne=
on-poky-linux-gnueabi/xen/4.14+stableAUTOINC+ad844aa352-r0/temp/log.do_patc=
h.34794
> > NOTE: recipe xen-4.14+stableAUTOINC+ad844aa352-r0: task do_patch: Fail=
ed
> >
> > I used latest master from everything (yocto, open embedded and meta-di=
rt).
> >
> > Regards
> > Bertrand
> >
> > > diff --git a/recipes-extended/xen/files/0001-crypto-adjust-rijndaelE=
ncrypt-prototype-for-gcc11.patch b/recipes-extended/xen/files/0001-crypto-a=
djust-rijndaelEncrypt-prototype-for-gcc11.patch
> > > new file mode 100644
> > > index 0000000..1fc06f8
> > > --- /dev/null
> > > +++ b/recipes-extended/xen/files/0001-crypto-adjust-rijndaelEncrypt-=
prototype-for-gcc11.patch
> > > @@ -0,0 +1,52 @@
> > > +From c6ad5a701b9a6df443a6c98d9e7201c958bbcafc Mon Sep 17 00:00:00 2=
001
> > > +From: Jan Beulich <jbeulich@suse.com>
> > > +Date: Thu, 4 Mar 2021 16:47:51 +0100
> > > +Subject: [PATCH] crypto: adjust rijndaelEncrypt() prototype for gcc=
11
> > > +
> > > +The upcoming release complains, not entirely unreasonably:
> > > +
> > > +In file included from rijndael.c:33:
> > > +.../xen/include/crypto/rijndael.h:55:53: note: previously declared =
as 'const unsigned char[]'
> > > +   55 | void    rijndaelEncrypt(const unsigned int [], int, const u=
nsigned char [],
> > > +      |                                                     ^~~~~~~=
~~~~~~~~~~~~~~~
> > > +rijndael.c:865:8: error: argument 4 of type 'u8[16]' {aka 'unsigned=
 char[16]'} with mismatched bound [-Werror=3Darray-parameter=3D]
> > > +  865 |     u8 ct[16])
> > > +      |     ~~~^~~~~~
> > > +In file included from rijndael.c:33:
> > > +.../xen/include/crypto/rijndael.h:56:13: note: previously declared =
as 'unsigned char[]'
> > > +   56 |             unsigned char []);
> > > +      |             ^~~~~~~~~~~~~~~~
> > > +
> > > +Simply declare the correct array dimensions right away. This then a=
llows
> > > +compilers to apply checking at call sites, which seems desirable an=
yway.
> > > +
> > > +For the moment I'm leaving untouched the disagreement between u8/u3=
2
> > > +used in the function definition and unsigned {char,int} used in the
> > > +declaration, as making this consistent would call for touching furt=
her
> > > +functions.
> > > +
> > > +Reported-by: Charles Arnold <carnold@suse.com>
> > > +Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > +Reviewed-by: Julien Grall <jgrall@amazon.com>
> > > +Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> > > +---
> > > + xen/include/crypto/rijndael.h | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/xen/include/crypto/rijndael.h b/xen/include/crypto/rij=
ndael.h
> > > +index 69965783c5..4386be5878 100644
> > > +--- a/xen/include/crypto/rijndael.h
> > > ++++ b/xen/include/crypto/rijndael.h
> > > +@@ -52,7 +52,7 @@ void        rijndael_encrypt(rijndael_ctx *, cons=
t unsigned char *, unsigned char *);
> > > +
> > > + int rijndaelKeySetupEnc(unsigned int [], const unsigned char [], i=
nt);
> > > + int rijndaelKeySetupDec(unsigned int [], const unsigned char [], i=
nt);
> > > +-void        rijndaelEncrypt(const unsigned int [], int, const unsi=
gned char [],
> > > +-        unsigned char []);
> > > ++void        rijndaelEncrypt(const unsigned int [], int, const unsi=
gned char [16],
> > > ++        unsigned char [16]);
> > > +
> > > + #endif /* __RIJNDAEL_H */
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-=
osdep_xenforeignmemory_map-pr.patch b/recipes-extended/xen/files/0001-libs-=
foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
> > > new file mode 100644
> > > index 0000000..2e3b1a6
> > > --- /dev/null
> > > +++ b/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_x=
enforeignmemory_map-pr.patch
> > > @@ -0,0 +1,33 @@
> > > +From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2=
001
> > > +From: Anthony PERARD <anthony.perard@citrix.com>
> > > +Date: Tue, 1 Jun 2021 16:41:47 +0100
> > > +Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map=
 prototype
> > > +
> > > +Commit cf8c4d3d13b8 made some preparation to have one day
> > > +variable-length-array argument, but didn't declare the array in the
> > > +function prototype the same way as in the function definition. And =
now
> > > +GCC 11 complains about it.
> > > +
> > > +Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length a=
rgument to map forward")
> > > +Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > > +Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > > +---
> > > + tools/libs/foreignmemory/private.h | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreig=
nmemory/private.h
> > > +index 1ee3626dd2..5bb0cefb09 100644
> > > +--- a/tools/libs/foreignmemory/private.h
> > > ++++ b/tools/libs/foreignmemory/private.h
> > > +@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory=
_handle *fmem);
> > > + void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
> > > +                                  uint32_t dom, void *addr,
> > > +                                  int prot, int flags, size_t num,
> > > +-                                 const xen_pfn_t arr[num], int err=
[num]);
> > > ++                                 const xen_pfn_t arr[/*num*/], int=
 err[/*num*/]);
> > > + int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
> > > +                                  void *addr, size_t num);
> > > +
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/recipes-extended/xen/files/0001-x86-make-hypervisor-bui=
ld-with-gcc11.patch b/recipes-extended/xen/files/0001-x86-make-hypervisor-b=
uild-with-gcc11.patch
> > > new file mode 100644
> > > index 0000000..72592c4
> > > --- /dev/null
> > > +++ b/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with=
-gcc11.patch
> > > @@ -0,0 +1,111 @@
> > > +From 722f59d38c710a940ab05e542a83020eb5546dea Mon Sep 17 00:00:00 2=
001
> > > +From: Jan Beulich <jbeulich@suse.com>
> > > +Date: Thu, 27 May 2021 14:40:29 +0200
> > > +Subject: [PATCH] x86: make hypervisor build with gcc11
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +Gcc 11 looks to make incorrect assumptions about valid ranges that
> > > +pointers may be used for addressing when they are derived from e.g.=
 a
> > > +plain constant. See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D=
100680.
> > > +
> > > +Utilize RELOC_HIDE() to work around the issue, which for x86 manife=
sts
> > > +in at least
> > > +- mpparse.c:efi_check_config(),
> > > +- tboot.c:tboot_probe(),
> > > +- tboot.c:tboot_gen_frametable_integrity(),
> > > +- x86_emulate.c:x86_emulate() (at -O2 only).
> > > +The last case is particularly odd not just because it only triggers=
 at
> > > +higher optimization levels, but also because it only affects one of=
 at
> > > +least three similar constructs. Various "note" diagnostics claim th=
e
> > > +valid index range to be [0, 2=E2=81=B6=C2=B3-1].
> > > +
> > > +Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > > +Tested-by: Jason Andryuk <jandryuk@gmail.com>
> > > +Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > +---
> > > + tools/tests/x86_emulator/x86-emulate.c | 7 +++++++
> > > + xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
> > > + xen/include/asm-x86/fixmap.h           | 2 +-
> > > + xen/include/xen/compiler.h             | 6 ++++++
> > > + xen/include/xen/pdx.h                  | 2 +-
> > > + 5 files changed, 16 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/tools/tests/x86_emulator/x86-emulate.c b/tools/tests/x=
86_emulator/x86-emulate.c
> > > +index 07f892dbbb..ea286d6ad8 100644
> > > +--- a/tools/tests/x86_emulator/x86-emulate.c
> > > ++++ b/tools/tests/x86_emulator/x86-emulate.c
> > > +@@ -8,6 +8,13 @@
> > > +
> > > + #define ERR_PTR(val) NULL
> > > +
> > > ++/* See gcc bug 100680, but here don't bother making this version d=
ependent. */
> > > ++#define gcc11_wrap(x) ({                  \
> > > ++    unsigned long x_;                     \
> > > ++    __asm__ ( "" : "=3Dg" (x_) : "0" (x) ); \
> > > ++    (typeof(x))x_;                        \
> > > ++})
> > > ++
> > > + #define cpu_has_amd_erratum(nr) 0
> > > + #define cpu_has_mpx false
> > > + #define read_bndcfgu() 0
> > > +diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/=
x86_emulate/x86_emulate.c
> > > +index c25d88d0d8..31fdec030c 100644
> > > +--- a/xen/arch/x86/x86_emulate/x86_emulate.c
> > > ++++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> > > +@@ -726,7 +726,7 @@ union vex {
> > > + #define copy_VEX(ptr, vex) ({ \
> > > +     if ( !mode_64bit() ) \
> > > +         (vex).reg |=3D 8; \
> > > +-    (ptr)[0 - PFX_BYTES] =3D ext < ext_8f08 ? 0xc4 : 0x8f; \
> > > ++    gcc11_wrap(ptr)[0 - PFX_BYTES] =3D ext < ext_8f08 ? 0xc4 : 0x8=
f; \
> > > +     (ptr)[1 - PFX_BYTES] =3D (vex).raw[0]; \
> > > +     (ptr)[2 - PFX_BYTES] =3D (vex).raw[1]; \
> > > +     container_of((ptr) + 1 - PFX_BYTES, typeof(vex), raw[0]); \
> > > +diff --git a/xen/include/asm-x86/fixmap.h b/xen/include/asm-x86/fix=
map.h
> > > +index 0db314baeb..20746afd0a 100644
> > > +--- a/xen/include/asm-x86/fixmap.h
> > > ++++ b/xen/include/asm-x86/fixmap.h
> > > +@@ -78,7 +78,7 @@ extern void __set_fixmap(
> > > +
> > > + #define clear_fixmap(idx) __set_fixmap(idx, 0, 0)
> > > +
> > > +-#define __fix_to_virt(x) (FIXADDR_TOP - ((x) << PAGE_SHIFT))
> > > ++#define __fix_to_virt(x) gcc11_wrap(FIXADDR_TOP - ((x) << PAGE_SHI=
FT))
> > > + #define __virt_to_fix(x) ((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_=
SHIFT)
> > > +
> > > + #define fix_to_virt(x)   ((void *)__fix_to_virt(x))
> > > +diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.=
h
> > > +index 17cf00e1ec..696c7eb89e 100644
> > > +--- a/xen/include/xen/compiler.h
> > > ++++ b/xen/include/xen/compiler.h
> > > +@@ -140,6 +140,12 @@
> > > +     __asm__ ("" : "=3Dr"(__ptr) : "0"(ptr));      \
> > > +     (typeof(ptr)) (__ptr + (off)); })
> > > +
> > > ++#if CONFIG_GCC_VERSION >=3D 110000 /* See gcc bug 100680. */
> > > ++# define gcc11_wrap(x) RELOC_HIDE(x, 0)
> > > ++#else
> > > ++# define gcc11_wrap(x) (x)
> > > ++#endif
> > > ++
> > > + #ifdef __GCC_ASM_FLAG_OUTPUTS__
> > > + # define ASM_FLAG_OUT(yes, no) yes
> > > + #else
> > > +diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
> > > +index 770fadc06c..9fcfb0ce52 100644
> > > +--- a/xen/include/xen/pdx.h
> > > ++++ b/xen/include/xen/pdx.h
> > > +@@ -19,7 +19,7 @@ extern u64 pdx_region_mask(u64 base, u64 len);
> > > + extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
> > > +
> > > + #define page_to_pdx(pg)  ((pg) - frame_table)
> > > +-#define pdx_to_page(pdx) (frame_table + (pdx))
> > > ++#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
> > > +
> > > + bool __mfn_valid(unsigned long mfn);
> > > +
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/x=
en/xen-tools.inc
> > > index e939c45..3560e79 100644
> > > --- a/recipes-extended/xen/xen-tools.inc
> > > +++ b/recipes-extended/xen/xen-tools.inc
> > > @@ -725,12 +725,9 @@ do_configure() {
> > >     do_configure_common
> > > }
> > >
> > > -# Workaround when compiling with gcc-11
> > > -EXTRA_CFLAGS_XEN_TOOLS_append =3D " -Wno-vla-parameter"
> > > -
> > > do_compile() {
> > >     cd ${S}
> > > -    oe_runmake tools EXTRA_CFLAGS_XEN_TOOLS=3D"${EXTRA_CFLAGS_XEN_T=
OOLS}" PYTHON=3D"${PYTHON}"
> > > +    oe_runmake tools PYTHON=3D"${PYTHON}"
> > > }
> > >
> > > do_install() {
> > > diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extend=
ed/xen/xen-tools_4.14.bb
> > > index 10982a2..13c484c 100644
> > > --- a/recipes-extended/xen/xen-tools_4.14.bb
> > > +++ b/recipes-extended/xen/xen-tools_4.14.bb
> > > @@ -8,6 +8,7 @@ SRC_URI =3D " \
> > >     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> > >     file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.=
14.patch \
> > >     file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4=
.14.patch \
> > > +    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-p=
r.patch \
> > >     "
> > >
> > > LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450133=
8e44a4e5"
> > > diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extend=
ed/xen/xen-tools_4.15.bb
> > > index 314dc52..f3f9cd3 100644
> > > --- a/recipes-extended/xen/xen-tools_4.15.bb
> > > +++ b/recipes-extended/xen/xen-tools_4.15.bb
> > > @@ -6,6 +6,7 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
> > > SRC_URI =3D " \
> > >     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > >     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> > > +    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-p=
r.patch \
> > >     "
> > >
> > > LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450133=
8e44a4e5"
> > > diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extende=
d/xen/xen-tools_git.bb
> > > index 0188bdd..0b2dce9 100644
> > > --- a/recipes-extended/xen/xen-tools_git.bb
> > > +++ b/recipes-extended/xen/xen-tools_git.bb
> > > @@ -6,6 +6,7 @@ XEN_BRANCH ?=3D "master"
> > > SRC_URI =3D " \
> > >     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > >     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> > > +    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-p=
r.patch \
> > >     "
> > >
> > > LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450133=
8e44a4e5"
> > > diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen=
/xen_4.14.bb
> > > index 653e3b6..aee4130 100644
> > > --- a/recipes-extended/xen/xen_4.14.bb
> > > +++ b/recipes-extended/xen/xen_4.14.bb
> > > @@ -7,6 +7,8 @@ SRC_URI =3D " \
> > >     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > >     file://xen-arm64-implement-atomic-fetch-add.patch \
> > >     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-=
location.patch \
> > > +    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
> > > +    file://0001-crypto-adjust-rijndaelEncrypt-prototype-for-gcc11.p=
atch \
> > >     "
> > >
> > > LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450133=
8e44a4e5"
> > > diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen=
/xen_4.15.bb
> > > index 2842c0a..d0aa176 100644
> > > --- a/recipes-extended/xen/xen_4.15.bb
> > > +++ b/recipes-extended/xen/xen_4.15.bb
> > > @@ -7,6 +7,7 @@ SRC_URI =3D " \
> > >     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > >     file://xen-arm64-implement-atomic-fetch-add.patch \
> > >     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-=
location.patch \
> > > +    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
> > >     "
> > >
> > > LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450133=
8e44a4e5"
> > > diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/=
xen_git.bb
> > > index eaf3956..7ce7228 100644
> > > --- a/recipes-extended/xen/xen_git.bb
> > > +++ b/recipes-extended/xen/xen_git.bb
> > > @@ -7,6 +7,7 @@ SRC_URI =3D " \
> > >     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> > >     file://xen-arm64-implement-atomic-fetch-add.patch \
> > >     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-=
location.patch \
> > > +    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
> > >     "
> > >
> > > LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450133=
8e44a4e5"
> > > --
> > > 2.25.1
> > >
> >
> > IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
> >
> >=20
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
