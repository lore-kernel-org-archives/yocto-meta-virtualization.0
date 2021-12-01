Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.94468.1638376845285495551
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 08:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SBn27tch;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id v11so53663383wrw.10
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Dec 2021 08:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F0kwJq7b2jSKXFOq6/pJgX5Km2Z6JWD6Tr+eXp7zAyk=;
        b=SBn27tch75ojpQlUJ9B4NRWYRkNbjcxnqfs4YtC7VCsYfK0yujJQ+u/3QDnwH6FKvD
         /4sejbrsy70QIj0ushxaAUskJ4x91MeCZ1gkQzJwlbheBKQ6cuDUcMcv+fDisJG0ISaQ
         /5MHZqMrFt6vounyAsDSvJ0qhdB9oyUTYHOWX/+cwwNiVf1Gc4vveDHA7D7gjEFJ2ai4
         vtwLjCFiywAvziNozP1Ly6Uict0Dd4uE4nZACs1XyBNGKBEEjF347hcq8fkJoTNv3LWH
         SHenqzZ18tjvqPqGUVnP+zAk7rpy80ABvWp2FnDyptbi1+Ky0AnWGt+USeworKIUHyyF
         wwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F0kwJq7b2jSKXFOq6/pJgX5Km2Z6JWD6Tr+eXp7zAyk=;
        b=Hqly/qGASsuvXmWe26ekWOqcxIDplyWpFnq/aFygOqbRBiZ1gOwW+EdI1euqCGvOJ3
         /4fcVNiN/N6GBzm/ZvwJ56bCOhnYHzPmjUAxlmGuCMZQUq7stwOCxYzxFKp96xJAdeH3
         c7rsMOdZvfr8f4Msb/xS7mHL22fvS3rGrZaV9K8Wa3L/9FuNeRhd+lYkMcbfivkyPIoY
         Yd0t1Zqyo1CtxsPQA3lGdEkaLqBgJSiPF/92dyiFwH+faDQaEZIpo5pbX3p+bLmFkt0v
         lOH2VsOAzqYO75CF35cdbTAUeVuvry7TE28YysmYLAeuMlkIjpXgUl/7A1nG5Q2N2Qgm
         nY+Q==
X-Gm-Message-State: AOAM533AfgZ2o98xRKpG2WcKryCms8nU7qwhjSctucC8tXSfoQDBpAJB
	nx/UdoujuL8fGCzdh+nhd5aXT5W+c80=
X-Google-Smtp-Source: ABdhPJyh4OKK3mi+F5EE9HkeaHTOYK3LKn5Sys28VTi6bpgRc5uvvIYXrAyAPZ+/iMRbVvGk5/1TYQ==
X-Received: by 2002:a05:6000:2a2:: with SMTP id l2mr7947999wry.110.1638376841840;
        Wed, 01 Dec 2021 08:40:41 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k27sm1694622wms.41.2021.12.01.08.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:40:41 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][honister][PATCH 3/5] uxen-guest-tools: fix -DMODULE not working when building uxenhc module
Date: Wed,  1 Dec 2021 17:40:32 +0100
Message-Id: <20211201164034.33610-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201164034.33610-1-Martin.Jansa@gmail.com>
References: <20211201164034.33610-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* undo the unnecessary and incomplete changes from 0001-vm-support-fix-buil=
d-for-kernel-s-5.4.patch
  because with 5.15 it was still failing with:
  ERROR: modpost: missing MODULE_LICENSE() in uxen-guest-tools/4.1.8-r0/uxe=
n-4.1.8-72a4af9/vm-support/linux/uxenhc/uxenhc.o

  fix it properly in 0004-uxenhc-fix-DMODULE-not-working-on-module-build-co=
mma.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...m-support-fix-build-for-kernel-s-5.4.patch | 13 -----
 ...LE-not-working-on-module-build-comma.patch | 56 +++++++++++++++++++
 .../uxen/uxen-guest-tools_4.1.8.bb            |  1 +
 3 files changed, 57 insertions(+), 13 deletions(-)
 create mode 100644 recipes-extended/uxen/uxen-guest-tools/0004-uxenhc-fix-=
DMODULE-not-working-on-module-build-comma.patch

diff --git a/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-bui=
ld-for-kernel-s-5.4.patch b/recipes-extended/uxen/uxen-guest-tools/0001-vm-=
support-fix-build-for-kernel-s-5.4.patch
index a3325ce..287170c 100644
--- a/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-=
kernel-s-5.4.patch
+++ b/recipes-extended/uxen/uxen-guest-tools/0001-vm-support-fix-build-for-=
kernel-s-5.4.patch
@@ -34,19 +34,6 @@ index 0b9ef3f..04957a8 100644
          if (!uxen_hcbase) {
              ret =3D -ENOMEM;
              goto out;
-@@ -149,8 +154,11 @@ static void __exit uxen_hypercall_exit(void)
- {
- }
-=20
-+
-+#define KBUILD_MODFILE "uxenhc"
-+
- module_init(uxen_hypercall_init);
- module_exit(uxen_hypercall_exit);
-+MODULE_LICENSE("GPL");
- MODULE_AUTHOR("paulian.marinca@bromium.com");
- MODULE_DESCRIPTION("uXen hypercall support");
--MODULE_LICENSE("GPL");
 diff --git a/v4vvsock/v4v_vsock.c b/v4vvsock/v4v_vsock.c
 index 8d80d7d..cd7e8ce 100644
 --- a/v4vvsock/v4v_vsock.c
diff --git a/recipes-extended/uxen/uxen-guest-tools/0004-uxenhc-fix-DMODULE=
-not-working-on-module-build-comma.patch b/recipes-extended/uxen/uxen-guest=
-tools/0004-uxenhc-fix-DMODULE-not-working-on-module-build-comma.patch
new file mode 100644
index 0000000..60018f0
--- /dev/null
+++ b/recipes-extended/uxen/uxen-guest-tools/0004-uxenhc-fix-DMODULE-not-wo=
rking-on-module-build-comma.patch
@@ -0,0 +1,56 @@
+From 732791cb353289e37448d84503a7d62ca156f29f Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 30 Nov 2021 16:33:14 +0000
+Subject: [PATCH] uxenhc: fix -DMODULE not working on module build command =
line
+
+* ATTOXEN_API_INC isn't defined anywhere in our OE builds, so the command =
line ends like this:
+
+  x86_64-oe-linux-gcc  -fuse-ld=3Dbfd -fmacro-prefix-map=3D/OE/work/qemux8=
6_64-oe-linux/uxen-guest-tools/4.1.8-r0=3D/usr/src/debug/uxen-guest-tools/4=
.1.8-r0                      -fdebug-prefix-map=3D/OE/work/qemux86_64-oe-li=
nux/uxen-guest-tools/4.1.8-r0=3D/usr/src/debug/uxen-guest-tools/4.1.8-r0   =
                   -fdebug-prefix-map=3D/OE/work/qemux86_64-oe-linux/uxen-g=
uest-tools/4.1.8-r0/recipe-sysroot=3D                      -fdebug-prefix-m=
ap=3D/OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/recipe-sysroot-=
native=3D  -fdebug-prefix-map=3D/OE/work-shared/qemux86-64/kernel-source=3D=
/usr/src/kernel -Wp,-MMD,/OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.=
8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/.hypercall.o.d -I/OE/work/q=
emux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/=
linux/include/ -I/OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/uxe=
n-4.1.8-72a4af9/vm-support/linux/include/uxen -I/OE/work/qemux86_64-oe-linu=
x/uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/include/uxe=
n/xen -I/OE/work-shared/qemux86-64/kernel-source/arch/x86/include -I./arch/=
x86/include/generated -I/OE/work-shared/qemux86-64/kernel-source/include -I=
./include -I/OE/work-shared/qemux86-64/kernel-source/arch/x86/include/uapi =
-I./arch/x86/include/generated/uapi -I/OE/work-shared/qemux86-64/kernel-sou=
rce/include/uapi -I./include/generated/uapi -include /OE/work-shared/qemux8=
6-64/kernel-source/include/linux/compiler-version.h -include /OE/work-share=
d/qemux86-64/kernel-source/include/linux/kconfig.h -include /OE/work-shared=
/qemux86-64/kernel-source/include/linux/compiler_types.h -D__KERNEL__ -fmac=
ro-prefix-map=3D/OE/work-shared/qemux86-64/kernel-source/=3D -Wall -Wundef =
-Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common=
 -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Di=
mplicit-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu89 -mno-ss=
e -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=3Dnone -m64 -falig=
n-jumps=3D1 -falign-loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-sta=
ck-boundary=3D3 -mskip-rax-setup -march=3Dcore2 -mno-red-zone -mcmodel=3Dke=
rnel -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3D=
thunk-extern -mindirect-branch-register -fno-jump-tables -fno-delete-null-p=
ointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflo=
w -Wno-address-of-packed-member -O2 -fno-allow-store-data-races -Wframe-lar=
ger-than=3D2048 -fstack-protector-strong -Wimplicit-fallthrough=3D5 -Wno-ma=
in -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-=
pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -pg -mrecor=
d-mcount -mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement -Wvla -Wn=
o-pointer-sign -Wno-stringop-truncation -Wno-zero-length-bounds -Wno-array-=
bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-s=
trict-overflow -fno-stack-check -fconserve-stack -Werror=3Ddate-time -Werro=
r=3Dincompatible-pointer-types -Werror=3Ddesignated-init -Wno-packed-not-al=
igned -DLX_TARGET_STANDARDVM -g -Wall -I  -DMODULE  -DKBUILD_BASENAME=3D'"h=
ypercall"' -DKBUILD_MODNAME=3D'"uxenhc"' -D__KBUILD_MODNAME=3Dkmod_uxenhc -=
c -o /OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4=
af9/vm-support/linux/uxenhc/hypercall.o /OE/work/qemux86_64-oe-linux/uxen-g=
uest-tools/4.1.8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/hypercall.c
+
+  the important part is "-I  -DMODULE" which breaks include/linux/module.h=
 behavior:
+
+  /*
+   * MODULE_FILE is used for generating modules.builtin
+   * So, make it no-op when this is being built as a module
+   */
+  #ifdef MODULE
+  #define MODULE_FILE
+  #else
+  #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
+  #endif
+
+  resulting in:
+
+  In file included from /OE/work-shared/qemux86-64/kernel-source/include/l=
inux/module.h:22,
+                   from /OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.=
8-r0/uxen-4.1.8-72a4af9/vm-support/linux/uxenhc/hypercall.c:3:
+  /OE/work-shared/qemux86-64/kernel-source/include/linux/module.h:183:43: =
error: expected ',' or ';' before 'KBUILD_MODFILE'
+    183 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
+        |                                           ^~~~~~~~~~~~~~
+  /OE/work-shared/qemux86-64/kernel-source/include/linux/moduleparam.h:26:=
61: note: in definition of macro '__MODULE_INFO'
+     26 |                 =3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" =
info
+        |                                                             ^~~~
+  /OE/work-shared/qemux86-64/kernel-source/include/linux/module.h:183:25: =
note: in expansion of macro 'MODULE_INFO'
+    183 | #define MODULE_FILE     MODULE_INFO(file, KBUILD_MODFILE);
+        |                         ^~~~~~~~~~~
+  /OE/work-shared/qemux86-64/kernel-source/include/linux/module.h:230:34: =
note: in expansion of macro 'MODULE_FILE'
+    230 | #define MODULE_LICENSE(_license) MODULE_FILE MODULE_INFO(license=
, _license)
+        |                                  ^~~~~~~~~~~
+  /OE/work/qemux86_64-oe-linux/uxen-guest-tools/4.1.8-r0/uxen-4.1.8-72a4af=
9/vm-support/linux/uxenhc/hypercall.c:161:1: note: in expansion of macro 'M=
ODULE_LICENSE'
+    161 | MODULE_LICENSE("GPL");
+        | ^~~~~~~~~~~~~~
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ uxenhc/Kbuild | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/uxenhc/Kbuild b/uxenhc/Kbuild
+index e418096..ef1b145 100644
+--- a/uxenhc/Kbuild
++++ b/uxenhc/Kbuild
+@@ -1,4 +1,3 @@
+ obj-m +=3D uxenhc.o
+=20
+ uxenhc-y :=3D hypercall.o
+-CFLAGS_hypercall.o :=3D -I$(ATTOXEN_API_INC)
+\ No newline at end of file
diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb b/recipes-exte=
nded/uxen/uxen-guest-tools_4.1.8.bb
index 841c71a..529efdb 100644
--- a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
+++ b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
@@ -12,6 +12,7 @@ SRC_URI =3D " \
     file://0001-vm-support-fix-build-for-kernel-s-5.4.patch \
     file://0002-vm-support-fix-build-for-kernel-s-5.15.patch \
     file://0003-vm-support-fix-build-for-kernel-s-5.14.patch \
+    file://0004-uxenhc-fix-DMODULE-not-working-on-module-build-comma.patch=
 \
 "
=20
 SRC_URI[uxen.sha384sum] =3D "be2233bc6506a23350d76c03ac28ea7ea381e1dc6ed5c=
e996e8ac71e6a3316fcaa2ed070c622618bd226f43a4d6db5d4"
--=20
2.32.0

