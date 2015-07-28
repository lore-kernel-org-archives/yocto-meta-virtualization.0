Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C98A8E00A3B; Tue, 28 Jul 2015 02:50:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1F65E00902
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jul 2015 02:50:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98979428"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jul 2015 17:53:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6S9mLtm024468
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Jul 2015 17:48:24 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 28 Jul 2015 17:50:14 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 28 Jul 2015 17:50:04 +0800
Message-ID: <1438077007-1836-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [PATCH 1/4] pry: upgrade 0.9.12.6 -> 0.10.1
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
X-List-Received-Date: Tue, 28 Jul 2015 09:50:21 -0000
Content-Type: text/plain

1) Modify rdoc-fixup-opt.banner-heredoc.patch,since the contents
has been changed.

2) Update the checksum of LICENSE,since the date in it has been changed,
but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../ruby/pry/rdoc-fixup-opt.banner-heredoc.patch   | 56 +++++++++++-----------
 meta-openstack/recipes-devtools/ruby/pry_git.bb    |  8 ++--
 2 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/pry/rdoc-fixup-opt.banner-heredoc.patch b/meta-openstack/recipes-devtools/ruby/pry/rdoc-fixup-opt.banner-heredoc.patch
index b6612c9..32adfb6 100644
--- a/meta-openstack/recipes-devtools/ruby/pry/rdoc-fixup-opt.banner-heredoc.patch
+++ b/meta-openstack/recipes-devtools/ruby/pry/rdoc-fixup-opt.banner-heredoc.patch
@@ -1,6 +1,6 @@
-From 55f81df0bb27c68d2a817cade5e0eb472acf24e5 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Wed, 14 May 2014 10:43:04 -0400
+From 40f78c9ae1c8f37e382d2da3498e1670c1a321dd Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sat, 25 Jul 2015 03:13:50 +0900
 Subject: [PATCH] rdoc: fixup opt.banner heredoc
 
 rdoc has some quirks with heredoc which in this case would
@@ -13,39 +13,41 @@ Fixup the heredoc to use a more standard format which is known
 not to mess up rdoc processing.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
- lib/pry/commands/ls.rb | 34 +++++++++++++++++-----------------
- 1 file changed, 17 insertions(+), 17 deletions(-)
+ lib/pry/commands/ls.rb | 35 ++++++++++++++++-------------------
+ 1 file changed, 16 insertions(+), 19 deletions(-)
 
 diff --git a/lib/pry/commands/ls.rb b/lib/pry/commands/ls.rb
-index 6ce49bb..b78f7e1 100644
+index 9f0e68f..eda7a53 100644
 --- a/lib/pry/commands/ls.rb
 +++ b/lib/pry/commands/ls.rb
-@@ -6,23 +6,23 @@ class Pry
+@@ -28,25 +28,22 @@ class Pry
+     description 'Show the list of vars and methods in the current scope.'
      command_options :shellwords => false, :interpolate => false
  
-     def options(opt)
--      opt.banner unindent <<-'BANNER'
--        Usage: ls [-m|-M|-p|-pM] [-q|-v] [-c|-i] [Object]
--               ls [-g] [-l]
+-    banner <<-'BANNER'
+-      Usage: ls [-m|-M|-p|-pM] [-q|-v] [-c|-i] [Object]
+-             ls [-g] [-l]
+-
+-      ls shows you which methods, constants and variables are accessible to Pry. By
+-      default it shows you the local variables defined in the current shell, and any
+-      public methods or instance variables defined on the current object.
 -
--        ls shows you which methods, constants and variables are accessible to Pry. By
--        default it shows you the local variables defined in the current shell, and any
--        public methods or instance variables defined on the current object.
+-      The colours used are configurable using Pry.config.ls.*_color, and the separator
+-      is Pry.config.ls.separator.
 -
--        The colours used are configurable using Pry.config.ls.*_color, and the separator
--        is Pry.config.ls.separator.
+-      Pry.config.ls.ceiling is used to hide methods defined higher up in the
+-      inheritance chain, this is by default set to [Object, Module, Class] so that
+-      methods defined on all Objects are omitted. The -v flag can be used to ignore
+-      this setting and show all methods, while the -q can be used to set the ceiling
+-      much lower and show only methods defined on the object or its direct class.
 -
--        Pry.config.ls.ceiling is used to hide methods defined higher up in the
--        inheritance chain, this is by default set to [Object, Module, Class] so that
--        methods defined on all Objects are omitted. The -v flag can be used to ignore
--        this setting and show all methods, while the -q can be used to set the ceiling
--        much lower and show only methods defined on the object or its direct class.
--      BANNER
-+      opt.banner = <<-EOF
+-      Also check out `find-method` command (run `help find-method`).
+-    BANNER
++    opt.banner = <<-EOF
 +Usage: ls [-m|-M|-p|-pM] [-q|-v] [-c|-i] [Object]
 +       ls [-g] [-l]
-+
 +ls shows you which methods, constants and variables are accessible to Pry. By
 +default it shows you the local variables defined in the current shell, and any
 +public methods or instance variables defined on the current object.
@@ -60,8 +62,8 @@ index 6ce49bb..b78f7e1 100644
 +much lower and show only methods defined on the object or its direct class.
 +  EOF
  
-       opt.on :m, :methods,   "Show public methods defined on the Object (default)"
-       opt.on :M, "instance-methods", "Show methods defined in a Module or Class"
+ 
+     def options(opt)
 -- 
-1.8.3.2
+1.8.4.2
 
diff --git a/meta-openstack/recipes-devtools/ruby/pry_git.bb b/meta-openstack/recipes-devtools/ruby/pry_git.bb
index 37d4497..a4eb63c 100644
--- a/meta-openstack/recipes-devtools/ruby/pry_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/pry_git.bb
@@ -7,18 +7,18 @@ for Ruby. It is written from scratch to provide a number of advanced \
 features."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7d1a6fbb73f604e1e716380490938bd4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dde93753687e16ab0c4669232fd27fd0"
 
 PR = "r0"
 
-BPV = "0.9.12.6"
+BPV = "0.10.1"
 PV = "${BPV}"
-SRCREV = "047788c4225b25bb0462e06715616964e4f0da15"
+SRCREV = "191dc519813402acd6db0d7f73e652ed61f8111f"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://github.com/pry/pry.git;branch=0-9-12-stable \
+    git://github.com/pry/pry.git \
     file://rdoc-fixup-opt.banner-heredoc.patch \
     "
 
-- 
1.8.4.2


