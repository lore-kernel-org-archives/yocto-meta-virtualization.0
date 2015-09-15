Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7844BE00C02; Tue, 15 Sep 2015 06:47:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7513BE00B89
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Sep 2015 06:47:49 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8FDlnqu000544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Sep 2015 06:47:49 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 06:47:49 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 15 Sep 2015 09:47:48 -0400
Message-ID: <1442324868-17713-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH] ruby.bbclass: move to base layer
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
X-List-Received-Date: Tue, 15 Sep 2015 13:47:51 -0000
Content-Type: text/plain

In commit 1aa30310259027ebb87ee95ef914ca3de55d6a09 [puppet: move to
base layer] we made puppet available to all sub-layers but since we
didn't move the required ruby.bbclass we couldn't actually use it
without using meta-openstack. Complete the move by moving the
ruby.bbclass to the base layer. At some point I think we still want to
remove ruby.bbclass from meta-cloud-services completely and use
meta-ruby, but we will do that at another time.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 classes/ruby.bbclass                | 131 ++++++++++++++++++++++++++++++++++++
 meta-openstack/classes/ruby.bbclass | 131 ------------------------------------
 2 files changed, 131 insertions(+), 131 deletions(-)
 create mode 100644 classes/ruby.bbclass
 delete mode 100644 meta-openstack/classes/ruby.bbclass

diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
new file mode 100644
index 0000000..0c842d5
--- /dev/null
+++ b/classes/ruby.bbclass
@@ -0,0 +1,131 @@
+#
+# Copyright (C) 2014 Wind River Systems, Inc.
+#
+DEPENDS += " \
+    ruby-native \
+"
+RDEPENDS_${PN} += " \
+    ruby \
+"
+
+#${PN}_do_compile[depends] += "ruby-native:do_populate_sysroot"
+
+def get_rubyversion(p):
+    import re
+    from os.path import isfile
+    import subprocess
+    found_version = "SOMETHING FAILED!"
+
+    cmd = "%s/ruby" % p
+
+    if not isfile(cmd):
+       return found_version
+
+    version = subprocess.Popen([cmd, "--version"], stdout=subprocess.PIPE).communicate()[0]
+    
+    r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
+    m = r.match(version)
+    if m:
+        found_version = m.group(1)
+
+    return found_version
+
+def get_rubygemslocation(p):
+    import re
+    from os.path import isfile
+    import subprocess
+    found_loc = "SOMETHING FAILED!"
+
+    cmd = "%s/gem" % p
+
+    if not isfile(cmd):
+       return found_loc
+
+    loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0]
+
+    r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
+    for line in loc.split('\n'):
+        m = r.match(line)
+        if m:
+            found_loc = m.group(1)
+            break
+
+    return found_loc
+
+def get_rubygemsversion(p):
+    import re
+    from os.path import isfile
+    import subprocess
+    found_version = "SOMETHING FAILED!"
+
+    cmd = "%s/gem" % p
+
+    if not isfile(cmd):
+       return found_version
+
+    version = subprocess.Popen([cmd, "env", "gemdir"], stdout=subprocess.PIPE).communicate()[0]
+    
+    r = re.compile(".*([0-9]+\.[0-9]+\.[0-9]+)$")
+    m = r.match(version)
+    if m:
+        found_version = m.group(1)
+
+    return found_version
+
+RUBY_VERSION ?= "${@get_rubyversion("${STAGING_BINDIR_NATIVE}")}"
+RUBY_GEM_DIRECTORY ?= "${@get_rubygemslocation("${STAGING_BINDIR_NATIVE}")}"
+RUBY_GEM_VERSION ?= "${@get_rubygemsversion("${STAGING_BINDIR_NATIVE}")}"
+
+export GEM_HOME = "${STAGING_DIR_NATIVE}/usr/lib/ruby/gems/${RUBY_GEM_VERSION}"
+
+RUBY_BUILD_GEMS ?= "${BPN}.gemspec"
+RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
+
+RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
+
+ruby_do_compile() {
+	for gem in ${RUBY_BUILD_GEMS}; do
+		${RUBY_COMPILE_FLAGS} gem build $gem
+	done
+}
+
+
+ruby_do_install() {
+	for gem in ${RUBY_INSTALL_GEMS}; do
+		gem install --ignore-dependencies --local --env-shebang --install-dir ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/ $gem
+	done
+
+	# create symlink from the gems bin directory to /usr/bin
+	for i in ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/*; do
+		if [ -e "$i" ]; then
+			if [ ! -d ${D}/${bindir} ]; then mkdir -p ${D}/${bindir}; fi
+			b=`basename $i`
+			ln -sf ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/$b ${D}/${bindir}/$b
+		fi
+	done
+}
+
+EXPORT_FUNCTIONS do_compile do_install
+
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev"
+
+FILES_${PN}-dbg += " \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
+        "
+
+FILES_${PN} += " \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/build_info \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions \
+        "
+
+FILES_${PN}-doc += " \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/doc \
+        "
diff --git a/meta-openstack/classes/ruby.bbclass b/meta-openstack/classes/ruby.bbclass
deleted file mode 100644
index 0c842d5..0000000
--- a/meta-openstack/classes/ruby.bbclass
+++ /dev/null
@@ -1,131 +0,0 @@
-#
-# Copyright (C) 2014 Wind River Systems, Inc.
-#
-DEPENDS += " \
-    ruby-native \
-"
-RDEPENDS_${PN} += " \
-    ruby \
-"
-
-#${PN}_do_compile[depends] += "ruby-native:do_populate_sysroot"
-
-def get_rubyversion(p):
-    import re
-    from os.path import isfile
-    import subprocess
-    found_version = "SOMETHING FAILED!"
-
-    cmd = "%s/ruby" % p
-
-    if not isfile(cmd):
-       return found_version
-
-    version = subprocess.Popen([cmd, "--version"], stdout=subprocess.PIPE).communicate()[0]
-    
-    r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
-    m = r.match(version)
-    if m:
-        found_version = m.group(1)
-
-    return found_version
-
-def get_rubygemslocation(p):
-    import re
-    from os.path import isfile
-    import subprocess
-    found_loc = "SOMETHING FAILED!"
-
-    cmd = "%s/gem" % p
-
-    if not isfile(cmd):
-       return found_loc
-
-    loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0]
-
-    r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
-    for line in loc.split('\n'):
-        m = r.match(line)
-        if m:
-            found_loc = m.group(1)
-            break
-
-    return found_loc
-
-def get_rubygemsversion(p):
-    import re
-    from os.path import isfile
-    import subprocess
-    found_version = "SOMETHING FAILED!"
-
-    cmd = "%s/gem" % p
-
-    if not isfile(cmd):
-       return found_version
-
-    version = subprocess.Popen([cmd, "env", "gemdir"], stdout=subprocess.PIPE).communicate()[0]
-    
-    r = re.compile(".*([0-9]+\.[0-9]+\.[0-9]+)$")
-    m = r.match(version)
-    if m:
-        found_version = m.group(1)
-
-    return found_version
-
-RUBY_VERSION ?= "${@get_rubyversion("${STAGING_BINDIR_NATIVE}")}"
-RUBY_GEM_DIRECTORY ?= "${@get_rubygemslocation("${STAGING_BINDIR_NATIVE}")}"
-RUBY_GEM_VERSION ?= "${@get_rubygemsversion("${STAGING_BINDIR_NATIVE}")}"
-
-export GEM_HOME = "${STAGING_DIR_NATIVE}/usr/lib/ruby/gems/${RUBY_GEM_VERSION}"
-
-RUBY_BUILD_GEMS ?= "${BPN}.gemspec"
-RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
-
-RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
-
-ruby_do_compile() {
-	for gem in ${RUBY_BUILD_GEMS}; do
-		${RUBY_COMPILE_FLAGS} gem build $gem
-	done
-}
-
-
-ruby_do_install() {
-	for gem in ${RUBY_INSTALL_GEMS}; do
-		gem install --ignore-dependencies --local --env-shebang --install-dir ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/ $gem
-	done
-
-	# create symlink from the gems bin directory to /usr/bin
-	for i in ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/*; do
-		if [ -e "$i" ]; then
-			if [ ! -d ${D}/${bindir} ]; then mkdir -p ${D}/${bindir}; fi
-			b=`basename $i`
-			ln -sf ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/$b ${D}/${bindir}/$b
-		fi
-	done
-}
-
-EXPORT_FUNCTIONS do_compile do_install
-
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev"
-
-FILES_${PN}-dbg += " \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
-        "
-
-FILES_${PN} += " \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/build_info \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions \
-        "
-
-FILES_${PN}-doc += " \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/doc \
-        "
-- 
2.1.4


