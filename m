Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.44])
 by mx.groups.io with SMTP id smtpd.web09.9191.1611049210253524755
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Jan 2021 01:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PuazjWX7;
 spf=pass (domain: windriver.com, ip: 40.107.243.44, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5DDScnoUgR+WIhRFayirv9rwkAdI7KyT24mOuSLvQmWV/C2xY4oOqAchf0XZ0nQvI8gWD4CR2AQukm2or59Ke4OfmGfmnKU1brPsj9P+rIyIcLPaM/aB9UtB8vZJy97An8/+qLMNFk9ZAhYlt7ThyrBygzqQVeiktbIypBPSp81WzIoueXSzI3NgDFYynEwJ1UJLv4v1PE8tAuhUqCl0MzuWy9SMrCkw5daAI3Z3xip85bTHr6J5E0o6A30uE73lOgnZZ5ua6uw8iQ5In9cLF3RWA9xr0Cq6tf5KP+sb1resxeRh5UpSMv2OgGjyxT3S1z/mIUs7IIjiS1wU7oWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5GzDfir/w9oIigmiHZlySiYCDclmc5eeFu5A6sGYlM=;
 b=SecTI251IpXUUVm0iS+sSFPtWrW+smpMJFWaXBkgsDyTAV634DRJid0/Jmos6tNHOvrgpacO5SXIzrhUDtFWtZhLZphXx49lEe602P7ClXEzt68Fa4w0LkQzo/7vHo0Ops440dseenFLB8F1X8PPdwHolTM4AAUk0+iC0wtVQzodcVVgBb4i4X3A3gh5M7f3H8Z6/DVjfCBp2m9TMHvFVzXfY9RnuAfK3I+MZgCzv5mohHkzAQl8m8553vigPaQFafiaf4+5I/yviELlm2C93W6VuN+BF/1UjmyobX6kESQJtGjQAKNjrvP1t6XcAp6tWr7/Hr7DZENs5FDdRlDHZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5GzDfir/w9oIigmiHZlySiYCDclmc5eeFu5A6sGYlM=;
 b=PuazjWX7ubwq9FmxoQbz/edAP83JlIbQ4Q0PouEwqHBJ4ix7ILeD2+pFyeMvnJz0eQrOkJyhOB1dhTYJQTtlUyySDwV09A98cTC+4OywRHWWPyqugEZFW+UwTuJjRjgZXTxgm6wFjCBl8nEYG4N0JMJJvSG+RuknmWXwqS4FEJA=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 19 Jan
 2021 09:40:08 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 09:40:08 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] celt051: update SRC_URI
Date: Tue, 19 Jan 2021 17:39:53 +0800
Message-Id: <20210119093953.23461-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SL2PR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:100:55::31) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SL2PR03CA0019.apcprd03.prod.outlook.com (2603:1096:100:55::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Tue, 19 Jan 2021 09:40:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 957cb8a9-c6c6-48b2-e837-08d8bc5e3532
X-MS-TrafficTypeDiagnostic: SA2PR11MB4875:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB48755F385E52EAA02C78AED782A39@SA2PR11MB4875.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ebL9GPZcoY9alMeKx4kQIEvofPVucC4U/pLayk11eTSN12aDxV4TpkrBUTP1nNL4zNRrM6/VFih1gmYS4GrfA7eYghepwO9WJbKZIi7AYxbB4houMhLFy18/Eojm/ANzqP41rps/RNkwuwOaBgadi8Yr+ODYlvr/33x0kPNm3EaakLZps339ErX0O8sOI/8Znow40L9SSDRys0Z1dF2LfHD8N006BmCHYOQH3HTI2l4SshAAX/r6l44ao+jdTSdcYnZktlirBFrx6fN4Iy5eHo67CHe8aosHWUIWnJaPKU2cQl93B6LD1rnu7F+MbMYH0ZTnzNjZsgrO9b5QrNyVZEzn10hFj4BHemt+dlZ8g3T3Yeksbq+AXa5tLT/9YeTddYr9jrx/olGDYNyX/xHyEw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(366004)(376002)(396003)(6512007)(44832011)(2616005)(956004)(2906002)(8676002)(86362001)(6916009)(6486002)(16526019)(5660300002)(478600001)(1076003)(316002)(4744005)(66946007)(83380400001)(186003)(36756003)(6506007)(26005)(8936002)(52116002)(66556008)(66476007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DMnQ1XHrw+RDjOIhCNPI07lMI7BnPF/oYv9ly63jMbbmT7tvPLrPuACATZtO?=
 =?us-ascii?Q?C5nkJAC109WmuNiRcskPuQ6WGscxOrihsertufeT/vaPTqCl/pnGdfkdoVS3?=
 =?us-ascii?Q?uDbpDf03XaxnZz5ElO/rAlS+g6gwNtFLOW+J16JGZHiBlWsaQuhEdMkMyuxz?=
 =?us-ascii?Q?FhUTyFCLvYdVJ8J0oWXhZjsUPdWIsT6vhX0uTx4VnpRY+/z9nXGQGxMZiu5P?=
 =?us-ascii?Q?H08GP/nTl+I4otjWytbnLCNLFnhgocP1S76UKZgBIVQDcQKZXZi8LZBrvXlj?=
 =?us-ascii?Q?g4h9jhlHFKKqbm3t2r2lTbuDf/kSOeU0zVVVurxVf9YLavWggGlp9Wds6EU8?=
 =?us-ascii?Q?3IOUFoupkd3oAiTYbzFspumUgTVeBKzpU5ZVUXr6Ei7DPLK5x7EiLiTPctfX?=
 =?us-ascii?Q?rR4y6WYGkWHo/Sq6qUS73Wk7U8aA3Cig1v3ROuB6AIXWi8y0YMp/m4X6f0GW?=
 =?us-ascii?Q?ievLZgtek4hTUGe8KPQjAtN1OCUyCROKYYC1t5wgTkY5/52ZakjQFdYlAKMy?=
 =?us-ascii?Q?uI6uXOkny0Gh9ZC6bT8M2sJwSExWORCA0GAo3EQNHYiwLuZROVaUogwQZD3B?=
 =?us-ascii?Q?0rSlE70Xi4SxhlrWLT4pjyVdHQyYkkw+9Vn5WCPJseXp/+xDz9cdqjwGo+jx?=
 =?us-ascii?Q?RLTGIn2ehqRmWjQg7qlPczqlswUZhGOU5tj4Fo/QrZ5KIptm4d1xMUgijEh2?=
 =?us-ascii?Q?4qFvVG9Sloe/k10iQamdXDgdVAPzCGjpOvSnWZzWAZON3vOg/5x8wtBKThrA?=
 =?us-ascii?Q?nN51PvpxT3NaMC4otI2dqEFYXMJK4Yaa3L0JxpnKqUMLna0JALLl9VJZqIv9?=
 =?us-ascii?Q?wFtX/gRfIi3a5dLjhqdGiMRXp5m2uC1bxqSpna7Kpo7iT9d6yR4Dxiy7jDjb?=
 =?us-ascii?Q?rCq4gqn6vPKQ68upn972CDrRSilTj9REyJTIcMRWZAJKW4b+25Ib0E2+jVDE?=
 =?us-ascii?Q?VftIjOFw9felnE/s00Z7mDGVOcS3Cm9kNhnie1D9iYxdb64K3Bh8VALfeDzN?=
 =?us-ascii?Q?K0GP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957cb8a9-c6c6-48b2-e837-08d8bc5e3532
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 09:40:08.1249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TWTxIsU90RvYL0YqlcPhD26MZ95ygg7uxNkSd6OtjQWMCFysHbUqvbj1vmT6t3ZewbDALKY5N4vg1JarpNBsxv/gbYS/QRqudMcDPlUvnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
Content-Type: text/plain

original SRC_URI is not valid now, offical CELT repository
moved to gitlab

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

