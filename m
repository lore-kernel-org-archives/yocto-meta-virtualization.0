Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C018E009AD; Wed,  2 Dec 2015 08:32:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 443DCE0086A
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:32:52 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:32:51 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:08 +0100
Message-ID: <1449073966-29707-3-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 02/40] python-wsme: upgrade to 0.8.0, set proper license
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
X-List-Received-Date: Wed, 02 Dec 2015 16:32:56 -0000
Content-Type: text/plain

License is MIT.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/{python-wsme_0.6.bb => python-wsme_0.8.0.bb}    | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-wsme_0.6.bb => python-wsme_0.8.0.bb} (56%)

diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.6.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.8.0.bb
similarity index 56%
rename from meta-openstack/recipes-devtools/python/python-wsme_0.6.bb
rename to meta-openstack/recipes-devtools/python/python-wsme_0.8.0.bb
index b0c159a..9bc5651 100644
--- a/meta-openstack/recipes-devtools/python/python-wsme_0.6.bb
+++ b/meta-openstack/recipes-devtools/python/python-wsme_0.8.0.bb
@@ -1,16 +1,15 @@
 DESCRIPTION = "Simplify the writing of REST APIs, and extend them with additional protocols"
 HOMEPAGE = "https://pypi.python.org/pypi/WSME/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=477dfa54ede28e2f361e7db05941d7a7"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
 
-PR = "r0"
 SRCNAME = "WSME"
 
 SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "80a46e564ae0710118ddeded8c5f4412"
-SRC_URI[sha256sum] = "8a37981ebf877d2ca8ae12f6c6fc3d920cb0c9d7be68fef419de252797dfdc15"
+SRC_URI[md5sum] = "8a257dc57d11a750c9aac34033ea8663"
+SRC_URI[sha256sum] = "00241e4e4e40d6183f6354a8f5659b601753d49e28b6e5aca332bdf2e31188db"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -22,5 +21,10 @@ DEPENDS += " \
         "
 
 RDEPENDS_${PN} += "\
+        python-netaddr \
         python-pbr \
+        python-pytz \
+        python-simplegeneric \
+        python-six \
+        python-webob \
         "
-- 
2.1.0


