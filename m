Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810F9CD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 13:03:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15362.1779714219697309745
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 06:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bCdprRZU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PCdfDd2264790
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=TjJ8apWKHMzy9zR3DswV
	0iPYZ0vqCCMnaNEu67bWHV0=; b=bCdprRZUQzloNZql7YSPSpFRjBXQy8jDbhx5
	7B+we09UWCarDYk7pr4nZbJpoMH7vWWr73/cZc9r94pU1YN2XblLtFb82D54svuV
	FVZdSKDMPYI5kpR2l+XkuiyqMWrBGnYfSh9yiT/G01uf51oEUIEL7g0SWjoc3NYS
	vmZ1EApDg8t39avGahrpyXaIlzNINGoLZKF28oBtMeFPJUvwQzzjeyESpHUytTwy
	YuLgSYnoHUGDEH7IRkGBZF9bpm03DF+CzGD/qj3+3oDjyi/EssbUcZB69nr7aOT5
	9Bz4LmKNDd70sYcrhXX4PYUjDpWFU2YRS8N1HKuiB4U1mF3hvw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376apg1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhKvE4ZvcHGHG4txJM69G6kPC+iOETuG4Dh+j675zEy75Y3QAH9pbnNj1qm2X7h/6FrbhVfh2JDvTJCDKI6aJTyGtAu5LQBJq0j24cCx5pudZgnSXVxE0zpJwmPeJ4LDK3fwEW9lXo13Vb/Bd3HgFf/LBqMTaiiebd3wyXZ9n7xnrAN0kBAGPFoQpI0vZfRpcHy3tmxmWw80Le4Szkz17ghkgY5F3AWCpQENGijhPlrIcH6e0mKu1yhUEsNPlu5Y+yAuVg+0LOjyuvTkmxJ/UGWTMOylaqhuxsHIyMJ300mAeRoPYg6C9cPLXCKSSP0LrbCmOQiez4Dc+AksCncMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjJ8apWKHMzy9zR3DswV0iPYZ0vqCCMnaNEu67bWHV0=;
 b=MKB+33MmsySWlvrYTI3NRYg8nif2kKtIyTPilRGa/1NeGB+I6tSb7bPQ3gOU9r9l+FCSpQwmLufVjLXsDFSXm5o6FpnSS9g0GpTFWnamDM66oKxxlLHdW0IwIYvmC+2/inzkJt1Z1O9CoZlbcMVksxaCTxeQ+vJtmPijNphXwe5qXdLR0yn0J7KlbT1z2PTTmZJMRs0olNvjUBDINvKuDbwgd2tv3cEnVU9DK7VvN0eZyqfWTgf1O5Enw0j84fDquj6H8gwxLttlYisMt74C00/Igd6UHMVVm+ytAi9B4efFD9F7ieJ+poNjPyyl331TTCuQ4TfF5k8tJNiGChHgrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DM4PR11MB6285.namprd11.prod.outlook.com
 (2603:10b6:8:a8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 13:03:37 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 13:03:37 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] cri-o: upgrade to 1.36.0
Date: Mon, 25 May 2026 13:03:30 +0000
Message-ID: <20260525130330.3963897-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|DM4PR11MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d63e9d-8231-4aed-1172-08deba5e08c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	SJgnWgBsxZwRf8XVyk6DNrpMCaAWyRcuZl/Jrm8xvCAloLhIX/p4TPIXqfBwOdQWUPMbqhllUb6fVjXxZBWL+43XBLX5kx+ONCjOMruiwk/YOJI5kj9kkWs2fxzunQmTcEZlMvCFd4UIFvTh4IQ8XPdaH8XB4fKMgT3nssbGaMIwStY4E9zB/selbnfoMpahQF4V/RUfIEsQLnQIa0yRgZbfc0wRIp1+XiGuixSPDlzHZfLe9ydkTO8mVXqJ6aQyhWh4R/8xxG8AFb2WU/5eqQlKKglCc6eLH2MiLEJxSiGTMDQu+vGBvLbvlXZSIAl8A4UCf4htbTqS7PmyDo1EFaEVFEXHBqwG+YOWm06jkeHNJzEREbXVvi8DX6mjeIzVOi4beKZ0XCfuSHCFTbIUR8xayZJlQGMbggSM8ZdrnG943+md3ILFewzsCNZXaIYiCWgOAOwnV+SY9Hf91EV3p/eXgUUnetyKzVD1QmPlV3z8KmVZ4sdZSkEol6pW2tK+F645Vxnf4XWzL+4IeXri9/pY3Op7hXv/qWewo6PHqiJf5Xtd5tV+2nYozKnCqULNd5R3lbffMcTret9T+rAYMMEvXyLMVeyB464JfL0NcRR2yTQfEs07IURa9VN2E04O3hzi/MoWgss7IF/PYB1yqVACkepPoNdLesj8y8Wwrty78OdLhDRTunF6taPoOcL3OvxByZZPPp8EpCo1LkGhmTHiTcd3kmzN88W6ZJ/hZCjkky/syf8U+pSnHKL6/+Be
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4bKIpmtUpNkPYyHnV8ZovdInF30b+RC6qCm3IrpkVl27eQvOfRa2w2I9QmHI?=
 =?us-ascii?Q?Kpjp77U9i0Bq2s/RkABZcRbA2KN2SOTRIq4jGDQpFzNM0yglvz2QYBewYZn1?=
 =?us-ascii?Q?DxEiOXiLoizCI222MK8fJ/2QjogcJSnfthAbujB5/YjHJGL3t7bfRPn21p9M?=
 =?us-ascii?Q?Xs6lHImqLb/q+gGpMlItCFOiNOFaIok3bO0L8I5JQ1DAkl8scENAzBPzLRje?=
 =?us-ascii?Q?w1KF40um7Kie4D+n+x6I4fKt2/IhnnNY3S1zWR8SRiHXpg5afpq1jwevf8GN?=
 =?us-ascii?Q?NJ1aBeiOwXC64ZvO1fs8NjNbQAjBgYTyn7d63E1I62C+3EsJKjECGPPzuL/D?=
 =?us-ascii?Q?04z8X3ur6wiRjbugfqMYATeoW2jPf4IBgkf+izbXmiEKlv1IrIosip4Rbqqq?=
 =?us-ascii?Q?oZ+eEvwzMoH4BZ5xGwVeIv81INKxMvx/PPRKEbjyf/bPDOeQMELKBQi1+LNW?=
 =?us-ascii?Q?X/43QZeUtKa1/CXCTTSzXrTT4qoG9iDMpBuhOmEdYpOeagEvJeCHyj/d/Vor?=
 =?us-ascii?Q?mKgY9q1sfABPa8OKC82JSeZ4jRyNqrRuh+mcOEMtC9fbVKs5wTfyUBqQxKjj?=
 =?us-ascii?Q?oWEoeRWaZlrTVIw8NnIDTbuaxVXJEuOrJDN6C5sDIxcD+5I4NrvtyrvMWWoI?=
 =?us-ascii?Q?UqfzcmI7fP9IfQvln8bp5UV1s2uJb8PTtQVD7XwTxD4TfhSf2p8q4brHDPRt?=
 =?us-ascii?Q?eZwtLrah5JsuATgZF6zCNBUUGtY6c1Hlr+e6Ngac+Mj25WypCx+eBJESmMyv?=
 =?us-ascii?Q?zbhJTbWLDga80R83swVjmyCGyfplzLLJZ8zUHbQo9g/+RANlQWyesQY+aox7?=
 =?us-ascii?Q?tTpQ2WZR27EgEgFWij437ouz5KNV4aOGMDvDegcSlLylq+tsupIQgh5doWvH?=
 =?us-ascii?Q?LJ2+H45SGy3hSEUMoQJXboSnR78IcuFBo+lnWZL5wIF64jQl5qw+MT2eQKhm?=
 =?us-ascii?Q?+qXuJW36B+orNGB/ia2pwEHLOKiJsQaYtBoe4eP5OUeIBtMPSwCluzMvQG6i?=
 =?us-ascii?Q?QrCyalp5R8gk71aHOsfdtCF+aWNuBbIk9AUYWzUUB+3BRA0wbh04gIa9pnkU?=
 =?us-ascii?Q?GK2FdV7AJxvWWLxIwoncSi4OzCvp1zBx9uDbjTq0VE3oGyGZCKF+g96j6kqR?=
 =?us-ascii?Q?Plu4je160aBaK37A7wtKmFc0qu/i0OKKeIqOS0jkyrtqCUlpyKFWYMeFRajv?=
 =?us-ascii?Q?p6pnHhtV83zjGOXNAts7NdnYQ2LhXHquQDMV3pj2UHn5IoWzTAkqnwWwg6yp?=
 =?us-ascii?Q?TqlisjexG3rNuvtFis9d2Y6cqRGiHiQ9BL8LZD3mdNbGhRDtDFaaLza8+vPJ?=
 =?us-ascii?Q?sustTuoJAmr3FykjQBhuTcutduo+Ppt4kOWHeeLTA9AnTOLKHe8mRUMd39jR?=
 =?us-ascii?Q?X7QfSrfti+rds36voqRUC0FlPqMTNSTpRmfe37uHm58XGQ96mfRRho6tclEM?=
 =?us-ascii?Q?7iYQeAkZ1gTiiZ6q8wMg9ToM4KzNfIBUh04bxBtYkYAdTTiMT2KJheUchjYj?=
 =?us-ascii?Q?sHbURac9t+/5MSzMnRKdJFLj5+xhGMr9qhkGXD9KHMQR5gWSQ5kUH3csTs+q?=
 =?us-ascii?Q?X7Xyh7FO3ZGAuNlK7cL5ZRHYznyS1qtp3csa2jdba7rL9rrWXC8AZDPvsFPk?=
 =?us-ascii?Q?2liMKneFi6OW0nBenOHA/8oE8YjD4K1+JuJaDt5qiMpjRULLeBytIdWLQBR6?=
 =?us-ascii?Q?i2Kju6QH9uQYtDGAcDolxgMnQC2Qm7gG04w0k6dUMkpdb/OeL89BuKsjgjRO?=
 =?us-ascii?Q?MebvF6HwYJN71oSlk01hEAp2ql62aIw=3D?=
X-Exchange-RoutingPolicyChecked: 
	mqMGmKvOz8Nz5GIkIwyBrAvgR7pRgh56rKAyKNJGKSWasGiGeGy46E2K2L1xMzHH3ctLc3jr4Ggdvj2a4X5/vokJIxbH7MWA0WaC+id14/W1i6ps7i0X0YGcww/QrKKA2BzpnfBs/2SMXLJ4scLe26bsc/UQX/lxoftyKXAFLJuAbsW/skxDSBgo5hfkCNBI/E0JI6J7ptFW6n7tKRhQdZ1DLTJ5L/ssQ/ff1DSHDNyf2Lc04b54EVL8cl8VVuT4oCl5samYWzcf1S78eWGa6tXJDHToTcRj+y934loJ0xdSHeE+wQflww1DZFnYUEJ4WmXBssrBluro2Pe6to5fxg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d63e9d-8231-4aed-1172-08deba5e08c3
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 13:03:37.0531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xufee+5OSxWqvDDaBk3rKVde2FDOFKZLCUmfUDDLpEJsOLZdOv9RTMLAkNlk9pzz3Sa1U2nKhFO0hOSkSQBfODCJFo7tW1iZeBbTphSaKhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6285
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMyBTYWx0ZWRfX4AkC2fKPIn9Q
 ZfxBhfZ6P7UZ+WrP/xDR+DjHii3lEJ9VeBPcjKo+Ieq+rRTatu9hyFkeJTOKbVViqgOGnkPPljz
 zL135fgKHQ6NmC3SBy/I8ZwASqx+K7XE4cLEEGEfWBUt2OH0p//nDg/ImALeBt9qjpmCO6uLr6L
 6+F9jZxUcyloi2tdFKhYQbOgJBYNXexbfH9h41JGrmVDMrDNPUcNK4vVeV47dJj8M2G+Xcl/jUd
 cMYnvNWApoy02nGTZVTX/7V5ll8ocddihFIiuU5Ld13aL7+WY4eXR16t2JnBq41+j5j0EycX/Tp
 Fs8pCBZlgSQy4FGsYx33SGMagnQgDH0rWnS2Wb/xnoQPwBU+6Xxuy90oTpir+t5jYVcqVZYjvG4
 UA6rO3NbfeuXlW6PpHoN5e/SdyYujfN5Hq2gEihl6xbACA4b3X2blHNXVFUSdyK0cfgnD6qww+r
 Gk21uquI94TY4xJlhgw==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a1448aa cx=c_pps
 a=sZdM9mINdKJOQAUOT6RFRA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=KoQRYmnAgUsuZA4JF9wA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GA8xmlLAKZLoEUv_-R1ft1pNKgBrF2Ou
X-Proofpoint-ORIG-GUID: GA8xmlLAKZLoEUv_-R1ft1pNKgBrF2Ou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250133
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9810

Bumping crun to version 1.36.0, which comprises the following commits:

    92b75982c Update nixpkgs
    e5a6f664a Delete updateunified binary
    698c22245 Bump k8s.io packages to v1.36
    ff69f0eb7 oci: clone execPIDs map to avoid segfault
    8ff525cf0 cnimgr: continuously poll CNI STATUS to detect runtime health changes
    50bad6de7 metrics: add default_runtime
    d73341fb4 deps: bump go to 1.26.2
    f50fd5bd2 vendor: update github.com/moby/spdystream to v0.5.1
    1b111f660 Add inject_gomaxprocs via runtime handler precreate hook
    88e8f422b oci: wait for exit file before defaulting to exit code 255
    8b9a4a37e Add SLSA provenance attestation to release notes template
    ca4496cc7 Implement Stream* RPCs
    e70f41a32 Embed git commit in static binaries via ldflags
    6c9718d73 Disable zlib s390x vectorized CRC32 for cross-compilation
    498e33a72 Update nixpkgs
    ded8ab8c6 Modernize nix setup to use flakes
    9c75852b3 Make artifact pinned status respect pinned_images configuration
    a21c68572 fix: address review comments for additional artifact stores
    c608ffc3a feat: add support for additional read-only artifact stores
    5ca7b348a Switch to go 1.26
    456e2e70f Add integration test for updating cgroup v2 unified resources
    cd2b28f0d Add unified cgroup resource update support for cgroup v2

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 37a0b84e..f9176073 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -14,7 +14,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
  - Resource isolation as required by the CRI \
  "
 
-SRCREV_cri-o = "8273bca378a36dd225fcaf90b6b732cc4c6d4248"
+SRCREV_cri-o = "d1e7bdc854ed4846a7f15c5e0c17e0140a1d817b"
 SRC_URI = "\
 	git://github.com/cri-o/cri-o.git;branch=release-1.36;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         file://crio.conf \
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
 
 GO_IMPORT = "import"
 
-PV = "1.35.0+git"
+PV = "1.36.0+git"
 
 inherit features_check ptest
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
-- 
2.53.0


