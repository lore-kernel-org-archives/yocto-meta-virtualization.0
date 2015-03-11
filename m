Return-Path: <B43198@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4066EE00779; Wed, 11 Mar 2015 01:52:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.133 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 78663 seconds by postgrey-1.32 at yocto-www;
	Wed, 11 Mar 2015 01:52:43 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0133.outbound.protection.outlook.com [157.56.111.133])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2743E00754
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Mar 2015 01:52:43 -0700 (PDT)
Received: from DM2PR03CA0005.namprd03.prod.outlook.com (10.141.96.15) by
	CY1PR0301MB0636.namprd03.prod.outlook.com (25.160.158.142) with
	Microsoft
	SMTP Server (TLS) id 15.1.106.15; Wed, 11 Mar 2015 08:52:40 +0000
Received: from BY2FFO11FD054.protection.gbl (2a01:111:f400:7c0c::121) by
	DM2PR03CA0005.outlook.office365.com (2a01:111:e400:2428::15) with
	Microsoft SMTP Server (TLS) id 15.1.112.16 via Frontend Transport;
	Wed, 11 Mar 2015 08:52:40 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD054.mail.protection.outlook.com (10.1.15.191) with Microsoft
	SMTP Server (TLS) id 15.1.112.13 via Frontend Transport;
	Wed, 11 Mar 2015 08:52:40 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.74.27])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t2B8qbWC011047 for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Mar 2015 01:52:38 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 11 Mar 2015 08:52:31 +0000
Message-ID: <1426063952-1217-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=bogdan.purcareata@freescale.com; yoctoproject.org;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(339900001)(189002)(199003)(19580395003)(92566002)(50226001)(46102003)(47776003)(36756003)(50466002)(85426001)(49486002)(106466001)(48376002)(110136001)(50986999)(6806004)(19580405001)(87936001)(33646002)(450100001)(62966003)(105606002)(107886001)(2351001)(104016003)(229853001)(77156002)(77096005)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0636;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0636;
X-Microsoft-Antispam-PRVS: <CY1PR0301MB063687C3B4B03E19FB795B108C190@CY1PR0301MB0636.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002009)(5005006); SRVR:CY1PR0301MB0636; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB0636; 
X-Forefront-PRVS: 0512CC5201
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2015 08:52:40.0013 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0636
Subject: [PATCH v2 1/2] lxc: Add PACKAGECONFIG for seccomp
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
X-List-Received-Date: Wed, 11 Mar 2015 08:52:50 -0000
Content-Type: text/plain

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 recipes-containers/lxc/lxc_1.0.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
index c618c84..b01c006 100644
--- a/recipes-containers/lxc/lxc_1.0.7.bb
+++ b/recipes-containers/lxc/lxc_1.0.7.bb
@@ -49,6 +49,7 @@ PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
 PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
 PACKAGECONFIG[templates] = ",,, ${PN}-templates"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
 
 inherit autotools pkgconfig ptest update-rc.d systemd
 
-- 
2.1.4


