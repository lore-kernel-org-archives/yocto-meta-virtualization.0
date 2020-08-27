Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.52])
 by mx.groups.io with SMTP id smtpd.web10.19785.1598537450761719143
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 07:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=h16CD7HK;
 spf=pass (domain: arm.com, ip: 40.107.15.52, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=743ruHyYNxYNvGOIoHZqyFWwOKjAMapDVHphMEpmycU=;
 b=h16CD7HKyLZ1ZTRFzRODFIOdPNuy7PXiLM/b3fluCLiPC0x1S8TeN8tzv/BBpLSpC+SFfhn/OZxJlfuSJqeBADejum1BOUx3mUEwqH/38aj26JIUASBUFHCRI9j6CQYvaMasAnuXTQUQQt2BpwNf2KvAqe2v+LBWsIvpjFUjUZg=
Received: from DB6PR0802CA0025.eurprd08.prod.outlook.com (2603:10a6:4:a3::11)
 by VE1PR08MB4911.eurprd08.prod.outlook.com (2603:10a6:802:af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 27 Aug
 2020 14:10:46 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::ce) by DB6PR0802CA0025.outlook.office365.com
 (2603:10a6:4:a3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 27 Aug 2020 14:10:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:10:45 +0000
Received: ("Tessian outbound e8cdb8c6f386:v64"); Thu, 27 Aug 2020 14:10:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 808814e13ba02bc2
X-CR-MTA-TID: 64aa7808
Received: from d721352d3760.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 93D94C79-6234-43CB-ADF5-0F6038CB5974.1;
	Thu, 27 Aug 2020 14:10:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d721352d3760.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 27 Aug 2020 14:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUe6vf2bzaUGOfOMxG0korWTGHDnoBzb0AHYPJkPkCS7NYu3yEndYQB71urEHumuFfYXH8B6/iRKJqeXK4naCQDD//iJzCD8o5XAB5jjEtIGVrngxCMG0cHdkqnLexombjQGzLQ5Rd9hG0Sr37nFPNbcoi1CpNOhevOesasOyUiDX8ToErDlXpC6rJLD4n6yjlcCr/EFLjFyZwVA1qjbFOvihQod5tjPU4ILLbU3Hkl+AiU1F8+CYlXy0Mw4yeusb+hoEdoqhvR3t3uIiuxQsT2KyuQ3IYo5pf7YJi1QlcSP+BG/kWBEq/N3hVgjIYhOoGyb6qG0sTSdaG4g/v0xYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=743ruHyYNxYNvGOIoHZqyFWwOKjAMapDVHphMEpmycU=;
 b=kGLGjVEjHkOVSvATqBnCzEpB5ztk+kI3avz5Ty9VcjgYuqjir1lmUQrMHKOU+SlQsP9Zrwy0zZYBn1PJ4Goi1t06B4xcuIc69PrOYAB6hbTbsS3aRZPBTV/EP6HDUllfv5Jfy8CUCbdaUecCUPbS7UMRpY4d1TASaLpdJeYFx30cYzpao/9ERp1rQDzNaQO7UtGQ3Zea2cdqMCQmZmcKYmBYRGFZRGgav6gNrXx9dUSzxcqk1Tp/X2dtakL4guC1L/we5Vpj712OiPRjwtsIDnoNUD+i53Uo8IXr3fX8TwmL/v+x1iEXW/SHNG12ts+larHH+mSYHkjqhdriJ4EjlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=743ruHyYNxYNvGOIoHZqyFWwOKjAMapDVHphMEpmycU=;
 b=h16CD7HKyLZ1ZTRFzRODFIOdPNuy7PXiLM/b3fluCLiPC0x1S8TeN8tzv/BBpLSpC+SFfhn/OZxJlfuSJqeBADejum1BOUx3mUEwqH/38aj26JIUASBUFHCRI9j6CQYvaMasAnuXTQUQQt2BpwNf2KvAqe2v+LBWsIvpjFUjUZg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBAPR08MB5816.eurprd08.prod.outlook.com (2603:10a6:10:1b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 27 Aug
 2020 14:10:37 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Thu, 27 Aug 2020
 14:10:37 +0000
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
Thread-Index: AQHWciFVcsywJJdZQkaV3T6+80KEwKk7iMIAgABqgQCAECAmgA==
Date: Thu, 27 Aug 2020 14:10:37 +0000
Message-ID: <574CF513-EDAF-42F3-843B-2F52A144EDC6@arm.com>
References: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
 <20200817013409.GA13307@gmail.com>
 <162BFF110C03FC4E.19371@lists.yoctoproject.org>
In-Reply-To: <162BFF110C03FC4E.19371@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ef1e96a-9113-4d9c-f63d-08d84a92fdf3
x-ms-traffictypediagnostic: DBAPR08MB5816:|VE1PR08MB4911:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR08MB49112777F230E9C8A84E8E089D550@VE1PR08MB4911.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AtRbzQxGGPC1n3QlZmNcot74+NWfW/ouErKHTztedwZ68cnaSs8JWZNJlv7s3tpKhUGy6utJwkXyIhwECDmoEkGS3WoTTVJ0K1Hkky+jXbJci3t+a34nFUJDyzEt2ECQuRQOPCKaBzqVqycrTfjwcaKBX/8xM5N/GfBKnQ/mgJytOuY5G6tBtiC47cfan5t2NFWEWm+vaUfgBJJigqBFR5ZV4SrB8+Cvvntl2KM48h6FL7TsEdhSIDLs/GDrQM6o+HxFLLnJKvF2Sk+7SMgt4OHXwW10cjLMDVMpV5Ny1Xq/EHcLqTe50eoNZ1l/vPkSGTDwn2kJV0dr6hOe2by7Scg9WOoVLysba8xkIGNmw2myG9jenGobklqALdIIaqQCnvMPDLbRsuh/nj6cVfu6AA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(5660300002)(6916009)(186003)(54906003)(2616005)(316002)(86362001)(26005)(6512007)(8936002)(478600001)(6486002)(2906002)(6506007)(4326008)(53546011)(91956017)(64756008)(66946007)(66476007)(966005)(8676002)(76116006)(66556008)(66446008)(71200400001)(83380400001)(36756003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 giq5TsQsD8uwdipQTgqZsRbSVfLdv8zkLonWJ3WSyZFUwb7EG265f91WYhDz9/HGjo2YvHoTZI9TPA51Hln2HBOXQQGG1I+RfwqHeCfWlH8pCDlpqlxc10USKtyhYYo4OMEZogr73DWFkyxQ9/AVBVZz4T2EHaGKkmLrhFLSt7pkrVCpwqx0mI2WBMbbCqN6wAHyflBnwqPrLdmZhPJVAGEhduYyIvNq0IQ1Qmni4gnmKkTjjqEKhvex9YQDtwoVgGpT5MX9qpJe47LWp2iEbITLEd9FkSXXXhE0Upz18YL0jLO0fZzknsCb4QxkezguCjEM62uVnaPOubOy/Fjn7b15J5kI0amoy/pLkFsXVy6wbF6hdNIgv1isFuXN9LmfO4QfJpiQ0BGZ3KFgMxnEL6sWrWvwvvVx0BuoDrMDqQEdjPcqvc3OOkSFZgBwKMR18a1kVjs+UzwsWU74OPb2N1ThxPPZs93+wK/+qfCzcsr49xH5+0KqQFgHo1VQvepRIgEIDZxCrIkemNdyrax3bL7SgHUzYrIN9AsODfAiKC+yXXb5Fafw8Y6IkrVD3QktbeNa6dJ7guoZ69Hg5YMIlm5CtlB6Du1LeitIYWk2MS7+UYoxCq2+MAKr54BEO0wNRfU9wmag2ZrKQFvr0soO1g==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5816
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	235f21ad-6c20-44b9-349f-08d84a92f906
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZLg6mk8QKCE3iJKJObflrVjFlDSXHpak0kuzkQxq/4sniPPdoETr3/Ih0asFf5d1bU9p9GgswFDH50R+P+PW7GrxBk3+kCulhE+M86noBf27atF+4IgS0d915g0xWGu5wDwkLJ1u95VNK/xDiEP6vK7qHt4KWup3OGPlmDMBUu0+CYHRv+wmYPVB7NqkLMoBDzNz4md+s+B+NSZ9z4+vt8S7aWqVMOLrMnMpCL2O4ae7nPjnd7D+BlRy6bswn2oPS082KXAizGLJkLsDNtslnKmjPXK6Pwmqz0VoRqxOl2zVGqJPNyu7qHCu0C1LgBWrOR/vZSKjYHCFVG5TEIuOzpvzIXlghVC1XXm7P/4ymK5yDoGH+RI3Dinz/sKrwVhifK0anoxlaioniuC4OXeRHz0vtpZum4G51+0kpnpNlujgvoKSjz5pIP/AfOlx1CgjLqvOUmHzhw8nWP/qzLYSQHjUaSPcCc/CbyDP5TYbujw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(26005)(966005)(6862004)(82310400002)(70206006)(186003)(6506007)(5660300002)(478600001)(83380400001)(33656002)(53546011)(70586007)(8676002)(336012)(47076004)(2906002)(4326008)(356005)(316002)(6486002)(8936002)(81166007)(54906003)(82740400003)(36756003)(2616005)(86362001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:10:45.9169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef1e96a-9113-4d9c-f63d-08d84a92fdf3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4911
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <384CF7F74DC74E41B105359642277718@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Gentle ping :-)

Bertrand

> On 17 Aug 2020, at 08:55, Bertrand Marquis via lists.yoctoproject.org <b=
ertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
>=20
>=20
>> On 17 Aug 2020, at 02:34, Bruce Ashfield via lists.yoctoproject.org <br=
uce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>=20
>> In message: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add=
 support for config fragments and diffconfig
>> on 14/08/2020 Diego Sueiro wrote:
>>=20
>>> Changes in v2:
>>>   - Fixed typo in recipes-extended/xen/README
>>>   - Removed documentation changes from 0001-menuconfig-mconf-cfg-Allow=
-specification-of-ncurses-location.patch
>>>   - Updated Upstream-Status in 0001-menuconfig-mconf-cfg-Allow-specifi=
cation-of-ncurses-location.patch
>>>   - Call find_cfgs function only once in recipes-extended/xen/xen-hype=
rvisor.inc
>>=20
>>=20
>> v2 looks good to me.
>>=20
>> Christopher, do you agree ?
>=20
> I tested it and it worked for me, including modifying the xen configurat=
ion.
>=20
> So you can add my:
>=20
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
>>=20
>> Bruce
>>=20
>>>=20
>>> Diego Sueiro (1):
>>> xen: Fix menuconfig and add support for config fragments and
>>>   diffconfig
>>>=20
>>> recipes-extended/xen/README                        |  3 ++
>>> ...g-Allow-specification-of-ncurses-location.patch | 49 ++++++++++++++=
++++++++
>>> recipes-extended/xen/xen-hypervisor.inc            | 49 +++++++++-----=
--------
>>> recipes-extended/xen/xen_4.14.bb                   |  1 +
>>> recipes-extended/xen/xen_git.bb                    |  1 +
>>> 5 files changed, 73 insertions(+), 30 deletions(-)
>>> create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cf=
g-Allow-specification-of-ncurses-location.patch
>>>=20
>>> --
>>> 2.7.4
>>>=20
>>> IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any purpose, or store or copy the informatio=
n in any medium. Thank you.
>>=20
>>>=20
>>=20
>>=20
>=20
>=20

