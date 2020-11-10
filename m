Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web09.25216.1604997078541421717
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 00:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=blyUMOYD;
 spf=pass (domain: arm.com, ip: 40.107.21.72, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm4ePXB+EK1j1WWW6Ys7ba1gnHUKuKJnXQT/XAS2U5Q=;
 b=blyUMOYDvAcp2BGjotyneT7CU21a7vKb9hM0+Adr/BcjNPLRRSxWSzXts5oEjSG3xUU/sFcfewz1rbLUFYjgA083Nz9gy3FoozdQAnT2zzXWYK3XIZT/vPX0p9KLA/Ql4NpZfAPsh7HoqeV/40MWL794itU66V4SovZfZJDL6HE=
Received: from DBBPR09CA0036.eurprd09.prod.outlook.com (2603:10a6:10:d4::24)
 by AM0PR08MB5443.eurprd08.prod.outlook.com (2603:10a6:208:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Tue, 10 Nov
 2020 08:31:16 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::22) by DBBPR09CA0036.outlook.office365.com
 (2603:10a6:10:d4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Tue, 10 Nov 2020 08:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.17 via Frontend Transport; Tue, 10 Nov 2020 08:31:15 +0000
Received: ("Tessian outbound d6c201accd3c:v71"); Tue, 10 Nov 2020 08:31:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6c8a62cf34e1571
X-CR-MTA-TID: 64aa7808
Received: from f1371b38d2ae.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4EA525DD-77F3-40C0-AC59-8875213F184B.1;
	Tue, 10 Nov 2020 08:31:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1371b38d2ae.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 Nov 2020 08:31:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlbUxYBCvT7H61gZzTbFIrxRRIugU0E+TPBvi/fwP+3jQ7p2YRHCVkOhFJtn3jggcrNOJ+CzTx6T/rQtCsubnHO0qqaLhqeot5ZNykg37+NOxGLyG19MX2IO6T3tOqaLteJXsXSjUc/nxyJMyi4CPLudeDEHFw71t1qRGeUT3qXm70ruWSfW80Dh7v7u193oRa4EtxxPsxAb0/nIBgcal48n3kB4S6fTTLKjNEEmd0BxSpARBAArWR4rSh+LcG+OjgtX1qNejx9uHrLdC+D8QFONsOS+j87MBUJTpUtfidztLAP4tUmnGjHuTA4dc/A4TEOWd92RMVBWFqzqPbIOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm4ePXB+EK1j1WWW6Ys7ba1gnHUKuKJnXQT/XAS2U5Q=;
 b=MwWqbOleDbeLGaDDFjEmBN8XBmP0pK4dvwNAAYpLkdTs0clKa0LFG6XM2P1wrsyd+eCpO5WPk81KiqnbrAfDj0xjyG322nYk7RLfFGbWR7FuBn4hnD5GOt6TFLwzzYNrXZTJsQMvUIuZQapZgnHCbaOFG8aERSJJTE0eMHvBRUmdVvb7RaKRA5fi9mzN/Zyovb0i02/N+y7vlExhvrEiiwlq7HjuwTE5vAyRCfdXBrPpCTj+bBD2xaNDke0kkviwZJ7esEPh6JmMzzDhgNhyk+7FYCepqERnKDzsJtsyHe2j28TxEMOOliFaP/Cdw81n6I+Wto3T0OxdalL1whorWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm4ePXB+EK1j1WWW6Ys7ba1gnHUKuKJnXQT/XAS2U5Q=;
 b=blyUMOYDvAcp2BGjotyneT7CU21a7vKb9hM0+Adr/BcjNPLRRSxWSzXts5oEjSG3xUU/sFcfewz1rbLUFYjgA083Nz9gy3FoozdQAnT2zzXWYK3XIZT/vPX0p9KLA/Ql4NpZfAPsh7HoqeV/40MWL794itU66V4SovZfZJDL6HE=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4363.eurprd08.prod.outlook.com (2603:10a6:10:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 10 Nov
 2020 08:31:01 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3499.032; Tue, 10 Nov 2020
 08:31:01 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen: Fix python libraries installation on multilib
Thread-Topic: [meta-virtualization] [PATCH 1/2] xen: Fix python libraries
 installation on multilib
Thread-Index: AQHWtzW7hu1XztsXcUaavOZKWxmM+qnBCTcA
Date: Tue, 10 Nov 2020 08:31:01 +0000
Message-ID: <DEB61562-75C4-4C3D-8CFC-EA18B4AD5166@arm.com>
References: <cover.1604933003.git.bertrand.marquis@arm.com>
 <df132acec4c899d81d6a1b52746f0dc782c08e39.1604933003.git.bertrand.marquis@arm.com>
 <CACMJ4GYKuB_KVwfuGkcrYF5c8G-LHDKZGgj4+v13FjS+sctXww@mail.gmail.com>
In-Reply-To: 
 <CACMJ4GYKuB_KVwfuGkcrYF5c8G-LHDKZGgj4+v13FjS+sctXww@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2e4b1ddc-386e-4072-2d86-08d88552fd66
x-ms-traffictypediagnostic: DBBPR08MB4363:|AM0PR08MB5443:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5443C723EB4824C67F681CD79DE90@AM0PR08MB5443.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 eBPKu1EtPw2OZlitL0rGMj5ympep8nrj2W/76dpkUmCgU4ZhzpnLy7KqMdXBHgVj2HP15KPiKcOJQO+Lx2oJSNNci+QsXhB54/aqz43Mq6hL3xVTvCbhB6U9fTrwrVmMcXanf9HyCu6WRMnkWpeyNl6lb+xsQYgUFMIe7hw0L8Y+gyZE1AqXOd3zqgg/08Gvo8e3yslbJilanp56Woy9lG58MZraUHMXktchsqvDyaxc9XH8zrGYApH5Glqzt+d/VoGSFxqhPZYhF2IRQ8oYYfpYUDLlLRFTUGwP7GdtG4R0pMD+WO8Zf6NLEZjG8DHNL3r7ur+ALG+X8+iPdLNNaBqH18VMxYqdd8eQf1Kd9YlxYZ/iSZBEKtNP5f1vPHRhMZsuR4oXFvP7U2mNP7C6Dw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(66446008)(186003)(91956017)(66946007)(76116006)(64756008)(8676002)(66476007)(33656002)(2616005)(966005)(8936002)(6512007)(2906002)(6486002)(4326008)(86362001)(71200400001)(5660300002)(26005)(6916009)(36756003)(6506007)(316002)(66556008)(53546011)(83380400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 sbqpdMTjY1jJw96wi89JxCBAR36tPNP+qDLT9LcaCnHWsc6GYYmcLoYvpDHlj6jEwzYckpATLLZ7pCMSSYKVpMp+/rbNOpJhv3z3DBSAoj2dhIqzSpGLJI0YanC66UFjkk3FZu3hSDGLWJG0LkIXqtVQGzY+lDPgNG0fLRC13Z6GM1gqsPn5U5IwJC3WvgpQUuCfllgOKTUrS9vFhs3mUvuLp8/6CMnCJhsxzS9qKLZ6xfAryZz1SYKTsTtb8ZPNEKDy8TVENC4jG4OrW3CZnfNJOuxjRPzra60ds1fQj8wg9MwXr/HNh/SCQq/RbQXAlYYeZ8/5ALt8f3GS2ZZWP0WnEGPOcAJpAHmZJo+3Gx9GTevYzwyfCDCmEngiVJXJBtO6n7ZLdbd7LglT5b5QhwsW2Rb1MSu5I3JdkJqDlY93fAjEB5ITRD1NqJ9XvQecu/fanINvyk4mGE82s7aZifFxc/uzITI/xmpmPu9e4uNANRzfAqMrJdZhM85gSksOETT1H+j+b0xO1vrYhSDx19FZXxgYqw6XTrWtWuoCRWXbLSXdCwu4bJVelX35o8KQ9lg0HKLwvRyaFKt/0frEag3f4PIpd/sJfHqeMDYl48ns39addFaDdCNJywy5nC+GtN7dfgkq04dkPBm1bGeCQA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4363
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	419939f9-5b90-463b-9008-08d88552f4ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AmZ5JEodQtu8U/iQn7u3Ny+ISBEIztirZ/jkTKFflWLky5lHpm6vn/fEiCbOTaj/DQ94/CqXM5iKA7bn8EQcln+NxB5oSRfT23KBGLenGQOtltqGhunoYwE3MHcOw6aTS8+GGANTLoLbGhD7ZqEA59CJ7S7JiIFHduZZCYDAlv/XZho058a4RHgWrreZraWbfVSVrgHkVkhbvoc9jEf2ZVJ3qSfPszdieffU6Hj1ykWAAYUV1iiXn1fJbKAaKj+fx4bc2Y7YHw8TD/iKg4YOgfAA0GfclxSvEyEnX9ggpY61NKiwhaRHC0VynpuDKZNjkIQNCro0stpgbVEpdWN4UR8ygW+4cViiZen1bbmD/I51Vpyp4Cm78eNSV7pOScHVlcaQxxbxwUeDA01zPCUXtyjDEYg5iL3LOGWjSSzkqcUwUFL001lAB66KCVXvRfOJth5HHalPn3oK+Ug59n3FnrW0RDTobBljNqZhJs+oKLs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966005)(83380400001)(4326008)(336012)(316002)(82740400003)(47076004)(2906002)(2616005)(70586007)(356005)(70206006)(5660300002)(6862004)(36756003)(33656002)(81166007)(53546011)(86362001)(26005)(966005)(6486002)(82310400003)(186003)(8676002)(6506007)(8936002)(478600001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 08:31:15.7729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4b1ddc-386e-4072-2d86-08d88552fd66
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5443
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CB2C194ED800514F80992C5074082CA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

> On 10 Nov 2020, at 07:47, Christopher Clark <christopher.w.clark@gmail.c=
om> wrote:
>
> On Mon, Nov 9, 2020 at 6:49 AM Bertrand Marquis
> <bertrand.marquis@arm.com> wrote:
>>
>> Fix install path for xen python libraries when multilib configuration i=
s
>> activated (which is mandatory to compile xen for x86_64).
>> Depending on the version of Xen, the libraries are installed on lib or
>> on the nonarch lib directory so add both.
>
> Thanks, Bertrand -- I have positive results for this with
> compile-tests with both Xen 4.14 and 4.15 for x86_64.

I tried on x86_64 and also on arm32 and arm64 and all compile tests are no=
w passing.

>
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Change-Id: I1f7f81a4e9e1420bce55d1e4bfe03d98ac2c93a3
>> ---
>> recipes-extended/xen/xen-tools.inc | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/=
xen-tools.inc
>> index 736a766..0c69fec 100644
>> --- a/recipes-extended/xen/xen-tools.inc
>> +++ b/recipes-extended/xen/xen-tools.inc
>> @@ -496,7 +496,9 @@ FILES_${PN}-pygrub =3D "\
>>     ${libdir}/xen/bin/pygrub \
>>     "
>>
>> +# Depending on the version of Xen libdir or nonarch libdir is used
>> FILES_${PN}-python =3D "\
>> +    ${libdir}/${PYTHON_DIR} \
>>     ${nonarch_libdir}/${PYTHON_DIR} \
>>     "
>
> Do you know whether a similar change is also needed for the python
> nonarch_libdir items in the -dbg package, when building older versions
> of Xen?

No from my tests this is not needed.
Just after gatesgarth branch is released i will push patches to update Xen=
 SRCREV
in both 4.14 and master (which will also allow to remove some patches).
I will also spend some time checking dunfell but right now i have no resul=
ts i can share.

Cheers
Bertrand

>
> Christopher
>
>>
>> --
>> 2.17.1
>>
>>
>>=20
>>

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
