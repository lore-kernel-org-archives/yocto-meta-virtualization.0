Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.7879.1625718787071042174
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 21:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KL9Hix8r;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d1so3938566qto.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 21:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcS9BHF5hUtp3BU2ecqQXMWpvsGKlQJpr/Maqihmlqg=;
        b=KL9Hix8rU58+IZP/Sp2vXWy2RXHwm3uI35MVm+6h4AfsONJoS6QhsRO8ERdDs7/W97
         0EC/F570tc53iUkZlD/RV9n3ma6fvgZ9rlGtWmhqg2nIsBpPpUEjuS07RtBSbwbjKMly
         UwPoqRn3Gh6xdfgKA3NG2IuIBpeThowiM29mdha87VDjiayJFNEFDRl8e3mkySvlo2q7
         aS45NMS7XaJWFM/v63xesGbZfL27cTU7Do/7ggqkTCD3+YfacBXBmBDm4W2mxmAjc1G0
         M02XoI29cXxLapYLowxnXlbjeaE2AMlwn35XcIlR833Je0c/ydZAIOdaCQkPC9O4QS5s
         SFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcS9BHF5hUtp3BU2ecqQXMWpvsGKlQJpr/Maqihmlqg=;
        b=s5bNyIjO6AOy3Xxtci0P5DA/7NijXkpp89NdUbOa8g1Tzx3DvD+nZWlPK7wCNUIdIL
         4v12RqWDdM+5UNCbWaOuM/dO3FzFKi7rgaV5eNgA/gb0AxJUMK/gpfql6f3qPwGNpDI7
         LyES2ZQ6nzVVAHp5PPc7MbPMjN8pt6yiok/dH0C34Wl0txPRwmUAWa4ibB34ZRnG9n89
         VTIvqCTUhErBbuyqc67kOxdNbyCK+H8et3fuy3mVWCsrRBuM1bA4nIqTqsG16erckIFT
         M6H9Ki3sCa+rzb9PEpRjyzFAx3KHKH51VZfdYJxDrThnVf+258Ait+NJOqG9otgGqpoy
         tXRw==
X-Gm-Message-State: AOAM533n80pzIS6tZqK3/xH5laqlb0keESKif7FDCsDDRnudqmmxdqun
	foJu9LWDk2J4Pm0I1v7EUOsmBG70h8afA7Sg
X-Google-Smtp-Source: ABdhPJxWBf6gFwtzHOXMCBJ983tn1eCgPgbRSzWVLSyim6lYYfhyx5+FakiVEXr5GKePhYzZOZyZAA==
X-Received: by 2002:ac8:5949:: with SMTP id 9mr23705562qtz.222.1625718785990;
        Wed, 07 Jul 2021 21:33:05 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-177-250-205.mycingular.net. [166.177.250.205])
        by smtp.gmail.com with ESMTPSA id p9sm517908qtw.88.2021.07.07.21.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:33:05 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH v2 1/4] xen, xen-tools: apply upstream fixes for gcc11 compilation
Date: Wed,  7 Jul 2021 21:32:43 -0700
Message-Id: <20210708043246.126719-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708043246.126719-1-christopher.w.clark@gmail.com>
References: <20210708043246.126719-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Apply patches for the tools and hypervisor to Xen 4.15 and the git
recipe and uprev Xen 4.14 to latest stable revision.
Retire the previous -Wno-vla-parameter workaround.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 ...ry-Fix-osdep_xenforeignmemory_map-pr.patch |  33 ++++++
 ...x86-make-hypervisor-build-with-gcc11.patch | 111 ++++++++++++++++++
 recipes-extended/xen/xen-tools.inc            |   5 +-
 recipes-extended/xen/xen-tools_4.14.bb        |   3 +-
 recipes-extended/xen/xen-tools_4.15.bb        |   1 +
 recipes-extended/xen/xen-tools_git.bb         |   1 +
 recipes-extended/xen/xen_4.14.bb              |   2 +-
 recipes-extended/xen/xen_4.15.bb              |   1 +
 recipes-extended/xen/xen_git.bb               |   1 +
 9 files changed, 152 insertions(+), 6 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
 create mode 100644 recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patch

diff --git a/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch b/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
new file mode 100644
index 0000000..2e3b1a6
--- /dev/null
+++ b/recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
@@ -0,0 +1,33 @@
+From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001
+From: Anthony PERARD <anthony.perard@citrix.com>
+Date: Tue, 1 Jun 2021 16:41:47 +0100
+Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype
+
+Commit cf8c4d3d13b8 made some preparation to have one day
+variable-length-array argument, but didn't declare the array in the
+function prototype the same way as in the function definition. And now
+GCC 11 complains about it.
+
+Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argument to map forward")
+Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
+Reviewed-by: Jan Beulich <jbeulich@suse.com>
+---
+ tools/libs/foreignmemory/private.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
+index 1ee3626dd2..5bb0cefb09 100644
+--- a/tools/libs/foreignmemory/private.h
++++ b/tools/libs/foreignmemory/private.h
+@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem);
+ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
+                                  uint32_t dom, void *addr,
+                                  int prot, int flags, size_t num,
+-                                 const xen_pfn_t arr[num], int err[num]);
++                                 const xen_pfn_t arr[/*num*/], int err[/*num*/]);
+ int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
+                                  void *addr, size_t num);
+ 
+-- 
+2.25.1
+
diff --git a/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patch b/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patch
new file mode 100644
index 0000000..72592c4
--- /dev/null
+++ b/recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patch
@@ -0,0 +1,111 @@
+From 722f59d38c710a940ab05e542a83020eb5546dea Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Thu, 27 May 2021 14:40:29 +0200
+Subject: [PATCH] x86: make hypervisor build with gcc11
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Gcc 11 looks to make incorrect assumptions about valid ranges that
+pointers may be used for addressing when they are derived from e.g. a
+plain constant. See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100680.
+
+Utilize RELOC_HIDE() to work around the issue, which for x86 manifests
+in at least
+- mpparse.c:efi_check_config(),
+- tboot.c:tboot_probe(),
+- tboot.c:tboot_gen_frametable_integrity(),
+- x86_emulate.c:x86_emulate() (at -O2 only).
+The last case is particularly odd not just because it only triggers at
+higher optimization levels, but also because it only affects one of at
+least three similar constructs. Various "note" diagnostics claim the
+valid index range to be [0, 2⁶³-1].
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Tested-by: Jason Andryuk <jandryuk@gmail.com>
+Acked-by: Roger Pau Monné <roger.pau@citrix.com>
+---
+ tools/tests/x86_emulator/x86-emulate.c | 7 +++++++
+ xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
+ xen/include/asm-x86/fixmap.h           | 2 +-
+ xen/include/xen/compiler.h             | 6 ++++++
+ xen/include/xen/pdx.h                  | 2 +-
+ 5 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tests/x86_emulator/x86-emulate.c b/tools/tests/x86_emulator/x86-emulate.c
+index 07f892dbbb..ea286d6ad8 100644
+--- a/tools/tests/x86_emulator/x86-emulate.c
++++ b/tools/tests/x86_emulator/x86-emulate.c
+@@ -8,6 +8,13 @@
+ 
+ #define ERR_PTR(val) NULL
+ 
++/* See gcc bug 100680, but here don't bother making this version dependent. */
++#define gcc11_wrap(x) ({                  \
++    unsigned long x_;                     \
++    __asm__ ( "" : "=g" (x_) : "0" (x) ); \
++    (typeof(x))x_;                        \
++})
++
+ #define cpu_has_amd_erratum(nr) 0
+ #define cpu_has_mpx false
+ #define read_bndcfgu() 0
+diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
+index c25d88d0d8..31fdec030c 100644
+--- a/xen/arch/x86/x86_emulate/x86_emulate.c
++++ b/xen/arch/x86/x86_emulate/x86_emulate.c
+@@ -726,7 +726,7 @@ union vex {
+ #define copy_VEX(ptr, vex) ({ \
+     if ( !mode_64bit() ) \
+         (vex).reg |= 8; \
+-    (ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 : 0x8f; \
++    gcc11_wrap(ptr)[0 - PFX_BYTES] = ext < ext_8f08 ? 0xc4 : 0x8f; \
+     (ptr)[1 - PFX_BYTES] = (vex).raw[0]; \
+     (ptr)[2 - PFX_BYTES] = (vex).raw[1]; \
+     container_of((ptr) + 1 - PFX_BYTES, typeof(vex), raw[0]); \
+diff --git a/xen/include/asm-x86/fixmap.h b/xen/include/asm-x86/fixmap.h
+index 0db314baeb..20746afd0a 100644
+--- a/xen/include/asm-x86/fixmap.h
++++ b/xen/include/asm-x86/fixmap.h
+@@ -78,7 +78,7 @@ extern void __set_fixmap(
+ 
+ #define clear_fixmap(idx) __set_fixmap(idx, 0, 0)
+ 
+-#define __fix_to_virt(x) (FIXADDR_TOP - ((x) << PAGE_SHIFT))
++#define __fix_to_virt(x) gcc11_wrap(FIXADDR_TOP - ((x) << PAGE_SHIFT))
+ #define __virt_to_fix(x) ((FIXADDR_TOP - ((x)&PAGE_MASK)) >> PAGE_SHIFT)
+ 
+ #define fix_to_virt(x)   ((void *)__fix_to_virt(x))
+diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
+index 17cf00e1ec..696c7eb89e 100644
+--- a/xen/include/xen/compiler.h
++++ b/xen/include/xen/compiler.h
+@@ -140,6 +140,12 @@
+     __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
+     (typeof(ptr)) (__ptr + (off)); })
+ 
++#if CONFIG_GCC_VERSION >= 110000 /* See gcc bug 100680. */
++# define gcc11_wrap(x) RELOC_HIDE(x, 0)
++#else
++# define gcc11_wrap(x) (x)
++#endif
++
+ #ifdef __GCC_ASM_FLAG_OUTPUTS__
+ # define ASM_FLAG_OUT(yes, no) yes
+ #else
+diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
+index 770fadc06c..9fcfb0ce52 100644
+--- a/xen/include/xen/pdx.h
++++ b/xen/include/xen/pdx.h
+@@ -19,7 +19,7 @@ extern u64 pdx_region_mask(u64 base, u64 len);
+ extern void set_pdx_range(unsigned long smfn, unsigned long emfn);
+ 
+ #define page_to_pdx(pg)  ((pg) - frame_table)
+-#define pdx_to_page(pdx) (frame_table + (pdx))
++#define pdx_to_page(pdx) gcc11_wrap(frame_table + (pdx))
+ 
+ bool __mfn_valid(unsigned long mfn);
+ 
+-- 
+2.25.1
+
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index e939c45..3560e79 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -725,12 +725,9 @@ do_configure() {
     do_configure_common
 }
 
-# Workaround when compiling with gcc-11
-EXTRA_CFLAGS_XEN_TOOLS_append = " -Wno-vla-parameter"
-
 do_compile() {
     cd ${S}
-    oe_runmake tools EXTRA_CFLAGS_XEN_TOOLS="${EXTRA_CFLAGS_XEN_TOOLS}" PYTHON="${PYTHON}"
+    oe_runmake tools PYTHON="${PYTHON}"
 }
 
 do_install() {
diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/xen/xen-tools_4.14.bb
index 10982a2..6fd6f7f 100644
--- a/recipes-extended/xen/xen-tools_4.14.bb
+++ b/recipes-extended/xen/xen-tools_4.14.bb
@@ -1,4 +1,4 @@
-SRCREV ?= "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
+SRCREV ?= "b6a8c4f72def4d1135ff42660a86276ce2565c8c"
 
 XEN_REL ?= "4.14"
 XEN_BRANCH ?= "stable-${XEN_REL}"
@@ -8,6 +8,7 @@ SRC_URI = " \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
     file://0001-firmware-provide-a-stand-alone-set-of-headers-Xen-4.14.patch \
     file://0001-tools-firmware-Build-firmware-as-ffreestanding-Xen-4.14.patch \
+    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
index 314dc52..f3f9cd3 100644
--- a/recipes-extended/xen/xen-tools_4.15.bb
+++ b/recipes-extended/xen/xen-tools_4.15.bb
@@ -6,6 +6,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
+    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/xen-tools_git.bb
index 0188bdd..0b2dce9 100644
--- a/recipes-extended/xen/xen-tools_git.bb
+++ b/recipes-extended/xen/xen-tools_git.bb
@@ -6,6 +6,7 @@ XEN_BRANCH ?= "master"
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
+    file://0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
index 653e3b6..0dd9d3c 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -1,4 +1,4 @@
-SRCREV ?= "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
+SRCREV ?= "b6a8c4f72def4d1135ff42660a86276ce2565c8c"
 
 XEN_REL ?= "4.14"
 XEN_BRANCH ?= "stable-${XEN_REL}"
diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
index 2842c0a..d0aa176 100644
--- a/recipes-extended/xen/xen_4.15.bb
+++ b/recipes-extended/xen/xen_4.15.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index eaf3956..7ce7228 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -7,6 +7,7 @@ SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
-- 
2.25.1

