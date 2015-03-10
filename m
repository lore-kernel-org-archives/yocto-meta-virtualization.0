Return-Path: <B43198@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11ED5E0077E; Tue, 10 Mar 2015 05:11:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.135 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0135.outbound.protection.outlook.com [157.56.110.135])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E751E00750
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Mar 2015 05:11:34 -0700 (PDT)
Received: from BN3PR0301CA0030.namprd03.prod.outlook.com (25.160.180.168) by
	BLUPR03MB1427.namprd03.prod.outlook.com (25.163.81.149) with Microsoft
	SMTP Server (TLS) id 15.1.99.14; Tue, 10 Mar 2015 12:11:32 +0000
Received: from BN1AFFO11FD022.protection.gbl (2a01:111:f400:7c10::108) by
	BN3PR0301CA0030.outlook.office365.com (2a01:111:e400:4000::40) with
	Microsoft SMTP Server (TLS) id 15.1.106.15 via Frontend Transport;
	Tue, 10 Mar 2015 12:11:33 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD022.mail.protection.outlook.com (10.58.52.82) with Microsoft
	SMTP Server (TLS) id 15.1.112.13 via Frontend Transport;
	Tue, 10 Mar 2015 12:11:32 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.74.27])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t2ACBUDH023109
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Mar 2015 05:11:31 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 10 Mar 2015 12:11:29 +0000
Message-ID: <1425989489-458-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=bogdan.purcareata@freescale.com; yoctoproject.org;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:0;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(92566002)(47776003)(46102003)(50226001)(104016003)(77156002)(50986999)(87936001)(110136001)(106466001)(229853001)(2351001)(107886001)(62966003)(450100001)(85426001)(6806004)(49486002)(50466002)(105606002)(77096005)(48376002)(19580405001)(19580395003)(36756003)(33646002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB1427;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB1427;
X-Microsoft-Antispam-PRVS: <BLUPR03MB14271B1CA80A570D8144E4EA8A180@BLUPR03MB1427.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5001009); SRVR:BLUPR03MB1427; BCL:0;
	PCL:0; RULEID:; SRVR:BLUPR03MB1427; 
X-Forefront-PRVS: 051158ECBB
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2015 12:11:32.6760 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB1427
Subject: [PATCH 2/3] lxc: Add PACKAGECONFIG for seccomp
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
X-List-Received-Date: Tue, 10 Mar 2015 12:11:43 -0000
Content-Type: text/plain

Determine whether libseccomp is installed in the Yocto image, and based on that,
compile the necessary support for LXC as well.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 recipes-containers/lxc/lxc_1.0.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
index c618c84..4110ac5 100644
--- a/recipes-containers/lxc/lxc_1.0.7.bb
+++ b/recipes-containers/lxc/lxc_1.0.7.bb
@@ -43,12 +43,14 @@ EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
 
 PACKAGECONFIG ??= "templates \
     ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+    ${@base_contains('IMAGE_INSTALL', 'libseccomp', 'seccomp', '', d)} \
 "
 PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
 PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
 
 inherit autotools pkgconfig ptest update-rc.d systemd
 
-- 
2.1.4


