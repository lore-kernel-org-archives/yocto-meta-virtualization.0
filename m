Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB764E007C5; Sat, 21 Jan 2017 19:49:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A86FDE0043F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:49:08 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0M3n3tq005230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:49:07 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 19:49:02 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 21 Jan 2017 22:48:45 -0500
Message-ID: <1485056928-21697-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 1/4] python-futurist: uprev to v0.21.0
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
X-List-Received-Date: Sun, 22 Jan 2017 03:49:10 -0000
Content-Type: text/plain

This version is required to support python-oslo.messaging. Other than
the typical version and checksum updates, minor updates to the runtime
dependencies were required.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../{python-futurist_0.8.0.bb => python-futurist_0.21.0.bb}   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-futurist_0.8.0.bb => python-futurist_0.21.0.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python-futurist_0.8.0.bb b/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-futurist_0.8.0.bb
rename to meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
index 3ad3993..27f2860 100644
--- a/meta-openstack/recipes-devtools/python/python-futurist_0.8.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-futurist_0.21.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRCNAME = "futurist"
 
-SRC_URI = "https://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ccef2f5a651fffcfe13c71d91262be4d"
-SRC_URI[sha256sum] = "36f48b56af54c44db848fe4a23c2cb70bd334237e11212a16885a55aca881ddd"
+SRC_URI[md5sum] = "da7e87d273f1982c24e9fe8a24f81259"
+SRC_URI[sha256sum] = "086dd646c067d4ef6dc9c04000828acfbdc00842bd37c64825b596a6976509b4"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -17,10 +17,15 @@ inherit setuptools
 
 DEPENDS += " \
         python-pip \
+        python-pbr-native \
         "
 
 RDEPENDS_${PN} += " \
+        python-pbr \
+        python-six \
+        python-monotonic \
         python-futures \
         python-contextlib2 \
+        python-prettytable \
         "
 
-- 
2.7.4


