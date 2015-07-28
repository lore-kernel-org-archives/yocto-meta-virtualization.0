Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47605E00A71; Tue, 28 Jul 2015 02:50:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D64F7E00A49
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jul 2015 02:50:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98979451"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jul 2015 17:54:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6S9n4Z9024506
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jul 2015 17:49:04 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 28 Jul 2015 17:50:54 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 28 Jul 2015 17:50:07 +0800
Message-ID: <1438077007-1836-4-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 4/4] rest-client: upgrade 1.7.3 -> 2.0.0.rc1
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
X-List-Received-Date: Tue, 28 Jul 2015 09:50:59 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/rest-client_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/rest-client_git.bb b/meta-openstack/recipes-devtools/ruby/rest-client_git.bb
index 24006ae..923e9f2 100644
--- a/meta-openstack/recipes-devtools/ruby/rest-client_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/rest-client_git.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4c0cdd6bc54a36dbe54c0f2fa70797"
 
 PR = "r0"
 
-BPV = "1.7.3"
+BPV = "2.0.0.rc1"
 PV = "${BPV}"
-SRCREV = "988d5a81ff3081c1c6a3ab267e81a9fff94bd9e4"
+SRCREV = "40eddc184a7b3fe79f9b68f291e06df4c1fbcb0b"
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.2


