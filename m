Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99651E00D97; Mon, 13 Nov 2017 11:32:47 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87F82E00DD9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:40 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vADJWeIV010409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:40 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:39 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:24 -0500
Message-ID: <1510601551-32245-5-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 04/11] python-warlock: add v1.2.0 required by python-glanceclient
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:47 -0000
Content-Type: text/plain

Keep the newer v1.3.0 around but we need to ensure this version is in
use so set a PREF version.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                      |  1 +
 .../recipes-devtools/python/python-warlock_1.2.0.bb | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index 6859085..f2aa64e 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -20,4 +20,5 @@ PREFERRED_VERSION_python-netaddr = "0.7.19"
 PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 PREFERRED_VERSION_python-requests = "2.13.0"
 PREFERRED_VERSION_python-eventlet = "0.20.0"
+PREFERRED_VERSION_python-warlock = "1.2.0"
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb b/meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb
new file mode 100644
index 0000000..0839983
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-warlock_1.2.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Build self-validating python objects using JSON schemas"
+HOMEPAGE = "http://github.com/bcwaldon/warlock"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS += " \
+        python-jsonschema \
+        python-jsonpatch \
+        "
+
+SRC_URI[md5sum] = "8389225c589ada11a9094abc5d9053df"
+SRC_URI[sha256sum] = "7c0d17891e14cf77e13a598edecc9f4682a5bc8a219dc84c139c5ba02789ef5a"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+        python-jsonschema \
+        python-jsonpatch \
+        python-six \
+        "
-- 
2.7.4


