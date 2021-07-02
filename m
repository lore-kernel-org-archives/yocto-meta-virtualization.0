Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.3367.1625185949747764286
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Jul 2021 17:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NmPriiJU;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id 19so7837329qky.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Jul 2021 17:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cTSeLpkre7NNcO4SLrW71BpN/q8l+rC2GYPc8VuddSY=;
        b=NmPriiJU7NaTYmwphcHXgZqDtDFhWl9FrI4+6IO7uyGaN5IY+bOa9GwpU84LnrUnMO
         dgt8SzeDnVkwdtCocRiNPcX30z9c8m9BpkAuohoK9ud7IcOsbhv9F7KeFNtRIIx1bibZ
         4i4PefrIGWi7jZTA1x9q7cgh6NimrTKPktLKbC/jhoyqa3573cj5BW4SWE0XrwQ0WKFy
         P+N3sJ3cg/K8Av0XqkpFkOLPB/v25GebGD7fw3uGMeUsincTZCzjcUq024TpsdHHpkYQ
         YAWrrr0I3W/uNkPTBlhQWq8uC7GPXbDyakDlkAQ9Ebvz6DqD2+ZbOAo47igGQ1EqeTRy
         2sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cTSeLpkre7NNcO4SLrW71BpN/q8l+rC2GYPc8VuddSY=;
        b=fKvazpFswSp3B3AwJT4BNJVVv1dwKd5TpCzNrG/sKv4/UHmxRCWuC9zMzc1IHEhPXm
         25Yw7TEC5AJu6F7RREyHfNBpRnyed3+M4m9r2sTrbQwZbhuxHCM8FI017odwAsYMNU1s
         0PdIwYq5nMW8uqWuFkxyZ09ZKLS9mxRK8+tcdsYiC5L3u+nylfUjJad0wAv592aZrA69
         ygQCZvY8bFM1ZkK4D9lniINIkuTl3eMc19IRfL99U2b/c6oC2aM+qKVkzKQrDJ2e/Q/j
         Y3XWfLRaE+neQHe45+UTldakz3AsSAddf4otjSD4B8tyNvyUJVCQryOHiooXDOCGFsGM
         PVQQ==
X-Gm-Message-State: AOAM533dFG9aCYhNsNpcI//WTxF/YktzzF5eyiRu6So8ju0RYOnODe0j
	MxocYD+eQZGkYsS7Ojeke28Di/gn6TMgPQ==
X-Google-Smtp-Source: ABdhPJxMorDBLFSj1NN4+U2+frj5lAD9zT83v07L1sRpQGdWRa7ymqt2MP+4O+xcXfAzIkAjCPj5zA==
X-Received: by 2002:a37:a90f:: with SMTP id s15mr2827701qke.192.1625185948709;
        Thu, 01 Jul 2021 17:32:28 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-137-178-102.mycingular.net. [166.137.178.102])
        by smtp.gmail.com with ESMTPSA id x16sm621135qtw.80.2021.07.01.17.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 17:32:28 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH 1/3] xen, xen-tools: add upstream patches for gcc11 compilation fixes
Date: Thu,  1 Jul 2021 17:32:04 -0700
Message-Id: <20210702003206.79756-2-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702003206.79756-1-christopher.w.clark@gmail.com>
References: <20210702003206.79756-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This allows the -Wno-vla-parameter workaround that was previously
applied (e99974aa57) to be retired.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 ...-rijndaelEncrypt-prototype-for-gcc11.patch |  52 ++++++++
 ...ry-Fix-osdep_xenforeignmemory_map-pr.patch |  33 ++++++
 ...x86-make-hypervisor-build-with-gcc11.patch | 111 ++++++++++++++++++
 recipes-extended/xen/xen-tools.inc            |   5 +-
 recipes-extended/xen/xen-tools_4.14.bb        |   1 +
 recipes-extended/xen/xen-tools_4.15.bb        |   1 +
 recipes-extended/xen/xen-tools_git.bb         |   1 +
 recipes-extended/xen/xen_4.14.bb              |   2 +
 recipes-extended/xen/xen_4.15.bb              |   1 +
 recipes-extended/xen/xen_git.bb               |   1 +
 10 files changed, 204 insertions(+), 4 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-crypto-adjust-rijndaelEncrypt-prototype-for-gcc11.patch
 create mode 100644 recipes-extended/xen/files/0001-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-pr.patch
 create mode 100644 recipes-extended/xen/files/0001-x86-make-hypervisor-build-with-gcc11.patch

diff --git a/recipes-extended/xen/files/0001-crypto-adjust-rijndaelEncrypt-prototype-for-gcc11.patch b/recipes-extended/xen/files/0001-crypto-adjust-rijndaelEncrypt-prototype-for-gcc11.patch
new file mode 100644
index 0000000..1fc06f8
--- /dev/null
+++ b/recipes-extended/xen/files/0001-crypto-adjust-rijndaelEncrypt-prototype-for-gcc11.patch
@@ -0,0 +1,52 @@
+From c6ad5a701b9a6df443a6c98d9e7201c958bbcafc Mon Sep 17 00:00:00 2001
+From: Jan Beulich <jbeulich@suse.com>
+Date: Thu, 4 Mar 2021 16:47:51 +0100
+Subject: [PATCH] crypto: adjust rijndaelEncrypt() prototype for gcc11
+
+The upcoming release complains, not entirely unreasonably:
+
+In file included from rijndael.c:33:
+.../xen/include/crypto/rijndael.h:55:53: note: previously declared as 'const unsigned char[]'
+   55 | void    rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
+      |                                                     ^~~~~~~~~~~~~~~~~~~~~~
+rijndael.c:865:8: error: argument 4 of type 'u8[16]' {aka 'unsigned char[16]'} with mismatched bound [-Werror=array-parameter=]
+  865 |     u8 ct[16])
+      |     ~~~^~~~~~
+In file included from rijndael.c:33:
+.../xen/include/crypto/rijndael.h:56:13: note: previously declared as 'unsigned char[]'
+   56 |             unsigned char []);
+      |             ^~~~~~~~~~~~~~~~
+
+Simply declare the correct array dimensions right away. This then allows
+compilers to apply checking at call sites, which seems desirable anyway.
+
+For the moment I'm leaving untouched the disagreement between u8/u32
+used in the function definition and unsigned {char,int} used in the
+declaration, as making this consistent would call for touching further
+functions.
+
+Reported-by: Charles Arnold <carnold@suse.com>
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Reviewed-by: Julien Grall <jgrall@amazon.com>
+Release-Acked-by: Ian Jackson <iwj@xenproject.org>
+---
+ xen/include/crypto/rijndael.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xen/include/crypto/rijndael.h b/xen/include/crypto/rijndael.h
+index 69965783c5..4386be5878 100644
+--- a/xen/include/crypto/rijndael.h
++++ b/xen/include/crypto/rijndael.h
+@@ -52,7 +52,7 @@ void	 rijndael_encrypt(rijndael_ctx *, const unsigned char *, unsigned char *);
+ 
+ int	rijndaelKeySetupEnc(unsigned int [], const unsigned char [], int);
+ int	rijndaelKeySetupDec(unsigned int [], const unsigned char [], int);
+-void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
+-	    unsigned char []);
++void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [16],
++	    unsigned char [16]);
+ 
+ #endif /* __RIJNDAEL_H */
+-- 
+2.25.1
+
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
index 10982a2..13c484c 100644
--- a/recipes-extended/xen/xen-tools_4.14.bb
+++ b/recipes-extended/xen/xen-tools_4.14.bb
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
index 653e3b6..aee4130 100644
--- a/recipes-extended/xen/xen_4.14.bb
+++ b/recipes-extended/xen/xen_4.14.bb
@@ -7,6 +7,8 @@ SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
     file://xen-arm64-implement-atomic-fetch-add.patch \
     file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
+    file://0001-x86-make-hypervisor-build-with-gcc11.patch \
+    file://0001-crypto-adjust-rijndaelEncrypt-prototype-for-gcc11.patch \
     "
 
 LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
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

