Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00111E003E1; Wed,  4 Jan 2017 13:27:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8988E0034A
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Jan 2017 13:27:35 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v04LRYLI029119
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Jan 2017 13:27:34 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 4 Jan 2017 13:27:33 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Jan 2017 16:27:29 -0500
Message-ID: <1483565249-15968-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openvswitch: update licence checksum
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
X-List-Received-Date: Wed, 04 Jan 2017 21:27:37 -0000
Content-Type: text/plain

Upstream commit a489b16854b5 [conntrack: New userspace connection
tracker.] classified new files under existing licenses in COPYING,
resulting in no change to the overall licenses but requires a new
checksum.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 1c6252a..4fd58bd 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -27,7 +27,7 @@ SRC_URI += "\
 	file://openvswitch-ptest-Fix-python-path.patch \
 	"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea994"
+LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}/opt/dpdk/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,"
-- 
2.7.4


