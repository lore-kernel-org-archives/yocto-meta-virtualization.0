Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7D58E00824; Mon, 16 Feb 2015 00:35:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.57 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0057.outbound.protection.outlook.com [157.56.110.57])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65D37E008DD
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:35:04 -0800 (PST)
Received: from BN1AFFO11FD010.protection.gbl (10.58.52.32) by
	BN1AFFO11HUB058.protection.gbl (10.58.52.209) with Microsoft SMTP
	Server (TLS) id 15.1.87.10; Mon, 16 Feb 2015 08:35:02 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1AFFO11FD010.mail.protection.outlook.com (10.58.52.70) with Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport;
	Mon, 16 Feb 2015 08:35:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH5E-0002of-Mm; Mon, 16 Feb 2015 00:31:12 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:31 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <9ce5da9686c140b69f110a1cdc5bf56e@BN1AFFO11FD010.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(448002)(85326001)(19580405001)(19580395003)(6806004)(53416004)(47776003)(74316001)(2950100001)(33646002)(104016003)(87936001)(92726002)(50986999)(48376002)(62966003)(50466002)(77156002)(92566002)(50226001)(106466001)(2351001)(76176999)(108616004)(575784001)(110136001)(86362001)(46102003)(229853001)(107986001)(24736002)(23106004)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB058;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:ovrnspm;
	PTR:unknown-60-83.xilinx.com; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB058;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1AFFO11HUB058; 
X-Forefront-PRVS: 0489CFBAC9
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB058; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:35:01.6955 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB058
Subject: [PATCH 09/14] xen: Add support for systemd
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

* Refactor volatiles so that it generates sysvinit/populate-volatiles as
  well as tmpfiles.d configs
* Add systemd PACKAGECONFIG for enabling systemd support
* Setup SYSTEMD_SERVICE variables
* Add FILES values for systemd .service/.mount/etc files
* sed patterns to the 4.5.0 recipe to  fix some issues with the source
  around qemu-system-i386 and libsystemd-daemon

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 recipes-extended/xen/xen.inc      | 81 ++++++++++++++++++++++++++++++---------
 recipes-extended/xen/xen_4.5.0.bb |  8 ++++
 2 files changed, 70 insertions(+), 19 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 82bb3d2..3f703ce 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -8,16 +8,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
 
 COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux'
 
-inherit autotools-brokensep gettext setuptools update-rc.d
+inherit autotools-brokensep gettext setuptools update-rc.d systemd
 
 require xen-arch.inc
 
 PACKAGECONFIG ??= " \
     sdl \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     "
 
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
 PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
 
 DEPENDS = " \
     bison-native \
@@ -111,6 +113,7 @@ RDEPENDS_${PN}-xencommons = "\
     ${PN}-console \
     ${PN}-xenstore \
     ${PN}-xenstored \
+    ${PN}-xl \
     ${PN}-scripts-common \
     "
 
@@ -499,6 +502,7 @@ FILES_${PN}-udev = "\
 
 FILES_${PN}-volatiles = "\
     ${sysconfdir}/default/volatiles/99_xen \
+    ${sysconfdir}/tmpfiles.d/xen.conf \
     "
 
 FILES_${PN}-xcutils = "\
@@ -555,6 +559,7 @@ FILES_${PN}-xentrace = "\
 FILES_${PN}-xen-watchdog = "\
     ${sbindir}/xenwatchdogd \
     ${sysconfdir}/init.d/xen-watchdog \
+    ${systemd_unitdir}/system/xen-watchdog.service \
     "
 
 FILES_${PN}-xl = "\
@@ -596,6 +601,15 @@ FILES_${PN}-xm = "\
 FILES_${PN}-xencommons += "\
     ${sysconfdir}/default/xencommons \
     ${sysconfdir}/init.d/xencommons \
+    ${systemd_unitdir}/modules-load.d/xen.conf \
+    ${systemd_unitdir}/system/proc-xen.mount \
+    ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
+    ${systemd_unitdir}/system/xenconsoled.service \
+    ${systemd_unitdir}/system/xen-init-dom0.service \
+    ${systemd_unitdir}/system/xenstored.service \
+    ${systemd_unitdir}/system/xenstored.socket \
+    ${systemd_unitdir}/system/xenstored_ro.socket \
+    ${systemd_unitdir}/system/var-lib-xenstored.mount \
     "
 
 FILES_${PN}-xend += " \
@@ -608,6 +622,7 @@ FILES_${PN}-xendomains += "\
     ${sysconfdir}/default/xendomains \
     ${sysconfdir}/init.d/xendomains \
     ${sysconfdir}/sysconfig/xendomains \
+    ${systemd_unitdir}/system/xendomains.service \
     "
 
 # configure init.d scripts
@@ -621,6 +636,21 @@ INITSCRIPT_PARAMS_${PN}-xend = "defaults 82"
 INITSCRIPT_NAME_${PN}-xendomains = "xendomains"
 INITSCRIPT_PARAMS_${PN}-xendomains = "defaults 83"
 
+# systemd packages
+SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains"
+SYSTEMD_SERVICE_${PN}-watchdog = "xen-watchdog.service"
+SYSTEMD_SERVICE_${PN}-xencommons = " \
+    proc-xen.mount \
+    var-lib-xenstored.mount \
+    xen-qemu-dom0-disk-backend.service \
+    xenconsoled.service \
+    xen-init-dom0.service \
+    xenstored.service \
+    xenstored.socket \
+    xenstored_ro.socket \
+    "
+SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
+
 #### REQUIRED ENVIRONMENT VARIABLES ####
 export BUILD_SYS
 export HOST_SYS
@@ -650,6 +680,8 @@ EXTRA_OECONF += " \
     --exec-prefix=/usr \
     --prefix=/usr \
     --host=${HOST_SYS} \
+    --with-systemd=${systemd_unitdir}/system \
+    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
     --disable-stubdom \
     --disable-ioemu-stubdom \
     --disable-pv-grub \
@@ -686,33 +718,44 @@ do_install() {
         ${D}${localstatedir}/volatile \
         ${D}${localstatedir}/lib/xen
 
+    VOLATILE_DIRS=" \
+        ${localstatedir}/run/xenstored \
+        ${localstatedir}/run/xend \
+        ${localstatedir}/run/xend/boot \
+        ${localstatedir}/run/xen \
+        ${localstatedir}/log/xen \
+        ${localstatedir}/lock/xen \
+        ${localstatedir}/lock/subsys \
+        ${localstatedir}/lib/xen \
+        "
+
     # install volatiles using populate_volatiles mechanism
     install -d ${D}${sysconfdir}/default/volatiles
-    echo "d root root 0755 ${localstatedir}/run/xenstored none" \
-         > ${D}${sysconfdir}/default/volatiles/99_xen
-    echo "d root root 0755 ${localstatedir}/run/xend none" \
-         >> ${D}${sysconfdir}/default/volatiles/99_xen
-    echo "d root root 0755 ${localstatedir}/run/xend/boot none" \
-         >> ${D}${sysconfdir}/default/volatiles/99_xen
-    echo "d root root 0755 ${localstatedir}/run/xen none" \
-         >> ${D}${sysconfdir}/default/volatiles/99_xen
-    echo "d root root 0755 ${localstatedir}/log/xen none" \
-         >> ${D}${sysconfdir}/default/volatiles/99_xen
-    echo "d root root 0755 ${localstatedir}/lock/xen none" \
-         >> ${D}${sysconfdir}/default/volatiles/99_xen
-    echo "d root root 0755 ${localstatedir}/lock/subsys none" \
-         >> ${D}${sysconfdir}/default/volatiles/99_xen
-    echo "d root root 0755 ${localstatedir}/lib/xen none" \
-         >> ${D}${sysconfdir}/default/volatiles/99_xen
+    for i in $VOLATILE_DIRS; do
+        echo "d root root 0755 $i none"  >> ${D}${sysconfdir}/default/volatiles/99_xen
+    done
 
     # workaround for xendomains script which searchs sysconfig if directory exists
     install -d ${D}${sysconfdir}/sysconfig
     ln -sf ${sysconfdir}/default/xendomains ${D}${sysconfdir}/sysconfig/xendomains
+
+    # systemd
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        # install volatiles using systemd tmpfiles.d
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        for i in $VOLATILE_DIRS; do
+            echo "d $i 0755 root root - -"  >> ${D}${sysconfdir}/tmpfiles.d/xen.conf
+        done
+    fi
 }
 
 pkg_postinst_${PN}-volatiles() {
-    if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
-        ${sysconfdir}/init.d/populate-volatile.sh update
+    if [ -z "$D" ]; then
+        if command -v systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/xen.conf
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
     fi
 }
 
diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/xen_4.5.0.bb
index 62d1d87..5f8c087 100644
--- a/recipes-extended/xen/xen_4.5.0.bb
+++ b/recipes-extended/xen/xen_4.5.0.bb
@@ -28,9 +28,17 @@ do_configure_prepend() {
     done
     # fixup environment passing in some makefiles
     sed -i 's#\(\w*\)=\(\$.\w*.\)#\1="\2"#' ${S}/tools/firmware/Makefile
+
+    # libsystemd-daemon -> libsystemd for newer systemd versions
+    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
 }
 
 do_install_append() {
     # fixup default path to qemu-system-i386
     sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#' ${D}/etc/init.d/xencommons
+
+    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service ]; then
+        sed -i 's#ExecStart=.*qemu-system-i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
+            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service
+    fi
 }
-- 
2.1.1


