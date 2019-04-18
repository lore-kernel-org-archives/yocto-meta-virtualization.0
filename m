Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D569E00AD5; Thu, 18 Apr 2019 06:34:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11ECBE0096F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 06:34:08 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id w23so1643709lfc.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nHwEmoe62UvTyQ4nS+2TRF4qrsfxpr9LJfbhpKQdxIs=;
	b=eKmJ1y3PC5WFXcLhyXn3+R+4Mq9BxEOLf+Vb1XI4nJ2bu32OyBT9lxpFMdzD2h8isR
	81If7KxuAmuhQKGP1/3Zc7tGq8ZwGpBH7kAv+y9pikUxGNrE8t0C2Oq7rDLOMKxt9Vpd
	BLHWy/da8n+odF/Azf3A6o7l5Uxlk+QhwQ+uzBZkG43QPfMYdQqOZ2Q/IPv4i323CPp6
	7tbR2+RuvX7tZpW6vI/srBMCUhBX5t8r8CF9Z6kY4ZkqrhMo8WN2VVO+YcXG9sXl2pTx
	Hkc34Lo1TUqyEHbAGN/66ziYYc5Bd49n8qobItaT340CnWIhnFFteUEtZF/NEKiaQaAG
	a3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nHwEmoe62UvTyQ4nS+2TRF4qrsfxpr9LJfbhpKQdxIs=;
	b=L0LKewndAaYYzeUIsUV6RBG53hG80XtKZPp4jMMp/ZgMhFLWsBx4rTAJiI1Bgkfi2b
	I8+7vljdiGLAZIAR6Mu0TpGjubai4T5a2Z/5wse4xo9QEfN6niFCyZDg2SIG7R/vJuE4
	sZYo7kBycWcgbo7SVMuuZ+9ooGH6f1BjIvhvCI2BzsFY7ElzLrfgdl0x02G+3sGhIWZU
	20xjHd/xTT8zPChhcZ6lW9yhTThhr9gvetpLzVpt2xo8NjVGf9XRIhqlhopftSPF9gli
	oP4yN9tVDbLG/5qOTWWvzMQk97RoVurDCYlnCP892L097t7zQula88L46kg9rj6NDDwj
	hdxw==
X-Gm-Message-State: APjAAAVlTV9fz2qy6/50oPyGAk2D1Wx0fzFqlfA/cqGA9aOmDbUlWH0S
	UwQ0ezVd2KKbrMERhcks0x0VOD/F0F02YQkXIGn17gc7
X-Google-Smtp-Source: APXvYqxkoD8T+tWsOq6PgdG4jx9jzuAgnbzh5bp0JRWt3ezhKmUZoVW4/I+cWx1LigmZHrbao4DM5oSkKCW4iogJv1Y=
X-Received: by 2002:ac2:5207:: with SMTP id a7mr33403683lfl.70.1555594447634; 
	Thu, 18 Apr 2019 06:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190416203537.32623-1-christopher.w.clark@gmail.com>
	<20190416203537.32623-2-christopher.w.clark@gmail.com>
In-Reply-To: <20190416203537.32623-2-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Apr 2019 09:33:56 -0400
Message-ID: <CADkTA4PZgjxD+zb--AWt6MHwEhc2Q=CFuDR=LiDFUL7=Ln=-cg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] xen: upgrade to 4.12.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2019 13:34:11 -0000
Content-Type: text/plain; charset="UTF-8"

All patches in the series have been merged.

Bruce

On Tue, Apr 16, 2019 at 4:35 PM <christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  ...thon-pygrub-pass-DISTUTILS-xen.4.12.patch} |  18 +--
>  .../xen/files/tools-xentop-vwprintw.patch     |  25 ----
>  ...xen-4.11-arm-acpi-fix-string-lengths.patch | 101 -------------
>  .../xen-disable-sse-before-inlines.patch      | 140 ------------------
>  .../xen/files/xen-tools-xenpmd-snprintf.patch |  78 ----------
>  recipes-extended/xen/xen.inc                  |  14 +-
>  recipes-extended/xen/xen_4.11.1.bb            |  16 --
>  recipes-extended/xen/xen_4.12.0.bb            |  12 ++
>  recipes-extended/xen/xen_git.bb               |   7 +-
>  9 files changed, 34 insertions(+), 377 deletions(-)
>  rename recipes-extended/xen/files/{0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch => 0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch} (85%)
>  delete mode 100644 recipes-extended/xen/files/tools-xentop-vwprintw.patch
>  delete mode 100644 recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch
>  delete mode 100644 recipes-extended/xen/files/xen-disable-sse-before-inlines.patch
>  delete mode 100644 recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch
>  delete mode 100644 recipes-extended/xen/xen_4.11.1.bb
>  create mode 100644 recipes-extended/xen/xen_4.12.0.bb
>
> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
> similarity index 85%
> rename from recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch
> rename to recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
> index 03c39fe..6504d86 100644
> --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch
> +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch
> @@ -9,21 +9,20 @@ This is especially useful when the target libdir is not the default one
>  (/usr/lib), but for example /usr/lib64.
>
>  Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ----
> - tools/pygrub/Makefile | 5 +++--
> - tools/python/Makefile | 4 ++--
> - 2 files changed, 5 insertions(+), 4 deletions(-)
> +
> +Forward-ported to Xen 4.12.0
> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>
>  diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> -index 536af07932b4..e1c773101412 100644
> +index 3063c49..513314b 100644
>  --- a/tools/pygrub/Makefile
>  +++ b/tools/pygrub/Makefile
>  @@ -10,14 +10,15 @@ INSTALL_LOG = build/installed_files.txt
>   all: build
>   .PHONY: build
>   build:
> --      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build
> -+      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
> +-      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
> ++      CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
>
>   .PHONY: install
>   install: all
> @@ -37,7 +36,7 @@ index 536af07932b4..e1c773101412 100644
>                      "`readlink -f $(DESTDIR)/$(bindir)`" != \
>                      "`readlink -f $(LIBEXEC_BIN)`" ]; then \
>  diff --git a/tools/python/Makefile b/tools/python/Makefile
> -index 541858e2f886..4d4a344f1d33 100644
> +index 541858e..4d4a344 100644
>  --- a/tools/python/Makefile
>  +++ b/tools/python/Makefile
>  @@ -10,7 +10,7 @@ INSTALL_LOG = build/installed_files.txt
> @@ -58,6 +57,3 @@ index 541858e2f886..4d4a344f1d33 100644
>
>         $(INSTALL_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEXEC_BIN)
>         $(INSTALL_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BIN)
> ---
> -2.7.4
> -
> diff --git a/recipes-extended/xen/files/tools-xentop-vwprintw.patch b/recipes-extended/xen/files/tools-xentop-vwprintw.patch
> deleted file mode 100644
> index 5d5d011..0000000
> --- a/recipes-extended/xen/files/tools-xentop-vwprintw.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -tools/xentop : fix vwprintw -Werror=deprecated-declarations warning
> -
> -gcc-8.1 complains:
> -
> -| xentop.c: In function 'print':
> -| xentop.c:304:4: error: 'vwprintw' is deprecated [-Werror=deprecated-declarations]
> -|     vwprintw(stdscr, (curses_str_t)fmt, args);
> -|     ^~~~~~~~
> -
> -vw_printw is the non-deprecated alternative.
> -
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -diff --git a/tools/xenstat/xentop/xentop.c b/tools/xenstat/xentop/xentop.c
> -index 2fd2b67..c465810 100644
> ---- a/tools/xenstat/xentop/xentop.c
> -+++ b/tools/xenstat/xentop/xentop.c
> -@@ -301,7 +301,7 @@ static void print(const char *fmt, ...)
> -       if (!batch) {
> -               if((current_row() < lines()-1)) {
> -                       va_start(args, fmt);
> --                      vwprintw(stdscr, (curses_str_t)fmt, args);
> -+                      vw_printw(stdscr, (curses_str_t)fmt, args);
> -                       va_end(args);
> -               }
> -       } else {
> diff --git a/recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch b/recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch
> deleted file mode 100644
> index ece6407..0000000
> --- a/recipes-extended/xen/files/xen-4.11-arm-acpi-fix-string-lengths.patch
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -From 5e1a00969afe98a713bf14d1ba1902403b60e287 Mon Sep 17 00:00:00 2001
> -From: Christopher Clark <christopher.w.clark@gmail.com>
> -Date: Thu, 16 Aug 2018 13:04:52 -0700
> -Subject: [PATCH v2] libxl/arm: Fix build on arm64 + acpi w/ gcc 8.2
> -To: xen-devel@lists.xenproject.org
> -Cc: wei.liu2@citrix.com,
> -    ian.jackson@eu.citrix.com,
> -    julien.grall@arm.com,
> -    sstabellini@kernel.org
> -
> -[modified for Xen 4.11 to add required: #include <xen-tools/libs.h>]
> -
> -Add zero-padding to #defined ACPI table strings that are copied.
> -Provides sufficient characters to satisfy the length required to
> -fully populate the destination and prevent array-bounds warnings.
> -Add BUILD_BUG_ON sizeof checks for compile-time length checking.
> -
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> -Acked-by: Wei Liu <wei.liu2@citrix.com>
> ----
> -v2: add BUILD_BUG_ON length checks, requested by Wei.
> -
> -v1: Please add this patch to the backport list for the next minor
> -    4.11 release.
> -
> -Prior to this: gcc 8.2 objects to memcpy past bounds:
> -
> -| libxl_arm_acpi.c: In function 'make_acpi_header':
> -| libxl_arm_acpi.c:208:5: error: 'memcpy' forming offset [5, 6] is out
> -of the bounds [0, 4] [-Werror=array-bounds]
> -|      memcpy(h->oem_id, ACPI_OEM_ID, sizeof(h->oem_id));
> -|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -| libxl_arm_acpi.c:209:5: error: 'memcpy' forming offset [5, 8] is out
> -of the bounds [0, 4] [-Werror=array-bounds]
> -|      memcpy(h->oem_table_id, ACPI_OEM_TABLE_ID,
> -sizeof(h->oem_table_id));
> -|
> -^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -| libxl_arm_acpi.c:211:5: error: 'memcpy' forming offset 4 is out of the
> -bounds [0, 3] [-Werror=array-bounds]
> -|      memcpy(h->asl_compiler_id, ACPI_ASL_COMPILER_ID,
> -|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -|             sizeof(h->asl_compiler_id));
> -|             ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -| In function 'make_acpi_rsdp.isra.4',
> -|     inlined from 'libxl__prepare_acpi' at libxl_arm_acpi.c:389:5:
> -| libxl_arm_acpi.c:193:5: error: 'memcpy' forming offset [5, 6] is out
> -of the bounds [0, 4] [-Werror=array-bounds]
> -|      memcpy(rsdp->oem_id, ACPI_OEM_ID, sizeof(rsdp->oem_id));
> -|      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -
> - tools/libxl/libxl_arm_acpi.c | 10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/tools/libxl/libxl_arm_acpi.c b/tools/libxl/libxl_arm_acpi.c
> -index 636f724..8924396 100644
> ---- a/tools/libxl/libxl_arm_acpi.c
> -+++ b/tools/libxl/libxl_arm_acpi.c
> -@@ -29,6 +29,7 @@ typedef int64_t s64;
> -
> - #include <acpi/acconfig.h>
> - #include <acpi/actbl.h>
> -+#include <xen-tools/libs.h>
> -
> - #ifndef BITS_PER_LONG
> - #ifdef _LP64
> -@@ -48,9 +49,9 @@ extern const unsigned char dsdt_anycpu_arm[];
> - _hidden
> - extern const int dsdt_anycpu_arm_len;
> -
> --#define ACPI_OEM_ID "Xen"
> --#define ACPI_OEM_TABLE_ID "ARM"
> --#define ACPI_ASL_COMPILER_ID "XL"
> -+#define ACPI_OEM_ID "Xen\0\0"
> -+#define ACPI_OEM_TABLE_ID "ARM\0\0\0\0"
> -+#define ACPI_ASL_COMPILER_ID "XL\0"
> -
> - enum {
> -     RSDP,
> -@@ -190,6 +191,7 @@ static void make_acpi_rsdp(libxl__gc *gc, struct xc_dom_image *dom,
> -     struct acpi_table_rsdp *rsdp = (void *)dom->acpi_modules[0].data + offset;
> -
> -     memcpy(rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
> -+    BUILD_BUG_ON(sizeof(ACPI_OEM_ID) != sizeof(rsdp->oem_id));
> -     memcpy(rsdp->oem_id, ACPI_OEM_ID, sizeof(rsdp->oem_id));
> -     rsdp->length = acpitables[RSDP].size;
> -     rsdp->revision = 0x02;
> -@@ -205,9 +207,12 @@ static void make_acpi_header(struct acpi_table_header *h, const char *sig,
> -     memcpy(h->signature, sig, 4);
> -     h->length = len;
> -     h->revision = rev;
> -+    BUILD_BUG_ON(sizeof(ACPI_OEM_ID) != sizeof(h->oem_id));
> -     memcpy(h->oem_id, ACPI_OEM_ID, sizeof(h->oem_id));
> -+    BUILD_BUG_ON(sizeof(ACPI_OEM_TABLE_ID) != sizeof(h->oem_table_id));
> -     memcpy(h->oem_table_id, ACPI_OEM_TABLE_ID, sizeof(h->oem_table_id));
> -     h->oem_revision = 0;
> -+    BUILD_BUG_ON(sizeof(ACPI_ASL_COMPILER_ID) != sizeof(h->asl_compiler_id));
> -     memcpy(h->asl_compiler_id, ACPI_ASL_COMPILER_ID,
> -            sizeof(h->asl_compiler_id));
> -     h->asl_compiler_revision = 0;
> diff --git a/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch b/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch
> deleted file mode 100644
> index 54a28ee..0000000
> --- a/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -From 6d50ae155c0f736aa6239eabf1bc8c8e3704742d Mon Sep 17 00:00:00 2001
> -From: Christopher Clark <christopher.w.clark@gmail.com>
> -Date: Fri, 21 Sep 2018 08:28:02 -0700
> -Subject: [PATCH v2] fuzz, test x86_emulator: disable sse before including
> - always_inline fns
> -To: xen-devel@lists.xenproject.org,
> -    jbeulich@suse.com
> -Cc: ian.jackson@eu.citrix.com,
> -    wei.liu2@citrix.com,
> -    andrew.cooper3@citrix.com
> -
> -Workaround for compiler rejection of SSE-using always_inlines defined before
> -SSE is disabled.
> -
> -Compiling with _FORTIFY_SOURCE or higher levels of optimization enabled
> -will always_inline several library fns (memset, memcpy, ...)
> -(with gcc 8.2.0 and glibc 2.28).
> -
> -In fuzz and x86_emulator test, the compiler is instructed not
> -to generate SSE instructions via: #pragma GCC target("no-sse")
> -because those registers are needed for use by the workload.
> -
> -The combination above causes compilation failure as the inline functions
> -use those instructions. This is resolved by reordering the inclusion of
> -<stdio.h> and <string.h> to after the pragma disabling SSE generation.
> -
> -It would be preferable to locate the no-sse pragma within x86-emulate.h at the
> -top of the file, prior to including any other headers; unfortunately doing so
> -before <stdlib.h> causes compilation failure due to declaration of 'atof' with:
> -  "SSE register return with SSE disabled".
> -Fortunately there is no (known) current dependency on any always_inline
> -SSE-inclined function declared in <stdlib.h> or any of its dependencies, so the
> -pragma is therefore issued immediately after inclusion of <stdlib.h> with a
> -comment introduced to explain its location there.
> -
> -Add compile-time checks for unwanted prior inclusion of <string.h> and
> -<stdio.h>, which are the two headers that provide the library functions that
> -are handled with wrappers and listed within "x86-emulate.h" as ones "we think
> -might access any of the FPU state".
> -* Use standard-defined "EOF" macro to detect prior <stdio.h> inclusion.
> -* Use "_STRING_H" (non-standardized guard macro) as best-effort
> -  for detection of prior <string.h> inclusion. This is non-universally
> -  viable but will provide error output on common GLIBC systems, so
> -  provides some defensive coverage.
> -
> -Adds conditional #include <stdio.h> to x86-emulate.h because fwrite, printf,
> -etc. are referenced when WRAP has been defined.
> -
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ----
> - tools/fuzz/x86_instruction_emulator/fuzz-emul.c | 10 +++++++--
> - tools/tests/x86_emulator/wrappers.c             |  1 -
> - tools/tests/x86_emulator/x86-emulate.h          | 28 +++++++++++++++++++++++--
> - 3 files changed, 34 insertions(+), 5 deletions(-)
> -
> -diff --git a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> -index 03a2473..0ffd0fb 100644
> ---- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> -+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> -@@ -6,9 +6,7 @@
> - #include <stdbool.h>
> - #include <stddef.h>
> - #include <stdint.h>
> --#include <stdio.h>
> - #include <stdlib.h>
> --#include <string.h>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include <sys/mman.h>
> -@@ -16,6 +14,14 @@
> - #include <xen/xen.h>
> -
> - #include "x86-emulate.h"
> -+/*
> -+ * include "x86-emulate.h" prior to <stdio.h> and <string.h>:
> -+ * x86-emulate.h disables use of SSE registers, while <stdio.h> and <string.h>
> -+ * declare functions that may be always_inline and use those registers
> -+ * unless they have been disabled earlier, which can fail to compile.
> -+ */
> -+#include <stdio.h>
> -+#include <string.h>
> - #include "fuzz-emul.h"
> -
> - #define MSR_INDEX_MAX 16
> -diff --git a/tools/tests/x86_emulator/wrappers.c b/tools/tests/x86_emulator/wrappers.c
> -index d02013c..eba7cc9 100644
> ---- a/tools/tests/x86_emulator/wrappers.c
> -+++ b/tools/tests/x86_emulator/wrappers.c
> -@@ -1,5 +1,4 @@
> - #include <stdarg.h>
> --#include <stdio.h>
> -
> - #define WRAP(x) typeof(x) emul_##x
> - #include "x86-emulate.h"
> -diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
> -index b249e46..07ea1e8 100644
> ---- a/tools/tests/x86_emulator/x86-emulate.h
> -+++ b/tools/tests/x86_emulator/x86-emulate.h
> -@@ -3,11 +3,35 @@
> - #include <stddef.h>
> - #include <stdint.h>
> - #include <stdlib.h>
> --#include <string.h>
> --
> -+/*
> -+ * Use of sse registers must be disabled prior to the definition of
> -+ * always_inline functions that would use them (memcpy, memset, etc),
> -+ * so do this as early as possible, aiming to be before any always_inline
> -+ * functions that are used are declared.
> -+ * Unfortunately, this cannot be done prior to inclusion of <stdlib.h>
> -+ * due to functions such as 'atof' that have SSE register return declared,
> -+ * so do so here, immediately after that.
> -+ */
> - #if __GNUC__ >= 6
> - #pragma GCC target("no-sse")
> - #endif
> -+ /*
> -+ * Attempt detection of unwanted prior inclusion of some headers known to use
> -+ * always_inline with SSE registers in some library / compiler / optimization
> -+ * combinations.
> -+ */
> -+#ifdef _STRING_H
> -+#error "Must not include <string.h> before x86-emulate.h"
> -+#endif
> -+#include <string.h>
> -+
> -+/* EOF is a standard macro defined in <stdio.h> so use it for detection */
> -+#ifdef EOF
> -+#error "Must not include <stdio.h> before x86-emulate.h"
> -+#endif
> -+#ifdef WRAP
> -+#include <stdio.h>
> -+#endif
> -
> - #include <xen/xen.h>
> -
> ---
> -2.1.4
> -
> diff --git a/recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch b/recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch
> deleted file mode 100644
> index aac7282..0000000
> --- a/recipes-extended/xen/files/xen-tools-xenpmd-snprintf.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From e4d78a67ffbacf30b66464080898227f18f6bf49 Mon Sep 17 00:00:00 2001
> -From: Christopher Clark <christopher.w.clark@gmail.com>
> -Date: Fri, 17 Aug 2018 17:46:10 -0700
> -Subject: [PATCH] xenpmd: prevent format-truncation warning with gcc 8.2 + ARM
> - 32-bit
> -To: xen-devel@lists.xenproject.org
> -Cc: ian.jackson@eu.citrix.com,
> -    wei.liu2@citrix.com
> -
> -xenpmd writes battery information to xenstore, including a string with a
> -formatted hex value calculated from summing the lengths of four strings,
> -plus some constants.
> -
> -Each of the four strings has a maximum length of 31 bytes, excluding the
> -terminating zero byte. The strings are stored in 32-byte arrays in a
> -struct that is zeroed before it is populated, and logic that writes to
> -the strings uses strncpy and explicit zero termination.
> -
> -The maximum value to be supplied to the xenstore string is:
> -  (9 * 4) + (31 * 4) + 4 , which is 164, ie. 0xa4.
> -
> -When used with this value, '%02x' will always fit within 3 bytes, but
> -gcc 8.2 is apparently not able to deduce this (observed when building
> -for a 32-bit ARM platform).
> -
> -This commit assists the compiler by applying a mask (0xff) to the value,
> -enabling it to observe a lower maximum value and so pass the truncation
> -length check.
> -
> -Prior to this change, building fails with the compiler warning:
> -
> -| xenpmd.c: In function 'write_battery_info_to_xenstore':
> -| xenpmd.c:354:23: error: '%02x' directive output may be truncated
> -writing between 2 and 8 bytes into a region of size 3
> -[-Werror=format-truncation=]
> -|      snprintf(val, 3, "%02x",
> -|                        ^~~~
> -| xenpmd.c:354:22: note: directive argument in the range [40, 2147483778]
> -|      snprintf(val, 3, "%02x",
> -|                       ^~~~~~
> -| xenpmd.c:354:5: note: 'snprintf' output between 3 and 9 bytes into a
> -destination of size 3
> -|      snprintf(val, 3, "%02x",
> -|      ^~~~~~~~~~~~~~~~~~~~~~~~
> -|               (unsigned int)(9*4 +
> -|               ~~~~~~~~~~~~~~~~~~~~
> -|                              strlen(info->model_number) +
> -|                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -|                              strlen(info->serial_number) +
> -|                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -|                              strlen(info->battery_type) +
> -|                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -|                              strlen(info->oem_info) + 4));
> -|                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> -| cc1: all warnings being treated as errors
> -
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ----
> - tools/xenpmd/xenpmd.c | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
> -index 56412a9..0c0787e 100644
> ---- a/tools/xenpmd/xenpmd.c
> -+++ b/tools/xenpmd/xenpmd.c
> -@@ -350,8 +350,10 @@ void write_battery_info_to_xenstore(struct battery_info *info)
> -
> -     memset(val, 0, 1024);
> -     memset(string_info, 0, 256);
> --    /* write 9 dwords (so 9*4) + length of 4 strings + 4 null terminators */
> --    snprintf(val, 3, "%02x",
> -+    /* write 9 dwords (so 9*4) + length of 4 strings + 4 null terminators.
> -+     * mask informs the compiler that format truncation will not occur.
> -+     */
> -+    snprintf(val, 3, "%02x", 0xff &
> -              (unsigned int)(9*4 +
> -                             strlen(info->model_number) +
> -                             strlen(info->serial_number) +
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index e29e7f7..b357824 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -383,13 +383,21 @@ FILES_${PN}-libblktap-dev = " \
>      ${datadir}/pkgconfig/blktap.pc \
>      "
>
> -FILES_${PN}-libfsimage = "${libdir}/libfsimage.so.*"
> +FILES_${PN}-libfsimage = " \
> +    ${libdir}/libfsimage.so.* \
> +    ${libdir}/libxenfsimage.so.* \
> +    "
>  FILES_${PN}-libfsimage-dev = " \
>      ${libdir}/libfsimage.so \
> +    ${libdir}/libxenfsimage.so \
>      ${datadir}/pkgconfig/fsimage.pc \
> +    ${datadir}/pkgconfig/xenfsimage.pc \
>      "
>
> -FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
> +FILES_${PN}-fsimage = " \
> +    ${libdir}/fs/*/*fsimage.so \
> +    ${libdir}/xenfsimage/*/fsimage.so \
> +    "
>
>  FILES_${PN}-hypervisor = "\
>      /boot/xen-* \
> @@ -466,6 +474,7 @@ FILES_${PN}-hvmloader = "\
>
>  FILES_${PN}-kdd = "\
>      ${sbindir}/kdd \
> +    ${sbindir}/xen-kdd \
>      "
>
>  FILES_${PN}-livepatch += " \
> @@ -738,6 +747,7 @@ FILES_${PN}-xenmon = "\
>      ${sbindir}/xenbaked \
>      ${sbindir}/xentrace_setmask \
>      ${sbindir}/xenmon.py \
> +    ${sbindir}/xenmon \
>      "
>
>  FILES_${PN}-xm = "\
> diff --git a/recipes-extended/xen/xen_4.11.1.bb b/recipes-extended/xen/xen_4.11.1.bb
> deleted file mode 100644
> index fea17a7..0000000
> --- a/recipes-extended/xen/xen_4.11.1.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> -require xen.inc
> -
> -SRC_URI = " \
> -    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
> -    file://tools-xentop-vwprintw.patch \
> -    file://xen-4.11-arm-acpi-fix-string-lengths.patch \
> -    file://xen-tools-xenpmd-snprintf.patch \
> -    file://xen-disable-sse-before-inlines.patch \
> -    file://0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch \
> -    "
> -
> -SRC_URI[md5sum] = "0c72b97432465e7f81113630fcd6e460"
> -SRC_URI[sha256sum] = "be88cb2443761990efc1070d9718016561fe19066af232f9bfae572922897e59"
> -
> -S = "${WORKDIR}/xen-${PV}"
> diff --git a/recipes-extended/xen/xen_4.12.0.bb b/recipes-extended/xen/xen_4.12.0.bb
> new file mode 100644
> index 0000000..246be7a
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.12.0.bb
> @@ -0,0 +1,12 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +require xen.inc
> +
> +SRC_URI = " \
> +    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
> +    "
> +
> +SRC_URI[md5sum] = "7d24d4541e3025421e02384cabc3528b"
> +SRC_URI[sha256sum] = "6e5455e4a58dcb2339bfcd2a89842728068b530aa62501843793f7cf743c4d64"
> +
> +S = "${WORKDIR}/xen-${PV}"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index 0ebd81c..5f950e6 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,8 +1,8 @@
>  require xen.inc
>
> -SRCREV ?= "2b50cdbc444c637575580dcfa6c9525a84d5cc62"
> +SRCREV ?= "cb70a26f78848fe45f593f7ebc9cfaac760a791b"
>
> -XEN_REL = "4.12"
> +XEN_REL = "4.13"
>  XEN_BRANCH = "staging"
>  FLASK_POLICY_FILE = "xenpolicy-${XEN_REL}-unstable"
>
> @@ -12,8 +12,7 @@ S = "${WORKDIR}/git"
>
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> -    file://xen-disable-sse-before-inlines.patch \
> -    file://0001-python-pygrub-pass-DISTUTILS-env-vars-as-setup.py-ar.patch \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
>      "
>
>  DEFAULT_PREFERENCE = "-1"
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

