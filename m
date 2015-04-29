Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39872E00A73; Tue, 28 Apr 2015 20:10:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0A4CE009F3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:37 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T39bZ5009415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Apr 2015 20:09:37 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 28 Apr 2015 20:09:37 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Apr 2015 11:08:47 +0800
Message-ID: <ba3889f816d7f536ea32330444f9d79d22273d5d.1430275945.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430275944.git.jackie.huang@windriver.com>
References: <cover.1430275944.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 37/55] python-rtslib-fb: upgrade to 2.1.51
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
X-List-Received-Date: Wed, 29 Apr 2015 03:10:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
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
1.9.1


