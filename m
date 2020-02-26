Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.173.1582676196978436124
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 16:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f28he8ei;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2DC8E016E9; Tue, 25 Feb 2020 16:16:36 -0800 (PST)
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
	*      [209.85.210.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28750E016B5
	for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:35 -0800 (PST)
Received: by mail-pf1-f194.google.com with SMTP id b185so450263pfb.7
        for <meta-virtualization@yoctoproject.org>; Tue, 25 Feb 2020 16:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6vc8hg8swAGRCUWMUnMt8GzlAZ75UgMBqLlegMDty34=;
        b=f28he8ei++UmDgZcE0/45w+g41L+Lq2NlKQlO/n6Ixk6DM45ZF6c1pgIu6Nc/fQD7A
         JTdGn3qrBQEv/qwqhW3O5p5vxXNOxsHUjkyLq7nJsYxbfB6t7Zm+kKEStG1u2rLbYFKi
         Wag8706FfNY5KKbXAn753UlxTESNsVzY11oB/CdM4n2V3/Et3HEEjF2rTP/gCOCMEkle
         TYx6mPd+LSIWMVPZP7C0FcM62KS6R8DvOiaoVwxZAvfVHG5XeVLZU3wuy/6VsAoXm68r
         OuL0qBgN6Y1YOB4mwZaUHhq1Z21oZ9Dx4/F+17Ryll/Oi9etu1pAdQNkhR7B6GExKOgy
         7T6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6vc8hg8swAGRCUWMUnMt8GzlAZ75UgMBqLlegMDty34=;
        b=Mksa54SZs6yahw8pG2+c9nrwpCptyLbq2397vULhVgLvxqF9PAPzF86N1tYnfe+xiS
         ZxTdJvCQAPxd6CVyyu0kF6KnE6E/1hZdREwtADEj4LfhnuUM78j7MqEmxUR89vC6JY9I
         ZFhWVu9RYiv6F2DI/F+0UIXIACHuC7TgyhaxLiO/hZSUJtvoS0FvOqZMoDBAzNCTqraM
         98ftadGMCHVrnjDXr2uY3LQRGXqJSQfG4XI/xrj8LP1f6IttI5FfTEu4Xh8+pReeNbtz
         2jROWLQIgLY2x0bvni7cmIDFlJLpmQTnDsgRvS/EUjWrHDRjXBAr9WAIcXYZ35xLPNBa
         31Vg==
X-Gm-Message-State: APjAAAVaP8mMmn32+GvgB+2036ovuUMuTCmabZwrJjnEoJx+QoFdiKDz
	c0+gc9b/TED1QJa6/Nk9h66jL3+q
X-Google-Smtp-Source: APXvYqxiaIXPqmidoV/OR+/16/L76gLqdRzTQoVZPQkF1Y4Hd9/nL2ubcB2EA/0BBNgGakdMDUObTQ==
X-Received: by 2002:a63:7d59:: with SMTP id m25mr999576pgn.356.1582676193767;
        Tue, 25 Feb 2020 16:16:33 -0800 (PST)
Received: from desktop.ice.pyrology.org (static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
        by smtp.gmail.com with ESMTPSA id x11sm235177pfn.53.2020.02.25.16.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 16:16:32 -0800 (PST)
From: "Christopher Clark" <christopher.w.clark@gmail.com>
To: meta-virtualization@yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization][PATCH v3 04/22] xen: pass compiler flags via Xen-provided variables
Date: Tue, 25 Feb 2020 16:15:48 -0800
Message-Id: <20200226001606.14750-5-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226001606.14750-1-christopher.w.clark@gmail.com>
References: <20200226001606.14750-1-christopher.w.clark@gmail.com>

From: Christopher Clark <christopher.w.clark@gmail.com>

Fix the method of passing compiler flags into the Xen build, which is
needed to fix compilation of hvmloader, a 32-bit firmware binary that is
required for Xen to be able to run HVM-mode guest VMs. It must not be
compiled with SSE compiler options enabled, so the Xen build clears
CFLAGS, which is a problem with _FORTIFY_SOURCE present in CC because
it must be paired with a compiler optimization flag that was in CFLAGS.
This change fixes the compilation failure that stated
 "_FORTIFY_SOURCE requires compiling with optimization (-O)".

32-bit ARM needs the TUNE_CCARGS to be retained as passed via CC
to ensure that configure is able to generate binaries for the
correct ABI, so is handled as a separate case.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
---
 recipes-extended/xen/xen.inc | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 36ab78e..4ac954e 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -867,15 +867,27 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
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
+# - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then passes the
+#   optimization -O via C*FLAGS which is problematic when the CFLAGS are cleared
+#   within the build because compilation fails with the compiler stating
+#   "_FORTIFY_SOURCE requires compiling with optimization (-O)".
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
 
@@ -996,8 +1008,11 @@ do_configure() {
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

