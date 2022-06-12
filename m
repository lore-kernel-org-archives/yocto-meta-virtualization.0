Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894BDCCA473
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 08:00:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.13860.1655020844769792570
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 01:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=V073tAFn;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31623a79e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25C80eTp006753
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=HUisPkykszSQ2smwv+L2WiyLyUZwCBR6mElcevIQ01M=;
 b=V073tAFnrBDK1gvK5XrOZljHSnNkrwM4ZHP6ud4Ue24cabklIPvHZ9o4/ro3lDfL+bCn
 HPaVNK+TFVr/CmEMYkggPCNrpgXBeQUB60k6puheDECcsi8xEXyUtV4fn7oml7H5yDXp
 IFKzd/AErYqjwVBK4jrmzS2bUX1v0/Kpav7C0fhqXDe0qLRhNQbBJo/U1Vy7z8aCL+8m
 nK8C2/waGiJ7d/K7y8KoB6Ofj0BPNX6gTHEqAORhAkSmrR6rX+VhoT6DFs+ZpYyleBQS
 +nOrVxeBJqv9JqM+dKTL8fZwVxzrC9Jg2TZWTTmkWbe+bA8e0qA21/NdebZgwub7GD7+ BQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj198pw7-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Jun 2022 08:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1qS+g/RShhA5rRoH2bFuBmTiKuhv5iMdz1voN1JM1rv61t9uiSxk4cSnxJ4jygSV3gDp7b3NFSfmXirYuaezqok6o+BqBnihL0y++0BCCrBZLpkubwoSTLazME+b+HiGfLt4zTWrOWyTHHiBzsXuZcx72w6x0M3d7JOHsSHdt5zCajP4zCi8NgVFGE6YlO7pEi+UmrLKn2Q/OeHHaJltKC+KndNjCl2NvhzBMnK4GWWEKOY+L9TpNux3RqN65QCgdCiF4hhVGfR7LYB1bovm1HVaCXAasiMtBriE/835n9V3O4t2bNqW7P0uszzfwBnBsTvwW9rdLbfSSKQWsMRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUisPkykszSQ2smwv+L2WiyLyUZwCBR6mElcevIQ01M=;
 b=YsO4SnnZf1MJnBBGOYF6zqOWzGwz4+RMlIpoJk9oc6DD9xlZo54RuS7h7TERHR/RdyADKkD2/73VLpODhapn7p+1FRuGcB0/Hu8D//+qQjQMJBztHu3T2th0hJ7voiJxvTevUG3QSpQ4AQNRYwAqDub6sHZsfk1ugReOSiyy4gbJSQrro9kF8YwEKf4/X/lPc1ilu2lAdK2PCxrrtO7BS1sA8e8OLj9Ru1v4Auhfb7og/olVwMmCkkV4xksW3uEWLXkYa6ZH91rFuRoS2zz8hTX1T3D8Dmumub6/iYCGEeFqBaQCwlfI7w3km3zcGwNfVB71y6qpPLiPzUlu8pHkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL0PR11MB3396.namprd11.prod.outlook.com (2603:10b6:208:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Sun, 12 Jun
 2022 08:00:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.019; Sun, 12 Jun 2022
 08:00:41 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2 7/9] riddler:  adjust GOROOT,
 CGO_CFLAGS and CGO_LDFALGS
Date: Sun, 12 Jun 2022 01:00:07 -0700
Message-Id: <20220612080009.130993-7-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220612080009.130993-1-Qi.Chen@windriver.com>
References: <20220612080009.130993-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c35fd614-88ab-4eb2-8ccd-08da4c49a489
X-MS-TrafficTypeDiagnostic: BL0PR11MB3396:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB339683FD5BC687321220D639EDA89@BL0PR11MB3396.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WqLKYhYhUdxMke/shSWarnMRwhrTOgZH8EtH2uf6j/GNphTjyPSrcJuSZtD8TVOLMu3mjQMKuiqPL1kXdKpzgjmTk84e/pCa8ow9CKRcZVPNRymRFQbwQ4z6ahz7bWP2R1NO4ktruCHw26OKkNVabsRRyGqLaG38h7xUOf4ktbMGK42dWzmywQUai1tj+5vT8UQuKU/2z7pwmTemckNNMg8zyJbaxzbYNHhigOivUy7g0fsmDh5FCS/54aoqyEuPncKL6u/DyPZREFHpEqAgBL6dBq4jdc9zRAfp+ujWQiiSkLuHEP/9Q0r/WNUq0JiOO5H0R2W3V+pXIlyViv69uo3QgKzp02hOS2TevFh4si1TV5rnk7Fz6iTDox8vEFSdFGvpNRiF0AG47bQKOTFty+qvrrbhTVOIp6voCjEh7M2R48DLAPV7PLg0suJG9BBQ5MVr63pW9U0XXacZZm/Ttn4o/DZ8yRSHURP6JIZ8HmuD9/P9U4l46YZEVpIeLrxFCeDbjeTj6AMxAVbu0xZ9ttUcUMYtUn+4rIR9X861th0YAR0wFOI8mACFOM6HP2XHSJurVXIYZsVzr4Xj6z4r7ucJCmSecfFMJV6FYTUPVFEsNSu+Qbn4hDPbkbKwyNFxmNUMQJGOyxq+7y4sfUrPE+jWM3PE818ygccvO26fwLdRTnWIhe2D+tdxBv4xnNMny2xYprPYSZ7vIUinnPZApA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(38100700002)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(186003)(38350700002)(5660300002)(316002)(508600001)(86362001)(6486002)(6666004)(2616005)(6916009)(52116002)(6512007)(36756003)(6506007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sg2ITpu5vNB+IlhCla36aid0HIzGBYNXh2kaiLIgDDPUIREmCuWsw85F85EP?=
 =?us-ascii?Q?2wtikca5srfzXqbqcTTQJ7OoET5B4i4jyOUzxFaj/AabM/I+v/G4+iGWifG1?=
 =?us-ascii?Q?Y0J546+hrNn+W2vEnkec1suaavKXc1n3VPrWZwfNubzbfzck01v2R8+Dt5jd?=
 =?us-ascii?Q?X9e3umDZEDlE5cmmiYf3htNQ2ApH6MyE0VYCxArwK5IkVUC3X8moZf1EbNy+?=
 =?us-ascii?Q?8A/DSWYxQuH4UtrPcoKEPbW0xe5Xm7WbFpAhIUO06y2iSLnUn4P0PXdx5gV6?=
 =?us-ascii?Q?UULZxdm2LsVvvDPy1gIKDNpdq3gTDhRThGdS9xVFpilq9dF5F+i6iRRHrYY0?=
 =?us-ascii?Q?Oai/1Lna47XdeH4odbQVE6z4WpJxG0RoN2aE+IO3MMu6++3o4pWytOBMVTqo?=
 =?us-ascii?Q?CEXwYvZokAMCwmcw6Dh+jJOMmmembdWV41sDzlGlSQ2P6PVUEpyM42kstPPA?=
 =?us-ascii?Q?jqRvKs4bHll5NvXTzRJmyAvRl8hOaPz3Po4uHJ4gwJ6y9apXbOLgJXBtGLCG?=
 =?us-ascii?Q?vTLCkirzhJlL5TgP5XlfLdIB+RnPfD1aAM5CfB4ueTnlzZ0vrV7ltiyDXX8e?=
 =?us-ascii?Q?NQvgCdYMDMf/GCg6yHt08zl3phDBu12Jyg9V6sEWEgNgG3riru+pW8x+Qdtu?=
 =?us-ascii?Q?F+36eacu0ZC+YNDWRs40E7wZWUW7rkDQ1RAcQfooSjtK7uFhLr1moQpk80Ej?=
 =?us-ascii?Q?yvmnaPojdljbf1+ToPqh4ymNRvgCp/UbZQ7ScObVwqTefFwb0nskZfz4Y5Mg?=
 =?us-ascii?Q?dsc68Xjzt2YjvqYWG+009A0LLf1nK+LwZRL3yWUTfd1NdddMk3V//7GRFn21?=
 =?us-ascii?Q?OMLtcRse/gqDdJH/u1xlaFrxZ9oJimN0b2aNHG2tokA1u0aQm/1dq7aroe6X?=
 =?us-ascii?Q?QFgdUbWsjKBR3r8W7kjqaWWCz78oGaIQ4U1jBRvRGE3bY/AoI22hA0tEuyAG?=
 =?us-ascii?Q?SPe3jWrk+UO35j1zkJ5CgoL/0UpZBmf0dBxFMDdtklE1/1SkxKW2sE7dYJDY?=
 =?us-ascii?Q?dE/MklB3WpAAyjG13cDC/5PFj8IH6MLcT+/Ac5Rae1CoUjzN1Luk/nGHYcFR?=
 =?us-ascii?Q?zDoy5dcm4kyehCHfawTmoZWeWKSHNfbhypVD277Z3yLK+o3Jcho3u0P1Ir31?=
 =?us-ascii?Q?Q+Pt1NWWHQpGCDKT3hBYXxvpef+NZvXF7EJnTvaoMjlt8tNjn69MWrvfAPLA?=
 =?us-ascii?Q?+qGBEhflcgKbraGqYvVGF969Wa3PjHB5rJWse5IdTX6quqbFn7iuyqjanCWK?=
 =?us-ascii?Q?Gi7CostEKdVKOJtLXqWjXn9jHYzzQdAoMWU8tYBAeMwJIR1cA7RCCj+XXK8z?=
 =?us-ascii?Q?ZWafuGkU/CF75KnjFTSyvvkx0dyY4pc+Flw1ZO/4YOWYXyGK8bJ7WIzniGJu?=
 =?us-ascii?Q?Yrnw2F312rL0vcX0DGKa50+D431MT6FrPRjBrIRnjcA9M571vkDgiBc4UcTS?=
 =?us-ascii?Q?GkQZj1qAqm70p0cx7uzwu3x/80MFJiZPJVumTx+ckaCqGg6ja79K8qzrODjl?=
 =?us-ascii?Q?BrRK3CueROU71DxoijdBnUp0U7wkoti4Jc1Gm/0VhwZCzHp+MVFW/0/vqu3a?=
 =?us-ascii?Q?frhEqRhnMAeovNbESWD1Eqc51Ko88ndUIZ3WTwyzMbu3IaG0Z4ttFmeVRXZx?=
 =?us-ascii?Q?mAU2pRVJjrNptOlyDctgygw8M/54O+DQStpEqpps/Sj/aNQt62Gip8k4Wok4?=
 =?us-ascii?Q?F3xRzA1nFiCPzOsSfBpuhpxJuPT7+iXsx0pXEOsSvzGJKhNBAjN7wuZMd4R+?=
 =?us-ascii?Q?b825hz7+rVK3K/D4IqJjiMNIcn4nJ8M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c35fd614-88ab-4eb2-8ccd-08da4c49a489
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2022 08:00:40.7209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wOD0GOG13MAS4V9oAN5XdJmHiCKcPD8kbtDQHErI655Zj1gkRqweCkuJU1Da7ayrLRDmsTCX1T3Mm+zqWqR6bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3396
X-Proofpoint-GUID: bCoR9r4m6IFYQI09jPHP6Ws7gfuUUP3x
X-Proofpoint-ORIG-GUID: bCoR9r4m6IFYQI09jPHP6Ws7gfuUUP3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-12_03,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=582 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206120038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 12 Jun 2022 08:00:47 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7376

Adjust the GOROOT setting as directory specified by the original
one does not exist.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags instead
of the nativesdk ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/riddler/riddler_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
index be751d6..e103331 100644
--- a/recipes-containers/riddler/riddler_git.bb
+++ b/recipes-containers/riddler/riddler_git.bb
@@ -26,7 +26,7 @@ EXTRA_OEMAKE="BUILDTAGS=''"
 
 do_compile() {
 	export GOARCH="${TARGET_GOARCH}"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
+	export GOROOT="${STAGING_LIBDIR}/go"
 	# Setup vendor directory so that it can be used in GOPATH.
 	#
 	# Go looks in a src directory under any directory in GOPATH but riddler
@@ -44,8 +44,8 @@ do_compile() {
 	export CGO_ENABLED="1"
 	export CFLAGS=""
 	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
+	export CGO_CFLAGS="${TARGET_CFLAGS}"
+	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 	export GO111MODULE=off
 
 	cd ${S}/src/import
-- 
2.36.0


