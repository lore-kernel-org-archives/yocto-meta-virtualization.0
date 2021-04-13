Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.5418.1618296239933598479
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 23:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fe/ooPwC;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id i6so2328078qti.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Apr 2021 23:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Bgv4e3ZCa4JG4bbO3Xhny7QkoTUi0f4Xck9rV1NqEQ=;
        b=fe/ooPwC5hDi09G0n1CNNJKsjli8q1aXhMJT4p2I8m/BP9mUYfpwYkZ9Wif+Kcoqlu
         QSpeBZ8WaXuaL10wgJh4aM1DaiMS6rx6aYGtA/U25yHcVKT9955kh5bB08a1BpvjtD3D
         9SaxBkaR/RGEFczo297ESFDMZ0s6xrMPI8dsSfSYPrQ7I6OYnYLztsZ8kDrO5jXxwo7r
         bWqEfc01YUCeSUCal0TcOsgGR4fOc8Iz0gZC3BrZ0wH5gC0A0r3yoeI4KfPk4Ps4Hu4o
         pcckLGxIuUPdkpfLT1zjXlUT1GXSaibiHfFH5C477sj2YoR8Y5aaVaxCUgYsK8tVA7J6
         DMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5Bgv4e3ZCa4JG4bbO3Xhny7QkoTUi0f4Xck9rV1NqEQ=;
        b=oyakpfC3AmPA+ceYyutLA8cMpUiRVaPU42vXCtUQG8BDv87vinvSE0ivopwH5KgpnU
         FppaGj7+BIPOe/iqdgkc7z2YnCZAm7Ji57Ie2v4KLkQahjl6dmpKOHu461nstwWv8PTe
         kA2m7D56xc7161Et6Rrg0WEiDnY0FzMGnUYOp3cY2zyFdRewiPpa3OSvuShck2CxqSaY
         Qr7OWHUuRgLOqRZgA8e8V5F2mdfcRnGAl4thyokyF/8lOW59PGy4DRMB3tLUyMHVf4vb
         QKims4CAcJeYcJxMQxVkoNSSiDv0SB3RMzoqdHiwAh72BMRFZGR2Lx5APKSfjI+z3h8w
         lPtA==
X-Gm-Message-State: AOAM531Pbaj+/4hd7jwq7omB8/BdZjbe/dOVwcFrSllw3nmr6QpCpa3j
	JqCWACMec0OYxmKSd20kugNxbiMgXqM=
X-Google-Smtp-Source: ABdhPJzV/gU6Mjefa8n7NHGRdsclOfbkiC8iiNYf6av38u9I7ejQuQTEfhcVxJSOoB3d5G7aahgopQ==
X-Received: by 2002:ac8:5847:: with SMTP id h7mr29337466qth.108.1618296238943;
        Mon, 12 Apr 2021 23:43:58 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org (mobile-166-176-187-51.mycingular.net. [166.176.187.51])
        by smtp.gmail.com with ESMTPSA id a19sm9491086qtn.41.2021.04.12.23.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:43:58 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH 1/2] xtf: introduce recipe for the Xen Test Framework
Date: Mon, 12 Apr 2021 23:43:31 -0700
Message-Id: <20210413064332.42502-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 recipes-extended/xen/xtf_git.bb | 61 +++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 recipes-extended/xen/xtf_git.bb

diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_git.bb
new file mode 100644
index 0000000..6dc0f8d
--- /dev/null
+++ b/recipes-extended/xen/xtf_git.bb
@@ -0,0 +1,61 @@
+SUMMARY = "Xen Test Framework"
+HOMEPAGE = "https://xenbits.xenproject.org/docs/xtf/"
+LICENSE = "BSD-2-Clause"
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
+    oe_runmake install DESTDIR="${D}" xtfdir="${libexecdir}/${BPN}" PYTHON="${PYTHON}"
+}
+
+INSANE_SKIP = "arch"
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.25.1

