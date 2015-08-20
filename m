Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCF0AE00A75; Wed, 19 Aug 2015 19:56:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51D85E009EC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:15 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K2uFqw024534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Aug 2015 19:56:15 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 19:56:14 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 19 Aug 2015 22:56:10 -0400
Message-ID: <1440039372-3073-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
References: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [m-c-s][PATCH 3/5] Add the ruby-shadow recipe for the puppet tool
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
X-List-Received-Date: Thu, 20 Aug 2015 02:56:20 -0000
Content-Type: text/plain

From: Guojian Zhou <guojian.zhou@windriver.com>

The puppet could not add or change the user's password automatically,
because the puppet tool requires the "libshadow" to implement this feature.

Failure information without the "libshadow" feature:
==================================================================
Debug: /User[username]: Provider useradd does not support features
manages_passwords; not managing attribute password

Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-support/puppet/puppet_3.7.3.bb         |  1 +
 .../recipes-support/ruby-shadow/ruby-shadow_git.bb | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-openstack/recipes-support/ruby-shadow/ruby-shadow_git.bb

diff --git a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
index f201a7b..c1743e6 100644
--- a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
+++ b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} += " \
         ruby \
         facter \
         hiera \
+        ruby-shadow \
 "
 
 RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
diff --git a/meta-openstack/recipes-support/ruby-shadow/ruby-shadow_git.bb b/meta-openstack/recipes-support/ruby-shadow/ruby-shadow_git.bb
new file mode 100644
index 0000000..72be016
--- /dev/null
+++ b/meta-openstack/recipes-support/ruby-shadow/ruby-shadow_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Shadow Password Module"
+HOMEPAGE = "https://github.com/apalmblad/ruby-shadow"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=137882914e5269b7268f0fe8e28a3f89"
+
+PV = "2.4.1"
+
+SRC_URI = "git://github.com/apalmblad/ruby-shadow.git"
+SRCREV = "4231a4838fd50022b112838f114ee0586e119605"
+S = "${WORKDIR}/git"
+
+inherit ruby
+
+DEPENDS += " \
+        ruby \
+"
+
+RDEPENDS_${PN} += " \
+        ruby \
+"
+
+RUBY_INSTALL_GEMS = "ruby-shadow-${PV}.gem"
+FILES_${PN}-dbg += "/usr/lib64/ruby/gems/*/gems/ruby-shadow-${PV}/.debug/shadow.so"
-- 
2.1.4


