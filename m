Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.7880.1625718790168132611
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 21:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tiZWPdOV;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id x24so3903768qts.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 21:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQ44VHnyo0lRj7IdCnOg+tFl/EtQrQemlofoMcrmn7A=;
        b=tiZWPdOVp4roc7NVm5IPtQtdQrAUWGiXmSQtqi7MkCM6WpZQl7BFaLXOxQPX3BhdYL
         dPfssC5adq8M+h7s8Q5aDqQB1HhDlJn8q7DzDkEjFTwBc2N6Bqf0PzY94/IqZjg0beqG
         jHlW2V0fh//xLAx0vF0MA7Ac1EZMjXYhIBiTorpGJecEo9ad4JxVTxUW9z2pURHs4rb4
         /GR6/TzRcxL1C2d6Hk9sstxowfM3QpD3VX/kbNaiVSDxvRFbdK/6SIlyGGuQI+20vP6H
         tUxB+zxcH9KCGHgDOK7t707wRLgWCsgNMNsdegF6yC1Wsf8Gdy155mDFoDHUYrRJMfTv
         ZO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQ44VHnyo0lRj7IdCnOg+tFl/EtQrQemlofoMcrmn7A=;
        b=XAil/oLjyYWJG7j4smIB12ZbLTj3tiKXuMZB4ATAjNDiVuqIks6q+4Mzs9AIrAPGYz
         2m2hUMaFzS/s8gyK0MdV79gXFXZAYzDkUNKQHgjGqwLl2vDkiPfBb9fBsAxYGLFVVFhq
         In7HIi+ZS8X5wYaygTRDdxv9KY99PujFtPaUvK/1DyyW+zRSOxKx8MlLL2UaK0BjuPJf
         o/GVG/DqgqI/GjnAMCV8XPjWrvtX8IM53pKfc/4HbhzVOXtlcHcyRiJfjJUawPXOJW6i
         dskcb1Bhg1Jr93rufaXKnQvD07XMd7gPscWNm95fLvt4fibGLmBnZz4VL4jm3uFygCpf
         XL0g==
X-Gm-Message-State: AOAM532xEXBNAsDNJNQV4ZWVJg6e896Kiv7DZxrqMOCoUGpsox8V4xhg
	l1Cn9/ZGI15dDszCo5AiJM9/jiyveIdsrUtV
X-Google-Smtp-Source: ABdhPJz+4elvi1yhOSnzf5UKk2jtbgKaXuSt1OtAoA3Zm9iz1AcmV3LbOdyCGdChmS4nGuUBao+nIQ==
X-Received: by 2002:ac8:7a97:: with SMTP id x23mr17670248qtr.48.1625718789232;
        Wed, 07 Jul 2021 21:33:09 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-177-250-205.mycingular.net. [166.177.250.205])
        by smtp.gmail.com with ESMTPSA id p9sm517908qtw.88.2021.07.07.21.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:33:08 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org,
	diego.sueiro@arm.com,
	Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com,
	persaur@gmail.com
Subject: [meta-virtualization][PATCH v2 2/4] xen, xen-tools: fix build and passing of CFLAGS via Xen vars
Date: Wed,  7 Jul 2021 21:32:44 -0700
Message-Id: <20210708043246.126719-3-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708043246.126719-1-christopher.w.clark@gmail.com>
References: <20210708043246.126719-1-christopher.w.clark@gmail.com>
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
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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

