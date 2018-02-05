Return-Path: <psaavedra@igalia.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E1A0E00E73; Mon,  5 Feb 2018 09:28:44 -0800 (PST)
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
X-Greylist: delayed 922 seconds by postgrey-1.32 at yocto-www;
	Mon, 05 Feb 2018 09:28:40 PST
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37367E0085E
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Feb 2018 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=ughaG3PCEZzoi3t9kKBWvVIXNRq7DvJ6i345b/4+PmM=; 
	b=VqqaYfYzf0Wg0tp2d9Qo6xHUP5axNfztMYIstnOFyjUwuwnRXGtrjLg567X7yi437+0vhFXUeloOmo3Xnr6XFOJ0uBQvM2slxUxLWKIsr3+NbTVw2lCShs3LgLZz6WN/pPhczyG8UVF2Dy6/g/IOA6SqsY3ip7avguAA+GfE4lNbzWD26bbOOIOrI/CApq2XCnMN0qYFq5Pj8ucw5+KhCzdUFuOYGevQcvx7/3FYYDyTuc6uXWiJKR7ilkfiAo+MRcEfT8QXkKK3kPbRv2tR+/iw8BdFQIeEMgtmo48zVF3GTTtwi5Hcu0ywed2Zd6qNsOEErN+zc84UK+/u9tlHRA==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1eikKS-0005YM-Sj
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Feb 2018 18:13:16 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  5 Feb 2018 18:13:06 +0100
Message-Id: <20180205171306.2201-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] Added Yocto recipe for Puppet 4.10.9
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
X-List-Received-Date: Mon, 05 Feb 2018 17:28:44 -0000

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 recipes-support/puppet/puppet_4.10.9.bb | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-support/puppet/puppet_4.10.9.bb

diff --git a/recipes-support/puppet/puppet_4.10.9.bb b/recipes-support/puppet/puppet_4.10.9.bb
new file mode 100644
index 0000000..a335546
--- /dev/null
+++ b/recipes-support/puppet/puppet_4.10.9.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Open source Puppet is a configuration management system"
+HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c9045ec00cc0d6b6e0e09ee811da4a0"
+
+SRC_URI = " \
+    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
+    file://add_puppet_gemspec.patch \
+    file://puppet.conf \
+"
+SRC_URI[md5sum] = "8af3c2fec5dc4683d80aab4efc1614c6"
+SRC_URI[sha256sum] = "e667bd825e54bbc38c30534c25adc441ed638fc484fe0abe278f0335770cd161"
+
+inherit ruby
+
+DEPENDS += " \
+        ruby \
+        facter \
+        hiera \
+"
+
+RDEPENDS_${PN} += " \
+        ruby \
+        facter \
+        hiera \
+        ruby-shadow \
+        bash \
+"
+
+RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/puppet
+    install -d ${D}${sysconfdir}/puppet/manifests
+    install -d ${D}${sysconfdir}/puppet/modules
+
+    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
+    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
+    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet/
+    install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
+}
-- 
2.11.0


