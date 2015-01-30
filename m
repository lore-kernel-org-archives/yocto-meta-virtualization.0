Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6FC8E00828; Thu, 29 Jan 2015 19:32:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.96 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0096.outbound.protection.outlook.com [157.56.111.96])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81681E007CF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 19:32:33 -0800 (PST)
Received: from BN1BFFO11HUB043.protection.gbl (10.58.144.190) by
	BN1BFFO11HUB030.protection.gbl (10.58.144.177) with Microsoft SMTP
	Server (TLS) id 15.1.75.11; Fri, 30 Jan 2015 03:32:29 +0000
Received: from BN1BFFO11FD008.protection.gbl (10.58.144.34) by
	BN1BFFO11HUB043.protection.gbl (10.58.144.190) with Microsoft SMTP
	Server (TLS) id 15.1.75.11; Fri, 30 Jan 2015 03:32:08 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11FD008.mail.protection.outlook.com (10.58.144.71) with
	Microsoft SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Fri, 30 Jan 2015 03:32:08 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YH2G4-0003cw-F5
	for meta-virtualization@yoctoproject.org;
	Thu, 29 Jan 2015 19:28:36 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Jan 2015 13:31:40 +1000
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21292.004
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <fa0c0be68aa042b6bede0c2f644a2c42@BN1BFFO11FD008.protection.gbl>
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
	SFS:(10009020)(6009001)(164054003)(106466001)(87936001)(77156002)(86362001)(62966003)(229853001)(48376002)(74316001)(50466002)(2351001)(19580395003)(92726002)(104016003)(53416004)(2361001)(50226001)(450100001)(47776003)(108616004)(50986999)(110136001)(46102003)(6806004)(92566002)(33646002)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB043;
	H:xsj-pvapsmtpgw01; FPR:; SPF:None; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN1BFFO11HUB043;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1BFFO11HUB043; 
X-Forefront-PRVS: 04724A515E
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1BFFO11HUB043; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2015 03:32:08.6732 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB043
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1BFFO11HUB030;
X-OriginatorOrg: xilinx.com
Subject: [RFC 0/8] Update to Xen 4.5.0 and add AArch64 support
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
X-List-Received-Date: Fri, 30 Jan 2015 03:32:39 -0000
Content-Type: text/plain

This patch series updates the Xen recipes to use version 4.5.0 as well as
refactoring and adding support for AArch64.

The first 6 patches of this series are relatively trivial changes: adding
additional files to packages, updating dependencies and adding support for
additional architectures ontop of x86-64. The most important change is the
moving of some x86 of the packages from xen-base RDEPENDS to RRECOMMENDS.

Patches 7 and 8 are the reason for this set being a RFC instead of just a patch
set, I am after feedback regarding the changes I have made for these patches.
In these two patches I disabled the building of xen-qemu and seabios from
within the xen build system. There are a number of issues in wrapping the xen
build system within OE (including source fetching and cross building).

Instead of building qemu from within xen, I have configured the qemu which is
part of oe-core to build with xen support (PACKAGECONFIG_append = "xen"). Since
xen support is available in mainline qemu this allows for easier support of the
xen device emulation via qemu. The PACKAGECONFIG option in oe-core does need to
be updated to point to the correct depends (which is seperate to this patch
set).

SeaBIOS is disabled due to fetching issues as well as only being supported on
x86. I have not worked out the issues around this yet. I am querying as to
whether supporting it is desired, if so should it be via the xen build system
or as a seperate recipe?

Thanks,
Nathan

Nathan Rossi (8):
  xen: Fix and refactor common include
  xen: Add Build and Target architecture mapping
  xen: Move x86/arch specific components into RRECOMMENDS
  xen: Fix up architecture specific steps
  xen: Add aarch64 as compatible host
  xen-*image-minimal: Setup conditional based on MACHINE_FEATURES
  xen: Update recipe to 4.5.0
  xen-image-minimal: Install qemu instead of xen-qemu

 recipes-extended/images/xen-guest-image-minimal.bb |   2 +-
 recipes-extended/images/xen-image-minimal.bb       |   6 +-
 ...lask-avoid-installing-policy-file-as-boot.patch |  26 -----
 recipes-extended/xen/xen-arch.inc                  |  18 ++++
 recipes-extended/xen/xen.inc                       | 113 +++++++++++++++++----
 recipes-extended/xen/xen_4.3.1.bb                  |  24 -----
 recipes-extended/xen/xen_4.5.0.bb                  |  36 +++++++
 7 files changed, 150 insertions(+), 75 deletions(-)
 delete mode 100644 recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
 create mode 100644 recipes-extended/xen/xen-arch.inc
 delete mode 100644 recipes-extended/xen/xen_4.3.1.bb
 create mode 100644 recipes-extended/xen/xen_4.5.0.bb

-- 
2.1.1


