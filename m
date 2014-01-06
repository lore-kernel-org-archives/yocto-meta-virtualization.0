Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47162E0084D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Jan 2014 06:10:28 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2014 06:06:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,613,1384329600"; d="scan'208";a="462306446"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2014 06:10:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  6 Jan 2014 14:09:49 +0000
Message-Id: <b77b7291d18c7d5801a3fc6de486b1ca83bc890d.1389006438.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
Subject: [meta-openstack][PATCH 5/9] python-werkzeug: correct LICENSE
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
X-List-Received-Date: Mon, 06 Jan 2014 14:10:28 -0000

BSD-3-Clause is the license specified upstream.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb b/meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb
index 2aaff9a..c550ad0 100644
--- a/meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "The Swiss Army knife of Python web development"
 HOMEPAGE = "https://pypi.python.org/pypi/Werkzeug/"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad2e600a437b1b03d25b02df8c23ad1c"
 
 PR = "r0"
-- 
1.8.1.2


