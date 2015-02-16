Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99976E00809; Mon, 16 Feb 2015 00:35:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [157.56.110.84 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0084.outbound.protection.outlook.com [157.56.110.84])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C855E0074C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:35:05 -0800 (PST)
Received: from BL2FFO11FD008.protection.gbl (10.173.160.31) by
	BL2FFO11HUB031.protection.gbl (10.173.161.55) with Microsoft SMTP
	Server (TLS) id 15.1.99.6; Mon, 16 Feb 2015 08:35:04 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD008.mail.protection.outlook.com (10.173.161.4) with Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:35:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH5G-0002p5-Or; Mon, 16 Feb 2015 00:31:14 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:29 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <b3a9840b2ab840b0908d0e08504a020f@BL2FFO11FD008.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; gmail.com; dkim=none (message not
	signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(199003)(189002)(46102003)(85326001)(2351001)(92566002)(48376002)(50466002)(50986999)(76176999)(229853001)(62966003)(110136001)(77156002)(86362001)(92726002)(74316001)(15975445007)(53416004)(47776003)(19580405001)(6806004)(106466001)(19580395003)(87936001)(104016003)(50226001)(575784001)(2950100001)(108616004)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB031;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB031;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BL2FFO11HUB031; BCL:0; PCL:0; RULEID:; SRVR:BL2FFO11HUB031;
X-Forefront-PRVS: 0489CFBAC9
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:35:03.9787 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB031
Subject: [PATCH 07/14] xen: Update recipe to 4.5.0
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

* Added configure step to fix handling of the CC, AS, etc. variables
  within the xen build scripts.
* Add configure options for handling of system config directories for
  cross building
* Use the qemu provided by oe instead of the xen built version for
  consistency as well as to remove the need to have two seperate flows
  for building qemu
* Disable building of SeaBIOS
* Removed no longer needed patches

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>

squish
---
 ...lask-avoid-installing-policy-file-as-boot.patch | 26 ----------------
 recipes-extended/xen/xen_4.3.1.bb                  | 24 ---------------
 recipes-extended/xen/xen_4.5.0.bb                  | 36 ++++++++++++++++++++++
 3 files changed, 36 insertions(+), 50 deletions(-)
 delete mode 100644 recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
 delete mode 100644 recipes-extended/xen/xen_4.3.1.bb
 create mode 100644 recipes-extended/xen/xen_4.5.0.bb

diff --git a/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch b/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
deleted file mode 100644
index d980807..0000000
--- a/recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8bff3edead4318bfebc487f929f833d11922c238 Mon Sep 17 00:00:00 2001
-From: "Vadim A. Misbakh-Soloviov" <mva@mva.name>
-Date: Tue, 30 Jul 2013 16:34:38 +0400
-Subject: [PATCH] flask: avoid installing policy file as '/boot'
-
-Signed-off-by: Vadim A. Misbakh-Soloviov <mva@mva.name>
-Acked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov>
----
- tools/flask/policy/Makefile |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/flask/policy/Makefile b/tools/flask/policy/Makefile
-index e666f3e..df1e8f3 100644
---- a/tools/flask/policy/Makefile
-+++ b/tools/flask/policy/Makefile
-@@ -103,6 +103,7 @@ POLICY_SECTIONS += $(USERS) $(CONSTRAINTS) $(ISID_DEFS)
- all: $(POLICY_FILENAME)
- 
- install: $(POLICY_FILENAME)
-+	$(INSTALL_DIR) $(POLICY_LOADPATH)
- 	$(INSTALL_DATA) $^ $(POLICY_LOADPATH)
- 
- $(POLICY_FILENAME): policy.conf
--- 
-1.7.10.4
-
diff --git a/recipes-extended/xen/xen_4.3.1.bb b/recipes-extended/xen/xen_4.3.1.bb
deleted file mode 100644
index 2c9806b..0000000
--- a/recipes-extended/xen/xen_4.3.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require xen.inc
-
-SRC_URI = " \
-    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
-    file://flask-avoid-installing-policy-file-as-boot.patch \
-    "
-
-SRC_URI[md5sum] = "7616b8704e1ab89c81f011f0e3703bc8"
-SRC_URI[sha256sum] = "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d26a9fd"
-
-S = "${WORKDIR}/xen-${PV}"
-
-RDEPENDS_${PN}-base += "\
-    ${PN}-libblktap \
-    ${PN}-flask \
-    "
-
-do_configure_prepend() {
-    # fixup qemu-xen-traditional pciutils check hardcoded to test /usr/include/pci
-    sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g' ${S}/tools/qemu-xen-traditional/xen-hooks.mak
-
-    # fixup for qemu to cross compile
-    sed -i 's/configure --d/configure --cross-prefix=${TARGET_PREFIX} --d/g' ${S}/tools/qemu-xen-traditional/xen-setup
-}
diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
new file mode 100644
index 0000000..62d1d87
--- /dev/null
+++ b/recipes-extended/xen/xen_4.5.0.bb
@@ -0,0 +1,36 @@
+require xen.inc
+
+SRC_URI = " \
+    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
+    "
+
+SRC_URI[md5sum] = "9bac43d2419d05a647064d9253bb03fa"
+SRC_URI[sha256sum] = "5bdb40e2b28d2eeb541bd71a9777f40cbe2ae444b987521d33f099541a006f3b"
+
+S = "${WORKDIR}/xen-${PV}"
+
+# Xen suffixes the libexecdir within its configure scripts, prevent the nested xen/xen/
+libexecdir = "${libdir}"
+
+# These options override detected values from the build.
+EXTRA_OECONF_append += " \
+    --with-initddir=${INIT_D_DIR} \
+    --with-sysconfig-leaf-dir=default \
+    --with-system-qemu=/usr/bin/qemu-system-i386 \
+    --disable-qemu-traditional \
+    --disable-seabios \
+    "
+
+do_configure_prepend() {
+    # fixup AS/CC/CCP/etc variable within StdGNU.mk
+    for i in AS LD CC CPP AR RANLIB NM STRIP OBJCOPY OBJDUMP; do
+        sed -i "s/^\($i\s\s*\).*=/\1?=/" ${S}/config/StdGNU.mk
+    done
+    # fixup environment passing in some makefiles
+    sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
+}
+
+do_install_append() {
+    # fixup default path to qemu-system-i386
+    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
+}
-- 
2.1.1


