Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E37C5B543
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 03:35:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25908.1749180926708527524
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Jun 2025 20:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82524a7d6c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5562tpWU009017
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 5 Jun 2025 20:35:26 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rvuvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jun 2025 20:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMoCriyNsvg35GEiZa15F5wdPVNE6HZdhI2RZ0p6IVMWv6zhPxGfpG1u9ysvRQcTL8uvfl37XcWIFiRG5fDHplgtIerdLvbdTlRb55GvmjWFUpR33sigWbEZcgMMCOAMBRsl2ihxthu9eHx4E0eDaTGHEewJcxHCfh5u5RDR5je4FKCPbjm0flK47KxaNOKpW066D400TfSk3oa08AscvUpwGbzKyeIaFZcgcLjxnGt76/XaWyRfTLK4NkoRwShyBKqr8Iz7w4n+qRMjzXlDsv2tSYgiuwEWtliN5GQ9hcjKBweZ2IahJk8jOwrw/G281iXkC6qcBIRLT53gjL+uGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0gOhWXtdZ+ijnw8gQogHloqr/gZmhWE/Xoiw8vZf5s=;
 b=KDz3d8zLq300Iw73wDXHYBJDLzbuIjSx+BTp327DzrBhZki39kwQzAgtInAZRhuO8l+P90RdhICwM8lMXlwK3vtYtDYcZP+wo09mXUdLwPTTN2w6zX0sU8BEei1Etwe45lNjhhauCMxUPrdd7WUanlEWP2SojI8rDC03b66/P6As6PxuLfEjKtKccSutE+vD/4ckrumjsAscS9r76mZSAqodnl3KEFnIuALx4C9duDkVICjGjhMwBkCRyWW/teHHl3+brTLwUGGjvrpLqPoqUztC8DutEvB4BW8O9ZaMP+bZYcrd83+3wOjUX+cCBViJTsoODT2XDiBgxUS76IX79g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by BL4PR11MB8846.namprd11.prod.outlook.com
 (2603:10b6:208:5aa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 03:35:22 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::eddf:de3:fd0e:9a36]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::eddf:de3:fd0e:9a36%8]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 03:35:21 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] lxc: don't allow named listening IPv6 address on lxcbrX network interface
Date: Fri,  6 Jun 2025 11:35:16 +0800
Message-Id: <20250606033516.3503990-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0161.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::29) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|BL4PR11MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: d54eec0f-4ed3-4ad0-08da-08dda4ab2a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1vmAgXKjQ6A+mDULPYhfGi0ifOvKDr7hALJWRCw0JLLB2zYYSfuh44TW514p?=
 =?us-ascii?Q?rZSRWMH9AR7gZDsVBvVoRPULwHVqHbBwOjvPi+Ovmg/tEl7s95ffJZNPMo7G?=
 =?us-ascii?Q?GlHpNOAYWMNslGNJ1sCGso9iXerPyPaFSRAz+EBnitz1Ly1P5nKMN4wClWGu?=
 =?us-ascii?Q?qjmV8OgNDqu/33o74nSA97xD/ooWN21RQSHHss+i2wwo8ds/1Yy3ZJgRQG1J?=
 =?us-ascii?Q?IcGZR8R3Zswc2PutLwK1Vb8CSL95LRxkgSRQhk4LyXPUmK7lNJMHA6KQFIir?=
 =?us-ascii?Q?W5rfn+yV7aopR5kW5xKfniFfkQSjqu5jO0BAw4C1OA6YocPTMx4PdYAqrub1?=
 =?us-ascii?Q?WkIe5/enSLYTJ4T9XZYtEipUm6bbqfzbVfNYj0BqMC8ItY84luKux7ZXn6FP?=
 =?us-ascii?Q?ZbBoyAAbVN2GkMKOe/Py9ZSvPq5h5PAu//beQnuf1y2lfNLyNkyVQ6AzggAy?=
 =?us-ascii?Q?zVZVF+mRec/FImWWA1Dupcw9HMeAoTqL80Fyiy9KlFK3fXWQpstX6+PSn2rY?=
 =?us-ascii?Q?W0Un0aRwp+tnZ3aQVfWbLljiNjI59im4+N2n0c/FSI4WMSMryGFbZTrOpx12?=
 =?us-ascii?Q?mqNDk3q7YdI/fbGadgFrflXVbDUhD+QZKfx0xIRvV2yjq/AmR9UGPM1k6ZvH?=
 =?us-ascii?Q?QLYNZvD3nTwJLx7DH+JsQYo+sDJejNavF5y9vDUD2Rz9h0WAHVsQLyZVxBMQ?=
 =?us-ascii?Q?l8QM3OTrNMJGi7rDAvUX3J9jHM939/bd2VLflWxibmKqcuPkqOBiqA6mHLEj?=
 =?us-ascii?Q?yRetcAbfT25YVLDbZWTGMRm2vkWVzyJWlEouhb1UVVcECCE2oudPc7Z+pB7d?=
 =?us-ascii?Q?lU/gHiPpbJbpZm4LB/+56119WFKyt9KPIV+hkYU5Wwgeg3+hlhnpYxKdaKpY?=
 =?us-ascii?Q?IriNPdeDxovpWmp3oZFmc+QaoNt2hAiHlX7l4kDCTplGWh/hfgA/WrdD3meu?=
 =?us-ascii?Q?E+AI5nGS8xyl1UtiKRCP6pxA3HDHcff67jwt/3byw9xurW/F2+9aoshFqa6u?=
 =?us-ascii?Q?tIOprTi6rJXuw4qaaqud27m/fNqhAqak/zMJY4r+GeQdSJXOrX1q8cNSeiaQ?=
 =?us-ascii?Q?YfEjzs9PPNCyCaILP6fNr24WCx0r7Yss9km69wmmtIYeH80xo9FZFoAvFOod?=
 =?us-ascii?Q?73LLzvC8x8gQvcbHFxnw74AmVd6yJLEPKpz9L7vHIwjhhzZ6DtESlZqFneYA?=
 =?us-ascii?Q?ls8wEvhHaHsVvCsnrV5bv8lS+WWOOkVku5cTdBw7d8L9nVykFYGEfZ11lxR+?=
 =?us-ascii?Q?yljGwXOtoTny+s5GsUpvsgdw3AZXStxfCNqp8bVguJmKU0SN6XCGUQ7XkNjr?=
 =?us-ascii?Q?8wPJ60TNdSgZ4Qmbp0kgz8zkEc3KuMEOoeUOW+C9z0zGAbAk2A4DwTU3Pnxb?=
 =?us-ascii?Q?0H7JrGALN92SyMGDiZ4KqKi3ihsCXFAvKaa4rldIc/XJkxnWYtdMq/CdLtb0?=
 =?us-ascii?Q?GKDkaT34SbyaqBk2lkwVmhtT+yMbz2FNZKprUSbn6gW3rDshx9dkIwMkZInA?=
 =?us-ascii?Q?PVJfHsfb0hyjhz0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BgTO/aMe9/XnFnBtvZ7RF3nNAPWHOvzVb3fmqSmhJSLDHP4QthBDXu01bilJ?=
 =?us-ascii?Q?+5ALlfWy6Ia1GgYQPuyOdqMrKEs99ML8CKhoqHTwSsFpq4lwj8SFD/02lULk?=
 =?us-ascii?Q?01RjxXOElHehxAWGAfCuZl39E2q442/ghq8BlWWORO3AC4Od46pdSyv4tryN?=
 =?us-ascii?Q?giOmL6urGIGvHhx0YPrR4hKm6sP2SATw86KrACKxGWgxRBVGEFNXJgeiANg7?=
 =?us-ascii?Q?t8nfxFTGjFHc+h8v7cGvBf4/6IdCpH/RjPwTPHhLU3BjfQuAWV1s3obzfILn?=
 =?us-ascii?Q?dxuS6fL0UOWBOoJlMlBZ5dgnkovQwirOcu9D8rO/ET5552LNp16nqMJSU5Wt?=
 =?us-ascii?Q?oxiEp6NP6uVdQ7x0dnDuql3XtkKgPvU+fA6jb8z68IrSsMIIMeKpvYlmjkK/?=
 =?us-ascii?Q?PZ7tR4FBOJsS0E2PHGPTw1Y43v9LObl/cyVhJe7TiJsBxZQqMDa0iLhLFDiY?=
 =?us-ascii?Q?PrMYnwauAAT0mZgF2+zddEcSthzE9bugPaORyIJHAkS2Ysm/Vp4VeEbsCe+R?=
 =?us-ascii?Q?o3gQmbhqXimL5iaI0ei9ikPbTRu9iJRrNvp+YXIwmAb3I9Fvyg+reBAej0/N?=
 =?us-ascii?Q?2cOt2/f0jgKxQpITJ3WE+awOBoivX59ZZRGoqPUbgwipI35ZudEGE7gzaeyh?=
 =?us-ascii?Q?75rNfOrpRC2XJ+nrYjx4ZStSYTX8+BZo2hNU9EtUWQcxWKHf9nvj9u4FmPCH?=
 =?us-ascii?Q?1ZPUo6DFtX+6XmcyPhRkOmqWPyq2tF57DbFqTwU0peeyXFyVv8ltlc2J0MI+?=
 =?us-ascii?Q?eObOVPk84FMQOqh+o4MXSJBZw4s4hp/dxisn4Lw0+Ya2X4CFdlmxLfiXRuLP?=
 =?us-ascii?Q?GX8PRe+53xiNnCJB2KnmAMvJjcTUat3Jmh5ruHMaHoKUd+2VITY1objW1EXJ?=
 =?us-ascii?Q?0ursE/BNYXqbD98P9gK/dAsZJncz4goZIBr2oXLujN6vZ+h0nHhJvUVisqNG?=
 =?us-ascii?Q?Iz6HcwNBEsa6KF4rBmEXavZticjshfe3+aLV2WvCqo4VTMUivY+rcfVwrjzp?=
 =?us-ascii?Q?OW6Ch+tlAIeZVcazILoCOkwkJpD1cOdcoIEDHyXRW/xp9woRhA0sPyz2TXeY?=
 =?us-ascii?Q?ksrDza1/rXleG/yY/nWcypOnEWbGw0T1q8J2UAArZN6Du8EnbOhcWj8E8F1L?=
 =?us-ascii?Q?yaG2NhFCuLtXMzVvd3WPPX46//SykN7P1eFbnwLBq8Q7y668IEX9q/7c5OB4?=
 =?us-ascii?Q?74q4gxEMB8QBizuJe674mu4VS2n5USzmjB1+e9IcYL9qO+R8GnDAweC9BPqd?=
 =?us-ascii?Q?+uLNPoA1/ONR00PierFBm80j0UHS0IeyWd7V89JM6fbXdgedM0MrtEFs6xdr?=
 =?us-ascii?Q?C+M8UNn6+DeoUAaKE2SWXYM/L1R2msSFfnHNAFmR0G+9WgVGf31nt7QKXlX3?=
 =?us-ascii?Q?8wHqZ+UqIs3ZaS2c8T9HY863uVRAO7v8Gb2QTheIQhXPttVKoIPtRVCB3Nuv?=
 =?us-ascii?Q?r+Ukf9b110ubXv0FW1OqVpprNs2K6sCWlxXAEV9/quxalB9+V7jAg73uzImV?=
 =?us-ascii?Q?2XzXA1STuMEiHcJFKa8tHJvV3lkIN0kr92f7abBaY64lkYCUzLpixYMK4/13?=
 =?us-ascii?Q?pk3ZWoA1K1M2Td18clt5Ngs6feo7+Cm8CwIsWMjFduFHTqpIBwoFEpuLgWL7?=
 =?us-ascii?Q?/A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54eec0f-4ed3-4ad0-08da-08dda4ab2a2a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 03:35:21.8187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYSGbXcEJ5G31QzW6qFCWRul1N//jcQVMpgc6qink5HUL1s+5e5N9xA23Mu71dNTSFtPGLXbNlRxzmEUuPUO8qapd5TQbj0Bn+aAAaGMsFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8846
X-Proofpoint-GUID: 9mMAEEHCLyZlNTtBnczlsBjJLna7fYPx
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=684261fe cx=c_pps a=yRdPyDuw7Sx63jVS1OevmQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=uNKKGHSHmfObZM9MBakA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAzMiBTYWx0ZWRfX9wjCpnL90row gszUCQtHnLdCPzrAFDL6R7wLSSWS5uEfNBaPY8lLtTgjtk6GD56nPdHl73ZauTcKzKgeOdQ1URv whhrGGkJuvIl4TaDd6Hqjl7L8/8Aw13jhx0df40WwypRell21tTeifr1qdbYm23EFT39US1xP7H
 o6DuyE2BGx/lhWJ1r9DrY3clzyon6fnWapp1eQIZ6kCQ8eIZgznoAoktqgO/Sr+bLpZ+1PXzoHl birBVW0dBEWZgn+qwctlYyBI+rJXJC7NtCjk4Mku9C+RaGYcHNNfKZQ2K7R1xdsLxaFpWoX1yY3 zneAq45+EQVypVgJBLaTQy3FHNbGdDK/A19yClBZREzqrQwsv8fewVJLH4K1FJ91bmHYQAMmNHK
 elcdDEDTppVwIU3rX5qS3/NB97Xy3oo3c53s1wRLY1gmZqHKFvbmlRIPmBEsyXcm0wxtf41H
X-Proofpoint-ORIG-GUID: 9mMAEEHCLyZlNTtBnczlsBjJLna7fYPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060032
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jun 2025 03:35:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9273

From: Xiangyu Chen <xiangyu.chen@windriver.com>

lxc-net enabled the IPv6 by default since v6.0.0[1], when named enabled on
system, the lxc-net which based on dnsmasq would fail to bind the IPv6
address on lxcbrX interface, that cause lxc cannot work correctly.

LXC upstream changed the default v6 address again[2], we need to line up with
upstream. Updated the lxc-net default v6 address to named.conf.option to tell
named don't bind and listen that address.

Ref:

[1] https://github.com/lxc/lxc/commit/e8888344
[2] https://github.com/lxc/lxc/commit/31012d49

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-core/bind/bind_virtualization.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/bind/bind_virtualization.inc b/recipes-core/bind/bind_virtualization.inc
index f942d7ad..bb4e22b2 100644
--- a/recipes-core/bind/bind_virtualization.inc
+++ b/recipes-core/bind/bind_virtualization.inc
@@ -1,4 +1,4 @@
 # Tell named not to bother listening on the IP address that lxc and libvirtd handles itself.
 do_install:append() {
-	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n\tlisten-on-v6 { ! fc11:4514:1919:810::1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
+	sed -i -e 's,^\( *options *{\)$,\1\n\t// lxc and libvirtd would take care of this address itself\n\tlisten-on { ! 10.0.3.1; ! 192.168.122.1; any;};\n\tlisten-on-v6 { ! fc42:5009:ba4b:5ab0::1; any;};\n,' ${D}${sysconfdir}/bind/named.conf.options
 }
-- 
2.34.1


