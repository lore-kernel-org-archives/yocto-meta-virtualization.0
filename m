Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDCC7E00A38; Fri,  7 Aug 2015 02:17:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71EE4E009FD
	for <meta-virtualization@yoctoproject.org>;
	Fri,  7 Aug 2015 02:17:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99384657"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2015 17:20:49 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t779FQw4002786
	for <meta-virtualization@yoctoproject.org>;
	Fri, 7 Aug 2015 17:15:27 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 7 Aug 2015 17:17:21 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 7 Aug 2015 17:14:24 +0800
Message-ID: <1438938864-25610-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [m-c-s][PATCH] chef: upgrade 11.12.4->12.4.1
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
X-List-Received-Date: Fri, 07 Aug 2015 09:17:36 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../chef/chef/0001-chang-ksh-to-sh.patch           | 23 ++++++++++++++++++++++
 meta-openstack/recipes-support/chef/chef_git.bb    | 14 +++++++------
 2 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 meta-openstack/recipes-support/chef/chef/0001-chang-ksh-to-sh.patch

diff --git a/meta-openstack/recipes-support/chef/chef/0001-chang-ksh-to-sh.patch b/meta-openstack/recipes-support/chef/chef/0001-chang-ksh-to-sh.patch
new file mode 100644
index 0000000..b3d13fc
--- /dev/null
+++ b/meta-openstack/recipes-support/chef/chef/0001-chang-ksh-to-sh.patch
@@ -0,0 +1,23 @@
+From b819187d45984b4bc37aebc41570a7f4fff94b14 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Tue, 4 Aug 2015 03:56:28 +0900
+Subject: [PATCH] chang ksh to sh
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ spec/functional/assets/chefinittest | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spec/functional/assets/chefinittest b/spec/functional/assets/chefinittest
+index 79e064c..46a7c3b 100755
+--- a/spec/functional/assets/chefinittest
++++ b/spec/functional/assets/chefinittest
+@@ -1,4 +1,4 @@
+-#!/bin/ksh
++#!/bin/sh
+ 
+ function create_chef_txt {
+         touch /tmp/chefinittest.txt
+-- 
+1.8.4.2
+
diff --git a/meta-openstack/recipes-support/chef/chef_git.bb b/meta-openstack/recipes-support/chef/chef_git.bb
index c8a422b..86e4165 100644
--- a/meta-openstack/recipes-support/chef/chef_git.bb
+++ b/meta-openstack/recipes-support/chef/chef_git.bb
@@ -11,17 +11,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
 PR = "r0"
 
-#SRC_URI[md5sum] = "521d9184648b12e0ea331367d287314f"
-#SRC_URI[sha256sum] ="d00874468a4f9e43d6acb0d5238a50ebb4c79f17fd502741a0fc83d76eb253cf"
-
-BPV = "11.12.4"
+BPV = "12.4.1"
 PV = "${BPV}"
-SRCREV = "410af3e88cf9f0793c56363563be8fa173244d3a"
+SRCREV = "1dc20627aa5d742376269dc5b4d5c67f34d08008"
 
 S = "${WORKDIR}/git"
 
 SRC_URI = " \
-    git://github.com/opscode/chef.git;branch=11-stable \
+    git://github.com/opscode/chef.git;branch=12.4-stable \
+    file://0001-chang-ksh-to-sh.patch \
     "
 
 inherit ruby
@@ -61,10 +59,14 @@ RDEPENDS_${PN} += " \
         systemu \
         yajl-ruby \
         make \
+        bash \
         "
 
 RUBY_INSTALL_GEMS = "pkg/chef-${BPV}.gem"
 
+FILES_${PN} += "${libdir}/ruby/gems/2.2.0/build_info"
+FILES_${PN} += "${libdir}/ruby/gems/2.2.0/extensions"
+
 do_install_prepend() {
 	rake gem
 }
-- 
1.8.4.2


