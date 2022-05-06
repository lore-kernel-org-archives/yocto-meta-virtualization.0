Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253C0C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 13:04:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.53])
 by mx.groups.io with SMTP id smtpd.web10.9070.1651842244424807055
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 May 2022 06:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ZQg2GEJr;
 spf=pass (domain: arm.com, ip: 40.107.7.53,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TbqPuIhpDOz1IOLcDM4pFxQXYwNjbT/YuLonMZWWC4ufZmecLPrYNQ2YKHy2HuEDkIOEAxkOsnABeFMPcT6T/qC1PGVHY8EhLo+wXOnvd/1KPSBlekMA/nR+2bl/0hWxJ6t6FRQ4W+C8V5Ds69krHrt2rBufRpL4zRr3yUBsTW44W3d8VNASwasS1kwaafC272KCCRxOHl+WvJfGiNB7WrP6niZaAQFMqHH+6holKnS0BtZACHza1D4OKlJ/9G2kjedKEHIRlmSxcAgu1XJt4Y5fLEWs8WEN+0e6IjWGsHh6BpTRfbCGBnfUFUKUSXbBYY+AcHxqWuSlPA5D5UP2aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AB0flfsccYcct00n4kWkucoXp0uw7O8F03oNFkwK/so=;
 b=XukDDINp3otgnrliUSZ60rcNate3u8qK5ztf6VCJBEOJ/TiVoK9Ioy+66rzjTBFeM9F7qxLW7cX2+y3gcSCaHEzI3OJydLcD2MPoV+wLn1u21nMh5trEZpvUQiGdZz0H8bAPjUC2mF03e19FaaBoaCjLEemShZ2MnLhaw3NfYH2IJy+GWBJoyDKbTMVgdFuJ+Nxk12sxPQAySihmaxocl/pNZMqf3C5kyneYwez0pfeUlJkyhHx9HOj+TLW+35+cQlvh6VYtg/XcSML4XeD/wbrr/RCBWX2fC8cDk7CNpTd+8HENbv1QCj7CvGlPuXQXrJlpkKUXr2Ip9Dlum4aV1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AB0flfsccYcct00n4kWkucoXp0uw7O8F03oNFkwK/so=;
 b=ZQg2GEJrUfif7adfBIteOPi2azKHgj6VAK3Js+FUAd+l9L1qdxELDIkVs6YT998AwuMVgik2hrX+Obbuy8D5rC/QhXyQTktQxOoy/5PfsZ6o3KUALl6ZJCQuEfdM6xy8/sWSEapi7FD6s2AL3/iYQbYQW0Ubs/nHMhhRtYrXeMw=
Received: from AS9PR06CA0152.eurprd06.prod.outlook.com (2603:10a6:20b:45c::21)
 by DB9PR08MB7005.eurprd08.prod.outlook.com (2603:10a6:10:2c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Fri, 6 May
 2022 13:03:59 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::7b) by AS9PR06CA0152.outlook.office365.com
 (2603:10a6:20b:45c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Fri, 6 May 2022 13:03:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Fri, 6 May 2022 13:03:59 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Fri, 06 May 2022 13:03:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49b396f8f2d0e55f
X-CR-MTA-TID: 64aa7808
Received: from 613168841b66.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 443294D5-D51D-4D5A-8F7B-5BB362AA146F.1;
	Fri, 06 May 2022 13:03:53 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 613168841b66.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 06 May 2022 13:03:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BY2uoMgoQud5JxFdqAX8oLQYKfQfffT9V+IOgX6/b7pLt37rLSG+mTuAurdSd0yzENfgYhpumk8icVzfKr8jKs+cR9oxFx+RMSDsrTQGK4VSlSET/+g+cpbdyDSv+/N0Mm3JCthPccv/U8tDiuFxLiKvWhFe4kRJRmpgmyp4u17aUpm0RxdH01jENiuW9BGzUoCE1PDCmc1Y0mc6C7VvZvsfGIW2tYTO+7/uLdKnsHzLrCEWmr8yu1Omlz8qFcms/W7ITqkvcU8KNP3zwVLLGFygzY9zSC2JF760haWMkDRx0x+T7jWvPoMS+aenSWP9hGUXcl5FIGTHUWW/MPeHFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AB0flfsccYcct00n4kWkucoXp0uw7O8F03oNFkwK/so=;
 b=BzC6YJtRYUqDM42XKj4B9WEtW0NBCv2ohneZpqD8mZUHWj5xrIeveA2zm8u47gtYfAJVab+nzzh0+7Gv3d5zQCYZWheaKWFpjZhlcRE5l2s3ZGJ3fVPslYPKiXAmqJ1jTcimB/dg0msyTBF9hQRpukBUgFuJFYXfufHttNdMJkl7dwcX4OArViYTIP1K+TqTd6stdls2EVvV1w48/tz8sgBA5UbzDjiEAi/YFXYk2AOyyi2rHEOG5/eoB57wfqojxNK8QxqN+dToLypOcuxL9smMpnJEZ0yTs7q34H+DzjV+rldpUKit8SViJFVq1TYayR8x+/rpqPedfvWHPtha9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AB0flfsccYcct00n4kWkucoXp0uw7O8F03oNFkwK/so=;
 b=ZQg2GEJrUfif7adfBIteOPi2azKHgj6VAK3Js+FUAd+l9L1qdxELDIkVs6YT998AwuMVgik2hrX+Obbuy8D5rC/QhXyQTktQxOoy/5PfsZ6o3KUALl6ZJCQuEfdM6xy8/sWSEapi7FD6s2AL3/iYQbYQW0Ubs/nHMhhRtYrXeMw=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB5271.eurprd08.prod.outlook.com (2603:10a6:20b:ef::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Fri, 6 May
 2022 13:03:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5206.027; Fri, 6 May 2022
 13:03:49 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@cardoe.com"
	<cardoe@cardoe.com>, "dpsmith@apertussolutions.com"
	<dpsmith@apertussolutions.com>, "scott.davis@starlab.io"
	<scott.davis@starlab.io>, Diego Sueiro <Diego.Sueiro@arm.com>,
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Topic: [meta-virtualization][PATCH v2 1/3] xen, xen-tools: add
 recommendation for Qemu for non-hvm x86
Thread-Index: AQHYWpPid/oZQrV6gE+p6K0H2pRecq0G43AAgAAB4gCAAALWgIAJf9QAgAF2UIA=
Date: Fri, 6 May 2022 13:03:49 +0000
Message-ID: <E67177DB-D51F-4C4D-ABB7-92E2BC937C17@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-2-christopher.w.clark@gmail.com>
 <C3A15DC1-B8FA-41D5-9408-295188560535@arm.com>
 <CADkTA4MhC2yN4-At7MUy8JHPme5O8kzT-Cj4u6wPnfHuZ=n7nA@mail.gmail.com>
 <C28D13C0-958B-4AF1-950A-F25E15288072@arm.com>
 <CADkTA4MMzCMUM1-o-G5W=P7AXf5b4umHf=w3NEJEthLuHPMneA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MMzCMUM1-o-G5W=P7AXf5b4umHf=w3NEJEthLuHPMneA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 54940f95-92ea-4295-e7d3-08da2f60e2b8
x-ms-traffictypediagnostic: 
	AM6PR08MB5271:EE_|VE1EUR03FT003:EE_|DB9PR08MB7005:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB70051AC21C8B4FCB479E01749DC59@DB9PR08MB7005.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Fy9465YWDtA/B4JAfKU1OIsuZfc4WmeNtXLRwrGzKkKVmrJGcaH1eg3oUdGBj7mqY4ac++0ZZFzF0AKAkCtx+93GBqRcfB2tzh8LlSAxU8H2U2Y1defyVN2j4xmV01AtCQNKRDvFOQ2BmY0Pf6U1Cj/7KgIuZa9RPRS2ITVvSVLCv1TJHfs4QGztYv/jDUtr8eUwD6WWO/FGWLvXO0XIYqyITSv/nVqnG8IcFXcfDfqMY1g4x+VlMZmoQgISA+TaXXGuEYmnz91Ctsmnqav3rKywi/TnSDYcXneMzsgSvx7NipeijDHUfH3A7byAY9A6lISpFX7D1jHRyoUejAk6FIeaDZ6QvqahGv6VSPO/ezT5oXyEjdrsMg/3/yKFGumhktT0vrLBFVBMG3Fe6PyS2b4qyYOMjvNNnTC5erYFyXz3pbpLkqZGKuf82lxUTo9J3MbNvJ5SsUW1V5vpXo9rNpU2zHzRNTWSclOAGYChWy/T6CRMgP9oTYpGk8InisHJNvuFzACBR0NVl4BnrbMpwOgNH0ZJJdptOCdms3U5LkFMvJsiCAyXK12aKULaGlh+1vHRolNG3qGkfg2FT45imjpjipWJJJVRffp0qMgKuiqv/8b5H58LGd0jWKRFLsbKByUvUB+WfJbjYMqpFLgOgFHlxql7c+TlVuBSPoUqmWJ1ptA64CxoOaQWKjxvHKupyvZNZCffuoXTO3OolEmVJCXyqQUN44K1l2FuQaSNxCo4vvB6i307Uiv+WaEidIbN/FUFy5PEscpVuHCVbfPzEStZSCA9inQxXgR+v8feya7xiQgj0xKiX292bolVvnw/uvUP+xzBs95bjkCBMc5ZclxIfDotLCs1zRhVmh5DrWo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(508600001)(66446008)(64756008)(66556008)(66476007)(2616005)(91956017)(8676002)(66946007)(4326008)(5660300002)(33656002)(38070700005)(2906002)(186003)(71200400001)(8936002)(19627235002)(54906003)(83380400001)(6916009)(316002)(966005)(36756003)(6512007)(26005)(6506007)(86362001)(38100700002)(53546011)(6486002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8F5E5346A58A344BA28590944E8CD0C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5271
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	28205464-7e4a-4c69-82a8-08da2f60dcea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z3yWEjWryFShyKeN1xXhCrZL5UHwcYUj9/1POv+iElHsXTfF8rkMBGJlpMagXyrCBA4tO3a65uX1MRLolnUkMHBSL4tHzz9SUNsqKlDzh8stAV2itsIPkerZ/52M1NX9E88ymSaRhvTvDOuLu9cUsMgdXCbC4tOD06atTIQeAu0j/BTRJutjNXDSUuai4p/1fopGMTQBZwutBjdGMsuJIESzK++h7gQG27iOvZDlDwf68chTaYtDHf//Vr99aiwo5yJX4fV0I3GeNUyNDGp5R1QkJq07YvxHK5y0Lqg2AzsZnzl0DKdTZyNN5zgXU1r6F+BVMMBp3V4KxlRyiNetvtzCGuosCyevWFA2mK9KTSZ9a0OukRlC/n1yeKQ64nADc6NODxpTH+2ojvLTC4zQWuaf4ZOVf8eE+JqLdKxxKTiS/Gff0O4n6UVUasSNIDVfRJjalyLvu/Ww/sqWbhKM/LQDbIdFzcHpL9jzYchsU9MmJfNwyba588/a7FRO7G0vRJt1lOWW8QwhloMoVSs0ms1TGe9zKouznwYMO08AXulU4UhsB2pAV8ov0YXxmef+8okNJ2Qon/v03BuVilE4OHNYpIakgYph5rEuo2ILtOTWoBeff0ytq8kKJaUmdAyJFjCvjjPK+8rZ2plROeuifIYNdeqP0eqIsE+Dwk04HXonosbpzBA39Fk7zDnrGfELuAT2eSxBmCsakPtmDkq4IsJ0weS7iYg3e7d1RGDyXjmpbiUxgTKHs/8ZO/DpAdJXaw/CTPojkJdESX6nSbGavdTZZ7R01q8Fyf376B62ux0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(40460700003)(5660300002)(81166007)(356005)(70206006)(70586007)(966005)(36860700001)(2906002)(6862004)(8676002)(4326008)(54906003)(6486002)(53546011)(83380400001)(316002)(26005)(508600001)(6506007)(33656002)(19627235002)(107886003)(186003)(82310400005)(36756003)(2616005)(86362001)(336012)(6512007)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:03:59.2074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54940f95-92ea-4295-e7d3-08da2f60e2b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7005
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 May 2022 13:04:08 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7249

Hi Bruce,

> On 5 May 2022, at 15:44, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Apr 29, 2022 at 9:40 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>
>> Hi Bruce,
>>
>>> On 29 Apr 2022, at 14:30, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>>>
>>> On Fri, Apr 29, 2022 at 9:23 AM Bertrand Marquis
>>> <Bertrand.Marquis@arm.com> wrote:
>>>>
>>>> Hi Christopher,
>>>>
>>>>> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.or=
g <christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>>
>>>>> The Spectre and Meltdown mitigations for Xen run PV guests within
>>>>> HVM virtual machines, so Qemu is no longer only needed for systems
>>>>> configured to run HVM guests.
>>>>>
>>>>> With the split xen hypervisor and tools recipes, the bios dependencie=
s
>>>>> belong in the tools recipe, so move them and replace the hvm
>>>>> PACKAGECONFIG option with the recommendation based on target arch.
>>>>>
>>>>> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>>
>>>> I can build and run on x86 qemu and I get stuck during init in Dom0 (w=
hich is apparently already known).
>>>>
>>>
>>> It is likely the xencommond init.d still causing issues.
>>>
>>> I'm doing a revert of all those changes locally, and will start some te=
sts.
>>
>> Please let me know if you need some testing.
>> On my side, I have the issue on arm64, arm32 and x86 at the moment.
>
> I'm still able to build and boot here, so I haven't reproduced the
> issue .. so I'm still hesitating to revert all the xencommons changes,
> as I can't prove to myself they are the issue.
>
> I created a kirkstone branch today, and I'll be adding the latest Xen
> patches to it, but I need to get a handle on what everyone is seeing
> for failures.
>
> I assume you are still seeing problems with the boot on all the
> platforms you mentioned above ?

Here is the linux logs for dom0 on my system:
[    7.854317] EXT4-fs (vda): re-mounted. Opts: (null). Quota mode: disable=
d.
Configuring packages on first boot....
 (This may take several minutes. Please do not power off the machine.)
Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...
update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (continuing=
)
 Removing any system startup links for run-postinsts ...
  /etc/rcS.d/S99run-postinsts
INIT: Entering runlevel: 5
Configuring network interfaces... udhcpc: started, v1.35.0
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: broadcasting discover
udhcpc: no lease, failing
ifup: failed to bring up eth0
Starting random number generator daemon.
Starting OpenBSD Secure Shell server: sshd
  generating ssh RSA host key...
sync: ignoring all arguments
sync: ignoring all arguments
  generating ssh ECDSA host key...
sync: ignoring all arguments
sync: ignoring all arguments
  generating ssh ED25519 host key...
sync: ignoring all arguments
sync: ignoring all arguments
done.
Starting syslogd/klogd: done
Starting domain watchdog daemon: xenwatchdogd startup


And it stays stuck there.

This is arm64 but I have the same on x86 with almost the same logs.

If you want me to test something in particular to check if it solves the is=
sue, just tell me what.
I do not have much time to investigate right now but I will try to dig a bi=
t from middle of next week so please keep me in touch.

Cheers
Bertrand


>
> Bruce
>
>>
>> Chees
>> Bertrand
>>
>>>
>>> Bruce
>>>
>>>> Cheers
>>>> Bertrand
>>>>
>>>>
>>>>> ---
>>>>> Unchanged since v1
>>>>>
>>>>> recipes-extended/xen/xen-tools.inc | 9 ++-------
>>>>> recipes-extended/xen/xen.inc | 6 +++---
>>>>> 2 files changed, 5 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xe=
n/xen-tools.inc
>>>>> index 6bbc8cd..54bc477 100644
>>>>> --- a/recipes-extended/xen/xen-tools.inc
>>>>> +++ b/recipes-extended/xen/xen-tools.inc
>>>>> @@ -30,14 +30,9 @@ RDEPENDS:${PN} =3D "\
>>>>>
>>>>> RDEPENDS:${PN}-dev =3D ""
>>>>>
>>>>> -# Qemu is necessary on ARM platforms, and to support HVM guests on x=
86
>>>>> -QEMU =3D "${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'qemu', '', d=
)}"
>>>>> -QEMU:arm =3D "qemu"
>>>>> -QEMU:aarch64 =3D "qemu"
>>>>> -
>>>>> RRECOMMENDS:${PN} =3D " \
>>>>> - ${QEMU} \
>>>>> - ${@bb.utils.contains('PACKAGECONFIG', 'hvm', 'seabios', '', d)} \
>>>>> + qemu \
>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'seabios ipxe vga=
bios', '', d)} \
>>>>> ${@bb.utils.contains('PACKAGECONFIG', 'externalblktap', '', '${BLKTAP=
_RRECOMMENDS}', d)} \
>>>>> ${PN}-flask \
>>>>> ${PN}-hvmloader \
>>>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.=
inc
>>>>> index 8b86de5..4c38ccf 100644
>>>>> --- a/recipes-extended/xen/xen.inc
>>>>> +++ b/recipes-extended/xen/xen.inc
>>>>> @@ -9,13 +9,11 @@ require xen-arch.inc
>>>>> PACKAGECONFIG ??=3D " \
>>>>> sdl \
>>>>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}=
 \
>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
>>>>> "
>>>>>
>>>>> PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
>>>>> PACKAGECONFIG[xsm] =3D "--enable-xsmpolicy,--disable-xsmpolicy,checkp=
olicy-native,"
>>>>> PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,system=
d,"
>>>>> -PACKAGECONFIG[hvm] =3D "--with-system-seabios=3D"/usr/share/firmware=
/bios.bin",--disable-seabios,seabios ipxe vgabios,"
>>>>> PACKAGECONFIG[externalblktap] =3D ",,,"
>>>>>
>>>>> DEPENDS =3D " \
>>>>> @@ -132,7 +130,9 @@ EXTRA_OECONF +=3D " \
>>>>> --disable-rombios \
>>>>> --disable-ocamltools \
>>>>> --disable-qemu-traditional \
>>>>> - ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', '--enable-pvshim'=
, '--disable-pvshim', d)} \
>>>>> + ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', \
>>>>> + '--enable-pvshim --with-system-seabios=3D"/usr/share/firmware/bios.=
bin"', \
>>>>> + '--disable-pvshim --disable-seabios', d)} \
>>>>> "
>>>>>
>>>>> EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/vgabios-0.7a.bin"
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#7226): https://lists.yoctoproject.org/g/meta-virt=
ualization/message/7226
>>>>> Mute This Topic: https://lists.yoctoproject.org/mt/90743682/3619089
>>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/uns=
ub [bertrand.marquis@arm.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>
>>>>
>>>> IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

