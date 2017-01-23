Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 644ABE007EB; Mon, 23 Jan 2017 13:40:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [147.11.146.13 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3A8EE00655
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:40:32 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0NLeWtK023792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 13:40:32 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 13:40:32 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 16:40:27 -0500
Message-ID: <1485207627-8565-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-xstatic-mdi: uprev to 1.4.57.0
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
X-List-Received-Date: Mon, 23 Jan 2017 21:40:34 -0000
Content-Type: text/plain

This uprev is required by the uprev of python-horizon to
stable/newton.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...-xstatic-mdi_1.1.70.1.bb => python-xstatic-mdi_1.4.57.0.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-mdi_1.1.70.1.bb => python-xstatic-mdi_1.4.57.0.bb} (50%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.1.70.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
similarity index 50%
rename from meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.1.70.1.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
index 840f538..ceb4c9d 100644
--- a/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.1.70.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-xstatic-mdi_1.4.57.0.bb
@@ -1,14 +1,14 @@
 DESCRIPTION = "mdi javascript library packaged for setuptools (easy_install) / pip."
 HOMEPAGE = "https://pypi.python.org/pypi/XStatic-mdi"
 SECTION = "devel/python"
-LICENSE = "CC-BY-4.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f056788d254e428803e2d2a93e6a510d"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=898ae9ca7b59edc4521f10be07c6b622"
 
 SRCNAME = "XStatic-mdi"
-SRC_URI = "https://pypi.python.org/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.io/packages/source/X/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "41a92868ff0fcbd86a912ca974b995bd"
-SRC_URI[sha256sum] = ""
+SRC_URI[md5sum] = "f3d3d58603178e5898ee1ea4737826ee"
+SRC_URI[sha256sum] = "19b4d522f8fa62fee2893b39147fcf45ebaba8b95d63f3708ebdf34e130a8a53"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


