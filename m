Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 734FEE00A38; Fri,  7 Aug 2015 02:40:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81401E009FD
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Aug 2015 02:40:21 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99385963"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2015 17:43:46 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t779cOdf004526
	for <meta-virtualization@yoctoproject.org>;
	Fri, 7 Aug 2015 17:38:24 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Aug 2015 17:40:19 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 7 Aug 2015 17:40:12 +0800
Message-ID: <1438940412-2219-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH] json: upgrade 1.8.1 -> 1.8.3
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
X-List-Received-Date: Fri, 07 Aug 2015 09:40:25 -0000
Content-Type: text/plain

Dropped 0001-Dont-compile-extensions.patch, it is not needed anymore.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../ruby/json/0001-Dont-compile-extensions.patch     | 20 --------------------
 meta-openstack/recipes-devtools/ruby/json_git.bb     |  5 ++---
 2 files changed, 2 insertions(+), 23 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch

diff --git a/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch b/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
deleted file mode 100644
index 0c2f513..0000000
--- a/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From 8c6e4b688cc7feade17caa832f9304262025fd17 Mon Sep 17 00:00:00 2001
-From: Qian Lei <qianl.fnst@cn.fujitsu.com>
-Date: Tue, 27 Jan 2015 19:34:26 +0800
-Subject: [PATCH] Dont compile extensions
-
-Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
----
- json.gemspec | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json.gemspec b/json.gemspec
-index 75926b1..af7e9ca 100644
---- a/json.gemspec
-+++ b/json.gemspec
-@@ -13 +13 @@ Gem::Specification.new do |s|
--  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
-+#  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
--- 
-1.8.3.1
-
diff --git a/meta-openstack/recipes-devtools/ruby/json_git.bb b/meta-openstack/recipes-devtools/ruby/json_git.bb
index f738ece..a417798 100644
--- a/meta-openstack/recipes-devtools/ruby/json_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/json_git.bb
@@ -9,15 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aef161fe3c86f1a8d6c71d3b8c5655c5"
 
 PR = "r0"
 
-BPV = "1.8.1"
+BPV = "1.8.3"
 PV = "${BPV}"
-SRCREV = "92a96dea2b24b9c68856004d69491f46aedd0925"
+SRCREV = "db4c71a7701b95c30f945ee1536240920dcfdc17"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
     git://github.com/flori/json.git \
-    file://0001-Dont-compile-extensions.patch \
     "
 
 inherit ruby
-- 
1.8.4.2


