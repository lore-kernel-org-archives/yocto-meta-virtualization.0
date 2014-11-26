Return-Path: <B40869@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1720E00935; Tue, 25 Nov 2014 20:18:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.128 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0128.outbound.protection.outlook.com [65.55.169.128])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD23CE00935
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Nov 2014 20:18:47 -0800 (PST)
Received: from DM2PR03CA0052.namprd03.prod.outlook.com (10.141.96.51) by
	BY2PR0301MB0757.namprd03.prod.outlook.com (25.160.63.26) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Wed, 26 Nov 2014 03:45:20 +0000
Received: from BY2FFO11FD054.protection.gbl (2a01:111:f400:7c0c::195) by
	DM2PR03CA0052.outlook.office365.com (2a01:111:e400:2428::51) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.15 via Frontend Transport; Wed, 26 Nov 2014
	03:45:20 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD054.mail.protection.outlook.com (10.1.15.191) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Wed, 26 Nov 2014 03:45:19 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id sAQ3jG3I006409;
	Tue, 25 Nov 2014 20:45:17 -0700
From: YangHaibo <b40869@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1416973511-16105-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(377424004)(50466002)(104016003)(89996001)(87286001)(31966008)(88136002)(87936001)(48376002)(68736004)(69596002)(95666004)(77156002)(15202345003)(450100001)(107046002)(2351001)(93916002)(62966003)(36756003)(81156004)(86362001)(4396001)(229853001)(106466001)(105606002)(6806004)(21056001)(46102003)(64706001)(110136001)(102836001)(92566001)(92726001)(19580405001)(19580395003)(50226001)(104166001)(15395725005)(33646002)(44976005)(15975445006)(84676001)(120916001)(97736003)(50986999)(47776003)(20776003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0757;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB0757;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB0757; 
X-Forefront-PRVS: 04073E895A
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B40869@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB0757; 
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: YangHaibo <b40869@freescale.com>
Subject: [PATCH] facter: add recipe for facter 2.3.0
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
Date: Wed, 26 Nov 2014 04:18:55 -0000
X-Original-Date: Wed, 26 Nov 2014 11:45:11 +0800
X-List-Received-Date: Wed, 26 Nov 2014 04:18:55 -0000
Content-Type: text/plain

---
 .../facter/facter/add_facter_gemspec.patch         | 23 ++++++++++++++++++++++
 .../recipes-support/facter/facter_2.3.0.bb         | 19 ++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-openstack/recipes-support/facter/facter/add_facter_gemspec.patch
 create mode 100644 meta-openstack/recipes-support/facter/facter_2.3.0.bb

diff --git a/meta-openstack/recipes-support/facter/facter/add_facter_gemspec.patch b/meta-openstack/recipes-support/facter/facter/add_facter_gemspec.patch
new file mode 100644
index 0000000..a5095cb
--- /dev/null
+++ b/meta-openstack/recipes-support/facter/facter/add_facter_gemspec.patch
@@ -0,0 +1,23 @@
+diff -urN facter-2.3.0_ori/facter.gemspec facter-2.3.0/facter.gemspec
+--- facter-2.3.0_ori/facter.gemspec	1970-01-01 08:00:00.000000000 +0800
++++ facter-2.3.0/facter.gemspec	2014-11-12 14:30:07.000000000 +0800
+@@ -0,0 +1,19 @@
++$:.unshift(File.dirname(__FILE__) + '/lib')
++require 'facter/version'
++
++Gem::Specification.new do |s|
++  s.name = 'facter'
++  s.version = Facter::FACTERVERSION
++  s.platform = Gem::Platform::RUBY
++  s.summary = 'Facter gathers basic facts about nodes (systems)'
++  s.description = s.summary
++  s.author = 'Yang Haibo'
++  s.email = 'b40869@freescale.com'
++  s.homepage = 'http://puppetlabs.com/facter'
++  s.license = 'Apache 2.0'
++
++  s.bindir       = 'bin'
++  s.executables  = ['facter']
++  s.require_path = 'lib'
++  s.files = %w(LICENSE README.md Rakefile) + Dir.glob('{lib,spec}/**/*')
++end
diff --git a/meta-openstack/recipes-support/facter/facter_2.3.0.bb b/meta-openstack/recipes-support/facter/facter_2.3.0.bb
new file mode 100644
index 0000000..b5a46e7
--- /dev/null
+++ b/meta-openstack/recipes-support/facter/facter_2.3.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Facter gathers basic facts about nodes (systems)"
+HOMEPAGE = "http://puppetlabs.com/facter"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ce69a88023d6f6ab282865ddef9f1e41"
+
+SRC_URI = " \
+    http://downloads.puppetlabs.com/facter/facter-${PV}.tar.gz \
+    file://add_facter_gemspec.patch \
+"
+SRC_URI[md5sum] = "7bb6dbeaef86cd79300b4723c06932bc"
+SRC_URI[sha256sum] = "a91ea915b276172e002a8670684e5c6be7df1dfdd55db6937d27fffad70c5e51"
+
+inherit ruby
+
+DEPENDS += " \
+        ruby \
+"
+
+RUBY_INSTALL_GEMS = "facter-${PV}.gem"
-- 
1.9.2


