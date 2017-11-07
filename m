Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81499E00D4C; Tue,  7 Nov 2017 12:40:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70E44E00C45
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:38:57 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA7KcvSM018644
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:38:57 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:38:56 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:38:37 -0500
Message-ID: <1510087118-28132-10-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
References: <1510087118-28132-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 09/10] python-eventlet: add v0.20.0
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
X-List-Received-Date: Tue, 07 Nov 2017 20:40:29 -0000
Content-Type: text/plain

Version 0.21.0 is not compatible with python-oslo.service per its
requirements.txt:

python-eventlet !=0.18.3,!=0.20.1,<0.21.0,>=0.18.2

So add the v0.20.0 and set it as the PREF'd version.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                            |  2 +-
 .../recipes-devtools/python/python-eventlet_0.20.0.bb     | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 302b657..6859085 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -19,5 +19,5 @@ PREFERRED_VERSION_python-django = "1.8.6"
 PREFERRED_VERSION_python-netaddr = "0.7.19"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 PREFERRED_VERSION_python-requests = "2.13.0"
-
+PREFERRED_VERSION_python-eventlet = "0.20.0"
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb b/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
new file mode 100644
index 0000000..9d3c0da
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-eventlet_0.20.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Highly concurrent networking library"
+HOMEPAGE = "http://pypi.python.org/pypi/eventlet"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
+
+SRC_URI[md5sum] = "057276232bf65f1db6aabf819e7ece6a"
+SRC_URI[sha256sum] = "2e17cda85f2003796f13de0e6c59a5253c0afd1f45dfc97bb9b6bfb8962f7895"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+    python-enum34 \
+    python-greenlet \
+    "
-- 
2.7.4


