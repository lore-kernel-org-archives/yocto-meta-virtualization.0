Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7460BC64ED8
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 05:32:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.958.1676611967800617332
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 21:32:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=btfuqRmv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H5WkxC003676
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=xfESsORGg14tcLjioHO7FseqQ+T0PYYAP56YxUi4wEE=;
 b=btfuqRmvYb4gb3uZNCpfxY+S5PT+tU4XvCM0PHNNr087F6ndULi5HR3p/GOCQkQWgfH6
 Jy2ENx8hGRoMBE+m8toMg34ywbEdxTj9wOBJ5bkmPwPBb0Ew8WY5IyNn8Lu7JYZzf6pr
 Cq8gjrFBrwLBXJMwXkVC8yLqOTh0qrY+qXVzLu8BiWm24Q+IgC6DnC6a+lFyjF7mgJxE
 oIcR2r98CeO2LyH50GqPsUETEhS8+XQn4s/oZxsICZPxGlwIp9KIcqGw+vAcO6krf6FM
 IW0cG6+zRws+/lOSPOCtrNPNt0YJcqYtMrv+zcjVFfkL+QaHTEGufmrcTj4ovd8780+8 BQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc1ks5q1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbwuFbKLXTlw/ztQvk0BtLeeKQMReOACHomR1IeIBluBDqQy+PadW8J9ySOk7PCNEHIpVIv67rkHIyrfZYXEmElujZ/wGLJvWdfkG94iutM0Ky7t4ZEU2lJm7Zyb+vU4MXgqzGxL7KBvkqwJAc4wfUXK8Q6X/PaLJ2Moz7vYOMOgLctkKyIYwcbJ5m4bFmRFq/n3Wg8oXBVJEAlnX8Etk9sT5m6KQClFTbw9zquQJGPV6Xr0gN4tQIuxnXndaG28y0L3Lv6FG/6ynLktActEK+MkpF9FZCbyxNBl7seLkm343f7GiJmICaCcr0lYTHASNa5lO/R2bchoUQReG+cApQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfESsORGg14tcLjioHO7FseqQ+T0PYYAP56YxUi4wEE=;
 b=NTRQzjT8v1nSrb4Z5rFvzycOleWm/dPKw19gmsOlxYkFnD4Tx9C79TqOya471CqjJSlbCBIZiLC6a3slES2XDiMpHyStL8WFtpM1yHfs43nse5XmXam1niZhNNu1U5dineaHOvxLoQDinH9xSlS1lVGEhz9qtmCx0rbYK3qezMeUAduuixGcu+TZiMe319Pu/6Gl1uMISo7CzYk7Usp5ezwkHrTWUgmaCzUp05WC6snEc/nZRQC3JVjGdzyIHP81eRx9c4pqn7UUG50S7KwSqjAYjvrimmXdvz5MdZms+3VFgMoayL6k+NnvyuRMxGUpsN6Xf76j7VxPgJD6HG7FRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 05:32:43 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 05:32:43 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 5/5] README: remove cri-o specific layer dependencies
Date: Thu, 16 Feb 2023 21:32:24 -0800
Message-Id: <20230217053224.3870-5-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: e9027bb7-3be3-4f56-b583-08db10a8646e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DXQPjPFZ1fAAz0SDYrjjB/+fndIrqrlfMN3pNR3fZGcVp4suJSo2B889aOscFjSnvTlwRiILWPS0hd4tblUuWsyJ9h8BKJ6X1TPRZJR9/pc0LPRVuloSV6yXf3otLnF5nl0LiXW3ngrIlW6VATARV+But1sYVmeaJbOpKOs6Lm+h2Wy4Kss3DXAa5mZavU26lQgziQd1tYEcbEa74ocL6QBYeIh9bXwTYJHD4HE+fbEdAhspz5oiH6jXnQq+98gvHijGoWWppgk/kEZ0BAxgsMSgPrw0R2RzruMwdXaIRifGVhr+z9CATSYwp5F5GrVAyRLaFukYRPBYdvB9DSrG+tw9qLNbPBK7ls4+KYgPLRYhZMvw6U/6CsMaTtu/wgfiacWyFXQ2Ot19UmU6lp0fzY8qmtSxp6Qke45KMtZjYf1tnYGdkqbOIGD8Jq4GLkj91jILZUfi6qKmXapUrmRd+N/vUcdvR6X34rsOVRYD8sWb46Fz/sz+tKjKzBob9mrW9JzziSWI9PMA2wdLvBeohC+2ZMERq8FBuQvJ8NwkZK9TuHzj/fngzNlh4VuwuNQUVQzwxC8oaxpO9l501VkVrrSC5tCMQ/KYz4hDH9KWZmhVgtyzszRSmmB7c806R5XYsyVmG1+sHqcj9nDFaeVHpGg4RHdRG82HE09PR3ES877dvJA2qRc6kKOcrWmEcwqLamZ3H/GLTu2GF5bE4fx7cg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(451199018)(86362001)(8936002)(5660300002)(316002)(478600001)(41300700001)(66556008)(8676002)(66476007)(6916009)(36756003)(66946007)(26005)(1076003)(6506007)(186003)(2616005)(6666004)(6486002)(2906002)(38350700002)(83380400001)(4744005)(52116002)(6512007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3QwwL2nBnV9EeMmGHQ8Rwz3e1+uiAl4GIwQxP+WVCyY/gd65SmjpGgkgV6qQ?=
 =?us-ascii?Q?buwgJiZ+6VJQmThXiVjNyZJgRz9Sf4KeB3K5TY9Gwyxdq0Flto+adYKJmsI/?=
 =?us-ascii?Q?e5tUtYL8eirLeiomTf0Nv0DHphU+71SiC9+kxu24+NML9mM42jLsvPBRz+0a?=
 =?us-ascii?Q?qc2Ho8SX13MZc5Y2srCC9Z1lBmlZdSSDp7TCTwOCkKMKIO6c1hAd7+nLPoU/?=
 =?us-ascii?Q?CiKkPWgyRT6N2bygqdls2foXYDET3bt/hFZJXYI9OwZ7n8PtW+9CLgWbmmbq?=
 =?us-ascii?Q?nQdZ0MuAmPRgRQYhmoceGPWk/BiqsPtdg4GOuEMcp2fW2hwaNZhqB55WoGv0?=
 =?us-ascii?Q?978CkOojQQ6hob4vVwQ8C+mGusuTnGSgdDuI8SoQQTapM5ZTjgF/FMvBRIHP?=
 =?us-ascii?Q?7jp94stLL9CKCRbpyxYor8ekQ29QdF7pRc1SNN+yP2dr8mfQB87Y05GI3+6p?=
 =?us-ascii?Q?h1e0OFFtzPWEKEtfmuJwl469WuopGmbDF8DRG6Ff4CRYzAyoPREQ4tfLNrQr?=
 =?us-ascii?Q?xy19bg2VjjJArvxvNNxIb/Ecvzc0c5OLEMJtMiezdpq2ggOy7qMm2sdvZhtG?=
 =?us-ascii?Q?eptgIm1Ko9AWtcCawXRBYH1bqpKEFFkO1aNP0SQcRZ7D2LYb66wWhEvGK4Qz?=
 =?us-ascii?Q?rwMIAcF/2VkIhvFE/HX1SZkN0YiRy94bA5JUBKz1/YHJxAhlr0kKH7Fd/2Cl?=
 =?us-ascii?Q?A+5cWFQtBGNqfrQuA0ab7zgjvAXGIMC2vek6iwOTgoZo6P1VWGNk+6J7cXpx?=
 =?us-ascii?Q?NOAP54T0Kt5pda5KJNVGdv/kTJWPu5aBMqKOkzDxvPCRJPIzARFXxxCwsk9Q?=
 =?us-ascii?Q?2u8cG3KysF/hGk9B6b9vddBRNBukL+HFHytCW+qCHZkz/1wUznJoRg4UuShb?=
 =?us-ascii?Q?2dl0s4Hpkyt1X5r4xonwHBtxOemG9rGHtMVM+Z4sQJTlcq6kTHGYSN64fT+1?=
 =?us-ascii?Q?4COfgDGuOwwrLYXnmQ8dtRS1YxO2e+wnMGRcdIsB1djIlwvZuk6Ej0DVwguF?=
 =?us-ascii?Q?sD/R/KYoW7DZes2UfhsKLC1Aar7a3IZWrsCGvVCHVrQl6rVJ3/DYYb6yNVia?=
 =?us-ascii?Q?ZXc/LyPROySNhO5dae+mn43NiJUEGuScB9U6438Or+2C/KgcvmIjtP3npHBl?=
 =?us-ascii?Q?O1lQeAGTFz8kRdKhCwn0AY1oOGf9SdG4IFcLWZFwfI6jKmXLvZnogWBd7tUE?=
 =?us-ascii?Q?Z8R4c+R0zoZlus6vSsiPpJUUIiGxNh0gS5QX1NjCmXlFoqM7YU+2yYhSXwwV?=
 =?us-ascii?Q?9NeEaqSPOnQb/U/CVzfGknCArF7deydO0ZiO2XVTpyQWIQNDMx3lLuJJ2o5g?=
 =?us-ascii?Q?RgHwKtnrBPEAT/dh6QIPpcl+nlsA/97zdQIQWypJeBl3DsBQF1dFQp8JCxkG?=
 =?us-ascii?Q?mmyl11m+mPFWGBfY1PmvcYGSXrG/wFLqr2Zpwk8Tf+piRw/G5wFsXaUqMzrV?=
 =?us-ascii?Q?+8KMkrR0JisuBqr0739h0pp5Aqm0szmzXpYNBR+oTgqLyKAxOh3am9OMCcPk?=
 =?us-ascii?Q?DqYdeEQ/VDbnaQkb4TsJfgQ/LlNPPgrKfp8WFwULeSGwy/ufjKo63Dkcrz6c?=
 =?us-ascii?Q?gicn0v7P1zIm+zdJJhhTrf+xLUHz8i2bPHzYlK95qAlG8rcGJlvgELIxi7TN?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9027bb7-3be3-4f56-b583-08db10a8646e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 05:32:43.0771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwBONWiS+HBjViGlHey/slATcbjqcva0erepRndYpHQ8lkBtdWLSsGG7eQRqShyfZbwVvJHrqlx1jHJN6yC6LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-Proofpoint-GUID: RjJmTltybwab93c0sEEAgwddNV0e5eev
X-Proofpoint-ORIG-GUID: RjJmTltybwab93c0sEEAgwddNV0e5eev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_02,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=699 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7860

ostree is in meta-oe, libseccomp is in oe-core and libselinux
is now made optional, so update README accordingly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 README | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/README b/README
index 1c75f4a..c2dea27 100644
--- a/README
+++ b/README
@@ -67,14 +67,6 @@ branch: master
 revision: HEAD
 prio: default
 
-Required for cri-o:
-URI: git://github.com/advancedtelematic/meta-updater 
-URI: git://git.yoctoproject.org/meta-selinux
-URI: git://git.yoctoproject.org/meta-security
-branch: master
-revision: HEAD
-prio: default
-
 Community / Colaboration
 ------------------------
 
-- 
2.37.1


