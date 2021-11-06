Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.92.20.65])
 by mx.groups.io with SMTP id smtpd.web08.15462.1636170309463992966
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 20:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=kXhRFoaD;
 spf=pass (domain: outlook.com, ip: 40.92.20.65, mailfrom: pbg.dev@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbrojbd1Vxt8DmbOeED5pGB+y4fjyEO+f7K2dYS7tXRz0f7bmx9389DF1YAFUxI0hErqZ6NkZ2TvL6YNp4guAb+whH0aG6qvy5kw1OsZsU6u/ghGFxOcuISc4Hikzo0iUrfYbWxQcbPS0FcY7Zj8SQb4um+i6LNnepEwCKNOrv/jRjcr9KZAa2he2ojyznDkkGEktMHKCXXqfIws7Awx91EmoqBsZf1uOj3Gzi9F9raDVdR8WMyq4lOV4+lYyIJDvjOce0n9rIA+wCGjVprCfZXDabm1KxGpyYAs3PA55yQB+paXM3qJesSOjiomHAG6HDysKn0kHDTLzUvc0s2msQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbxcu+27tnr4un7lgdljGJ75MfWz40WghEITSJyB7dg=;
 b=hRfwLbFFWFyZyvHyd4/rSng2Wrv3Et10LjHvyNgHXDIugNAMTiIragHjVpw2xs3k0VP5s2WMWZv2wKLOY1sAUw9i2MHGi/ehKxAOKLPiWdsZeOPFhU8IP9VeMKRU1ORdzeABoSBIDo93ATgvipdw5FxQFQwP7qJRf3F7kq/t/3WB4LJEGcviHzXBqVVXjyqJ/vI2XbsrXD3+iAtObk5E0Xa/4rtP6I2e7PgFo1uCPcrPK1zQb98xeakXExx3B7AcFi1HsRJ0ecvGj432vm7hNHPkf5mHBaz1zPaBEN9NRQc2yjt/jZfaLfQPHZNMn8fU23Db2LkgY7W5zMBfA5W3NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbxcu+27tnr4un7lgdljGJ75MfWz40WghEITSJyB7dg=;
 b=kXhRFoaD59vMlOJBy2GPvhU6keFQJBXj3wqEXuMmE2omuIFwglICiGz4xiO+Czvh16+JswmEvh5knMUfu5AYMiydQWYIW08IjD4Ro13aITFjXzF5hL21p21uRENaDfiea4+bHyPYcUpHrg4NnOD6k4rVYXfNQRj/mS2jcUKhbnWJrOR/vCCfN0qgpBaV4Mffpad8W+rrctdcgvxweXyfVleb4pHvV46t03PrmajGb4bGACyRK8ZTZL6HebeaF9/1xFdefzRDkvO8BZMywNFHWJFqDyyC904RmVlirfhvvZuVuE0TcDn8a4caKqSG55X9ykYRBKZ1hByQPY7iJORFjw==
Received: from CO1PR08MB7016.namprd08.prod.outlook.com (2603:10b6:303:d4::6)
 by MWHPR08MB2863.namprd08.prod.outlook.com (2603:10b6:300:c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Sat, 6 Nov
 2021 03:45:07 +0000
Received: from CO1PR08MB7016.namprd08.prod.outlook.com
 ([fe80::fc3a:f849:8aa4:c530]) by CO1PR08MB7016.namprd08.prod.outlook.com
 ([fe80::fc3a:f849:8aa4:c530%4]) with mapi id 15.20.4669.011; Sat, 6 Nov 2021
 03:45:07 +0000
From: pbg.dev@outlook.com
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Building xen-image-minimal for RPi4 Compute Module
Thread-Topic: Building xen-image-minimal for RPi4 Compute Module
Thread-Index: AdfSwKnaipM8xbQYTSaDeK/f+MNiSA==
Date: Sat, 6 Nov 2021 03:45:07 +0000
Message-ID: 
 <CO1PR08MB7016339CB7AA08CE6D133344F08F9@CO1PR08MB7016.namprd08.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [vDjSm/7PrgxSfR7+vC7wz627sST5Ob2zF5OCaMQ3OebtCBKnc0juSQNenVHUoKAo]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a943189d-1bc6-4ead-26a5-08d9a0d7d343
x-ms-traffictypediagnostic: MWHPR08MB2863:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0enO0ECxWNJQEh7OuAr15axBpBcREl5qy3KSEvPYAPGFIrTIyMluGD08y5F3U9w0ZMgqhcfzvCmoD/OLRRQIV0WHG7dwsKnEjlKP1XHetVvYxSuLJLrmu7FGJxCxsg00eiosEINeTyMx3xL3lvsQ5dQIlfr5r0z4aj+4SXuBbf3x+dfX08azZfI+h09ohLwSn4SBS1pvQcTmHeG6fHh18KMLEUfI/O74IZgcEzZXx8O42swnYr3F5im/4SG7L8cf6/dxR6CVI5OsXvZM5l4eNFfHXcWCmYntitQud0krBgVKKpvx7ouyuJSjNkGhqRmL7ZXDgYyJHK5T2l8Okoz6ySsZYNXv2GNXNEFMrNQpi0YeTveOy4IAmZC7+fUFR8Lb35uhX6J2q2YZ6F0ttCN0qWZFu7dm8vwD8I6gJu4kUc766/EBahehqXGv4O3kcGh4/CvXOhjNGHwj9ZFflirS92rh6quOUC7CriBVfEGZNpJ94xVFswCr/21wgjNVI+41eVhVk9kxzb1gYVO5s85Me+q6rJ9BQnA7IFMmyTgQJUA=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 FJLKDg47+JB8aFDFqDOtdhcf+vhPClqF1PJkdBbbG2hOBdPuf8QmwHuCjOvXd0FKjRXq7z2jX3HCcFq6ZzK0il2idZwW/DKEfPNoTxH/ZOBUFD27aG5MXpDOnVhCnDdM+D4qyJgGjGhtKGVmbUzqLTkSkQWX/uiqUa7MrzXB/pQfRLNvk2Bh6smmmJrwHT1vJacDFBPTZhrhYO0brxUcCQ2vlhnXMgnhrAIUjzcafbCWM10c7akUupfMBDdMXTxS/xp3beZoGMibNWojIbmQsSd+8bkIbGiTpMUROkx+iXUgrwg8js3qmfxFHg2dnq+2m31+pKRkD2eFO1/Ac0b7LeiraGcEJmDdsIcCKV9cXGsCuQxqCC/FhE6DqSxEAp0lEqA2lSP7jvVLoEjN7ZLq7OlNbq+Uq6MFR+LfIrLmlTJvdKiO51R/ChdNQ30coDvuE3Z20jj2zVoKD8xOgOYJQ19h7Hn9Y9PqjoxW5j/xZzD7Ii7IbQRLAyuF8m35jJcBAkWBwVpqSVcOsjrVtspVB44cbLUV0Wmq+aMRD2x2FgNrQ15WKMP0PyxEcZ0vbvGv6jSY9OOJFZ2DwdICvH0JpEPaKEvpu68GPDxNzC6uqLQPNWqjU/gAv59yEmNI2mbJSgDbeVfIwAwJC5Od8dki0VXJ0HoaCHClQidBz4GjzM6AhrWnt8XcLmLH0nUfu0Cavi0q4P3quuil7MFa6fnXCNGtmCaWUTYstHcGBSbCPzV7s4/4gNG7HaADpmjvA+C8
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR08MB7016.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a943189d-1bc6-4ead-26a5-08d9a0d7d343
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2021 03:45:07.1436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB2863
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm in the process of building xen-image-minimal for my Raspberry Pi 4 Comp=
ute Module and am hitting some issues when running the image on physical ha=
rdware. Upon inspecting the boot partition of the sd-card, I noticed that t=
he image only contained the dtb for the Raspberry Pi 4B; this makes sense w=
hen I look at xen-raspberrypi4-64.inc:

    # Override the meta-raspberrypi default kernel preference
    PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
    KERNEL_DEVICETREE ?=3D "broadcom/bcm2711-rpi-4-b.dtb"

Compared with the device tree blobs declared in meta-raspberrypi's raspberr=
ypi4-64.conf:

    RPI_KERNEL_DEVICETREE =3D " \
        broadcom/bcm2711-rpi-4-b.dtb \
        broadcom/bcm2711-rpi-400.dtb \
        broadcom/bcm2711-rpi-cm4.dtb \
    "

Looking into it further, it seems that the device tree listing in the kerne=
l used in the xen-image-minimal build doesn't contain the newer firmware bl=
obs contained in meta-raspberrypi, which causes devices like ethernet to fa=
il to start up when the image finally boots.

I've tried adding the bcm2711-rpi-cm4 firmware blob to the SD card manually=
, but that causes u-boot to fail with the error "Bad Linux ARM64 Image Magi=
c!" after the Boot Xen step in output. I also tried manually replacing the =
bootfiles written by the xen sd card image with the latest blobs from meta-=
raspberrypi's packages, but once the OS boots I find that xen is no longer =
running, making me suspect I screwed up the configuration somewhere.

Is this something I can trivially fix? Is there a way for me to override th=
e device tree selection used by the minimal xen image in my local.conf? Or =
do I need to investigate patching one of the meta-virtualization recipes?

(Apologies if I've used any of the wrong lingo/terms here; still new to Ras=
Pi/Yocto/Xen :D)

