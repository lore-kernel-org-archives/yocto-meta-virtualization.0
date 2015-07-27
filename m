Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3938CE00984; Sun, 26 Jul 2015 19:31:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68EBCE00530
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Jul 2015 19:31:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98910989"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 10:34:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R2TPZ8020865
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jul 2015 10:29:25 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 10:31:15 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 Jul 2015 10:30:54 +0800
Message-ID: <1437964261-1851-2-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 1/8] chef-zero: upgrade 2.0.2 -> 4.2.3
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
X-List-Received-Date: Mon, 27 Jul 2015 02:31:23 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/chef-zero_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/chef-zero_git.bb b/meta-openstack/recipes-devtools/ruby/chef-zero_git.bb
index 2f43fb1..1ade265 100644
--- a/meta-openstack/recipes-devtools/ruby/chef-zero_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/chef-zero_git.bb
@@ -14,11 +14,9 @@ you start it."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
-PR = "r0"
-
-BPV = "2.0.2"
+BPV = "4.2.3"
 PV = "${BPV}"
-SRCREV = "1c87a463637b3d0c58755e2362cc8ef35b6da1fd"
+SRCREV = "28fe2928469885b0138de4d4270c6eccac8ab482"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.2


