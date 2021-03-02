Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.69])
 by mx.groups.io with SMTP id smtpd.web10.6531.1614680842787514348
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 02:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=vVrNgz+H;
 spf=pass (domain: arm.com, ip: 40.107.6.69, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLY+/0oRyTgEyUU+p9yVteEp/3WJ3eZxhar+SRgtSIs=;
 b=vVrNgz+HU4q/LztDsk/kPjTE/2kYYTDSAxrChipYI10wrELMFOODlVIMYUWxMVDgu5NiqmR3OyuP8eZqgwBAi/locVlkNqRVpdEwDQKEfRDyysV9I2vjlFiiJDyJN0o9j9W8iGbGtMA2TlSvFiC3slMsr7gdsI9omOYaJCSkgjY=
Received: from DB6PR0301CA0045.eurprd03.prod.outlook.com (2603:10a6:4:54::13)
 by VE1PR08MB4845.eurprd08.prod.outlook.com (2603:10a6:802:a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 10:27:19 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::53) by DB6PR0301CA0045.outlook.office365.com
 (2603:10a6:4:54::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend
 Transport; Tue, 2 Mar 2021 10:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Tue, 2 Mar 2021 10:27:18 +0000
Received: ("Tessian outbound 1ad67edf7b2b:v71"); Tue, 02 Mar 2021 10:27:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 369f77a46b4640e5
X-CR-MTA-TID: 64aa7808
Received: from dd65c0eadc6c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 039EF258-A3A4-4F9A-B6A6-96345CEF0F1E.1;
	Tue, 02 Mar 2021 10:27:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd65c0eadc6c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 02 Mar 2021 10:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXQCAkQ90ToyD8h0mcwLxYGGy8rT0MEjyFwDUNi4nfu/Fti2w7YJCEcIdLu6efy1Kf/CXfOkgLdxD2LSzSVsu746v43sEz1jkNUFRFIyLOSgDWcySnpt+kssaZdaL09as8ZEgB/c8KkNkJ0zSgnDoQQxtFCERSOnLidd3i+H+qtat664ZvHRlC8GmsJSct+gk5vHlrLbfMRjbnX8IHC4lVoXOKjp9sruJbiEYJKs2LNSeVf1h1P8gOHa283B4iAmnnovWO+XYIyOa8Pr0lJJRlYzcT/HNCUlpylCYAmllh4Rq/DOKlNjHjmwCoVN1EnPwy+jryLyOa7sD6WhfM3aeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLY+/0oRyTgEyUU+p9yVteEp/3WJ3eZxhar+SRgtSIs=;
 b=iXn7vdoglQw9dXpFIpnsd6njAe6u+1bCTHBGEVi/odcqMDLHIgPwdTpc/u11nEptBqNp6w+hz98XGwp9U6dQlmJjRNYq2Ur3wvVPNN1i+bGNnOjelLZPnEY0p5FJwCNj5mACI9qdNVsl0Ars3Tj4t1BqztKSx/SUUGrvJQe4XFO5VKQL/dnnBMDjfbPK8UZJ4qdX5syhfOYwq/Nl2LCdPVGTgjZUkwy8Ywjpww4DqhRXK9ySsS62u7EyYcAU8M/KqtUrhP1wVg0RJQXNU81OcsTLbnTXA95skaUESwxRLpF8arYzeLh66B957yqBltv7mCfv3SFP/HtzQPj+KyOHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLY+/0oRyTgEyUU+p9yVteEp/3WJ3eZxhar+SRgtSIs=;
 b=vVrNgz+HU4q/LztDsk/kPjTE/2kYYTDSAxrChipYI10wrELMFOODlVIMYUWxMVDgu5NiqmR3OyuP8eZqgwBAi/locVlkNqRVpdEwDQKEfRDyysV9I2vjlFiiJDyJN0o9j9W8iGbGtMA2TlSvFiC3slMsr7gdsI9omOYaJCSkgjY=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0802MB2557.eurprd08.prod.outlook.com (2603:10a6:800:b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Tue, 2 Mar
 2021 10:27:10 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 10:27:09 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Diego Sueiro
	<Diego.Sueiro@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and current master
Thread-Topic: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and
 current master
Thread-Index: AQHXBgeT+QKRNq5USUiB4oaaJKVCFqpeBpywgBJjGACAACduAA==
Date: Tue, 2 Mar 2021 10:27:08 +0000
Message-ID: <5C2CFDED-06C9-4730-98E4-BE3EFEEED053@arm.com>
References: 
 <7f53a8e6f74499215ec593993a00631049e05c8a.1613658838.git.bertrand.marquis@arm.com>
 <AM6PR08MB34614F21BA86DE2E60E51FCC92859@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CACMJ4GaAxYL-xYsyWYVAkaBDb=-4RmOW0xmAjRYj-BuOY55_Gg@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GaAxYL-xYsyWYVAkaBDb=-4RmOW0xmAjRYj-BuOY55_Gg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d22c115d-0710-453e-f11c-08d8dd65c1cf
x-ms-traffictypediagnostic: VI1PR0802MB2557:|VE1PR08MB4845:
X-MS-Exchange-MinimumUrlDomainAge: yoctoproject.org#3827
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB4845DA485CD434A287F9731C9D999@VE1PR08MB4845.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2201;OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 O9YIGvLwjLHwHwZ4mevCLnGs9ZwdjuQ4K3WDJccmPyA8x3n9HFTDX3wYrx34EHSZN6J8C3yVKsednUrhXJOTtghvg/KyHvvM0gPaBpcTtRsrq+PytdMvYzdi+n28hlIlP9RzfVlF6Y73Sj6zdY5cbEhE0cEfdS/wqjzsKoMHdoIi6VyI/uQidMjedgA2Ju4M6fweX3W8CWOsE01tQnJaIxiMG6YlIfjTHVUAArAFAdF0oyK76WNZzQGZiPisyc/68hH5coD2vEJZySGBMAel4Fq5deZ6+NKOiau2H/ELvi7wwS6RDMXs6zE0zskxRa9Kmq7aQYIkebF+DZ96R9b5FQYKJSBc4hMe5M+7J17mWvn4aOMhMFjRQd3hileO4YmFeJBqBpgGMj10lx4jesW/wFUetXXgMB4au5onUSdAuXS5YYOgZxy+/nvsaxshpmVfV58MYkwHQD7OoLK5Re8/F1S0x79ndZ+IMv5K58fhTHLv3OniE5jZQRLDJUA8u91kNSpXqkCwvWK7ehxXGDq3bSmrZwsX6wWdP5CaPOAIb2Xt+DiBaRwSxfUyYwtpfIgxMS3Ob9kakUfe0cZw7a9GkCN+nKMqZ3dQpeLLd65+hqLy8ZLyKCkB5+glulygImDvP0ApiyvgTBcBFhRnB8YHHg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(6916009)(91956017)(30864003)(2616005)(2906002)(966005)(8936002)(316002)(86362001)(33656002)(26005)(54906003)(66476007)(66556008)(55236004)(8676002)(76116006)(71200400001)(53546011)(4326008)(478600001)(36756003)(66446008)(186003)(6506007)(6512007)(66946007)(83380400001)(64756008)(5660300002)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?1OSBcA1AY0ooMDeMLR6foAHpHpVX2ep8KXp7PXf3cLrsvmu5rSBAjgHR1bWH?=
 =?us-ascii?Q?cbycMQi31ONR3IWySidOso0xFiRhTo24eer0O+G35x1hpUtEhcmYClbq9HWw?=
 =?us-ascii?Q?4FRFTpQrwESO4mFbttI4VvlnrKkxBQNQSIaUsy81XZcRgO1PwdDJQRtFeV4M?=
 =?us-ascii?Q?pCwbej0+z0a6PctC1TxFl7PpsM89pdx96XjSQKVBBx3Fvk46hmM8QkhujpB8?=
 =?us-ascii?Q?A7AAfs/JSjC76DbSmUn62wWXu3D99F0XEMEp9ej6fXc0lF0cwSoXWbUyiJBf?=
 =?us-ascii?Q?Nye5q4039QrXkt/FCRns3SuiJ7kxh3HQvdCJJonhLIi9sfiIuf7h7yt+jDI+?=
 =?us-ascii?Q?eu0a71bXPxirw9ygMjRhCzdxvfpM9v9xxDM4ziHZknIz3EKAEIwuCIbIyRAA?=
 =?us-ascii?Q?gzytZZxRfofzn5ucf9GDvmBIaoC09HKOykEeQguCf+Rkq9Oc5qX5z2TIX4Fg?=
 =?us-ascii?Q?4/0cLnKDXTe9BQJUddAY6q7MwJFPTDA91V+XHuhGJSMVfCreqKzpbEEKEyZN?=
 =?us-ascii?Q?SR6w3609uU8KO6KGeQTmXhoDavtMY90Fy3zQe+7bIJI9fCAMnKy0zWEOoE9w?=
 =?us-ascii?Q?nKkbXsN5bqcizTkFN+eIwHyNgDPifbh30M8diZITwJp0OBnp/LCJyHzlQlNR?=
 =?us-ascii?Q?sJymy6isBeX8x6TtpZz/D9R/dx2CgDl5mjm2SLJ588HUlBIxk1bfzX9FEL+W?=
 =?us-ascii?Q?F59DOiowTczkaW4EnE/M3/FyMBsmEojImFwrrrRw/zDGSYUxkhix3qIyUsfD?=
 =?us-ascii?Q?mKd2pl07g69FoE3tkj4j/ZvXYyjmUZoF4d3VsTD2+Z1k3TDFa6q8il7PARml?=
 =?us-ascii?Q?TrIZL4//XC8WDXtQsvx5z8c6LOjEBO0SgtlKCK6Gt9jGljb33YJ8LhWfgTrl?=
 =?us-ascii?Q?d+/ZSUZugaQ9laSeX6ET10WpazbY45F64zV1bwzkj+gK+NztRWk+R44v0VUl?=
 =?us-ascii?Q?1L4pFPksv9bdKj1nA3ilhr2Ca5G1ooDumr8U8r5pzeeteo/7o+q4ZhpltxRB?=
 =?us-ascii?Q?EPHE9QXakX2cJTe8SCqjRyM0y87mWpOWDZgWLNgOuksVjktrbFcMGcAeIPzf?=
 =?us-ascii?Q?S+cY7jOv2lNofT3BIeVa2NtMKzmVShqWnBnhsVCWKPZWKcqH1xPLHDXLssL/?=
 =?us-ascii?Q?uLRJ479TwLDgQ4i3WsyOF0H40nW5IHFCIma/QtIdiSDsxleNnCtD4+T41SSK?=
 =?us-ascii?Q?WbXcl8FTAPMEPa3lImpsxxiqfxatLaa4db/GUk/SSgB3+wBMRlSnagbE9RX/?=
 =?us-ascii?Q?irZgjUjZzMMucAD98+L/jef9JzCfpbhdmbQ2Sh5bkpuG5QdTec58MncBGIoa?=
 =?us-ascii?Q?/bijemIVn1NFuv/UK8Mk6lE1?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2557
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e72ee7d8-34bd-451e-5f76-08d8dd65bc70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ehKhTFySN2fe58djsFyTy+1BDAGC4RarEALy8+mfjGTfTUMbRUkdnrGu2uoYslF1E6u9z0Uu0YrPhsZs+jgy5WezqdmVyyPHH5YUJdLcaNDlwwKSTlK/AwcYHzHIFo1osyD+yRhbqTKoIoFgg/7qsz8V7ttDXO9O/+luEneA1Ux4D1fanbPzUDX1g0Q4KgQQnDuTgS4rEh0Fwp2vNKJkWJdHHEHYof/saBlZ4qJ2UAoyKgso82Yx5rN9EbJNp0/z4mw2HrGe0OEf6ajM4ua7cp1tI7lD0c6hpLuy/Ub57lTtKzxo+X9ebDe2t+oozBXl5zu6URg5VJOOy31w0frbF39YEELFvA8xXuCbyI5lGzoOdg4Wg6OWwUr6RtVvkoAaV4Ti7kUXdj8hCaObQxIW1y3rhdkPOaF1kM9YSkDQaEKQ1wv0h5szN7r5Otv/Ceo0KdaUdvML/9j415+tAeuubb261HuCoVtYl1/D62ngXcPItcTQyfzbbplXXOhH/24+xGlf9t7gtSEiC1xoVxpod2LPnbfSLMFjl2zd3RCKuVg2T5dHGYDK4Z6yE74GfhU+zQqJMZMz5KGyoE8Jp3cHn48wcVy7/3VdGvBLus+HTPn95pvoyr/pIsE+vj6vihfwa6R2rKFN8u42YZcTBRxcsKiXvEjFxktFFdGrPiJ2cEcsAVpu+6VJpF4KFdc+SfRiVJwlud8jqSmNRGhMeg+OLmcvzopMTj71GD5iDnlV0dM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966006)(36840700001)(966005)(4326008)(356005)(8676002)(26005)(47076005)(33656002)(5660300002)(36860700001)(2906002)(82740400003)(336012)(186003)(6486002)(2616005)(86362001)(70206006)(70586007)(54906003)(478600001)(55236004)(8936002)(30864003)(6512007)(6506007)(81166007)(6862004)(83380400001)(82310400003)(53546011)(36756003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 10:27:18.5920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d22c115d-0710-453e-f11c-08d8dd65c1cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4845
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2211A6AF7768D243B702A1EC19FC49D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

> On 2 Mar 2021, at 08:06, Christopher Clark via lists.yoctoproject.org <c=
hristopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> On Thu, Feb 18, 2021 at 7:19 AM Diego Sueiro <diego.sueiro@arm.com> wrot=
e:
>>=20
>>> -----Original Message-----
>>> From: meta-virtualization@lists.yoctoproject.org <meta-
>>> virtualization@lists.yoctoproject.org> On Behalf Of Bertrand Marquis v=
ia
>>> lists.yoctoproject.org
>>> Sent: 18 February 2021 15:05
>>> To: meta-virtualization@lists.yoctoproject.org
>>> Cc: nd <nd@arm.com>
>>> Subject: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and
>>> current master
>>>=20
>>> Bump SRCREV version of xen recipes to use the latest 4.14 release
>>> (4.14.1) and the current status of master.
>>>=20
>>> This allows to remove some patches related to gcc 10 support which hav=
e now
>>> been merged in Xen.
>>>=20
>>> Xen-tools is modified to include the latest tools installed with Xen:
>>> - a rename of the bash-completion,
>>> - a new xl example,
>>> - xen-access,
>>> - xen-memshare (only available on x86).
>>>=20
>>> A new patch to fix python and pygrub is added as the makefiles have be=
en
>>> deeply modified in 4.15 which require a new patch (but doing the same)=
.
>>>=20
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>=20
>> Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>
>=20
> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
>=20
> Both the 4.14.1 and the git recipe versions build fine and the changes
> here are good -- thanks. Some very minor style points noted below but
> this should go in, please, Bruce.

Thanks, i will send an update later this month once 4.15 version of xen is=
 released and i will handle
your remarks in when doing this.

Could we also consider merging this in gatesgarth branch ?
This would make sense to bump the minor version of xen there to i think.

Regards
Bertrand

>=20
> thanks,
>=20
> Christopher
>=20
>>=20
>>> ---
>>> ...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73
>>> +++++++++++++++++++  ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 6=
0 ----
>>> -----------  ...uild-temporarily-inhibit-Werror-4.14.patch | 26 ------=
-
>>> recipes-extended/xen/xen-tools.inc            | 14 ++++
>>> recipes-extended/xen/xen-tools_4.14.bb        |  4 +-
>>> recipes-extended/xen/xen-tools_git.bb         |  6 +-
>>> recipes-extended/xen/xen_4.14.bb              |  2 +-
>>> recipes-extended/xen/xen_git.bb               |  2 +-
>>> 8 files changed, 92 insertions(+), 95 deletions(-)  create mode 100644=
 recipes-
>>> extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch
>>> delete mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-
>>> gcc10-snprintf-warning.patch
>>> delete mode 100644 recipes-extended/xen/files/0001-xen-build-temporari=
ly-
>>> inhibit-Werror-4.14.patch
>>>=20
>>> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUT=
ILS-
>>> xen-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-
>>> DISTUTILS-xen-4.15.patch
>>> new file mode 100644
>>> index 0000000..35cd9a8
>>> --- /dev/null
>>> +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen=
-4
>>> +++ .15.patch
>>> @@ -0,0 +1,73 @@
>>> +From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00
>>> 2001
>>> +Message-Id:
>>> +<6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.bertrand.m
>>> arqu
>>> +is@arm.com>
>>> +From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>> +Date: Fri, 19 Oct 2018 11:01:37 +0200
>>> +Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py
>>> +args
>>> +
>>> +Upstream-Status: Xen: Inappropriate [oe specific, python install
>>> +issues]
>>> +
>>> +Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR) as
>>> +well as other parameters set by the OpenEmbedded build system.
>>> +This is especially useful when the target libdir is not the default o=
ne
>>> +(/usr/lib), but for example /usr/lib64.
>>> +
>>> +Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>> +
>>> +Forward-ported to Xen 4.12.0
>>> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>>> +
>>> +Modified to support pygrub installation with python 3
>>> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>>> +
>>> +Forward-ported to Xen 4.14.0
>>> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
>>> +
>>> +Forward-ported to Xen 4.15.0
>>> +Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> +
>>> +---
>>> + tools/pygrub/Makefile | 7 +++++--
>>> + tools/python/Makefile | 2 +-
>>> + 2 files changed, 6 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile index
>>> +37b2146214..ffb9270065 100644
>>> +--- a/tools/pygrub/Makefile
>>> ++++ b/tools/pygrub/Makefile
>>> +@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
>>> + all: build
>>> + .PHONY: build
>>> + build:
>>> +-     CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)"
>>> LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build
>>> ++     CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)"
>>> ++LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build
>>> ++$(DISTUTILS_BUILD_ARGS)
>>> +
>>> + .PHONY: install
>>> + install: all
>>> +@@ -18,7 +18,10 @@ install: all
>>> +      CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
>>> +              LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
>>> +              --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>>> +-              --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BI=
N) --force
>>> ++              --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BI=
N) --force \
>>> ++              $(DISTUTILS_INSTALL_ARGS)
>>> ++     rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>>> ++     $(INSTALL_PYTHON_PROG) src/pygrub
>>> $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>>> +      set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
>>> +                   "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
>>> +                   "`readlink -f $(LIBEXEC_BIN)`" ]; then \ diff --gi=
t
>>> +a/tools/python/Makefile b/tools/python/Makefile index
>>> +cc76423647..5cb11ae453 100644
>>> +--- a/tools/python/Makefile
>>> ++++ b/tools/python/Makefile
>>> +@@ -12,7 +12,7 @@ setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)"
>>> LDSHARED=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLA
>>> +            SHLIB_libxenctrl=3D"$(SHLIB_libxenctrl)" \
>>> +            SHLIB_libxenguest=3D"$(SHLIB_libxenguest)" \
>>> +            SHLIB_libxenstore=3D"$(SHLIB_libxenstore)" \
>>> +-           $(PYTHON) setup.py
>>> ++           $(PYTHON) setup.py $(DISTUTILS_BUILD_ARGS)
>>> +
>>> + .PHONY: build
>>> + build:
>>> +--
>>> +2.17.1
>>> +
>>> diff --git a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-sn=
printf-
>>> warning.patch b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10=
-
>>> snprintf-warning.patch
>>> deleted file mode 100644
>>> index 0a136c9..0000000
>>> --- a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-
>>> warning.patch
>>> +++ /dev/null
>>> @@ -1,60 +0,0 @@
>>> -From 0dfddb2116e3757f77a691a3fe335173088d69dc Mon Sep 17 00:00:00
>>> 2001
>>> -Message-Id:
>>> <0dfddb2116e3757f77a691a3fe335173088d69dc.1604734077.git.bertrand.m
>>> arquis@arm.com>
>>> -From: Bertrand Marquis <bertrand.marquis@arm.com>
>>> -Date: Thu, 15 Oct 2020 10:16:09 +0100
>>> -Subject: [PATCH] tools/xenpmd: Fix gcc10 snprintf warning
>>> -
>>> -Add a check for snprintf return code and ignore the entry if we get a=
n -error.
>>> This should in fact never happen and is more a trick to make gcc -happ=
y and
>>> prevent compilation errors.
>>> -
>>> -This is solving the following gcc warning when compiling for arm32 ho=
st -
>>> platforms with optimization activated:
>>> -xenpmd.c:92:37: error: '%s' directive output may be truncated writing=
 -
>>> between 4 and 2147483645 bytes into a region of size 271 -[-Werror=3Df=
ormat-
>>> truncation=3D]
>>> -
>>> -This is also solving the following Debian bug:
>>> -https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D970802
>>> -
>>> -Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> -Acked-by: Wei Liu <wl@xen.org>
>>> ----
>>> -Upstream-status: Backport from 4.15
>>> ----
>>> - tools/xenpmd/xenpmd.c | 9 +++++++--
>>> - 1 file changed, 7 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c -index
>>> 35fd1c931a..12b82cf43e 100644
>>> ---- a/tools/xenpmd/xenpmd.c
>>> -+++ b/tools/xenpmd/xenpmd.c
>>> -@@ -102,6 +102,7 @@ FILE *get_next_battery_file(DIR *battery_dir,
>>> -     FILE *file =3D 0;
>>> -     struct dirent *dir_entries;
>>> -     char file_name[284];
>>> -+    int ret;
>>> -
>>> -     do
>>> -     {
>>> -@@ -111,11 +112,15 @@ FILE *get_next_battery_file(DIR *battery_dir,
>>> -         if ( strlen(dir_entries->d_name) < 4 )
>>> -             continue;
>>> -         if ( battery_info_type =3D=3D BIF )
>>> --            snprintf(file_name, sizeof(file_name), BATTERY_INFO_FILE=
_PATH,
>>> -+            ret =3D snprintf(file_name, sizeof(file_name),
>>> -+ BATTERY_INFO_FILE_PATH,
>>> -                      dir_entries->d_name);
>>> -         else
>>> --            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FIL=
E_PATH,
>>> -+            ret =3D snprintf(file_name, sizeof(file_name),
>>> -+ BATTERY_STATE_FILE_PATH,
>>> -                      dir_entries->d_name);
>>> -+        /* This should not happen but is needed to pass gcc checks *=
/
>>> -+        if (ret < 0)
>>> -+            continue;
>>> -+        file_name[sizeof(file_name) - 1] =3D '\0';
>>> -         file =3D fopen(file_name, "r");
>>> -     } while ( !file );
>>> -
>>> ---
>>> -2.17.1
>>> -
>>> diff --git a/recipes-extended/xen/files/0001-xen-build-temporarily-inh=
ibit-
>>> Werror-4.14.patch b/recipes-extended/xen/files/0001-xen-build-temporar=
ily-
>>> inhibit-Werror-4.14.patch
>>> deleted file mode 100644
>>> index 0e0a3dc..0000000
>>> --- a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-We=
rror-
>>> 4.14.patch
>>> +++ /dev/null
>>> @@ -1,26 +0,0 @@
>>> -From 9cff3bf8425ccc593825fcde8ca5eaa32a43d04d Mon Sep 17 00:00:00
>>> 2001
>>> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> -Date: Thu, 18 Jun 2020 09:05:22 -0400
>>> -Subject: [PATCH] xen/build: temporarily inhibit Werror
>>> -
>>> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com> -Rebased on =
Xen
>>> 4.14:
>>> -Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>> ----
>>> - tools/libxl/Makefile | 2 +-
>>> - xen/Rules.mk         | 2 +-
>>> - 2 files changed, 2 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile -index
>>> 6da342ed61..c67560e269 100644
>>> ---- a/tools/libxl/Makefile
>>> -+++ b/tools/libxl/Makefile
>>> -@@ -11,7 +11,7 @@ MINOR =3D 0
>>> - XLUMAJOR =3D 4.14
>>> - XLUMINOR =3D 0
>>> -
>>> --CFLAGS +=3D -Werror -Wno-format-zero-length -Wmissing-declarations \
>>> -+CFLAGS +=3D -Wno-format-zero-length -Wmissing-declarations \
>>> -      -Wno-declaration-after-statement -Wformat-nonliteral
>>> - CFLAGS +=3D -I. -fPIC
>>> -
>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen=
/xen-
>>> tools.inc
>>> index 0c69fec..722c503 100644
>>> --- a/recipes-extended/xen/xen-tools.inc
>>> +++ b/recipes-extended/xen/xen-tools.inc
>>> @@ -234,6 +234,8 @@ PACKAGES =3D " \
>>>    ${PN}-xl-examples \
>>>    ${PN}-xm \
>>>    ${PN}-xm-examples \
>>> +    ${PN}-xen-access \
>>> +    ${PN}-xen-memshare \
>>>    "
>>>=20
>>> PROVIDES =3D+ " \
>>> @@ -633,6 +635,7 @@ FILES_${PN}-xen-watchdog =3D "\
>>>=20
>>> FILES_${PN}-xl =3D "\
>>>    ${sysconfdir}/bash_completion.d/xl.sh \
>>> +    ${sysconfdir}/bash_completion.d/xl \
>>>    ${sysconfdir}/xen/xl.conf \
>>>    ${libdir}/xen/bin/libxl-save-helper \
>>>    ${sbindir}/xl \
>>> @@ -642,6 +645,7 @@ FILES_${PN}-xl =3D "\
>>> FILES_${PN}-xl-examples =3D "\
>>>    ${sysconfdir}/xen/xlexample.hvm \
>>>    ${sysconfdir}/xen/xlexample.pvlinux \
>>> +    ${sysconfdir}/xen/xlexample.pvhlinux \
>>>    "
>>>=20
>>> FILES_${PN}-xm-examples =3D "\
>>> @@ -692,6 +696,16 @@ FILES_${PN}-xendomains +=3D "\
>>>    ${sysconfdir}/sysconfig/xendomains \
>>>    ${systemd_unitdir}/system/xendomains.service \
>>>    "
>=20
> A newline should go here but it can be added later - no point holding
> this back for it.
>=20
>>> +FILES_${PN}-xen-access +=3D "\
>>> +    ${sbindir}/xen-access \
>>> +    "
>>> +
>>> +FILES_${PN}-xen-memshare +=3D "\
>>> +    ${sbindir}/xen-memshare \
>>> +    "
>=20
> I would suggest using just '=3D' instead of '+=3D' for future additions
> like these, but since there are already other instances of using '+=3D'
> in this file, I think it's ok for this to go in as is.
>=20
>>> +
>>> +# memshare is only built for x86, so allow empty package for other
>>> +archs ALLOW_EMPTY_${PN}-xen-memshare =3D "1"
>>>=20
>>> INSANE_SKIP_${PN} =3D "already-stripped"
>>>=20
>>> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-
>>> extended/xen/xen-tools_4.14.bb
>>> index 73a52bc..a79b41d 100644
>>> --- a/recipes-extended/xen/xen-tools_4.14.bb
>>> +++ b/recipes-extended/xen/xen-tools_4.14.bb
>>> @@ -1,4 +1,4 @@
>>> -SRCREV ?=3D "456957aaa1391e0dfa969e2dd97b87c51a79444e"
>>> +SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>>>=20
>>> XEN_REL ?=3D "4.14"
>>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>>> @@ -6,8 +6,6 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
>>> SRC_URI =3D " \
>>>    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>>>    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>>> -    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
>>> -    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
>>>    "
>>>=20
>>> LIC_FILES_CHKSUM ?=3D
>>> "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4e5"
>>> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-
>>> extended/xen/xen-tools_git.bb
>>> index 1f6be1d..71850ee 100644
>>> --- a/recipes-extended/xen/xen-tools_git.bb
>>> +++ b/recipes-extended/xen/xen-tools_git.bb
>>> @@ -1,13 +1,11 @@
>>> -SRCREV ?=3D "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
>>> +SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>>>=20
>>> XEN_REL ?=3D "4.15"
>>> XEN_BRANCH ?=3D "master"
>>>=20
>>> SRC_URI =3D " \
>>>    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>>> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.14.patch \
>>> -    file://0001-xen-build-temporarily-inhibit-Werror-4.14.patch \
>>> -    file://0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch \
>>> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>>>    "
>>>=20
>>> LIC_FILES_CHKSUM ?=3D
>>> "file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4e5"
>>> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-
>>> extended/xen/xen_4.14.bb
>>> index 91e8988..653e3b6 100644
>>> --- a/recipes-extended/xen/xen_4.14.bb
>>> +++ b/recipes-extended/xen/xen_4.14.bb
>>> @@ -1,4 +1,4 @@
>>> -SRCREV ?=3D "456957aaa1391e0dfa969e2dd97b87c51a79444e"
>>> +SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>>>=20
>>> XEN_REL ?=3D "4.14"
>>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>>> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-
>>> extended/xen/xen_git.bb index 57791fc..2b62c5c 100644
>>> --- a/recipes-extended/xen/xen_git.bb
>>> +++ b/recipes-extended/xen/xen_git.bb
>>> @@ -1,4 +1,4 @@
>>> -SRCREV ?=3D "8c4532f19d6925538fb0c938f7de9a97da8c5c3b"
>>> +SRCREV ?=3D "9dc687f155a57216b83b17f9cde55dd43e06b0cd"
>>>=20
>>> XEN_REL ?=3D "4.15"
>>> XEN_BRANCH ?=3D "master"
>>> --
>>> 2.17.1
>>=20
>>=20
>>=20
>>=20
>=20
>=20

