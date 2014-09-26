Return-Path: <Hong-Hua.Yin@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8E690E00874; Thu, 25 Sep 2014 19:00:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.147 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0147.outbound.protection.outlook.com [157.56.110.147])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10140E00790
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 19:00:28 -0700 (PDT)
Received: from DM2PR03CA0005.namprd03.prod.outlook.com (10.141.96.15) by
	BY2PR0301MB0726.namprd03.prod.outlook.com (25.160.63.16) with Microsoft
	SMTP Server (TLS) id 15.0.1034.13; Fri, 26 Sep 2014 01:26:31 +0000
Received: from BN1BFFO11FD005.protection.gbl (2a01:111:f400:7c10::1:143) by
	DM2PR03CA0005.outlook.office365.com (2a01:111:e400:2428::15) with
	Microsoft SMTP Server (TLS) id 15.0.1024.12 via Frontend Transport;
	Fri, 26 Sep 2014 01:26:30 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD005.mail.protection.outlook.com (10.58.144.68) with
	Microsoft SMTP
	Server (TLS) id 15.0.1029.15 via Frontend Transport; Fri, 26 Sep 2014
	01:26:30 +0000
Received: from titan.ap.freescale.net ([10.192.208.233])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s8Q1QRot025068;
	Thu, 25 Sep 2014 18:26:28 -0700
From: Olivia Yin <r63875@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 26 Sep 2014 09:26:12 +0800
Message-ID: <1411694772-46081-1-git-send-email-r63875@freescale.com>
X-Mailer: git-send-email 2.1.0.27.g96db324
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(84676001)(6806004)(87286001)(85306004)(64706001)(92726001)(575784001)(87936001)(15975445006)(15202345003)(77156001)(77982003)(44976005)(68736004)(110136001)(19580395003)(19580405001)(47776003)(83072002)(83322001)(48376002)(99396003)(120916001)(106466001)(90102001)(104016003)(85852003)(2351001)(229853001)(88136002)(74502003)(104166001)(102836001)(93916002)(69596002)(50226001)(21056001)(89996001)(20776003)(33646002)(95666004)(81342003)(74662003)(92566001)(79102003)(36756003)(46102003)(31966008)(76482002)(97736003)(15395725005)(80022003)(50466002)(105606002)(62966002)(81542003)(81156004)(10300001)(50986999)(107046002)(4396001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0726;
	H:az84smr01.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB0726;
X-Forefront-PRVS: 03468CBA43
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=Hong-Hua.Yin@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: Olivia Yin <r63875@freescale.com>
Subject: [PATCH v2] libvirt: uprev to v1.2.8
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
X-List-Received-Date: Fri, 26 Sep 2014 02:00:36 -0000
Content-Type: text/plain

Signed-off-by: Olivia Yin <r63875@freescale.com>
---
 recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
 recipes-extended/libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb} (98%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 1c95b07..f81d364 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "fbcb68f898390b321cbfcbdaa8d0c1ba"
-SRC_URI[libvirt_python.sha256sum] = "a2f30059b8870b3808b2bd2f19210422a348649a8f53523c2cbfa5cd64af217e"
+SRC_URI[libvirt_python.md5sum] = "fd31751932c96895c2f69c12532d8ec3"
+SRC_URI[libvirt_python.sha256sum] = "0f3709680b6e054253bf81ebc535f1bf5da648f8cd55167578a2dacd3eebb9d8"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_1.2.4.bb b/recipes-extended/libvirt/libvirt_1.2.8.bb
similarity index 98%
rename from recipes-extended/libvirt/libvirt_1.2.4.bb
rename to recipes-extended/libvirt/libvirt_1.2.8.bb
index 56b4d4b..57ae613 100644
--- a/recipes-extended/libvirt/libvirt_1.2.4.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.8.bb
@@ -32,8 +32,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
            file://tests-allow-separated-src-and-build-dirs.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "da7a9ca519df45a460659189fe0024e6"
-SRC_URI[libvirt.sha256sum] = "e43ac5f6b2baeafcd01777be03a897e636f8d48c0cdfb4c4cbb80d45faa9e875"
+SRC_URI[libvirt.md5sum] = "75114991290f7c8f01dd5223431b9c00"
+SRC_URI[libvirt.sha256sum] = "0049940b013ea5858b53d9b540c9df9cc3c8cb08750acfd96e9991a1f709e100"
 
 inherit autotools gettext update-rc.d pkgconfig ptest
 
-- 
2.1.0.27.g96db324


