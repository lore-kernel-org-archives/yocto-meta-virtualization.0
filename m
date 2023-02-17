Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33C9C6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 15:28:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9153.1676647704570983557
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 07:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n4mCUBsY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HEuLE9021606
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 07:28:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=sMF7Rfjy3FqnN5FXpjPQ8Xld+5/Y11zkjgIwW+GdRBI=;
 b=n4mCUBsYQyScoswhyv9Lfl/4YHzDjo/OAd/KUClsQWMUm+Z8uM7hZy1420DVqS80ucH0
 d8ct/B9Jg38CQpr+nRK/GLI0sUN0CY43bkHwCd1pjX1ZQnViRrK7oUMBq/cAA6FVfyVy
 d4hPVocJvIZqlVmfXyeEFhA9MQgWLypoNDUUGHBT6v8V0j50w8/+9eLk+sEYQUFApADb
 LCu2vCwI/rvMXFJjZijpDhCeQ60E8tPnqQBBMxkK0B7O+ugZw4JYW/bjxe4WW2xo/WoU
 K6+tDhZA66MtQIQnB/0lDbMW9BuF6v3q2qju3rd4gg5Iy6rLZW5rK1M2LT8FggKiNLkL Vw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsbxaskjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 07:28:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEiBTVNE9D8IK1H9c58uOGInYFsPLhH1yFt34rwpez5KlyGoaVOzdadET3noXGxJ9/4H0zIsM2yDGhsasWzurEOXRNheHPYBBtinz2C1EnqiUQTq/9J2MU5FzX2Xqg8YvCXBUWwIdQ29QW0PagsxEIyU/mUjkG4J6COTD3pObbiCRdmum/0mjaRIK+M2StgwFLfnvqkKF9o7wNcbRXg1K4iIyLsZKwIRS6N1mgymiClp2hsgL5+6R15qtG62bIoVFy7ienVNMYOz1cxSYn/Dab5ww3aed12kaX8IECPtnueUZrKBM6CmiOVyB/a3xMBuWFh5AxYnce5HyLmi+zeeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMF7Rfjy3FqnN5FXpjPQ8Xld+5/Y11zkjgIwW+GdRBI=;
 b=hn3CsFyLalD5dgh/ENlDWBLm0BNwVwewwJcVrfbg6B2U88i6RJibPQYulLhlK+qBBiXSpbmrfyS2THHmLhpQsI25lIazYzn4PkAfbkOhptBiXHBJ2CLCap+QBsXSWmzFzsu+KQvrZYYw6JR/5xAjMXU7RsqJrKpIN9hDn72M4L3f6UKvzomm8jESHSVbIr1NPhl4vKsM0Lii4t2hBXG70FajzJBSrK7z2SOwyVpizl0I59wAiU3SW141isK8zNaNUlcj3PSXOSw9MxO07Omca3fDPxdNoV5zRjy/866Z4hC5Q54dSNEFEvWRkitsG7mU4sZo8AdZQSJR8vCAdn+x5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 15:28:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Fri, 17 Feb 2023
 15:28:22 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2] cri-o: use PACKAGECONFIG to handle selinux
Date: Fri, 17 Feb 2023 07:28:11 -0800
Message-Id: <20230217152811.73348-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 6138bbd6-3df6-42d3-e10f-08db10fb9aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8lQBMKFxcEIlGDMv1EwP+rDi5IBuTmUrRe7KRCiP3B9D/6BOw6KiURY8nunFXp9ROC/+OKLsgNWnR3EAo8sLFbu8T8XLBQ9qWNFy/HMXdxqgHLe7pY20YE1Wmeq/ld03ijciPHCZb6SobBz0F//lPqRLtwbGXcjnGebtZmHcrX5gE7mi1doTCDitcINl8ZsVYlTcoNSGJsKotemSiN4wGS5sb3+VME3jMSn6bxFQex8v4PFqpkwf//g4pmUyY7GqOPZuqZqa4IU9hXXIKUNZlIx5kDpDWs8FcohHuSE+GN5LK7JPr41sZSh2vy3D6xbtovfY0iyLcl8SKfl9jKwlSF93vmnpkX1IKGCZwE6MUeuqJAMotxZwrKHpQMHvCNWyZwPtpfLzlObFjAmLcKXAiFPsKETmRszwlW4sBzNoth9uqLNQWTrTvbhpYhZ/5T4NXC4tkeI3xSVxwAQ5kYtG/pG+ZEfo9In+lZyJS1awsNraUelTcDEd/ljWFWYnZEhBjIb6jHZNSsdx8qYTxSjDqj48yRLweJV3epe7vmKluYzlL7EVAmV+tgzRKKdwMPpShJF6hFvQr5YT8Ww6VgFzNM2PO/nT4VSjXCr3HxhlYjA5x8YsWJG9WWtZZhAlOomb/IGO7M8sNqr2t3CAZV9togwpjsd5NCDLG3hdRccfYY0/Uex9CUIAJk8LLC68SKSvaNNqhOWWC7R78YWbhOvDNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(451199018)(8936002)(52116002)(478600001)(2906002)(26005)(186003)(316002)(2616005)(6666004)(83380400001)(1076003)(36756003)(6506007)(6486002)(6512007)(86362001)(38100700002)(38350700002)(5660300002)(6916009)(66476007)(8676002)(41300700001)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+is3cxhWpsI+o32VsELYzbm6MKGEGwyo16sTQI8kt+5Tg7RRS98jRwDe5cEN?=
 =?us-ascii?Q?K7Dn6oO8Jwp5zh2jbZuUfb+8cT3hwaA17PZMW76wP97fyEkfhcJhu8jo5Now?=
 =?us-ascii?Q?+pbL7gf4JUGFRPbkPVCIqeqIC5G8mogsWlBR/Q9ENeWl51ls+52f3lf3Ye4L?=
 =?us-ascii?Q?fJHLGqUH7tXa0fEl3MjDzZQwNIO69IbQ9v+U/pMLy5L+wK39QbUatYeMMTsH?=
 =?us-ascii?Q?uzq/q4vj+KyQIeihaWm2D3u8STNTEnVDnBy/vVLiBD1igZf3zvkQl91haCD9?=
 =?us-ascii?Q?gozqJKN4zjIU+Kp+loS3QfDUOr/zJgSnh1F2Y00hUoff5cQFWG7WXk4zjO0/?=
 =?us-ascii?Q?fqj3JIU+h5hlF4mzNzrVgAmBMOHzxeB3wmDujAnz/Rm/pFVifJlNWffEl2z0?=
 =?us-ascii?Q?OkRyoGOtC+bhOaA5EUythjKOFBkihQL89utK+0ro+FDD0+cPdcW00WAWu2Ze?=
 =?us-ascii?Q?Tu1aHiPPyxIZcZbbgbdiHfPCRUv1JSA978DgYSTAyZDKnkamWIltdC2fOgtf?=
 =?us-ascii?Q?jnwPRLKxt2tBNuU+GWUzvjMWWAbRTRpxChxDMZdESYxm8Zgi/FNNJN2CB/08?=
 =?us-ascii?Q?ftPHHfs47BhMJ2wrg1PQf3vknVMGWZ8xr1UmhewdIa34cK/y9oHK76i0tTd+?=
 =?us-ascii?Q?iqMX/Etcg+ZuXiGKOT4UxUgn/mrEDNpR+B2ypUOSJUe4p91x/3dI98QR9/EJ?=
 =?us-ascii?Q?Smp9Tc2NSkYxsLsinsSCtHNhqmBLU2P+5g4o3HLWdWzXKrocp83VGNqulVUS?=
 =?us-ascii?Q?11co+NTiJCsvgbjKQgifdmGOQx8Z87bq7G7Q2Ajnx458CmgsU4wE40xRAMUo?=
 =?us-ascii?Q?l+84zsjlzlLyAohxAaG32iDGiQgzP/UlDukn12dJBdzc1d8DSCa33To1PNQ7?=
 =?us-ascii?Q?W0AvAvZMN9X5HxKW9TQtfii04BQnG540h3Yq0Cq9L8MMGgNvRn/PsPqMpQPh?=
 =?us-ascii?Q?GCLQllpuRg82aHC71EQQKGRj9FQ6Uy2CT6jPmCIPUmRmo48K0EkoqUzLB9BA?=
 =?us-ascii?Q?g7iXdo9+y+DCcL3ut0wSSw1/yhAD5WBDDT7C5kcAtScyYkKL7zkis4uGfjjI?=
 =?us-ascii?Q?w0H0JcmFJ9sGQFyiqEB47Avlm5IXAfvAoBXuKWzXb1hhnY4qu5gc9F6/Pqwj?=
 =?us-ascii?Q?/jlOibypeGImJZs5zrAjwiF1Lip9bFXAHW1TAmAGQBUz+hWfh9VQYR24vK6x?=
 =?us-ascii?Q?WEzjT5M5nfj6/8Av6nv2enLv2BdKYj5ZCg1la+PFPx1imfBryz9/yvQX3WR4?=
 =?us-ascii?Q?s/XpIQJTmXz0QkRK7BczUSolqjmvhCoEZdQSIQ8NS3xYGU/+A9dQwxUFikrY?=
 =?us-ascii?Q?RkhRc4EHLi7vY3I+NcLKx064V8kE8kNZoxjkPmioxMu9UbdehpJ+oU59g66K?=
 =?us-ascii?Q?Ly8uXzY++FwKz60AFtDo5Hbq5Co/aB93NDAxN881wOPaIOJB1GaVoGgJdnFv?=
 =?us-ascii?Q?c7ZAIVp8E75bMuU3EZ8Ol2XZDCY+DDXDamdw59aG3qc5eSCAYhHfRmjQdYbg?=
 =?us-ascii?Q?QRGd3JKGXCI8vdYUODECQzrnJyyJ5iQMs6T72ncT4WZlMJ+9U2F+t6z5IVja?=
 =?us-ascii?Q?6DUi7nN+/smyWbm3GH1aFC+j6X2Dcp0crQvOaa7g2j53v4lRd4WLaFZ5WgpT?=
 =?us-ascii?Q?Kg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6138bbd6-3df6-42d3-e10f-08db10fb9aa2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 15:28:22.2133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvs+j5F8dCnfmz4Pp+Vu2fEYidsENoHX5vSK8WnsxBNC0JWbWlGZ+x7XadCZk/X15c+t0COWvukejPoC/ART9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
X-Proofpoint-GUID: _5nvEMLyUnJFh1l_LiZe7uCyQUPSxekQ
X-Proofpoint-ORIG-GUID: _5nvEMLyUnJFh1l_LiZe7uCyQUPSxekQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_10,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=709
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170139
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 15:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7875

For cri-o, libselinux is optional, this can be seen from
its Makefile. So let's make selinux optional by using PACKAGECONFIG,
whose default value is determined by the DISTRO_FEATURES. In this
way, meta-selinux dependency is not necessary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 74fa736..1557671 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -40,14 +40,14 @@ DEPENDS = " \
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
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG[selinux] = ",,libselinux"
 
 PACKAGES =+ "${PN}-config"
 
-- 
2.37.1


