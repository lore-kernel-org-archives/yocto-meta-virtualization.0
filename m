Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.17792.1581311322438763143
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAw9FIGW;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5141CE01711; Sun,  9 Feb 2020 21:08:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D892E016B9
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:38 -0800 (PST)
Received: by mail-pl1-f172.google.com with SMTP id c23so2335220plz.4
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kxKQi9ecy9JtuQeFWMYwUGfNxGYJ7LU0BjZuUetcyG4=;
        b=kAw9FIGWdzktN2aq+uGP+tEBle/w4a7ipyv/rtnM3/WWtiZuk0K6yW3f+BY7+3Kvgv
         jYvGzd9YNa1/57NxJsSegcTzJohWJcvlwDiDvZAhMA4KeOmsCbk8VMeTk3TjFr8nEm7c
         Fmf9p5fOLLZjyt44eGCu/00VojbBWfV4DeSBy8p2Vn3BGUPnQ1UbSbXHmw+IqO70WAk2
         W6aiNnljX80vK7RZulyZKpj6zlUODueRsynGS4fs9afwNgc1faGteBIHrS1pE60y40HX
         mtzuHS8EWejtU77cxFE+7HHtJT04iK4UBo7snbYSb0/wlu8fv3tK7m2hACaX+P9Wprbi
         3VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kxKQi9ecy9JtuQeFWMYwUGfNxGYJ7LU0BjZuUetcyG4=;
        b=srcvZs+5E6PkHoYi/F/afCPG9lCMNRjHwflFRJ4pcTfpvb3VwyGWMXH+pwtDHE0OBw
         pOBMpf54eaLVXHTjSGVYeY22MkiLXLDLE/EaVjcY0aMatYM1QTx92S1mshUHnPt8czB4
         ID13LL663AEsFF+HLL1JoEb2DAF42H7RH0qzGUfjMf13Jpn0mJvhfTIC2ugY+mTczxs4
         h007XCP6EMNT7bfCQmjMdalufO/IP4zzGjqM2cEuadZ0cwN+ULi18B61AxgJS2t0ZcYV
         R7CbZ3IiwnVAZW3C59pvCyVH6xZMOtYUOQU55+JzRR96kTvymTXjuGIua7+60JS1gNJ9
         PI3Q==
X-Gm-Message-State: APjAAAVVzmtRN6rCMo+MN333zs9VuiUATLRZ0opmebzGux1XqIkkRPww
	36JnPVroqPo/Aj2xxgCxgt5EkNKA
X-Google-Smtp-Source: APXvYqwQiAWkTPH47Pgp9QKowjO6CLKafagXH/Yg1rB80Ld3wH55dhyyLNYCedAj7E2W+DvbRPVL2w==
X-Received: by 2002:a17:90b:14a:: with SMTP id em10mr18638797pjb.4.1581311317981;
        Sun, 09 Feb 2020 21:08:37 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:37 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 14/16] xen, xen-tools: remove stubs task and generate 32-bit headers if needed
Date: Sun,  9 Feb 2020 21:07:52 -0800
Message-Id: <20200210050754.3534-18-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Move the stubs task work into the Xen tools configure script.

If either the stubs-32.h or long-double-32.h header is not available,
generate one which will suffice from the 64-bit equivalent header.

The stubs task was MACHINE-specific due to the variables it accessed
which had forced unnecessary rebuild work in OpenXT's multi-MACHINE
builds.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 .../xen-tools-generate-32bit-headers.patch    | 99 +++++++++++++++++++
 recipes-extended/xen/xen-tools.inc            | 15 ---
 recipes-extended/xen/xen-version.inc          |  1 +
 recipes-extended/xen/xen.inc                  |  4 -
 4 files changed, 100 insertions(+), 19 deletions(-)
 create mode 100644 recipes-extended/xen/files/xen-tools-generate-32bit-headers.patch

diff --git a/recipes-extended/xen/files/xen-tools-generate-32bit-headers.patch b/recipes-extended/xen/files/xen-tools-generate-32bit-headers.patch
new file mode 100644
index 0000000..6a11db8
--- /dev/null
+++ b/recipes-extended/xen/files/xen-tools-generate-32bit-headers.patch
@@ -0,0 +1,99 @@
+# Generate two 32-bit headers if not already available.
+# Avoids adding 32-bit multilib dependency.
+#
+# Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
+diff --git a/tools/configure.ac b/tools/configure.ac
+index 1499344ce6..f9ae036f64 100644
+--- a/tools/configure.ac
++++ b/tools/configure.ac
+@@ -492,4 +492,28 @@ AC_ARG_ENABLE([9pfs],
+ 
+ AC_SUBST(ninepfs)
+ 
++# If 32-bit stubs header is not already available, check for the 64-bit one
++# and generate a 32-bit stubs header
++AC_CHECK_HEADER([gnu/stubs-32.h], [], [
++    AC_CHECK_HEADER([gnu/stubs-64.h], [
++        echo '#include <gnu/stubs-64.h>' >conf-stubs.c
++        SIXTY_FOUR_HDR=`$CC -M conf-stubs.c | grep '/stubs-64.h$'`
++        rm conf-stubs.c
++        mkdir -p include/gnu
++        cat "${SIXTY_FOUR_HDR}" | \
++            grep -v 'stub_bdflush\|stub_getmsg\|stub_putmsg' >include/gnu/stubs-32.h
++        echo \#define __stub___kernel_cosl >> include/gnu/stubs-32.h
++        echo \#define __stub___kernel_sinl >> include/gnu/stubs-32.h
++        echo \#define __stub___kernel_tanl >> include/gnu/stubs-32.h
++    ], [AC_MSG_ERROR[No gnu stubs headers found]], []) ], [])
++
+# If 32-bit long-double header is not already available, check for the 64-bit
+# one and copy it
++AC_CHECK_HEADER([bits/long-double-32.h], [], [
++     AC_CHECK_HEADER([bits/long-double-64.h], [
++        echo '#include <bits/long-double-64.h>' >conf-double.c
++        SIXTY_FOUR_HDR=`$CC -M conf-double.c | grep '/long-double-64.h$'`
++        rm conf-double.c
++        mkdir -p include/bits
++        cat "${SIXTY_FOUR_HDR}" >include/bits/long-double-32.h
++    ], [AC_MSG_ERROR[No long-double headers found]], []) ], [])
++
+ AC_OUTPUT()
+diff --git a/tools/configure b/tools/configure
+index acc857510e..b603abb8e5 100755
+--- a/tools/configure
++++ b/tools/configure
+@@ -9769,7 +9769,55 @@ fi
+ fi
+ 
+ 
++# If 32-bit stubs header is not already available, check for the 64-bit one
++# and generate a 32-bit stubs header
++ac_fn_c_check_header_mongrel "$LINENO" "gnu/stubs-32.h" "ac_cv_header_gnu_stubs_32_h" "$ac_includes_default"
++if test "x$ac_cv_header_gnu_stubs_32_h" = xyes; then :
+ 
++else
++
++    ac_fn_c_check_header_mongrel "$LINENO" "gnu/stubs-64.h" "ac_cv_header_gnu_stubs_64_h" "$ac_includes_default"
++if test "x$ac_cv_header_gnu_stubs_64_h" = xyes; then :
++
++        echo '#include <gnu/stubs-64.h>' >conf-stubs.c
++        SIXTY_FOUR_HDR=`$CC -M conf-stubs.c | grep '/stubs-64.h$'`
++        rm conf-stubs.c
++        mkdir -p include/gnu
++        cat "${SIXTY_FOUR_HDR}" | \
++            grep -v 'stub_bdflush\|stub_getmsg\|stub_putmsg' >include/gnu/stubs-32.h
++        echo \#define __stub___kernel_cosl >> include/gnu/stubs-32.h
++        echo \#define __stub___kernel_sinl >> include/gnu/stubs-32.h
++        echo \#define __stub___kernel_tanl >> include/gnu/stubs-32.h
++
++else
++  as_fn_error $? "" "$LINENO" 5No gnu stubs headers found
++fi
++
++
++fi
++
++# If 32-bit long-double header is not already available, check for the 64-bit
++# one and copy it
++ac_fn_c_check_header_mongrel "$LINENO" "bits/long-double-32.h" "ac_cv_header_bits_long_double_32_h" "$ac_includes_default"
++if test "x$ac_cv_header_bits_long_double_32_h" = xyes; then :
++
++else
++
++     ac_fn_c_check_header_mongrel "$LINENO" "bits/long-double-64.h" "ac_cv_header_bits_long_double_64_h" "$ac_includes_default"
++if test "x$ac_cv_header_bits_long_double_64_h" = xyes; then :
++
++        echo '#include <bits/long-double-64.h>' >conf-double.c
++        SIXTY_FOUR_HDR=`$CC -M conf-double.c | grep '/long-double-64.h$'`
++        rm conf-double.c
++        mkdir -p include/bits
++        cat "${SIXTY_FOUR_HDR}" >include/bits/long-double-32.h
++
++else
++  as_fn_error $? "" "$LINENO" 5No long-double headers found
++fi
++
++
++fi
+ 
+ cat >confcache <<\_ACEOF
+ # This file is a shell script that caches the results of configure
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
index 00843ca..0b16fca 100644
--- a/recipes-extended/xen/xen-tools.inc
+++ b/recipes-extended/xen/xen-tools.inc
@@ -660,21 +660,6 @@ do_configure() {
     do_configure_common
 }
 
-do_stubs() {
-    # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
-    if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
-        if test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h ; then
-            test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gnu
-            cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h | grep -v stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg > ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_cosl >> ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_sinl >> ${S}/tools/include/gnu/stubs-32.h
-            echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/stubs-32.h
-        fi
-    fi
-}
-
-addtask stubs after do_configure before do_compile
-
 do_compile() {
     cd ${S}
     oe_runmake tools PYTHON="${PYTHON}"
diff --git a/recipes-extended/xen/xen-version.inc b/recipes-extended/xen/xen-version.inc
index e4fe060..a9df63d 100644
--- a/recipes-extended/xen/xen-version.inc
+++ b/recipes-extended/xen/xen-version.inc
@@ -5,6 +5,7 @@ XEN_BRANCH ?= "stable-4.12"
 
 SRC_URI = " \
     git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
+    file://xen-tools-generate-32bit-headers.patch \
     file://0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch \
     file://xen-tools-update-python-scripts-to-py3.patch \
     file://xen-tools-libxl-gentypes-py3.patch \
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 47e3520..1029777 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -223,10 +223,6 @@ do_configure_common() {
     oe_runconf EXTRA_CFLAGS_XEN_CORE="${EXTRA_CFLAGS_XEN_CORE}" \
                EXTRA_CFLAGS_XEN_TOOLS="${EXTRA_CFLAGS_XEN_TOOLS}" \
                PYTHON="${PYTHON}"
-
-    if [ ! -e ${STAGING_INCDIR}/bits/long-double-32.h ]; then
-        cp ${STAGING_INCDIR}/bits/long-double-64.h ${STAGING_INCDIR}/bits/long-double-32.h
-    fi
 }
 
 do_compile_prepend() {
-- 
2.17.1

