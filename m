Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78702D58CC5
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 04:49:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10577.1774241386261525583
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Mar 2026 21:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hqUrhGrD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=754277e1dc=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4eiNj1242389
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Mar 2026 04:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5vvR8ZLoWeNTUbNLUXyl
	Lr7ujd7Gbzxd7cGCrjuIO1k=; b=hqUrhGrDBZ5ccqeQOUPv+JZ5jQKk/RqTSkxE
	HZtT2HY6rhmHc2hwHXFbDlsIskcU4vaCJhjYNTpeAswxAruMaE2Z3iEIqpxNRdv2
	NBhp2SezTNaQx9KXGjhxz0FZ2H73nXWHSSQa8nnAfHvcpmxF5OfGJbJM+tL5EZCz
	smvKkCOIIPy0sz0ms550bsCvELQaBazExUshj4/axwHdrXMbCMoY+OIzfMYMEiZ4
	yM6F0CkTOmBpxR0YUJIoNhv46b8+/aMuR+iuoTQW/i5ZC6rPGkHISnCPv7n34Qvj
	sktaWRFUn6r04tH8MMstLcIINCYil4qO7HL9QMRPw+rJWQgxKA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6sekf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Mar 2026 04:49:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYXsE+/J0mfsfTX5y/pgoRo89mm+QCdiBJVLetx3mzcAjOFMokD4jpahz1fygy9JaJLX/Q1VfWxMJEOQtK1cPZI1JlbZtZfGhTitdZ4YYfv4OZc7g/YIulZwoHKYhPqPUvwKn43AsXstkYbB1xuWxupuAfut/MUbcAJDwMn4t2cqd3AiNpgD7XhLLgufc6NJEjsod8FEMbyZfBzkt/D/Cn0Ct12JLSxJHN0uhPENRMNlwhDm8GPjTsoTprYzKlZYvDwntTV5Wfl0VuElZuPS/PrtFaqMrjgESt/DI02DBdVZgzVd4sg418A83aGoMABT0CZbxK+HSln4De3g9dIGOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vvR8ZLoWeNTUbNLUXylLr7ujd7Gbzxd7cGCrjuIO1k=;
 b=BRrrqeY4VeMTk/sJOv9Fb7M+X9xgP6ljdtyhSMqOolIlkWGN/6wndiiOjlix16S/3Qc0NcaBTGJj3+IiTyqGQNCM4DQ2wS+ZsFr+yg0eqOQb8v8conEhRZSfe/s1kUuRMwYZ3LPQkjclpaX0HVYKpUbHbaGt0kErR/kORVdOxdxPioJlFg4ZYHLy0uecgCmng+GA0tbLh9WONFGswj5KacyU+xgOLkjeVBF8s9o2aeFyQ47Gkyzy3EImy71NggOdOCk1AGlmcstFWNqrCKteAhq+wo9GucsQ/tvdhiD+gWw6pgep/he0mu3TGyhqKYnHgBepiWJQRu6Zh+DPAbzRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6539.namprd11.prod.outlook.com (2603:10b6:208:3a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.14; Mon, 23 Mar
 2026 04:49:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 04:49:41 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] runc: upgrade to 1.4.1
Date: Sun, 22 Mar 2026 21:49:32 -0700
Message-ID: <20260323044932.2015263-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: a9eddd5c-72c8-4e70-7fd0-08de8897985a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qup/djDmopBggUNXJzHxyZBnaq04MKq2jk0w8O8td45wbtkwX9rIXHvJFAPJ98rkxbAtZUoyniyuapQrwii2GpqQSO28q9fonV3/OnkuXUsIQLJI5bTdDn7hWjKxSmiKOEfsXnowqDDNoUu74FHy4RBlcP/uDDvc0RgJ+wKvW+7NZK744VmWUTChjHRTLptw7P7OdLTjlE2LHz4df9lRBTKb8D6ZUpaQrhn/4wSMXlSlESLSQq8fnaD/dAAJH1TOSQD8v4slwTXhw6TfDT4Sf95bmXxhTVW1C8vPjMUIOb6gNQX6BYcLJttFg9hfavovFgykiZ/Kpd52fN9X2CNxwgkmszkcSfQM7C1TfVSZR49FPDItBCkCKmETsfASDad8EzjsDOjwjwBk2cdpH7kkM8AY9gkYeI32WXkKIN6KU4V6lZEKug7CaWHV0ctv8U1vRl7G6UpfFs29strxBn6VBNPRlrsESO+lbHHgF70oA6fkl6xcZ7ZGulFXUzZZKQJxqhyfksYX6ZwwCesQjwvWsjyKALWMUwKLvP7EYX+kR3eTQyNUG2S5cdJ7SjuKWYSdE7f21Ly9OHUujNLsoyltUyUPR+BlO8wtG23qBYnvhcFQgF53nmtHEQgOLld/J5GdjA7Skp/TgLM71hf9PFsLs5GrdC5GVb2U3oxEEvJGxXzCzOVXLhyE4gUxMGX2jtd4Gv1nd04stuTDzWKrWRUCs3+fB9RBhwNK4lmGJcTZEwtFbf6wKFSsXD/LThtlvnTp3LJ5OD4ERzH/uoJYELkpMmqKJ35wXJ7XzIwBBvkSA04=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Rrt2RmFthQLEOhI446HJu7I59trd+7Up9llywNmJD2sgU+mJhw2105nHIVB?=
 =?us-ascii?Q?Ypo9mX9hWkk2/dLfcqwuCvu8xIOClTwP7XA3y1/GEyRepyfkEC71qRfgo6Di?=
 =?us-ascii?Q?L8dj1HyB6HtXEkevEQokikSaDCCl24qtAvRof8xzQFopaACmh0NXcqdKXFVA?=
 =?us-ascii?Q?ey2kS6gwj+aXBBMSM6YRU/HwDKKeoVAYNB4OnMB4s5fa3MBJNTf03tZazZZg?=
 =?us-ascii?Q?CMguA1wExrcs2IT3FtcX+/72QX/i08B8HMR/Za47Mu18lsn++3X85eFe2PUt?=
 =?us-ascii?Q?t3iNDU1uDz06HrhK6VX6rmM5VawhKF5AAA9ilWu9LQXmacY/Ys1BUugulYbh?=
 =?us-ascii?Q?9uWSX8pzSREl5StBgNanCWO6wIs4hokT7R3S5sm7lECuu4Ga7AvZj3+fwTph?=
 =?us-ascii?Q?i+WZHEzbt827Hj8L8mVmVrHy816cGG0xzwBOlp6OJuzvQbdHV/tYPp20SNM3?=
 =?us-ascii?Q?SEbRymkH6dT3lonopy8e75YiyvFJhTT9OT5picDwm8tSld2NkwSefYkykg00?=
 =?us-ascii?Q?La/XXUHLkDXTfuYl3umTZVZML8uiKfMtAj2VKIuLgBp/V5i2oKwsK5bNQsh1?=
 =?us-ascii?Q?EzoAu7sxUJ6SigowtShsWkEeg1J2PNYpR18QS6+3bJZJZzEeKcCgrJGXVF1j?=
 =?us-ascii?Q?keL5EW47CGFtDGyfaJGGDfnMom9tjJ+sNHvsJl/q/za/lCjhpjSZZ5jdRcfA?=
 =?us-ascii?Q?i8KujKvkk88g+Y2lKWc4OVopewAyJ+shboG4ZxjnIgdrTf53/Fkvyk2nE+WL?=
 =?us-ascii?Q?skmPj+rUrVtxEyerMpoD0p3lHyVt40rze2ObcXBy6m7Qh+yryYqvwmhdehTA?=
 =?us-ascii?Q?cmo0f6FcebveQW+KMiRLlIsqVeV0AnvvVbKZMChV3QN7FykUvBVFuOr8xaIX?=
 =?us-ascii?Q?2D3DsP0NSHXTs73ODwHa9B9gqGGsBKJHA1iAuPSAfDAyuvLwUviDiauTrpz/?=
 =?us-ascii?Q?jyRaGI23gggN0NYD3dxATHfYJAKoZWc9KF4s6JLgZ/MAKqlMdw+GS10FL2uW?=
 =?us-ascii?Q?48jgDskUvzoCsXEq+vmhZq63m7JYcrERmrpe14w7zl1sWfjGN3cq9Mp8lBgz?=
 =?us-ascii?Q?02uO/G+OuHRVcywZDNeeQCBRSfI18CjbeZzJQmyJH605rPcmkxP6crNbNYbW?=
 =?us-ascii?Q?+6fweWiLMecfmXyhGA2Ph1B2AQbNx1zqHCNznNkHtw9vrw6Qeow2px/xMXQR?=
 =?us-ascii?Q?W9mpNxxrfo5gxFYWGjEXNgFIzlmLSzlPuPFWqUhwo1nW9EPzI4k3uT0tsbjP?=
 =?us-ascii?Q?PwISajyhLwNGfCzuhMjOdphyuYUR6Yebt8ZYJfKjHkfNWD1NYXYp4Bn20OE3?=
 =?us-ascii?Q?YBqZ1xIXJDntyk0bUo/CL6sRV+6A0C77xS4iQ+Vvv1D4q1D0cUqciiu3HHDa?=
 =?us-ascii?Q?+JdePRlA7zxZ99zOSm+U6TMq3X577a4sf1lVkw4KsxWhqOxwUfucV03GApqZ?=
 =?us-ascii?Q?6Re0vegfREmOr9rfpsU1OFKLbBy2/zDP//ROMv/fLUfnEcu7FmAYCpry0f99?=
 =?us-ascii?Q?IngF4fb4ypsKSfapsGYTZDBW72HqMhfNdrhAr7gIIB1UWwYOp/nMpHuNcE2C?=
 =?us-ascii?Q?IvUldurH/LSdmDgRfY61mU+VqYUVgDYYxUxexjjIXA2aDQSv0nnts/Pg/sk+?=
 =?us-ascii?Q?LW8ub8LzWK1ScuU/AqukP5D/wuMV6i09mkJQLBcvkNKIYrur2pxZ5fe91GYk?=
 =?us-ascii?Q?s2sGCe01cs0u//3YOhAuPMU37HRDI7TpA3GKxnG16rq2rW/rUaslW27pJPc4?=
 =?us-ascii?Q?gL5JaXifHA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	FdNrqq5SRsAfyKkesHrPDkElwKc8GXhoFPNPjK22Mbx8+WSK0ZYpAcE4It/S0XgW3ESRh7PeBo/KmRqjnvWTyfs8aA9VmLdWSYn5UhajY3avHLWRe6Bd2iKiyFGOu0wxvmsDziOnB7PNNbCnxpqhzyO2sgDfR8ufY0b/6xAVJY2INkeUxgcNzUtoED5aWgLuteebugv0YLfdL7LV1zXzaiEgONfGdRX0HDLR589/rpbyDF45ANxEwDBAnoHeFRsJ9hqcAHpHeaxi7V9FUjMBX0aI8wZm8GhoNxOln4SsYOqtiD/ziZGfZ0XVP8Mhf8CEN4b2M5PTuJQfKUIpnXzxyQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9eddd5c-72c8-4e70-7fd0-08de8897985a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 04:49:41.3883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voXzksdeFlY/pZBsbpI12DJSvCJIFv9pcdFeKliH8wCsF48A4F4GGPhm8TBoA4MY7JNKZczxLJJHAJlLdQS0cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6539
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAzNCBTYWx0ZWRfXzPnM8gd+dDKs
 QfuEWsOPi3MOt+g6VoPwzWyRSLAl/V32IistT5cYrcDom3WepuaRTgOTvI1M3Woz+0Se76awihX
 FwMmnv4V5v++Tj0x5ZzDfQPBDdlgMUeNsV1OB8hLGK0mKxR/igMFOt5zCXdWN2vQiPzUgZYtzW4
 Mxj5cIHwHqqPv3MIdFNUhzBbj37dRyXUJn1QaKY+VDExP23V9x/YLRihOrNKW5nn60qrbwFnxK4
 FNjVNpRBFTPpUiWahUHOJgRanLfvbtEG4RPBO9XTxUahfwzKhq8veqgQDQPMWWyQB/q+DfU6V4S
 yDuvPlGOu4ZofKjJqIbYiyjMnTwr2t5w0zABu78Ds3ggbZS1wh86sIsYsdY/Qb1hiy0eIcAtZfc
 Z+mQZHY2X5CFImDXvuMYqFIcXn5AN99/LCYCR+zHleDch7WK1aqoqTPIJnxhGAqoaTnR4Dl2FKs
 1LVll0DrX3jVwSgKryA==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c0c669 cx=c_pps
 a=KWtdrS0GCFg1xs2m4eMxng==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Qvb86ezj0ARCNOmOlt4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: aHAv0VMa_2PZ9s6XeMp5-9D-EccnqhEE
X-Proofpoint-GUID: aHAv0VMa_2PZ9s6XeMp5-9D-EccnqhEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230034
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Mar 2026 04:49:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9671

From: Chen Qi <Qi.Chen@windriver.com>

There's a critical fix in this new version:
https://github.com/opencontainers/runc/pull/5091

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/runc/runc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/runc/runc_git.bb b/recipes-containers/runc/runc_git.bb
index cd7254e7..5dd1e241 100644
--- a/recipes-containers/runc/runc_git.bb
+++ b/recipes-containers/runc/runc_git.bb
@@ -1,11 +1,11 @@
 include runc.inc
 
-SRCREV = "13a5c4edf427c231680a79871bd1e6f1f0e18892"
+SRCREV = "c67132530367ecd401dbe800bf13b96052212f3f"
 SRC_URI = " \
     git://github.com/opencontainers/runc;branch=release-1.4;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
     "
-RUNC_VERSION = "1.3.0"
+RUNC_VERSION = "1.4.1"
 
 # for compatibility with existing RDEPENDS that have existed since
 # runc-docker and runc-opencontainers were separate
-- 
2.49.0


