Return-Path: <boon.leong.ong@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 252F5E008F6; Mon, 16 Mar 2015 22:31:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [134.134.136.24 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01E1DE008EA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Mar 2015 22:31:22 -0700 (PDT)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 22:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,414,1422950400"; d="scan'208";a="468235442"
Received: from ssid-ilbpg4.png.intel.com ([10.88.227.79])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2015 22:24:09 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 17 Mar 2015 13:29:11 +0800
Message-Id: <1426570151-25669-1-git-send-email-boon.leong.ong@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] dev86: Adjusted the SRC_URI of the source code.
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
X-List-Received-Date: Tue, 17 Mar 2015 05:31:30 -0000

From: j105rob <j105.rob@gmail.com>

The SRC_URI of the source code was returning a 404. After locating the correct URI
for this version of the source code, updated the SRC_URI & hashes.

Signed-off-by: j105rob <j105.rob@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
(cherry picked from commit 2892c53779f4cf2e58e3c60302b7e9ef792f938e)

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 recipes-extended/dev86/dev86_0.16.19.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.19.bb
index 807504e..5e26a75 100644
--- a/recipes-extended/dev86/dev86_0.16.19.bb
+++ b/recipes-extended/dev86/dev86_0.16.19.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 SECTION = "console/tools"
 PR="r0"
 
-SRC_URI="http://www.debath.co.uk/dev86/Dev86src-${PV}.tar.gz"
+SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.zip"
 
-SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
-SRC_URI[sha256sum] = "33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
+SRC_URI[md5sum] = "1308759f36f9907e7dae92c46f35c51e"
+SRC_URI[sha256sum] = "efd33d456ff87d6d0308608f6a34052b22ea8629913d0597d98c73815ed0f9f0"
 
 S = "${WORKDIR}/dev86-${PV}"
 
-- 
1.7.9.5


