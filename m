Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B50DFE00D00; Sun, 15 Sep 2019 20:26:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A607E0074B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 15 Sep 2019 20:26:51 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75503919"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 11:26:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 225804CE14E1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Sep 2019 11:26:33 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 11:27:01 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Sep 2019 11:26:39 +0800
Message-ID: <20190916032639.3150-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 225804CE14E1.A6DE3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
Subject: [PATCH] python-routes: Add python3 version
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
X-List-Received-Date: Mon, 16 Sep 2019 03:26:53 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-routes.inc           | 15 +++++++++++++++
 .../recipes-devtools/python/python-routes_git.bb        | 17 +----------------
 .../recipes-devtools/python/python3-routes_git.bb       |  2 ++
 3 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-routes.inc
 create mode 100644 meta-openstack/recipes-devtools/python/python3-routes_git.bb

diff --git a/meta-openstack/recipes-devtools/python/python-routes.inc b/meta-openstack/recipes-devtools/python/python-routes.inc
new file mode 100644
index 0000000..4224552
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python-routes.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "A Python re-implementation of the Rails routes system."
+HOMEPAGE = "http://routes.groovie.org"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=90976c1a0e3029278f882cfe2e84a6ae"
+
+PV = "2.4.1+git${SRCPV}"
+SRCREV = "2dcef8079cf09f427eeb0be62374f6c1a52bf59d"
+
+SRCNAME = "Routes"
+SRC_URI = "git://github.com/bbangert/routes.git"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-repoze.lru"
diff --git a/meta-openstack/recipes-devtools/python/python-routes_git.bb b/meta-openstack/recipes-devtools/python/python-routes_git.bb
index 408f0a8..11fea85 100644
--- a/meta-openstack/recipes-devtools/python/python-routes_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-routes_git.bb
@@ -1,17 +1,2 @@
-DESCRIPTION = "A Python re-implementation of the Rails routes system."
-HOMEPAGE = "http://routes.groovie.org"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=90976c1a0e3029278f882cfe2e84a6ae"
-
-PV = "2.4.1+git${SRCPV}"
-SRCREV = "2dcef8079cf09f427eeb0be62374f6c1a52bf59d"
-
-SRCNAME = "Routes"
-SRC_URI = "git://github.com/bbangert/routes.git"
-
-S = "${WORKDIR}/git"
-
 inherit setuptools
-
-RDEPENDS_${PN} += "python-repoze.lru"
+require python-routes.inc
diff --git a/meta-openstack/recipes-devtools/python/python3-routes_git.bb b/meta-openstack/recipes-devtools/python/python3-routes_git.bb
new file mode 100644
index 0000000..06dd1ad
--- /dev/null
+++ b/meta-openstack/recipes-devtools/python/python3-routes_git.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-routes.inc
-- 
2.7.4




