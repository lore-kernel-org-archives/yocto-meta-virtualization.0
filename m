Return-Path: <Hong-Hua.Yin@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F0D9E0086B; Thu, 25 Sep 2014 01:53:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.104 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1928 seconds by postgrey-1.32 at yocto-www;
	Thu, 25 Sep 2014 01:53:46 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0104.outbound.protection.outlook.com [157.56.110.104])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC5F1E00868
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 01:53:46 -0700 (PDT)
Received: from CY1PR0301MB0730.namprd03.prod.outlook.com (25.160.159.148) by
	CY1PR0301MB1195.namprd03.prod.outlook.com (25.160.165.26) with
	Microsoft SMTP
	Server (TLS) id 15.0.1024.12; Thu, 25 Sep 2014 08:21:35 +0000
Received: from BN3PR0301CA0006.namprd03.prod.outlook.com (25.160.180.144) by
	CY1PR0301MB0730.namprd03.prod.outlook.com (25.160.159.148) with
	Microsoft
	SMTP Server (TLS) id 15.0.1034.13; Thu, 25 Sep 2014 08:21:34 +0000
Received: from BY2FFO11FD019.protection.gbl (2a01:111:f400:7c0c::179) by
	BN3PR0301CA0006.outlook.office365.com (2a01:111:e400:4000::16) with
	Microsoft SMTP Server (TLS) id 15.0.1039.15 via Frontend Transport;
	Thu, 25 Sep 2014 08:21:33 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD019.mail.protection.outlook.com (10.1.14.107) with Microsoft
	SMTP
	Server (TLS) id 15.0.1029.15 via Frontend Transport; Thu, 25 Sep 2014
	08:21:33 +0000
Received: from titan.ap.freescale.net ([10.192.208.233])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s8P8LUDj029168; Thu, 25 Sep 2014 01:21:31 -0700
From: Olivia Yin <r63875@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 25 Sep 2014 16:21:16 +0800
Message-ID: <1411633276-18572-1-git-send-email-r63875@freescale.com>
X-Mailer: git-send-email 2.1.0.27.g96db324
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(47776003)(50986999)(104166001)(15975445006)(88136002)(77156001)(81342003)(2351001)(81542003)(64706001)(107046002)(85852003)(74662003)(106466001)(77982003)(74502003)(46102003)(62966002)(83072002)(21056001)(80022003)(229853001)(20776003)(84676001)(92566001)(575784001)(89996001)(76482002)(83322001)(85306004)(36756003)(6806004)(105606002)(4396001)(79102003)(15202345003)(87286001)(90102001)(48376002)(110136001)(50466002)(44976005)(15395725005)(102836001)(31966008)(93916002)(10300001)(50226001)(33646002)(120916001)(19580395003)(92726001)(95666004)(104016003)(97736003)(87936001)(68736004)(99396003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0730;
	H:tx30smr01.am.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0730;
X-Forefront-PRVS: 0345CFD558
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=Hong-Hua.Yin@freescale.com; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;
X-OriginatorOrg: freescale.com
Cc: Olivia Yin <r63875@freescale.com>
Subject: [PATCH] libvirt: uprev to v1.2.8
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
X-List-Received-Date: Thu, 25 Sep 2014 08:53:51 -0000
Content-Type: text/plain

---
 .../libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb}      | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)
 rename recipes-extended/libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb} (91%)

diff --git a/recipes-extended/libvirt/libvirt_1.2.4.bb b/recipes-extended/libvirt/libvirt_1.2.8.bb
similarity index 91%
rename from recipes-extended/libvirt/libvirt_1.2.4.bb
rename to recipes-extended/libvirt/libvirt_1.2.8.bb
index 56b4d4b..cdcd54b 100644
--- a/recipes-extended/libvirt/libvirt_1.2.4.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.8.bb
@@ -24,16 +24,12 @@ RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
 RCONFLICTS_${PN}_libvirtd = "connman"
 
 SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
-           file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
            file://libvirtd.sh \
            file://libvirtd.conf \
-           file://runptest.patch \
-           file://run-ptest \
-           file://tests-allow-separated-src-and-build-dirs.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "da7a9ca519df45a460659189fe0024e6"
-SRC_URI[libvirt.sha256sum] = "e43ac5f6b2baeafcd01777be03a897e636f8d48c0cdfb4c4cbb80d45faa9e875"
+SRC_URI[libvirt.md5sum] = "75114991290f7c8f01dd5223431b9c00"
+SRC_URI[libvirt.sha256sum] = "0049940b013ea5858b53d9b540c9df9cc3c8cb08750acfd96e9991a1f709e100"
 
 inherit autotools gettext update-rc.d pkgconfig ptest
 
@@ -68,10 +64,6 @@ ac_cv_path_LVS=/usr/sbin/lvs \
 ac_cv_path_PARTED=/usr/sbin/parted \
 ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
 
-# Ensure that libvirt uses polkit rather than policykit, whether the host has
-# pkcheck installed or not, and ensure the path is correct per our config.
-CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
-
 # Some other possible paths we are not yet setting
 #ac_cv_path_RPCGEN=
 #ac_cv_path_XSLTPROC=
@@ -80,6 +72,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
 #ac_cv_path_EBTABLES_PATH=
 #ac_cv_path_PKG_CONFIG=
 #ac_cv_path_ac_pt_PKG_CONFIG
+#ac_cv_path_PKCHECK_PATH=
 #ac_cv_path_POLKIT_AUTH=
 #ac_cv_path_DTRACE=
 #ac_cv_path_ISCSIADM=
@@ -172,7 +165,6 @@ PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EB
 PACKAGECONFIG[python] = ",,python,"
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
 PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
-PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
 PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
 
 # Enable the Python tool support
@@ -203,9 +195,6 @@ do_install_append() {
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
 	echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
 	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-
-	# Add hook support for libvirt
-	mkdir -p ${D}/etc/libvirt/hooks 
 }
 
 EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"
-- 
2.1.0.27.g96db324


