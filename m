Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web10.39058.1597650939743454632
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Aug 2020 00:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fZAZ/rKU;
 spf=pass (domain: arm.com, ip: 40.107.8.77, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAjk8bJCknZD9/QFhMeY8oKTpCQelXu2wF2Awydg7QI=;
 b=fZAZ/rKUJKOy6XSK6Ug1i7lDkNhvDiHFUAc5fLFVhLERBbqXs02fz3eE0LKc7GFtZMrz3PtmdUsen5NoNVpNjMkWM1VCunOp2nDws1998pKITqm/+dR1VdWAY3VO7SmYC2pD/gkeeeFz10v/EMTY2ygmHHctNKp5mZG0uuEVhJ4=
Received: from AM6P192CA0053.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::30)
 by DB7PR08MB3803.eurprd08.prod.outlook.com (2603:10a6:10:7f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Mon, 17 Aug
 2020 07:55:36 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::e9) by AM6P192CA0053.outlook.office365.com
 (2603:10a6:209:82::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Mon, 17 Aug 2020 07:55:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Mon, 17 Aug 2020 07:55:36 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Mon, 17 Aug 2020 07:55:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f82ecd121a9e1cb
X-CR-MTA-TID: 64aa7808
Received: from a00c2beb217c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6EB5A365-F412-4305-8417-EB5E2A7199BC.1;
	Mon, 17 Aug 2020 07:55:27 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a00c2beb217c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Aug 2020 07:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9rd0UDQ5EbiVrh225OLCBU0dTSkien/C2aV8iU16BcpOkZgC8wpaaKeaffyAH/l/AuYdgdH15pcWFR2i69hlOvCUdbi0oIULcCOlXIzeYFKU5mqxKaE/X12khElRgxya/pIxWFLdXH1V0jUie3koEb2LdmPoohb0Rn0JLuXtpNv/KBeHUJBkNZ4N6shpDO3DQv2UBP9GZBQKIm5PYZPVOWLc5N1lCR7e1pLsM+ESAMfYDyahBi6T+MrKzpVhYCApSR0m6JE73JMjpS56Q1hRcqj8aNdk2xjg4TjuAI8EpG15SHmK26n43+peFeLRJS0I5yvsjJwxpomdnUtnnOT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAjk8bJCknZD9/QFhMeY8oKTpCQelXu2wF2Awydg7QI=;
 b=hj+eODTOEjKtLLn/yMKrsFUMKeQu01orgpBBr4z91lOztdBT5oIr+eCtP4ZTSJVkrL+wSw+BvWq5PqAM2RXeTSe8LIpHPlWjJ/NW4nt0VysaGqGWJkQDbWNYIhC5GJwpFDygLZeQM3guEKgyoZA3K9vvfY32aK+qb8TSRHntMBIKhf/mUlssk87vraowOjGUztimvdEg77XR/ly5k/3/z5rbrc/p67IL7wyCGKg2NMWylg3Z94BleGP78LBqI4qb2mEyxnpHCR2dFFG0h034Ggu/4upuXCvzlYH80YqXOLa9Js5ujivc2A2kATsp8PHIoT+9Tjo6X1n0ybof8uJjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAjk8bJCknZD9/QFhMeY8oKTpCQelXu2wF2Awydg7QI=;
 b=fZAZ/rKUJKOy6XSK6Ug1i7lDkNhvDiHFUAc5fLFVhLERBbqXs02fz3eE0LKc7GFtZMrz3PtmdUsen5NoNVpNjMkWM1VCunOp2nDws1998pKITqm/+dR1VdWAY3VO7SmYC2pD/gkeeeFz10v/EMTY2ygmHHctNKp5mZG0uuEVhJ4=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3034.eurprd08.prod.outlook.com (2603:10a6:5:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Mon, 17 Aug
 2020 07:55:25 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3283.027; Mon, 17 Aug 2020
 07:55:25 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Christopher Clark
	<christopher.w.clark@gmail.com>, Doug Goldstein <cardoe@gentoo.org>, nd
	<nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add support for config fragments and diffconfig
Thread-Topic: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add
 support for config fragments and diffconfig
Thread-Index: AQHWciFVcsywJJdZQkaV3T6+80KEwKk7iMIAgABqgQA=
Date: Mon, 17 Aug 2020 07:55:25 +0000
Message-ID: <2B43774D-4B47-45CE-BF13-4332B55C64A0@arm.com>
References: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
 <20200817013409.GA13307@gmail.com>
In-Reply-To: <20200817013409.GA13307@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92d0c54b-957a-45d6-0cb2-08d84282ed4c
x-ms-traffictypediagnostic: DB7PR08MB3034:|DB7PR08MB3803:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3803F0E7F30781C5CDCA0E579D5F0@DB7PR08MB3803.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 CWr43ZsLpgShEQsMQjWwoM/0M63DqRZCenl1KjlVI9qK1mxE5QGm/bbStDQqkZXFqHzpLn5IPK6u7EnV5VY5SZm6svNDUvsdL7WRoN89XtHJ/CwQJqw5bU4egwyPSgkHUaIPHd5rfBstX2z/s8Bhb4D3T5ETocJmXpPXVWRtnUr5kmnSkbREkkUM/yF5+zMRWe7aX936KgeYeoG8VN0nHQpRpux2QeSnLRKUSuy9s820tyqEQY6aSbgdvygM7oFzhQaZLSXufW+rT9bzbf2zyBj54yMotwEr+kq4Ji0AhKg/IvhhZtJlkDBKuvoLTErRo9UEvLx/SW9N8B3hU5lFH2fJYXG/y9yMNhpqo2APmr+OGR2y+T5rDhHBhJy4nE8sT9xQ4CL/l9+YqzZzfX2Gsg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(396003)(136003)(346002)(26005)(86362001)(6506007)(54906003)(4326008)(6486002)(36756003)(186003)(8676002)(6916009)(8936002)(53546011)(478600001)(316002)(966005)(76116006)(66946007)(66476007)(83380400001)(5660300002)(33656002)(6512007)(91956017)(71200400001)(2616005)(66556008)(64756008)(66446008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 yoz5Fceh883iw7cqXlL9EXEVmYDQccelCD3/jneFxpuTv556+IJLcjsMF8GEg0Y8EXEXnrRW3uXXw7323j+TPokOZLttyO2UvQjCGbDYjWvmVV0xchAPaq9tqo9e1YhiGNqS01VJ8xVYViFoYE1WIP/ZvdbfeRbbM6s5kJDazVwXHoLhD2Ja5e41o/qB2HQZ7roXgMCkE/wDHbeOGQ6UKF7AIpMd/THHwWOnEQBUtr7R1XryNvFOJX4hAPwIYAb8EPvUaWvCuVXs6XfWm0DjTC1RpXqrEsByNhZOqIuESRBMp9J6x+LQBM6jUAFQv1Ghur0toPdAG7RUa70IDkqXHDmUTMksb4ZI43zp5Mm8PveqzM+EZX4Qaz3DvtDRziwZlxiKPfavg86kMrNWfCEb29DJifVD0KX2J4x9hQhgT21VtItfn0WQ/Aq/pSQljALlX5kS39XyX8IdIFCKnA5lxoat8h0z19Y0EInFeXm/u9O4JNsH2NJNuI/GAm8MBSCYwWEz2Q4TsnKwtQ6YkjQsMZ6KgZVzSzU+3vlfBBjWt9rebwxUMCOUwUoYlW8/WMQOqtvDfkjnt2bJW2wptyXMRQ0ycF8vSH7qpSfQ8kg36urSkv+jXMw5Ch/AJfGi/lCDeMdW8D1kAN4EE5imOFuGRw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3034
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8f06cd17-2d7f-4142-7ffe-08d84282e67c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dkuJTWLTyQXs9kN24smIbAg0jSh/kE+LKt2biuiZmL3iTkUuLi/1bKPgvoZ0UigTLqJCapax2QVuV8K+OycDsXAkVHrv2tm1xGoSONpvHMN2O3Ld8oXncG8pK4Sj9jMIV2VsqxxRBv7xtdE8FzMlS2euDJsgf8phHnZyf9AOdMix3X6eEJC/Sd8snrq3J2ZJSyo5iwrKdReAxramHMWly+YEucWKZE5Kyf/4FU96ZxGfM6VIcNCv2rl9jI79ktJcaReCxXVXmawdeFDf7f8rrWpahf05j4hbqwCOfKpFj7ogzxWEwYy37qcr2qQNVjgiqdWkqlTkBIF2HL27Wn4POZXAsaZcJYcR7N2mcRAC0fe1KZKIewWEvep0JO3ea6bOOiH304QsuI1s3UlG2zCx3XagOJghtXnMu43k13fzTxVp1xPHGyLkjiYJd2kjq+77Uv8cEwE7FPQL7fb4hQwXd5u39nav8TP3zf+8IBtkETQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(46966005)(70586007)(8936002)(54906003)(2616005)(356005)(83380400001)(82310400002)(36906005)(316002)(4326008)(8676002)(6862004)(70206006)(186003)(81166007)(2906002)(86362001)(26005)(47076004)(53546011)(336012)(36756003)(5660300002)(478600001)(33656002)(82740400003)(6486002)(6506007)(6512007)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2020 07:55:36.6701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d0c54b-957a-45d6-0cb2-08d84282ed4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3803
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9B594DE21AA7ED4EB084DA72E61DB297@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 17 Aug 2020, at 02:34, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> In message: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add =
support for config fragments and diffconfig
> on 14/08/2020 Diego Sueiro wrote:
>=20
>> Changes in v2:
>>    - Fixed typo in recipes-extended/xen/README
>>    - Removed documentation changes from 0001-menuconfig-mconf-cfg-Allow=
-specification-of-ncurses-location.patch
>>    - Updated Upstream-Status in 0001-menuconfig-mconf-cfg-Allow-specifi=
cation-of-ncurses-location.patch
>>    - Call find_cfgs function only once in recipes-extended/xen/xen-hype=
rvisor.inc
>=20
>=20
> v2 looks good to me.
>=20
> Christopher, do you agree ?

I tested it and it worked for me, including modifying the xen configuratio=
n.

So you can add my:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

>=20
> Bruce
>=20
>>=20
>> Diego Sueiro (1):
>>  xen: Fix menuconfig and add support for config fragments and
>>    diffconfig
>>=20
>> recipes-extended/xen/README                        |  3 ++
>> ...g-Allow-specification-of-ncurses-location.patch | 49 +++++++++++++++=
+++++++
>> recipes-extended/xen/xen-hypervisor.inc            | 49 +++++++++------=
-------
>> recipes-extended/xen/xen_4.14.bb                   |  1 +
>> recipes-extended/xen/xen_git.bb                    |  1 +
>> 5 files changed, 73 insertions(+), 30 deletions(-)
>> create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cfg=
-Allow-specification-of-ncurses-location.patch
>>=20
>> --
>> 2.7.4
>>=20
>> IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
>=20
>>=20
>=20
>=20

