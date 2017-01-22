Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3FEDE007C5; Sat, 21 Jan 2017 19:48:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95415E0043F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:48:24 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0M3mNNr011041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 19:48:23 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 19:48:22 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 21 Jan 2017 22:48:09 -0500
Message-ID: <1485056889-20802-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-oslo.middleware: uprev to latest stable/newton
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
X-List-Received-Date: Sun, 22 Jan 2017 03:48:27 -0000
Content-Type: text/plain

Standard updates to SRCREV and git branch, minor updates to runtime
dependency list. Dependency version requirements already fulfilled.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-oslo.middleware_git.bb         | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
index ef624f3..811068a 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.middleware_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "2.10.0+git${SRCPV}"
-SRCREV = "8a892308e706b46620e3b73aa16a8e969ee80739"
+PV = "3.19.0+git${SRCPV}"
+SRCREV = "e3e052a92e9eb3e40af3c653281c944d34f822b4"
 
 SRCNAME = "oslo.middleware"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
 S = "${WORKDIR}/git"
 
@@ -24,8 +24,6 @@ DEPENDS += " \
 # RDEPENDS_default: 
 RDEPENDS_${PN} += " \
         python-pbr \
-        python-ordereddict \
-        python-babel \
         python-jinja2 \
         python-oslo.config \
         python-oslo.context \
-- 
2.7.4


