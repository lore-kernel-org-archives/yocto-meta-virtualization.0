Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988D4C001CC
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 03:23:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4359.1713410585295822809
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 20:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GIPzVvBR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=483835a473=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43I3Hxtn024040
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Apr 2024 20:23:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=sC3cILZD+sEHg+3aJS
	AXwBMwC9c9hIj+d4Hm6LAYkWs=; b=GIPzVvBRzPvPZQM2iuJ4Rp9/cPimO0Ib6N
	UTnByaz5+m6Mq+Gds7SHAMNZQqVqB6wLHXmh+IdEeBl/j08GCXw0XFTTYnBsQTuC
	GNQULv+8RkWrfs18mFU9OMBAsm/ck+/JkhyLWm5YpOmB0y1GzTmwFDZQ0dB2SVG8
	6TxnaIk56lFWoMF9BF7UEfZhEJqjIueilQDn2nR9PjZfTe76Gq9HFRBttBKtfrWV
	DHgP6Kq7JqisEYf8BrUjLUALQJZvehngwgZ6KYhYlLyQsQid/s5K+6hGqFpuCRmH
	pFXAsrid0ZvwQrZkP6XpS4vop33GHwjZur4G/4/ED5H1GaiFU9uw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfsjgv83e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Apr 2024 20:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC+Mw7SB8pjjDKW2MY8ytRwWWBP/4h5+xrzJBCOu2yi3SKs+/VDq+p9IEhDIr27/Qe1XPabymvkuISjSncejMMntfZPnpGIrio7POlOm/H/MfnmJOiF1hx+kLAknxJ8+vDEX0DVzZL64i42wJbX/bvTvLZOyqgBRhtx9y5StLyuQ/jwQ4ZLv2rZHRFwGDELIilUbx/dFsdva/Gz183MizHzN5mSrTBTnn7LGPeOzrkzPHHJiK4aav95Nobn0BKdwsKZS5W5ELWJrC9jw4a5ShRIyfCPvLo9qB8Qp6jTMqPSHLfif/mIwBhytaeK9uXFsoHFBOwLYCPn1xCngOJS2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sC3cILZD+sEHg+3aJSAXwBMwC9c9hIj+d4Hm6LAYkWs=;
 b=CV6DJFU0I3CTplIvO1mZFvSdebKIl68s3MtMa/AGCr5fAL4CDkI5OefZr2VY79Vg/QC7hVqECMzPr5RHSpmHO+acdOMycV8bMY6NJfJ+QZTwESQBzdwyBaHC8f0n9JH11Qp8lIJ7qop0QNSMd6bw9DJVKBt6q9plJGW72/gnRuoacyrAHkKBLDBjHVWWn6QdhFtYgujhzISfP5x5EHNSdlQyg1QztAsCceqDHiKDcvPFyFkeVAXdpUbhYBnFPn5xyu530OohE9Hekp2GWM0XMDS3e+Y5xtNTZr1L5aatbDCNODDyEmElif0CaMTtoI4GCNWkyiiKKlV+SL2KYdoZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Thu, 18 Apr
 2024 03:23:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7472.025; Thu, 18 Apr 2024
 03:23:00 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] conmon/crun/docker-compose/nerdctl: get rid of go-md2man dependency
Date: Wed, 17 Apr 2024 20:22:48 -0700
Message-ID: <20240418032248.697032-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:254::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: dda9f6a9-f47c-4767-32fa-08dc5f56d996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bv7vLJgBM4fyRsHROjl5Khqqy/cujabdiQY/IrLANahmEc2Kg8QIkxVBMbo1j0IzSO6JAVdvZLiALZzKzcu3SukP4Yy074ar7ttvpxfGecb0sxT0PmzsBLJU/3JhXxILKHB0/l+C6PyvUq3Hl5ew7wHo2SGsppS6qrb8EjyW9zfKW2ZvYM9kkTgfYYtHj/LPvEftEyZCp22Yub1gp7tMhjV/+atzmQzXaFyIzp+T97PtF/XyUdOEuhqohGBFrnc4SIkZkhjNsy+CQORgB5V6CY/B6Fzrg6mkgshhnE2S951zHNW8FTtVL7SGYhsc93kNl4A/HSX/Dq62adN4mlz5Ovx2QlfqSHWUqK0nf+NxvMYRAxkLu81AzEefZ5jFwWlvtBepwpOFZFNVIxw98/FeXps//w3zFdWwU/cbuQBsooxTndA+A/EWFK3FRVDjg5dJLTaNFD/Q9GSPtJwdaO+Zkh5Uqbcr8My3JzJVBXI9JaZginptx8X4hTmCuaTW9v2EploWvvk2bS7YjIno/i6T/M6kLsGcXOk0/dXHIwEKYwcuqd+kGHzrtqRAXJ+K4FHb3o6d6vdVo+ebZxh3hV643aN4U+cq3P/er35lL2DxsZ7E5L0cNrrA/nUaoFiAHX5oxVbk+6fDlKFn8lmDud1JOJZrEEfnZLypbfL5ROlwQ8dC5anWs7oZyOCGsTGlOMmjJKB70tOC+0/agSfoDEgHyg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FElye4TCDDLHBN3RxTf39BKBdZQJNrl5BYg0n5uhB1R8vzzfl71iaQ4ov2bQ?=
 =?us-ascii?Q?38+G+ynTVDOySGc98ftupSZOBhqj/NmIZWEGiMJcTuYBjHVPlSJZvmp645l4?=
 =?us-ascii?Q?tvphaAiAeP3ZRq8PAgSJR/yJpHY6Qq5BfaCcq+j3SeiLFGA3Wayjp1EgbvZr?=
 =?us-ascii?Q?XxekbZXCuLzTmqP8jbQsc9Du+slPUtcVJP8BccEsuZf5msJKMZH3s3/FAzCP?=
 =?us-ascii?Q?zyjwCdmd4YrmMDpNGlzHW62zES4bhxa4vtPhBm+sRQMQSuq6AQC/6mEajiMg?=
 =?us-ascii?Q?02eRpHAmNh6H3pgjWv4ocj9j3hu2oHfn9O0LZMaSUV/4Uanw0zof3PBOBwPY?=
 =?us-ascii?Q?fbhyEmZsFS34YGJJWxbvlNOpaSwqU3ZnxldURL/xDpCbuZPNTzLCV44zmBh/?=
 =?us-ascii?Q?2FhxYnEzGFkBjvvMr768iuKt+sAexpC14Ccz3i5dtwnP8WlKR4tn2P9ZxFTe?=
 =?us-ascii?Q?nCbYoGNZ3cG8moWTqawtAgdCIsxH9BPAwY22Q7GGcCBtmZLParXDG0xfgGN7?=
 =?us-ascii?Q?AOxbOHf34zsb+opNNMxMKv9yh97y5R3MT1pByy+KS1Xk7cE2+uxY5GXfBbZ2?=
 =?us-ascii?Q?7MuWnnMY38k4b6qwPW4cv/DecC01zOv/+gK4Mq/cj8+jzbi5FwcQx0FIFacS?=
 =?us-ascii?Q?Bm0goLTGvHvkU1B7m8ktyqgdO5QIk/OtWZpi3IBZb+rJs+SKoL/sf+U2qbcz?=
 =?us-ascii?Q?wfb3K0IQY3pYRNF8h0AnnEurIEIBsY2QRd/V5/zoX/KaHHbNk+vlUHDY5IP/?=
 =?us-ascii?Q?EuCArax9ZR911ascyQLKRXx74uSfEKNOL48phxKpQQ4JHG2YLuy8U0ANGITP?=
 =?us-ascii?Q?m/tEf80OD0Bf3KHdN620bMuzXVkD0TxzcyGRMc01eRvapsA7WKB8AFnCcO7D?=
 =?us-ascii?Q?J0zGk/TXgVVZf5hjTF7WmuuxNJ3oaQtFLb5eNmqf7+8Zofg47rNscEylv9gX?=
 =?us-ascii?Q?e878O6T570bpkQJrxk+Cb9FUyl5Igtn/gsp/MhBhHs1kDR3OJrJ33zwVwg+P?=
 =?us-ascii?Q?dRCpIbjCAT3MANfPgmqTJ8DiOkyVl+xL+yg2HmFesV6t6DSh1v96hbDSLyfr?=
 =?us-ascii?Q?eA+yunVDpAqn1JxpY8UNT2y4R9zTNIgplZBG6l6f3WW6UZ2v3EwfzClaKkHr?=
 =?us-ascii?Q?crPfAxolEIIVIVszrmNtF7mDrjPd6bCFNjm1MvTYDImp+tmB8NfCmx8Vzay3?=
 =?us-ascii?Q?+FzlB3ZAjtm5k/ltasivIwk/tF3MiRpouvaf3kdZaEq/LjYn9NZe7jPUIpbg?=
 =?us-ascii?Q?hEo1cREVeAeEKM8ovDyfj2e0OXW6ljcwHqEQu+AnHkb7u1tjyzsMFKLV3jB/?=
 =?us-ascii?Q?t6THEZ47qtENF+6xUc+4AEcRCBw1O6WFQscXgJZjrLwSyO6imZMw+4ro1eF0?=
 =?us-ascii?Q?DF5oCbhG69QtWJjzTu1HBLEpEUm6SSBufdm87DcLjux+TSybCELEYlPZ5TmA?=
 =?us-ascii?Q?pt5WlVTr5jGZNkKiQ2zEktlq7IOCWO+XzkQVwj/ImqUfVjFWosWlGkD+fUQ4?=
 =?us-ascii?Q?r1xajf+G5mZL1Z5rCr43OvjRA2H4bAeCmEG3IpSWXyiLs9xQZjzme0RKIWVo?=
 =?us-ascii?Q?OSXtgJanK+ywMjuWgQYfQS42cBqyyDE93avXqZuna0K/bwAsH78DCmUa0RMt?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dda9f6a9-f47c-4767-32fa-08dc5f56d996
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 03:23:00.2814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ydrrrI1ZT63zLMzvVK5MF8tpJF589+YAWoWE7X4R8amQPclR/G5lRAwww2g3GCsqhjqpkGEpImYwxGq3EDd7Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
X-Proofpoint-ORIG-GUID: RqmHDwMW8tWMY5n3M3z-bsFEtC8QYrMu
X-Proofpoint-GUID: RqmHDwMW8tWMY5n3M3z-bsFEtC8QYrMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_02,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=846 phishscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180022
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Apr 2024 03:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8683

From: Chen Qi <Qi.Chen@windriver.com>

The go-md2man dependency is not needed for these recipes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/conmon/conmon_git.bb                 | 2 +-
 recipes-containers/crun/crun_git.bb                     | 2 +-
 recipes-containers/docker-compose/docker-compose_git.bb | 1 -
 recipes-containers/nerdctl/nerdctl_git.bb               | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
index d7047ed0..ab8a4ef2 100644
--- a/recipes-containers/conmon/conmon_git.bb
+++ b/recipes-containers/conmon/conmon_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61af0b6932ea7b12fb9142721043bc77"
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
 
-DEPENDS = "glib-2.0 go-md2man-native libseccomp"
+DEPENDS = "glib-2.0 libseccomp"
 
 SRCREV = "affab49967eb62f75d2a47398344ab053326289f"
 SRC_URI = "\
diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 89ba21b4..c0f9ead6 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -26,7 +26,7 @@ inherit autotools-brokensep pkgconfig features_check
 
 PACKAGECONFIG ??= ""
 
-DEPENDS = "yajl libcap go-md2man-native m4-native"
+DEPENDS = "yajl libcap m4-native"
 # TODO: is there a packageconfig to turn this off ?
 DEPENDS += "libseccomp"
 DEPENDS += "systemd"
diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 07650126..afb3150a 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -3,7 +3,6 @@ SUMMARY =  "Multi-container orchestration for Docker"
 DESCRIPTION = "Docker compose v2"
 
 DEPENDS = " \
-    go-md2man \
     rsync-native \
 "
 
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8868274f..dce5b2cc 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -4,7 +4,6 @@ DESCRIPTION = "nerdctl: Docker-compatible CLI for containerd \
     "
 
 DEPENDS = " \
-    go-md2man \
     rsync-native \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
-- 
2.42.0


