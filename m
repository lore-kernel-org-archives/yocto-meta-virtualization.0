Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8ABFE00AAA; Sat,  9 Jan 2016 11:04:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74825E00911
	for <meta-virtualization@yoctoproject.org>;
	Sat,  9 Jan 2016 11:04:17 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u09J4H7M012460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 9 Jan 2016 11:04:17 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 9 Jan 2016 11:04:16 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Sat, 9 Jan 2016 14:04:15 -0500
Message-ID: <1452366255-8937-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1452366255-8937-1-git-send-email-mark.asselstine@windriver.com>
References: <1452366255-8937-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 2/2] puppet: add new recipe for puppet-vswitch module
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

There are several puppet modules that provide functionality to
interact with vSwitches, such as OpenVSwitch. This one is one of the
more popular and is an officially sanctioned puppet module so using
this one for the time being.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../puppet-vswitch/files/Add-gemspec.patch         | 35 ++++++++++++++++++++++
 .../puppet-vswitch/puppet-vswitch_git.bb           | 32 ++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 recipes-support/puppet-vswitch/files/Add-gemspec.patch
 create mode 100644 recipes-support/puppet-vswitch/puppet-vswitch_git.bb

diff --git a/recipes-support/puppet-vswitch/files/Add-gemspec.patch b/recipes-support/puppet-vswitch/files/Add-gemspec.patch
new file mode 100644
index 0000000..2216c3b
--- /dev/null
+++ b/recipes-support/puppet-vswitch/files/Add-gemspec.patch
@@ -0,0 +1,35 @@
+From 66ffd1621d30b3fe9ccbc0a7d21319b351833afb Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 17 Dec 2015 14:06:18 -0500
+Subject: [PATCH] Add gemspec
+
+Started with an example from here
+http://guides.rubygems.org/make-your-own-gem/
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ puppet-vswitch.gemspec | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+ create mode 100644 puppet-vswitch.gemspec
+
+diff --git a/puppet-vswitch.gemspec b/puppet-vswitch.gemspec
+new file mode 100644
+index 0000000..eb4c44e
+--- /dev/null
++++ b/puppet-vswitch.gemspec
+@@ -0,0 +1,12 @@
++Gem::Specification.new do |s|
++  s.name        = 'puppet-vswitch'
++  s.version     = '3.0.0'
++  s.date        = '2015-11-27'
++  s.summary     = "Puppet provider for virtual switches."
++  s.description = s.summary
++  s.authors     = ["Puppet Labs"]
++  s.email       = ''
++  s.files       = %w(LICENSE README.md Rakefile) + Dir.glob('{lib,spec}/**/*')
++  s.homepage    = 'https://github.com/openstack/puppet-vswitch'
++  s.license     = 'Apache 2.0'
++end
+-- 
+2.1.4
+
diff --git a/recipes-support/puppet-vswitch/puppet-vswitch_git.bb b/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
new file mode 100644
index 0000000..86922ae
--- /dev/null
+++ b/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Puppet provider for virtual switches."
+HOMEPAGE = "https://github.com/openstack/puppet-vswitch"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+PV = "3.0.0"
+SRCREV = "c374840910c823f7669cf2e1229c7df7192ae880"
+
+SRC_URI = " \
+    git://github.com/openstack/puppet-vswitch.git;branch=master \
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
+RUBY_INSTALL_GEMS = "puppet-vswitch-${PV}.gem"
+
+do_install_append() {
+}
-- 
2.1.4


