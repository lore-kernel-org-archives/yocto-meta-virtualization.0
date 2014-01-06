Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7B03E00852
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Jan 2014 06:10:32 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2014 06:06:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,613,1384329600"; d="scan'208";a="462306476"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2014 06:10:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  6 Jan 2014 14:09:53 +0000
Message-Id: <5eb0fda31e7f000523572f68739275c537f71555.1389006438.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
Subject: [meta-openstack][PATCH 9/9] python-werkzeug: add missing python module dependencies
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
X-List-Received-Date: Mon, 06 Jan 2014 14:10:32 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb b/meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb
index c550ad0..2d160b9 100644
--- a/meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb
+++ b/meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb
@@ -15,3 +15,6 @@ SRC_URI[sha256sum] = "c1baf7a3e8be70f34d931ee173283f406877bd3d17f372bbe82318a5b3
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
+
+RDEPENDS_${PN} += "python-io python-datetime python-email python-zlib python-pkgutil python-html python-shell python-pprint python-subprocess python-netserver"
+
-- 
1.8.1.2


