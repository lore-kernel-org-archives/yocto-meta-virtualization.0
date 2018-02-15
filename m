Return-Path: <psaavedra@igalia.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4288AE00E3D; Thu, 15 Feb 2018 14:33:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89C86E00CF1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Feb 2018 14:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=osf7sfmYvbFawi9oEYzgpKlICv5AzoSsOkBmQ8vICOc=; 
	b=eLW3r4Xt/8S5hkT3rz0SGtRQnAbIO0g4YnaBYA8rBCwj515dIu5voCloGtYqa666a4SxewmuVEFl+TjHoFX9/wzgaphDjXSuVjdPxp7x7ppz1FoF9/KXbhjTkBqfPpP19x8ZBqNvb14ivksYiTBYwiJ91aEkOkIgTzQUcrHM//Gp5MJwhZh0h9TA2ga4cSbluWmAQ9UEbtZT+I8mu3L5/h9wjJfOZI5PLAZ8W1zuc55NlCxV0tA05vsrhR2mFXEx4svwXxaD5FYvWtvdCjx9IOUP41tjcx9phuMJFbDFnEjP8zuLWFcKPtRSEpBFQS2Cziowu7qpgCA2J/F0mq805g==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1emS5u-0006eD-JD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Feb 2018 23:33:34 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 15 Feb 2018 23:33:24 +0100
Message-Id: <20180215223324.26179-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <307b5fbe-b22a-dc01-c117-ad846a93fd22@igalia.com>
References: <307b5fbe-b22a-dc01-c117-ad846a93fd22@igalia.com>
MIME-Version: 1.0
Subject: [PATCH v2] Puppet upstream upgrade to 5.4.0
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
X-List-Received-Date: Thu, 15 Feb 2018 22:33:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Upstream to 5.4.0 [1][2][3][4][5]
* Puppet 5 recipe is the official Puppet agent version
  with support for Ruby 2.4 [6]
* Updated reference versions in the README file
* Hiera isn’t separate from Puppet anymore [7].
  * Do not install extlookup2hiera, it has been removed upstream
  * Hiera began as an independent Ruby library that worked with
    Puppet. Over time, it became a requirement and was even included
    in the puppet-agent package, but it was limited by its original
    design.
* Removed puppet_3.7.3.bb recipe
* Drop the superseded patches
* Added init script
* Added systemd script

Facter 2.5 upstream release

* Puppet 5 relays on Facter 3.10. Facter 3.10 reworks Facter 2.X
  code [8] in native code instead of Ruby gem. Facter 2.5 is
  still compatible with 5 series to help with Puppet 5 testing.

* facter before 2.4.0 uses a deprecated Puppet settings API
  making `facter --puppet` no longer work with Puppet 4 or
  higher [9].

* Community, partner, and some of Puppet's internal testing
  workflows continue to use (ruby) Facter 2.4 [10], instead of
  native Facter 3, which is not (yet) available as a gem.

* To help with Puppet 5 testing, we need to do a maintenance
  release in the Facter 2 series.

[1] https://docs.puppet.com/puppet/5.0/release_notes.html
[2] https://docs.puppet.com/puppet/5.1/release_notes.html
[3] https://docs.puppet.com/puppet/5.2/release_notes.html
[4] https://docs.puppet.com/puppet/5.3/release_notes.html
[5] https://docs.puppet.com/puppet/5.4/release_notes.html
[6] https://puppet.com/docs/puppet/4.10/hiera_intro.html
[7] https://tickets.puppetlabs.com/browse/PA-1107
[8] https://github.com/puppetlabs/facter/tree/3.10.x
[9] http://metadata.ftp-master.debian.org/changelogs/main/p/puppet/puppet_5.1.0-1_changelog
[10] https://tickets.puppetlabs.com/browse/FACT-1630

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 .../facter/{facter_2.3.0.bb => facter_2.5.0.bb}    |  4 +-
 recipes-support/puppet/README                      | 12 +++-
 ...uplicate-key-which-ruby-2.2-complains-abo.patch | 30 ---------
 .../puppet/puppet/add_puppet_gemspec.patch         |  2 +-
 ...aint-Change-spec-test-to-pass-on-ruby-2.2.patch | 37 -----------
 recipes-support/puppet/puppet/puppet.init          | 72 ++++++++++++++++++++++
 recipes-support/puppet/puppet/puppet.service       | 10 +++
 ..._yaml-syck-isn-t-available-for-Ruby-2.0.0.patch | 35 -----------
 .../puppet/{puppet_3.7.3.bb => puppet_5.4.0.bb}    | 30 ++++++---
 9 files changed, 114 insertions(+), 118 deletions(-)
 rename recipes-support/facter/{facter_2.3.0.bb => facter_2.5.0.bb} (74%)
 delete mode 100644 recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch
 delete mode 100644 recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-ruby-2.2.patch
 create mode 100644 recipes-support/puppet/puppet/puppet.init
 create mode 100644 recipes-support/puppet/puppet/puppet.service
 delete mode 100644 recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch
 rename recipes-support/puppet/{puppet_3.7.3.bb => puppet_5.4.0.bb} (51%)

diff --git a/recipes-support/facter/facter_2.3.0.bb b/recipes-support/facter/facter_2.5.0.bb
similarity index 74%
rename from recipes-support/facter/facter_2.3.0.bb
rename to recipes-support/facter/facter_2.5.0.bb
index b5a46e7..ef04e93 100644
--- a/recipes-support/facter/facter_2.3.0.bb
+++ b/recipes-support/facter/facter_2.5.0.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     http://downloads.puppetlabs.com/facter/facter-${PV}.tar.gz \
     file://add_facter_gemspec.patch \
 "
-SRC_URI[md5sum] = "7bb6dbeaef86cd79300b4723c06932bc"
-SRC_URI[sha256sum] = "a91ea915b276172e002a8670684e5c6be7df1dfdd55db6937d27fffad70c5e51"
+SRC_URI[md5sum] = "58b6b609f19d1c146c600c4dc6e7fa39"
+SRC_URI[sha256sum] = "47ccbfb8a69e4d48c3c88e47ac1ae754fcc583d4090fa9d838461b3ede7b07cb"
 
 inherit ruby
 
diff --git a/recipes-support/puppet/README b/recipes-support/puppet/README
index 2de808a..8befb15 100644
--- a/recipes-support/puppet/README
+++ b/recipes-support/puppet/README
@@ -6,11 +6,17 @@ state of your IT infrastructure, then automatically enforces the correct state.
 
 Basic Requirements
 ------------------------
-Ruby 1.8.7 or later
-Facter 1.7.0 or later
-Hiera 1.0 or later
+Ruby 2.4 or later
+Facter 3.10.0 or later
+Hiera 5 or later [1]
 The json gem (any modern version)
 
+[1] Hiera isn’t separate from Puppet anymore
+    Hiera began as an independent Ruby library that worked with Puppet.
+    Over time, it became a requirement and was even included in the
+    puppet-agent package, but it was limited by its original design.
+
+    https://puppet.com/docs/puppet/4.10/hiera_intro.html
 
 Simple Demo
 ------------------------
diff --git a/recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch b/recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch
deleted file mode 100644
index 696c642..0000000
--- a/recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 05dad9b1d30a8ff1e8e4a06bc5eaf0b19dab43e2 Mon Sep 17 00:00:00 2001
-From: Jasper Lievisse Adriaanse <jasper@humppa.nl>
-Date: Fri, 24 Jul 2015 20:18:08 +0200
-Subject: [PATCH] (MAINT) Fix duplicate key which ruby 2.2 complains about
-
-commit 05dad9b1d30a8ff1e8e4a06bc5eaf0b19dab43e2 from
-https://github.com/puppetlabs/puppet.git
-
----
- lib/puppet/defaults.rb | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/lib/puppet/defaults.rb b/lib/puppet/defaults.rb
-index eeefefa..b591697 100644
---- a/lib/puppet/defaults.rb
-+++ b/lib/puppet/defaults.rb
-@@ -486,10 +486,6 @@ module Puppet
-       :default    => "stomp",
-       :desc       => "Which type of queue to use for asynchronous processing.",
-     },
--    :queue_type => {
--      :default    => "stomp",
--      :desc       => "Which type of queue to use for asynchronous processing.",
--    },
-     :queue_source => {
-       :default    => "stomp://localhost:61613/",
-       :desc       => "Which type of queue to use for asynchronous processing.  If your stomp server requires
--- 
-2.1.4
-
diff --git a/recipes-support/puppet/puppet/add_puppet_gemspec.patch b/recipes-support/puppet/puppet/add_puppet_gemspec.patch
index a5c8e3b..50c215c 100644
--- a/recipes-support/puppet/puppet/add_puppet_gemspec.patch
+++ b/recipes-support/puppet/puppet/add_puppet_gemspec.patch
@@ -17,7 +17,7 @@ diff -urN puppet-3.7.3_ori/puppet.gemspec puppet-3.7.3/puppet.gemspec
 +  s.license = 'Apache 2.0'
 +
 +  s.bindir       = 'bin'
-+  s.executables  = ['puppet', 'extlookup2hiera']
++  s.executables  = ['puppet']
 +  s.require_path = 'lib'
 +  s.files = %w(LICENSE README.md Rakefile) + Dir.glob('{lib,spec}/**/*')
 +end
diff --git a/recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-ruby-2.2.patch b/recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-ruby-2.2.patch
deleted file mode 100644
index 73e1769..0000000
--- a/recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-ruby-2.2.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d183826136ca77847da5f3e460f2e460faabc5be Mon Sep 17 00:00:00 2001
-From: Kylo Ginsberg <kylo@puppetlabs.com>
-Date: Mon, 22 Dec 2014 10:11:38 -0800
-Subject: [PATCH] (maint) Change spec test to pass on ruby 2.2
-
-commit d183826136ca77847da5f3e460f2e460faabc5be from
-https://github.com/puppetlabs/puppet.git
-
-Prior to this change, this spec test failed on ruby 2.2.0-rc1 with:
-
-     Failure/Error: Time.stubs(:now).returns(Time.parse("2011-01-06 12:00:00 UTC"))
-     NoMethodError:
-       undefined method `utc_offset' for nil:NilClass
-
-I didn't track down the root cause of this failure, but just
-normalized this stub to use Time.utc, which (along with Time.local)
-is the more common way of stubbing Time objects in the codebase.
----
- spec/unit/reports/store_spec.rb | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/spec/unit/reports/store_spec.rb b/spec/unit/reports/store_spec.rb
-index 7f94f7d..f56eccd 100755
---- a/spec/unit/reports/store_spec.rb
-+++ b/spec/unit/reports/store_spec.rb
-@@ -24,7 +24,7 @@ describe processor do
-     end
- 
-     it "should write the report to the file in YAML" do
--      Time.stubs(:now).returns(Time.parse("2011-01-06 12:00:00 UTC"))
-+      Time.stubs(:now).returns(Time.utc(2011,01,06,12,00,00))
-       @report.process
- 
-       File.read(File.join(Puppet[:reportdir], @report.host, "201101061200.yaml")).should == @report.to_yaml
--- 
-2.1.4
-
diff --git a/recipes-support/puppet/puppet/puppet.init b/recipes-support/puppet/puppet/puppet.init
new file mode 100644
index 0000000..64ab32e
--- /dev/null
+++ b/recipes-support/puppet/puppet/puppet.init
@@ -0,0 +1,72 @@
+#!/bin/bash
+#
+# chkconfig: 35 20 80
+# description: The puppet agent connects to a puppet master, requests a
+#              catalog of resources, and configures the local system.
+#
+
+# Get function from functions library
+. /etc/init.d/functions
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/bin/puppet
+DAEMON_OPTS="agent --server master --no-daemonize"
+NAME="agent"
+DESC="puppet agent"
+PIDFILE="/var/run/${NAME}.pid"
+PID=`test -f $PIDFILE && cat $PIDFILE`
+RETVAL=0
+
+test -x $DAEMON || exit 0
+
+[ -r /etc/default/puppet ] && . /etc/default/puppet
+
+reload_puppet_agent() {
+    start-stop-daemon --stop --quiet --signal HUP --pidfile $PIDFILE
+}
+
+start_puppet_agent() {
+    start-stop-daemon --start --quiet --pidfile $PIDFILE \
+        --startas $DAEMON -- $NAME $DAEMON_OPTS
+}
+
+stop_puppet_agent() {
+    start-stop-daemon --stop --retry TERM/10/KILL/5 --quiet --oknodo --pidfile $PIDFILE
+}
+
+status_puppet_agent() {
+    status_of_proc -p "${PIDFILE}" "${DAEMON}" "${NAME}"
+}
+
+case "$1" in
+    start)
+        echo -n "Starting $DESC"
+        start_puppet_agent
+        log_end_msg $?
+        ;;
+    stop)
+        echo -n "Stopping $DESC"
+        stop_puppet_agent
+        log_end_msg $?
+        ;;
+    reload)
+        echo -n "Reloading $DESC"
+        reload_puppet_agent
+        log_end_msg $?
+        ;;
+    status)
+        status_puppet_agent
+        ;;
+    restart|force-reload)
+        echo -n "Restarting $DESC"
+        stop_puppet_agent
+        start_puppet_agent
+        log_end_msg $?
+        ;;
+*)
+        echo "Usage: $0 {start|stop|status|restart|force-reload|reload}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/recipes-support/puppet/puppet/puppet.service b/recipes-support/puppet/puppet/puppet.service
new file mode 100644
index 0000000..c49dacf
--- /dev/null
+++ b/recipes-support/puppet/puppet/puppet.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Puppet agent
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/puppet agent --server master --no-daemonize
+ExecReload=/bin/kill -HUP $MAINPID
+
+[Install]
+WantedBy=multi-user.target
diff --git a/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch b/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch
deleted file mode 100644
index 1cd5e25..0000000
--- a/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fca1579d62d5b978375511e062b9c18f4413dd5a Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 20 Aug 2015 14:06:32 -0400
-Subject: [PATCH] safe_yaml: syck isn't available for Ruby >= 2.0.0
-
-This change was taken from various puppet forks but does not exist in
-puppet upstream as they drop support for YAML on the network as part
-of work to fix PUP-3272.
-
-https://tickets.puppetlabs.com/browse/PUP-3272
-
-Community versions of this change:
-https://github.com/kylog/puppet/commit/42b2e77ec24dfbbf2317d08615a35127afbc4782
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb b/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
-index 8670ace..722dd3e 100644
---- a/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
-+++ b/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
-@@ -3,7 +3,7 @@ require "yaml"
- # This needs to be defined up front in case any internal classes need to base
- # their behavior off of this.
- module SafeYAML
--  YAML_ENGINE = defined?(YAML::ENGINE) ? YAML::ENGINE.yamler : "syck"
-+  YAML_ENGINE = defined?(YAML::ENGINE) ? YAML::ENGINE.yamler : (defined?(Psych) && YAML == Psych ? "psych" : "syck")
- end
- 
- require "set"
--- 
-2.1.4
-
diff --git a/recipes-support/puppet/puppet_3.7.3.bb b/recipes-support/puppet/puppet_5.4.0.bb
similarity index 51%
rename from recipes-support/puppet/puppet_3.7.3.bb
rename to recipes-support/puppet/puppet_5.4.0.bb
index 3e8f869..54574e4 100644
--- a/recipes-support/puppet/puppet_3.7.3.bb
+++ b/recipes-support/puppet/puppet_5.4.0.bb
@@ -1,37 +1,41 @@
 SUMMARY = "Open source Puppet is a configuration management system"
 HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f257790c70561550fd666c6e0044fd89"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c9045ec00cc0d6b6e0e09ee811da4a0"
 
 SRC_URI = " \
     https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
     file://add_puppet_gemspec.patch \
     file://puppet.conf \
-    file://maint-Change-spec-test-to-pass-on-ruby-2.2.patch \
-    file://MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch \
-    file://safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch \
+    file://puppet.init \
+    file://puppet.service \
 "
-SRC_URI[md5sum] = "cc294da1d51df07bcc7f6cf78bd90ce0"
-SRC_URI[sha256sum] = "4a3bd7ddb51072c3dd898a8de158cde204a2d8fd0b84e8ac806b84c074348637"
+SRC_URI[md5sum] = "e26702fbfb464121d8d60e639ea254d9"
+SRC_URI[sha256sum] = "8db3a89c9ced01b43c57f89e42d099a763d02f38bcea5d6c73e1245556932bb2"
 
-inherit ruby
+inherit ruby update-rc.d systemd
 
 DEPENDS += " \
         ruby \
         facter \
-        hiera \
 "
 
 RDEPENDS_${PN} += " \
         ruby \
         facter \
-        hiera \
         ruby-shadow \
         bash \
 "
 
 RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
 
+INITSCRIPT_NAME = "${BPN}"
+INITSCRIPT_PARAMS = "start 02 5 3 2 . stop 20 0 1 6 ."
+
+SYSTEMD_AUTO_ENABLE = "enable"
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+
 do_install_append() {
     install -d ${D}${sysconfdir}/puppet
     install -d ${D}${sysconfdir}/puppet/manifests
@@ -39,6 +43,12 @@ do_install_append() {
 
     install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
     install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
-    install -m 655 ${S}/conf/tagmail.conf ${D}${sysconfdir}/puppet/
+    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet/
     install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/puppet.service ${D}${systemd_unitdir}/system
+
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/puppet.init ${D}${sysconfdir}/init.d/puppet
 }
-- 
2.11.0


