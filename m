Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F25D8E0146C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2013 08:10:46 -0700 (PDT)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Apr 2013 08:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,502,1363158000"; d="scan'208";a="228858461"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.150])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Apr 2013 08:10:44 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 18 Apr 2013 18:10:41 +0300
Message-Id: <1366297842-10846-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] iasl: Fixed broken URL
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
X-List-Received-Date: Thu, 18 Apr 2013 15:10:47 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-extended/iasl/iasl_20120215.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/iasl/iasl_20120215.bb b/recipes-extended/iasl/iasl_20120215.bb
index b48e380..e9c5fbe 100644
--- a/recipes-extended/iasl/iasl_20120215.bb
+++ b/recipes-extended/iasl/iasl_20120215.bb
@@ -7,7 +7,7 @@ PR="r1"
 
 DEPENDS="flex bison"
 
-SRC_URI="http://www.acpica.org/download/acpica-unix-${PV}.tar.gz"
+SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "324c89e5bb9002e2711e0494290ceacc"
 SRC_URI[sha256sum] = "b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456928e4e7da86578e5b8d"
-- 
1.7.9.5


