Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2D16E00BEE; Tue,  8 Dec 2015 09:35:16 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A1C80E00BAB
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:52 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:51 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:47 +0100
Message-ID: <1449596034-8308-36-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 35/42] python-pbr: upgrade to 0.11
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
X-List-Received-Date: Tue, 08 Dec 2015 17:35:16 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/{python-pbr_0.10.8.bb => python-pbr_0.11.0.bb}         | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-pbr_0.10.8.bb => python-pbr_0.11.0.bb} (73%)

diff --git a/meta-openstack/recipes-devtools/python/python-pbr_0.10.8.bb b/meta-openstack/recipes-devtools/python/python-pbr_0.11.0.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/python/python-pbr_0.10.8.bb
rename to meta-openstack/recipes-devtools/python/python-pbr_0.11.0.bb
index ec5c589..b81ed6f 100644
--- a/meta-openstack/recipes-devtools/python/python-pbr_0.10.8.bb
+++ b/meta-openstack/recipes-devtools/python/python-pbr_0.11.0.bb
@@ -4,24 +4,20 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PR = "r0"
 SRCNAME = "pbr"
 
 SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ccef0c0fa2ad7ee2c9997322a83d7e45"
-SRC_URI[sha256sum] = "a741650c697abe9dd3da00039a57a45a15a6eed017a16f6b7e4c0161fae2b4b2"
+SRC_URI[md5sum] = "e69466b4206e350f4f1e1db2e11ab73b"
+SRC_URI[sha256sum] = "d7f0d69aef367a764d69a4728afd966025ce9394d6029a924ef838ecdf592f6d"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-# DEPENDS_default: python-pip
-
 DEPENDS += " \
         python-pip \
         "
 
-# RDEPENDS_default:
 RDEPENDS_${PN} += " \
         "
-- 
2.5.0


