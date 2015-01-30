Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D530E00873; Thu, 29 Jan 2015 19:33:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.98 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0098.outbound.protection.outlook.com [157.56.111.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 069C9E00873
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 19:33:02 -0800 (PST)
Received: from BN1BFFO11FD038.protection.gbl (10.58.144.32) by
	BN1BFFO11HUB054.protection.gbl (10.58.144.201) with Microsoft SMTP
	Server (TLS) id 15.1.75.11; Fri, 30 Jan 2015 03:33:00 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11FD038.mail.protection.outlook.com (10.58.144.101) with
	Microsoft
	SMTP Server (TLS) id 15.1.75.11 via Frontend Transport; Fri, 30 Jan 2015
	03:32:59 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YH2Gt-0003gE-If
	for meta-virtualization@yoctoproject.org;
	Thu, 29 Jan 2015 19:29:27 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Jan 2015 13:31:43 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
References: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21292.004
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <2b9332ca3e5c419bb6ff1536e8198c87@BN1BFFO11FD038.protection.gbl>
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
	SFS:(10009020)(6009001)(108616004)(87936001)(86362001)(92566002)(46102003)(74316001)(50986999)(47776003)(104016003)(50226001)(2361001)(76176999)(450100001)(62966003)(2351001)(2950100001)(92726002)(106466001)(33646002)(6806004)(50466002)(48376002)(229853001)(53416004)(110136001)(19580405001)(77156002)(19580395003)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB054;
	H:xsj-pvapsmtpgw01; FPR:; SPF:None; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN1BFFO11HUB054;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1BFFO11HUB054; 
X-Forefront-PRVS: 04724A515E
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1BFFO11HUB054; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2015 03:32:59.8018 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB054
Subject: [RFC 3/8] xen: Move x86/arch specific components into RRECOMMENDS
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

* The xen-base specifies features that are specific to x86 targets,
  these components include xen-libblktap, xen-flask, xen-hvmloader and
  xen-xenpaging

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 recipes-extended/xen/xen.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 9ab8351..54d6ffe 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -64,11 +64,9 @@ RDEPENDS_${PN}-base = "\
     ${PN}-libxenstore \
     ${PN}-libfsimage \
     ${PN}-fsimage \
-    ${PN}-hvmloader \
     ${PN}-scripts-block \
     ${PN}-scripts-network \
     ${PN}-udev \
-    ${PN}-xenpaging \
     ${PN}-xen-watchdog \
     ${PN}-xencommons \
     ${PN}-xendomains \
@@ -77,6 +75,13 @@ RDEPENDS_${PN}-base = "\
     ${PN}-xl \
     "
 
+RRECOMMENDS_${PN}-base = " \
+    ${PN}-libblktap \
+    ${PN}-flask \
+    ${PN}-hvmloader \
+    ${PN}-xenpaging \
+    "
+
 RDEPENDS_${PN}-misc = " \
     perl \
     python \
-- 
2.1.1


