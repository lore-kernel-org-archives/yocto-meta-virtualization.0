Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25AEEE00AF2; Thu, 19 Jan 2017 11:33:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A979EE00A1C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 11:33:18 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0JJXAb6011352
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jan 2017 11:33:10 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 11:33:09 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>,
	<huangqy.fnst@cn.fujitsu.com>
Date: Thu, 19 Jan 2017 14:33:06 -0500
Message-ID: <1484854386-3400-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
References: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python-sqlalchemy: uprev to latest in 1.0.x series
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
X-List-Received-Date: Thu, 19 Jan 2017 19:33:21 -0000
Content-Type: text/plain

According to the changelog at
(http://docs.sqlalchemy.org/en/latest/changelog/changelog_10.html)
this is mostly bug fixes. We need a version >= 1.0.10 to properly
support the python-oslo.db uprev to stable/newton in
meta-cloud-services.

NOTE the license checksum has changed do to content change, not
because the package license has changed, it is still MIT.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../{python-sqlalchemy_1.0.9.bb => python-sqlalchemy_1.0.16.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-devtools/python/{python-sqlalchemy_1.0.9.bb => python-sqlalchemy_1.0.16.bb} (50%)

diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.9.bb b/recipes-devtools/python/python-sqlalchemy_1.0.16.bb
similarity index 50%
rename from recipes-devtools/python/python-sqlalchemy_1.0.9.bb
rename to recipes-devtools/python/python-sqlalchemy_1.0.16.bb
index 01c94a5..5eb60b5 100644
--- a/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
+++ b/recipes-devtools/python/python-sqlalchemy_1.0.16.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cf755cb27ad4331d45dbb4db5172fd33"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d7dba1721bc8ce05d421f7279cb87971"
 RDEPENDS_${PN} += "python-numbers"
 
 SRCNAME = "SQLAlchemy"
-SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI = "https://pypi.io/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0e2d7442e70d02c9f6346a5bf0ec2265"
-SRC_URI[sha256sum] = "c3d37501e36ec5d74c2d7b4a3764719db86a9cdab4a24431bf58b386743ab10e"
+SRC_URI[md5sum] = "42c81726e7e145c206dac46964b4a167"
+SRC_URI[sha256sum] = "e2dfdaa0983931ac1b0522dd637f08a52cf3081746513ac79c50843277ebe463"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.7.4


