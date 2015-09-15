Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E544EE00BDA; Tue, 15 Sep 2015 04:07:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 21592E00B72
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Sep 2015 04:07:17 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Sep 2015 13:07:14 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 15 Sep 2015 13:07:15 +0200
Message-ID: <1442315235-4401-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [kilo][fido-kilo][PATCH] python-fixtures: depends on python-pbr
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
X-List-Received-Date: Tue, 15 Sep 2015 11:07:21 -0000
Content-Type: text/plain

Fixes this build error:
|   File ".../sysroots/x86_64-linux/usr/lib/python2.7/site-packages/distribute-0.6.32-py2.7.egg/setuptools/command/easy_install.py", line 592, in easy_install
|     raise DistutilsError(msg)
| distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr')
| ERROR: python setup.py build_ext execution failed.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb b/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
index fe1c8d1..f0cb453 100644
--- a/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-fixtures_1.0.0.bb
@@ -21,4 +21,10 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
 
-RDEPENDS_${PN} += "python-testtools"
+DEPENDS += " \
+	python-pbr \
+	"
+
+RDEPENDS_${PN} += "python-testtools \
+	python-pbr \
+	"
-- 
1.9.1


