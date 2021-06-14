Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.40])
 by mx.groups.io with SMTP id smtpd.web12.31254.1623682757378847698
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 07:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ihQ8wGN6;
 spf=pass (domain: arm.com, ip: 40.107.0.40, mailfrom: matt.spencer@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJd+Rq7nXeuQWDRd1FIZoicriG8bgjJbI2RpN7/AAks=;
 b=ihQ8wGN6GPtm+fQeyxn6Wut8pvW2F5PT4wsaTZ6A38sWHA+1oKRjFHe7TwoSg2Vr1Lb7Vi64JvqRGgNglEE9N5u7/jtLp0MX+GsGqLbvW4pi6IuLVkFeNUoPOTruHu8vUkiytCldIhIvsEQdpRl5fLPYUb54U7GdTv796skZxFc=
Received: from AS8P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::18)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 14:59:14 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::bb) by AS8P189CA0005.outlook.office365.com
 (2603:10a6:20b:31f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Mon, 14 Jun 2021 14:59:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 14:59:14 +0000
Received: ("Tessian outbound d5fe3fdc5a40:v93"); Mon, 14 Jun 2021 14:59:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d106d4c5e694379b
X-CR-MTA-TID: 64aa7808
Received: from 8cc57ea755eb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 711C0937-A164-4696-B5CD-0B70646B9A11.1;
	Mon, 14 Jun 2021 14:59:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8cc57ea755eb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 14 Jun 2021 14:59:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP0MLJVWl4BTvj7QVSKg+v3P2+qeGy7y8h82syONBZ1w0DkWmBuWRRyOFhaipOx4zE9M6FQ6JZxRdYH7lBB/vCRISZBWGmSSa+CEIzukOfyOgzXPt85yzPiMjM/Uc9NdruZUQJwyZSBTK1Wi9yKmODiSeKIKWytAgPdCFqGsdiV+gSZrtdQFGZAcZ1B1MLLPnEgdyMqFcR8nGXQie9hbyTPgPHMTeWqQ35OdpYN8R0BQGmOQEINrMmG+RJu69u5DJwLfqYVQTZwKjk8ocqJ/um04HeZXK1qjkMJscQquMzxeh7BdrZJeigsZg8u/GWhFuiVThjuwF0Pa10cCAAD+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJd+Rq7nXeuQWDRd1FIZoicriG8bgjJbI2RpN7/AAks=;
 b=jWMCy4i7YIfWepAvOKSG26/quB2znUx9RWWLBoe4MiTDQTJlK3mKX8+mRuROieynsdJBFXP6aF8wVCEtcpb5rsIhzGaVc0FZ5zqKNA+OO1bu8bEpw7ySBzWb54LXDY4jeRhNrQ1xOlrV8lBrkO6wkua4i6cdwJRAubtZr45gT/ir+nCiGuGfMhIXtvMQY1sLvq2TtkKfgfEm24fYCjLAJ86Uf4k5lXvUz7/goc2jgeiSu9oSoOdY+7Z5oKXQe0dehsMtU/2sVKfu2s4Y6JZSQAaCtxcA0qFQcNXG+YCBQYVLY0B6FFSJUz//Gi7sl+BuydpR8Hf6vR53G6TkJVlVpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJd+Rq7nXeuQWDRd1FIZoicriG8bgjJbI2RpN7/AAks=;
 b=ihQ8wGN6GPtm+fQeyxn6Wut8pvW2F5PT4wsaTZ6A38sWHA+1oKRjFHe7TwoSg2Vr1Lb7Vi64JvqRGgNglEE9N5u7/jtLp0MX+GsGqLbvW4pi6IuLVkFeNUoPOTruHu8vUkiytCldIhIvsEQdpRl5fLPYUb54U7GdTv796skZxFc=
Received: from AS8PR08MB7011.eurprd08.prod.outlook.com (2603:10a6:20b:34e::19)
 by AS8PR08MB6947.eurprd08.prod.outlook.com (2603:10a6:20b:346::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Mon, 14 Jun
 2021 14:59:05 +0000
Received: from AS8PR08MB7011.eurprd08.prod.outlook.com
 ([fe80::99fb:e350:ca3:dd4d]) by AS8PR08MB7011.eurprd08.prod.outlook.com
 ([fe80::99fb:e350:ca3:dd4d%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 14:59:05 +0000
From: "Matt Spencer" <matt.spencer@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] Networking issue with l3s when using systemd
Thread-Topic: [meta-virtualization] Networking issue with l3s when using
 systemd
Thread-Index: AQHXYSkAKS5JDH69N06hLgZZm8OWkqsTlvt8
Date: Mon, 14 Jun 2021 14:59:04 +0000
Message-ID: 
 <AS8PR08MB701191287DFA90A2F8408D7D95319@AS8PR08MB7011.eurprd08.prod.outlook.com>
References: 
 <qTwn.1623666439663990628.RPs0@lists.yoctoproject.org>,<CADkTA4PkCG-xJ+hRANh4_tQFRdBGHrvsqkj=_Y_SPyK=Ru-fDg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PkCG-xJ+hRANh4_tQFRdBGHrvsqkj=_Y_SPyK=Ru-fDg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.229.1.75]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e298cd22-539e-430d-3843-08d92f44f9a3
x-ms-traffictypediagnostic: AS8PR08MB6947:|AM6PR08MB5080:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB508073FD3C702A67FB0E01A595319@AM6PR08MB5080.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LPEm/NkZau+X5JoaebvvQpCvw8gUnJ1ZVn+mGY6tf6ibuZJWu9g3AuXZeT+fVuDMaxRpdTmwXjTIv+hu8pqfgUf1l2JUQT0ig5Z6WFMToEcxstbjsoSMA39HBdRTTCF2TzDT+l0TtWK+6uhV7jBn03o+oOjmXEPQFjziq/4NREvWuXlqA/tm97duUi21wIfR4uTKmbskT8KM6DurZMTmzHIMOCG5HnqAft0QNnwEUToZ+8DYladQV5bS+2/JHH6FtloemAcJdEwbO44xq/yrUqirHpyoNIvP6eiXCOjnweAV51YNdIukU41FmzVcl/ud62DbHQPTEvlKynl66AYZVY/00EidpA6PP/dd9oMsdH5NmO3Cl8WWZyiWYHbw2SZ08lOhkKuHB5ODggiFRRslBduKyQ8g/mQLVBRf4yw6aJ9xwOzrBHiwl1rIl67tXuw6XtMYEOCzxMwVjuau5YxoTbpwLynqiKo5VW+hwaW/Dh1cST3Hyiy+n4oOeC9gmmEvSBa3IfB2sjvwgn4ZV8cLLfXwr7V7WI83i4xSfepNAe9NwjF+wYE/wZUaotCXXJMexnmiNGlC6zuz1MVBuZ+yuquvJd+raXY9CzzGcoqemyO29IzdnNz3vcvRxFAJX6CgTOEOUK0tQzL3m0x5CAednUz00iEXKBrmo8ihnTdy+nWWFSX69MJz9itOsfUB6SWt5Jq9O/WmlC0oRZt9TdOJC3NMR9+JyI7PvHVPMYBasZ32tuGEKktAAt76/E43oBsrElIhHm4L/umY4Yg74L4gKA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7011.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(396003)(136003)(346002)(66446008)(66476007)(6916009)(64756008)(66556008)(122000001)(966005)(316002)(4326008)(66946007)(19627405001)(478600001)(83380400001)(26005)(6506007)(166002)(55016002)(91956017)(186003)(7696005)(38100700002)(86362001)(33656002)(71200400001)(53546011)(76116006)(52536014)(8936002)(8676002)(2906002)(5660300002)(9686003)(42413003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?J9m11ZwRue8UvOnzCYAxHzSpgvuEzu6fjkdNlf2OyLwmelxTmbsGAJ9Cpbj9?=
 =?us-ascii?Q?BCxEzFB9iCQxihYZP63av5BJp3DLoAeLv8+dc/Gi1/o0DcZdtOBjLjDexoNm?=
 =?us-ascii?Q?iy5oHy+jwXe3UL8xColMl3iOMMZ5zKkYYK9yHrrXmlMkilJ1XftrCKtzKPd9?=
 =?us-ascii?Q?Ptbk5IERPE6rido/PRwApfxC4F8B+8dOvRvAHEkMspkNV5RA3A878T42dm7e?=
 =?us-ascii?Q?4oQmBE9RV01UmmaEo+ytMV10bR7cZGvQGOnhOo9V44IRzdXCY/7SQO4rTENr?=
 =?us-ascii?Q?JJ1WhZN9EsGW6WfDyT8VFDslmmWRvwJfPQ4jiAIibSFI50saM6STG/aNpJqW?=
 =?us-ascii?Q?E7Nc6MvWlf0Gq3Bg3qxjvAeB0M/w+qWHEmKATb1uAU7aNG0I01C6PMo3Chwe?=
 =?us-ascii?Q?sLB0MMzDjdlBva0Uv0IG/eaDjd2NvAfduP4KaS53GBahuLeBfErmq0+sVE/z?=
 =?us-ascii?Q?Mu/1HIlDut66Icbkq+ei3G1Gcc3e5UR0f8NKxxCqRe2HDC6x5EtbYyF+wKNJ?=
 =?us-ascii?Q?F3QQHMYaHA5dUKLlbhrvJf8uh26llQxt9ARUbPsthBtI2QdyzCHIhY3OSbjg?=
 =?us-ascii?Q?SCuP0TEJTjk6hW+/xjbEnaCXngkwZRr3v18Kd8sAqYYnhahl3B5/q8tTUOo0?=
 =?us-ascii?Q?1VBZSdWNdrE+hMF6EXDnXDO1Yu5p43BncZRlqHNZUP+I7ESPA5sa/oSHvc1v?=
 =?us-ascii?Q?dar4qC+grI4PARyrYc6ewlJIqOV13B6cVr13Y5N3v82w3ryM2+iyc1w9m8pV?=
 =?us-ascii?Q?iLCilNqMPSIX+6/WjzfNMsHvR19d2J2OoABhj5SU9qVPgSUhrI9wQjW/Lptk?=
 =?us-ascii?Q?Lq5urCIl6uvkC85bmxfOnjBAlQYbV8B/1Cc7+kzttChI2l3rvCGK6fOKNhgB?=
 =?us-ascii?Q?OFCZmZK68wGhSfmmzU6YeDZGDEZ8zE27g0zlSO2MymbaHne/qimFjpu/tL3I?=
 =?us-ascii?Q?j+1ZoPs92OERnxCCkGdmDOkFdJjh23OrnS8lgON3c+cBerUz3tEX8+JpQZ3E?=
 =?us-ascii?Q?7IU7FwDfOTqTrG4hNPJ0jOzJSLhw92Rq2zRdpVUU9aX62M0iuo5hy/2f4Lal?=
 =?us-ascii?Q?TC5YkF3vfTohDwuSkDq6TIc/LP2O/PVTbU6AigYrRh7bnl41j09HAeJLaJfU?=
 =?us-ascii?Q?8sdB4JQ1mZZKpfJI9+HXjG47AlsrcxxpBJTx5oPlpihpoeRfDT5i9AFUyNeR?=
 =?us-ascii?Q?eSFX4arQKS9/Uea/CxRott9yrJ6KzhEBSkR8UsIehoSqmy55AexpSyxMnOPB?=
 =?us-ascii?Q?lUINqcYYyZkg4YBv8axvnO5hWGGIq+uaveKuMhKuPlaQtBdUEz51cd2zc3eb?=
 =?us-ascii?Q?PY4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6947
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Matt.Spencer@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ab979e70-d976-46bb-bdb6-08d92f44f435
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lSkwB4qZ0JtZGmt7Dw0qwFQCwcdhYi6snJMJ3M3Xt8r9XnNIXzLMwH3EWhRib3ZJaPTIZZGRCeyzKjdmGs8Rk+l0e1Fbkm/XgP+b3hvfbZaUImZnqdg9Oi90LNim5mx8nYaMr2O74qudoxmZ3L0JIPY1ynv9FNY2uvXfSLkpzCxxwvx+omRhDmdsvUn0CsXTvlMiw7uUV4eNS+PAd+V01M26CYJFUEvW0+Zhui4K3wdStgVbfEkpq3x/2qH99LbL1T317/bnoz5rq1yk6+wCrWVAhLopbYbLIjG4m2l4z8ueIJOa6XrNw4J+b9FSMthCZhjd1sZncDmQrGXSl2wwf8M5HCtnTLlQoUnK6FCvCIYtcdvYpwP1tNsj0sTxVvoYV0cmOMJnt435TPi2FBMoYtteUVDvdaPKQhztGGxyGNzdSrOxHHYnKp4Mb+qHZED778LzjYWYE2qOKelrVwupQkEQAXmapobhMf6BzUFwlpHdPPPIGrHApI5JIkfoNyKcZTRu0+vQkjf0RKZl+F05+FiadGlSCzLMr60iLBVsp45+u9O15h4Qr/HqqNkp5cWqxY66Gqoxo123Hvhzh6Xh4SLjAXGgM2Z7qXEEI7G16v6gn/fahOxsCN5Icg9UZO2q1EDxf/Q06liYn9qnFzK5FUPfU/zhPzQY/TUtO7jJVonfsIitbcEpmPKxNb863W3LhNtQGWSVFy3ZXXUZ4TXC5YfYZH9JLtXKE8SMcFHkY4ELNxD4AoSQAVbFhqikq7cabRzANYczjI93y+iQqshA4qSAb/yAcyfcno8/fagM6k8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(46966006)(36840700001)(81166007)(966005)(478600001)(8936002)(53546011)(6506007)(336012)(83380400001)(26005)(52536014)(86362001)(7696005)(5660300002)(6862004)(70586007)(70206006)(186003)(55016002)(33656002)(4326008)(36860700001)(82310400003)(19627405001)(316002)(47076005)(9686003)(82740400003)(356005)(166002)(2906002)(8676002)(42413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:59:14.0491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e298cd22-539e-430d-3843-08d92f44f9a3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB701191287DFA90A2F8408D7D95319AS8PR08MB7011eurp_"

--_000_AS8PR08MB701191287DFA90A2F8408D7D95319AS8PR08MB7011eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey Bruce,

I understand that changing things can be difficult once launched.

But looking at the systemd documentation here https://wiki.archlinux.org/ti=
tle/systemd-networkd and in the note that says 'Devices can also be matched=
 by their type. E.g. Type=3Dether for Ethernet, Type=3Dwlan for Wi-Fi and T=
ype=3Dwwan for WWAN. Note that Type=3Dether will also match virtual Etherne=
t interfaces (veth*), which may be undesirable.'

I have created a patch that modifies poky's meta/recipes-core/systemd/syste=
md-conf/wired.network to add '+Name=3D!veth*' to the Match clause which the=
 team at Arm are reviewing with a view to upstream.

I feel that this should have been the default behaviour anyway?

/Matt
________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Bruce Ashfield via lists.yoctoproject.org <=
bruce.ashfield=3Dgmail.com@lists.yoctoproject.org>
Sent: 14 June 2021 15:24
To: Matt Spencer <Matt.Spencer@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: Re: [meta-virtualization] Networking issue with l3s when using sys=
temd

On Mon, Jun 14, 2021 at 6:27 AM Matt Spencer <matt.spencer@arm.com> wrote:
>
> Hi all
>
> There seems to be a networking problem with k3s when using systemd.  The =
problem manifests in that none of the kube-system management containers are=
 able to communicate with eachother.
>
> The root cause seems to be that systemd-networking is actively managing v=
eth interfaces created by k3s/flannel.  This happens because of '/lib/syste=
md/network/80-wired.network' added by the systemd recipe, which is matching=
 on Type=3Dether.
>
> My fix is to modify the 80-wired.network to add 'Name=3Deth*'.  With this=
 in place, k3s works as expected.
>
> I am not sure what the correct upstream solution should be for Yocto?  Yo=
ur help would be appreciated.
>

This particular issue is known, in the sense that we have run into it befor=
e.

At a minimum, I need to warn about it in the k3s README files.

I created the cni bbclass to manage potentially conflicting networking
configs on that front, but systemd-networking is yet another variable.

We don't want to globally make it conflict, since someone might have a
working networkd config that they want to use, and exactly how
networking is set up, tends to be more of a distro feature. So the
recipes need to tread carefully.

Which takes me back to the README, and an enhancement to the
cni-networking bbclass to be more generic and pick up / warn on
configuration issues like this.

bruce


> /Matt
>
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AS8PR08MB701191287DFA90A2F8408D7D95319AS8PR08MB7011eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hey Bruce,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I understand that changing things can be difficult once launched.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;">But looking at the systemd documentation here&nbsp;</span><a href=
=3D"https://wiki.archlinux.org/title/systemd-networkd" id=3D"LPlnk" style=
=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">h=
ttps://wiki.archlinux.org/title/systemd-networkd</a><span style=3D"font-fam=
ily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">&nbsp;and
 in the note that says '</span><span style=3D"font-family: Calibri, Arial, =
Helvetica, sans-serif; font-size: 12pt;">Devices can also be matched by the=
ir type. E.g. Type=3Dether for Ethernet, Type=3Dwlan for Wi-Fi and Type=3Dw=
wan for WWAN. Note that Type=3Dether will
 also match virtual Ethernet interfaces (veth*), which may be undesirable.'=
</span></div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I have created a patch that modifies poky's meta/recipes-core/systemd/syste=
md-conf/wired.network to add '+Name=3D!veth*' to the Match clause which the=
 team at Arm are reviewing with a view to upstream.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I feel that this should have been the default behaviour anyway?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
/Matt</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt; on=
 behalf of Bruce Ashfield via lists.yoctoproject.org
 &lt;bruce.ashfield=3Dgmail.com@lists.yoctoproject.org&gt;<br>
<b>Sent:</b> 14 June 2021 15:24<br>
<b>To:</b> Matt Spencer &lt;Matt.Spencer@arm.com&gt;<br>
<b>Cc:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] Networking issue with l3s when us=
ing systemd</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Jun 14, 2021 at 6:27 AM Matt Spencer &lt;m=
att.spencer@arm.com&gt; wrote:<br>
&gt;<br>
&gt; Hi all<br>
&gt;<br>
&gt; There seems to be a networking problem with k3s when using systemd.&nb=
sp; The problem manifests in that none of the kube-system management contai=
ners are able to communicate with eachother.<br>
&gt;<br>
&gt; The root cause seems to be that systemd-networking is actively managin=
g veth interfaces created by k3s/flannel.&nbsp; This happens because of '/l=
ib/systemd/network/80-wired.network' added by the systemd recipe, which is =
matching on Type=3Dether.<br>
&gt;<br>
&gt; My fix is to modify the 80-wired.network to add 'Name=3Deth*'.&nbsp; W=
ith this in place, k3s works as expected.<br>
&gt;<br>
&gt; I am not sure what the correct upstream solution should be for Yocto?&=
nbsp; Your help would be appreciated.<br>
&gt;<br>
<br>
This particular issue is known, in the sense that we have run into it befor=
e.<br>
<br>
At a minimum, I need to warn about it in the k3s README files.<br>
<br>
I created the cni bbclass to manage potentially conflicting networking<br>
configs on that front, but systemd-networking is yet another variable.<br>
<br>
We don't want to globally make it conflict, since someone might have a<br>
working networkd config that they want to use, and exactly how<br>
networking is set up, tends to be more of a distro feature. So the<br>
recipes need to tread carefully.<br>
<br>
Which takes me back to the README, and an enhancement to the<br>
cni-networking bbclass to be more generic and pick up / warn on<br>
configuration issues like this.<br>
<br>
bruce<br>
<br>
<br>
&gt; /Matt<br>
&gt; <br>
&gt;<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</div>
</span></font></div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AS8PR08MB701191287DFA90A2F8408D7D95319AS8PR08MB7011eurp_--
