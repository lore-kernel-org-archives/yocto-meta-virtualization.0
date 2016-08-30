Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACFABE00DB5; Tue, 30 Aug 2016 13:09:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81461E00D9D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Aug 2016 13:09:03 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7UK92gt014493
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Aug 2016 13:09:03 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 30 Aug 2016 13:09:02 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 30 Aug 2016 16:09:01 -0400
Message-ID: <1472587741-6109-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH] spice: Add missing license to LICENSE
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
X-List-Received-Date: Tue, 30 Aug 2016 20:09:07 -0000
Content-Type: text/plain

There is a new QA check warning which has been added which flags
situation where a subpackage includes a license which is not included
in the recipe's LICENSE string. In this case we are seeing:

WARNING: .../meta-cloud-services/recipes-support/spice/spice_git.bb:
   LICENSE_lib32-spice-protocol includes licenses (BSD) that are not
   listed in LICENSE

Adding the missing license to the LICENSE string.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
index 0524c27..828087a 100644
--- a/recipes-support/spice/spice_git.bb
+++ b/recipes-support/spice/spice_git.bb
@@ -10,7 +10,7 @@ environment - not only on its computer-server machine, but also from \
 anywhere on the Internet and using a wide variety of machine \
 architectures."
 
-LICENSE = "LGPLv2.1+"
+LICENSE = "BSD & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 PR = "r0"
-- 
2.1.4


