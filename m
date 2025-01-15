Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAB5C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 05:47:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14927.1736920036449282242
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 21:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3110ba285b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5F3kU018072
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:15 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 445yumrar5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oL4hL0PbC56pcG89q3yeAwHh5fO2q62ILzboLP6CnXMNjoAiSKNbscmd6BuqmkPzILu7Qyw5sbcb64Vapmbr0XTnORv/AWgVg+zAOoyff4z3XLax+YRih012aC6ewpKxcCuP4m5RterHUa6Yh0W/0dqQb9gc5b/59vT0KvvX14I8P8q87f/8V/RlS97BRdugKgKr7pr9gusNDNkLtvqphXDxOZx4swgwUday+EWDnDvHhGbsaCRG8KGVh0zUh8U+5vGdDAku4daCfqoKjyJFM9kW1zG76/CXDOE6MTyUl1Xp4Wza4FyJ3bsDBnFQwzmmMbrGBjSc/pN/uWmgEo3tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXOAXHkEWZHCxgfrpZhfBP+S+g5DYVdl98UvWY1RqHE=;
 b=wSKbs1dStWjM3g8aDsN9YuoODfoWo8imgDsyghbnksNvjNGuvp5z/tSQOHPfDtoWj1Qb1ekHrV6YIUeKHuoTS74B1FE4qsCPZ+lzrZ4R7dBi5lEXLLxwUcawYQQK02XQ+bk3N1JNCnt3B/F28R1CvuHQNmK2JGglPzy8rUsj4Fd3Wxf/xgSdvMv7lt9XtRDWLwwopgh0hqJMEkPdtjTdKHg8Kvasm7QHo8ru5gEK/WnbQTBiVdzQy+36Kfy+fJAFuz1J2+eVCUm509CepjjkSzc0YZ/u0g4gUJxcxeMtLmRPTY97NhY0kRE3GvJktGGqilIF1ZKw5WOzztybeJhxaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 05:47:10 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 05:47:10 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/4] buildah: update to 1.37.5
Date: Tue, 14 Jan 2025 21:46:36 -0800
Message-Id: <20250115054639.1079705-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cc0f30-7fe4-4add-fb42-08dd35280251
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VEeNV13tIst380THP6UA2+dtQCPxoWHyfVRHByXdtfHD0ZiX9HQVu2lepSxU?=
 =?us-ascii?Q?26IOFVmYBT1KsEC4yZik4IjHxBuTZtMHmDj4aPHRFaA5YmC5TDBPFSmilIie?=
 =?us-ascii?Q?FttDtfjELNVCrxKHxmTFVDQQcjGSayfTfxxI0d/mP5Jrzvujcu2W5LyBoqVL?=
 =?us-ascii?Q?W0n4KAfhV8doV5Zc34W2mduSxPkONcqicgmuTnWmqEbb/PtOf01ZVKEvVqum?=
 =?us-ascii?Q?5qu4mTAkXF2y28lUBPNlKQbn7eYknzI7hdx9Y8DE64jn5Fajw3vTVQLJx69E?=
 =?us-ascii?Q?R4L6TKMPCbWzEaM1tKmKu46EI9QtSWp4xVLFae4PnjSaMpKn3GEIh6fm6zDg?=
 =?us-ascii?Q?/gAe5hdCEnMdljXB5IPoHkkrbpwU7KDf9FoJQmTYvTQcT5WWmSG7yeLiAZFX?=
 =?us-ascii?Q?uQlFZzDUHtDL+iXol+44suhOUHsa6w247OopJwlez7s5+PpN2dV1LMcGSuWU?=
 =?us-ascii?Q?g/tohR6K2zpHMv1MqQ+kyQtKoIP0wNKO6wdf8ZhBmHz37dsQWRdxNGyrvoAD?=
 =?us-ascii?Q?/0K7dO1spb2ZM3B9cASTcycFU/xtMCCATP1SVlNymY9oM9jKhe103HrVWv5t?=
 =?us-ascii?Q?AapAFT2xyCs8ZCQz0iWNbJUGH24AJQ2s9RzCC2pGaEiWUvdICrShwBUG5jB3?=
 =?us-ascii?Q?nr2MAk2pYGxgwYiDZkptCfye1KxgtJ53sNajigZDkauQ0yE/hlb5qw1Hw8ua?=
 =?us-ascii?Q?XDnwt6POyTuGuKOdIGGaDvHEc9eRam71O5kZVUJ9jm9ytWwkxxztWM5MNzU1?=
 =?us-ascii?Q?c9zU2BifxTXCFpDzqwG0q/Sxq2z9CC0JslxQhksRzMDbQr6/GMFQ/Jk1G/Aw?=
 =?us-ascii?Q?RSFpW68ssNUD/6kP4uqF3g7qE/p7UxSxcubY9/pxgdBeILtcb/aTY9r/tT2Q?=
 =?us-ascii?Q?/5Kri0lJ/Ulo+g8ZuKk39MN/6l3z+MmN6NyAt1CzBeBbIbCo5bgk7AxFLOqx?=
 =?us-ascii?Q?BFNntn/BM5PtGxBbB95vT5S+IzARmIW34kkBwD9M3pMSpwuwYz+Z94lKxxML?=
 =?us-ascii?Q?HszP0I2vkADKIlj3oIL6DUAB5kDr/T0U7yNWJMBMv9pQUoyH1yh3DWX24N/O?=
 =?us-ascii?Q?/cU+3VuTaLFJ+Ze6yrKVMYRHHJ7xA2tmeoOYhKEmMb1hlIX5kCEE4GqDXWS5?=
 =?us-ascii?Q?lsBO6Nr3IGBEBTfRDTSM6m1fZkCwoZFw3uWX7DF08wD01k4s1L6uybqM4rSI?=
 =?us-ascii?Q?RpP3NWGb/iNcSlowqLzmp0rRN19gL8AqMO6oLNhHlwYuJw3/i0GrPuUxaY/o?=
 =?us-ascii?Q?iQCaSoi9s/yp1jqiw1UJK/iI+tRXx+nJd4G9thJBRNK5g9weGDPl7w2qd4/N?=
 =?us-ascii?Q?UKYagxoowBUaJTD3dIKGGkDUqCwX7Ci311smbPGqE3aNjMxolG8fcQl47Rrk?=
 =?us-ascii?Q?pzMDhuUKQFe+qPQs2SVMWvy3kKismvvLOtjfE/q7ZYjIM1xQPL1DXsKNRhDU?=
 =?us-ascii?Q?gMFjDm0Q9a9xwWWUdrVAhB05GeQWummI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/FzbVfASoAdSLwwUtREJZMIWakR2Thj676s/dbQMCpFg9SGLFL0d8j1qNNQB?=
 =?us-ascii?Q?6cEDASoJFUYW7HEDfQW1G5IzaRscUFgKnrH4twrdwyVCHAt4catRwgEl5f+l?=
 =?us-ascii?Q?Gd8y7QoBZjZ1akATSHfojp/JeK1N412dsRmdBa5rBbhlye6b7zPH6j7kYPdO?=
 =?us-ascii?Q?JYpVCVIEv3lfTEQMkzIxK3RIZNPAThMVhTZf8WJIw9YYZML9FoCZJhqrpVgg?=
 =?us-ascii?Q?qun2PsLDDV7722gTSt583gMiBtdTm2cI2hE/mNrGXvWo/aIn20rJdGn4L0Js?=
 =?us-ascii?Q?J4XXUgivU0n9FdC+/dwOpf5U4eg1tXUEZATWNWMCzY9O9TQ23cP4IImDRnHR?=
 =?us-ascii?Q?2PslTnOPyyzFa32R9T8atdHc7NNbX/M8Glb/rBTRtZdnpyJyfmq5mgpCZse9?=
 =?us-ascii?Q?cGiLlBsewlG3JXefrhcJ9ep/zoiE+h261dZMkxEGvUOYY7gtdSCTkUHJGdJO?=
 =?us-ascii?Q?zO6T+uAzJ5hKwMvaRUDunWJtHaorLRDBorXedT4EM5v7ItMx4ViPZeZ5xV34?=
 =?us-ascii?Q?Lhpa3fy17Mtgqk4uh0vSJzxW1ortxPJuK9HJzLmsfeq9dPxtKI1VkUqsnLVR?=
 =?us-ascii?Q?nxxvFIkYkHbe9Poxo74LonFPv7PxOBtRYAzSDqTHNvrS4f7l2M9lL0RtJLrp?=
 =?us-ascii?Q?6RPFT6XFTqDL4+Mu0bt+8IEtbvFmCu5vn3/gz7KdW9LdjEyt1P2NQaKsS2dD?=
 =?us-ascii?Q?+nbrJ3xDpmFa9OHcr6rpeWdxTYN3mbFkAltiQ57N+c7LltgNsYGKY8fr4GqG?=
 =?us-ascii?Q?yPNZ6qN5jWDF9qQDRmvFq7UCMhFKAhQO67oEq9FTcUManNtKF9XO63ia9nVS?=
 =?us-ascii?Q?XO2mDv4odaOBR66QDkY541is0kBpSCCW+h6fsuUKjPSG9i2on4Ol007Duhbl?=
 =?us-ascii?Q?dbtd8W2hL8nhdPRM2q1qYuPv26Ml6pwmcxAs0D7KEv/Rzwt4BKhOqnya8Ra9?=
 =?us-ascii?Q?E8dlUdu+ay6mWYLGo5SOTHKnaUIGUshUPqqXSUDt58RB0eK28Pl9A+umFK6A?=
 =?us-ascii?Q?sbEzRE51XE02nQ+H+UQFGY0MyJmr1BkqknEmYW6sd2lzArUlcNGGlZioQxdu?=
 =?us-ascii?Q?WtHQNAIfY6cAlJs6VfRyzg8eT1IqPCt53TDbi1KxRxfKU9fWvjX/BT6KyygV?=
 =?us-ascii?Q?hr7ElJQsGEXNdpqMTtJoksrPbWkGGS9fIcBJDZlo4Dyl/bPaRMvuF7sv8pCK?=
 =?us-ascii?Q?9oBKqAjMaC0G+t4AiYHElrtirDv4vjz8ybFOUBusW3ZSzCeBFQXYWNiy7E37?=
 =?us-ascii?Q?L65/ISb9ECNNN4Ys2b63j4/GX3adKEa7e2bVQJS2wAr3SWaEEZZu8CUrd9ef?=
 =?us-ascii?Q?uUyHUCBRC1QuYuVPxwXoor/1JNnqf/8jax49BhJ0hLO+3Wt9OQ7OsYKlyx6Z?=
 =?us-ascii?Q?sF0YNVm9tfbGOXsFB2bVIwcDJx1+Y/GnjRy6xXn8vin0kjdc8idcmKfEB+0K?=
 =?us-ascii?Q?I8QFU0AelhpPB0sh9tGbDmnCgVR4j1aKBhwmpaBHAzkL8pA2SvKewgyBqmwE?=
 =?us-ascii?Q?ayl1sCL4uc6H/FGZ2AYuUQ0gmfE7uVDNzw+yGC7oTFix97l5nPUjTxnI48Oo?=
 =?us-ascii?Q?n0kU2XIwVQF4BjxePUTrp2oYlDu20bxhjwodOkRvjRvMX4IjWqv835p37ryn?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cc0f30-7fe4-4add-fb42-08dd35280251
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 05:47:10.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2k1d4pSTNzxwCMqwWpO1FOr1aWUAdeVCwjzvyofsfuKyan/TzFWrlmJZejN39ySLCTdQkvUZz6r6XG5Ye+l/BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-Proofpoint-GUID: wZW63yY3nyVXdyOk9gZ30x3PV045lQcO
X-Authority-Analysis: v=2.4 cv=EeoyQOmC c=1 sm=1 tr=0 ts=67874be3 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=9VV2sxqrnYs6CoVGFv8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wZW63yY3nyVXdyOk9gZ30x3PV045lQcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=813 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501150040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9081

From: Chen Qi <Qi.Chen@windriver.com>

Fix the SRCREV as there's no need to use SRCREV_FORMAT.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 7ad2fd95..1f9805d6 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a
 
 S = "${WORKDIR}/git"
 
-BUILDAH_VERSION = "1.37.1"
+BUILDAH_VERSION = "1.37.5"
 
 PV = "${BUILDAH_VERSION}"
 
@@ -27,9 +27,7 @@ GO_INSTALL = "${GO_IMPORT}"
 GO_WORKDIR = "${GO_INSTALL}"
 GOBUILDFLAGS += "-mod vendor"
 
-SRCREV_FORMAT = "buildah_storage"
-SRCREV_buildah = "0117c423e94b1051d5e34a16f3f1db8fb63509c7"
-SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
+SRCREV = "5fd40b989860984a00f6fc1539ff53caceca1325"
 
 SRC_URI = " \
     git://github.com/containers/buildah;branch=release-1.37;name=buildah;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
-- 
2.25.1


