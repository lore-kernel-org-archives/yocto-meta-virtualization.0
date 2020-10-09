Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.75])
 by mx.groups.io with SMTP id smtpd.web11.12747.1602247535561195321
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Oct 2020 05:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=mW1cDp/G;
 spf=pass (domain: arm.com, ip: 40.107.15.75, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oypdKcEl51twi2beO6LJ1eYx1VOcvIyWjyAIhnRuHtE=;
 b=mW1cDp/GrOhHYFob6OWrqGfJ+l0ZEFiK7rStN9JCPoJBmJR4TO9+WDVekmE7yezcYrxuTr/w6oFzSDfNSHjWfi38a1hUFeJdxEkmKmk3ayzrLGioHmcXociH2cMk7r5LohruiCVZHDqkbGC3qFrbFDF/2ZuwSZuw2Q7+MefzQEw=
Received: from AM6P192CA0055.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::32)
 by DB8PR08MB5386.eurprd08.prod.outlook.com (2603:10a6:10:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 9 Oct
 2020 12:45:32 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::53) by AM6P192CA0055.outlook.office365.com
 (2603:10a6:209:82::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Fri, 9 Oct 2020 12:45:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.23 via Frontend Transport; Fri, 9 Oct 2020 12:45:31 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Fri, 09 Oct 2020 12:45:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76bcfb793b9d82f6
X-CR-MTA-TID: 64aa7808
Received: from b180f1c4891a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EBF30E8B-8219-487F-927D-BA3FD63D4118.1;
	Fri, 09 Oct 2020 12:45:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b180f1c4891a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 09 Oct 2020 12:45:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljkT9WRC4NuUO7ZkbzzYCYUfoLtz7mvkCnLSf1Nqgdyw0sAgejNz769r9zugVJPcQ0lGYjV+1JV/TP3hohHoLBJdOPyZloafLifRhDAS0VjeaqNy/0JW+9BrtbUtZQ5l8B7CIduDjpTDx+19gh6uWGfxLgS8rpdG25rX5wqNvmFfAc9MnmBtiUPTVTICO+eryrL/d4H3FT6gJRA/77nxTHXn/8nfKw4UwVGzMtGFgn199EsKw5mg/FWjUPktYhj1YOb9t02fPxTTUbd8hvx+eDaALxWN9FAGhH+B8ooYpcQcAfdKOFQrbcwQClkJHEIlu5YVKH+tUtUrLZs59EYmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oypdKcEl51twi2beO6LJ1eYx1VOcvIyWjyAIhnRuHtE=;
 b=eWjzfFIm+8stktshvFE2DkCX6ECabe8sLcz6YqIDggrZiqRpGYRFqJTJlRWk3RHG4k9Q333D69gNKUwzczGxx3JsIYtZhjj2oH5NE/IBZRMVebpEoNAjABHlq2vxxMtQqgVjJQnSiO4xu/md5kNL41L0/+fUVp7yupiNoWtWw0psLfCfFISgHD9WJIpsIw6hA4xWZ0n3CFFfyEH9FkI7hLcRtS5Vy/KzK8Q4vEE7sviqN5a9BqhcMYgXKMrzXrEzuRqf/w8Gg9RIwSl+ID6gGYsOI0R5/AEzqwM3GPWCzn+ObUDTtNMGgklnNphwnByFIhUSihpCz0s0u3KSjm8N7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oypdKcEl51twi2beO6LJ1eYx1VOcvIyWjyAIhnRuHtE=;
 b=mW1cDp/GrOhHYFob6OWrqGfJ+l0ZEFiK7rStN9JCPoJBmJR4TO9+WDVekmE7yezcYrxuTr/w6oFzSDfNSHjWfi38a1hUFeJdxEkmKmk3ayzrLGioHmcXociH2cMk7r5LohruiCVZHDqkbGC3qFrbFDF/2ZuwSZuw2Q7+MefzQEw=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3386.eurprd08.prod.outlook.com (2603:10a6:10:46::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Fri, 9 Oct
 2020 12:45:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3455.026; Fri, 9 Oct 2020
 12:45:24 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH v2] ipxe: Fix gcc10 compilation
Thread-Topic: [meta-virtualization] [PATCH v2] ipxe: Fix gcc10 compilation
Thread-Index: AQHWnjj8dPpgfXObaUmnKXpPMvMFKKmPNpmAgAABEIA=
Date: Fri, 9 Oct 2020 12:45:23 +0000
Message-ID: <C77BB304-7775-4782-8BB8-7BB64E990B7C@arm.com>
References: <163C53331F54B310.15658@lists.yoctoproject.org>
 <163C5377755A400D.8231@lists.yoctoproject.org>
In-Reply-To: <163C5377755A400D.8231@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 223b9157-2892-4d9e-c797-08d86c513582
x-ms-traffictypediagnostic: DB7PR08MB3386:|DB8PR08MB5386:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5386E903630267EB97EC69259D080@DB8PR08MB5386.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NkDsBlkhRI94K2sYRC5gj4ttfHfVwVI9LC96JmJZc3b7Zzb0aqe1eJHWiv2ABNMuYKZbmJ2R6sT0xrzZS1aPUDS8zg4ImVZRf0VfFyDFrHyoKQv6wEE9j5YoK0aXMSg2aR8uPYJh958liWUhlUOqhDninNyiuqhuFTlV9EoDz1cVdrzM5mQrKVwYvkFVICq+b605mvt1iynaJdWppeyd+4PffJgzY1mJI/lndnrb/PZ4b3uwmn8vAtF6fmH8vLcr6cJUEWh3a0h66Acz7FRVyGo66UnJG36BLR9Q0LgqmXvlInQGV8rwy51DnETQf0WGZ5qkjq4HOSTdofc3mM4pS8bVC4nWvTxmO2Ob6REYCSfeRNM2M8ZIo/BsJuQ9BxYSDwwj+vvcHvueukpc/Ckqpw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39850400004)(346002)(366004)(33656002)(83380400001)(316002)(6486002)(54906003)(966005)(6916009)(478600001)(2616005)(6506007)(4326008)(26005)(53546011)(186003)(8676002)(8936002)(86362001)(83080400001)(6512007)(2906002)(5660300002)(66946007)(71200400001)(36756003)(64756008)(91956017)(66446008)(66476007)(76116006)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 crGnCOE64YbtZwhnhst5ko/h+3ypH10AheQep4fcynGN4X9gcu8NunTE9Jz2CU+mwmIQOcO92q/2kjj/UoBKFVesG4YXGh7lGV9kRCkoy+MXg1P/oUNIpwIh89kl3pw1Gz51eu6XIaqlrMmL//bFx8dtqpHRIrx1IeyTDUc/4Wx6kW8mtwzYF1+XTdHc+IitS/85GtPAITPcIhKq3WXXcX9oPdGcfMW2RBmuK4yDo0CP9JClr3SIGRMS8G9AZhhT4XNGKlGcD38JfQMRUiPmzgnDuRAEcsiNPI+nA9YZbvtp3A49mRy9Sej/vxliD1AJl1u5dhMhWEOqwvo2F1Shfqh0AFbP3rBXPnIuj+aKhf8fIjHhG8MOvOQmmef8Qo/enBfl/bi7q07ijnCdZJwfEf1rlmQl9virRKykb2z+J8so2LM0CQXPoiyKdtaPG9cZ5uut+zeFMMFFMO/TPpMrzCAv3xT0BYwoeXpPnDN0lQhb/B7e4++lvzZkqX9bM3iS7CU7AaliijkykX/PsMXBSVcPdXNP87pqIiFjTaTS32EHNnah2/eVygjQvOpugejWH4n8FIa4y0LoAwGjCIqzscIZv3ANoFCV1aJOGSbCbdx9gYLWX7iBUoAmDU1hZDsaLBfQoKjeWDlXq0oOXGkNNQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3386
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	509e168b-5f65-4093-9258-08d86c5130d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NwzyusMvWYXDQPaoNktEgmoxVKhb0hf1r7IDwzYfZvw5ikE3OTHdhxFAl2tcDcuIPZ6TJmkxzmH166cxg+k+pvukmG6JlGq6dbFxoSW6wYjqwtivYPmfgyF+sp/sjuOuCAr9TDDLCRYf/a0JkplhzxfEGDJPb4obsUAv4847gCAUFP5XazB+YBQig2qio0x48H0AvN5J/XBk8cMP3iNGoOJrsEfAKVfE91AnqN0flexpZPNr6N3ZNaIo/vlUrolQJn/l0mkYQvuY0/k5pfsRV4UjUmWxdHHDZzJe6Xlnh77S/Z3b6tGuvMUxCUJHr56T5f5ZRNm8EM4jRQ3daEKVpr8BV4RjCUcog+ZNl00zPTxDpaaM25fsJReMPM20ooZPzw7Pd9qam7G1hFhL9og/SndNkx6/EA+yFm3BsVupwaLziHdKhRfceR2Ue4QW6NntlYZjgsfvLQoxVFuKg5GFRfPrLjKamZi81GiiowI0sY8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(46966005)(54906003)(478600001)(83380400001)(86362001)(6486002)(47076004)(6862004)(6512007)(82310400003)(4326008)(33656002)(82740400003)(5660300002)(81166007)(2906002)(83080400001)(26005)(8676002)(336012)(356005)(53546011)(36756003)(6506007)(2616005)(186003)(70586007)(316002)(70206006)(966005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 12:45:31.7719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 223b9157-2892-4d9e-c797-08d86c513582
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5386
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8BEF093D6029FD4EA385D0E036B95B13@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Actually it seems this is my mail client hidding it (as the online view is =
correct)

So you can ignore the v2.

Sorry for the noise :-)

Cheers
Bertrand

> On 9 Oct 2020, at 13:41, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Hi Bruce,
>=20
> For whatever reason the beginning of my commit message is removed, i tri=
ed to resend it
> but the same happen again.
>=20
> This is the first sentence:
>=20
> Add ipxe patch to pass -fcommon flag to gcc during compilation.
> This patch is required to have ipxe compiling properly with gcc10.
>=20
> No idea why this is happening.
>=20
> Regards
> Bertrand
>=20
>> On 9 Oct 2020, at 13:37, Bertrand Marquis via lists.yoctoproject.org <b=
ertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>>=20
>> Without it the following error occur (and multiple others of the same
>> kind:
>> bin/blib.a(epic100.o):(.bss+0x0): multiple definition of `_shared_bss';
>> bin/blib.a(davicom.o):(.bss+0x0): first defined here
>>=20
>> Change-Id: Id9aed4cfe6bec9c0cbdb0b99271ddff472f1f0c3
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in v2: add missing part in commit message
>> ---
>> ...cit-about-fcommon-compiler-directive.patch | 33 +++++++++++++++++++
>> recipes-extended/ipxe/ipxe_git.bb             |  1 +
>> 2 files changed, 34 insertions(+)
>> create mode 100644 recipes-extended/ipxe/files/build-be-explicit-about-=
fcommon-compiler-directive.patch
>>=20
>> diff --git a/recipes-extended/ipxe/files/build-be-explicit-about-fcommo=
n-compiler-directive.patch b/recipes-extended/ipxe/files/build-be-explicit-=
about-fcommon-compiler-directive.patch
>> new file mode 100644
>> index 0000000..6fa5858
>> --- /dev/null
>> +++ b/recipes-extended/ipxe/files/build-be-explicit-about-fcommon-compi=
ler-directive.patch
>> @@ -0,0 +1,33 @@
>> +From f982a712979619dbae2c6e0d741757e2ce94be11 Mon Sep 17 00:00:00 2001
>> +Message-Id: <f982a712979619dbae2c6e0d741757e2ce94be11.1602165412.git.b=
ertrand.marquis@arm.com>
>> +From: Bruce Rogers <brogers@suse.com>
>> +Date: Wed, 6 May 2020 15:03:02 -0600
>> +Subject: [PATCH] [build] Be explicit about -fcommon compiler directive
>> +
>> +gcc10 switched default behavior from -fcommon to -fno-common.  Since
>> +"__shared" relies on the legacy behavior, explicitly specify it.
>> +
>> +Upstream-Status: backport
>> +
>> +Signed-off-by: Bruce Rogers <brogers@suse.com>
>> +Modified-by: Michael Brown <mcb30@ipxe.org>
>> +Signed-off-by: Michael Brown <mcb30@ipxe.org>
>> +---
>> + src/Makefile.housekeeping | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/src/Makefile.housekeeping b/src/Makefile.housekeeping
>> +index 66d6dd44..b6c61c11 100644
>> +--- a/Makefile.housekeeping
>> ++++ b/Makefile.housekeeping
>> +@@ -418,6 +418,7 @@ CFLAGS+=3D -Os
>> + CFLAGS+=3D -g
>> + ifeq ($(CCTYPE),gcc)
>> + CFLAGS+=3D -ffreestanding
>> ++CFLAGS+=3D -fcommon
>> + CFLAGS+=3D -Wall -W -Wformat-nonliteral
>> + HOST_CFLAGS+=3D -Wall -W -Wformat-nonliteral
>> + endif
>> +--
>> +2.17.1
>> +
>> diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/=
ipxe_git.bb
>> index fbaad30..d7c60ab 100644
>> --- a/recipes-extended/ipxe/ipxe_git.bb
>> +++ b/recipes-extended/ipxe/ipxe_git.bb
>> @@ -15,6 +15,7 @@ SRC_URI =3D " \
>>    file://ipxe-fix-hostcc-nopie-cflags.patch \
>>    file://ipxe-intel-Avoid-spurious-compiler-warning-on-GCC-10.patch \
>>    file://ipxe-golan-Add-explicit-type-casts-for-nodnic_queue_pair_.pat=
ch \
>> +    file://build-be-explicit-about-fcommon-compiler-directive.patch \
>>    "
>>=20
>> FILES_${PN} =3D "/usr/share/firmware/*.rom"
>> --
>> 2.17.1
>>=20
>>=20
>>=20
>>=20
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>=20
>=20

