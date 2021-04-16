Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.947.1618598528138662944
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 11:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H48Xq04j;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id bs7so13432412qvb.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Apr 2021 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oX9DLt0zC7E8Me6LNd7RlrimnhEDbVhiNvcW75KcCe4=;
        b=H48Xq04jZFpgGz6TVmjLd0pKMxgkv9Bl0oISuu6LoicekVBK8gpvATirDn+gBkpX4L
         QQY6dpfGB0Qnf4LuNRA1zEx/lG1jEhqXVQxqUfWXN5kGLceeReeUhX6i1HZPub2+NSXj
         a48b/DgDGwQfvhOLNTsnaZJV1eDtHgQCUK5tIoRvKCglUs8ZnuW2AkLKIVE5EfVdgH5R
         prN/V+DyctW8oKuIlnIA2kDx6IRHIi3yETBkN9Rn9XXwBTnZij7V0xwCP8Symw3a6Wde
         7rWSyXdkM4LT/q24UJKtyaz4Bgabr7TnP/dSM2mmaU7AK2XRsS2FSzaSthfF0LK4mGFU
         SSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oX9DLt0zC7E8Me6LNd7RlrimnhEDbVhiNvcW75KcCe4=;
        b=Ms0F6I0YnV0EM5vly+uivCsc/yDgrkmB5ENdW5+aA5j/m5hGNltvu293hL9VsNDgeT
         wxEvLzYKmnK/QydFu/ZShOhZd/7mR6S/uLKoX1bV+rCtYU7aHQLRXKQnrWfGqUQaNbkh
         UAWJX8uncmXHpmXLOxq9O1GTPToSir43uTJn2bbYv0qaxYzjX2OiUjc1z/kJ0OvqDYHs
         jHB9MS485GsWm8F2kpkKdgEgG1Z+C8waa6ixGGjCnIrlUPZS4aopWNmkOob/wKJbk3L5
         C3uL6g6VgUAI9+LUqT2G6js9HSDAM34BgIIyN0FzDVM8vSX+nkZLn9OoETWqbODyyegf
         Bn2A==
X-Gm-Message-State: AOAM532UdGep8TAUqMtVRXdLqfWnO4uUt9LcAT6aRLNB1mltqDBe0Skp
	KdrafYp+3dG4vI5FldqzJYinlf69BpfFww==
X-Google-Smtp-Source: ABdhPJxk0m7SV9/85Yeggx9he4nC4QKB4+XFF3bJKbfRIR+LZDyLg3c97vX3Y7THh+zX24G8OGIBAg==
X-Received: by 2002:a0c:a045:: with SMTP id b63mr3761497qva.19.1618598527107;
        Fri, 16 Apr 2021 11:42:07 -0700 (PDT)
Return-Path: <christopher.w.clark@gmail.com>
Received: from walnut.ice.pyrology.org ([166.176.185.178])
        by smtp.gmail.com with ESMTPSA id m10sm3922238qtp.43.2021.04.16.11.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 11:42:06 -0700 (PDT)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: cardoe@gentoo.org,
	bruce.ashfield@gmail.com,
	bertrand.marquis@arm.com
Subject: [meta-virtualization][PATCH v3 5/6] xtf: introduce recipe for the Xen Test Framework
Date: Fri, 16 Apr 2021 11:41:35 -0700
Message-Id: <20210416184136.71992-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416184136.71992-1-christopher.w.clark@gmail.com>
References: <20210416184136.71992-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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

