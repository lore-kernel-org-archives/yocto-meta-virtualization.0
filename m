Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F173BE00CDD; Tue, 31 Jul 2018 12:36:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.210.172 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (christopher.w.clark[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC88BE00D21
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:12 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id i26-v6so6587128pfo.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jul 2018 12:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LDosny8RWSZP2CKxlqnLtOBt3XvsvEjnQZcma8UsdBc=;
	b=pYov1TfKJzoE5JJRDEVW9nVQz9Fq+U+McGVJIjYMkqSMxX9gRug/KkY5cy9juYQPuy
	yBZAVVpJsRtdEcb6mbjFA95wAEjIlPMVZmhFHyjzZDR902tbFP94B43JQwyffXIEpEcq
	EuWHihZfgvzX4XtmjlqdREV1zsH6baQoVm8/BnOD7k+McZSxm/5+gDKqZPALtLIO0Q0t
	19QCJoENQtVql4ToNuQHwHfoQ9SzAnNAU8EY3IYsDuE7p0bQeRHigBOMShTJbgetns+P
	thIQ2NxKNFEhSazHuQ8g6mNwilozwXsUDN/rFNEHL6dpwZYrJfy95G8rCDeXslai7LOx
	02zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LDosny8RWSZP2CKxlqnLtOBt3XvsvEjnQZcma8UsdBc=;
	b=J8pcuA/xUDpCtAOB1bNu9f+1bVlTemBhsmXPJimKYectrdlo7dXAazJblblJf85Ayx
	v3HRRwaIulJSdSWgMREfGZc2kdo8yC7MoOJOGArxMx8wkP035TQPiqrIqIhNRNInua2s
	XbX/DKJQFGQtNtz73pkzZNy9TJx1Bx+Y+QO2CSdXjDk5syAhSl33VZYF0uC7CAUSHRj1
	i44h4BKywsMMXb60df9PjpTQZAgADuA+kr7hnaBL175SCdPSBXTDGDjhKRQAuTogUW9R
	9tGZMe6+Qxyxz3sOADfDs/fx/qO8j7raOpijUVASJvWUzraOb+4FE31kQ7aoJoW4PGMZ
	JVww==
X-Gm-Message-State: AOUpUlHU7NCAx/8IIB3gemwVlOZKocP37gmt+QsVv3Lw/SOXLn1vwvqV
	EsIUQ+TeBBb0Y7LaGP7ehlChCvNS
X-Google-Smtp-Source: AAOMgpcN1w+ljcRj9moIAbe4CcNQIzx5OBISMLllAgvxzFJEoHFpfc6Yzw7kU6PNgLRb9e+UMPS3Sg==
X-Received: by 2002:a62:3cd7:: with SMTP id
	b84-v6mr23619084pfk.183.1533065771612; 
	Tue, 31 Jul 2018 12:36:11 -0700 (PDT)
Received: from WorkStation-T3500.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	64-v6sm24758626pfi.89.2018.07.31.12.36.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jul 2018 12:36:10 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Tue, 31 Jul 2018 12:35:45 -0700
Message-Id: <1533065750-25786-5-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
References: <1533065750-25786-1-git-send-email-christopher.w.clark@gmail.com>
Cc: cardoe@gentoo.org
Subject: [PATCH v2 4/9] xen-vtpm, mini-os : upgrade to Xen 4.11.0
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
X-List-Received-Date: Tue, 31 Jul 2018 19:36:26 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

drops the gcc7 compatibility patch -- no longer required as
it is present in the upstream version.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
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


