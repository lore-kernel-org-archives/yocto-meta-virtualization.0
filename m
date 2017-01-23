Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB956E003DB; Mon, 23 Jan 2017 14:13:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_SPAM
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [192.103.53.11 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F8A5E0033D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 14:13:44 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0NMDh1F002899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 14:13:43 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 14:13:42 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 17:13:36 -0500
Message-ID: <1485209616-26434-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-osprofiler: uprev to v1.5.0
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
X-List-Received-Date: Mon, 23 Jan 2017 22:13:46 -0000
Content-Type: text/plain

This uprev is required to suppor the uprev of python-keyston to the
latest stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...on-osprofiler_0.3.0.bb => python-osprofiler_1.5.0.bb} | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-osprofiler_0.3.0.bb => python-osprofiler_1.5.0.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb
rename to meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
index 1883dbb..bae0efd 100644
--- a/meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-osprofiler_1.5.0.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
 
-PR = "r0"
-
 SRCNAME = "osprofiler"
-SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "http://pypi.io/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "519f299f5e6040a9abf8453751225540"
-SRC_URI[sha256sum] = "7d7e1d0b93ce96901f7a307a712196273818a8f20e59916ff099589b48f53207"
+SRC_URI[md5sum] = "6762b5420fd95646a26c4eaca1af9e64"
+SRC_URI[sha256sum] = "aee63cfd888e6049ea82535ce458ce4844b4ac893dcb18060eda24192505627e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -25,7 +23,13 @@ DEPENDS += " \
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-pbr \
         python-six \
+        python-oslo.messaging \
+        python-oslo.log \
+        python-oslo.utils \
         python-webob \
-        python-pbr \
+        python-requests \
+        python-netaddr \
+        python-oslo.concurrency \
         "
-- 
2.7.4


