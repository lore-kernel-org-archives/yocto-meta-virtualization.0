Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 120C4E00BEF; Wed,  4 Apr 2018 13:03:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF39BE00C5B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:03:16 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w34K3GGf011952
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:03:16 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:03:15 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:02:52 -0400
Message-ID: <1522872176-22946-8-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
References: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH 08/12] python-pypowervm: initial version (v1.1.10)
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
X-List-Received-Date: Wed, 04 Apr 2018 20:03:24 -0000
Content-Type: text/plain

Required by the stable/pike version of python-nova.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-pypowervm_1.1.10.bb              | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pypowervm_1.1.10.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pypowervm_1.1.10.bb b/meta-openstack/recipes-devtools/python/python-pypowervm_1.1.10.bb
new file mode 100644
index 0000000..a646c47
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pypowervm_1.1.10.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Python binding for the PowerVM REST API"
+HOMEPAGE = "https://pypi.python.org/pypi/pypowervm"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI[md5sum] = "54e4dfaa569350254b0a0f4c19686ded"
+SRC_URI[sha256sum] = "ab27d4efb59105555b6c9b1fe7792fd895ad9ca893058c39bba4106d6a0ad986"
+
+inherit setuptools pypi
+
+RDEPENDS_${PN} += " \
+        python-lxml \
+        python-oslo.concurrency \
+        python-oslo.context \
+        python-oslo.i18n \
+        python-oslo.log \
+        python-oslo.utils \
+        python-pbr \
+        python-pyasn1-modules \
+        python-pyasn1 \
+        python-pytz \
+        python-requests \
+        python-six \
+        python-futures \
+        python-taskflow \
+        python-networkx \
+        "
-- 
2.7.4


