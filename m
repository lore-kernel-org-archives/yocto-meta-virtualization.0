Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.801.1618443598792086961
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 16:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hSoVAjUC;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id d15so10445224qkc.9
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Apr 2021 16:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KQmLlumxrjCcrP5CFri/TyHHpGx7ypScnTwVJigHqeo=;
        b=hSoVAjUCdnT1cjUxTVw6dJUgQgnWLeDczJWsFFq5ZhuPG+7urPwkF//w7DGmTJBeg+
         wG3K+LcTOzWD+Gn6Xv/JNUttg9ylVxMKDXv3vDUJ3LfO7BRjQTUX1rRjlXkxijzQc0xO
         O7afRkppMvpj7k6X4NA2+U5F9ZJ+AUtIurjXeWj9FQJrdzjdl0cf/fFEAbfAqZIVsxXu
         D2tyMQeCeT4FNsBVmMIjNq+ZIbwWCHYGPF+jkPsZxWOhlxaBgiYK206eYAsidkRjYQFk
         9Ygpy2kyUZyHzjmtGz39Z6w10JRcha9c/RyHQrdkGslN3CeinJbPfvtCfcT8Jbdr6egZ
         CW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KQmLlumxrjCcrP5CFri/TyHHpGx7ypScnTwVJigHqeo=;
        b=pZaA8FB5OMlDYP0ZeJsEiVcLZ+UASnh1Tm7Byq9P34K6OZbGQQqTT9T3za+hx+JqBS
         9InO6MjNmZGuPKpApKu/4/P4Ayg7k86kOUOTJ3ZKsxtQhp5T/hTd7jLWEL0hr7rb2zck
         f/T57+qA8IK+Y7RpG9uxaWoP3seSuqDxVljMsSSqMxvT6ShuPR8Ij62FlcKDlBBAezL7
         YA9ncQROC8yem6mO8h1Q3LMkhKFaUTkXeSztXSZUWAXp5QeqEMz5Ot16jn3ueI4GPNcY
         0Phad7puDCsGha8AJYUzE24ey1RYr2G7udGi3oV3Cmv4gyyXIJqg8GDJSXlPCmIQpXMM
         aj+g==
X-Gm-Message-State: AOAM533goK9G43W59XKK0STxxgoC83opxRqD7bkzwOmf/sh7bDdQnJhv
	h+FSG33QWQwdiQzD+cQRUIEcfZ5O2xQ=
X-Google-Smtp-Source: ABdhPJydzU8H3IFrGsIGs/AFRXhXQ5bmnpfdweL1HnwxI5XisSig678Sp3lrSRkVPltAQhNh5nZwGA==
X-Received: by 2002:a37:7646:: with SMTP id r67mr932042qkc.78.1618443597776;
        Wed, 14 Apr 2021 16:39:57 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-184-52.mycingular.net. [166.176.184.52])
        by smtp.gmail.com with ESMTPSA id q28sm736010qkm.15.2021.04.14.16.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 16:39:57 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com,
	andrew.cooper3@citrix.com
Subject: [meta-virtualization][PATCH v2 5/6] xtf: introduce recipe for the Xen Test Framework
Date: Wed, 14 Apr 2021 16:39:23 -0700
Message-Id: <20210414233924.55589-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414233924.55589-1-christopher.w.clark@gmail.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xtf_git.bb | 72 +++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 recipes-extended/xen/xtf_git.bb

diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
new file mode 100644
index 0000000..db08643
--- /dev/null
+++ b/recipes-extended/xen/xtf_git.bb
@@ -0,0 +1,72 @@
+SUMMARY = "Xen Test Framework"
+HOMEPAGE = "https://xenbits.xenproject.org/docs/xtf/"
+LICENSE = "BSD-2-Clause"
+
+# For additional reference on XTF, please see:
+# https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017/79/xtf.pdf
+
+SRC_URI = "git://xenbits.xen.org/xtf"
+SRCREV = "8ab15139728a8efd3ebbb60beb16a958a6a93fa1"
+
+COMPATIBLE_HOST = '(x86_64.*).*-linux'
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a5680865974e05cf0510615ee1d745d8"
+
+PV = "0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit python3native
+
+# To build 32-bit binaries some files from 32-bit glibc are needed.
+# To enable multilib, please add the following to your local.conf -:
+#
+#    require conf/multilib.conf
+#    MULTILIBS = "multilib:lib32"
+#    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+
+# Use this multilib prefix for x86 32-bit to match local.conf:
+MLPREFIX32 = "lib32-"
+# Add the multilib 32-bit glibc to DEPENDS only when necessary:
+# The DEPENDS on a multilib 32-bit glibc is only added when target is x86-64
+# This x86-64 override is never intended for native use, so clear that.
+GLIBC32 = ""
+GLIBC32_x86-64 = "${MLPREFIX32}glibc"
+GLIBC32_class-native = ""
+DEPENDS += "${GLIBC32}"
+
+PACKAGES = "${PN}"
+
+FILES_${PN} = " \
+    ${libexecdir}/* \
+    "
+
+RDEPENDS_${PN} = " \
+    xen-tools-xl \
+    python3 \
+    "
+
+do_compile() {
+    oe_runmake CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} -I${RECIPE_SYSROOT}/../${MLPREFIX32}recipe-sysroot/usr/include" \
+               CPP="${CPP}" \
+               OBJCOPY="${OBJCOPY}" \
+               PYTHON="${PYTHON}"
+    # switch the shebang to python3
+    sed 's,^\(#!/usr/bin/env python\)$,\13,' -i "${B}/xtf-runner"
+}
+
+do_install() {
+    # packaging: rpmbuild can package the XTF test unikernels when they are
+    # installed as non-executable files (they are run within VMs anyway).
+    oe_runmake install DESTDIR="${D}" \
+                       xtfdir="${libexecdir}/${BPN}" \
+                       PYTHON="${PYTHON}" \
+                       INSTALL_PROGRAM="install -m 644 -p"
+    install -m 755 -p "${B}/xtf-runner" "${D}${libexecdir}/${BPN}/xtf-runner"
+}
+
+INSANE_SKIP = "arch"
+# xen-tools-xl is a runtime but not build time dependency
+INSANE_SKIP_${PN} = "build-deps"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.25.1

