Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28781E00994; Tue, 25 Sep 2018 10:41:16 -0700 (PDT)
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
	*      [209.85.166.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9919CE007B3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 10:41:14 -0700 (PDT)
Received: by mail-it1-f194.google.com with SMTP id 139-v6so16394060itf.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 10:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+MrMeFARujCIlgtQ1d5fe2x7c2BpFTbMgMRrV0KdioQ=;
	b=hs4IEpHnx5PAOZomFeYey3g6V6whDTRMBzbxlsQMzM5WMmf47XrigjdL0xoarKrmCA
	1h0SJqNSMdSIpzKWuwSUrhzXdovX3/yNQEiPXyi0yd4zcXRqQHebgooGpbxn8dZ4Sc/t
	kycRKEpfR3b6qtnsBIeOf71t1V9U1J0dr3s+ZNgLvzo5L9+mpIw2bHYUmkDUnGEiHUNC
	GuTEb6cLxdbNPa3vld7/69tmzJEX6RItjtgv57uxmnY4wzfaN9e83KevOb8fXPMC40t0
	uYVOCG8dVnb1e8cbDly3zoF2pZXLxKTR8jtFdOLZHGRf6XEPOsdBPRfU1T63ckaiu8lS
	WpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+MrMeFARujCIlgtQ1d5fe2x7c2BpFTbMgMRrV0KdioQ=;
	b=oe3Pvd/to2NlYu6vA5VBl49uUVfHo2FJ1RKcjLQQ4sfx+dV+trZvV1HC03dWqs1Gz0
	JGJppeUCsX1AIeRPaaTawOKnd7RgZjuTgzCqO8quO3DihcT3Kb13lPlfUugsm+wjFLPd
	HDXsk2eSD70NOrUpj7jL/8vmQaY6u8p/GHbuDJEgyEmlEbVKtCA5GSZCMj+xy/hEg6/B
	uhO5Vrnm191aCuszEANhNZbsF3zMvkbrbuCbt04b9J2/zvV9ai09ptWD1API7eq1/Lrd
	/DrjvkF0UuxYCUBv1PQBT86bKNvZqc6qi4pH4m8Stoj1D6eJ7P3en+d8PJb3g8/lRjyQ
	W4nA==
X-Gm-Message-State: ABuFfohfqTNOBDw8RLpGOtDP1gkoUm95X5+VVCNtEaq3wJzaiEyMVWFj
	bqeUedKivmhaaiZSOGQFOi+ftk3M
X-Google-Smtp-Source: ACcGV60yoHTbOnnFqt+H0LH95o8umANIG8AuOWbo/5nzsPwCQrzc8CRxYk2Y8rk45vSgwLEhiJpkag==
X-Received: by 2002:a24:4486:: with SMTP id
	o128-v6mr1840450ita.23.1537897273485; 
	Tue, 25 Sep 2018 10:41:13 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	t24-v6sm1208823ite.12.2018.09.25.10.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Sep 2018 10:41:12 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 25 Sep 2018 10:40:59 -0700
Message-Id: <1537897259-12290-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: cardoe@gentoo.org
Subject: [PATCH] xen: fix build with _FORTIFY_SOURCE, gcc 8.2 and glibc 2.28
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
X-List-Received-Date: Tue, 25 Sep 2018 17:41:16 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Apply upstream-reviewed patch to fix compilation.
Patch reorders header includes to issue a pragma to disable SSE before
including any potentially always_inline functions that would use SSE.

Also modify the recipe to supply compiler flags via the tools variables where
they will get used, necessary as _FORTIFY_SOURCE requires optimization flags to
be supplied.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .../xen/files/xen-disable-sse-before-inlines.patch | 140 +++++++++++++++++++++
 recipes-extended/xen/xen.inc                       |   6 +
 recipes-extended/xen/xen_4.11.0.bb                 |   1 +
 recipes-extended/xen/xen_git.bb                    |   1 +
 4 files changed, 148 insertions(+)
 create mode 100644 recipes-extended/xen/files/xen-disable-sse-before-inlines.patch

diff --git a/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch b/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch
new file mode 100644
index 0000000..54a28ee
--- /dev/null
+++ b/recipes-extended/xen/files/xen-disable-sse-before-inlines.patch
@@ -0,0 +1,140 @@
+From 6d50ae155c0f736aa6239eabf1bc8c8e3704742d Mon Sep 17 00:00:00 2001
+From: Christopher Clark <christopher.w.clark@gmail.com>
+Date: Fri, 21 Sep 2018 08:28:02 -0700
+Subject: [PATCH v2] fuzz, test x86_emulator: disable sse before including
+ always_inline fns
+To: xen-devel@lists.xenproject.org,
+    jbeulich@suse.com
+Cc: ian.jackson@eu.citrix.com,
+    wei.liu2@citrix.com,
+    andrew.cooper3@citrix.com
+
+Workaround for compiler rejection of SSE-using always_inlines defined before
+SSE is disabled.
+
+Compiling with _FORTIFY_SOURCE or higher levels of optimization enabled
+will always_inline several library fns (memset, memcpy, ...)
+(with gcc 8.2.0 and glibc 2.28).
+
+In fuzz and x86_emulator test, the compiler is instructed not
+to generate SSE instructions via: #pragma GCC target("no-sse")
+because those registers are needed for use by the workload.
+
+The combination above causes compilation failure as the inline functions
+use those instructions. This is resolved by reordering the inclusion of
+<stdio.h> and <string.h> to after the pragma disabling SSE generation.
+
+It would be preferable to locate the no-sse pragma within x86-emulate.h at the
+top of the file, prior to including any other headers; unfortunately doing so
+before <stdlib.h> causes compilation failure due to declaration of 'atof' with:
+  "SSE register return with SSE disabled".
+Fortunately there is no (known) current dependency on any always_inline
+SSE-inclined function declared in <stdlib.h> or any of its dependencies, so the
+pragma is therefore issued immediately after inclusion of <stdlib.h> with a
+comment introduced to explain its location there.
+
+Add compile-time checks for unwanted prior inclusion of <string.h> and
+<stdio.h>, which are the two headers that provide the library functions that
+are handled with wrappers and listed within "x86-emulate.h" as ones "we think
+might access any of the FPU state".
+* Use standard-defined "EOF" macro to detect prior <stdio.h> inclusion.
+* Use "_STRING_H" (non-standardized guard macro) as best-effort
+  for detection of prior <string.h> inclusion. This is non-universally
+  viable but will provide error output on common GLIBC systems, so
+  provides some defensive coverage.
+
+Adds conditional #include <stdio.h> to x86-emulate.h because fwrite, printf,
+etc. are referenced when WRAP has been defined.
+
+Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+Reviewed-by: Jan Beulich <jbeulich@suse.com>
+---
+ tools/fuzz/x86_instruction_emulator/fuzz-emul.c | 10 +++++++--
+ tools/tests/x86_emulator/wrappers.c             |  1 -
+ tools/tests/x86_emulator/x86-emulate.h          | 28 +++++++++++++++++++++++--
+ 3 files changed, 34 insertions(+), 5 deletions(-)
+
+diff --git a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+index 03a2473..0ffd0fb 100644
+--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
++++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+@@ -6,9 +6,7 @@
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+-#include <stdio.h>
+ #include <stdlib.h>
+-#include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/mman.h>
+@@ -16,6 +14,14 @@
+ #include <xen/xen.h>
+ 
+ #include "x86-emulate.h"
++/*
++ * include "x86-emulate.h" prior to <stdio.h> and <string.h>:
++ * x86-emulate.h disables use of SSE registers, while <stdio.h> and <string.h>
++ * declare functions that may be always_inline and use those registers
++ * unless they have been disabled earlier, which can fail to compile.
++ */
++#include <stdio.h>
++#include <string.h>
+ #include "fuzz-emul.h"
+ 
+ #define MSR_INDEX_MAX 16
+diff --git a/tools/tests/x86_emulator/wrappers.c b/tools/tests/x86_emulator/wrappers.c
+index d02013c..eba7cc9 100644
+--- a/tools/tests/x86_emulator/wrappers.c
++++ b/tools/tests/x86_emulator/wrappers.c
+@@ -1,5 +1,4 @@
+ #include <stdarg.h>
+-#include <stdio.h>
+ 
+ #define WRAP(x) typeof(x) emul_##x
+ #include "x86-emulate.h"
+diff --git a/tools/tests/x86_emulator/x86-emulate.h b/tools/tests/x86_emulator/x86-emulate.h
+index b249e46..07ea1e8 100644
+--- a/tools/tests/x86_emulator/x86-emulate.h
++++ b/tools/tests/x86_emulator/x86-emulate.h
+@@ -3,11 +3,35 @@
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+-#include <string.h>
+-
++/*
++ * Use of sse registers must be disabled prior to the definition of
++ * always_inline functions that would use them (memcpy, memset, etc),
++ * so do this as early as possible, aiming to be before any always_inline
++ * functions that are used are declared.
++ * Unfortunately, this cannot be done prior to inclusion of <stdlib.h>
++ * due to functions such as 'atof' that have SSE register return declared,
++ * so do so here, immediately after that.
++ */
+ #if __GNUC__ >= 6
+ #pragma GCC target("no-sse")
+ #endif
++ /*
++ * Attempt detection of unwanted prior inclusion of some headers known to use
++ * always_inline with SSE registers in some library / compiler / optimization
++ * combinations.
++ */
++#ifdef _STRING_H
++#error "Must not include <string.h> before x86-emulate.h"
++#endif
++#include <string.h>
++
++/* EOF is a standard macro defined in <stdio.h> so use it for detection */
++#ifdef EOF
++#error "Must not include <stdio.h> before x86-emulate.h"
++#endif
++#ifdef WRAP
++#include <stdio.h>
++#endif
+ 
+ #include <xen/xen.h>
+ 
+-- 
+2.1.4
+
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index bf4b3c2..365f71d 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -842,6 +842,12 @@ export LDFLAGS=""
 # patching the build to be ok with this
 TUNE_CCARGS := "${@oe.utils.str_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
 
+# Supply the full set of compiler flags via the tool variables
+# Yocto supplys _FORTIFY_SOURCE via CC/CPP/CXX but optimization -O via C*FLAGS
+CC_append = " ${CFLAGS}"
+CPP_append = " ${CPPFLAGS}"
+CXX_append = " ${CXXFLAGS}"
+
 EXTRA_OECONF += " \
     --exec-prefix=/usr \
     --prefix=/usr \
diff --git a/recipes-extended/xen/xen_4.11.0.bb b/recipes-extended/xen/xen_4.11.0.bb
index 40e7340..b275066 100644
--- a/recipes-extended/xen/xen_4.11.0.bb
+++ b/recipes-extended/xen/xen_4.11.0.bb
@@ -6,6 +6,7 @@ SRC_URI = " \
     file://tools-xentop-vwprintw.patch \
     file://xen-4.11-arm-acpi-fix-string-lengths.patch \
     file://xen-tools-xenpmd-snprintf.patch \
+    file://xen-disable-sse-before-inlines.patch \
     "
 
 SRC_URI[md5sum] = "cbec0600284921744bc14119f4ed3fff"
diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
index da1eea6..81ee100 100644
--- a/recipes-extended/xen/xen_git.bb
+++ b/recipes-extended/xen/xen_git.bb
@@ -12,6 +12,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
+    file://xen-disable-sse-before-inlines.patch \
     "
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.1.4


