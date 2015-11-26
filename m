Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8AF33E00C10; Thu, 26 Nov 2015 07:47:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 858F3E00B21
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:42 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:41 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:20 +0100
Message-ID: <1448552846-24382-8-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 07/13] python-subunit: upgrade to 1.1.0
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-subunit_0.0.15.bb => python-subunit_1.1.0.bb}   | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-subunit_0.0.15.bb => python-subunit_1.1.0.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python-subunit_0.0.15.bb b/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-subunit_0.0.15.bb
rename to meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
index df3ceee..b775dff 100644
--- a/meta-openstack/recipes-devtools/python/python-subunit_0.0.15.bb
+++ b/meta-openstack/recipes-devtools/python/python-subunit_1.1.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Python implementation of subunit test streaming protocol"
 HOMEPAGE = "https://pypi.python.org/pypi/python-subunit/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README;md5=a6d86940a8393cf77ecc299eff036a1c"
+LIC_FILES_CHKSUM = "file://README;md5=e5b524e1b2c67c88fc64439ee4a850aa"
 
-PR = "r0"
 SRCNAME = "python-subunit"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "65e43979f1156911a468fa76cc192c0a"
-SRC_URI[sha256sum] = "3be52e3754e6033292851ea28745706fb5941d2f4f347833af46c0a895dba46d"
+SRC_URI[md5sum] = "d2c09c93346077ced675c9f718e6a0f1"
+SRC_URI[sha256sum] = "d9a7606e9610828d68c1d2f0f5abbb421e34e518b8f4882c8b2e08176281bf88"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


