Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AB81E0095C; Tue, 25 Sep 2018 14:40:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FBF6E006AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 14:40:21 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id g24-v6so21348142lfb.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VPPr3LoxpfJyBRzPAQFvKvTXzp8Xzq575g4U+wUHSWY=;
	b=C0GmQ+1i4T98qVQ3zIUISCqxCG3RZZa/uVAWTx2pJlilTw5G6QmWwvte4ibGslGlAg
	Nbs9lOq/+UjK0nwuLr2hj5yI/XENYO+VZPDzAEK5TDroz2HDo6NZ7NaYoIafGpoZxDtj
	3dYVlgebm/K08PmX9ywwsGLs1EhTn38/x+DGwDrpe2wWxSYmL/qdeIBi7nTB1jgr7fxv
	xkZQ2lcTvJqXo+jCu6bpSyIW6+acsL9ZKSy/xR8bD4LNmohsXDUYzQ7OPavIcTA3DVx7
	Y0vxgq5q4cM3/B8Hi8C9tTVRLH38AZ0LuIAlV6mvsSgJfH6/hSKNExvih3yiZD/ILIVo
	tbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VPPr3LoxpfJyBRzPAQFvKvTXzp8Xzq575g4U+wUHSWY=;
	b=rZHfD3RO/tUUUu7XIx0UWXY74uADRZjM1LKGZM7BKOluqMfC/zj264CXLREpp1Sszw
	/5OFLYMRiyX6KwyMbLVqFfCKwFkWBpRsO1Cv5qOt1uAHzkWuqvg0uO0TspKMbMaTGz4p
	zrYLzwW9l8eSEo8npwP6mz3b4oI7GowGEIck7TajgpQbJqJybDHJJsDimZPWwDGW70He
	U9eubjlnRTpjbn6lVtDGg7yFQYytCr2TpIHkAcXFUqPJS2nlgjoU9rZgz6U+RHYm1Cdv
	ZNV6qlv0F5D2PxSrmNRpXIqeF88xdqDBF9OlahUsDvvA4Nhij/0BHOIB9xJfJHlo4kHL
	c46A==
X-Gm-Message-State: ABuFfogWuN+VgDK5tfqe1eoRPSkv8axB6Pf7wazT/N09VMLWuge/Zd9s
	/SNrZfLQXRR93V4bAUPbJ7A/zqIGhPxF7ajM71M=
X-Google-Smtp-Source: ACcGV6065O7Bjo0qz+wPBpV1xVOrlBgj2Frvd0Zubr61nwl/Y6b1tY1gGyB02dJhOa8R7FbfenzEPxwWtJYy7b8bStc=
X-Received: by 2002:a19:d3c4:: with SMTP id
	k187-v6mr2155107lfg.101.1537911620305; 
	Tue, 25 Sep 2018 14:40:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9691:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 14:40:19
	-0700 (PDT)
In-Reply-To: <1537897259-12290-1-git-send-email-christopher.w.clark@gmail.com>
References: <1537897259-12290-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Sep 2018 17:40:19 -0400
Message-ID: <CADkTA4NbFRiz6kK08Kn+QQACzpwra0UL46uqQeaVwbAviX4_xQ@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH] xen: fix build with _FORTIFY_SOURCE, gcc 8.2 and glibc 2.28
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
X-List-Received-Date: Tue, 25 Sep 2018 21:40:23 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Sep 25, 2018 at 1:40 PM,  <christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Apply upstream-reviewed patch to fix compilation.
> Patch reorders header includes to issue a pragma to disable SSE before
> including any potentially always_inline functions that would use SSE.
>
> Also modify the recipe to supply compiler flags via the tools variables where
> they will get used, necessary as _FORTIFY_SOURCE requires optimization flags to
> be supplied.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  .../xen/files/xen-disable-sse-before-inlines.patch | 140 +++++++++++++++++++++
>  recipes-extended/xen/xen.inc                       |   6 +
>  recipes-extended/xen/xen_4.11.0.bb                 |   1 +
>  recipes-extended/xen/xen_git.bb                    |   1 +
>  4 files changed, 148 insertions(+)
>  create mode 100644 recipes-extended/xen/files/xen-disable-sse-before-inlines.patch
>
> diff --git a/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch b/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch
> new file mode 100644
> index 0000000..54a28ee
> --- /dev/null
> +++ b/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch
> @@ -0,0 +1,140 @@
> +From 6d50ae155c0f736aa6239eabf1bc8c8e3704742d Mon Sep 17 00:00:00 2001
> +From: Christopher Clark <christopher.w.clark@gmail.com>
> +Date: Fri, 21 Sep 2018 08:28:02 -0700
> +Subject: [PATCH v2] fuzz, test x86_emulator: disable sse before including
> + always_inline fns
> +To: xen-devel@lists.xenproject.org,
> +    jbeulich@suse.com
> +Cc: ian.jackson@eu.citrix.com,
> +    wei.liu2@citrix.com,
> +    andrew.cooper3@citrix.com
> +
> +Workaround for compiler rejection of SSE-using always_inlines defined before
> +SSE is disabled.
> +
> +Compiling with _FORTIFY_SOURCE or higher levels of optimization enabled
> +will always_inline several library fns (memset, memcpy, ...)
> +(with gcc 8.2.0 and glibc 2.28).
> +
> +In fuzz and x86_emulator test, the compiler is instructed not
> +to generate SSE instructions via: #pragma GCC target("no-sse")
> +because those registers are needed for use by the workload.
> +
> +The combination above causes compilation failure as the inline functions
> +use those instructions. This is resolved by reordering the inclusion of
> +<stdio.h> and <string.h> to after the pragma disabling SSE generation.
> +
> +It would be preferable to locate the no-sse pragma within x86-emulate.h at the
> +top of the file, prior to including any other headers; unfortunately doing so
> +before <stdlib.h> causes compilation failure due to declaration of 'atof' with:
> +  "SSE register return with SSE disabled".
> +Fortunately there is no (known) current dependency on any always_inline
> +SSE-inclined function declared in <stdlib.h> or any of its dependencies, so the
> +pragma is therefore issued immediately after inclusion of <stdlib.h> with a
> +comment introduced to explain its location there.
> +
> +Add compile-time checks for unwanted prior inclusion of <string.h> and
> +<stdio.h>, which are the two headers that provide the library functions that
> +are handled with wrappers and listed within "x86-emulate.h" as ones "we think
> +might access any of the FPU state".
> +* Use standard-defined "EOF" macro to detect prior <stdio.h> inclusion.
> +* Use "_STRING_H" (non-standardized guard macro) as best-effort
> +  for detection of prior <string.h> inclusion. This is non-universally
> +  viable but will provide error output on common GLIBC systems, so
> +  provides some defensive coverage.
> +
> +Adds conditional #include <stdio.h> to x86-emulate.h because fwrite, printf,
> +etc. are referenced when WRAP has been defined.
> +
> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> +Reviewed-by: Jan Beulich <jbeulich@suse.com>
> +---
> + tools/fuzz/x86_instruction_emulator/fuzz-emul.c | 10 +++++++--
> + tools/tests/x86_emulator/wrappers.c             |  1 -
> + tools/tests/x86_emulator/x86-emulate.h          | 28 +++++++++++++++++++++++--
> + 3 files changed, 34 insertions(+), 5 deletions(-)
> +
> +diff --git a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> +index 03a2473..0ffd0fb 100644
> +--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> ++++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> +@@ -6,9 +6,7 @@
> + #include <stdbool.h>
> + #include <stddef.h>
> + #include <stdint.h>
> +-#include <stdio.h>
> + #include <stdlib.h>
> +-#include <string.h>
> + #include <sys/types.h>
> + #include <sys/stat.h>
> + #include <sys/mman.h>
> +@@ -16,6 +14,14 @@
> + #include <xen/xen.h>
> +
> + #include "x86-emulate.h"
> ++/*
> ++ * include "x86-emulate.h" prior to <stdio.h> and <string.h>:
> ++ * x86-emulate.h disables use of SSE registers, while <stdio.h> and <string.h>
> ++ * declare functions that may be always_inline and use those registers
> ++ * unless they have been disabled earlier, which can fail to compile.
> ++ */
> ++#include <stdio.h>
> ++#include <string.h>
> + #include "fuzz-emul.h"
> +
> + #define MSR_INDEX_MAX 16
> +diff --git a/tools/tests/x86_emulator/wrappers.c b/tools/tests/x86_emulator/wrappers.c
> +index d02013c..eba7cc9 100644
> +--- a/tools/tests/x86_emulator/wrappers.c
> ++++ b/tools/tests/x86_emulator/wrappers.c
> +@@ -1,5 +1,4 @@
> + #include <stdarg.h>
> +-#include <stdio.h>
> +
> + #define WRAP(x) typeof(x) emul_##x
> + #include "x86-emulate.h"
> +diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
> +index b249e46..07ea1e8 100644
> +--- a/tools/tests/x86_emulator/x86-emulate.h
> ++++ b/tools/tests/x86_emulator/x86-emulate.h
> +@@ -3,11 +3,35 @@
> + #include <stddef.h>
> + #include <stdint.h>
> + #include <stdlib.h>
> +-#include <string.h>
> +-
> ++/*
> ++ * Use of sse registers must be disabled prior to the definition of
> ++ * always_inline functions that would use them (memcpy, memset, etc),
> ++ * so do this as early as possible, aiming to be before any always_inline
> ++ * functions that are used are declared.
> ++ * Unfortunately, this cannot be done prior to inclusion of <stdlib.h>
> ++ * due to functions such as 'atof' that have SSE register return declared,
> ++ * so do so here, immediately after that.
> ++ */
> + #if __GNUC__ >= 6
> + #pragma GCC target("no-sse")
> + #endif
> ++ /*
> ++ * Attempt detection of unwanted prior inclusion of some headers known to use
> ++ * always_inline with SSE registers in some library / compiler / optimization
> ++ * combinations.
> ++ */
> ++#ifdef _STRING_H
> ++#error "Must not include <string.h> before x86-emulate.h"
> ++#endif
> ++#include <string.h>
> ++
> ++/* EOF is a standard macro defined in <stdio.h> so use it for detection */
> ++#ifdef EOF
> ++#error "Must not include <stdio.h> before x86-emulate.h"
> ++#endif
> ++#ifdef WRAP
> ++#include <stdio.h>
> ++#endif
> +
> + #include <xen/xen.h>
> +
> +--
> +2.1.4
> +
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index bf4b3c2..365f71d 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -842,6 +842,12 @@ export LDFLAGS=""
>  # patching the build to be ok with this
>  TUNE_CCARGS := "${@oe.utils.str_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
>
> +# Supply the full set of compiler flags via the tool variables
> +# Yocto supplys _FORTIFY_SOURCE via CC/CPP/CXX but optimization -O via C*FLAGS
> +CC_append = " ${CFLAGS}"
> +CPP_append = " ${CPPFLAGS}"
> +CXX_append = " ${CXXFLAGS}"
> +
>  EXTRA_OECONF += " \
>      --exec-prefix=/usr \
>      --prefix=/usr \
> diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.0.bb
> index 40e7340..b275066 100644
> --- a/recipes-extended/xen/xen_4.11.0.bb
> +++ b/recipes-extended/xen/xen_4.11.0.bb
> @@ -6,6 +6,7 @@ SRC_URI = " \
>      file://tools-xentop-vwprintw.patch \
>      file://xen-4.11-arm-acpi-fix-string-lengths.patch \
>      file://xen-tools-xenpmd-snprintf.patch \
> +    file://xen-disable-sse-before-inlines.patch \
>      "
>
>  SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index da1eea6..81ee100 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -12,6 +12,7 @@ S = "${WORKDIR}/git"
>
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> +    file://xen-disable-sse-before-inlines.patch \
>      "
>
>  DEFAULT_PREFERENCE = "-1"
> --
> 2.1.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

