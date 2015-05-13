Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BB62E009A3; Wed, 13 May 2015 00:25:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E398E009FA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:48 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4D7OmTJ008949
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:48 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 13 May 2015 00:24:47 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 13 May 2015 15:24:33 +0800
Message-ID: <f2a05f67b1a6647e239848a4be4d0c03fc2867ec.1431501591.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431501591.git.jackie.huang@windriver.com>
References: <cover.1431501591.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/11] python-pathlib: add new recipe
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
X-List-Received-Date: Wed, 13 May 2015 07:25:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's required by python-django-pyscss.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/python-pathlib_1.0.1.bb                 | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb

diff --git a/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
new file mode 100644
index 0000000..ae26da1
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Object-oriented filesystem paths"
+DESCRIPTION = "pathlib offers a set of classes to handle filesystem paths. \
+It offers the following advantages over using string objects: \
+- No more cumbersome use of os and os.path functions. \
+- Embodies the semantics of different path types. \
+- Well-defined semantics, eliminating any warts or ambiguities. \
+"
+HOMEPAGE = "https://pypi.python.org/pypi/pathlib"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b6557c860f0fc867aeab30afd649753"
+
+
+SRCNAME = "pathlib"
+SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "5099ed48be9b1ee29b31c82819240537"
+SRC_URI[sha256sum] = "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc9e73c94a7894ea9f"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DEPENDS += " \
+        python-pip \
+"
+
+RDEPENDS_${PN} += " \
+"
-- 
1.9.1


