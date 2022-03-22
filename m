Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747B5C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:59:07 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.88])
 by mx.groups.io with SMTP id smtpd.web11.9596.1647953945242051887
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 05:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=pbOYySpZ;
 spf=pass (domain: arm.com, ip: 40.107.3.88,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s85CPQ0kLL1D68U0qOgSuo9tDSAtPBcLLOPNLlX3/5o=;
 b=pbOYySpZ6Y19s/D+mapXhUoqaHs6cwC69GFjMhiaI3Hz0UdegLV7MsvdLIdWH0vsLGD3G32/WHoheuM3wXvNhfxff/hwpDlU9fk9b8yFYhY3QGbjv7hHxRh8CnppGTnDFN75kIA9r/QdCipUh08TEBBCWudMgx29T3VEJ3Y5aJg=
Received: from AM5P194CA0021.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::31)
 by AS8PR08MB6824.eurprd08.prod.outlook.com (2603:10a6:20b:39a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 12:59:00 +0000
Received: from AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::a7) by AM5P194CA0021.outlook.office365.com
 (2603:10a6:203:8f::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Tue, 22 Mar 2022 12:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT008.mail.protection.outlook.com (10.152.16.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Tue, 22 Mar 2022 12:59:00 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Tue, 22 Mar 2022 12:59:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 717a8479dd890f12
X-CR-MTA-TID: 64aa7808
Received: from b79f77af153b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E336145A-F4CA-4898-B6E2-53827C404DAC.1;
	Tue, 22 Mar 2022 12:58:53 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b79f77af153b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 22 Mar 2022 12:58:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgRpWtFHZA6W76tsYlNjo/9JChNa5GU4HqSSxPBujXn7wus1A6YtQr9xsS1/NktShvlqNxeEvviTY2WBWcEfJJR/3GVIGb6KwV6YRnouS+xIOgZH4uADxt4/Jzy6fN/y5Ll5ojeNytJCTGWbsbklLwn77soNCYyS2v0buZJSCTlKUJeB/AqZuvolGWiQ/p+hlGI2ulgw61emmQfa7Hv8xdM+xnZA3MbI3i7LsS8beMtGXhXDTDeVGtBOi8P6Eg1uk0asJf2vwhmNYI7YAqcCuAZSEbnVUZ9JYdpTpMcSaWoR0a/umSrEscNV/HTbyTBCxe3vZLQxdNAiOnqWJFGNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s85CPQ0kLL1D68U0qOgSuo9tDSAtPBcLLOPNLlX3/5o=;
 b=VZxjDQLKgJ9dj3M8iUbRtJkKmvGUHSmFN0+Bg3heuWCCnaHv5W/aDfKQYOGDpGNyRI/g5+qniQJJ9GUMcVTjgx/tjqtCjXyt9lEbYSseeIV2B4jaWESor5CMtDwSiIWOSO9dv3y6WR7V6MyMRM4NYghxI4HNZkcBvWMPawUscR4lzJUy3nHrl/jkoVJ66veCExkiR/QZ2ol1PnpSU9EcBvmznCxW+flgDCUlpGm0RRBRWrv1Oi2lHY29P9JkxlZnO9Gl9v1wTjKENlx/Rutm+o9FuJtNmqTxprR/OKbyUVTMFNT0VZN2DFE4Lu6jkipdT0JDpP95N5qmpR2HyssRmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s85CPQ0kLL1D68U0qOgSuo9tDSAtPBcLLOPNLlX3/5o=;
 b=pbOYySpZ6Y19s/D+mapXhUoqaHs6cwC69GFjMhiaI3Hz0UdegLV7MsvdLIdWH0vsLGD3G32/WHoheuM3wXvNhfxff/hwpDlU9fk9b8yFYhY3QGbjv7hHxRh8CnppGTnDFN75kIA9r/QdCipUh08TEBBCWudMgx29T3VEJ3Y5aJg=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6395.eurprd08.prod.outlook.com (2603:10a6:10:254::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 12:58:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 12:58:51 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Paulo Sherring <pauloasherring@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Topic: [meta-virtualization] Loading the module xen-gntdev on boot
Thread-Index: AQHYPdhS69dDmEOgMUyYUvghdSytY6zLN9uAgAAFYICAABeWAIAAAxMAgAAFkQA=
Date: Tue, 22 Mar 2022 12:58:51 +0000
Message-ID: <D673A4B9-BB22-41AA-A13C-E19F1EC52BCF@arm.com>
References: 
 <CAG9RwPKYyH0QQGoN3E+x_J66C1jsNdNm3CbfBAJHO=U24QXC3Q@mail.gmail.com>
 <3336072A-2629-42A6-AB37-5999A2098157@arm.com>
 <CAG9RwPKUk+cY4wOStyFqHchmm9vJYrFZxtjpC0V9iwrQ+9XdYw@mail.gmail.com>
 <E80D57C8-590D-4B2C-9A6A-5C4F5BEEA24E@arm.com>
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
In-Reply-To: 
 <CAG9RwPL2adysD-Wyu7eN2jmo85b-Ufx6TWoSe82dJ-XQRr02EQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b515ba24-db23-4e71-0579-08da0c03bbf4
x-ms-traffictypediagnostic: 
	DB9PR08MB6395:EE_|AM5EUR03FT008:EE_|AS8PR08MB6824:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB682483E967B7548A03F21A729D179@AS8PR08MB6824.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 qaqHAkykNLGgaXKstavoEW0vaNMFXvPjvpG+h+JtlLLx9jX74CygSiFc7GTXp0fO8GYdpXRlnRxqPGp77G645qkNTerkIowJJ9UDRofgqdgyquTk/vt2NPF+g00LoLTn5UXaO/I1d+MFuvFlDmaxKfNKBZDTuM24EZ57Dtpvn/O//IIuFFHRiI/JD0NSZopn/49q6uxYUQJK/VeamNv2IJRbVNd2r9E1pTmhc9N8yMCAxtKlNGAoEqAMTCOqXw8bpUXArbDmcjGy/8BH3XutjslpU9OMecBK4cbHetWr9SAXXp5GZbdhaNDgMs+uMnUbosZzUPhIymyj5PAzMxSjP6rlxnZMvTcEEZmhSXwzYnoh6s5UpuwP9e3I5ez62wK+GzjZZBQ0tQn0dBJyqVNQB5O/omAj2iLc1Pc7heGEpdDjE9hfGYlKm6yQpnGx4SpBw7userDZLsBehFt2HAfkHl5w+dVycmo7m3z3cMq0nPNhww+sAfkeqFeNB235z4yUSeud+Of9QPKwrDdeCuJdufW+3KYr4/NT9vhuHP3kR4zKsoTwofC2i21biKvQprK019lV8nKBWC8azKam8EC2LMN0qYA5vMuKYa4nOvLMXNT4dHuTFSkhbGaJ0jw/sgwfi++5HmvMTKlULWxk8LgYsXzoPAVC/CnjPuwj5D4kW4qoC6KAZ6t9bC3WDMnCx2IfZhtKpDiXDhiWRzKFpFcHa29cjpupeEa3JKNlUllPtlHChZ4sC/mj29p65lNKuEPk
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(86362001)(2906002)(71200400001)(122000001)(508600001)(91956017)(66946007)(76116006)(33656002)(6486002)(66476007)(66446008)(64756008)(66556008)(8676002)(4326008)(316002)(5660300002)(38070700005)(8936002)(54906003)(2616005)(186003)(26005)(6916009)(53546011)(36756003)(6506007)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <07D04805E175D742BFC803087FCF27BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6395
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	18c0e678-1a06-4598-e5f5-08da0c03b698
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x8338pHEQ9khii665Spzmtn+iTBOIAcdJFKC19p1lWkNDw8KTT8P7Dr0z16buaf6swpJbtb2gCFr9Uu3aGB+R4tPjuPbgJr+NxvvhZPaaSMbbIJogrbDI+3AfIWpPiUsyM9ommTG3D2t260edROvno1lh/oqJ6nfdn05/sBRARZp4FApMOUkJjgBx6oJRqgT1r4yXOJ7pLpnezgO7i6vByYXzevLnLQ0hiokB0bkbMwvNxSiYEMw/6jBLyTuIDAd8q5tFCM7qwQeMEi/7WOQqI5Ix3gaftBejhdGbbDWSRrZs3MkGlG3wnqB+B9kpwbnq0EHDXwVwv4YTQHAkCQYXceZUGZVsMdYGupdTBKYHmaULsqOUhLK99Yv+pUuRIstfBn3qQn/P695L+tdlwmJMxyIEbclVIHps5y0mK1NIBVLMSL1+LgM1QkgW+OQ9DVjKdrC52O5TQbyL8jCqtaHMjWfizlrloJS0jk/UpfIj3qd1OfAJzLOZ4ILp8RZoZPs7JOrDg9nX3cRYI5LHWRR1yF6IxOugaP1uNeehaA1SS4s+fRat3NOadke+SJM6EghhQyFE8H57xrpATwzZTNIfPC12ztmU2WbkR6wX6C+GbRp0AckNfF7RrGDr8uZd3li+BkAx2c+iklwyXOE/qtYXmqEjTQRK7hbHYf9+T/kaAUb7gzYsQeFHe1w74yCneN+
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(6506007)(6512007)(54906003)(316002)(40460700003)(53546011)(36756003)(336012)(107886003)(2616005)(186003)(2906002)(47076005)(33656002)(82310400004)(26005)(5660300002)(36860700001)(86362001)(70206006)(8676002)(8936002)(70586007)(6862004)(4326008)(81166007)(508600001)(6486002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 12:59:00.3332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b515ba24-db23-4e71-0579-08da0c03bbf4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6824
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Mar 2022 12:59:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7099

Hi Paulo,

> On 22 Mar 2022, at 13:38, Paulo Sherring <pauloasherring@gmail.com> wrote=
:
>=20
> Hello Bertrand,
>=20
> On Tue, Mar 22, 2022 at 12:28 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Paulo,
>>=20
>> Please always keep the mailing list in as me asking the questions does n=
ot mean I will necessarily be the one working on this.
>>=20
> Oops, my mistake, sorry.
>=20
>> Please see some questions here after.
>>=20
>>> On 22 Mar 2022, at 12:03, Paulo Sherring <pauloasherring@gmail.com> wro=
te:
>>>=20
>>> Hello Bertrand,
>>>=20
>>> On Tue, Mar 22, 2022 at 10:44 AM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>>=20
>>>> Hi Paulo,
>>>>=20
>>>>> On 22 Mar 2022, at 11:33, Paulo Sherring via lists.yoctoproject.org <=
pauloasherring=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>=20
>>>>> Hello all,
>>>>> I am a bit new to meta-virtualization and to the Xen project And to
>>>>> virtualizations, so please bear with me :)
>>>>> I've been trying to make use of the xen project, currently targeting
>>>>> qemu (and later on, rpi4). After messing around, I was able to boot
>>>>> dom0 and a domU.
>>>>> But, I had to add the xen-gntdev to the `modules-load.d,` because
>>>>> `xenstored` was failing to start, due to some missing connection,
>>>>> probably brought up by xen-gntdev module.
>>>>>=20
>>>>> As I am new to all this, I was just wondering if this is by design, o=
r
>>>>> this is an issue (and therefore, I should/could submit a patch).
>>>>=20
>>>> No problem at all and thanks a lot for the feedback.
>>>> This should not happen and should be fixed.
>>>>=20
>>>> Could you tell us what you are building (which image) and what paramet=
ers did you set in your local.conf ?
>>>>=20
>>>=20
>>> - Baseline is hardknott.
>>=20
>> Any reason not to use honester ?
>>=20
> The main reason was that hardknott is tagged as a stable release and
> it already includes xen 4.14 or latest (it is actually pulling 4.16),
> which I wanted/will need for RPi4 support.

Hardknott is long term while honister is not but both are stable releases.

I am not quite sure I get your 4.14 pulling 4.16. The 4.14 recipe is buildi=
ng the latest 4.14 version of Xen.

From what I see modules to load are in a xen.conf in modules-load.d generat=
ed by Xen tools compilation.
Gntdev is properly listed in the current xen source tree as one of the defa=
ult modules to actually load on boot.

Can you check the content of modules-load.d/xen.conf (somewhere in /etc in =
your dom0 roots) ?

It could be that this was actually missing in the xen release you are build=
ing or that systemd is not actually loading modules listed there.

Cheers
Bertrand


