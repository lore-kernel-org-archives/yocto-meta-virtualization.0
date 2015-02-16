Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B41E3E00753; Mon, 16 Feb 2015 00:34:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.99 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0099.outbound.protection.outlook.com [157.56.111.99])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECED0E00754
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:34:55 -0800 (PST)
Received: from BY2FFO11FD020.protection.gbl (10.1.14.34) by
	BY2FFO11HUB011.protection.gbl (10.1.15.222) with Microsoft SMTP Server
	(TLS) id 15.1.99.6; Mon, 16 Feb 2015 08:34:50 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BY2FFO11FD020.mail.protection.outlook.com (10.1.14.137) with Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:34:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH53-0002nh-Qw; Mon, 16 Feb 2015 00:31:01 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:23 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <f1dd83fd8647448fb248736c51defbae@BY2FFO11FD020.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; gmail.com; dkim=none (message not
	signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(199003)(189002)(62966003)(47776003)(19580395003)(6806004)(19580405001)(92566002)(48376002)(50466002)(77156002)(50226001)(74316001)(110136001)(575784001)(86362001)(229853001)(2351001)(50986999)(76176999)(85326001)(106466001)(108616004)(53416004)(87936001)(46102003)(92726002)(104016003)(2950100001)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2FFO11HUB011;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2FFO11HUB011;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY2FFO11HUB011; BCL:0; PCL:0; RULEID:; SRVR:BY2FFO11HUB011;
X-Forefront-PRVS: 0489CFBAC9
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:34:50.1307 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2FFO11HUB011
Subject: [PATCH 01/14] xen: Fix and refactor common include
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
X-List-Received-Date: Mon, 16 Feb 2015 08:34:58 -0000
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


