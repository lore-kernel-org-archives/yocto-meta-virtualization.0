Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D941CC19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 06:41:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7817.1741156881287239750
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 22:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=515973b768=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5256dTti023299
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 5 Mar 2025 06:41:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456ct88a8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Mar 2025 06:41:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEysBfDfKy7q65giK/PJKdM3YCYeCMTHfIdcGuqzc7fXex+wqFSUN/uipsWB9ZGbQgZf/ifI+j4OOkkRSHG6N2W7A4S8Emxl3o7DamS0iOb5DcQKq2i5YeE/QLGmXYJ9H8xRzgxB6aARrCRriTNWuGaamIoh+WuElfiArjDLLRrv91cIaDfFNK3NVCS5TURAZjrqYuufCT+OQzgUVRljbw+HT9KaPsYmDWbZUNAXjGFn/CZ+b8vlDdorXDnetgUowyjIjPDvhv7g7T84RIL0Lcsj+g7641XZmfSEY2lrieXBgIoW4GqFKG8+sKb6paySoTBNgAUcU7GaYkLkI76NPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LCNeIKSK1m4GMiqBEmqqeKv0pmzbg6kfjjRA3iGxoM=;
 b=j0vXt6vUb4uoxvUEFvITys/EX1ksdeZ3UO+OPX8iBEvaH3Vc4fGgLTonVRkOqRipJGdMvhwxQaTV+w0gRXtFdMQmOuEQJ+GBWb5ncTTDqEbQx0KEUdGWyswhLZF3o89BmFP0EWkPQBYCt6c0z+f9BIZRUPmVSclMMfHBlG/e5X9l8qBDZwX6cN7HjOvc60r3lSwxYFCruiV0VefxRDix839WQoxyPgBhT2owNvCZIJeik/yfCDeqRPRkMenLUBNgq8vc4Dd7PSwUQEjflt2FU4FvM9aghWhkpIKpJrn7bdhrw70AHy/eS+JXbqqxKkCjekaXIGe/D5C1+WQb7wNWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 06:41:17 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 06:41:16 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH] docker-distribution: fix CVE-2025-24976
Date: Tue,  4 Mar 2025 22:41:05 -0800
Message-Id: <20250305064105.3044844-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::25) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: 963dcb4d-f2c2-4ac4-124d-08dd5bb0bafb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7W2m/aIsBe/dytGNy3nPPOH+H83HiANRVg5kAwRqClM611oH9o3+piwOoCIn?=
 =?us-ascii?Q?UfZmlnKg2i1baME/K456dobbObu9vKscANM2OBjOLqVoMMyBo/vNy5yJE4vu?=
 =?us-ascii?Q?bGSm2xsvI/W2KW7Duboc1bXQtwe97P3INnnjXX8IXYDaAiVpV0mKtJxHHt3Q?=
 =?us-ascii?Q?cE7VvNCjSlVQ1Qwe9gf3aIfXoh1afaOjHDgU6L1v+nGMTw6HTU16W0yIoGae?=
 =?us-ascii?Q?RgpUjeT3iyZq4Q+sSR0cUY+kYrBMhhVzxKxgSSK1cwKhFU8l1S84juzn3nR6?=
 =?us-ascii?Q?Mo5HRFDdjWbTPAqyuEGWI+ls8rnYKGKhwyEOtNu6QwIGmS9SrklU9hxBFjad?=
 =?us-ascii?Q?1ZjEnEynL5NWKnXq5muym5nZQxLnqv3Krgp7KWTE17PVbdft7P819wWtQGoa?=
 =?us-ascii?Q?DWO5bzzhmib40Rf510FEK99q5kZgD3BG9DKx2FGn72lkwUIBksUr0vMltgb7?=
 =?us-ascii?Q?igIjEFt6VTyCYfOcjh+mI6HFZv2FrQnMrvGwaGp/OBU6tBX0P4V8siDtnb3B?=
 =?us-ascii?Q?gkqPZxJBzfibyXoe1SQbKIaodkYcdSqaqaOZr+9rwf2CEnuQfltYANFZdvET?=
 =?us-ascii?Q?x0vQbYA17qWwfYrGqknwY5zNq+ZTpuHX1U3p/AoSxIfdqTf4cAUsFrB9AxWc?=
 =?us-ascii?Q?R49ryHlIidhaed5xc+N3arPcu0mtRq2h3gNaZstaJgbQ+0rz3aeZuOtc2fuW?=
 =?us-ascii?Q?2PDYfQMTyUpYu/yv6MlbcCuIgFjumGaJ5EhGN0rksMUDnqw8XzqETSzxoQ4w?=
 =?us-ascii?Q?Wul0EOzX81OTlCIhloGQ4BrLqUQHrT6ToPYSpvdd8x7Fekxft0B9qr00Lx47?=
 =?us-ascii?Q?o6CGaE9U4zcaFQc4xrcpQbxx6TUh3d8QetN4laalVWpAUlJZsjaoQ5zAlUIN?=
 =?us-ascii?Q?yxyBx0PZ4vB6bycaxsQklUKd+zpqa4WgOBel72ieCXv/bUH7MHSV6pT5Rpg7?=
 =?us-ascii?Q?NevgV60w+MjWMqSrAQHHoP7wc/DKA0Igw9brzwsnf5s99Z3VaS/IKzriM/wc?=
 =?us-ascii?Q?tKc9oSML26+QoTtM/1EO3G0aWnXNznYjvjls2Fv6wRNdzF5XFuoQ7nIUubEt?=
 =?us-ascii?Q?eOIkH/CDjDDuu8M9xzfKh0E/LQVIoPz3d6RlfTicFkM6Ou1RIn+K2yWVERZC?=
 =?us-ascii?Q?0Ctw2nt2TkXSdjRKIPXF6oD9kFVRJyNQfA2UAIaa9KQII36lNt/Yb4EOJPH+?=
 =?us-ascii?Q?hatYnFo5jhxPJ3S/Mk0/mZ/P5rsFtcoLDnZLhEcb5qopXYbMvHEbMu99+ECL?=
 =?us-ascii?Q?vytVC7Anm/OPa2u01xUrsqb3f7Ley+/KbiRk7HPlB5UbYQBYQEAgxo+/m4rH?=
 =?us-ascii?Q?9BgcQbU8Yp3N4TYRE81fkiWKvH4GPrvjywjQqRRHAVOdG0r7IB6aogD+Wze4?=
 =?us-ascii?Q?X8qf1isr5SWLEC3jIHB9KvxBrli48EnZKzmMJr3zWT+oD3tdvK5GRHmCJUQi?=
 =?us-ascii?Q?2Jj0BxrNjPse36C8dJ0tglkw+EJSoVcN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d7DHy+YLdxu4ERsiKU4K5lexa7AG5sUfqgK1YzKMMi5RZep6RmMZ/O94KH+o?=
 =?us-ascii?Q?dw1jg53Si/I6Zc73AJFx9ctMSIdZUjwz9HXEvc6X1cNlSnkgQXmHdjfQtMHD?=
 =?us-ascii?Q?ahnoiaxMIrddoVR4GgpbYruogQ/FHfvQJgPbVqaAQu6Y5fHpARfZHS0WOBfR?=
 =?us-ascii?Q?TUtrJPXV6wBToc6AvPzxrHXLoOXblmrYfXhL0mMtL790mG/aVhkEykccRAgk?=
 =?us-ascii?Q?pDO4pHNVg2IYwGWgZ1dzr0DMIWqismZF78Qpxip7cHFJtmyQRlj32u8aQOus?=
 =?us-ascii?Q?IAerQjkj+FRmWxNEZ8h/+9N8dv89US56wOc5lh4nnJunSWrQ6JXqQKDk0dKt?=
 =?us-ascii?Q?t/A71o7Lc+Taa7O3G8LYT5wTEyX+gqG/BQIpP8DPZzcDvUaP8OhMCtjrpjee?=
 =?us-ascii?Q?ZiBLYpnPeosc92S1TdjTwp0c8H421NpgHfD7PSXh5Cr4DRaTvLB77rPSqFFp?=
 =?us-ascii?Q?BelTStcrHcvAJxqazWypm/zgbKPdf9FsnGm0OBzcn6w/mQ9BTR7HdHI6UxME?=
 =?us-ascii?Q?oerJtqmXBdR1MPKaqFzlqyKcW1ItVZVpjShdB0WlXTBtsbphazEYjfBCgnFm?=
 =?us-ascii?Q?VDwebfp7R5/eqPHY0P+hqQgoMOf+LQ6mfwOs4I0wqG+4PmI7gmj5Q2hWycBY?=
 =?us-ascii?Q?M+k8sSCtZy4HE31Lw/IecajWixaxux1zI7aOwf52fA4kXsRSslm1X3NVKku8?=
 =?us-ascii?Q?4kbVWjSOURK3hH+wfAZJdwxSQgIrYPUt6DxAJABMqvz5T6VsnbncSDUC01ym?=
 =?us-ascii?Q?QKOY2pdRX/sySLWpKmWDwXPyl2c9CRapEm/LhYpGVHQ0VeKOEIR2DXNSBynV?=
 =?us-ascii?Q?MiYesx1ji/QrHMzHRBEM5nW9k2KdOkUE4PIwYM+p7ZO8wkZyfnFRQa06kVca?=
 =?us-ascii?Q?krkyEz+YzNJnQpRBs9lmuZXa4Fe76ljdD6PSYIv3ukXl4Ub3D8KCG8comVdn?=
 =?us-ascii?Q?LH5I/L707BUZ+ESZTzTbRzj8L3gSoUoLUJFKL38jhCtnzgFKZYnpjBeHTrh5?=
 =?us-ascii?Q?PkkcNBbBoAvYNgVXIvERGr0Rx2/lk9+sVog0n1QqZ+Qa0cxsG5vZv0yEMxGC?=
 =?us-ascii?Q?ECdN+EtD833FujHSHUwB2oE4BzkDj+AD30724Rsr2MyGgLqWZ2R5y9r+ieAG?=
 =?us-ascii?Q?IJ7NO4Mser8mJ68iqxVnWzxjqx7txzPln42sEzZRZScDNG740JqTIK0A6eK2?=
 =?us-ascii?Q?Wuog6bEkaLhrzge8gAnTHYx1Zy5g/GaIa/379JlZxZxmoEdCqJMvUlM4jX9j?=
 =?us-ascii?Q?P5lPHMLlkE+DBb+lzmtn/JYCuq9nvxrqK/qJbUjz6A1U/MGdsmrowAIPUX9O?=
 =?us-ascii?Q?BsZ//MSj1yItC5qASsEsmn3+LwvTexusdFDSwfeyIyYjz81D1+IbUEsmT4++?=
 =?us-ascii?Q?9vfC0ROrTMcd31TvlyjB8tVBhcActAuEZ0eOWJbmNYvSRapURBUK4+sl68j7?=
 =?us-ascii?Q?FRc0oGQm3sGIamvTgh4HuCssjED9j9F3t3vj4wT0mdWTpv02FUNJTjsEx2VH?=
 =?us-ascii?Q?39fmuSgR7fUjgrH/C5zlzohIS3p+G1MV2JS0/Nn16Cc9V35F8qaxT0l0NKKe?=
 =?us-ascii?Q?e+YLM8mG9etk8tK2G1JNFOWch6rc8CtN3tZuGQ6JHdG+Flsj/EObpQvF0Kou?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963dcb4d-f2c2-4ac4-124d-08dd5bb0bafb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:41:16.7398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Suy2oAiXtEB4jWKRDuecra2nABgXiRuME23RAXud3I1vpav8L3f44nXLn7SUkBSWHMnSvPWc/0ZbpUvtdh2Z1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
X-Proofpoint-GUID: gyu3VVn9AxpeBpoLmrshwQ0IK1U_HGtV
X-Proofpoint-ORIG-GUID: gyu3VVn9AxpeBpoLmrshwQ0IK1U_HGtV
X-Authority-Analysis: v=2.4 cv=D4W9KuRj c=1 sm=1 tr=0 ts=67c7f210 cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VZzbbjECq-QA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=52rAtuDsww2CSOOgetEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503050051
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Mar 2025 06:41:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9153

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-24976.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution_git.bb                |  1 +
 ...ix-registry-token-authentication-bug.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-Fix-registry-token-authentication-bug.patch

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 9b918b62..e85085e5 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=dist
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
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


