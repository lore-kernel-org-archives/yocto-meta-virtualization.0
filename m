Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DF9C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 07:49:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4450.1652773768388279174
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 00:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k8DazLjs;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=2136b1284e=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24H6hmJZ013262;
	Tue, 17 May 2022 07:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=X3+lSz9xbBnTdHuG4eZvcTgX2irmDb2iRz8U9GF304Y=;
 b=k8DazLjs2E0obp/k9HWx0r4LuVw2Xxb75i9tCjscyoo6UW6gEU/69SFHz/HjzNJqGgnf
 i9HAHEDsCcmSqEx1xnboqxfeoxafmOrz49aIQ2ioXt+cn1c9AkuYCDqWQhUjE2STHh5c
 eBpm+Ob2zHvTSV+S+EbAMUOD/ngmNc7U3BMp09rk77aFITNxkrUwv3mAO/AvzPB27Q8/
 1PoAui1GK21VxvruCNwGvwtyQpqyDDVNBjk2Nzd0mNJUedBHmapWfF7zBKJUliCceR6Y
 eStOG5OxtzwRYG0AADEw6MWN5qtAjcrIxFeci1Ebw2VDP0YqV60v3cZmGC0fZqW+K2pe yw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g23d8jb28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 May 2022 07:49:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8GvyhYDaRntFkzVETvHUzAAIiU5WNQzsd+3RibNsZXn/7FxGXWfu/YkAcnHvASq4YKQueHlD1ld4SKLeXxfqdD+F2LeIs7g59UaZtbVg7hbo1ZvSnLjCkK0fW9tmvF6V7tlE4Bf2MU5eOG38N3CkfKfJCIpbvoKvaROJwckJ6VCJiqPhWy4eW5qx7MLhS4vbPZlUyWClRGIDz/SoTpC+UEMhhhSVAt98cWdyg6w1MkxZG32+zM/Nt5fGf2iKo2SsdE5HFAMzWOUskVGWSLVNInGcsJrK79dr+uERnOXdIk7jpFsTk1MInGCotgV5iUO2rLVvw9NVAo1Gq7/Mdy9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3+lSz9xbBnTdHuG4eZvcTgX2irmDb2iRz8U9GF304Y=;
 b=hCJPUmWN5vQiTXxr9/moXzf84X3mZlzJzgg++oghovx23AiW2xVPymI62uBL+Y1/91J64C7KEqHRGcVrTdCfaM01Ih5yn6m0NzLXqvO839ALfdTGkl8MoDXzwI1NEX9Q03UZcx7PN71xobf+NaYi6iDkBZ3pPNlGQ9HwR5jRkA4+szH9b2aIuyZm1xUi0CU4szKdFtv0p5nYdgGgP7OSTNo9A8es7OJFXQVYwjU7hp0m4NJumJcdNgkJ++WJywRWQzYpcX2aLpOJH6QNnAgTgdkpVlHF4f1qJafWzQhbhQD4+QB1zrIYmdU+gXxnJNCOp2UR36oM3V6bmt3U8osZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by CY4PR11MB1800.namprd11.prod.outlook.com (2603:10b6:903:120::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 07:49:25 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 07:49:25 +0000
From: He Zhe <zhe.he@windriver.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: Fix keeping restarting
Date: Tue, 17 May 2022 15:49:07 +0800
Message-Id: <20220517074907.419113-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eebec3d-a4e5-42e9-4dc6-08da37d9c32a
X-MS-TrafficTypeDiagnostic: CY4PR11MB1800:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB18007221AFA9A23BF67A0DB48FCE9@CY4PR11MB1800.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rsoe19jh/ezZghks4jo8fVi0MVFM+Z8UZnAMT30c6s6vesQUQ8fTU7FRcrdMrWWifJaWUONKp63r+fvahfutTer7+v7sf8rbsBdrlkMT0raKpqEf5v6im2rz6Axsf4bO9AwfkkxWZe7aADuWKcSK4P3QfI0BrElY1E+Vr45WRR+DmYAx8p3hZqo7O7XcL6Td9qqz1MRQePieWemofx4I3i7ZzbhoSSQ6j7e6O0MVsVoP4jCxyDqwAM3UnEw0zdKyMb5BWggO0K75FdC2vBZCyr/txctjexKNnPBR+CgKD2eGIRrk1MPk/1BbCb/dljsIXAuFGuQRLxR4gtoEEsAtzl0BP4Y4YksQ7ei6BKMj1ZYw+IIH04xLyBIG78ETcdJHnHCDIby/ywQpBUtM+Yy/ICqy4MQCzol9ItdcqCfzcgCu6fJn9afrFAEjI2KzroF35RkV0WAx2SCkc73ZouMSFyFfauy9njXUjz3BwLfpWaXUzhhddlq+1ZTtbmVov/YLQtwRRdjrv4YjloJtIaHvJN65t3t1Brwrt83pnRd9s9CZueuj4NUYndxqKfyh7LC8t84YA2RnAcK8+Bz1PbTMmwv69MCmY4lRUdFSJnQiya1f0hKhMwsSf0HLrL3QkfpROxyNcFYSMpQI3dAeih/O7uR/PEs6lGu0eIzSvrlrumNKVN7fNbr/ibZFrhdkmA6WRpwdUeBqdf/X5aM2M0FvPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6506007)(8676002)(66476007)(66556008)(508600001)(8936002)(2616005)(5660300002)(38100700002)(83380400001)(316002)(6666004)(52116002)(2906002)(38350700002)(6512007)(36756003)(26005)(66946007)(1076003)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZyQN9LpZC29lWeQwWdGgou8NTW6vrWA55gHH/hRlzniP79TMrslfFLdPJPC1?=
 =?us-ascii?Q?t0EOt4D3ZlqJNq1Q1PfDKO0F547rQqqe6qdhkVlJ2utdFGv+ZBs+xW0eg0ek?=
 =?us-ascii?Q?k7bGcDxdasbPeupji8DykO0feNnVbo8RWjh6VK1uE/U7QdEs8x+Hpi0So3rt?=
 =?us-ascii?Q?jIIMFwJT0OCqTmLV0fDVppcSCuhT+ChhzAQF2RGP2oi/lPixvbMHHdsBwwUL?=
 =?us-ascii?Q?MMbSZ8ouWy/QaIR5wmYYYFqnf8BpHvY+UgBE15/GzCSjIu76VnkoD2E/zkoG?=
 =?us-ascii?Q?Y+VCICVEHIiRfEyFgi/geFxJCMgfeV8iTYONSq0+u8kA0wpvUonWvmF8IyzO?=
 =?us-ascii?Q?W9vhUg4MdmGUaKJRjNoOEgoReMiFvhTUzuttsfzy6qGO/Oi1E35I5muEyWsx?=
 =?us-ascii?Q?09kM64cf1HTvprX2kUpXcCbdff5SwzC0+5r5tRjNMO1sQYqjW5DKAvRz0fIm?=
 =?us-ascii?Q?1Ld81gtC62VX4fRE1X2RPST4aJKlNTSf9Bhq5kypO/VHPkEBUc4UhAofvEDs?=
 =?us-ascii?Q?4qEPrik05tym4b6xAGI59pEJH48iAL5uKuS81dFz+7kxGeprfeSmSezgOUzb?=
 =?us-ascii?Q?PeXqGS2tc7n3OEUXaawuE/z+HYUVKbrAahL7ZcusaAS5XdkUVj/P4JBSlHEW?=
 =?us-ascii?Q?Duh0/E0GGXAjHC57n20SUFo5BnBGWftk/5S8qPGCv614S4aPLEOsyg3OTDdD?=
 =?us-ascii?Q?VjJNDZ5KXgVAQh4bVSghRw+sX89QFh5DAf7LmNvdv1M9zX4+A10bl2rVzlhx?=
 =?us-ascii?Q?fZmco2o2voywa2x148e/pTXoUYY62gJvRnsLRUErtT649+jbO/FFZa8GOTWu?=
 =?us-ascii?Q?1K75+5SnD5oyDU7C9PbFLSUI17aiT28JNf8EnZLBwjx+kkzMVM47hEFJAIu4?=
 =?us-ascii?Q?VyfMLjflJWmd+FiUzHHHVeSGNCqmAUgs9PMmBTUKO8IRxT7KpAZEaAE/JoWr?=
 =?us-ascii?Q?YTK7a7gxpIk+61C9ANmr/6zbj8UIydruP8Q/ihc0gGUmKCHZnc2c3LoHY9C/?=
 =?us-ascii?Q?E1NTLI12qHMyHw9ZoVMkzkavQSwfV9gSpZS+F3lPo43A1o2tcr0rCRsWuVvz?=
 =?us-ascii?Q?VswvOS70rSZ5kuhEUXOuBUFSBpcOxMFR0QQfKTFXYL3mU8X+fbNCyWO9eesQ?=
 =?us-ascii?Q?SDRFEpdKblPgtUoN5ZxnVjFR0+WfajMlkgAHg6duaDzykuS1pJl5gi6qvbVE?=
 =?us-ascii?Q?7HA4bZtXaiBwMzsphqg9mNvZin03f3FlNTEdnGUb9cbao7eHHZVdKuOSBoc0?=
 =?us-ascii?Q?8fsulkhvuUzGGUHH08vzcZ1m85Zj+yCsHyMkVcxY27awbn4nrjs3CmyPLHhT?=
 =?us-ascii?Q?mIIE3AND7r2UI2MKQ4qyh1FCCVJO/potpuY+mkPkCdIeDwO0VMBxpHCWbOYa?=
 =?us-ascii?Q?L4ngSDa2S14sOGIn9fnVoziwIZ13jRYigjLfNBWbsefD5MX8bqJES9ax0yg+?=
 =?us-ascii?Q?EvKQDfGX/Ioc8kEP/JQQNg7evFV59gzaTTN4FmlpsxDq/g0mDK75MB46+Oi/?=
 =?us-ascii?Q?xCMYKF/adhz9laNyJe0G5Lc156Rit9LxbFkjcumJnub1Zu7T2UUGxBBYGIRU?=
 =?us-ascii?Q?M+LW8xQCbTKj3oSl/mCg08clGn4ia/xRRDYD3/yfIe9H2rWgpvU6Ic/cKicF?=
 =?us-ascii?Q?6VZNg2ilOhXS7tfIZvCphMwdfPvSUm3FjUSg+y2z/tM5n5lCfvFNK7ZFUtX8?=
 =?us-ascii?Q?uxamrCA02C7KR/W0B6MBFUPVjjZ8aKkaVFsEvaco7kCs7pr2DW6Hqt8al60W?=
 =?us-ascii?Q?12q62MutLQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1eebec3d-a4e5-42e9-4dc6-08da37d9c32a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 07:49:25.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iLPRas2Ms5902hbeV4XuewDQkF3NkBRpwRDEVOzOgdl+cyJ+I/DG2f2PXKhH1nI9XORlkccfmfUhxRdTOKsHFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1800
X-Proofpoint-GUID: 46bHadB7vRaZmChFYivjrhv95zK8Wbb2
X-Proofpoint-ORIG-GUID: 46bHadB7vRaZmChFYivjrhv95zK8Wbb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=989 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205170046
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 May 2022 07:49:31 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7279

LIBVIRTD_ARGS has been moved to libvirtd.service since v8.1.0. Move our mode
setting accordingly, otherwise libvirt would keep restarting and VMs would be
constantly stopped.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-extended/libvirt/libvirt_8.1.0.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index f8deba45..89f82bf8 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -208,12 +208,11 @@ do_install:append() {
                 rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
             fi
 
-	    # This variable is used by libvirtd.service to start libvirtd in the right mode
-	    sed -i '/#LIBVIRTD_ARGS="--listen"/a LIBVIRTD_ARGS="--listen --daemon"' ${D}/${sysconfdir}/init.d/libvirtd
-
 	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
+	    # Change default LIBVIRTD_ARGS to start libvirtd in the right mode.
 	    sed -i -e 's/Type=notify/Type=forking/' \
 	           -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
+	           -e 's/\(Environment=LIBVIRTD_ARGS="--timeout 120"\)/#\1\nEnvironment=LIBVIRTD_ARGS="--listen --daemon"/' \
 		   ${D}/${systemd_system_unitdir}/libvirtd.service
 	fi
 
-- 
2.25.1


