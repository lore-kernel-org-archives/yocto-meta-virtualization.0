Return-Path: <pascal.bach@siemens.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80D58E00DE0; Wed, 14 Mar 2018 01:36:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.35.17.14 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BB6BE00823
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 01:36:19 -0700 (PDT)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w2E8aIuT003052
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 09:36:18 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.15.61])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w2E8aIKx003837;
	Wed, 14 Mar 2018 09:36:18 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 8818B10D3F8A;
	Wed, 14 Mar 2018 09:36:17 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 14 Mar 2018 09:36:09 +0100
Message-Id: <20180314083609.7907-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] linux-yocto: replace version specific appends
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
X-List-Received-Date: Wed, 14 Mar 2018 08:36:21 -0000

All append to the same anyway and as long that there is no difference it
can be simplified by having only one append for all versions.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../linux/{linux-yocto_4.12.bbappend => linux-yocto_%.bbappend}          | 0
 recipes-kernel/linux/linux-yocto_4.14.bbappend                           | 1 -
 recipes-kernel/linux/linux-yocto_4.15.bbappend                           | 1 -
 3 files changed, 2 deletions(-)
 rename recipes-kernel/linux/{linux-yocto_4.12.bbappend => linux-yocto_%.bbappend} (100%)
 delete mode 100644 recipes-kernel/linux/linux-yocto_4.14.bbappend
 delete mode 100644 recipes-kernel/linux/linux-yocto_4.15.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_4.12.bbappend b/recipes-kernel/linux/linux-yocto_%.bbappend
similarity index 100%
rename from recipes-kernel/linux/linux-yocto_4.12.bbappend
rename to recipes-kernel/linux/linux-yocto_%.bbappend
diff --git a/recipes-kernel/linux/linux-yocto_4.14.bbappend b/recipes-kernel/linux/linux-yocto_4.14.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-kernel/linux/linux-yocto_4.14.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-kernel/linux/linux-yocto_4.15.bbappend b/recipes-kernel/linux/linux-yocto_4.15.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-kernel/linux/linux-yocto_4.15.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
-- 
2.11.0


