Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 745BBE00C59; Tue,  1 May 2018 07:06:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3C69E00B30
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 07:06:22 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id f1-v6so14681170qtj.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XseApzHW9sEUkVSvxONEtJb2zzBHQXb28feW6gbpLNk=;
	b=xZgcUk7hhz8i9/NLn7J3vlT9et/Jg+s/c7aiEfFzWRj/juTfev+vhk/aOkl9pt26Gl
	M8ilIx1Hcb0UunUGJj1ujiFBOwpmPgtSI4SqJbzZHxIB4QDgHlwNgzTcwVoB6Dzctqe7
	wH2SgLvS8s1CM3pi0kWJzEqD2AxoCPLCSzWRdaGdeR11ls+cwRF4QmmYIBW2eFcKd8gs
	Sx7nlJsIaOkFG1ASuJhTftg3sJJDXH2Ird26x7c1bvPvYxibEKYwFS6wJyen62esp++a
	gYvdG9C50KqF5Q8NUhjLNAFbQv9oYAa3ZkRjnMm0dM84a/DpFydyqWQI49iDcex3HIKN
	OhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=XseApzHW9sEUkVSvxONEtJb2zzBHQXb28feW6gbpLNk=;
	b=rvG91LX/L2yycNIe4qAGYaOdf2EfuAkKdIFJLJNvVOftfHkuBNzX1RyewkVea4IVK+
	zW324OWKSOEkRATEjv0yscH+u30EwwKPjom2EIHbyJvAmM1KQHjX5wcWJB/9Zgn4RVvt
	d9tb4q3RA33PHUj9FRBcpVcS6fl+WS1/79Y91QN4KIPBf238IMlVI8V5dwvY8FO2fL7C
	2hbYUgpuQWQuGxzke03YvNkz6NqiAs7ZquaDjunxMtTfRw36aZJQWI9O8q/XzUi2Hv4z
	o+n4hcgMHWXMtTeDFQY4tFbNemYa8qWqm01z5WUJuzD4oJMnnSdLJaEBJNg+iFKZ+CiK
	kyfQ==
X-Gm-Message-State: ALQs6tCc41vBeH78pJ1KGorx79dA3lOYNJ9W5zRfSwXfFXH+QL2zniqA
	0ouN6Gzz8XBLUxwqhGC4KEWqa3y7IVg7PGEL0y/MZ8XagbAZjPLgJxjSpNQMlcw4/7AN3MkgTpM
	RzZZFqZRgSP813EY0NhUJ030cHNKGNtU=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZrHvmcdO8iKxH7P5wDjT9JF6BpWot0cCILHdx2BbDedP9F2MrvGUPOwSocp2OwpFIagIJ53UQ==
X-Received: by 2002:a0c:d4c4:: with SMTP id
	y4-v6mr13575553qvh.239.1525183581778; 
	Tue, 01 May 2018 07:06:21 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	i25-v6sm9048335qte.26.2018.05.01.07.06.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 May 2018 07:06:21 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  1 May 2018 10:05:29 -0400
Message-Id: <0396496d5053ef466acd30a804022d14215dcd94.1525180972.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v5 3/8] xen: Mini-OS source code with make links target applied
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
X-List-Received-Date: Tue, 01 May 2018 14:06:24 -0000
Content-Type: text/plain; charset="US-ASCII"

Mini-OS is a tiny OS kernel distributed with the Xen Project Hypervisor
sources. It is mainly used as operating system for stub domains that are
used for Dom0 Disaggregation.

The Mini-OS source tree is updated and released in coordination with Xen
releases. The Mini-OS source tree and architecture-specific symbolic
links are required for building the dependencies used to build Xen
stubodmains. For convenience, the make links target was executed before
packaging. Otherwise, this is a source package. The current build
methods for Xen stubdomains require either a source archive which
contains the Mini-OS source code or execution of a make target that will
fetch the appropriate Mini-OS source tree from it's git repository. This
recipe removes the mysticism of relating to the version of Mini-OS being
used and it's origins and provides the flexibility to easily changes
versions or patch as necessary.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v5:
 - none
Changes in v4:
 - Fix whitespace errors in patchfiles
Changes in v3:
 - none
Changes in v2:
 - Mini-OS recipe introduced
---
 .../xen/files/mini-os_udivmoddi4-gcc7.patch        | 43 ++++++++++++++++++++++
 recipes-extended/xen/mini-os.inc                   | 28 ++++++++++++++
 recipes-extended/xen/mini-os_4.9.0.bb              | 18 +++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
 create mode 100644 recipes-extended/xen/mini-os.inc
 create mode 100644 recipes-extended/xen/mini-os_4.9.0.bb

diff --git a/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch b/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
new file mode 100644
index 0000000..a3745bd
--- /dev/null
+++ b/recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
@@ -0,0 +1,43 @@
+From d991bdbc062248221511ecb795617c36b37e1d2e Mon Sep 17 00:00:00 2001
+From: Wei Liu <wei.liu2@citrix.com>
+Date: Wed, 9 Aug 2017 13:15:48 +0100
+Subject: [PATCH] lib/math.c: implement __udivmoddi4
+
+Some code compiled by gcc 7 requires this.
+
+Signed-off-by: Wei Liu <wei.liu2@citrix.com>
+Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+---
+ lib/math.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/lib/math.c b/lib/math.c
+index 561393e..b98cc1d 100644
+--- a/lib/math.c
++++ b/lib/math.c
+@@ -6,6 +6,7 @@
+  *        File: math.c
+  *      Author: Rolf Neugebauer (neugebar@dcs.gla.ac.uk)
+  *     Changes: 
++ *        Implement __udivmoddi4 (Wei Liu <wei.liu2@citrix.com>)
+  *              
+  *        Date: Aug 2003
+  * 
+@@ -397,6 +398,15 @@ __umoddi3(u_quad_t a, u_quad_t b)
+ }
+ 
+ /*
++ * Returns the quotient and places remainder in r
++ */
++u_quad_t
++__udivmoddi4(u_quad_t a, u_quad_t b, u_quad_t *r)
++{
++	return __qdivrem(a, b, r);
++}
++
++/*
+  * From
+  * moddi3.c
+  */
+--
+2.11.0
diff --git a/recipes-extended/xen/mini-os.inc b/recipes-extended/xen/mini-os.inc
new file mode 100644
index 0000000..61c2704
--- /dev/null
+++ b/recipes-extended/xen/mini-os.inc
@@ -0,0 +1,28 @@
+# Copyright (C) 2018 kebodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+# clear this out to break dependency circle
+DEPENDS = ""
+
+do_configure() {
+    ${MAKE} -C ${WORKDIR}/mini-os links
+}
+
+# Nothing to configure or compile
+do_compile[noexec] = "1"
+
+# needed because this directory isn't typically part of a sysroot
+SYSROOT_DIRS += "${prefix}/mini-os"
+RDEPENDS_${PN}-dev = "perl"
+
+FILES_${PN}-dev = "\
+    ${prefix} \
+"
+
+do_install() {
+    install -d ${D}${prefix}/mini-os
+    cp -r -t ${D}${prefix}/mini-os ${S}/*
+    rm -rf ${D}${prefix}/mini-os/scripts
+}
diff --git a/recipes-extended/xen/mini-os_4.9.0.bb b/recipes-extended/xen/mini-os_4.9.0.bb
new file mode 100644
index 0000000..298bc8d
--- /dev/null
+++ b/recipes-extended/xen/mini-os_4.9.0.bb
@@ -0,0 +1,18 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Mini-OS is a tiny OS kernel distributed with the Xen Project"
+HOMEPAGE = "https://wiki.xenproject.org/wiki/Mini-OS"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8a437231894440a8f7629caa372243d0"
+
+# git commit hash for tags: xen-RELEASE-4.9.0, xen-RELEASE-4.9.1, xen-RELEASE-4.9.2
+SRCREV_minios = "ca013fa9baf92f47469ba1f2e1aaa31c41d8a0bb"
+SRC_URI = "\
+    git://xenbits.xen.org/mini-os.git;protocol=git;nobranch=1;destsuffix=mini-os;name=minios \
+    file://mini-os_udivmoddi4-gcc7.patch \
+"
+S="${WORKDIR}/mini-os"
+B="${S}"
+
+require mini-os.inc
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

