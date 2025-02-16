Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1029C02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 08:22:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.25638.1739694129457142628
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 16 Feb 2025 00:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=414280514e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51G8M8Fs022299;
	Sun, 16 Feb 2025 08:22:08 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tg51h0tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 16 Feb 2025 08:22:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udRdxolsC2aej1cU2+8TvP+4oDI7rKhiXXYaoPl6qfqWYxN21azhQoO3YQmRsp8SmcB60pCTV4bzPOibnybUyqa8BTAul6dxIKUXO0jn5T6QQ+9N9XG8qh+ONfBMJB7rKAiECu4NUuP91Yd6as31T0UHb6qbxpQA6PLnFJ048xFofMIj433y9CutLnmNVOHQ0tWoxYSK61932yqfpTQea+J4MgbS4KODVPi07tHiN5WV+PQZYCOVAqugpAWc/jnFA624JWcw5MsQXRIWh+nIH28SfSlcVEZmWjElkOwhXUu56pWXjZamrzCqL1mbCHLRR5SddBvr0cLTaY5JcRGKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78Hv3T9bPSTL1l9BmxwphkGjqLRv2xLTGOsC5aSWLi8=;
 b=Db0uJ9oetYf6r95Z0bY+6TbzOiQVKeSRVX5pCWZzMlb6yg/hzXD+i1Um15oNAfwhutGiuJJ2d4K3M6FZaaomTubjz2ZBUDCgSccPunKqSyb6OV5Y4tL95DMRKpCli3ntASDGqm7cdDii0b9/FtUkdd8v2x2xLA5wNjFQuO6iWmlDq1ciW454GXFQVpM12GNLyIljcPb+QoQbYAP17qwMCWMyc7vNbCZIqNUMWdlOPvnx70w2+VhredE4qTesX02EA8ixADrOXGzv5LOvXCR0m2mLksTR/Gzb2nH81W0T3eqzvXlDFejzms+cV8exAAsXPSoKFHCiZdUS/cndDM8kMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sun, 16 Feb
 2025 08:22:05 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%7]) with mapi id 15.20.8445.015; Sun, 16 Feb 2025
 08:22:05 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: disable lxc-staticdev buildpaths checking
Date: Sun, 16 Feb 2025 16:21:54 +0800
Message-ID: <20250216082154.4066352-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::14)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM6PR11MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: 16607b90-a3af-4bf2-2dae-08dd4e62feeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H0YAoWZPMCiqER/W+7cPQOy/pDHFT73cDMKgFCYiRP8lJkaHigOnZTjfb09c?=
 =?us-ascii?Q?H+Ku5Fi65VlPOboONhz4BACqXR4AGJGZfgpccIzhPX1gaD10kTptzhNgdsAe?=
 =?us-ascii?Q?IB74G3CH3mCryozGsw1qH7TukCCNgObcX0urv91to04iq5P+R7ddA+2cHfSv?=
 =?us-ascii?Q?/K1zPa7+LMMe/ps/Bd94Jo+HinO+E5rxqjd9kZVBU/mBn1h7Ex4r5pB3/Dom?=
 =?us-ascii?Q?ImsEGEdi79FnhDDN/cnDOHv+rO/Rdn7HqbaGtf3DGnbju2sv+DyWNjucxk7s?=
 =?us-ascii?Q?eS5LaD0LX3ypQ58YpAwq7fZcNl8YsS3YkuIvDtsGoc5+m9r3FdHcvYVr6y2L?=
 =?us-ascii?Q?B1UKkLbs6A3fgkpfG0frtqmqQkAaq3PElQtqqKzcND7DGyzXcpUv6MhaGAkC?=
 =?us-ascii?Q?vbloLSQ+uWH+Iieu35f+86xQYnlW3m2R5mLHONCRJqDJ+bHKke1iZ6ORi07x?=
 =?us-ascii?Q?80Mz4A8UlzthY7MCTZzr+L8Iisr/BUuMPCvp4Quu7+dYuQGai/9FgC/d17kO?=
 =?us-ascii?Q?9D/XQZGoSYHd1w/QYStejzGgjeBU37sa3NO8VHulCBrXGIZZiLOMCKvk+maG?=
 =?us-ascii?Q?ZuT/ryhI8VnRcs/jnqAFfAA6Yoy96F+Uz5OfEY6b4dTkvRtSxu4P7rtlDsiv?=
 =?us-ascii?Q?5myGDDmSwabjNigEv0AiMmJU7wO1dDGBBnCqCHZVUi3L8tDSyxy3xvgqoFyz?=
 =?us-ascii?Q?ZKXrCGaT1zeAWn50vHlGuvSa67ubB7klAhE/f/n4nACvfv4mtkmCjLg9uFg/?=
 =?us-ascii?Q?ti75VOdDl6VByj/gFEda4xboKhjP0fTta2b7K1YMhYDGN6320rM9d2CROa50?=
 =?us-ascii?Q?VnIe+TO1FUp8yhZ0wqYzBDxgEN8pscnlSfT0I5SXsDrB3VjNIF04h2WwpZ8n?=
 =?us-ascii?Q?pRPX26s+n6v0HCefggm969PvZvl+AKZhsFGXhyNeSVsAjTLqEjsuS6BfCc5j?=
 =?us-ascii?Q?bRkw3Vc0BvyAbCtKsxNsBrea5iIo32YxA9S+NXMgwBZg+DlIoSi/N4Xis1dh?=
 =?us-ascii?Q?Ljtrsxj7mPiVPqwTtFjeaMpLQgz9aXgGO1jFumh8qm9YLllD74QCUgWjVGOb?=
 =?us-ascii?Q?rm39BgZ/Z2Jmqhe4230D9gPNpN5xhdvRgM5mI0ViG5Sr7iJ0fa0CTTjcbbw/?=
 =?us-ascii?Q?NxlpsRy+0F0F72V5N2wFwcTh/OE03RmrCFI4PnldJdhxIVaBxOuqzkQbj4EX?=
 =?us-ascii?Q?UpygKfQONimSHKBtR6mBWCnwJLpor6slAgqEBNPNVk4wEiTmG4Z/eyhi/vJk?=
 =?us-ascii?Q?7Rainlpl+fWGcDq4bLagcHlIuEV8J8xlqtJrCGJ6oXFAZw+SnOYzKWBOC2qV?=
 =?us-ascii?Q?icyjl2uqDecGeMygUHjLyNxltus83+Q1spWFbbuPT+wh3GxO3DIjh7PAONgS?=
 =?us-ascii?Q?GUS1dUg5NXoX9hSLmGy5x/+LQ5Mc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lGemiF7UcpXuAwe4cfUDRIueD4PhnoR+uNVVCYitRnUka29P+ot3j6oefhDi?=
 =?us-ascii?Q?bUAsCQEtYlV7cNany74Wprn+Mfypz2lLGudNGbcQ92CiZDGCJ6CTjNn/ntJz?=
 =?us-ascii?Q?FDxgOqcjY/b+dUmY1hApYP8OYMFpPr4d3Qs7wG/cm+WjXSbsGjv2gKKRgrnk?=
 =?us-ascii?Q?JblvMyoCODjf63kUM/p79FUJSZwcAIZ0td2wJZvG2H+O+Ec+dCJ2oui+CD6O?=
 =?us-ascii?Q?EfStHTIs2GN2h3805k4JhS7uVn4gdEWtUbYLuya1SSBfcuV42BYssDG52sq3?=
 =?us-ascii?Q?wjHlfDuCKKGs8atHNcZXG3n5hs9oeWfxZ0hJbJV3XwyM9zp+alA+aLAs4E03?=
 =?us-ascii?Q?ztYcR9Cfmf3J0Z9KfLfvYTx5GGLqLOQp8yuplEkLhZtNmzce0TnocVqjhRJX?=
 =?us-ascii?Q?BYOuDm6XcZd+8eTWgIbJIDryMFd6B4b5/7BaMlurmELfqedzsOCqhttd+wQE?=
 =?us-ascii?Q?5kOfKIuB7NaqVnWJaS5HzCm+gdhKlb1rzGcwYGzPoqBQ7MXQSwWrNca1MwjZ?=
 =?us-ascii?Q?5XFigkGj7PsT4AYLlBzcOff+1vkzIJ6ekhmuGNbHgSyR0c2f08ZtVqZA2jG8?=
 =?us-ascii?Q?mEsiL1nxfUCQZ/mP2YK5j9L9B9gFkRt+3NYCJXMCRZDxb7Gw3n6AcaTybDLt?=
 =?us-ascii?Q?N/1kvtgHaTc5AlJXwSU/jaM/7gA3TI1NUZOI6STiO5hkJr5h9f0rb0WDwMjH?=
 =?us-ascii?Q?fq/QueFWKOCHhsyZPP6XQTcFdWw/j3cKX2l2uO3cFlOeTkH68IMms2++N+1X?=
 =?us-ascii?Q?DzxPIJhYAZ7rURdhrlZ7F+hruSbXoiZXsFf+wQGxF+OSUPYF5jRoJZsi3Sqz?=
 =?us-ascii?Q?nM+yiVowJAkHiAfkEpbnX2zsvKgR+XXb2hpdq5DaYzuF2hp8SlX+7s+6cFht?=
 =?us-ascii?Q?7GXzxoM2C+7RZJuNBOPCtnZW627g0o19s/NHVUoACKcTy6AdWmqlgmA+L6H4?=
 =?us-ascii?Q?lYi4i/K2I/sggWBi9BHLn0HtQRENLJm+ecTvyN0gj7afzAv1cQgXOWHk22y5?=
 =?us-ascii?Q?9l6LkkS67TmOsOQ0zFfnKWV01YfgauI6ta5s5+T0U5CEDKurl5RYjApKRYCx?=
 =?us-ascii?Q?kqcOCeLzQetO/ZVUhcXHbFc2Z7BB+Ut6WvlZPv9giMFLiaW77NxScMLKAQs5?=
 =?us-ascii?Q?ULjKUChoTiIQ67Ykoo5JFgVq5BJaBGeMKoaqAnov7SPviSSueStvWnppO9wF?=
 =?us-ascii?Q?lUC25CF8Xw2gGZDspw5PTzusAJnQlmMSkxHZqVps06MAjSpWUJK2cygdVlPx?=
 =?us-ascii?Q?0stMo1tZHJbGbQiWb0Z5TyiwqbqYZspCSO+nfG3/79xQ3nQkwwZ7/QUmiJm5?=
 =?us-ascii?Q?nFmJnwDIfb7+owkqkcgEPFGFMIvHfB3NUiZdI2zEChg8NZ/U8MmOctCslUy1?=
 =?us-ascii?Q?O24hCgwMYxXTBY9rjRhJ3Ks2e8Cyw7bB8MgIo7KVDAiXZMA37j5Xg6zHzJnD?=
 =?us-ascii?Q?1p/Y3+404f2/+x9cSgr6/EObvboJcoCZ6VODR3pOnU1Pb2YaXsuxmoH+scPs?=
 =?us-ascii?Q?FxJC57f2a9/VSWSHNHOWEOAhn8BoZkO2dTFs9pVErKP4ocCIZxmKkUB+y8s1?=
 =?us-ascii?Q?54wgiLeoPpdi31OLFa4TV6jb9BrQbhpJg+Gpx3OVQqAG1VfRVT7+m8HJjnHq?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16607b90-a3af-4bf2-2dae-08dd4e62feeb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2025 08:22:05.0253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWqxx02422Fbujyx6WR0i3cPSfxlUDc9Kupg42+TV0nEYbMbj53fqWJnzSapEumYtggEW2t1mPaOQOZ5Es3fPFva38Q5XfCJ47QtnoEdPf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
X-Authority-Analysis: v=2.4 cv=T4B2T+KQ c=1 sm=1 tr=0 ts=67b1a030 cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=_Eqp4RXO4fwA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=6GDjHxXoiJuem0cUyuoA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: xx99r3hwYPiZZ8ExpevHdDlHaPUiBYmb
X-Proofpoint-ORIG-GUID: xx99r3hwYPiZZ8ExpevHdDlHaPUiBYmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-16_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=763
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502160074
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 16 Feb 2025 08:22:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9142

From: Xiangyu Chen <xiangyu.chen@windriver.com>

lxc enabled the ffat-lto-objects option since 6.0.3[1], that
liblxc.a object files contain both the intermediate language
and the object code, that cause yocto QA report a QA warning.

Ref:
[1] https://github.com/lxc/lxc/commit/277ac364074f8287be91393f50f8f999d51101c4

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-containers/lxc/lxc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 1655e8d0..fe713a0d 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -127,6 +127,8 @@ FILES:${PN}-networking += " \
 #     am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
 #"
 
+INSANE_SKIP:${PN}-staticdev += "buildpaths"
+
 do_install:append() {
 	# The /var/cache/lxc directory created by the Makefile
 	# is wiped out in volatile, we need to create this at boot.
-- 
2.48.1


