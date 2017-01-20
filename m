Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DF85E0082A; Fri, 20 Jan 2017 13:59:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89BD0E003C1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:59:47 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0KLxlOf024705
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 13:59:47 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 13:59:46 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 Jan 2017 16:59:35 -0500
Message-ID: <1484949575-2411-6-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484949575-2411-1-git-send-email-mark.asselstine@windriver.com>
References: <1484949575-2411-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 6/6] python-oslotest: uprev to latest stable/newton
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
X-List-Received-Date: Fri, 20 Jan 2017 21:59:49 -0000
Content-Type: text/plain

This requires uprev's to pythong-os-client-config and python-fixtures.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-oslotest_git.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslotest_git.bb b/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
index 58b79b6..d08e107 100644
--- a/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslotest_git.bb
@@ -6,11 +6,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "1.12.0+git${SRCPV}"
-SRCREV = "b5e355fcecdf7727fe33e355c4f87d1971b5fef5"
+PV = "2.10.0+git${SRCPV}"
+SRCREV = "a8c5ed4008963a3436f4a4932ac544f5ee4c283b"
 
 SRCNAME = "oslotest"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
 S = "${WORKDIR}/git"
 
@@ -22,11 +22,14 @@ DEPENDS += "\
 
 RDEPENDS_${PN} = "python-fixtures \
                   python-subunit \
+                  python-six \
                   python-testrepository \
                   python-testscenarios \
                   python-testtools \
                   python-mock \
-                  python-mox \
+                  python-mox3 \
+                  python-os-client-config \
+                  python-debtcollector \
                   python-pbr \
                   bash \
 "
-- 
2.7.4


