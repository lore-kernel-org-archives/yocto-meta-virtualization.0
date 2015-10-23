Return-Path: <Rongqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 195FAE00B6A; Thu, 22 Oct 2015 19:19:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 3203 seconds by postgrey-1.32 at yocto-www;
	Thu, 22 Oct 2015 19:19:40 PDT
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27D4FE00B66
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Oct 2015 19:19:40 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9N1QH7l017560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 22 Oct 2015 18:26:17 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 22 Oct 2015 18:26:16 -0700
From: <rongqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 23 Oct 2015 09:17:44 +0800
Message-ID: <1445563064-19994-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] lxc: upgrade it to 1.1.4
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
X-List-Received-Date: Fri, 23 Oct 2015 02:19:44 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

V1.1.4 includes a fix for CVE-2015-1335:

lxc-start in lxc before 1.0.8 and 1.1.x before 1.1.4 allows local container
administrators to escape AppArmor confinement via a symlink attack on a (1)
mount target or (2) bind mount source.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1335

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 recipes-containers/lxc/{lxc_1.1.3.bb => lxc_1.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/lxc/{lxc_1.1.3.bb => lxc_1.1.4.bb} (97%)

diff --git a/recipes-containers/lxc/lxc_1.1.3.bb b/recipes-containers/lxc/lxc_1.1.4.bb
similarity index 97%
rename from recipes-containers/lxc/lxc_1.1.3.bb
rename to recipes-containers/lxc/lxc_1.1.4.bb
index e61aa6d..4006deb 100644
--- a/recipes-containers/lxc/lxc_1.1.3.bb
+++ b/recipes-containers/lxc/lxc_1.1.4.bb
@@ -36,8 +36,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
 	"
 
-SRC_URI[md5sum] = "197abb5a28ab0b689c737eb1951023fb"
-SRC_URI[sha256sum] = "933b87f773ea6213c912fcd25b8f24d66fb66d285b80797dac530a8b94b7d1ad"
+SRC_URI[md5sum] = "d33c4bd9c57755c0e2b0e2acbc3f171d"
+SRC_URI[sha256sum] = "8f072ea2001bc94389003d82a91902855edf16b609e06f0486a74e4b8973e5dc"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
1.9.1


