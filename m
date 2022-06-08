Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882EDC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 08:44:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4273.1654677889992488038
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 01:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IFE0CY0U;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3158c8d3da=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2588TKg5019902
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 8 Jun 2022 01:44:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ObSb7QAQRXBoSYdzX4LEEQwfoTaNKtNRgTIu41CBBXU=;
 b=IFE0CY0U26rFRBXZF3YLfyZeyrZMFZlXdO/pyWKHB/oj1W1/kavK2thW0CzN1WOwxZlY
 MxKUjSwPidSPp8X7gewTJN0dhW5qvxW/fgSx7bTddlEaKo+mUG7Gehl8B0fmwyVsWp7n
 2pNiAUIjbfxtHVzzRNxOjdOfEmFaiSTvXwAucuFT/kJACFB8BlvEmklQ2rjV/Nll7s8u
 9ykkfyu9aIa9Hlm/UyIMR6nTAdgDWH0av7mncSW9YFR0Toku+HKypig+Z+MWORmAM7ob
 xsnEWExHP4dHk8B8WnOYk4+gu113KU1vPIzMnfsBioHonnDUAoAIzuNQXsjnB3Q65ZVc sA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gg6wmapj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jun 2022 01:44:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEGtbUHYoHaIcuIeN+pZU+Bbre78gGFmXGw6d61wly9hPa/K0r/BxTx1i3aZvvt+zlAEyVUZDtlYUOpBfFfaxZHPKiJUnv7DbPryKITWqThMKxKWTFRUPdJFp7t+Z5h8jiYCOkEDpAhMW/fwoVH6NMq8hzeGzIrk3eJn4AwDpF7oMbJ9Ym9TsUb7WjNNYLxHg76c+oJupSig2q5Wy4tjDfcuy0Mc3YNLB3mIhrDe2UqbuFu5WMag41hWxDrITv9s53yQ9aZbHLefsO2stdxabDoOWGnvyqFnvkfoVxMj5JpXzp7ampvNJK+4kq4bMMx/BjFAwoR4lYVFsz1VMK3hcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObSb7QAQRXBoSYdzX4LEEQwfoTaNKtNRgTIu41CBBXU=;
 b=lpoXT74UN+Yqjw4RvG6dm1CQiY6xEjI1UXm56JIdfbuT6Ri0ePgsy1RjbZ6xspjOm9A49Q8UiaSVqjPWOkEem83Mj1wHhbblnoyg4YDtTGlkAF31hf0Qt1hK0MVIYhgvbQDx8OYrZdMZ5raUKJoutubNbQ94OopFFwzvGfqQGwYvH7gedUB3N6ovYjPmgu+MLGaLt4O21ZvamxcMGD5TjRuI0zsgN8cPUAjX9C2vX7gwDGcLcHh+dDUNg2MDvZ5myb5mMzwn7vzvwQu8zOIp0puf6UXphV10uzrmEHYUYg6kHceOm+vmv0JiAXa1hi9qQAME8s69T43UMoljsZDxXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH0PR11MB5267.namprd11.prod.outlook.com (2603:10b6:610:e2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 08:44:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a0a0:842:e19d:e5df]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a0a0:842:e19d:e5df%7]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 08:44:46 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] docker-distribution: fix the inehrit and
 systemd settings
Date: Wed,  8 Jun 2022 01:44:29 -0700
Message-Id: <20220608084429.58411-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0045.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e00fd07-4f39-4583-439f-08da492b23d1
X-MS-TrafficTypeDiagnostic: CH0PR11MB5267:EE_
X-Microsoft-Antispam-PRVS: 
	<CH0PR11MB5267DD8D2AC686C882E1127BEDA49@CH0PR11MB5267.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	He70TMrDZ2LbvB+vuv0fqY6V67HW605w93exkSBzapPyvbSNBeP5p10e6RZViiOLtEtNAZv6LAJWAANBe6fbro4EMhkqkF8cD0rz/Ip8ta9c1hoVwKFF5PrckW1H6ZojGKhqRVAg1x6gJVPmWrBkKPtxDsacPZn3nR7ZzkXjpvwl4RiKTi1TbVoH3Mpzg/Urujy7Eh9s05K5ivG8hTmehjYWDSpYuixfmx0I1ud32ZcHsC9COzoUkPSuIT8mbdtWraknG9eIjkJXmgJfXxv+1Y/d3fYuY3lVLGSzHdCUAdLgLD2Bhs45YBLdnA56DJ5qNIXHxG09Z4yg+IxurVwZ0x22J74RyEAPElpBpivhNzHaypF9kiqh0ltJvulJjDN6ho7hE5JamohYIkp77cAEUvuDmjGFHtKaxKFBRqnWBwo/CelRUnVgfGMAhWXQ/zLjjVky0yOqtfKT68+dCH/C7d8Rjgx9E/r18odwqHX0TlwBpzerkREH+z/WApT10tP9ULOvBz29uEDn4LRRM0Yz/WXwfAfNPwPCQYe9TmJqOHBU1pZhMUv8OAHJbjvy3QgOC6ayPpzXGZ0M03OTy0r+EcHA0+37boWH/ZF1QWBUmQDLHCqEPDKbziriWsIIA73th4lKVMZH1hZbVTBAK6s2/lRcAJfZkcU0mTkU8XC1mIs7MKkF46JVc8g2cQBDN/kVr7rt1ygAM2Xndxh4Dm2Kfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(508600001)(6506007)(6666004)(6916009)(52116002)(66946007)(66476007)(8936002)(5660300002)(186003)(8676002)(38350700002)(66556008)(2906002)(38100700002)(316002)(1076003)(2616005)(26005)(6486002)(6512007)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x1jwPY822b0aw58aCKDFQOj0fTCXKSDV2CABkvkZFDoFq/73RZ0+mLfX+thF?=
 =?us-ascii?Q?yGHSSiaqNkncVBi385o0bdMMWpNBupKELOSmdVIY5HfbGEtxDLjtjhrnRIB8?=
 =?us-ascii?Q?Je4XGAow9IkL1+RTK2H/Rp5Uf/CraOK5E5CvtLnQB0hRQOc/cw5VCFyPRIMp?=
 =?us-ascii?Q?K/l1i/wmkjSFYO6GlPRZ2kII8fdT6h8nGyyJ5JVM1IRzeBbcOV3A/LIqY12f?=
 =?us-ascii?Q?afKsJJKB7lA/EZE49y9hUCE2hFFwxL+UlwgnjA/mNp7FttNItx50AXQtFznn?=
 =?us-ascii?Q?JD8eib3GlpfMJbobsa5ZTc3dkEsN7VWCQV6UEBbwaWX98oHrBDPUCEX0+VEQ?=
 =?us-ascii?Q?j4dZj0+SDMBSOnaKjF92LLb/P4p/YGbkD15OZpkhdNXIkJKROjIE2HkMMcZs?=
 =?us-ascii?Q?SzeGDL+I5V2hp1eccQO5uNWlZMl5NXwul92Wp4NH9nSOpyTek+ZANri7y4sC?=
 =?us-ascii?Q?9dp08TNwm+H9iX/hZoyKPsEbnCF7a/hIMKDod9YdFovgH6swW2CnAGyaReO1?=
 =?us-ascii?Q?zrgwvBOk616Tn2Z92LhoeunpJg076M2rV6SVP0WTc8XpxThhVwCY30AcFpfR?=
 =?us-ascii?Q?WB5jXqQrJwvf0Epjypwtv+8a+bgVh2FdRlhK3p2kuy8L+MFJ+WDI4QlKMqtD?=
 =?us-ascii?Q?E0Bd1KjBilL5QDroEbK2V2sQbVtEKaPyNXpQQzDsiDMnO80J6dIDuNgwbAjO?=
 =?us-ascii?Q?MtYaBTutpWPcwXj6W21m8eS5rzApObzVr/8gPHIk/DQvmOAw/MBe1ap1MEGu?=
 =?us-ascii?Q?YSkdt7+QfK2V8Kz447p1lxpDjuU8jatZOeYVPAeFazjhEUbUZVOkrIcDPrwJ?=
 =?us-ascii?Q?zFWXi69RHllP1DJw0LPYjuR7ljmfnPNnay9YPLC1RSuXpwI1ixXSyyPYE52Q?=
 =?us-ascii?Q?vGew7p8/Zxs1fyD6pGR8Fj9C7BsdhTUtZJXOXkBjgS8+W03YbHpGO4hqZgJj?=
 =?us-ascii?Q?Jz5WnjXrDleZ9JEn1xGbwIwRrvMpgxf/h0FtJ/Q6efFil3pqH0OJpMg7zeBk?=
 =?us-ascii?Q?gszP3tXWpud9u+sVpfyeK9JYM9/JFoOpBusKx3rwBX0KVOQW6HWYCDXvoxhT?=
 =?us-ascii?Q?o7a+uRDHl9c4VM/hK77xQfBfEOS15yOxzjiZOIPI73WABNz04N/u3/Jnumco?=
 =?us-ascii?Q?mBblU9jI8IrKL8toHMwjNB7ADjb0psiI/MZoJ8Kzpejs0c7cnjx3JIQlV0Vc?=
 =?us-ascii?Q?5X2B6K38L5Y+IcvMlyb1KgxeYvdouiEm+zcPZwevId2NFsbuR3mUFHXggyPk?=
 =?us-ascii?Q?97F02XfsOgh9hCiEb+bGaG73wG12fdG5aP4D01TGk/lyPlzF1URG0ZUL2XZ+?=
 =?us-ascii?Q?mUBuvOQiTuOF7SfZqYzRXsXghOXhgdRgrnSmVxcsim2/voW9VbYMBP+USa3G?=
 =?us-ascii?Q?Y6IF8hkDDW1VrPyPSaGl/kii6rXxKa88g5/3VFIlmlGYmJunWcckbxN3Ti4d?=
 =?us-ascii?Q?8jDmVH4tAInU/osnpjFAECKrmNwqBt/xtzI9lPHRYZOCx+1GMi3o2XzmnMaE?=
 =?us-ascii?Q?hdahpzjDN8Y5gOVUMw97x/hxB0NO5MZFy/S+lNXhiy1Kdb8ZzpNdDt/F053l?=
 =?us-ascii?Q?9th0RMwZnhSBM7xkE2R/d1LeoDx47bU7PRYz8qyYwyJdXUEiHOGjCcM1beGb?=
 =?us-ascii?Q?bCgeYmRNc4vRd2Z4FqouqEIy1gJvFYyriuFT5zsydUcsp/MpARA0rtgQhLHM?=
 =?us-ascii?Q?gV8ECfnJd62V1G2tI0/xEjgoXJrQ4QgK0LwJ7eQN+iEVDvaoz2wlhpi5eFml?=
 =?us-ascii?Q?ddb2coD8Ym1E4yvhm8cmFVtASUUUmH8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e00fd07-4f39-4583-439f-08da492b23d1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 08:44:46.2651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +RyGnGyKZwtkVrHp127ebjkls13dx5s7WCCSEDTIHhwVb4yrCVL/dfuoQ3TOj9XZbadNMOdBHJr1XwpJiAVLPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5267
X-Proofpoint-ORIG-GUID: b4Z5P4WSjwfvuIrHYBHGRe1-wo67__zb
X-Proofpoint-GUID: b4Z5P4WSjwfvuIrHYBHGRe1-wo67__zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_02,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=782 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Jun 2022 08:44:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7346

In order for systemd variables such as SYSTEMD_AUTO_ENABLE to have
effect, we need to inherit the systemd class. We also need to specify
the package which contains the service.

As go.bbclass already inherits goarch.bbclass, we only need to inehrit
go.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 95e2b66c..1d074bf3 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -16,8 +16,7 @@ S = "${WORKDIR}/git/src/github.com/docker/distribution"
 
 GO_IMPORT = "import"
 
-inherit goarch
-inherit go
+inherit go systemd
 
 # This disables seccomp and apparmor, which are on by default in the
 # go package. 
@@ -66,6 +65,7 @@ FILES:docker-registry += "${systemd_unitdir}/system/docker-registry.service"
 FILES:docker-registry += "${sysconfdir}/docker-distribution/*"
 FILES:docker-registry += "${localstatedir}/lib/registry/"
 
+SYSTEMD_PACKAGES = "docker-registry"
 SYSTEMD_SERVICE:docker-registry = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
 SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
 
-- 
2.36.0


