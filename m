Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 482FEE00828; Thu, 29 Jan 2015 19:33:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [157.56.110.83 listed in list.dnswl.org]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0083.outbound.protection.outlook.com [157.56.110.83])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C06CBE00947
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 19:33:11 -0800 (PST)
Received: from BL2FFO11FD026.protection.gbl (10.173.160.30) by
	BL2FFO11HUB048.protection.gbl (10.173.161.124) with Microsoft SMTP
	Server (TLS) id 15.1.75.11; Fri, 30 Jan 2015 03:33:10 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD026.mail.protection.outlook.com (10.173.161.105) with
	Microsoft
	SMTP Server (TLS) id 15.1.75.11 via Frontend Transport; Fri, 30 Jan 2015
	03:33:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YH2H3-0003gi-UA
	for meta-virtualization@yoctoproject.org;
	Thu, 29 Jan 2015 19:29:37 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Jan 2015 13:31:48 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
References: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21292.004
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <a7ba7b2cdf844220a4a6adfd0e685199@BL2FFO11FD026.protection.gbl>
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
	SFS:(10009020)(6009001)(230783001)(450100001)(86362001)(53416004)(47776003)(46102003)(2950100001)(2361001)(108616004)(229853001)(50466002)(50226001)(106466001)(6806004)(87936001)(74316001)(62966003)(110136001)(92566002)(48376002)(92726002)(2351001)(50986999)(76176999)(104016003)(77156002)(19580395003)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB048;
	H:xsj-pvapsmtpgw01; FPR:; SPF:None; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BL2FFO11HUB048;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BL2FFO11HUB048; 
X-Forefront-PRVS: 04724A515E
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB048;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2015 03:33:10.0197 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB048
Subject: [RFC 8/8] xen-image-minimal: Install qemu instead of xen-qemu
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
X-List-Received-Date: Fri, 30 Jan 2015 03:33:24 -0000
Content-Type: text/plain

* Install QEMU from the distro as opposed to a specific xen-qemu setup
---
 recipes-extended/images/xen-image-minimal.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index aed0526..26b6d06 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -13,7 +13,7 @@ IMAGE_INSTALL += " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'kernel-module-xen-pciback', '', d)} \
     kernel-module-xen-wdt \
     xen-base \
-    xen-qemu \
+    qemu \
     "
 
 LICENSE = "MIT"
-- 
2.1.1


