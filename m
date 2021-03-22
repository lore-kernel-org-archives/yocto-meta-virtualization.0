Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.85])
 by mx.groups.io with SMTP id smtpd.web12.7322.1616377308774883730
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 21 Mar 2021 18:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KzGXSjtT;
 spf=pass (domain: windriver.com, ip: 40.107.237.85, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W68BU8E5IbVYLbmUonBjrMrkEeBsLwtArRuraA/SAocX9mjZuw6EzOaRZZInL1AKrYX/1jFBPflVtvAORM8hmZFxAli+oJhxKDJz4ZnT0fCAa3z2DbimNbQytmya50cAaKn6qqcjzhzPTuf/ud2XaOy29qFaqmmARaCnlTb0C7KaECTDsWSfyMyIjWRlxx9gbMwBKUTRsQe/PV9jD5wchQLyX7Z2nnl5AulDGsYer9yz/rgKhEJpyGqTxI7X6AEWbn/VISXcuOzaeNDzO2R/zeJVLYSsW79f39EMBYXY7trBHCLVHE0a/Do78Yc/A4jyZOOXEq6jyUggeuHHI/5xzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWKV5GZXQHjUfUR+Cacu+VDbZN3CO5qLvH0RFxOs/eA=;
 b=Rw69T0RR6qFZHhwZpmG3cR2tYxZ8h/Sq9bB36Kj6y/puMxse+K6Zwaora9cmd6ltkN6uHDNvNMxNCJaJXcRObSk/cznp2TMfQrAsalwcai6D0J37fdW/n7sPl6G3aUPZlJlDiniz/Eu074bPjYlfBgjJ7NPK0cjkyh4nvD+NTwMkezkenN3sJoNuNsPuYJqITsDujnI0PlH3og0ThoUG9Kc/I1w+eV8WkPkr3HuEbECvwRsf1fb8HQAo42XuZQoCKAYEE2phFqAoJesiWgocZCk8CsBucWG3Xhr4FN/+kOOx9OXjgZ1tzYGNf97ye6OHn4fCwtWgEbGGNiJ/Bonfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWKV5GZXQHjUfUR+Cacu+VDbZN3CO5qLvH0RFxOs/eA=;
 b=KzGXSjtTi4Y7yrbWtmrL0p42wP+jmGe9jg4mtAhJA515HRUZdZttm4+GYXFwtLA02D1NAkRgW5YloHgTDWQyoaCafzisEPrUxQsz7UCVln8/PXNLr84Wessv8csmJdaSV5ojiPNFaKOlrivV1iSOUmz+V9las0yEAcKBHg1zx4Y=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM6PR11MB3865.namprd11.prod.outlook.com (2603:10b6:5:19d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 01:41:47 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.3955.024; Mon, 22 Mar 2021
 01:41:47 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] libvmi: uprev from 0.12 to 0.14
Date: Mon, 22 Mar 2021 09:41:48 +0800
Message-Id: <20210322014148.35609-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0013.apcprd04.prod.outlook.com
 (2603:1096:202:2::23) To DM6PR11MB4202.namprd11.prod.outlook.com
 (2603:10b6:5:1df::16)
Return-Path: qiang.zhang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK2PR0401CA0013.apcprd04.prod.outlook.com (2603:1096:202:2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 01:41:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9de286c5-7d8c-4b06-f103-08d8ecd3a77f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3865:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3865B88E1DE3F6D257B5A926FF659@DM6PR11MB3865.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NrCYQYH5p99a2SuE38cxWfSCNO9CdvDySCI8MjaQDvrji7k9SoFvYY6XUXt5+X0B9WUdzeRG4wqSuOj+/XaiGzDqOE1LyQfOTInleZMx9iDR4YuNSz7kDf0aB/EJSLOgTALvlN28BSiBE6zhfMcy05GF0eD6nI2tFgJl3XSJ5QGBynYDlvwkLzBMIm0ClTMX16Z/nMHmW6jVDipHvwi5OlvbHg+cvXblmgU3e5VjWJZY/CbXTKVDFswxQecGvKdlTp4QhDW983tv/pGJzaZvyFD0N0gXs7UieAEJwsqll9nOQEACvBpSdKzCss2vo1XCt9vcv37T+M6flV+oUHHwCLLuOrqo6x8j/47BOHeDprp60gI9YoYTgamveNGlyG8eVn2Y8IirMhuMjC/kBum5pojiL1R/KVXQUJo+kvJ8dLPBmCF0pQ7Ktw9oVfocyPWnk0XldBCL+g9p2X91AsxlHcAdRNaiL52K10wME/Skf9zSd02NUaReTt4ekDr7I0PBbXFjLlDXCcsW1lQp1Zrq+BcM6KjfYE/BjcY1JNHlW6rV0PqyY0vPBAK74+rkrKtpHFaDBecibMfiNvmCIYTGO7REBYx9RMaGD9WD971Z4VvZaf/SWsqQLzvxZtpnosnTJkd1XPbmq8YsdEfyCtjJEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(376002)(346002)(396003)(136003)(366004)(6506007)(8936002)(2616005)(956004)(66476007)(4326008)(478600001)(1076003)(38100700001)(2906002)(8676002)(83380400001)(9686003)(5660300002)(6916009)(6512007)(36756003)(6486002)(66946007)(316002)(66556008)(26005)(52116002)(86362001)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?yU3VTCspJFNFmW58ym8m7yL6BYyOBqrEWTrFwxa0926V6tmm1JJnxO9NP4bX?=
 =?us-ascii?Q?lE2mBUxQiTeSFr93/9RxfN2rCSPvdTlWXhrHu2R5m0zOQpIzlBa5NnhvpcAO?=
 =?us-ascii?Q?71uOgEa6G644PJV4AQr76DcekMhmCM4jBvodu9uoUDwBeuhF7+5CdM0aACAT?=
 =?us-ascii?Q?OEzG4F4r6D97Fcrv/MDeCpXFxizBF0D6flmDEuVNSRkwYGjX5vpC4AZiYXfA?=
 =?us-ascii?Q?3B/50R8ux698S0wa7LVH6WaWLQio31dUwicHl7Idppedie0+JFJlob6zApHP?=
 =?us-ascii?Q?erA+vSnawgk7YnCQtkNSfubOt3UAjVEjAJyJt8icvV+q59KSLOpJOW7/XmBn?=
 =?us-ascii?Q?Dj9sehhfv03yk8J2VWBB9R0iAkxCgsu2gJVf4QMJ9MMhLjlTxEY3Ob4Oron1?=
 =?us-ascii?Q?NaDRva+PLokEdZRQ6VWZjLDd5VEFp7ELlcqzy352HAZiABwxLyKXEcXLyqpn?=
 =?us-ascii?Q?kpHDzK0LwagfJSJAT6LFCmNfYqcD5iFKu26FNOdc1rBEPT3UQSvawM1plyfq?=
 =?us-ascii?Q?SUynV8vU3aBTAtzOj/NHMa7+EzFn+VTemb603RwkqzV4QNd8nwO5dzPlYdqG?=
 =?us-ascii?Q?mtwKLKxKxvAGPox3tRR7F/h4zHa8OXTQa6tUVwDlnxLUDdTJZyfitu+ucw3j?=
 =?us-ascii?Q?RAIsgXgDEYTlrCxHFLUk8CMg7AVNj/kyyW/QH0AoMpN7wHxl9fkWdVFS/foy?=
 =?us-ascii?Q?pKFExXKF6pFbRozDfHDwUvj4NUx59uPXnqi7yjrfsRspP/lpoexC7V/iEDes?=
 =?us-ascii?Q?pD9n6P+2K4AODWHOEJxqvRTLduQg5iQ/y4iJez6wpP5ZASy9nMq1/u3PbL6N?=
 =?us-ascii?Q?svGZaY1eaho7FAOOddmd7FiYntLGIBnew9V2eQ5oMYP/K0pjkdKbtrbp89V+?=
 =?us-ascii?Q?Q/EcN4OEdXJAzjbvUM7jUSJz4pcV7m5AxBVa2yAJ9eWG0fOfiMccbk1SVu3a?=
 =?us-ascii?Q?nJtLSlsF1UNIMlOqyC9kEQf6cc9v7Ymd+oM7kUqm2x1uLmwH8FBtRVrlAhrV?=
 =?us-ascii?Q?MkAyyDzg54cy4k5RrGcJzObfaVD9GNeNKRoo8WApc3SFpeSVs8l2gLTgCXD4?=
 =?us-ascii?Q?lecb93D/ktvJutLnaMLwm+lnJ8JBeabN6k1oNzDGM1gCOwVJA7LCIkXCzU3D?=
 =?us-ascii?Q?YyfH/IeFaSi8FwiOl1m55/nB3YckuZieeVa08U+dXeitMvNCLFnYmMAIxgPT?=
 =?us-ascii?Q?3NHv+n2PrpJx/YlEtWEcz/hd+G+vYV2zGVG2SHceVbYviiCTPLK+3dzfhzvF?=
 =?us-ascii?Q?GeSeGlXhXyRNka6zslSaGeK79u2fHSFADIkm0jdEfjclGM8eQGvy+5AUuqFo?=
 =?us-ascii?Q?BFD3KHGHIVW+QBt9eKEegJ/q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de286c5-7d8c-4b06-f103-08d8ecd3a77f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 01:41:46.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qxXextrZ9yi/GlBWyDPL8v2qmn0A6f+K3Sus9SugZxjnpZ5J3FYRdYQWmQxM3OwjiFM7JrGoK1HTqWiFKVnnILDuxkXKtHM+19nPv2pTCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3865
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

Bump version to 0.14.
This upgrade is mainly to fix some BUG.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 recipes-extended/libvmi/libvmi_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
index 88fa5d30..b8e35669 100644
--- a/recipes-extended/libvmi/libvmi_git.bb
+++ b/recipes-extended/libvmi/libvmi_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "libvirt libcheck bison fuse byacc-native"
 SRC_URI = "git://github.com/libvmi/libvmi.git \
 "
 
-SRCREV = "6934e8a4758018983ec53ec791dd14a7d6ac31a9"
+SRCREV = "e8c2061d11c42e5868cbf48229f59b5e7071395a"
 
 S = "${WORKDIR}/git"
 
@@ -29,6 +29,7 @@ FILES_${PN}-dev = "${includedir} ${libdir}/${BPN}.so ${libdir}/*.la \
 
 PACKAGECONFIG ??= "json-c"
 PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,"
+PACKAGECONFIG[kvm] = "--disable-kvm-legacy,--enable-kvm-legacy,kvm,"
 PACKAGECONFIG[json-c] = ",,json-c,"
 
 # We include a sample conf file to which we have added
-- 
2.17.1

