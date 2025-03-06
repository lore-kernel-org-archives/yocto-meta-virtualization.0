Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DBCC19F32
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 02:19:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2986.1741227558061444444
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Mar 2025 18:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5160dce608=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5261u9fb021176
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 5 Mar 2025 18:19:17 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456csa1h5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Mar 2025 18:19:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMjnl0FOVLUl1/Saou+BrfSQBoLfH5/PA8F7SwZ9RkYIJJB0gfYjU6k8VSHXoJT8lV+fvrFZAFmjXhTbMDMhGIoyPL+Noh1eKJDN5N2GD6d3pZg6sCzaDMHi1wCIcGQR91WlCdhi+dfNQFoa4SbTA/vefW1iKCxfzsmNhMd7FMpL37cwEC4yNK6L8iiGKftikWCgp248eCZngToNcO0wiPdU/9DaoGBw7JqBnWMLhIK0eLrW1kxxpP9VnPPCjfbH4c7TsjTv96GrEuTYR8QsgwKTkbQUoVW4LWHPjF71obiSe3Vw/o9uBk/f3BgWsUv1dwEjiJwnySKTDR8Ugqgh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EB0wWrjNaQRxjFXgWm9+CJ8RnXsilH1KCsFKgTnjyqg=;
 b=QR5OwU53wpHoVf+Ek/46o48xbBqradqEvRwfxN9xY5O3aR9EfF4+hTyB+Ljzqv0TIzSSjEAi63WdKmjkaIOL6DaoB/DlBxs9PakXYJxp0KXRFaRAwAZMhErM9qYy7sJDVvKQGw/QRQhl4It4/RR8kIP2eSY5PmC2y6P+X86QQ5FyAKeRzOQ6sSUvyA6/4dqrfT4hrBm27DlaKrkdDv6DGzApuk7nPBvfgBdSCietKtwz1EIkNPT1boAvnfwL7OCW3MCkNvcPYVCZjvJ5b/zluogBBHgQmwAJsU76BbyEF17zkX9QRNfZRiB+tkBxifsVOHPWy0qWnRysnliLr+ZA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 6 Mar
 2025 02:19:13 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 02:19:13 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH] docker-distribution: fix CVE-2025-24976
Date: Wed,  5 Mar 2025 18:19:01 -0800
Message-Id: <20250306021901.2010684-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0206.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::31) To SJ0PR11MB5613.namprd11.prod.outlook.com
 (2603:10b6:a03:3ab::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5613:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: 870cee6f-74ac-48db-ca78-08dd5c554949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N84+MjNrWbvvAz5KF1r4JmQeC4Mlpfbw4X8L5EeTjoweNmSYCEyewVNaVtot?=
 =?us-ascii?Q?guTxUq0+wY8Oba9HliEZ4wKleCHJDyMD2Wl+g0coNrTL06w/8IwUz3DJqdQA?=
 =?us-ascii?Q?zb/WeqZIwjzA5da42H+GFsFQe9Hbl6Em7yRuBkJhgpDsHNsdD+y8W9ojHmvo?=
 =?us-ascii?Q?VVnwvIPtWTvaTLKOeZ0XwtOh11E81XlwUwC38XlVTWxXKO1AwhVgOsrfyVOA?=
 =?us-ascii?Q?piatB3mw4Ae0805OY8f0tuJB5/96/6gfTFo7+2LMSaL0ybrpSDtdq9JSyyQn?=
 =?us-ascii?Q?k0G8FHGgwofOikikNL9D29IRRe1A8ivZSdwTkifUVI2Fub5R9nfIkPNbl5UV?=
 =?us-ascii?Q?Qsi+KXgaI0ZDvgjKNa9k3DPXz7Zj9+E56DVFWAKs98y8nA0a723Fduk+6lqz?=
 =?us-ascii?Q?PNeOqzpY/0Cr11m7Q1bHa1kkE+MShV4xfcmvKkKQhtFFgbkPJA0mLvimoZVA?=
 =?us-ascii?Q?PNscm4uZjdYfL6+v6LYZKbDDmDwEnXt6sFvB4sHL9R+ky/vfXh+vNeSD0H8b?=
 =?us-ascii?Q?7xD1yE0CpoSktdjjM1O/n/OQfZtQ34GPuo2fCL7/DslXbFGF/Gl1v14UAPGb?=
 =?us-ascii?Q?PzHN3KzeNfilhFCKU3w8nLmVgBPd7uGjM0SUB9oLO7GNmmeynHnwSLQdQuqp?=
 =?us-ascii?Q?khXU/B96+O7tfgVDEvSzSLDo4VNWMYEiCzWBD5gDcaRnB3jnQlK3l6FHtn57?=
 =?us-ascii?Q?dbPnwbAqEI/tLrsLIbTyvt+3p1a1XvjWEQIG9UNW57BMB2YTY98BaTHl/vQT?=
 =?us-ascii?Q?qqdHEkY8xXPUfuAEDCfZFo6h3Ep/lLGooppDplUKtYSKvDa++S9hgPCC84Am?=
 =?us-ascii?Q?xBkwJOqZgiBWefd7m6HDBpbdQ15MeDtkHSIKuU31CQVz9j3NPU5NYq3RVwZC?=
 =?us-ascii?Q?yhqiVcADzayL/GGP24vCIBwBdgFRpLRpGA4z3fbZWEYE4rqQ6gTW7crZVwwe?=
 =?us-ascii?Q?rX9XewqMHsaYnkscOmn5hvqRh4734Op2ExzqvwMPwOX0lOVfURULogGeJvdj?=
 =?us-ascii?Q?xBRR03PZCwNT2hvpJvapSZZECe0A7DEB5WQzEfoAFA8ju/BGn22xFFQOEFxU?=
 =?us-ascii?Q?/MJB5wrOyc7ANKfY9s9nrnI+IlOKZNXzKuYgJHl6U5NbQDsN3tK24jC5TW4P?=
 =?us-ascii?Q?NjiRPIPhSnabumrv9sFHczIzZtLgXIB2XdA5xaxqMTSS0eWNHo5i5ceJd3wl?=
 =?us-ascii?Q?GGvQRkICOr2w3Nw56SS0FbIU0SNGK472Gc8yQH841D57gGgEvopRj/72F3ib?=
 =?us-ascii?Q?5NcU3EvYUi74CI3kOLw8qRfi+WwHWEDCCn+RiTF0fBk05yz4T3pZULatXTo6?=
 =?us-ascii?Q?pubKY95PNQldSz6Z70QrYLdj8FPMhjYWvw0cVJ2/gQ6v4uUsz6EOVxxUkRkh?=
 =?us-ascii?Q?whMro0pBeSvjoXIT3cqv+FTcouwX5G6mbxhpp13IgwH1y9wzIwSSSKTsiLDg?=
 =?us-ascii?Q?+g9+S8DHPcru7NtMURarWiqvpo1cpnjK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hJgII23UvEf2ftKJhT3wAvCQhnwZ5/McnNieAvVfNt4uquSUgi2p+4uml+B4?=
 =?us-ascii?Q?X3LnRaS+QtMsbF8wFU90G3WZ5K6zIoYvUSZWpanSCaqUJvLkIU8mWMjTEt2K?=
 =?us-ascii?Q?CqLEkXEtu5Fg7SjoZ6l9sGLMXM2Rr2AFqbm0IAR0zP5/b09VSb1yLsjo5JMP?=
 =?us-ascii?Q?0faYrIWQexKOsjaC+c/sAMV1+tUygTDevXbDk8U4+Noo1wdUHaQGiPBe6J6w?=
 =?us-ascii?Q?trajihsowIY0CNZtFv00t1KZnfxR4Tc3TmtAZaH0FPe7NviqAC5sxyvdiJGp?=
 =?us-ascii?Q?W8wUJxKLFrUaik+5ePcyeokJ/oPYRN6ricEKmUO4TalTw7MKHC3KK0R/QDbH?=
 =?us-ascii?Q?UcZeZnD/l71k8H9qaOKtHO8/6F2mBvpXljs3hnCDllQz66zTuqwyP11Dg4w9?=
 =?us-ascii?Q?4EKZO/58dd5n4WnrfEAAGpE8RwEJE7u4VVGD30rpNsh2se/drAnMeim4Z2aF?=
 =?us-ascii?Q?xXEDKDLIaldutqtGsDXCMBdFhqd1hmVFrFN/7LSDHi8JHbbIbUKPcjJbaiqR?=
 =?us-ascii?Q?mQaFtIoqN7hxAFOfcRLD10P8kTlESbAD7rNiDBUqQ5BpSUHQasCRGhkffplp?=
 =?us-ascii?Q?/0+1QJB/w84Ae0FMvgD5p+qD6DgLgpxQ+jEMPiIFTQxDTv+cqS337VXmGXu6?=
 =?us-ascii?Q?zaSQgaRKbLZ6sjY3tKxeOwlpW2xAZOWmCH40RI8ntO0aiVutKfm50ZpKgn5v?=
 =?us-ascii?Q?/WX17ZyO+IO5mEsxV5OqxZpee2qErA4J91lc8KZnRqqmSfuD1pkbqJE+P1HI?=
 =?us-ascii?Q?9FisLyDrTt0vGjbs4mPzMQDt9ETa2Ay9nUOC21BX/sNbuCBvGaCjrJNFoK1m?=
 =?us-ascii?Q?RwA+i7fNtqcOlIE8eYiwCNvcFpmnMAPAxHzA0AD1MGTg9tFkXMKfPwFLkH6+?=
 =?us-ascii?Q?EeTL8QfSdOcgTEAhgvz3xaCejLcfOwjh5BkksuZir0ixKBUuaZahkAIZ9/3b?=
 =?us-ascii?Q?GRUc3GwkOMcVkrd6t4dd51VFlbxcmZiKyE4OtGc/Sh/zEjc59Y7AtlttWlwH?=
 =?us-ascii?Q?rqLGUNQVb85WhYO5l4KJpNo+Lheyf7sMzsDhzT73Y1dPpVsYAHEBH2/02d/m?=
 =?us-ascii?Q?yRo7GbHnHxywlZvjKZdaWG28J8lf+DqSeD+/YU9ajlv6m+YS2vyXyCx2T8k1?=
 =?us-ascii?Q?NUTySfSEGxydlHyrdRaQBtWelftf1B0tM6QqZ3KSjaRoQRHBGpPmc7hBKULP?=
 =?us-ascii?Q?IKps9TXkynm8Boo5cY4mki7Ib1Eu4JmnkRh3dhL8c9XYTyFOelR6UitbUDo/?=
 =?us-ascii?Q?d5gcYSpbSR0vhn5z5WQKb0L6T4jxzLoEkdICwlPre+TbCGLj7fWgmOYbv+S+?=
 =?us-ascii?Q?Qp8U1h0lEuc8j9E6pH9jb7Z+C0lKxx/zo9MSOrl81t38hsL7SCtyYu/K/5hf?=
 =?us-ascii?Q?eHmxZaG5VD71Z+KBKqkfvteeeJY9bmofCAHlUU3ICbxjlKXEGPVt/oUF+DZz?=
 =?us-ascii?Q?wmSdTqM0saV8kPFQq/oKbjKzZUUC3xNEfnGzya8OT5aqk17VPie7ZmTjaRye?=
 =?us-ascii?Q?BC34XLs0tFepvH/nmBfIrrxUnFgCT7qzr9+NvRi8IQIreINuWQbN3eAhnzuM?=
 =?us-ascii?Q?18UjLLpkVDw18Jk/Edfem7ZSLv4ZiOwPUa5LCwaO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870cee6f-74ac-48db-ca78-08dd5c554949
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 02:19:12.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvH8i2G4dO8FobqhybDD+1F95uhrWwyQP45lBGaU1x04gOK2Q6W7132jNBSdaNR4QMcfUucsabSuGwInxoialw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
X-Proofpoint-ORIG-GUID: 0LrhKlQrff7lmNR4YQovRaBvZoiGl21U
X-Proofpoint-GUID: 0LrhKlQrff7lmNR4YQovRaBvZoiGl21U
X-Authority-Analysis: v=2.4 cv=d4wPyQjE c=1 sm=1 tr=0 ts=67c90625 cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Ljcx4Z80PikA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=52rAtuDsww2CSOOgetEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_01,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503060014
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Mar 2025 02:19:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9154

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-24976.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution_git.bb                |  1 +
 ...ix-registry-token-authentication-bug.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 50b6b302..5b5f75bb 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=dist
            file://0001-build-use-to-use-cross-go-compiler.patch \
            file://0001-Fix-runaway-allocation-on-v2-_catalog.patch \
            file://0001-panicwrap-Use-dup3-on-riscv64-linux.patch \
+           file://0001-Fix-registry-token-authentication-bug.patch \
           "
 
 PACKAGES =+ "docker-registry"
diff --git a/recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch b/recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch
new file mode 100644
index 00000000..8d3e98f9
--- /dev/null
+++ b/recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch
@@ -0,0 +1,49 @@
+From ff9eed251cfd7dd279ea231a289cc784fd7f829f Mon Sep 17 00:00:00 2001
+From: Milos Gajdos <milosthegajdos@gmail.com>
+Date: Sat, 1 Feb 2025 15:30:18 -0800
+Subject: [PATCH] Fix registry token authentication bug
+
+When a JWT contains a JWK header without a certificate chain,
+the original code only checked if the KeyID (kid) matches one of the trusted keys,
+but doesn't verify that the actual key material matches.
+
+As a result, if an attacker guesses the kid, they can inject an
+untrusted key which would then be used to grant access to protected
+data.
+
+This fixes the issue such as only the trusted key is verified.
+
+Signed-off-by: Milos Gajdos <milosthegajdos@gmail.com>
+
+CVE: CVE-2025-24976
+
+Upstream-Status: Backport [https://github.com/distribution/distribution/commit/f4a500caf68169dccb0b54cb90523e68ee1ac2be]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ registry/auth/token/token.go | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/registry/auth/token/token.go b/registry/auth/token/token.go
+index f803415f..fbcf5bfa 100644
+--- a/registry/auth/token/token.go
++++ b/registry/auth/token/token.go
+@@ -290,12 +290,13 @@ func parseAndVerifyRawJWK(rawJWK *json.RawMessage, verifyOpts VerifyOptions) (pu
+ 	x5cVal, ok := pubKey.GetExtendedField("x5c").([]interface{})
+ 	if !ok {
+ 		// The JWK should be one of the trusted root keys.
+-		if _, trusted := verifyOpts.TrustedKeys[pubKey.KeyID()]; !trusted {
++		trustedKey, trusted := verifyOpts.TrustedKeys[pubKey.KeyID()]
++		if !trusted {
+ 			return nil, errors.New("untrusted JWK with no certificate chain")
+ 		}
+ 
+ 		// The JWK is one of the trusted keys.
+-		return
++		return trustedKey, nil
+ 	}
+ 
+ 	// Ensure each item in the chain is of the correct type.
+-- 
+2.25.1
+
-- 
2.25.1


