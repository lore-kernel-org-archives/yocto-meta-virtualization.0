Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6482AE00BEA; Thu, 26 Nov 2015 07:47:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 6F215E00BE9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:39 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:38 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:18 +0100
Message-ID: <1448552846-24382-6-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
References: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 05/13] python-rtslib-fb: upgrade to 2.1.51
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../{python-rtslib-fb_2.1.32.bb => python-rtslib-fb_2.1.51.bb}     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-rtslib-fb_2.1.32.bb => python-rtslib-fb_2.1.51.bb} (66%)

diff --git a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.32.bb b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
similarity index 66%
rename from meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.32.bb
rename to meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
index e8f67eb..45eea40 100644
--- a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.32.bb
+++ b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "API for Linux kernel SCSI target (aka LIO)"
 HOMEPAGE = "http://github.com/agrover/rtslib-fb"
 SECTION = "devel/python"
 LICENSE = "Apache-2"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d137b5d839a18895dc0928806ef43548"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=867c358d5dbac2602d0c0f850f731e62"
 
-PR = "r0"
 
 SRCNAME = "rtslib-fb"
 SRC_URI = "http://pypi.python.org/packages/source/r/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "3dac896f1a8a8f71d3c83ffb087d845b"
-SRC_URI[sha256sum] = "2239a0421518e2a3df80ad801d70a5d55340199f956abbcb6d6bbfc4dbee59da"
+SRC_URI[md5sum] = "4ec7575eb90b7c5a91bbea2962f0e036"
+SRC_URI[sha256sum] = "1902c581d6e04b7813f3cd1b11e2abc796205f646c39571cbbb809229fd5553e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.1.0


