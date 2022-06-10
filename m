Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53DBCCA47F
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 09:45:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.24795.1654854322664102389
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ptfDlp8j;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A9Y3Fg009195
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=r4q+jcLghY0q+BteXDv/tEC8warNaFHp7h/UlbQjnk8=;
 b=ptfDlp8jnQBGKXGnEM1DDQzrvCG06Y/TIwxLHGsEo8/+2Tr+OUQABRG+R+LEeWFG9oAJ
 A3Qt7kltFZNcln5rLAF8PlvUIplsJ4lubfUlAuZ2B8iTTs+iggY+Sz2h4X2wRXc7mH5h
 14DlhXL/X/vcDxNs8xvek5IOumNneTIVNHBS//if4kBG3XvpH7c4MHuWe5lEAWAfLsfs
 6diuYudqIU7QET3kDjO0HtYf3g/V6U20Fyr2rb18iVZr4yOnE6Qyfxv2mcYIrflznytR
 ruGjzOFzKqgE9ee/ecFsoNqwOlG7HXF0OCFCglaG9OaxbfOIq4BO1wfQVFlOb/d+6AoJ 3g==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuvb080g-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 09:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kf5vz0z6C2HfFzhEZSc1iKM0VBRKvcjk06LDlV40ThjHAvm00S3Txh+H0f+1Ip6TCDbQExoyRE6MwIU/agRPSgvB5OIgtP2E+gjLGE0E9h0/l9qyjTaGPdft877VVN01cHyi8HPB5GG++rNOt30CToImGSkAfvWOoksjRZQkAGKl1trSpxAouEXGXpz2/Dn4FC81PXsjO814rPqQxz8Fk017Swp2RHaLW5nSoDsOLgZbOH20S834UrHnlDlTjU28cnk3sHDUcpaHNcoGLxesfG0jEaasJM7o4fjG0YNTh7ZXfDEoBCXHita0d+isrVluiDjltgkTtZL+Nk/gouhljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4q+jcLghY0q+BteXDv/tEC8warNaFHp7h/UlbQjnk8=;
 b=RxMUWVV3zdx4xYK9JB1gr4jLofDSQPpkGfG7U1fXTvx7vyF/dKBKn8XI9kyk5zpGVqx4shIGUs9AJKf+MXQ8PrKh1iwPZkO8lNyM37T71MFVHPPl29L5Vh0krUY+PEr6J6D+Q/U0KsYzn97xoRaEYURUoTIeuU0xVNTRtEn/pZep0UklaVGA+LFp2eCatfeso9yy9fS9pig3oIkEXiTxDJaIFS9c95gLS6UWgQkRA4iSILLJN1+0MgN/LCSx2iM2U3P2Gb8W8JMTViT4PbmpSi2t44Mfydub8q8n5tZ+IW3bMsDLbj6mAflecBNikLjDE2hwZV2Nsi4tQyq5tCkOSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY4PR11MB1365.namprd11.prod.outlook.com (2603:10b6:903:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 09:45:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.015; Fri, 10 Jun 2022
 09:45:18 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/5] umoci: adjust inherit and fix CGO
 settings
Date: Fri, 10 Jun 2022 02:45:03 -0700
Message-Id: <20220610094507.74342-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0045.namprd02.prod.outlook.com
 (2603:10b6:a03:54::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dfa2400-095a-47e5-9606-08da4ac5ed44
X-MS-TrafficTypeDiagnostic: CY4PR11MB1365:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB136563453B8BDCF3F7C36454EDA69@CY4PR11MB1365.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pUJ55tJP7HCHFn7vuichPT8vHnWOpHL/4is4vAldWzBWAURrSFD6A7Me9mgZdSAlNDk+6y4ckVTgAmJPIiW5WPntrpL8ecF5LCFgOwKtHceS/d7VSa2suekcNo7VYFVOBUmuQlmlImPIyGQRUQCrBLYhVpJvRW3bwgztRcahYu57pI3Xeu5nANu+m3Vvi3n92C+AzCr34B6l8WlvOO1jlCs39xDOpG7CW/TZCwydaaZAnIlcp7RzhOwJwVLsDY1s2meczrVXiWkYd+ACDVoUFmBda/yr6XPYkeV5ZvxPfcRYxscEwBf5HaJKTeItlJ38sSToT/cxKPrKIHv/k80NPuUuvimc9f94+ZI7AG+5Lr8Y4TL9zwt4QAihgAR0EdVuIamyYFMfxf9ngbM6t2cmSQshsFbPH7QD16fbpU0i8WkoUH4CAylHS93EZFGsrE7r4MmmxiXg5q2GbzKOPoSqTU+1yYKi3tAe8KW0qpZlGEFUXoY1ZfRmn2onVsQfwNPUtbysFIMnc6ehR4bBJATGi8mtn4P+7VfE0i+5wxCCUCe9BiEwAhQe9HH7bQUPJQ/OqCMrkvML5EiCEntzRZTTlSmwqNEkCQBSO1pNx8fUde9/50dEFwEK7xK7DFwrmMqaB1U6Z/N9ZcIpUHZyqwEakFpIFDnk1peKWIlKbckTpwGX/TGs/QpF8WIT+jl4m+lxi1ysUn7Jzk5Qx88ozqhXGw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(26005)(83380400001)(6512007)(5660300002)(508600001)(66946007)(66556008)(38350700002)(66476007)(38100700002)(8676002)(6916009)(1076003)(316002)(2616005)(186003)(52116002)(86362001)(8936002)(6486002)(6506007)(2906002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hUPd1jZP2tcElTXmy3wlkJuPo9hAjMW7fRSMn212NffM+WYrkDCh/LaJRMME?=
 =?us-ascii?Q?uFYE9961YaA1WwBIHQpmnZyQLtZ0OmymeXej4a8sCWMZjQE181BBnDwAtJFe?=
 =?us-ascii?Q?1lShmObtw3OOezdYL0rbXDFO2c4c/qy01mDiCJQF8Xkgn8kKtbMZp5OVR8WI?=
 =?us-ascii?Q?Nb4t1nwJKuKZoTAxUnBEMI7n1+XCGXL8oMu3cAVvWbSxpsYzdEEBHGjtJ727?=
 =?us-ascii?Q?2EenkoYL6yrMLFaTKg3+CFFQUjcFV3v7B4OkgVD+yyf5/VPwOws1oCjQ0E0k?=
 =?us-ascii?Q?uBA9zX3ktuC5QkVBKvcLwMZP1AT1QsDvULVvNU+N9N3CJDReKiaeGSJpzYV8?=
 =?us-ascii?Q?NfwJyuWsWQJ+Qeg/iOuV0jM9+BUbeCV/bH6TUynQ5KvdHwaQQ6P/uz8c3qLS?=
 =?us-ascii?Q?paP0ns4r3Z3+nv/CKgPbhkM8esT9PD843m958QApm19HMg2+/Z0b/SIkpgCF?=
 =?us-ascii?Q?mH9M7/91ROSDlPe4cilBcDUthP2BbgJsXPSjFM+zEgjK40qAIyYxcwak3nzI?=
 =?us-ascii?Q?/YCJ3hzgHFrl7O64+MZTyyf1+FaWLxyuUng7FDYyGATdImN2fJlRgi/QHKg3?=
 =?us-ascii?Q?mlh85mHDw6WYT5mzF7K4Or+LX+vkYWlyAIQLiBxi4cawThzNkNwK/zI5ts6L?=
 =?us-ascii?Q?3nBN0gUjL1PUxAjFbluUqlCqbsZfIPdZGybR3puMPH50PdA7KlrXr6o94A1A?=
 =?us-ascii?Q?LR0KnAE80S6FvhofNvFzYXrDtNan54mVwbDn7pi4Jq6tBWVhi+2i6W6iQi8/?=
 =?us-ascii?Q?spefu9YpcgEaTARIwi3JDd4UJtjgra4OzaoMk4Ehxw6YGVtTc+Nz/zxBbqR0?=
 =?us-ascii?Q?H7MWpmQiad6OqESYyNjPvvhcF05cf47T5ungAnTYDmOtH1rKc6MzaCMLqBaY?=
 =?us-ascii?Q?BadgQbXeVwGs4w9+G62Imfcwy+cRlUeBLEL20QLeoLn+fcR4vWQT3K2b5cLJ?=
 =?us-ascii?Q?jtX1xxZQIa7NfI9UzzCUhNcxkPerQg6nk/343tDq263boRRtpd/iv6AnMWIK?=
 =?us-ascii?Q?zaL6lKq6zgr7nmvKseHqm+efSOLcZRy7F6pEGvXDfeq16Sf9iul92JRpxh81?=
 =?us-ascii?Q?3TCpzSmYxavaDE3uTwAhUlQT/URYhqnOaXY3Obw841viM3niQEh0vR1zY0BA?=
 =?us-ascii?Q?FxoGzHb0DutFBTBcDHEkLNgLK4Hm2KncXZjTbJvsrof82YxDfb4W4vl72oYB?=
 =?us-ascii?Q?7zaO8JuttbGxGwk5Dk6Cw/pQU2PdEhktCwmZV1IxR3FgDhlrDas/1b2uHHoO?=
 =?us-ascii?Q?gfKB0GHBFRZ4VmXe05hgHqSMOJWTFGZs3tuQXMWiun4M2oRtVnMYB1G/mRux?=
 =?us-ascii?Q?NwoeGy++BdAgpXQgdhjiJQT3Wf7sv3sGnkH4RQrIfyTt6w1c90z1QLOZ3Kx0?=
 =?us-ascii?Q?jpMAlI0jfgwKF1sXyPc4ySSOJwSCCHPl6bJfSETQPxoLgiEXyw54LW8HKH2P?=
 =?us-ascii?Q?FkId2hX5tXof0jPHgGwazGwR4ufGsbgDJOiifnxQlHj/fLZmlpc593JcVrmz?=
 =?us-ascii?Q?jaQEc5gH1d7cYhrB/fPUZHbyHTGFaO0SJHxSTMqYalsPW8DbQ9ULQMee8o66?=
 =?us-ascii?Q?ANIukQJdaD/a7GGPkYY2oMBiL4IoN+K9anGSbJ3W/2PlXK+REqkaoiEVv9TD?=
 =?us-ascii?Q?h2tAHe/4Cnd5LbqgED8uw4pwkut5Sbw2uHJV2K3AxEVrh4SafEbFluf+bcYc?=
 =?us-ascii?Q?cF33sZIIK75J3BRQVrIEtX3bH0vg9TzPWtiFb6X2VI+oCjhF53+UBLFuIe+4?=
 =?us-ascii?Q?J74ICdM9dMHVPFkjrhNnil1zEazv9PQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1dfa2400-095a-47e5-9606-08da4ac5ed44
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:45:18.1366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9c571C83vWw8xEg0CTsarCa8BImaCSAQgHj+R25S+Myb5sv2crmlkFTH8Iv94J2+c2ZKdiz2KDU3y5ahb4zp0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1365
X-Proofpoint-GUID: rfY2vBGxFTalpk6HHNnqOMbkcIoRjQ3R
X-Proofpoint-ORIG-GUID: rfY2vBGxFTalpk6HHNnqOMbkcIoRjQ3R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=489 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100035
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 09:45:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7361

go.bbclass already inherits goarch.bbclass.

The CGO_CFLAGS and CGO_LDFLAGS should use target flags as set in
oe-core's go.bbclass, not the SDK related ones.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/umoci/umoci_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-containers/umoci/umoci_git.bb
index a2c0827..525a967 100644
--- a/recipes-containers/umoci/umoci_git.bb
+++ b/recipes-containers/umoci/umoci_git.bb
@@ -14,7 +14,6 @@ PV = "v0.4.7-dev+git${SRCPV}"
 S = "${WORKDIR}/github.com/opencontainers/umoci"
 GO_IMPORT = "github.com/opencontainers/umoci"
 
-inherit goarch
 inherit go
 
 # This disables seccomp and apparmor, which are on by default in the
@@ -53,7 +52,6 @@ do_compile:class-native () {
 }
 
 do_compile() {
-    export GOARCH="${TARGET_GOARCH}"
     export GOPATH="${WORKDIR}/git/"
 
     # Pass the needed cflags/ldflags so that cgo
@@ -61,8 +59,6 @@ do_compile() {
     export CGO_ENABLED="1"
     export CFLAGS=""
     export LDFLAGS=""
-    export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
-    export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
     export GO111MODULE=off
 
-- 
2.36.0


