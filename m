Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.44])
 by mx.groups.io with SMTP id smtpd.web12.31867.1605516383582637712
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Nov 2020 00:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lpld8E17;
 spf=pass (domain: arm.com, ip: 40.107.13.44, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMJMjyL/fw4LEC5//xjei1fkVv7A4yQc86UM+Es6h7Y=;
 b=lpld8E170RW1R9NLLVK6ETqR882W3fe+Nz1zwR5nLcvllNK2tA7OgSXKpWFZ9aI4o6L63qnAI/cZqLYarkPTqdoe9P8YtVnUuv0V/+pVRwGcCHCtRqUvgcn6Uu1Lu7y512SrCtoPAxbhBuxWzlonP9tOSZ52LovSl2ztAbCCmX4=
Received: from AM5PR0601CA0057.eurprd06.prod.outlook.com (2603:10a6:206::22)
 by DBBPR08MB5945.eurprd08.prod.outlook.com (2603:10a6:10:1f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Mon, 16 Nov
 2020 08:46:20 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::52) by AM5PR0601CA0057.outlook.office365.com
 (2603:10a6:206::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 08:46:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 08:46:20 +0000
Received: ("Tessian outbound 814be617737e:v71"); Mon, 16 Nov 2020 08:46:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 297446fde29c70d2
X-CR-MTA-TID: 64aa7808
Received: from 22eacb5abad3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 46B2E01D-9180-45DB-B697-CBD71E745666.1;
	Mon, 16 Nov 2020 08:46:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22eacb5abad3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 16 Nov 2020 08:46:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maRVrEosZrOWe1r3bEGjrdXzPomLLUe0O9eFIORgS8XsoqNC0XGcXuIG86YTywrzz7jIcRC7pMm0TrMnl96uXp/KU8Kh4VuuHIh5WUqJn5PtKQsKLmspUL/G7FfBZALgA3nh2Y85JlykfEkHY0wmdLa6WgbdIEiXyUSbpq8TMqC59yOLDbMVjHsH+fdpJuxrTv99+fKE33PMr6UgBqSlMCoNg9qhJm5YnpUuyxg928qv8YGIK9aBM26E42Bz4RbtSMcnU6vJXu+8i7DPFZy+ikrXqRNV9Z/09GZz8Luuspie4Zi+QNczM0ImhY/Ne+qyRd9zbCaimEbs4LLEgNpVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMJMjyL/fw4LEC5//xjei1fkVv7A4yQc86UM+Es6h7Y=;
 b=jHpVaWmDjS3Rfqzb9c22jNmJvOPv5PnDWuHCu3nm1Db46WETmY2jdEehcgG9rbJaBRar+t8fXP4GMniMCOYtC6/GkG1ioG4LJ7OP3iOSvgTRLzzBkCIX9AOXJQGiaIM2gpt9EIrjRbOHFP9k3phZXsSxNNq0BZkoAUMjw9NGczG7U03hy+VpQFl/sxVj/T3b1KhMO/lm/Ymh/Ugi/5g+B9UUOJ+AkuuDp5LQa3RtDhKSuZ0DI+cU0XucWGLLyeuRH2mHiNoVNfHmy0l7xg/1K7xPH02PHR4UhSGGv9Bus6zJ7wRh5X8prUFx0IZY+xb+DzobJZY4U6A6UhKFOUlIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMJMjyL/fw4LEC5//xjei1fkVv7A4yQc86UM+Es6h7Y=;
 b=lpld8E170RW1R9NLLVK6ETqR882W3fe+Nz1zwR5nLcvllNK2tA7OgSXKpWFZ9aI4o6L63qnAI/cZqLYarkPTqdoe9P8YtVnUuv0V/+pVRwGcCHCtRqUvgcn6Uu1Lu7y512SrCtoPAxbhBuxWzlonP9tOSZ52LovSl2ztAbCCmX4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 08:46:12 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 08:46:12 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
	"christopher.clark6@baesystems.com" <christopher.clark6@baesystems.com>
Subject: Re: [meta-virtualization] [PATCH 0/2] Fix Xen compilation
Thread-Topic: [meta-virtualization] [PATCH 0/2] Fix Xen compilation
Thread-Index: AQHWuwPL9Ft09fP4q0iUvSFUmJgyoKnKc9aA
Date: Mon, 16 Nov 2020 08:46:11 +0000
Message-ID: <3B1DFDE9-026D-46BA-AE51-E362BBD0A5E2@arm.com>
References: <cover.1604933003.git.bertrand.marquis@arm.com>
 <20201115040002.GA19607@gmail.com>
In-Reply-To: <20201115040002.GA19607@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13d12cad-a40b-433f-72b6-08d88a0c173b
x-ms-traffictypediagnostic: DBAPR08MB5767:|DBBPR08MB5945:
X-Microsoft-Antispam-PRVS: 
	<DBBPR08MB59451772CD7AD87E3B7ADFF49DE30@DBBPR08MB5945.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2399;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +HNj1RB89v/ln+3QYY5fmqnkaEkDErv4j+ugPbFoXwTR6NG7QDkXMJ8nAuLOSMQc1/DyE97xQPk9wTKJsIGalPX2fYGUaPHUW7DKUgQhOcMefTVZqKlpW5GGlWD0HjI97ari+kerPjbc9MozYcx22uI6NOE62gZZxjDI297RmVc0Co+7Ml2CTKSIGk763WV6MoVj+zLfyTgDu2MZFE5102M+f3vorgkCZ2hrkF+6HogvuI0pSbvnkmTJK/dHsRlSYQScONh9tpHuwX+kYMvi4AW9cjpa1ll2V8HWUz4GwG1DnXAT1yiLpZR6xNaIZFy0sT19KfpCAV2qMPMu4ik21YajhRBCJDlv0qejvOdaiBH2YHBpuTaqU8kCfuR1qMmDSU5i1zRW/514bho5AnRBRw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(6506007)(2616005)(478600001)(966005)(316002)(6916009)(4326008)(71200400001)(54906003)(8936002)(8676002)(6486002)(36756003)(83380400001)(33656002)(26005)(6512007)(5660300002)(2906002)(91956017)(66946007)(66446008)(64756008)(66556008)(66476007)(86362001)(76116006)(186003)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 4mEnYt2CURChxT0rebp2SFY8LYuY0xYRRNQoPMENUYOJq85WgHOzm8w0z3oqhdv2r9Dx0Vnq7vlEPtuLt6qtEcjXLS+XFi8GAhpJbCYS1Q0fRKg3ssvPsVn38fkHXt4tbJvUSPZP/B4pyRnR9sVJ+MYK99XdJsxIQ7JXlQtj7qD7Gl1Br16JzS0RpTGyfs79w9QCP6F81c2EXnJs1uQmIsYC/F+hSy9lMOWiHHs0amh1YcRvybhkLW/1Rq63bWFAkU2+BE/dC1gJmDX6hPVWxD8xdPdHuKwBHpcMAABm3HYiJEP1pDLqIuPNxd3B0bthWQNMgQ3gMCirgqMTw866tse5dsliJ/WNflGLgKfNfT8DoNYYARejIOt3j6bpILTq4f7Lx0L08YfDWruhYlG8uFPXTonxm1B4VAJldlFI8psadduuMnUX5Q/KgN1vtQ5/uR0fNZFyEeuAAo040T9MzROWOHsJVZpadzUPt2PWjhI0uFzNL6t1v+XGbGG86FJbWTEpyJkdh22MqU+1k8hWkTyCBRLhtU1AHXPEP7Zmteux5dvhIrmHVERQ5BJ9KmuZrRbtFWYKZDT0iV8VxsatK0wD/aQWbm2ygGahk/JkfVLXZd3rEPzgiKcGaj8CF8FyKrtf1jKSp6ltvt6OYEEpDw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5767
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8187a150-30e4-4a83-65b5-08d88a0c1213
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	538fMpQpi+pMyykf+RkpJKt8X82BT9enwcvvEYha6SWJvLdfEoPWJtfCAKbzpQxBRYX43IAsCT6+DKHepQCaphs2ZXbIiK4iIl4m6rDmyNqjnQ4J1eImW7TRK97IfQUhquTH765I5dyBtuTDhd0T7ki2tcfeHJ++jUl3ti8xBP6VF0fNeaqjQYxWZniqxSqC98/ZijNLkqn87xAX5BMHc5kNwhIrzBORWm8Xn/w3RCbaKBYuJeoEV3icd125zhQZxUiz2NTMLEL6e28TlNnGkGLXFDE9J2D4xZwcVVTePDs616xfrlJxnEu39HyJoOQpN9W4oYJd5oLSHpzzKkbRnonTJBM1e3Hz23rSGA/Pvy6Sn29pGBV6Bc0Re/INbMWbdfCsosKBwo4vOY4VvDhHwMG+XySFE6lBx8dN40DYIBeXnMJtvwo7+3BUy2CaREx614CutZ7n2T/UA+MI3IkOWwQG3tRz0hJ+mYjXBAEIwO4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(81166007)(966005)(478600001)(36756003)(186003)(356005)(83380400001)(26005)(53546011)(6506007)(82310400003)(6512007)(82740400003)(5660300002)(47076004)(4326008)(33656002)(2906002)(6862004)(2616005)(86362001)(316002)(107886003)(36906005)(6486002)(70206006)(70586007)(8676002)(54906003)(8936002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 08:46:20.5708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13d12cad-a40b-433f-72b6-08d88a0c173b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5945
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1772B9AB0B94B54EB58C0A00D3AEC651@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 15 Nov 2020, at 04:00, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> In message: [meta-virtualization] [PATCH 0/2] Fix Xen compilation
> on 09/11/2020 Bertrand Marquis wrote:
>
>> This serie contain 2 patches to fix Xen compilation:
>> - on arm32 by adding a patch already merged in Xen master to fix gcc10
>>  compilation issues.
>> - on x86 to fix an issue happening when compiling xen-tools with older
>>  xen versions.
>>
>> Those would be good candidates to include in gatesgarth.
>
> merged.

Thanks

>
> And yes, I haven't branched gatesgarth yet, so they will be part of that=
.

Perfect.

Cheers
Bertrand

>
> Bruce
>
>>
>> Bertrand Marquis (2):
>>  xen: Fix python libraries installation on multilib
>>  xen: Fix xenpmd compilation error on arm32
>>
>> ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 +++++++++++++++++++
>> recipes-extended/xen/xen-tools.inc            |  2 +
>> recipes-extended/xen/xen-tools_4.14.bb        |  1 +
>> recipes-extended/xen/xen-tools_git.bb         |  1 +
>> 4 files changed, 64 insertions(+)
>> create mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc=
10-snprintf-warning.patch
>>
>> --
>> 2.17.1
>>
>
>>
>>
>>
>
>
>=20
>

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
