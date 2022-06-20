Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E19C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 07:34:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.84])
 by mx.groups.io with SMTP id smtpd.web10.27343.1655710447055577834
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jun 2022 00:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=EIt+i3Ln;
 spf=pass (domain: arm.com, ip: 40.107.7.84,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=To/WGQk8MxRFOWF6XAq9iS3rRYtDDntku7h+peC6lQlBeT04D3WLgxcWIWc5rnND9ZDjjMlIbLQsQcp5GM6VnS1aOZJEzVI0ry3UqYlUdSih79x8OatVr31egaDS9VodEGNMoX4iYVGi+HjphJ2pjVv9ESbiQrQqSEH+yLDyXvwzRqPegjAbBDRVPx4W0wEYtM6itMyWa2cH7JDoNHFTJwrCjJq30/HiktTE0Wjiyk2uS0FJufS4SEm4LCetH6iMA3TrpS5ogbYrC4E8z5evE8GGIsQ/broW8y096CrvXfk/ZPS1AbGADk5eDdS9Gbwp3FiqyXRSbmhAaFvs7e6zkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIYvVK1H4Ami31Heae/x7HwdEOCWwecnUk1uhd5VXUM=;
 b=QBsqLwHWt1sKr4szJf4patHJ9wJaCkHbZOHrOZTrlspuXv6C3wSXgJzgkELJWXiHEgjUGRSD6fxbnauKAiu3PnOP0f1XSXCi5IZt7pi+wb/9ut/wmlDzqblny272/zz5anWStBJyDa9m9SU/C6P7meF3g+FJukFyQHV/4wuYA7g984zePYyuwIHYp48RKHZ5d/pzWWNg8mRh+H+gB6sWCxY9OsWpYeXzFeaO7/jOjThiymb8U9OGFXy5tU6Bswl1u3CpriwbOfMJrnbKiDxCB69d/HyF0FZIMErKJ+0nB9uX3tMa/SavSxpL3gCjHMqp0+enDngqw4PdjpIyrRjdzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=arm.com; dmarc=temperror action=none header.from=arm.com;
 dkim=timeout (key query timeout) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIYvVK1H4Ami31Heae/x7HwdEOCWwecnUk1uhd5VXUM=;
 b=EIt+i3Lnn/yaLo2nDZCQ9XybHZqbJ/ymghC0JmjqfGHphxMJ2jRyLGtVKWBtXi3SS95aJmvKvhCUtUMqQ0UxEytip+3sgeecfr5ReeSmmSySJ+fIOFERbplMky7Ezi+2pByLXUZcM7Hso2b9ul47CuYHb+v7oHdc0Ckqy+mqZvA=
Received: from AS8P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::34)
 by AM6PR08MB3830.eurprd08.prod.outlook.com (2603:10a6:20b:80::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Mon, 20 Jun
 2022 07:34:02 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::e3) by AS8P251CA0009.outlook.office365.com
 (2603:10a6:20b:2f2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22 via Frontend
 Transport; Mon, 20 Jun 2022 07:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=timeout (key query timeout)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 07:34:00 +0000
Received: ("Tessian outbound 6f53897bcd4e:v120");
 Mon, 20 Jun 2022 07:34:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a2f5f8fd4f58139f
X-CR-MTA-TID: 64aa7808
Received: from 80c9c26a4efa.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BDCA7B6D-01B7-4D2C-B639-6FC7B6A8C8D6.1;
	Mon, 20 Jun 2022 07:33:53 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 80c9c26a4efa.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Jun 2022 07:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZWHjWp2TMFUNnfuoLaPhJm4w7MGIVFXH7vbXIw5deRXSXYdF2JZ6bd321ZuuI3VThdRKzO34AH9aAnbfiuOI2kksdmzNlXDGruyoEOUQCPWRW3nIFHVuikJymv8O4vWK0VBdAnDVZdQK7DtsatQmETo6mijti1ATxnKpEQj13PlSL9sDMGDQ7PXvoIv3XxhEgNaL4Im69xTx8BpcZNDI49REAwg6manQq4QTUbIgCfMEDy3dYxoq2XUkzQ0MwZPOjirOQSB1nCXsI+Mh9Z/ZOy+08e/cmXALPgGi5SSTr5nvwGDhXM2aCfZBAnHiYWtZSEqqTTAQJVpkVGyTUVLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIYvVK1H4Ami31Heae/x7HwdEOCWwecnUk1uhd5VXUM=;
 b=nCW2flaP5iz1BKFXWsTpOM76U2frvmU4cIMPdkGjDtmCYfmJkkWQbryoosimgKRzcZnmtTZ9QeBkfkRa57R8qbas2zv12zsfWhM75IBc3EAR0hd8NNLPX472LwiCzSBBeWJvQZWKdLJjgumqM4iCM0VyVw7z7Tsrc/jjDZi3GTtcRdy3mUFF+Pwxvl7LLPPnCRLp9YPZa4qrsc3JoYhoePZsC0N2UJdS2Q4KhSXr+yCb88aKLN3/Nhc4knaGE7HR5zKGKTzkOb40YGlQ2+79khrbvq8QFk+RQ/lSBxoGAthG8NXTiyfv1kXxwKJCnNla5LfVyqYvV9bPuSC4jjkb9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIYvVK1H4Ami31Heae/x7HwdEOCWwecnUk1uhd5VXUM=;
 b=EIt+i3Lnn/yaLo2nDZCQ9XybHZqbJ/ymghC0JmjqfGHphxMJ2jRyLGtVKWBtXi3SS95aJmvKvhCUtUMqQ0UxEytip+3sgeecfr5ReeSmmSySJ+fIOFERbplMky7Ezi+2pByLXUZcM7Hso2b9ul47CuYHb+v7oHdc0Ckqy+mqZvA=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3016.eurprd08.prod.outlook.com (2603:10a6:209:44::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Mon, 20 Jun
 2022 07:33:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 07:33:51 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>, Michal Orzel
	<Michal.Orzel@arm.com>, "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 0/2] xen: PCI runqemu issue
 follow-up
Thread-Topic: [meta-virtualization] [PATCH 0/2] xen: PCI runqemu issue
 follow-up
Thread-Index: AQHYe+d4sRF4mfiYLkORkVKN2NFCyK1PV0MAgARySgCABC7MAA==
Date: Mon, 20 Jun 2022 07:33:50 +0000
Message-ID: <76DC2038-3E68-4396-A5DF-222518D0CF7D@arm.com>
References: <20220609095748.176486-1-michal.orzel@arm.com>
 <CADkTA4M_sMQd5v00NzmOas+j7HX0GopE6KRZZLV+TJmDr62fpg@mail.gmail.com>
 <CACMJ4GZexTbtNFt27LfpHvgCSz0xorN+mE9HxsGEaqT-cDCBtg@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GZexTbtNFt27LfpHvgCSz0xorN+mE9HxsGEaqT-cDCBtg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8ad60428-19bf-4156-45b6-08da528f3e9a
x-ms-traffictypediagnostic: 
	AM6PR08MB3016:EE_|AM5EUR03FT012:EE_|AM6PR08MB3830:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3830E83299CEC7C036D590B99DB09@AM6PR08MB3830.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RwIzG35ZzLDk6/D3JDkvbGkbtiRfO3tQiym7lANgvZwwQISw/EteogFmTMO4XCV9Il2mCSBnOdiopd4VXkoX1S5luq7hGnSXu2NttznMsAtLBrJM3J0R19zA5TmzRZmg9Lc4KQIEq6woExCDsa2BBJc3iVChE6jev2rmFs3Wpo0/+daiPJXOAeXbhCI/JZfUvpyL+wI2nxO7AtQs4i7nIFMrOj27sIH/a9/CWzwr1olF4fEEjVtzCo0nyA+I/Wwcp1Zv7OBol1d7mCNIwp9MQXRXKNdg/HEJO0RFKUnmwQoA2EmjKodrma/p/OsOzNhpPzRUGX4pcac9v5vdgHIrRO4dgPTezjopbAT6IqsCeYYLvw5ybFPHv+QFdZb8apitHZvlPNvgtgB3B/zztEOjH54zAbJqYoiD47nmCEJuh952nbypQFyNqAZAHwAAlzrTew0izhl8VXry/OH1N/DEAAvci2m4vC5I3Gbpi9izjzIO8MUUIcGbzpW01lFBJv3ZNL3pXUe7+erZqrNQWWZtI7pMSwLzUso6F0lfbCYn/W37bKrC+PqG64qB+IKbyXGOgj53tZB8uYZ7XXGgHHWYxsMWQqo5BAy6qaNIF5XKPQnkHSXqnCDVRFM4AFQCq1EHpIJ27AKFFGa+TeLft/RSFFRZqSSX67QtBCWCldLpFqpl4F64OwSOi9JgEcZJZSJIAlBCMRfEGoUoj6zonOFHJgejGiGVabyRIzK9INTzsICMsgnUJyq9w0WlAjc0He2RCEcn6sao0mu8NDLJdy3OuQLIJUB7DNnwvqV+HHEMpMKdbU5AIFl1NR5mzn65llD5
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(2616005)(26005)(41300700001)(6512007)(86362001)(83380400001)(122000001)(38100700002)(38070700005)(186003)(53546011)(316002)(5660300002)(66556008)(66446008)(66476007)(64756008)(91956017)(36756003)(66946007)(8676002)(4326008)(76116006)(33656002)(8936002)(2906002)(54906003)(6486002)(966005)(71200400001)(6506007)(478600001)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8D3C874FD0A906458074F1E93CB230A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3016
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2b5c650b-54f8-4beb-40d6-08da528f3897
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O5chq0YJGZ8oYrLbFmS8Mhg6HT1Wa/Z2EXDxKOBjTRqYsyBvKcO576D9SkY7v4seVQiFzZFIeqwZQpHrFLDA2sB5Q/HOvfT1aZ1wyeJxwflNu3dF0U1pkObfqBy2XnMfVkYOCVvKZkRXgc+xNjaILk0hQuAkOnSTxUArG+oimMwlnqtk1yxmGGADr20NMh7dnu05GnawqT0mU/kN8UQhcF4cEZpbMXbfOAnRvbBDfcZeDwmD3Dfnw8th67UyV4U9qLaBc8zBIFEGY7NtXpSaR1IWoDc5uVAd5dD7Pu3jX4L8l/sQqnSY33IzVO+K1iDp8Dt5+j0xP346If6FIq0kM+BE57ggrTd7uw4bDnQIzQueM6PFf4wVpce+VFOxadXYLbu3/PccjUt43WtYldrJfFwAeKme5KvDayablVS5WexNAbbVBIDOzWXqB0mcwbZx8shGDCMBTqxiKaui87uI5mYREs56FwlnMsGbtHufHtde/bUFdWcG6D2eZ3Ai+JudjcN5MeL5Yfrgwwldars9wAf5/bhbtamlFro3ynCijISg8eDw04I3DDLwS8rSZ/FMYX08UUotMD61cLqfW3P8Tk7gZnHLvx+MRSY4M7BaQZ0BS3kI1WLqy3sAvzRIxTDv+L9j5Sg5O8pcYu1AYngKfpdiiU6vnNdTFiXH7zZ4erNAPBtUW4/OPy4P3B/L9oqTvUwmN1Q3Ex0wxkSl1l3UwsCtuYh/LBnvpcD8lrXvh+a0INBFYTcP/H8+3weHzzrq3JDY/PHtB+cifOhssaqNbtuTYJ6MMN+WUwqYpBTEbPfnGSKG3Bv7EvFtqcVihVg8
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(40470700004)(46966006)(6862004)(4326008)(70586007)(70206006)(356005)(54906003)(316002)(8936002)(8676002)(36860700001)(86362001)(36756003)(33656002)(81166007)(82740400003)(2616005)(6486002)(26005)(6512007)(966005)(53546011)(41300700001)(6506007)(478600001)(82310400005)(40480700001)(47076005)(5660300002)(40460700003)(63350400001)(63370400001)(336012)(83380400001)(186003)(2906002)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 07:34:00.9761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ad60428-19bf-4156-45b6-08da528f3e9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3830
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jun 2022 07:34:16 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7391

Hi,

> On 17 Jun 2022, at 16:41, Christopher Clark via lists.yoctoproject.org <c=
hristopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> On Tue, Jun 14, 2022 at 12:47 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>=20
>> I was waiting to hear from Christopher on this one, so I'll let it
>> soak a few more days before staging.
>>=20
>> Bruce
>>=20
>> On Thu, Jun 9, 2022 at 5:58 AM Michal Orzel <michal.orzel@arm.com> wrote=
:
>>>=20
>>> This series acts as a follow-up to the commit:
>>> fb0a7b97db4f ("xen: Disable PCI on qemuarm with Xen")
>>>=20
>>> This wants to be backported to kirkstone.
>=20
> Thanks for these patches and for working out what was needed for the
> fix, Michal.
>=20
> Apologies for the slow review - am catching up now after a few days
> down with an injury (should be ok).

I would also suggest to push this to kirkstone branch.

Cheers
Bertrand

>=20
> Christopher
>=20
>=20
>>>=20
>>> Michal Orzel (2):
>>> Revert "xen: Disable PCI on qemuarm with Xen"
>>> xen: Disable highmem on qemuarm
>>>=20
>>> classes/qemuboot-xen-defaults.bbclass | 6 ++++--
>>> classes/qemuboot-xen-dtb.bbclass | 22 ----------------------
>>> 2 files changed, 4 insertions(+), 24 deletions(-)
>>>=20
>>> --
>>> 2.25.1
>>>=20
>>=20
>>=20
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7389): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7389
> Mute This Topic: https://lists.yoctoproject.org/mt/91642062/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


