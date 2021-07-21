Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.82])
 by mx.groups.io with SMTP id smtpd.web09.2036.1626860442049191308
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 02:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9x9iIs3w;
 spf=pass (domain: arm.com, ip: 40.107.7.82, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/IVh2G8JHIw9e3htjrTPxAdxn9HHrneHigLvX5gd58=;
 b=9x9iIs3w41KTLnPLgk9M5RN5nbXjlGqx4IvcFI1XMexM3v3QZMVzGunel5CUhEOGbPluMeDWfFVMih1yeWJwNfyIQSFld2XLPk9KgTbR4mZguv2tf0B9MKoAk82bBIqe1raaAZKAOuUANyhul01lHmCV+GMV554N3CGRWIrSv0c=
Received: from AM7PR03CA0029.eurprd03.prod.outlook.com (2603:10a6:20b:130::39)
 by PAXPR08MB6429.eurprd08.prod.outlook.com (2603:10a6:102:dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 09:40:38 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::cc) by AM7PR03CA0029.outlook.office365.com
 (2603:10a6:20b:130::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 09:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 09:40:38 +0000
Received: ("Tessian outbound b269bca6e298:v99"); Wed, 21 Jul 2021 09:40:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0420093bf0c73083
X-CR-MTA-TID: 64aa7808
Received: from 4dc4f74f20ca.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7ABEF25D-109E-455D-AFA4-3BB1AFAA570F.1;
	Wed, 21 Jul 2021 09:40:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4dc4f74f20ca.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 21 Jul 2021 09:40:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vnr1jSfMaqJFYWWMSdIa8lbpt5hRZPEqgb1JiPIePONnBed7fvc0HZlDcJdw/Q8y+j/LlM5uRkBVM/gHo6TaOtUnLBLPF6wZv02qsTceQ4zugBo1Pd1cgiKBwO95HaRDLIkQHdGUWaS7uSaC7h7x1zL0xuL1T9qxFFqEYEuaBvcyWvzq6l5XsNzi1lBpvViwFdaYL8r1E49ErnRqKkH5McjK1ECuWrlhH67sVRgSfW7465MoV+OwlU0geRTDaHljDvqK3AzJ4rMm8Vtc/ABAYPwOYFjLMSeR3nPy3Bw4+pLQx0PIl5VzabQkh/gPHiPIyzSNtRy7ZYViFKg5neQNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/IVh2G8JHIw9e3htjrTPxAdxn9HHrneHigLvX5gd58=;
 b=QSGRdqsLXV0PWnMAb6kzJf/gxcJOt04OY6DnUXmnLNGFEky/KZX7Sky4MnU6c0b7O1sWWgyY9a3AXk868+nvZuSvocgqQxAYWQBte/RL1hlZqFpa6J29Heh38bPN9cdJk+KUH0n7dSvlrR4rnSssZpksJp1H5b6rLWocgSQwSEci1NJrM7hQlBUxQu742C38nsShTzkfx5bUyaq3Onrciojp6rjwkuvu33G3jx4bf55fZ8dm3gCI5pdbyAE1GLsRwmrdhppYIDFuJm3m4RXJ7BtXkhoto95kHq7mmqcfv29rFhyGnIIKaJINHk7fd68COZONKOBgngpoeCjtpMpP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/IVh2G8JHIw9e3htjrTPxAdxn9HHrneHigLvX5gd58=;
 b=9x9iIs3w41KTLnPLgk9M5RN5nbXjlGqx4IvcFI1XMexM3v3QZMVzGunel5CUhEOGbPluMeDWfFVMih1yeWJwNfyIQSFld2XLPk9KgTbR4mZguv2tf0B9MKoAk82bBIqe1raaAZKAOuUANyhul01lHmCV+GMV554N3CGRWIrSv0c=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB7026.eurprd08.prod.outlook.com (2603:10a6:20b:34d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.32; Wed, 21 Jul
 2021 09:40:08 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::7c48:99e8:5331:d433%4]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 09:40:08 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH hardknott] busybox-initrd: Update to 1.33.1
Date: Wed, 21 Jul 2021 10:39:34 +0100
Message-Id: <7a455f0667201311d7112840f8952aacf6ffc699.1626860249.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::14) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809.cambridge.arm.com (217.140.106.53) by LO4P123CA0027.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 09:40:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3965953-90f2-431c-54a6-08d94c2b991c
X-MS-TrafficTypeDiagnostic: AS8PR08MB7026:|PAXPR08MB6429:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6429B67E1AAB9669CEF35A1B92E39@PAXPR08MB6429.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Y53ez1jIG59l+t67+K0wysxU0fuoO6nuxU6q7bNA+/q4q75PCMvk3+92KNTGpsB5R2337l9QB2daJD52RPBK9kuws7SKTQY1Sd0H0UDlzBSTLAiDe/sJuj9XwLB6NaNmdDJbrkv5UjowNN5scnK5gBJO6Oo4uIlFUVp98dJjZP3f+U8WwidXJhdN5C0DeizBtdZaT1lQO59pwLqNBmpar9VIjhSAFwhM6O4QiPOqEtAGd9Ok5aL2CIotSM5n/8v62J8XX6zgU5qnPZ6mmREJybHD28fidiH8o8gSH+yw2QGqvMb52njcLq55edSOTvOuP6LskwDQc6IS+RFVQGPYcaH9Ws3df7qLZfU5DvvZPGqOiP8Ure4VR/D13MvuxY7arDwgeiSDN1w6o6UnZJ5KCsSi7XxRFz5+mWc5kwZsQDAuDFJpmuPEr3sqQdgeRy8nh9JnTxuHKivHRdHkOyzAKvotPCC9Jw1ivW5m6pp03fnBdvdOrcz32VfaQLoz+5ibv+jAZonb2RMSnhy/ayARkbNWFEsI52jG/d3LlHtFWMU7l8CUDFlJ9ciffRnDhFqao1+lKczrDGGEB+FwVSL/luKczcokdCF/OtmOv2da8Q64UgNSBEz3ZFD5lM0PWEqRj6k7sklXSDedk9fXIkrcF/S14AneEmTPSjXUwFmCWN38TUrm0r9qDKWidbkg3uzUUcmbgnJy8Pd52qGMevKPrQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(2906002)(36756003)(44832011)(478600001)(8936002)(186003)(2616005)(66946007)(956004)(8676002)(83380400001)(5660300002)(316002)(15650500001)(6666004)(66476007)(38100700002)(66556008)(38350700002)(6916009)(4744005)(7696005)(86362001)(6486002)(26005)(4326008)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?pxuSCyrpP9RpiDdJUt3IZEFU6mMKpOYvoKyY/ms+9yfENqjufqm8G2Annh0S?=
 =?us-ascii?Q?jseWOGBLxUJOBa6+SzsEkoyJNjgVyD7grrycjehbP544rPeAbGMSOejgjETi?=
 =?us-ascii?Q?cHQjRxQLTD236U1uD9X2cf6BOhBsTYpMxdL7gzjisVyjsBoYwhR9U3Ol1mVz?=
 =?us-ascii?Q?1KAc+JMiff7eeyr3zT9CGhXEd3zvVXwz9AS2f5pCD/HgwBnvQFp3eErKLFdI?=
 =?us-ascii?Q?X21CYHnCaBIoXGTt48rEL0vuy42k76A0QUCGLQ8+AYV6mpYdU5dB4bt1yim6?=
 =?us-ascii?Q?Co9EBTBaaUNJNa3OWHtDYfvQA5eVKnHf/AaeBIODBqFOOUJ2Z9sxMEr/UbCy?=
 =?us-ascii?Q?KuTZiEFcWf8sLEehSDzQ13CK6CLEmE6wurMv4YpFyMlACdbs/um8VsPWzoGp?=
 =?us-ascii?Q?ZZgu3NPTcGMbd762cA2fYcyYGca5CRwsnsOFowwIApS7psLGFIYJffgmyTm7?=
 =?us-ascii?Q?xqB1Nk00tL9cZMP5ocEPbZfNJqksUvxzTUaEM18zcuPnlxzjF0m30of8vh3y?=
 =?us-ascii?Q?JwI1YvZR8A2QeRs6iNXzu5zSG/LxDGkgJo+tFg/B7yma9zepruklb+q5m9OL?=
 =?us-ascii?Q?9m1wntIXY+4QtbrVZr3pH7GZjgBjxdbQ8RBi148Mf9S16IWVolmQyp+XaBb0?=
 =?us-ascii?Q?8DvR0kP226yNC76toM9tmVA3vpUlYFzmd78g3cgG56d3mjIR834LvtWwt9wl?=
 =?us-ascii?Q?3u7lR0fBFINRlajJ57J+DwGCCktHQcJPLo+hmV7IZDwzXdEFsUvShTgTzdcy?=
 =?us-ascii?Q?en9OURG0sRyeS2kIaP8KmJNo84Nszts06QsfgQTPEi7crNdo1Sm2JbaY8nU7?=
 =?us-ascii?Q?M1zn8W+Xp40FGiLm0TUHo107QQWA1ZvqrhyVL8xXDvNfWD56IRaMzUZ25/Lo?=
 =?us-ascii?Q?LNsNj1LZF/51YWsbbjqzExTVOp4TrmNz7KV5qoTxdvSnMM8jl8TJys6Y+KLl?=
 =?us-ascii?Q?14KM1fZclPZD47FQxBB86dzUscScaujCbKIbbvmBEa+0jTlGPkh3eeisjBrb?=
 =?us-ascii?Q?rCxm6LJxLJ2KcYTmcdPHyUlLDU0wk7v41G60ueSy8dqSePjMaHnblVy8lOp2?=
 =?us-ascii?Q?CkCINWE3kcPq1I7JlyVJboA5hCn5fEZ8AS8scgpffYvsdm1ZHhmPI/bpXv1V?=
 =?us-ascii?Q?7UXRE86asF4n/NDLFEJ16IFt42eQ7z3msDhxB8/gCw75VAiOjtX+o5cb2X6b?=
 =?us-ascii?Q?kWJaXEGOGQFkQAPwudpAcr3fQBGaf/L7lWZvljGMiyAJANRyGU/BSKItYQRF?=
 =?us-ascii?Q?CZQN2GT2ofV5004taTKVS0GLz8OooxwHHAo0xN2YKTYnaxv1vroAWSAYdqFN?=
 =?us-ascii?Q?ZeT1xuoH+12+jvtQsz9f485r?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7026
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ad4e181b-30a9-4cdf-a4d6-08d94c2b873f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bTNCLxy1xMmVRjNsV9+jRiMvL4xnxdieMgFV/mGvTt/Fskmu6sfjxEGwFLQsNYQ4CU/H0DcXQ6++Qazx5XkEAdmlq3AgCBUHsYubbtXgfin/AHCtswFISsRniDryvTv3ovH//MqekZYJz115Pinsj7Aa7GHXAIhNI3zQ/z8wwcTlFs4/LKeaQKsNOUnaw+0mDf280DYTwFCoSJ5bOMiFs9K7W2WJXvQ/H80PpVsXE5UHyYboK/2AKkJTYN59MIU6CcFTAFev/tgYww5GA2ba9yJAtdNVyLbsEnG68AHSP0ba7QFcM1XGSzwPjzCLl/+Pstze1MiTnyZsQKph1lw74d7JHV1OAATDEUk8G1AJeFfaON+6ecFshut1KLSnKraNNclDx7jNRboxdg9uSteGCak5EY+URg5g3XzFLQiFVexAQmMSCafaJ55abix1So/rLv+ffCMxz5/ssIee7T3M6mt1/8A+Hr08HBjV85Ko3ckSPxyjLKU/UWGoKf0Oxr61FL3Yuui14wX3b0tUl9DZ1jfvtLkjyCyC6j9lpH4IOff8H/vrGWTZ+RvtZ4NcMHOUTygCCJl76JW+L6TW8GWfyXiVRce+SY61YfPduGXBkDkyCVGg4doDOBSh9ZBUwwkcB/y48cV5o1jxnELZY561pSs7y6g3mVXlKmms/IbTaXaimZsqtRPYDKPSTJJ57mgGPVFZvQCfc+hn/cSEOasAug==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(478600001)(36756003)(7696005)(82310400003)(26005)(186003)(36860700001)(81166007)(316002)(356005)(47076005)(83380400001)(4744005)(336012)(5660300002)(82740400003)(44832011)(6486002)(2616005)(15650500001)(6916009)(956004)(2906002)(8936002)(86362001)(4326008)(70206006)(6666004)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 09:40:38.4521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3965953-90f2-431c-54a6-08d94c2b991c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6429
Content-Type: text/plain

In oe-core hardknott branch busybox was updated to 1.33.1. Hence, do the same
for busybox-initrd recipe.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../{busybox-initrd_1.33.0.bb => busybox-initrd_1.33.1.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/busybox/{busybox-initrd_1.33.0.bb => busybox-initrd_1.33.1.bb} (100%)

diff --git a/recipes-core/busybox/busybox-initrd_1.33.0.bb b/recipes-core/busybox/busybox-initrd_1.33.1.bb
similarity index 100%
rename from recipes-core/busybox/busybox-initrd_1.33.0.bb
rename to recipes-core/busybox/busybox-initrd_1.33.1.bb
-- 
2.17.1

