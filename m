Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA5FBE00902; Thu, 29 Jan 2015 19:33:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [207.46.100.96 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0096.outbound.protection.outlook.com [207.46.100.96])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57A4BE00874
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 19:33:01 -0800 (PST)
Received: from BN1AFFO11OLC003.protection.gbl (10.58.52.31) by
	BN1AFFO11HUB058.protection.gbl (10.58.52.209) with Microsoft SMTP
	Server (TLS) id 15.1.75.11; Fri, 30 Jan 2015 03:32:59 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11OLC003.mail.protection.outlook.com (10.58.53.74) with
	Microsoft SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Fri, 30 Jan 2015 03:32:59 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YH2Gt-0003g2-A0
	for meta-virtualization@yoctoproject.org;
	Thu, 29 Jan 2015 19:29:27 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 30 Jan 2015 13:31:41 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
References: <1422588708-17225-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21292.004
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <7636547b69e64ab292d7b4c3ba22cefc@BN1AFFO11OLC003.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(6009001)(50466002)(86362001)(19580395003)(19580405001)(62966003)(92726002)(46102003)(6806004)(53416004)(33646002)(92566002)(2361001)(108616004)(104016003)(76176999)(450100001)(77156002)(110136001)(47776003)(74316001)(229853001)(2351001)(2950100001)(50226001)(50986999)(106466001)(87936001)(48376002)(575784001)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB058;
	H:xsj-pvapsmtpgw01; FPR:; SPF:None; MLV:sfv; LANG:en; 
MIME-Version: 1.0
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
	header.d=none;yoctoproject.org; dmarc=none action=none
	header.from=xilinx.com;
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN1AFFO11HUB058;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1AFFO11HUB058; 
X-Forefront-PRVS: 04724A515E
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB058; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2015 03:32:59.4868 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB058
Subject: [RFC 1/8] xen: Fix and refactor common include
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
X-List-Received-Date: Fri, 30 Jan 2015 03:33:06 -0000
Content-Type: text/plain

* Add missing DEPENDS (dtc, lzo, libaio)
* Fix up QA issues around missing rdepends and un-shipped
  files/directories
* Add export for XEN_OS
* Add the /var/lib/xen directory as a volatile directory

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 recipes-extended/xen/xen.inc | 69 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index b121250..ed902b2 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -8,16 +8,41 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux'
 
-inherit autotools gettext setuptools update-rc.d
+inherit autotools-brokensep gettext setuptools update-rc.d
 
 PACKAGECONFIG ??= " \
     sdl \
-"
+    "
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
 
-DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python xz xz-native glib-2.0"
+DEPENDS = " \
+    bison-native \
+    dev86-native \
+    flex-native \
+    file-native \
+    iasl-native \
+    util-linux-native \
+    xz-native \
+    bridge-utils \
+    dtc \
+    gettext \
+    glib-2.0 \
+    iproute2 \
+    ncurses \
+    openssl \
+    pciutils \
+    pixman \
+    procps \
+    python \
+    libaio \
+    lzo \
+    util-linux \
+    xz \
+    yajl \
+    zlib \
+    "
 
 # inherit setuptools adds python to RDEPENDS, override it
 RDEPENDS_${PN} = ""
@@ -50,13 +75,24 @@ RDEPENDS_${PN}-base = "\
     ${PN}-xl \
     "
 
+RDEPENDS_${PN}-misc = " \
+    perl \
+    python \
+    "
+
+RDEPENDS_${PN}-remus = "python"
+
 RDEPENDS_${PN}-scripts-block = "\
+    bash \
     ${PN}-scripts-common \
     ${PN}-udev \
     ${PN}-volatiles \
     "
 
+RDEPENDS_${PN}-scripts-common = "bash"
+
 RDEPENDS_${PN}-scripts-network = "\
+    bash \
     bridge-utils \
     ${PN}-scripts-common \
     ${PN}-udev \
@@ -64,6 +100,7 @@ RDEPENDS_${PN}-scripts-network = "\
     "
 
 RDEPENDS_${PN}-xencommons = "\
+    bash \
     ${PN}-console \
     ${PN}-xenstore \
     ${PN}-xenstored \
@@ -71,6 +108,7 @@ RDEPENDS_${PN}-xencommons = "\
     "
 
 RDEPENDS_${PN}-xendomains = "\
+    bash \
     ${PN}-console \
     ${PN}-scripts-block \
     ${PN}-scripts-common \
@@ -79,6 +117,10 @@ RDEPENDS_${PN}-xendomains = "\
 
 RDEPENDS_${PN}-xl = "libgcc"
 
+RDEPENDS_${PN}-xentrace = "python"
+
+RDEPENDS_${PN}-xen-watchdog = "bash"
+
 PACKAGES = "\
     ${PN}-base \
     ${PN}-blktap \
@@ -156,8 +198,10 @@ FILES_${PN}-dbg += "\
     ${libdir}/fs/zfs/.debug \
     ${libdir}/fs/reiserfs/.debug \
     ${libdir}/fs/iso9660/.debug \
+    ${libdir}/fs/*/.debug \
     ${sbindir}/.debug \
     ${libdir}exec/.debug \
+    ${libdir}/xen/libexec/.debug \
     ${bindir}/.debug \
     ${libdir}/python2.7/dist-packages/.debug \
     ${libdir}/python2.7/dist-packages/xen/lowlevel/.debug \
@@ -299,6 +343,7 @@ FILES_${PN}-misc = "\
     ${sbindir}/xen-hvmctx \
     ${sbindir}/xenlockprof \
     ${sbindir}/xen-lowmemd \
+    ${sbindir}/xen-mfndump \
     "
 
 FILES_${PN}-pygrub = "\
@@ -323,8 +368,10 @@ FILES_${PN}-qemu = " \
     ${libdir}/xen/bin/qemu-dm \
     ${libdir}/xen/bin/virtfs-proxy-helper \
     /usr/libexec/qemu-bridge-helper \
+    ${libdir}/xen/libexec/qemu-bridge-helper \
     /usr/etc/qemu \
     /usr/etc/qemu/target-x86_64.conf \
+    ${libdir}/xen/etc/qemu/target-x86_64.conf \
     ${datadir}/qemu-xen \
     ${datadir}/qemu-xen/qemu \
     ${datadir}/qemu-xen/qemu/bamboo.dtb \
@@ -421,6 +468,7 @@ FILES_${PN}-scripts-block = " \
     ${sysconfdir}/xen/scripts/block-enbd \
     ${sysconfdir}/xen/scripts/block-iscsi \
     ${sysconfdir}/xen/scripts/block-nbd \
+    ${sysconfdir}/xen/scripts/block-drbd-probe \
     ${sysconfdir}/xen/scripts/vscsi \
     "
 
@@ -505,6 +553,7 @@ FILES_${PN}-xl = "\
     ${sysconfdir}/xen/xl.conf \
     ${libdir}/xen/bin/libxl-save-helper \
     ${sbindir}/xl \
+    ${libdir}/xen/bin/xen-init-dom0 \
     "
 
 FILES_${PN}-xl-examples = "\
@@ -522,7 +571,7 @@ FILES_${PN}-xm-examples = "\
     ${sysconfdir}/xen/xmexample.pv-grub \
     ${sysconfdir}/xen/xmexample.vti \
     "
-    
+
 FILES_${PN}-xenmon = "\
     ${sbindir}/xenbaked \
     ${sbindir}/xentrace_setmask \
@@ -546,6 +595,7 @@ FILES_${PN}-xend += " \
     "
 
 FILES_${PN}-xendomains += "\
+    ${libdir}/xen/bin/xendomains \
     ${sysconfdir}/default/xendomains \
     ${sysconfdir}/init.d/xendomains \
     ${sysconfdir}/sysconfig/xendomains \
@@ -572,6 +622,9 @@ export STAGING_LIBDIR
 export XEN_TARGET_ARCH="x86_64"
 export XEN_COMPILE_ARCH="x86_64"
 
+# hardcoded as Linux, as the only compatible hosts are Linux.
+export XEN_OS = "Linux"
+
 # this is used for the header (#!${bindir}/python) of the install python scripts
 export PYTHONPATH="${bindir}/python"
 
@@ -620,7 +673,11 @@ do_install() {
     oe_runmake DESTDIR="${D}" install
 
     # remove installed volatiles
-    rm -rf ${D}${localstatedir}/run ${D}${localstatedir}/lock ${D}${localstatedir}/log ${D}${localstatedir}/volatile
+    rm -rf ${D}${localstatedir}/run \
+        ${D}${localstatedir}/lock \
+        ${D}${localstatedir}/log \
+        ${D}${localstatedir}/volatile \
+        ${D}${localstatedir}/lib/xen
 
     # install volatiles using populate_volatiles mechanism
     install -d ${D}${sysconfdir}/default/volatiles
@@ -638,6 +695,8 @@ do_install() {
          >> ${D}${sysconfdir}/default/volatiles/99_xen
     echo "d root root 0755 ${localstatedir}/lock/subsys none" \
          >> ${D}${sysconfdir}/default/volatiles/99_xen
+    echo "d root root 0755 ${localstatedir}/lib/xen none" \
+         >> ${D}${sysconfdir}/default/volatiles/99_xen
 
     # workaround for xendomains script which searchs sysconfig if directory exists
     install -d ${D}${sysconfdir}/sysconfig
-- 
2.1.1


