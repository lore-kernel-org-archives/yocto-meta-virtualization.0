Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7404ED69117
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 15:25:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.96971.1732807498937445085
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Nov 2024 07:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2062888363=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASCs1m4029586
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Nov 2024 07:24:58 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 436719s44d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Nov 2024 07:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cp1sjK9sX8TeazoZxCluvaL9gpsRNlDIYsKbv6wxyY75OmbWVs6kr/aTZ+4u5JIwMhEXG344i4H3pV4nPj/5VsOmZb0+UpOfIdJ7VBkcmWHUKucAAIICM6iGR96yO1Voo/U7Rj8mklf5ej6QQvJigp115+nHvXRjpmtoIaY7gcD+Fig1lfpjRrrl302WqpcnAEdIOQhMusRBsFgoTkoVAK2Bf9KwpIm3UEId6xAs4cJkkNfeeFUOeCocCrwfJmfgbRFeQTvAKOWzALCGdH+hCXz1ZhthIZL7B47WcW9ee/QR+D2QEXslnKjMAKO/RbIOZkQjy4n1Xfq2Vw+ILQLBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpvGqMiGIueKp/gczyDjIF+D8BC9J7cHcu0Te+Aymxo=;
 b=cESrvlO2T7wt9U03yPydg/3c5jwvtML0BZhytMuEzLbUhZt5NGC7dv656AYv1FrRf2ZWfdc3NXizp461X1MiGzL7Eb7yHQGxmhjlau1sf3Htj2C82LNe9/WK58F7d/Yb1HYEr0kbYbp9icBs6e9i9d8ITt3gxU5impo6Vo9TLv0ZEHbInD3YRMuHfN61kuF+uVX1+BgKM2EgYKQBguUWSbFgB0FiNVcpn8sxC773q6beJJwLWqZ7pFa/mR9NkFJXRc4ZFXyiHZxSLT2TPK8H/uNbAKaeZ+lzWqUQxqMGek6wf21Yqe7h0WkBgCvcZVt+00NA4LAFRonuOz10I2r8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SN7PR11MB7092.namprd11.prod.outlook.com (2603:10b6:806:29b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 15:24:53 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 15:24:51 +0000
From: peng.zhang1.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH v2] cri-o: enable ptest
Date: Thu, 28 Nov 2024 23:24:39 +0800
Message-Id: <20241128152439.937326-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SN7PR11MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c11135-7e8b-425e-f2a1-08dd0fc0cd20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M0alPEOe6Jp18/RTceH/nXolWIthyCLOe4bHCqCcaZTOqFF9X1dfC7l9E3+6?=
 =?us-ascii?Q?L7fkNSiaD6c/ljLKNs3jbAkBlEtKeV646PSy4ouo/O63KEjX41ri/hU2QgTp?=
 =?us-ascii?Q?QrWN7YgDen+tZUjYeK7NVZ72N2ywFFLBgbN1vF6IpeJd8a53NpfGado1XgXG?=
 =?us-ascii?Q?cMf+KLI9fcHbkjSH4ISLfCnd2RogKtm3RSAI01yViv/gnc0dJoELyivxnfsT?=
 =?us-ascii?Q?KBGquaFXTVe6k9kDzunW0pBwNB6+Olu+fVOQ0Np59JtCGygT/A7CdULRI8KP?=
 =?us-ascii?Q?zfpPIvClevbHkMVWQmCM5LkW4keaNdWrFGnOmR69C8Ae7YGkG9Gxup5LIVdd?=
 =?us-ascii?Q?Fwc0A13JRqmEAsBy0CIVgAUzKC94yHWNMFnT4ky/rNifbnrToXfmGERoyT4X?=
 =?us-ascii?Q?8CvLz1VEYC2VPk9aSaRAQyvSiB1/1kjq1JNA2SYHsmuUuNA1cSu8eJbQAMgx?=
 =?us-ascii?Q?B865+hxTJ2DWPOO1juz58ioDkYYlynHeX11A3DOq55ECTpc5qxJQj7q4soF5?=
 =?us-ascii?Q?LDXAvtLkGqr/2ksj/8b55yHzTIpWbE2DlxE8ynrM/kTn2XN1HNiGX4pebhUk?=
 =?us-ascii?Q?n0xvf33NzmbOLu5iurmRacd4n93oAQG3et5zYPR76lWhcdsW77AtVIX8oa+E?=
 =?us-ascii?Q?pGNQyjNR1UURqwiEx/UqF/MMiWFsX5OLhW3Asj/W4VQHJ5f83gevNcdnC7VT?=
 =?us-ascii?Q?kuiKu6thUHkTCGOU6hBEcD/yiHLlcvmT/08Y4fqclCXXpFggEH1Zqe8lPdqQ?=
 =?us-ascii?Q?68+zgynaO7b3SM7i8/gbRvd6Xb4Z2BGZroQtQUd1w4pPhIztMfLWyH3KlgvA?=
 =?us-ascii?Q?92MNItc6ur0gU3LvV0TpBNIbUimqykSFWT2IJPJLDajB/PTFgt/uvp4uaWyq?=
 =?us-ascii?Q?pWcBBP70wuGAFqrmVOXqoy/46t2twfph0LaFvHMya/2LPXIGxHHZH2OP9V5V?=
 =?us-ascii?Q?bJefGCzYHrlCHubMTn2yAdGqFy09o5+h9aepoahwCwqjwxIItDF6/yqW+FdU?=
 =?us-ascii?Q?ulHF4/bzqynsPSKlttReuP7DBuk1f/IWTCiuuWyzxx4Tbo81o0VETje32L/t?=
 =?us-ascii?Q?2MWtt6xHnRW3BNtMxp6Gi+ciV693ALs8/OGtip61ASPY21NWA0XRR4z6y3Ht?=
 =?us-ascii?Q?GMDty3JWjlVWQH/Th9CnB9arr1oH825bSOXv713nBMBpHf8XifcbQyIH8pXX?=
 =?us-ascii?Q?Cp6N0E1bRZ2VtX9bB587MLB9gZL+Ql9eEhkdqL89WiczQfL4mrauR3bEqAYJ?=
 =?us-ascii?Q?AcOw7Wwhp17N3Me1jybEnwccDdcdXZQJ3sreQ3V7p9VLBhVBDIj5KkBRQNqI?=
 =?us-ascii?Q?C4ojZBFeKgF/UCW4dtGqfvQu2qg+aE2WEJur4zLUN4qBj6/1Lr3fMnwpBuYV?=
 =?us-ascii?Q?ceDvHzE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xO6O4GmS3mqBl+kSEyLVnObaLj6meeuAHKBL4q9Gz3Vf7H8rf0W451cOTJKi?=
 =?us-ascii?Q?5H5i2lprCWDa6gZLBj/HdepiXxjZUPA2a/ODG2pAUdLEW+labqwiLJmREE3O?=
 =?us-ascii?Q?tSBjbAUboX20qyhgBqon0A07708XV2UHg4PQlJYA3yMsHApcnQRwTg9rhVR+?=
 =?us-ascii?Q?mO7zExeXeVWsfVhtzzY4NNex5Mxf6hDvRhmjdz1arCAIoyGBFf+estImaiK8?=
 =?us-ascii?Q?BV6R67Xcl2q6KGDuPymHRxUOjzWOKwwArUtJLDaIGhqDEH0VMDSlW4y1jQoI?=
 =?us-ascii?Q?wcSgREasXMtKD/CeCtzFt6s+2AzyBQrzvSRbAjSSIhnBZNNLuAM189hqGZgE?=
 =?us-ascii?Q?WE54pouFTt1iHXVe7nrZcYcZjIJJvEwfCfhI+U22eJCCU6PIqOqY113I5Zqf?=
 =?us-ascii?Q?KhBzmBdWqXHc+VDLH4tbL6udS1fzo34sqaUhmxV3+hp7XUN/fnFJdPGIisj7?=
 =?us-ascii?Q?NX42dKXh7RS7hJ4iOV9gYYPcr+tQn6INX8KZZOK7TX3ripl+OkL0VN1DCNXG?=
 =?us-ascii?Q?4q/C64w57a9BIbJ0O0PRt1j48dmb3gRiAtLsCQjQqTqGjuJI9BjjkFoT73aR?=
 =?us-ascii?Q?gifCAGKCsrWlFvhZztfkNhanUXtWAf0fTa1vwVIthzG+bJpbpTfV+Z3hyHIw?=
 =?us-ascii?Q?QM3p3hIumDrIcUjZ0hUa+uOmjmOo2uFdyz4yf3TsjPA3xPOS53W54vFAorq8?=
 =?us-ascii?Q?1pWa+FlfYZAObpnmLK6KnUL1ipRAIySX1OY5KSwDSyR2iKAg6wCWsopI0Cwy?=
 =?us-ascii?Q?AlbD5fcYxxmSKSmK9cbn5lUZCyUFQpVZ7SsASus/1iid72D2Ei5/W3ZnlRDF?=
 =?us-ascii?Q?H/6FFA6CPeQnSY2eg/VDDMrzUXJ4KVnqZjOpzD/gRvZb1edmxii1W5dMDTIn?=
 =?us-ascii?Q?H35n9K9ps/9GI/SVQQN/VqJiLx9RVenEtWHwuX4MNfWaENzNaHa5DCqJH6FB?=
 =?us-ascii?Q?NugnXIh90Orn+oeA4qDEkpvqglIbnEOHNGgYgr8cJzubfnD9omEemuBw3xHY?=
 =?us-ascii?Q?7S41LA1hZ7b17gbfYJD6WZ/worzTj3sKmBPDOctWFj3z4v5FQU/QEzQJ+2qV?=
 =?us-ascii?Q?jSj2UDTRKtrGypY6F+eAClRzk2a/rNAG4ZbEweheHvU+HkCiVI1WSadzeR6f?=
 =?us-ascii?Q?f0+cZLc0vwxs56Ve0Ai9sK3t7EdtBcGD/t2w3QnUXYCYuLR0ossm2pWG34Lq?=
 =?us-ascii?Q?nty7Q9XHKnYr7iwKjlqpyWafU9Mx8OnvTbHaoDaNKj3TKxTC0L9KVcTz5pA4?=
 =?us-ascii?Q?jnfxgkTdhuH4WOuFvAMxjuusHB6WMNr48r/YtgX7N9szA+7D12NuNzDEQLHm?=
 =?us-ascii?Q?jWjKvZQZiYPR/sgk4xrXAx7mVhWVkcFIeygaLg+wkHp0e6ivcNDzeJ1r+NGs?=
 =?us-ascii?Q?g4PX3h7bOsO1Rb+yAb3UXey+im7C2hXOf5HhFbeLSkyHbtpRQIVh2Jx/bWdh?=
 =?us-ascii?Q?27kBlNlWhy+r7ClcHhAR+0bdAfxOx18EjxuWtKGu1LcDDSQ+CmKGNwN/fbrk?=
 =?us-ascii?Q?Il9ZDzjAUYcKCYHmta4TPG5m8LO+zAJxbnGsPw6sJNXT1lDU5inaNVkTq1X3?=
 =?us-ascii?Q?qBWe6OsaCFXXqSY3LZuw2PZ9HJLRC5RPuMaSPUAWeWapuAP3NKoc0LhhIbsR?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c11135-7e8b-425e-f2a1-08dd0fc0cd20
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 15:24:51.0195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2jFAGOD6HmD76Dn5I4TWjXd45htYvG8A5LRFW6LN2qWh6S0Edg9z/6jN7n7+hkh4mhVTSIkYkHbmiUIrKYd9uFSFVFiofGc2o2h4lZDmDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7092
X-Proofpoint-ORIG-GUID: fqVJKJjgIKzgqC80jsD0U7VIAECOCZ0k
X-Proofpoint-GUID: fqVJKJjgIKzgqC80jsD0U7VIAECOCZ0k
X-Authority-Analysis: v=2.4 cv=Z/8WHGRA c=1 sm=1 tr=0 ts=67488b4a cx=c_pps a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=ogMBBawL_Sb6zI7e4ocA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_14,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2411280121
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Nov 2024 15:25:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9017

From: Zhang Peng <peng.zhang1.cn@windriver.com>

The ptest build for cri-o was previously disabled due to issues
introduced with Go 1.11, which borken the build process. With the
current Go version, these issues no longer occur, and the ptest build is
now functional.
This commit enables ptest support and resolves the "TMPDIR
[buildpaths]" issue encountered during the ptest build process.

A total of 382 test cases were executed, with the following results:
PASS: 317
FAIL: 33
SKIP: 32

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 recipes-containers/cri-o/README.md            | 452 ++++++++++++++++++
 recipes-containers/cri-o/cri-o_git.bb         |  33 +-
 .../0001-Add-trimpath-to-build-nri.test.patch |  31 ++
 recipes-containers/cri-o/files/run-ptest      |  11 +
 4 files changed, 525 insertions(+), 2 deletions(-)
 create mode 100644 recipes-containers/cri-o/README.md
 create mode 100644 recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
 create mode 100644 recipes-containers/cri-o/files/run-ptest

diff --git a/recipes-containers/cri-o/README.md b/recipes-containers/cri-o/README.md
new file mode 100644
index 00000000..e3dac040
--- /dev/null
+++ b/recipes-containers/cri-o/README.md
@@ -0,0 +1,452 @@
+# CRI-O Ptest Guide
+
+The CRI-O ptest suite is a comprehensive and complex testing framework. This document provides key information and tips for its usage.
+
+
+## 1. Vendor Directory
+
+By default, the `vendor` directory is not installed for ptest. However, the `ctr_seccomp.bats` test relies on a JSON file located at:  
+`vendor/github.com/containers/common/pkg/seccomp/seccomp.json`.
+As a result, the ctr_seccomp.bats test will fail unless this file is manually added. 
+
+### Steps to add seccomp.json:
+- Manually create/copy the required JSON file.
+- Set the `CONTAINER_SECCOMP_PROFILE` environment variable to point to the file's location.
+
+## 2. Runtime Dependencies (RDEPENDS)
+
+The ptest suite requires several dependencies. As of the initial implementation, the runtime dependencies are defined as follows:
+
+```bash
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    bats \
+    cni \
+    crictl \
+    coreutils \
+    dbus-daemon-proxy \
+    iproute2 \
+    util-linux-unshare \
+    jq \
+    slirp4netns \
+    parallel \
+    podman \
+"
+```
+### Explanation of Dependencies:
+- **bash / bats**: The ptest suite is written using BATS and requires support from Bash.
+- **cni / crictl / podman**: Tools for testing container creation, runtime, and networking, directly invoked by the tests.
+- **jq**: Used in test scripts to create or manipulate JSON files.
+- **iproute2  / slirp4netns**: Networking utilities required for validating network-related functionalities.
+- **coreutils / dbus-daemon-proxy / util-linux-unshare**: Additional utilities supporting various test cases.
+- **paralle**: bats using "parallel" to execute test in serial.
+
+## 3. Testing Log (Baseline Reference)
+
+A summary of the test results is provided below for baseline reference:
+
+- **PASS**: 317 tests  
+- **FAIL**: 33 tests  
+- **SKIP**: 32 tests  
+
+#### Full Log Example:
+Below is an excerpt from a typical ptest log:
+```bash
+root@intel-x86-64:~# ptest-runner cri-o -t 1000
+START: ptest-runner
+2024-11-23T14:50
+BEGIN: /usr/lib64/cri-o/ptest
+SKIP: 1 apparmor tests (in sequence) # skip apparmor not enabled
+PASS: 2 no CDI errors, create ctr without CDI devices
+PASS: 3 no CDI errors, create ctr with CDI devices
+PASS: 4 no CDI errors, create ctr with annotated CDI devices
+PASS: 5 no CDI errors, create ctr with duplicate annotated CDI devices
+PASS: 6 no CDI errors, fail to create ctr with unresolvable CDI devices
+PASS: 7 no CDI errors, fail to create ctr with unresolvable annotated CDI devices
+PASS: 8 CDI registry refresh
+PASS: 9 CDI registry refresh, annotated CDI devices
+PASS: 10 reload CRI-O CDI parameters
+PASS: 11 reload CRI-O CDI parameters, with annotated CDI devices
+PASS: 12 CDI with errors, create ctr without CDI devices
+PASS: 13 CDI with errors, create ctr with (unaffected) CDI devices
+PASS: 14 CDI with errors, create ctr with (unaffected) annotated CDI devices
+PASS: 15 pids limit
+PASS: 16 conmon pod cgroup
+PASS: 17 conmon custom cgroup
+PASS: 18 conmon custom cgroup with no infra container
+SKIP: 19 conmonrs custom cgroup with no infra container # skip not supported for conmon
+SKIP: 20 ctr with swap should be configured # skip swap not enabled
+SKIP: 21 ctr with swap should fail when swap is lower # skip swap not enabled
+PASS: 22 ctr swap only configured if enabled
+SKIP: 23 ctr with swap should succeed when swap is unlimited # skip swap not enabled
+PASS: 24 cgroupv2 unified support
+SKIP: 25 cpu-quota.crio.io can disable quota # skip node must be configured with cgroupv1 for this test
+SKIP: 26 checkpoint and restore one container into a new pod (drop infra:true) # skip CRIU check failed
+SKIP: 27 checkpoint and restore one container into a new pod (drop infra:false) # skip CRIU check failed
+SKIP: 28 checkpoint and restore one container into a new pod using --export to OCI image # skip CRIU check failed
+SKIP: 29 checkpoint and restore one container into a new pod using --export to OCI image using repoDigest # skip CRIU check failed
+SKIP: 30 checkpoint and restore one container into a new pod with a new name # skip CRIU check failed
+PASS: 31 crio commands
+PASS: 32 invalid ulimits
+PASS: 33 invalid devices
+PASS: 34 invalid metrics port
+PASS: 35 invalid log max
+PASS: 36 log max boundary testing
+PASS: 37 default config should be empty
+PASS: 38 config dir should succeed
+PASS: 39 config dir should fail with invalid option
+PASS: 40 config dir should fail with invalid evented_pleg option
+PASS: 41 choose different default runtime should succeed
+PASS: 42 runc not existing when default_runtime changed should succeed
+PASS: 43 retain default runtime should succeed
+PASS: 44 monitor fields should be translated
+PASS: 45 handle nil workloads
+PASS: 46 config dir should fail with invalid disable_hostport_mapping option
+SKIP: 47 conmonrs is used # skip not using conmonrs
+SKIP: 48 test cpu load balancing # skip not yet supported on cgroup2
+SKIP: 49 test cpu load balance disabled on manual stop # skip not yet supported on cgroup2
+SKIP: 50 test cpu load balance disabled on container exit # skip not yet supported on cgroup2
+PASS: 51 container memory metrics
+SKIP: 52 container memory cgroupv1-specific metrics # skip
+PASS: 53 storage directory check should find no issues
+PASS: 54 storage directory check should find errors
+PASS: 55 storage directory check should repair errors
+PASS: 56 storage directory check should wipe everything on repair errors
+PASS: 57 remove containers and images when remove both
+PASS: 58 remove containers when remove temporary
+PASS: 59 clear neither when remove persist
+PASS: 60 don't clear podman containers
+PASS: 61 clear everything when shutdown file not found
+PASS: 62 clear podman containers when shutdown file not found
+PASS: 63 fail to clear podman containers when shutdown file not found but container still running
+PASS: 64 don't clear containers on a forced restart of crio
+PASS: 65 don't clear containers if clean shutdown supported file not present
+PASS: 66 internal_wipe remove containers and images when remove both
+PASS: 67 internal_wipe remove containers when remove temporary and node reboots
+PASS: 68 internal_wipe remove containers when remove temporary
+PASS: 69 internal_wipe clear both when remove persist
+PASS: 70 internal_wipe don't clear podman containers
+PASS: 71 internal_wipe don't clear containers on a forced restart of crio
+PASS: 72 internal_wipe eventually cleans network on forced restart of crio if network is slow to come up
+PASS: 73 clean up image if corrupted on server restore
+PASS: 74 recover from badly corrupted storage directory
+SKIP: 75 run the critest suite # skip critest because RUN_CRITEST is not set
+PASS: 76 ctr not found correct error message
+PASS: 77 ctr termination reason Completed
+PASS: 78 ctr termination reason Error
+PASS: 79 ulimits
+PASS: 80 ctr remove
+PASS: 81 ctr lifecycle
+PASS: 82 ctr pod lifecycle with evented pleg enabled
+FAIL: 83 ctr logging
+PASS: 84 ctr log cleaned up if container create failed
+PASS: 85 ctr journald logging
+PASS: 86 ctr logging [tty=true]
+FAIL: 87 ctr log max
+FAIL: 88 ctr log max with default value
+FAIL: 89 ctr log max with minimum value
+FAIL: 90 ctr partial line logging
+PASS: 91 ctrs status for a pod
+PASS: 92 ctr list filtering
+PASS: 93 ctr list label filtering
+PASS: 94 ctr metadata in list & status
+PASS: 95 ctr execsync conflicting with conmon flags parsing
+PASS: 96 ctr execsync
+PASS: 97 ctr execsync should not overwrite initial spec args
+PASS: 98 ctr execsync should succeed if container has a terminal
+PASS: 99 ctr execsync should cap output
+PASS: 100 ctr exec{,sync} should be cancelled when container is stopped
+PASS: 101 ctr device add
+PASS: 102 privileged ctr device add
+PASS: 103 privileged ctr add duplicate device as host
+PASS: 104 ctr hostname env
+PASS: 105 ctr execsync failure
+PASS: 106 ctr execsync exit code
+PASS: 107 ctr execsync std{out,err}
+PASS: 108 ctr stop idempotent
+PASS: 109 ctr caps drop
+PASS: 110 ctr with default list of capabilities from crio.conf
+PASS: 111 ctr with list of capabilities given by user in crio.conf
+PASS: 112 ctr with add_inheritable_capabilities has inheritable capabilities
+PASS: 113 ctr /etc/resolv.conf rw/ro mode
+PASS: 114 ctr create with non-existent command
+PASS: 115 ctr create with non-existent command [tty]
+PASS: 116 ctr update resources
+PASS: 117 ctr correctly setup working directory
+PASS: 118 ctr execsync conflicting with conmon env
+PASS: 119 ctr resources
+PASS: 120 ctr with non-root user has no effective capabilities
+PASS: 121 ctr has gid in supplemental groups
+PASS: 122 ctr has gid in supplemental groups with Merge policy
+PASS: 123 ctr has only specified gid in supplemental groups with Strict policy
+PASS: 124 ctr with low memory configured should not be created
+PASS: 125 privileged ctr -- check for rw mounts
+PASS: 126 annotations passed through
+PASS: 127 ctr with default_env set in configuration
+PASS: 128 ctr with absent mount that should be rejected
+PASS: 129 ctr that mounts container storage as shared should keep shared
+PASS: 130 ctr that mounts container storage as private should not be private
+PASS: 131 ctr that mounts container storage as read-only option but not recursively
+SKIP: 132 ctr that mounts container storage as recursively read-only # skip requires crictl version "1.30" or newer
+SKIP: 133 ctr that fails to mount container storage as recursively read-only without readonly option # skip requires crictl version "1.30" or newer
+SKIP: 134 ctr that fails to mount container storage as recursively read-only without private propagation # skip requires crictl version "1.30" or newer
+PASS: 135 ctr has containerenv
+PASS: 136 ctr stop timeouts should decrease
+PASS: 137 ctr with node level pid namespace should not leak children
+PASS: 138 ctr HOME env newline invalid
+PASS: 139 ctr log linking
+PASS: 140 ctr stop loop kill retry attempts
+PASS: 141 ctr multiple stop calls
+PASS: 142 pause/unpause ctr with right ctr id
+PASS: 143 pause ctr with invalid ctr id
+PASS: 144 pause ctr with already paused ctr
+PASS: 145 unpause ctr with right ctr id with running ctr
+PASS: 146 unpause ctr with invalid ctr id
+PASS: 147 remove paused ctr
+FAIL: 148 ctr seccomp profiles unconfined
+FAIL: 149 ctr seccomp profiles runtime/default
+FAIL: 150 ctr seccomp profiles wrong profile name
+FAIL: 151 ctr seccomp profiles localhost profile name
+FAIL: 152 ctr seccomp overrides unconfined profile with runtime/default when overridden
+FAIL: 153 ctr seccomp profiles runtime/default block unshare
+SKIP: 154 ctr_userns run container # skip userns testing not enabled
+PASS: 155 bind secrets mounts to container
+PASS: 156 default mounts correctly sorted with other mounts
+PASS: 157 additional devices support
+PASS: 158 additional devices permissions
+PASS: 159 annotation devices support
+PASS: 160 annotation should not be processed if not allowed
+PASS: 161 annotation should override configured additional_devices
+PASS: 162 annotation should not be processed if not allowed in allowed_devices
+PASS: 163 annotation should configure multiple devices
+PASS: 164 annotation should fail if one device is invalid
+PASS: 165 test infra ctr dropped
+PASS: 166 test infra ctr not dropped
+PASS: 167 test infra ctr dropped status
+PASS: 168 pod test hooks
+PASS: 169 run container in pod with image ID
+PASS: 170 container status when created by image ID
+PASS: 171 container status when created by image tagged reference
+PASS: 172 container status when created by image canonical reference
+PASS: 173 container status when created by image list canonical reference
+PASS: 174 image pull and list
+PASS: 175 image pull and list using imagestore
+SKIP: 176 image pull with signature # skip registry has some issues
+PASS: 177 image pull and list by tag and ID
+PASS: 178 image pull and list by digest and ID
+PASS: 179 image pull and list by manifest list digest
+PASS: 180 image pull and list by manifest list tag
+PASS: 181 image pull and list by manifest list and individual digest
+PASS: 182 image pull and list by individual and manifest list digest
+PASS: 183 image list with filter
+PASS: 184 image list/remove
+PASS: 185 image status/remove
+SKIP: 186 run container in pod with crun-wasm enabled # skip crun-wasm not installed or runtime type is VM
+PASS: 187 check if image is pinned appropriately
+PASS: 188 run container in pod with timezone configured
+PASS: 189 run container in pod with local timezone
+PASS: 190 run container with memory_limit_in_bytes -1
+PASS: 191 run container with memory_limit_in_bytes 12.5MiB
+PASS: 192 run container with container_min_memory 17.5MiB
+PASS: 193 run container with container_min_memory 5.5MiB
+PASS: 194 run container with empty container_min_memory
+PASS: 195 image remove with multiple names, by name
+PASS: 196 image remove with multiple names, by ID
+PASS: 197 image volume ignore
+PASS: 198 image volume bind
+PASS: 199 image volume user mkdir
+PASS: 200 image fs info with default settings should return matching container_filesystem and image_filesystem
+PASS: 201 image fs info with imagestore set should return different filesystems
+PASS: 202 test infra ctr cpuset
+PASS: 203 info inspect
+PASS: 204 ctr inspect
+PASS: 205 pod inspect when dropping infra
+PASS: 206 ctr inspect not found
+PASS: 207 inspect image should succeed contain all necessary information
+SKIP: 208 irqbalance tests (in sequence) # skip irqbalance not found.
+SKIP: 209 container run with kata should have containerd-shim-kata-v2 process running # skip Not
+PASS: 210 metrics with default host and port
+FAIL: 211 metrics with custom host using localhost and random port
+FAIL: 212 secure metrics with random port
+FAIL: 213 secure metrics with random port and missing cert/key
+PASS: 214 pid namespace mode pod test
+PASS: 215 pid namespace mode target test
+PASS: 216 KUBENSMNT mount namespace
+PASS: 217 ensure correct hostname
+PASS: 218 ensure correct hostname for hostnetwork:true
+PASS: 219 Check for valid pod netns CIDR
+PASS: 220 Ensure correct CNI plugin namespace/name/container-id arguments
+SKIP: 221 Connect to pod hostport from the host # skip node configured with cgroupv2 flakes this test sometimes
+PASS: 222 Clean up network if pod sandbox fails
+PASS: 223 Clean up network if pod sandbox fails after plugin success
+PASS: 224 Clean up network if pod sandbox gets killed
+PASS: 225 Ping pod from the host / another pod
+PASS: 226 run NRI PluginRegistration test
+PASS: 227 run NRI PluginSynchronization test
+PASS: 228 run NRI PodEvents test
+PASS: 229 run NRI ContainerEvents test
+PASS: 230 run NRI MountInjection test
+PASS: 231 run NRI EnvironmentInjection test
+PASS: 232 run NRI AnnotationInjection test
+PASS: 233 run NRI DeviceInjection test
+PASS: 234 run NRI CpusetAdjustment test
+PASS: 235 run NRI MemsetAdjustment test
+PASS: 236 run NRI CpusetAdjustmentUpdate test
+PASS: 237 run NRI MemsetAdjustmentUpdate test
+SKIP: 238 OCI image volume mount lifecycle # skip requires crictl version "1.31" or newer
+PASS: 239 pod release name on remove
+PASS: 240 pod remove
+PASS: 241 pod stop ignores not found sandboxes
+PASS: 242 pod list filtering
+PASS: 243 pod metadata in list & status
+PASS: 244 pass pod sysctls to runtime
+PASS: 245 pass pod sysctls to runtime when in userns
+SKIP: 246 disable crypto.fips_enabled when FIPS_DISABLE is set # skip The directory /proc/sys/crypto does not exist on this host.
+PASS: 247 fail to pass pod sysctls to runtime if invalid spaces
+PASS: 248 fail to pass pod sysctl to runtime if invalid value
+PASS: 249 skip pod sysctls to runtime if host
+PASS: 250 pod stop idempotent
+PASS: 251 pod remove idempotent
+PASS: 252 pod stop idempotent with ctrs already stopped
+PASS: 253 restart crio and still get pod status
+PASS: 254 invalid systemd cgroup_parent fail
+PASS: 255 systemd cgroup_parent correctly set
+PASS: 256 kubernetes pod terminationGracePeriod passthru
+PASS: 257 pod pause image matches configured image in crio.conf
+PASS: 258 pod stop cleans up all namespaces
+PASS: 259 pod with the correct etc folder ownership
+PASS: 260 verify RunAsGroup in container
+PASS: 261 single cni plugin with pod annotations capability enabled
+PASS: 262 single cni plugin with pod annotations capability disabled
+PASS: 263 pod annotations capability for chained cni plugins
+PASS: 264 accept unsigned image with default policy
+PASS: 265 deny unsigned image with restrictive policy
+PASS: 266 accept signed image with default policy
+FAIL: 267 accept signed image with restrictive policy
+PASS: 268 accept unsigned image with not existing namespace policy
+PASS: 269 accept unsigned image with higher priority namespace policy
+PASS: 270 deny unsigned image with higher priority namespace policy
+FAIL: 271 accept signed image with higher priority namespace policy
+PASS: 272 pprof
+PASS: 273 pprof over unix socket
+PASS: 274 reload config should succeed
+PASS: 275 reload config should succeed with 'log_level'
+PASS: 276 reload config should fail with 'log_level' if invalid
+PASS: 277 reload config should fail with if config is malformed
+PASS: 278 reload config should succeed with 'pause_image'
+PASS: 279 reload config should succeed with 'pause_command'
+PASS: 280 reload config should succeed with 'pause_image_auth_file'
+PASS: 281 reload config should fail with non existing 'pause_image_auth_file'
+PASS: 282 reload config should succeed with 'log_filter'
+PASS: 283 reload config should fail with invalid 'log_filter'
+PASS: 284 reload config should succeed with 'decryption_keys_path'
+PASS: 285 reload config should succeed with 'seccomp_profile'
+FAIL: 286 reload config should not fail with invalid 'seccomp_profile'
+SKIP: 287 reload config should succeed with 'apparmor_profile' # skip apparmor not enabled
+SKIP: 288 reload config should fail with invalid 'apparmor_profile' # skip apparmor not enabled
+PASS: 289 reload config should add new runtime
+PASS: 290 reload config should update 'pinned_images'
+PASS: 291 reload config should update 'pinned_images' and only 'pause_image' is pinned
+PASS: 292 reload config should update 'pause_image' and it becomes 'pinned_images'
+PASS: 293 reload config should remove pinned images when an empty list is provided
+PASS: 294 reload system registries should succeed
+PASS: 295 reload system registries should succeed with new registry
+PASS: 296 reload system registries should fail on invalid syntax in file
+PASS: 297 system registries should succeed with new registry without reload
+PASS: 298 system registries should fail on invalid syntax in file without reload
+PASS: 299 system handles burst of configuration changes without excessive reloads
+PASS: 300 system handles duplicate events for the same file
+PASS: 301 crio restore
+PASS: 302 crio restore with pod stopped
+PASS: 303 crio restore with bad state and pod stopped
+PASS: 304 crio restore with bad state and ctr stopped
+PASS: 305 crio restore with bad state and ctr removed
+PASS: 306 crio restore with bad state and pod removed
+PASS: 307 crio restore with bad state
+PASS: 308 crio restore with missing config.json
+PASS: 309 crio restore first not managing then managing
+PASS: 310 crio restore first managing then not managing
+PASS: 311 crio restore changing managing dir
+PASS: 312 crio restore upon entering KUBENSMNT
+PASS: 313 crio restore upon exiting KUBENSMNT
+PASS: 314 crio restore volumes for containers
+PASS: 315 crictl runtimeversion
+PASS: 316 if fs.may_detach_mounts is set
+FAIL: 317 seccomp notifier with runtime/default
+FAIL: 318 seccomp notifier with runtime/default but not stop
+FAIL: 319 seccomp notifier with custom profile
+FAIL: 320 seccomp notifier should not work if annotation is not allowed
+FAIL: 321 seccomp OCI artifact with image annotation without suffix
+FAIL: 322 seccomp OCI artifact with image annotation for pod
+FAIL: 323 seccomp OCI artifact with image annotation for container
+PASS: 324 seccomp OCI artifact with image annotation but not allowed annotation on runtime config
+FAIL: 325 seccomp OCI artifact with image annotation and profile set to unconfined
+PASS: 326 seccomp OCI artifact with image annotation but set runtime default profile with higher priority
+FAIL: 327 seccomp OCI artifact with image annotation but set localhost profile with higher priority
+FAIL: 328 seccomp OCI artifact with pod annotation
+FAIL: 329 seccomp OCI artifact with container annotation
+PASS: 330 seccomp OCI artifact with bogus annotation
+PASS: 331 seccomp OCI artifact with missing artifact
+PASS: 332 selinux label level=s0 is sufficient
+SKIP: 333 selinux skips relabeling if TrySkipVolumeSELinuxLabel annotation is present # skip not enforcing
+SKIP: 334 selinux skips relabeling for super privileged container # skip not enforcing
+PASS: 335 ctr check shared /dev/shm
+PASS: 336 check /dev/shm is changed
+PASS: 337 check /dev/shm fails with incorrect values
+PASS: 338 stats
+PASS: 339 container stats
+PASS: 340 pod stats
+PASS: 341 status not should fail if no subcommand is provided
+PASS: 342 status should succeed to retrieve the config
+PASS: 343 status should fail to retrieve the config with invalid socket
+PASS: 344 status should succeed to retrieve the info
+PASS: 345 status should fail to retrieve the info with invalid socket
+PASS: 346 succeed to retrieve the container info
+PASS: 347 should fail to retrieve the container info without ID
+PASS: 348 should fail to retrieve the container with invalid socket
+PASS: 349 should not clean up pod after timeout
+FAIL: 350 emit metric when sandbox is re-requested
+PASS: 351 should not clean up container after timeout
+PASS: 352 should clean up pod after timeout if request changes
+PASS: 353 should clean up container after timeout if request changes
+PASS: 354 should clean up pod after timeout if not re-requested
+PASS: 355 should not wait for actual duplicate pod request
+PASS: 356 should clean up container after timeout if not re-requested
+FAIL: 357 emit metric when container is re-requested
+PASS: 358 should not be able to operate on a timed out pod
+PASS: 359 should not be able to operate on a timed out container
+PASS: 360 should not wait for actual duplicate container request
+PASS: 361 check umask is changed
+FAIL: 362 userns annotation auto should succeed
+PASS: 363 userns annotation auto with keep-id and map-to-root should fail
+FAIL: 364 userns annotation auto should map host run_as_user
+FAIL: 365 version
+PASS: 366 version -j
+PASS: 367 test workload gets configured to defaults
+PASS: 368 test workload can override defaults
+PASS: 369 test workload should not be set if not defaulted or specified
+PASS: 370 test workload should not be set if annotation not specified
+PASS: 371 test workload pod gets configured to defaults
+PASS: 372 test workload can override pod defaults
+PASS: 373 test workload pod should not be set if not defaulted or specified
+PASS: 374 test workload pod should not be set if annotation not specified
+PASS: 375 test workload pod should override infra_ctr_cpuset option
+PASS: 376 test workload allowed annotation should not work if not configured
+PASS: 377 test workload allowed annotation appended with runtime
+PASS: 378 test workload allowed annotation works for pod
+PASS: 379 test resource cleanup on bad annotation contents
+PASS: 380 test workload pod should not be set if annotation not specified even if prefix
+PASS: 381 test special runtime annotations not allowed
+PASS: 382 test special runtime annotations allowed
+
+real    9m12.847s
+user    42m18.946s
+sys     8m15.064s
+DURATION: 553
+END: /usr/lib64/cri-o/ptest
+2024-11-23T14:59
+STOP: ptest-runner
+TOTAL: 1 FAIL: 0
+root@intel-x86-64:~#
+```
+
diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index efc86fbe..f04c4feb 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -17,7 +17,9 @@ At a high level, we expect the scope of cri-o to be restricted to the following
 SRCREV_cri-o = "20c06a19cb395445620c31730c0f1a0a1922eaae"
 SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.31;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+        file://0001-Add-trimpath-to-build-nri.test.patch \
         file://crio.conf \
+        file://run-ptest \
 	"
 
 # Apache-2.0 for docker
@@ -28,7 +30,7 @@ GO_IMPORT = "import"
 
 PV = "1.31.0+git${SRCREV_cri-o}"
 
-inherit features_check
+inherit features_check ptest
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
 
 DEPENDS = " \
@@ -69,6 +71,13 @@ do_compile() {
 	oe_runmake binaries
 }
 
+do_compile_ptest() {
+    set +e
+
+    cd ${S}/src/import
+
+    oe_runmake test-binaries
+}
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
 SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','crio.service','',d)}"
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
@@ -100,6 +109,12 @@ do_install() {
     install -d ${D}${localstatedir}/lib/crio
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    install -d ${D}${PTEST_PATH}/bin
+    cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
+    cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
+}
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
 FILES:${PN} += "${systemd_unitdir}/system/*"
 FILES:${PN} += "/usr/local/bin/*"
@@ -109,7 +124,21 @@ FILES:${PN} += "/usr/share/containers/oci/hooks.d"
 ALLOW_EMPTY:${PN} = "1"
 
 INSANE_SKIP:${PN} += "ldflags already-stripped textrel"
+INSANE_SKIP:${PN}-ptest += "textrel"
 
-deltask compile_ptest_base
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    bats \
+    cni \
+    crictl \
+    coreutils \
+    dbus-daemon-proxy \
+    iproute2 \
+    util-linux-unshare \
+    jq \
+    slirp4netns \
+    parallel \
+    podman \
+"
 
 COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
new file mode 100644
index 00000000..c6be41f0
--- /dev/null
+++ b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
@@ -0,0 +1,31 @@
+From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 2001
+From: Peng Zhang <peng.zhang1.cn@windriver.com>
+Date: Fri, 25 Oct 2024 10:42:02 +0800
+Subject: [PATCH] Add --trimpath to build nri.test
+
+when build test-binary, TMPDIR[buildpaths] error found in nri.test
+to fix this error, add "--trimpath" option to build nri.test.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
+===================================================================
+--- cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/import/Makefile
++++ cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
+@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
+ 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./test/checkcriu
+ 
+ test/nri/nri.test: $(wildcard test/nri/*.go)
+-	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
++	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@ ${TRIMPATH}
+ 
+ bin/crio: $(GO_FILES)
+ 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./cmd/crio
+-- 
+2.34.1
+
diff --git a/recipes-containers/cri-o/files/run-ptest b/recipes-containers/cri-o/files/run-ptest
new file mode 100644
index 00000000..62abe959
--- /dev/null
+++ b/recipes-containers/cri-o/files/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+./test/test_runner.sh | while IFS= read -r line; do
+	if [[ $line =~ ^not\ ok ]]; then
+		echo "FAIL: ${line#not ok }"
+	elif [[ $line =~ ^ok && ! $line =~ \#\ skip ]]; then
+		echo "PASS: ${line#ok }"
+	elif [[ $line =~ ^ok.*#\ skip ]]; then
+		echo "SKIP: ${line#ok }"
+	fi
+done
-- 
2.34.1


