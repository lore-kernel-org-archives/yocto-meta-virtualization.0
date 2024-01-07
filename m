Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C105FC47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 12:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14461.1704632186111265303
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Jan 2024 04:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1736c9399a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 407Cf9L1027140
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 7 Jan 2024 04:56:26 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf78m8qad-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jan 2024 04:56:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyqoCAzFMpeCNSxaZpON3VYtENqyFiC/7dKK+UhTpW/4ofsKnXW47Qsyaq07WswAYbpuCBzO2DT7DYteJ+MRU5ZKSHG+lmyviP3jfX4OefmwJsoOwUQjgYqyzTLejJLJBbvMb0+hQXXbOAIuvE86j5uHSUqBWIYiM9+8ig26ZRRj/Bl8+UAIQ/OR6zAUzRbgLuJfLSljTR8fIyqI6Cuz6/ip9bdZuKPvOHgmeTKk+bR+1kmbSXrt2sPOUKoRoDUZw+OmFo+0h7hedRvNEz0H9YLiGEhkrAbPcoEPU2/f6wVJ3DIhFsnXJzySkxY+AqOLEMwBAfpo/9A9ssXVYxfGYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb6MJv1yXl4zH/K7juJlt7JG9xz3q6pa4Cbybc2DDdY=;
 b=DjyY/viyvPx1jOtBXEyLxLe7TkY2RvI4GQSzOjgan2XwR122DaqsWtsZiWppooSSi+vEyVOD14xuMJbTJ46Q29C1LXKM71LQcj69TMNwHfJQ6LNf7+q4xMoAWBDwyKWQOf4xdaqyXD2/8fOd/RmDV1YkQ6THGmaXGpzIjE5xBQhGMRQjZnqTy25y7mN7Fle99ykoPvxv6Dc7LYXaR8jzvyMizJY55EO8C9nNzNl+n/3Ls3l8N45hMV+IhE93LSMAzSkoJ4fOBiNxgLPCHazDWSvgrW2XwPePiYs8839+hTZo5iqzGK7PxAa3p1vyQ+fNOnydA8JsB6Y9jJLgamNSLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN9PR11MB5305.namprd11.prod.outlook.com (2603:10b6:408:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.20; Sun, 7 Jan
 2024 12:56:24 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e%4]) with mapi id 15.20.7159.020; Sun, 7 Jan 2024
 12:56:24 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/3] criu: add kernel configuration features
Date: Sun,  7 Jan 2024 20:56:07 +0800
Message-Id: <20240107125609.3502113-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
References: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN9PR11MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8483f2-3543-4ae5-a26f-08dc0f800da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a2b8vY0dawIsKdjV9F9atSmUklM3O0qIZNYR9zf/TMkxqOZWNODq49iCTBUKG6iQTatVgrwk0+NETDKYIv2GLRUBBzHj8nBTHIyNJRzM0W4QkXZ94K6ecWwNiaLdc0EG6d8W0azZUJoSGSHoWlrHtOo20zyyOBiHVOb8dyOZ/cNE/ui8ybBAZnMrDoGMn+ixPhGdzYS0y0Aby/L46g2Zg1nrby4DFTb9ofB3RK1YqrL1VF0SlVypy/3uu2r+gBLg6TT7uhaMSN6WIaARztaHXWx+Uqm+IjUrqApwL9/ih3GMwm8V9aod/ETM9ks3NDZe884FaiWe/AVQISqFpzhlFbwDIGxOE5UcdmW1WtCSQntAQwN9JPHNBg149P63ITFdAj2s6PkcBRPdQ6rIYEHLyI2Tak2zfVnQr170PL673+sdtAwt8HyKE0mID3vNbf2Wf5I8VYbspF/AF86Po6/ghSqOFy8S/JPHMwMHwBhgpKxv8pr1fWYONYDvXbmEdadMFt6S3uVS2Gc6BYTUQBN/cW1zfJEQCKPUshUyaoq5b52bIF/LpZY4om8o+em2QXUuCx8RqFH/zORAB7PmwmaSfWeEJ7qG+tPcfr5ALiseDQ8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39840400004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(966005)(6486002)(52116002)(1076003)(26005)(2616005)(478600001)(6506007)(6512007)(6666004)(5660300002)(2906002)(41300700001)(66476007)(66556008)(66946007)(6916009)(316002)(8936002)(8676002)(44832011)(38100700002)(38350700005)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Na8G/N8jBVCEkgRt93QhQX5Jl0VZ+wXXKYoLnvTs97Yr4ubV22QKoyyasVqP?=
 =?us-ascii?Q?ZCFtqz+CARUFBEOXOaOQ2ZuYkqh79buoa4oNF/BI6WLb7JvxkBqgdyB7Xl1Y?=
 =?us-ascii?Q?fKXUw+O6mrtpgQ04lKf+BG2//S83CeHvZj5XmnptlaTjUWvALmtG+sE1a/mh?=
 =?us-ascii?Q?NZlHekMaOdRyydlE4UmUHJ02I6PE+9DQUXx/RF1lrE8n7OCL6n8JyiZK4H9S?=
 =?us-ascii?Q?vmuKud9c+43i0MQXt47jxHeXCNKTXAtpuIzgc0rhmofGBnY0OP/6Ol3WXYMS?=
 =?us-ascii?Q?D1QWWbjjV1pJbmRL3FFCCg3wCyolLVab/bgxAUOx4sECJUvwBhRKG1JZr+13?=
 =?us-ascii?Q?L9FoL9H32ZLiLXO6Mkdeh7BbIrkkkyVDmzFOoOTWiavzbgEU6PuweUcKwt1p?=
 =?us-ascii?Q?MN3s4PWKN5Q4zB3VpbGtNh1o79sQGWn/Z8qdwp9KmwEGy2Vr23brHtEyZYIh?=
 =?us-ascii?Q?mG3e2pUVLGrEsz57pw+fx0HUXsMhAiPcn4+bXf0+W50iOmmuP/fX4APDbtf8?=
 =?us-ascii?Q?dX3sftMrUX8bPrp/oPumVfF9GLjZJxnJsNV/uXPp+ie122gTk3A3V/eOoQlO?=
 =?us-ascii?Q?Ih8zMGkFtJ8koVE9H1htGPq0psUXeVj6mrQ1CzluisYKtbwZjk5eExR5nsQO?=
 =?us-ascii?Q?7RF8c8wq/lMSAeWvD+7/Yu0c9iCE0qOBEfOOOmZJ4frwqLb4AYA5m+iMV+Nc?=
 =?us-ascii?Q?vjaZiKVgKjD0z/BFcEzC2/W6WISDP5ENpobR44cHgxURudMhOro6Q56voZLc?=
 =?us-ascii?Q?TifyYkPWeFwgzzLicyjhBRq6G7/QQGmtvuGTwaSW8Wnbe9y1NBi7WF5z+sQ+?=
 =?us-ascii?Q?x/T4OfKUCVRO6EM1YM/5FNUNcXhN/U+PZvt1nkWHCJfFaGecNmeJblKsZIOv?=
 =?us-ascii?Q?YYjwqvOzOf4GNC7xywywX1fZWj/zO7xrJyjLb8si4VXiFClPIzFJv8HbRU8S?=
 =?us-ascii?Q?TH0WKWCV0sf2J41xIOrQPVFZB4oliXguQkIYQX6K7BUINpW0qgMqxRgOPzBf?=
 =?us-ascii?Q?GeNYOIBmtN/81gvS8t4NadTMpYlDsG8yPohfNOJzdXsDF4hHRyuAEyt5tXEP?=
 =?us-ascii?Q?lNftUlXWXtglWIGOS9RJnk5cHGJ6edUZaV9kMlYVvms4Ip3QfJVBTq48gfF8?=
 =?us-ascii?Q?93UMyFvvYIs6vUib6VvA6nti/GDXEXmmsbMV/36CF3x04pW/AAs93Vfd8cAg?=
 =?us-ascii?Q?yHxA92TvvTyfcR/JxbW+V8Om8N34sZtgxCkjaPYFFJu7wdaplRx7Nrrjynfk?=
 =?us-ascii?Q?bfcPNzm35W0wNfBcfRB8/M0IRO/Ym5bh5+es05sbkzM0Bkcajju3JIxOMZiv?=
 =?us-ascii?Q?b97MnUccEIM/kdYJ5NXVQALJOmD95TKksQCtDOc4+TbV4M8PNkznboLu4whp?=
 =?us-ascii?Q?ZjZgMc2E402hrN5zwiaMwfz/6rPaxp+AFVPMVJwo84wyEORjC3jzToObd4A/?=
 =?us-ascii?Q?jQcIlDLWa3AlsRhDrXvKJyf9KpcoSVwVi+fsprmmoe8XOvKo6AfScwL3GZcu?=
 =?us-ascii?Q?7dfbGPxjZhMrYGX010WD6PlyifdgHqUy5hr6lL1IQkCrVzc93jOYmcZ6NmJ4?=
 =?us-ascii?Q?LfEsRe6G+LItwW9fIPsmJN3rFftqzpvGMOXDhsYnaNY/igw6ss92b3D8N3lM?=
 =?us-ascii?Q?yQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8483f2-3543-4ae5-a26f-08dc0f800da4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2024 12:56:24.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvnIxgG6u5wP6xpqR9Und0CQPiCzNdpciaO1Bvzluc66rNZfF+3kptokAMkt/5XnvxOBoiDtqzbMSL46oNV4/zT2Re152WGx/9S65NaPyV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5305
X-Proofpoint-GUID: cgpeGXIsTbUZkn5HVGirrjGZjrggFtlX
X-Proofpoint-ORIG-GUID: cgpeGXIsTbUZkn5HVGirrjGZjrggFtlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401070062
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jan 2024 12:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8527

From: Xiangyu Chen <xiangyu.chen@windriver.com>

criu needs to turn on sock diag features in kernel to do the system dump[1].

Ref:
[1] https://criu.org/Linux_kernel

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-kernel/linux/linux-yocto/criu.cfg           | 8 ++++++++
 recipes-kernel/linux/linux-yocto/criu.scc           | 4 ++++
 recipes-kernel/linux/linux-yocto_virtualization.inc | 1 +
 3 files changed, 13 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto/criu.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/criu.scc

diff --git a/recipes-kernel/linux/linux-yocto/criu.cfg b/recipes-kernel/linux/linux-yocto/criu.cfg
new file mode 100644
index 00000000..314addfa
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/criu.cfg
@@ -0,0 +1,8 @@
+#Networking options options for sock-diag subsystem
+CONFIG_UNIX_DIAG=y
+CONFIG_INET_DIAG=y
+CONFIG_INET_UDP_DIAG=y
+CONFIG_PACKET_DIAG=y
+CONFIG_NETLINK_DIAG=y
+CONFIG_NETFILTER_XT_MARK=y
+CONFIG_TUN=y
diff --git a/recipes-kernel/linux/linux-yocto/criu.scc b/recipes-kernel/linux/linux-yocto/criu.scc
new file mode 100644
index 00000000..87a88113
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto/criu.scc
@@ -0,0 +1,4 @@
+define KFEATURE_DESCRIPTION "Enable Networking Features needed by criu."
+define KFEATURE_COMPATIBILITY board
+
+kconf non-hardware criu.cfg
diff --git a/recipes-kernel/linux/linux-yocto_virtualization.inc b/recipes-kernel/linux/linux-yocto_virtualization.inc
index 84a7bd84..a37759ef 100644
--- a/recipes-kernel/linux/linux-yocto_virtualization.inc
+++ b/recipes-kernel/linux/linux-yocto_virtualization.inc
@@ -6,6 +6,7 @@ SRC_URI += "file://xt-checksum.scc \
 	    file://lxc.scc \
             file://docker.scc \
 	    file://cgroup-hugetlb.scc \
+	    file://criu.scc \
 	    "
 KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'kvm', 'features/kvm/qemu-kvm-enable.scc', '', d)}"
 
-- 
2.34.1


