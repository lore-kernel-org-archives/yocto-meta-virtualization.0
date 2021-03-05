Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.61])
 by mx.groups.io with SMTP id smtpd.web12.10051.1614940172595002382
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 02:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pqPeFHfr;
 spf=pass (domain: arm.com, ip: 40.107.1.61, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnafNTSO6zGdyPkHRdNExM61ZSbst6r+/S+1T1HHUR0=;
 b=pqPeFHfrg8IxcPoypOk5AiHpd6JODH8mi7Kdnn/er5ThyF4GykSW6N2sX0ENMgJFnpausQeriffwb6bSRpxxt7nmj2HUdQYBNM9xFfPNyqGQQ/TbeBxXkDspx3Ak05ZXl/5CZ6zJOFvCKh7L7XbiJ/L+eC1G8f9wohz+r65tNyI=
Received: from DU2PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:3b::31)
 by AM6PR08MB4471.eurprd08.prod.outlook.com (2603:10a6:20b:b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 5 Mar
 2021 10:29:23 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::bd) by DU2PR04CA0026.outlook.office365.com
 (2603:10a6:10:3b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 5 Mar 2021 10:29:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 10:29:22 +0000
Received: ("Tessian outbound 72bd4bdd1f59:v71"); Fri, 05 Mar 2021 10:29:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a99f64496b1090d4
X-CR-MTA-TID: 64aa7808
Received: from 62f55e515aea.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 208A405D-7521-498F-83FB-7C7DDDF7C852.1;
	Fri, 05 Mar 2021 10:29:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 62f55e515aea.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 05 Mar 2021 10:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6zYBekqvzgR5vBN07JB6jSKyEhyl4+zY5LIPWoXjrWESFWjr3NPrybkoJymjlFx909y1pNVN8qMUjdgRgws5mHVMITYmlJH79sMEcGGlfwrlHHlJeLbCi6gJdWNMwYgV5IUcndXmWToQ2OHjvbRfgjzkXLNmrGFXYBdZ6pom5c/EflEqskjGc3EkyHTYw9yH+l/0+H9HjoeU+f84+z1XrS3xBcRkIJtydnhpIwfsxpj1/maIQklAQkFpytHqBibubEactj+Aa0rzh0vc+iVyR4qE5eI0mkUOEVrML3TNRE1Dnq2KKOguv+oWItBm5pTyv/RfaZgUE8prB/ToeqZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnafNTSO6zGdyPkHRdNExM61ZSbst6r+/S+1T1HHUR0=;
 b=brq3+rZKvBr94I0IWqDVHE6TZilnqXhq54m1/pxDTK3ELtbkViGOEAsc8t7vguxFZLYAfEbxkw2IPtgGoXU1izusSrjycfSJlV2zbY79YuHkKp7sQkJPH78xped1+TlldElHvml1OWhOqK0v4suJzYtYj1dn3UhsvzchbXVCxXsOiEALOpWCxp+6EydYsjCpTAsHKGht3r2V0uLY/MRO6Pcpw3pcGhiF9dLPpPpupWYNu4wHyM/tZ2atoMMF2wZezdf0NbJqie6wlxji86UcSVnxNLz72xC+AimDOLx2OYBj0/OKiss0l4741Sfs60YgXuDMJOkyAhD0mUaQYhpFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnafNTSO6zGdyPkHRdNExM61ZSbst6r+/S+1T1HHUR0=;
 b=pqPeFHfrg8IxcPoypOk5AiHpd6JODH8mi7Kdnn/er5ThyF4GykSW6N2sX0ENMgJFnpausQeriffwb6bSRpxxt7nmj2HUdQYBNM9xFfPNyqGQQ/TbeBxXkDspx3Ak05ZXl/5CZ6zJOFvCKh7L7XbiJ/L+eC1G8f9wohz+r65tNyI=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB4816.eurprd08.prod.outlook.com (2603:10a6:802:a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 5 Mar
 2021 10:29:09 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3912.022; Fri, 5 Mar 2021
 10:29:09 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and current master
Thread-Topic: [meta-virtualization] [PATCH] xen: Bump SRCREV to 4.14.1 and
 current master
Thread-Index: AQHXBgePIItmbU+MdE+eSLqW56Z0N6p0LeOAgAAKsACAARAdAA==
Date: Fri, 5 Mar 2021 10:29:09 +0000
Message-ID: <43E84DAA-BAD4-4A34-9046-7E13420A12CF@arm.com>
References: <1664DFE1A4BA4F42.31496@lists.yoctoproject.org>
 <B6A0774C-AAB4-4239-8791-5AD3E0C7E96C@arm.com>
 <CADkTA4P_m8_L5r6=x+nZ7qZr9bf2O87MmJTdwYAR=xv9Em9QAQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4P_m8_L5r6=x+nZ7qZr9bf2O87MmJTdwYAR=xv9Em9QAQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6a86697a-2ab9-4a41-0dab-08d8dfc18b1a
x-ms-traffictypediagnostic: VE1PR08MB4816:|AM6PR08MB4471:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4471C4489C4B957C036DF27D9D969@AM6PR08MB4471.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WNw9yVUB1YpYhBvS/GrxK3Ge3EfAzCoTOP8+uD3mcBhbkAUgsxF7XMw4oNlramf/rgA9u8C54dELzsq3bpSWKbj7E7/d3Z+gE0eJLq9J9F17DZudU3xXSH+Fuom8HQvq/iLmOs3Jwg9rQtJ8KouELSXdb8ZaHxfbW9ynODkx0mfYvW2Mzj2mIPz1U+U5gHIdojyIuQLENqn3WxCtSTS5fjndLRCPyCorTtTddKNY6I7TdFdt0nMpzS/Q+VF5NsfsqfIlXdwe8lTdFDGWqqq2NGDHk5mpunTpZNlx4r4tCw6E8NsXOcxSmEF8h7qD/WKJAqHs8YamUUKbLJX+ChvEuTayodu6jtp1Dw6dV2Mu8txyX4GOdUEkTzTuNNAdTf0THSh+9MoS8K5ay72GjgCVRu9A5PIooFdTOMXHP9lqYvVworSA2/O45CsjwT2vFteVhQFZYjmCCK20RZfcZkFquq/JbCH0M6yHXXh8t0unn+o+E8XHSGzALn+vQD3aCZ7b4eSOiyh/3E85AmnSlZgV4IwiOuNi0dXxlZ/YEyQ/mPLa0wkCsjwBWprqUOwuZxS79IkHfVL65KXBSPX8UAex+zfs+ycMtxujbODDSXBo4VsGH+OSIIGu7ySiHlvmDYUg04ws746F6xRnAPBmRAlnGw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(6916009)(186003)(26005)(4326008)(316002)(54906003)(53546011)(2616005)(91956017)(66476007)(76116006)(6506007)(6512007)(33656002)(71200400001)(86362001)(966005)(64756008)(478600001)(83380400001)(66556008)(30864003)(55236004)(2906002)(6486002)(8936002)(8676002)(36756003)(5660300002)(66946007)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?eATMWsQNWmCinOf2uo+4NEvxOCpIXP4RbdC2FwHm+MKNpZ23nCZPO8eAkb+H?=
 =?us-ascii?Q?zCjIS6te4hzmcvi+IoJOzPs8m9cx+DAY/RTGyLpCzt4wGU35/DhdXdwEVEhR?=
 =?us-ascii?Q?wmOWRdq/1lTHSlLHACQWwTl5a/bpCo6/GpBbEfc74Y6t58L9Q1g3ovgc5iPc?=
 =?us-ascii?Q?s3WkJMO3W5/VYxC+zTCBVO6nc5696zXAfCPLy1kb0wGjitlHORVhxF1H+2Uw?=
 =?us-ascii?Q?6/RQD3CvyP8wtOKYXCDbIRC7fehmhXieslja2dZNhayyXaXbant1aaiGx/15?=
 =?us-ascii?Q?BehwlZHmCcGm6UBRBLOnoNYvoq2DSDimlgDuXDtMdU3GFA1qU0d+BP/Yqrvh?=
 =?us-ascii?Q?ELXyBdtEBn9vEdsYJq4cQny7iXX+tnb2FzySmp94x+ZXfFHllCbVivr0++Eu?=
 =?us-ascii?Q?v1yU+c8PnwWLSjipfIoFll2FiDzxzWLphNF94Ts5Nr0jvnQ63gm8TWTDzYQR?=
 =?us-ascii?Q?UoWypPtjj0QIaqfWzJm6hR87G3LIY1YIajPTVcQzNoL85+mXd/fz6kJME9aB?=
 =?us-ascii?Q?7EfTvvDt0ayto8vHvYfYUECK8VsXkHvwgZngvrpYLZwUN877XhYVN9iZ1BkW?=
 =?us-ascii?Q?j4QtUOWUU1Wao0C3MrnroYQW5+H8fjqOs/qM0wff2YiWfvOHirI7t2BVMzIY?=
 =?us-ascii?Q?s19cpGKPYrTQKuX6V5EyLGNSIr6dj3LItnrXfpOVG6BM+lWmT7mK+6tXif28?=
 =?us-ascii?Q?kTRqC9uakc07w20eIZSmyk49WAU5u3K2wDjtxOAZasL/3xuxJBC+KV1UHXEF?=
 =?us-ascii?Q?guoj7GMfykr1UnsLWOG1rr9QeNu+TLFJWHHbPZgG/GYyMrigp58YIzwXMDzA?=
 =?us-ascii?Q?uT1/T85uwseUnezVtPY7JIiAW6deI8j4EmZKAgA5rGdhy+QM9hT1NO+26FWh?=
 =?us-ascii?Q?CT7CqTeQR+IuZ1I/vcGX/OfnQ0e2dHZO4GvQHnif7KJ1FpgQZ8uhFpv9vvSW?=
 =?us-ascii?Q?qPK/Kc95gO4gdvrRPaGJV12eVdhPAEg3EQbObJrcrwlcRgS4DcPcaA0GTOjI?=
 =?us-ascii?Q?ReY4E6V4f9kCLqUF0LxWuOIoiEo5fJvAtJh1Uh0ISbxq2FhEVixgSfGLwuXm?=
 =?us-ascii?Q?8QUNr3UVhw8grwAXrXl0IUntD/QlxEFLw26cRPPQsBgfYbNS6J/sm/vwkQsE?=
 =?us-ascii?Q?5SlndN0cnxb+CNu8q4k8yVjVPF0kzI9Y5YRBUq9MsIPlo2xEmrIjsi3CFrAB?=
 =?us-ascii?Q?UJ+ecY1zSFQz3dbx41OGPKiSUZlgnw/OBa41Urq+JDJAglPhYuGMyzr+EQBP?=
 =?us-ascii?Q?hGqrg5J6MxM9PydGCZGJrPg2et2D3Z0KSQjuRdgqHPf6cK7qUYOHOW5ots5p?=
 =?us-ascii?Q?YPfapaPk1xav5cpljbmAurGq?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	13d5efaf-bb9d-40a0-45fa-08d8dfc18324
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MgKeVyL0lOy2AXDm37zPnjorUt8ZHUzz49Y/PL/aKTH9FYDKpLMEKw3NCTQ/B5P3/O1ItG+SsHc12eZZEQ4Ec5XnUXOS7D61GclbgY/qunD0vRze853W/LVzMYSVOzbi/MYB/ENqYpVv0ZDhEC+nLO2ERHtciAii1rSqhSjUfcUTZ16PRgP7bTRMx/Y7L8g3yC8YigiEe5nV9VsSgKupuS8I9SYDaWRWmRP8PLL5VvK0UnBa+0OKhb5wQPu+Si5eT1JSsusOjg6n33iNsb5u2N/8R9hCjeLt+cZWfCPfLv/79pQI/0C62U2q3LeJxAYyE85S1eegJxAV3hIXmXL44Rd5yBQ7KOGuxDRES5no7XD4j4wVQ9KBqpSkBYNZbR460a1n88mVCU/uF95BJFwrhgeEqO9M2+bjQyKgj6jN+aKyTqdgvr2GgVCPKTZarr+DZCxze4ODtqAtPZV3gDZsQH98VaSTgKNsHCVjQuf7B2iw3ZbN33RlYGT0J4D22qmdFseWxr4HMHCSJX9rSQYv8y7gJvju8B4kB8I1ZE4CQXqB2i4tcDipeZjuUGofp12eT2oGOnIE3GqUbwDtrJdpfajBMCYKlvoO+SgO/APRJpigZzapDHVpDk3FAK12wXMQd2ZFe9nLLIgXoOsjEPdoOKSmNI9ILzXROedGkGABjNP7Ixg7MmL4Xqvy039Ee55E8sREshkd+3Zto8LDvicHMqWtaOZglYFWKPrJNAqVM7I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(36840700001)(46966006)(966005)(33656002)(81166007)(83380400001)(316002)(356005)(36860700001)(47076005)(82740400003)(36756003)(82310400003)(6512007)(53546011)(86362001)(6862004)(5660300002)(70206006)(8676002)(6506007)(2616005)(336012)(6486002)(4326008)(30864003)(26005)(186003)(54906003)(478600001)(70586007)(8936002)(2906002)(55236004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 10:29:22.8267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a86697a-2ab9-4a41-0dab-08d8dfc18b1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4471
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22E4E996F3AF9E43BA28C1A99D3FB4A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 4 Mar 2021, at 18:15, Bruce Ashfield <bruce.ashfield@gmail.com> wrote=
:
>=20
> On Thu, Mar 4, 2021 at 12:37 PM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>>=20
>> Hi Bruce,
>>=20
>>> On 18 Feb 2021, at 15:05, Bertrand Marquis via lists.yoctoproject.org =
<bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>>>=20
>>> This allows to remove some patches related to gcc 10 support which hav=
e
>>> now been merged in Xen.
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
>> This has now been reviewed by several persons.
>>=20
>> When do you think you could check and maybe merge this ?
>=20
> It's in the queue.
>=20
> Christopher only gave me the thumbs up yesterday, so regardless of how
> long it has been on the list, it has only been 24 hours or so since it
> has gotten all reviews done.

Sorry my mail was just meant to be a friendly ping and not a criticism :-)

Thanks a lot for the merge.

Cheers
Bertrand

>=20
> Bruce
>=20
>>=20
>> Cheers
>> Bertrand
>>=20
>>> ---
>>> ...ython-pygrub-pass-DISTUTILS-xen-4.15.patch | 73 +++++++++++++++++++
>>> ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 ---------------
>>> ...uild-temporarily-inhibit-Werror-4.14.patch | 26 -------
>>> recipes-extended/xen/xen-tools.inc            | 14 ++++
>>> recipes-extended/xen/xen-tools_4.14.bb        |  4 +-
>>> recipes-extended/xen/xen-tools_git.bb         |  6 +-
>>> recipes-extended/xen/xen_4.14.bb              |  2 +-
>>> recipes-extended/xen/xen_git.bb               |  2 +-
>>> 8 files changed, 92 insertions(+), 95 deletions(-)
>>> create mode 100644 recipes-extended/xen/files/0001-python-pygrub-pass-=
DISTUTILS-xen-4.15.patch
>>> delete mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-gc=
c10-snprintf-warning.patch
>>> delete mode 100644 recipes-extended/xen/files/0001-xen-build-temporari=
ly-inhibit-Werror-4.14.patch
>>>=20
>>> diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUT=
ILS-xen-4.15.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DIS=
TUTILS-xen-4.15.patch
>>> new file mode 100644
>>> index 0000000..35cd9a8
>>> --- /dev/null
>>> +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen=
-4.15.patch
>>> @@ -0,0 +1,73 @@
>>> +From 6db88791d923167f160afbcadeffad84a4cbdbc5 Mon Sep 17 00:00:00 200=
1
>>> +Message-Id: <6db88791d923167f160afbcadeffad84a4cbdbc5.1612262706.git.=
bertrand.marquis@arm.com>
>>> +From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>>> +Date: Fri, 19 Oct 2018 11:01:37 +0200
>>> +Subject: [PATCH] python,pygrub: pass DISTUTILS env vars as setup.py a=
rgs
>>> +
>>> +Upstream-Status: Xen: Inappropriate [oe specific, python install issu=
es]
>>> +
>>> +Allow to respect the target install dir (PYTHON_SITEPACKAGES_DIR)
>>> +as well as other parameters set by the OpenEmbedded build system.
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
>>> +diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
>>> +index 37b2146214..ffb9270065 100644
>>> +--- a/tools/pygrub/Makefile
>>> ++++ b/tools/pygrub/Makefile
>>> +@@ -10,7 +10,7 @@ INSTALL_LOG =3D build/installed_files.txt
>>> + all: build
>>> + .PHONY: build
>>> + build:
>>> +-    CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=
=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build
>>> ++    CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" LDFLAGS=
=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py build $(DISTUTILS_BUILD_ARGS)
>>> +
>>> + .PHONY: install
>>> + install: all
>>> +@@ -18,7 +18,10 @@ install: all
>>> +     CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" LDSHARED=3D"$(CC)" \
>>> +             LDFLAGS=3D"$(PY_LDFLAGS)" $(PYTHON) setup.py install \
>>> +             --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
>>> +-             --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN=
) --force
>>> ++             --root=3D"$(DESTDIR)" --install-scripts=3D$(LIBEXEC_BIN=
) --force \
>>> ++             $(DISTUTILS_INSTALL_ARGS)
>>> ++    rm -f $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
>>> ++    $(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygr=
ub
>>> +     set -e; if [ $(bindir) !=3D $(LIBEXEC_BIN) -a \
>>> +                  "`readlink -f $(DESTDIR)/$(bindir)`" !=3D \
>>> +                  "`readlink -f $(LIBEXEC_BIN)`" ]; then \
>>> +diff --git a/tools/python/Makefile b/tools/python/Makefile
>>> +index cc76423647..5cb11ae453 100644
>>> +--- a/tools/python/Makefile
>>> ++++ b/tools/python/Makefile
>>> +@@ -12,7 +12,7 @@ setup.py =3D CC=3D"$(CC)" CFLAGS=3D"$(PY_CFLAGS)" L=
DSHARED=3D"$(CC)" LDFLAGS=3D"$(PY_LDFLA
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
printf-warning.patch b/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc=
10-snprintf-warning.patch
>>> deleted file mode 100644
>>> index 0a136c9..0000000
>>> --- a/recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-=
warning.patch
>>> +++ /dev/null
>>> @@ -1,60 +0,0 @@
>>> -From 0dfddb2116e3757f77a691a3fe335173088d69dc Mon Sep 17 00:00:00 200=
1
>>> -Message-Id: <0dfddb2116e3757f77a691a3fe335173088d69dc.1604734077.git.=
bertrand.marquis@arm.com>
>>> -From: Bertrand Marquis <bertrand.marquis@arm.com>
>>> -Date: Thu, 15 Oct 2020 10:16:09 +0100
>>> -Subject: [PATCH] tools/xenpmd: Fix gcc10 snprintf warning
>>> -
>>> -Add a check for snprintf return code and ignore the entry if we get a=
n
>>> -error. This should in fact never happen and is more a trick to make g=
cc
>>> -happy and prevent compilation errors.
>>> -
>>> -This is solving the following gcc warning when compiling for arm32 ho=
st
>>> -platforms with optimization activated:
>>> -xenpmd.c:92:37: error: '%s' directive output may be truncated writing
>>> -between 4 and 2147483645 bytes into a region of size 271
>>> -[-Werror=3Dformat-truncation=3D]
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
>>> -diff --git a/tools/xenpmd/xenpmd.c b/tools/xenpmd/xenpmd.c
>>> -index 35fd1c931a..12b82cf43e 100644
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
>>> -+            ret =3D snprintf(file_name, sizeof(file_name), BATTERY_I=
NFO_FILE_PATH,
>>> -                      dir_entries->d_name);
>>> -         else
>>> --            snprintf(file_name, sizeof(file_name), BATTERY_STATE_FIL=
E_PATH,
>>> -+            ret =3D snprintf(file_name, sizeof(file_name), BATTERY_S=
TATE_FILE_PATH,
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
ibit-Werror-4.14.patch b/recipes-extended/xen/files/0001-xen-build-temporar=
ily-inhibit-Werror-4.14.patch
>>> deleted file mode 100644
>>> index 0e0a3dc..0000000
>>> --- a/recipes-extended/xen/files/0001-xen-build-temporarily-inhibit-We=
rror-4.14.patch
>>> +++ /dev/null
>>> @@ -1,26 +0,0 @@
>>> -From 9cff3bf8425ccc593825fcde8ca5eaa32a43d04d Mon Sep 17 00:00:00 200=
1
>>> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> -Date: Thu, 18 Jun 2020 09:05:22 -0400
>>> -Subject: [PATCH] xen/build: temporarily inhibit Werror
>>> -
>>> -Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> -Rebased on Xen 4.14:
>>> -Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>>> ----
>>> - tools/libxl/Makefile | 2 +-
>>> - xen/Rules.mk         | 2 +-
>>> - 2 files changed, 2 insertions(+), 2 deletions(-)
>>> -
>>> -diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
>>> -index 6da342ed61..c67560e269 100644
>>> ---- a/tools/libxl/Makefile
>>> -+++ b/tools/libxl/Makefile
>>> -@@ -11,7 +11,7 @@ MINOR =3D 0
>>> - XLUMAJOR =3D 4.14
>>> - XLUMINOR =3D 0
>>> -
>>> --CFLAGS +=3D -Werror -Wno-format-zero-length -Wmissing-declarations \
>>> -+CFLAGS +=3D -Wno-format-zero-length -Wmissing-declarations \
>>> -     -Wno-declaration-after-statement -Wformat-nonliteral
>>> - CFLAGS +=3D -I. -fPIC
>>> -
>>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen=
/xen-tools.inc
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
>>> +FILES_${PN}-xen-access +=3D "\
>>> +    ${sbindir}/xen-access \
>>> +    "
>>> +
>>> +FILES_${PN}-xen-memshare +=3D "\
>>> +    ${sbindir}/xen-memshare \
>>> +    "
>>> +
>>> +# memshare is only built for x86, so allow empty package for other ar=
chs
>>> +ALLOW_EMPTY_${PN}-xen-memshare =3D "1"
>>>=20
>>> INSANE_SKIP_${PN} =3D "already-stripped"
>>>=20
>>> diff --git a/recipes-extended/xen/xen-tools_4.14.bb b/recipes-extended=
/xen/xen-tools_4.14.bb
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
>>> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e=
44a4e5"
>>> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/=
xen/xen-tools_git.bb
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
>>> LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e=
44a4e5"
>>> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/x=
en_4.14.bb
>>> index 91e8988..653e3b6 100644
>>> --- a/recipes-extended/xen/xen_4.14.bb
>>> +++ b/recipes-extended/xen/xen_4.14.bb
>>> @@ -1,4 +1,4 @@
>>> -SRCREV ?=3D "456957aaa1391e0dfa969e2dd97b87c51a79444e"
>>> +SRCREV ?=3D "ad844aa352559a8b1f36e391a27d9d7dbddbdc36"
>>>=20
>>> XEN_REL ?=3D "4.14"
>>> XEN_BRANCH ?=3D "stable-${XEN_REL}"
>>> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xe=
n_git.bb
>>> index 57791fc..2b62c5c 100644
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
>>>=20
>>>=20
>>>=20
>>>=20
>>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

