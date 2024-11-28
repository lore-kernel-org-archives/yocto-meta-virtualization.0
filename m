Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39BDD6D258
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 03:07:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.87582.1732763240886647695
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2024 19:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1062ca15bd=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS330xY030531
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Nov 2024 03:07:20 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671arjbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Nov 2024 03:07:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 19:07:18 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 19:07:17 -0800
From: <changqing.li@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [kirkstone][PATCH] nagios-plugins: fix CVE-2023-37154
Date: Thu, 28 Nov 2024 11:07:17 +0800
Message-ID: <20241128030717.3733955-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bXFOrcUr94czeKlx4BRs3_lq9YagHVzI
X-Authority-Analysis: v=2.4 cv=TIS/S0la c=1 sm=1 tr=0 ts=6747de67 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=AYcydBwgAAAA:8 a=t7CeM3EgAAAA:8 a=9MjdMiBsAAAA:8
 a=lF1fowAxo9ClWS3mvFsA:9 a=OB174YguhF_RgKK_X9cG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=t6BmhnhbaP3J4HiNQRyJ:22
X-Proofpoint-GUID: bXFOrcUr94czeKlx4BRs3_lq9YagHVzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_02,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411280024
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Nov 2024 03:07:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9015

From: Changqing Li <changqing.li@windriver.com>

CVE-2023-37154:
check_by_ssh in Nagios nagios-plugins 2.4.5 allows arbitrary command execution
via ProxyCommand, LocalCommand, and PermitLocalCommand with \${IFS}. This has
been categorized both as fixed in e8810de, and as intended behavior.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2023-37154

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../nagios-plugins/CVE-2023-37154.patch       | 69 +++++++++++++++++++
 .../nagios/nagios-plugins_2.2.1.bb            |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch

diff --git a/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
new file mode 100644
index 00000000..436bba42
--- /dev/null
+++ b/recipes-extended/nagios/nagios-plugins/CVE-2023-37154.patch
@@ -0,0 +1,69 @@
+From 7f07a9e89373d5906c2b6a9eee0e74cf69f302c1 Mon Sep 17 00:00:00 2001
+From: Sebastian Wolf <swolf@nagios.com>
+Date: Wed, 31 May 2023 16:43:54 -0400
+Subject: [PATCH] check_by_ssh: Prevent users from using several SSH options
+ which run local commands.
+
+CVE: CVE-2023-37154
+Upstream-Status: Backport [https://github.com/nagios-plugins/nagios-plugins/commit/e8810de21be80148562b7e0168b0a62aeedffde6]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac           | 10 ++++++++++
+ plugins/check_by_ssh.c | 12 +++++++++++-
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 963514a..236d233 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -418,6 +418,16 @@ then
+ 		[path and arguments for invoking 'who'])
+ fi
+ 
++AC_ARG_WITH(unrestricted_ssh_options,
++	[AS_HELP_STRING([--with-unrestricted-ssh-options],
++		[allow any SSH options to be used with check_by_ssh])],
++	[],
++	[unrestricted_ssh_options=no])
++
++if test "x$with_unrestricted_ssh_options" = xyes ; then
++	AC_DEFINE(HAVE_UNRESTRICTED_SSH_OPTIONS,[1],[Allow SSH to use options that run local commands.])
++fi
++
+ AC_ARG_WITH([ipv6],
+ 	[AS_HELP_STRING([--with-ipv6], [support IPv6 @<:@default=check@:>@])],
+ 	[], [with_ipv6=check])
+diff --git a/plugins/check_by_ssh.c b/plugins/check_by_ssh.c
+index b6f3130..6cc6c7a 100644
+--- a/plugins/check_by_ssh.c
++++ b/plugins/check_by_ssh.c
+@@ -27,7 +27,7 @@
+ *****************************************************************************/
+ 
+ const char *progname = "check_by_ssh";
+-const char *copyright = "2000-2014";
++const char *copyright = "2000-";
+ const char *email = "devel@nagios-plugins.org";
+ 
+ #include "common.h"
+@@ -299,6 +299,16 @@ process_arguments (int argc, char **argv)
+ 				skip_stderr = atoi (optarg);
+ 			break;
+ 		case 'o':									/* Extra options for the ssh command */
++
++			/* Don't allow the user to run commands local to the nagios server, unless they decide otherwise at compile time. */
++#ifndef HAVE_UNRESTRICTED_SSH_OPTIONS
++			if (   strcasestr(optarg, "ProxyCommand") != NULL
++				|| strcasestr(optarg, "PermitLocalCommand") != NULL
++				|| strcasestr(optarg, "LocalCommand") != NULL) {
++				break;
++			}
++#endif
++
+ 			comm_append("-o");
+ 			comm_append(optarg);
+ 			break;
+-- 
+2.23.0
+
diff --git a/recipes-extended/nagios/nagios-plugins_2.2.1.bb b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
index 471d4b42..cd89b329 100644
--- a/recipes-extended/nagios/nagios-plugins_2.2.1.bb
+++ b/recipes-extended/nagios/nagios-plugins_2.2.1.bb
@@ -9,6 +9,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "https://www.nagios-plugins.org/download/${BPN}-${PV}.tar.gz \
+           file://CVE-2023-37154.patch \
 "
 
 SRC_URI[md5sum] = "fb521d5c05897f165b0b1862c1e5cb27"
-- 
2.25.1


