Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A203C35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 03:54:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13516.1742529295043204175
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 20:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5175658e75=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L3ZTJ2022699
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Mar 2025 03:54:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45cxs0xv8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Mar 2025 03:54:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8NxToOWmxfPU/27L89jIyTlMpJKk3tC2IO0M1AlpQ3TBbHe1qaUseA/lxOLCr3BA54r0sxLzolQf76YVBH1mWlaggXFi9uV5lgpkLh91uJ7u4+TvbDkyK/JYNyodYrEYsqAnKeY71u/+OZn7dSLJBEAHBvlGPsXna1u6z/pFCu4GnYXPb4ftfeHu2QrPupmfKJbVcaFHPIuXNqORSwo5cdNz5Wu7peHCtqfole01oQ7J2uQmj9IN3j7GRg1sJUnzZrRX1WC4JkhDSLOR4AwMtzYd2DekQIT0fF+hJtUUWarWL0zGdoxPycrg+8gXB3CpARQu+uH0mnqSXn0eO0b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Af/q1XsU9huKIdcppONqTdRiDjwa+ZW3VSf+k97ivw=;
 b=QhBbkUhiGN1ZAi44w7/MSoUswdqGU2XgWjDsn465bTRXHbPcEtllZqBVEByAuEgh3bQBvyy0qcTdnNcjW80IDKaNL5XkwhQhqQKLdYZa3DtB14P7Bn5wUo1YboyKvm63WiJ4ARaHqojNPlRwyMUBhNdK9+o2pAdmT0NoOG1KYE89xUWmCaikuYV1FzVp4dWx7jXmpbd6G8feG5xBa3Q/uHGojBFyGWEqEYRw9hrvIcZMd+egoYe5Fkkai1bvEeQa/zPxijCmSAqttB6E7Ao8H92K7UIIONBDUb8+VytI+/xIsGlwvW4c8+/zo/nwSXkBSiF34ZyR9Nz+qAZWY4yP8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by DS7PR11MB5992.namprd11.prod.outlook.com (2603:10b6:8:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 03:54:51 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%3]) with mapi id 15.20.8534.027; Fri, 21 Mar 2025
 03:54:51 +0000
From: guocai.he.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 1/1] criu: Adjust to glibc __rseq_size semantic change
Date: Fri, 21 Mar 2025 11:54:32 +0800
Message-Id: <20250321035432.1237340-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|DS7PR11MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 1556ea9e-641e-4d4d-50ce-08dd682c21a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zyuEYiTVaJVQrUtvNNjAlqHLZlI4hXWKdRZDOV+h14elbMLxQFnzJo5JJjPD?=
 =?us-ascii?Q?cG/x0KRpCdZXLFPg82zrXfH8HXIuJ1nXmOpUV3MndteYVmKmAXFsp7mzOsjJ?=
 =?us-ascii?Q?bE+iv9HtdWVALNszWn8MTnS/tSzHSyaedm71ojyPHxWBl2ur/hhJn8Ci/MC5?=
 =?us-ascii?Q?umOtWbx2TLfM19i9HBn2HzdfTuLRRdrbHXGj3Fxni85NjgESt8hu1ma6JD66?=
 =?us-ascii?Q?llx6pzxFt0KeYFaTs7gMwB+r1yQfKl3EasoEowwgw8PXzfHsQnPhSE5oQdGe?=
 =?us-ascii?Q?bx7fLv5zQTYC/me632dBx+5PWrQ8mfFCaUMAIsR9TAuK5U4ud0uRHhiieuk+?=
 =?us-ascii?Q?DyTEYxvigcpvtHD1WfgQQadbJeHwqS0PMQzYClcbyQ0n5Fz/+mkWWCz3X5WH?=
 =?us-ascii?Q?MqOMgH+HJxaDBU8dZycr9qhtwBRxS+KnaOK9dlOGHbo/EHOdHXYjpqA8Gcl/?=
 =?us-ascii?Q?RsK4dLHoC+9JthSTo2OI+QXWzciLrm2NNtH4tM0V4Hs5OL1vJlHW0NwEgTmj?=
 =?us-ascii?Q?en5B7bMWDCcwn/x6+plhs2zyOv61+RcidsgEc4HuePKLG0J888pnQTUmBV2b?=
 =?us-ascii?Q?hqtmAv2FB3OEKLJIJygWmindXBJMflQLix0HDRbA1hLxo3ckgU68VKTONcMv?=
 =?us-ascii?Q?c/QAw+ub1XpxJjJnWCLqn2RbTkQtfi7IrthxjaNIt4nNASBEl2GSza5mtMxP?=
 =?us-ascii?Q?8RHZaBQg8yJi321FIhBMlkAox7m2xYdb7+sPi31LlV3hkFNnEC5STQbbIpdE?=
 =?us-ascii?Q?9lTq2Nz2Kny1LbUy/XQB+NfVl7SD0jqdTOEc5OP9FIAkeH/KAKMP4H+Txxjv?=
 =?us-ascii?Q?lgpKi3DkCGgbcwJuYkN8Jq94TT2/OVrK7SoeRCNa31GrpLzi9garETDtkm7B?=
 =?us-ascii?Q?Lbfoq69edJmdT76omppQ/hzh3weUcTvuc1cS/Bkl3RbmAWY/F2UwXnjPrFMG?=
 =?us-ascii?Q?ZXtb36wTrs48HfmDOCgIlFnqbWF5+nlWYb+s28Nqc7T7YsXFFukZDC+eB4Tl?=
 =?us-ascii?Q?wK14Mm0LJfnPU9JxuAtn/4mvue1WjCvPD7AFwmkf0Q1PXGwi5/CMIcXFx93y?=
 =?us-ascii?Q?z7a9sXK6lnTfC+oMGetHZHIizTEwCya706w/pcX0eNBaKaSreNdtvPfCTLbN?=
 =?us-ascii?Q?7/R/reH7SU7YbDQmRGkn3BqecSXi0VksqFJRGr457BfXOe798Y7nIsJ3uETv?=
 =?us-ascii?Q?AxfGNdghtVyLeM9fFommPdbuIwf7HeAqF8ODZw8qT8n6Fzen9eS2eJ3Cz+nk?=
 =?us-ascii?Q?e2TSv6QNbDiusyRBAT8LROeI7nPd3XFJ7xHjCWkPS4dtzJXuiZJoWs3lDrDi?=
 =?us-ascii?Q?LpVRDlWnMNHKo5KmpAoMw4mEU09NTxTev190LLTta0dzji3hwWRmH70h9T9Y?=
 =?us-ascii?Q?B+4eisjmAojWSELU4pyuGo+kR8O+tASgWWrPBfrM/dW6Mwjs8ZLWfR2qM5lU?=
 =?us-ascii?Q?R0yLPEHxQVakbKK07DsweNtG/ZmEhBdA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?It8pZpmkS1K+cakMNTnSOFag+H4jZB11WGHeuEm5wlQQ5Ongd0dsNPrxkw73?=
 =?us-ascii?Q?j1z40g3E+RMDh57YvWVajhNpUJSeetn8BlBiwczNw5MuNVGJDKxVmzjZUXRK?=
 =?us-ascii?Q?8HRK4uqsEN+QdBwFYCXh25BorTtuuwdwzz9X9O54DAAIgamFcfM1V2s9Ay6g?=
 =?us-ascii?Q?xvw9xDjL53/NokcFyDUbWXHgfD4kATHUY7qDWsYy1FIu8pVYb4yyY+Hf1zV0?=
 =?us-ascii?Q?0Xf6Q4XSkfEHBsBGzSNyn7Adf2HAPW/HSGsXahSuVv1ZmbHt3fRWgfG9sYmC?=
 =?us-ascii?Q?8ZgvbS4CwOLI4I3m/8DK3YKy1GD9EolFgU//+/cxilPYYmr/wHLh6hm/Emky?=
 =?us-ascii?Q?cr3fgJRSr+KHQQHFVJKSd5csfDn3biOcCu7wZxNLt3vMmaz1ZQ7KJO9aP5dU?=
 =?us-ascii?Q?gjDd8GCkYwe8dTw3VUQnog1oBPOEdcaYZCvR3l68RCdV96BHiDW9ooudwAfD?=
 =?us-ascii?Q?Jho06RMc0GxkN3Ncvyy9uSIJI2y8KlECW+1gmCCz3ZCWX10SiUy/SbzfZTtR?=
 =?us-ascii?Q?6vR9sRSSY42sHh2qiyqt/1GxqAkesagesLn+vohFO6fMszp5heCSV/sUegWa?=
 =?us-ascii?Q?TLOovcPVzoinFsPwAAtUFK1BH6T+Cr9lSTDndgfAtCYj4zKbYxg624Vv0Znh?=
 =?us-ascii?Q?Qw8YDDLI7kGnTrmWNjXg9UY2I+HORKGQ3lHIuxV7eT7un0cToX0VaywrQUYx?=
 =?us-ascii?Q?msZTjD+Mt8yj2DR26iWBvULupIrWgBD/F55NhC4NAgUotNtbgevNtC6RCXP/?=
 =?us-ascii?Q?pPdITEGeO7/lUYHoAJRa6/upWBvcrlIPq3U6rykQkySeQeanPSjifZ2FfowE?=
 =?us-ascii?Q?+u6U2vtVfWvzAaNv7tx0XLLYHIJGAqDY8btKiTe4WvFvORlo8SIuvKjj9/yd?=
 =?us-ascii?Q?UDu2CehyDGC8zPJrNqal2ON1p3M4Dkt+bRQ+LuYwxZDqE+NmNTmzYVuYHVwE?=
 =?us-ascii?Q?zAatqy4xEqC8lqMDEfdQfYcQhVaUUFrJ920dgRejbXQr6CNLr6B55B7Iilq0?=
 =?us-ascii?Q?3gGHZDyMsle6pkgDAmjxv9BVh4vpHU2FcMrd218Nwe1qHwJzcc68uuZK9ojK?=
 =?us-ascii?Q?2vgqW9uL7Esqn8/wJeo3HxkkUuUZ+ZdMGuwI0hB6A0j9oey2//PwPLBzJFZG?=
 =?us-ascii?Q?d+UZOqgDCp454SEIEtm4D7cWc6pSfupiCt5HWLYtyTBolcPHnlKC1VRG55hO?=
 =?us-ascii?Q?lUq64E0inb5o8U7zHoHIWCM0Jv5q3PcqcA/KAa8Y5ZgmiWvmOMI6knw7udx5?=
 =?us-ascii?Q?2wXhipp4t9aaY9ZWoXXSCp/fOAVvc0h1KLJQmtF3m1/1mYXaOlAo7lAsnlfU?=
 =?us-ascii?Q?psXbfAEypTKG6X/xXnQJTPZcyX2RNDJoNM/nUfiKyiHtI57eBCqLgMQvdidr?=
 =?us-ascii?Q?3idsjha4bB/Mbi92puhN9uUFj9rewhAWqwK37wggXWzCvYj8+h4/ZQ4v/l2p?=
 =?us-ascii?Q?RezlZykbtj9K8LeyCGS/YIUYJwhhdhYC0LzgeLLE5ic09GAsTVJ+S+rqMTOU?=
 =?us-ascii?Q?R8otUBWn/+tZUFqNJ9pzpvW1z0zf6I6i29WCOzzkPRKUdMufQh/NJACGZpa0?=
 =?us-ascii?Q?ASm7DCimaMILLnD6fHW8EnATJolfvqpDa6iYv5Sf7GSW8R5LCCxBcSUa4z6W?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1556ea9e-641e-4d4d-50ce-08dd682c21a9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 03:54:51.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PHXix7rv97/iuVSK9wU6dvFvB71fnXxQ/KABtGi5ZyiqyhqKNoJmOZj97C+JVZTwKWo44+C8ooPdb3CAs20EGTzqKx0Dag9sC9zOlvK0k9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5992
X-Proofpoint-ORIG-GUID: bOiBpSN8R_7S4pOLi12E-0540uPIsllt
X-Proofpoint-GUID: bOiBpSN8R_7S4pOLi12E-0540uPIsllt
X-Authority-Analysis: v=2.4 cv=NY/m13D4 c=1 sm=1 tr=0 ts=67dce30d cx=c_pps a=F7QtyTBSWJEVkVFduP+sHw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Ljcx4Z80PikA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=4ogO6T2oHLXmShntCgEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_01,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210025
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Mar 2025 03:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9169

From: Guocai He <guocai.he.cn@windriver.com>

On criu version 3.17:
When use "criu restore -d -D checkpoint" to restore, the error is:
1272: Error (criu/cr-restore.c:1498): 1295 killed by signal 11: Segmentation fault

The root casue is that the glibc updated and criu should adjust to glibc __rseq_size semantic change.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 recipes-containers/criu/criu_git.bb           |   2 +-
 ...to-glibc-__rseq_size-semantic-change.patch | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/criu/files/0004-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index a9da837f..f67b794e 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=h
            file://0001-criu-Skip-documentation-install.patch \
            file://0002-criu-Change-libraries-install-directory.patch \
            file://0003-lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
+           file://0004-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch \
           "
-
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
 DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd libnet"
diff --git a/recipes-containers/criu/files/0004-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch b/recipes-containers/criu/files/0004-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch
new file mode 100644
index 00000000..b6f642f8
--- /dev/null
+++ b/recipes-containers/criu/files/0004-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch
@@ -0,0 +1,100 @@
+From 9f2eb6b9c4642fdc8aba2712d21cbe75545e4ab4 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 10 Jul 2024 18:34:50 +0200
+Subject: [PATCH] criu: Adjust to glibc __rseq_size semantic change
+
+In commit 2e456ccf0c34a056e3ccafac4a0c7effef14d918 ("Linux: Make
+__rseq_size useful for feature detection (bug 31965)") glibc 2.40
+changed the meaning of __rseq_size slightly: it is now the size
+of the active/feature area (20 bytes initially), and not the size
+of the entire initially defined struct (32 bytes including padding).
+The reason for the change is that the size including padding does not
+allow detection of newly added features while previously unused
+padding is consumed.
+
+The prep_libc_rseq_info change in criu/cr-restore.c is not necessary
+on kernels which have full ptrace support for obtaining rseq
+information because the code is not used.  On older kernels, it is
+a correctness fix because with size 20 (the new value), rseq
+registeration would fail.
+
+The two other changes are required to make rseq unregistration work
+in tests.
+
+Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/
+089345f77a34d1bc7ef146d650636afcd3cdda21]
+
+Signed-off-by: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ criu/cr-restore.c             | 8 ++++++++
+ test/zdtm/static/rseq00.c     | 7 +++++--
+ test/zdtm/transition/rseq01.c | 5 ++++-
+ 3 files changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/criu/cr-restore.c b/criu/cr-restore.c
+index 9853c0585..df2010a4d 100644
+--- a/criu/cr-restore.c
++++ b/criu/cr-restore.c
+@@ -3087,7 +3087,15 @@ static void prep_libc_rseq_info(struct rst_rseq_param *rseq)
+ 	}
+ 
+ 	rseq->rseq_abi_pointer = encode_pointer(__criu_thread_pointer() + __rseq_offset);
++	/*
++	* Current glibc reports the feature/active size in
++	* __rseq_size, not the size passed to the kernel.
++	* This could be 20, but older kernels expect 32 for
++	* the size argument even if only 20 bytes are used.
++	*/
+ 	rseq->rseq_abi_size = __rseq_size;
++	if (rseq->rseq_abi_size < 32)
++		rseq->rseq_abi_size = 32;
+ 	rseq->signature = RSEQ_SIG;
+ }
+ #else
+diff --git a/test/zdtm/static/rseq00.c b/test/zdtm/static/rseq00.c
+index 471ad6a43..23b2d74ab 100644
+--- a/test/zdtm/static/rseq00.c
++++ b/test/zdtm/static/rseq00.c
+@@ -46,12 +46,15 @@ static inline void *__criu_thread_pointer(void)
+ static inline void unregister_glibc_rseq(void)
+ {
+ 	struct rseq *rseq = (struct rseq *)((char *)__criu_thread_pointer() + __rseq_offset);
++	unsigned int size = __rseq_size;
+ 
+ 	/* hack: mark glibc rseq structure as failed to register */
+ 	rseq->cpu_id = RSEQ_CPU_ID_REGISTRATION_FAILED;
+ 
+ 	/* unregister rseq */
+-	syscall(__NR_rseq, (void *)rseq, __rseq_size, 1, RSEQ_SIG);
++	if (__rseq_size < 32)
++		size = 32;
++	syscall(__NR_rseq, (void *)rseq, size, 1, RSEQ_SIG);
+ }
+ #else
+ static inline void unregister_glibc_rseq(void)
+@@ -140,4 +143,4 @@ int main(int argc, char *argv[])
+ 	return 0;
+ }
+ 
+-#endif /* #if defined(__x86_64__) */
+\ No newline at end of file
++#endif /* #if defined(__x86_64__) */
+diff --git a/test/zdtm/transition/rseq01.c b/test/zdtm/transition/rseq01.c
+index b6d470785..de4355845 100644
+--- a/test/zdtm/transition/rseq01.c
++++ b/test/zdtm/transition/rseq01.c
+@@ -33,7 +33,10 @@ static inline void *thread_pointer(void)
+ static inline void unregister_old_rseq(void)
+ {
+ 	/* unregister rseq */
+-	syscall(__NR_rseq, (void *)((char *)thread_pointer() + __rseq_offset), __rseq_size, 1, RSEQ_SIG);
++	unsigned int size = __rseq_size;
++	if (__rseq_size < 32)
++		size = 32;
++	syscall(__NR_rseq, (void *)((char *)thread_pointer() + __rseq_offset), size, 1, RSEQ_SIG);
+ }
+ #else
+ static inline void unregister_old_rseq(void)
+-- 
+2.34.1
-- 
2.34.1


