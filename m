Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.56])
 by mx.groups.io with SMTP id smtpd.web11.10376.1602762960139913322
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 04:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qs0hO6wf;
 spf=pass (domain: arm.com, ip: 40.107.2.56, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zt1qlfaDnkJcuKaQePYzWqEysRUl6UZc1pc9G+a/Ik=;
 b=qs0hO6wfrPiBRSLbfevce7QQwCrgwsHqTeMWlR6LCWWs8IvbhKeK1MYCOpCr+azJ7Alr/Uz6kpiv67R4HYyAqF3tlw8tuvjmn1BKrPynikQ3qi1iMjXvB9MijGgTwiTZTNpusS+J2s3IaLqQDiSsDVxKuUoVXCN0sH0I9Eo/4tg=
Received: from AM5PR0502CA0015.eurprd05.prod.outlook.com
 (2603:10a6:203:91::25) by VI1PR08MB3375.eurprd08.prod.outlook.com
 (2603:10a6:803:87::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 15 Oct
 2020 11:54:42 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::d6) by AM5PR0502CA0015.outlook.office365.com
 (2603:10a6:203:91::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Thu, 15 Oct 2020 11:54:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 11:54:41 +0000
Received: ("Tessian outbound e6c55a0b9ba9:v64"); Thu, 15 Oct 2020 11:54:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e17c87cc84229385
X-CR-MTA-TID: 64aa7808
Received: from ba5d9a35bed8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 088544C0-F98B-4E92-B3A8-52D91CE2089D.1;
	Thu, 15 Oct 2020 11:54:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba5d9a35bed8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Oct 2020 11:54:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxgsEbFvDkg0Buj4xy7mK0CGKbnU0kmwsYRuAivSlh4UltUsb8CnBZSNAhUio4bG/VZmq5ztB4KBbUre+ecvyWgNJd71WHp1hcQs5iMAYbI18N+OwMwkEnihmgYc7nIkvU3Nu5ZdmWroqc6cnmQh/deF6Tq/ZNxvWmViYqlBeO4QMh//OdzZgYqc8ROjZbZIMi3shxk2J/bUbb8o4IWAkgEKONAqKrYVQpj6fBSXLqP6f+R00EoeoTS6s7isGgMxw4j9DPGAKL7pZFZ+b1nyCWzrm2dunGUBYikOi9salGcpROwa636DNdjci9lmqv6zrImmSFkD49KM1jbtUwzSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zt1qlfaDnkJcuKaQePYzWqEysRUl6UZc1pc9G+a/Ik=;
 b=fr+kcTMA6cH77iUDj7EmyBbvr7vYQUPyf2Nc7zeoH5KdfzXDJYry6g6o7gnJ/Vq777y/x2cwX0niAD7LjxPqHMo3pjedZjRkS+Qa1RscUCtyGzh4zSEKE9C1wqoWN5vPFeqaPGexxc/N0TQvn49jCl+0ypBcwVbku47heKpbYm5DQI3tlTgrwZgTgnMLPdo3mF9+2WSAgDsX8eFWGjXZtanRrp1KuFmnZL3plyQdK/+c2KsmRtDtpdR6Bu2Fj8g6PDOOfTNhRZZHxbfTxsnLfK8wlJ3K652eIQU75LN4CJJjLpGJyEZOA1+WJBiImrfHUEADvCGqc59Y3CYg00M32Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Zt1qlfaDnkJcuKaQePYzWqEysRUl6UZc1pc9G+a/Ik=;
 b=qs0hO6wfrPiBRSLbfevce7QQwCrgwsHqTeMWlR6LCWWs8IvbhKeK1MYCOpCr+azJ7Alr/Uz6kpiv67R4HYyAqF3tlw8tuvjmn1BKrPynikQ3qi1iMjXvB9MijGgTwiTZTNpusS+J2s3IaLqQDiSsDVxKuUoVXCN0sH0I9Eo/4tg=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4678.eurprd08.prod.outlook.com (2603:10a6:10:dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Thu, 15 Oct
 2020 11:54:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 11:54:33 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] [PATCH] xen: Fix x86_64 xen-tools installation
Thread-Topic: [meta-virtualization] [PATCH] xen: Fix x86_64 xen-tools
 installation
Thread-Index: AQHWnjg9vGO4XNyZOEGHjXUBS3Z55amYboIAgAAmJoCAAALJgA==
Date: Thu, 15 Oct 2020 11:54:32 +0000
Message-ID: <AAED5790-0D3F-47FF-BC61-1A229304EF65@arm.com>
References: 
 <ba7dacdcd5aaf6890b895f97fbe0007d75d73a75.1602246664.git.bertrand.marquis@arm.com>
 <163C52E32AF7858D.12576@lists.yoctoproject.org>
 <F3AE8A23-E5CE-4C57-8F4B-0E64B78F5CDE@arm.com>
 <CADkTA4Mk-0JPMNMg8fo+Xm2PgMhjH6XAu3ywxHS+F16duh-q1A@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Mk-0JPMNMg8fo+Xm2PgMhjH6XAu3ywxHS+F16duh-q1A@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 090303b4-4a82-4dac-cd74-08d8710119ee
x-ms-traffictypediagnostic: DBBPR08MB4678:|VI1PR08MB3375:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB33751AC5E1AD93C9A5B50D719D020@VI1PR08MB3375.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 q9O20rO5fx3A5z3R1gtagxNLwiqU8Dy/atpyQF4sPciDJBLcawHXDzP5MneSkgFOvbK9/h6fSKIOjhNJelic1ouTh2qZKlY+i8TU/8Rw8699yeORZslOyqImEMmvaXHgDhXQP3mWV2h8+JVmeKk+nyLYsN1hWJ55n/EDvpevbusEp2BTe0D29rI0kUer+4YauFSlhGm+6ougkWr70dAWdWjk4VF0ZvT3+pDDwfbe9eQ90BWN1dKPz8/c45fIAidSUVMYaWwzQauw/tod6WqtI/njxZ2Fz1pQnRudkndMOd2m/TX4Eg6Yx9ZyrKLjI9xWpvlDYtlr1Wjb58+NKkmZoZvDtIOjtFGDSKxBYQLd1RwAK+F9YfCIc3RAtaUfJ0dG/gv4XlehvG66UOHkg8EMVw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(53546011)(33656002)(83380400001)(36756003)(2906002)(71200400001)(6506007)(6916009)(186003)(6512007)(83080400001)(26005)(6486002)(2616005)(91956017)(4326008)(66946007)(8676002)(478600001)(86362001)(5660300002)(64756008)(8936002)(76116006)(316002)(66556008)(66446008)(66476007)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 L4p+ca95V8mp2O6B+NPfG+lYe019BzZSKs2CD2glfo248p/lvKcI+fV7xVv5TP7X1V+V9tAntXSRoV5JCOh2Q4GjcC6lLphbcCVE36Nv9UVUibMduLQ+QD/RDohH+QTgcgAWCnqNzlhY7YX8Cw6AekdxORxhBJ+pUYcgVFYk9P4TM6qGXkn6Auj3oUVGU6ABg0iC8lBUu9lPjkggTG487V1gM75yB4MvbFEcmcCEsmHgH5BMJd42uZG24Uga0f8A0YDNGdWMNOdFYQPJmIsQa3UdNXXFBs4IO812eLaw+p1+J0PRqW6Bx4nXQy229ZFHQGRTAMejokSgWLtuU4Uqj3E4beyYg7vowZcQ6cu4/lAmGvVGQ52R9yk1YPQBz3eyGQyY9o9SC03NnBug+QI7B/zicObRMaro+bZLRLu9gysZXpva3Si0GYGb1dP9SHYE4RSUItbLxO8m84mLp1AyhD2LEr+sTTqpFC/zzUFsRzEruSvW2FeYcONNkoRA1I4e0mxvOpsjc32Bhu6Yh6vbmm4MH3p5IMhRfAD6ImJ493EXxkn1AHFXS0Dc0rbGjSc0/Ag439Q6QizoxwVSc7en/p/hFvrS94J9ZGYv0SmmwyQuvR36KLoeWbwB4OeB2hZ/OVc+vuZv5oxNStfhVA4GBw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4678
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3b2ee083-c72b-4bad-b35c-08d8710114d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RN0aHHCOdiN/Gqv2zClGmLls3Uka2GCyZ8U2eLl5djBoyIBi/UuLooL/BtiGFBitkAgo9jZf0mT22mEqTmu3zhkJoBY0uaZeqXea33Z7IVveudbkoDW6NhIUOFGI5+F3DW2TITdTkXIr1n621SBZ1FmSM/ZZlIaAfuUR+lVldIEkBrXNV9Rj9P6VNiIWjNN999zSiDz0rxowOprn3fTWbQBpjN8KkIAs0Dd/lD2pGUbOAUWLE73g/4GMgsKIteiCu1gwFENpdr/rIXa2cwQ/0xSoFg9Pb04bpTSzWdgjKAOENUZ/t9y6Xu4asIJ86EH7qy1Rd+p0S6agUF2n3NTJHPnIFanKLd/mBOmmDWjPGhiwQwAim01DY//ar8fE0fZyRJpvgbUDjZEs94hwE342CG1lP+AV6V3PHlLf5/MmpkhFhiK6tYDR8VYINW38pXZzOwrFH9wyNrx/Tq11PxHMLJ9T+AxGhGRR7sjpmg86iu8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(46966005)(966005)(2906002)(6486002)(47076004)(4326008)(70206006)(6862004)(70586007)(82740400003)(53546011)(26005)(6512007)(33656002)(6506007)(186003)(316002)(36906005)(86362001)(8936002)(83080400001)(83380400001)(336012)(81166007)(2616005)(356005)(8676002)(36756003)(82310400003)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 11:54:41.5832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 090303b4-4a82-4dac-cd74-08d8710119ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3375
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CDB0CFE80DFB5E44AE4FFF2ADF0118A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



> On 15 Oct 2020, at 12:44, Bruce Ashfield <bruce.ashfield@gmail.com> wrot=
e:
>
> I merged this yesterday, but it is held up in my breakage of containerd.

Ok thanks for the info

Bertrand

>
> Bruce
>
> On Thu, Oct 15, 2020 at 5:28 AM Bertrand Marquis <Bertrand.Marquis@arm.c=
om> wrote:
> Hi,
>
> Gentle ping :-)
>
> Cheers
> Bertrand
>
> > On 9 Oct 2020, at 13:31, Bertrand Marquis via lists.yoctoproject.org <=
bertrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
> >
> > Change-Id: I24e4336aaac4477efc5dc7426a6d9e909c98a6af
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > recipes-extended/xen/xen-tools.inc | 10 +++++-----
> > 1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen=
/xen-tools.inc
> > index ace1a01..736a766 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -247,8 +247,8 @@ RPROVIDES_${PN}-xenstored =3D "virtual/xenstored"
> >
> > FILES_${PN}-dbg +=3D "\
> >     ${libdir}/xen/bin/.debug \
> > -    ${libdir}/${PYTHON_DIR}/site-packages/.debug \
> > -    ${libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug \
> > +    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/.debug \
> > +    ${nonarch_libdir}/${PYTHON_DIR}/site-packages/xen/lowlevel/.debug=
 \
> >     ${libdir}/fs/xfs/.debug \
> >     ${libdir}/fs/ufs/.debug \
> >     ${libdir}/fs/ext2fs-lib/.debug \
> > @@ -261,8 +261,8 @@ FILES_${PN}-dbg +=3D "\
> >     ${libdir}exec/.debug \
> >     ${libdir}/xen/libexec/.debug \
> >     ${bindir}/.debug \
> > -    ${libdir}/${PYTHON_DIR}/dist-packages/.debug \
> > -    ${libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug \
> > +    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/.debug \
> > +    ${nonarch_libdir}/${PYTHON_DIR}/dist-packages/xen/lowlevel/.debug=
 \
> >     "
> >
> > FILES_${PN}-dev =3D "\
> > @@ -497,7 +497,7 @@ FILES_${PN}-pygrub =3D "\
> >     "
> >
> > FILES_${PN}-python =3D "\
> > -    ${libdir}/${PYTHON_DIR} \
> > +    ${nonarch_libdir}/${PYTHON_DIR} \
> >     "
> >
> > FILES_${PN}-remus =3D "\
> > --
> > 2.17.1
> >
> >
> >=20
> >
>
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await th=
ee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

IMPORTANT NOTICE: The contents of this email and any attachments are confi=
dential and may also be privileged. If you are not the intended recipient, =
please notify the sender immediately and do not disclose the contents to an=
y other person, use it for any purpose, or store or copy the information in=
 any medium. Thank you.
