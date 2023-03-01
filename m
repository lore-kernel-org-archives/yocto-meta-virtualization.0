Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBF0C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 06:13:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16014.1677651176174850108
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 22:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=242464cc29=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32167kcR027048
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 06:12:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmkbuvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 06:12:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Id9wUlHQuOXG/8SbeYW5opikj8c3frfbJgmQYVM4eB7zo3yNz2HmytHrs9eJ/Fkj2NVs10BkcuYpxw+UjSKoaKlszJq5yXEFhDOutMdtt0mLot8PmYLSIFqWk3CfLHp1FhOGHVVDmVMVhbdAA/IvuP59KPLCliI8HF03coTnj0piReFKh9j61X5h6kYNS6L71CyegFCaToJuOgwDH3wQPXbA5Xuu6Z1WOlYq/xilGoNXWa5RoGlgD4fSaczMKnVKONwl4pdsPDz1Nz2l3QU8c7n5IxYwVp4IlAAtTEqvkYthWehi5BSmfRG0sWvXL4foq6WlOi7lbDKYbTtHrvlfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSZoO9qrDs6fjF8suh08xGWbWz1T4YPLc7nWEYU5GfI=;
 b=nkB4pIIsoQ+lNlCR+Tas54uwrxE9m9FfPCnu0FbjPeVZiPyNIlIaNk+XBG10t/VWaumv+qGazIyb/GPPwWRoRTgKJpmctZvwJaVsZnTZ/vK7ayVB+XKO48hxf76FBezOIukubguGxcowbm4PvBEdFj2IP9IIj0K3DJzEEyYxlzBXzgzttpLfSDvNIP/jd9HnOfiNQRAEWvGk+52Kplx7mdNk/3UtZ9ZmT5zzqEoKN+g27tQjIn3mkfcx38iQqpavWoefGsszMWSQ7C7QHAcpiifaikCj/tDqmERWbnai/mJHPfX8zpdnbAZb/lBBn0qtXW5naX5HDF23x+98N1dNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB7326.namprd11.prod.outlook.com (2603:10b6:8:106::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Wed, 1 Mar
 2023 06:12:52 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%5]) with mapi id 15.20.6134.025; Wed, 1 Mar 2023
 06:12:52 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: skip lxc-test-apparmor-mount and lxc-test-get_item in ptest
Date: Wed,  1 Mar 2023 14:12:37 +0800
Message-Id: <20230301061237.380129-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:a03:167::37) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c628626-2b5b-4efd-d82a-08db1a1bfd28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BRWMDpQvVGEug9JJjI+BCrmWGrVVdFA5/kweROpmDUSZosIUu4mRxC6TXGk/3vz0Qi94LWJWApz5acpr60mv9hoCHapTB2OoIuK8Jvelap940lDvD8ROmM9/foX5nrG02F426EQTR8Cs6kxVoudc+eZEWoHuUy7gmVaUpwHEt1OIswjn4IGGvG16eImKhinLQAm+uQKIbugcZQbkQPXikU8HOq79tGlMZveGuizYGEYMdn02F4a+za2hixEuvmNLM1/j/InYLHhoLW8i6EU2nrM+hFGRV8i599nOwPyuY+DNHGKWgubYh5VVmbW/1ifuaVlAPLwA0ucUhksMhpUpEQ6b93y5K/rwr/Z2BinNlT+dprN+9gWqzDDwdagOidTRQtiMuudieGU2aZg8UwndwimeVBAJ8v6I6ab8GC9ksBn5ZCPIBPBKslsKudorZaYEgmcdk15g3a1ufks2ay67OccFmjI41TC3VPgnH1ga8QGAVSIQ+KiJt2uOiy/lfaF4T66IYw/6e2cPnpbUnzX9bbfTqS8jlvkDVq0Y3keoaH4pbUxfgPAJH+xOf033ceR+m4mZbQg+6VeDGHAYURB9hR9tWdu7MtV/rPXQDRGt7m0Uh1eNfElqRSD3k0n6GsjaBUq0MtmGWrWoNsQ9Inw0f2lsaXCEJ1pl0MGcXSiaEJuSmx/robd9J/xQV1ka1IA+OG//a2c51K8/Ha4M7qEQSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(346002)(376002)(366004)(396003)(451199018)(26005)(38350700002)(38100700002)(2906002)(8936002)(44832011)(5660300002)(4744005)(52116002)(2616005)(83170400001)(66476007)(66556008)(6486002)(186003)(6512007)(8676002)(1076003)(66946007)(41300700001)(6916009)(6506007)(478600001)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5xd7yN54qOgUkfdahjlxTWgd2SI6cmKgAixreOgCVSSnNSXH5tYels2zAMEm?=
 =?us-ascii?Q?nLAbHF+UzjC3Dl7ed1AnhDhnbkSynvFMuWvlwDSGgJ1WCmzF9Xk4lsrtoz6L?=
 =?us-ascii?Q?1/wIqOFi/7r2SA/Jxppk1PsL+g5oGGtKyls1wopSC3RNpHp918TkCj6bhe+m?=
 =?us-ascii?Q?Nox8952Zg0Aa6vO1btER7GjZCBvGPKob1o3mwwi7HQWCHCPHTZGwC0QyLUoi?=
 =?us-ascii?Q?EaamZFUQlO6hqXG8XsRn8p1vQ5VO6ygVrvq9ClAR2oPnwYWh43EtKBZL5boU?=
 =?us-ascii?Q?qVRnCNLZ7rnC1mNicmwPjrX/cfXw5InEOXy5Aty7zHkKuPDWy746VbJ832T/?=
 =?us-ascii?Q?vlZp5VEXvad3BvtKT9BYUAoyio6yaJO/LAocW9J/gsh4CEnLn9jmaB3JqYTh?=
 =?us-ascii?Q?U64sZnyLp3S980PcZ9mb2o9eqfRDlYwmMijU5eCacB3zhlZ9uJPCqgfx4MIL?=
 =?us-ascii?Q?ZV57n/i7ySS6VNSoWWNiNB9niwomZMXamOvMpWhWOW/8yGlKoR2Jk2T7k9rF?=
 =?us-ascii?Q?fU8R9+Yc9X09BmNKbW8EJgNHXl2WIqGlFtfHP5/+YuFlRlxBlPBqVlumfxsh?=
 =?us-ascii?Q?JUXmHTKhvMe3sGrOEcsQDmE5XRHUizlPN5w6ViVXbrsBzkaZTTmKStrVZ0ie?=
 =?us-ascii?Q?Q2ip7Bpd6oT1jFH4zqAr7VLfSyT3UoJszkFxi2JD3ZvRDwGduS35tOVp2/NC?=
 =?us-ascii?Q?vczM6wiIC/TRrW4apQ+VkqwNMeWSHQGleRIX++6g1U2X6+TSjTDJTcm1LBMt?=
 =?us-ascii?Q?SEzsL+0kzLQBnzK77/ETLtAMNDITQPHrIECzz0rmQFlzRzGPXLoqNHSfmdIl?=
 =?us-ascii?Q?iTbntk4j3dkN1zYi3MgPZ4tsEHixas/7UJiwJnoMlIWlQ/SRA79DSaT5hd+E?=
 =?us-ascii?Q?6Or6o54LMknfr0F3Bqo2u2bBBT1pS3MAC9K+ZbBZy1tIwZVLm5Uk3gFsc71P?=
 =?us-ascii?Q?psChEnDAbQCs+EMvxjIkJDRKQOSJt9XsFvGNZZe63N0KI2oAERZp1TLA5cLR?=
 =?us-ascii?Q?hYFEsnkn5OWtHPTZZl3CeEQe3y+IcXY9Ij0uN0LDZbUvKE3eEpyJ9VvH68s1?=
 =?us-ascii?Q?4AGzRBQX7qLgeXxF2QYUsvueUNxDvIGy9h21KxaLQ0F0k8wSnr0VAFzhx7U8?=
 =?us-ascii?Q?Wi2P+Curb3MsLkT/eC2uhaqCX1TZRlMrXibwONTPpv1tmPkdMT7ZJoUfa4go?=
 =?us-ascii?Q?eawYZza/ix3dk0x94i1n4JW1v3GLoo172ImA8qTmvrKZDf/R8BIxCRyPEr9X?=
 =?us-ascii?Q?KseOO7WMgNApppufqMH/L/j2ahGYH7HllXxM6zrPKt3uwXg50w2dgLoy5TFw?=
 =?us-ascii?Q?tF9ZEhnsLnygKb+q3OTrcuWfzKxhRBoES8drkZBbQv3560+kQwTrZyXIQuK0?=
 =?us-ascii?Q?aOnJKLwF6o36lwaO6FvdayEsnVwjnxy5GJaEc9yUidRQDpM0X7cG89EJI1GK?=
 =?us-ascii?Q?9WBwoRtJtR1157OII01BH4UWhVkM9O+iNndZZveFyCFWKx9UPiSvuGSto8Hi?=
 =?us-ascii?Q?wZa4vkYo5IwZmnWXifTQyIftp/RsmgnLihDNcFwr0uHMh7Gm15SMzpF+jXU3?=
 =?us-ascii?Q?SgxCp20zQdq0xCKIfm98X6sr+Px7Qv+mUYxPxeboXXmZfqQO1/AoEkudpIbN?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c628626-2b5b-4efd-d82a-08db1a1bfd28
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 06:12:51.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwFZhoYFGaWk5mnCL3q4cPm+KFbAHCaSeUjk/yp1SNJspWp/iuhu9xGQDgjcEgA+zb2NcDdfDjAG//8yxtLzdXp2rF/IgzQklil2DMNpwZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7326
X-Proofpoint-GUID: 39FecDrcbjQ5pAOfl_34G7_yfwmltkVC
X-Proofpoint-ORIG-GUID: 39FecDrcbjQ5pAOfl_34G7_yfwmltkVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_02,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010047
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 06:13:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7910

From: Xiangyu Chen <xiangyu.chen@windriver.com>

lxc-test-apparmor-mount and lxc-test-get_item related to apparmor,
since the lxc-test-apparmor has been already skipped, so also skip
those two cases.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-containers/lxc/files/run-ptest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
index 3f3a75f..2e5af3c 100644
--- a/recipes-containers/lxc/files/run-ptest
+++ b/recipes-containers/lxc/files/run-ptest
@@ -9,6 +9,9 @@ dmesg -n 1
 blacklist=""
 # Not applicable
 blacklist="$blacklist lxc-test-apparmor"
+blacklist="$blacklist lxc-test-apparmor-mount"
+#lxc-test-get_item would report Built without AppArmor support error
+blacklist="$blacklist lxc-test-get_item"
 # These currently hang so skip them until someone fixes them up
 blacklist="$blacklist lxc-test-shutdowntest"
 blacklist="$blacklist lxc-test-state-server"
-- 
2.34.1


