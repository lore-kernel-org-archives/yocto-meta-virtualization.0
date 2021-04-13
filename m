Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.80])
 by mx.groups.io with SMTP id smtpd.web11.5898.1618300221139713322
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 00:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KLF2MVNa;
 spf=pass (domain: arm.com, ip: 40.107.2.80, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgE3Sr/CQ+IZ2gKwJCuxByH87Tz8izrmEdMn+LQhyoM=;
 b=KLF2MVNasG8yNgWKYmGXpYWWuavKT0Vf8T0pQRF0hndMqUCqmf3fQBrQddXrv2qGWXIYVSjYQ3RCk09L9HPBAVJBsItAxMh5brWJgHBJF0zwfEDBrYOjWXG1uZDiKBDCIbpAXFig/QDAf15Zet4YrBdkBBudXar38NRj+dS9T38=
Received: from AM5PR0701CA0063.eurprd07.prod.outlook.com (2603:10a6:203:2::25)
 by AM9PR08MB6833.eurprd08.prod.outlook.com (2603:10a6:20b:30b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Tue, 13 Apr
 2021 07:50:18 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::97) by AM5PR0701CA0063.outlook.office365.com
 (2603:10a6:203:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend
 Transport; Tue, 13 Apr 2021 07:50:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Tue, 13 Apr 2021 07:50:17 +0000
Received: ("Tessian outbound 81a4524e9a48:v90"); Tue, 13 Apr 2021 07:50:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ad01a173565caf56
X-CR-MTA-TID: 64aa7808
Received: from f23b6a86f460.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 38F47199-0D19-478E-AD5C-A24320C2B53B.1;
	Tue, 13 Apr 2021 07:50:09 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f23b6a86f460.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Apr 2021 07:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+S4yuNy6m5kyLINRglDOt6TTm87e6dtOfm3UgLi12JRXM/inOe7JiG6M0TyxaOx6W3ZNRHwkgMoUPlGReNhGxMWmkYGjrpDnkpIEDURobaNlqK+GBQkX9r1PS27fqEDjuVT1kD1iNS8Ey8JozA5kDAOnxenRm1Hzt0dQpVnMdsyCv4pAMXha8J1mSJSUDLsm+EX4QYOZGgnRve5q06Q9N2hbEytsVhF61/dl2VoOiD/5oignz7h4iaREWAoUsseKUSdc1jA5ZAaWHXB+tNG1r1z70V79ooSao36Fx/LDd7VXuxqtB6aPuPpYNH4Ipnr0Nm06T+HG3i34TTw/xzFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgE3Sr/CQ+IZ2gKwJCuxByH87Tz8izrmEdMn+LQhyoM=;
 b=jbjJ6yaS4U2HIRAvJWNgn7pUn4EtzaeX5x7lMpC0H/l448t2PzjrTzlE5aLmTnLd7Vj7vtqb0OYY4AHXL7za6a0BQYAihUrMAKt46QZkbR+qVcswTc9VUZuEXynFe0F5ucDVOJGb97KPjv1GTbno6dKgPLbV5abV0BAROLyL/RwqwgzazJPELgxOmpyOvOWAF6U2axvMCVgcLORW0KJ2lLWCJL/5BBn1b7G6gLSt/yOlQvRiCgDlVI509FJIg4jMkB5RnQmvTRwnHVXl2RRnyVx7JjF7cQTMqS7lVya6qoD8n3T8hOs5KzYp5ljWDhT5vVIJFMtsub2y+57yguzXbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgE3Sr/CQ+IZ2gKwJCuxByH87Tz8izrmEdMn+LQhyoM=;
 b=KLF2MVNasG8yNgWKYmGXpYWWuavKT0Vf8T0pQRF0hndMqUCqmf3fQBrQddXrv2qGWXIYVSjYQ3RCk09L9HPBAVJBsItAxMh5brWJgHBJF0zwfEDBrYOjWXG1uZDiKBDCIbpAXFig/QDAf15Zet4YrBdkBBudXar38NRj+dS9T38=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5838.eurprd08.prod.outlook.com (2603:10a6:800:1a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Tue, 13 Apr
 2021 07:50:08 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 07:50:08 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>, "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version to latest 4.15
Thread-Topic: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version
 to latest 4.15
Thread-Index: AQHXMBKVR5EKKwZOykK2Tv6PZF+IIKqyExiA
Date: Tue, 13 Apr 2021 07:50:08 +0000
Message-ID: <5FD7ADC9-C018-4400-B51A-40C14618BB91@arm.com>
References: <20210413030951.40543-1-christopher.w.clark@gmail.com>
 <20210413030951.40543-2-christopher.w.clark@gmail.com>
In-Reply-To: <20210413030951.40543-2-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.118]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 048014f4-3796-4d01-a517-08d8fe50c80e
x-ms-traffictypediagnostic: VE1PR08MB5838:|AM9PR08MB6833:
X-Microsoft-Antispam-PRVS: 
	<AM9PR08MB6833768682F6BE1CB02D1CC99D4F9@AM9PR08MB6833.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rtx1uyyd4HTMuVu6aXyiVAmDOh0umOKjxaBIfM9WcB05V0NAI7zmBYWh2HyUyJdHffncG+iIJLplvhuRfxSlvDax+7fUqr9WRxV35dCl+UfA15zxdVk7nqz3u3JcHXjhPnfDrV+n1HDcGVBoLCU1Q0k353i1omfYtcErKqihXbbb07da8zFB9i66d5Dh3xqwUGnN7avtAbHiniQmub8ACWGNMHRJSMPlFIdXL5vZ1KAMx3GfVTJWlWWumlOdN0tZmYGq98sZo+dd8sXbESjPgq0IJ8RJ3hpxaOdjz8gtEXsq4saIVtQXBzvDBQVRvytV1G+C7h4owQ6Z50kRPih4oMeWpTXyyXHC2uDxujMrqYo1v1jfm3e8znjzvdgkEdGmCEm8UPT05WZkCI9Na0i0L0dvjWwNtYoYVPblW4npJQUW1pli34h4ksBroW/w/ZJKJSxWZd86aciXhztfsymYQscWqVtESBvGAF7Hc8rXiB+BlwmHoy2QzutEo/o/QLtAHJ35S7enDy9SeecXnHd+HR7kPPZC7x6Wckgm5otukrnt/GpPoR3DIbrbDoxBVG7h6QD6iJQmq2p86qs/N6YVG4yWu127mj6KSGl09ZCA3z4H4AlhksHMvv4Mg/rthd05ZnypWLNGdoq+3qP46WwchbWf0GVCHXMiTx00qLU9ZIyfJdYuWN8fLRB6DBepbA+T063OBZhycth3FUkHJb84tPrf+4jQbX7BYBl8HOrcPhY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(8676002)(54906003)(6506007)(53546011)(2616005)(8936002)(6486002)(316002)(71200400001)(6916009)(66946007)(5660300002)(966005)(4326008)(36756003)(26005)(86362001)(83380400001)(66446008)(64756008)(91956017)(76116006)(66476007)(38100700002)(186003)(478600001)(6512007)(33656002)(66556008)(122000001)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?aYySfPtGUNW5UQvD8vAkhKTA17ZuVFcbJztTODQFHrg5crKtNORQQSjqwuNg?=
 =?us-ascii?Q?9irY0J4sQ6wK59CUoNTWAxMMROINGIEQEOeCF7bbAzCiK5PsK/xp0+/DjCJj?=
 =?us-ascii?Q?xp3UqdZxrSRprtf9lASOBTKv/KYQu87WDytomOX9EaweBWQ7qrcn12eYDTlP?=
 =?us-ascii?Q?Vl4qFtAChz+C85glTLy5G2VhbOVNJM9Fz+sqRfwIDFfkrzpy50Zv06oqAkpL?=
 =?us-ascii?Q?Q0zraBYyGIJBX+R+WbxKEdRaxPfhq4bygDE33gpbp9QCCAdGEMD736g+KJdg?=
 =?us-ascii?Q?eoGQ+523Lq+kfXcLH45e8RWX70wwxyr7P6bRYWQt02rCQAmGjZPepKDbKsRE?=
 =?us-ascii?Q?7kT9toSmQau+r7ILAoxgnm/epl2R1W4f9y4yGNUHdZx1H6sEMQmp2XwcDTdC?=
 =?us-ascii?Q?v2KvqOW+qM2A4/3iD0pR73ZjqyTm9MLLc5RBajp4EqW2+ksruNqoVS2NZGBf?=
 =?us-ascii?Q?8lm/FtyRRJOt7MIVSwL0eSQz9UhrG6FRNQcCz3m30Eg+s2Q44tHcv7Esmict?=
 =?us-ascii?Q?DC7izEbO0xQ6zO9b6P5LmX3Uaj5DgposaO3pR5/lpKSu37cuMFfiYHsMh4fv?=
 =?us-ascii?Q?lSoCssyk2/rowRdxcD8SaCmG6IFcJAGwFF8vitSx1SgEnfZQJZlx2FjIrMHR?=
 =?us-ascii?Q?8WgxWsCQ8z5O34t5kbPC8cT5pT7wpAvp9/qltL+mp6LBmLXgtMULbr1lINbz?=
 =?us-ascii?Q?VoiHlvGwBQLhebUo0DKlDUQZuVlykg6fLEDacxJ1fJNz7adElxRaKg0eVlb9?=
 =?us-ascii?Q?jdQwuN4m0l96unedxcY9wKSbLrkAKdtuSm3uMwkJbDSNwUa1gYCcy/Ek/hSD?=
 =?us-ascii?Q?gd2XeBsAwQLMtAsf5XckRAE3xU8Fctc/iN+6EjvlBTjvgzDyXeqOlGXrgQZF?=
 =?us-ascii?Q?/7tRLLX73ZXbVzorg2p0adWmULhzHwwDrLeUAU5hchvGrHdByVPb1nWVLMdo?=
 =?us-ascii?Q?nGUeoYgKgCOlD/CjNPkL+zgBA0K3SD9f3zO/y5mEVoVJkIxQaOx+vKlcnEOL?=
 =?us-ascii?Q?4WcyrdueKmOvYGKFTwjSJ8ZIS1S4bvCQAtCiBdgJSm48qM8/N9DBypFM73hT?=
 =?us-ascii?Q?zh1D98nrYI9phU4ADM8n3euFFwAEU35p91eINwPXRgNLqnjxvHTo6czCJa+Y?=
 =?us-ascii?Q?kBIIK2hVfB/8ALEv2UBoyreN4+I3G8xb6ZZPi/670jHV5belPcLuRyulpYsP?=
 =?us-ascii?Q?rLJjxPUrVSvNbG6Yeozf1VFyqlbKZBmmzh6vjAL/98ipEn7CCoYIhewct37d?=
 =?us-ascii?Q?7jEMfS85OWbUcT/LHIwE4emj2UFgyCqoHFXbcRZHwGTEy4KN4MpIOMDF3LXU?=
 =?us-ascii?Q?Luq+QbGvufJjqRPDEfdmSYhN?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5838
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	820befae-d082-4277-b78c-08d8fe50c27a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wQxhx3TQZCe7WnAucxgVzRrdAHTMmmLKFnfcMqfERUNICOH+1l0I/JHHz+yizFyKJkXVLTggYDhyQrofau84qULN8PSUljEeNiKPbq73w8EEKwVCVueC11JEgI52skEGosrA7jZKPp4o755+orvxDI4hhYtuXdHtPnsEmsb9ZIVHvldRTZlOzYWRehlAZ12XR7L8SKbdLWq1bUV4OlkDxbwGx1xd6GZf3Nt9tpPuqzq5e2MThPuFFl8nBiXIzRDJIjaPHu7sFn6oY6ZN4qdEqlg033LIG7e3XjgprEN2Z4MaarsPqjIDt5FRHfXJ3ruicvGa3x0FTVRA2XJPIBIn567mB9pTzbFyCxJhZQ5GVbKIyrjZ7ly819ONfwifBGXjEYtgkPrxIvrLsmNKNhXlmzVEhBOU5yYRCpAuXSXFucc16atDwKpUhLAlh7xZd1WWISdBDLvn81GsuexWnmLHC0iSHzt6fnbHzrN7JAMXWfDEacA4wNUOuJdDfv2q3pq1M19+jYS/N+4xw7LfWijgOV1BKz78T3Q6luo7H/9mvPoGT+dYmCcNdbshCsZXWXMsL4NFjEXyVIf/1gZK89QdZGb3vzKjVJV+9PBsA9xvcOgza1bwKfXst5cqVmXxHd1QWrtwxZkXLNow/8xxhvWQvEFPyrhP67n//zP/cSPecxd6KQvm/fcYoiu7NDBbmsLwbkqxvl9iEw6q1FHJJFQSj/NvQuwQDANQs4H0g8rkvAY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(26005)(33656002)(336012)(82740400003)(2616005)(2906002)(81166007)(36756003)(6486002)(966005)(47076005)(107886003)(82310400003)(356005)(6862004)(70206006)(86362001)(4326008)(6506007)(316002)(8936002)(5660300002)(54906003)(186003)(6512007)(8676002)(478600001)(70586007)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 07:50:17.9227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 048014f4-3796-4d01-a517-08d8fe50c80e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6833
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CC67906C72423C4EB7091F4997C725F5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

> On 13 Apr 2021, at 04:09, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Update the git recipes revision to the recent master branch point for
> starting 4.16 development.
>
> Remove the xen-tools python patch for 4.14.

I do not think the 4.14 recipe should be removed as we decided a while ago=
 that we should
always have a recipe for:
- current release - 1
- current release
- master

More then that we have very near Hardknott release and meta-virtualization=
 was not branched
so this is a really bad idea to do a version bump right now.

I would suggest to:
- add recipes for Xen and Xen-tools 4.15
- set preferred version to 4.14

and after branching change the preferred version to 4.15 on master.

What do you think ?

Regards
Bertrand

>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
> ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch | 66 -------------------
> .../{xen-tools_4.14.bb =3D> xen-tools_4.15.bb}  |  6 +-
> recipes-extended/xen/xen-tools_git.bb         |  4 +-
> .../xen/{xen_4.14.bb =3D> xen_4.15.bb}          |  4 +-
> recipes-extended/xen/xen_git.bb               |  4 +-
> 5 files changed, 9 insertions(+), 75 deletions(-)
> delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-DI=
STUTILS-xen-4.14.patch
> rename recipes-extended/xen/{xen-tools_4.14.bb =3D> xen-tools_4.15.bb} (=
68%)
> rename recipes-extended/xen/{xen_4.14.bb =3D> xen_4.15.bb} (85%)
>
> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTIL=
S-xen-4.14.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTU=
TILS-xen-4.14.patch
> deleted file mode 100644
> index f0688fd..0000000
> --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4=
.14.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 2001
> -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> -Date: Fri, 19 Oct 2018 11:01:37 +0200
> -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py arg=
s
> -
> -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
> -as well as other parameters set by the OpenEmbedded build system.
> -This is especially useful when the target libdir is not the default one
> -(/usr/lib), but for example /usr/lib64.
> -
> -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> -
> -Forward-ported to Xen 4.12.0
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -
> -Modified to support pygrub installation with python 3
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -
> -Forward-ported to Xen 4.14.0
> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> -index 3063c49..513314b 100644
> ---- a/tools/pygrub/Makefile
> -+++ b/tools/pygrub/Makefile
> -@@ -10,14 +10,17 @@ INSTALL_LOG =3D build/installed_files.txt
> - all: build
> - .PHONY: build
> - build:
> --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHO=
N) setup.py build
> -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHO=
N) setup.py build $(DISTUTILS_BUILD_ARGS)
> -
> - .PHONY: install
> - install: all
> - $(INSTALL_DIR) $(DESTDIR)/$(bindir)
> - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHO=
N) \
> - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> -- --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
> -+ --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force \
> -+ $(DISTUTILS_INSTALL_ARGS)
> -+rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> -+$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
> - set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
> -              "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
> -              "`readlink -f $(LIBEXEC_BIN)`" ]; then \
> -diff --git a/tools/python/Makefile b/tools/python/Makefile
> -index 541858e..4d4a344 100644
> ---- a/tools/python/Makefile
> -+++ b/tools/python/Makefile
> -@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
> -
> - .PHONY: build
> - build:
> --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build
> -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build $(DISTUT=
ILS_BUILD_ARGS)
> -
> - .PHONY: install
> - install:
> -@@ -18,7 +18,7 @@ install:
> -
> - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHO=
N) \
> - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
> ----root=3D"$(DESTDIR)" --force
> -+--root=3D"$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
> -
> - $(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIBEX=
EC_BIN)
> - $(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_BI=
N)
> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended/x=
en/xen-tools_4.15.bb
> similarity index 68%
> rename from recipes-extended/xen/xen-tools_4.14.bb
> rename to recipes-extended/xen/xen-tools_4.15.bb
> index a79b41d..314dc52 100644
> --- a/recipes-extended/xen/xen-tools_4.14.bb
> +++ b/recipes-extended/xen/xen-tools_4.15.bb
> @@ -1,11 +1,11 @@
> -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
>
> -XEN_REL ?=3D "4.14"
> +XEN_REL ?=3D "4.15"
> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>
> SRC_URI =3D " \
>     git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>     "
>
> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xe=
n/xen-tools_git.bb
> index 71850ee..0188bdd 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,6 +1,6 @@
> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>
> -XEN_REL ?=3D "4.15"
> +XEN_REL ?=3D "4.16"
> XEN_BRANCH ?=3D "master"
>
> SRC_URI =3D " \
> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen=
_4.15.bb
> similarity index 85%
> rename from recipes-extended/xen/xen_4.14.bb
> rename to recipes-extended/xen/xen_4.15.bb
> index 653e3b6..2842c0a 100644
> --- a/recipes-extended/xen/xen_4.14.bb
> +++ b/recipes-extended/xen/xen_4.15.bb
> @@ -1,6 +1,6 @@
> -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
>
> -XEN_REL ?=3D "4.14"
> +XEN_REL ?=3D "4.15"
> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>
> SRC_URI =3D " \
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_=
git.bb
> index 2b62c5c..eaf3956 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,6 +1,6 @@
> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>
> -XEN_REL ?=3D "4.15"
> +XEN_REL ?=3D "4.16"
> XEN_BRANCH ?=3D "master"
>
> SRC_URI =3D " \
> --
> 2.25.1
>
>
>=20
>

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
