Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF2C1E00A0C; Wed, 26 Sep 2018 12:12:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53549E0097D
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Sep 2018 12:12:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8QJCLM6006012
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Sep 2018 12:12:21 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 26 Sep 2018 12:12:21 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Sep 2018 15:12:15 -0400
Message-ID: <1537989136-27095-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] libvirt: uprev to v4.7.0
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
X-List-Received-Date: Wed, 26 Sep 2018 19:12:23 -0000
Content-Type: text/plain

A straight-forward uprev to the latest stable release. As usual basic
runtime sanity tests have been run along with the ptests. The
following is the results of the ptests:

  ====================================
  Testsuite summary for libvirt 4.7.0
  ====================================
  # TOTAL: 120
  # PASS:  117
  # SKIP:  0
  # XFAIL: 0
  # FAIL:  3
  # XPASS: 0
  # ERROR: 0

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
 recipes-extended/libvirt/libvirt/runptest.patch                 | 4 ++--
 recipes-extended/libvirt/{libvirt_4.5.0.bb => libvirt_4.7.0.bb} | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename recipes-extended/libvirt/{libvirt_4.5.0.bb => libvirt_4.7.0.bb} (98%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index cdc5719..be9079d 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "0c1b66a8878d6436b036565060707f73"
-SRC_URI[libvirt_python.sha256sum] = "ef35ed6bc24d76563b1ba9b068ef5a048016726dba62a9d057fe6dfbea6b0f60"
+SRC_URI[libvirt_python.md5sum] = "32cf281199367aec2881c96d1bd80dc6"
+SRC_URI[libvirt_python.sha256sum] = "e36fee5898de3550ed7e63d5d0a8447f9d78f06574634855dee59eae27930908"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
index b900c01..457e821 100644
--- a/recipes-extended/libvirt/libvirt/runptest.patch
+++ b/recipes-extended/libvirt/libvirt/runptest.patch
@@ -89,8 +89,8 @@ index 7b93fbd..edc1eb9 100644
 +	install * $(DEST_DIR)/tools)
 +	install -d $(DEST_DIR)/src/network
 +	cp $(top_srcdir)/src/network/*.xml $(DEST_DIR)/src/network
-+	install -d $(DEST_DIR)/src/cpu
-+	cp $(top_srcdir)/src/cpu/*.xml $(DEST_DIR)/src/cpu
++	install -d $(DEST_DIR)/src/cpu_map
++	cp $(top_srcdir)/src/cpu_map/*.xml $(DEST_DIR)/src/cpu_map
 +	install ../src/libvirt_iohelper $(DEST_DIR)/src
 +	install -D ../src/libvirtd $(DEST_DIR)/src/libvirtd
 +	install -d $(DEST_DIR)/src/remote
diff --git a/recipes-extended/libvirt/libvirt_4.5.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
similarity index 98%
rename from recipes-extended/libvirt/libvirt_4.5.0.bb
rename to recipes-extended/libvirt/libvirt_4.7.0.bb
index 9cfa74a..14565da 100644
--- a/recipes-extended/libvirt/libvirt_4.5.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
@@ -37,8 +37,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "692b2d00907438ed08a68813d3177cd3"
-SRC_URI[libvirt.sha256sum] = "e7e95edc0ca553046761ed55a8d01a06a3a3a4238bbeaedb3ba34680a277ab09"
+SRC_URI[libvirt.md5sum] = "38da6c33250dcbc0a6d68de5c758262b"
+SRC_URI[libvirt.sha256sum] = "92c279f7321624ac5a37a81f8bbe8c8d2a16781da04c63c99c92d3de035767e4"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd
 
-- 
2.7.4


