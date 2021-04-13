Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.78])
 by mx.groups.io with SMTP id smtpd.web09.9130.1618320289982981483
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 06:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wt7R7kTt;
 spf=pass (domain: arm.com, ip: 40.107.7.78, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj+obQQamYSl+yYZZZNPKuPE1JiIrvUxrrOuD93mz5E=;
 b=wt7R7kTt+rvicdzUdwzTOT43QhYxfLnSNQd55bwKUFT9MmtnSEvDbgIUir/RrP03Xa+h/ijqL9GddlfMR4fwjZHP9F/jKlpEvZ64tOrX9/r2M25uMnnb4VxFphcz/VRDR4Tm9aesp53YP89OXaLiHwMl2ExyDC+SaNOes4wYsJY=
Received: from AS8PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:20b:310::15)
 by PR3PR08MB5658.eurprd08.prod.outlook.com (2603:10a6:102:88::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Tue, 13 Apr
 2021 13:24:47 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::c6) by AS8PR04CA0010.outlook.office365.com
 (2603:10a6:20b:310::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Tue, 13 Apr 2021 13:24:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Tue, 13 Apr 2021 13:24:46 +0000
Received: ("Tessian outbound 81a4524e9a48:v90"); Tue, 13 Apr 2021 13:24:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7771a97ad742ec5
X-CR-MTA-TID: 64aa7808
Received: from 8fda958a2c8b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 544D3E99-3796-4FD8-9DA4-EDA9676EA7A1.1;
	Tue, 13 Apr 2021 13:24:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8fda958a2c8b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Apr 2021 13:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REn2PaSP2/kyxtnIOTINT7Z7DxPDsBDWwMchxQvQ6RUh7RdNk+OSi+fclfZWMrgxJ0k4VRbbeZQ4BgRzNOy+0XYjfLWEVFftvKPDT4ussSTtsBgFBKSJyHduu3WfEaKjXhJOYDrpm2BvERxurlpMlssz+TPKb0iZrObe+rGth/3b5TH0+FYYWiWPOCtKPa4AZ6p1ehtQPduCmrAP96gIT8K+/gvrwCTvozBu5/TEIj9Lbx7F+qUNvIt/Rboz2twJ60cxiS043iys6LC3euYiSM1FDzxFzNuJvQu9PxkqL8g6VCgKs99JVqOx5dfVtuLSpJG4Sp+8Ch45Fua9ngq7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj+obQQamYSl+yYZZZNPKuPE1JiIrvUxrrOuD93mz5E=;
 b=WP3xAPopC80cxXotLlFH6tluxz59U19y939h2hm2Y5cnF57q4fTvkKvbpt86uF4BLkFF9CcBWtIDTUBHZgGtjrxaZbH8jyJSmRYKf2rh+JkUYRlQ7YlKRXT7UFLfQ7JW59Qd9z/O6gv/OqDIaqiDKb+nn1aSo0dXiFLHN+WvnD3h0NxYq390T2THkVavRKa3k14OYUTxhrhvVob0b7j3Ozi7A9g56q4MubMVcXP2+2T5FxHPaUFPhStLIE5IcIZ2kiloJTbBIQ/b0bXJNSi2on8DwH59mqUeCmC6aSkOaA8NRX+J8PLNL5Gb+NuOSWGigdqaoCcOAtjvk9j6+1tEyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kj+obQQamYSl+yYZZZNPKuPE1JiIrvUxrrOuD93mz5E=;
 b=wt7R7kTt+rvicdzUdwzTOT43QhYxfLnSNQd55bwKUFT9MmtnSEvDbgIUir/RrP03Xa+h/ijqL9GddlfMR4fwjZHP9F/jKlpEvZ64tOrX9/r2M25uMnnb4VxFphcz/VRDR4Tm9aesp53YP89OXaLiHwMl2ExyDC+SaNOes4wYsJY=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4448.eurprd08.prod.outlook.com (2603:10a6:803:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Tue, 13 Apr
 2021 13:24:31 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 13:24:31 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>
Subject: Re: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version to latest 4.15
Thread-Topic: [meta-virtualization][PATCH 2/2] xen, xen-tools: upgrade version
 to latest 4.15
Thread-Index: AQHXMBKVR5EKKwZOykK2Tv6PZF+IIKqyExiAgABUFACAAAlYgA==
Date: Tue, 13 Apr 2021 13:24:30 +0000
Message-ID: <769FCB21-E735-4C21-83EC-5CDA3B423F98@arm.com>
References: <20210413030951.40543-1-christopher.w.clark@gmail.com>
 <20210413030951.40543-2-christopher.w.clark@gmail.com>
 <5FD7ADC9-C018-4400-B51A-40C14618BB91@arm.com>
 <CADkTA4ObusWLZzRwUm3K+V_AiuCNrear=y_GJ43MqGOZcw-=_w@mail.gmail.com>
In-Reply-To: 
 <CADkTA4ObusWLZzRwUm3K+V_AiuCNrear=y_GJ43MqGOZcw-=_w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.118]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: dfb53966-6417-4333-7561-08d8fe7f8202
x-ms-traffictypediagnostic: VI1PR08MB4448:|PR3PR08MB5658:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB5658FD690A51D3672B8F73999D4F9@PR3PR08MB5658.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kiE3nU9P65jPV6N/GAorJa+pUChvkvlRpt/WWq7ro7YRVJLbZYzeIEqUSl+OX5sJygbwC818p8AmAJ87F9qX/upGCxFWylhPGXkW1uVX+H5hjsU9BEjySdKfwR/BYRGNQeIQ8SivtpMR/V76yKfyBUN/S7TxQP+iWbhgIHLTo2Fe5qLp9509WTPRpdqX2miReNwY6Dle+jpVyjLYGODpsMhx0AMin7/WO63x02BFaC3xlKOhySTYfOowIB098AF/D9L64l8wR80PIGpqNTWFTulS7a+6MQFvB8QRz11dN90He8Qp4Lqer6obL58dNiQSJMDG3DAzpReZHksmfzq1MXW3cBqeX/X+yR6Io5fnda2KWq+l3OXH+sMl2syFpb9SQc8fGvuX3CdOg7XPe0h1+TCdgfxLxvqSdAzG0TQoxqQQtBUM1EIfUsDePr+Jyjs18O7oQSRgFx0i/9t7ejAH3rL4oaysPeeNROD5ancicG9t9LqAUwAHVyyBzEA2gKPp1epNwimNn5IQ36CNfzT6q80toXIetqbxAB9cPvrGhMzKouDdY/Q+yqZQg7umJofMaJ33tgwfTY+2M3Fa5gOT+Bo2NN8OSNlOoOd3mchkUiTkgWZv7jcLk4xSB1zywBKis9fzC0oJckzXKEiONDdg882V6uAYTem0JHw9+6o8m0xC0Dugzt4dzguz7AK/26HME/Zuw1uAUIRY2B5ujxTPd0Pj4OMkttOk+65wmECr6Mk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(66476007)(66556008)(64756008)(66446008)(83380400001)(6486002)(71200400001)(316002)(8676002)(54906003)(66946007)(6512007)(86362001)(478600001)(8936002)(966005)(91956017)(33656002)(6506007)(30864003)(6916009)(53546011)(2616005)(186003)(5660300002)(76116006)(2906002)(38100700002)(122000001)(36756003)(26005)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?8lQ3b8N+imeAkn90eeZw8dnp2THEV1Jqi/+1tm+5+vYAuEBrWzzHED65hQs1?=
 =?us-ascii?Q?OEr4U4f7wr3W//DuVnM7PS9iZ1mLO13ATS+jW9rie9rt9xqDyHEhNIpyvdow?=
 =?us-ascii?Q?3UijzugibIN5LUahY6NdPrrX6A9YRd408V1D6c8yjC9arSpMbKFecRJKAL14?=
 =?us-ascii?Q?80l6WT/JuGnfrQlSPUaOoeg96xHz04z8pWXBW6M5f2UdR5uHnZOM3s5B/hXm?=
 =?us-ascii?Q?pvdoYx0aRtfvp3gBxrPFlyzI6RMuUkA6eQNvzjNTANanysb/iwohCYEGIpsj?=
 =?us-ascii?Q?BwsVdQ2BefpfKmi3MyCTZjYTVcOdPAEDBSOKcAtBpaIz9x/JzMZFIjlNBYTr?=
 =?us-ascii?Q?qh21c7kpxSBILbQycruc+4IbSeooiKogmSSozqy96a4dwQqwecMdmmN15KoA?=
 =?us-ascii?Q?oAjwG75h1k9BddjmB59sgiMYMk3gF43g8bw+sDFXSpF3YU4okefs3CCegTh6?=
 =?us-ascii?Q?tWzsRTc63tUjyH1DR3McaqVi89QZ0cznPb6VthS0PWnqDMsv3k440cWgmC6O?=
 =?us-ascii?Q?5ZiB4P6uGo7gBm+GUdnjO91d0BRSFFvwKtRhJRtEANzu4DLNX0QDhvNjuWGs?=
 =?us-ascii?Q?I+/kMpFAxxhpNAMEWQk74Rsa8ItfCxGECEEKp6+IJQy69loyuyo+gg6jCVwT?=
 =?us-ascii?Q?sckj8eom4kjNURRm2B6NQOqx8/hwy6Byk6iezPFp8v3XdV1Rt2XptGjpYJu8?=
 =?us-ascii?Q?KlYeRQjZ9FUisJMaYbEhBi+mQmA5lFvzaSD/f7OMUiK4UfLcMo/I50D48dIE?=
 =?us-ascii?Q?QZDe+5wWGnktntr3V86tLxY3/akTTHWidsaNx2/D4Pre0evtSm8WrLJZ2eNU?=
 =?us-ascii?Q?xeU+LiyD/1ExvHI0nj0+DutWts0c2pEUSbCh8pEYgedWfUsxplMHt17edG+8?=
 =?us-ascii?Q?tmRGoKc147RhTKvCnIOH1qZ6FoatQ06FdLHjYVnO/CC85HlGS0vNzsut04G2?=
 =?us-ascii?Q?ZrYjZgI4keQCr123N7BUIa9E+QrpbC4ak0tXHl3aoQ5Gomc+qppw40UrtfTD?=
 =?us-ascii?Q?dhuCrwY8/+0DnhoykrhY+zKNJt83VGrl2kYoREreYlJ7b5fjgKYNshYh+4N1?=
 =?us-ascii?Q?pNwifguKmn0/MThQUPyKalg+WEQhK14feP0Wdq/VTMbqIHrpgMPYJJM65d4B?=
 =?us-ascii?Q?IToNOyMdSCwJOdNgy0ZqYFGcVIuntVAP9nzBTTx/N5MmEaZnT6O0Gke7Iole?=
 =?us-ascii?Q?bdYRWT0TDvg7xi3f3R/aI+XPlqUOmu5cCYxUpBwoGBScM81yi6ch4sOrgAX/?=
 =?us-ascii?Q?L6DhTKF8Bs50ouKSAnrGCH65eFy76SAVDTt/RzTfjRDKSWKnN8FDr62ZLCQd?=
 =?us-ascii?Q?o9d8KnTWuPi1M+L4MMI3t/yE?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4448
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1532151a-6835-4912-450a-08d8fe7f78b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zHWAd8JNumqtLT7LE0Z655O9DZB7lTd7DNYNnLg3MW68oQj2qSdkyHFyBf3AL+g9vPsfP8aDGKi7wmRh+7qlOkd613C32PvXdN4IcB5Arx/NdSeCKigumAsfQNw5kQ5tNTLfUvQJ17G7Rs1PwrbGN4qh//hpeCqXdGsLre5gnlcYOfnVn+sM6VpdAh1xE5MhsLh0Ap0JsdnxF0ZmH/n4XnLKFyZWI6PlSgOIJLLhW7wIOWBCymoAB5fmtLP+uUO6aW/kaJENGRs+p7zIiBtXLAhceuVCrxM8ynJC4WDX/l8QpW14mNCjhO3U+Tu5DPHaq+v+FhjxM8Q7Lfc/boXYSmNSCPlLbbDLe8MU6C1zifKOfsqS1bL3x9p00tS0swK/ugbixszIMdalkQe6+8zyatKUiiAyGpjPn6UipvrMfX/ofzFLDhFwab7i/Sjsnw8G6RcaCrkwgBeCAAXX7W4RZKOizPXX771+xvktQ/KLxX6xz7szf+HhWQINklnk6Ey4hjfrlL689ec1+/nfodWeuCcNd+MUc9Y1ZBbeDuPWCpKFKcLghajhoI0d9x7DqLmBawbJRxk9gdlyAMqWl8lfmUly+mUh2VJ+0+UNKts4NYOnzCUnhdD1y7jnX9D5abYI7ETOmo3e4TvRpj1Va2ooKnoH32NI3+vaIJRGpEUraFqbUjzmJ3ip+CZ0y3f/71t6gnxLZgCHSBcwp2wR68cPYybXrTpzw8ivW4KSxqamQgc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(46966006)(36840700001)(82310400003)(6512007)(2906002)(26005)(6506007)(356005)(6486002)(186003)(4326008)(53546011)(30864003)(47076005)(316002)(54906003)(83380400001)(8936002)(70206006)(5660300002)(107886003)(336012)(36860700001)(36756003)(82740400003)(86362001)(70586007)(478600001)(2616005)(6862004)(81166007)(33656002)(966005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 13:24:46.7796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb53966-6417-4333-7561-08d8fe7f8202
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5658
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D4029B47225FC49A6C7EF00E72803BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 13 Apr 2021, at 13:51, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Apr 13, 2021 at 3:50 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Christopher,
>>
>>> On 13 Apr 2021, at 04:09, Christopher Clark via lists.yoctoproject.org=
 <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>
>>> Update the git recipes revision to the recent master branch point for
>>> starting 4.16 development.
>>>
>>> Remove the xen-tools python patch for 4.14.
>>
>> I do not think the 4.14 recipe should be removed as we decided a while =
ago that we should
>> always have a recipe for:
>> - current release - 1
>> - current release
>> - master
>
> I recall the discussion, but can't find my mailing list archive of it.
> If anyone has a pointer, I need to refresh my memory. See below for
> why.

After a discussion on IRC, we agreed with Bruce that the scheme that
was decided last year was to have 2 versions + master so that we try
not to break backward compatibility and give time for people to update.

Here as we are really near the release we should:
- add 4.15 recipe and bump master one
- keep 4.14 recipe and set PREFERRED_VERSION to 4.14

After branching hardknott we can change the preferred version
 to 4.15 on master

Also we need to put the outcome of our discussion that was written
on wire inside a README file inside the Xen directory.

@Christopher please confirm you agree with that and tell me if you
want help to do it (as I do have in fact a patch available internally to
do just that).

I have no access anymore to the wire discussion so one of you Bruce
or Christopher will need to push the README file :-)

Cheers
Bertrand

>
>>
>> More then that we have very near Hardknott release and meta-virtualizat=
ion was not branched
>> so this is a really bad idea to do a version bump right now.
>>
>
> I won't actually branch and declare meta-virt released for a couple of
> weeks after the Yocto release. It takes a bit of time for retesting
> and final stabilization. So there is some time, but yes, I'm not
> really doing much for uprev's that will land in the release (I have
> about 15 uprevs done locally as well that I'm deciding on). I can
> either run a master-next for a bit, or I'll branch earlier, if we have
> some changes that are better in tree.
>
>> I would suggest to:
>> - add recipes for Xen and Xen-tools 4.15
>> - set preferred version to 4.14
>
> From the Xen release pages I just read, there isn't a LTS release, is
> there ? (or did I miss it ?).
>
> Without a LTS, I'd hesitate to support the three versions when we get
> into a timing issue like this (it hits me all the time with the kernel
> in oe-core). We only do that with the kernel in a given release due to
> LTS support. Otherwise, it would just be two: A tagged release +
> latest.
>
> If 4.15 is not the preferred version, I'd prefer it to not be in the
> release at all, since it won't get much testing. If someone wants it,
> I'd just point them at master.
>
> So my summary is, we can keep the three versions, but I'd suggest that
> 4.15 never lands in the hardknott branch, and only master.  And for
> the fall, we'd have 4.15 + 4.16 + the git recipe for the latest. In
> that latter case, the patch as it stands is close to ok for master,
> and I'll just never put it into the hardknott branch.
>
> Also, feel free to drop by #meta-virt to discuss more interactively.
>
> Bruce
>
>>
>> and after branching change the preferred version to 4.15 on master.
>>
>> What do you think ?
>>
>> Regards
>> Bertrand
>>
>>>
>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>> ---
>>> ...ython-pygrub-pass-DISTUTILS-xen-4.14.patch | 66 -------------------
>>> .../{xen-tools_4.14.bb =3D> xen-tools_4.15.bb}  |  6 +-
>>> recipes-extended/xen/xen-tools_git.bb         |  4 +-
>>> .../xen/{xen_4.14.bb =3D> xen_4.15.bb}          |  4 +-
>>> recipes-extended/xen/xen_git.bb               |  4 +-
>>> 5 files changed, 9 insertions(+), 75 deletions(-)
>>> delete mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-=
DISTUTILS-xen-4.14.patch
>>> rename recipes-extended/xen/{xen-tools_4.14.bb =3D> xen-tools_4.15.bb}=
 (68%)
>>> rename recipes-extended/xen/{xen_4.14.bb =3D> xen_4.15.bb} (85%)
>>>
>>> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUT=
ILS-xen-4.14.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DIS=
TUTILS-xen-4.14.patch
>>> deleted file mode 100644
>>> index f0688fd..0000000
>>> --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen=
-4.14.patch
>>> +++ /dev/null
>>> @@ -1,66 +0,0 @@
>>> -From d79dcc2002008c58683de82f06c168d6eea57991 Mon Sep 17 00:00:00 200=
1
>>> -From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>> -Date: Fri, 19 Oct 2018 11:01:37 +0200
>>> -Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py a=
rgs
>>> -
>>> -Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
>>> -as well as other parameters set by the OpenEmbedded build system.
>>> -This is especially useful when the target libdir is not the default o=
ne
>>> -(/usr/lib), but for example /usr/lib64.
>>> -
>>> -Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>> -
>>> -Forward-ported to Xen 4.12.0
>>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>>> -
>>> -Modified to support pygrub installation with python 3
>>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>>> -
>>> -Forward-ported to Xen 4.14.0
>>> -Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>>> -diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
>>> -index 3063c49..513314b 100644
>>> ---- a/tools/pygrub/Makefile
>>> -+++ b/tools/pygrub/Makefile
>>> -@@ -10,14 +10,17 @@ INSTALL_LOG =3D build/installed_files.txt
>>> - all: build
>>> - .PHONY: build
>>> - build:
>>> --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYT=
HON) setup.py build
>>> -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYT=
HON) setup.py build $(DISTUTILS_BUILD_ARGS)
>>> -
>>> - .PHONY: install
>>> - install: all
>>> - $(INSTALL_DIR) $(DESTDIR)/$(bindir)
>>> - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYT=
HON) \
>>> - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>>> -- --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force
>>> -+ --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN) --force \
>>> -+ $(DISTUTILS_INSTALL_ARGS)
>>> -+rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>>> -+$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>>> - set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
>>> -              "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
>>> -              "`readlink -f $(LIBEXEC_BIN)`" ]; then \
>>> -diff --git a/tools/python/Makefile b/tools/python/Makefile
>>> -index 541858e..4d4a344 100644
>>> ---- a/tools/python/Makefile
>>> -+++ b/tools/python/Makefile
>>> -@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
>>> -
>>> - .PHONY: build
>>> - build:
>>> --CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build
>>> -+CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" $(PYTHON) setup.py build $(DIST=
UTILS_BUILD_ARGS)
>>> -
>>> - .PHONY: install
>>> - install:
>>> -@@ -18,7 +18,7 @@ install:
>>> -
>>> - CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDFLAGS=3D"$(PY_LDFLAGS)" $(PYT=
HON) \
>>> - setup.py install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>>> ----root=3D"$(DESTDIR)" --force
>>> -+--root=3D"$(DESTDIR)" --force $(DISTUTILS_INSTALL_ARGS)
>>> -
>>> - $(INSTALL_PYTHON_PROG) scripts/convert-legacy-stream $(DESTDIR)$(LIB=
EXEC_BIN)
>>> - $(INSTALL_PYTHON_PROG) scripts/verify-stream-v2 $(DESTDIR)$(LIBEXEC_=
BIN)
>>> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended=
/xen/xen-tools_4.15.bb
>>> similarity index 68%
>>> rename from recipes-extended/xen/xen-tools_4.14.bb
>>> rename to recipes-extended/xen/xen-tools_4.15.bb
>>> index a79b41d..314dc52 100644
>>> --- a/recipes-extended/xen/xen-tools_4.14.bb
>>> +++ b/recipes-extended/xen/xen-tools_4.15.bb
>>> @@ -1,11 +1,11 @@
>>> -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
>>>
>>> -XEN_REL ?=3D "4.14"
>>> +XEN_REL ?=3D "4.15"
>>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>>>
>>> SRC_URI =3D " \
>>>    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>>> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>>> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>>>    "
>>>
>>> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e=
44a4e5"
>>> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/=
xen/xen-tools_git.bb
>>> index 71850ee..0188bdd 100644
>>> --- a/recipes-extended/xen/xen-tools_git.bb
>>> +++ b/recipes-extended/xen/xen-tools_git.bb
>>> @@ -1,6 +1,6 @@
>>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>>>
>>> -XEN_REL ?=3D "4.15"
>>> +XEN_REL ?=3D "4.16"
>>> XEN_BRANCH ?=3D "master"
>>>
>>> SRC_URI =3D " \
>>> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/x=
en_4.15.bb
>>> similarity index 85%
>>> rename from recipes-extended/xen/xen_4.14.bb
>>> rename to recipes-extended/xen/xen_4.15.bb
>>> index 653e3b6..2842c0a 100644
>>> --- a/recipes-extended/xen/xen_4.14.bb
>>> +++ b/recipes-extended/xen/xen_4.15.bb
>>> @@ -1,6 +1,6 @@
>>> -SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>>> +SRCREV ?=3D "e25aa9939ae0cd8317605be3d5c5611b76bc4ab4"
>>>
>>> -XEN_REL ?=3D "4.14"
>>> +XEN_REL ?=3D "4.15"
>>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>>>
>>> SRC_URI =3D " \
>>> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xe=
n_git.bb
>>> index 2b62c5c..eaf3956 100644
>>> --- a/recipes-extended/xen/xen_git.bb
>>> +++ b/recipes-extended/xen/xen_git.bb
>>> @@ -1,6 +1,6 @@
>>> -SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>>> +SRCREV ?=3D "e680cc48b7184d3489873d6776f84ba1fc238ced"
>>>
>>> -XEN_REL ?=3D "4.15"
>>> +XEN_REL ?=3D "4.16"
>>> XEN_BRANCH ?=3D "master"
>>>
>>> SRC_URI =3D " \
>>> --
>>> 2.25.1
>>>
>>>
>>>
>>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
