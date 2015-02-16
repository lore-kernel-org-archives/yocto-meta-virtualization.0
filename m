Return-Path: <nathan.rossi@xilinx.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C6F6E0074C; Mon, 16 Feb 2015 00:34:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.90 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0090.outbound.protection.outlook.com [65.55.169.90])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D9B1E00749
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 00:34:52 -0800 (PST)
Received: from BL2FFO11FD039.protection.gbl (10.173.160.31) by
	BL2FFO11HUB028.protection.gbl (10.173.161.52) with Microsoft SMTP
	Server (TLS) id 15.1.99.6; Mon, 16 Feb 2015 08:34:50 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD039.mail.protection.outlook.com (10.173.161.135) with
	Microsoft
	SMTP Server (TLS) id 15.1.99.6 via Frontend Transport; Mon, 16 Feb 2015
	08:34:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>)
	id 1YNH53-0002na-Ma; Mon, 16 Feb 2015 00:31:01 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Feb 2015 18:34:26 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
References: <1424075676-28287-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21334.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <92da74969ea1430793e90bf0968b985d@BL2FFO11FD039.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: PermError (protection.outlook.com: domain of xilinx.com used an
	invalid SPF mechanism)
Authentication-Results: spf=permerror (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; gmail.com; dkim=none (message not
	signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(448002)(199003)(189002)(46102003)(85326001)(2351001)(92566002)(48376002)(50466002)(50986999)(76176999)(229853001)(62966003)(110136001)(77156002)(86362001)(92726002)(74316001)(6806004)(53416004)(47776003)(106466001)(19580395003)(19580405001)(87936001)(104016003)(50226001)(2950100001)(108616004)(107986001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB028;
	H:xsj-pvapsmtpgw01; FPR:; SPF:PermError; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB028;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BL2FFO11HUB028; BCL:0; PCL:0; RULEID:; SRVR:BL2FFO11HUB028;
X-Forefront-PRVS: 0489CFBAC9
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2015 08:34:50.5876 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB028
Subject: [PATCH 04/14] xen: Fix up architecture specific steps
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
X-List-Received-Date: Mon, 16 Feb 2015 08:34:54 -0000
Content-Type: text/plain

* Remove version specific sed pattern
* Add 'xen' as an output product instead of just 'xen.gz' as some
  architectures do not generate the 'xen.gz'

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 recipes-extended/xen/xen.inc | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index 54d6ffe..c8fad6c 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -274,6 +274,8 @@ FILES_${PN}-libfsimage-dev = "${libdir}/libfsimage.so"
 FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
 
 FILES_${PN}-hypervisor = "\
+    /boot/xen-* \
+    /boot/xen \
     /boot/xen-*.gz \
     /boot/xen.gz \
     /boot/xen-syms-* \
@@ -656,20 +658,18 @@ EXTRA_OECONF += " \
 
 do_configure() {
     # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
-    test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gnu
     if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
-        cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h | grep -v stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg > ${S}/tools/include/gnu/stubs-32.h
-        echo \#define __stub___kernel_cosl >> ${S}/tools/include/gnu/stubs-32.h
-        echo \#define __stub___kernel_sinl >> ${S}/tools/include/gnu/stubs-32.h
-        echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/stubs-32.h
+        if test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h ; then
+            test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gnu
+            cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h | grep -v stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg > ${S}/tools/include/gnu/stubs-32.h
+            echo \#define __stub___kernel_cosl >> ${S}/tools/include/gnu/stubs-32.h
+            echo \#define __stub___kernel_sinl >> ${S}/tools/include/gnu/stubs-32.h
+            echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/stubs-32.h
+        fi
     fi
 
     # do configure
     oe_runconf
-
-    # seabios needs a patch to specify correct compiler - pull and patch Makefile
-    make -C ${S}/tools/firmware seabios-dir
-    sed -i 's/export HOSTCC.*$(CC)/export HOSTCC ?= $(CC)/g' ${S}/tools/firmware/seabios-dir/Makefile
 }
 
 do_compile() {
@@ -720,5 +720,10 @@ sysroot_stage_all_append() {
     sysroot_stage_dir ${D}/boot ${SYSROOT_DESTDIR}/kernel
 
     install -d ${DEPLOY_DIR_IMAGE}
-    install -m 0644 ${D}/boot/xen.gz ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
+    if [ -f ${D}/boot/xen ]; then
+        install -m 0644 ${D}/boot/xen ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}
+    fi
+    if [ -f ${D}/boot/xen.gz ]; then
+        install -m 0644 ${D}/boot/xen.gz ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
+    fi
 }
-- 
2.1.1


