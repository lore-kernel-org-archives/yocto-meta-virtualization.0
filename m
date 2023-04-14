Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB236C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 07:09:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3386.1681456142809346626
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 00:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34688a01fa=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33E6m5tu030096
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Apr 2023 00:09:02 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3px7d8sgpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Apr 2023 00:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkS2OA3BZXlzkCeVtt5M9/6lG+7a3l0ioQcbFTB8/YgLwGKiXmcZCEVFL1jv+pB+/Fr8L+8N/+QcMsU+K+TjtI0sg7wsbrJeEEORAHJ0n177+UOmfrzm0rdFHnMZiVByBU4EdB9Rbv4V1+kr2Fv6IwIvx5C9NQ4RRPOWdd0TWF3UELnWITNMzx0J5xCKgt+dcb+Nga2fPUYRVj5AhLOzf0tplysnbZJAEx4d4IH8jvTR30WT4LL/id8dn2+TKdW1qj3ZzNCKyGTw1iZXy//ys3bG5gQCGr+HJXhnXfIfQeIQyvGiMf3Yc6ktWfGFn5hX38vgRIgCr+p5Bnp3kFrGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjpuY3otWwoPQhlmuo0tfu6JgA/++4DsYsvSsKvPcR4=;
 b=NOjuh1sQSUgSmn8is36XjfVQwbD1EmMCKFDT5nMNXIWx2CRta6cdLkRHh78IG0Fg8aNI86UVQLzTCjHaxMUdnyxJZdnq8gDH1iXQpGIMpuiXv3Gxk9Z6YOCUsdTCNxXzUMHcxDmF3fcfNBZ5q2K5+ZdtuzJL6KhXCAKTeGeRmlkuJs1K7fzJAPxTCL/8xQnaJoKn8qX9/T9v/MEVBra198dd8X7sOOvW4mD70LQ9N/es0QeF8ZwCH/4TvPxF2c1ca4bRd8jA0Qk0il7qd4buJywaKW3aE8MiXOMvLTGSIO8tcvsOKrzZG04UYd6cx3s4ER+8hQDjngDJ6Av4a9wkTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH7PR11MB6553.namprd11.prod.outlook.com (2603:10b6:510:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 07:09:00 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 07:09:00 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] ovs: Uprev from 3.0.3 to 3.0.4
Date: Fri, 14 Apr 2023 15:08:00 +0800
Message-Id: <20230414070800.381040-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH7PR11MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: e972be4e-6717-4490-5a00-08db3cb71ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tfn9830p/D+KlHEGSWepDScxnrJW4u80VIE0VO0pEXesJx6Ow8BJ/YYyCJEAkbazMeXVaxuHz3oq8u5H+HPHQWp5J/yZ2eSU1vGc+fYw30+73tglHfG/Od1QFgkVlenqoazh6aqrlitKwgWKRW6DT3UThOY0s8EgcV3nU4IWpbuj79aiUBwEhJjhGZaEmCspnmRMDqr4V1Lah5J9TUHquZEOtt/HFAIcDFVDaNsmlZakRt/o3M39fRw1WDlyco8GIdl730wDiD6z2cB6B80m3BP1vP1FxM9oaA/r0rqmfwjPZaJ0wODE2QPz4RjTOx86eA6nTWb115Je7kVVy84aRDyoU/RGDL1m28xMEXJ6hfcqYvKVNaYpjJ2pAnGhjbA3w0XFTFH657qOzk4lvQksHMz2dDqmOx4I+wA6zhGFNhXYXPK8eR0xAYdBJmIRdJFGkVhClbaMsCuwLT/zAv1LBsRqZ6l962vBE6zLxoirWJprg2KMewLEmBvzH6A8Vt6CdTsyTCUyKWUgyhUHeeXfXbgufAhUh2PPdwZ7JvkF8nrjX6Pfndh1+I08KXLD1eyyI6yVIFDV8Wn9Pf0OqR8UIWYyK6ATby2DEp8o7yG6+I3bIDC7U5YRJ8JgkCEXo5tF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(136003)(346002)(366004)(396003)(451199021)(6512007)(26005)(186003)(6506007)(1076003)(478600001)(2906002)(8676002)(8936002)(83380400001)(41300700001)(44832011)(5660300002)(2616005)(38100700002)(38350700002)(6916009)(316002)(66946007)(83170400001)(66556008)(66476007)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5jGzmobbfRKBDo3b2CjK6knMJM4on8B+O7iJqp7H6RwRfC/KmeUHBNz376kv?=
 =?us-ascii?Q?RrlGwQ5Kw+Sh94z2r9my87Brp6LFI2vjXPHr7xQHdLFymxjBSVy8FX/38Qhy?=
 =?us-ascii?Q?BcEMsiiPyfZzezEyHgz3oDhdgGtn0irWTcMP2HVJgTo+sZ7IC2UDHkR88tVo?=
 =?us-ascii?Q?hl8+P09QxSNoPZuQ7p5m6pAS/VwZD8a7cnTAJO/W8iH2JQyzju1UNH3XgRm9?=
 =?us-ascii?Q?12rVfJuqo7M5T/YsNJFYMW7Fb6D36O+GGNmIrP3UmVhEs8YxmMxDFrUuh7qY?=
 =?us-ascii?Q?FJxwCzPN0Hpk8MlYcq3IymWzAGuflw+pOB51Xcrj07JN7U5T07VbwpiSHttn?=
 =?us-ascii?Q?QNgEt6qTA/NVdMA2B2S597cZFJe3fXDBLQyTDEeMgy3NE5MnB/JyR2UcPGLn?=
 =?us-ascii?Q?Taw4FVRqxhgkJWy+JYn3yHXimMuY1Nu4ib9fG+llU3oPyUwNMx7/dZa23xGD?=
 =?us-ascii?Q?EEoWrlI0pJgQaNo00i5nTnIh99OXOK18xpv8IM/C1vvLfCIr4U8GV6SVPVld?=
 =?us-ascii?Q?b8Gf+W/4IxcQG0kYCFK74SZOZF5ViY+qXieylAzNQOpEdQq5qQ/00LXADOdZ?=
 =?us-ascii?Q?dpyRfMQUugGu/blY/V5yPO/55BX3RGWoJwR4xowO0ued382MPsYRTOuIiuYJ?=
 =?us-ascii?Q?J3J6/4vcR/JjoQWTW0S7b/8YnPYnnXU6JZ2eakG5urq/D8KZGgOJy87kuQhS?=
 =?us-ascii?Q?yKnYXsixBIJ0OEGCYT+4NqTSO5iubGnqHZlIU6yH5KPXF8XzW3lAMcJWt+lt?=
 =?us-ascii?Q?qbh+oNqAKTQgxTzEulbPPIi5lA57yw48qHIMx8R80W1braUEpvmRwhHGpWb+?=
 =?us-ascii?Q?hbHmcB7jzBegLqfJSO09b7kSqgGMhWcnxWJDwr1vGkgrikwPKm/9ypr4C7MS?=
 =?us-ascii?Q?Jx6copcKdaXAQP7z0k6T1kDyKezO15JMHj6oE640nSe/UYCUHUcVttuU6cQr?=
 =?us-ascii?Q?1u5SOh+yxIDAAp63at06mQvFgVmG1d+1EbA4tdrNzv64ObJwS9lXguwAM7Pf?=
 =?us-ascii?Q?CQjNd3JjFlupW9mJQM5YHf0pVPFszHRO5x2Vfw1XPa6B9HAGbDfo6OQqF+on?=
 =?us-ascii?Q?MuoPBlMr2a/ylOQUxV0Elu9CJonpyagKVf2Jagg+0DcP4EhBxXJ3Er9DMwmK?=
 =?us-ascii?Q?mXWVQyxsYV46cDqXTgakjeQP4A+F6pFuop+uVvt593METu/W+NNSgqmdXjIV?=
 =?us-ascii?Q?p6l0tMJIgSIlY07aTqJzsmJVCw8rgWv+6yXVu8sP2joBiiGghtPao0qJYY8m?=
 =?us-ascii?Q?npY8+79NJEBJWkFgYHGnLa6/xoF/TR6m0qzyrpcLQH3Y65kXGeCpT6Eo67TV?=
 =?us-ascii?Q?JPzOq8aea5WcotoILwWIrV969WkDqOsZESKZ9GcLTvRq266K5TJLploq0ftc?=
 =?us-ascii?Q?0P/vo0hHMTLhYHeXm4cfmx+u0zotBHOpME694GZOOaBozlSfZKrOuHl0KHCa?=
 =?us-ascii?Q?Gf/eyKgPZpofIiqlcCBUNPYnQB/6fjbr9WFIcCedURXXlGkMc8H3LryqSFrB?=
 =?us-ascii?Q?hcBMKdS027VfmXlRFHs4oRYucaax1ld9YIeB+07QMtNE3kJjRRNtKvumbhuw?=
 =?us-ascii?Q?WUEcTLfZ36eJ7kms2X/Wc5VKYINHqDA/ab2GtWs4QXy2AS4VVfG+roCsdzjc?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e972be4e-6717-4490-5a00-08db3cb71ed3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 07:09:00.0190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlxhTfQuLYFcexVdPT/1snG+//x4P9UGRnFMc564wSgf8UYEyZNsOO00uwAxhG5WP06u35VFyLLiHyeRZZ4b+ck27Jyei5Cc/0msGCh3B4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6553
X-Proofpoint-GUID: BPuhtEo_f3XXVyE5_Z9o9R7IxUVS9kRv
X-Proofpoint-ORIG-GUID: BPuhtEo_f3XXVyE5_Z9o9R7IxUVS9kRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_02,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=577
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304140064
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 14 Apr 2023 07:09:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7991

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Pickup the latest security and bug fixes for the ovs.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 1ad3e57..798c7be 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "3.0.3+${SRCPV}"
-CVE_VERSION = "3.0.3"
+PV = "3.0.4+${SRCPV}"
+CVE_VERSION = "3.0.4"
 
 FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "7b5c4240c1ed5f38e476cf08819869dc14f55e8a"
+SRCREV = "2a98be5adaa6b3bd6c71a0ee01fc2782c67e7c78"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-3.0 \
             file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
             file://run-ptest \
-- 
2.34.1


