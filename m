Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 885DEE00750; Mon, 16 Feb 2015 00:34:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.92 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0092.outbound.protection.outlook.com [65.55.169.92])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BA86E00746
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:34:52 -0800 (PST)
Received: from BY2FFO11FD035.protection.gbl (10.1.14.32) by
	BY2FFO11HUB058.protection.gbl (10.1.15.233) with Microsoft SMTP Server
	(TLS) id 15.1.87.10; Mon, 16 Feb 2015 08:34:48 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BY2FFO11FD035.mail.protection.outlook.com (10.1.14.220) with Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:34:48 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH52-0002nJ-Af; Mon, 16 Feb 2015 00:31:00 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:25 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <608c9f18a1c544b58bf35e1a37690f79@BY2FFO11FD035.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; gmail.com; dkim=none (message not
	signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(87936001)(46102003)(6806004)(19580395003)(19580405001)(50226001)(108616004)(53416004)(229853001)(2351001)(85326001)(110136001)(106466001)(47776003)(77156002)(62966003)(86362001)(76176999)(50986999)(48376002)(74316001)(50466002)(104016003)(92566002)(2950100001)(92726002)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB058;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; LANG:; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB058;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY2FFO11HUB058; 
X-Forefront-PRVS: 0489CFBAC9
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB058;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:34:48.7556 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2FFO11HUB058
Subject: [PATCH 03/14] xen: Move x86/arch specific components into RRECOMMENDS
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
X-List-Received-Date: Mon, 16 Feb 2015 08:34:54 -0000
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


