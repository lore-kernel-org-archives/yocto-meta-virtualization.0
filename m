Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.82])
 by mx.groups.io with SMTP id smtpd.web11.7372.1618310985218829801
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 03:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ElqC43Pd;
 spf=pass (domain: arm.com, ip: 40.107.2.82, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26zHsUMD6qHxnXYT+s9hC1hBx0oMSY4JIt8LWsJm5XI=;
 b=ElqC43Pd/38MRE/+liinkNi6OXRMBBxIFAU/OwKT4T8EVuYz76XiPP1IqYtEQGwfks3j4kqO8DqFkrdVUsI86iozctuzO0lJfT1/JgNzLgmdenV2063Y1eftZCDSyyT2o9IwwL8Spt4x9dySHcPOSehHXm+SVpO88nuwyZ7t0Kg=
Received: from AM5P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::29)
 by AM0PR08MB5010.eurprd08.prod.outlook.com (2603:10a6:208:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Tue, 13 Apr
 2021 10:49:42 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::ee) by AM5P194CA0019.outlook.office365.com
 (2603:10a6:203:8f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Tue, 13 Apr 2021 10:49:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Tue, 13 Apr 2021 10:49:41 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90"); Tue, 13 Apr 2021 10:49:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70d1d2214a1b2e4e
X-CR-MTA-TID: 64aa7808
Received: from 27701db69b64.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A83E5FE5-050F-4AE2-AB7D-F4B99DEA9C4E.1;
	Tue, 13 Apr 2021 10:49:33 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27701db69b64.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Apr 2021 10:49:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvTgSFEv07fG/slgL50WZcvAnTTIiyD9d/MMLpenUfnkjcfk/np7Aja5bSYdrAgLQtqmLJvsxqftnlFWt9axrCPEo4pfmYMVYRIal0QDXF94XvhBM0/FFDA3ixFqmobF+jPKoq6d6poZXnhasGWUYlgmswtueeXU3nO6e7rvIAkdNbdvqOG1CinFH82naTP5hafnxomD5jWDqUhIC7cKX5XvioaPDPmIezS99QeWZ/VEeuJLEyGNVQaAafHwDO/+XPbQ533pgS5lviEfqLhmxw4IF32Ny3AiL1Ye/r3ljmF5r9gJb9IoWNbky6MjXwHgjKXW8xIS9NxK0vcLrxs3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26zHsUMD6qHxnXYT+s9hC1hBx0oMSY4JIt8LWsJm5XI=;
 b=BWdFO85pcFKmqwUnSZFwMPNiRdDSJjE8TkV52CE2V1RYsDLm5dMPUr3pD1nMVgO4pN0kjnb6FzoqX/9XDCwe9Up7Vk3azZifN2f8gF6pxlw76RX7VIKXq31oC17dGbNsBd6yMebxBPPBXgvl47G9CkkQf6/59Drx2GVHviVQDLMPjcsU4tlNE2fTDaGNgFJd5e3jjNMy9oc5ngNBTYNKHEgcIoQkrkjLwQUDy0LIRHAzm6+W18F+7TmRSdQ/JdIK7nThe8f1Pkn7O0fZgQvpamqF7MwcxDLaANVgovsExb8SqjjPJJX4ExsA+7F3piuebxoS1aauRILBVMiNxXyy1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26zHsUMD6qHxnXYT+s9hC1hBx0oMSY4JIt8LWsJm5XI=;
 b=ElqC43Pd/38MRE/+liinkNi6OXRMBBxIFAU/OwKT4T8EVuYz76XiPP1IqYtEQGwfks3j4kqO8DqFkrdVUsI86iozctuzO0lJfT1/JgNzLgmdenV2063Y1eftZCDSyyT2o9IwwL8Spt4x9dySHcPOSehHXm+SVpO88nuwyZ7t0Kg=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3518.eurprd08.prod.outlook.com (2603:10a6:803:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Tue, 13 Apr
 2021 10:49:31 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 10:49:31 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "cardoe@gentoo.org"
	<cardoe@gentoo.org>, "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] xtf: introduce recipe for the Xen Test Framework
Thread-Topic: [meta-virtualization][PATCH 1/2] xtf: introduce recipe for the
 Xen Test Framework
Thread-Index: AQHXMDBrrli+QzeC3k+fzE8ZKH7ojKqyRPyA
Date: Tue, 13 Apr 2021 10:49:31 +0000
Message-ID: <1CF6B9F4-A91B-439F-8B97-5C00876FC844@arm.com>
References: <20210413064332.42502-1-christopher.w.clark@gmail.com>
In-Reply-To: <20210413064332.42502-1-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [81.2.158.118]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e3249890-b8de-4cab-eb4f-08d8fe69d79f
x-ms-traffictypediagnostic: VI1PR08MB3518:|AM0PR08MB5010:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB5010AC55BBACC74271CFDCD59D4F9@AM0PR08MB5010.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 MJnEg7OMvmGSSfjOT9T6t3Di3Js1omiyTX+GzhnNraNYYVowy1x8hkreho8FWCZQPkcNPq76l+sgIjB0b7d5ZFFAAmTkf37KiQzgoXlPLsDChqd10khR9QHGGF+VtJDdWbPYimkT+j/SZ0gJPywh8Tuhn5ELB1qdUTvrgRESzTBAPtWnt0ZTn4rnprqJrk7m2PANh4+U7raSQy8BE0EaVMSXgq1+yqOB/hjfQmJr17TbLS4AzPuxmiiqWow7/rny4mjpHJXe5LzMda/2J5YJMG5Gnj6NdfkLdK4JI/Do//5m3D4Ho/0utevE5Jzzms9xhRpS6ztJJChreYTkcqrbgrTaw41rLPLCkZIYMCc2dxjU6KsPMIYeCuuBxLeYKuJA7RPj6AjD8qzFBxL58jLjkqRcHNIMY7tIdD3c6vvzVbWmArb98axOcjnlmNKQMVNnJzYWwKVnDAG8atlo+gVIiT2yHRCkvfjS2rVE8G+8TzNdgjcTs6uLc5Nl5vxmf9NKp+gvAyB4EJRjWWa2rnXFcctyNo+BO2t2pUkNTv0BJ/VCQrVXhoNexpmLPyEigu5Tq2beoCZ/ksORXIGrs4dVsrZIIbvInw09EVGCg1RbHiKEds3CAdP9Ry/0eTf8ORxNDvkhkyr61aPWSJapVLEEL9L18l15r5q7clGrRyVLH3zJs57iCW4jSfFO12SktnuP0qlbwKbhV/anv5TN+0viJSIUPPQYLSX/qfIGRdGD6yw=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(36756003)(8936002)(71200400001)(478600001)(86362001)(186003)(83380400001)(6506007)(8676002)(66556008)(26005)(4326008)(6512007)(76116006)(5660300002)(33656002)(66446008)(64756008)(53546011)(2616005)(38100700002)(2906002)(66946007)(6916009)(66476007)(54906003)(91956017)(966005)(122000001)(6486002)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?PyewvUIOgl6gCvQaGDvNX+vqWgru4/83r1ZabAxRtTAIT2HiFhomvoqykZLI?=
 =?us-ascii?Q?nWPXR33YKGQIpOgOVfUGs9AZMYcVsY9owX5IOsxThdkh+LENGV3TMgi7RV92?=
 =?us-ascii?Q?JEUcKhqzKF5KAwsbjdIuGjd9fDcM1mJC83k0nPLlKkfDUL5bAtp7hYWkUyx/?=
 =?us-ascii?Q?Nos1LFK19n0NNNnUmdMMxz57/Pjqxpqt8FFrA4jud70stVXcQGfDxuhgDNFw?=
 =?us-ascii?Q?Clg4uJovfgmvQVsuZ/gwHS496nWvFiSrBASZ5H+7Mh3kyrfiDJa9V+Bx7ZNS?=
 =?us-ascii?Q?DTA7JuZV36/W4wiorw43NJ/pDGbRUzL82xx1C3FsLXPAZjhrH23nRrKz6n00?=
 =?us-ascii?Q?ENzj7A7pQ6Mg73MLKd2SytsKt3uj+sK7CcUcEei3mVV8dE1CTbXvnLIjkQoH?=
 =?us-ascii?Q?D0poBra4kuti3JbVMbRucZIjiy9eHxxeIBfsYlYBen1TcrlVys/Os8H5s7lf?=
 =?us-ascii?Q?XNy1ud/JVSyAdY9UQYikktEl33W3rsssA95GZFWfWc901USTFMVysyWGHHj6?=
 =?us-ascii?Q?MIOurbWA4ePRwt+UvmVEh8iP4B/fp0nED41gl7Y6UCEV0j9bnWU8onpuA0K3?=
 =?us-ascii?Q?EoQyamjBecELJr3FHYhc7VPgR2mEHPxRw1phLH74FY8ctsqBddEsbfjHHWwI?=
 =?us-ascii?Q?0lRVqFP/C0OXNqyoDE8n2UwJlJRXxu+xbpj9d8bcDAn91xRuPY8Z79sq0TBL?=
 =?us-ascii?Q?xLS+X2tL6FI9xrzZ6XbRYHKj7c0jWgJ/dbLhYC1BJDAGyzpa6tyw0ZJEbdQd?=
 =?us-ascii?Q?59dClbUEcZPxZsnEIASWjvya8bdUIVXVWY1p8b8L8Q2hMDL9z0kZVE+g5LDI?=
 =?us-ascii?Q?bVZ/tWGo0Trb8F91RYnXg4WuRY6mv031sOVP2+51EERtBMBL9wbBZ7ulZxbi?=
 =?us-ascii?Q?djLUpmWAYcN2gw6mdMTTWOivqe2HTSmEsivNjPKd452CaF88VIUdeNuTkDMU?=
 =?us-ascii?Q?Fzn95NwwZaUcWgGWt+8qeGUacGO2iJbGRKsafE/qHMxUFc7ER0L1AwS6yDPw?=
 =?us-ascii?Q?XUs3xScz0AOI83sBZxchavBM072TOgukBkRStvUoxwZ9IxYCy80NQLhpJF43?=
 =?us-ascii?Q?cmOu4Jkci5jyYGdpDGlGDnSOwxTZUZgdceVIMNvIEK6uujjL33Oq1ELzbu6o?=
 =?us-ascii?Q?G68nBnas1Y1tHKcXpSvl1kLL7A1Zk1hT9SQqLXEaK5OC4BVtmkgtQ+Nc9RXX?=
 =?us-ascii?Q?DKSoAcFDLZ2VWXm1q2JkRRimi6Aa/6p+9I6gMO6A7TQ2/CoC8+PaPEPSKQbc?=
 =?us-ascii?Q?VW2vJsU4E82hy+MXd/cBgp7OaCKTQvFDwTtOhrRZrhrHuVWIZyTuieSc4e6E?=
 =?us-ascii?Q?qyfaofOwcRoQ1GIKPcWlYecb?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3518
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8a25c3bb-a6e2-40b3-25d9-08d8fe69d1e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0HOQvLKS5ZQcdNu945m/u02b2AhpwUAvZuRNjWRafo1d+u1kaimaSmYmGqvvkAtDlYph/rcNu2yIttrSgT6v3u2kuq0KjcmTeWOoj1i8f83sXVfIU+OFJWnqdrNOjjY/DXbgvbc9TlR3T9Q66iwp0P77NimkdOdlodPNaOPN9lzJ5+xUxgf7nF/zUIWyWiYYomK6CvPF0gNQxTVv+ksOW3FyVhNfHaDrf7e09Mx0gnxOOocB66lcdcdC+LKFnZp9i6WEBye9BSgA8Zr6fOwtqbAbjtZDWqrrXrpQPKy103se+WJ2qJe/zcL+X5rfpfWt2wks4zV+LCwLa5Ojx6D7ou+sJn9nT3aNZ51kiTO/vVHdcav0RO8/fao5f1HZQLfg/kZAtyaUZ5ugApsuA+C0xY5fAf+57iAy/0QnMUDaq4igzcw33rh851U33+FZL+0ABu4avBV5u0r10D1otJAPVRMlmIMPHiudvbq51WWoDPhhxcmBpj8K7g/yya4B/fQLT9NZ0Bi32MOFgp8n+u1fUhNSOc4p4pTc+sMZ20HCDQahPIG3wPh6hZmjPl/U+/CEUzaPsLAim6RVVbtHC1hqLA8dYBTxW78RnPXhzs1algZH919Uum+Jq4ZfcSN5qjLDIps+FcLKEO67hsASEybTWq0NvbWeLJgdVoRsiFH04khHBtI3i0lX5DSdDPVF/BnseZTv0/UkuYSQuV2pCmXEVG2yrlU2PgxBdgr5Y9YjUR4=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966006)(36840700001)(107886003)(2616005)(336012)(36756003)(81166007)(86362001)(6486002)(6512007)(26005)(70586007)(83380400001)(8936002)(36860700001)(5660300002)(82310400003)(2906002)(33656002)(8676002)(4326008)(478600001)(966005)(6506007)(186003)(356005)(316002)(54906003)(47076005)(82740400003)(6862004)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 10:49:41.3751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3249890-b8de-4cab-eb4f-08d8fe69d79f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5010
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9B53BEBD0ABC7B4FA8DD7AA3EC2C1681@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

> On 13 Apr 2021, at 07:43, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>

Very nice feature, we are working on adding support for arm on XTF and thi=
s will be really usefull.

On my test I have some errors during the packing of XTF:

ERROR: xtf-0+gitAUTOINC+8ab1513972-r0 do_package_write_rpm: Error executin=
g a python function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure wa=
s:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_package_rpm(d)
     0003:
File: '/home/bermar01/Development/xen-dev/yocto-master/poky/meta/classes/p=
ackage_rpm.bbclass', lineno: 718, function: do_package_rpm
     0714:
     0715:    # Build the rpm package!
     0716:    d.setVar('BUILDSPEC', cmd + "\n" + cleanupcmd + "\n")
     0717:    d.setVarFlag('BUILDSPEC', 'func', '1')
 *** 0718:    bb.build.exec_func('BUILDSPEC', d)
     0719:
     0720:    if d.getVar('RPM_SIGN_PACKAGES') =3D=3D '1':
     0721:        bb.build.exec_func("sign_rpm", d)
     0722:}
File: '/home/bermar01/Development/xen-dev/yocto-master/poky/bitbake/lib/bb=
/build.py', lineno: 256, function: exec_func
     0252:    with bb.utils.fileslocked(lockfiles):
     0253:        if ispython:
     0254:            exec_func_python(func, d, runfile, cwd=3Dadir)
     0255:        else:
 *** 0256:            exec_func_shell(func, d, runfile, cwd=3Dadir)
     0257:
     0258:    try:
     0259:        curcwd =3D os.getcwd()
     0260:    except:
File: '/home/bermar01/Development/xen-dev/yocto-master/poky/bitbake/lib/bb=
/build.py', lineno: 503, function: exec_func_shell
     0499:    with open(fifopath, 'r+b', buffering=3D0) as fifo:
     0500:        try:
     0501:            bb.debug(2, "Executing shell function %s" % func)
     0502:            with open(os.devnull, 'r+') as stdin, logfile:
 *** 0503:                bb.process.run(cmd, shell=3DFalse, stdin=3Dstdin=
, log=3Dlogfile, extrafiles=3D[(fifo,readfifo)])
     0504:        except bb.process.ExecutionError as exe:
     0505:            # Find the backtrace that the shell trap generated
     0506:            backtrace_marker_regex =3D re.compile(r"WARNING: Bac=
ktrace \(BB generated script\)")
     0507:            stdout_lines =3D (exe.stdout or "").split("\n")
File: '/home/bermar01/Development/xen-dev/yocto-master/poky/bitbake/lib/bb=
/process.py', lineno: 184, function: run
     0180:        if not stderr is None:
     0181:            stderr =3D stderr.decode("utf-8")
     0182:
     0183:    if pipe.returncode !=3D 0:
 *** 0184:        raise ExecutionError(cmd, pipe.returncode, stdout, stder=
r)
     0185:    return stdout, stderr
Exception: bb.process.ExecutionError: Execution of '/home/bermar01/Develop=
ment/xen-dev/build-master/metavirt-host-x86_64-4.14-release.prj/tmp/work/co=
re2-64-poky-linux/xtf/0+gitAUTOINC+8ab1513972-r0/temp/run.BUILDSPEC.25424' =
failed with exit code 1:

Processing files: xtf-0+git0+8ab1513972-r0.core2_64
error: Recognition of file "/home/bermar01/Development/xen-dev/build-maste=
r/metavirt-host-x86_64-4.14-release.prj/tmp/work/core2-64-poky-linux/xtf/0+=
gitAUTOINC+8ab1513972-r0/package/usr/libexec/xtf/tests/xsa-170/test-hvm64-x=
sa-170" failed: mode 100755 Bad magic format `, bad note description size %=
#lx' (bad format char: #)
error: Recognition of file "/home/bermar01/Development/xen-dev/build-maste=
r/metavirt-host-x86_64-4.14-release.prj/tmp/work/core2-64-poky-linux/xtf/0+=
gitAUTOINC+8ab1513972-r0/package/usr/libexec/xtf/tests/fpu-exception-emulat=
ion/test-hvm64-fpu-exception-emulation" failed: mode 100755 Bad magic forma=
t `, bad note description size %#lx' (bad format char: #)
error: Recognition of file "/home/bermar01/Development/xen-dev/build-maste=
r/metavirt-host-x86_64-4.14-release.prj/tmp/work/core2-64-poky-linux/xtf/0+=
gitAUTOINC+8ab1513972-r0/package/usr/libexec/xtf/tests/xsa-269/test-hvm64-x=
sa-269" failed: mode 100755 Bad magic format `, bad note description size %=
#lx' (bad format char: #)
error: Recognition of file "/home/bermar01/Development/xen-dev/build-maste=
r/metavirt-host-x86_64-4.14-release.prj/tmp/work/core2-64-poky-linux/xtf/0+=
gitAUTOINC+8ab1513972-r0/package/usr/libexec/xtf/tests/xsa-188/test-hvm64-x=
sa-188" failed: mode 100755 Bad magic format `, bad note description size %=
#lx' (bad format char: #)
error: Recognition of file "/home/bermar01/Development/xen-dev/build-maste=
r/metavirt-host-x86_64-4.14-release.prj/tmp/work/core2-64-poky-linux/xtf/0+=
gitAUTOINC+8ab1513972-r0/package/usr/libexec/xtf/tests/xsa-221/test-hvm64-x=
sa-221" failed: mode 100755 Bad magic format `, bad note description size %=
#lx' (bad format char: #)

I cannot really confirm where this is coming from and it can really be tha=
t this is a consequence of something changed in poky or oe.

Cheers
Bertrand

> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
> recipes-extended/xen/xtf_git.bb | 61 +++++++++++++++++++++++++++++++++
> 1 file changed, 61 insertions(+)
> create mode 100644 recipes-extended/xen/xtf_git.bb
>
> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_=
git.bb
> new file mode 100644
> index 0000000..6dc0f8d
> --- /dev/null
> +++ b/recipes-extended/xen/xtf_git.bb
> @@ -0,0 +1,61 @@
> +SUMMARY =3D "Xen Test Framework"
> +HOMEPAGE =3D "https://xenbits.xenproject.org/docs/xtf/"
> +LICENSE =3D "BSD-2-Clause"
> +
> +SRC_URI =3D "git://xenbits.xen.org/xtf"
> +SRCREV =3D "8ab15139728a8efd3ebbb60beb16a958a6a93fa1"
> +
> +COMPATIBLE_HOST =3D '(x86_64.*).*-linux'
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da5680865974e05cf0510615ee1d7=
45d8"
> +
> +PV =3D "0+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit python3native
> +
> +# To build 32-bit binaries some files from 32-bit glibc are needed.
> +# To enable multilib, please add the following to your local.conf -:
> +#
> +#    require conf/multilib.conf
> +#    MULTILIBS =3D "multilib:lib32"
> +#    DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
> +
> +# Use this multilib prefix for x86 32-bit to match local.conf:
> +MLPREFIX32 =3D "lib32-"
> +# Add the multilib 32-bit glibc to DEPENDS only when necessary:
> +# The DEPENDS on a multilib 32-bit glibc is only added when target is x=
86-64
> +# This x86-64 override is never intended for native use, so clear that.
> +GLIBC32 =3D ""
> +GLIBC32_x86-64 =3D "${MLPREFIX32}glibc"
> +GLIBC32_class-native =3D ""
> +DEPENDS +=3D "${GLIBC32}"
> +
> +PACKAGES =3D "${PN}"
> +
> +FILES_${PN} =3D " \
> +    ${libexecdir}/* \
> +    "
> +
> +RDEPENDS_${PN} =3D " \
> +    xen-tools-xl \
> +    python3 \
> +    "
> +
> +do_compile() {
> +    oe_runmake CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} -I${RECIP=
E_SYSROOT}/../${MLPREFIX32}recipe-sysroot/usr/include" \
> +               CPP=3D"${CPP}" \
> +               OBJCOPY=3D"${OBJCOPY}" \
> +               PYTHON=3D"${PYTHON}"
> +    # switch the shebang to python3
> +    sed 's,^\(#!/usr/bin/env python\)$,\13,' -i "${B}/xtf-runner"
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D"${D}" xtfdir=3D"${libexecdir}/${BPN}"=
 PYTHON=3D"${PYTHON}"
> +}
> +
> +INSANE_SKIP =3D "arch"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> --
> 2.25.1
>
>
>=20
>

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
