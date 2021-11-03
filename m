Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.60])
 by mx.groups.io with SMTP id smtpd.web12.6530.1635941511358243171
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 05:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Qno0EU5a;
 spf=pass (domain: arm.com, ip: 40.107.0.60, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmY1qrDEl4BLFNqJHR2N7sINwNEHXnpw7U3d10YUOiw=;
 b=Qno0EU5a0Zsc1XVLD0q1ZK9hBs3TrAn8AFnly3jo9xv3DsSB5S5tJhcuVrRT6BnL+v/XDzCq3l6GBLzVV0PO+9d7y2g7WYHXZoyTCIs5hE+/WHyw92FPR2SHU2NL6VrwdkrjZXgFeTr5gS0xwqo27M3cuvR/aQnCiD3kDzSL3nE=
Received: from AS9PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:20b:464::29)
 by PAXPR08MB7231.eurprd08.prod.outlook.com (2603:10a6:102:1db::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 12:11:47 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::9) by AS9PR06CA0076.outlook.office365.com
 (2603:10a6:20b:464::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 12:11:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 12:11:46 +0000
Received: ("Tessian outbound 7129402754f2:v108"); Wed, 03 Nov 2021 12:11:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f6961ce974930e0
X-CR-MTA-TID: 64aa7808
Received: from 22dfd8ab251c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7BB9066C-B3BA-4622-9196-B30E3EC9BFC2.1;
	Wed, 03 Nov 2021 12:11:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22dfd8ab251c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 03 Nov 2021 12:11:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mz6uPr7+g9sJAQL36bz343wh4sDmvqP1qQD/YUUHEFlQVgVtPos6j+Ye1rynf1TArSsDRhnuU1ACaPN935VeruBlm4Uy/8uwz/uGuLQ25pPgS1t08KWE+UETpWM1Upej+l5Oe94XdQti51qPrUMEt4ssQvjc4U6zJTN5m4exW8moI+96RNCdbuW/bWI1ztCL3QBNN5fMsSMdTHUKrOZJhxmLqD3xr+Bcd2japNSxtkyXxiPLfD9H3kcfoJ3G41NfH2mKpSeQdRpC6lgzSg5J/I9FbZeayTVtouXqhEZlCoYU6+nEw++B44Qeb8hgvJaxXUF/wlSB5nNkY89Wdv9hgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmY1qrDEl4BLFNqJHR2N7sINwNEHXnpw7U3d10YUOiw=;
 b=J0SwfrCmRhHiTCmxAiVdp/gUsClvpoLJM+N1cT93k7AX6thecLeJaWHW38v2UTPvgaaUzJ00QX2otGu1X+LIf78evOXjh3X9c8FOnXh54wmL9AZxgocc8/x4yP7ruuKOvxTo7gc92zDijXBD9hqzTWHCjGZ42ZyFAJDFHNHHUniAj19roe1gM/2LUakIk4iYjRN21tvAwZJSm5IiXu/Zb4ghfflYdTMCx+jeJHaLkUzjtFUnGunBfAtkUtlwcOa327hj/vJHcfLNWYVa7c91oEOVMnkVMf6EQFH/9DHz2qgtZOVvkFy+7wmpLGg2xb5BMkpfiwmyuHJHboCS39H2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmY1qrDEl4BLFNqJHR2N7sINwNEHXnpw7U3d10YUOiw=;
 b=Qno0EU5a0Zsc1XVLD0q1ZK9hBs3TrAn8AFnly3jo9xv3DsSB5S5tJhcuVrRT6BnL+v/XDzCq3l6GBLzVV0PO+9d7y2g7WYHXZoyTCIs5hE+/WHyw92FPR2SHU2NL6VrwdkrjZXgFeTr5gS0xwqo27M3cuvR/aQnCiD3kDzSL3nE=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5960.eurprd08.prod.outlook.com (2603:10a6:20b:29a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 12:11:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 12:11:35 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Edward Pickup <Edward.Pickup@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Error building Xen device tree for qemuarm64
Thread-Topic: [meta-virtualization] Error building Xen device tree for
 qemuarm64
Thread-Index: AdfKaNrlOvyQzYIUQaGokIBx1i2kqgAA6MeAAAAQeqAAEOGyAAF+6tiA
Date: Wed, 3 Nov 2021 12:11:35 +0000
Message-ID: <708E6FE4-D7F6-428C-8D56-67DB594302EB@arm.com>
References: 
 <AM6PR08MB4086AA6D776124ABB5125CE8F0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
 <CADkTA4Nu5eGqsfe5mmJ6cHQQ51BAUY+4aROaWqa-5tbNH+Kxqg@mail.gmail.com>
 <AM6PR08MB40864FE34FC26FC9EDD37AEDF0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
 <CADkTA4Oec38XsZJZP-p+LXax_vkHME9wm5AO4t3gSE32eO8WAA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Oec38XsZJZP-p+LXax_vkHME9wm5AO4t3gSE32eO8WAA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d4d50195-d3de-4aca-df48-08d99ec31be1
x-ms-traffictypediagnostic: AS8PR08MB5960:|PAXPR08MB7231:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB723147BA7D68CFD294D1E10F9D8C9@PAXPR08MB7231.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 e/oemsB1V4rJYozhKM7qOdJCZLSlXHq+mHYW7GBWxmlVbS8QN5IgeYkkHaNXdZgfcy2rYy/g4JJIw8ybWKasb46wXDjab3K/aGsXu2hup/OHDDJ0ZNBykHjji9K7lDRymgAd9HPDjHU2+Nj0r7hK/WDY0jNWPkuVsxGFAhe271HYMS5O8j29l+HJy5phh4MADm9qAhnP3x3sof1PaSJ7MTzVdlKGNuyrltlSTr4FLtKXXon3iRNbY/X7fQk0cwjOB/hfTstvpNQZyzXOaC0Q0qzPH5G2VmsMcwz9Wc8xOPbIZSJhFGf0huUhd+1XOi8HPUSnactSt+6pTBHeb0ApHfvt+OCCVngebz7jPUJt7ylbs2nV/9FPHxfarcxDIuEYtKBd7tib33BbfJ2otTKUhqF8P1rrEKBTi03K17l10o9xZCzS7y+0UDV4/R1DcAZ4C/ROB/jltq2+gDlPCkDv/4FiTzFNQGpyHh/A6PtjFyG70W1tYLp2iIcYI2k0MZl9TLiVur4m6I2+6c+6QIy1XLmzvl3XSk6sy/6Sd+/uczkYY2Iql0yPyJGQ8fKF0lt4e+D/80FnPnGwMAS4ihZ0zNPWxNOpT9XSIikkJT6R6esyPaNhHyAY7G4ytr3vyyInhGi8Y1qKmuqdAjExbYHze6COOQpqfHGo4A/chuZq5yYxO1gN8iLns4FdTcBp7VeRRXCOm4r5sJTrnYIuuknBQ8nKYzaF+XNyRNXl5rcOF/JB9nISJ8U/S5h+W0ng3Z+Yw0n3ifDo3MHAlLhk3D42da0gfMafdkKTJAS+TRuBJ9leGqbp5ttPDkn1i69AQXgglmwgfdrKleNIR6CFii4INV2unDZ8JWif3iUgWBlVai8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(186003)(508600001)(966005)(83380400001)(76116006)(6916009)(71200400001)(38100700002)(66446008)(66556008)(64756008)(66476007)(91956017)(2906002)(316002)(66946007)(6506007)(54906003)(26005)(122000001)(4326008)(53546011)(6486002)(5660300002)(6512007)(36756003)(8936002)(86362001)(33656002)(8676002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5960
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0a09c82d-4a03-4bf1-06ac-08d99ec314e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cb58TGPUKUFhh1vun5x2ne326S5wvyNf1rMxaSNC8OO65X4j6Jj25IdcNgvvx+ZdkNY7PdXLz+7joAGP6XRCXKx1kJapDjttg9oRcf2COXldn0eNX1Mc2OG1IKYS5Zp5IDvk3UPrjHf4rfuZXJ6v2QslTbYhddBBRepaXRN7+hDWxc2AM9aTxhSIcsm52LXx38BDZ8XIQfPhWMs23C971+srmL4IpNqKKUHnTZ6KnjQBP3LmgajpOujO+by5W4kL25jTJtWbfMedaP2rIjAZ90Y+QhCOramyQsbCcRhatIRkjAyNBUXVRZGM3BHQlMEM+lBnmqqpedHzBRZTvj+9JfzPE53Cd4ApjH0VIB2mMW6+u5dnPwpzkTnf97MWbs1Lg+1JSgAVCmccJYYvMd/jYkBRsTZ3dc4PEhMNEaKeezzxdCAz7XNqyRKx1a7sZYwoab5d6UhOpb0tVpJKZ5Z5o9yB3SmUb7QEXzFYv3tJ0kL2nMb//EDUOj9MWmlo82aVhDx0U65EmQX6JKCmOUMcYxtNUn7khsN2YoyVZd4e9AOGdhSvcMeI0OBSl5tgXwFPgSW+fGm62GDnEGj8ETs/K90PbewoGLKr7Nk0ZPZH7ahh/fCLOODcuNba6JQ5TezxphQ3Ykfc7ZccDb9TqxhkutqH4aasKiR8uEa33mLsJvguJDShQUcgGIYDblZrpPWA/mksS7bbbWlzbIIkhZ4YhN7K+5kWLKQ0rodKSQ9n6iHOVdeZnrO30jfHM4pS/f+Ocd0iyAkMmUaIrXLsP6hP55MgauSbp8RKcYv295pPl30imv7ui9lIl4GO9LEciUBr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(356005)(70206006)(47076005)(966005)(53546011)(2906002)(36860700001)(81166007)(5660300002)(86362001)(336012)(2616005)(4326008)(36756003)(54906003)(33656002)(26005)(6862004)(186003)(316002)(70586007)(6486002)(8936002)(82310400003)(6506007)(8676002)(508600001)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 12:11:46.1110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d50195-d3de-4aca-df48-08d99ec31be1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7231
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B172360477A3F046B74B77199CB6589E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 26 Oct 2021, at 22:27, Bruce Ashfield <bruce.ashfield@gmail.com> wrote=
:
>=20
>=20
>=20
>=20
> On Tue, Oct 26, 2021 at 9:27 AM Edward Pickup <Edward.Pickup@arm.com> wro=
te:
> Hi Bruce,=20
> Sorry for the formatting issues, email client config issues
>=20
> =20
>=20
> From: Bruce Ashfield <bruce.ashfield@gmail.com>=20
> Sent: 26 October 2021 14:22
> To: Edward Pickup <Edward.Pickup@arm.com>
> Cc: meta-virtualization@lists.yoctoproject.org; Bertrand Marquis <Bertran=
d.Marquis@arm.com>; christopher.w.clark@gmail.com; nd <nd@arm.com>
> Subject: Re: [meta-virtualization] Error building Xen device tree for qem=
uarm64
>=20
> =20
>=20
> =20
>=20
> =20
>=20
> On Tue, Oct 26, 2021 at 8:58 AM Edward Pickup <edward.pickup@arm.com> wro=
te:
>=20
> Hi all,
>=20
> I have encountered an error while building the arm64 version of the xen 4=
.16 recipe in meta-virtualisation, using the master version of poky and met=
a-virtuaisation.
> I was wondering if anyone was familiar with the issue or knew how to fix =
it. The error is as follows:
>=20
> ERROR: xen-image-minimal-1.0-r0 do_write_xen_qemuboot_dtb: ExecutionError=
('/home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-rele=
ase.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/run.do_=
write_xen_qemuboot_dtb.3679135', 2, None, None)
> ERROR: Logfile of failure stored in: /home/edwpic01/work/master-update-xe=
n/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/=
xen-image-minimal/1.0-r0/temp/log.do_write_xen_qemuboot_dtb.3679135 .
>=20
> I believe the relevant part of the log is as follows:
>=20
> | [NOTE]: '3' lopper operation files will be processed
> | [INFO]: dtb output format detected, writing /home/edwpic01/work/master-=
update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-po=
ky-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/x=
en-image-minimal-qemuarm64-20211026121502.qemuboot.dtb
> | [INFO]: writing output dtb: /home/edwpic01/work/master-update-xen/build=
/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-ima=
ge-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-minimal=
-qemuarm64-20211026121502.qemuboot.dtb
> | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-re=
lease.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-=
minimal-1.0/output.dts: ERROR (explicit_phandles): /apb-pclk:phandle: bad l=
ength (1) phandle property
> | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-re=
lease.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-=
minimal-1.0/output.dts: ERROR (explicit_phandles): /intc@8000000:phandle: b=
ad length (1) phandle property
> | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-re=
lease.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-=
minimal-1.0/output.dts: ERROR (explicit_phandles): /pl061@9030000:phandle: =
bad length (1) phandle property
> | ERROR: Input tree has errors, aborting (use -f to force output)
> | WARNING: exit code 2 from a shell command.
>=20
> The above error was the result from building on x86_64-linux, target syst=
em was aarch64-poky-linux, running on a qemuarch64 machine, itself running =
on x86_64 linux.
> As mentioned this was done on the master version of meta-virtualisation.
> The bitbake command to generate this was bitbake xen-image-mininal.
> The error is also present when building the xen 4.14 and xen 4.15 arm64 v=
ersions, and is not present on the arm32 or x86 builds for xen.
> If anyone knows the cause of the error, the information would be apprecia=
ted.
>=20
> =20
>=20
> There's something wrong with the input DTS to Lopper .. luckily, I mainta=
in Lopper, so if there's an actual bug in the processing of the input DTS .=
. I can fix that.
>=20
> =20
>=20
> I can fire up a build and see if it happens here.


Could this be also considered for honister branch ?

Regards
Bertrand

>=20
> =20
>=20
> So this is just qemuarm64, with xen + virtualization in the distro featur=
es ? Any other layers ? Anything else ?
>=20
> =20
>=20
> Bruce
>=20
> Yes, this is just as you say, no other layers or anything else. Thank you=
 for the speedy reply!
>=20
>=20
> There's a really bad interaction between libfdt and python 3.10.=20
>=20
> I've traced the error down to libfdt not being able to read anything from=
 the dtbs and hence the chained errors.
>=20
> I'm building some older branches to confirm behaviours .. it will take me=
 a few days to sort through this, but I don't want to mask the issue, as I =
need to understand exactly what is going on here.
>=20
> Bruce
>=20
> =20
> =20
>=20
> Edward
>=20
> =20
>=20
>=20
> Cheers!
>=20
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
>=20
>=20
>=20
>=20
>=20
> =20
>=20
> --=20
>=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II

