Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17058.1792650943404240255
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 23:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MoN8ilZM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4755789ecc=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M5qTb52547382
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 06:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=oCzfvgN8YRlJV97UPj1k
	BOZbSjmgCqKHGyyfKkRpVEM=; b=MoN8ilZMKAECvaiBntuLASiMBR5fge96b9Aq
	/qmEdm6v/mlqnQepwd1pjKiL84UKA4tee5N2Y41JIAe34JZ5IiQMKPku91MGqipD
	rRktE14PcVza9M+B/7yVy4QHYbu++I7Y/JrJepTMtoYooUPmgIMkmm3fbXfOs92g
	Mo6PKVg5dJVsFSSTQqcS9GxXxEASBlGXb6a8T7u2WL2ozv4MmbKNaEgfAkXyt/7k
	BzS3e+woywLahRRipaRyLUumlLM3O0qncji6Y5JAUj2of2sUOLzDZgKHZKNSVpqQ
	upG/k+S0/h9rm6fXcbm1+G7t8SC4ohIp5hWCc4u2Wi9aXlscgA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023096.outbound.protection.outlook.com [40.93.201.96])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hf9h086sc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 06:35:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmMFTVntoykMkgAYO0rwiICWLqf97Q0Tgt1AnUtvyrDrMIudGPdxE+bZlTb0JmEvbwC2ZeRz4IPa2lkIVikW6wLFQWb1eObp/w7ls3Nh16uTiMoMf2Cg0kFYzcL2ckdku0f556Zt9is1CreUK281cKs8t4MOSglPchfHV2jMPIf7EDiuIhceaVcRYZN/I1DRziVAblgtuhRUjr6Yi7rlplepeAqd9aPCtYSKlRKFgcqcMwn0INMpt18gYD4HVBADv0aOYbV6AsjsJKm4emrAN5WmQHn9Ar6rvNP059w3+7MzYGub8lZvmXlZRhXQXouEafvelmcUTwcWvO1TVV9HrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCzfvgN8YRlJV97UPj1kBOZbSjmgCqKHGyyfKkRpVEM=;
 b=QI5HXgYzZvGADae01DTEMz/0iG4Jczaa6AI6oXXvCSG6vrWezjE02ILWlAQQpc8hqwfA+aDANErBGJXtmhAawwXPHIE9VAE8SMS3xJra8qvBPE2CEqxMdXLxPsEdJRwIRmLv223lOrlvPVniE58Y8+x2cL/wKAG/A2B+W1PrWqnWFDoMG2GU6B4wxbBlELlaDVJYM7xZ0S9nWH4UAHZZ977LykjjPNGNNRQ48zn3QoDH2/AfEduw9h5fiLZCCFyvqSEaRV4KnyYG2ZOSPd0/421k0J3xaX4h+1xMln5BfFiX4txEVibYr77ldME1ksNUZGnXMbnXUGRk/AKepsD5Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by PH0PR11MB4838.namprd11.prod.outlook.com
 (2603:10b6:510:40::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Thu, 22 Oct
 2026 06:35:38 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 06:35:38 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] libvirt: fix CVE-2026-18917
Date: Thu, 22 Oct 2026 12:05:11 +0530
Message-ID: <20261022063516.2962008-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Type: text/plain; charset=yes
X-ClientProxiedBy: SE2P216CA0107.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::12) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9af2a0-d359-422c-5409-08df3006af81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|56012099006|6133799003|10067099003|18002099003|261021123027099003|3023799007|13003099007|38350700014|261021130227099003|260925022911599003|260925021911599003|261021135927099003|260925021311599003|11063799006|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: L3i+hjipI5Q4/IH7V0rI/t6dLxo0fiaGB1o8DhQdM37IDCw4RdSIlEpUlqzMF6EGOt+36Rbya5pWt+rqUYbz9PyTAnAceFwxY3zlJuoeIny0kQzMtQF+SkR37zcdgE6XzCKfwmLcHlpGdeS1SGYA+M2FC8pvRiwqIC16nzqcOtWofWlY5JVop4vRZMgIi4j19qsSXh+05tlrarAAbpV2vQV67+qwvPdfIDdQU5Fa2gA4v22NF56k2lhtshxW+Zv2mm+ev2nld9/laA5yztHmDpzN9VuzjgMcuZRYGLM0+lsHF3xjtP40aTxz78Y80xYuUWIZ/boV/naxfQMLuWQeONJCi6Is0HvDX50a4J5WBvnG3XrYGtb8lPnDrIMwE4AjnBKfHLSHlpS2fD4lL+8gwPotUiPnTDGmtM93HmHet6jVWlT+3C0cYkR28zzNA7qWotjf2d0H/BfG5x6m7/6xfW4XTaVK1oe2/e5uCPBr1ggAi8gZL9sa1fBP0jH/SuZTPuhxKg9I5SVflCnH8sf8nBrcEmy6TJ0yUdffZDzmgslJSwX7Ck8GhS40sf09F+6I3N3kz75e0G+7IjyFiyogMd+gA+icoU9WgrpFWuCQWy8+vtK0+BitDXLOIQMSdyG3CPOMqbI/YNmds576RniRJoAeRiwApitXyNhvsSj/xjIYVhCWdEqqCx/Omul2MQ0YEufZJWR8bNs3NSiQNTKJuYP3PKO9JJ/oLvIIAWDepYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(56012099006)(6133799003)(10067099003)(18002099003)(261021123027099003)(3023799007)(13003099007)(38350700014)(261021130227099003)(260925022911599003)(260925021911599003)(261021135927099003)(260925021311599003)(11063799006)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fXJksTFDWaJOUEcnhRWt8Z3A26/JJkFouArH3RXXt5DPZcIZQYizCyrgZuLk?=
 =?us-ascii?Q?Ot232hHvOIDgehPKGXMdZXbJ8/I93nReVhTwqBa3TgNdw3N+GJEK0VX+EMtq?=
 =?us-ascii?Q?frV9gJERra4QpW1JDndFxJE/avUYPnM7GDdgo6JO40+16drb8AyfpffEw4L9?=
 =?us-ascii?Q?CzHo+YxjrLzWu766wIMatamAX2gjQWoNLRGccOJQwbKGDNZRtghihX2cHuBE?=
 =?us-ascii?Q?YNc3HN9xx04Wx80BXgxQ5I2ahBrAgUx72NTwQVw5EK6Agu0Fpj7kcXocUlSe?=
 =?us-ascii?Q?4eIIUW/ZMusYKk0crc6/orwJ8uUH9Oi+XfSp5U24dZlNh1rd8wPCyKlSOP/3?=
 =?us-ascii?Q?P374El82dPYrqtjv8uR8iUytCJXTnOO1zIYdWcqYTv5C0Q5L7OITiDvhwT0U?=
 =?us-ascii?Q?BrpKSPeXVhxq/4kblZwETA7eBqlkao9+1vjeECJSitaG5fVcDAQTzD4nBny9?=
 =?us-ascii?Q?qJM4P+al2FXwdJmxkG6vlShffNlIaacCFbOeQqFdNj2YP9veeC5KzCxIF/Ql?=
 =?us-ascii?Q?X+zkwVW7ckXP9v5plVsdrROK492rZ+krStaMA0L5gluPichK+2R/ySpmrykV?=
 =?us-ascii?Q?Nc0H006267uog0C34/3FCZepsyoxVE/sm4ZgFK8XUOHbP0+tLg2r3eWCzQiE?=
 =?us-ascii?Q?j+e9yMd8SoDkt+85FieJb/0jOYKDVkxPmfZRU4EoQ3L7ufQnCFxkH402O8n3?=
 =?us-ascii?Q?+t3KUKpFLTYH3iNBci40hZdOnRdpi0H5QzTD4LeiNlCpNiWkjO6dbMLw4B8Z?=
 =?us-ascii?Q?tHN+e8EE7QQB1DZB9doykV+iA7AB+dQujImFfJlIhBZ+UPBBAcUVCekHcJKR?=
 =?us-ascii?Q?r8uE8OD1JKnDvrgeej2dBz2NzEsyk///XJN0PGfLysA+c593C5CvdMMvr5a1?=
 =?us-ascii?Q?MINMZeSHwaWzfS+u2nPsn+aOE24X/Rk/kpNaJFV/hjFbdfklLHRXaImJ/vw2?=
 =?us-ascii?Q?xb7+xMZsz7XP8vYt7dWABnPcJ8HXw94QPJVUPve9c7qRf9Sm3NoJALqICKma?=
 =?us-ascii?Q?YA/dYkyr7KAi4S91HdNjXYJvN6cEQZlc+oyQPY2i4SQN+inmDvrg6IcYvt4Q?=
 =?us-ascii?Q?rhoYNHjAihENft8JO+R/kWRL0RHqE//taC6Leu9Tx4V9mzG4YQJL1Q1i6K5o?=
 =?us-ascii?Q?RQnJLOk63zXfnLwl2GpATiMOsdeZjaBH7oTBBidboHtaj32m+2jkAVpyL4gv?=
 =?us-ascii?Q?McQGemNhixnY1xTYGC1Q7JlV0dPXQ8LdKoucjOmBd3F1bd2vH7eU04Wn0Mc9?=
 =?us-ascii?Q?VkDWcBE4MLiA4Tl6UMcVQV7mSJU+SCSj3bxYpfVakCTCfkjkwU3RO52JevEi?=
 =?us-ascii?Q?KUi6tQDet6hh4wNCUjcS6fral7R91O68t8bGgy9Kc1UWq7oFcJ0zttwcgi6Y?=
 =?us-ascii?Q?TJDe2MIbMHPEPABJrCwMLix+UdwJjFvl2kGs5XC3LgRj9YvP6CvIwLFme8iT?=
 =?us-ascii?Q?ngoMmMLVVUk07Qr3S8eW+P6u+vBiG2lk7D0W79Y9AwIXC6pkimPeKLXtCOCh?=
 =?us-ascii?Q?Or+jSezcC+qZXnCFFu6+h6hvhlvrh/jzq1+0yHACDNJKVyx+Jx7qTUZ5GylY?=
 =?us-ascii?Q?CmsrcyeKNqL7PueR3RbzboYv5Ouuyth0afaNakFz+0Hw1KNQ5bnxw98Oixp2?=
 =?us-ascii?Q?l47NH08UfXP89Z6jlCP97Sag/kJ6d9k4P4sZuK6l4isX55UNQ/VPwzyh4wJG?=
 =?us-ascii?Q?ZsFNI3Ma1S3ccIoRj4u9874iIzDnh622gUqDjG1WeTI7maz0M7hvmLySqiVn?=
 =?us-ascii?Q?73sLqcak/RQRracz+XK6gl7JsGbLW/I=3D?=
X-Exchange-RoutingPolicyChecked: noO4IdZ49T0jw798ZExjYdLKbA7FNbvDFtj9YjB/IbbLAJP/Z3mnGmR7oM0OzB4V9IGOYYsO3Uyf1Sr94sRRXofeSGAw6nZV6xr+8+J7zC7vQXRLs/pOf2Hvsh6LDvEtlIWgUYNJ+rwETVusZm2xKr6FyWa1iKbum24phEW/Cidb7bdkxr1voaL6efU1JbKvj/ZU3gqLae1tZoiQ3gvhkL7dU4ILQ/o0vCD5h7/0JKxuDzrdOH41K1jx0rQCylznNPtsCancWwUYjbq3TRvibocdeJnVXatmQUBM1LuPG9OG4qfDEM0kKTWXVTcT3ibF09Qup9WXciwMXog4SE2o0w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9af2a0-d359-422c-5409-08df3006af81
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:35:38.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9pPCYylAx/EVh4ikTn3ApExB+NEIC/IpRd9wUO86c+c8ChqjlU59F8IMRYEAbWJ6LBbX05WVs/NLQshNvxuLP5sD9XsLsRHM73c07YMDmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyNSBTYWx0ZWRfX2p2DIaCp/24S
 kg1HrRUf80W1UWbGSMh6unUp0o3M7NvfMbEgumO+bVm8fEisR/gPx1N79JmSvckaMlL+iRVS3Al
 TR7TxqEa7ZHW8K9v17DpBgS4lJG7J27aucsxNNWxogEezHUnLVJG
X-Proofpoint-GUID: 4aYXDMJsqFLN9p1E0C4wJMtVQmSRDm66
X-Authority-Analysis: v=2.4 cv=fPesTpae c=1 sm=1 tr=0 ts=6ad9aebd cx=c_pps
 a=8ytssxGH5sXDYVMDm1fH2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=WN52PlUurRMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=p0WdMEafAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=NEAV23lmAAAA:8 a=pqoEyW-WUp3kZ8g3W7wA:9 a=3ZKOabzyN94A:10 a=xE34mhsjmDcA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 4aYXDMJsqFLN9p1E0C4wJMtVQmSRDm66
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyNSBTYWx0ZWRfX9zxkU10fuwHI
 4OkuYDgGsVProWw3sJVEgZMqGtEvrToOCWL6Unz904VR6I1Wd/Kaixs7n4THq+v2drcFVoJeAQ3
 Eo9piq/rCTXX1PeD1hVpWqGOxZb1O+K77nwFlyRfCPMwXUoPhZDhdsXhXGBqYvqGu85jAPXBNGg
 qHo2KRMH4LyRgTnlxEKFEcRzeZiffGT9fH/T3lx+63zKCQ+PC/kzCJVnWd3vUidq8dil3tLeR9T
 Z2xuMs7CJMepiZG9qoCa1KTjrN1ScJ5f+J89FwsjTx6LH8fXWUWj2ZkT/JbnkLte+6C1GZ6HjVy
 72WVEGDobR/7jvAQmeQTskxaLbROxQAAI7jqIrz7jjN2nmk9kumYHSEr2YAamjz9mh7COIhOCO6
 ac8y2Y1uRkEkabJkE44q3iKilQpXkgV4mHsqqQDCvZpYB05pF2P/EOKSOh6dh4c/aJaOVvCYSb8
 ylB006u3CGBtR9c7ekw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69M5qTb52547382
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 06:36:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10119

Backport commit[1] which fixes this vulnerability as mentioned debian
report in [2].

[1] https://gitlab.com/libvirt/libvirt/-/commit/5a62cbf2907d4590283597b46=
da9c0f41e7b4d4f
[2] https://security-tracker.debian.org/tracker/CVE-2026-18917

Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
---
 .../libvirt/libvirt/CVE-2026-18917.patch      | 71 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_git.bb       |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2026-18917.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2026-18917.patch b/reci=
pes-extended/libvirt/libvirt/CVE-2026-18917.patch
new file mode 100644
index 00000000..8b8b84ab
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2026-18917.patch
@@ -0,0 +1,71 @@
+From 5a62cbf2907d4590283597b46da9c0f41e7b4d4f Mon Sep 17 00:00:00 2001
+From: Peter Krempa <pkrempa@redhat.com>
+Date: Wed, 12 Aug 2026 16:51:58 +0200
+Subject: [PATCH] remote: Fix integer overflow in RPC handler for
+ virNodeGetFreePages (CVE-2026-18917)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+CVE-2026-18917
+
+The RPC handler 'remoteDispatchNodeGetFreePages' multiplies the 'npages'
+argument with the 'cellcount' argument passed to 'virNodeGetFreePages',
+both of which are declared as 'unsigned int' to both do an RPC limit
+check against the 'REMOTE_NODE_MAX_CELLS' constant and then to allocate
+the memory to hold the result from the actual hypervisor driver.
+
+Since both the values are 'unsigned int' the product is also unsigned
+int so big enough numbers can overflow, both passing the check and also
+allocating not enough memory for the result. The hypervisor driver
+assumes that the passed buffer is large enough and overwrites memory.
+
+When this happens the the hypervisor daemon crashes.
+
+This can be triggered e.g. by passing 1023 and 4198405 as values which
+multiply to 1019 after wrapping to 32 bit unsigned value.
+
+Use the VIR_INT_MULTIPLY_OVERFLOW macro in the check to avoid the issue
+the same way as we do for other APIs doing multiplication of arguments
+to determine amount of required memory.
+
+Fixes: 34f2d0319d2098c77c8cc27d8350616029125a2b (v1.2.5-164-g34f2d0319d)
+Closes: https://gitlab.com/libvirt/libvirt/-/work_items/903
+
+CVE: CVE-2026-18917
+=20
+Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/5=
a62cbf2907d4590283597b46da9c0f41e7b4d4f]
+
+Signed-off-by: Peter Krempa <pkrempa@redhat.com>
+Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+Signed-off-by: Roopa Kalmath <Roopa.Kalmath@windriver.com>
+---
+ src/remote/remote_daemon_dispatch.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/remote/remote_daemon_dispatch.c b/src/remote/remote_dae=
mon_dispatch.c
+index 95ab173b7c..e548438250 100644
+--- a/src/remote/remote_daemon_dispatch.c
++++ b/src/remote/remote_daemon_dispatch.c
+@@ -6752,13 +6752,14 @@ remoteDispatchNodeGetFreePages(virNetServer *ser=
ver G_GNUC_UNUSED,
+     if (!conn)
+         goto cleanup;
+=20
+-    if (args->pages.pages_len * args->cellCount > REMOTE_NODE_MAX_CELLS=
) {
+-        virReportError(VIR_ERR_INTERNAL_ERROR, "%s",
+-                       _("the result won't fit into REMOTE_NODE_MAX_CEL=
LS"));
++    if (VIR_INT_MULTIPLY_OVERFLOW(args->pages.pages_len, args->cellCoun=
t) ||
++        args->pages.pages_len * args->cellCount > REMOTE_NODE_MAX_CELLS=
) {
++        virReportError(VIR_ERR_INTERNAL_ERROR,
++                       _("npages * cellcount > REMOTE_NODE_MAX_CELLS (%=
1$u)"),
++                       REMOTE_NODE_MAX_CELLS);
+         goto cleanup;
+     }
+=20
+-    /* Allocate return buffer. */
+     ret->counts.counts_val =3D g_new0(uint64_t,
+                                     args->pages.pages_len * args->cellC=
ount);
+=20
+--=20
+GitLab
+
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/l=
ibvirt/libvirt_git.bb
index 34a1ff21..e42bb400 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -42,6 +42,7 @@ SRC_URI =3D "gitsm://github.com/libvirt/libvirt.git;nam=
e=3Dlibvirt;protocol=3Dhttps;br
            file://0001-messon.build-remove-build-path-information-to-avo=
id-.patch \
            file://0001-tests-meson-clear-absolute-directory-paths.patch =
\
            file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
+           file://CVE-2026-18917.patch \
           "
=20
 inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
--=20
2.49.1

