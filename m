Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 018DAE00A76; Sun, 26 Jul 2015 19:31:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 666D4E00A25
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Jul 2015 19:31:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98910997"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 10:35:03 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R2TZ5j020880
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jul 2015 10:29:35 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 10:31:25 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 Jul 2015 10:30:58 +0800
Message-ID: <1437964261-1851-6-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 5/8] mixlib-config: upgrade 2.1.0 -> 2.2.1
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
X-List-Received-Date: Mon, 27 Jul 2015 02:31:28 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/mixlib-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/mixlib-config_git.bb b/meta-openstack/recipes-devtools/ruby/mixlib-config_git.bb
index 4ef1142..f58c15c 100644
--- a/meta-openstack/recipes-devtools/ruby/mixlib-config_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/mixlib-config_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
 PR = "r0"
 
-BPV = "2.1.0"
+BPV = "2.2.1"
 PV = "${BPV}"
-SRCREV = "c5e2dee2beb5fdd17442ff92e520f2ef01d17ee5"
+SRCREV = "d7bdd7c999e13a0bd67607011731a536323dd51c"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.2


