Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AE30E00757; Mon, 16 Feb 2015 00:34:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [207.46.100.59 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0059.outbound.protection.outlook.com [207.46.100.59])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46750E00746
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:34:53 -0800 (PST)
Received: from BL2FFO11HUB022.protection.gbl (10.173.161.46) by
	BL2FFO11HUB019.protection.gbl (10.173.160.111) with Microsoft SMTP
	Server (TLS) id 15.1.99.6; Mon, 16 Feb 2015 08:34:52 +0000
Received: from BL2FFO11FD050.protection.gbl (10.173.160.31) by
	BL2FFO11HUB022.protection.gbl (10.173.161.46) with Microsoft SMTP
	Server (TLS) id 15.1.99.6; Mon, 16 Feb 2015 08:34:51 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD050.mail.protection.outlook.com (10.173.161.212) with
	Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport; Mon, 16 Feb 2015
	08:34:51 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH53-0002nn-TH; Mon, 16 Feb 2015 00:31:01 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:22 +1000
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <a1cf9e8fd22746b8bc3b3017c13067b5@BL2FFO11FD050.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; gmail.com; dkim=none (message not
	signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(164054003)(199003)(189002)(6806004)(47776003)(19580395003)(92566002)(50226001)(62966003)(77156002)(110136001)(48376002)(50466002)(74316001)(86362001)(2420400003)(15975445007)(229853001)(2351001)(50986999)(85326001)(106466001)(108616004)(46102003)(92726002)(87936001)(53416004)(104016003)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB022;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BL2FFO11HUB022;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BL2FFO11HUB019; 
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BL2FFO11HUB022; BCL:0; PCL:0; RULEID:; SRVR:BL2FFO11HUB022;
X-Forefront-PRVS: 0489CFBAC9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:34:51.0958 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB022
X-OriginatorOrg: xilinx.com
Subject: [PATCH 00/14] Update to Xen 4.5.0 and add AArch64 support
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
X-List-Received-Date: Mon, 16 Feb 2015 08:34:57 -0000
Content-Type: text/plain

This patch series updates the Xen recipes to use version 4.5.0 as well as
refactoring and adding support for AArch64.

This series changes some of the default behaviour of Xen and how it builds the
hypervisor and its dependent components (e.g. SeaBIOS).

Firstly instead of building QEMU from within Xen, this series configures the Xen
build to use the QEMU which is part of oe-core which is built with Xen support.
Since Xen support is available in mainline QEMU this allows for easier support
of the Xen device emulation via QEMU without the need to manage two independent
versions of QEMU. The PACKAGECONFIG option in oe-core has been updated to allow
for this.

SeaBIOS, VGABIOS and IPXE have been extracted from the Xen build system in order
to allow for better cross compilation support as well and to handle dependencies
better between different architectures. As these components are only required
for x86 they depend on the HVM feature being enabled for Xen, this is enabled by
default in the Xen PACKAGECONFIG for all machines that have the x86
MACHINE_FEATURE.

The patches in this series are also available via the following remote/branch:
    remote: https://github.com/nathanrossi/meta-virtualization.git
    branch: nrossi/add-aarch64-support-v2

This patch series relies on the current master of oe-core, as the patch to QEMU
which enables Xen support within was only merged recently.
(http://git.openembedded.org/openembedded-core/commit/?id=d3c82cd6019ad43af489fdc518a3f8a9f31f6777)

Thanks,
Nathan

Chris Patterson (3):
  xen: break out firmware bits
  vgabios: DEPENDS on dev86-native
  seabios: minor cleanup

Nathan Rossi (11):
  xen: Fix and refactor common include
  xen: Add Build and Target architecture mapping
  xen: Move x86/arch specific components into RRECOMMENDS
  xen: Fix up architecture specific steps
  xen: Add aarch64 as compatible host
  xen-*image-minimal: Setup conditional based on MACHINE_FEATURES
  xen: Update recipe to 4.5.0
  xen-image-minimal: Install qemu instead of xen-qemu
  xen: Add support for systemd
  xen: Add patch to fix build failure on x86
  xen: Add 'hvm' PACKAGECONFIG for hvmloader building

 recipes-extended/images/xen-guest-image-minimal.bb |   2 +-
 recipes-extended/images/xen-image-minimal.bb       |   6 +-
 recipes-extended/ipxe/ipxe_git.bb                  |  31 ++++
 recipes-extended/seabios/seabios/defconfig         | 102 +++++++++++
 recipes-extended/seabios/seabios/hostcc.patch      |  21 +++
 recipes-extended/seabios/seabios_1.7.5.bb          |  45 +++++
 recipes-extended/vgabios/vgabios_0.7a.bb           |  31 ++++
 ...lask-avoid-installing-policy-file-as-boot.patch |  26 ---
 ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch |  28 +++
 recipes-extended/xen/xen-arch.inc                  |  18 ++
 recipes-extended/xen/xen.inc                       | 195 ++++++++++++++++-----
 recipes-extended/xen/xen_4.3.1.bb                  |  24 ---
 recipes-extended/xen/xen_4.5.0.bb                  |  50 ++++++
 13 files changed, 486 insertions(+), 93 deletions(-)
 create mode 100644 recipes-extended/ipxe/ipxe_git.bb
 create mode 100644 recipes-extended/seabios/seabios/defconfig
 create mode 100644 recipes-extended/seabios/seabios/hostcc.patch
 create mode 100644 recipes-extended/seabios/seabios_1.7.5.bb
 create mode 100644 recipes-extended/vgabios/vgabios_0.7a.bb
 delete mode 100644 recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
 create mode 100644 recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
 create mode 100644 recipes-extended/xen/xen-arch.inc
 delete mode 100644 recipes-extended/xen/xen_4.3.1.bb
 create mode 100644 recipes-extended/xen/xen_4.5.0.bb

-- 
2.1.1


