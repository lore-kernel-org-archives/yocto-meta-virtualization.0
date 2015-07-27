Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC0B4E00A25; Sun, 26 Jul 2015 19:31:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A26EE00A26
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Jul 2015 19:31:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98910996"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 10:35:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R2TXh9020875
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jul 2015 10:29:33 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 10:31:23 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 27 Jul 2015 10:30:57 +0800
Message-ID: <1437964261-1851-5-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1437964261-1851-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 4/8] mime-types: upgrade 1.25.1 -> 2.5
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
X-List-Received-Date: Mon, 27 Jul 2015 02:31:26 -0000
Content-Type: text/plain

Update the checksum of Licence.rdoc, since file formate and date in it has been changed,
but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Li xin <lixin.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/ruby/mime-types_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/mime-types_git.bb b/meta-openstack/recipes-devtools/ruby/mime-types_git.bb
index d078b52..4216db1 100644
--- a/meta-openstack/recipes-devtools/ruby/mime-types_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/mime-types_git.bb
@@ -8,18 +8,18 @@ determine defined filename extensions for MIME types, or to use \
 filename extensions to look up the likely MIME type definitions."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://Licence.rdoc;md5=4e3affb3326cd205b1b30bc0e1e8fd66"
+LIC_FILES_CHKSUM = "file://Licence.rdoc;md5=ea44698b8e6523aa4ebc4e71e0ed43f1"
 
 PR = "r0"
 
-BPV = "1.25.1"
+BPV = "2.5"
 PV = "${BPV}"
-SRCREV = "6be836f59a041893cfc1c25668b3aa3552a7e334"
+SRCREV = "bc15d62118b59aabbc9cb6e5734b65bf3bc273f0"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://github.com/halostatue/mime-types.git;branch=v1-bug-fixes \
+    git://github.com/halostatue/mime-types.git \
     "
 
 inherit ruby
-- 
1.8.4.2


