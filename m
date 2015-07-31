Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C332BE00B48; Thu, 30 Jul 2015 20:43:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EF05E00B1A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jul 2015 20:43:51 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99105146"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:47:21 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V3fuQk017987
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 Jul 2015 11:41:56 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 11:43:48 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 31 Jul 2015 11:43:35 +0800
Message-ID: <1438314217-3788-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438314217-3788-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438314217-3788-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 2/3] yajl-ruby: upgrade 1.2.0 -> 1.2.1
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
X-List-Received-Date: Fri, 31 Jul 2015 03:43:56 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb b/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
index ecc8d43..9d8ba54 100644
--- a/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=7edc7ac9885163399dacc69a54b1dc3a"
 
 PR = "r0"
 
-BPV = "1.2.0"
+BPV = "1.2.1"
 PV = "${BPV}"
-SRCREV = "fb61daad73340968badf6f84e41ec6931db2e87e"
+SRCREV = "d8a0b8d5c879b0810b43eaab241fb87b68c93453"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.2


