Return-Path: <prvs=77774814f4=adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 914DBE008FF; Mon, 27 Aug 2018 05:10:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [148.163.156.75 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29523E00874
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Aug 2018 05:10:48 -0700 (PDT)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w7RC6990023779; Mon, 27 Aug 2018 07:10:47 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2m34mw60qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 27 Aug 2018 07:10:46 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w7RCAkv3020500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Mon, 27 Aug 2018 07:10:46 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Mon, 27 Aug 2018 07:10:45 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Mon, 27 Aug 2018 07:10:44 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Mon, 27 Aug 2018 15:12:26 +0300
Message-ID: <20180827121227.6950-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-08-27_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [meta-openstack][PATCH 1/2] python3-avahi: add recipe
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
X-List-Received-Date: Mon, 27 Aug 2018 12:10:48 -0000
Content-Type: text/plain

From: Alejandro del Castillo <alejandro.delcastillo@ni.com>

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../recipes-devtools/python/python-avahi.inc  | 32 ++++++++++++++++++
 .../python/python-avahi_0.6.32.bb             | 33 ++-----------------
 .../python/python3-avahi_0.6.32.bb            |  5 +++
 3 files changed, 39 insertions(+), 31 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-avahi.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb

diff --git a/meta-openstack/recipes-devtools/python/python-avahi.inc b/meta-openstack/recipes-devtools/python/python-avahi.inc
new file mode 100644
index 0000000..86cafe5
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-avahi.inc
@@ -0,0 +1,32 @@
+SUMMARY = "Python bindings for the avahi zeroconf client"
+HOMEPAGE = "https://github.com/lathiat/avahi"
+SECTION = "devel/python"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
+SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
+
+S = "${WORKDIR}/avahi-${PV}"
+
+inherit pythonnative
+
+# we only need the python bindings
+do_install () {
+	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/avahi
+
+	sed -i'' -e "s,@PYTHON\@,${bindir}/${PYTHON_PN},g" \
+		${S}/avahi-python/avahi/__init__.py  \
+		${S}/avahi-python/avahi-bookmarks.in
+
+	install -m 0775 ${S}/avahi-python/avahi/__init__.py \
+		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/__init__.py
+
+	install -m 0775 ${S}/avahi-python/avahi-bookmarks.in \
+		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/avahi-bookmarks
+}
+
+FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/avahi"
diff --git a/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb b/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
index c129337..7a54211 100644
--- a/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
+++ b/meta-openstack/recipes-devtools/python/python-avahi_0.6.32.bb
@@ -1,34 +1,5 @@
-SUMMARY = "Python bindings for the avahi zeroconf client"
-HOMEPAGE = "https://github.com/lathiat/avahi"
-SECTION = "devel/python"
+require python-avahi.inc
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "22b5e705d3eabb31d26f2e1e7b074013"
-SRC_URI[sha256sum] = "d54991185d514a0aba54ebeb408d7575b60f5818a772e28fa0e18b98bc1db454"
-
-S = "${WORKDIR}/avahi-${PV}"
-
-inherit python-dir pythonnative
-
-# we only need the python bindings
-do_install () {
-	install -d ${D}${PYTHON_SITEPACKAGES_DIR}/avahi
-
-	sed -i'' -e "s,@PYTHON\@,${bindir}/python,g" \
-		${S}/avahi-python/avahi/__init__.py  \
-		${S}/avahi-python/avahi-bookmarks.in
-
-	install -m 0775 ${S}/avahi-python/avahi/__init__.py \
-		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/__init__.py
-
-	install -m 0775 ${S}/avahi-python/avahi-bookmarks.in \
-		${D}${PYTHON_SITEPACKAGES_DIR}/avahi/avahi-bookmarks
-}
+inherit python-dir
 
 RDEPENDS_${PN} += "python-core python-dbus"
-
-FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/avahi"
diff --git a/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb b/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb
new file mode 100644
index 0000000..4b85cd5
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-avahi_0.6.32.bb
@@ -0,0 +1,5 @@
+require python-avahi.inc
+
+inherit python3-dir
+
+RDEPENDS_${PN} += "python3-core python3-dbus"
-- 
2.18.0


