Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.40])
 by mx.groups.io with SMTP id smtpd.web09.1001.1607308530366032029
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 06 Dec 2020 18:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZlPv49XW;
 spf=pass (domain: windriver.com, ip: 40.107.94.40, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLlJExRUzH721eDh0gF3KaoQhqsF550pWAB3C80Km5qjLpEHmT/kY2vKdaMt4NbX8zEZipTFgcDRsn1VlCn6bs8d2VNci6udTJl26Yz4coOh7MaOHF4p+PqHdqYFISZYnIGv+nxmzppG8eQkjqV2DOP2aFRBmeYwCJPFKiCRFIuhtibP6tqlQs8gw/h/V3AF5As4PB3b1BHNtKl07iKa+a55/06FF93e9ADNJhCIM3pTT3oAtAQo181IBVCk5paKnQYnIu/yc8qmUsxorm+w9pLCZSEn6j019HZV59nNmbqLg/99T3MQdu3RyTsT6BxOZ/7CDFSK1NbdMM7KwCCPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa64WUYRJnwHjNIRcCzlQL+GP4XN+L/7pwcVOlH1Cjg=;
 b=MqOUfaSJQCU4Y5cNMqsw42+6SjKRlWcMtdNvFZKTeAbkD04Rpgw8zO44DfBRAC3l5TlwylmS9yL+lCGzvjTF4AYgc0ZyOByEEDSttm5uw/uWtDXCiiSffLEf4cheATHI5Tu1yO/4mgozzujIF6DmcWoNahJExNPe72cF+T4QIzLm3mn05Y1nieyOoicOiErPlihtAfL9aPdxfDrNoCVijHiezbLRmLQ8HCR0Ob6btfyQaBvTx2PNrlDIFmP/Tc6QFgXuI6md2FxkPC2fzfxb00l8S9wH4JRmVqnoTX5Daw3/eAlZbcefdvJ4iRz4dIt9xDUMxo+v269uFYguUMkq3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pa64WUYRJnwHjNIRcCzlQL+GP4XN+L/7pwcVOlH1Cjg=;
 b=ZlPv49XWCg79kKG1Xn4Wop6VerDo02afptemYNPRH5YiXnjmFGaTtbveRun/qEFZJbeMr4eYM+PA/3vL3/S2M1gQ7KsEiE8aVg6xmWL5SrkdyXSkfqiGcV+YN4TeYHKeoYO0eNEwdnK/pC8q1GJksLFmKHW/jlBDCd60zNVflcU=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Mon, 7 Dec
 2020 02:35:28 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::59b9:b0aa:a6f5:cbd5]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::59b9:b0aa:a6f5:cbd5%3]) with mapi id 15.20.3632.021; Mon, 7 Dec 2020
 02:35:27 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][m-c-s][PATCH] python3-salttesting: use SRCREV instead of tag
Date: Mon,  7 Dec 2020 10:35:12 +0800
Message-Id: <20201207023512.21842-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0144.apcprd02.prod.outlook.com
 (2603:1096:202:16::28) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0144.apcprd02.prod.outlook.com (2603:1096:202:16::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 02:35:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd837c25-141e-4649-15c4-08d89a58c23e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3112D3F73DDEF7A39FE032C1EDCE0@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/2xyOiAr1sG1UahEpMu6j94ukJoAeOmk6N1NhMRzgsJ1/Y33EKhldsG3pnmSMSWf+AacC6Put5Tkq8jAbunBWztJ1TYDIwsERbi+5gW5Uz7CXl0kpad+Ye8qp+EduB1xS847HlNbFDlcq+go6Odyyzj4sAYBp43N7FYFGpyrG75PPQnOQ2rm5WVp5xyiprx2n7kPP0ndvUKzUYXTnCnnqccY1sYa4HpAh2ZNMMHLfeUcgVhL+TJY+ZkdXJReAeIA82IENGQD27aPBw0JWIyP2bcstA5ZxPQlzYCFhHr7ZzX2YIehub/KLyWtRoqlYYmDNs46o/wAFAYrCavj/Asing==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39840400004)(52116002)(6916009)(1076003)(8936002)(2906002)(2616005)(8676002)(66946007)(6506007)(6486002)(316002)(956004)(83380400001)(6512007)(478600001)(26005)(16526019)(86362001)(66476007)(6666004)(66556008)(36756003)(186003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?elrj2SsksW7pcJ06oPlAvWgq7cdpcoIdS+PO+u8rdHzi2EV0xPGc8bA9rl66?=
 =?us-ascii?Q?S+6M4dVJvXt3OuJxdrbpSiRfPwJkJqbi7HjdomefHvmFSUQaNKXfcUrzPETz?=
 =?us-ascii?Q?enWpVC+oUODKpjy+Fnlcoy5eKL7TqpO68ILyiLRzrZXKnhKbrYW/hDlhM6ti?=
 =?us-ascii?Q?X4N92U5a6RYtmEcCigP9oH1lJBhhY9SKZKfRukGMuW5FXtiDyfpbyPbe9tbi?=
 =?us-ascii?Q?1ViTzEZnK4rAi+FKOURTUaerZb1IIAYOkU2U77my8IXH7cRoKj22QnqF+ZXI?=
 =?us-ascii?Q?P7QSnCLmkYQpPej3JnFbdkejXycTd2YdkIZijIAsdXHmyLRdQFaXDW0zZPnT?=
 =?us-ascii?Q?bXkHaub4c2LgDDIWoQYs3fxWF7UrFM/ma5yA7a/IrOt0RHyoPPv/Eelayvzi?=
 =?us-ascii?Q?Kv2TTMLbgDvvLjjGqlYjHntMxbGqoOPwR5EXjAEPRjb4lBtcgb9Bo0kAje1J?=
 =?us-ascii?Q?nXpUIZ9S3jowRAGdo2uwroDWyKGKh42r3ACB4ozkI1bci2vOzPpcpb/3WyQt?=
 =?us-ascii?Q?vCzczakR+c0LDHkNYYlgxtFojOtVapljL/FAH54hgKnFmpzm/f5gYiWqz/Fm?=
 =?us-ascii?Q?wcjs7X50x/tT7FTjIc33Tj39Zav+YwY7oO2iTdrsOR/iXt6aRFlgRvhVG/uN?=
 =?us-ascii?Q?2pLPDevL+Si27SCruEfGK/2zaJv0dQ8yqTAKZU6Nxe9jjog8GQWbkunIaC8N?=
 =?us-ascii?Q?7F9FQFBtbxA4nvD2ZBwoWZoXdGhRk5cr9cAXJSo2/qCo5RcWYmlshIc9Tgmr?=
 =?us-ascii?Q?/smKfn+WXtTIzNkA5NZS8xdUddS7GjqMdtCEA3TTY1nczuLtPr0GCdOOc8BD?=
 =?us-ascii?Q?KzvJkAc+yCVpOe/l3hbdR5VFfKN/jBrK97M69Mi6+IsXgZKEA8ikWXF/dZEY?=
 =?us-ascii?Q?LGeqnQ+vntzHEZDfsADtXq/80F4ansWqVBPpnwxQgkoR8U/y7uH6MTwXF1ly?=
 =?us-ascii?Q?lpiyvWXUYNbDeDYiBdo+oOnWNMqdyb29rGNiel8yy3w5X3e7kn6AH1WuLxyb?=
 =?us-ascii?Q?x0e6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 02:35:27.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: fd837c25-141e-4649-15c4-08d89a58c23e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Xbx9Rk8kF3kRWDctG8R4bNGvF86NZIxJp0c+QPWY38fA707QD3N+5EWBny9oC/aT9hdPC7lVPVNUM6qt4Tcbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: text/plain

If we enable BB_NO_NETWORK, using tag in SRC_URI causes problem.
Merely parsing the recipes will raise error. For example, `bitbake -p'.

So use SRCREV instead of tag to solve this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-devtools/python/python3-salttesting_git.bb         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb b/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb
index 34476219..fdc0341a 100644
--- a/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb
+++ b/meta-openstack/recipes-devtools/python/python3-salttesting_git.bb
@@ -4,10 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f36f1e9e3e30f90180efdf7e40d943e5"
 
-SRC_URI = "git://github.com/saltstack/salt-testing.git;branch=develop;tag=v2018.9.21 \
+SRC_URI = "git://github.com/saltstack/salt-testing.git;branch=develop \
            file://0001-Add-ptest-output-option-to-test-suite.patch \
            "
 
+SRCREV = "8d21627a4eef316d22cc424deeca16a0ec8472e9"
 PV = "2018.9.21+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.17.1

