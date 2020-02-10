Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.17599.1581311296527808208
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 09 Feb 2020 21:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zk3lrjBK;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64ABDE016BB; Sun,  9 Feb 2020 21:08:16 -0800 (PST)
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
	*      [209.85.216.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C9D4E016B8
	for <meta-virtualization@yoctoproject.org>; Sun,  9 Feb 2020 21:08:15 -0800 (PST)
Received: by mail-pj1-f65.google.com with SMTP id fa20so3664454pjb.1
        for <meta-virtualization@yoctoproject.org>; Sun, 09 Feb 2020 21:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8EODVsz1AyOHQgMzAspdUWvthkEYZq/rbadWPlzLRks=;
        b=Zk3lrjBK3d/VyfJWz18JFmlfsephhJUYyHZXdU6gjEGYJdfJI6C0c/opQASHdqmRTB
         RSeZCpTbiAugyv3Iq6eo8A1BZ/BAgdPN61UDvCkyR6U5ShotmXwSnaS0yAMg8djnaPTs
         2SyDPKQTTjS1gpmCl/2CFdNBEhc7xHo8MwIq3M46msDUtriT0rxZDrjoeurlUB+Sh+73
         SeCWrd1kNMvpB4h1q1wqIbn1II8k3TIk+Utu4qed38a3jzGnC7y1OCrS9Hmgm+3xXphn
         zMPne3720YAvZqJnTf4FaaK+ayLX+oejRXHUN8rOJqUsV3dOaYbcWaUf8/Mf93wH1NNl
         U+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8EODVsz1AyOHQgMzAspdUWvthkEYZq/rbadWPlzLRks=;
        b=KPFWQhLx3viDTCbGe1F9D1AY34qNtAeOOrcUyZL5gtF554sNFbaRgcYPCVpOBVfFzw
         A9hF9FMSCqQqCxtfXX70IglP9jpccPeQUIlPJtqyacIyOtV5iCdwxjDcP/RuXSCkmqu9
         UTK/tUqWkyGmN+tlcx/qKwD51O79sKv7GuWSfYxaqSZ0QYPc6riNVeS0VWzGtD9ORdfp
         22IE5INZr1mjMekHQG1TdCvfWXHpTD8MFN+MQ0fodpdsSJ5NPyOwograoCnOJWmPuewX
         DMyD0+EN/FoUvpbSWA/AWEwedKJt2fapfK+9Hr50qrJfAyejsxWzNskf66GBxIQJoG+m
         pE5Q==
X-Gm-Message-State: APjAAAV4rRNInTEI9kKlqQ+A4oGfYHvqAkcseQ+fNehig0B5vhs8M/qm
	hd52zk9fs41tVrn/na0iseueHGt+
X-Google-Smtp-Source: APXvYqxLCncnQEoL/WkDXGORbLARzgO71r/oL80OWAn2uBrTdxGB7vtICGNpyA13uxQqzaspbGo8Jw==
X-Received: by 2002:a17:90a:9f93:: with SMTP id o19mr18670603pjp.76.1581311295172;
        Sun, 09 Feb 2020 21:08:15 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id 70sm10921120pgd.28.2020.02.09.21.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 21:08:13 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Christopher Clark <christopher.w.clark@gmail.com>,
	cardoe@gentoo.org,
	Rich Persaud <persaur@gmail.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Eric Chanudet <eric.chanudet@gmail.com>
Subject: [meta-virtualization][PATCH 01/16] xen: pass compiler flags via Xen-provided variables
Date: Sun,  9 Feb 2020 21:07:39 -0800
Message-Id: <20200210050754.3534-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210050754.3534-1-christopher.w.clark@gmail.com>
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Fix the method of passing compiler flags into the Xen build,
needed to fix hvmloader: it must not be compiled with SSE options
which are provided via TUNE_CCARGS. hvmloader is needed for Xen
to be able to run HVM-mode guest VMs.

32-bit ARM needs the TUNE_CCARGS to be retained as passed via CC
to ensure that configure is able to generate binaries for the
correct ABI, so that target platform is handled as a separate case.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 recipes-extended/xen/xen.inc | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 36ab78e..9bf2ab4 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -867,15 +867,25 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
 # overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: unrecognized option '-Wl,-O1'"
 export LDFLAGS=""
 
-# Yocto injects -mfpmath=sse for some machine types into the CFLAGS which
-# conflicts with -mno-sse so instead we strip -mfpmath=sse instead of
-# patching the build to be ok with this
-TUNE_CCARGS := "${@oe.utils.str_filter_out('-mfpmath=sse', '${TUNE_CCARGS}', d)}"
-TUNE_CCARGS := "${@oe.utils.str_filter_out('-msse4.2', '${TUNE_CCARGS}', d)}"
-
-# Supply the full set of compiler flags via the tool variables
-# Yocto supplys _FORTIFY_SOURCE via CC/CPP/CXX but optimization -O via C*FLAGS
-CC_append = " ${CFLAGS}"
+# Pass through the Yocto distro compiler flags via the Xen-provided variables.
+# Special handling:
+# - Yocto supplys _FORTIFY_SOURCE via CC/CPP/CXX but optimization -O via C*FLAGS
+#   which is problematic when the CFLAGS are cleared within the build.
+# - Move HOST_CC_ARCH into the Xen-provided CFLAGS variables and keep
+#   TOOLCHAIN_OPTIONS set via CC: this enables hvmloader to be built correctly.
+#   It must not be compiled with SSE compiler options enabled and the Xen build
+#   explicitly clears CFLAGS to ensure that, so such options must not be passed
+#   in via the tool variable. hvmloader is required to run HVM-mode guest VMs.
+CC="${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"
+EXTRA_CFLAGS_XEN_CORE="${HOST_CC_ARCH} ${CFLAGS}"
+EXTRA_CFLAGS_XEN_TOOLS="${HOST_CC_ARCH} ${CFLAGS}"
+# 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
+# in CC to ensure that configure can compile binaries for the right arch.
+CC_arm="${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS}"
+EXTRA_CFLAGS_XEN_CORE_arm="${SECURITY_CFLAGS} ${CFLAGS}"
+EXTRA_CFLAGS_XEN_TOOLS_arm="${SECURITY_CFLAGS} ${CFLAGS}"
+
+# There are no Xen-provided variables for C++, so append to the tool variables:
 CPP_append = " ${CPPFLAGS}"
 CXX_append = " ${CXXFLAGS}"
 
@@ -996,8 +1006,11 @@ do_configure() {
         bbfatal "Unable to copy defconfig to .config"
     fi
 
+    unset CFLAGS
+
     # do configure
-    oe_runconf
+    oe_runconf EXTRA_CFLAGS_XEN_CORE="${EXTRA_CFLAGS_XEN_CORE}" \
+               EXTRA_CFLAGS_XEN_TOOLS="${EXTRA_CFLAGS_XEN_TOOLS}"
     if [ ! -e ${STAGING_INCDIR}/bits/long-double-32.h ]; then
         cp ${STAGING_INCDIR}/bits/long-double-64.h ${STAGING_INCDIR}/bits/long-double-32.h
     fi
-- 
2.17.1

