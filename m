Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CB6C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:29:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38562.1737534541684168061
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 00:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6jh5e031042
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3g9nq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEVMa8pEy8WPtaKo5NRrXg24ecijtngd5M/moe/RhjVjCdWGOBCu6xnq5gHjdWxzjdfMBCezaYe0okffyWKDqH3AiS9vSy+yeGoJlBsciAUOMtqRrIutGuk2vEoELvP3cDkSm9yd63CC/tiJvOEeeLgZEyuTtJDrI2Gn2FFjDWQMxjdadgL3VzDnU1UJgTyfiIKMZzYgRoBZOTCTg34xDgkPgn4gtH9TsoWCgjPrLr/yNvqMgFt1IwcAS56tuz51RGD2sAEMGZ8A9DJywc4r/rufWCiKaO0edpd+DkrvvW1yQt9uG3UzeGRl4bp0YzxGanVO7KX/20Kjv6C8dTowyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+FZ5FmCFlFPolHWiqZJWv2Emf3sXfmyUWaYiUOSGeU=;
 b=Ukg5/rCsFfGNzJ8SqvcyEIHeAnylIA0veLzR5ah9NqIPUWDmyFiHVGanBkFknBrjqUYDrPV+qbLVv5Rr7LALYhTskCp02dkaaaclGxbZ8F3y4xLeAyWkq9hQ4pOkfT16hshDdbuVF1PQgkb49klEnt9EncR22JyJGX+KBhhAAIYAVKAiAX970g/SK2gu68syidmciiF9XbDvmmLMYr0rvQABQHpNo3DTGxvzmI3+/2KqSFhK9tzM3h53NWMYY0LcwBxNljm8Z4GRbeMKtm2lBHU4EtfGI0Wg/5NYrrB2vj+ol3FRZ2PuFILF6TlHUk1hLDb86HflYXoW59GsiNcftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 08:28:57 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 08:28:57 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 1/5] buildah: update to 1.26.8
Date: Wed, 22 Jan 2025 00:28:43 -0800
Message-Id: <20250122082847.3470429-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 97112100-1703-42ab-e68d-08dd3abed038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rsQT/iZFP/M2cr6v8cpaL2HG9j706M6J80vhP3HkibM16DTLPW9ZzkqvCVpS?=
 =?us-ascii?Q?3K/Ey5f5V8pqobaNFh87/kp6xugf2DPbCRdx0Ry3y0HAKz/EW5D7g36xXQBN?=
 =?us-ascii?Q?YUxPoRG+Xvr7QOjhRx2nFau7PQprLExTBVOXk8I1ngWt2ZJUBQ8yX5JDDl7M?=
 =?us-ascii?Q?9gOsn5FhIoOvu9pjjWqYiIx8u3wYondQYlwaWnGu1TPBSYqrd8/NWHt8IWGO?=
 =?us-ascii?Q?A9Vy1WInW5jGRZpGvcraaGAbGr5oKMw1HumCZ7qM0irTCD0mhZpB9QnuKQME?=
 =?us-ascii?Q?2SRGOOp9ZqD5oJhYCzRilm+9AeuN+kZFHBthFGGtDi+5pDaac2jFBv1NN8x9?=
 =?us-ascii?Q?Y9aTWK/QqafTu/MBV4uFztCehwlQPvP7NMchn+CH2l67nBHAeIF3xH87VpqI?=
 =?us-ascii?Q?CkiqUU9CJZQTFsXwV2gn6MKJHCGdGKoc1YcFj7PjnST8jL6Xf6rlYXEIRnzL?=
 =?us-ascii?Q?AtI+unzq5y9VEkCBVgTC5f9JAd2c9auYBPMuutdlqs9rwfGlsIKrvpijRUGj?=
 =?us-ascii?Q?FVfp5YYW7fUyXs9Yk3M/p7KWAXtI9V7YwOrq/vndqp4hZT6Xk1rAUmtjufd2?=
 =?us-ascii?Q?L79TFGNrKTXabKDRCyAv30F7XQamH2KAWsJkdrYfihT38JVgUu/kz8e8IoU2?=
 =?us-ascii?Q?mMXCs6F4rCeRsY9T8kDPQbfn/dgVNCx9GvBXuk2d3uzSHRsrVivVjzPw1HEP?=
 =?us-ascii?Q?CY/lbfAVNvcx4P+40Bf8UCLNupzVS1tS7DXaOZlKmKtXdf/d2e1hJF+uOmAM?=
 =?us-ascii?Q?KhbGnAi/xaeubXdXK6uaJ6CBh0sEpGtZ63XVDg0dNx3xvIt8ir2rahfD2zFd?=
 =?us-ascii?Q?F3mU1VLB6Yx9ucXsIGve4BtXOcnwgCEXmDccPbowtdRR90ivjDRRO1wySV7D?=
 =?us-ascii?Q?oqZyGepfvo4PSCO5k8Bfp6Qv1fXfClogaIOpZ9vD6jwW05mMCZJ8H/YfHwK9?=
 =?us-ascii?Q?VxVjsDH2dNoaTLd+zIfH9NH97ZioqLQytMM0004qCxcu4PJ8sVjh/FhPgQlA?=
 =?us-ascii?Q?vAXeE+pnXBCJlRXXMh6ERYOsHc5IltyqNihqqNWpOr1sNvJNHzjMm1yl2ptD?=
 =?us-ascii?Q?hT7iM/LFZffgYJHhO93OOFOHqlBukzXYe9IxKVPdncPsFj9KVdMR6pv5wCy5?=
 =?us-ascii?Q?71ayXQz4bBCJax9SWQAtLf47i9KPis1kx5+jkKn40fvC0EGJx67JPloJ8aeV?=
 =?us-ascii?Q?e85+AhHLPCzFVEo98116vz61RytlFQSzHeIkQsjJNwlgIMeCN2SmS1PBgwZd?=
 =?us-ascii?Q?asuluCSa4fFdJNZYf1I4SoOJg9T+CFBv3fMPQlhINOT0yjfDDQlu84oY9KxB?=
 =?us-ascii?Q?fS/IJu/3wBplQAC2VzMz9nJjGk4coH/hMX+6lfL9GI5EHTRPx+Rwh8wZOQtX?=
 =?us-ascii?Q?KedUuscN7ROsU+ptzGu7qpQ1Rb2c3u+0YBJ0a4WP0PJrIj82YkIZXC4iqW9B?=
 =?us-ascii?Q?mWPA662BcjKoMWm3MoQKHgNmWOo1UAJq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5bRgjz0EbS5tE93eoVBYuDN2Uh3aihif5wpXv95e602t1HTB7ZxjbgQGN/2Z?=
 =?us-ascii?Q?GTXiYSvy/2b8XEyl8ZHHSXHuB05yWfO2Tw4E2bk85VsrFja+rU6HNLxLow0A?=
 =?us-ascii?Q?y67qV/3UrWX88/LKwwGP+5kNMdZa1epczkImi02MM+V4IM2arVZzCpim601d?=
 =?us-ascii?Q?pyFUPhThfJidOqnVF27jMe4U2pDNL1qEzSJFXA/X/74IwLgzkUDXYHuDEQDV?=
 =?us-ascii?Q?sDHcH2mycq2WeC0I41Z7SUdsjg4HygvfOX2PtqDkIrCcZgjjysmWUpL/2Isp?=
 =?us-ascii?Q?GhXPEvaG0zeXDxdchys4l8vq4t8Rd/GdN09xeUhoLYSaSMXmgh40V56OX03B?=
 =?us-ascii?Q?hZd62tUIL4oataLFSTMKzas0P69ctQ20exMjg+6BNKLmkwo+EMTDIhwjWFJS?=
 =?us-ascii?Q?L2UprypUCrRn0dd4mbvvmyrfQ8AhS74f1D0CSU7iZ1bVam1IWiP/ePtsYdlO?=
 =?us-ascii?Q?GIsKbG/ANDRSP/8/rw8R1WsQKpDnWygj+g1d4cACmv92aJiyCvxI3IV3sonE?=
 =?us-ascii?Q?s9+Hr9Y67w6+0UYweAuUbukRA32eZCDwr1R4nEZVZhncT0bReWTF3I+nSX+Q?=
 =?us-ascii?Q?gmqD59ufqtBQjxnCy2LCVmnUJhhN3QcbNTyMsV+uC/t5pUhj3NaI5HXmtnI1?=
 =?us-ascii?Q?8BygfodBcgonDtkuAEGejYxOjB5rku66EH8pMC2RiJUSsSgsbj1puMleGOeD?=
 =?us-ascii?Q?AvFto4Su+Y12qTwV34UmbxFNgOb8N1I9KayYIreOF7yG9DLqchYsw0NTbyeV?=
 =?us-ascii?Q?RjtV8trX/DEWV6GKXnrJ8wKOQG5pislBXJO8RtIWDx8HEcWqN+Q2Z8qXWRM9?=
 =?us-ascii?Q?7RA0bB1frrlPJ++2TkJ9dHgZz3TpDtxUaQBI0QS0DWApcN84Nh8nMNKaGein?=
 =?us-ascii?Q?lC7lhtziRtRjpPIGyxHAfC5q0xoDyKs7vNBnYFCHOd2q6rRMcIpqXX+ZmavI?=
 =?us-ascii?Q?nM4+rsuF2+pgrzMDhLrf5V1bBHRLhjWNocDb0CLzTTngEPYPIUYqLtxXAbXh?=
 =?us-ascii?Q?Y+lEnkBMUFgWaNhZBgy71i0gq2/inG3yttpgn2OSpRXp32sU1ZJIlPqZmMbZ?=
 =?us-ascii?Q?vP9KI4UuPPr6KP6XivEm5hINrFbFVC4RBSP/SYUm1jqU9G3VxW4F1hs+dOWB?=
 =?us-ascii?Q?pxbGk44p9i0YTJ9pem0+ma43MJkarUryk8gShL2tfoM4cZURB99Pf7ZaA7hJ?=
 =?us-ascii?Q?gev3+F3Hz+f6E6UROntXY620fjnVlHKmlgmE+eNaNYuEOEQdhFAl2SyLr2wN?=
 =?us-ascii?Q?2ZTjYZlJCLfNe/Vgo4tB3el+MjWMSIKrsBLsQ868hEG4lSMpNEY0XghQwKvp?=
 =?us-ascii?Q?QMwCWEjUSmCHymh17m8OmhHWfFxyWBGX+TmCT+zFYCuraVGIZzjoyUbGFbpf?=
 =?us-ascii?Q?EaIL07TPAzCDc9d762rjuIoGOcfjRHKtYYnBlV8mW14g96IgdJsszx0aEIOs?=
 =?us-ascii?Q?jQXPzy7d0hFSb2JloKcfUIVEuXSDL/gBWa+lxQfb+RnUYeI5kbBJ+WW9Rbjg?=
 =?us-ascii?Q?lRsP3ulwsf6GXArg3Ty42DjJ12kL5uAkIZxyOfcSSkaq/7ptpD3BBmrODRv9?=
 =?us-ascii?Q?Tsl8mEQKBvjh/6OscTuyDR9GlTq5xDv1QvNP/5RWlEYLBrdMHNfroDFpdZks?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97112100-1703-42ab-e68d-08dd3abed038
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:28:57.0255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXgXiqw6l5LJod452Jkmb50v0XsmWVi2T7WdttxGJ26w37ssiqcZoyvyUsGnSEzG23/L/DqAbokO2T/SAK+uFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-Proofpoint-GUID: 5eb0KaV7l4rs_IvusanwuoSR4nMzyqLL
X-Proofpoint-ORIG-GUID: 5eb0KaV7l4rs_IvusanwuoSR4nMzyqLL
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=6790ac4c cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Ljcx4Z80PikA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=Edodv5rml8a4fvmeVTIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=908 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9107

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 024e82c1..9e074415 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a
 
 S = "${WORKDIR}/git"
 
-BUILDAH_VERSION = "1.26"
-SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
+SRCREV_buildah = "e2feca77516568553dc1318019cea90ae000e0f3"
 
-PV = "${BUILDAH_VERSION}"
+PV = "1.26.8"
 
 inherit go
 inherit goarch
@@ -23,7 +22,7 @@ GO_WORKDIR = "${GO_INSTALL}"
 GOBUILDFLAGS += "-mod vendor"
 
 SRC_URI = " \
-    git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https \
+    git://github.com/containers/buildah;branch=release-1.26;name=buildah;protocol=https \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
-- 
2.25.1


