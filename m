Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E178C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 05:47:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14928.1736920037112207640
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3110ba285b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5F3kV018072
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 445yumrar5-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hh9w2glA1khs9mwfo7zEiQXmFvSbskmuoRVfixpRCSjKHq8K2XNdlUE1ASle9Ln6qD4ALr+VYZJIVqQiD+KH2Z9U3Dc/zOaukSWAXtCUk/9AkpipAlmlgOxOemghp+shSDPvbh48oN9ppMlAGlaVuT5Wzv3lptpfmUVbODOBTIVzITZ35J3NFDz8ImpPV5k61ZFg9B607pbL6MXfY6z0/L2ZcLHtduhf0zI1jqwqjQq4zS7VZRcVbYf0cocQVfZJTIDWLyplEvHYx0kn7lRaaQVFQ3gtxzHjcEJqt/lXoLxg+aj/5GtfGpATJBA04kcGXoMNVOWe4KOrm+u+J0qcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCraUc8HWGM+hmBFxbuzbyaL8FroMvYIl4lh0f531SY=;
 b=AZtKLnSJOyeVWeUwUZhIRsghgWtSgzS0gB0kVt22hJ26NFQb1WqPGwk0w2kzvksDjmmtDOcFEwfGZ3CVcZvmzqzbV8S8BJ872VDya6VdIw+GLTOAQvrveUq+JBFpe2KyXF1ez1nG7gLJNnYBQMUTcW8AZLyL6r+BORMINgTJ18OvaBhHKftQSaQNqJ/eUnR5Xga4A+Gs3W3lMbKt0g1Qyt2vWJCaGwcg5FE7Zg7yMCYqoYybGcpwbkjVJLA44t/sYpN+bInQeiwbjG/KZSx8LsgaTvp0POmjjWzOBQgYKPnlS+UB5rRSvWXdyWaqpWSDL37lzkdMp8jXlUfh1CvzXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 05:47:11 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 05:47:11 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/4] cri-o: update to 1.31.4
Date: Tue, 14 Jan 2025 21:46:37 -0800
Message-Id: <20250115054639.1079705-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115054639.1079705-1-Qi.Chen@windriver.com>
References: <20250115054639.1079705-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 74baeef7-f7f4-447d-2554-08dd35280e04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RMcqU9nnpIQMO4z5d8mXwHqotQYB2prCcfcpTDg4lNAprMuHIHlMVrajDFyv?=
 =?us-ascii?Q?2Bf1DyzfUw4KMV57nZD0xNFZqbUNpYfaIBTQ8IE5zuy4ggWNTMoShf1gCIWQ?=
 =?us-ascii?Q?m7uD0m7Vsevz7IUM5EmdeHHuXFaPt146Okmw/kDvYzV0EJWyhESB711eVv1S?=
 =?us-ascii?Q?2N9DFVjKf3sZydwG7fh+HE/B2koZdq8WEVWTfU8UeCkczrqYUWFHh+4dVRoI?=
 =?us-ascii?Q?tyd3nwKF0d3uafSD5V+Pmh9obQCvPjpynjMY2ujqSQrKgUlmTOXsZvpUTJwx?=
 =?us-ascii?Q?MfH3IdP1cZhw1f8zXWRCsUooGwSlR9L075O4yaWNs/R4CsqRR4kpTKTJB026?=
 =?us-ascii?Q?XB+wKAa8EiMoTgHifGx8nsfZ05I1QsWxIUqIbsUZNDdgglzySUvAqM3VTCfz?=
 =?us-ascii?Q?Q/W+il9QtJl8cWs/LGdlZN9yzPLIVMdyRswXIfLjpkFefwwHf0YTqvNRSUwh?=
 =?us-ascii?Q?Pjr9w0Bdru5XsAYz7vYPpOY0GTnurzK9K7ULPsEUpPXpEiXDlY9t2UQiXMCM?=
 =?us-ascii?Q?16uT3Rhedr2szpx7HJpQ5OeM6BSjTqMOmCkbVTK0A396DSGdR7DuXNXobYey?=
 =?us-ascii?Q?3y+wD4t0PPGE+FU7giqgHoA4hyO4jMiJrV2A7hEsKrKFRQXO8YuJk3o2MA/K?=
 =?us-ascii?Q?Jj10b+NogT7NoOZofEratm4abnQKSrXcZPaPuk68l4yhI2EmzYLwvQ8DLt7a?=
 =?us-ascii?Q?JZz8k/XeGQrEy6wKrNDdxKlwLNN7lwDVO+AjexYNtN2RbYkZQzN8qyxRYBr0?=
 =?us-ascii?Q?Cnr6iqN2vLJghW5WmghzcKRo/woKWVeguJ14DGYtNhSrl5E0HWgq3Kld+a8B?=
 =?us-ascii?Q?jfbTrfuJjsr/u+DPNrSMOMlRQvTgAQ9pO+p3XznZeqYRHsdn+qwbCAp8vLub?=
 =?us-ascii?Q?taCJ+zjl4awOrFCc9zJKXhQ1J3YdqHrWSX/3XrBUaZ8nuld5IaXLzsPfx9cb?=
 =?us-ascii?Q?tbIFzA8Uusi8FJ/SoCGk2NvgT9A+qq9Mnlx+UJ5v2ED5tAjIDEhjGMpG28QH?=
 =?us-ascii?Q?bnRjoXzeyF2Byr9tZVaB05LhFMGBGt/m70r3rdu7EfyjDUMj0HVo+wlY2Kuo?=
 =?us-ascii?Q?mWiwRJcL9JtArgkWq3a64YJTLCLqsI+HRBSTDPt2/4/p0/daFqXilQVeo2wu?=
 =?us-ascii?Q?nwCn6dB1GYX3Sj/A4SdR2yVlLu9av6GRbWa0aomkq0Dz4+vfI3QngyfseWqW?=
 =?us-ascii?Q?YxSpFw1Fh09AzuODSBXS/nsgcofzDn5IH/PyNsR6hgGgHkF6P/2Lk08y3DwR?=
 =?us-ascii?Q?W2yifniTiIzxPb9UUGNz8/FYzjR+ujAZkg+nCmATBwKe3TgIqQGqW7feFWr7?=
 =?us-ascii?Q?bUu451lYEsiVr8m4ikjXQvBLZUslnxHs8bb6fyg5VxHsAtOXcb70EGzxL/9M?=
 =?us-ascii?Q?sosrmjl82VHzr6qrP6CQT9Rq9c0z?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sWNZk41Hg90i9kL2tvAkadPEhU5OhULwAsmNlGpnN7+tsQtEs9NJCqPj5dpH?=
 =?us-ascii?Q?6VzqGW/RSVjzwtScN98bwsOkKJCf7/7PzclKGc0+cH41WCyrZHR390QeGS44?=
 =?us-ascii?Q?cQ4BDKZ2YkMj+X8IMkfj/svufZ2UeNGbzAnDRZjYPMSJjRADns4WmK15gQB8?=
 =?us-ascii?Q?jINQx2qwoi8WKhPOWO0/Q3jcBkbsMvgX82+oLKDTcgyUhtctTZgAt7hNZjFc?=
 =?us-ascii?Q?DXTaCjTtKu8/wwuo+ZS3VcS3arhi8p2dqIKLVjq8vOuRzqMxVQecsT6kIcwx?=
 =?us-ascii?Q?FaDRbvw4V412AwuCprKKs+KVzFECjBsD6DqiqtfdDr9daNTCIo1qOzyfBKFw?=
 =?us-ascii?Q?BxHpkZ1xZGHfYPqroHVnK+b/42bnaQIw48sx7F5Tb3uPq602biN7Y7niR86s?=
 =?us-ascii?Q?oLwIQLF/r0XIwhykNiMKFWEmHNgSOMnc3HhvBvUFlQ0w1kaPN1HSDXF+n9sm?=
 =?us-ascii?Q?N4chuXd6RonTZq3KRhJKXfrHen5at63tmDfY5kcpWO6G/yWdBHHxqJRt2xXa?=
 =?us-ascii?Q?Q4zL6Dk4Tef6Dl9rDRiyVex3Y5vAAQNo9JnJrv2qPy3lh81BXqaCHz5slvNr?=
 =?us-ascii?Q?UPhZ1LKjDtSjUXg0BHeQi+pgYxAopIFiNhPOZOckCCyczzYpIlaSNHcfNTRS?=
 =?us-ascii?Q?gOys65xUm41AlJX5DQjqB/kaf8ciOVGxdj89rO4e9XqUZr1dq6cPKpaHj77c?=
 =?us-ascii?Q?fPvw7SLOr7wF73Buq0Vt1zeMPhha4/MbfLARcKssMMb4vLLrX3xIU6SiifiL?=
 =?us-ascii?Q?oQ29iq6x2fHR3/d8qTAv6012JVVTvcpAWWW2rIBY657j8q5WeMwdrTFvjN7Q?=
 =?us-ascii?Q?hBEPcjk10J1IDyZ5sOHv+l2kQ5WoEgMx2LsdHk70qla2Pn3/Z7pUKF4KaWdv?=
 =?us-ascii?Q?zw3JTzn7ZCtVIEYfQi5qgzfjsj9yowFZcKYHT/LJXGK2jrpg3jsRuxaKfAMI?=
 =?us-ascii?Q?Zo2SoK6emBdXevKKYYAN+clEiDqDyXoRcvhsgCRRpwEkG6FwoLQEp0NG9c3G?=
 =?us-ascii?Q?14TpWaOz+1kVfDxNT1HmONNZksL/Dzwg18b6yUlykvCqiwHG9VefkgP519GH?=
 =?us-ascii?Q?7NCNK3w6FfR6+CrcrLOhgztgN+QhVLtiMTShns4Z89cNhPbswIVTZF8sSKkq?=
 =?us-ascii?Q?96KfR0/KbWokPhUB267BFS9Uv+S+HuzjdITbe4gNkDQIpo0gaBWa2Pj5Fp3v?=
 =?us-ascii?Q?X6HirY38T1HwzWGhDIZaLYtaa7AZyVsKXVerGM2qFZfeQ1yN6N07Qg0tm1Xy?=
 =?us-ascii?Q?B8rzwuWdWqvw/YPP413Cb1ZvjOo9I6gjuMpHEzKtGVEKyR0Mt0Qv0nd2uaU2?=
 =?us-ascii?Q?SWLwusUYDkV45BKenhL4oUiXWZaBRJe95xZB5mYERqhQkdm81z9ofN+wmhoj?=
 =?us-ascii?Q?5u2VLxB3oOEJQ2+sI7VOlB2E3ydTEcK1ipZJounGrdWTIHs4uZBMCcctt/2G?=
 =?us-ascii?Q?7t62aoDYqP70StS3QexevoCb3DvA9RWYJFcG3rD5c/6NrYBICVM6hKP9oz6H?=
 =?us-ascii?Q?TUpW/4FLC/dQa0T1gARHmbGb1lMcS7oLGlTLUWn4aRQYxqNrI1oRJR83sYgy?=
 =?us-ascii?Q?fB2lDQNSCKfJ2yurHWkYMmM8F1b9OouJ19ZB1i8b4WmnzWbQ9CredYvbthXH?=
 =?us-ascii?Q?2Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74baeef7-f7f4-447d-2554-08dd35280e04
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 05:47:10.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ieg1DwNPut9QaowPGJvMmK50oIkplTed47ikS3coHxxtWp9926sKcFhA4NV/VIwiA+cJlXS5LpVGmkfTw104yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-Proofpoint-GUID: 5W26sljwUk7uTYXibTMjV1xDDSFUdF5g
X-Authority-Analysis: v=2.4 cv=EeoyQOmC c=1 sm=1 tr=0 ts=67874be4 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=sSnn4EZ_Dy4yVwbbcGUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5W26sljwUk7uTYXibTMjV1xDDSFUdF5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501150040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9082

From: Chen Qi <Qi.Chen@windriver.com>

0001-Add-trimpath-to-build-nri.test.patch is rebased against this new
version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb          |  6 +++---
 .../0001-Add-trimpath-to-build-nri.test.patch  | 18 +++++++++---------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index f04c4feb..5c2c453e 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -14,10 +14,10 @@ At a high level, we expect the scope of cri-o to be restricted to the following
  - Resource isolation as required by the CRI \
  "
 
-SRCREV_cri-o = "20c06a19cb395445620c31730c0f1a0a1922eaae"
+SRCREV_cri-o = "33d75981bee230f791709975125d7386fe2c530a"
 SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.31;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
-        file://0001-Add-trimpath-to-build-nri.test.patch \
+        file://0001-Add-trimpath-to-build-nri.test.patch;patchdir=src/import \
         file://crio.conf \
         file://run-ptest \
 	"
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
 
 GO_IMPORT = "import"
 
-PV = "1.31.0+git${SRCREV_cri-o}"
+PV = "1.31.4+git${SRCREV_cri-o}"
 
 inherit features_check ptest
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
index c6be41f0..bf73250a 100644
--- a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
+++ b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
@@ -1,4 +1,4 @@
-From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 2001
+From a1eafac8256fbff81b72c82213eb5a37858d2e6a Mon Sep 17 00:00:00 2001
 From: Peng Zhang <peng.zhang1.cn@windriver.com>
 Date: Fri, 25 Oct 2024 10:42:02 +0800
 Subject: [PATCH] Add --trimpath to build nri.test
@@ -13,19 +13,19 @@ Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
-===================================================================
---- cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/import/Makefile
-+++ cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
-@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
+diff --git a/Makefile b/Makefile
+index 34f9d429d..f5a033023 100644
+--- a/Makefile
++++ b/Makefile
+@@ -213,7 +213,7 @@ test/checkcriu/checkcriu: $(GO_FILES) ## Build the checkcriu test binary.
  	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./test/checkcriu
  
- test/nri/nri.test: $(wildcard test/nri/*.go)
+ test/nri/nri.test: $(wildcard test/nri/*.go) ## Build the NRI test binary.
 -	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
 +	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@ ${TRIMPATH}
  
- bin/crio: $(GO_FILES)
+ bin/crio: $(GO_FILES) ## Build the CRI-O main binary.
  	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./cmd/crio
 -- 
-2.34.1
+2.25.1
 
-- 
2.25.1


