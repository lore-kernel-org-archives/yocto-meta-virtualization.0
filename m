Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C327E01600; Wed, 18 Jul 2018 15:04:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5ED5E015FE
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:04 -0700 (PDT)
Received: by mail-pl0-f43.google.com with SMTP id o7-v6so2630627plk.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Jul 2018 15:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rk4xc7lN+2SZWea0Ck0w7Ix26piyiGy/J6a6rl2D/wM=;
	b=Wl62PAP04twjZ4eRFxBlgO3sTrc2w74XVGIaIMcXUoDvTm0evmNYURNPQxDeEsWhYa
	FXIbq/ubHQOtkYoMLXvlcTznGk/a5CpLIsMMBnFiU6jBHfv2f17YDWuTIPBlY+um5CSZ
	Qr9oHMl6BX2SQ9UGd8o+hMrtG9iyGa+cel7QiU7Yw3eJwkhdqfZ2guUIWutnaEL97hzU
	WHh1uGL+4BV4KHNCig6UIH3cLp01Y2JBBTvU6stl6chz6hiHvhH1wjIWagOERxeFj+3H
	/+YlXRwREhLv6bwY8yG33ocO2/H/0x84B3byYvUBslqdWJNF4Zaz1UCwiEEQAUDFTsXD
	NK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Rk4xc7lN+2SZWea0Ck0w7Ix26piyiGy/J6a6rl2D/wM=;
	b=iX611FAb0l2ALDLL76wk7IgMlsUaU1FVTxnu9gIW6etGg9PDjcI44VtFAs55MXKRjZ
	N3SkyAZuztva1G1w13g0okdH97OJxyCXq0JHVDlQPlcnqgs3J2KM+Q7MQT3Ryb38IuUR
	z49KvoSU7B/8kgQMVyt4iaDR9mdyPcv8t2xY/DheSZn/1c/sQZkw5ri9qTDIZwG4skXm
	vMkIjudLmN4cw/N62z1mnUNj2WkQXSxwzlXbSnVcK4eMtGx8bGj4A1qyLCUkMbTpQnWN
	Tv/yngMwp0uKL/EUdr2Hj8Fy2HoS2qvR+Ds1mtIjHKMPuzJG02el5xeewszJ4kqdfD4B
	jE9g==
X-Gm-Message-State: AOUpUlGvopSIT/7xlamMqsYjKkJd6ELXEQb1ux4Z03wS3d1A8P74jHHx
	gxfR0dXuuiu6/2Ch71f3Rtc16yj5
X-Google-Smtp-Source: AAOMgpe0E61XpJH7gZU8vLL3WezA0hu24Q16BSaDJPIfBSnSEFneQi5ZLnh4uLIcHNhW5Zf7Y1t2Hg==
X-Received: by 2002:a17:902:5a1:: with SMTP id
	f30-v6mr7607279plf.167.1531951443839; 
	Wed, 18 Jul 2018 15:04:03 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	h7-v6sm19341965pfd.155.2018.07.18.15.04.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jul 2018 15:04:02 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Wed, 18 Jul 2018 15:03:45 -0700
Message-Id: <1531951428-28983-5-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
References: <1531951428-28983-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH 4/7] xen-vtpm, mini-os : upgrade to Xen 4.11.0
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
X-List-Received-Date: Wed, 18 Jul 2018 22:04:06 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

drops the gcc7 compatibility patch -- no longer required as
it is present in the upstream version.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
Please use my gmail address for any correspondence to me.

 .../xen/files/mini-os_udivmoddi4-gcc7.patch        | 43 ----------------------
 recipes-extended/xen/mini-os_4.11.0.bb             | 17 +++++++++
 recipes-extended/xen/mini-os_4.9.0.bb              | 18 ---------
 recipes-extended/xen/xen-vtpm_4.11.0.bb            | 21 +++++++++++
 recipes-extended/xen/xen-vtpm_4.9.0.bb             | 21 -----------
 5 files changed, 38 insertions(+), 82 deletions(-)
 delete mode 100644 recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
 create mode 100644 recipes-extended/xen/mini-os_4.11.0.bb
 delete mode 100644 recipes-extended/xen/mini-os_4.9.0.bb
 create mode 100644 recipes-extended/xen/xen-vtpm_4.11.0.bb
 delete mode 100644 recipes-extended/xen/xen-vtpm_4.9.0.bb

diff --git a/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch b/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
deleted file mode 100644
index a3745bd..0000000
--- a/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d991bdbc062248221511ecb795617c36b37e1d2e Mon Sep 17 00:00:00 2001
-From: Wei Liu <wei.liu2@citrix.com>
-Date: Wed, 9 Aug 2017 13:15:48 +0100
-Subject: [PATCH] lib/math.c: implement __udivmoddi4
-
-Some code compiled by gcc 7 requires this.
-
-Signed-off-by: Wei Liu <wei.liu2@citrix.com>
-Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
----
- lib/math.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/lib/math.c b/lib/math.c
-index 561393e..b98cc1d 100644
---- a/lib/math.c
-+++ b/lib/math.c
-@@ -6,6 +6,7 @@
-  *        File: math.c
-  *      Author: Rolf Neugebauer (neugebar@dcs.gla.ac.uk)
-  *     Changes: 
-+ *        Implement __udivmoddi4 (Wei Liu <wei.liu2@citrix.com>)
-  *              
-  *        Date: Aug 2003
-  * 
-@@ -397,6 +398,15 @@ __umoddi3(u_quad_t a, u_quad_t b)
- }
- 
- /*
-+ * Returns the quotient and places remainder in r
-+ */
-+u_quad_t
-+__udivmoddi4(u_quad_t a, u_quad_t b, u_quad_t *r)
-+{
-+	return __qdivrem(a, b, r);
-+}
-+
-+/*
-  * From
-  * moddi3.c
-  */
---
-2.11.0
diff --git a/recipes-extended/xen/mini-os_4.11.0.bb b/recipes-extended/xen/mini-os_4.11.0.bb
new file mode 100644
index 0000000..85a06a7
--- /dev/null
+++ b/recipes-extended/xen/mini-os_4.11.0.bb
@@ -0,0 +1,17 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Mini-OS is a tiny OS kernel distributed with the Xen Project"
+HOMEPAGE = "https://wiki.xenproject.org/wiki/Mini-OS"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8a437231894440a8f7629caa372243d0"
+
+# git commit hash for: xen-RELEASE-4.11.0
+SRCREV_minios = "0b4b7897e08b967a09bed2028a79fabff82342dd"
+SRC_URI = "\
+    git://xenbits.xen.org/mini-os.git;protocol=git;nobranch=1;destsuffix=mini-os;name=minios \
+"
+S="${WORKDIR}/mini-os"
+B="${S}"
+
+require mini-os.inc
diff --git a/recipes-extended/xen/mini-os_4.9.0.bb b/recipes-extended/xen/mini-os_4.9.0.bb
deleted file mode 100644
index 298bc8d..0000000
--- a/recipes-extended/xen/mini-os_4.9.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-DESCRIPTION = "Mini-OS is a tiny OS kernel distributed with the Xen Project"
-HOMEPAGE = "https://wiki.xenproject.org/wiki/Mini-OS"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8a437231894440a8f7629caa372243d0"
-
-# git commit hash for tags: xen-RELEASE-4.9.0, xen-RELEASE-4.9.1, xen-RELEASE-4.9.2
-SRCREV_minios = "ca013fa9baf92f47469ba1f2e1aaa31c41d8a0bb"
-SRC_URI = "\
-    git://xenbits.xen.org/mini-os.git;protocol=git;nobranch=1;destsuffix=mini-os;name=minios \
-    file://mini-os_udivmoddi4-gcc7.patch \
-"
-S="${WORKDIR}/mini-os"
-B="${S}"
-
-require mini-os.inc
diff --git a/recipes-extended/xen/xen-vtpm_4.11.0.bb b/recipes-extended/xen/xen-vtpm_4.11.0.bb
new file mode 100644
index 0000000..088e985
--- /dev/null
+++ b/recipes-extended/xen/xen-vtpm_4.11.0.bb
@@ -0,0 +1,21 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "MiniOS-based vTPMs for Xen"
+HOMEPAGE = "https://www.xenproject.org"
+LICENSE = "GPLv2 & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b1ceb1b03a49b202ee6f41ffd1ed0155 \
+                    file://vtpm/COPYING;md5=75a98062ab0322ded060d9026a1bda61 \
+"
+
+# git commit hash for Xen's RELEASE-4.11.0 tag
+SRCREV_xen = "1eb6544a567e3e5133fafe0c4ef3545c5138d0e4"
+SRC_URI = "\
+    git://xenbits.xen.org/xen.git;protocol=git;nobranch=1;name=xen;subpath=stubdom \
+    git://xenbits.xen.org/xen.git;protocol=git;nobranch=1;name=xen;destsuffix=stubdom/include;subpath=tools/xenstore/include \
+"
+
+S="${WORKDIR}/stubdom"
+B="${S}"
+
+require xen-vtpm.inc
diff --git a/recipes-extended/xen/xen-vtpm_4.9.0.bb b/recipes-extended/xen/xen-vtpm_4.9.0.bb
deleted file mode 100644
index c58a02d..0000000
--- a/recipes-extended/xen/xen-vtpm_4.9.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-DESCRIPTION = "MiniOS-based vTPMs for Xen"
-HOMEPAGE = "https://www.xenproject.org"
-LICENSE = "GPLv2 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b1ceb1b03a49b202ee6f41ffd1ed0155 \
-                    file://vtpm/COPYING;md5=75a98062ab0322ded060d9026a1bda61 \
-"
-
-# git commit hash for Xen's RELEASE-4.9.0 tag
-SRCREV_xen = "c30bf55594a53fae8aae08aabf16fc192faad7da"
-SRC_URI = "\
-    git://xenbits.xen.org/xen.git;protocol=git;nobranch=1;name=xen;subpath=stubdom \
-    git://xenbits.xen.org/xen.git;protocol=git;nobranch=1;name=xen;destsuffix=stubdom/include;subpath=tools/xenstore/include \
-"
-
-S="${WORKDIR}/stubdom"
-B="${S}"
-
-require xen-vtpm.inc
-- 
2.7.4


