Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A03A3E00DD0; Mon, 13 Nov 2017 11:32:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E73DEE00DD5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:47 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vADJWlgV010444
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:47 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:47 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:27 -0500
Message-ID: <1510601551-32245-8-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 07/11] python-cliff: uprev to v2.9.1
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:53 -0000
Content-Type: text/plain

This uprev is required for the uprev of python-neutronclient to
stable/pike.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/{python-cliff_2.4.0.bb => python-cliff_2.9.1.bb} | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-cliff_2.4.0.bb => python-cliff_2.9.1.bb} (62%)

diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb
similarity index 62%
rename from meta-openstack/recipes-devtools/python/python-cliff_2.4.0.bb
rename to meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb
index 20518bb..e24c756 100644
--- a/meta-openstack/recipes-devtools/python/python-cliff_2.4.0.bb
+++ b/meta-openstack/recipes-devtools/python/python-cliff_2.9.1.bb
@@ -4,16 +4,10 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCNAME = "cliff"
+SRC_URI[md5sum] = "2bb9bc906a0174afbc25f896484d215e"
+SRC_URI[sha256sum] = "ab50fbb4717c74e32915123f4150805b463e81de1d58e43996fd813b26c5b447"
 
-SRC_URI = "https://pypi.python.org/packages/5a/86/61cb36713a6feb28cfb3201022a218c359dc988cf9f65b2e2681cb33cf8d/${SRCNAME}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "26ef765d200e54aebf72984dfce5f255"
-SRC_URI[sha256sum] = "cc9175e3c2a42bc06343290a1218bc6b70f36883520b2948f743c5f9ae917675"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools rmargparse
+inherit setuptools pypi
 
 DEPENDS += "\
     python-pbr \
@@ -29,7 +23,6 @@ RDEPENDS_${PN} += "python-prettytable \
             python-pbr \
             python-pyparsing \
             python-prettytable \
-            python-pyparsing \
             python-six \
             python-stevedore \
             python-unicodecsv \
-- 
2.7.4


