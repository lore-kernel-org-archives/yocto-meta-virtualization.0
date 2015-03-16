Return-Path: <B43198@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA7C0E008DD; Mon, 16 Mar 2015 04:17:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.139 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0139.outbound.protection.outlook.com [157.56.110.139])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D93EE00712
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Mar 2015 04:17:09 -0700 (PDT)
Received: from CH1PR03CA008.namprd03.prod.outlook.com (10.255.156.153) by
	DM2PR0301MB0638.namprd03.prod.outlook.com (25.160.96.12) with Microsoft
	SMTP Server (TLS) id 15.1.112.19; Mon, 16 Mar 2015 11:17:07 +0000
Received: from BY2FFO11FD040.protection.gbl (10.255.156.132) by
	CH1PR03CA008.outlook.office365.com (10.255.156.153) with Microsoft SMTP
	Server (TLS) id 15.1.112.19 via Frontend Transport;
	Mon, 16 Mar 2015 11:17:06 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD040.mail.protection.outlook.com (10.1.14.225) with Microsoft
	SMTP Server (TLS) id 15.1.112.13 via Frontend Transport;
	Mon, 16 Mar 2015 11:17:06 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.74.27])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t2GBH5SA025999
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Mar 2015 04:17:05 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 16 Mar 2015 11:17:03 +0000
Message-ID: <1426504623-1921-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=bogdan.purcareata@freescale.com; yoctoproject.org;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(85426001)(36756003)(19580405001)(50986999)(46102003)(48376002)(50466002)(87936001)(33646002)(49486002)(105606002)(110136001)(50226001)(104016003)(92566002)(106466001)(107886001)(15975445007)(2351001)(229853001)(77096005)(62966003)(77156002)(450100001)(6806004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0638;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB0638;
X-Microsoft-Antispam-PRVS: <DM2PR0301MB0638DCAC6528E66E1B651AE38C020@DM2PR0301MB0638.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:DM2PR0301MB0638; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB0638; 
X-Forefront-PRVS: 05177D47DC
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2015 11:17:06.9112 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB0638
Subject: [PATCH] lxc: Update support for seccomp on PPC architectures
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
X-List-Received-Date: Mon, 16 Mar 2015 11:17:12 -0000
Content-Type: text/plain

Update the LXC recipe with the upstream-applied version of the patch.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 .../files/ppc-add-seccomp-support-for-lxc.patch    | 29 +++++++++++++++-------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
index 6faf791..1055539 100644
--- a/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
+++ b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
@@ -1,6 +1,6 @@
-From 29ca2ec418cb496ac8a19f0718a8474a55cfe16d Mon Sep 17 00:00:00 2001
+From b4067426d58aec9b6cad7a4739793f3d90c5f189 Mon Sep 17 00:00:00 2001
 From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Wed, 4 Feb 2015 11:28:32 +0000
+Date: Thu, 12 Mar 2015 08:57:47 +0000
 Subject: [PATCH] seccomp: add ppc support
 
 This patch enables seccomp support for LXC containers running on PowerPC
@@ -13,16 +13,21 @@ default seccomp policy example files delivered with the LXC package.
 
 [1] https://github.com/seccomp/libseccomp/commits/working-ppc64
 
-Upstream-Status: Pending
-[https://lists.linuxcontainers.org/pipermail/lxc-devel/2015-March/011437.html]
+v2:
+- add #ifdefs in get_new_ctx to fix builds on systems not having SCMP_ARCH_PPC*
+  defined
+
+Upstream-Status: Applied
+[https://github.com/lxc/lxc/commit/b4067426d58aec9b6cad7a4739793f3d90c5f189]
 
 Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
 ---
- src/lxc/seccomp.c | 42 ++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 42 insertions(+)
+ src/lxc/seccomp.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 48 insertions(+)
 
 diff --git a/src/lxc/seccomp.c b/src/lxc/seccomp.c
-index 3ba6c9a..0e2310f 100644
+index 3ba6c9a..108faa0 100644
 --- a/src/lxc/seccomp.c
 +++ b/src/lxc/seccomp.c
 @@ -121,6 +121,9 @@ enum lxc_hostarch_t {
@@ -48,17 +53,23 @@ index 3ba6c9a..0e2310f 100644
 	return lxc_seccomp_arch_unknown;
  }
 
-@@ -150,6 +159,9 @@ scmp_filter_ctx get_new_ctx(enum lxc_hostarch_t n_arch, uint32_t default_policy_
+@@ -150,6 +159,15 @@ scmp_filter_ctx get_new_ctx(enum lxc_hostarch_t n_arch, uint32_t default_policy_
 	case lxc_seccomp_arch_i386: arch = SCMP_ARCH_X86; break;
 	case lxc_seccomp_arch_amd64: arch = SCMP_ARCH_X86_64; break;
 	case lxc_seccomp_arch_arm: arch = SCMP_ARCH_ARM; break;
++#ifdef SCMP_ARCH_PPC64LE
 +	case lxc_seccomp_arch_ppc64le: arch = SCMP_ARCH_PPC64LE; break;
++#endif
++#ifdef SCMP_ARCH_PPC64
 +	case lxc_seccomp_arch_ppc64: arch = SCMP_ARCH_PPC64; break;
++#endif
++#ifdef SCMP_ARCH_PPC
 +	case lxc_seccomp_arch_ppc: arch = SCMP_ARCH_PPC; break;
++#endif
 	default: return NULL;
 	}
 
-@@ -343,6 +355,36 @@ static int parse_config_v2(FILE *f, char *line, struct lxc_conf *conf)
+@@ -343,6 +361,36 @@ static int parse_config_v2(FILE *f, char *line, struct lxc_conf *conf)
 				cur_rule_arch = lxc_seccomp_arch_arm;
 			}
  #endif
-- 
2.1.4


