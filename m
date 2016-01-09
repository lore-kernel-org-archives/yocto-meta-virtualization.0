Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C50C5E00AB5; Sat,  9 Jan 2016 11:04:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C996E00AA8
	for <meta-virtualization@yoctoproject.org>;
	Sat,  9 Jan 2016 11:04:16 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u09J4GQw014462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 9 Jan 2016 11:04:16 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 9 Jan 2016 11:04:15 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 9 Jan 2016 14:04:14 -0500
Message-ID: <1452366255-8937-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 1/2] puppet: add puppetlabs stdlib module
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
X-List-Received-Date: Sat, 09 Jan 2016 19:04:19 -0000
Content-Type: text/plain

This module is used by many puppet modules so will be useful to have
to extend our puppet capabilities. Additionally it offers some useful
functionality such as the ability to append to a file.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../puppetlabs-stdlib/files/Add-gemspec.patch      | 35 ++++++++++++++++++++++
 .../puppetlabs-stdlib/puppetlabs-stdlib_git.bb     | 29 ++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 recipes-support/puppetlabs-stdlib/files/Add-gemspec.patch
 create mode 100644 recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb

diff --git a/recipes-support/puppetlabs-stdlib/files/Add-gemspec.patch b/recipes-support/puppetlabs-stdlib/files/Add-gemspec.patch
new file mode 100644
index 0000000..d959aeb
--- /dev/null
+++ b/recipes-support/puppetlabs-stdlib/files/Add-gemspec.patch
@@ -0,0 +1,35 @@
+From e23971fcc1425e06a11484e552fbc631c43f44d4 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 22 Dec 2015 11:05:22 -0500
+Subject: [PATCH] Add gemspec
+
+Started with an example from here
+http://guides.rubygems.org/make-your-own-gem/
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ puppetlabs-stdlib.gemspec | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+ create mode 100644 puppetlabs-stdlib.gemspec
+
+diff --git a/puppetlabs-stdlib.gemspec b/puppetlabs-stdlib.gemspec
+new file mode 100644
+index 0000000..6b7eee3
+--- /dev/null
++++ b/puppetlabs-stdlib.gemspec
+@@ -0,0 +1,12 @@
++Gem::Specification.new do |s|
++  s.name        = 'puppetlabs-stdlib'
++  s.version     = '4.10.0'
++  s.date        = '2015-12-15'
++  s.summary     = "Puppet Labs Standard Library module"
++  s.description = s.summary
++  s.authors     = ["Puppet Labs"]
++  s.email       = ''
++  s.files       = %w(LICENSE README.markdown Rakefile) + Dir.glob('{lib,spec}/**/*')
++  s.homepage    = 'https://github.com/puppetlabs/puppetlabs-stdlib'
++  s.license     = 'Apache 2.0'
++end
+-- 
+2.1.4
+
diff --git a/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb b/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
new file mode 100644
index 0000000..2d3d9c2
--- /dev/null
+++ b/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Puppet Labs Standard Library module"
+HOMEPAGE = "https://github.com/puppetlabs/puppetlabs-stdlib"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=38a048b9d82e713d4e1b2573e370a756"
+
+PV = "4.10.0"
+SRCREV = "0b4822be3d2242e83c28ab7fed6c5817adc322d5"
+
+SRC_URI = " \
+    git://github.com/puppetlabs/puppetlabs-stdlib.git;branch=master \
+    file://Add-gemspec.patch \
+"
+
+inherit ruby
+
+S="${WORKDIR}/git"
+
+DEPENDS += " \
+        ruby \
+        facter \
+"
+
+RDEPENDS_${PN} += " \
+        ruby \
+        facter \
+        puppet \
+"
+
+RUBY_INSTALL_GEMS = "puppetlabs-stdlib-${PV}.gem"
-- 
2.1.4


