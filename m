Return-Path: <B40869@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC18EE00938; Tue, 25 Nov 2014 19:46:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.117 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 92 seconds by postgrey-1.32 at yocto-www;
	Tue, 25 Nov 2014 19:46:55 PST
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0117.outbound.protection.outlook.com [65.55.169.117])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E64A2E008F2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Nov 2014 19:46:55 -0800 (PST)
Received: from BN3PR0301CA0043.namprd03.prod.outlook.com (25.160.152.139) by
	DM2PR0301MB0766.namprd03.prod.outlook.com (25.160.97.15) with Microsoft
	SMTP Server (TLS) id 15.1.26.15; Wed, 26 Nov 2014 03:46:52 +0000
Received: from BN1BFFO11FD041.protection.gbl (2a01:111:f400:7c10::1:110) by
	BN3PR0301CA0043.outlook.office365.com (2a01:111:e400:401e::11) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.15 via Frontend Transport; Wed, 26 Nov 2014
	03:46:51 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD041.mail.protection.outlook.com (10.58.144.104) with
	Microsoft
	SMTP Server (TLS) id 15.1.6.13 via Frontend Transport; Wed, 26 Nov 2014
	03:46:51 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	sAQ3kmjX003433; Tue, 25 Nov 2014 20:46:50 -0700
From: YangHaibo <b40869@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Message-ID: <1416973598-18246-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(377424004)(189002)(36756003)(102836001)(229853001)(50466002)(33646002)(48376002)(106466001)(105606002)(104016003)(95666004)(4396001)(110136001)(2351001)(104166001)(50986999)(50226001)(107046002)(31966008)(88136002)(20776003)(47776003)(97736003)(120916001)(87286001)(46102003)(87936001)(64706001)(15975445006)(92566001)(21056001)(92726001)(68736004)(77156002)(450100001)(62966003)(19580395003)(44976005)(84676001)(89996001)(93916002)(86362001)(6806004)(19580405001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0766;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB0766;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB0766; 
X-Forefront-PRVS: 04073E895A
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB0766; 
X-OriginatorOrg: freescale.com
X-Mailman-Approved-At: Fri, 23 Dec 2016 16:01:39 -0800
Cc: YangHaibo <b40869@freescale.com>
Subject: [PATCH] hiera: add recipe for hiera 1.3.4
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
Date: Wed, 26 Nov 2014 03:46:58 -0000
X-Original-Date: Wed, 26 Nov 2014 11:46:38 +0800
X-List-Received-Date: Wed, 26 Nov 2014 03:46:58 -0000
Content-Type: text/plain

---
 .../hiera/hiera/add_hiera_gemspec.patch            | 23 ++++++++++++++++++++++
 .../recipes-support/hiera/hiera_1.3.4.bb           | 20 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-openstack/recipes-support/hiera/hiera/add_hiera_gemspec.patch
 create mode 100644 meta-openstack/recipes-support/hiera/hiera_1.3.4.bb

diff --git a/meta-openstack/recipes-support/hiera/hiera/add_hiera_gemspec.patch b/meta-openstack/recipes-support/hiera/hiera/add_hiera_gemspec.patch
new file mode 100644
index 0000000..7e302cf
--- /dev/null
+++ b/meta-openstack/recipes-support/hiera/hiera/add_hiera_gemspec.patch
@@ -0,0 +1,23 @@
+diff -urN hiera-1.3.4_ori/hiera.gemspec hiera-1.3.4/hiera.gemspec
+--- hiera-1.3.4_ori/hiera.gemspec	1970-01-01 08:00:00.000000000 +0800
++++ hiera-1.3.4/hiera.gemspec	2014-11-12 14:30:07.000000000 +0800
+@@ -0,0 +1,19 @@
++$:.unshift(File.dirname(__FILE__) + '/lib')
++require 'hiera/version'
++
++Gem::Specification.new do |s|
++  s.name = 'hiera'
++  s.version = Hiera::VERSION
++  s.platform = Gem::Platform::RUBY
++  s.summary = 'A simple pluggable Hierarchical Database.'
++  s.description = s.summary
++  s.author = 'Yang Haibo'
++  s.email = 'b40869@freescale.com'
++  s.homepage = 'https://projects.puppetlabs.com/projects/hiera'
++  s.license = 'Apache 2.0'
++
++  s.bindir       = 'bin'
++  s.executables  = ['hiera']
++  s.require_path = 'lib'
++  s.files = %w(LICENSE README.md Rakefile) + Dir.glob('{lib,spec}/**/*')
++end
diff --git a/meta-openstack/recipes-support/hiera/hiera_1.3.4.bb b/meta-openstack/recipes-support/hiera/hiera_1.3.4.bb
new file mode 100644
index 0000000..eb633ff
--- /dev/null
+++ b/meta-openstack/recipes-support/hiera/hiera_1.3.4.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A simple pluggable Hierarchical Database"
+HOMEPAGE = "https://projects.puppetlabs.com/projects/hiera"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8ac92c91fbec097f798223679c1a7491"
+
+SRC_URI = " \
+    https://downloads.puppetlabs.com/hiera/hiera-${PV}.tar.gz \
+    file://add_hiera_gemspec.patch \
+"
+SRC_URI[md5sum] = "6abccc518edb55291a63129ef30888cd"
+SRC_URI[sha256sum] = "d3ecbfedc7d8493fd00c7dd624efbb225705d289442fe7706cb81a3a7230e70e"
+
+
+inherit ruby
+
+DEPENDS += " \
+        ruby \
+"
+
+RUBY_INSTALL_GEMS = "hiera-${PV}.gem"
-- 
1.9.2


