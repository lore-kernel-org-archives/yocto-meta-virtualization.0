Return-Path: <Maxin.John@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5FABE00559; Wed, 16 Jul 2014 08:43:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 5DE54E00543
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jul 2014 08:43:35 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 16 Jul 2014 17:43:29 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 6894A288F32;
	Wed, 16 Jul 2014 17:43:29 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 16 Jul 2014 17:43:12 +0200
Message-ID: <1405525392-4829-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH v2] kvm-image-minimal: Fix warning
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
X-List-Received-Date: Wed, 16 Jul 2014 15:43:42 -0000
Content-Type: text/plain

Fix this warning:
WARNING: Function remove_packaging_data_files doesn't exist

The remove_packaging_data_files function is now handled automatically when
"package-management" is not in IMAGE_FEATURES. We should remove the lines,
as they are not needed and might interfere with correct operation of
postinstall scripts.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 recipes-extended/images/kvm-image-minimal.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
index abc0fee..c96edca 100644
--- a/recipes-extended/images/kvm-image-minimal.bb
+++ b/recipes-extended/images/kvm-image-minimal.bb
@@ -21,5 +21,3 @@ LICENSE = "MIT"
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
-
-ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
-- 
1.9.1


