Return-Path: <B40869@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9DCDE0086F; Wed,  3 Dec 2014 01:09:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.129 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0129.outbound.protection.outlook.com [65.55.169.129])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D921E0030B
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Dec 2014 01:09:48 -0800 (PST)
Received: from DM2PR03CA0028.namprd03.prod.outlook.com (10.141.96.27) by
	CY1PR0301MB0762.namprd03.prod.outlook.com (25.160.159.156) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.15; Wed, 3 Dec 2014 09:09:44 +0000
Received: from BN1AFFO11FD018.protection.gbl (2a01:111:f400:7c10::195) by
	DM2PR03CA0028.outlook.office365.com (2a01:111:e400:2428::27) with
	Microsoft
	SMTP Server (TLS) id 15.1.31.17 via Frontend Transport; Wed, 3 Dec 2014
	09:09:43 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD018.mail.protection.outlook.com (10.58.52.78) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Wed, 3 Dec 2014 09:09:43 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sB399ee1030783; Wed, 3 Dec 2014 02:09:42 -0700
From: YangHaibo <b40869@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 3 Dec 2014 17:07:56 +0800
Message-ID: <1417597676-18985-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(377424004)(199003)(189002)(64706001)(47776003)(20776003)(450100001)(62966003)(110136001)(95666004)(106466001)(46102003)(105606002)(104016003)(33646002)(21056001)(575784001)(93916002)(92726001)(92566001)(120916001)(86362001)(99396003)(36756003)(77156002)(50466002)(48376002)(77096005)(68736005)(87936001)(88136002)(89996001)(104166001)(87286001)(107046002)(2351001)(31966008)(19580405001)(19580395003)(44976005)(229853001)(4396001)(50226001)(97736003)(102836001)(50986999)(15975445006)(84676001)(6806004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0762;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0762;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB0762; 
X-Forefront-PRVS: 0414DF926F
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB0762; 
X-OriginatorOrg: freescale.com
Subject: [PATCH v2] puppet: add recipe for puppet 3.7.3
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
X-List-Received-Date: Wed, 03 Dec 2014 09:09:54 -0000
Content-Type: text/plain

A simple demo is added
---
 meta-openstack/recipes-support/puppet/README       | 75 ++++++++++++++++++++++
 .../puppet/puppet/add_puppet_gemspec.patch         | 23 +++++++
 .../recipes-support/puppet/puppet_3.7.3.bb         | 31 +++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 meta-openstack/recipes-support/puppet/README
 create mode 100644 meta-openstack/recipes-support/puppet/puppet/add_puppet_gemspec.patch
 create mode 100644 meta-openstack/recipes-support/puppet/puppet_3.7.3.bb

diff --git a/meta-openstack/recipes-support/puppet/README b/meta-openstack/recipes-support/puppet/README
new file mode 100644
index 0000000..2de808a
--- /dev/null
+++ b/meta-openstack/recipes-support/puppet/README
@@ -0,0 +1,75 @@
+What is Puppet
+------------------------
+Puppet is a configuration management system that allows you to define the
+state of your IT infrastructure, then automatically enforces the correct state.
+
+
+Basic Requirements
+------------------------
+Ruby 1.8.7 or later
+Facter 1.7.0 or later
+Hiera 1.0 or later
+The json gem (any modern version)
+
+
+Simple Demo
+------------------------
+In this simple demo, we have a CA master server named 'master' and ip is 192.168.2.83
+and an agent node named 'agent', ip is 192.168.2.30. 
+
+On master server, file 'test.cfg' is under /etc/puppet/files/, puppet will sync this
+file to /opt/ folder on agent node.
+
+Step 1: Configure Puppet CA Master Server
+1) create a puppet group and user
+$ puppet resource group puppet ensure=presnt
+$ puppet resource user puppet ensure=present gid=puppet shell='/sbin/nologin'
+
+2) create the CA certificate and the puppet master certificate
+$ puppet master --verbose --no-daemonize
+(Once it says Notice: Starting Puppet master version <VERSION>, type ctrl-C to kill the process)
+
+3) $ vi /etc/hosts
+add new line:
+192.168.2.30    agent
+
+4) start puppet master
+$ puppet master --verbose --no-daemonize &
+
+
+Step 2: Config Puppet Agent Node
+1) Edit puppet.conf
+$ echo "[main]
+server = master" >> /etc/puppet/puppet.conf
+
+2) $ vi /etc/hosts
+add new line:
+192.168.2.83    master
+
+3) Request certificates
+$ puppet agent --test --ca_server=t2080qds -w 60
+(Accept the request on master server by this command: puppet cert sign --all)
+
+
+Step 3: Add site map on master
+1) Edit /etc/puppet/fileserver.conf to make /etc/puppet/files available
+$ mkdir /etc/puppet/files
+$ touch /etc/puppet/files/test.cfg
+$ vi /etc/puppet/fileserver.conf
+add following lines:
+[extra_files]
+   path /etc/puppet/files
+   allow *
+
+2) Add a new sitemap
+$ vi /etc/puppet/manifests/site.pp
+add follwing lines:
+file
+{ "/opt/test.cfg":
+source => "puppet:///extra_files/test.cfg",
+}
+
+
+Step 4: Run puppet on agent
+$ puppet agent --test
+$ ls /opt/ 
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


