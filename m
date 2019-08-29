Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E39F6E00DF1; Wed, 28 Aug 2019 23:26:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A002E00DEF
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Aug 2019 23:26:48 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7T6QCLt019912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Aug 2019 23:26:37 -0700
Received: from pek-kkang-d1.wrs.com (128.224.162.179) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 28 Aug 2019 23:26:02 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Aug 2019 14:25:07 +0800
Message-ID: <20190829062507.5623-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-openstack][Patch] tgt: update DEPENDS and RDEPENDS
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
X-List-Received-Date: Thu, 29 Aug 2019 06:26:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update DEPENDS and RDEPENDS of tgt to fix error and warning:

| bs_aio.c:34:10: fatal error: libaio.h: No such file or directory
|    34 | #include <libaio.h>
|       |          ^~~~~~~~~~

and

| WARNING: tgt-1.0.79+gitAUTOINC+b43dbc6711-r0 do_package_qa: QA Issue:
|  /usr/sbin/tgt-admin contained in package tgt requires /usr/bin/perl,
|  but no providers found in RDEPENDS_tgt? [file-rdeps]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-openstack/recipes-support/tgt/tgt_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
index ddec8c4..5242dd5 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux SCSI target framework (tgt)"
 HOMEPAGE = "http://stgt.sourceforge.net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
-DEPENDS = "sg3-utils"
+DEPENDS = "sg3-utils libaio"
 
 SRCREV = "b43dbc6711e43c0a32cc4d9df22884841d911d51"
 PV = "1.0.79+git${SRCPV}"
@@ -58,6 +58,7 @@ RDEPENDS_${PN} = " \
     bash \
     libaio \
     libconfig-general-perl \
+    perl \
     perl-module-english \
     perl-module-tie-hash-namedcapture \
     perl-module-xsloader \
-- 
2.20.1


