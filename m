Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61461E8304B
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 03:52:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9162.1770090722470797357
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 19:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PPBFGCsE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64947f4648=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6130Fc4o033139
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 3 Feb 2026 03:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SlI0KOUkhx44dzBByX9o
	h3bmJePpM6E25gATmwi0c3w=; b=PPBFGCsEDzegNF0fM7fZhxsf33zRZISkFxYi
	NQHU9nYlAVZC2j7IpKGyKHmGtLV8WlIpXyn+de8RJhp8hJVKEfheBvMoUgKRVukj
	77MoTWua9KS7/hFOZs6Dv/JSKwv26jDG0KqpbgYyKTKGOC2PiXRkq/6JF+C2/Xkn
	e3kKhHHhQS8OzGBaxKmZtor+QHkAcLVkpTx00X3Mf5KPpLJQuZhG0qILubXFXQYE
	ZfklkacUsAb+mFFihBPeY4mXY8ThX3mbKV0tfHn2Pa1/9GWew/2MCY4e3q5cszkk
	PtWEsq0fCGlzQM1oa4eSm5ZVm4OYQXg9y16lKrXx3U2bIEk0Nw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011062.outbound.protection.outlook.com [40.93.194.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c188jtu89-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Feb 2026 03:52:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4T1ngIfdTGysrE+GCUhoBUGmeNL9ICgzeVyFinBjdF0ENKGD8PqZDPXK9qobKD723m01IFiGjtCAlr1MVsmHI2XieTxOW+I1TA7Lybn2sGrGZOyD9zPeGaDVx4//W6uRGf4jzfnH1s340WAmBM8DTEvwCnKLvsHWsHVG9REN5dUMdxPixapiUeS4HiFnvCaxiKatgMgQhLRjs4Mq1m7URAanpu/Huo5PLJKDkeS3qFPIfE94q+LFBvkhZsjIqo2DHxA06GdAe/ISJ5CNNGc/Vybbon3cyy37fx657HiryDRUYfPZk86GpilriQY/I3v6sSRgbT/cUmJGDtfBbKpwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlI0KOUkhx44dzBByX9oh3bmJePpM6E25gATmwi0c3w=;
 b=G6c0z13wlOSxpH5A/ToEiFl0vWIG4FPy6tadTw8uudsw2cNW/CjgLCALO0LAkhTSqxuLd/9r5+nIIyxJnPsZWeLhNgsdawGgzyum9PAxCcMDNF2D6fZHSldBCckInYZtdJxiKI6VfYO2jgp4PVfS7DNbWzgXbJMGkbc+sryybM/dEjacnacwGD6dwPkParzdvJ6vSIrxcRMwyTpZdsaF+3aQmcBUceAmrgecSk0E1xUX4iFj//PtUmTnUl3jECWsDG6ukkIVYSsiPN3P9fVnubcBQ6SnZT4KpoquLiY2KGDhOdrOgSLF62cx574kU3297uVC5C+Thw4SsHYXb8IGNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7725.namprd11.prod.outlook.com (2603:10b6:208:3fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 03:51:58 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 03:51:58 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nerdctl: use -modcacherw to avoid do_rm_work failure
Date: Tue,  3 Feb 2026 11:51:40 +0800
Message-Id: <20260203035140.902906-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 587c64a9-5bef-42d8-09cd-08de62d79427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XrLY5NsjrAS1E5XQmj6tmWsYnG9iaWq6wIXCbxr6c0huYAOVCWHWrNTGHS/K?=
 =?us-ascii?Q?eI8zcRRjFdaA2ahncMB13tYoSlIUmJDzmSBZT+fsT/7H72f9f+6aL1nRZjXv?=
 =?us-ascii?Q?nbdRGss1KVyp4K/MIy7cIAuhjWCF5gYRn0MeP6u/gcgWjLv0tQiHwi9KTmUU?=
 =?us-ascii?Q?kI0/Faqr69QdyAnwZGOjUEyitMgYMrs6uV71PpZv2i8XLvOpowQFgwaLmWg9?=
 =?us-ascii?Q?0fhMNO9is536Kx02yVm81t5Pc5xIdN2VnnGyql+khR6fGqIjmdCzDTcEG3Dm?=
 =?us-ascii?Q?aDCFz7jN7vEqte/l4wRrVq4IDyTYNN6/zLQ4kvoHsfx0KVK5cmTtW+5J9A/6?=
 =?us-ascii?Q?XC/Ub1vcNHzZV45qYZ1Yj7YI7ry5JViO6EzMXwbwZXPvPIBNT8TjLH0O6gFp?=
 =?us-ascii?Q?IZMDensomn+p2UYVemO/kwC9RFm6oPej3Jv9IL9XUfdtrrfHWgyM/noOZ9Q2?=
 =?us-ascii?Q?EXAPC2YdjumRWSxKJHVyw/GwIQAGWgajhMk7g/yL26okao4lb29bPZPqH/pj?=
 =?us-ascii?Q?pP+cqFoGXCa7G38VQJmCkQ106AffGfFip/WLeavBdo8AMSuaUExcydp3ZZ+7?=
 =?us-ascii?Q?aa76cGgy50m11NunwaoknnLGgtNB4MaFuwZfQjTFJtTghDajSqkZw0LgiU7L?=
 =?us-ascii?Q?WYDvhI5waloaT+KHR8+4oFFbC/aS20WTCSaYb4jS6gb1041ZB4eG6S66/MVl?=
 =?us-ascii?Q?ftpSrSBOnyPWF56HgaFjpjxVvJKvTD7pb62CZsEcOuPckKtsKIB7qRExoOfL?=
 =?us-ascii?Q?9795j+ljbfTva5eh+8DQj+FMca49KnMSsFGrs7mkmfjCmZFM7L/ti9ZeDlyc?=
 =?us-ascii?Q?oQrpiI+9vH6HLQsk2EIofIFZ1Jn45TLbsTsE8YUWc5t5MRjLkTcJz/ymKyD0?=
 =?us-ascii?Q?JYNIi/Oy/4FyTR9UKTscIOe5CLhkQCu34fsyWc0ryL1IPOmbQ+SfyDCFS+jM?=
 =?us-ascii?Q?4gVzZBzNyq3JwCsULqeeXMMfyxAvo7fj57WQy1sH/ieOAwhoJo3Dmqz+jvwB?=
 =?us-ascii?Q?Hsqa73FWcB4LVLlUaJb7H7voyDqtAXATjl3ej6CTuGpYPc7VUTYfFc8MHudS?=
 =?us-ascii?Q?oaQw5gS8a5k10j1j5Fs6yNckimt6/tBkugOEXhAoSkLpteXrRKPORI3BRL2T?=
 =?us-ascii?Q?mXFwUED7krVPTD1R8TOYtdet9MDzZ14xJGBZ0U1W2+YOOj9tdtrwrI5uKs9V?=
 =?us-ascii?Q?MGBsT5yUT9T8xx0MyM0GhVFbF59db3JorFurt/yXsnI0ez69UgFjhqQsTQt9?=
 =?us-ascii?Q?cKM60RHsUXW68NbLiOopsbw4ywEAItJcFjxQoofvxp4MiTginqYeVb27kZDH?=
 =?us-ascii?Q?7HT/+hkcxs0L3nkmr89g35YUSwYlguwrIlHmJvamlN0yhAmRPajQTQpgWfr9?=
 =?us-ascii?Q?TtXoENmuciN8I+URoJoI9wnns7TDON6R/2JmuhGf/MWxQQUay3EJhaMshrRB?=
 =?us-ascii?Q?qqeLStEEbr4YBPp0LJ3FqcOu3EaRWGhPPI3PHbOWhptqqegwixPoi54M5lQG?=
 =?us-ascii?Q?i9KPJHFvlhqvD3zS3WjE9eMIf/9A9vzc24Km1lhp4s+i4XZumR4U59dOTqJE?=
 =?us-ascii?Q?9miVPSHZjNmf+mbHzB5wSLMTTGTx3XhkG+4Qxy9fyW3XSoN0UXYoJ29Dp/3/?=
 =?us-ascii?Q?9CqOqCz283OgS6JrhGzL0co=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kaZd74n4K+LxKGRcNR/O6C7EiUshfeLSVdjHJJ/emdwZ58PPF40IjRwGfp9H?=
 =?us-ascii?Q?Qdkg+Xh5Jn3+Xj+zRfCa3izXnbacK6QCHdluT1fILsSqoEaL3RBl/B4IZbBi?=
 =?us-ascii?Q?uIKaJm+2nHx0q6eC7nZDWpEUr1xzOoSlJxeYbt88k6c3V+o2a8dfRyjd3N/2?=
 =?us-ascii?Q?j/ocdq2rtZDvEYJ8xs0JmTeea30kwZRoed4U6V0a5yl0Me8uis+M9hCqRSh3?=
 =?us-ascii?Q?r0Udb2yWmTmc+kdcw6jZDubRHKpjuA9FuG4YJnnsCeR/tMA6oLZh7iaZ6JuF?=
 =?us-ascii?Q?HEDYqW2Syxe+6jTKuSLW4B008EfDSfFVD0TbHNt27Z/AzGQsD+chri0+6d+V?=
 =?us-ascii?Q?YIf5ruZWau/hh+1yqMr3j291pGcHvc9P8nsIezZul8tYSwB+FuGjeb3Wua0Y?=
 =?us-ascii?Q?o7Hc7z1lIqbHwFyhxcKzy5wBuSP4s0VHU6iYp065nxkOvwW3lTpZiQf0YL9l?=
 =?us-ascii?Q?EoJSRm/QPkuh+FZCookOPP8U0yjmCtRJF7XbQZ+ThhRzalSlKSGwpWZ3TaKB?=
 =?us-ascii?Q?wLZ1W4By7C/jHQs+yDsZ6ZD0Z28d1+TSP5W224xd84aXTBKNETCOlr3yXiGF?=
 =?us-ascii?Q?pWTLsXqqVYxq5cPbbBrpaP8Q5iFhHo2xhrizuAYiPgcClmphlhrSfUrXwUoK?=
 =?us-ascii?Q?YQOWT7qu2VK7Uz7jvV2OuZPM/76U7BjVc112UVTB13gXWYJ0TUQl4kbydyDz?=
 =?us-ascii?Q?ytr+rzY/Nl5DZJseQsMf6QhpGazxiXVF91v21m8P6X8ZDks4CN5fqc/eKWw2?=
 =?us-ascii?Q?JH7NI8asNQ+BUjxJrrj1JHqCWvne21Y25b2tUSeXUlBpgHSy09+cpQtos6QC?=
 =?us-ascii?Q?hZp6axTvS6FGPbQkIU9xAnk4QuQiL151lNdAp+n+8qaDHzMKZ42HEcHkoC7D?=
 =?us-ascii?Q?LsN4ipzcC1Bd55XpEncrDDScu7JKaaozbGAyKPgGGa1T/kCNLGmOKXBOT5O4?=
 =?us-ascii?Q?/GYvzIaMpEL8pRAr7RwSdyjEhnl2NRtCumIDojogZN7F7ps9iIn2URzbHFIe?=
 =?us-ascii?Q?J/zVMnW0rVaYUfH9xDC6WD6X9TbNpUNL8IVXMyJSjlx3KKZEcPGppIi4F/rw?=
 =?us-ascii?Q?rz2CszTYDVCFwhSFtmWGNcARAvAufQLTt//IAPci61U06o/ilhMImhklKst6?=
 =?us-ascii?Q?MvtZXsAhmOYxEzFJpJ2C8KDDnGHUw9wF2IxAiTnq6SXxrIlan+dJ4HGqcmFm?=
 =?us-ascii?Q?+YFjoF5fLx5e2/I5P52zVBzRl0O0cPr01xTEBUx+7t4cJBUsi81huX8o5xPy?=
 =?us-ascii?Q?N2jrmb9g7YxwNiYD29Et4kP1oVrRGVo7jl9nNIUj05nCarkKtal/u89fJH9D?=
 =?us-ascii?Q?ong+9qhm4XLewWZshHy7QUgmOLOoRKgrQ2PvUImyLFZVtwkSbvpaD4FaERnB?=
 =?us-ascii?Q?BQMARdUtORw7wgR2XpBV394aRrdAeriX6k54HWI6UauGubC3UhhrVUS+Ykij?=
 =?us-ascii?Q?/YrHLqwEGT5jMBZih9tVWoNsb3E/j1xlvEi96YdVbe9CqAfbJsvjPtaaUCZl?=
 =?us-ascii?Q?U6dmAtGIoBuJKcig7B5ggUckMcG0VTSSkua0F8Q4CGNY4qAYHP5gxN9eskKy?=
 =?us-ascii?Q?whNa/7pbTuVc9LLPS1dbRCsLsj//sbLNmixhHT6pu/UmJPbbtTVG8+GhyzZr?=
 =?us-ascii?Q?AxsaIFeuv+seEkoS9zXmyBbSvcXI5ayTTWzBFi/bbDloKOsSwCyiTYQ5iBcM?=
 =?us-ascii?Q?TjjPNwqH96cx6EZvUXXb4QQXefmijoa0+BQBb3KFxFbj+UZTLppr/S0e5/eD?=
 =?us-ascii?Q?AjKxyDp5eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587c64a9-5bef-42d8-09cd-08de62d79427
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 03:51:57.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHTzeUhKV7RgA6yFDpcjoLBm7niMn3yBog2i7cSWa2kLG3W+8tbbrORYL+EWfayMmoSinH7U7e4kiQ3ux55cPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7725
X-Proofpoint-GUID: NepzAP8HEPRVdt_4gu6nwoV2F2xmRci1
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=698170e1 cx=c_pps
 a=MAgfROEylrrND5Jw8NuT2A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=5iXvCmtj9wyNCMK2pcwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAyOCBTYWx0ZWRfX9Jib6TjMHWUt
 rQEUgOrPgtVYPqjQZJkx/G1+Bav7bOLL8LeW0viQ2REktk/bXuMYZVpUtQooha6NUdBdPvxcEWv
 94PgAcxjVCkvfC9oiMaVOBg153hct483iH14/H2fLez6NddtXb0H0ZJsNu4TsvOPanbJq07Zkfi
 HcA7u7YJ8E/D2NiZknSA/dqzI+aJi5Ex46zFNU92X/TFCK11QWUKyGoV1hRlNJh+fu/pMGAwJvy
 Qal5yUOFvYD9Wbw1aM3gWCeyK1hh9xhAkT179iXtG0ZxoFY8C+ctb2clz6TxO66nfWkek1xw6n2
 sQn8ZtanpWTrQCrGi9fmHXn6GPZMWlIY4pZdliRWGxSTscUMUcbpfXknnYljgvZXQQrX+PfyCI/
 Y/a8cnruANEJ+UFZzpxqev0rZN2x+eYbZFXKWJEudttvKFctYbPRsaeGCqol1hV/7G3JUl3VTk0
 XsV+jbP8OkNFreZLT1g==
X-Proofpoint-ORIG-GUID: NepzAP8HEPRVdt_4gu6nwoV2F2xmRci1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030028
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 03 Feb 2026 03:52:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9554

From: Chen Qi <Qi.Chen@windriver.com>

When rm_work is enabled, building nerdctl fails because do_rm_work
fails to remove the contents under pkg/mod/ as they are readonly.
Use '-modcacherw' to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8f63b48c..1c37bcf8 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -78,7 +78,7 @@ do_compile() {
         export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
         # -trimpath removes build paths from the binary (required for reproducible builds)
-        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath" binaries
+        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" GO_BUILD_FLAGS="-trimpath -modcacherw" binaries
 }
 
 do_install() {
-- 
2.34.1


