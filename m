Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AD0C87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 09:26:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36342.1753090002598390501
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Jul 2025 02:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92974f89d0=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L6t24r1250193
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jul 2025 02:26:42 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sk3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jul 2025 02:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyUI2fiOBSdgQkTyJw4nht8PDkNjobEQnro1kx3QA8q50aBzNtIEcDZgu5WDmxg/J43fQ0biwP2ZUWGuBXbcDR10BvTHvMxmzEJsDjsy8SGE0ljE2yVsp3wmIY5Non7ml7XWDQiAZY40AMSrRtU0hZ56G/R3FlCUMgG6Q/QjVRpZ2bDxT3GBbWsk4BBVFDv+qn2NZByy0JaX3sWgMakLUgLNa7gRGXw8SvYzQ2n96aSBJ7d8BTLUdEcqh5a23Owzo6naoHpMtN14PePyhpMOW6v0gn86PWbHTW+Xk1M6D+KWrQBU0PZhXHFokFJWPbcqKWpKrto3A4BcfArcc+6QgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2diafv6p4HW3yhjK50Ibm9Vs2CzYbOABZu6H17iZvsY=;
 b=ALgOjVg29+MHpwgrqz/D82JHtmL3FgzMUsUDnw81LUYoFnDNmU1xPZwpBsrVrB5mOLIdoLusiMYiR4CnGjRXIrWSVXQJhWo4/Q+WbaSYXdhRYdLQw34s6cGrwz+FaTNdEt4f7I14JzpalNowEtXDrxwPDBvqxQhmaD1x5GOisBRryZeovG6eQSjiwTIHJWTFDbW1jNmDX5TDdOi6YbwvWqVd/RDruXiF/VKl4/qzgKbdqVtKADs2qR6abX0i/fBFfdK9IWYFHv6ZXgjhtyX8ngGWyR6V68NR+2HRxqKpxUI02ahNnl1TXGlAZAV1ef71KCoNzD6i224F1fAA6leoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Mon, 21 Jul
 2025 09:26:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 09:26:37 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] skopeo: avoid overriding GOBUILDFLAGS set in go.bbclass
Date: Mon, 21 Jul 2025 17:26:08 +0800
Message-Id: <20250721092608.1271610-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:54::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4553:EE_
X-MS-Office365-Filtering-Correlation-Id: c4083bff-ef08-45f1-bcb3-08ddc838b152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+esSclmgB9K3ieYi76IB8bCUCyFVhbm7Bzu6cT0EoP3HzUmIkoHx/q6f4BA6?=
 =?us-ascii?Q?P+37w5Uu8GpuKLIeykSJ4U8QIjBPkkA2TbpwUlQNe3nfF4hMxU7RAJ1MyIX0?=
 =?us-ascii?Q?oIQCAAlIlblwbKQy6p6y1bbiYQuRTOTkrCFiPRgw2G7QCagX9XSILshlLsGq?=
 =?us-ascii?Q?ywLmVPzj6rtaI4eTKfjCr2thEQIKgh3SjkHJni/QII7NoaxnfFuaE8HztALA?=
 =?us-ascii?Q?boiftXqW+QXGY6LOhqYhlf95zztkqA4MRRFnUkqYQaJIXsUqBE9MSfnRrofv?=
 =?us-ascii?Q?I9cW0z6RaL+hQntNm0rS5+QFVSh4B+ELrgwUZnMgbiqbYdyLEHGrFgWcvoCH?=
 =?us-ascii?Q?+uxpeJzOilmrI8eoAjQchk/e63S7Q6hh2pyUVOkIbU0omJ3zahPXox2zNYsG?=
 =?us-ascii?Q?7UZbAt7+fpJrduUU044IgJIbMAEt1tOZYh03NsDiDVnCGW/1SuR90MrTPQ7O?=
 =?us-ascii?Q?TUolwbqUziOCFPannpxVrYDO0Wgqa18daeDG3h2lgfbz6XDdZHAIOA8GgDMy?=
 =?us-ascii?Q?n4nUn5zqpkHen2FUm0yr+7TUwvRjIb0QXoYzbOheqXm6QQ/j1lXFVkb0h/sG?=
 =?us-ascii?Q?Q4XwrP4SH13j0reQubboG2tXm38qK6503mcwuoSSIl1/vS4aXQZN4Dz74njC?=
 =?us-ascii?Q?Kk0+yJ1EMkQmCYIJyR/oA8wcYrV3BGepr6nMJzQQvS2ALSgJrE4FDyR4TMLv?=
 =?us-ascii?Q?+kX3cwQXFnbkMBQpzKgSeBtWCoz4LNOliI1g0Nps1H90RMqERXzbKSitxToV?=
 =?us-ascii?Q?BtNI2w69RNAdM6UTHJYcPfXETJN70oo+ghEePU4X/FpAGDzBQvsmlPCwZYoR?=
 =?us-ascii?Q?7tgKii0h6reG5dDvNPK1tODb+zZfuG/nauXC/X8LT9LSQVGtKIvJK7p9ULIe?=
 =?us-ascii?Q?stIOgxfdUt7Tzq26Qtrz3q4qt2cYnfkkuAqVVt5MA1LAvqtD01fegKyBbp54?=
 =?us-ascii?Q?5LRkPeddsRPOrUUore3DM3X2Vc/VDbKBpp6TBhGNFbILEEGFrG3cVkdfI1fr?=
 =?us-ascii?Q?9c+sNPcxGRskohJ+OJXvaZtVV+Ee2CwyesWx4mAzsOfRsxGv1n/lSyypgWwa?=
 =?us-ascii?Q?zbLS7WdZ/qoiWy0z3fIjTwwi61WJbSaavsjl0H5EsuN5yNxO+lfwvmq6pNvK?=
 =?us-ascii?Q?00Xw9fpscC10psrOxJ8DK0qp7iRY1o85z7OaZZal8YCkwTwmTnA5mZYVppsk?=
 =?us-ascii?Q?2wNvmFIuSDl8EDuKGin4lXnvW8g/YJsmHI4xjs0TwRil85klq1lo3bZAqZfg?=
 =?us-ascii?Q?VnGQoTCMpoQDEyncYd+7MM5QQ5T5NqfeU8FWOZpluM65vVCoNNJG24f+qgKI?=
 =?us-ascii?Q?fWOWiVzLefPD1Xkl1De7agTvCuIJLg6Ff67q398C3gO3Arev0W0ZwIyuyP62?=
 =?us-ascii?Q?STVIiN18fSsfbWiVRSZp9XhTCSFgYLgvefwkl/Nto4Jv53x+TcE7k5XJ8HCB?=
 =?us-ascii?Q?yJizkamhzuVQ0Z6MAoQigQpDRzih60PZHdvhkCGQyQ333965xFMRUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mzHekUP2MPJsMVzGbccVvfijOh4MbGpSeSL7hXie8X8U3UvzImi+ohMi1Cfx?=
 =?us-ascii?Q?bNeQQYlDkBQnwNRGaADv0pMy2UQxh4WpNmWbi/jHPHy8nic+G3W2K5mvW9hy?=
 =?us-ascii?Q?6t18yYunpNEwtld4VTrwZMSldZnW04xQZ1jwx8wNUZUTbVlKzyFHhttHGq4B?=
 =?us-ascii?Q?DdWHv613YVAWOwjiqptu3dh0UhG1z+7VSOqKAKUJbnfMxPmxaZP5N0AgpWJ7?=
 =?us-ascii?Q?UF2yd7v72zaIAtf6OReQvCaGsVayzKPllUHEZgmgXadkj2Qph7/uBgJgXxn0?=
 =?us-ascii?Q?ba5N1OI6u3K8dEXZxu/6joKsdps9mh4SPo2dS6pdgwjZas5o/lALG7PlVYgz?=
 =?us-ascii?Q?n89gKD48SdDNOXFT1O0+3x2jd5/XbZVQdqNwYHUAYkq5FznZiWsHDh+Zge+6?=
 =?us-ascii?Q?cqKgRmM5STDC6blC7I5MVHhxRp/a5feLgvGWAZ5pF2W+3lhPdFU2WPVOV1l4?=
 =?us-ascii?Q?ezv+UuVuq25XQYEnJ/2rdcLOB1+ErLW1rEHsEhDeO/wTB+0sXK+KMiR5BMIP?=
 =?us-ascii?Q?TjIh2mznmo7qX3Ep/LeTqJ+Vsbaksir58YF1ThyKwvpqQX7fcONpPYUwvWaS?=
 =?us-ascii?Q?n0hGtnDlPbLGIppOUyZ6Cf8J4n+p2BbuEkw5ZaW0wYpLkLxEACPwYbRpcuN/?=
 =?us-ascii?Q?yweSyniTqBAY3RxnyOOYVMNtxUTAorvCe/EwQNix5mi/k+jw3kuriSYtYvqu?=
 =?us-ascii?Q?HDRNxDuIQZf9tc4NMMILYwZdv8cDyfGtTOkJnO23DH7Zc8AIsGaTPftLJW1H?=
 =?us-ascii?Q?N2jhwcmSk5TdWGry84KUsnPoirzl1VMLQcv9RkkiCmAJqJuboBho/g9Tbi+o?=
 =?us-ascii?Q?oWSQ8ggHkT0HYrJoJRgWpuanQtQyEhLBQ2qmvPXsdaMblFcnR/AVCqe1a3d0?=
 =?us-ascii?Q?J4DAfVPFtqE6KtTQV7aVwW9/xL2OPUmpv34MVc7boLWT84kcgca5tQ4Ge6F+?=
 =?us-ascii?Q?CNNjvVK5fQ9g2ZJoLgzGeMHDMHWDJjWY/9pmV2ZTSUEZsLCFDVHULZveuRWa?=
 =?us-ascii?Q?NrGLKaeXN+z2PJfKUwiibo3xJR6zpYkaTKzrolhzkeE1qsnBIEIFXxQkUHW+?=
 =?us-ascii?Q?3YTXzKjp2CaW2bz/Jm0a27eH5nOtvNGUh2CsLAndmiPE958FjkK4r6U6zTC/?=
 =?us-ascii?Q?d5tyPZRpwAS70X75A/4++GSAXoj1alHiaf3pin65+3xr5nr9hxyX/I0p/tKL?=
 =?us-ascii?Q?4ts9ScW7H4h8sX9nRRttGxvpv+DpG6kSmt8cGgs/5ktcNGxKQUuAzVD+1ivh?=
 =?us-ascii?Q?uk9cyxIBobzlsyOSbVQOwCXfoG51cSt8/84Dlve8N9R/wvLCBJLmvBmHPOlr?=
 =?us-ascii?Q?4pVJfS+km40rB2JaIKC3VMjUFq60ioStp1aq4kK3x9fiMHkYpD6cdFD5hH21?=
 =?us-ascii?Q?hHxQ1t7ccbaBkcxMZM+oL+YPJAkLOuxRKGIcDW0BdbiNH4U5zCQCNayUyY/y?=
 =?us-ascii?Q?tX6gPhvzKGDEW4pyYiBCls5ib9N7XiGUZ7nW72YJh0QGJYEZNmj5KuFXQh2T?=
 =?us-ascii?Q?hcapR9zBw2gHeYBPZpeElX8Nq4m+omG7NtF/3XF/5mOuscqta2BwavLclqmx?=
 =?us-ascii?Q?4cQtArtCKa95DEW6sUJFDiy1dzQ/nOuqgurVLkE+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4083bff-ef08-45f1-bcb3-08ddc838b152
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:26:37.6906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrILu3FAbIOVLZCByZaotb2f5RHjc5Jf+QK73BrU2/kYo6zqe2gVWnzJ7+QNXia0fLzpSdHVznqe8a4Q79c8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX11ehwPwVIEtC
 wFajs0XDv48gATeqHhZdJnGASNNF55AJ6aARPPrw8TOx3hP+okPkrztkaTBmKG1M1jYED3Uohma
 vLgb5Ddhs3ou0nnnqLznaZueVkX8SV/kazxgZ0XCewN8wtQi+JK4xWFxl6wmPMXRKG8xhAhSapI
 bCdlt0TqxEie++QgYOV7v+Q+R9neMZykZgqKpq/dL/Ds22KDVSo0e7a8VoAj6E/vI5Xl5zcyPyb
 f+NR8NyXddTNWNzkyqUg3+ILP8xn22n+gtWs2QZmvEyFrWacoayV4TgMjSIkkqOfEyrgFzEoiqh
 VXgqkgxMV9Afu8SIf0xa+vfJ6R0eA8cwgIascSvW7dMpoW1uBv32ZFhPiciMvrP45E+k1iZdp0J
 I6s/6N1Z
X-Proofpoint-ORIG-GUID: dd9g64-pVEua4Qm3Gw9ESZ6oVYimToWP
X-Proofpoint-GUID: dd9g64-pVEua4Qm3Gw9ESZ6oVYimToWP
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687e07d2 cx=c_pps
 a=Fc+powxz0z9PvbHcotDBUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=eeoF5tMu70cC8OtShIYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Jul 2025 09:26:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9326

From: Chen Qi <Qi.Chen@windriver.com>

When MACHINE is riscv64, skopeo fails to build with the following
error message:

  ERROR: QA Issue: skopeo: ELF binary /usr/sbin/skopeo has relocations in .text [textrel]

To reproduce the issue, run the following command:
MACHINE=qemuriscv64 bitbake skopeo

In go.bbclass, we have:
"""
export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
...
python() {
    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in d.getVar('TARGET_ARCH'):
        d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
    else:
        d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
}
"""

The '-v -trimpath' and arch depedent '-buildmode=pie' is generally reasonable.
And we can see we'll need to use anonymous python function to handle PIE. So we
should avoid overriding it unless necessary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/skopeo/skopeo_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index c5518cdc..32938108 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -60,7 +60,6 @@ do_compile() {
 	export CGO_LDFLAGS="${TARGET_LDFLAGS}"
 
 	export GO111MODULE=off
-	export GOBUILDFLAGS="-trimpath"
 	export EXTRA_LDFLAGS="-s -w"
 
 	oe_runmake bin/skopeo
-- 
2.34.1


