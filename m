Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE02C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 08:31:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7971.1713429059021280261
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Apr 2024 01:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4838d8f44d=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43I7CuW4029099
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Apr 2024 01:30:58 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfnb14mbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Apr 2024 01:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Flp5XcZQgDBNsoTfWuiZTxUgnqeFjaDXZSjn9ebjukxzExFa6QpY/dY0F5mSEb39ePKtpMy8jRSN23u2bVypQQUgoYISbz7CuALFA1Ht79Xox3evw2Wh/92/TXkYtXWldd3c3Iqdhs0jUp1ir1UUUp5TYYqtnqihd547pjc1qau8w/fy9RK7lpHzHTe1ao+P7p6Xk9Ek8ObLd+YB/7qlFjCiG/4yNLHwygKFO2IZjBn01+MeInlyV44ONhlVoVfnLk/L+R0RvNFf3faAwwTQb7Vtl/VLZKNGArSTLnee/UOts0VlrGqkoisP8lTDJXpiZ9e4KM572H+301VzgoDTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0jKTE0g76GVdl5eeT2eXjZ57RjL3H8J4zwVcHZsbv8=;
 b=L/34eVdiJxqtu1zg2gpJTF0bn23K4Mb1Dklv/9GqsAPNVb0/qoTu6CnKsg0M0gPXDkoMnv4xfGBicLGiIvf2+S7PxcGVr+WVsof+mtwpDb744inhJeq1SuLZB+z996mgA4NzDt/TgGgWOGWlToMicwN3u4VRxnotugngpT71cQp2S+0CVTZOR2/KgAqtlh+cx29KKyKDwBFTO4WwaqHELtEhX5mLmEEernSze1qFzllJ3p3WafUbBg81b+ZdyM0YBNeTLoOE6f6pRILBzo79G71yzuq5VnKbGvcO4Ojt7Byo98rzYhQphCc5nHlStbdLyv2zGbrSEKTfw+9tTcmeSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 08:30:55 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::e7b2:a7c6:5d72:2855]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::e7b2:a7c6:5d72:2855%4]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 08:30:55 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: update to 6.0.0
Date: Thu, 18 Apr 2024 16:30:47 +0800
Message-Id: <20240418083047.628481-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::32) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA1PR11MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ce0dd1-94bf-4cb1-8851-08dc5f81dd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KI5iNs99YuwlGUEzREJ90KRtZDFmwvyGYQQHxRIkTPKtkwDQELQvHrxq2oKGABnCj9tjHGoZ16mIP+pa5d5ibD6/mGeEfHASglT6jRV50wtey7Or6BcUyTK/kQomaYt47JSjG8AdVlxJuXC0M870FKoMVC5WYtNTL3g0q2f0hhfQ8F5QuCuWvYlcJY7YEyvly4+KSXo3b0JCO6JLnenvXfxvcp9oS4UFZHHl1VUgosbo27El+RJOorajLpmRR9QhnGoxjihBdhWieT973h62hzgxgdvAQIjadqWfbaA+GMjKL3MCbjtNkywbIAWN7nmWokyBqJtWZ9gnWgQESgkDOOnmlnAc4At1Fy6RZztfUBRa0iq/qXEH7zhZVmH9ooYmHrUa+R2CPCaL4xIBH0pn2t73ufbDKN8l+Q95Hp26DstwjIabVuQAX/7ZaxCdRlUD+W3sS375VBn9JIRAGHwOl2OMk8h9NV+m7xwxCmur5hKpiu7YZ73BHnk4EryzJjkYZJOMSRxfypmNuHLmIfywf6HpGGZCQooAdbnTr/uhseR+QttQYDKB9/rYCewsxQJg1agwTdESbCdAtcX834mHGlI7YJeqOE0FoWPRucLJmlcUOFvbcXe0afomKhESffrSJ4pv8V8ZgHKtV/MtqvZFWDbpChilKL4JK6hfNHVfjvE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EgHFxfOstztcFXdBE24zoNhfzFkKh/WDxymbJFQDAezTCe+RFnkKgIIyQ2Aj?=
 =?us-ascii?Q?ofpCMvb/QaT6YFWBT2f/TJC1L21czQCmqIkdjLXdqnOSIIzHb9/QGmw5BlVX?=
 =?us-ascii?Q?CQfG4e4YMIxl+XfeRDAzzDCcrsmNSqn/4GmPFIm+5I46wvLz+9E2koXQ2plz?=
 =?us-ascii?Q?gaNtGOr8f1FmSItWwVE+p0atXetqp8lqBUQ4x2q5SlYPIo/JKUSrgtnZFq9n?=
 =?us-ascii?Q?U85wF8vbe/HFGBgC9FHrL0l59jWP04fztD1YoCgujTBjttz8ZyNSg3Evk5/w?=
 =?us-ascii?Q?H9yAQ7bgkFXFIyQAkfYyVFgZcgQfr/GNMR5ZsrJu7JZaiyPjLFjABEeBU34B?=
 =?us-ascii?Q?gQIufidqAYNVGpgLBs9vdh63+ZoO8Sn1t+iDs1JAUp2iO38fe9oor1IysRid?=
 =?us-ascii?Q?0EyWWW0KTgteWcbq3HqAzyXs+7k8ZEJdoQ4vJvQsn2smyJyYoiF2FbwBCdfC?=
 =?us-ascii?Q?NTrDlmWNlcwSYIUGz382cTIN1mb79XOn0wJuU3RcQstYHfspftBZvKzuWkqY?=
 =?us-ascii?Q?+UGY+bzzv/RT6hCDsaCs8RePNHrMr+l22CbM/ixUqg1sqfb+QF3+YFWqks6S?=
 =?us-ascii?Q?zmsxqDpJ0eidwIMaNkOlzaEuVzPjFIsw/ExIDjIFbrfoXdP+TK7X6buhM+eW?=
 =?us-ascii?Q?y4m8K4zAIe5KqSMnHKLi8VoGhSgfJUjGWwKty1/dojUOwrYCD55PKx5zuK+d?=
 =?us-ascii?Q?mvT1+wTJETDw8rmyb2diU6YTfITlbhJ27XJ5Tbdwijjy3BHjwzHDXFfkdQRU?=
 =?us-ascii?Q?Q6wuDxdHZSIqX/CKqLtLdBoJCL0zbZBo/0lyGvGhV8d+h8Y02MuWseFjnKzf?=
 =?us-ascii?Q?/q72Jj4YO/AiO0Tz9OOeVtF5cZPYtiuUNhjPg5RR6Rzm0z7ukXBvGr7cou3/?=
 =?us-ascii?Q?7sdn50VG4tEJtz3ZlZImLcyqndEbqrgfIlH0IjTC3r8ImaIzDmPFKveOgG+V?=
 =?us-ascii?Q?yngkM0qqmSiemz/bfjMDtb6/5YtXduOnLYGrToXFo1zvuR5iSecdYuLjfnB2?=
 =?us-ascii?Q?P/0EH87PSU+xdCmzIZspZhf295FHHt4El4QvY+bRoJg06WEIk0RR2oo311tD?=
 =?us-ascii?Q?R+wwCEG19Y8q5r+2NFvyj+Dhp79kEo29pMj157hCRNzHoccqfD3L48UVjJoS?=
 =?us-ascii?Q?/StHKlxc1yoVh6QyjeNs7i2iR/MV44+vf5DdtMSTW/qmobgya1DvQ0Aj5UaC?=
 =?us-ascii?Q?p72spjFJRFr99Fj2SpvhlYPZ/bkfK5QfKf9UsfZPCp4UgL6mRMlx26fwjkWu?=
 =?us-ascii?Q?zekpT7iGFMzFVY2nsGKNDMmMIBfjE/TDAKS+dCirFHUjUAIiSHUuc7D5cOFP?=
 =?us-ascii?Q?x1Dls+4YNlk2nxVtUu6la7q9BNBKr8ieArmdRYjckJBXllj3bpOpLiYphRU6?=
 =?us-ascii?Q?8TKMZ/Ux3Swwyx0U3NKBYGeGhOkEjXiMBKymiMknWEJu9djRWB4JX8S1ID+0?=
 =?us-ascii?Q?HtcLVrsn19Q1NZ5w2tjvq3QdjborMsZ1z1IW4EpPcIlaJEeSD+fVhjKCISop?=
 =?us-ascii?Q?0BiQXnn4Ee/Wxe4dfhcfxyqwcIq3wZA46Q4RzeCpvKgPcbDgwcqhVUlvWttK?=
 =?us-ascii?Q?mP1Sp0F/0KAbaXnYr+jWu8BRBk1TNP3ltY+yTqZx1nqMVzjaj0e8DaHhaEaB?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ce0dd1-94bf-4cb1-8851-08dc5f81dd76
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 08:30:55.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2UU4MYVe7SEHW6hY4TCr3Ql4EFw/2Ji9BdkWpLtvCS85oe/MDrSj4ABOnm38pYW9NlZKjitt+ZsVS6lV/5MaZtHNCIIBbJz7uRVyRk/ntI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6348
X-Proofpoint-ORIG-GUID: oUIe-6U9o8Loj9_QnxWUYwI_cWRVJFjM
X-Proofpoint-GUID: oUIe-6U9o8Loj9_QnxWUYwI_cWRVJFjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_07,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180059
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Apr 2024 08:31:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8684

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changes:
17ac6f691 lxc.spec: Align SPDX license id
5fe2de84c Makefile: Align SPDX license id
97f93be72 meson: Align SPDX license id
d4cd3741d COPYING: Clarify licensing of files without SPDX
8e67eb07c doc: Add SPDX headers and remove Author field
cb94edf53 src/include: Add SPDX headers
7bc33ef6e src/tests: Add SPDX headers
007642c89 hooks: Add SPDX headers
1e9e66be3 lxc.spec: Clear default changelog
202d649d1 lxc.spec: Use SPDX
85abd4026 template: Use SPDX
a074b3d27 config/yum: Use SPDX header
7ed43e5e9 COPYING: Remove whitespace
522721216 MAINTAINERS: Remove Dwight from the maintainer list
08bf8b9e2 lxc-checkconfig: Fix shellcheck
0f18db543 lxc-checkconfig: Show namespace limits
f71b8e3f8 lxc-ls: list names with whitespaces in `--active`.
816b8973d lxc/tools: set default log_priority to ERROR
989ea3969 tools/lxc_autostart: don't fail when there are no containers
dc4df2335 lxc/lxccontainer: specify file mode in open() call inside mod_rdep
630b46ed2 lxc/confile: do not print excess space before scale suffix for time.offset.boot
796f2ccb7 lxc/confile: do not print newline symbol in getter for lxc.time.offset.*
dcc4fb929 tests/parse_config_file: fix some typos
6fea67429 tests/parse_config_file: add tests for lxc.time.offset.*
ad8f55445 tree-wide: replace multiply_overflow with check_mul_overflow
4464cee19 lxccontainer: rework copy_file()
9d1aa932d lxccontainer: improve mod_rdep()
81c1bbf45 Revert "lxccontainer: fixes"
82fe01821 src/lxc/syscall_numbers.h: drop define -1
590a95d83 rexec: Avoid invalid free in rexec failure path
f9978b179 README: Correct 'armvl7' to 'armv7l'
046b63cd2 unshare: simplify lookup_name
7452ee8ab lxc-unshare: fix an buffer overflow issue in lxc_unshare
e88883445 lxc-net: Enable IPv6 by default
d78ca00bc tests/meson: attempt to fix ossfuzz builds
d18f993b3 github: master -> main
86799f554 meson: link with liblxc dynamically everywhere if possible
b90fecfda network: use IN_LIBLXC
9eee450d2 storage_utils: move get_fssize to utils
6eb0a73e2 storage_utils: unhide and rename is_valid_storage_type to lxc_is_valid_storage_type
42eeffcb0 confile: unhide lxc_config_parse_arch() helper
9bb318881 conf: reorganize/split code to utils.c
863c59dc3 conf: reorganize/split code to idmap_utils.c
b7591ad49 confile: unhide lxc_config_define*() helpers
f14656ebf meson: introduce IN_LIBLXC preprocessor macro
672b2172d confile: move lxc_fill_elevated_privileges() to tools/lxc_attach
8f9733d75 tests: remove old and broken cgroup handling code from tests
d51ea224e config: apparmor: add AppArmor profile for lxc-copy
627bb9460 tests: lxc-test-usernic: use iproute tool instead of brctl
df0665b6d oci: resolve cross-filesystem blob caching failure
ec85e5ca4 lxc-test-usernic: drop cgroup handling
27ec0b0f6 test-usernic: don't use ifconfig
44e845b3c Add x32 to the list of recognized architectures
07e3a516e lxc-download, lxc-local: preserve xattrs on unpack
9ac7c4895 tree-wide: use container_uses_namespace() in less trivial cases
64341ce7b tree-wide: use container_uses_namespace() helper
6b40e66c1 Fix error message.
c8189ee2a Add verbose output in download template.
84cc3155a Align columns in lxc-download.in template
872db5424 build: add more options for customizing install
df17ac417 Add loongarch64 support
112d5615e build(deps): bump actions/upload-artifact from 3 to 4
789457f1a config: try to create workdir if not exist
86f5c1226 lxc-local: Add --no-dev option to exclude /dev from the fstree
f885a3c56 lxc-local: Re-organize code to use more functions
7c025072e lxc-local: Improve usage info
faa38a197 lxc-local: Change LXC_CONFIG to LXC_METADATA to match args and be more clear
d65fe1b27 Disable IPv6 link-local addresses for bridged veth
8cff8fa1a don't try to delete vlan 0 from veth
0e932812a conf: fix ephemeral copies
abffab441 config/init: Drop upstart files
79a4a3cf8 doc: remove the warning mentionning upstart
7bf1695d0 hooks/ubuntu-cloud-prep: remove upstart handling
fb73c18d2 meson: Remove support for upstart
cc6819c69 reset root_nsuid_map and root_nsgid_map when idmaps is cleared
a87d6fcc9 lxc/checkconfig: use multiline `echo`
f3e01fa80 lxc/checkconfig: replace `echo -n` by printf
ba4f810bc lxc/checkconfig: minor cosmetic change
d52c345c8 lxc/checkconfig: avoid subshell (SC2235)
f84f03d1d lxc/checkconfig: remove superfluous (..) around test command (SC2234)
74b9faa64 lxc/checkconfig: check exit code directly (SC2181)
5cc69e440 lxc/checkconfig: replace `! -z` by `-n` (SC2236)
a4684eb11 lxc/checkconfig: add missing quotes to please shellcheck
8a611c0b2 lxc/checkconfig: remove some unneeded `echo -n`
cb2574319 lxc/checkconfig: replace `type` by `command`
003efe6db lxc/checkconfig: replace `cat | grep` with `grep`
adadfa372 lxc/lxccontainer: fix do_lxcapi_set_timeout retval
c02367e59 containers in the FREEZING state also need to be unfreeze
aca53bcf7 build(deps): bump actions/checkout from 3 to 4
84169158f lxccontainer.h: Move new fields to the end
e2696df93 Remove references to LXD
7cec54455 Update console perms to 0600
3f45443fd Fix start api call to split quoted strings in execute or init command.

Local patches modification:
Removed two patches due to they are available in the code:
0001-lxc-test-usernic-drop-cgroup-handling.patch
0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch

Refreshed templates-use-curl-instead-of-wget.patch

Ptest modification:
Released lxc-test-shutdowntest and lxc-test-state-server due to
those back to normal
lxc-test-no-new-privs and lxc-test-checkpoint-restore are
broken test, already reported to upstream[1][2], move them to blacklist
until upstream fixed them.
lxc-test-usernic always fails when use ptest-runner, but normal with
run-ptest by manual.

Ref:
[1] https://github.com/lxc/lxc/issues/4296
[2] https://github.com/lxc/lxc/issues/4435

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...xc-test-usernic-drop-cgroup-handling.patch |  61 -----------
 ...-and-broken-cgroup-handling-code-fro.patch | 103 ------------------
 recipes-containers/lxc/files/run-ptest        |  12 +-
 .../templates-use-curl-instead-of-wget.patch  |  13 ++-
 recipes-containers/lxc/lxc_git.bb             |  10 +-
 5 files changed, 20 insertions(+), 179 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.patch
 delete mode 100644 recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch

diff --git a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.patch b/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.patch
deleted file mode 100644
index 162e8f9d..00000000
--- a/recipes-containers/lxc/files/0001-lxc-test-usernic-drop-cgroup-handling.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From ec85e5ca4953292c4341497704ce738669a79b64 Mon Sep 17 00:00:00 2001
-From: Serge Hallyn <serge@hallyn.com>
-Date: Fri, 2 Feb 2024 10:41:11 -0600
-Subject: [PATCH] lxc-test-usernic: drop cgroup handling
-
-This stuff is not needed in a modern systemd based system, and in fact
-breaks.  It would probably be better to detect such a system so that a
-non-systemd box can still run this test.  But I'm not sure what would be
-reliable.
-
-Upstream-Status: Backport from
-[https://github.com/lxc/lxc/commit/ec85e5ca4953292c4341497704ce738669a79b64]
-
-Signed-off-by: Serge Hallyn <serge@hallyn.com>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- src/tests/lxc-test-usernic.in | 28 ----------------------------
- 1 file changed, 28 deletions(-)
-
-diff --git a/src/tests/lxc-test-usernic.in b/src/tests/lxc-test-usernic.in
-index 9af8678f3..49fd5e3f7 100755
---- a/src/tests/lxc-test-usernic.in
-+++ b/src/tests/lxc-test-usernic.in
-@@ -80,34 +80,6 @@ lxc.idmap = u 0 910000 10000
- lxc.idmap = g 0 910000 10000
- EOF
- 
--if command -v cgm >/dev/null 2>&1; then
--	cgm create all usernic-user
--	cgm chown all usernic-user $(id -u usernic-user) $(id -g usernic-user)
--	cgm movepid all usernic-user $$
--elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
--	for d in $(cut -d : -f 2 /proc/self/cgroup); do
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Create \
--			string:$d string:usernic-user >/dev/null
--
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Chown \
--			string:$d string:usernic-user int32:$(id -u usernic-user) int32:$(id -g usernic-user) >/dev/null
--
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.MovePid \
--			string:$d string:usernic-user int32:$$ >/dev/null
--	done
--else
--	for d in /sys/fs/cgroup/*; do
--		[ "$d" = "/sys/fs/cgroup/unified" ] && continue
--		[ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.clone_children
--		[ ! -d $d/lxctest ] && mkdir $d/lxctest
--		chown -R usernic-user: $d/lxctest
--		echo $$ > $d/lxctest/tasks
--	done
--fi
--
- mkdir -p /run/user/$(id -u usernic-user)
- chown -R usernic-user: /run/user/$(id -u usernic-user) /home/usernic-user
- 
--- 
-2.35.5
-
diff --git a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch b/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch
deleted file mode 100644
index bf8df795..00000000
--- a/recipes-containers/lxc/files/0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 8f9733d756361ff8f8d8d589f286c0e064b1195d Mon Sep 17 00:00:00 2001
-From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
-Date: Thu, 15 Feb 2024 18:13:05 +0100
-Subject: [PATCH] tests: remove old and broken cgroup handling code from tests
-
-We have removed the same piece of code in
-ec85e5ca495 ("lxc-test-usernic: drop cgroup handling")
-let's do the same for two other tests.
-
-This fixes autopkgtests.
-
-Upstream-Status: Backport from
-[https://github.com/lxc/lxc/commit/8f9733d756361ff8f8d8d589f286c0e064b1195d]
-
-Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- src/tests/lxc-test-apparmor-mount | 29 -----------------------------
- src/tests/lxc-test-unpriv         | 28 ----------------------------
- 2 files changed, 57 deletions(-)
-
-diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-apparmor-mount
-index 7c9d9ad50..ddf783d4b 100755
---- a/src/tests/lxc-test-apparmor-mount
-+++ b/src/tests/lxc-test-apparmor-mount
-@@ -119,35 +119,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
- 
- cd $HDIR
- 
--if command -v cgm >/dev/null 2>&1; then
--	cgm create all $TUSER
--	cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
--	cgm movepid all $TUSER $$
--elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
--	for d in $(cut -d : -f 2 /proc/self/cgroup); do
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Create \
--			string:$d string:$TUSER >/dev/null
--
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Chown \
--			string:$d string:$TUSER int32:$(id -u $TUSER) int32:$(id -g $TUSER) >/dev/null
--
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.MovePid \
--			string:$d string:$TUSER int32:$$ >/dev/null
--	done
--else
--	for d in /sys/fs/cgroup/*; do
--		[ "$d" = "/sys/fs/cgroup/unified" ] && continue
--		[ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.clone_children
--		[ ! -d $d/lxctest ] && mkdir $d/lxctest
--		chown -R $TUSER: $d/lxctest
--		echo $$ > $d/lxctest/tasks
--	done
--fi
--
--
- run_cmd lxc-create -t busybox -n $cname
- 
- echo "test default confined container"
-diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
-index 8fb9106d6..426add9da 100755
---- a/src/tests/lxc-test-unpriv
-+++ b/src/tests/lxc-test-unpriv
-@@ -130,34 +130,6 @@ chown -R $TUSER: /run/user/$(id -u $TUSER)
- 
- cd $HDIR
- 
--if command -v cgm >/dev/null 2>&1; then
--	cgm create all $TUSER
--	cgm chown all $TUSER $(id -u $TUSER) $(id -g $TUSER)
--	cgm movepid all $TUSER $$
--elif [ -e /sys/fs/cgroup/cgmanager/sock ]; then
--	for d in $(cut -d : -f 2 /proc/self/cgroup); do
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Create \
--			string:$d string:$TUSER >/dev/null
--
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.Chown \
--			string:$d string:$TUSER int32:$(id -u $TUSER) int32:$(id -g $TUSER) >/dev/null
--
--		dbus-send --print-reply --address=unix:path=/sys/fs/cgroup/cgmanager/sock \
--			--type=method_call /org/linuxcontainers/cgmanager org.linuxcontainers.cgmanager0_0.MovePid \
--			string:$d string:$TUSER int32:$$ >/dev/null
--	done
--else
--	for d in /sys/fs/cgroup/*; do
--		[ "$d" = "/sys/fs/cgroup/unified" ] && continue
--		[ -f $d/cgroup.clone_children ] && echo 1 > $d/cgroup.clone_children
--		[ ! -d $d/lxctest ] && mkdir $d/lxctest
--		chown -R $TUSER: $d/lxctest
--		echo $$ > $d/lxctest/tasks
--	done
--fi
--
- run_cmd lxc-create -t busybox -n c1 -l trace -o "${UNPRIV_LOG}"
- 
- # Make sure we can start it - twice
--- 
-2.35.5
-
diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
index 196adb04..278107d9 100644
--- a/recipes-containers/lxc/files/run-ptest
+++ b/recipes-containers/lxc/files/run-ptest
@@ -12,9 +12,15 @@ blacklist="$blacklist lxc-test-apparmor"
 blacklist="$blacklist lxc-test-apparmor-mount"
 #lxc-test-get_item would report Built without AppArmor support error
 blacklist="$blacklist lxc-test-get_item"
-# These currently hang so skip them until someone fixes them up
-blacklist="$blacklist lxc-test-shutdowntest"
-blacklist="$blacklist lxc-test-state-server"
+# This is a broken case, also fails on opensuse, already reported to
+# upstream https://github.com/lxc/lxc/issues/4296
+blacklist="$blacklist lxc-test-no-new-privs"
+# lxc doesn't adapt the criu's new mount flag, that cause restore fails
+# already reported to upstream https://github.com/lxc/lxc/issues/4435
+blacklist="$blacklist lxc-test-checkpoint-restore"
+# if we run "run-ptest" under /usr/lib64/lxc/ptest, the result is normal
+# but it would be failed when using "ptest-runner lxc"
+blacklist="$blacklist lxc-test-usernic"
 
 # Tests in firstrunlist will be run first
 firstrunlist=""
diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
index e9af8335..3ef66138 100644
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
@@ -10,6 +10,7 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Joakim Roubert <joakimr@axis.com>
 Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
  templates/lxc-download.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -18,7 +19,7 @@ diff --git a/templates/lxc-download.in b/templates/lxc-download.in
 index a62ddf482..690307338 100755
 --- a/templates/lxc-download.in
 +++ b/templates/lxc-download.in
-@@ -59,9 +59,9 @@ cleanup() {
+@@ -45,9 +45,9 @@ cleanup() {
    fi
  }
  
@@ -30,16 +31,16 @@ index a62ddf482..690307338 100755
        return 0
      fi
    done
-@@ -70,7 +70,7 @@ wget_wrapper() {
- }
- 
- download_file() {
+@@ -59,7 +59,7 @@ download_file() {
+   if [ "${DOWNLOAD_VERBOSE}" = "true" ]; then
+     echo "Download file: https://${DOWNLOAD_SERVER}$1"
+   fi
 -  if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
 +  if ! curl_wrapper -L --user-agent "lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
      if [ "$3" = "noexit" ]; then
        return 1
      else
-@@ -176,7 +176,7 @@ while :; do
+@@ -167,7 +167,7 @@ while :; do
  done
  
  # Check for required binaries
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index ee0e442f..379b4ecd 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
                     file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 "
 
-DEPENDS = "libxml2 libcap"
+DEPENDS = "libxml2 libcap dbus"
 RDEPENDS:${PN} = " \
 		rsync \
 		curl \
@@ -36,7 +36,7 @@ RDEPENDS:${PN}-ptest += "file make gmp nettle gnutls bash libgcc"
 
 RDEPENDS:${PN}-networking += "iptables"
 
-SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-5.0;protocol=https \
+SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-6.0;protocol=https \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
 	file://run-ptest \
 	file://templates-actually-create-DOWNLOAD_TEMP-directory.patch \
@@ -47,12 +47,10 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-5.0;protocol=https \
 	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
-	file://0001-lxc-test-usernic-drop-cgroup-handling.patch \
-	file://0001-tests-remove-old-and-broken-cgroup-handling-code-fro.patch \
 	"
 
-SRCREV = "cb8e38aca27a23964941f0f011a8919aab8bebab"
-PV = "5.0.3+git"
+SRCREV = "3dee5fb88c6f77496dbcab46f31bcd891c9ee4e0"
+PV = "6.0.0+git"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


