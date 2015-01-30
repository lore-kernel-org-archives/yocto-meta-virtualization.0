Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B0B6E00902; Thu, 29 Jan 2015 19:33:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.62 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0062.outbound.protection.outlook.com [65.55.169.62])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B77C8E00894
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 19:33:03 -0800 (PST)
Received: from BN1BFFO11FD056.protection.gbl (10.58.144.31) by
	BN1BFFO11HUB051.protection.gbl (10.58.144.198) with Microsoft SMTP
	Server (TLS) id 15.1.75.11; Fri, 30 Jan 2015 03:33:00 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11FD056.mail.protection.outlook.com (10.58.145.11) with
	Microsoft SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Fri, 30 Jan 2015 03:33:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YH2Gt-0003gK-Q0
	for meta-virtualization@yoctoproject.org;
	Thu, 29 Jan 2015 19:29:27 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Jan 2015 13:31:42 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
References: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21292.004
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <3b1fb598f5424b0eac5c5883c8ae6a19@BN1BFFO11FD056.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; yoctoproject.org;
	dkim=none (message
	not signed) header.d=none; yoctoproject.org; dmarc=permerror action=none
	header.from=xilinx.com;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(6806004)(19580395003)(2950100001)(450100001)(76176999)(62966003)(86362001)(106466001)(2351001)(53416004)(77156002)(110136001)(92726002)(48376002)(87936001)(74316001)(50466002)(50226001)(108616004)(2361001)(46102003)(19580405001)(33646002)(229853001)(47776003)(92566002)(50986999)(104016003)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB051;
	H:xsj-pvapsmtpgw01; FPR:; SPF:None; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN1BFFO11HUB051;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1BFFO11HUB051; 
X-Forefront-PRVS: 04724A515E
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1BFFO11HUB051; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2015 03:33:00.3444 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB051
Subject: [RFC 2/8] xen: Add Build and Target architecture mapping
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
X-List-Received-Date: Fri, 30 Jan 2015 03:33:07 -0000
Content-Type: text/plain

* Setup the XEN_TARGET_ARCH and XEN_COMPILE_ARCH based on the running
  environments TARGET_ARCH and BUILD_ARCH

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 recipes-extended/xen/xen-arch.inc | 18 ++++++++++++++++++
 recipes-extended/xen/xen.inc      |  8 +++++---
 2 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 recipes-extended/xen/xen-arch.inc

diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-arch.inc
new file mode 100644
index 0000000..bcf9f54
--- /dev/null
+++ b/recipes-extended/xen/xen-arch.inc
@@ -0,0 +1,18 @@
+
+valid_xen_archs = " \
+        x86_64 x86_32 \
+        arm32 arm64 \
+        "
+
+def map_xen_arch(a, d):
+    import re
+    valid_archs = d.getVar('valid_xen_archs').split()
+
+    if   re.match("i.86", a):        return "x86_32"
+    elif re.match("x86.64", a):      return "x86_64"
+    elif re.match("arm.*", a):       return "arm32"
+    elif re.match("aarch64.*", a):   return "arm64"
+    elif a in valid_archs:           return a
+    else:
+        bb.error("cannot map '%s' to a xen architecture" % a)
+
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index ed902b2..9ab8351 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -10,6 +10,8 @@ COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
 inherit autotools-brokensep gettext setuptools update-rc.d
 
+require xen-arch.inc
+
 PACKAGECONFIG ??= " \
     sdl \
     "
@@ -618,9 +620,9 @@ export HOST_SYS
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-# specify xen hypervisor to target x86_64 (x86_32 not supported)
-export XEN_TARGET_ARCH="x86_64"
-export XEN_COMPILE_ARCH="x86_64"
+# specify xen hypervisor to build/target
+export XEN_TARGET_ARCH = "${@map_xen_arch(d.getVar('TARGET_ARCH', True), d)}"
+export XEN_COMPILE_ARCH = "${@map_xen_arch(d.getVar('BUILD_ARCH', True), d)}"
 
 # hardcoded as Linux, as the only compatible hosts are Linux.
 export XEN_OS = "Linux"
-- 
2.1.1


