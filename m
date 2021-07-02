Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.3378.1625185953972176115
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Jul 2021 17:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CbPNMB9m;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id j184so7879099qkd.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Jul 2021 17:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NiNpex+ZsZYleNNLYILN1/gy59q0vUJuintXz4RHCqQ=;
        b=CbPNMB9mLta+aGFxz9ramlkqF2nkouA1llwk6DpUqRbufWCwhIXniCG/l8GDAm55IG
         9Ja9+TR1vhLc6k6W1y4qp/HV+Yv0YwGiMuxL7P+VSmFAxuVa6pZgQVBw3+zPvUkZGsNM
         ysnKt/u0ClYBKVqmR02vJHEJHke9QnesH/kV9N9mlQ9aMXTxuSsEQgVGk0EXqMy6O51R
         RDicAoweHLMZkt33A9puxnupfv9UueRFgaWbeX15w9j6CSwKscznR0Qks1XvBD85vNig
         P9N7HxHmA07MwV82PHgLZTEmje4NuPL9u3QmhD+i/jF4wf5slRpoPilKZnceJdFCNvVZ
         DTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NiNpex+ZsZYleNNLYILN1/gy59q0vUJuintXz4RHCqQ=;
        b=UTowPp0lGEMkwr6QbIkzN/0x3ST0+aFQQCdt/3lD3GhkKV6RGE6ARLX4jEvIXPvU1+
         +n0ZVFcZS1crDH4BMH/ptB5nLpejJr+yjZM7hP7p4G9Wy/Egy9+Py/+GOC5B7tFh715F
         JDjtnYN6FJqe0x8r9BIUUTcavOIVcRcQRwlSovZ+1xXZjf0zjYSjEclhZU9cnQoJPnub
         6Zf5hfCRb4WJ9fbbLYmpwcRLYdlu7eBGxipmVktGq+6orrI2DZivkQPiqb+GjELC9f3F
         TOT4EPLoNBDj11fKSL4D+nLuZnxL5Juo8FRpWemKveLraCXClYY0KmOof/naO/GO8SXM
         ESDA==
X-Gm-Message-State: AOAM532jg0Hu9YmDXYcWRNxU9ZX/3ht7CIW+T2LuSEz2wFmld7wxYWWp
	85ELVREPtxwsXEzl0Kwh8i+GTKoEQyRF3w==
X-Google-Smtp-Source: ABdhPJy6fQgALO4DZZa/JUq6+MVpeH3JqikMVK2NerHgDoxb4SIK7WloVeuJ4NT+WE7kkEWn1ld6Hg==
X-Received: by 2002:a05:620a:16b5:: with SMTP id s21mr2814458qkj.204.1625185953052;
        Thu, 01 Jul 2021 17:32:33 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-137-178-102.mycingular.net. [166.137.178.102])
        by smtp.gmail.com with ESMTPSA id x16sm621135qtw.80.2021.07.01.17.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 17:32:32 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH 2/3] xen, xen-tools: fix build and passing of CFLAGS via Xen vars
Date: Thu,  1 Jul 2021 17:32:05 -0700
Message-Id: <20210702003206.79756-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702003206.79756-1-christopher.w.clark@gmail.com>
References: <20210702003206.79756-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that the Xen build system variables EXTRA_CFLAGS_XEN_CORE and
EXTRA_CFLAGS_XEN_TOOLS are passed into the compile steps.

Update the hypervisor compilation to avoid passing in most compile flags
from the build environment via EXTRA_CFLAGS_XEN_CORE -- prefer the
compiler defaults and the flags set by the Xen build system, so only the
debug prefix flags are provided.

Observeration derived from the prior commit e99974aa, so:
Reported-by: Diego Sueiro <diego.sueiro@arm.com>
Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xen-hypervisor.inc |  3 ++-
 recipes-extended/xen/xen-tools.inc      |  3 ++-
 recipes-extended/xen/xen.inc            | 12 ++++++++++--
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 916bd3c..9b96d91 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -49,7 +49,8 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake xen PYTHON="${PYTHON}"
+    oe_runmake xen PYTHON="${PYTHON}" \
+                   EXTRA_CFLAGS_XEN_CORE="${EXTRA_CFLAGS_XEN_CORE}"
 }
 
 do_install() {
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 3560e79..2930097 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -727,7 +727,8 @@ do_configure() {
 
 do_compile() {
     cd ${S}
-    oe_runmake tools PYTHON="${PYTHON}"
+    oe_runmake tools PYTHON="${PYTHON}" \
+                     EXTRA_CFLAGS_XEN_TOOLS="${EXTRA_CFLAGS_XEN_TOOLS}"
 }
 
 do_install() {
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 2fbdb3a..5aa2d5a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -92,6 +92,16 @@ export LDFLAGS=""
 
 # Pass through the Yocto distro compiler flags via the Xen-provided variables.
 # Special handling:
+# - The Yocto distro compiler flags are typically set to be appropriate for
+#   user-space software rather than for generation of a hypervisor binary, so
+#   only pass the debug prefix map to the hypervisor build:
+EXTRA_CFLAGS_XEN_CORE="${DEBUG_PREFIX_MAP}"
+
+# - The Xen tools build for x86 systems with HVM-mode enabled includes hvmloader
+#   which fails to build when "-m64" is included in flags set via the
+#   EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to prevent that.
+TUNE_CCARGS_x86-64=""
+
 # - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then passes the
 #   optimization -O via C*FLAGS which is problematic when the CFLAGS are cleared
 #   within the build because compilation fails with the compiler stating
@@ -102,12 +112,10 @@ export LDFLAGS=""
 #   explicitly clears CFLAGS to ensure that, so such options must not be passed
 #   in via the tool variable. hvmloader is required to run HVM-mode guest VMs.
 CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
-EXTRA_CFLAGS_XEN_CORE="${HOST_CC_ARCH} ${CFLAGS}"
 EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
 # 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
 # in CC to ensure that configure can compile binaries for the right arch.
 CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_OPTIONS}"
-EXTRA_CFLAGS_XEN_CORE_arm="${SECURITY_CFLAGS} ${CFLAGS}"
 EXTRA_CFLAGS_XEN_TOOLS_arm="${SECURITY_CFLAGS} ${CFLAGS}"
 
 # There are no Xen-provided variables for C++, so append to the tool variables:
-- 
2.25.1

