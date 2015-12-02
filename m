Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CE30E00948; Wed,  2 Dec 2015 08:34:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 0C4F9E00AAF
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:13 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:12 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:22 +0100
Message-ID: <1449073966-29707-17-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 16/40] python-oslo.middleware: upgrade to 1.0.0
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:05 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 ...ddleware_0.4.0.bb => python-oslo.middleware_1.0.0.bb} | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.middleware_0.4.0.bb => python-oslo.middleware_1.0.0.bb} (60%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.0.0.bb
similarity index 60%
rename from meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.middleware_1.0.0.bb
index 6affd47..5595a88 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_0.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.middleware_1.0.0.bb
@@ -4,26 +4,28 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PR = "r0"
-
 SRCNAME = "oslo.middleware"
 SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bca65b0372bd1f13eefa4c7205c9df99"
-SRC_URI[sha256sum] = "d300f8342b5faaf712890d58da111789740aebb4b46874e41b45110b704719cb"
+SRC_URI[md5sum] = "5102848f299c777e8333d207149e87ab"
+SRC_URI[sha256sum] = "5ccf160ae5ce23f3f59b86535352e3b5a9fa35dab0edc4ede8b17438da559995"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-# DEPENDS_default: python-pip
-
 DEPENDS += " \
         python-pip \
         python-pbr \
         "
 
-# RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-babel \
+        python-oslo.config \
+        python-oslo.context \
+        python-oslo.i18n \
+        python-six \
+        python-stevedore \
+        python-webob \
         python-pbr \
         "
-- 
2.1.0


