Return-Path: <li.zhou@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A450FD5F98
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 08:41:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.101634.1775637675184749769
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2026 01:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KltkHteE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85587e9070=li.zhou@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385QTs21169176
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 8 Apr 2026 08:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=jhLKJFkgSLpF6wK4B26Y
	3mSHcU5arAkfjQ+Ovh8rsaM=; b=KltkHteEGB8/45pzKB8HYIda/6Y7M2P3fpzh
	fguH48ER8K0zFrtdG8p/isKlFZZ1gDo76We7mAgUiTsQzXTg+KBPGcbX1JUnavuS
	gURL7ZBi7K2ZrmDfFuEKV4NiPNV/4gZXidx9U0IQYN3ZINYehbF4WJ3qUFW6gLz4
	6HFWfRYxLP5dvYNY4FyZclnAZAZmryQHShYVC1SctTIsxYhYfT17Ho0suuRCKelG
	9fH1c07Q7vWUEcH501LZ8u09W0YVb5AmidVL4kQCnNaY96EXNHhM2oo2jax7cRfL
	XejRFJKysQr1nC51sfFfXQ172Q4ZAsA7Iugv2yKQxj4oaqMpXg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqj88e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Apr 2026 08:41:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DC492Crxp5IuRa1kCHqdxlElv/1t+wndxz+xszkdAYm1SxNM8kM3SoHANRLaUl1Q2u/UMpDfo9rFtYxe/aZxn2zOr0PCbr/cosQfGWmqOaptemov6vObG6pc7Omhbqq7PEIcuBRQU672627XLMNt+v82lZtrNFXd3oTioOq1POO0cp824Xkxw+mrLJi4/osTMTutia31XxwYL2ZsChC0ClmfzWkYWZo96jXMO7OqMGpFDHDYA5xMcnC3ewCdrgXOut78kMQ6T/GaoeIK/WjUcNkQ6sbIT9hVoomHC+BVTv/PNAgC3R+c9Uw+O9ZgNTcRDylHQyaLOWS72J5WPG6vXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhLKJFkgSLpF6wK4B26Y3mSHcU5arAkfjQ+Ovh8rsaM=;
 b=DvG3elZkII9+DkUM2r9ra71YI7kglt/f5etC5GSI+orCUaZOO0K+3zcXNEumgaqMy9d2EaKwfUljJerU2bBPzTSkEodht+KoAZrGk/8JOmJHmUQOiAUnDUQNMDNuLSvmVHbUy+v6c+vrkUE5Po0fQjWx6+qemXtbFbS3wFfjdB83RXOYaP9HqXbfVX/SFauJ/c8qQvzRPbt+mGM3SChWnOSq4gdhWVsMencvVPfA9jvpnNGjthKQRQ5r5h0u1hIGSsf69ZqO8YB6J2eD9f24TcWJdDfLSB7/a1QZl2oPBam9qbI2ygiNrRHbXZ9ItM6DOwjqVEXQEStzO3MMij5mrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 08:41:11 +0000
Received: from SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae]) by SJ2PR11MB7453.namprd11.prod.outlook.com
 ([fe80::3198:3bc6:ec3e:b2ae%5]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 08:41:11 +0000
From: Li Zhou <li.zhou@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] yq: fix do_compile failure caused by CGO_ENABLED="0"
Date: Wed,  8 Apr 2026 16:40:52 +0800
Message-ID: <20260408084052.693958-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.51.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 SJ2PR11MB7453.namprd11.prod.outlook.com (2603:10b6:a03:4cb::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7453:EE_|DS0PR11MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: fc19d785-e05c-4646-91d6-08de954a960c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Y3UrI3Jmh3Uh3fG5dpvr6Ufw5vuxpw9De2Fw8wiLSm00k49e1sAAyoFAtJOlAPKn0llYlFuJ0YhnQ3PVoZ2eTs7vUq39tdQ0zn+w2G+PY+YHK8L0HS0Pi+9L+Syc/R10CCdaDxL4XRdDkNweeR/Kn/wmcciN/489fZYjlTtmg4ZuZlo0Di3CadnhPyafqOtkKwnHZ4Cdn40hapwWP/og4AmJGIYYm9A2GSDzjj6lh1VSCTMu3RY/fUVkI9N6Nj56PHx5rN3YHLMVVj1YDlnOH7V8QiIMMusRQ9nDXnMvzOwxzxfDagokafLLs4zGTScMBFWtiUpjDj0g7o8I2n2urIMUEGfWSM9BVg2IhkMSM3rA5dIudkjvZ34s1lopEtql0T/gszPevPjhiHORT03TMVSnwf3GQU9IBsQi8vFTM9ZccSdM1a7iznf8ZyDIXGBs3XKjCCBBjMd8HuY4JwNlVCG8AKy4SJHoYDbNGCycTK4tTO3pwU1jXyw+YpTyTqfVIF7xX9fOKD7tAtFoFsQzjk5QsPhQ0UoRWaFJvFjX1pYIfFWq19v+2DBzfJko/cuDkW7FzDhcpG1tNKTUWtlvfwUg+kmA0D+si+CxwK86+NHJA4NtiThT973x2o59utcarCOAhBkmyjeHvih4NEfkG7LiGFIs717tvI3fJHOtxTYdh9mFK4KYl4nNpQHgxN74lTMQoHR3dLy/YgWJg5+jjiQqxfYMuSLVpGeAvvtJRfq3u32t6t8q4cCD8nVCm1PWFJ6i3qlMJ/s0mxtGiCExUO4lEXHPYJgKAXZgh09zlIE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7453.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KoxHe9heBLNLQBKhiYJVyq4BAe8N8+65NaXNwdlF1gmDNlxJdOIBz8SYQoNK?=
 =?us-ascii?Q?yhZHNyGBryl8nAM7KS9xmLxi84BCvqK1tuIwZjYiv/GGXiJwqNrT8iwl+BcY?=
 =?us-ascii?Q?N32HBSe1+1JXnoiBp1dXkAO5br87tFvWADh+/pCwdu4jSyUFTJ7ydhdNLKWV?=
 =?us-ascii?Q?k4Zy6SAvMRa57/DhHgD6gSGNFrf7uSYEUpKMASJwS9qxy79qlh34Us/Xlhq4?=
 =?us-ascii?Q?56JtDT3ZhfKd1/XZyIjLnOXpojAtjFbqAwSWg795mP5SPIIQXf52Wkorf66v?=
 =?us-ascii?Q?pKl1aEfV7cWeQtgsd2M3fnNQgTjlqe72zTRacHryerSiLDf+orH8o9QEy9EZ?=
 =?us-ascii?Q?EVpCVXEAsUrp/Ynfc9BMUdl60qVUoBSm+Mz91JBz/gjtsk6r2DzaL6RoVptF?=
 =?us-ascii?Q?gjW7VD3ry/30OvMjbksBCirhJ18QUkTNeTvfmEnYsUpC3jZzUnJ1y9hotKf0?=
 =?us-ascii?Q?jHTZ9QaicOTvERGeYRAwUKHiMSLkgtYWdksIvp1PCvQPElbmpgAWTK4f4O1F?=
 =?us-ascii?Q?mOZeLpuz2z7m2PZ96NTdBe7vs4aoVjaKoAO35gN/NzxoSg1Y9H1VJJguzyds?=
 =?us-ascii?Q?RpVeJR7cyuDzIRapFSHYFnFo31tkVrjWzwak3XT4YafdWlmn1yyCiEch+k2X?=
 =?us-ascii?Q?mavMe/b1WgCu5AbYPHqjFO3lQhP60wUbPavYOG3UQrMcrY8d3c7sD6u3xBLO?=
 =?us-ascii?Q?KPAAnNQkckHqyzhsKFknNywz6ls1bfEXd+rGOlsPiacxFwxOQOkuq+rWNVOL?=
 =?us-ascii?Q?MvJolK86zzWOm02QbcwakO/EryBsL7riqiNzXGAUkSi8Nxc9h+UFzRpfZe8P?=
 =?us-ascii?Q?HsTKzhnYFGOsvbidGuAxncTn9enzCfFSdJ3unRTaEDDdStQI6PPjgiq69zA6?=
 =?us-ascii?Q?FW82V17Nl20JMTcBExeTZHzNCCKWF/duwaxsG7ZO3h/D5SsKqW23459xdfGO?=
 =?us-ascii?Q?MmbnKKMPWWHNY0zlg0z/ixitaPHv27vovzq1XxzGh7k1Na9aKJaneQ/drzDa?=
 =?us-ascii?Q?SNPvVbbLyfryQsxQCvlbo4wo8Q+Qjxxxt1PlT296Cv/t8/b9KYJEWsFzJnS9?=
 =?us-ascii?Q?wReEeb7uNaKEA8MSY1T75/UjiKkjpyeZluiKyQKVtTtCqTbPX45XJ8n3jR8i?=
 =?us-ascii?Q?zBOIBiCdFi6NEesoLwwlcDaMBEYqwZNGmjMVkL/uMFW1qs09Ujw64vQx+9Bg?=
 =?us-ascii?Q?LDUWEWyt0WRMnTUzba42gZxlmFaDP6QOyI7K4Qd7kv+XmNSlHWRPzIDUxQ/6?=
 =?us-ascii?Q?EEjnXrz/czAYslcexnuFj3IZ12dnjXsuER9DmNwCXmataKupqN9iYbMXZt+G?=
 =?us-ascii?Q?uS/MleUCey3EGUDId8Qa2Jk8D0LKL37gdyvDGdIDmzRCY1qKm+FrTAD2/Lou?=
 =?us-ascii?Q?hnxTJz1XS3DDAW8HyDT8Kgc4fwMLHp1RT4jVdkTTnvhJ9vLgorK+g8LFQ7ia?=
 =?us-ascii?Q?bpnb+ROSzUIqDDAmTEtiXJsXjaoNxlhOefV4x8x7ohaRINCyvQLfU1au3nwt?=
 =?us-ascii?Q?v5BRvTKZRaM+e7yTp3zyjb+tWy12rcAbC2pjgfFdYi72gEz56W4jVRbqE3CO?=
 =?us-ascii?Q?ZmbZgcePFfuusNo2NJNfdvY3qtj1Pz/UCvh//hSYSEfPhy1MtkUZwdwC+FIF?=
 =?us-ascii?Q?5RjxXgXTGxKXw0RM/xZ0/nme5A1ipj7zOIasuKLDC4XTBLV5dMYLzrQCC8B4?=
 =?us-ascii?Q?cKM9gM4o9rTUX0P95QZw0esno1iNQlhFM1i+iN2TGtTHkN4ikIMl+5BKH9WE?=
 =?us-ascii?Q?+cwWnjluhQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	bq0fecZPgJfAm+tLQGYpbyn7/1N/RX8O03KZxmqjwcp3kxofHPqmj9Hnif6wUnLi3iB0wMLvwn4jPDHuD0UM6cK7tsQC8AZY+7ynkjJ8I+7smxYCnhcQYo6cP47AhIW2SB5zqErj1m+FuCWqttlE6BPFy3/yS5wW0Q4UgiVyxkj+9VRYWGtHTB5f7ZicYtIZclDu6o9DQc1jrzJ8Z77psiefFu5eoKdX4sIpKVZXPt/ARTIuGfDE141Ap9NFbcQWtZlnRRIDbTUUR2DaeZzdUmv+yra0Em8pOzCCu58gcEYlQWUbIc1SJLeER8/l5l7M157v0SpBgw5US5e4XYDmYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc19d785-e05c-4646-91d6-08de954a960c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7453.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:41:11.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIzRiYkq3GcC0TVFZRVO3+TsPd2tVicXg30kaM+mjaQEtUOR3d5Fk/MxXON7EijgLQC1X9tqeanWVpxEU0d8qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d614aa cx=c_pps
 a=MCVANC9+7Y5oazsiooDUXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=QAeADARYXfHKyP_EA9UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0Dfc3vcZpLTigQ4qtBdU-F--mBWuIapx
X-Proofpoint-GUID: 0Dfc3vcZpLTigQ4qtBdU-F--mBWuIapx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA3OCBTYWx0ZWRfX6OsN3U91Npfa
 8VatNqMvEsyDV24SD2JIW1cHPNHTeHjt5FVOKCXi6CaosoT9qOGc87LiarE7sr0HBGXeNfZfEVl
 0LCuFX392bvHZ1NetF4DlOrW/e8Yan2OuuxtJvQzhcZcsxVSpzVNPKbhQPIdIPPlmeycEmbZRVq
 WEF0S/msZNPrq6P+wKEmWeuSS+rc9vHqiTV2A+LDZ4IVljqVtyds0a+UdFWsEaeEg885n57Q90W
 MVCVFT1EwE1mtU+WNEGZZRH58rmwaMkqqfcktlAimSfL99vaaf+JWk5kzG8EthxBf5b5qiHbnKv
 zu2P5qJ/ENSooKt2LxQpqY4cluPTELxKqAQsJQ2u6IVO0VH2bnBqVEFFb9ESZzCWPv35uZ6Ls8C
 NHkCRO/Mlhf43q1u/sc4zSj5P5KSzmAjNcBgN9XRHfKHLDtbfvapSJ5LjykYZeo57wH2Z6vIbzX
 6IkH7SFP2YeaJyHRF9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080078
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Apr 2026 08:41:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9688

New version of yq need set CGO_ENABLED="0" when compiling,
and this causes do_compile failure for 32 bits target as below:
-buildmode=pie requires external (cgo) linking, but cgo is not enabled

Tool go's internal linker doesn't support PIE for linux 32 bits target,
so -buildmode=pie requires external (cgo) linking on ARM and x86.
To fix this conflict with CGO_ENABLED="0", remove "-buildmode=pie"
from GOBUILDFLAGS.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 recipes-devtools/yq/yq_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index ac19f2c4..759cd616 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -35,6 +35,10 @@ GO_MOD_DISCOVERY_GIT_REF = "${SRCREV_yq}"
 inherit go goarch ptest
 inherit go-mod-discovery
 
+# GO's internal linker doesn't support PIE for linux 32 bits target,
+# so -buildmode=pie requires external (cgo) linking on ARM and x86.
+GOBUILDFLAGS:remove = "-buildmode=pie"
+
 do_compile() {
     cd ${S}/src/import
 
-- 
2.51.2


