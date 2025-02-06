Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE59C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 04:48:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.32686.1738817284667975523
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 20:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4132a822a2=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5164Pu3I015880
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 5 Feb 2025 20:48:04 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hfs8mwmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 20:48:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLZLxMBT8DbSVN2Hwsj/QscvbLGcg0oUDGTI+ih9TSuxbmj1b7cHoO/mBKQoCQTxjQt0mGdRbci2W8T1hDVZJ96keeJZ3GPQpdrtdX3m5tDnQBD8cDQ38eHDzUKe7gQYt2BhmsMea8kypdEcT/BO3fylr0EpRe7LFxZNzgEmqfiJ0CC890ieLDRiQEiLEKCRfLJFrGaE/ZF7FhXFBiUtyQBFjHpmDsmV4ajUZtIKXk9i2dhFv5459jx5CvD8g8NRZmrqYAfiIA+02I0OoKhwISju1tqNmfiDkY9tAqy3Z5JFCWy3Wg7E0WGswBRhhlJv0Z7xbzZwadp5XvWRxeyIfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LtGzZj7kKXnRP4ZfFWAVMa2BvHWPVQAMlAk4RPU57k=;
 b=pqT0AJTEx5/cCS8i1To76KXzKIjuPFrEyhm28cdrY1f3FKItM0UTA6iuxriUeCO18z+dpvEd44TStrgWr6E0vF25kzrmSUM3eHCpIQuSOId42WwVNTuVGUL90IGvX9WlrVJyAmsQWw0C07iQz1MS5v71qTXTIbzxs8vM3C+TeWXUS4AYd7g15Onq2TBAgy0d9TdEzHf8dm4ZZkPnW8L8sKevVEszoliQbt7U7l+PLv+nbjTx+0ZfL1qmhkL0MJ266GjJz6D3gBF+hv1WuZjxdHYnYX/PPzBDucvTHE5r36j9ovIkMNQ0dFHu7Ifg2LPt6XtQvE//MF+tEY7eJ44X5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.11; Thu, 6 Feb 2025 04:48:01 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 04:48:00 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] buildah: drop SRCREV_FORMAT
Date: Wed,  5 Feb 2025 20:47:48 -0800
Message-Id: <20250206044748.3701612-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|DM4PR11MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc2c6bc-f4a3-4951-d9bf-08dd46696f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+TUxc8RN9xcUNOHoVFxkUxj2a6tQYeyuEXtY/ZdC/F76veTpmdXrP8odeU18?=
 =?us-ascii?Q?jwqi5reQ5ojI7MM5evkJ+pscPyj5xwmUw6314PKlmcbncH241FIbvx2NkYil?=
 =?us-ascii?Q?pekImmH8gSlS6B/IUSJTtmR1RzqKh4pJO+D/Cym4Ewv6IPQzPZBImTHtetr2?=
 =?us-ascii?Q?EgS1L6TfnsNqacwiUVVgQZQRKgLGRdytDwsWu3HMPOoHIo2VppAyLRpb1icr?=
 =?us-ascii?Q?+Jt8nW8xsPumo9Pp+VfTMN5gyVktASntoyvFzUSCylnP87lPVi+eNN0j2PZE?=
 =?us-ascii?Q?g6UUKG5ilFaNyA64Lqy2BRoh4nv0k1c/mxFdmrOW8hTKm+n3eA4W4PiYGZPC?=
 =?us-ascii?Q?3XFNrbnS9m19VjwAkeGohRxCDPiwlZLZ9x9SDy2iWzIclzLYB7W0eXxCClkr?=
 =?us-ascii?Q?seT+zgGNaCUaYhoDFTRctuMGyy07wrHWP4wOtKFRUDYDb9+2uMAH+IMvYN0M?=
 =?us-ascii?Q?IdI1OyT/Toq9fYITg7NYKW4GzNAJU9uyaajaxzJeIGn1A/8OQ0FSFHXrd2cb?=
 =?us-ascii?Q?iOg9heNeA9RZYBXTbLq7+a9aW+kCpS29k5Fccq7OWRVNrgttXzhcugHxFq3h?=
 =?us-ascii?Q?QQ9P1BNa87IDNX9PuEO8mEn1n71ubOKOqc80Jl2qKJid0Hq7/bIRN46Gg+dH?=
 =?us-ascii?Q?sKisOh14+rkB7WlIdpanoNzjR5i2bDLP2DPskVbBVKoCp55imJLJ3niphYbk?=
 =?us-ascii?Q?ODIxfa6BGXU7r5bNJUjBGeQ6fODDHVOL0cpkoH4BJZM1zHuyj6/jCVWgQsSG?=
 =?us-ascii?Q?y+s9ZSPioh865b7s5LIcc9wmh4HmlLX92CRk3u6r0pUceBqM39jB6ij3k81L?=
 =?us-ascii?Q?q0H7C2d6KT5zAxkQ4DoE/88IapsrIfUuRuPzCA6ZxrVfdXF6SI7GADG26oam?=
 =?us-ascii?Q?G+Upr8Kd/it41+CGlfw3fsoGbfCAziehE4qHyTDarwAcnZDcBlE2WLqOX2y3?=
 =?us-ascii?Q?SBGQvPOtoK8XUYRURq+tcz2sqw1Jm3jJ5CwhFJ+OZxNPU8FEfZjNqqvhCaCs?=
 =?us-ascii?Q?8neNXcNb0R5ySVcucgUuW7j1stf/753u89b7ZkapVtqxRwtOLJd9OPWGuvVm?=
 =?us-ascii?Q?jHoj9WyWLZuU/nfZRRYN+rC+BpKrn5lDNljszGqXwq+CJZ29+ojSV/HzvS3X?=
 =?us-ascii?Q?Ma0P40AggysI2S1GaOv3VWXAt9yipOPrXGH5qOY2oPL77zp4ahpyvLT36U+l?=
 =?us-ascii?Q?bR1C5k6EYT4vo91qlj6A4Re8ZhyM27V++x0Y/VrCJv+LFa9sdtPyYAnproWb?=
 =?us-ascii?Q?d1WK33eddgOOrNPGoPfebGpwY+YUYEDTLUiaLc0yhr0EF+Wy/WHjnDOGPUkS?=
 =?us-ascii?Q?5sODMFWNolLntt2bcorCo19iyc8lN7enHg99zQO+JkvcMgVHe2dAVWKjFQKs?=
 =?us-ascii?Q?euN8SaAmoW7GMKBAB46+6bosj8tQ2ZgAQdPempBbh6n1oax01d+07mXTc0IS?=
 =?us-ascii?Q?DTKNj/d8GjbJjihdhktnj5dT0QDQ/Jil?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J4AokG4f++sOsBx6/DPIjDcA94gEEfWvF1figggjhlhHdh+O7GuNfX92xzDV?=
 =?us-ascii?Q?SDbLEyD8oXcQUjoCxLSP4Tm0asAkEp/ehiyEpeHw9jY5AaCSSlQS4Y+7Tief?=
 =?us-ascii?Q?ahVRqJxwvdESnhOWpadS1fkCAYjSYFhS3RK9Aqgr9/3xLhLRyI6bzA9+SxbF?=
 =?us-ascii?Q?x1OX9/UvuLV6bHbZymwFvmIsB4Z3u49CINsx76BD++Fu11Z5M/yDEKU7bpjI?=
 =?us-ascii?Q?MeqmkkY7o/PrSQ+OzwJXDCwje8tprSOSgvs0LD/FvBVezS+hnbohEa7ulQw0?=
 =?us-ascii?Q?XIOq5w6S0HYDn+3+vmzSbEUAVgnATQh82Chtzhc7P5lWpf0svVPSYCHSs7kA?=
 =?us-ascii?Q?S0vgf6ztRzDUPi27Eh7nZFDafW1JzLbyN0ewbBNJHBcX+pqSDvOOYfcSrr94?=
 =?us-ascii?Q?Zz2sWxP03KY4judCbIK8/kQBMZ/29x4GTUfxwto+BET59Xe2qN1pFy822Z2I?=
 =?us-ascii?Q?13rAH7EHHE77dd39yx3rYmohJkxTysZkxoj8i+DpjcY1R5GXzH8pmNGhxAHY?=
 =?us-ascii?Q?UMGOxGrHbtz76T128FrbtFQNjBFpd4/QSnSQdNJONwOK17dp1A6ICV+okTtc?=
 =?us-ascii?Q?FQ0TxBuR8j9To4AjnfN4yBgnPNta2wv6KMmscBRm0Vaqv4d5V7y7KRH2HUaP?=
 =?us-ascii?Q?Y7L0Ydhdtl0wKR4eIun/BKzABw4NmzSrngVNM/4qnYSFthicRQAzy4qb9/hw?=
 =?us-ascii?Q?ne5B1uMfHun+BCdGP0LmVin7M7XVdyeshc8m0/nomOB0d1+6Y0nLmWcRg7g2?=
 =?us-ascii?Q?gqDci88VoYxo/6LZ+6fpyL2UVIpmEHU7iVKuHcdwjay793RBFkr5kNT6VjXd?=
 =?us-ascii?Q?2ktxx86bgy+yv88mGRImtbCW0dzwdJzSOJEYsf/lYzYFJxweCR+126TpJu+a?=
 =?us-ascii?Q?h9J1NaT13NtSmojZW5ixbd8JABP/kmd1my3hhiaAEWzi32k1uqwlESjAQnAw?=
 =?us-ascii?Q?7R3AsI0y6ZeoDiLGgL5Ijw2c9ZrgA9DxQpZdF67RnvWcEBhN/j4oyLSjivAs?=
 =?us-ascii?Q?7QaA0gyvlXM/gnAvoRvKIP5TTXKGgVeVNbn3fpY533rBYBlsDUh94EsGDoms?=
 =?us-ascii?Q?C0tKwJbiV7KGp0S3oWwJY9DXAxFOUUhj9K9AfUrSmPZrk0Dj9rvqInKbLjvC?=
 =?us-ascii?Q?Nxck8m31hNzHzH72M7+r/xFaOkfwSRR2BXzjv8KDEUtRtP5LRsivzP1lsmVu?=
 =?us-ascii?Q?P7A0v8I/fgzTMSgfbOKPLn9i6TiBPC1a9Ti41xj7lWH8zO+fUTRc0HbsHwA5?=
 =?us-ascii?Q?Rj9m5vjJjdVEFIBuGpWhCyq7B1s2VAFNth8nRyzVCWq1P83AYsptwhtihaky?=
 =?us-ascii?Q?3sN/zRXGZ93tUdw82IiJSZPUMG3TPtB4K6ihLZ9pao4gOWD+8DnA42pC8Hsb?=
 =?us-ascii?Q?SPdnxxH5QmQGRpeIxgCX1gAd4qn8MZ5V0aQaTGfRlgkHOjSLgHoc48vMepxB?=
 =?us-ascii?Q?LIyFAmZ+VnVR61acIo8hmseVAZ30nZhpDq9dpxvhywQ32icfY4NkH4KuJ99q?=
 =?us-ascii?Q?RCdWcJy8e29V4sRNbIqLw+5kmSw+/VwRNbb7hgm0XAd1QOKrvO2OpJPa/q0O?=
 =?us-ascii?Q?u7mEKHXbfTq6k5cEQdbcku0Yi7X+p6wWuHHRJDPvjfuWKLWiwVwTi2IWKWXX?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc2c6bc-f4a3-4951-d9bf-08dd46696f24
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 04:48:00.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKcfHtj1sJmJ6iv5lCLZ8MZTXVq7hr3ufNJ6Hu6KB9DsUSghxe7OVviHwcb42dwz1Zcdvm+bgD7Xv3hYF5F4JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7207
X-Authority-Analysis: v=2.4 cv=JrcLrN4C c=1 sm=1 tr=0 ts=67a43f04 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=UysDsY5B1OTJ06xeq5YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fLF5ST_ny9eFSYha02V3zwgZ9oP8jnvD
X-Proofpoint-GUID: fLF5ST_ny9eFSYha02V3zwgZ9oP8jnvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=982 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502060037
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Feb 2025 04:48:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9124

From: Chen Qi <Qi.Chen@windriver.com>

The source comes from one repo, there's no need to use SRCREV_FORMAT
any more. So drop it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index ae3495ba..58c862a2 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -27,9 +27,7 @@ GO_INSTALL = "${GO_IMPORT}"
 GO_WORKDIR = "${GO_INSTALL}"
 GOBUILDFLAGS += "-mod vendor"
 
-SRCREV_FORMAT = "buildah_storage"
-SRCREV_buildah = "c0602013adc2142f017a6b973a70b33e57bd5539"
-SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
+SRCREV = "c0602013adc2142f017a6b973a70b33e57bd5539"
 
 SRC_URI = " \
     git://github.com/containers/buildah;branch=release-1.37;name=buildah;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
-- 
2.25.1


