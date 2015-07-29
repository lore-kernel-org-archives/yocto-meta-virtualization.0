Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D201EE00A80; Wed, 29 Jul 2015 03:05:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3787FE009EB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Jul 2015 03:05:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99027770"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 18:08:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6TA3SpB017084
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 Jul 2015 18:03:28 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 18:05:19 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 29 Jul 2015 18:05:13 +0800
Message-ID: <1438164314-3363-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 1/2] slop: upgrade 3.5.0 -> 4.2.0
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
X-List-Received-Date: Wed, 29 Jul 2015 10:05:24 -0000
Content-Type: text/plain

Update the checksum of LICENSE, since the date in it has been changed,
but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/slop_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/slop_git.bb b/meta-openstack/recipes-devtools/ruby/slop_git.bb
index c77785f..043284c 100644
--- a/meta-openstack/recipes-devtools/ruby/slop_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/slop_git.bb
@@ -5,18 +5,18 @@ SUMMARY = "A simple option parser with an simple syntax and API."
 DESCRIPTION = "A simple option parser with an simple syntax and API."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=66a8da2a5bee25570ffc35aa5426d176"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40575ded674b04c083ce6818c01f0282"
 
 PR = "r0"
 
-BPV = "3.5.0"
+BPV = "4.2.0"
 PV = "${BPV}"
-SRCREV = "a009587ec2c0cf07b38bd8f0b59baa244fdbce51"
+SRCREV = "50c4d5a6553c9d0b78dee35a092ea3a40c136fa1"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://github.com/leejarvis/slop.git;branch=v3 \
+    git://github.com/leejarvis/slop.git \
     "
 
 inherit ruby
-- 
1.8.4.2


