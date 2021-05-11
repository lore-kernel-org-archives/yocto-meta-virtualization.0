Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.50])
 by mx.groups.io with SMTP id smtpd.web10.2678.1620765217631068797
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 May 2021 13:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QjzJTbHK;
 spf=pass (domain: windriver.com, ip: 40.107.93.50, mailfrom: daniel.dragomir@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X82pFV/bgTEO+B/8IuWQY9DDJz5F0j4OmllsdMbGk5Jw47brUFvPkmffU1hk97+n2DzmSIEVbzj9IYKN18CP6pflsPtH9wd2WuMc6fyP8E0kM34gFA+zltU5tR7pJGwW5aHvqAdTcOwRQ7Oy3RILez4qFobzHt6TnTpuzPy5k5Unc9W+ek2dQv+D0FBwGl/KYgDY2zQ3ZrrL+csShHeD4NF2QySAGJsBDlhAKgziaKs7eKaUwJSOPiKUKW21X6gBmM1zMdkiDoh4NgAAiasM/0eVbOsW8PdeQzi2/r+tp03Hdnd+WdCLfXMszMXXMC2dZKf9HF/ZFJE4KkuiX9SWhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOM0GC/Ldhtxcc9Os6587sT3p9/q14955zdP3TT9z0M=;
 b=ET5YuKAXf9n2eyQTAtLKLJeZXv/rWaNQbHLTtXlwyoOWz8jfg0ZKcnZK/2wEpD66vQj9URDSuiC7nv4vM6e9LuM5K5RGuIZ7AGq6slazqQUbUkJ411kCh92pevX7Hq6ROtAHeRZjCtzHAfWRHaAc9HQmogruPsph7iLLsaA2MtTu9Z9g8568nnSSkGZdhluVbgtICuojDiMwkplX5jRSJ0FiDTDgLYAnmzNvnno5legztMvCkxOvuh2anlzrnss2u+F6QTnuRHFNgfbSL+nI1r1N8wvfrwoR/1qVVjg0ztQ4qw58/TW60orjzzOVrwJTtYZGx62fzv95r+4irhRllQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOM0GC/Ldhtxcc9Os6587sT3p9/q14955zdP3TT9z0M=;
 b=QjzJTbHK6f1vzjnsVYT63Pth2MPVrlkTCWRlUmP14VtdOd+CrnKTIDXvWlXuCdPeWRqMDiuxPL0HXSJ9YkRVdGq0jQkGvBhNYFtOqPfraZS337BKsxXgIzc7TMpTbEIYGvfEsvfTg6y1Fuf1kvbJ2hhx6UA0GoT3FNqXn5m1cVo=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3077.namprd11.prod.outlook.com (2603:10b6:a03:90::14)
 by BY5PR11MB4338.namprd11.prod.outlook.com (2603:10b6:a03:1c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Tue, 11 May
 2021 20:33:35 +0000
Received: from BYAPR11MB3077.namprd11.prod.outlook.com
 ([fe80::197e:87f8:e2b4:989f]) by BYAPR11MB3077.namprd11.prod.outlook.com
 ([fe80::197e:87f8:e2b4:989f%6]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 20:33:35 +0000
From: "Daniel Dragomir" <Daniel.Dragomir@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization master..thud][PATCH] go-systemd: Fix branch name (main instead master)
Date: Tue, 11 May 2021 23:33:17 +0300
Message-Id: <20210511203317.53030-1-Daniel.Dragomir@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR0802CA0019.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::29) To BYAPR11MB3077.namprd11.prod.outlook.com
 (2603:10b6:a03:90::14)
Return-Path: Daniel.Dragomir@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-ps-s1.wrs.com (46.97.150.20) by VI1PR0802CA0019.eurprd08.prod.outlook.com (2603:10a6:800:aa::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 20:33:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 695cadcf-f626-4257-9c09-08d914bc0cbb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4338:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB433820C7C827FBFC235AFE50F7539@BY5PR11MB4338.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W2laTaj7VEpwSbQSYwgRx0D9MZfiYGW5agTyeNBwjC3d+04pdBpiS/ujSGsinzyOoui5LMNeRGjsPWRgkYneompC5Go4kvuS3Xa1MxEjWkffmBJZ6t+Rva6j/cill7850pw6UP5R/LTn0hSH4SxotdIDxoxImuH07h8M0aeLNHGxGFjTg1fdFIeK3DsSViHCGA1t3eW0wfskz3ZJUD42bjj/I/+G6kmz1W13bv06f6OvJJWkCIjh4t8c8RBoaDwGwKg5Bm2NRK/+VuF7Zv8jbvWSMbUzVj3s9sKvKE+k0E3e0gFVbhwzxSsINT/xM2jtVBUSJhyxhQqH1wtQby2WX3M/CKDAAimJCI8uRP3qzC89utOe3reGFxWFPL9vdMpOyWZjZX+QwwE6avIQm13x6L4DRo8d71gDf8Rk2T2iN5ar/tXgIFCRLGqpRwqOIyh6gCkRAW7T3NvZCat+ZsBmwZYqfvPrx+vrYVEAUSV00isMY6gtJFUXNQBICOyUVQkTubLmQbTFp45ABgBzdQz05JY2AWilq1c99WOC6Wf1BSjWHsDmer6sJfBBy3MkazZfEWW8BcInFhASS2KkuyiygdyEMmXyOad7laZKsWhOzibdPf4Fi+Ur2qLP88GUd4refJnC40BYeHp29yLZs00B2fX7C12z3MqSvGqgMcRN1GKwmGBJ20c1+oahSRnaNkfv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(39850400004)(136003)(186003)(16526019)(478600001)(4744005)(5660300002)(26005)(6512007)(38350700002)(38100700002)(8676002)(6486002)(316002)(6916009)(66476007)(83380400001)(66556008)(6506007)(66946007)(36756003)(52116002)(2616005)(1076003)(956004)(8936002)(2906002)(86362001)(6666004)(101420200003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?YTWsfbIoeSWT3ADBrI+FE1oO1HLpo7tUFvw0y+GkjgOrWklfo0xMzShutbWM?=
 =?us-ascii?Q?INLR7OwSAWTb15l8nZXXK3HM//+cdghGxMjgTOQbbh/CuZ2/coqzPZU3Koo1?=
 =?us-ascii?Q?7ahNrZpzZAjeJCcBAIgw99lqmQ4D3+/l7zfyhXXamUI46nfACLkiW8166e5u?=
 =?us-ascii?Q?3fco8AId0wENL4XPObgpdkXJ63NEzrtTHoth6TJLTtxZ9OzYJmR6KYgRrOIE?=
 =?us-ascii?Q?z0qq4r3TUpMFJTedUcJiFMETDnZRGL4JYFTWgYy9LHGTSspoOvN9/NFXDS3/?=
 =?us-ascii?Q?3UNsJLDqwcUGju8E2RQonU504d3AS4q/WPtJ5EkEebDplGSfbxoZrfkwvJRK?=
 =?us-ascii?Q?f+waXRfWrNp+4PD1xAefnI7YhNI09qw71ZZEgevmwTjtu75Q6h5q6g6XxPf8?=
 =?us-ascii?Q?sKbgryAbKnaagmtlCAXGA2zJNP5cKzLpAtY4wvQdUWjBzK4cmUC8t9Akkjq+?=
 =?us-ascii?Q?uDae0MHPFY5tZpz0f45MTZI4JIsewhjkBYyz19C7mHAxF4ZjqIFRiiMxQqY7?=
 =?us-ascii?Q?1T1sMKfojm/SJbJdXLfpJh3Lr9fm6Aj+Th8+/bN6c8DImONnAcADUxWXzAos?=
 =?us-ascii?Q?RuGF2uFzUJoGfp4sA9PwSDKblDp1X7Zjmo07AgTpJHq4YJNuKVvkUhXSqyfC?=
 =?us-ascii?Q?QS7HiYB/X4YoeB3IbXhrMNPUp3Cw0FLUvSiuckTwyYkTlo9LVGBxN/41B4Rf?=
 =?us-ascii?Q?Ts/ahIYulPsymfq/pM7z2WavMuT6z3zfq97HfwdNSo+5Zs2oVsDgLAgPQ3er?=
 =?us-ascii?Q?IVywV8DDZQhNf2JZXEQV8Uj+73g93wVHjmZ9/mHvifRX/zNw1lJQ2RRaDBh6?=
 =?us-ascii?Q?4LEcnf7pFwq+27djk2tZhweGN/UPS6M7yZVLTvAX8bAV6jUybLaC1ODbA1JB?=
 =?us-ascii?Q?ctGYGdo7syHKZrVZUJXCKLctvVVXkEOFECptP2fG3fqWjH30jbo9hfjEEJP7?=
 =?us-ascii?Q?ZUNPNDBYl9vUSPF1nELnjk12vGWbmZOKmGchYh2K3lEuIQIF8xG61ebrXl9R?=
 =?us-ascii?Q?sxXBNMQIiWCzv/BJZKRJakVqAx4c6IDWrSIWXLCRi9p9bwnQAkRIpW4Cj+4S?=
 =?us-ascii?Q?rnTP0VuZSGN91BDzaWtRqKX10+GXl73hvmWJ78dgvEdrGq/aM+QbnJGBZQ/z?=
 =?us-ascii?Q?4YWUWp9wh035yad9dYxxTbax7OO911ZAk/fmThA30ZZUHgDp3e/33kN5Pc3z?=
 =?us-ascii?Q?pmXmIzn0ZdsDI4NmjaIyBqvCTc919r1/rLCFsnvxoaz8vnp6FGty9QuAXt0m?=
 =?us-ascii?Q?0SgYFWOFBW+nEt6FlfPVtsH3fZV4gsh84DZ2d7pTlJLwX6H1asvC4XpdaLE3?=
 =?us-ascii?Q?scoRR7rTaHJia9arlbV5x5TP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695cadcf-f626-4257-9c09-08d914bc0cbb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 20:33:35.3362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAcr9F8+3NBGshzUgEVxacieHGrf+Ep2uJ2+6veGH73Dzf52CzrkJJfzHSXzSu0QQHNNfEiZY7oUs7iBgreSu5jx00sBzTIHVJcY2phtsbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4338
Content-Type: text/plain

Upstream has renamed the master branch to main.

ERROR: go-systemd-4+gitAUTOINC+b4a58d9518-r0 do_fetch:
Fetcher failure: Unable to find revision b4a58d95188dd092ae20072bac14cece0e67c388
   in branch master even from upstream

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 recipes-devtools/go/go-systemd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
index 0f89c0f..c21a0f9 100644
--- a/recipes-devtools/go/go-systemd_git.bb
+++ b/recipes-devtools/go/go-systemd_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
 SRCNAME = "systemd"
 
 PKG_NAME = "github.com/coreos/go-${SRCNAME}"
-SRC_URI = "git://${PKG_NAME}.git"
+SRC_URI = "git://${PKG_NAME}.git;branch=main"
 
 SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
 PV = "4+git${SRCPV}"
-- 
2.17.1

