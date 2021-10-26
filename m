Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web09.11591.1635253082273055861
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 05:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=BmEu5EKM;
 spf=pass (domain: arm.com, ip: 40.107.22.64, mailfrom: edward.pickup@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=751gQGoSTykTp2vZqd+AmIz7pQW77pj2aKvLz69WVuI=;
 b=BmEu5EKMZmrAfyq6dTLaKU3XnkpGevkiuI5ZFK21Rp24BekpT/WWXD+5VIWC/Nzm26R+zEN3123oNTO7yTbh29rIAwGgech6azsvZHqX4eJWIHpcuS8v6Cp5gOiUjz4P895taLFfdMPv7K4FKdfzUrwBFyWRYxTI6oc9hrX65pQ=
Received: from AS9PR06CA0314.eurprd06.prod.outlook.com (2603:10a6:20b:45b::16)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 12:57:58 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::f) by AS9PR06CA0314.outlook.office365.com
 (2603:10a6:20b:45b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 12:57:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 12:57:58 +0000
Received: ("Tessian outbound e27daf245730:v103"); Tue, 26 Oct 2021 12:57:57 +0000
X-CR-MTA-TID: 64aa7808
Received: from 1052dc116b10.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9CF71FB1-192C-4251-8318-E91FD6A5E5DE.1;
	Tue, 26 Oct 2021 12:57:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1052dc116b10.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 26 Oct 2021 12:57:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ew8gQ4Agl/bEzgcs4jcjfMz/2eutWOi93DNAJVTfnVCyfRorr3ioNoyUM6OEl6VKkKEByDEVw+6AbW7T4w//kN8R+nHN/qbShyDbi3CIiVSoNDrzUlC+QQzHH/HydrqNM6caTsWDUN0OKpX4yjVH/EJQ+OP1q5jp5jCB5DV9so3sYuaxNfoOVgb+a2TQw4FnGnf9wK4Z6I3Hh1/uQ3jMfiGdJE3Sr/U3EaU1FqDLr0MEGYcKC8WlDIB07NkJ6eTEhAEA2qYBdDYW4O6uNQu36NYEflFwZgSSCf8ncTlZGUocMlpInKRAvXIHccXFitAsvh8YoxqzyLfFwIPZ3aMgVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=751gQGoSTykTp2vZqd+AmIz7pQW77pj2aKvLz69WVuI=;
 b=fGdqtMT6FFELvUPOqurBeu64mrxHNvLJf5tIZromadIG2U5tZ5eq5q53q0A60PEovTqhsnoIUZmxBry9xjEO8Z6KlmCOSrZLg+dA7yIXtnll1tQes5NJB2fHhMjdriUt3KDOaoHFp6FP3kWPnNKFilbOfs3yjwPhBD8QEvc9NVTgh0afZ/40bWedJ86ajZmmynRnpkeooO5ZJpDn7K0W3eEm8Q+5dFSELqg6ajqSfAJYNR83IKaXmqH2pS0okkJ1BKwZKMqYW+vq9hZ+04QzkhvfNQVxShMx59fGSajxPVPb+gRbESoI71x3I+VBSdUS2ebWUi+vURtmOxmjUsVLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=751gQGoSTykTp2vZqd+AmIz7pQW77pj2aKvLz69WVuI=;
 b=BmEu5EKMZmrAfyq6dTLaKU3XnkpGevkiuI5ZFK21Rp24BekpT/WWXD+5VIWC/Nzm26R+zEN3123oNTO7yTbh29rIAwGgech6azsvZHqX4eJWIHpcuS8v6Cp5gOiUjz4P895taLFfdMPv7K4FKdfzUrwBFyWRYxTI6oc9hrX65pQ=
Received: from AM6PR08MB4086.eurprd08.prod.outlook.com (2603:10a6:20b:a8::32)
 by AM5PR0802MB2388.eurprd08.prod.outlook.com (2603:10a6:203:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 26 Oct
 2021 12:57:45 +0000
Received: from AM6PR08MB4086.eurprd08.prod.outlook.com
 ([fe80::f9e7:cf27:abd8:44d1]) by AM6PR08MB4086.eurprd08.prod.outlook.com
 ([fe80::f9e7:cf27:abd8:44d1%6]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 12:57:45 +0000
From: edward.pickup@arm.com
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>, nd
	<nd@arm.com>
Subject: Error building Xen device tree for qemuarm64
Thread-Topic: Error building Xen device tree for qemuarm64
Thread-Index: AdfKaNrlOvyQzYIUQaGokIBx1i2kqg==
Date: Tue, 26 Oct 2021 12:57:44 +0000
Message-ID: 
 <AM6PR08MB4086AA6D776124ABB5125CE8F0849@AM6PR08MB4086.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: D3A690CF2F5B3D4197AF458EDE1A82CB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3629ba6e-1ffc-4071-a242-08d998803c1d
x-ms-traffictypediagnostic: AM5PR0802MB2388:|AM8PR08MB5698:
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB5698886077C7D15D8C9357ACF0849@AM8PR08MB5698.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6ohUfB/vCO/PTx+H4GSehzW155dJG8u79Mk4/yp536T89nFwVxfSmwLR54TTH4fn6WaLx/PChv9JXQ0wbxHS8ozm4HaWt1x7IpU2aSOwWKyclA/1O+yleMVrxgqffa3J4E5MR0BGXzFPUsT8BruxbozmnYY12U+w2cYp3TCwO9F0Q6BlcYnN8rXM/ZKEYCuQdNnz7svZ+5HirIVqvSHhhP84oGCHhdD1UhGVhVsH57jt/MUbCJ9aqp8NslUzQ74mDeaeZQVGWpDEo6gXiT0IO8a5zyqCiuSsjeA+lnRrAUDFEkxLMA8iCsIoZvW4z7N1QPytEI8vP6tVr2XPAHxd885EMxfhI60QG3ioxoJV29v4RmOfFuoiF7QVodT9P9fSy4RbNAfPjQVQV7aPp6/esHuHHHqddr2o47ymODIfKYwQ1vUfN89ZyyLJgWAbrZlu4KOVj3Kdo7uk1OMoORe6IPOddnrxlHM0eXD/s0IElyuTsx8s6Ve5ddStEHSkmjBdg9a10fBs1xQgs6dQr1mG2at4B0rWIfhFHuiM+lssu4gMG5cj4EVp6jY6H3280LPJvZc6TIF8nFQiIdS0Q0Thy1+FHGggDmbJUlYmVe/CgsKi1ScUzCBkZjuKUbzdEeTTex1cQ4k3TVAZAfUi5SjTF/T39UG8n7wB8ijtJrItfCtCU7Yv7IiYshbI2fwBiySDmUPZkZtTzun4FnP6NrM8YQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4086.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(5660300002)(6916009)(38070700005)(8936002)(4326008)(26005)(66446008)(66476007)(64756008)(6506007)(7696005)(122000001)(38100700002)(66946007)(186003)(86362001)(71200400001)(55016002)(33656002)(508600001)(9686003)(2906002)(54906003)(66556008)(52536014)(8676002)(83380400001)(316002);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2388
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Edward.Pickup@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3b39accd-7638-4488-e620-08d998803464
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7/QnGi8W/B4S8o3GLTTEsmjR8FjdkytkfuJcCEutbeqaNxxyqur9i0+LEQGnZo61xQ2VbJ/7NWGtVwyONK7/E3VRjRbotQ5/3RzVVc7aRlCzUNlhgRGo6cNiheF90g8FgX3fUV0GxwTy04ylea8TlbBACNIlLMLl1ERF4Ggw7/g7YeXqwJGk5c2dslI0eIIgnlzzqOJ+UpAJmvxf/NXkjwwhv0IaPZxEhjamlCTsW7ptjWmQYP2hCCeiqq7EhDO9Q1RXr+krr+d3NN+uvoTJ54jhmCcGY35M9kwwXc6zjzVrUOueVbY1DttlMbsbZNEK4WxUBSSNG9HZAK5qeHFF50HH5NF8RHTau4kx4J5RsRO9vtxU12QxS6vS/g3j6lSiVoqyhIJdifHIVDoZxJGdCT2mpVey9FlPlTUrAYYsaQtKij9Iz6+MpNxw5HpU8YZNPjQnMRhvNbo9Xpeyu8PsJuoBBwz54Y0IXzRT04uDmRVZ84eQMS3auiVI6oiSR81arUsz7T5ee1lBgTWotyLG4zLoaBSmCzPRDThEzQUXIkXqHP1Nh8L5eJV5QjmqDropV9D95rmX52RRFA95Ivgk8KUglMyLZlwnWJybS34a19CbCJTTjHkHOozZuL/bmm9PIKzyUM5IoONrBjVaHj/DKoDvKNvfVjz0gTOFJgfkiRXd9QYISyVb+nHhhrAAfSF5qOje3Qy/Ki5EY9zlp2Cq7g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(81166007)(7696005)(26005)(316002)(70586007)(508600001)(2906002)(336012)(70206006)(4326008)(83380400001)(9686003)(36860700001)(8936002)(55016002)(5660300002)(8676002)(52536014)(186003)(356005)(86362001)(47076005)(33656002)(6916009)(54906003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 12:57:58.0387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3629ba6e-1ffc-4071-a242-08d998803c1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have encountered an error while building the arm64 version of the xen 4.1=
6 recipe in meta-virtualisation, using the master version of poky and meta-=
virtuaisation.
I was wondering if anyone was familiar with the issue or knew how to fix it=
. The error is as follows:

ERROR: xen-image-minimal-1.0-r0 do_write_xen_qemuboot_dtb: ExecutionError('=
/home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-releas=
e.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/temp/run.do_wr=
ite_xen_qemuboot_dtb.3679135', 2, None, None)
ERROR: Logfile of failure stored in: /home/edwpic01/work/master-update-xen/=
build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xe=
n-image-minimal/1.0-r0/temp/log.do_write_xen_qemuboot_dtb.3679135 .

I believe the relevant part of the log is as follows:

| [NOTE]: '3' lopper operation files will be processed
| [INFO]: dtb output format detected, writing /home/edwpic01/work/master-up=
date-xen/build/metavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky=
-linux/xen-image-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen=
-image-minimal-qemuarm64-20211026121502.qemuboot.dtb
| [INFO]: writing output dtb: /home/edwpic01/work/master-update-xen/build/m=
etavirt-host-arm64-4.16-release.prj/tmp/work/qemuarm64-poky-linux/xen-image=
-minimal/1.0-r0/deploy-xen-image-minimal-image-complete/xen-image-minimal-q=
emuarm64-20211026121502.qemuboot.dtb
| /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-rele=
ase.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-mi=
nimal-1.0/output.dts: ERROR (explicit_phandles): /apb-pclk:phandle: bad len=
gth (1) phandle property
| /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-rele=
ase.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-mi=
nimal-1.0/output.dts: ERROR (explicit_phandles): /intc@8000000:phandle: bad=
 length (1) phandle property
| /home/edwpic01/work/master-update-xen/build/metavirt-host-arm64-4.16-rele=
ase.prj/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0-r0/xen-image-mi=
nimal-1.0/output.dts: ERROR (explicit_phandles): /pl061@9030000:phandle: ba=
d length (1) phandle property
| ERROR: Input tree has errors, aborting (use -f to force output)
| WARNING: exit code 2 from a shell command.

The above error was the result from building on x86_64-linux, target system=
 was aarch64-poky-linux, running on a qemuarch64 machine, itself running on=
 x86_64 linux.
As mentioned this was done on the master version of meta-virtualisation.
The bitbake command to generate this was bitbake xen-image-mininal.
The error is also present when building the xen 4.14 and xen 4.15 arm64 ver=
sions, and is not present on the arm32 or x86 builds for xen.
If anyone knows the cause of the error, the information would be appreciate=
d.

Cheers!


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
