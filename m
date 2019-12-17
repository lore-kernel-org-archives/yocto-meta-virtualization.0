Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.1525.1576549749887427035
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Dec 2019 18:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.43, mailfrom: timothy.t.orling@linux.intel.com)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 18:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; 
   d="scan'208";a="227331107"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by orsmga002.jf.intel.com with ESMTP; 16 Dec 2019 18:29:09 -0800
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [meta-virtualization][PATCH] podman: upgrade 1.6.1 -> 1.6.2
Date: Mon, 16 Dec 2019 18:29:02 -0800
Message-Id: <20191217022902.12973-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lateest upstream is 1.6.4, but neither 1.6.3 nor 1.6.4
build cleanly.

Release notes:
https://github.com/containers/libpod/releases/tag/v1.6.2

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 recipes-containers/podman/podman_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 50d07ea..e73c028 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -24,7 +24,7 @@ python __anonymous() {
         raise bb.parse.SkipRecipe(msg)
 }
 
-SRCREV = "233d95f4f0a815f11d1c1ae9aba16781c4eb2700"
+SRCREV = "f3ffda1e08f19e9a6a88484136b5eed76533f21a"
 SRC_URI = " \
     git://github.com/containers/libpod.git;branch=master \
 "
@@ -36,7 +36,7 @@ GO_IMPORT = "import"
 
 S = "${WORKDIR}/git"
 
-PV = "1.6.1+git${SRCREV}"
+PV = "1.6.2+git${SRCREV}"
 
 PACKAGES =+ "${PN}-contrib"
 
-- 
2.24.0

