Return-Path: <biannm@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16DDCE00873; Tue, 20 Jan 2015 16:39:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5CA0E00860
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Jan 2015 16:39:30 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56373872"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Jan 2015 08:33:51 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0L0af2T018239
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jan 2015 08:36:41 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 21 Jan 2015 08:37:21 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 21 Jan 2015 08:32:50 +0800
Message-ID: <1421800370-5737-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-openstack][PATCH] slop: checkout v3 branch to fix the following build error.
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
X-List-Received-Date: Wed, 21 Jan 2015 00:39:33 -0000
Content-Type: text/plain

slop: checkout v3 branch to fix the following build error.

  ERROR: Fetcher failure: Unable to find revision a009587ec2c0cf07b38bd8f0b59baa244fdbce51 in branch master even from upstream
  DEBUG: Python function base_do_fetch finished
  DEBUG: Python function do_fetch finished
  ERROR: Function failed: Fetcher failure for URL: 'git://github.com/leejarvis/slop.git'. Unable to fetch URL from any source.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/slop_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/ruby/slop_git.bb b/meta-openstack/recipes-devtools/ruby/slop_git.bb
index eff1bee..c77785f 100644
--- a/meta-openstack/recipes-devtools/ruby/slop_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/slop_git.bb
@@ -16,7 +16,7 @@ SRCREV = "a009587ec2c0cf07b38bd8f0b59baa244fdbce51"
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://github.com/leejarvis/slop.git \
+    git://github.com/leejarvis/slop.git;branch=v3 \
     "
 
 inherit ruby
-- 
1.9.1


