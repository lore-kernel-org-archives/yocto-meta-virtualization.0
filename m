Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54A42E00BFF; Thu, 26 Nov 2015 07:47:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 9A990E00C21
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:45 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:44 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:22 +0100
Message-ID: <1448552846-24382-10-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 09/13] python-xstatic-font-awesome: upgrade to 4.3.0.0
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...t-awesome_4.1.0.0.bb => python-xstatic-font-awesome_4.3.0.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-font-awesome_4.1.0.0.bb => python-xstatic-font-awesome_4.3.0.0.bb} (69%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.1.0.0.bb b/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb
similarity index 69%
rename from meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.1.0.0.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb
index 62d49e3..4f90fbb 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.1.0.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-font-awesome_4.3.0.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
 SECTION = "devel/python"
 LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=faab18144d8e4d0230ad3fd6f3764d22"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=821ae461252f11e98fefe8bdfaa130ca"
 
-PR = "r0"
 
 SRCNAME = "XStatic-Font-Awesome"
 SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "84965a23e6f98e2e50df5386b85e0f6e"
-SRC_URI[sha256sum] = "620cc5224358b8bdb214ecf3c4e8aa9ea3b538ff38624d54e609b52e77f8caea"
+SRC_URI[md5sum] = "56e637fe7b3dcdd2ebd683996ad60759"
+SRC_URI[sha256sum] = "d2c0548990a22744ad20013e1d095de8ba1ea56b1878d8393a721205b03885c3"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


