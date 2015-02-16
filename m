Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BE6A5E00809; Mon, 16 Feb 2015 00:35:26 -0800 (PST)
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
	*      [157.56.111.77 listed in list.dnswl.org]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0077.outbound.protection.outlook.com [157.56.111.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A3E4E00827
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:35:06 -0800 (PST)
Received: from BN1BFFO11FD015.protection.gbl (10.58.144.30) by
	BN1BFFO11HUB050.protection.gbl (10.58.144.197) with Microsoft SMTP
	Server (TLS) id 15.1.87.10; Mon, 16 Feb 2015 08:35:04 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11FD015.mail.protection.outlook.com (10.58.144.78) with
	Microsoft SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:35:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH5H-0002pL-1M; Mon, 16 Feb 2015 00:31:15 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:35 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <0da250d8148c49b3b1d61e9d68345e5b@BN1BFFO11FD015.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(229853001)(50226001)(92566002)(106466001)(2351001)(46102003)(33646002)(108616004)(62966003)(92726002)(15975445007)(77156002)(110136001)(104016003)(6806004)(19580405001)(19580395003)(85326001)(74316001)(48376002)(50986999)(2950100001)(50466002)(53416004)(76176999)(87936001)(47776003)(86362001)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB050;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1BFFO11HUB050;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1BFFO11HUB050; 
X-Forefront-PRVS: 0489CFBAC9
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1BFFO11HUB050; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:35:03.9217 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB050
Subject: [PATCH 13/14] vgabios: DEPENDS on dev86-native
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
X-List-Received-Date: Mon, 16 Feb 2015 08:35:26 -0000
Content-Type: text/plain

From: Chris Patterson <cjp256@gmail.com>

Signed-off-by: Chris Patterson <cjp256@gmail.com>
---
 recipes-extended/vgabios/vgabios_0.7a.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb b/recipes-extended/vgabios/vgabios_0.7a.bb
index 6addeff..0ed8bb4 100644
--- a/recipes-extended/vgabios/vgabios_0.7a.bb
+++ b/recipes-extended/vgabios/vgabios_0.7a.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Plex86/Bochs LGPL VGABios"
 HOMEPAGE = "http://www.nongnu.org/vgabios/"
 LICENSE = "LGPLv2.1"
 SECTION = "firmware"
-DEPENDS = ""
+
+DEPENDS = "dev86-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
-DEPENDS = ""
 
 SRC_URI =  "http://savannah.gnu.org/download/vgabios/${PN}-${PV}.tgz"
 
-- 
2.1.1


