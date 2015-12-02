Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F7D4E00B60; Wed,  2 Dec 2015 08:33:42 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 54C58E0086A
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:03 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:02 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:15 +0100
Message-ID: <1449073966-29707-10-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 09/40] python-oslo.concurrency: updated to 1.8.2 (kilo)
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
X-List-Received-Date: Wed, 02 Dec 2015 16:33:42 -0000
Content-Type: text/plain

Updated to latest kilo version, added dependencies.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 ...ncurrency_1.5.0.bb => python-oslo.concurrency_1.8.2.bb} | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.concurrency_1.5.0.bb => python-oslo.concurrency_1.8.2.bb} (61%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.5.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.8.2.bb
similarity index 61%
rename from meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.5.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.8.2.bb
index bdd3559..aaed290 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_1.8.2.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PR = "r0"
-
 SRCNAME = "oslo.concurrency"
 SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "83baf51766c3acf9929223762689ebfd"
-SRC_URI[sha256sum] = "89b62c029f0ecfcc92da22277e93fbe74363d459208bf62d2c9e7a3da0019e83"
+SRC_URI[md5sum] = "1ba5ae8bdbb9c12c1b6baa8e3d400b7f"
+SRC_URI[sha256sum] = "149f4c972916f14c14c97d7be7b92ba59497c1bbd09c114ee3681bef0773daca"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -25,5 +23,13 @@ DEPENDS += " \
 
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
+        python-babel \
+        python-fixtures \
+        python-iso8601 \
+        python-oslo.i18n \
+        python-oslo.utils \
         python-pbr \
+        python-posix-ipc \
+        python-retrying \
+        python-six \
         "
-- 
2.1.0


