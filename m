Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B03C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 07:39:01 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.83])
 by mx.groups.io with SMTP id smtpd.web10.3506.1657093138266133150
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Jul 2022 00:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=TJXWmU+m;
 spf=pass (domain: arm.com, ip: 40.107.2.83,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KcncB4i1DXIbhZUK6c/HVeYAA7extC7MtqaSrtKuFnKz8PUHfp9SW8QrgTEkC/wBaXTIzLELon81N5DyjIvU6aRBCBx+jhkNxh7HiTGcBGz7U1IQbrnLC5amdmL7krnMG2n7qwNrS5u9VJgXEoWMYWb0DX41Im3jSasQHrqffd2TObv6ODdDrKygF6NaAsCW6W9CqTXXzIko/Kfjicq7wg8AEgNsYj7eIaBRf+zKVw+EdqfgJ9NdiMI/yDc689VeF8FthIgo000Pz2fr2b0l0EIE/oA0cyVn1ZbilSHmOtwqDViU1IDic5KlQCmBAo7R0aBsragTPMsGhq/hQ9xQ6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CQXRT6MjT7dLmo4B3O+bOHEGdoTMVoBUYVpXrrsBr4=;
 b=nCoZMJfaJ99Ts8xcBLpWrxD7Rk60X7gY5GpEHrqIrnuyQQ+QoLfwGaQDa6xwo4G7UAhfZ8jIIdgaOxCJAw1lx0gt6wUsObRAOxR/1CNgM6b9IIC0MaSijZJ1et9LcaKKYA2J/nLAOjXpbBfBUcsJ8IetUpJO7sficFULRVvmrrDKBQumW/MwddcIkhNFttGjjDntmYRpvkXeqGiuXHTsTHXOseEf5ACpcieB8/fcJycQF4Fc9YfwTZgV71D03Y7EEvUMGMicOTOjjisyqeEOT6qw/m7AkyBe1RxML/tzw3LIHlSKc3rFcf7JAKjzgUCgqWsq/GBlsB9rmTui84U7TQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CQXRT6MjT7dLmo4B3O+bOHEGdoTMVoBUYVpXrrsBr4=;
 b=TJXWmU+mtxt2pLn6+Aiu2p44qB0fLSde1y8WvoXcU71HZ6rIXJUjOzgCNW+1OKqqBj8pZcO58/K4vwXOS9oM5JdbvVQtDTgO1+ru/Zo/y5B2R9s0mGoJuu+e7y5zuMJIHNI7dWSGxcoNhQHzDJgVTAb4U13HI+jZohTlfussnOw=
Received: from AM0PR02CA0154.eurprd02.prod.outlook.com (2603:10a6:20b:28d::21)
 by PA4PR08MB5934.eurprd08.prod.outlook.com (2603:10a6:102:e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 07:38:54 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28d:cafe::15) by AM0PR02CA0154.outlook.office365.com
 (2603:10a6:20b:28d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Wed, 6 Jul 2022 07:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:38:53 +0000
Received: ("Tessian outbound 0ba541f03a2a:v122");
 Wed, 06 Jul 2022 07:38:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83ed901249a1c811
X-CR-MTA-TID: 64aa7808
Received: from 47fa5c2b5c9d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DC06E64-E79F-4FA0-A4DA-EECF4888DF93.1;
	Wed, 06 Jul 2022 07:38:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 47fa5c2b5c9d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 Jul 2022 07:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZ3DexNTBYN31aVF0DlD8Joh4rudMMTacWq1EgyuXjOnaEUty/BQlUBfLxLrpPeMveWlnQMkbXv3oJ4/1brdpO2KKITKWBYOHfjmXcLysI4ODvmV4/Ur/o9ysOG8mH+vAJvG2ykUltvXiUGy+ZV4lDtDvRCYKJt+F1xeSsyecToL+8v13lYDbMJ2f7WmA8OEbP7IToNcYHixh7yMO8dmVw3PRtpUYkTUFrMuYmVYcPbSfotnixtPc5uTD+vyl+UWe3NEVZnx+iof4fMOpCxgPE/3VoTcjBuxVqNXF2FYaolkaqOM+W2dB2dMcJ3qNRn3gLsEvR0QNwLsXnB/KvpH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CQXRT6MjT7dLmo4B3O+bOHEGdoTMVoBUYVpXrrsBr4=;
 b=QxFtoPTMmKuYZxsVd/qtzFUjXZdZfmpTGzT5Z1ds03ZoYd491kVJLYQ6yeX4gAP6YE0eoIPPrjLLE23Ij+tr8tCKsUn6ztZVOon7ffiMTXTN+r2VM/j4khnVsJL3rybvYN/Dxx2OeKGWagfcV2BNJtR4qXzBBOLOS4Nn86GzsuVl5omZtYuhUdc8ClRZa7I2ytY0MoRELN4cQxFgeI4nF23yjKPw/4pEQJXEYOGDiSaCIA2yq2ArlqDoFGe+/B0RJSy00gipzU4UehQeq7iZMaRMJTuG9MDYIelzWM+5J3/OzayUkXdyJDug02UTtqOJ6RWNtCwZBczCeqRdOoxfjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CQXRT6MjT7dLmo4B3O+bOHEGdoTMVoBUYVpXrrsBr4=;
 b=TJXWmU+mtxt2pLn6+Aiu2p44qB0fLSde1y8WvoXcU71HZ6rIXJUjOzgCNW+1OKqqBj8pZcO58/K4vwXOS9oM5JdbvVQtDTgO1+ru/Zo/y5B2R9s0mGoJuu+e7y5zuMJIHNI7dWSGxcoNhQHzDJgVTAb4U13HI+jZohTlfussnOw=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6004.eurprd08.prod.outlook.com (2603:10a6:20b:285::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 07:38:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Wed, 6 Jul 2022
 07:38:36 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console only
 if not there already
Thread-Topic: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console
 only if not there already
Thread-Index: AQHYkK3qVK3m+rlSK02AevI3HLi2GK1w9XCA
Date: Wed, 6 Jul 2022 07:38:35 +0000
Message-ID: <3ED69C7C-075D-4627-AC79-5255BBA9217E@arm.com>
References: 
 <09a42f2562420f11d3187606418a73af07690f98.1656417819.git.bertrand.marquis@arm.com>
 <20220705202907.GD24762@gmail.com>
In-Reply-To: <20220705202907.GD24762@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ac2b75d1-e155-44c3-10b7-08da5f229360
x-ms-traffictypediagnostic: 
	AM9PR08MB6004:EE_|VE1EUR03FT016:EE_|PA4PR08MB5934:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bnB37ikR5XFatk430YHW4kjmW5KJ2maGEH0orG5fs9tRp2boblIYZTVammYY5CXOX1nUKmui4/h6UoYVWuPHKDnwKXSSDVDakc80C7OdYgVTkd3qD/nc8aFnqDNhc0xi1Z37fZ8EnZkUoLKNKdcjiOsg3ACfwBsWHPx317e33a3uCg0o65D6qKohRzYZxn7jXIYywSOqebjGRnAYRr7sxmRlYz6ULiPDqE69epZ1bcD0F/PnN+wgfrP9WUhoK+9ugv2puVGPBPglrCsvXafnd4ON5mzdvbQCwjURTuuKR/QoYvJ7pnSwwl8WETigGXkqEwMkxPF72e7p7OWocu2YYGYjuAXhFBsJCLyfZIZBDF6zhMfb15RnbtxI99wVSLHRUmyJdtNedd3khtTn6MqWTIlsbVPLqzEsS1VL3hrwpudvP32ap6Qbm0klV9bZ991LVUA8dqSP+84luwdFWluZ991lWdS7Kb0QrhRVOmRaZdF1Mk1WIim5VSBWAFkBh6VXPjfFzFRMTbX+oC+QBiIfqIKAE/JznNoUaBr1EHlqjwDgeaNzTnHN1x/Pe+Lht6r3lnS76BceD8bv0AIMV4V9G/haXtBk1XhKlXTSlhunJAJtTUnqn6zuXAXYOfls45T9mRq641b7k6co+UdTB3XkCpo4ts8tZ4rIJmDgoKaQae1s8dP4QYVYpQ0s/M2WvTyzfYU0osXXvCSUbp8gzxB3LGQoLvDHTgnFizOZJ83dkZJY+hla784HlM5cANBrr+Jd4GMhsfOK2RwDnQEv8KbLmpAjtf4lO2GULAItdKU4hsdH5E8wjL2GXI77siJgn4h0KoUw+zdr7Z2W7nrMZoChvl0l2aSw5s+N4/r/1qwkvRsPsO9My8Qoqm8GfhH+FOU39rWnjpkBcur7bGwsrl7bHoLxCGBmIh95BdTgK6FLw3k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(8936002)(41300700001)(71200400001)(966005)(478600001)(86362001)(6486002)(5660300002)(2906002)(38100700002)(316002)(91956017)(2616005)(36756003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(186003)(4326008)(8676002)(33656002)(83380400001)(122000001)(53546011)(6506007)(38070700005)(26005)(54906003)(6512007)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F541A9F0E086DC40B4B39EB0BDBCC7CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6004
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1816fec6-9f22-4648-b322-08da5f228909
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iQJusWoe7CAtkXpq8u5e8ypSrXbgd17WJlAgAyG57ZbAHT+M51yHq4aIPGtboTRERUHTQw7AgPeLTyb0/rCHDytkoybspIiDwQgLDQmtNS5gEiaMPxBEec6KeObHR3U2ACFhmft2Pq7AkEMm9Xtu6xSekmkLkpfIAwNUYqkeeTb+op6Za5boypbzRffdeC2CgcZtFRou3P6HcD1YUnfSzDsWbCW1kYSDAgSe3lyWX4DjqEtu7F3h2icYkns9TYu1MD+nR0fzXQUQOLexJuzTH5rd/uUZlzI9NfN1RZnjsg95tGKJV/B05OuBueSaBUZVYnh3Ipp+bQPtscq3NdlLlzv8/WVQWp9sduEECo4GM8F26zsjvdOBphuSWyGjtKJPP3Je1etBggLG2+FxAVOKN+K2Ifc7a7UqpEkXqstSPlCb7WalK4xxowI3OMm0xy0TObm+QazGVVzJq4qQkJkvI7fWE1Dki/XIkKHYosXIiKBK+ZhbPD/NQ1oqW5Wy+IJfuT8gONbgJzxgM5f+TyOzGPD3l0PXxHGDPsOQzzZrSfNUub4EbTd2Ox51jLun4xaI7Mx5Rloy16oscTiIHj9NpWdNajD36+rhOJNwZ/uY6Ne2ouIVwWL4Itdm9mnfeSPbSn+jzQ8Qb8pVzlH+fZKbRpc887v6Tzy+YQZ2hEv05mEJtfu2RjWSRqIAu/MRceHQCDwWGHlGGk0aLacaEHgMSNgSXzwWdN7mb94LVduPLAnHIqxtbdadaZWXXstUJdQPMDjRT5B1rCUQWWDxHumxnUU64Rys2iH7BU766PQaqwM8qhcqC4F+/Gugru8ov01xDy+MuaK8Lp1OM3BlEXvLkpvB9IQHv/n2eioDQaPIj9dzWvk6jdKXwWpNa6++FxDmitPIQD3A3NUgiOxZqEcP3Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(40470700004)(107886003)(6512007)(2616005)(47076005)(336012)(70206006)(8936002)(6862004)(4326008)(8676002)(70586007)(5660300002)(36756003)(41300700001)(33656002)(86362001)(40480700001)(82310400005)(6506007)(2906002)(966005)(6486002)(186003)(26005)(53546011)(478600001)(82740400003)(83380400001)(81166007)(356005)(316002)(40460700003)(54906003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:38:53.1326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac2b75d1-e155-44c3-10b7-08da5f229360
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5934
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Jul 2022 07:39:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7411

Hi Bruce,

> On 5 Jul 2022, at 21:29, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>=20
> Looks ok to me. I'll give it another day to hear from Christopher, and th=
en
> I'll do the merge.

He just did (thanks Christopher), would you mind also pushing this to kirks=
tone branch ?

Thanks
Bertrand

>=20
> Bruce
>=20
> In message: [meta-virtualization] [PATCH] xen/sysvinit: add hvc0 console =
only if not there already
> on 28/06/2022 Bertrand Marquis wrote:
>=20
>> The base inittab recipe is creating inittab entries for consoles listed
>> in SERIAL_CONSOLES.
>> For qemu, this contains "115200,hvc0" so an entry is created in inittab
>> for it.
>> Prevent to create a second entry if hvc0 is present in SERIAL_CONSOLES.
>>=20
>> On qemuarm, this solves issues with the console when starting on top of
>> Xen as dom0.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> recipes-core/sysvinit/sysvinit-inittab_xen.inc | 10 ++++++++--
>> 1 file changed, 8 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-co=
re/sysvinit/sysvinit-inittab_xen.inc
>> index 7f92bd1..724f47d 100644
>> --- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
>> +++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
>> @@ -1,4 +1,10 @@
>> +
>> +
>> do_install:append() {
>> -                echo "" >> ${D}${sysconfdir}/inittab
>> -                echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 11=
5200 hvc0" >> ${D}${sysconfdir}/inittab
>> +    # if SERIAL_CONSOLES contains hvc0, it is already added in inittab =
so do
>> +    # not add it twice
>> +    if echo "${SERIAL_CONSOLES}" | grep -vq "hvc0"; then
>> +        echo "" >> ${D}${sysconfdir}/inittab
>> +        echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc=
0" >> ${D}${sysconfdir}/inittab
>> +    fi
>> }
>> --=20
>> 2.25.1
>>=20
>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7400): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/7400
>> Mute This Topic: https://lists.yoctoproject.org/mt/92046232/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20
>=20


