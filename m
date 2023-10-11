Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1E9CD6E4D
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 09:03:30 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.58])
 by mx.groups.io with SMTP id smtpd.web10.12350.1697015008559976597
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Oct 2023 02:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=eVh9mTtg;
 spf=pass (domain: navimatix.de, ip: 40.107.7.58, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/e00CmpZer5WlHoh38BwqUuaUtJFzaew3AViHlFhnttUQqy/tWahyeytBk7hhsdwpYH1nVJipNSRdVaa16xqhi4k7tlXhOPGgKo+6LsZ6H7/lTlWqC7a2RASQs4xd+Aesn0yZ2KgWnWXp/p8DmljQKptJna08A+7JiXapmtA7u2EXIdRqFTt4jEL1IVEU2P46vgp/kiyOhWONLBwyeG+KShbWudQQ9v/XvRLNi9mRYxynB6hFMtRPwlqyOmSic3nZELYUsZKhyTo6tZanIzWW7qM8zIRvz0pMgW/HUy+R4XqRVw0WbHY+hoFyVLcl4mTu4OvEO6rV8/5fmiQ470RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxrmYSOalwHljR1HC7lt+rJjMJ0v2b110m1+/+yqEDc=;
 b=JkTP2SZ8r2kXt/bkFFaWeWHF9z6DYpX4TmFM8h0+LvMyjvOm4ura2kxruC+6boa26CC9vtGD6PW1dE0HCKzgbJA+tOWUzEq5pFD3yyC2qU96J7YW7rbPduLQVVT8nGrsNN5nxyv67ZLtwWbirIW4E4MNHIF8lUekw6RhKNHqw9+jYpRt/dSlcNU0wdztkUNOJz0azYV47QhKdL99Os/3wKYUAF2q56UBggk9osRu8YpJicmQgx0FRAvl5XgrLFkSilMfdS8b0wT+dcyHNRPE6Kg3lOpXCuWz8mYNHJOhsmODZrzDCQgmiRCe9tlt44tJ8MT/tvDIE51xmY51vtDmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxrmYSOalwHljR1HC7lt+rJjMJ0v2b110m1+/+yqEDc=;
 b=eVh9mTtg5bWqo70FLvFjj4CfB8N/u7u0v3d4cJI2QShP+WAp61FiryzCnzWDG8ND7qCDtXqr0H9kdk1xlTBfbnoyW+Ve6OsxrkEeTMfyxH8F9X44xMAEMYnZQt0pjraNFStryP51+4XrDUtWJ3pbQUkB0i5m9eJ50HbRtsAkRMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by DB8PR01MB6407.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.17; Wed, 11 Oct
 2023 09:03:25 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 09:03:25 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: meta-virtualization@lists.yoctoproject.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-virtualization][PATCH] packagegroup-container: require ipv6 for podman
Date: Wed, 11 Oct 2023 11:03:08 +0200
Message-ID: <0ea13e6963ac5988167735946d6db74673a968bb.1697014988.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0485.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::17) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|DB8PR01MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d47124-3371-4543-4a20-08dbca38ed1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iErBqbO/PsbYk5Uao3Ata8pZO9LyFq02lfocu8Ub508TttwJYWysW1ASxOW8j3gHeZz8l1neAmxCX870MzyDJmTTgeHui9sKMZxaOcjOA7Bq0mZ7Oxik9iwJXRDIawCMsZIPxuNxhc0eVtL8Y/UeJWlLNnsWkDsXetW2iYcFH8wnqW22KeAcwlTL+ZGGg8AXVead9hLxnuemUfWHp7YOnR8Ronpsr9E4HcV0GqHmC4xZodq3bOsKQ4ToNcemqokE6ov+qqD4Gz7xhgJzZQ2uM3etXCjichV1GZnF7UcKv3q1wtFTHcs84+IevhiWncZKnTitDI0pOCzF5HHigBZbwjQTPTJYpDM5gJk15S3lT+7cjeHJuIY4eWGr4rG1j3FtKzgrrh5kbWqUj44tbk8j0LP6ywjOJE24LERoKsYpCgxTsT9Yom1PKhdpSYo4WggcI2RMtNWaXqwjzsLskMs//rjybifLyIXADumX/4xsGT0dr447f5QqXN3Nl+4ehcQ74EJFva4/7z9lKuatz9ZMMv8QfJr/91phmcUlvDblchBl7kEaujMixNj6NZHPhe2kFkU6s/bbwFnW3OZ0MVDqEtoT8HgDJs+fSVkX9WxkBMTjEkVgwa2FPIUWJVG5uR2K
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39840400004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(26005)(6916009)(66946007)(66556008)(66476007)(107886003)(316002)(83380400001)(2616005)(5660300002)(478600001)(86362001)(6506007)(52116002)(6666004)(8936002)(8676002)(4326008)(66574015)(6486002)(4744005)(2906002)(38350700002)(38100700002)(6512007)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1+JKVCexRwDq4L1ApWjmgsN57lSpKbjHM59SdAFbRizQ2kDTvluN+Bo41Y69?=
 =?us-ascii?Q?9YnqpLZ0yZiAqfJBNUyxwwaCXnpR8RXCSTs5r1QVNtzRZ633vFvGeGtwxKiw?=
 =?us-ascii?Q?jj4t85R1sEUwmV08yplRDBnliOPWPQkgFJhzUl95kfxxGQYjukcCQpGmj+ai?=
 =?us-ascii?Q?aDSFfI2NREYnZvVjQT66ZmhAk6dsW4Ls1gX2HSIDPyGu9mmDRYJ/DV7IUkuU?=
 =?us-ascii?Q?6u04c6Buf3L6+qj0hnHFafFdmAg6AUOTW+Vs2dbg3AiXsG27vSxgunYv8jD2?=
 =?us-ascii?Q?8ukCCrH4mGuiaOQ3WQ9Pray1E5ecm1Wj8shllfnA0r2eOUvybAinTHXWRnCV?=
 =?us-ascii?Q?OnU/tKkaSggVz/uhJ2IPVs8lq+i52EQd86PLDBzFSbPPJS5zJ6f1zFq9nluc?=
 =?us-ascii?Q?/KlpLyZuUNr1w5baYhzgBnODPoQ9aEBf/wq62KwblNO6oNHxm6K4N1gWTekl?=
 =?us-ascii?Q?UvJlqhEKyn5UyUMD2f4SLI4mJfL+ql9w/KxmQaywQC5q7sMMorJ3NldqMjjE?=
 =?us-ascii?Q?XQdSkxhrqX4fjGKExUWvcFY+OG7aaowpz+v8nvXR9RkZ9pcwtW1Pq0yqmpDX?=
 =?us-ascii?Q?ahr46PGUmE0C0eeps8W5PQPYmpjZfn1B2VGN+/i25XkpVbvCkoUcR8zlCBo1?=
 =?us-ascii?Q?SD13z85p6SMMFa1oKx91K1yUTwxD3G36tu3E0cIMyAI0UTde3ZI+FWzqovlO?=
 =?us-ascii?Q?gIoexM1P4/HIREemjOLmAcevdz5XN3mv29WGLl/wtFIWUjYul4UrxifGfmG1?=
 =?us-ascii?Q?cRXs+ebqTg9n3LBCxo4SucfyO/qc2cC+6ojR/l+fbGdHPMAK7q/MXmxxpgQ1?=
 =?us-ascii?Q?4p0apWPX+BtonjcEZAqIFDC7o0Nl+toN4DTO6v7jmFoL6MOd2yiWszF5aJH8?=
 =?us-ascii?Q?aWlzSxKQkDVx/gDcP9uHXAU49dDocrLAv6D6SG1nj/VdRBkTJYW+/Fxfyat5?=
 =?us-ascii?Q?TXqvABIH7KlPkl64U4SvEHVdjQrH1JYNgTdceFw+sYvWy3Kn3XlwYPUHDaeO?=
 =?us-ascii?Q?/TMK+8lbhj6xDvX2eN4JeMU4iY+UH/PpUQ1dJS90HuEXInMlOlTIZMRZVhJf?=
 =?us-ascii?Q?ruDVtDcoekYbewiDl+l5F8M2QSdxFTbI9mR3lJNWc5ZqS/DiI3+Z7eNjB7SC?=
 =?us-ascii?Q?pwqubr86Kp+Gy+8R+UzC+flJkCxcUWNx3rSPGcr5ypkCCwAghRtimc0OghIe?=
 =?us-ascii?Q?CY+qcoTYv03E9C643vKctNTKnNORffmdq0nBQwYso6dbGuZT+QoPEKh/McMe?=
 =?us-ascii?Q?A4Cs9fwuo2k6JG09aaUecZFAKewKPeLGQ0ozrqNXznEK1IdtPaCEguDGjAI7?=
 =?us-ascii?Q?RQsW7Sbg9OgxdWtsVsVJaLaeNKe6l/Wn5DrYkth47c7bugAoWuFXH6n03cna?=
 =?us-ascii?Q?nz4ojv7skFEfnicSHuRGho/U+zbXmHgM/blBwBRCo4d6BpR9nnAfoDPo07Li?=
 =?us-ascii?Q?iwaYGsBypda6g5uocrzN0kZdGsQQBWk+Ohb2lK1c66qN1sE49TSen5x+5G24?=
 =?us-ascii?Q?p1/vvAiBRTg48T0dfHH9GFwuqXlul3kRMxTv9a8d258F1S38Q+S5xAgZLTH+?=
 =?us-ascii?Q?KkkmxYPUN4RE1GeSxwaLCFFh9gkZvn1U+NmBUA+FKo8qLZnrTEb5/VneNB1/?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d47124-3371-4543-4a20-08dbca38ed1c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 09:03:24.9754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7DBiPcHlxq5M4e3WeLv8tcynhzu6usRueJ+eELWR312fZPu+GX1JSCiahxilmGcoXwy+5mNu12GUpViAaWAcTXQSxF0vNv5gP2o7cO7TUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6407
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Oct 2023 09:03:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8347

The recipe *podman* requires *ipv6* in *DISTRO_FEATURES*, which causes the
build of the whole recipe fail, even if packagegroup-podman is not used.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes=
-core/packagegroups/packagegroup-container.bb
index 8d418e9..8309a08 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -9,7 +9,7 @@ PACKAGES =3D "\
     packagegroup-lxc \
     packagegroup-docker \
     packagegroup-oci \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp ipv6', \
                          'packagegroup-podman', '', d)} \
     packagegroup-containerd \
     "
--=20
2.34.1


