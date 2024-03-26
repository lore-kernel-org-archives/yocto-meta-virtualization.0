Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CF0CD11DC
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 09:03:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4175.1711443802954162049
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Mar 2024 02:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38153c7406=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42Q5xAs4032380
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Mar 2024 02:03:22 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1xkgu6ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Mar 2024 02:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vr7qTXsZAIJ+5OZJeWywaspv8xc3eHyPXhzB5q9bw2eZO1K1NTcmSLpIPo7HsHFZ68LdguNfBuZtm+afB88WE2/vxgy0jDH21TitOqVQpmbMdA5t3Lb62tojatxWh6lrEAnlVp0ZxDUlfKfq4Sy1dSodHlACPBNfuwqwgeLD9tUrrsOO+3TVF2BD1RtESYTt/XSgfUGGQfteTA437IqLZErkUhPd+RPpn4TOKiZ2z+kmmTfgOUwuisn+cCryu9kDWBYCPW6lmd0TPuwC+QM6pgCEo82SScYByebwC9unCo0e+wKEK6EqjgmLBCa5aOdd2UcZd/EpbiA9MvzvzxK+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/66zCN+OooMP7n+wDedcZBLaGO926nlW6zeSeEQS9Y=;
 b=OEm+Cv+fY0Liq3bSc65hKpri9gEhuJkAtcUOtsd4oZpzlZ+xjriuKXzTvCIF4+OO0wtsmuI1UMgc4ov1UCPi+8F5D02Vnwns8zQNAH6LYpJv/avwLynm4GrxSs110F3Nf7uwQywygOhWJcvKCaBiOzHlFJoqNV1XIoaqOAXKhua+BGmqtLxJWSTED2TN3Mepa27JxGQgbvlMI+OJV/lEHagOAkpyK/fyzw56Vxgd0Q0Stl+1yJwBl5OjStFySSjQr14hVdJAxnqBbVAzYr/RaA1sMfcGu8jyvHRYfjpaFxRxWdcW5V7UpObra5xanCC2tgeaJl1GihVVm5WGs+Y3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 26 Mar
 2024 09:03:19 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 09:03:17 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: fix broken test cases
Date: Tue, 26 Mar 2024 17:42:58 +0800
Message-Id: <20240326094258.1138548-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SN7PR11MB6993:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cVPTczunFePxn+9hF+Q+RbF6ZMK+lVOQSbNPCT0fi25dcLudliBBaZn33TmV+7jGXWkQsl+p0xpacjjpTpBfzizSqzlIzxUuLSYuNk4a0O8BFEuCd+gEItjTCvb1TVmGLsM4ykAIRTt98Hxho6tfkXrsGNCFQz4VGeTprbv0gG5n20wAcMcYsPROfETZs8NrDJn1rkdTMs/0+7CVAAqcQVAq3YaGjX1QIfXZuMpHqKkxP/oI0Y3HuTRBddH2QMGt/H1uoiyxp7gKx8RMxL6sBRyrD6AZXJp06izXZP2YAXDyDlH34ufXAqNHYFHMhp+vQieBO5CNGYwBxkABYtucpjWZzZIAkp/FSrb5HMSBtJ2rxjCNDQcwF1lFffoRfKXr3zLc9mzLr47EjQQ2m27g8lSKpVokLfyaruwa2/nbTqbneCI6kB7C0XJzR/f7InceXIhlq6ZES2HQPJSq0erThQIkaXptg8OUhjwxcJkEQzO4T9v6dj+Vj8cu5dR6JIB8xb0Qvv6bmI0FfSiSRPuv0uOi4bS03ol4qNQ5Ah0I6GKBSFmxPhcmBWNYD0Hb42xLkItYS1CWPg71FgzMsVczx1FoF9RqHFB05DIo5Orp9qjBu2VeIPX9O1taCxxQjkBLlB6NyT9KiyWAoWTVzLlHBJOYftKHbW4QPkzGqXqjk0JiEOEk1cts0+sP1Ap2s0rd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CblTcBsKLutIk8Y29VMHuQfRTuKl0h3t4T7Nkk3AKXWJw31c5tyHlKTxpJlJ?=
 =?us-ascii?Q?zfS36jMV1PM1ieRoWoFn59L/hJSaTzqu8N07tQtq3FWeVcKIKAvLxiXLc5UL?=
 =?us-ascii?Q?JLoOwnqLtL6vy7PKVIF1vjubiOL1IGsD3sn/7lf9PUK+G7fFsvoTVYWSsdfx?=
 =?us-ascii?Q?yuXdf8VgYNLXgw8uCjZGJj+eDxFPO/qPTKlh7aKfjutxiyBwDWW6edDwttBf?=
 =?us-ascii?Q?bNYFr3OZve7TkivVTSHKHPGCZaDQa3Gc8SL9QkXmmCyHf4hXmxxx8MeFdVDp?=
 =?us-ascii?Q?nCpudSxvwpVRAtTN44ppdYOMOpMAFKBGuANFjdbQFzY4FqpEIuEF5cNDb7k+?=
 =?us-ascii?Q?XEzZr8uT57nxT+qTkPft/PVyO61xEOwca37WXzaWxbMQhd2hpvCq5nup/B7Y?=
 =?us-ascii?Q?NFYyaQw1R6vKsohLCqZh9ZP7v1P9I5EGh6j2IZsCkMWPutAAkT4D8i+PXASm?=
 =?us-ascii?Q?52Xi08fZG/UidaxUKidr/qJVyacDami75riwKB815NIbVHbJxYkOcOFTiiwG?=
 =?us-ascii?Q?uMxBwItSHkKWc+92K7rNT1MX0EKsJC1KNT/g/6tcK5S92Xo1J79QtjY5Oe4D?=
 =?us-ascii?Q?3nXvU+91pa6nw+Q5YgfXlKocZ3UqVCJ7J5k2TW/5SHQnm1cId2I4WPAsJXi8?=
 =?us-ascii?Q?6decLYAB8t4ACaUWT3ZPMKjT/W7IsMHFS79rtjgjbTAbcljGOBKh0P8M2cat?=
 =?us-ascii?Q?dyfltzOxHzeow+xWamy5SZai72z6XglbcqH7B+Ly+s7W2YuEeGwxC0Z7IVEe?=
 =?us-ascii?Q?V5JgukEiKfEVhGHZtV317W8zy+2+HKq8/DGMCws7sr50gQ2oTOh+shTMj1IY?=
 =?us-ascii?Q?4+wCh8pxvrqKYrDuau/hoAwCJxrrbGReLHNPluak0/fi9hKY5BeqiWweOnxw?=
 =?us-ascii?Q?sala7Xmo+I8Dmzu4WRaDC/SoD0VgswugH3pLLxmG2Z/obOgpQYKDnpSn7xFP?=
 =?us-ascii?Q?82zezPY5U8dcsdlA0psM/achL8MS3m24Nvh148bARcLqtn2Eq/yzCZVBsgZk?=
 =?us-ascii?Q?JMttiWnrxmpF+aJb+7XU8uH3nHvSIIdOjj0UICoHgF5lPuIjOCj+R0aW6kCO?=
 =?us-ascii?Q?OwYJeW3Otrj/fxz83sduXqv/O48z8GTVmH7u05WPYYnV0cOYZQhLKC3ju5ue?=
 =?us-ascii?Q?u4LajXCphT8lvXbePxZeV6wv6VyOIgYuDIVXFJ7SBcZYvNCCgY5HgIfjdwpG?=
 =?us-ascii?Q?sWDu+2AWgI9UGIFb2XEZfncTov5fXCsyl04qnirl1mR06uOntFpqNLvak7Ot?=
 =?us-ascii?Q?aOgK6KThIQfGdWyZHneFnIWuwneb2FoYn5FLmzy/wkpini+TWD0Cy+W6l9Ip?=
 =?us-ascii?Q?FZ1ea2NA4ZTgY4O+QCd+XAPTHeXSrJRHwbDE+5UAwCwvHTwFTodlbTEIOeQS?=
 =?us-ascii?Q?wQAMF8QqzL3ZnzI0NUX+gyqFAYRP5lOeJT8dZMO9247gotHSW39pT/+fzmR6?=
 =?us-ascii?Q?vwbw9I5Qt0CwFeq5CJJdL4UsQBW/WcNPBVGjFEEmGJqm8tocPEEtnzPfCwad?=
 =?us-ascii?Q?/DR2+7NIXyYlA7RP2p8CR3rzUBsbHg3zfbm4JPviwHUqugFhw+D632r2l9Cc?=
 =?us-ascii?Q?gVtH64qVq+jzkGI1fYliPc9Jq+UDxOV6s1HNgFY3BusheuIaBAWhnYv/tBSq?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1386c27c-11e9-41b6-2719-08dc4d7393c1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 09:03:17.7192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xng+dPV5lQNAIf7GmkC/a4YrEiwh7c/ZGNNYQao8WWUEq4iqnxsNDqdqSGI6QL9BeSDntEaMVz6riaihqRIoHOvfNP4CUNm2i0MzvKToJPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
X-Proofpoint-ORIG-GUID: JzqeMLOp47oyhlOT-n_5bkbyz--4SUBZ
X-Proofpoint-GUID: JzqeMLOp47oyhlOT-n_5bkbyz--4SUBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260061
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Mar 2024 09:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8656

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Upstream dropped cgroup handling in lxc-test-usernic lxc-test-unpriv and
lxc-test-apparmor-mount to fix the broken cases.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...xc-test-usernic-drop-cgroup-handling.patch |  61 +++++++++++
 ...-and-broken-cgroup-handling-code-fro.patch | 103 ++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |   2 +
 3 files changed, 166 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.patch
 create mode 100644 recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch

diff --git a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.patch b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.patch
new file mode 100644
index 00000000..162e8f9d
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.patch
@@ -0,0 +1,61 @@
+From ec85e5ca4953292c4341497704ce738669a79b64 Mon Sep 17 00:00:00 2001
+From: Serge Hallyn <serge@hallyn.com>
+Date: Fri, 2 Feb 2024 10:41:11 -0600
+Subject: [PATCH] lxc-test-usernic: drop cgroup handling
+
+This stuff is not needed in a modern systemd based system, and in fact
+breaks.  It would probably be better to detect such a system so that a
+non-systemd box can still run this test.  But I'm not sure what would be
+reliable.
+
+Upstream-Status: Backport from
+[https://github.com/lxc/lxc/commit/ec85e5ca4953292c4341497704ce738669a79b64]
+
+Signed-off-by: Serge Hallyn <serge@hallyn.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/tests/lxc-test-usernic.in | 28 ----------------------------
+ 1 file changed, 28 deletions(-)
+
+diff --git a/src/tests/lxc-test-usernic.in b/src/tests/lxc-test-usernic.in
+index 9af8678f3..49fd5e3f7 100755
+--- a/src/tests/lxc-test-usernic.in
++++ b/src/tests/lxc-test-usernic.in
+@@ -80,34 +80,6 @@ lxc.idmap = u 0 910000 10000
+ lxc.idmap = g 0 910000 10000
+ EOF
+ 
+-if command -v cgm >/dev/null 2>&1; then
+-	cgm create all usernic-user
+-	cgm chown all usernic-user $(id -u usernic-user) $(id -g usernic-user)
+-	cgm movepid all usernic-user $$
+-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
+-	for d in $(cut -d : -f 2 /proc/self/cgroup); do
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Create \
+-			string:$d string:usernic-user >/dev/null
+-
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Chown \
+-			string:$d string:usernic-user int32:$(id -u usernic-user) int32:$(id -g usernic-user) >/dev/null
+-
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.MovePid \
+-			string:$d string:usernic-user int32:$$ >/dev/null
+-	done
+-else
+-	for d in /sys/fs/cgroup/*; do
+-		[ "$d" = "/sys/fs/cgroup/unified" ] && continue
+-		[ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.clone_children
+-		[ ! -d $d/lxctest ] && mkdir $d/lxctest
+-		chown -R usernic-user: $d/lxctest
+-		echo $$ > $d/lxctest/tasks
+-	done
+-fi
+-
+ mkdir -p /run/user/$(id -u usernic-user)
+ chown -R usernic-user: /run/user/$(id -u usernic-user) /home/usernic-user
+ 
+-- 
+2.35.5
+
diff --git a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch b/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch
new file mode 100644
index 00000000..bf8df795
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch
@@ -0,0 +1,103 @@
+From 8f9733d756361ff8f8d8d589f286c0e064b1195d Mon Sep 17 00:00:00 2001
+From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
+Date: Thu, 15 Feb 2024 18:13:05 +0100
+Subject: [PATCH] tests: remove old and broken cgroup handling code from tests
+
+We have removed the same piece of code in
+ec85e5ca495 ("lxc-test-usernic: drop cgroup handling")
+let's do the same for two other tests.
+
+This fixes autopkgtests.
+
+Upstream-Status: Backport from
+[https://github.com/lxc/lxc/commit/8f9733d756361ff8f8d8d589f286c0e064b1195d]
+
+Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/tests/lxc-test-apparmor-mount | 29 -----------------------------
+ src/tests/lxc-test-unpriv         | 28 ----------------------------
+ 2 files changed, 57 deletions(-)
+
+diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-apparmor-mount
+index 7c9d9ad50..ddf783d4b 100755
+--- a/src/tests/lxc-test-apparmor-mount
++++ b/src/tests/lxc-test-apparmor-mount
+@@ -119,35 +119,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
+ 
+ cd $HDIR
+ 
+-if command -v cgm >/dev/null 2>&1; then
+-	cgm create all $TUSER
+-	cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
+-	cgm movepid all $TUSER $$
+-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
+-	for d in $(cut -d : -f 2 /proc/self/cgroup); do
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Create \
+-			string:$d string:$TUSER >/dev/null
+-
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Chown \
+-			string:$d string:$TUSER int32:$(id -u $TUSER) int32:$(id -g $TUSER) >/dev/null
+-
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.MovePid \
+-			string:$d string:$TUSER int32:$$ >/dev/null
+-	done
+-else
+-	for d in /sys/fs/cgroup/*; do
+-		[ "$d" = "/sys/fs/cgroup/unified" ] && continue
+-		[ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.clone_children
+-		[ ! -d $d/lxctest ] && mkdir $d/lxctest
+-		chown -R $TUSER: $d/lxctest
+-		echo $$ > $d/lxctest/tasks
+-	done
+-fi
+-
+-
+ run_cmd lxc-create -t busybox -n $cname
+ 
+ echo "test default confined container"
+diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
+index 8fb9106d6..426add9da 100755
+--- a/src/tests/lxc-test-unpriv
++++ b/src/tests/lxc-test-unpriv
+@@ -130,34 +130,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
+ 
+ cd $HDIR
+ 
+-if command -v cgm >/dev/null 2>&1; then
+-	cgm create all $TUSER
+-	cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
+-	cgm movepid all $TUSER $$
+-elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
+-	for d in $(cut -d : -f 2 /proc/self/cgroup); do
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Create \
+-			string:$d string:$TUSER >/dev/null
+-
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Chown \
+-			string:$d string:$TUSER int32:$(id -u $TUSER) int32:$(id -g $TUSER) >/dev/null
+-
+-		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
+-			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.MovePid \
+-			string:$d string:$TUSER int32:$$ >/dev/null
+-	done
+-else
+-	for d in /sys/fs/cgroup/*; do
+-		[ "$d" = "/sys/fs/cgroup/unified" ] && continue
+-		[ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.clone_children
+-		[ ! -d $d/lxctest ] && mkdir $d/lxctest
+-		chown -R $TUSER: $d/lxctest
+-		echo $$ > $d/lxctest/tasks
+-	done
+-fi
+-
+ run_cmd lxc-create -t busybox -n c1 -l trace -o "${UNPRIV_LOG}"
+ 
+ # Make sure we can start it - twice
+-- 
+2.35.5
+
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 33ea4ee7..ee0e442f 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -47,6 +47,8 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-5.0;protocol=https \
 	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
+	file://0001-lxc-test-usernic-drop-cgroup-handling.patch \
+	file://0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch \
 	"
 
 SRCREV = "cb8e38aca27a23964941f0f011a8919aab8bebab"
-- 
2.35.5


