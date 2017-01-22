Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35DB4E00595; Sat, 21 Jan 2017 19:48:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCA9FE0043F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:48:02 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0M3m11P025098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:48:01 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 19:48:00 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 21 Jan 2017 22:47:52 -0500
Message-ID: <1485056872-20388-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-oslo.versionedobjects: uprev to latest stable/newton
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
X-List-Received-Date: Sun, 22 Jan 2017 03:48:05 -0000
Content-Type: text/plain

Just a few updates for runtime dependencies. Dependency version
requirement are all already fulfilled.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-oslo.versionedobjects_git.bb   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
index dea4454..b622736 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "1.12.0+git${SRCPV}"
-SRCREV = "9261f3ae3678cca8411ba1700e2ae18f3e5dfb9c"
+PV = "1.17.0+git${SRCPV}"
+SRCREV = "9f33bd4c74949ebe42bffe39c529aa6a1c94e531"
 
 SRCNAME = "oslo.versionedobjects"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
 S = "${WORKDIR}/git"
 
@@ -22,7 +22,6 @@ DEPENDS += " \
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-six \
-        python-babel \
         python-oslo.concurrency \
         python-oslo.config \
         python-oslo.context \
@@ -33,4 +32,5 @@ RDEPENDS_${PN} += " \
         python-oslo.i18n \
         python-webob \
         python-iso8601 \
+        python-netaddr \
        "
-- 
2.7.4


