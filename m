Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E46CE00B70; Wed,  2 Dec 2015 08:33:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 61CB7E00A39
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:06 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:05 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:17 +0100
Message-ID: <1449073966-29707-12-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 11/40] python-oslo.db: upgrade to 1.7.2 (kilo)
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
X-List-Received-Date: Wed, 02 Dec 2015 16:33:46 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../python/{python-oslo.db_1.5.0.bb => python-oslo.db_1.7.2.bb}     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-oslo.db_1.5.0.bb => python-oslo.db_1.7.2.bb} (81%)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb b/meta-openstack/recipes-devtools/python/python-oslo.db_1.7.2.bb
similarity index 81%
rename from meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb
rename to meta-openstack/recipes-devtools/python/python-oslo.db_1.7.2.bb
index 1c3a7b4..3f2dd95 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.db_1.7.2.bb
@@ -4,14 +4,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PR = "r0"
+SRC_URI[md5sum] = "a66179ca85c81d419e5eb5ec338783c7"
+SRC_URI[sha256sum] = "e10b1bc9b128aaeae652809e1659ec2d2f64e2d1a143b9c9c66eb9cfef66c02c"
 
 SRCNAME = "oslo.db"
 SRC_URI = "http://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "b5786f249c3af5a45e39fcb495ef62f1"
-SRC_URI[sha256sum] = "1358218c8055226e6a11aca521e46f7e0e13174b2ff4ae0503b372def10cd26e"
-
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
-- 
2.1.0


