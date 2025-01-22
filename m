Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D50C0218D
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 02:27:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33852.1737512850509291586
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 18:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M204O1000556
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 18:27:30 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqg0r0mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 18:27:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDhXXuCS4GtXvsXMTGyXh90fuLHhLPjU0LbVy4WzpMsnf1ofP6ahYKTpQEWJaTQAw2Mgz/noB7thIalUDAy0QNoHvdEstDSYSadwwcjmt4rAnsz8h9UuFX+Pk5XGixAn/6Le+D7vqWpuovvWCgxgj776NXVHsRBvjxlmUCsDr3Ht1SJwutojoUOHwN4rTBJd7P7ErGyRqWIy/X5Q4+yml+KnduMyEdgyEPdcSraC2sooZKPdJdYVZqf2FFpXTPVSVDhlvxFJrRQQJ7w0xPwY/5NNGUStj48L8Qij5M+fh4CA7uMHVTnzEdPbNu2Wq55BVHuDP4aXMexnlQ4qq+AEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrLVwHtl7SIH1pop977cbUg2qKJOVqt/WftJmkrCNPc=;
 b=mN+xjDMPX/qHFzBwqRNcoxhxbUDsi0Imy8u7CDXII79XJPN/XLclJNxqLlCiT4TniS7XGrwq8vWrk+BUynzA77p8W4tz7YVmLVX5mshJvq+S3c/z1KxAnUp+U4n5JqGUg12rwQFM02pA+Q5jckNgybIfVdhKNOqG/njMeLFkyHVcMC9BAH4C0kkIXdnB3Xi2f2tkNgQdTt/VqBe2qJO07GcqHXc8VNB5UTQOvGEG/GWWNHsoxGUl4xnnK2PNg0ceCs7uO49+cur/j4Cq+j25shgibOY7/GOXbiPqPeAinGjMJwcJ6ccvrWbaXOrou8W8KSpIGvjounQNW8WAsMv7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.22; Wed, 22 Jan 2025 02:27:26 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 02:27:25 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH 1/3] cri-o: update to 1.30.8
Date: Tue, 21 Jan 2025 18:27:12 -0800
Message-Id: <20250122022714.1792229-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 86184f13-0cae-4d7c-a53b-08dd3a8c4f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HO1YdOkkK2/N6EGyQZWy26zPql7yoegtCNtXZ6D5OInaxwiDJdJDXUmu2Ezy?=
 =?us-ascii?Q?na2u4Sz844FkIR2L+ouptJuYJ/0QdszWV9nLYuDvbuVao2MFploRCeIoOQzJ?=
 =?us-ascii?Q?mibwKYAkludE8ljjr2tJ+01b1zUlgqG5UpsSgDyk27HyPrKJ+NyER68mqp6i?=
 =?us-ascii?Q?ev4AK1KK43BLhma4hwj5l56ZzsSzTq2eIlx8zqyysMiE8zRqzroz86f318uy?=
 =?us-ascii?Q?dIg2Bt2K9QSfiajSQOnAkHit5U1QyFOTQGlbhxD1RptZsME2zda5p+sYbM4X?=
 =?us-ascii?Q?I3X3J12617TaY1IfRxCSNhnLo42W03ibm987Nkacis3oXiBkLP5qGG535SQk?=
 =?us-ascii?Q?N7Nb/71VfkYR0PdkhVxn0nTDd9zQECyjbwWBlOhy62qjjQ5wbwd5sdQBEEh5?=
 =?us-ascii?Q?IUhzgbIkC/SsjjVux1G47QlE54BKCbrbx9rKefGXyW4n6w74nDWrKpodTWS0?=
 =?us-ascii?Q?ACDtL73wrOplvqTtICF0clfwdJddPHPz1bbbsbfxR/DcP9ed32+CC4Kq+ejp?=
 =?us-ascii?Q?4rKNWwWGO422Z7PtPQ+epgnnk85SR+3scYdkhSKIgd2OtJxYdLhkQ2THLDwt?=
 =?us-ascii?Q?ICSa2T3657S9n6BelqljC97EFTDDEHqf8kz8vmqwBKflT7snBzMChnZj9yPz?=
 =?us-ascii?Q?B7zB34PuvM6hcvx33Y0p2fD/C19k3l29p8WNLshFXOQhVw1Srd9hcoCmMUe1?=
 =?us-ascii?Q?bCJgYZJGdsdCvnxx4wRIpMUOAMCFVr8zUX29+jSV6VyhvPCOjn+IAUZC5RLB?=
 =?us-ascii?Q?6u28/i/hGwtJv7hIzV4EfcsLST9b4luoEa+X247MWnFajGFZ78f2jDykkfWh?=
 =?us-ascii?Q?FZXQQMHXMJVd7Doovc4oWEjg0fVAkTje+UQMy5EuobPyFBlULV67dr9lVORJ?=
 =?us-ascii?Q?44jUhPaO7rMJPsDl31hSvnVqSMFnxNMa0lLmon4WV3Gsd67T7FxZNw0WYQzo?=
 =?us-ascii?Q?kzjmoYFXfM443JoWhIL6pXkc7PU0NEFDQb1COlX16sGdhnHKAk3P6gp05Slc?=
 =?us-ascii?Q?KQPWXVOPHaKHJd4BLJShyTBMfTXLXOkUTpxT4QyEPsoAUGOK9jT0c3kZkXxM?=
 =?us-ascii?Q?RnPshaHMRS2ZjiFQRCozv2eBED4T/AGotIOLadc+vIz8avopK3PbVeSMh8Sc?=
 =?us-ascii?Q?bHT+zDU1vVnQFaGVJ05YXdN48rFUmiV6whGArFJHFZxlgC9LMK/kYulAvNxr?=
 =?us-ascii?Q?RfacZ3yCvBLktjdQGEYdooZzMufxs/lqACvqKBCqobbBGYsoQIebFtNqMWuj?=
 =?us-ascii?Q?Fsg9r4ZSwf5WSaFKpvBDFmegDmUrrBT+EgA+JjEGEsUKIQ/qBsDQ3T44w7Bs?=
 =?us-ascii?Q?myb809Uk3TFidNIuGav0BXbteG9G2+pJMswQSjD9oLXSIneNQYQXsvU9TRII?=
 =?us-ascii?Q?OEvsQQU+mhzGQLetA0B9r7K6Dc5YW09kPyXjuRVGXhsIlKihgWpriGNj+TDH?=
 =?us-ascii?Q?h2P7RvrxxDCSRadhNKOsDhQWyRXaXkJ4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jIDukNvmunvzAA7fN8FwoAFTkVoCz8pbPoZ769n6C/GnNAKE4SyZBRxUHh+g?=
 =?us-ascii?Q?b2ar4KDgWNrU+C68QNdmHorDh8JjLIDVSnNjdIScnLXo0j6QF/9dAuyDSLpj?=
 =?us-ascii?Q?dZDVr+6ZgXeofkTVP2AuB2Ps9C0rzkNNjL09ywV42GYw2ptH+Uzo5sOe2hHA?=
 =?us-ascii?Q?6CBqe0do3kjNxEnR1KqRtpqLiIyfhHK3CBwF6CZ8izNg/TN1HGHH+4ncJ2SP?=
 =?us-ascii?Q?vzMtd3TTSqxdlKcv4zt2Hh33HiczXgGwS47wWd4J1fDU8doNI3TApJ9SzHDC?=
 =?us-ascii?Q?PyCS24JU4DMpCKma10q5rl2OmcJaWr2JEbJwkjt556sXpgXyXBkVQL37LQjs?=
 =?us-ascii?Q?zABv/snRvlNpvzaga8PogGdq4YbXVlTWgzi/lEP5cXlVcDFYpNi+B0E4H99x?=
 =?us-ascii?Q?16AbsqeJrIAnOMMT2lDt1Ko5bZljYYgjC8f9+581b7H2wF7F/6GGwz0SNxP5?=
 =?us-ascii?Q?3PoQqSOnc9kPgcyK8b39oTf4nZECdCHf9zhRh3TZKctweqFwQQRg3q7LM5dm?=
 =?us-ascii?Q?ljTURgLlQPJR6XQgHYI10Nbj1Dq6IM0F+Y3gbtEvrA4RYDmxq+q/TNLIifhZ?=
 =?us-ascii?Q?3vdCbzy/viKFU/QnIwMbEuy0W/2SArRE54b2Li2tV/pWsODXir+lk9ffFG77?=
 =?us-ascii?Q?uEEcFa9j6deoaOJ8spEmRl3WTcoUrPAybziRRjvt6TtT+yrRNJa/d3N6Yi6h?=
 =?us-ascii?Q?BKbM6B6yBuggWF+j2pBA2P0sgQIqPhntmIECOgaSX6dt2Dk2K+TeprmLCcY4?=
 =?us-ascii?Q?WbEe6tm9KU1JXVaFfE1N5i4wCsnypafxOlLuGWPH6lAbrEEzaKfnue8orDrx?=
 =?us-ascii?Q?3M2D01WVSZzvjxemFyRaGMU86BzoyPBuUT+4wGy+2Qu2WVZgjCejjDOmDT9+?=
 =?us-ascii?Q?fguF/xeaK3u75VWRHD7W+NlljZv4QLzHiI6gqi9OEm6uw7z4f/HZm6WS3FLF?=
 =?us-ascii?Q?zVxOVnAa7uNs+ItBqu1WXSA5XJ01qh2BvfVAKFNkKj3RF6K4nxycQnhskpo+?=
 =?us-ascii?Q?DvpsWF5YHbrDuu0G4v0JGtzevp7pPynLDjcFYGv1XQxhfflZmf7cORNZ/XKc?=
 =?us-ascii?Q?jXRYGGySq/Xb8jkrdwzybqIIPZi3oUDiEhAEjJZ7ojtnmduqwcJWW/IBiHSw?=
 =?us-ascii?Q?RX1n27OcsTl3o+7aF20DxOGqWE03CcD5QGZw3370TdoXpv+D42FdXWNmU6qQ?=
 =?us-ascii?Q?HCue9xW++W/DNCysce/2dWTHeP5tWOXmXawewyhyTH+StMUEfO2EIQXRWfFW?=
 =?us-ascii?Q?oQb8CkmPJcAwneNsIDqSm3L+SZRS2UbnanYEmChDYlhwOh+2E7rymyB4mY7C?=
 =?us-ascii?Q?n517O+vOeD1kowDjf3FrQCyo8ONQ2nIYBWgtl43VskAfFa/8QXq3JbnVS2MM?=
 =?us-ascii?Q?GnEyjhYjai0OO6S0EUcZXx170FEdWVHS424w3seoewMDbcdwf9Y4eHy9JFYY?=
 =?us-ascii?Q?zC/OBN3l31LBNCixa1toaf/agj5DE41ZsN5uNGhWCAuMxIFOlMQ6Z3O7jOgb?=
 =?us-ascii?Q?o/CvJNgPaNbBZffGeqB0whsGJaJL7Uchsv05pS1FBFUkPJZE/rUxL1jbqSxY?=
 =?us-ascii?Q?s2ERjvak6AvzT0gqN0i8fxAHSUZQE+D3LtsyIX8t?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86184f13-0cae-4d7c-a53b-08dd3a8c4f40
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 02:27:25.8538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Q0TdvvE0+l/8H9i00bBWXV7SwyNW9HmfXtZRCoB/H4fMVAyrI0cS+MJ51AG/ZxFrrjfYnI6+EMq81TlMNFk1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-Proofpoint-GUID: 8d2EczAYr-G4wR_kZpMcVUnrPafqUWlu
X-Authority-Analysis: v=2.4 cv=Kue32XWN c=1 sm=1 tr=0 ts=67905791 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VZzbbjECq-QA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=J9ib23vNIjUkgzsXdsIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8d2EczAYr-G4wR_kZpMcVUnrPafqUWlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_10,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=888
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220015
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 02:27:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9103

From: Chen Qi <Qi.Chen@windriver.com>

The following two patches are dropped as they are in 1.30.8:
- CVE-2024-5154-0001.patch
- CVE-2024-5154-0002.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 4e17a7cd..1d0aa72e 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -14,7 +14,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
  - Resource isolation as required by the CRI \
  "
 
-SRCREV_cri-o = "5aff11c7c1afdc785adafd7da3c3f2a6ac51b88d"
+SRCREV_cri-o = "359f960f46697517f048e6ff3caf728ae75cb384"
 SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.30;name=cri-o;protocol=https \
         file://crio.conf \
@@ -26,7 +26,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
 
 GO_IMPORT = "import"
 
-PV = "1.30.0+git${SRCREV_cri-o}"
+PV = "1.30.8+git${SRCREV_cri-o}"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
-- 
2.25.1


