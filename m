Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.52])
 by mx.groups.io with SMTP id smtpd.web08.9663.1618386031359588874
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 00:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=igsZQCri;
 spf=pass (domain: arm.com, ip: 40.107.1.52, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDEUoMB0zwXhr1bWYldTzwccPUgPsXAp3+8J5GgQdjY=;
 b=igsZQCrirP0P1bflPQzTTrKSGBmiN2criLSbtNAo8+lyxNsohOaLGikNL40mSwHE0eg8rDjXQ5UYhMhfRoBR6pHybEow4+NWHQsFM/WRJPBiOS3rAkKNRet8E5CJhxnMyaMvSdt1B3pRfeyZsvfuRN5eF4AwR/W+R+F7UQ21SJQ=
Received: from AM6P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::16)
 by VI1PR08MB3182.eurprd08.prod.outlook.com (2603:10a6:803:46::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 07:40:23 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::d4) by AM6P195CA0003.outlook.office365.com
 (2603:10a6:209:81::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Wed, 14 Apr 2021 07:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 07:40:22 +0000
Received: ("Tessian outbound 34291f7cb530:v90"); Wed, 14 Apr 2021 07:40:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef1ffa1e4d1c61fe
X-CR-MTA-TID: 64aa7808
Received: from e49fd43eac8c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 749DC0DC-6717-4285-AB76-A876D0D59D13.1;
	Wed, 14 Apr 2021 07:40:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e49fd43eac8c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Apr 2021 07:40:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCCWFK7TvQJqzU/BMUhMHYf2MhDO62bfkfrmwMdYkXEARXqygDq9pWzELmQdrfIQSYmQO2s63XmwMzXTEG4lEAz2BlAWKTS3cENGD9wT+5EpOMgxRVBF4ccnu1WVDCya6PvKcQWhDTB+hE8VTqc9SVquH9RZ0t+hiNeSx0MaSjimxP/009GZTH9aBqOVZNFyPi/4s9L1+37j+SzpGZ4Y/vZRWwavLXro/yefIcD0NXa/k4mUZEDyUwshlwI79plMDS5BMF2LO9H02vIdyiMW8CFqXoVLsv1Rjl5M2vtln22oRGopwKoYrfX4J+aRCF4NZXWnDi8hSqhslGqK+8xkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDEUoMB0zwXhr1bWYldTzwccPUgPsXAp3+8J5GgQdjY=;
 b=ipzyhvU365Thm5seWjK63B4RzeEOatuxiq67iq8Go6beDySW0BH3YBNveEcq7oJ7DNlyPPj+o401JOKROdH/i9K/CaL5gD9iAloQ6uwtgBqXdfr3JBChJREmi5YYKYQi1U0q7ptFQdWc5mL++vksE11M6UypE0c3OMYAdK93V5M4AnZ1lVqjFDYMj2Vs9XnanmEhNQFz59E/zeQxsHtsFqZ68eVPe9qM0jil41/GCopJ0byLu/05q2MEZndbKUF1tOJMHr4vSbebZsqFwCUVCvcN0ZABGBifPj8wjx3DVwAuDtD89B5rvoEFYWm78+9qJGTkNy8CuU4u0VSCHC/gHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDEUoMB0zwXhr1bWYldTzwccPUgPsXAp3+8J5GgQdjY=;
 b=igsZQCrirP0P1bflPQzTTrKSGBmiN2criLSbtNAo8+lyxNsohOaLGikNL40mSwHE0eg8rDjXQ5UYhMhfRoBR6pHybEow4+NWHQsFM/WRJPBiOS3rAkKNRet8E5CJhxnMyaMvSdt1B3pRfeyZsvfuRN5eF4AwR/W+R+F7UQ21SJQ=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0802MB2336.eurprd08.prod.outlook.com (2603:10a6:800:9c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 07:40:13 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Wed, 14 Apr 2021
 07:40:12 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>
Subject: Re: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version to latest 4.15
Thread-Topic: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version
 to latest 4.15
Thread-Index: AQHXMBKVR5EKKwZOykK2Tv6PZF+IIKqyExiAgABUFACAAAlYgIABCSwAgAAo+AA=
Date: Wed, 14 Apr 2021 07:40:12 +0000
Message-ID: <9685BEE8-93FA-499C-AD0D-B9E83D0C9662@arm.com>
References: <20210413030951.40543-1-christopher.w.clark@gmail.com>
 <20210413030951.40543-2-christopher.w.clark@gmail.com>
 <5FD7ADC9-C018-4400-B51A-40C14618BB91@arm.com>
 <CADkTA4ObusWLZzRwUm3K+V_AiuCNrear=y_GJ43MqGOZcw-=_w@mail.gmail.com>
 <769FCB21-E735-4C21-83EC-5CDA3B423F98@arm.com>
 <CACMJ4GYMA-kAjMfz7gk0fmvCSqN8GgOyAigKa+99wrMy48GUPw@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GYMA-kAjMfz7gk0fmvCSqN8GgOyAigKa+99wrMy48GUPw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 49a3ffbd-37d7-4a1d-f128-08d8ff188fda
x-ms-traffictypediagnostic: VI1PR0802MB2336:|VI1PR08MB3182:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB3182781291D1079BD2D528309D4E9@VI1PR08MB3182.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2SLUCc9o5XUYXxibcGjhzY1QgRWnnWvMO23QNQzVAiksA9/aIKLHXiQtbIJ+YCniac8Trel79BzWrLwFVZ87nh/lGzmrnlw8OCqU4VbJNKEXwRaS2rbcQHnJ5qcRgecNaiLuJx4MbESnCPaUq5ISjVN3TbSJTbiy3sTBFfdQcFz9TOXemzrfcvmHJOCKY5OLYf9vDH5ddjsP2Paf6Ij9pEg2as4Y0oV9WP0p3YhgonZ11SKTvRjsd3tnCpELLzKPxl+LqOTcVLWtdE34V/kvDq5U02zqCvEtrOpk95ZGiOjoMicRAvoqo+d1bm90vUMH4E8K1oW2fJ6zq/dU7H6UWb4Gb+Cd30PUJt0rcPG4eMp48nZX+1ZGkswPluiAC7Yz63mjWXInwrz/rlOGg7++fuuvoGhajovwAkPCGT4hz/xmjMggQFs9WQfpss/rVOQk3LKU4RHRQ/Dmiy34uEg4vjfD4XlzNLk8w7aggqFeAU7kJ/ik3/zTefOhVDG0+erTpsbABG0UbAonDRi9+Dy+gXaH7z6oOqXaL3YXEccmrPevixoqcWGNVl93a93Sq+9AIwpNBpMssu13hZrSeZshal/6ozshHH1ilZ6rTVII0uEC8Iizjr4t7x89jlhIZxR+RQUALt5OdIX8kiQntV/rXhxnSgw7iJTHDy94L6x6cRLQUXmCI9L5zx2+ohOC9XSVNwBzNSNcmr1G+v2gI9A/egLib1mAtk4JQ7+IZmVD4IU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(26005)(30864003)(8936002)(4326008)(66946007)(2616005)(83380400001)(2906002)(6512007)(64756008)(8676002)(66446008)(6486002)(66476007)(33656002)(186003)(36756003)(122000001)(316002)(66556008)(86362001)(5660300002)(76116006)(53546011)(478600001)(6506007)(38100700002)(71200400001)(966005)(54906003)(6916009)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?poCvBh7U6Ib4WF+huVu6gIcGaTMDM7W8vuu0hv3rXrltHqErZKDIkyrgm9WQ?=
 =?us-ascii?Q?srHzZ+hNRkipWFdKOgdjshiSCMFJbnqF0XeoCOh68PSqUQ6y5h8u+ijtGPMb?=
 =?us-ascii?Q?w/9KRRnl71zNyfF6yL2wHtytk+lCTGOBlEQ+5ALWknzgil/F1BdzXMyKRums?=
 =?us-ascii?Q?9a18Y3+ZPCBnWH/RYLPDVQ1GO9pfO74kSQ2opgF7SfI5muL2BQEHLNsG1550?=
 =?us-ascii?Q?FSw2krlvJSuzI9mpNRkBeKuPBve6JlPa6tkafx9OWq22f0LA0L/SOXYcIKtj?=
 =?us-ascii?Q?faeblelKAQb13MCM/l+3zuYDKuFKWY7Ge9WyGGGGd0rCAWWcglLlc1XmyhTt?=
 =?us-ascii?Q?wrfXidpCBOIF/HNEBOUFTXiSgV9ZTA8ks9s4b3DUtaqVJ9X/op5HK2zraj7v?=
 =?us-ascii?Q?RzFH8nRxNJktvyDARmJRHi+iE9wQuMYC0Se3XtAs5lJdvNOOqaOyTM23g02X?=
 =?us-ascii?Q?LVIeV1guZOV4ipu7f17ISrVBPCtz41cMZqsLgbsc3Kq4c5nP4t3xDwShjTzX?=
 =?us-ascii?Q?V3jaAks9etyBVKOr0AOYDk6cZVarpa8wpUZ9QtIQ6czo41ZeTY5n+Lp2OlBa?=
 =?us-ascii?Q?eve6g7gYRMglHAwba4Sc9/jeWKaqTw3cpOQYBJBJ5wW18D2nriM62/z1P1Ud?=
 =?us-ascii?Q?AHb/OJIwcQcjVix5xOGBXcyxiFlIS39fI7u6XtA/nfI75rsYStEuCYkv773T?=
 =?us-ascii?Q?IgS1PklkV/4SaOa5xL4GGc+7NzHPKQvIVjhoKr0WqGJyb/FrGj3KPMbAvmuu?=
 =?us-ascii?Q?4n84qAlUk1fzFfSm1CScovpfgHxlEJv2hRJAqZukP/0oOsGna2CsF2Y/A1Rt?=
 =?us-ascii?Q?7PsxKjEZVjSkt22L0kEt+Ub8nGTbsP73VZfX9qCQg9C0qUuKJVbavBRc6mtc?=
 =?us-ascii?Q?1E6SCCYDNtHF+QOgxRWjQUcjHrRELf1r/M3f+0qofSkXZLjwfFT1rd4880mB?=
 =?us-ascii?Q?o8/5FPczVYfdGIelaN685SLl2EWcY32EtIqdS1MMs42A2hWdu0m25PM9FDhi?=
 =?us-ascii?Q?St28vr/87YIn7QdMi9TUCMI5GcL8j9EIjBTrEGgFBn2OCun/MO2LcJYqyJNu?=
 =?us-ascii?Q?h9DvdJtqLGtvH9eEnNO6MvzydJ/vVZ+/t3sCPqojrjLvu3Dk5AMAD56aonZJ?=
 =?us-ascii?Q?esaiZkxDSt3sBAuBmYI7hLa7E2uBbdj1CvyaNjwqt3obsjaCAlst9tLC4p+W?=
 =?us-ascii?Q?Acp2CtSZmTh57MgxAMDgBkSBm6wGrrT1JrZJrJ7X67/5bgUKe64PAn4J5STv?=
 =?us-ascii?Q?qskRTKIbcMuZ5gmCEYWufvfodGhGwaaYlapDYFBb+NfE/IR0mfJ8IkosL6Pi?=
 =?us-ascii?Q?sCb/Di07PUJ1T25E3E4qOqCGlbkVfc4K790hI/GZwISWVA=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2336
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5bf07365-d1a7-4303-dbf8-08d8ff1889cc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KNB0ZWTI8uSnzdaqzV/6WnW09O8N/BiPw1x9UoDC/ilZyktLr/6jkFv7fwRIifvXl4YXzc073PRT8PRVlGHFc33uUAyx4HrisHNQ14j/z+X0Li6OnddZK7/BQsh5hY4SX8GPbvREzC1hcceCY/K1q9mlcbq69O//MV2Bu98Dv1XBe7kv4DhFPdxG2ct3MgBr/0a5/jY4F+014ynSIy2a6iReh97gqgfpOzekcVch7p3k6tUHf6/9/FQHgbTWWT4Qsvfnf0+Y4Cej0+unaBRotviYbFL68rfbfbR1RMrLt6XG5gTikMeOzUZOJzaV6i0LHnqoo0cxpF1UeqFuWt/z4QrKrUD8dpfTj0a1nVfpdDMShn31J1TjaE3AssiwQ73qqQbYI7B5TkMFJhy7a48g3HXtDnN9rQndjQuauemOSzFgRXhS3LE9R/NdYavfghjeEuJSqTyb+XVCjfZ6UGmH9Kyk3hkyNxGFrLQ77gc/NqRd9imfNnS+HywyqEX8jwD6TvgexIityoHQGnEszylOSNHFp0d6p286ENRDNkf2OM+yZyQIaUs/1LUkclGG4L5ucivpdPYSr/QwVUH4sbMZwGHviNjtHWuE1muWArmxjxPEyGWAofzHWMT9xR9f+e7mUPgOutEtHcLoPaY1zy5PqhdZtz8gw1SenRRziXiRsWt12FPOou4ntZEE/KMR1yjBtzEOyYVERcHypUYCchxlYdKOWgK605eQGfMsvvzDHZc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(46966006)(36840700001)(30864003)(70586007)(6512007)(26005)(966005)(8936002)(316002)(47076005)(5660300002)(81166007)(54906003)(6506007)(2906002)(186003)(356005)(2616005)(83380400001)(336012)(86362001)(70206006)(53546011)(4326008)(8676002)(82740400003)(478600001)(6486002)(107886003)(82310400003)(33656002)(36756003)(36860700001)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 07:40:22.9935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a3ffbd-37d7-4a1d-f128-08d8ff188fda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3182
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CC009C73135B814292F3C2B9F3BE6624@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

> On 14 Apr 2021, at 06:13, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Apr 13, 2021 at 6:24 AM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
>>
>> Hi,
>>
>>> On 13 Apr 2021, at 13:51, Bruce Ashfield via lists.yoctoproject.org <b=
ruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>
>>> On Tue, Apr 13, 2021 at 3:50 AM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>>
>>>> Hi Christopher,
>>>>
>>>>> On 13 Apr 2021, at 04:09, Christopher Clark via lists.yoctoproject.o=
rg <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>
>>>>> Update the git recipes revision to the recent master branch point fo=
r
>>>>> starting 4.16 development.
>>>>>
>>>>> Remove the xen-tools python patch for 4.14.
>>>>
>>>> I do not think the 4.14 recipe should be removed as we decided a whil=
e ago that we should
>>>> always have a recipe for:
>>>> - current release - 1
>>>> - current release
>>>> - master
>>>
>>> I recall the discussion, but can't find my mailing list archive of it.
>>> If anyone has a pointer, I need to refresh my memory. See below for
>>> why.
>>
>> After a discussion on IRC, we agreed with Bruce that the scheme that
>> was decided last year was to have 2 versions + master so that we try
>> not to break backward compatibility and give time for people to update.
>
> Hi all, sorry for causing the surprise and thanks for the engagement
> with this. As you might imagine from my posting of the uprev patch, I
> didn't end up with quite the same understanding of the discussion but
> I agree with the proposed path forward.
>
>> Here as we are really near the release we should:
>> - add 4.15 recipe and bump master one
>> - keep 4.14 recipe and set PREFERRED_VERSION to 4.14
>>
>> After branching hardknott we can change the preferred version
>> to 4.15 on master
>
> Agreed.
>
>> Also we need to put the outcome of our discussion that was written
>> on wire inside a README file inside the Xen directory.
>
> Yes - I agree.
>
>> @Christopher please confirm you agree with that and tell me if you
>> want help to do it (as I do have in fact a patch available internally t=
o
>> do just that).
>>
>> I have no access anymore to the wire discussion so one of you Bruce
>> or Christopher will need to push the README file :-)
>
> I can do this. We're going to need to update it slightly, following
> the discussion on this thread. Below is the section that we had
> regarding Xen version uprev. In current context for reading below, the
> latest stable version of Xen is now 4.15.
>
> -----
> # Xen version update
>
> The following rules shall be followed to define which version of Xen has=
 a
> recipe in meta-virtualization:
>
> - Before a Yocto release meta-virtualization shall have a recipe for the=
 latest
>  stable version of Xen and for master version of Xen (known as git recip=
e)
>
> - On Yocto LTS and the latest stable Yocto release branch, the Xen major=
 version
>  that is present when the Yocto release is issued must stay supported an=
d
>  the recipe shall be regularly updated to follow updates available in th=
e
>  Xen stable branch for that Xen major release.
>
> - On Yocto LTS and the latest stable Yocto release branch, new Xen recip=
es
>  shall be added when there is a new Xen major release.
>
>    - The preferred version of the Xen recipe shall always stay at the sa=
me Xen
>      major version once a Yocto release has been issued, and it shall re=
ceive
>      regular updates to track the stable Xen branch of that Xen release.
>
>    - When a new Xen recipe is added to a Yocto branch for a new Xen
> major version,
>      then any older Xen recipe present, except for the original
> preferred version recipe,
>      shall be marked as not updated anymore by adding a comment
> inside the recipe.
>      This recipe will not receive any build tests or be updated to
> follow the Xen branch.
> -----
>
> The new development from this thread, to amend the above process, is
> when Xen issues a release in close proximity to a Yocto release, the
> prior stable major version of Xen (ie. 4.14 here) may remain the
> preferred version for the Yocto release, so will have a recipe present
> and set as preferred, alongside the recipe for the current stable
> release.

Yes I agree with this formulation.

It makes sense to put it in the README and not treat it as an exception
as Xen release frequency is every 9 month so we will have this issue
every 2 Xen releases :-).

>
> I'll respin my patches.
>

I will review and test them once you have sent.

Thanks
Regards
Bertrand

> thanks
>
> Christopher
>
>
>>
>> Cheers
>> Bertrand
>>
>>>
>>>>
>>>> More then that we have very near Hardknott release and meta-virtualiz=
ation was not branched
>>>> so this is a really bad idea to do a version bump right now.
>>>>
>>>
>>> I won't actually branch and declare meta-virt released for a couple of
>>> weeks after the Yocto release. It takes a bit of time for retesting
>>> and final stabilization. So there is some time, but yes, I'm not
>>> really doing much for uprev's that will land in the release (I have
>>> about 15 uprevs done locally as well that I'm deciding on). I can
>>> either run a master-next for a bit, or I'll branch earlier, if we have
>>> some changes that are better in tree.
>>>
>>>> I would suggest to:
>>>> - add recipes for Xen and Xen-tools 4.15
>>>> - set preferred version to 4.14
>>>
>>> From the Xen release pages I just read, there isn't a LTS release, is
>>> there ? (or did I miss it ?).
>>>
>>> Without a LTS, I'd hesitate to support the three versions when we get
>>> into a timing issue like this (it hits me all the time with the kernel
>>> in oe-core). We only do that with the kernel in a given release due to
>>> LTS support. Otherwise, it would just be two: A tagged release +
>>> latest.
>>>
>>> If 4.15 is not the preferred version, I'd prefer it to not be in the
>>> release at all, since it won't get much testing. If someone wants it,
>>> I'd just point them at master.
>>>
>>> So my summary is, we can keep the three versions, but I'd suggest that
>>> 4.15 never lands in the hardknott branch, and only master.  And for
>>> the fall, we'd have 4.15 + 4.16 + the git recipe for the latest. In
>>> that latter case, the patch as it stands is close to ok for master,
>>> and I'll just never put it into the hardknott branch.
>>>
>>> Also, feel free to drop by #meta-virt to discuss more interactively.
>>>
>>> Bruce
>>>
>>>>
>>>> and after branching change the preferred version to 4.15 on master.
>>>>
>>>> What do you think ?
>>>>
>>>> Regards
>>>> Bertrand
>>>>
>>>>>
>>>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>>>> ---
>>>>> ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch | 66 -----------------=
--
>>>>> .../{xen-tools_4.14.bb =3D> xen-tools_4.15.bb}  |  6 +-
>>>>> recipes-extended/xen/xen-tools_git.bb         |  4 +-
>>>>> .../xen/{xen_4.14.bb =3D> xen_4.15.bb}          |  4 +-
>>>>> recipes-extended/xen/xen_git.bb               |  4 +-
>>>>> 5 files changed, 9 insertions(+), 75 deletions(-)
>>>>> delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pas=
s-DISTUTILS-xen-4.14.patch
>>>>> rename recipes-extended/xen/{xen-tools_4.14.bb =3D> xen-tools_4.15.b=
b} (68%)
>>>>> rename recipes-extended/xen/{xen_4.14.bb =3D> xen_4.15.bb} (85%)
>>>>>
>>>>> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DIST=
UTILS-xen-4.14.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-D=
ISTUTILS-xen-4.14.patch
>>>>> deleted file mode 100644
>>>>> index f0688fd..0000000
>>>>> --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-x=
en-4.14.patch
>>>>> +++ /dev/null
>>>>> @@ -1,66 +0,0 @@
>>>>> -From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 2=
001
>>>>> -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>>>> -Date: Fri, 19 Oct 2018 11:01:37 +0200
>>>>> -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py=
 args
>>>>> -
>>>>> -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
>>>>> -as well as other parameters set by the OpenEmbedded build system.
>>>>> -This is especially useful when the target libdir is not the default=
 one
>>>>> -(/usr/lib), but for example /usr/lib64.
>>>>> -
>>>>> -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>>>> -
>>>>> -Forward-ported to Xen 4.12.0
>>>>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com=
>
>>>>> -
>>>>> -Modified to support pygrub installation with python 3
>>>>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com=
>
>>>>> -
>>>>> -Forward-ported to Xen 4.14.0
>>>>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com=
>
>>>>> -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
>>>>> -index 3063c49..513314b 100644
>>>>> ---- a/tools/pygrub/Makefile
>>>>> -+++ b/tools/pygrub/Makefile
>>>>> -@@ -10,14 +10,17 @@ INSTALL_LOG =3D build/installed_files.txt
>>>>> - all: build
>>>>> - .PHONY: build
>>>>> - build:
>>>>> --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(P=
YTHON) setup.py build
>>>>> -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(P=
YTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
>>>>> -
>>>>> - .PHONY: install
>>>>> - install: all
>>>>> - $(INSTALL_DIR) $(DESTDIR)/$(bindir)
>>>>> - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(P=
YTHON) \
>>>>> - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>>>>> -- --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
>>>>> -+ --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force =
\
>>>>> -+ $(DISTUTILS_INSTALL_ARGS)
>>>>> -+rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>>>>> -+$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>>>>> - set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
>>>>> -              "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
>>>>> -              "`readlink -f $(LIBEXEC_BIN)`" ]; then \
>>>>> -diff --git a/tools/python/Makefile b/tools/python/Makefile
>>>>> -index 541858e..4d4a344 100644
>>>>> ---- a/tools/python/Makefile
>>>>> -+++ b/tools/python/Makefile
>>>>> -@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
>>>>> -
>>>>> - .PHONY: build
>>>>> - build:
>>>>> --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build
>>>>> -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build $(DI=
STUTILS_BUILD_ARGS)
>>>>> -
>>>>> - .PHONY: install
>>>>> - install:
>>>>> -@@ -18,7 +18,7 @@ install:
>>>>> -
>>>>> - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(P=
YTHON) \
>>>>> - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>>>>> ----root=3D"$(DESTDIR)" --force
>>>>> -+--root=3D"$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
>>>>> -
>>>>> - $(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(L=
IBEXEC_BIN)
>>>>> - $(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXE=
C_BIN)
>>>>> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extend=
ed/xen/xen-tools_4.15.bb
>>>>> similarity index 68%
>>>>> rename from recipes-extended/xen/xen-tools_4.14.bb
>>>>> rename to recipes-extended/xen/xen-tools_4.15.bb
>>>>> index a79b41d..314dc52 100644
>>>>> --- a/recipes-extended/xen/xen-tools_4.14.bb
>>>>> +++ b/recipes-extended/xen/xen-tools_4.15.bb
>>>>> @@ -1,11 +1,11 @@
>>>>> -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>>>>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
>>>>>
>>>>> -XEN_REL ?=3D "4.14"
>>>>> +XEN_REL ?=3D "4.15"
>>>>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>>>>>
>>>>> SRC_URI =3D " \
>>>>>   git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>>>>> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>>>>> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>>>>>   "
>>>>>
>>>>> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b450133=
8e44a4e5"
>>>>> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extende=
d/xen/xen-tools_git.bb
>>>>> index 71850ee..0188bdd 100644
>>>>> --- a/recipes-extended/xen/xen-tools_git.bb
>>>>> +++ b/recipes-extended/xen/xen-tools_git.bb
>>>>> @@ -1,6 +1,6 @@
>>>>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>>>>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>>>>>
>>>>> -XEN_REL ?=3D "4.15"
>>>>> +XEN_REL ?=3D "4.16"
>>>>> XEN_BRANCH ?=3D "master"
>>>>>
>>>>> SRC_URI =3D " \
>>>>> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen=
/xen_4.15.bb
>>>>> similarity index 85%
>>>>> rename from recipes-extended/xen/xen_4.14.bb
>>>>> rename to recipes-extended/xen/xen_4.15.bb
>>>>> index 653e3b6..2842c0a 100644
>>>>> --- a/recipes-extended/xen/xen_4.14.bb
>>>>> +++ b/recipes-extended/xen/xen_4.15.bb
>>>>> @@ -1,6 +1,6 @@
>>>>> -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>>>>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
>>>>>
>>>>> -XEN_REL ?=3D "4.14"
>>>>> +XEN_REL ?=3D "4.15"
>>>>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>>>>>
>>>>> SRC_URI =3D " \
>>>>> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/=
xen_git.bb
>>>>> index 2b62c5c..eaf3956 100644
>>>>> --- a/recipes-extended/xen/xen_git.bb
>>>>> +++ b/recipes-extended/xen/xen_git.bb
>>>>> @@ -1,6 +1,6 @@
>>>>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>>>>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>>>>>
>>>>> -XEN_REL ?=3D "4.15"
>>>>> +XEN_REL ?=3D "4.16"
>>>>> XEN_BRANCH ?=3D "master"
>>>>>
>>>>> SRC_URI =3D " \
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>> IMPORTANT NOTICE: The contents of this email and any attachments are =
confidential and may also be privileged. If you are not the intended recipi=
ent, please notify the sender immediately and do not disclose the contents =
to any other person, use it for any purpose, or store or copy the informati=
on in any medium. Thank you.
>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
>>
>>
>>
>
>=20

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
