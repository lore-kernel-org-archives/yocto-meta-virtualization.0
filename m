Return-Path: <rong.fu.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B865FCD5BDE
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 05:48:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13751.1779860877152181403
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 May 2026 22:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XgcPy2j/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9607859bb9=rong.fu.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R5HGhI2265464
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 05:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QA79OUrjblKpfeY5hmMd
	4RBOPLln/R773RC4N1PGaGU=; b=XgcPy2j/lFFbR+tHrBYrWXy6FGPyspMWTo+l
	B4Vu6AUZiH5ZR+6FlrgWRG7oUv0ZVlRINdI4EBB3XOi61nlAFY5SlhfwLouRlTUt
	edyOvgEp1Azv+yFFUJB/UucD3Ik4YGG6PogCGoev6bybU9oniJXXGJSbD0oIB1vo
	RbFZK1buvguc8UcOaCP8fmXxKQpLyVYSEkhv6uHGvRMHA+eTD8HpGFkCnjtpfbUC
	2d9thHY4Yk78LIttrKDbf+zquIxfPnRmYFcCa00rWsmhdqaAmkd0OUE2wqFQGOeC
	4kTmlHMUqX8pZPzhS/tJo1yw11vu3zlt/OyStcVDW9IGYfPGkQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376d95y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 05:47:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePX3mMc/3woJmAwNTDeMV0nU4+UyeF+v7enTSaqrJXwf8cLOlSLsqMjx7agMvPJzvhEb9F6fszTfbLlG5V0hq7sDSAO5oixlN5wTRra1eus6taB3BmXzJQ8ZX8hsPeWVTnMGgfanrFXl9+oN5cq0Is+sa0TKZW2pLspxecpxGRPTcmqkmCerB/ZOXlDMxfWT3vu1wFvNcsA/tEMA9DqGTVk/bCA7sofSiOTZO3s2bgr/lFNuDxog+v9ir5vkjuKvn8ZDNKndFCZiTGBStQzlCfUTMN9uUZ/F1VPCPZePgvl9uMKtrlz725wL3qpgcCxz6G97HFCoaJK5y0faFOpKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA79OUrjblKpfeY5hmMd4RBOPLln/R773RC4N1PGaGU=;
 b=y12dyoZbxwLFHME+/Pb7Z+djjAZlbgoNd3pGDOjkpb3ayqQwpHtaIl5aozP9kkKCaBFwAugMjQ6m+74+cphDpfZOnnBrhcBJCGiIXF/J/W4NBT9pseKSFN1U53eYbfVprguwjevBZ7PwpbirFFuNsacQybHp1o3yMvRgh7yjYhvYk30ErrfLH1e7vcfci1C9jANScEcFag3Xg+mQIdACPAYmnAsdXmdzoHM2Qejmey+xKzhYkON2MZuGoDrW9sXGpLsaF4Zk/2pPc0+geFsHkcORYo7b7l0dnOlWGsdXS8MDr1D5h8dlvC7dKGMj6507AY7B7GvebOVJ17On+TN7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV2PR11MB6069.namprd11.prod.outlook.com (2603:10b6:408:17a::9)
 by PH0PR11MB9704.namprd11.prod.outlook.com (2603:10b6:510:399::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 05:47:53 +0000
Received: from LV2PR11MB6069.namprd11.prod.outlook.com
 ([fe80::d94b:502e:dc16:ad36]) by LV2PR11MB6069.namprd11.prod.outlook.com
 ([fe80::d94b:502e:dc16:ad36%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 05:47:53 +0000
From: rong.fu.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] containerd: update to v2.2.3
Date: Wed, 27 May 2026 13:47:42 +0800
Message-ID: <20260527054742.2931429-1-rong.fu.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0127.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::16) To LV2PR11MB6069.namprd11.prod.outlook.com
 (2603:10b6:408:17a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB6069:EE_|PH0PR11MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 19836d8b-d97f-4716-14d1-08debbb37ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|3023799007|11063799006|56012099006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	he6xyHSBqiS4wLIviplQjgCc5KSHFKHtnPN06x7lQycpptrXZ9cRH7DZb7FTxQKzMsbBdFDU2zsLnxgyifjDvYjSe/1AIBHbOdI2HGt53R5WphCUhp0DGjXeKSxs7OSZr3qI1USfgOvTLHvFq9ONr/QNetL7BuCa0VkfJj/X4vFW3JDbNJlsUQJO60xkaUQjEGh+nVrUmrtvWVYoTzAaa8B+y8CuwErcBIznphwjeCnMliWTWTfJUs0EmeJWT9iZdwjUlcBWl2T3ZV41YQCUYbyQjPn6AZXG3hkElCT1XZgsbnOMV1qjNwjI4+7tIoyS1D81Klb0XhtI7ZRAAF5x9cC4BQUUEaaDdZ/0j5ZnVXDzrrxWM5DSF8tu7jXzcKDuPrmXSt7ir4jYbLGkEaxKvaZ2l7C2qiIwoxD1cfQb6Zniu+qQoxG8CX7FdpEPML/rXzldYn31UPqJZscN+wBE7/vmAdQuNbXE8S6Y9eqRvqLhGkiAycFuQSsLh9IAXYe12MxLy5F+Tk4STIFevXuZc0u2V6JfnBa4FGYc/zAQx3ZshXshB4lklkhkx53zfr8FvwVVR8UXF2hbu1s7+kFlfJdBYvfkhBUbvpBvITvLiCMODTTMpglMTt092GloGG8aLCA7Z2xgp34ehZmhCc3a/lR9NOUGDFzvToWIU/b+OoJX2A0gFp5tCTDBdI7Kx8ZZtyIrYZgioWjiqpa2AE43/QhHU46zaYcwfzeznhIywUWZEtpNu5Ct45QLM4dd8cFe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB6069.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(3023799007)(11063799006)(56012099006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?11WJrMHCWA3sfCd6s1Fju0PrzbpHaOeCzo4eqIgNMXfQuXh/nvaI00ITRWyF?=
 =?us-ascii?Q?PSlfj2asjqhrcRIz+FYScebfHiMoMA1a+yDoVhqVRo43ZjdIOTM6Qjq3wVPG?=
 =?us-ascii?Q?AE94dzw17dleGmff2vXXT8uYewP1eFrtU0sQCltJFq+FRjjFVBJzWan2PZTZ?=
 =?us-ascii?Q?un6E/WdqUPhc/ZcjRLq9+nsqkiAgWX58Nqf5Nq1qLxtvlqE/OdIGN3fFEuom?=
 =?us-ascii?Q?8zTDrqfleVsYDpXNWOiLDskbhzOOU4x361KWFNe4D/xn2Qwi4e6E5V47RcX8?=
 =?us-ascii?Q?G3KMRpe+VDO7FQ8CxXf/Y7JJLCtaj8lxs57kix5CKMoL+w8CvkHID9awtMYE?=
 =?us-ascii?Q?V1KzQAeNh1OvSdWf0iAnMdxZiKx+V+N7NvxVyGnlVmhC8iTGYxULIne9Cfbf?=
 =?us-ascii?Q?NlEg7t43zuQeB73EklYDdE8IrkCqDPsXmU1B5BpPOHOYFGMJ/aRxEHrgltK1?=
 =?us-ascii?Q?2YRaqzMtN+LWPYm0MHZo1ZdZti5Xcbqvq4annH+D2SJ9OXURfkCGlTZBSKYU?=
 =?us-ascii?Q?TNRsQsqvdD04FTz9OpRjFLuEPO0FwsgrhVVPdmowSz3KMcUkRpwuREeDr8NP?=
 =?us-ascii?Q?VHHAM62am3dvc23C+V+BvODziWNskNH1V8YVymPtd0x9wBgaYu011wGNuHEX?=
 =?us-ascii?Q?j2Jso9Nxl4NsnCUbFa4H5J1QkGYs+BwtKtDC1pCOlDCXhxyqDztdy8Kb3Suq?=
 =?us-ascii?Q?Gx6u7275BOI06fcOLyq48CMmS6/uro0/P0IHVOL7Kssjd0kXfT2L4Q0DvDiW?=
 =?us-ascii?Q?cBkNfu09bKM13FgdkKTwo1LWdF7Or7D0izNntoQqtRhx8qnm4EQhgpWhzBQX?=
 =?us-ascii?Q?I7m8k0W0qHEWAYzpE3ZHhyKJGjQ00DmYpwj/Dhbr6DDHHoTknA4M26mDtdYR?=
 =?us-ascii?Q?BskgfA4QnX6oRL7K7MEZ7XwOkEUl+dpmkjNdhJWRDLAJODQc5C+qwrkt5ptg?=
 =?us-ascii?Q?x4RKcqREsB6+k6DfxKEMMLtRCfxUt3Ytarus0Iu0z4LKJb7aQLhtWU+nTe6v?=
 =?us-ascii?Q?xZtVlc4awuEd0Fy22MuZRgxfMLJR/KNEtw3sm4tUyASFyQzVXPFyReM8sMYo?=
 =?us-ascii?Q?L6lbUSBPMi+zKSloq4oEltwZJ3nwFw1aMN34O+lDCVEdfBGgHxQxhKINOoVy?=
 =?us-ascii?Q?j4hOzcqqyUWC3b5WhZgGyP+Iz0ugI37DUMjAlHgK33yNcyZ81Ed9AZKbOlSQ?=
 =?us-ascii?Q?ubiA+9tqzlp9QGZ7r4UULFGj3gxEqpc6J9QAnse120+Gcd+WipgqnewRDeb1?=
 =?us-ascii?Q?yFK3L9KI7XLcyVpvmFx5wOKWlsRZjXKcHNLK8m3auZbYeYi0x599/cZ/p0k5?=
 =?us-ascii?Q?f/kSISk9DhQHH1Ry6WJwhNsuuU2HA003cccjAd1zpHfKt+dIsrI87G12/wOi?=
 =?us-ascii?Q?N8q9CHkn+w+q8SHGGN0jNaKyaJsvbWYgeYK0xPsJ6F/XGp+Xx0phLemlGLVN?=
 =?us-ascii?Q?pkTWFpbNX+TbNA/YCGrHH86Yq7TXk1POcG2qwQ00e1DNvEypHtuk8Wga8O/j?=
 =?us-ascii?Q?iEdHzx25t4b+z3LR8pGSztBZxGHS6WrsrJDj0MzOI55wxTEAJAPo0bKo8UxM?=
 =?us-ascii?Q?K05snBwrg/U9xz0rf8g7y3UNT7vKYAcz/29DusJGIS7hDo/Gswb4QRAOFoyZ?=
 =?us-ascii?Q?Y7WxL4P8eXlCWrrHPqIIC6SoXYBYsS6mKhq/D/NP/piDQ0+yNf5cQKvy/nPr?=
 =?us-ascii?Q?j3py0Qg/KLBE+2hTWWp3I7Dpo0F6yo23IHRmGTcDdApRVvLcuV+waHeSe4jQ?=
 =?us-ascii?Q?IGFynrdWmA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	bZLv0U3f0r3neP+K5pICttoPuQOMOSP85GaOcSDJ+hSZcPF6Eu8lz8Mnb2ZzMIyMHpHX5ne/IiPhKz0t4BHHevRNsdXaQTLMGURlZPyiP7or6z4PtmYkOuEfZwmWrtpIjMnVSkEr2sK6R/EUhdvekXUq8dJhQ6CZbljjF4eQVbFEFj6ANUHktn9RkNAbrBKRbfKEmDGDmri1WMwc5w4t8NGZwFhzPJdVnPjIwnUKR/dkFKGL2Yt3SyFS/5vXhU/sOjiRy+Sbqxi3lWHsOuKGcXZEwX/T7JI7kj18PAybr1xDM88TRewEyOe6gwfT9h4jBeLvvdtsGbQAj5v1O/kGEA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19836d8b-d97f-4716-14d1-08debbb37ec1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6069.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:47:53.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE41keyFHs+7PHhHdYOaFD9QiBWvF58ZVkMJom3iL0WcJkdZbhopHbNRkmorQwWpbFEw06apsh2iRqVZrkV9Rm5b5dJ+WYni8TaY2MAP1KU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9704
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA1MyBTYWx0ZWRfX+iJ6Hc3ai3Np
 vxtcbZKvADLPQQha+/bCz1fpH/Xr+04VLsVPPfj8ZExR2NQhQonDpUgk0MMhwrOOZs5klOfkJQW
 yuX7WWFHykvAJXbxiFWJPGYEsNfJ7Yh1mi5+44TYU1gCe1ZGNcxDoDKgQcg2jkiAgeFwuqRH5fz
 SuztgBUoF+978og8nWVt1MnuS8WZl4dASrEc/LMAxDFiV5dCDX9a0TL5FSebg9moYtyEBS2IkPr
 5JTfNl41V2TkQ6+rLRiewSKxAYLDtrj1QERWVCx2+F1K7dLMM39EoM6GszGqrbt1Ks4sNrhgQOF
 XyyRGrBL0alzRiBQRSueqopdjrJHe79bLgBProvGLOxuWHLcBT8voZmG5LNemb/VJnVwi6pKqh2
 F50NRombXuorZvnKr+94+nj5jsg0aePYnG2aKnSSmnkDm9sz19YzoDVfQM21K5v+uzuKx3aRBIA
 FUzVrw5+Hi6w0iwGDvQ==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a16858b cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=qtKB1SZKmkC5mqyP2_AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4BTYiV3pLQgmdS0l8waF97ez9XTuui8h
X-Proofpoint-ORIG-GUID: 4BTYiV3pLQgmdS0l8waF97ez9XTuui8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1011
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270053
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 05:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9816

From: Rong Fu <rong.fu.cn@windriver.com>

Bumping containerd to version v2.2.3, which comprises the following commits:

    8a0f4ed5d Prepare release notes for v2.2.3
    31bd34a06 update github.com/moby/spdystream v0.5.1
    409f75be8 diff/walking: enable mount manager
    1336f6c45 vendor: github.com/klauspost/compress v1.18.5
    3f33146c1 update runhcs to v0.14.1
    8bd1b74e5 vendor: github.com/Microsoft/hcsshim v0.14.1
    c6b0be8e1 vendor: github.com/Microsoft/hcsshim v0.14.0
    2ecde8cfe update to Go 1.25.9, 1.26.2
    be554f478 Skip TestExportAndImportMultiLayer on s390x
    660de195b Tweak mount info for overlayfs in case of parallel unpack
    bc9274a4b Add integration test for issue 13030
    c387890b5 Add integration test for privileged container cgroup mounts
    047a335a6 Forward RUNC_FLAVOR env var down to integration tests
    9b2d72ee0 Preserve host cgroup mount options for privileged containers
    5b66cd6a0 Move cgroup namespace placement higher in spec builder
    584205c2f [release/2.2] update runc binary to v1.3.5
    77c6886df Ignore NOCHANGE error

Signed-off-by: Rong Fu <rong.fu.cn@windriver.com>
---
 recipes-containers/containerd/containerd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 51d7c2e2..b5fa5b94 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "5957d3334bcaeddc2bd8e665f53cee318c298a2c"
+SRCREV = "77c84241c7cbdd9b4eca2591793e3d4f4317c590"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "2.2.2"
+CONTAINERD_VERSION = "2.2.3"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.43.0


