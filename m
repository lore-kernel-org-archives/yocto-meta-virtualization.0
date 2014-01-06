Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2460E0084F
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Jan 2014 06:10:24 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2014 06:06:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,613,1384329600"; d="scan'208";a="462306425"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2014 06:10:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  6 Jan 2014 14:09:47 +0000
Message-Id: <8b8179210f22a26fc77b7473b452620def0d9ad8.1389006438.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389006438.git.paul.eggleton@linux.intel.com>
References: <cover.1389006438.git.paul.eggleton@linux.intel.com>
Subject: [meta-openstack][PATCH 3/9] python-jinja2: correct LICENSE
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
X-List-Received-Date: Mon, 06 Jan 2014 14:10:24 -0000

BSD-3-Clause is the license specified upstream.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-openstack/recipes-devtools/python/python-jinja2_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.1.bb b/meta-openstack/recipes-devtools/python/python-jinja2_2.7.1.bb
index 091367f..4af17cb 100644
--- a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.1.bb
+++ b/meta-openstack/recipes-devtools/python/python-jinja2_2.7.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
 HOMEPAGE = "https://pypi.python.org/pypi/Jinja2"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
 
 PR = "r0"
-- 
1.8.1.2


