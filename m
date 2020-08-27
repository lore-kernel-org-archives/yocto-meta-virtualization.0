Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web12.20510.1598539428512669541
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Aug 2020 07:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3ima75nD;
 spf=pass (domain: arm.com, ip: 40.107.22.89, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJmfcqzJvaCIzV+ke06uE0uwspOD4HMPGAkgYgj7kgc=;
 b=3ima75nDK6uX2SnV+PHiQPkt7GuC0ZMB/Iy0mugdL4gHam3ISwbOgq+Qla8hj6NcGbHlGx5nNT58/c7mYPj53DKbhVFM3tBXoTfYpncCGsX/D+Y7gLHi+DSYXuw3Sndy6tXxGroAQPcFMM0gdkPT2FyUPKoqIncYYMqXCzgydxA=
Received: from AM5PR0301CA0006.eurprd03.prod.outlook.com
 (2603:10a6:206:14::19) by DB6PR0802MB2294.eurprd08.prod.outlook.com
 (2603:10a6:4:85::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 14:43:46 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::e7) by AM5PR0301CA0006.outlook.office365.com
 (2603:10a6:206:14::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Thu, 27 Aug 2020 14:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:43:45 +0000
Received: ("Tessian outbound bac899b43a54:v64"); Thu, 27 Aug 2020 14:43:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e58fadfefc37bbb
X-CR-MTA-TID: 64aa7808
Received: from d03d3b666b0f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 27FB3211-75EB-4D34-9E04-642B6ECF76AA.1;
	Thu, 27 Aug 2020 14:43:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d03d3b666b0f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 27 Aug 2020 14:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2OuF/l5ABEcDirsPPRdUoVeQcZx7yLtVLz56AmRSdCcpYALWJXe+rqjr31WHpn7U8lZCycMQKbGRHbhqao+k+CQDIF1p869LlhkpN2SsMbpD/CcDNvfwHGO7klyxP17O55LRrFZ4TtqbzE6mYB7ZW4/5NzHXVd4hIDfrzyVRpuu1YXZUTDvlCVMwtPt/XAv1S6pkSj4U2dLdEjRyNYSaCRdC/KqSo1wL6jLTalhsc24Jh/qa4L/PgPQALsi0d255njht4ue4KlGIKT9vvtNjwYaisSxslvk3qT1WiagefqV68ExP7pdZEUIKi2uWqFvoAVJkyMv0ujsfy9mDfTqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJmfcqzJvaCIzV+ke06uE0uwspOD4HMPGAkgYgj7kgc=;
 b=dlTV/8eU3ufamTatqd3wPN8aTy4dh3Qxp42KTp6P8tpb7QX0YEajFulRYypqnH7rFim/Z2zslJvmRd2ErdPmtIvyhmwnCKNZmjG2W5zL3+LQxAKKlsmFrnIUmp75Pjr8OscvSGca7YDnjo5N8g+sMljk8xlyglN2UIfpFOFS/fSj+4jht9HXTF2tFEygvcpiLC6yYB1RbAJ3CwG5aoj2KCnagPmIJgQ2oXjqsKaSVIfUiXR5EhTjQur/DKGGKR1gelcu35Fwtmh2jLRnyyi+Pq7RmCLf7L6PMdrYLHdPgPL2vSL6soWUg59fNq/oeyJ5t4Vz8V+P9dJQigaZ2WFl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJmfcqzJvaCIzV+ke06uE0uwspOD4HMPGAkgYgj7kgc=;
 b=3ima75nDK6uX2SnV+PHiQPkt7GuC0ZMB/Iy0mugdL4gHam3ISwbOgq+Qla8hj6NcGbHlGx5nNT58/c7mYPj53DKbhVFM3tBXoTfYpncCGsX/D+Y7gLHi+DSYXuw3Sndy6tXxGroAQPcFMM0gdkPT2FyUPKoqIncYYMqXCzgydxA=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3516.eurprd08.prod.outlook.com (2603:10a6:10:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 27 Aug
 2020 14:43:21 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::7c65:30f9:4e87:f58a%3]) with mapi id 15.20.3305.031; Thu, 27 Aug 2020
 14:43:21 +0000
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
Thread-Index: AQHWciFVcsywJJdZQkaV3T6+80KEwKk7iMIAgABqgQCAECAmgIAAB/8AgAABJQA=
Date: Thu, 27 Aug 2020 14:43:21 +0000
Message-ID: <5B0B3870-08D9-4E01-9FEF-B1DCA48092DA@arm.com>
References: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
 <20200817013409.GA13307@gmail.com>
 <162BFF110C03FC4E.19371@lists.yoctoproject.org>
 <574CF513-EDAF-42F3-843B-2F52A144EDC6@arm.com>
 <CADkTA4M6362pLp5eFkBTAQhchr943S0KkZBLj_dnAgvhQS2-yw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M6362pLp5eFkBTAQhchr943S0KkZBLj_dnAgvhQS2-yw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b471e1d1-7662-4970-124e-08d84a979a2d
x-ms-traffictypediagnostic: DB7PR08MB3516:|DB6PR0802MB2294:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2294C64F2D008063598728129D550@DB6PR0802MB2294.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BuIro0RVVo0tECb6lC0HIrfB0BJeqe2OUy9H0IurgctqwX5CBiQ9IQB+jiMOkyb/GRr5aNCIgCN+5WiJlQCYvNTqpvscGsVgHO3YcdR7t9FLimvmx6l4QLc5b5Wr53VyLtHyWc0F2EJfhWhyJmiXdKFkRHhvSKQ8EHB8p0m7rU/HCB+I4ZkoVugmM2Zyy9/xB0SY8Thl8uyuaGflU7hCn10CX5dMg+A5cLX++6dfe47e5OK5/lqndm+xfwJKcjyada8TsFILn7XNKicIka0b51x+h+OmJtZiuB3EEukm8PfgVX1WJuqFJOJ8oidxrxrJc1EopCczLg8KjaPibGjSgdti8KHZZDX/f0gpnMGPE0x2g/a4RhYfULiXYawy4Lgfap5WDm82jvE5gcZDRoNMGw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(71200400001)(54906003)(6512007)(66446008)(66946007)(8936002)(66556008)(64756008)(316002)(86362001)(6506007)(186003)(478600001)(66476007)(33656002)(6486002)(4326008)(6916009)(966005)(2906002)(53546011)(8676002)(83380400001)(5660300002)(26005)(91956017)(76116006)(36756003)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 S3mkKulGnwxN2+WBZfcwDEKC3dzIJySpZ1iAWmfsP+bbWf1uCChC3L8FkRSM1QFkVBmgyHhoxGVfKwWdRNdeCFd/b56Q6DbrTYwjVPZmO6U6Jz/P+XuuVL/TbrOJMsew2Vw3C4ePZ5VNnNQXoeCGZyCYlpE3gwDDn2TlNNOUpaH+CGcgqTA+34XfKW42TR2OHQfzT+rcPOWRPt1+SV1pad1ikkdpcq/b7JH7NzgAtVrGCZEHs1AHPJzubOx5eA9sndxXC9x/O9oR+wJqwlY1Dry0mXh5X1Vwn5if01520Z17MTcGGysSnoyWbsEEvqvmgxUzIF+CfUWxJUsew8SUOBTW3oChZ/FlBMjNpu6JiiGCJEnNH9CNjq0RJzLbizxeboMYoLCk9xlO2l0stdzb9X0nhZWm8AYzdFLkW5WVCdRQsz16xHN4fmp7mA/Q50buN03Vu/vBDmxjv/zF29I70bpOg95VdNBKhkkkPakWd17lBCuqIFLj4VMHb0VFkp5OQp5MlnxH8DBkE/T4azZUUkRFJcI3Q10VR8HKUcJZPxw16LUtd78EZHElxcdDazkdcMjwzWyD5xGs/JEAt1xC73tsQZSgKBS7pDxvDkG7t60hLYQGHuiWGVyYAjMgVlsR9/jSRv8FQvaLnyZckCJjgg==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3516
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8e1652da-a599-45c0-0581-08d84a978b80
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hA+dIOiXLSstdfU8N3JzZgtcT84Gf+t+XmWxtW4LjlGb5+oxCeCJEId9CNE776anbJ6qEp8JxA1poSYCwLV7aAUeCpYyVW4SaPg/4Nweg1pgJweNDISFgKIQV/1ErkJbEkk8ABp5ovmBUXNyl9zA+txEOD1eJ4Fhqkhc9bgw8GzIBjZRNAaKXcwmmVN1BeyBvfOhDkOFh5mDbmOUhiJEaPTYy9eKS3S/PQ4Bi4fTPONsBwCaoTeFJEYQCezO3yy3eDW51PWxAzqGDwd6iM3GXmCoadoerY8eLK//hntqgNu5TMS0xttFSgQPx0gqyc1BAiNZQqwO9muAvaix81Ov7+2upjrAzxBRpchrEzoHH2MVbKxv2MGYvKnAcueyk7McPYmuogs/d+6nZIArxoncQBtwJobssx9JTZBBjC96dBKAsNX3rMCnmyXRt4A/x4Q8gMrUUhUY47xtwH2GEV5TsEfH6F8PZ9HVYrltHmRho80=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(46966005)(36906005)(2616005)(336012)(81166007)(316002)(966005)(2906002)(82310400002)(356005)(478600001)(6512007)(8676002)(83380400001)(86362001)(6506007)(82740400003)(47076004)(33656002)(8936002)(70206006)(70586007)(53546011)(186003)(6862004)(4326008)(54906003)(5660300002)(36756003)(6486002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:43:45.9457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b471e1d1-7662-4970-124e-08d84a979a2d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2294
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D7E4514864AB4459BFA3C63F03BF376@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 27 Aug 2020, at 15:39, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
>=20
> I was waiting on something from Christopher on this, but as it turns
> out .. I was going to do a merge of the pending queue now that some
> oe-core work is done.
>=20
> So your timing is good. It should be in the tree by EOD.
>=20

I have a recurrent task to check for pending pushes on different mailing l=
ists ;-)

Perfect thanks a lot :-)

Bertrand

> Bruce
>=20
> On Thu, Aug 27, 2020 at 10:10 AM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
>>=20
>> Gentle ping :-)
>>=20
>> Bertrand
>>=20
>>> On 17 Aug 2020, at 08:55, Bertrand Marquis via lists.yoctoproject.org =
<bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>>>=20
>>>=20
>>>=20
>>>> On 17 Aug 2020, at 02:34, Bruce Ashfield via lists.yoctoproject.org <=
bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>>=20
>>>> In message: [meta-virtualization][PATCH v2] xen: Fix menuconfig and a=
dd support for config fragments and diffconfig
>>>> on 14/08/2020 Diego Sueiro wrote:
>>>>=20
>>>>> Changes in v2:
>>>>>  - Fixed typo in recipes-extended/xen/README
>>>>>  - Removed documentation changes from 0001-menuconfig-mconf-cfg-Allo=
w-specification-of-ncurses-location.patch
>>>>>  - Updated Upstream-Status in 0001-menuconfig-mconf-cfg-Allow-specif=
ication-of-ncurses-location.patch
>>>>>  - Call find_cfgs function only once in recipes-extended/xen/xen-hyp=
ervisor.inc
>>>>=20
>>>>=20
>>>> v2 looks good to me.
>>>>=20
>>>> Christopher, do you agree ?
>>>=20
>>> I tested it and it worked for me, including modifying the xen configur=
ation.
>>>=20
>>> So you can add my:
>>>=20
>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>=20
>>>>=20
>>>> Bruce
>>>>=20
>>>>>=20
>>>>> Diego Sueiro (1):
>>>>> xen: Fix menuconfig and add support for config fragments and
>>>>>  diffconfig
>>>>>=20
>>>>> recipes-extended/xen/README                        |  3 ++
>>>>> ...g-Allow-specification-of-ncurses-location.patch | 49 ++++++++++++=
++++++++++
>>>>> recipes-extended/xen/xen-hypervisor.inc            | 49 +++++++++---=
----------
>>>>> recipes-extended/xen/xen_4.14.bb                   |  1 +
>>>>> recipes-extended/xen/xen_git.bb                    |  1 +
>>>>> 5 files changed, 73 insertions(+), 30 deletions(-)
>>>>> create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-=
cfg-Allow-specification-of-ncurses-location.patch
>>>>>=20
>>>>> --
>>>>> 2.7.4
>>>>>=20
>>>>> IMPORTANT NOTICE: The contents of this email and any attachments are=
 confidential and may also be privileged. If you are not the intended recip=
ient, please notify the sender immediately and do not disclose the contents=
 to any other person, use it for any purpose, or store or copy the informat=
ion in any medium. Thank you.
>>>>=20
>>>>>=20
>>>>=20
>>>>=20
>>>=20
>>>=20
>>=20
>>=20
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

