Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7423E00A70; Tue, 28 Jul 2015 02:50:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C6BEE00A31
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jul 2015 02:50:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98979449"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jul 2015 17:54:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6S9n17x024503
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jul 2015 17:49:01 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 28 Jul 2015 17:50:52 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 28 Jul 2015 17:50:06 +0800
Message-ID: <1438077007-1836-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 3/4] rack: upgrade 1.5.2 -> 1.6.3
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
X-List-Received-Date: Tue, 28 Jul 2015 09:50:54 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/rack_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/rack_git.bb b/meta-openstack/recipes-devtools/ruby/rack_git.bb
index 7d6ab81..41f01c5 100644
--- a/meta-openstack/recipes-devtools/ruby/rack_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/rack_git.bb
@@ -9,18 +9,18 @@ API for web servers, web frameworks, and software in between (the \
 so-called middleware) into a single method call."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=53d9c9f5c6fd716007e621045f6caa49"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ad65b6b9669213d45aa35a0730d58ac2"
 
 PR = "r0"
 
-BPV = "1.5.2"
+BPV = "1.6.3"
 PV = "${BPV}"
-SRCREV = "ac590d055c936bb9a618e955a690dc836c625211"
+SRCREV = "134d6218d0881d87ae6a522e88eafbddb6cd1bb7"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://github.com/rack/rack.git \
+    git://github.com/rack/rack.git;branch=1-6-stable \
     "
 
 inherit ruby
-- 
1.8.4.2


