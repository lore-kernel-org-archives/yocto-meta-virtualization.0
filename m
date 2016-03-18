Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2CC34E00C89; Fri, 18 Mar 2016 13:50:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E072DE00C80
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Mar 2016 13:50:13 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2IKoCLp006567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Mar 2016 13:50:13 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 13:50:12 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 18 Mar 2016 16:50:09 -0400
Message-ID: <1458334211-26727-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/3] tgt: pass required CFLAGS
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
X-List-Received-Date: Fri, 18 Mar 2016 20:50:15 -0000
Content-Type: text/plain

The tgt Makefile has several CFLAGS (defines) that need to be
set. Since we overwrite the CFLAGS by exporting CFLAGS and passing
'-e' to make, we need to include these in our defined CFLAGS.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-support/tgt/tgt_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
index a5df710..ac240f0 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -4,9 +4,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
 DEPENDS = "sg3-utils"
 
-SRCREV = "ab51727a361bf296b1c2036375b5e45479059921"
-PV = "1.0.60+git${SRCPV}"
-PR = "r0"
+SRCREV = "eca74a72d2595f126a020111943928c3ea9e6fe8"
+PV = "1.0.63+git${SRCPV}"
 
 SRC_URI = "git://github.com/fujita/tgt.git \
 	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
@@ -20,6 +19,8 @@ CONFFILES_${PN} += "${sysconfdir}/tgt/targets.conf"
 
 inherit update-rc.d
 
+CFLAGS += ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE -DTGT_VERSION=\\"1.0.63\\" -DBSDIR=\\"${libdir}/backing-store\\"'
+
 do_compile() {
     oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf scripts
 }
-- 
2.1.4


