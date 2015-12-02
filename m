Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46726E00973; Wed,  2 Dec 2015 08:34:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 37287E00ABE
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:20 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:19 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:26 +0100
Message-ID: <1449073966-29707-21-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 20/40] python-oslo.rootwrap: upgrade to 1.6.0
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:08 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 ...python-oslo.rootwrap_1.5.0.bb => python-oslo.rootwrap_1.6.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.rootwrap_1.5.0.bb => python-oslo.rootwrap_1.6.0.bb} (76%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.6.0.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.6.0.bb
index e3a47fa..93e3c74 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.rootwrap_1.6.0.bb
@@ -4,13 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PR = "r0"
-
 SRCNAME = "oslo.rootwrap"
 SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3a988feffa7a0fb022857db9287bf8b9"
-SRC_URI[sha256sum] = "d2842359c08d7ecc5e5255f9c97aa9c42300eaed556d8f46fc18537e5d00b97e"
+SRC_URI[md5sum] = "dde8877cf09581a7dd24673806f778dd"
+SRC_URI[sha256sum] = "5fe6d1619a5306f9181899c7cc5251ba5a0de0d3c60f85b2172a2f7d400a4962"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -26,4 +24,5 @@ DEPENDS += " \
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
+        python-six \
         "
-- 
2.1.0


