Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.51])
 by mx.groups.io with SMTP id smtpd.web09.8131.1635948628146752539
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 07:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Nd2K+0QC;
 spf=pass (domain: arm.com, ip: 40.107.22.51, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aByjpXjF8rAjm2aJtJQALCJik/Mw3ZMwP6YMdUH9yZ0=;
 b=Nd2K+0QCx5QsPGHWYaDJuSYtEGNLzWleurZbYvJjz/D7tSHo0Nk3dqRFYMPna6EfCGpth05OCuyBXqLKIv9of1dEz5WI+EHORfzKJbMIRdcM0DPGZcvLEmGJRmxpyS+UejsSIowsHbIQ3/rtoJlbrfr/0uFhQ/LSaUp4ePfghzU=
Received: from DB6PR0202CA0012.eurprd02.prod.outlook.com (2603:10a6:4:29::22)
 by PR2PR08MB4859.eurprd08.prod.outlook.com (2603:10a6:101:28::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 14:10:18 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::b6) by DB6PR0202CA0012.outlook.office365.com
 (2603:10a6:4:29::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 14:10:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 14:10:17 +0000
Received: ("Tessian outbound 7b0bcc4a550a:v108"); Wed, 03 Nov 2021 14:10:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d1137c1a82ea4bb8
X-CR-MTA-TID: 64aa7808
Received: from f473d9338a87.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A111D8DB-0F4B-42C2-A00C-DE05CAEAC5BF.1;
	Wed, 03 Nov 2021 14:10:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f473d9338a87.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 03 Nov 2021 14:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USv72K1R5SJvBYmmJ4AuGnHJt/WpiNOOnJO86yLTJXhOfJo3FQ0xyyRAI1XijYP1tAHjKwhpNjj4lSSmhiUqxz3KriQPNRZr/vksxzSb2bW4WoP8AXIkb6CuBuWw9XX1i/ZsOy8cGdKL0++u5M3QRTUXXqr1wp8spnsgZS5/jhBBVrUjHJcRT1B/IGN3Cm52Oo34HOqWQ+fktY4Gv5qnOI2/JtS1IYfXh8N1RGJRiew29uqZTdWUkjGSSpjztwPaCyaKtpcwSxeXhS/kJ32EdFOjx9BRyilMB2TZo8a6mXZ+FBIPUPnsEVj3LCapZNw+7exBgqt0EC9GyBz0ZixX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aByjpXjF8rAjm2aJtJQALCJik/Mw3ZMwP6YMdUH9yZ0=;
 b=aUct6MdeL0kxRXO6Ol6AAbhvcBPxs3snQF9kmq0JHA/r7jvP3MV705z/Eq5WJK5PDV74KnnSEpt2eLBvsxlrcjbOWgk6tbNCDxoCp/wNtMkKsSE3Z0svH9pKdxC2H1wqJeeo3c6WdS9mzjjebGWfSOoGKz17wKxG0mmaJRus87BzDQxI5s6rHCEkp+KmVkHynElXri/l24V/RuntigyKb43Ej0gwyDnoW55f2T5nj22srJNZLoy4jvBnW15jZeP/ItIDuxTo9zqXb52UrrFym3fD/Xvvw6X3hnBd+m/orQyWLDSGsuc1m5Ptxn2Xg7V9SzEj2s6fYt45TBve6Ny5dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aByjpXjF8rAjm2aJtJQALCJik/Mw3ZMwP6YMdUH9yZ0=;
 b=Nd2K+0QCx5QsPGHWYaDJuSYtEGNLzWleurZbYvJjz/D7tSHo0Nk3dqRFYMPna6EfCGpth05OCuyBXqLKIv9of1dEz5WI+EHORfzKJbMIRdcM0DPGZcvLEmGJRmxpyS+UejsSIowsHbIQ3/rtoJlbrfr/0uFhQ/LSaUp4ePfghzU=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3493.eurprd08.prod.outlook.com (2603:10a6:20b:4a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 14:10:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:10:04 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Edward Pickup <Edward.Pickup@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] Error building Xen device tree for qemuarm64
Thread-Topic: [meta-virtualization] Error building Xen device tree for
 qemuarm64
Thread-Index: 
 AdfKaNrlOvyQzYIUQaGokIBx1i2kqgAA6MeAAAAQeqAAEOGyAAF+6tiAAAQRcQAAABG8gA==
Date: Wed, 3 Nov 2021 14:10:04 +0000
Message-ID: <00A9DCB3-AE22-4634-BA45-A781D10BE028@arm.com>
References: 
 <AM6PR08MB4086AA6D776124ABB5125CE8F0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
 <CADkTA4Nu5eGqsfe5mmJ6cHQQ51BAUY+4aROaWqa-5tbNH+Kxqg@mail.gmail.com>
 <AM6PR08MB40864FE34FC26FC9EDD37AEDF0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
 <CADkTA4Oec38XsZJZP-p+LXax_vkHME9wm5AO4t3gSE32eO8WAA@mail.gmail.com>
 <708E6FE4-D7F6-428C-8D56-67DB594302EB@arm.com>
 <CADkTA4Mcj1EBKvJn-Qp-LBKYQdeto7uaFMTGVFRh_dJVi-zJEQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Mcj1EBKvJn-Qp-LBKYQdeto7uaFMTGVFRh_dJVi-zJEQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e7214729-1c00-48bd-6e35-08d99ed3aa1e
x-ms-traffictypediagnostic: AM6PR08MB3493:|PR2PR08MB4859:
X-Microsoft-Antispam-PRVS: 
	<PR2PR08MB48599E4FBF6BDE4C25F7622F9D8C9@PR2PR08MB4859.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 roIrKtQh/YS9RrmuiJvpdUK2H2xMmBZOEb2zMeHjM6ah//jnikbvouM/eC7XI9E/+dlwGKMHvoqpvR6jhkglqVzBL+6TTVEcqEC3oRdSEaAbJ+7zPmiWdsoOvcFU4n6g7g3zoQnWghClehd+0ZbS8OHcQEXNF1vOPCCkO9TbYzMFvHoklSg+FKAS0nS6Zwn6QkFkueXwGqwDff2HUzbA74EMnHCk6Mh03XUVhTBJ/qKdo1xeUgWBWsCc780DSR05FTKG/6yfrI8n7g2zUAGU/QtQ80zi4N/yhZvVvexfc8Rde7/JSnR0L6p7l509dJUv6oy/8IDwtRvO4tak+IlOnArz3PEzio7vimEZUBgXI1RCY+EtbIO3lD2VVHzNj5lEhIm7pCgXr8DDX94v4ablsCh57jOnZ7CHvuTQ/9yGA+yau1h4Gd5aHnu/Bhp3j1gcJSqfj6QqgI53fHCJD9A+cTv/QGFOISzHIRJSZ/vG5Bi5MVbdK5335nnGUUxcqV2Wt07dNsoBhJ+UX57XH4Sa6XrN8RivsfR55FLAs/zRL9ZIgs0riQfcxr+4Z9FBzolWT+RXpKreR0UK8Xv+mEGYqjVB68nCgcm3dpLnsLJwDAFrHIpK/EyHR23djqSVbJbUaU94y+9jU99nx/zvqorl5Hn33BMuwpp+3wAfHjPX8S0hDd3DLLE1+WumVgNBrak7oCS83OL4vF38f8zyGj/s8WJBlUEUd5arzvWH9VV65pc8Z0luK3mqH8bhEoTMyTKDSH2rYVZtA5GZ/YoViQ5drn8v9YX3MLxNwUyiY7bKbLFBOUXSk/JzqKU/1g/3JZ9i9HZE6HnpO7imeiYzgcIORGZjksN8OPqi+ZvzwpjG8XY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(33656002)(186003)(91956017)(4326008)(8676002)(6512007)(26005)(76116006)(66946007)(38070700005)(71200400001)(316002)(54906003)(83380400001)(966005)(36756003)(6486002)(66446008)(64756008)(8936002)(508600001)(86362001)(38100700002)(122000001)(2616005)(5660300002)(66476007)(66556008)(6916009)(2906002)(45980500001);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3493
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	407f1410-7d9a-4013-27fb-08d99ed3a1f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aSZmfOOvwsbZyIylNAEwnbyxZf3iqH2zLRchkHEcOy9A8rrIfMLesgOeXkzWxX7oUhdsK3occXvLL2NVWB+4943++MTEAoHCe6p/3t3EeJJKveoj/Wep4E+4sbdGg9CGm9wKw+qoriv03bGJ68Y7r3cZZhOQ9luNAxd8Tgs3HMKJetJ3lKnmEZS0DB7JT1+LFhm0We0Xkf6sMuc4K6tH6O8Cknb/fJ8WhMlsvPWwtGoqVN7QuLk6xN56QhFXkK840Iv6f1L0PxWdGFnX+FuM0OmauA7ZakKf6rFQtHCK1/GSRMSkf5S/p9lMtzRO1oCafnLxN6ZFfFeX0SdUwp4v21bjYZLTeucfKUhzsTi90gNsCRU0UXPV6MiV5FsIpSE2dRzzA8UmWrYugciDBaEMgsIX39WFEjLgwU3Bn4uowTC5Xrj+RozcoByEqe6KKFAUCd22HVogvF2MGN8ZI7/+CXx9l5yX/bMORlZhe0sR9p1oBQL+/sfOJ0/ndIQV8Y2gLaUeP/pf5k4CVMlbk6seAgDA+a8qv0/8nBCKIftjlU85kLJKVFLrqoSpOEfOPS54d+h4IP4zd3JdKBUCgIK6X4O/hJOIMNGuBW04JAGuVpLagRgFhGYLcZ5eDv/Iu4YZs0XlsOuMcEprVVA21/DEWE/7e7WgG07R6y+OtWoDBq/9kht/5VFbqzQWUfK46s8LaJBN4Es5rY29JYcK1KI+CER0Q197xEP9zzeMoUZ0GJDk7sM3X8SljYe/yDH/8VAlmmcoxvQYWk8cZHZZo5jyar723l9/wezQpEqGH48hI63a89RxziXpWYf56WBj//0M
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(6512007)(5660300002)(6486002)(83380400001)(316002)(54906003)(8676002)(2616005)(8936002)(6862004)(356005)(81166007)(6506007)(53546011)(4326008)(508600001)(47076005)(70586007)(70206006)(82310400003)(36756003)(26005)(966005)(336012)(86362001)(36860700001)(186003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:10:17.8914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7214729-1c00-48bd-6e35-08d99ed3aa1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4859
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FE73C363E734E4382701E061E6ADE7D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 3 Nov 2021, at 14:08, Bruce Ashfield via lists.yoctoproject.org <bruce=
.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
>=20
>=20
> On Wed, Nov 3, 2021 at 8:11 AM Bertrand Marquis <Bertrand.Marquis@arm.com=
> wrote:
> Hi Bruce,
>=20
> > On 26 Oct 2021, at 22:27, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
> >=20
> >=20
> >=20
> >=20
> > On Tue, Oct 26, 2021 at 9:27 AM Edward Pickup <Edward.Pickup@arm.com> w=
rote:
> > Hi Bruce,=20
> > Sorry for the formatting issues, email client config issues
> >=20
> > =20
> >=20
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>=20
> > Sent: 26 October 2021 14:22
> > To: Edward Pickup <Edward.Pickup@arm.com>
> > Cc: meta-virtualization@lists.yoctoproject.org; Bertrand Marquis <Bertr=
and.Marquis@arm.com>; christopher.w.clark@gmail.com; nd <nd@arm.com>
> > Subject: Re: [meta-virtualization] Error building Xen device tree for q=
emuarm64
> >=20
> > =20
> >=20
> > =20
> >=20
> > =20
> >=20
> > On Tue, Oct 26, 2021 at 8:58 AM Edward Pickup <edward.pickup@arm.com> w=
rote:
> >=20
> > Hi all,
> >=20
> > I have encountered an error while building the arm64 version of the xen=
 4.16 recipe in meta-virtualisation, using the master version of poky and m=
eta-virtuaisation.
> > I was wondering if anyone was familiar with the issue or knew how to fi=
x it. The error is as follows:
> >=20
> > ERROR: xen-image-minimal-1.0-r0 do_write_xen_qemuboot_dtb: ExecutionErr=
or('/home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-re=
lease.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/run.d=
o_write_xen_qemuboot_dtb.3679135', 2, None, None)
> > ERROR: Logfile of failure stored in: /home/edwpic01/work/master-update-=
xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linu=
x/xen-image-minimal/1.0-r0/temp/log.do_write_xen_qemuboot_dtb.3679135 .
> >=20
> > I believe the relevant part of the log is as follows:
> >=20
> > | [NOTE]: '3' lopper operation files will be processed
> > | [INFO]: dtb output format detected, writing /home/edwpic01/work/maste=
r-update-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-=
poky-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete=
/xen-image-minimal-qemuarm64-20211026121502.qemuboot.dtb
> > | [INFO]: writing output dtb: /home/edwpic01/work/master-update-xen/bui=
ld/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-i=
mage-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-minim=
al-qemuarm64-20211026121502.qemuboot.dtb
> > | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-=
release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-imag=
e-minimal-1.0/output.dts: ERROR (explicit_phandles): /apb-pclk:phandle: bad=
 length (1) phandle property
> > | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-=
release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-imag=
e-minimal-1.0/output.dts: ERROR (explicit_phandles): /intc@8000000:phandle:=
 bad length (1) phandle property
> > | /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-=
release.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-imag=
e-minimal-1.0/output.dts: ERROR (explicit_phandles): /pl061@9030000:phandle=
: bad length (1) phandle property
> > | ERROR: Input tree has errors, aborting (use -f to force output)
> > | WARNING: exit code 2 from a shell command.
> >=20
> > The above error was the result from building on x86_64-linux, target sy=
stem was aarch64-poky-linux, running on a qemuarch64 machine, itself runnin=
g on x86_64 linux.
> > As mentioned this was done on the master version of meta-virtualisation=
.
> > The bitbake command to generate this was bitbake xen-image-mininal.
> > The error is also present when building the xen 4.14 and xen 4.15 arm64=
 versions, and is not present on the arm32 or x86 builds for xen.
> > If anyone knows the cause of the error, the information would be apprec=
iated.
> >=20
> > =20
> >=20
> > There's something wrong with the input DTS to Lopper .. luckily, I main=
tain Lopper, so if there's an actual bug in the processing of the input DTS=
 .. I can fix that.
> >=20
> > =20
> >=20
> > I can fire up a build and see if it happens here.
>=20
>=20
> Could this be also considered for honister branch ?
>=20
>=20
> Normally I might not bring back version bumps like these, but since most =
of the heavy Xen users are asking for the change .. I've gone ahead and pul=
led it back.

Thanks a lot.

>=20
> Note: I've left ARM64 broken on master, due to the libfdt issue, since th=
at still requires more effort.

Yes I think this is ok for now.
If you push any fix do not hesitate to ping us to validate them.

Cheers
Bertrand

>=20
> Bruce
>=20
> =20
>=20
> Regards
> Bertrand
>=20
> >=20
> > =20
> >=20
> > So this is just qemuarm64, with xen + virtualization in the distro feat=
ures ? Any other layers ? Anything else ?
> >=20
> > =20
> >=20
> > Bruce
> >=20
> > Yes, this is just as you say, no other layers or anything else. Thank y=
ou for the speedy reply!
> >=20
> >=20
> > There's a really bad interaction between libfdt and python 3.10.=20
> >=20
> > I've traced the error down to libfdt not being able to read anything fr=
om the dtbs and hence the chained errors.
> >=20
> > I'm building some older branches to confirm behaviours .. it will take =
me a few days to sort through this, but I don't want to mask the issue, as =
I need to understand exactly what is going on here.
> >=20
> > Bruce
> >=20
> > =20
> > =20
> >=20
> > Edward
> >=20
> > =20
> >=20
> >=20
> > Cheers!
> >=20
> >=20
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
> >=20
> >=20
> >=20
> >=20
> >=20
> > =20
> >=20
> > --=20
> >=20
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >=20
> > IMPORTANT NOTICE: The contents of this email and any attachments are co=
nfidential and may also be privileged. If you are not the intended recipien=
t, please notify the sender immediately and do not disclose the contents to=
 any other person, use it for any purpose, or store or copy the information=
 in any medium. Thank you.
> >=20
> >=20
> > --=20
> > - Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
>=20
>=20

