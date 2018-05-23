Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 252A1E00B57; Wed, 23 May 2018 12:03:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93C32E009C8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 12:03:41 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4NJ35JU012137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 May 2018 12:03:30 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 May 2018 12:03:07 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 23 May 2018 15:02:57 -0400
Message-ID: <1527102177-10064-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] layer.conf: match layer dependencies as documented in the layer README
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
X-List-Received-Date: Wed, 23 May 2018 19:03:42 -0000
Content-Type: text/plain

Several required layer dependencies have been added to the layer
README but didn't have corresponding entries added to
LAYERDEPENDS. Ensure these match.

The 'selinux' layer dependency, is conditional on the 'xen'
DISTRO_FEATURE but I see no way to make a conditional LAYERDEPENDS so
this is left off for now.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 conf/layer.conf | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index fa2e015..eaef1b7 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -15,7 +15,13 @@ LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
 # cause compatibility issues with other layers
 LAYERVERSION_virtualization-layer = "1"
 LAYERSERIES_COMPAT_virtualization-layer = "sumo"
-LAYERDEPENDS_virtualization-layer = "core networking-layer"
+LAYERDEPENDS_virtualization-layer = " \
+    core \
+    openembedded-layer \
+    networking-layer \
+    filesystems-layer \
+    meta-python \
+"
 
 # Override security flags
 require conf/distro/include/virt_security_flags.inc
-- 
2.7.4


