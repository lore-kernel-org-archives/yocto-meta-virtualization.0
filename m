Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC85DE0049F; Sat, 21 Jan 2017 14:25:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DC77E00405
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 14:25:13 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0LMPBHi004457
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 21 Jan 2017 14:25:12 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 14:25:12 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 21 Jan 2017 17:25:04 -0500
Message-ID: <1485037504-24516-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] python-oslo.concurrency: uprev to latest stable/newton
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
X-List-Received-Date: Sat, 21 Jan 2017 22:25:15 -0000
Content-Type: text/plain

Just a few updates for runtime dependencies. Dependency version
requirement are all already fulfilled.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-oslo.concurrency_git.bb         | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
index 6956504..7b1fe68 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.concurrency_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "2.8.0+git${SRCPV}"
-SRCREV = "28fb7e8bb0dfc39e9f5ed46ade65ea85048efc34"
+PV = "3.14.0+git${SRCPV}"
+SRCREV = "9ac99b675eae255b660b03d3a1e61599d09f8316"
 
 SRCNAME = "oslo.concurrency"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
 S = "${WORKDIR}/git"
 
@@ -25,7 +25,6 @@ DEPENDS += " \
 RDEPENDS_${PN} += " \
         python-pbr \
         python-fasteners \
-        python-babel \
         python-iso8601 \
         python-oslo.config \
         python-oslo.i18n \
-- 
2.7.4


