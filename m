Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E73AE0084C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Jan 2014 06:10:31 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2014 06:06:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,613,1384329600"; d="scan'208";a="462306464"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2014 06:10:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  6 Jan 2014 14:09:52 +0000
Message-Id: <92571b9fd17b8f01394b9fd1a219907bec18fd9c.1389006438.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
Subject: [meta-openstack][PATCH 8/9] python-markupsafe: add missing python module dependencies
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
X-List-Received-Date: Mon, 06 Jan 2014 14:10:31 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb b/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
index adebb46..fc14a51 100644
--- a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
+++ b/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
@@ -15,3 +15,6 @@ SRC_URI[sha256sum] = "b7d5d688bdd345bfa897777d297756688cf02e1b3742c56885e2e5c2b9
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+RDEPENDS_${PN} += "python-re"
+
-- 
1.8.1.2


