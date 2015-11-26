Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3BEFE00BE6; Thu, 26 Nov 2015 07:47:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 27ABBE00BE6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:46 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:45 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:23 +0100
Message-ID: <1448552846-24382-11-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 10/13] python-xstatic-jasmine: upgrade to 2.1.2.0
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
 ...static-jasmine_1.3.1.1.bb => python-xstatic-jasmine_2.1.2.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jasmine_1.3.1.1.bb => python-xstatic-jasmine_2.1.2.0.bb} (67%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_1.3.1.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb
similarity index 67%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jasmine_1.3.1.1.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb
index 1f1d606..529a2de 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_1.3.1.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-jasmine_2.1.2.0.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "Jasmine JavaScript library packaged for setuptools "
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Jasmine"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dfe5bf1328f6947f43208400409167b0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=eb6b9af5c233043f32ed0225d52cf4a4"
 
-PR = "r0"
 
 SRCNAME = "XStatic-Jasmine"
 SRC_URI = "http://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "343a6848f32a0ec5015d8732a82b130b"
-SRC_URI[sha256sum] = "b9a8f8f0bf51ebdf7118c598c2e62b10ad9e1326858dbb61a07b3711b9491465"
+SRC_URI[md5sum] = "63fdb4a8668eb70ceef1a311e8b02dcb"
+SRC_URI[sha256sum] = "ba80ab9a324a7abfa5bb4855aaca279aceaf3e0223830d28a17a994770ecc1b4"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


