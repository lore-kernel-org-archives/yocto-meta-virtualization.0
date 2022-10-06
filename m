Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17879C433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 08:10:37 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.126])
 by mx.groups.io with SMTP id smtpd.web12.3360.1665043833522902386
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Oct 2022 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=L9EuxtO6;
 spf=pass (domain: sancloud.com, ip: 40.107.10.126,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbvSl7XI6DX3Ss5qOguMhob2CF0Fw2+dcmHGN2yuFMSsLlKVDBg5BEkIz2vkQTk49J0xjh5xsBKRqXivIk+12mkMNixrRy1TS2l0g56r0FabhaCLBgwuutli/2PLDuRwxNgF2y8s1jT9slJkgutHh1TZXeZEGyzj2nethOeEnzNylizbgDWwM837izLmN6FDLytGMZTM/ISDlRysQc47qiih4EKELDIxpEauylXvAVPMUXCaYdI0H4u6lvPSlo+ys5J50K1HCNkHa5oSm5qye4bqJWlJgMVCKZTkV8gEckBX8FBtboPGaXwtpujhktsBfSRmxs7JeHNv94Aqwt5FAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NZH7wQO+C7zN7VGfvMhl4QXCU2SzHmFeD3l421DW6w=;
 b=XtUFnDWHj+Mcbk7HodVaosh57915icCr+3LSKQMXqgWj8Q+p0dZ0SUqTWZ6/6ekNT+Miuza4Yk1ILz8+Gp1nNkHr6G/m+nrgvfUCk31CaI/aXhVDxjCT77n3IMAMZL+O1dl6N39dqTmONZYpGg8AYPVZX41NuzBaFZ2Yii9unlyvxBpqFAsZGuEuCKqU3XRV1ubm/s4i0QI+U/h+Q6/LeWe8AjPZCrg4xVJIIEbuFVH92CfnVDIyPnZyVrqxkLuB8cSq9M+mMsAEwZLrkB4fdxCSmfe8ObZUjbVMJT8GZVmO+TNpEsLlpq3rkzJDww6uWf7Bi866S1LvWrQBHM/LDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NZH7wQO+C7zN7VGfvMhl4QXCU2SzHmFeD3l421DW6w=;
 b=L9EuxtO6Yqvvo3bGwuJ8SGgixjNlzJDDX5jsgDTGReYk7XndUzPN/I96CbRwZ0h2FHKBm2wqcufitVbqseYA3d1DB+gwdmd6gKoS7tYmQZXiLnFxebu91aG7Z55xTWsfZ6HjSbVrl9aNZ5dO3Vp+LWIIYUErinvGoPjFhWQrDKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by LOYP123MB3389.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:11e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 08:10:30 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08%6]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 08:10:30 +0000
From: Paul Barker <paul.barker@sancloud.com>
To: meta-virtualization@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Paul Barker <paul.barker@sancloud.com>
Subject: [meta-virtualization][PATCH] openvswitch: Fix INSTALL_MOD_PATH
Date: Thu,  6 Oct 2022 09:10:20 +0100
Message-ID: <20221006081020.2269569-1-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::23) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB2241:EE_|LOYP123MB3389:EE_
X-MS-Office365-Filtering-Correlation-Id: d961b3ca-6b98-49e4-38bf-08daa7723c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eIjZKPPBSeSovdv+AQ59XxAc17vBGNw0lR3i/C0ghHvGtr+15aDey4M0YagyV0rQD8dhJ1e8EE1nkrKdm+0PQ3B9cfEvF+4w49ur/SddgV9N7ooFc29Bh8JL497JlCPxm6qFWw7BxR/c48aP/ls6oAJr1M/rNSLNfVbbGPvTsrMrxwvk36YZNfrnI4nAXZ6oIAwu4VeOLbTFbtAfMKNLhJpJutv7AzCIQzMpZ0+KZRpKQmPnh+qgASb2O0vh/LM8/AmmdYcFo6k1y4042T1z4U+1IOKqi1JCKzT6ExvGGaRy/prnqKDE6/cHWhH0gSsrsiFdXk4JCSzi3Bhs8cyvDoXSOnFj+XiDpW6V/PP7lyblCUPq+y3mchtzta2y4bE7MLQKoxw7MEGi03qyxrGu0FEF2FKohnW1dP9eHMAhTzopAjfbyQAMZF6us91dhhdUj+QmwzWtundJavDqNRccFGdXZ+6brlgpBX+KAeYfJ5X/JtrsbZygwsFR1mZKer0RRpaIIsqKYfu2kJGnStgmmiOE0WJXzSpx0uJ7rV+XLtYHNGZKjS/WFVIAUQc9qlbqCUf1awJrY/m/QpBfFsYTil9kRG6xkuKJ44c9rVkj1W8GlRtbsYEPQMAgTT/+Q2exjJG682lnNS9qc6UYxH0NTh8eg+s8CWgTIyEEostbCAMt9hWOUz8U8LgpUaXCzdXlh+5gsYfeiO5r7MH0LP7Wk90/BQejrONYVy4jvLvYhj4Px9OKCP1YDEJ6Qw9UeXIQ0jRxG/vmU5C9pJW2vwp5oQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(39830400003)(346002)(376002)(396003)(136003)(451199015)(38100700002)(38350700002)(5660300002)(86362001)(8936002)(2906002)(44832011)(66946007)(66556008)(66476007)(8676002)(41300700001)(4326008)(26005)(6512007)(52116002)(2616005)(186003)(1076003)(478600001)(6506007)(107886003)(316002)(6666004)(6486002)(83380400001)(6916009)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rN+trnlCnb350oSY2FA2n7p7la8r3HqQtjZ6tj08FChPDCkTb6WO0IYX1in5?=
 =?us-ascii?Q?HZBAxhW4yrkZzF0r4OEq8qnrf4s83SkzeBr52pwMbQc3Au7xB6pkCvsB1Utc?=
 =?us-ascii?Q?OGbA8C+Lv6pDa6J6P5/KQIEFqbRaD3FMO2oaWsTolg3IvoMeF3kdLrlXe9Sn?=
 =?us-ascii?Q?s3vYyBFhRsiyhw0Odeo8o0eKMPcNkRrLBQK3rfHAtc2tieXcP810sBlzrL+7?=
 =?us-ascii?Q?z7Z+epoK0pFsrmoqzfvJnYtn7+7RZxrBfZ22qSOOKilD08msuCDeiZIZrsJ0?=
 =?us-ascii?Q?geCOFbtM/fMW2MgpXRG9IiCUtSd9M+a6ic50qOLCtKZqbPpDCu4yqWX2iaca?=
 =?us-ascii?Q?thT9w87F56dOy0gI9GzNGI9a3PDn0Ok4/ERom0iz/Vt1FWySgPgO1mgeFklf?=
 =?us-ascii?Q?WuI58zE6awIbQiOqE0kJPb2L+kjMH3+/nS+9FABBYfESRR8xAVbj3Zz89d72?=
 =?us-ascii?Q?aIUWPl4HUsZERtjo4OvfiGNN7JhfuIk3Fa2p2dDHiO/j2Yj0FipiauZ+mBK+?=
 =?us-ascii?Q?YJNrMTpR5fl3rIf00G1Z1fYkS3f6l3VjgHogvr9FwAB1adXy9hvSbgGG3b3l?=
 =?us-ascii?Q?CxkGLlEu6hHJ00X3bDdZSNcQ0O3z4PIrT4a46X3bJueb26MWp9sdJ1FgL2c0?=
 =?us-ascii?Q?ZWb4UNtHvBZG1sgeZxk1cOEhSf2Uj5ML5izFcHMaG047UfsTQG4OzTpMnNwv?=
 =?us-ascii?Q?J3fFHdo91aeVrzNxz6cLe/t1jONENvKmJ5sin/0yUySkY9wJfNm1ndeBN5cb?=
 =?us-ascii?Q?P1iHTVtm8UjtGAT14H6Yjgvkl37E+mdtXWTKUnI5WAeY6pbM+bf2rP0toTMd?=
 =?us-ascii?Q?sqJanES4+Nd2zeYT6Pn9eEE4CwFY297RfEAJnJP9cYNQvClNEb1X42FADm1l?=
 =?us-ascii?Q?JNyCscRdLdJjEwnAXv1Ixv3TYeg112XZVuL42RpLh7I0ZjG62//+C42N9P+U?=
 =?us-ascii?Q?mRL3inCFbS0JdOxy1ybRF3K7bKm3CKxs/NsfJgydVyHqWHS8eTVMTnsYYpGV?=
 =?us-ascii?Q?paDMo4fuXK15i8S8B0W88QNw6NbCT/ttTXdB8N+MYwm7zKedz5QsJpRGEZOv?=
 =?us-ascii?Q?pY2VIGJv4qa9zj6/G/mzBkUobJmR5OqfG0dtw+N5C7z4xe/K6qRDSFOEWNlh?=
 =?us-ascii?Q?3bXuXlG6/t6LL9pFG0kE4DDqnguipeYNSUAdGNf/9aH2olWvI7bydmsPshrJ?=
 =?us-ascii?Q?lh+b7JlqRRVGDZ6ozwqOSnSvR2uLVRHjxTHovaQbEB8LclUWfVmeH7OPmrA4?=
 =?us-ascii?Q?+8xhsTzp0XjhkHBj1Y74qHydrZAl/gZFFZJnEVZgT+MZsClTuwxNdAMsk8YQ?=
 =?us-ascii?Q?xLmz7J6JpIqUABsncpGZjUwUvhAMWm3ZH2Q/jccBkznjDKLiyU8KIUXVSx08?=
 =?us-ascii?Q?MoANgrtrbiGWLaityDegxd8Liu8FUja1Espp1ZnjpNGhY4OvZJ2qNzzDc3yI?=
 =?us-ascii?Q?68eVANr8c5uHHj6dC+eFuu2oUEdQXib9NxkssQfe5BajGIzFXcivZ14nx0PJ?=
 =?us-ascii?Q?L9HTkGbyOxKOgEDmz+/pDviM53bjWPcM/W/skunVAd8Hf4GmE2kRS2nLM5/L?=
 =?us-ascii?Q?gG2vAXvu5Lftwbrd/ITcTiN5qWRWomVlxNWXLbpcDBRToLPguTKmVsP52DiA?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d961b3ca-6b98-49e4-38bf-08daa7723c4e
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 08:10:30.7622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pLA2a0smOwQmA/7xNORIeRlFkp3RBk1FcNjgWdrxwkxY5+y3PqaX4VTU5ikR8NjkWxE28lwFI/WDt3KJnHQStm2zeje+SdNo4c1EMlgsqA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3389
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Oct 2022 08:10:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7646

If the usrmerge DISTRO_FEATURE is enabled, modules should be installed
under /usr/lib instead of /lib. We can handle this by using
${root_prefix} in INSTALL_MOD_PATH.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 recipes-networking/openvswitch/openvswitch.inc    | 2 +-
 recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-netwo=
rking/openvswitch/openvswitch.inc
index 251a7056347f..e6c9091ad364 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -132,7 +132,7 @@ do_install:append() {
 	install -d ${D}/usr/share/openvswitch/scripts/
 	install -m 755 ${S}/rhel/usr_share_openvswitch_scripts_ovs-systemd-reload=
 ${D}/usr/share/openvswitch/scripts/ovs-systemd-reload
=20
-	oe_runmake modules_install INSTALL_MOD_PATH=3D${D}
+	oe_runmake modules_install INSTALL_MOD_PATH=3D${D}${root_prefix}
 	install -d ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages
 	cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_BASEVERSION}/site=
-packages/
 }
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-ne=
tworking/openvswitch/openvswitch_git.bb
index 2e125e78fdf1..f5d85f3fb821 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -53,5 +53,5 @@ do_install_ptest() {
 }
=20
 do_install:append() {
-	oe_runmake modules_install INSTALL_MOD_PATH=3D${D}
+	oe_runmake modules_install INSTALL_MOD_PATH=3D${D}${root_prefix}
 }
--=20
2.25.1


