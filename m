Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CAFC369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 10:04:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.46275.1744625049359011696
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 03:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61994136b9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5nrER026886
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45yf58htsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyk0kEJuefeRRtma9gMSgiak6myaoP3+ckuYlta6bLgkZSfVrA2h0IL4/yUfuUsznfKnq3g1UMbSYD+hMcU2TucOZbfoTtIgr3ne0vzczyeSdzlw2pgt9TKcmV7dkkZQjtv2WtzXZKsKzM0mjjS3ww1P2NlgB0fezzUXgq9obuxH6r6DLkp+y3qbcTenXcbdRYhBZjwTKSrpxO/wMk7106qGRJvta36B9t2MlMmAvjR+GwsCCp3JugOIzkXF5CKGXawZnLmWOUrPuLKpdfFo5oUMWp6WUHu3CTa9ep9Xe6QR1XMPlKPvyhxN8MmFhBkklQv9EHiH/mCoBirOYlbIYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bWjpQVHD6d7ta7tvA68bmIZjpzITAIOQeAfQHZb9Ss=;
 b=BxDyVIZ02k2RnkXQP4zPVGgAwAWYKyms6OwuwKZLSvGliW8YvSYf58PSerB7UrBXva/zykPvXsLAG+4yEYT5hOUloVqzACa/CVpBfgzZK0WGekiw7vxwQkIv6EmpEKfdJEwkJJi3cTl4/CY6ogldG4J0QVgUkHO96tpCQrfc8XfZoJ/paI9VtO9/685z5rPKBT1jyn9eHJrHR64B2Xkj8uJ7Gb6yO5+npmiRZasg18cuQ7UazbO5dQa+no4V69q5jU8HUcJoyi0XxlzSqSY/OgD+CZUDUm9OvHmppSWq/ubmZ6rNC5CAL4CCPYqA6mBlF5AuUqu8lHB/WIRDaTdU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 10:04:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 10:04:06 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/3] slirp4netns: upgrade to 1.3.2
Date: Mon, 14 Apr 2025 03:03:57 -0700
Message-ID: <20250414100358.2940529-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414100358.2940529-1-Qi.Chen@windriver.com>
References: <20250414100358.2940529-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c3c755-5d9c-4f45-2de2-08dd7b3bb07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IGCFu7t1cEhMvQkp657LRT/UYvfKwV2u23PLI9wUzx2YkdmT6qnfURyJ3Hwn?=
 =?us-ascii?Q?dOvAFE0PAKrPw1u4ere/08pcAaJ/gQAM3U+MUOmlsb/IgDLlzvSkJTVOfQDS?=
 =?us-ascii?Q?Q0wpFC0B63uUrS4xLToYSauEeqqWJ4bWJyN7+ikfU9qUsdlLumS0raFvm+01?=
 =?us-ascii?Q?eC/E7AtUaseekvVh9l9lYg1d8+1XSIAM81ABe24yxjyhvIMBIjHRG1E8cbe9?=
 =?us-ascii?Q?qNlb1ibyQXih1U4Vlr4dKFIVhZ12uEmK8nApvQLrVtEGwL9iDfGzhUN8dGk0?=
 =?us-ascii?Q?D1HpyPAB6QXisEMdZtT9EIHwcdTcNXmC5MWZvPiqsCIsA2hwTXBYVRb63e7l?=
 =?us-ascii?Q?ao+Sm8WFubG+mFF2EN+xYSIRkN5UxNrF/Unq1mawulV8rIVJuBLfBq8OY0zm?=
 =?us-ascii?Q?8aFqvdaQPdsm4ez2BKW79Quq1uej39dCeolNG4zib3aeCy8MgsKyExVuJPO2?=
 =?us-ascii?Q?MCNhQyJGiMjgfTURgjCx5DHN86hXXcMsdyLtgXBe9JX1KJgc0NMFrkXBLxFz?=
 =?us-ascii?Q?cWh/8d0YDlFLcudfQlEJtiFA9IGVNEsNHMSjpgSxunPizDl3bEff/wRpyO5Q?=
 =?us-ascii?Q?j8xO9TxGkcDirOTgukU1UpS8IQufI7Fv2H1plD7U5cnVTP3OSx499nd0OPDj?=
 =?us-ascii?Q?gLP2oq+RSo4QrEqgPrJ52AztkBwpRrKHOALjpND8T2eO/cCzlzg9R1Nig/vw?=
 =?us-ascii?Q?dxJi3ZI2odEOjK+JRmgVfwvDJ6xo/ycA09MJVXoyn1MoB6+zuGMG6lDIXWoh?=
 =?us-ascii?Q?8ouj2DS2k8MeNGXfmaTwEjRJlxlxnmG5XzPLSWkm6WE3qVN4qkHR5E8lUf3a?=
 =?us-ascii?Q?gHcIeGBwtkFPa6YbgYu/WaMgEuekXLlBhx2bU23klRl7mVzrp0eynSwM2L7M?=
 =?us-ascii?Q?YIeSMktqef4jRRvYVPbWBL0Xy5tBFqDjoW2V3FUgg7hAZ1rLyw52/XinbqbS?=
 =?us-ascii?Q?v2g1IOfZDb06CBF+4fnZHGjR5Cpep2GjEZcHHm6GbgJDdd9/CbMB8EQ9y1Bq?=
 =?us-ascii?Q?dSOdjc7EoJntEirO8ieSwSmaVtgy7FT/BRZwFWm5nivysYFl9CGvLtD8sOBY?=
 =?us-ascii?Q?dgxuoulxZMA/GqMaC40vtESh7evCW9lm2M6Jrl8JydkAwYlIZw237TyU6GIi?=
 =?us-ascii?Q?pZ7jVyKtu79qpvL6ikPIB/zH6Qp3jbN4+MXyWTxu+vwpMX/CF6fpwYHWdhE/?=
 =?us-ascii?Q?+Qz3zUPfMy0E2LFx7M1Q20yvi2CLApzP+htUAMUQGPr6dmCNFtiznsaok1x3?=
 =?us-ascii?Q?MpKFrkZ0PON1RG1FTJUKPxjd5pcE/Vnoyw/M0TzNxtcFY0cP4JKgwCqTPrx3?=
 =?us-ascii?Q?g86W0v58ZNYoSCj9UxHY28yyvwSptBW9Z3h6HmbNd7KAJ75WF0eKo9pg/htk?=
 =?us-ascii?Q?VCwGj+FrQykm8Gn4PzxUlHzafFzFdwdSd9Zh9th39FcKXSk+vaAaHffpashk?=
 =?us-ascii?Q?PRVGE54uojft0avKDT69iNf68LzyL4CIwobpMqu7kKYNG6lW5ZHVjA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NNsSYpaNCzoi2bfot5AbaYbp84Go1vegsU5ZRSohBh7XJ0G29p86h5JmRdcf?=
 =?us-ascii?Q?/66j2b2AqWaahMrxrD/Ui6fhFcCIQXeFX+QCzNZQ9vgSmL+HbWPnUYLs04f3?=
 =?us-ascii?Q?e/5o9wiLKxwlV5GDT49T/AScwYfMOIBCjkcyh0lHBKH1O4OziD8olx2MiJfd?=
 =?us-ascii?Q?RD01LZ1gtuTE5e491wGGqmxTbs2yRMrGKixhg3uCq/JSffNVi6OT1/hbtSr9?=
 =?us-ascii?Q?3ptlwO1Z8Wg/my+CSBhdfGJ09K6FBeOKzkIY/Kr6hjgKi4/pcDMxkebKD3GV?=
 =?us-ascii?Q?V4abXelzRNMpu2as+WlPU0b0qxSgV6xfcdiHlvK/WVrnJWhla5Eke4nFncI9?=
 =?us-ascii?Q?1OI53+Dbce3iB2NnDBd1w7oE8CbJV9dfm8To3Xqq66FwT3shE3sporWPoF8S?=
 =?us-ascii?Q?KhC8eHHrpGmv3kjKZoa47bNnYggfQmJlBD70FIzoZkH/uA/w0fc+L9EkFAu8?=
 =?us-ascii?Q?dyWNbQLimzZK7wRCajuV4oDisZsHh6urIfbH0BswLJCaYXrlzWzSAciLRLzn?=
 =?us-ascii?Q?/Sp/j9E/oiPah0LwtpMKETs691kdjI4JZed1s6p6AFsihpEWIHHFW8f39BbL?=
 =?us-ascii?Q?pBGJdGZZeEwe94PvnRKOEwR+MjupsIEbHkYXHTCLIVvDhZJVvtdTFS8drvIa?=
 =?us-ascii?Q?ob7+fPqv0xNYRTPSdQ1Corf32DVUhtNw9vUVgcshyYGj+JQkbXKjG12yGti7?=
 =?us-ascii?Q?Jgeuo+/hOSmZK7n1em+oav6tCDBsFucqousuLHdxtK6AzvQJ7GPfJg/8AcIN?=
 =?us-ascii?Q?S5/2cOBZ+2Lh26cQF8aKqEMgK4b9/VKELibkuDCYwrSW5TKtETAykyq5/s7N?=
 =?us-ascii?Q?K5q1GWek9SZU/BagTKNwOFDIk4LI4NfJ83dPM4soIAKUAd7u32QzjY+c7XVk?=
 =?us-ascii?Q?LbiccVUoRQpUB+OXZ8EoL4mzu3/HZn/oquAe++xqt+clh2bWvJJGFVY5Jie1?=
 =?us-ascii?Q?7lW/+OBxAHXbZZn+ElBPrgt7+3ksRJiee9bkMKLaNKcyIGhHPpqwwMVoWF/i?=
 =?us-ascii?Q?rWTQ5yU/zV/72VKc3K5+0gzT/Paq0yFISmXmn4E5kch0uc8raV0rN+o1B+qK?=
 =?us-ascii?Q?yOpVcXsJ5+589nYOGvV1B9zzOgD/BsH4+9BttIiygSezkn1JzJhJsedl/eLH?=
 =?us-ascii?Q?xZ4hV9an5sj0sVhjtKzxhBM7ud+VtYupYFeCDae6FdyBxYsx7VR/0hxqJeWP?=
 =?us-ascii?Q?9s+PUZrJTb648CnJQ38o9F8Rlmz/go3xCsicNFBLimwTlpE/AH8faqBV6XBQ?=
 =?us-ascii?Q?/iTLCz8ZulQosPa1VIPCBXkbxCk66BbuH9UImYEkZfN4Mt6vNyKqKO+D4H6O?=
 =?us-ascii?Q?/s90dgTzcLwj5JPR9ryrrfrxALTQZbAZ3Q+WETZXM9ySJ3tkQXdVQDXt0xjb?=
 =?us-ascii?Q?LV3jwA8115BsGsDroa3+zHlLym5xH+ck7H1nZ1oVULL2OX31DQE7JoRWqke8?=
 =?us-ascii?Q?BM5WEKufJln/35jfsgabJ807qJGwBD48lzA7fdlUUzfMlroPf+6Ao3QxPnhQ?=
 =?us-ascii?Q?LPOFQ/QYjZOCQT40cDg4DavpHkuyIAtJBn2Czv3ZCw+PriVVLAydlqvbkMf+?=
 =?us-ascii?Q?1/JiOzpbJaSLNSJRLmftBpv8ZNdGC85HF2OwKRoMx5mh0GhF1zzcZXcfy9mF?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c3c755-5d9c-4f45-2de2-08dd7b3bb07b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 10:04:05.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNvcsdRgey/SRJ/lVSRRMxYiiWMw42zWIm+OjYGoxJRQ57eFAgWxNZaUcREfvX9Y+G6qkRZj4BdRs2+PbQy1Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=67fcdd98 cx=c_pps a=dIBsZBmI1wyUZqnlzmwqRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=PmxwslUT8peUI-4MYZwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: SLddG6bai4rwd4DpGd_1Gs2TdUDB8zQY
X-Proofpoint-ORIG-GUID: SLddG6bai4rwd4DpGd_1Gs2TdUDB8zQY
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=818 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504140072
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 10:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9218

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade slirp4netns from 1.3.1+ to 1.3.2.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/slirp4netns/slirp4netns_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/slirp4netns/slirp4netns_git.bb b/recipes-networking/slirp4netns/slirp4netns_git.bb
index 8125bb46..2dd3485c 100644
--- a/recipes-networking/slirp4netns/slirp4netns_git.bb
+++ b/recipes-networking/slirp4netns/slirp4netns_git.bb
@@ -6,10 +6,10 @@ network namespace to the usermode TCP/IP stack ("slirp")."
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e2efd29c201480c6be2744d9edade26"
 
-SRCREV = "ee1542e1532e6a7f266b8b6118973ab3b10a8bb5"
+SRCREV = "0f13345bcef588d2bb70d662d41e92ee8a816d85"
 SRC_URI = "git://github.com/rootless-containers/slirp4netns.git;nobranch=1;protocol=https"
 
-PV = "1.3.1+git"
+PV = "1.3.2"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
-- 
2.49.0


