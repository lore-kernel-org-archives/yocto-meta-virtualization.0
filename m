Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D29C64ED6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 05:32:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.959.1676611968307610747
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 21:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AXqtzcP1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H5WkxD003676
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=48+q+YzreSfTqFgpVk0UYiiv02QbTZkkjpBIjnzl2VA=;
 b=AXqtzcP1oYKxVfcNAucq05I8a7qmQ0YStiim+q7md4p7HZ5gz2LdpiLHl5qLPQKV/vZ+
 KFq/Zzj3P2U4Orn0dfJ5sgmiiqMFtWCm76V3/Parc3RmOnbTpg26j5zgBcJe/pGQNLDd
 wlSY3yEyRU3kpBCpRXFHPDdTJbPQ3IkQBxerU150srwwk+M4ZTuu8H8272PfjvpX0qxD
 hRrEKXY94xGJbPHpIiQX2svdG/AvrV6ESgag26pXcEFRAz0E66k4vgyBskA3sZBRf44M
 1/jh3rN4JOYyMQfQvtwcLv0NNVr3/XVP29+ig1iHE4g6fD0yIolmIzyW3nTBUqRc0bWX mA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc1ks5q1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOtc4Ey3H2VaO71xODRZblgX2DB7P+tvqBRettJeWhatEhQuY5OvZH3PthWyoQ6phxeXfjMc5DqlHZXrAiMU7x1KMyQzEOeIXO+kc/QqP1qbUm6iVXbTr3tzMW+JCcbUw6FfTrBHPd6k2r9syYzkNO5xXpVzigguQxQZTIJnVbUpJ1vl+HzRoMUot5WG42ORGyAjeX16Up91HlHSF4ew+aRxyBneXJ0BhofDiK3RmzYZ0JHYthRa/oa0LYfSeh1oOXPFydPKMixwzTkIP71g21CtWQ2w+zIq475pFL6vQjtNeIVW+1s0Dg3HPhxN5oP8LE12gAeEkURdxsO9FckE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48+q+YzreSfTqFgpVk0UYiiv02QbTZkkjpBIjnzl2VA=;
 b=j7bDzkDss5hq3u4SAIyzHMiW9PsM0W1qf15tSr19LHsXgmWzFJrrnBr0q040jR1ybRazeO11b8kkpTDAtzy58c+uMRJFIEjiOuiWup1LNXlqwSnopAYIz4lwpxjIyJV79EpBx4NJE8+wAReg1f02Vo9Pz2fPFJoENRj3DBFeCqDUeLW+5sI2fZOWmQy1VcEMJBWHa6lIX60r5BbEQSNKkNIwXjXmO7xOBsEpSeegLIJarMXx4d2Lki50cheBxzf1qvceiw79TOECKpBnfGkYAJM84GtzxVC4CORp77SuDptUi2ZaketHsM3N7uUnvXRD4VTeJktQPYQP303g/6pDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 05:32:42 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 05:32:42 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/5] cri-o: use PACKAGECONFIG to handle selinux
Date: Thu, 16 Feb 2023 21:32:21 -0800
Message-Id: <20230217053224.3870-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230217053224.3870-1-Qi.Chen@windriver.com>
References: <20230217053224.3870-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ef8812-2b81-4b94-2cce-08db10a863d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OrPOWeUh+ojh9u5v4xMFt9zGy16rGQmyrTyDk/BhZaTSbj4+MYtT/WVDJWf0BWcEWuqV0wmWA2bocyiPehasbO03J+MBbMPOEWCSaa+HvRhwplWsCVBmVVM73qjLBZraC6BKDQAHDS3Wj7qSzfZ7Z/MDlmwmFHolWcbR4x5NP/uNo7PUJayw/ivFNpuvIEEvzg5EbPL/dbzVylqEvqRfEXFP1jdRVX0k493PWizkkko+RlZePxSn8pjxZz9VjYLij48FRqGx1XzhS2oyGKvI1xRuPnGr8cf32muHItJveXJWa/cg+tOO9pRMpZzPxDtUVgvOJz3cfyhFBv3KxXBZVd126OohwohIZZELxvzaEIn8SOZAEdFXUlHopejTGK0GzBiRg+5ag4qFBjjtRFyjD6SNBtQ/cIvi9LDwrCxDwkffmGyt4XnkpS0+ZpFhrsSRWlYVA10l/CGbCkm5G2C58467tOmMQZng3bobIpNDDKnlgleHzyCRP+UOVNShR0onZGXZo0kgZfFUI9Z+/eTTduTWTncf44FquAnX2FeoFQfKM944YFri12I9e1YttQG/Bx/vVc7felxpLrQh8i5cvA4jtTemKlI9ztUZRB/MHUmv9GVrvZ/v0dvmyFf/8RsC6otB5rM/gG+rHGn42yAslqX8yRCruHSBVufNh45Wq3KsyiS8bUqH/ar3OSwm4Sk2rpzGj21kBgzY8/bYJPULFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(451199018)(86362001)(8936002)(5660300002)(316002)(478600001)(41300700001)(66556008)(8676002)(66476007)(6916009)(36756003)(66946007)(26005)(1076003)(6506007)(186003)(2616005)(6666004)(6486002)(2906002)(38350700002)(83380400001)(4744005)(52116002)(6512007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w40mjNBs4Ybe+XRMJ6GRIVugDyqWI2LFgGv8hUfPXxUdZn3rBRDJDZ+eZAIR?=
 =?us-ascii?Q?infIjf4/qn+IvtDn/nxUSsBJ5fWtISVR+jbgp3Tywp53atfkj1DGhE/rEouy?=
 =?us-ascii?Q?zZ+B/1hdDy9ca9woU6CBCvH1V6hLAK+sLMDbzwnZrHmjvHyjSj8t75OrQlVA?=
 =?us-ascii?Q?s2LFvKlzEemnjkINW2jNWa+Z1+epUuBaRG1ctDEFOxFfstqFehMQDZstw38B?=
 =?us-ascii?Q?Qf90Ldw2vXdNuOZoHbEAE1CEdv58/G4FUuJy7hJ+xueaVcngkiWVZik1ndQs?=
 =?us-ascii?Q?S2IwVNa067KYH4CaLnDbpYNCLDCAJnQvlU2FTecdJrY6uHL5K0yHpCPUworI?=
 =?us-ascii?Q?Yhb0K3wYbzVGV/l8mBiFphhQj75Oj4zN4PalR6++kG4a5lNo8nCgfhpDnIyQ?=
 =?us-ascii?Q?XiLYI99WDv9ZSKpFPmwpE042kNaYS+mwCThjG+TmXb80pjSPOjibatcZ1Oze?=
 =?us-ascii?Q?sx0EMe/Y5dArU0pdp4opbctqQXdBH2Qzpfaog5iB3g5zKzF1NPq2sp0u+LTr?=
 =?us-ascii?Q?NumtChP2eI/YmuIWkGt4Q4dOU1Q0GJaRiRbWDwsy0RMo0GbtV5HhsySDatFF?=
 =?us-ascii?Q?w/cVcdj1Bsv8QohxVeKhGBVkPpiypC9LBUakrUTfWYOzEc+KwqygOXKpqn85?=
 =?us-ascii?Q?yuTdmZ23qhUfHu+CquJj8tTeOZv8eB3ybqgRutUucPwOp/8Mf67TW1EaPmG+?=
 =?us-ascii?Q?pPQ037BKof24eZ9Vl+c3Jx+oqNkog1tzpIrj8uMNe3KbB2JGAYhLPJJh/47X?=
 =?us-ascii?Q?EOm5CC+c7QJKON4L4ak21H9arHrrzaJhd4gSd1xbTTio63w3YSagIG1qBDrT?=
 =?us-ascii?Q?qRFYSJziARqw8RJh7n8Y+ga1iieSVuz/OIk37C3cPatCRC6rsI8CcQeNCvKh?=
 =?us-ascii?Q?CcBl6Cyxiy35wEF5n/555DwAWYUFSr81tyF0hSfYhuTL/dOn5/uPZldnz9pJ?=
 =?us-ascii?Q?dwkqVxIUsXS4uA39WwR3oZQoVBjwDnjuXEygrKxNoDBYFb+0MX5AW1LCpkvU?=
 =?us-ascii?Q?944BcAU/nkiRLzDrh2HYIGghE5S6EBgJ2OE3+RgJQDcsMudTsZZRvW33Fz54?=
 =?us-ascii?Q?SERZSH07WtCpBb15kJxOxZvUiDwUyhBZhITcrZz5WEnAukahh5iXiHjy4hQ/?=
 =?us-ascii?Q?BUEPpWvA2GCEKkKVMB+zad0j3FGWEsItShWNYPb6wezVtzkrUYl0Ff7JpZHz?=
 =?us-ascii?Q?ivjZjVk4pF8NbcuMSXllDOWLDH4iv69JaoMk8sO//sIt7mOQzAvPJyjSqYxn?=
 =?us-ascii?Q?M6xWuqvHUFE1f7tNjF0lozr+wy4j4EC/A/aJzrreiDpZvFsuOBD5VLHfLiaA?=
 =?us-ascii?Q?aL3FYfondRaNtaYDpKpiPC7f1Wn5TP595v93LmMGznBXt9VJMRk8it4Xv0ve?=
 =?us-ascii?Q?6qRGi1uMx6BnAccQoA76eACP4XgnK0+J5dN+lWp489MPo4AkrlTOyezhGHdK?=
 =?us-ascii?Q?l9DRukSQPEbScKUZk1bMgB8c9pkwVT9a/0F+EJcQ7HfZoc/LBYZRW3exQNg6?=
 =?us-ascii?Q?aVbCqtkNR6XDWV5WeiD+MiwhKZ7+ZTJ7HujFGF94MIbwphVC1tcecCtCtgLI?=
 =?us-ascii?Q?BClJ/BRSKnkumgYoT3DzV/5fI0iWYsfxfKdMOJBa6TEirRsuXJDlqcQdEBSa?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ef8812-2b81-4b94-2cce-08db10a863d1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 05:32:42.0447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlsAnFYlvA9Ti3FEAgsqmVkwz+LMhOzdaXMf/lyHNcInU6xZrOi7BTjKXTLt894ZGNFGidZLR8Zyq9GYbBEv+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-Proofpoint-GUID: Hy4WNRvRnHXvrcsKCj8HmbxjJEdafGB-
X-Proofpoint-ORIG-GUID: Hy4WNRvRnHXvrcsKCj8HmbxjJEdafGB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_02,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=597 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7861

For cri-o, libselinux is optional, this can be seen from
its Makefile. So let's make selinux optional by using PACKAGECONFIG.
In this way, meta-selinux dependency could be removed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 66d1116..7af698f 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -39,14 +39,14 @@ DEPENDS = " \
     ostree \
     libdevmapper \
     libseccomp \
-    libselinux \
     "
 RDEPENDS:${PN} = " \
     cni \
     libdevmapper \
     "
 
-SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[selinux] = ",,libselinux"
 
 PACKAGES =+ "${PN}-config"
 
-- 
2.37.1


