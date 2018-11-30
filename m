Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BF8FCE00C72; Fri, 30 Nov 2018 13:46:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DDD1E00C49
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Nov 2018 13:46:55 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAULks1u013900
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Nov 2018 13:46:54 -0800 (PST)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 30 Nov 2018 13:46:54 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Nov 2018 16:46:53 -0500
Message-ID: <1543614413-14710-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lxcfs: uprev from v3.0.1 to v3.0.3
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
X-List-Received-Date: Fri, 30 Nov 2018 21:46:56 -0000
Content-Type: text/plain

A very small # of new commits. Most are minor bug fixes, no feature
work. I looked at adding ptests but the tests are mostly in an
unusable state at the moment, for example several require cgm despite
cgmanager being deprecated. So I have opted to continue without them
and only when we can work with upstream to improve their testing can
we seriously consider adding them.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/lxcfs/{lxcfs_3.0.1.bb => lxcfs_3.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/lxcfs/{lxcfs_3.0.1.bb => lxcfs_3.0.3.bb} (84%)

diff --git a/recipes-containers/lxcfs/lxcfs_3.0.1.bb b/recipes-containers/lxcfs/lxcfs_3.0.3.bb
similarity index 84%
rename from recipes-containers/lxcfs/lxcfs_3.0.1.bb
rename to recipes-containers/lxcfs/lxcfs_3.0.3.bb
index 576027f..b6b6ac6 100644
--- a/recipes-containers/lxcfs/lxcfs_3.0.1.bb
+++ b/recipes-containers/lxcfs/lxcfs_3.0.3.bb
@@ -10,8 +10,8 @@ SRC_URI = " \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI[md5sum] = "fa49872fc45846125455199a2cce18f1"
-SRC_URI[sha256sum] = "016c317f13392bebccba338511f537332fb2fdbaf62a5f6d77307b38a348f41f"
+SRC_URI[md5sum] = "bfc41f949caeabd0468189480222f25e"
+SRC_URI[sha256sum] = "890aa30d960d9b1e53b0c0712bf645c1f1924f750e32cd090f368c1338bd462f"
 
 DEPENDS += "fuse"
 RDEPENDS_${PN} += "fuse"
-- 
2.7.4


