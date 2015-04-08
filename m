Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 240B9E00997; Tue,  7 Apr 2015 23:49:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70537E0098A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Apr 2015 23:49:33 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t386nXva006206
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Apr 2015 23:49:33 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Apr 2015 23:49:32 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 8 Apr 2015 14:49:32 +0800
Message-ID: <1428475772-8348-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Add missing dependencies for keystone, fixtures and testtools
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
X-List-Received-Date: Wed, 08 Apr 2015 06:49:35 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

These missing dependencies are found when running keystone tests:
  File "/usr/lib/python2.7/site-packages/keystone/tests/unit/core.py", line 28, in <module>
    import fixtures
ImportError: No module named fixtures
  File "/usr/lib/python2.7/site-packages/keystone/tests/unit/core.py", line 32, in <module>
    import oslotest.base as oslotest
ImportError: No module named oslotest.base
  File "/usr/lib/python2.7/site-packages/fixtures/fixture.py", line 26, in <module>
    from testtools.compat import (
ImportError: No module named testtools.compat
  File "/usr/lib/python2.7/site-packages/testtools/compat.py", line 31, in <module>
    from extras import try_imports
ImportError: No module named extras

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb   | 2 ++
 meta-openstack/recipes-devtools/python/python-keystone_git.bb     | 2 ++
 meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
index a3d6a34..fe1c8d1 100644
--- a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
@@ -20,3 +20,5 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
+
+RDEPENDS_${PN} += "python-testtools"
diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
index e5896df..1f012cc 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
@@ -284,6 +284,8 @@ RDEPENDS_${PN} += " \
         python-pysaml2 \
         python-oslo.utils \
         python-oauthlib \
+        python-fixtures \
+        python-oslotest \
         "
 
 RDEPENDS_${SRCNAME}-tests += " bash"
diff --git a/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb b/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb
index 7e359b4..48663e9 100644
--- a/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb
+++ b/meta-openstack/recipes-devtools/python/python-testtools_0.9.33.bb
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "5b62231fea71ccb2361d48286481b198ccb8768bf81f8aaec1c8d5fb98
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+RDEPENDS_${PN} += "python-extras"
-- 
1.9.1


