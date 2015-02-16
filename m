Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54C40E00750; Mon, 16 Feb 2015 00:35:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.93 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0093.outbound.protection.outlook.com [157.56.111.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFB87E008BF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:35:03 -0800 (PST)
Received: from BY2FFO11FD027.protection.gbl (10.1.14.32) by
	BY2FFO11HUB028.protection.gbl (10.1.14.139) with Microsoft SMTP Server
	(TLS) id 15.1.99.6; Mon, 16 Feb 2015 08:35:00 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BY2FFO11FD027.mail.protection.outlook.com (10.1.15.216) with Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:35:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH5E-0002oJ-Du; Mon, 16 Feb 2015 00:31:12 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:34 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <ff09ca8059494cf8962243af75304e20@BY2FFO11FD027.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; gmail.com; dkim=none (message not
	signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(199003)(189002)(46102003)(92726002)(106466001)(2351001)(229853001)(50986999)(76176999)(85326001)(2950100001)(104016003)(53416004)(108616004)(87936001)(92566002)(19580395003)(19580405001)(6806004)(47776003)(74316001)(62966003)(110136001)(77156002)(86362001)(50226001)(50466002)(48376002)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB028;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB028;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY2FFO11HUB028; BCL:0; PCL:0; RULEID:; SRVR:BY2FFO11HUB028;
X-Forefront-PRVS: 0489CFBAC9
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:35:00.8229 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2FFO11HUB028
Subject: [PATCH 12/14] xen: Add 'hvm' PACKAGECONFIG for hvmloader building
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
X-List-Received-Date: Mon, 16 Feb 2015 08:35:18 -0000
Content-Type: text/plain

* The 'hvm' PACKAGECONFIG (which is valid for x86 targets, and default
  enabled for x86-64 targets) enables building the hvmloader with
  in-built seabios, ipxe and vgabios firmware

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 recipes-extended/xen/xen.inc      | 5 ++++-
 recipes-extended/xen/xen_4.5.0.bb | 7 ++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 3f703ce..0e4136a 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -15,11 +15,13 @@ require xen-arch.inc
 PACKAGECONFIG ??= " \
     sdl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
     "
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
+PACKAGECONFIG[hvm] = "--with-system-seabios="${STAGING_DIR_HOST}/usr/share/firmware/bios.bin",--disable-seabios,seabios ipxe vgabios,"
 
 DEPENDS = " \
     bison-native \
@@ -686,7 +688,8 @@ EXTRA_OECONF += " \
     --disable-ioemu-stubdom \
     --disable-pv-grub \
     --disable-xenstore-stubdom \
-"
+    --disable-rombios \
+    "
 
 do_configure() {
     # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
index cef0665..6c17b90 100644
--- a/recipes-extended/xen/xen_4.5.0.bb
+++ b/recipes-extended/xen/xen_4.5.0.bb
@@ -19,9 +19,14 @@ EXTRA_OECONF_append += " \
     --with-sysconfig-leaf-dir=default \
     --with-system-qemu=/usr/bin/qemu-system-i386 \
     --disable-qemu-traditional \
-    --disable-seabios \
     "
 
+EXTRA_OEMAKE += "STDVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.bin"
+EXTRA_OEMAKE += "CIRRUSVGA_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios-0.7a.cirrus.bin"
+EXTRA_OEMAKE += "SEABIOS_ROM=${STAGING_DIR_HOST}/usr/share/firmware/bios.bin"
+EXTRA_OEMAKE += "ETHERBOOT_ROMS=${STAGING_DIR_HOST}/usr/share/firmware/rtl8139.rom"
+#EXTRA_OEMAKE += "XENGFX_ROM=${STAGING_DIR_HOST}/usr/share/firmware/vgabios.bin"
+
 do_configure_prepend() {
     # fixup AS/CC/CCP/etc variable within StdGNU.mk
     for i in AS LD CC CPP AR RANLIB NM STRIP OBJCOPY OBJDUMP; do
-- 
2.1.1


