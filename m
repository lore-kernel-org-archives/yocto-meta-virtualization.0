Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49D9CE00B81; Fri, 11 Dec 2015 09:28:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFBDFE007D5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:28:27 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBBHSQnm027244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:28:26 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 11 Dec 2015 09:28:25 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 11 Dec 2015 12:28:23 -0500
Message-ID: <1449854905-22308-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/3] openvswitch: drop version 1.10.0 and 2.1.3
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
X-List-Received-Date: Fri, 11 Dec 2015 17:28:30 -0000
Content-Type: text/plain

There are some changes that we need to make in the .inc file to
properly support more recent releases of openvswitch. These changes
are not compatible with these older versions of openvswitch, so rather
than make accommodations in the .inc file to continue to support this
version we will simply drop them.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../openvswitch/openvswitch_1.10.0.bb              | 16 ------------
 .../openvswitch/openvswitch_2.1.3.bb               | 29 ----------------------
 2 files changed, 45 deletions(-)
 delete mode 100644 recipes-networking/openvswitch/openvswitch_1.10.0.bb
 delete mode 100644 recipes-networking/openvswitch/openvswitch_2.1.3.bb

diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
deleted file mode 100644
index 85b2709..0000000
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require openvswitch.inc
-
-RRECOMMENDS_${PN} += "kernel-module-openvswitch"
-
-PR = "r4"
-
-SRC_URI += "\
-	http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
-	file://configure-Only-link-against-libpcap-on-FreeBSD.patch \
-	"
-
-SRC_URI[md5sum] = "fe8b49efe9f86b57abab00166b971106"
-SRC_URI[sha256sum] = "803966c89d6a5de6d710a2cb4ed73ac8d8111a2c44b12b846dcef8e91ffab167"
-LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
-
-inherit pkgconfig
diff --git a/recipes-networking/openvswitch/openvswitch_2.1.3.bb b/recipes-networking/openvswitch/openvswitch_2.1.3.bb
deleted file mode 100644
index dc6c7e3..0000000
--- a/recipes-networking/openvswitch/openvswitch_2.1.3.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require openvswitch.inc
-
-RRECOMMENDS_${PN} += "kernel-module-openvswitch"
-
-RDEPENDS_${PN}-ptest += "\
-	python-logging python-syslog python-argparse python-io \
-	python-fcntl python-shell python-lang python-xml python-math \
-	python-datetime python-netclient python sed \
-	"
-
-SRC_URI += "\
-	http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
-	file://openvswitch-add-more-target-python-substitutions.patch \
-	file://openvswitch-add-ptest.patch \
-	file://run-ptest \
-	"
-
-SRC_URI[md5sum] = "d3c8a69df3d1b1a9eaef5a896576fd2a"
-SRC_URI[sha256sum] = "43a2562fe5e8e48e997bfdb04691ffaaaefe73069b5699654538bf2f16ebfb1a"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=e03b0d9c4115c44518594e5618e653f8"
-
-inherit ptest
-
-EXTRA_OEMAKE += "TEST_DEST=${D}${PTEST_PATH} TEST_ROOT=${PTEST_PATH}"
-
-do_install_ptest() {
-	oe_runmake test-install
-}
-- 
2.1.4


