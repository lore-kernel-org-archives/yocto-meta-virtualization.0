Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77ACBE00CF7; Fri,  1 Dec 2017 12:19:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C80D6E00D79
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Dec 2017 12:19:53 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB1KJrxm014841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 1 Dec 2017 12:19:53 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Dec 2017 12:19:53 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 1 Dec 2017 15:19:41 -0500
Message-ID: <1512159582-6858-7-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
References: <1512159582-6858-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 6/7] python-glance-store: initial version
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
X-List-Received-Date: Fri, 01 Dec 2017 20:19:54 -0000
Content-Type: text/plain

The stable/pike version of this package is required by the stable/pike
version of python-glance.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-glance-store_git.bb              | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-glance-store_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-glance-store_git.bb b/meta-openstack/recipes-devtools/python/python-glance-store_git.bb
new file mode 100644
index 0000000..f6cfaa7
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-glance-store_git.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "Glance stores library"
+HOMEPAGE = "https://github.com/openstack/glance_store"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI = "\
+	git://git.openstack.org/openstack/glance_store.git;branch=stable/pike \
+	"
+
+PV="0.22.0+git${SRCPV}"
+SRCREV="49c915f498fc8d91c98fcf4e07ceecdcf167fc5a"
+S = "${WORKDIR}/git"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+        python-pbr \
+        "
+
+RDEPENDS_${PN} += " \
+        bash \
+        python-oslo.config \
+        python-oslo.i18n \
+        python-oslo.serialization \
+        python-oslo.utils \
+        python-oslo.concurrency \
+        python-stevedore \
+        python-enum34 \
+        python-eventlet \
+        python-six \
+        python-jsonschema \
+        python-keystoneauth1 \
+        python-keystoneclient \
+        python-requests \
+        "
-- 
2.7.4


