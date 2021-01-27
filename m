Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.70])
 by mx.groups.io with SMTP id smtpd.web08.4434.1611727872632449453
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Jan 2021 22:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IIDcB6vV;
 spf=pass (domain: windriver.com, ip: 40.107.223.70, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrenWNs3P+hDKSpOa4nsDYOyo4tzm0PtJkQ3bnoyRndLzaBT+vzjq3wN13WkkEywOygyMzFSgTL6VIvZA1j/JYiSKwRi3KpfXWrkglPImeRbkPFXNLdihD39nXuAK/7QkT7vzwm5DEMDrSBUZy7VWMyM6Vf+5T4LczBdBFihZD3fqswcNOG1zZSkLtOivq6qr3/QgI1W2Myh/tSgUCHu273ZZov4XCQ51XT3Fk6Fz9IElDeKF8qXqdUckTir5dSUhGu3FrDXSFLaRBDtP4gDoO+CE9Wu/yEdKuje3H2BiJqJ1hK7lRhBUBeQ+y2rVJLO9cuVvZ/eJ655jTtwYhNijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6921iuaNX7vJxiEbRGFWQ5qwSExWXWgOuYQMimqc4Y=;
 b=Wguv58RFU07q+X6Dpa/JIDnp6su+Qo4I6zehjbwvqAfoKIU4m6GpVdFqFhVA1Bmzc33Pp/sR9ZJkFsA7r8MMwKIDG7AOOzeFgV09iKxj6uxt8cNwqiE1TRzYQPgvB3a4dEd/JJWNQJW1ZuOysAcmJgYBFIuliD5cUrsRqldMESSzGKuOWE2oFboxUPJr9kjrKLSNP+1I+rjRDaNJswaXalZwVlj5spvN5m0QaWpFp/XG6qVBttOs3uxyRVAu7V8n01INF3ptEuAL6GkCs728bK6NxEDMLd5ZxP8pVxLQtbuP2ACytTWhFBVX2HQjW9+beJbI+clvtvvwAdHVpGcCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6921iuaNX7vJxiEbRGFWQ5qwSExWXWgOuYQMimqc4Y=;
 b=IIDcB6vV8kC6N0XDsQdaPSOUJE/0VK1nuWwRvPYrQHDo9Qgu9CkJuxcspa8KtJ2Jf4zl6/mF+S2jqr5seIRF3rInmzulRdHHQasnuwjByDsCABSWGUf2uw1Bt1dURua1WR7/NkqwUil+KTLOaTrSf59sY7gGFb8i3RFexaI/4/0=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2606.namprd11.prod.outlook.com (2603:10b6:805:55::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Wed, 27 Jan
 2021 06:11:10 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29%7]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 06:11:10 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [V2][PATCH] celt051: update SRC_URI
Date: Wed, 27 Jan 2021 14:10:54 +0800
Message-Id: <20210127061054.15256-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <165E00DC7E478DDF.12137@lists.yoctoproject.org>
References: <165E00DC7E478DDF.12137@lists.yoctoproject.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::33) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Wed, 27 Jan 2021 06:11:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7ca2cdf-28a4-45ed-eea4-08d8c28a5764
X-MS-TrafficTypeDiagnostic: SN6PR11MB2606:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB26068D1AF2C933CEB852A62382BB9@SN6PR11MB2606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vaVgC3VZhSy8zbmdUdQeLFiAknztQxVIPVwT8ghrasWr7mwNiILxXzrTykZcjIQz2a0Jzn3Z7fv8q/hyTESiuPKJ56DH9s9e+NVHXq80njGGUuCNOcfHaibTbLeuIUdAEer/ARWxMlFg7P5PoUkkV+cdOWhOVPrzR8ae9ro2gC74KqKyzyEI5E7iXkpCnan72B48V56ZhCJ248e1/Eg9bXQsZ+BkmwBTdz+2aVy41BL7hhdOpnsd8s/uOLpw1/1yp2dj4YZZF/Phi+Hq8nXilvbrbouY1o3CVVrjr8FL89Yk/x32JQb19SRuJ+6+UnNgO0MrGah4hKXe7PKXHCu5TzmUSdThTMvKVEgcJcpG/aHmVCeOvioIa5CUCMXVdclCA2lVBbXOezagYx2k9LmyPTR0nm682j+kiLd1akx8EBQQpAoh3VeCKMzdSoczFCAXiOzX0UJoWOoazF+1TR5W+JoW6EFEJh6cGl2CuX5LD+Hsx9T456OgpEybQ3wnNDy2N0nyuaTR1VpFeMi1pzy+iA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(956004)(86362001)(66946007)(8936002)(2906002)(1076003)(6486002)(316002)(6512007)(6916009)(26005)(8676002)(36756003)(66556008)(2616005)(16526019)(5660300002)(66476007)(478600001)(6506007)(186003)(52116002)(44832011)(4744005)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?aFkqG3N0GdREHurYgbPOMT+l8mG2KirvPwCbOaSAplpIb7Kpndu340t7/e27?=
 =?us-ascii?Q?Uh2/rAf8LglQrLlLC1ehzE5eH08lBmWenpU5rOF7mfDrD8+BwYEULllW3vst?=
 =?us-ascii?Q?wjpJsGSOwMHI5SleTALz9k/M0bufNtSMMmsgxlhUxfzrIr/Z8yx6xr95/S8M?=
 =?us-ascii?Q?RK0hF2UVHwOpn6xX/QjCdQQgarmDInOjxtJbJvGuq6lWpdKe5uY3J05dXQme?=
 =?us-ascii?Q?KmgPUuJ15iFUveg9gp1Q5eC4aOmjnn9mQDsINCOE2qvN0heOeENYND+S+Z6r?=
 =?us-ascii?Q?d6oDGhUpAtz53Z0e/Y/QjkXWK/Y1XisfFK7mSJtr+a+/IEgd0suNEKzcYmCN?=
 =?us-ascii?Q?HnTgeaGm0kc3JR6sRsqvjRV9UzZ/AbNkxhbnl65ikeSjK05ks5UP6MXpzSAL?=
 =?us-ascii?Q?3JhEGLZLyiW8p3F0Ic1TTYhsoYC1QpVHGUhlGD/eZWMcYkVGaKXVfPINyvwz?=
 =?us-ascii?Q?TN1+feL199ZY+g/0YjZl0snargRf+/P/hBYLq9cg178Ld0PlaWzzcvWFYTYo?=
 =?us-ascii?Q?WLiVjksL+mYgsebhkdqpjx+JT6JCkwo7hIeQ67ZOa+sxuh1h+25tI8q2VK0W?=
 =?us-ascii?Q?3yGgHc/99gHBvYp7j60uS+GXRVDfJp8b67Vi3axWj4aPz/3rX7XGlAZjnEFO?=
 =?us-ascii?Q?upvB5dg3SZLLhCuFl8RtM+m/LHiK3jia/t7zhVCpdubscOZxWEWFSyZxpOAU?=
 =?us-ascii?Q?sfmchrIohzBYZkugg2VVUkmcCzPmR+OzgW1wavc9ZbAahcoRSBlxmdQOyOCR?=
 =?us-ascii?Q?7vRzO959yIVGvcl90+tCihJfrtm2BxoRf1YaAZxRSDLhpdcGFTrfBo4INKxB?=
 =?us-ascii?Q?qb4uQrSiYudwLw9HqgEeSJ00DO8eIlvhA0KWtMj0Y+XcsW9ZU+PYubOfzGuj?=
 =?us-ascii?Q?ERUxC1RXvdb9ZPg7FleQtvZ7XEE+4bKc84TYrrMF3tu/lp+jNFtlFU8ncAUk?=
 =?us-ascii?Q?vg02E4pgA+jSZKcwinqyuyafsQECmPvGXwJRqmmctZE+baNWcsCE+Sbwepgm?=
 =?us-ascii?Q?AoUExng85FkII40Qh3ot5Tyu4gi75jh+zNjK8NdPWVN7T9qL4tgyVgwzUZ0k?=
 =?us-ascii?Q?KQHFr8Jy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ca2cdf-28a4-45ed-eea4-08d8c28a5764
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 06:11:10.4670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTjPDKiZKAZPzklhDiwakbo27nxZDwXzqyOV+kjbMzqlWcSmYMMFl8WjRxLZpph4/wrpmWjbGm64zHDypFazRLfUF7N3mlyBMraIjIqTewM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2606
Content-Type: text/plain

Gitlab is old repo, which is no longer used for active development. But
at least we can access, the new repo has down for several monthes.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 recipes-support/celt051/celt051_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-support/celt051/celt051_git.bb b/recipes-support/celt051/celt051_git.bb
index ee388214..6eab5669 100644
--- a/recipes-support/celt051/celt051_git.bb
+++ b/recipes-support/celt051/celt051_git.bb
@@ -17,7 +17,7 @@ PR = "r0"
 
 SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
 
-SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https"
+SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

