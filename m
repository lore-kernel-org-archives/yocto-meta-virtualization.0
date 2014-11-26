Return-Path: <B40869@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D3A1E00957; Tue, 25 Nov 2014 20:19:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.138 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0138.outbound.protection.outlook.com [65.55.169.138])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82B0AE00938
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Nov 2014 20:19:39 -0800 (PST)
Received: from BN3PR0301CA0050.namprd03.prod.outlook.com (25.160.152.146) by
	DM2PR0301MB0767.namprd03.prod.outlook.com (25.160.97.150) with
	Microsoft SMTP
	Server (TLS) id 15.1.26.15; Wed, 26 Nov 2014 03:47:29 +0000
Received: from BN1AFFO11FD052.protection.gbl (2a01:111:f400:7c10::183) by
	BN3PR0301CA0050.outlook.office365.com (2a01:111:e400:401e::18) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.15 via Frontend Transport; Wed, 26 Nov 2014
	03:47:28 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD052.mail.protection.outlook.com (10.58.53.67) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Wed, 26 Nov 2014 03:47:28 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sAQ3lQC1003449; Tue, 25 Nov 2014 20:47:27 -0700
From: YangHaibo <b40869@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1416973638-18967-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(377424004)(189002)(199003)(575784001)(86362001)(47776003)(92726001)(20776003)(92566001)(48376002)(21056001)(64706001)(93916002)(36756003)(50226001)(450100001)(4396001)(84676001)(77156002)(15975445006)(50986999)(62966003)(88136002)(87286001)(87936001)(50466002)(89996001)(6806004)(44976005)(19580395003)(95666004)(19580405001)(68736004)(46102003)(110136001)(97736003)(31966008)(120916001)(33646002)(229853001)(2351001)(102836001)(107046002)(106466001)(105606002)(104166001)(104016003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0767;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB0767;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB0767; 
X-Forefront-PRVS: 04073E895A
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB0767; 
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: YangHaibo <b40869@freescale.com>
Subject: [PATCH] puppet: add recipe for puppet 3.7.3
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
Date: Wed, 26 Nov 2014 04:19:42 -0000
X-Original-Date: Wed, 26 Nov 2014 11:47:18 +0800
X-List-Received-Date: Wed, 26 Nov 2014 04:19:42 -0000
Content-Type: text/plain

---
 .../puppet/puppet/add_puppet_gemspec.patch         | 23 ++++++++++++++++
 .../recipes-support/puppet/puppet_3.7.3.bb         | 31 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
 create mode 100644 meta-openstack/recipes-support/puppet/puppet_3.7.3.bb

diff --git a/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch b/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
new file mode 100644
index 0000000..a5c8e3b
--- /dev/null
+++ b/meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
@@ -0,0 +1,23 @@
+diff -urN puppet-3.7.3_ori/puppet.gemspec puppet-3.7.3/puppet.gemspec
+--- puppet-3.7.3_ori/puppet.gemspec	1970-01-01 08:00:00.000000000 +0800
++++ puppet-3.7.3/puppet.gemspec	2014-11-12 14:30:07.000000000 +0800
+@@ -0,0 +1,19 @@
++$:.unshift(File.dirname(__FILE__) + '/lib')
++require 'puppet/version'
++
++Gem::Specification.new do |s|
++  s.name = 'puppet'
++  s.version = Puppet::PUPPETVERSION
++  s.platform = Gem::Platform::RUBY
++  s.summary = 'Open source Puppet is a configuration management system'
++  s.description = s.summary
++  s.author = 'Yang Haibo'
++  s.email = 'b40869@freescale.com'
++  s.homepage = 'https://puppetlabs.com/puppet/puppet-open-source'
++  s.license = 'Apache 2.0'
++
++  s.bindir       = 'bin'
++  s.executables  = ['puppet', 'extlookup2hiera']
++  s.require_path = 'lib'
++  s.files = %w(LICENSE README.md Rakefile) + Dir.glob('{lib,spec}/**/*')
++end
diff --git a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
new file mode 100644
index 0000000..afd9a23
--- /dev/null
+++ b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Open source Puppet is a configuration management system"
+HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f257790c70561550fd666c6e0044fd89"
+
+SRC_URI = " \
+    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
+    file://add_puppet_gemspec.patch \
+"
+SRC_URI[md5sum] = "cc294da1d51df07bcc7f6cf78bd90ce0"
+SRC_URI[sha256sum] = "4a3bd7ddb51072c3dd898a8de158cde204a2d8fd0b84e8ac806b84c074348637"
+
+inherit ruby
+
+DEPENDS += " \
+        ruby \
+        facter \
+        hiera \
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
+    install -m 655 ${S}/conf/tagmail.conf ${D}${sysconfdir}/puppet/
+}
-- 
1.9.2


