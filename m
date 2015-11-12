Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 192D5E00C14; Wed, 11 Nov 2015 18:50:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB9D2E009EF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:39 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAC2odqL013143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:39 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 Nov 2015 18:50:38 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 11 Nov 2015 21:50:31 -0500
Message-ID: <1447296631-16483-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
References: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 6/6] functools32: use git instead of release tarballs
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
X-List-Received-Date: Thu, 12 Nov 2015 02:50:44 -0000
Content-Type: text/plain

Since we are often moving packages forward on the master branch it is
simpler to use git instead of tarballs.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../{python-functools32_3.2.3-2.bb => python-functools32_git.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-functools32_3.2.3-2.bb => python-functools32_git.bb} (66%)

diff --git a/meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb b/meta-openstack/recipes-devtools/python/python-functools32_git.bb
similarity index 66%
rename from meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb
rename to meta-openstack/recipes-devtools/python/python-functools32_git.bb
index 937e933..f167e7d 100644
--- a/meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb
+++ b/meta-openstack/recipes-devtools/python/python-functools32_git.bb
@@ -3,14 +3,15 @@ HOMEPAGE = "https://pypi.python.org/pypi/functools32"
 SECTION = "devel/python"
 LICENSE = "PSFv2"
 
+PV = "3.2.3-2"
+SRCREV = "ad90fa86e2f4f494a3aedb0571274f3bbc6d7ab5"
+
 SRCNAME = "functools32"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=27cf2345969ed18e6730e90fb0063a10"
-SRC_URI = "http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "09f24ffd9af9f6cd0f63cb9f4e23d4b2"
-SRC_URI[sha256sum] = "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"
+SRC_URI = "git://github.com/MiCHiLU/python-${SRCNAME}.git"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit distutils
 
-- 
2.1.4


