Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.12169.1635255138526296743
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 06:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: edward.pickup@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A38F4D6E;
	Tue, 26 Oct 2021 06:32:17 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com [10.1.199.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F20653F73D;
	Tue, 26 Oct 2021 06:32:16 -0700 (PDT)
From: "Edward Pickup" <edward.pickup@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	bertrand.marquis@arm.com
Subject: [PATCH] xen,xen-tools: update xen to new releases
Date: Tue, 26 Oct 2021 14:32:04 +0100
Message-Id: <20211026133204.335413-1-Edward.Pickup@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Update the SHA in recipes for xen and xen-tools to use the latest release=
s;
update xen 4.14 to xen 4.14.3 release, update xen 4.15 to 4.15.1 release,=
 and
xen 4.16 to the current master version.

Add a comment to each recipe indicating which version of Xen is used in r=
ecipe.

Do not apply patches that have been merged/solved in Xen and remove patch=
 files
not needed anymore.

Create a test package to pack new tests introduced in 4.16.

Add a depencency to util-linux-prlimit, as the xen 4.16 x86 requires prli=
mit,
without this boot of dom0 fails.

Signed-off-by: Edward Pickup <Edward.Pickup@arm.com>
---
 ...ry-Fix-osdep_xenforeignmemory_map-pr.patch |  33 ------
 ...x86-make-hypervisor-build-with-gcc11.patch | 111 ------------------
 ...-around-build-issue-with-GNU-ld-2.37.patch |  36 ------
 recipes-extended/xen/xen-tools.inc            |  29 +++++
 recipes-extended/xen/xen-tools_4.14.bb        |   5 +-
 recipes-extended/xen/xen-tools_4.15.bb        |   5 +-
 recipes-extended/xen/xen-tools_git.bb         |   5 +-
 recipes-extended/xen/xen_4.14.bb              |   4 +-
 recipes-extended/xen/xen_4.15.bb              |   5 +-
 recipes-extended/xen/xen_git.bb               |   5 +-
 10 files changed, 41 insertions(+), 197 deletions(-)
 delete mode 100644 recipes-extended/xen/files/0001-libs-foreignmemory-Fi=
x-osdep_xenforeignmemory_map-pr.patch
 delete mode 100644 recipes-extended/xen/files/0001-x86-make-hypervisor-b=
uild-with-gcc11.patch
 delete mode 100644 recipes-extended/xen/files/0001-x86-work-around-build=
-issue-with-GNU-ld-2.37.patch

diff --git a/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep=
_xenforeignmemory_map-pr.patch b/recipes-extended/xen/files/0001-libs-for=
eignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
deleted file mode 100644
index 2e3b1a6..0000000
--- a/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenfor=
eignmemory_map-pr.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001
-From: Anthony PERARD <anthony.perard@citrix.com>
-Date: Tue, 1 Jun 2021 16:41:47 +0100
-Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map prot=
otype
-
-Commit cf8c4d3d13b8 made some preparation to have one day
-variable-length-array argument, but didn't declare the array in the
-function prototype the same way as in the function definition. And now
-GCC 11 complains about it.
-
-Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argume=
nt to map forward")
-Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
-Reviewed-by: Jan Beulich <jbeulich@suse.com>
----
- tools/libs/foreignmemory/private.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemo=
ry/private.h
-index 1ee3626dd2..5bb0cefb09 100644
---- a/tools/libs/foreignmemory/private.h
-+++ b/tools/libs/foreignmemory/private.h
-@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_hand=
le *fmem);
- void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
-                                  uint32_t dom, void *addr,
-                                  int prot, int flags, size_t num,
--                                 const xen_pfn_t arr[num], int err[num]=
);
-+                                 const xen_pfn_t arr[/*num*/], int err[=
/*num*/]);
- int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
-                                  void *addr, size_t num);
-=20
---=20
-2.25.1
-
diff --git a/recipes-extended/xen/files/0001-x86-make-hypervisor-build-wi=
th-gcc11.patch b/recipes-extended/xen/files/0001-x86-make-hypervisor-buil=
d-with-gcc11.patch
deleted file mode 100644
index 72592c4..0000000
--- a/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc1=
1.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 722f59d38c710a940ab05e542a83020eb5546dea Mon Sep 17 00:00:00 2001
-From: Jan Beulich <jbeulich@suse.com>
-Date: Thu, 27 May 2021 14:40:29 +0200
-Subject: [PATCH] x86: make hypervisor build with gcc11
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Gcc 11 looks to make incorrect assumptions about valid ranges that
-pointers may be used for addressing when they are derived from e.g. a
-plain constant. See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D10068=
0.
-
-Utilize RELOC_HIDE() to work around the issue, which for x86 manifests
-in at least
-- mpparse.c:efi_check_config(),
-- tboot.c:tboot_probe(),
-- tboot.c:tboot_gen_frametable_integrity(),
-- x86_emulate.c:x86_emulate() (at -O2 only).
-The last case is particularly odd not just because it only triggers at
-higher optimization levels, but also because it only affects one of at
-least three similar constructs. Various "note" diagnostics claim the
-valid index range to be [0, 2=E2=81=B6=C2=B3-1].
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Tested-by: Jason Andryuk <jandryuk@gmail.com>
-Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
----
- tools/tests/x86_emulator/x86-emulate.c | 7 +++++++
- xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
- xen/include/asm-x86/fixmap.h           | 2 +-
- xen/include/xen/compiler.h             | 6 ++++++
- xen/include/xen/pdx.h                  | 2 +-
- 5 files changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/tools/tests/x86_emulator/x86-emulate.c b/tools/tests/x86_em=
ulator/x86-emulate.c
-index 07f892dbbb..ea286d6ad8 100644
---- a/tools/tests/x86_emulator/x86-emulate.c
-+++ b/tools/tests/x86_emulator/x86-emulate.c
-@@ -8,6 +8,13 @@
-=20
- #define ERR_PTR(val) NULL
-=20
-+/* See gcc bug 100680, but here don't bother making this version depend=
ent. */
-+#define gcc11_wrap(x) ({                  \
-+    unsigned long x_;                     \
-+    __asm__ ( "" : "=3Dg" (x_) : "0" (x) ); \
-+    (typeof(x))x_;                        \
-+})
-+
- #define cpu_has_amd_erratum(nr) 0
- #define cpu_has_mpx false
- #define read_bndcfgu() 0
-diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_e=
mulate/x86_emulate.c
-index c25d88d0d8..31fdec030c 100644
---- a/xen/arch/x86/x86_emulate/x86_emulate.c
-+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
-@@ -726,7 +726,7 @@ union vex {
- #define copy_VEX(ptr, vex) ({ \
-     if ( !mode_64bit() ) \
-         (vex).reg |=3D 8; \
--    (ptr)[0 - PFX_BYTES] =3D ext < ext_8f08 ? 0xc4 : 0x8f; \
-+    gcc11_wrap(ptr)[0 - PFX_BYTES] =3D ext < ext_8f08 ? 0xc4 : 0x8f; \
-     (ptr)[1 - PFX_BYTES] =3D (vex).raw[0]; \
-     (ptr)[2 - PFX_BYTES] =3D (vex).raw[1]; \
-     container_of((ptr) + 1 - PFX_BYTES, typeof(vex), raw[0]); \
-diff --git a/xen/include/asm-x86/fixmap.h b/xen/include/asm-x86/fixmap.h
-index 0db314baeb..20746afd0a 100644
---- a/xen/include/asm-x86/fixmap.h
-+++ b/xen/include/asm-x86/fixmap.h
-@@ -78,7 +78,7 @@ extern void __set_fixmap(
-=20
- #define clear_fixmap(idx) __set_fixmap(idx, 0, 0)
-=20
--#define __fix_to_virt(x) (FIXADDR_TOP - ((x) << PAGE_SHIFT))
-+#define __fix_to_virt(x) gcc11_wrap(FIXADDR_TOP - ((x) << PAGE_SHIFT))
- #define __virt_to_fix(x) ((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_SHIFT=
)
-=20
- #define fix_to_virt(x)   ((void *)__fix_to_virt(x))
-diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
-index 17cf00e1ec..696c7eb89e 100644
---- a/xen/include/xen/compiler.h
-+++ b/xen/include/xen/compiler.h
-@@ -140,6 +140,12 @@
-     __asm__ ("" : "=3Dr"(__ptr) : "0"(ptr));      \
-     (typeof(ptr)) (__ptr + (off)); })
-=20
-+#if CONFIG_GCC_VERSION >=3D 110000 /* See gcc bug 100680. */
-+# define gcc11_wrap(x) RELOC_HIDE(x, 0)
-+#else
-+# define gcc11_wrap(x) (x)
-+#endif
-+
- #ifdef __GCC_ASM_FLAG_OUTPUTS__
- # define ASM_FLAG_OUT(yes, no) yes
- #else
-diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
-index 770fadc06c..9fcfb0ce52 100644
---- a/xen/include/xen/pdx.h
-+++ b/xen/include/xen/pdx.h
-@@ -19,7 +19,7 @@ extern u64 pdx_region_mask(u64 base, u64 len);
- extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
-=20
- #define page_to_pdx(pg)  ((pg) - frame_table)
--#define pdx_to_page(pdx) (frame_table + (pdx))
-+#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
-=20
- bool __mfn_valid(unsigned long mfn);
-=20
---=20
-2.25.1
-
diff --git a/recipes-extended/xen/files/0001-x86-work-around-build-issue-=
with-GNU-ld-2.37.patch b/recipes-extended/xen/files/0001-x86-work-around-=
build-issue-with-GNU-ld-2.37.patch
deleted file mode 100644
index f5108be..0000000
--- a/recipes-extended/xen/files/0001-x86-work-around-build-issue-with-GN=
U-ld-2.37.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 58ad654ebce7ccb272a3f4f3482c03aaad850d31 Mon Sep 17 00:00:00 2001
-From: Jan Beulich <jbeulich@suse.com>
-Date: Thu, 22 Jul 2021 11:20:38 +0200
-Subject: [PATCH] x86: work around build issue with GNU ld 2.37
-
-I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
-which broke the hypervisor build, by no longer accepting section names
-with a dash in them inside ADDR() (and perhaps other script directives
-expecting just a section name, not an expression): .note.gnu.build-id
-is such a section.
-
-Quoting all section names passed to ADDR() via DECL_SECTION() works
-around the regression.
-
-Signed-off-by: Jan Beulich <jbeulich@suse.com>
-Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
----
- xen/arch/x86/xen.lds.S | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
-index 9c6c1c8005..955d5cf4a0 100644
---- a/xen/arch/x86/xen.lds.S
-+++ b/xen/arch/x86/xen.lds.S
-@@ -18,7 +18,7 @@ ENTRY(efi_start)
- #else /* !EFI */
-=20
- #define FORMAT "elf64-x86-64"
--#define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
-+#define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
-=20
- ENTRY(start_pa)
-=20
---=20
-2.25.1
-
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
index 614f557..d831941 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -102,6 +102,7 @@ RSUGGESTS:${PN}-xencov =3D "${PN}-xencov-split"
=20
 RDEPENDS:${PN}-xencommons =3D "\
     bash \
+    util-linux-prlimit \
     ${PN}-console \
     ${PN}-xenstore \
     virtual/xenstored \
@@ -213,6 +214,9 @@ PACKAGES =3D " \
     ${PN}-xm-examples \
     ${PN}-xen-access \
     ${PN}-xen-memshare \
+    ${PN}-test \
+    ${PN}-xen-vmtrace \
+    ${PN}-xen-mceinj \
     "
=20
 PROVIDES =3D+ " \
@@ -684,6 +688,31 @@ FILES:${PN}-xen-memshare +=3D "\
 # memshare is only built for x86, so allow empty package for other archs
 ALLOW_EMPTY:${PN}-xen-memshare =3D "1"
=20
+FILES:${PN}-test +=3D "\
+    ${libdir}/xen/bin/test-xenstore \
+    ${libdir}/xen/bin/test-resource \
+    ${libdir}/xen/bin/test-cpu-policy \
+    ${libdir}/xen/bin/test-tsx \
+    "
+
+# test-xenstore and test-resource currently only exist in 4.16
+# test-cpu-policy and test-tsx only exist in 4.16 for x86
+ALLOW_EMPTY:${PN}-test =3D "1"
+
+FILES:${PN}-xen-mceinj +=3D"\
+    ${sbindir}/xen-mceinj \
+    "
+
+# xen-mceinj is only built for x86 4.16, so allow empty package
+ALLOW_EMPTY:${PN}-xen-mceinj =3D "1"
+
+FILES:${PN}-xen-vmtrace +=3D"\
+    ${sbindir}/xen-vmtrace \
+    "
+
+# xen-vmtrace is only built for x86 4.16, so allow empty package
+ALLOW_EMPTY:${PN}-xen-vmtrace =3D "1"
+
 INSANE_SKIP:${PN} =3D "already-stripped"
=20
 # configure init.d scripts
diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xe=
n/xen-tools_4.14.bb
index ce5dc2e..9d78e44 100644
--- a/recipes-extended/xen/xen-tools_4.14.bb
+++ b/recipes-extended/xen/xen-tools_4.14.bb
@@ -1,4 +1,5 @@
-SRCREV ?=3D "b6a8c4f72def4d1135ff42660a86276ce2565c8c"
+# 4.14.3 release SHA
+SRCREV ?=3D "9f2b6c5ec2ded4c1caf149743e862c5f15d6d083"
=20
 XEN_REL ?=3D "4.14"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
@@ -8,8 +9,6 @@ SRC_URI =3D " \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
     file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.p=
atch \
     file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.=
patch \
-    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.pat=
ch \
-    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xe=
n/xen-tools_4.15.bb
index e9c3bd6..840f162 100644
--- a/recipes-extended/xen/xen-tools_4.15.bb
+++ b/recipes-extended/xen/xen-tools_4.15.bb
@@ -1,4 +1,5 @@
-SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
+# xen 4.15.1 release sha
+SRCREV ?=3D "84fa99099b920f7bcde8899e1a9b756078719d7d"
=20
 XEN_REL ?=3D "4.15"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
@@ -6,8 +7,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
-    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.pat=
ch \
-    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen=
/xen-tools_git.bb
index 6926bd9..8ff9c4c 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -1,4 +1,5 @@
-SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
+# master status on 2020-10-21
+SRCREV ?=3D "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
=20
 XEN_REL ?=3D "4.16"
 XEN_BRANCH ?=3D "master"
@@ -6,8 +7,6 @@ XEN_BRANCH ?=3D "master"
 SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
-    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.pat=
ch \
-    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_=
4.14.bb
index 291ba16..0d7d20b 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -1,4 +1,5 @@
-SRCREV ?=3D "b6a8c4f72def4d1135ff42660a86276ce2565c8c"
+# 4.14.3 release SHA
+SRCREV ?=3D "9f2b6c5ec2ded4c1caf149743e862c5f15d6d083"
=20
 XEN_REL ?=3D "4.14"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
@@ -7,7 +8,6 @@ SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-loca=
tion.patch \
-    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_=
4.15.bb
index 0605441..0cfaf0c 100644
--- a/recipes-extended/xen/xen_4.15.bb
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -1,4 +1,5 @@
-SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
+# xen 4.15.1 release sha
+SRCREV ?=3D "84fa99099b920f7bcde8899e1a9b756078719d7d"
=20
 XEN_REL ?=3D "4.15"
 XEN_BRANCH ?=3D "stable-${XEN_REL}"
@@ -7,8 +8,6 @@ SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-loca=
tion.patch \
-    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
-    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_g=
it.bb
index 12c9403..20227e0 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -1,4 +1,5 @@
-SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
+# master status on 2020-10-21
+SRCREV ?=3D "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
=20
 XEN_REL ?=3D "4.16"
 XEN_BRANCH ?=3D "master"
@@ -7,8 +8,6 @@ SRC_URI =3D " \
     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-loca=
tion.patch \
-    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
-    file://0001-x86-work-around-build-issue-with-GNU-ld-2.37.patch \
     "
=20
 LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
--=20
2.25.1

