Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBC8C63709
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web09.12915.1649949743226134040
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Apr 2022 08:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=JOComvfA;
 spf=pass (domain: arm.com, ip: 40.107.20.79,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpc7EfgIB/fnTorVI6SP342Q51E8SbAb9jlMpUUCC/o=;
 b=JOComvfAOzNUKjWGVs1TQaUxpkuqjWA/IZ34szTXb4938zYQBHdLNPnhvccUMzvAVgc5vgEMM1SSzMuTSxb6C6iVEi+Y6FgDnCLtfNNIKhfuAjO0qhrNSQ2j/wvqELGiBE5fm3XwB8yiE0uf0PVYbVVFjnrrvun4NKk4OnX6qqE=
Received: from AM7PR03CA0003.eurprd03.prod.outlook.com (2603:10a6:20b:130::13)
 by VI1PR0802MB2239.eurprd08.prod.outlook.com (2603:10a6:800:a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 15:22:19 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::d0) by AM7PR03CA0003.outlook.office365.com
 (2603:10a6:20b:130::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Thu, 14 Apr 2022 15:22:19 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Thu, 14 Apr 2022 15:22:17 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Thu, 14 Apr 2022 15:22:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 68ce44e3f462722c
X-CR-MTA-TID: 64aa7808
Received: from b0286001bee2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1A847B3-F579-473A-8D02-7FC7EBD4D054.1;
	Thu, 14 Apr 2022 15:22:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b0286001bee2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Apr 2022 15:22:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEwYuW3GYvFzJNIxXkwU9h4LJPXJ7emOGhZglrDVobO32v8Maa3hLvG9scFGQs4BBZUqvA2+vBZS/jXFTSQErOU3X6fPcCbPTnrQZ0yP6c0z6V1hSkBBxrX1yqLezo0bwwiQULaN0iAYRFHVuwH71jwybQf8/unSwX5J6Gp3pIh8Q4PlLTFNq2UuglhnWXZKR7HlG1WeE/k1/6yQtbjiTpRNZmsJTzfoVjGQuetW7NpzAc93/Fkcijug5PXvAWDKWRoP6geNwZ8xnIzTUAeXnmPfYRw6nD8GDIU0pRO6jia8NML2/YKbIahmorQ8biV4dfqctEQ8ix2oAJUFpj0F/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpc7EfgIB/fnTorVI6SP342Q51E8SbAb9jlMpUUCC/o=;
 b=UTvYa1DF9J5QpmnT8I9y0OUr8l7APIXkJKoV1OJdQicSIvDhOxVi0BqgTTu8siQPDsQYoPq0QqdA4jHrjpZYMaqr+KiSNRVEAAvkeLYxbceBvzwTINRoq9KOgdPqtXxohkXCjotuhjV/ei8ZxE+/CQAeylOr/LiWb9C/BmdpKEIBqaVAzs4XVOkkBOnaM+p6ZNETxCCAITIce/XrJiViS8SVIoVbS7ezvOcmvGmrL0TEces2SFMqN/RAUy8tY8a3FtELrxdI8GBsiq4oMrvW8vBS7XQWzypT4bZ72TmGgbjIxS5+uNFT7x8sm3MX90LKKGlnCHtbR/Tw9xJyfNvw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpc7EfgIB/fnTorVI6SP342Q51E8SbAb9jlMpUUCC/o=;
 b=JOComvfAOzNUKjWGVs1TQaUxpkuqjWA/IZ34szTXb4938zYQBHdLNPnhvccUMzvAVgc5vgEMM1SSzMuTSxb6C6iVEi+Y6FgDnCLtfNNIKhfuAjO0qhrNSQ2j/wvqELGiBE5fm3XwB8yiE0uf0PVYbVVFjnrrvun4NKk4OnX6qqE=
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by VI1PR08MB2765.eurprd08.prod.outlook.com (2603:10a6:802:18::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 15:22:03 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::e05d:b3fc:609a:df20%6]) with mapi id 15.20.5164.020; Thu, 14 Apr 2022
 15:22:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Michal Orzel <Michal.Orzel@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Christopher Clark
	<christopher.w.clark@gmail.com>, Doug Goldstein <cardoe@gentoo.org>, nd
	<nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen and
 xen-tools
Thread-Topic: [meta-virtualization] [PATCH 0/3] xen: Update recipes for xen
 and xen-tools
Thread-Index: AQHYSyT3PeROfVQ/8EmQnVCX2MDFSKzuxO4AgABQiwCAAHsDgA==
Date: Thu, 14 Apr 2022 15:22:02 +0000
Message-ID: <68B08222-1DB9-436E-897C-7A19C030776C@arm.com>
References: <20220408084420.102085-1-michal.orzel@arm.com>
 <CADkTA4MxDwunJex7NnjFpLs2k0sUo354XUysH0PeYww+gYxA_A@mail.gmail.com>
 <A524ADAA-241A-4206-AA65-6B2778D5FE01@arm.com>
In-Reply-To: <A524ADAA-241A-4206-AA65-6B2778D5FE01@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 32a68184-59e0-4077-9120-08da1e2a8fca
x-ms-traffictypediagnostic: 
	VI1PR08MB2765:EE_|AM5EUR03FT012:EE_|VI1PR0802MB2239:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB223975EA4498468204FFCC919DEF9@VI1PR0802MB2239.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /fcVlEavu1ncTjnsND/1229O7VrcrjJc29h4gCd8M/6MAwJAeLKGM+D4+5PWkHP/iub8+U9FuAoB2tdM6JBLtN7EpgPh1DWY/PFvo9W1cfLM8tVYbY2iGWTckGywa1QSxYx69XVvRpdN2nMe7j/4qwRcxX7PealNhg0yH9M2oOyLCreY7aF0ry3yPdP/O2nI0asnCruTNvY3bqjOQjzGyOR1lclGlkgKea26r0ut64J7Z5bVAtuUTd0ddBO9ACUSty2GEMImG5zbKLpVb4CzonO9oPE62KthGyR4JlvFsB7YF4p0DGbR38CITDELQJGYXIxpAfuq49sQqUKqTMpSi3bs8wQXA99BVI2HIJ0eFLoPrUVSrjzwuKj1DxRK3n+bqdQDhezImOEJqBpQzqeNsIyF72RRzhfjrxzyvcJfr9OQHvlWgVSD50GNcagqNk70ARonKQgyxWF42fe1/BjgPq5/PuL1UOgumoqVutJApJ5zBFyad7+cwXMfw7J5/5xm3iTPZQF3CigiI6JRFDzBOFTO+ohjxWZYtistoWZ4gCaOPmHORX4YP6poeNUTWnXxp2qLysiCwOvTIxyOZ1JJRSWdOHhyJrIHgVm6Poxt8Vi33QGN5K5ebPZRiFx/OMioCZPWBOVWBs5Of/q0S6PQ1ob02+nYksUR1pnNSGNmQXCwgr72JIhowbSXgADYYg+8fP6WjobUHck7Qpf80bNWjZDHG0pD/atG7SUh/MCo0Po920XR2tFpB4epkZe8cZ1+
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(6916009)(508600001)(83380400001)(6486002)(4326008)(91956017)(8676002)(86362001)(66946007)(64756008)(33656002)(36756003)(54906003)(66446008)(66476007)(66556008)(76116006)(2906002)(8936002)(15650500001)(4744005)(186003)(5660300002)(26005)(6506007)(316002)(71200400001)(6512007)(53546011)(38070700005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C127509AA9CEA64F996E585A109DFD6D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2765
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	789d7560-aeaa-4df6-213d-08da1e2a86ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S1k4FjZV/vzxjD68zZvllwMioeWYrnoSorah7Ttm44HS4j9DcKU006vnSoGW+Vv45fiAN3wUEIuoGvOLaNpGEaiGMkZgdbrpEJSMZ6llLLw0BJOpqbFEDrzT2hTkBLkGn4uxn2BqL/KwPPShekDcVU1f87NDYKYMsrt0E6nfyY9Dkpv62VvSS8vt38HDSPnaUP0upa0HJ5XDV0mBKwwyBDmCTkE4NNiofpNe+1/iiYOVoEJBblmDLL35/xFCmFYw9Tg37blBmQMYrg5rULV+0hvSN1VrYDIjNulYmLhDJXRCOZa0TJc028tfB6+P9y+bw8NeGL0LrMl8+dy+WaGmOlYHiQmhPL9RpnyjQWcxx2Gsl7u07kKI56aMjWObuwbxfktiNQzjtndg+0HR/i57jcADoKJgkhckECwdSw6mEKZHsGb5Ijt2zGEfhJ+ZLIME/y07yLUqBFSJorR3jiEXvK+t6bt8BXI7YR/zvtdCY/HV5SbuRIRY5GxEqAVPE8oyfIFtbaHfJCKaYT9l4GTR7CbM4ZLNz1YZEE/1aZoFcl7symYwFltriN6Gon7hMt0GlPCcwToQdH+rzU8nPzx/IXwjBz6vZDe1tYqF608Wey3ygsWuFf9PER+Dkn0fSpS8DyrsfDZJndCezNhnUNWh9quPawt7MNqBNyboYVi+eWbfQP0/QgyM6hCFiJ2dPlskz+Z75SKyKm2zAziiEAv9hA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(356005)(70206006)(33656002)(63370400001)(63350400001)(70586007)(83380400001)(316002)(47076005)(54906003)(81166007)(4744005)(2906002)(8936002)(36756003)(15650500001)(5660300002)(4326008)(8676002)(6862004)(26005)(336012)(186003)(53546011)(6506007)(2616005)(6512007)(40460700003)(86362001)(36860700001)(82310400005)(6486002)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 15:22:17.5599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 32a68184-59e0-4077-9120-08da1e2a8fca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2239
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7175

Hi Bruce,

> On 14 Apr 2022, at 09:01, Bertrand Marquis <bertrand.marquis@arm.com> wro=
te:
>=20
> Hi Bruce,
>=20
>> On 14 Apr 2022, at 04:13, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
>>=20
>> On Fri, Apr 8, 2022 at 4:44 AM Michal Orzel <michal.orzel@arm.com> wrote=
:
>>>=20
>>> Before the next Yocto release, Xen recipes need to be updated.
>>> This patch series:
>>> - updates 4.15 recipes
>>> - introduces 4.16 recipes
>>> - removes 4.14 recipes

In the meantime 4.16.1 was released.
SHA is f26544492298cb82d66f9bf36e29d2f75b3133f2

We can send an updated patch if you want.

Cheers
Bertrand


