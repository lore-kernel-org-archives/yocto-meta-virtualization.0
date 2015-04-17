Return-Path: <Dmitry_Eremin@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B182E009CB; Fri, 17 Apr 2015 06:41:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 464A9E009C2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Apr 2015 06:41:04 -0700 (PDT)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yj6W0-0006gf-Fr from Dmitry_Eremin@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Fri, 17 Apr 2015 06:41:04 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Fri, 17 Apr 2015 14:41:03 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 17 Apr 2015 16:41:02 +0300
Message-ID: <1429278062-3255-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] conf: override SECURITY_CFLAGS for a set of recipes
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
X-List-Received-Date: Fri, 17 Apr 2015 13:41:08 -0000
Content-Type: text/plain

Some of recipes produce errors if the distro has enabled usage of
security_flags.inc file. Fix those errors (and QA warnings) by providing
an additional include file that is require'd from conf/layer.conf.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 conf/distro/include/virt_security_flags.inc | 5 +++++
 conf/layer.conf                             | 3 +++
 2 files changed, 8 insertions(+)
 create mode 100644 conf/distro/include/virt_security_flags.inc

diff --git a/conf/distro/include/virt_security_flags.inc b/conf/distro/include/virt_security_flags.inc
new file mode 100644
index 0000000..f4c288b
--- /dev/null
+++ b/conf/distro/include/virt_security_flags.inc
@@ -0,0 +1,5 @@
+# Build errors with the pie options enabled
+SECURITY_CFLAGS_pn-libvirt = "${SECURITY_NO_PIE_CFLAGS}"
+
+# This has text relco errors with the pie options enabled
+SECURITY_CFLAGS_pn-lxc = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/conf/layer.conf b/conf/layer.conf
index 7ae9d09..f5c1b1e 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -16,3 +16,6 @@ LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
 LAYERVERSION_virtualization-layer = "1"
 
 LAYERDEPENDS_virtualization-layer = "core networking-layer"
+
+# Override security flags
+require conf/distro/include/virt_security_flags.inc
-- 
2.1.4


