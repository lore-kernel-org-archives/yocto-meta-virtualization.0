Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D167E009D9; Tue,  5 May 2015 18:45:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8016E009E6
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 May 2015 18:45:13 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t461jDGa028104
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 5 May 2015 18:45:13 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 5 May 2015 18:45:13 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 6 May 2015 09:45:04 +0800
Message-ID: <fbe4d346187226c7b327ec0ff77e3f0080fa2649.1430817811.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430817811.git.jackie.huang@windriver.com>
References: <cover.1430817811.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] python-horizon: upgrade to 2015.1.0
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
X-List-Received-Date: Wed, 06 May 2015 01:45:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-horizon_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-horizon_git.bb b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
index 376a4d1..55a2a38 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-horizon_git.bb
@@ -59,10 +59,9 @@ RDEPENDS_${PN} += " python-django \
     python-django-pyscss \
     "
 
-PR = "r3"
 SRCNAME = "horizon"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
     file://horizon.init \
     file://fix_bindir_path.patch \
     file://openstack-dashboard-apache.conf \
@@ -70,8 +69,8 @@ SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
     file://horizon-use-full-package-path-to-test-directories.patch \
     "
 
-SRCREV = "a174b4294dd26967953d404207763828c83cc2f7"
-PV = "2015.1.0b3+git${SRCPV}"
+SRCREV = "b99cf48ff346494198fb9740495eacc14fa406bf"
+PV = "2015.1.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit setuptools update-rc.d python-dir default_configs openstackchef monitor
-- 
1.9.1


