Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95139E00CD6; Thu,  4 Apr 2019 08:14:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7721BE006D8
	for <meta-virtualization@yoctoproject.org>;
	Thu,  4 Apr 2019 08:14:22 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x34FELXl007214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 4 Apr 2019 08:14:21 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 4 Apr 2019 08:14:15 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 4 Apr 2019 08:14:15 -0700
Message-ID: <20190404151415.73617-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.18.1
MIME-Version: 1.0
Subject: [PATCH] container-base: Allow building with a specific kernel binding
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
X-List-Received-Date: Thu, 04 Apr 2019 15:14:23 -0000
Content-Type: text/plain

The oe-core layer sets a variable which intends that linux-dummy is
set for container building.  This commit would allow you to have a
specific kernel and board setup as well as generate multiple
containers by turrning off the linux-dummy check found in:

   oe-core/meta/classes/image-container.bbclass

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 recipes-extended/images/container-base.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-extended/images/container-base.bb b/recipes-extended/images/container-base.bb
index 3e636ca..434239a 100644
--- a/recipes-extended/images/container-base.bb
+++ b/recipes-extended/images/container-base.bb
@@ -20,6 +20,9 @@ IMAGE_INSTALL = " \
        netbase \
 "
 
+# Allow build with or without a specific kernel
+IMAGE_CONTAINER_NO_DUMMY = "1"
+
 # Workaround /var/volatile for now
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile ; "
 rootfs_fixup_var_volatile () {
-- 
2.18.1


