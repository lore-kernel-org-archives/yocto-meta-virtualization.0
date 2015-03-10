Return-Path: <B43198@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FB69E00777; Tue, 10 Mar 2015 05:11:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [207.46.100.131 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 6210 seconds by postgrey-1.32 at yocto-www;
	Tue, 10 Mar 2015 05:11:40 PDT
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0131.outbound.protection.outlook.com [207.46.100.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A79BE00754
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Mar 2015 05:11:40 -0700 (PDT)
Received: from BY2PR03CA062.namprd03.prod.outlook.com (10.141.249.35) by
	BY1PR03MB1435.namprd03.prod.outlook.com (25.162.127.153) with Microsoft
	SMTP Server (TLS) id 15.1.99.14; Tue, 10 Mar 2015 12:11:38 +0000
Received: from BL2FFO11FD020.protection.gbl (2a01:111:f400:7c09::100) by
	BY2PR03CA062.outlook.office365.com (2a01:111:e400:2c5d::35) with
	Microsoft SMTP Server (TLS) id 15.1.106.15 via Frontend Transport;
	Tue, 10 Mar 2015 12:11:38 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD020.mail.protection.outlook.com (10.173.161.38) with
	Microsoft SMTP Server (TLS) id 15.1.112.13 via Frontend Transport;
	Tue, 10 Mar 2015 12:11:37 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.74.27])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t2ACBZOi023150
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Mar 2015 05:11:36 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 10 Mar 2015 12:11:34 +0000
Message-ID: <1425989494-501-1-git-send-email-bogdan.purcareata@freescale.com>
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
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(450100001)(36756003)(46102003)(15975445007)(77156002)(50986999)(92566002)(62966003)(77096005)(106466001)(50226001)(33646002)(47776003)(105606002)(50466002)(2351001)(6806004)(229853001)(19580395003)(107886001)(48376002)(110136001)(19580405001)(104016003)(49486002)(575784001)(87936001)(85426001)(15395725005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1435;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR03MB1435;
X-Microsoft-Antispam-PRVS: <BY1PR03MB14357B85E9133787490953D48A180@BY1PR03MB1435.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5001009)(5005006); SRVR:BY1PR03MB1435; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR03MB1435; 
X-Forefront-PRVS: 051158ECBB
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2015 12:11:37.3696 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1435
Subject: [PATCH 3/3] lxc: Add support for seccomp on PPC architectures
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

Add the necessary bits to enable seccomp support for LXC running on PPC
architectures. libseccomp added support for PPC [1], yet to be applied to
Yocto/meta-security.

[1] https://github.com/seccomp/libseccomp/tree/working-ppc64

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 .../files/ppc-add-seccomp-support-for-lxc.patch    | 100 +++++++++++++++++++++
 recipes-containers/lxc/lxc_1.0.7.bb                |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch

diff --git a/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
new file mode 100644
index 0000000..769d165
--- /dev/null
+++ b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
@@ -0,0 +1,100 @@
+From 29ca2ec418cb496ac8a19f0718a8474a55cfe16d Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Wed, 4 Feb 2015 11:28:32 +0000
+Subject: [PATCH] seccomp: add ppc support
+
+This patch enables seccomp support for LXC containers running on PowerPC
+architectures. It is based on the latest PowerPC support added to libseccomp, on
+the working-ppc64 branch [1].
+
+Libseccomp has been tested on ppc, ppc64 and ppc64le architectures. LXC with
+seccomp support has been tested on ppc and ppc64 architectures, using the
+default seccomp policy example files delivered with the LXC package.
+
+[1] https://github.com/seccomp/libseccomp/commits/working-ppc64
+
+Upstream-Status: Pending
+[https://lists.linuxcontainers.org/pipermail/lxc-devel/2015-March/011437.html]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+---
+ src/lxc/seccomp.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 42 insertions(+)
+
+diff --git a/src/lxc/seccomp.c b/src/lxc/seccomp.c
+index 3ba6c9a..0e2310f 100644
+--- a/src/lxc/seccomp.c
++++ b/src/lxc/seccomp.c
+@@ -121,6 +121,9 @@ enum lxc_hostarch_t {
+ 	lxc_seccomp_arch_i386,
+ 	lxc_seccomp_arch_amd64,
+ 	lxc_seccomp_arch_arm,
++	lxc_seccomp_arch_ppc64,
++	lxc_seccomp_arch_ppc64le,
++	lxc_seccomp_arch_ppc,
+ 	lxc_seccomp_arch_unknown = 999,
+ };
+ 
+@@ -137,6 +140,12 @@ int get_hostarch(void)
+ 		return lxc_seccomp_arch_amd64;
+ 	else if (strncmp(uts.machine, "armv7", 5) == 0)
+ 		return lxc_seccomp_arch_arm;
++	else if (strncmp(uts.machine, "ppc64le", 7) == 0)
++		return lxc_seccomp_arch_ppc64le;
++	else if (strncmp(uts.machine, "ppc64", 5) == 0)
++		return lxc_seccomp_arch_ppc64;
++	else if (strncmp(uts.machine, "ppc", 3) == 0)
++		return lxc_seccomp_arch_ppc;
+ 	return lxc_seccomp_arch_unknown;
+ }
+ 
+@@ -150,6 +159,9 @@ scmp_filter_ctx get_new_ctx(enum lxc_hostarch_t n_arch, uint32_t default_policy_
+ 	case lxc_seccomp_arch_i386: arch = SCMP_ARCH_X86; break;
+ 	case lxc_seccomp_arch_amd64: arch = SCMP_ARCH_X86_64; break;
+ 	case lxc_seccomp_arch_arm: arch = SCMP_ARCH_ARM; break;
++	case lxc_seccomp_arch_ppc64le: arch = SCMP_ARCH_PPC64LE; break;
++	case lxc_seccomp_arch_ppc64: arch = SCMP_ARCH_PPC64; break;
++	case lxc_seccomp_arch_ppc: arch = SCMP_ARCH_PPC; break;
+ 	default: return NULL;
+ 	}
+ 
+@@ -343,6 +355,36 @@ static int parse_config_v2(FILE *f, char *line, struct lxc_conf *conf)
+ 				cur_rule_arch = lxc_seccomp_arch_arm;
+ 			}
+ #endif
++#ifdef SCMP_ARCH_PPC64LE
++			else if (strcmp(line, "[ppc64le]") == 0 ||
++					strcmp(line, "[PPC64LE]") == 0) {
++				if (native_arch != lxc_seccomp_arch_ppc64le) {
++					cur_rule_arch = lxc_seccomp_arch_unknown;
++					continue;
++				}
++				cur_rule_arch = lxc_seccomp_arch_ppc64le;
++			}
++#endif
++#ifdef SCMP_ARCH_PPC64
++			else if (strcmp(line, "[ppc64]") == 0 ||
++					strcmp(line, "[PPC64]") == 0) {
++				if (native_arch != lxc_seccomp_arch_ppc64) {
++					cur_rule_arch = lxc_seccomp_arch_unknown;
++					continue;
++				}
++				cur_rule_arch = lxc_seccomp_arch_ppc64;
++			}
++#endif
++#ifdef SCMP_ARCH_PPC
++			else if (strcmp(line, "[ppc]") == 0 ||
++					strcmp(line, "[PPC]") == 0) {
++				if (native_arch != lxc_seccomp_arch_ppc) {
++					cur_rule_arch = lxc_seccomp_arch_unknown;
++					continue;
++				}
++				cur_rule_arch = lxc_seccomp_arch_ppc;
++			}
++#endif
+ 			else
+ 				goto bad_arch;
+ 
+-- 
+2.1.4
+
diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
index 4110ac5..d1af6ac 100644
--- a/recipes-containers/lxc/lxc_1.0.7.bb
+++ b/recipes-containers/lxc/lxc_1.0.7.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://add-lxc.rebootsignal.patch \
 	file://document-lxc.rebootsignal.patch \
 	file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
+	file://ppc-add-seccomp-support-for-lxc.patch \
 	"
 
 SRC_URI[md5sum] = "b48f468a9bef0e4e140dd723f0a65ad0"
-- 
2.1.4


