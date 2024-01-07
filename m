Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5B9C47074
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 12:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14478.1704632188437453154
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Jan 2024 04:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1736c9399a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 407CuS15011116;
	Sun, 7 Jan 2024 04:56:28 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf78m8qag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jan 2024 04:56:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHfbrBOH8ELlHWVr2tAnteEy3x/FgcQXvifvLMmNlZyVC7JfGmmZEXh9ZdGQwWxiauTNfUWigNBnJHKJmVZcSPQAGPW6t8TkDErEXvTov7UTx+g7KGobSkzPZDQTBPwhrmFSf/IiNDLba62x6rjZ9Pco5wgDJeZZlRTvm4WewW0mVzoj51IXpkfwLfNnQmEl0wu5r5O1hP6pSwfNZ0Nv87IhvcdKIU+cQfHxhqdGkGZOqTELr6xhBX9jmegVcNUsZkR1ijUwPh5JQ+nHGb1g3upkCqnJf9z+di/iQBLA4eCWm2ZGESPlNWe9wLsftuLydlJFV58lF7J0BWce//p1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ees38qisVaSbuUB94KLFuU8MFSJ+j9ngeE5Og/z4a2c=;
 b=TrlUGEHOiuAD2MsDNDwX2n/YSOra6T/2uyl3mbeLCFw82QPWXhJ27OY+9D4Sd6FV4fui72nFRwRXXW4wcD7FmoY09p2xNw0kCPhIM6REUnWfGCm8UzMLmRe9pK3G3Uw9y0qE6jo30Gn36JNsUhUcgnmXVfh4rcwX8GanSzKW23VLbywWFrTAJnMB1Bx/9sP6ce3Fyonw6z0KRSay/M2YYv4fQVygf4EzrI7DcDIzGXPGd+fc6KhC6wT7ea/PJ7RxUeD89mdIosTlm1CLfg9L8RgqzwN3ef4uZJL44QTIIVOZSrvHzDQJ4hFbR5AFh4IhMzp16CUJRneXGO94Ru4euA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN9PR11MB5305.namprd11.prod.outlook.com (2603:10b6:408:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.20; Sun, 7 Jan
 2024 12:56:25 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e%4]) with mapi id 15.20.7159.020; Sun, 7 Jan 2024
 12:56:25 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/3] criu: add cgroup-lite to RDEPENDS
Date: Sun,  7 Jan 2024 20:56:08 +0800
Message-Id: <20240107125609.3502113-3-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
References: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN9PR11MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 3274f75e-7d61-41d0-7052-08dc0f800e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zvqt8K0qvKzpL6GAb+A80rMRVIOTqx53v5sw/BI88wV1pva5TbupkDRdjsLNIKYGTiXKsEloh5mfbWjHpLpli5xFEJ3nDpxPgpiXbxeSbrx0SFaZTc5LfiX1JYVaIszVmmVjFO8fMHKP7YgEW4g8QpJ4FUtQ35fV/Lvp39rHGIuoJWk39I9KTGQDbZbmqTGSVtNX4CabASr8sSFB1kWfaKUHove+EkBwTbllNKAG5IhbpbV6WskCcoyxKdYlNBK0eYnyTJDsaXys1LWkOCE7hzhLdweG9ACx/5MmX3uQy4OhOfPlcZcoSxOm9ilfdVvH8yOSDw7pG6xnVm5FWfmXdo2+prlin1/gL6Hq5Jz376wCrmNVSGaXCmxC98GVM/Kuc2smuJQuBxaPcSYpS9fxSF0V3ou62FZzdS8DVCeFzxZFjDLM9EUDJplXn/yhKBxLi3SAOnCrbpPsRDaZBnevz9cQAkiaWs5vlIjNPJ/Tc34lhn0pfkkZ08J4bze886TzhyXDnQzhbnn2LkkUhk+QT1nNDCLtwBagq6TXrgxeJY6xZsDqjVjL2ZmNCzVcxhcVsJGtB5c34/K9AlSEkKYV2yVhlevPo0Io/dYbfCYXwo54wjl4SIFIB3c5zYJ2j9jJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39840400004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6486002)(52116002)(1076003)(26005)(2616005)(478600001)(6506007)(6512007)(6666004)(83380400001)(5660300002)(2906002)(4744005)(41300700001)(66476007)(66556008)(66946007)(6916009)(316002)(8936002)(8676002)(44832011)(38100700002)(38350700005)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DONBo7VqBaDTfXm4yGhandAj6cFtS8h/sc/ev9zOS/KCK+Dh/DJNbW/lSuAR?=
 =?us-ascii?Q?Xu+ctqzpaKXS3Wu4jqwWiFAuoy+CGwcimvMsMLLPJmMNVRr5r4pCymeyZma+?=
 =?us-ascii?Q?KzFFhUIKMM6UzKUsMXGVz7ZIMmEB+xy5lkoyI70WL4b3VLN/8cvDlCgrr3A2?=
 =?us-ascii?Q?MqgyPJZzFTfMq/HqWHrdCQgg7LwxCIUgtDDajue2wmXeTC9WdZCpz8HLSZJU?=
 =?us-ascii?Q?X7Is6V7K1qKQkcRcIaihp5leU2UPK5XJWnBUn1dWOiKRa6xttVCZ6+nBtn9g?=
 =?us-ascii?Q?Toa4pN9MEgQyj9ymmjotCnjSvmuIEe1evFCveGCoh3tLDjC/n/L+PElJeyDc?=
 =?us-ascii?Q?MH2mA22rdPxfSOppe5n8s8cAIjr3o3NpcNv+Uy5btwnx140Y5ewPxSaYVoGs?=
 =?us-ascii?Q?+QXNcvH7PdZufz1dECI08ApnnIo4AQgBc54xohM4pvROw0zs0ftQ52XpMBEg?=
 =?us-ascii?Q?JCQXmuIvMGgwO5pJljTrRjKRjWLX+LeaGLx7mFwoT+Y8khoK1Dh9lZ4CjllH?=
 =?us-ascii?Q?gPKXUjKrr78NkcoXPk5uxo9kc+sVkncYWcRsSUfd+1ZQw/4XseGeJXbq1JIz?=
 =?us-ascii?Q?vN3iTwgQmXX9WczNQyqCqYwmf563sMjC/0T8ngqV7UEMKxJb++uU5eI038mr?=
 =?us-ascii?Q?WBx21o217flJvKBAGEvtVxBLlL3tpP78M3K/4tgf0BSVLqtUMg/psfViR9Qo?=
 =?us-ascii?Q?hUpDzXOnvAEbQ0Yty3cvEhiu5Rp8EdYb4mnhkAFx1Kh3hIHH/g+i4RQGXNDZ?=
 =?us-ascii?Q?LnRTwdQfMXBpokEVw2rbR01b0HNSaQO4vS+7jkq24Tj4IEkW4jJi6MtJKO9W?=
 =?us-ascii?Q?rC/93Bxz10Q1eAMfgokVis/dCw2azW/p+gTeQFXzXW9e3DIqn0JPLfsKvsOR?=
 =?us-ascii?Q?gVVA/8fo0ZZ3rF0xyWX+Wg/0b5Oztav+VvtpjSAcK3gBV9LsVjVJ+3e37K+3?=
 =?us-ascii?Q?zqBYX7yri8LRi1T5yQq1KnikiQ+AmqBL9JOz34T75qYc/gRBoeB8vbWb2AZB?=
 =?us-ascii?Q?JQMxXAPUcAHXFIOQhibVkU3dtk2FxOQvjQicibtzN5yUcHLI8g+H25oJHjpp?=
 =?us-ascii?Q?9+Ey98qXq30UFDccda1WHM9v89S0W0YwHCewj0GF06nkLLQnVCZx8cfCx2Eo?=
 =?us-ascii?Q?Ua1PPaX86/CcMJv9vOONhfMH4cFbByfu5ypZVtFTwefyV4HwSnN4GEAFq3Z9?=
 =?us-ascii?Q?4tEw/1JBrxaPzxZiJvaQE8mpmTFDKiArhdUGEkXzGTBcrogOuoPldczrppuc?=
 =?us-ascii?Q?tNuDBu0MGsuEOYkvog20KeNr644vBdYZ8+h2mSKTwy40RWdVfaVYvaWy2Gtq?=
 =?us-ascii?Q?eKRj0wCpeBJeKR6d5tFPpCFfjkAY49Q/rG6zdOUj3XXW5T/A7+VImonhA6m2?=
 =?us-ascii?Q?JqTOXdMLqbUZ7eWBviCN1NfuvoCM9LQUKBSLy06gZvG+JzceLiDyYBubp7cO?=
 =?us-ascii?Q?5lVvU3TyfP+XZawx6VPJNwN93e3EUTvSBseuLAv/BH3u+5zebC6NXVBwJXGD?=
 =?us-ascii?Q?EM0LKkGH4jsSNzCE8K3gfqk0kApGBAMyXoraOcz+z2KqsyPtH0h+X+UX6jCr?=
 =?us-ascii?Q?Zilct2cBn3wu6sU9uEofH/suIwKJ2+VouiZqGuI94/9gWutlv/E6SIoYU1q0?=
 =?us-ascii?Q?QA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3274f75e-7d61-41d0-7052-08dc0f800e57
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2024 12:56:25.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVfg4g/9d91k8Z/aiN6ATwgIeNT4HO/KNPO3eUpDrVA+JIJzL6ixc04ysjGxDNmjWzDLm2YAQCGTkbdGyhD7zaSgUDlnuBkYVg118yuUw/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5305
X-Proofpoint-GUID: H4f1WykdKpDt728e3yVDvkQPd2-DF7t_
X-Proofpoint-ORIG-GUID: H4f1WykdKpDt728e3yVDvkQPd2-DF7t_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=657 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401070062
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jan 2024 12:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8528

From: Xiangyu Chen <xiangyu.chen@windriver.com>

criu needs cgroup-lite to init the cgroup configurations during system start.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-containers/criu/criu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index bda0aa2a..0ff5850e 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=h
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
 
 DEPENDS += "libnl libcap protobuf-c-native protobuf-c util-linux-native libbsd libnet"
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN} = "bash cgroup-lite"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


