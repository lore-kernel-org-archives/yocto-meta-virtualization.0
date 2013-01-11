Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F054E006D2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 08:28:43 -0800 (PST)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2013 08:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,453,1355126400"; d="scan'208";a="190221052"
Received: from mihai-vostro-460 (HELO localhost.localdomain) ([10.237.105.140])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jan 2013 08:28:41 -0800
From: Mihai Prica <mihai.prica@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 11 Jan 2013 18:29:05 +0200
Message-Id: <1357921745-18046-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] ebtables: Fixed typo in RRECOMMENDS
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
X-List-Received-Date: Fri, 11 Jan 2013 16:28:43 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 recipes-extended/ebtables/ebtables_2.0.9-2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/ebtables/ebtables_2.0.9-2.bb b/recipes-extended/ebtables/ebtables_2.0.9-2.bb
index 15213cb..66c7b95 100644
--- a/recipes-extended/ebtables/ebtables_2.0.9-2.bb
+++ b/recipes-extended/ebtables/ebtables_2.0.9-2.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/ebtables-v${PV}"
 ASNEEDED_pn-${PN} = ""
 
 #Load the necessary kernel modules
-RECOMMENDS_${PN} += "kernel-module-ebtables \
+RRECOMMENDS_${PN} += "kernel-module-ebtables \
                      kernel-module-ebtable-nat \
                      kernel-module-ebtable-filter \
                      kernel-module-ebtable_broute \
-- 
1.7.9.5


