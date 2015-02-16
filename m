Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 742C3E008E3; Mon, 16 Feb 2015 00:35:23 -0800 (PST)
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
	*      [65.55.169.100 listed in list.dnswl.org]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0100.outbound.protection.outlook.com [65.55.169.100])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE9EBE00754
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:35:04 -0800 (PST)
Received: from BY2FFO11FD031.protection.gbl (10.1.14.30) by
	BY2FFO11HUB040.protection.gbl (10.1.14.161) with Microsoft SMTP Server
	(TLS) id 15.1.87.10; Mon, 16 Feb 2015 08:35:02 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BY2FFO11FD031.mail.protection.outlook.com (10.1.14.196) with Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:35:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH5F-0002ox-C0; Mon, 16 Feb 2015 00:31:13 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:28 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <94534a8d9ee644f5916ba107e1b9600c@BY2FFO11FD031.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(86362001)(62966003)(229853001)(77156002)(87936001)(50226001)(50986999)(92726002)(19580395003)(92566002)(2950100001)(6806004)(48376002)(2351001)(76176999)(108616004)(53416004)(110136001)(85326001)(19580405001)(50466002)(106466001)(104016003)(46102003)(74316001)(47776003)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB040;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB040;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY2FFO11HUB040; 
X-Forefront-PRVS: 0489CFBAC9
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB040;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:35:01.7720 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2FFO11HUB040
Subject: [PATCH 06/14] xen-*image-minimal: Setup conditional based on MACHINE_FEATURES
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
X-List-Received-Date: Mon, 16 Feb 2015 08:35:23 -0000
Content-Type: text/plain

* Conditionally add packages to the image depending on whether the
  machine supports the respective feature

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 recipes-extended/images/xen-guest-image-minimal.bb | 2 +-
 recipes-extended/images/xen-image-minimal.bb       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
index bcac4d7..f13940c 100644
--- a/recipes-extended/images/xen-guest-image-minimal.bb
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -4,7 +4,7 @@ inherit core-image
 
 IMAGE_INSTALL += " \
     packagegroup-core-boot \
-    kernel-module-xen-acpi-processor \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
     "
 
 IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
index 13917c5..aed0526 100644
--- a/recipes-extended/images/xen-image-minimal.bb
+++ b/recipes-extended/images/xen-image-minimal.bb
@@ -5,12 +5,12 @@ INITRD_IMAGE = "core-image-minimal-initramfs"
 IMAGE_INSTALL += " \
     packagegroup-core-boot \
     packagegroup-core-ssh-openssh \
-    kernel-module-xen-acpi-processor \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'acpi', 'kernel-module-xen-acpi-processor', '', d)} \
     kernel-module-xen-blkback \
     kernel-module-xen-gntalloc \
     kernel-module-xen-gntdev \
     kernel-module-xen-netback \
-    kernel-module-xen-pciback \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'kernel-module-xen-pciback', '', d)} \
     kernel-module-xen-wdt \
     xen-base \
     xen-qemu \
-- 
2.1.1


