Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22E8FE003DB; Mon, 23 Jan 2017 12:41:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [147.11.1.11 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6D37E0033D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 12:41:52 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0NKfp3M019222
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 12:41:51 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 23 Jan 2017 12:41:50 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Mon, 23 Jan 2017 15:41:41 -0500
Message-ID: <1485204101-24655-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH][v2] python-oslo.policy: uprev to latest stable/newton
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
X-List-Received-Date: Mon, 23 Jan 2017 20:41:54 -0000
Content-Type: text/plain

Updated runtime dependency list, otherwise all dependency versions are
already in place.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
index 01a9491..f586d28 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
@@ -5,11 +5,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-PV = "0.12.0+git${SRCPV}"
-SRCREV = "dee7171326e138128486f1d2c3f7e639af875198"
+PV = "1.14.0+git${SRCPV}"
+SRCREV = "018c7475c9dd75da0f902bbe3ec5d01855fa50d6"
 
 SRCNAME = "oslo.policy"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
 S = "${WORKDIR}/git"
 
@@ -26,5 +26,6 @@ RDEPENDS_${PN} += " \
         python-oslo.serialization \
         python-oslo.utils \
         python-six \
+        python-pyyaml \
         python-requests \
 "
-- 
2.7.4


