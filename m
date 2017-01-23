Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 473E9E004D2; Mon, 23 Jan 2017 06:56:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [147.11.146.13 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE268E00405
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 06:56:24 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0NEuMMQ020487
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 06:56:23 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 06:56:22 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 09:56:16 -0500
Message-ID: <1485183377-26611-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 1/2] python-dogpile.cache: uprev to 0.6.2
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
X-List-Received-Date: Mon, 23 Jan 2017 14:56:27 -0000
Content-Type: text/plain

Required to support the uprev of python-oslo.cache to the latest
stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-dogpile.cache_0.5.6.bb              | 19 -------------------
 .../python/python-dogpile.cache_0.6.2.bb              | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 19 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-dogpile.cache_0.5.6.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb

diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.5.6.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.5.6.bb
deleted file mode 100644
index 066ad22..0000000
--- a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.5.6.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
-HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
-SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3ab048e18083e6750668c3d12d2193a0"
-
-PR = "r0"
-SRCNAME = "dogpile.cache"
-
-SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "6283f8e0d94f06d75b6987875cb2e6e8"
-SRC_URI[sha256sum] = "f80544c5555f66cf7b5fc99f15431f3b35f78009bc6b03b58fe1724236bbc57b"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-
diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb
new file mode 100644
index 0000000..c1827bc
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.6.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Python Dogpile Cache: A caching front-end based on the Dogpile lock"
+HOMEPAGE = "https://pypi.python.org/pypi/dogpile.cache"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1edd9b48649f5bffa03e749a55f5a067"
+
+SRCNAME = "dogpile.cache"
+
+SRC_URI = "https://pypi.io/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ab3771eb2155b9658c9e33fa1b827708"
+SRC_URI[sha256sum] = "73793471af07af6dc5b3ee015abfaca4220caaa34c615537f5ab007ed150726d"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+
-- 
2.7.4


