Return-Path: <mober.at@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9212BE00DD3; Tue, 23 Jan 2018 13:44:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (mober.at[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.128.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 38444E006D3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Jan 2018 13:44:18 -0800 (PST)
Received: by mail-wr0-f196.google.com with SMTP id s5so804605wra.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 Jan 2018 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=e8Bh7NNIVfX8whkg1GcEc7mLwqtDQMeRBvp5LL3MAo8=;
	b=nfE76yPlq+riCYaaWKvPTziM74RcnVg55mG4pttk4IK1/DsVu55rmdkwuYl9ZhTdiK
	DEEN8KzYL3LFYmHjieaegM45GDIVhEfNy+gXpEJlDNo9VU9jQnY15h+uuz1PWrDF38Uu
	6d518wwmVmYLxKl3HkGYy1fSTSaIDHF/QuUtI9/L89N24PsUOf0oL6dfMjkcUEPAzqhA
	7FEOKR0gjRpbk9AiCoM4qv4XD1nc6uuaZANdOGIlJL0kQEYrhT4NXL0V0e4HEB6OETVw
	x+SyFKtGzhRcXi5rNSt1ElVCC/NjKQy4FTFetu4GG6hahCjiqbSoKmzNg1t2wZBkgvw0
	YM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e8Bh7NNIVfX8whkg1GcEc7mLwqtDQMeRBvp5LL3MAo8=;
	b=LXA0L7o/cD4YbSO/Qu+yu6cd+5ND8R7H/2UnFfWytW+m+Jv6Yps7WoHevcquyKFeIO
	7WqoA9aMYxcyFMEIGk2O/rJceQFYNnktnmXA7Qhg9UWmUNmddwbMuUDChPl8tmu/N24o
	Eg4Uhhm9wG5ba7KLLlTxPRcyCpeSN5+oEgHHOFsGizFKeLBRlPYHr1Tof8T+sfFpNimN
	fdu/8o0mc2oQQ0kbcgPH0WAJUtYYwTwW/bcvrfzn6b/sFrbT1fa/tzzYra1vmlnT91Aj
	tSQvxl3pjbF+azWLbIaxDnSRy680QeLhJMsjNIb9R1At6AXdECEmPKxhYwFgZ6gabsd5
	V91Q==
X-Gm-Message-State: AKwxytdl6pE3GmNeQ4aoyRUSUPtcwo472Kp6v8kc53ecePM9RDdZTTzf
	Kw42Jc/M5gQyWGIK1DpuvjsNJw==
X-Google-Smtp-Source: AH8x226n6/vvJzLIFE3RG3+lEHYNBPLqYjZyyoC1EQBXXi9VpG46L6usvfPQathwHyBvJyiTLAdjKQ==
X-Received: by 10.223.182.65 with SMTP id i1mr3676719wre.92.1516743857668;
	Tue, 23 Jan 2018 13:44:17 -0800 (PST)
Received: from szg-ub14-vm.ognios.local (89-26-42-50.stat.cablelink.at.
	[89.26.42.50]) by smtp.gmail.com with ESMTPSA id
	i16sm1300314wre.30.2018.01.23.13.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jan 2018 13:44:17 -0800 (PST)
From: Martin Oberhuber <mober.at@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 23 Jan 2018 22:44:00 +0100
Message-Id: <1516743840-3647-1-git-send-email-mober.at@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [jethro][PATCH] Fix docker-registry downloads by using https://pypi.python.org
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
X-List-Received-Date: Tue, 23 Jan 2018 21:44:20 -0000

The docker-registry recipe depends on a couple of Python packages
which use a SRC_URI with http:// protocol. In jethro, this leads
to an error message "ERROR 403: SSL is required" when building.

In jethro, the issue is fixed by converting affected http:// URIs
to https. Note that morty or later do not show the build error
although they use http.

Signed-off-by: Martin Oberhuber <mober.at@gmail.com>
---
 recipes-devtools/python/python-gevent_1.0.1.bb    | 4 ++--
 recipes-devtools/python/python-m2crypto_0.22.3.bb | 2 +-
 recipes-devtools/python/python-requests_2.3.0.bb  | 2 +-
 recipes-devtools/python/python-sphinx_1.3.1.bb    | 2 +-
 recipes-devtools/python/python-webob_1.4.1.bb     | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
index 47f1267..f706423 100644
--- a/recipes-devtools/python/python-gevent_1.0.1.bb
+++ b/recipes-devtools/python/python-gevent_1.0.1.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
 
 SRCNAME = "gevent"
 
-SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
 SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
 
@@ -30,4 +30,4 @@ SRC_URI += "file://gevent-allow-ssl-v2-or-v3-certificates.patch"
 # so always force a cross compile
 do_configure_append() {
 	sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/libev/configure
-}
\ No newline at end of file
+}
diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
index 3325455..c5d4fe6 100644
--- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
+++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
@@ -14,7 +14,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
 
 SRCNAME = "M2Crypto"
-SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
 SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72"
diff --git a/recipes-devtools/python/python-requests_2.3.0.bb b/recipes-devtools/python/python-requests_2.3.0.bb
index 6f38bf1..3639228 100644
--- a/recipes-devtools/python/python-requests_2.3.0.bb
+++ b/recipes-devtools/python/python-requests_2.3.0.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
 PR = "r0"
 SRCNAME = "requests"
 
-SRC_URI = "http://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "7449ffdc8ec9ac37bbcd286003c80f00"
 SRC_URI[sha256sum] = "1c1473875d846fe563d70868acf05b1953a4472f4695b7b3566d1d978957b8fc"
diff --git a/recipes-devtools/python/python-sphinx_1.3.1.bb b/recipes-devtools/python/python-sphinx_1.3.1.bb
index fe8ad94..d8cef30 100644
--- a/recipes-devtools/python/python-sphinx_1.3.1.bb
+++ b/recipes-devtools/python/python-sphinx_1.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6dd095eaa1e7a662b279daf80ecad7e6"
 PR = "r0"
 SRCNAME = "Sphinx"
 
-SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "8786a194acf9673464c5455b11fd4332"
 SRC_URI[sha256sum] = "1a6e5130c2b42d2de301693c299f78cc4bd3501e78b610c08e45efc70e2b5114"
diff --git a/recipes-devtools/python/python-webob_1.4.1.bb b/recipes-devtools/python/python-webob_1.4.1.bb
index 18b3806..e566363 100644
--- a/recipes-devtools/python/python-webob_1.4.1.bb
+++ b/recipes-devtools/python/python-webob_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
 PR = "r0"
 SRCNAME = "WebOb"
 
-SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "a5c6e8ba5431756e6a5d5ec56047ec94"
 SRC_URI[sha256sum] = "12f8b98390befc47336d2c0e5bad9cc48609d808eabb3f8675dc1027a3a9e9db"
-- 
1.9.1


