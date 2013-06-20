Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C8F8E00348
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Jun 2013 10:25:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5KHP5RH010156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Jun 2013 10:25:06 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 20 Jun 2013 10:25:05 -0700
From: Joe Slater <jslater@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 20 Jun 2013 10:25:05 -0700
Message-ID: <1371749105-24841-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1371749105-24841-1-git-send-email-jslater@windriver.com>
References: <1371749105-24841-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Cc: joe.slater@windriver.com
Subject: [PATCH 2/2] irqbalance: disable numa by default
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
X-List-Received-Date: Thu, 20 Jun 2013 17:25:08 -0000
Content-Type: text/plain

Create a PACKAGECONFIG[] for numa.  This will disable it
by default.  The current behavior is auto-detect and will
vary depending on when numactl is built.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 recipes-extended/irqbalance/irqbalance.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
index c076913..789cc9b 100644
--- a/recipes-extended/irqbalance/irqbalance.inc
+++ b/recipes-extended/irqbalance/irqbalance.inc
@@ -24,6 +24,14 @@ inherit update-rc.d
 EXTRA_OECONF = "--program-transform-name= \
 	       "
 
+# let the recipes or appends define options
+#
+PACKAGECONFIG ?= ""
+
+# enable,disable,depends,rdepends
+#
+PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
+
 do_install () {
         oe_runmake 'DESTDIR=${D}' install
         install -d ${D}${sysconfdir}/init.d
-- 
1.7.3.4


