Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA98EE00B48; Thu, 30 Jul 2015 20:43:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21A2EE00B43
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jul 2015 20:43:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105149"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:47:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3fwAB017991
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 11:41:58 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:43:50 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 11:43:36 +0800
Message-ID: <1438314217-3788-3-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314217-3788-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314217-3788-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 3/3] yard: upgrade 0.8.7.3 -> 0.8.7.6
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
X-List-Received-Date: Fri, 31 Jul 2015 03:43:57 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/yard_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/yard_git.bb b/meta-openstack/recipes-devtools/ruby/yard_git.bb
index ff2a685..d523201 100644
--- a/meta-openstack/recipes-devtools/ruby/yard_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/yard_git.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b3e127de4b3f2e58562183d9aba9a7f6"
 
 PR = "r0"
 
-BPV = "0.8.7.3"
+BPV = "0.8.7.6"
 PV = "${BPV}"
-SRCREV = "b78dea29adafd937f1ca5e813a5269b62ffceba3"
+SRCREV = "d83194e1a09098ec5be28b616cde3b9a15380873"
 
 S = "${WORKDIR}/git"
 
@@ -25,4 +25,4 @@ SRC_URI = " \
 
 inherit ruby
 
-BBCLASSEXTEND = "native"
\ No newline at end of file
+BBCLASSEXTEND = "native"
-- 
1.8.4.2


