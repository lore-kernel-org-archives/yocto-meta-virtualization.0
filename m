Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18892.1792661862507805768
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 02:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=V+nbyR0p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4755789ecc=roopa.kalmath@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M71rp01954306
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 02:37:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=oCzfvgN8YRlJV97UPj1k
	BOZbSjmgCqKHGyyfKkRpVEM=; b=V+nbyR0penLQJq9RMPpbnxzqVygCVgQDkWJX
	nz/QxYv9FAAM710XUwiX2DbCMi18vZh0yeXt/+qPD1hLtHsqkTV685J3uha+qsdi
	Oa6frPHIyhyApZ6zvz3+21iPskDN8GGjtCqzbozHKHiunPo9ulhuMUVHtpSmX2KW
	RONBfsuVkdjIRaoMrc+z7GHmS1D6fzieVVaqu3m5tTAawbKDiGQd0Z0F2cZWZgCj
	8SoJ4CAuwAEjwLpxbWDZvE0n5cUka3Ga5N1KfZccHTVKl9Dj31d+NaslFKz33P8T
	FNPstP5bvbYVsYCEPnd2ANZh9rH2Nw6uXE7rgC41R/BmSPnHtQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023093.outbound.protection.outlook.com [40.93.196.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hfan28bs5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 02:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4qya2OUhTF1UeBYLn42RZaJGS9f39KtaLPS+GxZBdbr7hKM61Wj4v0vaW+SeXeVOaf1sWah1bMwdXuJ6FFKG7O9DcRL7x3M8ZCIj6o3wsk0h+ggkEUtQyPCxZk7vmbhzdtL1SXUT9RdEIywebO9HwU15neswLJJIS/3OWHpQNZ1P8hQ2agtw2KGQzMVQXJWLAEFCzE4Ogjh52dl6x9X8X3tNjloERVrA81JdnIHH40wq8ZH5mMxkp6ftpBIkrLsBsrxKUMBMovpKchLr21OIWf1oC8NkcStchNJuS7+KvvdSLKaZlvrFvxoDiFdAd94BCeq259yDUqIIINuipHd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCzfvgN8YRlJV97UPj1kBOZbSjmgCqKHGyyfKkRpVEM=;
 b=MJImX5ZY4oFgDsvqT2DW1Pupkp7wlk79YoEtnhsoD93jqluh1cSJTnTstSXglT5H3Od2qDTqHSW8Mj2AIaa0em8JR+jL4i+vOvF0QcrFCs98yeYN8a0DYMlSlyNBPbnfZttxj4/La+8murRNErCybPm168TkelRG222q8GcpsjUWslyymf4IHIp5Orj4pIs0joLyNAouEz1EPF3S5wIhnM/rSTWQJb2Zxa1HP8eJiv/ZjIRIW9vNZew5y5WUTC0S2Ubxjej0CzS6qr/k5TfrNn5K0Q8p2zc5oZXZyAmVERH+aeX0pekBuNiO3evlvjMAaiyvgYcxCr+To4vOAz35Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24) by IA0PR11MB7379.namprd11.prod.outlook.com
 (2603:10b6:208:431::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 22 Oct
 2026 09:37:38 +0000
Received: from SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb]) by SA1PR11MB796993.namprd11.prod.outlook.com
 ([fe80::95f6:cbad:d705:67cb%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 09:37:38 +0000
From: Roopa Kalmath <Roopa.Kalmath@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] libvirt: fix CVE-2026-18917
Date: Thu, 22 Oct 2026 15:07:13 +0530
Message-ID: <20261022093717.3323686-1-Roopa.Kalmath@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Type: text/plain; charset=yes
X-ClientProxiedBy: SL2P216CA0088.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::21) To SA1PR11MB796993.namprd11.prod.outlook.com
 (2603:10b6:806:51a::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB796993:EE_|IA0PR11MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: e84f446e-b2b6-4050-aa4c-08df30201c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|52116014|366016|6133799003|18002099003|13003099007|3023799007|11063799006|261009223027099003|261021130227099003|261021123027099003|261021135927099003|261021121427099003|10067099003|260925021911599003|56012099006|260925021311599003|260925022911599003|38350700014;
X-Microsoft-Antispam-Message-Info: NMlnlsR0YAWelDqsnm5y9WX/2ZnyUJgoFh/80CZa3yhzemJBy68k8LfkmdGLfV6+9FB9ekU0ZBISp39nZ1eYJuUgNVWiKaSNa5TIwQ3HMv+31ZySsEk1ThaEQrLvE86gqSt/QDxyEuWjyq1o4E2oa+RRexdRed4WYSf8PB87ex7rlnHepZaSE0EQvI3vu3OBzd/+bGGpNag71/Eygv2hcnsLxb4veublQ4LUv1E0rBQ99cYbeL8RytZZEPPjq/GGMsmnDBt5InrEs16xo1QjGHLmFE1LhmbMSWJB7V/pK+UZNEYBFNN0xjJLAIHFQSW3E7j7gmI4Eu5RzhuGoHQyICh9mgzvBURCQFMaI3cEblyyawnEs0x8LMrZEukSAVyZsFy1wMAXxMQWURBTMSNw1lxhVfCshnvoxpMWI1r3rXGeSDDFTEyP77TETB5p2mCeI0+Yah04fDLr/rcCfRPUoaHRes5zUvJ29kHefvnjfD3Soze6uGW6D+LGXLGFvdYjx4lfg09l53W/JtddxPW1mfeo3qbYcFg2iwjbn7L7Af3ZK1Rr0zXKHA+zoHMzFrzaTK6UJ3bCKBECyPRE4Qu1p0fEHPDimHRt+hDtSmJfrZ0EGFesMaa2lujpCaw/H8OtqZgy74UPnhGNZumKVchEmy/W76rdjAHj4lrTjCm4Dn/1cbV3WGaf5McYZ1oD5ls9WaUkz20TLhwaI3PrzHnspqyylUE7ULDbkzizKEkIJ7s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB796993.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(52116014)(366016)(6133799003)(18002099003)(13003099007)(3023799007)(11063799006)(261009223027099003)(261021130227099003)(261021123027099003)(261021135927099003)(261021121427099003)(10067099003)(260925021911599003)(56012099006)(260925021311599003)(260925022911599003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qyt+jmop0nX1poEJlJoSVCZL05U59zAk9FvpLfnR2M3kEpfq+QHqVCJRKefS?=
 =?us-ascii?Q?UiK2a4rCRm6KHKJTgs9+axORjC2aKGX9rrYGCx3IJ7DXVs2glEDen+8kWrOb?=
 =?us-ascii?Q?2hRY6K4O92itwFk6kW/3X4zpFj3mfZCL0J7RS6ErLwRPb/So2BFgOStSAEWx?=
 =?us-ascii?Q?OLiO2FsuMLDYUaOK+ljPkQPetfir7FKcnv4msMJYIvKRa0X1/ByHBo4655Mk?=
 =?us-ascii?Q?eZwQfB5vdowEC6jekR7i4/6UGofa93oNEBqL15izOefqTk03jWufDtgzbirZ?=
 =?us-ascii?Q?EMeTdSyhO6cvZhcK5/c0y+QjD1OJqSuwmFbCfPMnVls8NwJS3UB7ymNqKuH2?=
 =?us-ascii?Q?icAFPyTbhXkCtks7OvTpc9HoS8GBXHiV1vqFblo9LerjxJz4BpLnYA8lCMTk?=
 =?us-ascii?Q?yafS5SMsCrsXG0YT1VKHj4JCRh/+3TbOorER1jloTYe1e1pmG58SrCmE1ww1?=
 =?us-ascii?Q?/bWyP/zhOtpc+fS6HVMAvYIMhcrrbZpJn8zFvEvBSPxnSI1TZtJRtJQQu3N9?=
 =?us-ascii?Q?P8TrbeWc/YiEJqW5bggnemj8wHXspa16C1viSzUV6PQbWTMn2Rtsu+Hz0eAq?=
 =?us-ascii?Q?ArET/jrnFZrlYyOldTwhHjUohiuG4dqvCNsGnX3J1fzMUCFskVaFntfKSSf+?=
 =?us-ascii?Q?deCObtW46Mv9/fxG0pDYBDej4Pev6jlKAFF+6DKOMRFwbdX5fHlZxfIH/CPP?=
 =?us-ascii?Q?8jrTaCjM0aSehx2xueOV3z5EaVrKTwDf8rWVn2YEi/PK+jPR4yMPzz4nTcJZ?=
 =?us-ascii?Q?4FrQxydt0NM2vx8HQctJ7+Dks/UVNw7c/QTLNoaxo+TGI1HEH4UMKNwIJKmP?=
 =?us-ascii?Q?1n8EnnPzanG8G2VV68PHHg9aVQ5OCyZsk21NkjUm2tugy9LkrIZkk1BDUbzN?=
 =?us-ascii?Q?QvLfGZj23yH7cPFUZdPYhu3wFKicWnSWJ2X+1TyJVyg+X4IgSmHO4bTDcyoC?=
 =?us-ascii?Q?qp21SXq8/smMHVdZO2JG6vq1Ulzl9vUVmpTcRijISXc7TUs9+FBeAHV4OLXa?=
 =?us-ascii?Q?rqHUXwSQ+KYT6QjcFTIcKvtbPYKJpRs/ya5b8tpWAVvvUx31jHg47IPvE9ih?=
 =?us-ascii?Q?SqMAG0IeEoKpTfggTHoCi6zogE0PpbDaXcV0rf7wwSq9Wy+K+uW47RD4wTd9?=
 =?us-ascii?Q?ZRjLmAH9hxsCGQPYNQx87RMl1ZkZgq6mpFkYPj97ACIDFhccJoh7hJEJf/i5?=
 =?us-ascii?Q?PQJdrcHbrj6YE8JFKcuafJY6pOtUQX/mAcfIuAXc5p7dQubEnMjJKhiFU5hp?=
 =?us-ascii?Q?zIcIHGOwNS5juTz5uiPwBa/ybtzUgeIT3yKtRu9LSZTGrrGnB1bHCW3fumwR?=
 =?us-ascii?Q?shq/w4BaERCjdypzXIipfN28HqZ3xza2w7ryIR+3Uwm2OnloYgp9FX/CKj8r?=
 =?us-ascii?Q?GyqD7yITyH3H69FtCOur8cAKbWobHFJXFgjqwwwYcETSEXE8fE/U5F1ffQ26?=
 =?us-ascii?Q?NyHOPtf4fuuCVkB06S1omM5evcHBzfogf0NTPWDJDN56LWhxwzVzCfc/pLve?=
 =?us-ascii?Q?o3EkmBsWKpVBZB1sxpSN0msqmtbXl3G8Kpcj9dk96y6ynUNL1Oit7TPDMvuk?=
 =?us-ascii?Q?glWP2+JYrFImRXvbAbhsnd+QpwCtFi0d4B7Qz0ApNbdN1pnHxHuLRmTGTD8w?=
 =?us-ascii?Q?CQ1ZsCdjNFrXB+rce/EJizhtP06Gs6UmtoMh93y8lT9y7KVrVzwbrusK0a0v?=
 =?us-ascii?Q?wKs8PAFkRHEkMmpyGqpmNL2IG5w4rICyKohl57PC+BEXfX9INmNejFOr5nMQ?=
 =?us-ascii?Q?9LDtf8YMJzEa/whoOXWhE8lSdFD7rIM=3D?=
X-Exchange-RoutingPolicyChecked: jAiIKHx6h4HYwcVN/FC6Q2YIIpl9iE77nVXQWW1SJxvJN9XpzyPMM7pse2srPtQIh0XsuFYmNZiNtG/GHAyIiA3fc5t87PG1aWiE5sfDvZG5nipAWuTXe/Bikopb6R2ZQ703nourl/IIoqaUGzNd4Ijeld3E+lZ9jMwrDXQangzlj7YoH3qFcN4HtHrvmAFHDPmolJT5PtY2Ad/qKs5DrwJE+6YOudVBiBvB8PaJ697vkPlsPpL0SnXVvPZPy3F09I3GekEjJ5Nq9kLl0MNfQW1k0U8jghx3DJWCvxaqiP6MboCcFWeLya6LHzaIW6XEdlWo2mCWO15GTIVJRLh5LQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84f446e-b2b6-4050-aa4c-08df30201c9a
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB796993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 09:37:38.8645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebDvx1jsu2AJ7/3e9C1LEJE1hyIJqsuecTDBLn/UtHEiZWkOlsYF6sA7nBd4ihftPRQHzVj7oXQBMNce0WRSJxqQDb3GUvNaNT040++kyqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7379
X-Proofpoint-ORIG-GUID: rAj-IEEw-DNmzY_rMU88wpz11m6mZ2h6
X-Authority-Analysis: v=2.4 cv=fotJ914f c=1 sm=1 tr=0 ts=6ad9d965 cx=c_pps
 a=0mOrEJ06uaCo+Tyi64Ng2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=WN52PlUurRMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=p0WdMEafAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=NEAV23lmAAAA:8 a=pqoEyW-WUp3kZ8g3W7wA:9 a=3ZKOabzyN94A:10 a=xE34mhsjmDcA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX9OyoZoWn59U2
 sSmjqQ8cO8DngHNOFKveusXs6iM1RcLuo5x5G5LWonbaImsZzIJOLBTf0VBbo/GAjbrh0dr3lNf
 89zvEANBxUY/smEnnV0tuEzx3HqxvkjwfcoDiL6z5daHmfSYS/zeWhk4Glit2UIhdTd6HbgFgqp
 Rxy4D8plyY6wCWT53UmN8B+5h8ImkZ77LjYlLZCrXmWOzYdOilbY2/7aMIw/+p8IaSjGNIDmdk8
 nF6q8ahl+zYmPQhhWQ3qzNMHbaNJmCOrdvhUAQNmTV45sEx8prsMDp1n2cTKux8Z8Vm+m57VGQn
 HRO8oXVKv/Fg9Cut1ypRvnMSjkzVoPWfD8SJtwwe36FPho4HJpP+yf0BEhS5Q6TEyw1uEs2maf5
 jIEdJuOdKkb80qHKcPfRQyqRc1DTCQdwLjJ8uqeSv7y3BilrcvlQiCDzLaunfG5Ygjmns6haO4B
 2aAk6idvhgxkKaCmoUg==
X-Proofpoint-GUID: rAj-IEEw-DNmzY_rMU88wpz11m6mZ2h6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOCBTYWx0ZWRfX0CvEuGXTwsX1
 W9L7RCSFQiyDoYj1uJG99l6Nh6E9ioGKYMRSjSCdgyL9HbicLgSjWkO7zcMc+ZyGlLrwK4aypgX
 RVinoruCA7rv+pQbunyeTbaRjEVj1SuEvMWzq9tT4LjSQKuYRWm+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69M71rp01954306
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 09:37:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10120

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

