Return-Path: <B40869@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B84AFE00895; Tue,  2 Dec 2014 19:15:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.126 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0126.outbound.protection.outlook.com [65.55.169.126])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BD32E00521
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Dec 2014 19:14:56 -0800 (PST)
Received: from BN3PR0301CA0065.namprd03.prod.outlook.com (25.160.152.161) by
	DM2PR0301MB0767.namprd03.prod.outlook.com (25.160.97.150) with
	Microsoft SMTP
	Server (TLS) id 15.1.26.15; Wed, 3 Dec 2014 02:59:54 +0000
Received: from BN1BFFO11FD047.protection.gbl (2a01:111:f400:7c10::1:172) by
	BN3PR0301CA0065.outlook.office365.com (2a01:111:e400:401e::33) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.15 via Frontend Transport; Wed, 3 Dec 2014
	02:59:54 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD047.mail.protection.outlook.com (10.58.145.2) with Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport;
	Wed, 3 Dec 2014 02:59:53 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sB32xpVq020800; Tue, 2 Dec 2014 19:59:52 -0700
From: YangHaibo <b40869@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 3 Dec 2014 10:59:34 +0800
Message-ID: <1417575574-10290-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(377424004)(189002)(47776003)(15202345003)(99396003)(89996001)(64706001)(120916001)(46102003)(15395725005)(20776003)(92566001)(31966008)(92726001)(15975445006)(87936001)(86362001)(87286001)(84676001)(50986999)(88136002)(6806004)(93916002)(50226001)(19580405001)(44976005)(4396001)(19580395003)(102836001)(36756003)(95666004)(97736003)(105606002)(50466002)(104166001)(68736005)(107046002)(21056001)(33646002)(2351001)(104016003)(450100001)(106466001)(229853001)(48376002)(77096005)(77156002)(62966003)(110136001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0767;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB0767;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB0767; 
X-Forefront-PRVS: 0414DF926F
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB0767; 
X-OriginatorOrg: freescale.com
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
X-List-Received-Date: Wed, 03 Dec 2014 03:15:01 -0000
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


