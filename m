Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1EDDE00978; Fri, 15 Jan 2016 13:36:16 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFF8BE00928
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jan 2016 13:36:12 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0FLaBOZ000066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jan 2016 13:36:12 -0800 (PST)
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 15 Jan 2016 13:36:11 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 15 Jan 2016 15:31:11 -0600
Message-ID: <1452893472-14242-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ruby-shadow: Work around cross compile gem problem
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
X-List-Received-Date: Fri, 15 Jan 2016 21:36:17 -0000
Content-Type: text/plain

Prior to this commit it is not possible to cross build a ruby gem.  In
fact even on the x86 system the object files for the native gem are
generated with the wrong compiler (the host compiler instead of the
cross compiler).

A better way to fix this in the future would be to use only gems that
supported cross compile tool called rake.  For now the bbclass can
modify the extconf.rb just before creating the gem and insert some
code into the Makefile so as to honor the cross compile environment.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 classes/ruby.bbclass                           |   31 ++++++++++++++++++++++++
 recipes-support/ruby-shadow/ruby-shadow_git.bb |    2 +-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
index 0c842d5..92226f6 100644
--- a/classes/ruby.bbclass
+++ b/classes/ruby.bbclass
@@ -83,10 +83,41 @@ RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
 
 RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
 
+ruby_gen_extconf_fix() {
+	cat<<EOF>append
+  RbConfig::MAKEFILE_CONFIG['CPPFLAGS'] = ENV['CPPFLAGS'] if ENV['CPPFLAGS']
+  \$CPPFLAGS = ENV['CPPFLAGS'] if ENV['CPPFLAGS']
+  RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']
+  RbConfig::MAKEFILE_CONFIG['LD'] = ENV['LD'] if ENV['LD']
+  RbConfig::MAKEFILE_CONFIG['CFLAGS'] = ENV['CFLAGS'] if ENV['CFLAGS']
+  RbConfig::MAKEFILE_CONFIG['CXXFLAGS'] = ENV['CXXFLAGS'] if ENV['CXXFLAGS']
+EOF
+	cat append2>>append
+	sysroot_ruby=${STAGING_INCDIR}/ruby-${RUBY_GEM_VERSION}
+	ruby_arch=`ls -1 ${sysroot_ruby} |grep -v ruby |tail -1 2> /dev/null`
+	cat<<EOF>>append
+  system("perl -p -i -e 's#^topdir.*#topdir = ${sysroot_ruby}#' Makefile")
+  system("perl -p -i -e 's#^hdrdir.*#hdrdir = ${sysroot_ruby}#' Makefile")
+  system("perl -p -i -e 's#^arch_hdrdir.*#arch_hdrdir = ${sysroot_ruby}/\\\\\$(arch)#' Makefile")
+  system("perl -p -i -e 's#^arch =.*#arch = ${ruby_arch}#' Makefile")
+  system("perl -p -i -e 's#^LIBPATH =.*#LIBPATH = -L.#' Makefile")
+EOF
+}
+
 ruby_do_compile() {
+	if [ -f extconf.rb -a ! -f extconf.rb.orig ] ; then
+		grep create_makefile extconf.rb > append2 || (exit 0)
+		ruby_gen_extconf_fix
+		cp extconf.rb extconf.rb.orig
+		# Patch extconf.rb for cross compile
+		cat append >> extconf.rb
+	fi
 	for gem in ${RUBY_BUILD_GEMS}; do
 		${RUBY_COMPILE_FLAGS} gem build $gem
 	done
+	if [ -f extconf.rb.orig ] ; then
+		mv extconf.rb.orig extconf.rb
+	fi
 }
 
 
diff --git a/recipes-support/ruby-shadow/ruby-shadow_git.bb b/recipes-support/ruby-shadow/ruby-shadow_git.bb
index 72be016..75588f3 100644
--- a/recipes-support/ruby-shadow/ruby-shadow_git.bb
+++ b/recipes-support/ruby-shadow/ruby-shadow_git.bb
@@ -20,4 +20,4 @@ RDEPENDS_${PN} += " \
 "
 
 RUBY_INSTALL_GEMS = "ruby-shadow-${PV}.gem"
-FILES_${PN}-dbg += "/usr/lib64/ruby/gems/*/gems/ruby-shadow-${PV}/.debug/shadow.so"
+FILES_${PN}-dbg += "/usr/lib*/ruby/gems/*/gems/ruby-shadow-${PV}/.debug/shadow.so"
-- 
1.7.9.5


