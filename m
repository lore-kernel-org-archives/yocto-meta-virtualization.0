Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2916BE007AB; Mon, 16 Feb 2015 00:35:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.81 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0081.outbound.protection.outlook.com [65.55.169.81])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50207E008DC
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:35:04 -0800 (PST)
Received: from BL2FFO11FD007.protection.gbl (10.173.160.30) by
	BL2FFO11HUB035.protection.gbl (10.173.161.115) with Microsoft SMTP
	Server (TLS) id 15.1.87.10; Mon, 16 Feb 2015 08:35:02 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD007.mail.protection.outlook.com (10.173.161.3) with Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:35:02 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH5F-0002or-6p; Mon, 16 Feb 2015 00:31:13 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:36 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <d8ca819259f24d84a4a5b03dfce13a87@BL2FFO11FD007.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; gmail.com; dkim=none (message not
	signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(2351001)(48376002)(87936001)(92726002)(47776003)(46102003)(76176999)(92566002)(53416004)(50226001)(77156002)(229853001)(104016003)(50986999)(62966003)(2950100001)(50466002)(106466001)(74316001)(19580405001)(85326001)(108616004)(110136001)(86362001)(6806004)(19580395003)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB035;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB035;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BL2FFO11HUB035; 
X-Forefront-PRVS: 0489CFBAC9
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB035;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:35:02.0517 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB035
Subject: [PATCH 14/14] seabios: minor cleanup
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
X-List-Received-Date: Mon, 16 Feb 2015 08:35:22 -0000
Content-Type: text/plain

From: Chris Patterson <cjp256@gmail.com>

- use EXTRA_OEMAKE for passing along make flags
- drop PARALLEL_MAKE="" override which is not required.

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/seabios/seabios_1.7.5.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/seabios/seabios_1.7.5.bb b/recipes-extended/seabios/seabios_1.7.5.bb
index 5ff0004..511578f 100644
--- a/recipes-extended/seabios/seabios_1.7.5.bb
+++ b/recipes-extended/seabios/seabios_1.7.5.bb
@@ -23,9 +23,8 @@ FILES_${PN} = "/usr/share/firmware"
 DEPENDS = "util-linux-native file-native bison-native flex-native gettext-native iasl-native python-native"
 
 TUNE_CCARGS = ""
-PARALLEL_MAKE = ""
-export HOSTCC="${BUILD_CC}"
-export CROSS_PREFIX="${TARGET_PREFIX}"
+EXTRA_OEMAKE += "HOSTCC=${BUILD_CC}"
+EXTRA_OEMAKE += "CROSS_PREFIX=${TARGET_PREFIX}"
 
 do_configure() {
     install -m 0644 "${WORKDIR}/defconfig" .config
-- 
2.1.1


