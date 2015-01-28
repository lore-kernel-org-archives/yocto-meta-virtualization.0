Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CF72E00823; Tue, 27 Jan 2015 18:04:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67CB3E007BA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jan 2015 18:04:02 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56728033"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jan 2015 10:00:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0S23ASj019487
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Jan 2015 10:03:10 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 28 Jan 2015 10:04:01 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 28 Jan 2015 10:03:35 +0800
Message-ID: <1422410616-4342-2-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1422410616-4342-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1422410616-4342-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH 1/2] json: Don't compile extensions
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
X-List-Received-Date: Wed, 28 Jan 2015 02:04:05 -0000
Content-Type: text/plain

Module mkmf is used to generate Makefile, but it uses native libraries
instead of target libraries. To avoid arch problem, we don't compile
the extension.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../ruby/json/0001-Dont-compile-extensions.patch     | 20 ++++++++++++++++++++
 meta-openstack/recipes-devtools/ruby/json_git.bb     |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch

diff --git a/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch b/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
new file mode 100644
index 0000000..0c2f513
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
@@ -0,0 +1,20 @@
+From 8c6e4b688cc7feade17caa832f9304262025fd17 Mon Sep 17 00:00:00 2001
+From: Qian Lei <qianl.fnst@cn.fujitsu.com>
+Date: Tue, 27 Jan 2015 19:34:26 +0800
+Subject: [PATCH] Dont compile extensions
+
+Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
+---
+ json.gemspec | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/json.gemspec b/json.gemspec
+index 75926b1..af7e9ca 100644
+--- a/json.gemspec
++++ b/json.gemspec
+@@ -13 +13 @@ Gem::Specification.new do |s|
+-  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
++#  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb"]
+-- 
+1.8.3.1
+
diff --git a/meta-openstack/recipes-devtools/ruby/json_git.bb b/meta-openstack/recipes-devtools/ruby/json_git.bb
index d3431c7..f738ece 100644
--- a/meta-openstack/recipes-devtools/ruby/json_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/json_git.bb
@@ -19,0 +20 @@ SRC_URI = " \
+    file://0001-Dont-compile-extensions.patch \
-- 
1.8.3.1


