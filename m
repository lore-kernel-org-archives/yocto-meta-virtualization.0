Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4513AE003E1; Fri, 20 Jan 2017 12:49:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D147AE003E1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 12:49:38 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0KKncwR024386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 12:49:38 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 12:49:37 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 20 Jan 2017 15:49:25 -0500
Message-ID: <1484945365-12675-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484945365-12675-1-git-send-email-mark.asselstine@windriver.com>
References: <1484945365-12675-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 4/4] python-oslo.db: uprev to latest stable/newton
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
X-List-Received-Date: Fri, 20 Jan 2017 20:49:40 -0000
Content-Type: text/plain

Required some dependencies to be uprev's such as python-oslo.context
and python-oslo.utils as well as version pinning python-sqlalchemy.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/conf/layer.conf                               | 1 +
 meta-openstack/recipes-devtools/python/python-oslo.db_git.bb | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
index f5288e3..cfbb232 100644
--- a/meta-openstack/conf/layer.conf
+++ b/meta-openstack/conf/layer.conf
@@ -17,5 +17,6 @@ PREFERRED_VERSION_python-pexpect = "3.3"
 PREFERRED_VERSION_python-futures = "3.0.3%"
 PREFERRED_VERSION_python-django = "1.8.6"
 PREFERRED_VERSION_python-netaddr = "0.7.19"
+PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
index f3f7074..ca48d78 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.db_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-PV = "3.1.0+git${SRCPV}"
-SRCREV = "3afd58f6ab0fc2acb1dd92f652cec48e87763cf6"
+PV = "4.13.5+git${SRCPV}"
+SRCREV = "086be4ac91b17942370980a35d67d48d2e42567a"
 
 SRCNAME = "oslo.db"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
 
 S = "${WORKDIR}/git"
 
@@ -33,4 +33,5 @@ RDEPENDS_${PN} += " \
        python-sqlalchemy-migrate \
        python-stevedore \
        python-pbr \
+       python-debtcollector \
        "
-- 
2.7.4


