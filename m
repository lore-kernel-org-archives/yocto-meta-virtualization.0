Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.1359.1582228709973918798
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 11:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: nhartman@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01KJwSA8013616
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 20 Feb 2020 11:58:28 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0; Thu, 20 Feb 2020
 11:58:28 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21149)	id 79844900C1F;
 Thu, 20 Feb 2020 11:58:28 -0800 (PST)
From: "Nathan Hartman" <hnathan918@gmail.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nathan Hartman <hnathan918@gmail.com>
Subject: [meta-virtualization][m-c-s][PATCH 2/8] Initial concurrent-ruby, tzinfo and tzinfo-data ruby recipes
Date: Thu, 20 Feb 2020 11:58:00 -0800
Message-ID: <20200220195806.173460-2-hnathan918@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220195806.173460-1-hnathan918@gmail.com>
References: <20200220195806.173460-1-hnathan918@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
---
 ...emoved-check-for-concurrent_ruby.jar.patch | 26 +++++++++++++++++++
 .../ruby/concurrent-ruby_1.1.6.bb             | 12 +++++++++
 .../ruby/tzinfo-data_1.2019.3.bb              | 11 ++++++++
 .../recipes-devtools/ruby/tzinfo_2.0.1.bb     | 13 ++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/ruby/concurrent-ruby/0001-Removed-check-for-concurrent_ruby.jar.patch
 create mode 100644 meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
 create mode 100644 meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
 create mode 100644 meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb

diff --git a/meta-openstack/recipes-devtools/ruby/concurrent-ruby/0001-Removed-check-for-concurrent_ruby.jar.patch b/meta-openstack/recipes-devtools/ruby/concurrent-ruby/0001-Removed-check-for-concurrent_ruby.jar.patch
new file mode 100644
index 0000000..777dc31
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/concurrent-ruby/0001-Removed-check-for-concurrent_ruby.jar.patch
@@ -0,0 +1,26 @@
+From becf55b5d1ffe7a2856e0c4b240d08a90b2ed573 Mon Sep 17 00:00:00 2001
+From: Nathan Hartman <nathan.hartman@windriver.com>
+Date: Thu, 20 Feb 2020 13:10:02 -0500
+Subject: [PATCH] Removed jar file check
+
+---
+ concurrent-ruby.gemspec | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/concurrent-ruby.gemspec b/concurrent-ruby.gemspec
+index ad5d0489..1b2aa04e 100644
+--- a/concurrent-ruby.gemspec
++++ b/concurrent-ruby.gemspec
+@@ -16,8 +16,7 @@ Gem::Specification.new do |s|
+   s.files            = [*Dir['lib/concurrent-ruby/**/*.rb'] & git_files,
+                         *Dir['ext/concurrent-ruby/**/*'] & git_files,
+                         'Rakefile',
+-                        'Gemfile',
+-                        'lib/concurrent-ruby/concurrent/concurrent_ruby.jar'
++                        'Gemfile'
+   ]
+   s.extra_rdoc_files = Dir['README*', 'LICENSE*', 'CHANGELOG*']
+   s.require_paths    = ['lib/concurrent-ruby']
+-- 
+2.20.1
+
diff --git a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
new file mode 100644
index 0000000..a328203
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Modern concurrency tools including agents, futures, promises, thread pools, supervisors, and more. Inspired by Erlang, Clojure, Scala, Go, Java, JavaScript, and classic concurrency patterns."
+HOMEPAGE = "http://www.concurrent-ruby.com"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fde65ae93d18826f70c6fe125aa04297"
+
+SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6\
+	   file://0001-Removed-check-for-concurrent_ruby.jar.patch"
+
+S = "${WORKDIR}/git"
+
+inherit ruby
diff --git a/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb b/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
new file mode 100644
index 0000000..5fb6005
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
@@ -0,0 +1,11 @@
+SUMMARY = "TZInfo::Data - Timezone Data for TZInfo"
+HOMEPAGE = "https://tzinfo.github.io/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c326926e773a4e99e89820f5d8a0966f"
+
+SRC_URI = "git://github.com/tzinfo/tzinfo-data.git;protocol=https;tag=v1.2019.3"
+
+S = "${WORKDIR}/git"
+
+inherit ruby
diff --git a/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb b/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
new file mode 100644
index 0000000..2ea1f2d
--- /dev/null
+++ b/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "TZInfo - Ruby Timezone Library"
+HOMEPAGE = "https://tzinfo.github.io/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c326926e773a4e99e89820f5d8a0966f"
+
+SRC_URI = "git://github.com/tzinfo/tzinfo.git;protocol=https;tag=v2.0.1"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "concurrent-ruby"
+
+inherit ruby
-- 
2.17.1

