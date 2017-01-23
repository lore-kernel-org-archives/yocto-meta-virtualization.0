Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD4FBE007CE; Mon, 23 Jan 2017 13:40:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [147.11.1.11 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0936E00566
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:40:20 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0NLeKF7027521
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:40:20 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 13:40:19 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 16:40:14 -0500
Message-ID: <1485207614-8239-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-django-compressor: uprev to v2.1
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
X-List-Received-Date: Mon, 23 Jan 2017 21:40:21 -0000
Content-Type: text/plain

This version is required to support the uprev of python-horizon to
stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-django-compressor_1.5.bb         | 22 -------------------
 .../python/python-django-compressor_2.1.bb         | 25 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 22 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-django-compressor_1.5.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-django-compressor_1.5.bb b/meta-openstack/recipes-devtools/python/python-django-compressor_1.5.bb
deleted file mode 100644
index b33aed6..0000000
--- a/meta-openstack/recipes-devtools/python/python-django-compressor_1.5.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Compresses linked and inline JavaScript or CSS into single cached files."
-HOMEPAGE = "http://django-compressor.readthedocs.org/en/latest/"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9f8de96acfc347c41ce7c15f2e918ef6"
-
-SRCNAME = "django_compressor"
-
-SRC_URI = "https://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "274dd82a45ddd13e111852dd101a5924"
-SRC_URI[sha256sum] = "0189fd1dbf87d802f4e4e21ebc9220f29bbb7771b252a958ad6119f61453e22e"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools 
-
-RDEPENDS_${PN} += "python-django-appconf  \
-	"
-
-CLEANBROKEN = "1"
diff --git a/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb b/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
new file mode 100644
index 0000000..4bdb706
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-django-compressor_2.1.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Compresses linked and inline JavaScript or CSS into single cached files."
+HOMEPAGE = "http://django-compressor.readthedocs.org/en/latest/"
+SECTION = "devel/python"
+LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=021598d037fd39ab02e53249e1fe4b6f"
+
+SRCNAME = "django_compressor"
+
+SRC_URI = "https://pypi.io/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "21ecfe4e8615eae64f7068a5599df9af"
+SRC_URI[sha256sum] = "ae0051bc0c7a0660c93434e68d617553fccdd573293dfd15aa33f78d2b4954ef"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools 
+
+RDEPENDS_${PN} += " \
+        python-django-appconf  \
+        python-rcssmin  \
+        python-rjsmin  \
+        "
+
+CLEANBROKEN = "1"
-- 
2.7.4


