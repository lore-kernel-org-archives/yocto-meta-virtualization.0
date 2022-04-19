Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7F1C352A1
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web11.1733.1650386169885907275
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 09:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=g5Mnf/ll;
 spf=pass (domain: arm.com, ip: 40.107.8.72,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdMHxGvvXX0nmp8+Za3XQ1TwhQX4jWH2O8dECzD1YXc=;
 b=g5Mnf/llGMDiJJdT/XDE0O9J9pI83/KQNB9E1vvgjZZAP1JDkqpjUxGBjX6K2TCdXvkj9yhuCMqN6Ha3Im/aZcKp7f0cQ+5kQLwi/QZql4QjHanJPanN3qe9Yqt/huTxUMA+y2tbqgS9Esyo2NS2koiaTIW2XfizIgIYlVIZwEE=
Received: from DU2PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:10:232::13)
 by VI1PR0802MB2432.eurprd08.prod.outlook.com (2603:10a6:800:bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 16:36:02 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::68) by DU2PR04CA0068.outlook.office365.com
 (2603:10a6:10:232::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 16:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 16:36:02 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Tue, 19 Apr 2022 16:36:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4088dfd4bb0ad0d5
X-CR-MTA-TID: 64aa7808
Received: from 24376468e66b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9BF7D5F4-8154-4FE8-A284-54F1CB24D193.1;
	Tue, 19 Apr 2022 16:35:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 24376468e66b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Apr 2022 16:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVT18dD6AlbF6GETCGPMgIu25/ohD4YcyIFv3XoLsR65H/yNzcma62ZWmXvI+kZN1XjYeklpAo7HvrNpLb0rza2Gktw8f7ToQY01Lor9vTqWW5psc0PGXYKoIKYysSjxExKfLywrJsabxfv7R5BVW+oS5kVXAtXVwtQhXCPuwhAlo1D1s3s+bPQ9GiN0GRDxZpFHtibpHP1SDOo7cGsDSDTpj7zW2cy5KKqfMVeD/n2rhodRzuwGKWzC29ELghxZTo/LovwJRX3kRKAcbSCeC6raA6ZTZSQHXFCIgcDYbXLwM3NX8eXySA32ObEfDosOrUGOKRnlL+e1T2SfLiDycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdMHxGvvXX0nmp8+Za3XQ1TwhQX4jWH2O8dECzD1YXc=;
 b=dE5V8yKrODVs+WE2G+QRtFP+R2zJCGpjCcHcgtQIrjYpyw+3aW34PwdpnlT1YyZhIzCJlCpqF9IGuPAcBLyZaApnMP1Fh1qJHGdpgOCsDOGBLwt0jbLEgfFBgxGUm8oJ6iH5I/NqxDEby0XP0E8rb+hS/i69Z58cwgVoUgLowEAngarlpmiS1p+HKaO7gPKUUgKj7Mb0DGWX3nr+ZzuyvOuIgMajLVxuCr4lINf9X3vI2WWmpR/DzdPifQxXcBuWe6OZuc7S6Kz49en3nP112Y0i1YVk4iyutylo7A5sV3gmMsmn4Uae1uDly3av+n+7gTRUVFr32Sgy9qY3Wn19rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdMHxGvvXX0nmp8+Za3XQ1TwhQX4jWH2O8dECzD1YXc=;
 b=g5Mnf/llGMDiJJdT/XDE0O9J9pI83/KQNB9E1vvgjZZAP1JDkqpjUxGBjX6K2TCdXvkj9yhuCMqN6Ha3Im/aZcKp7f0cQ+5kQLwi/QZql4QjHanJPanN3qe9Yqt/huTxUMA+y2tbqgS9Esyo2NS2koiaTIW2XfizIgIYlVIZwEE=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6559.eurprd08.prod.outlook.com (2603:10a6:102:df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 16:35:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 16:35:54 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH] xen-tools: Fix xen-tools-xencommons
 do_package
Thread-Topic: [meta-virtualization][PATCH] xen-tools: Fix xen-tools-xencommons
 do_package
Thread-Index: AQHYVAtQpMJKGp7jFU6vSS+2hw/s1qz3bvuA
Date: Tue, 19 Apr 2022 16:35:53 +0000
Message-ID: <98277005-771D-42E3-8ADB-44969ABB7DD1@arm.com>
References: 
 <4cd05f5ccbba72131a58d6e3d405ae1a8a1d617e.1650385814.git.diego.sueiro@arm.com>
In-Reply-To: 
 <4cd05f5ccbba72131a58d6e3d405ae1a8a1d617e.1650385814.git.diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5c1c9534-cb23-4cd5-2dd7-08da2222b13d
x-ms-traffictypediagnostic: 
	PAXPR08MB6559:EE_|DB5EUR03FT007:EE_|VI1PR0802MB2432:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB24324E26639603484FBCE68C9DF29@VI1PR0802MB2432.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1ypfCbUM3Ub5aKggyMImxyA29ETRbtaBggvzkF5yj+aiVuGH/yk8oP09PIwjBHiWNCPuu1+4XMO3wRYCZXmveByrA0qxkcyumkKeIPTPnOzRtjI3CsTh3fcDJhAeZc6XECfC2IuoyxqAqlsMkaK0hv25TlGVS/y+WWz2/j9dGfAQsJH4yHkV07O5FHzdfasRGtVNwkIQimj+Od4TwbHJb/dcGYp0cgUAobt3Iv2oE1RKcSjoVkX2L5YkPqaI1TTf1u5yOaCPqYHRWLxW99TRpjq4wetnhXLkm5OMbPqHuC+BMuzKNYhpP6jvIOyH6u9VwDQLdn9fFbp68UnYq05ST1FsSsf7vGYG4Lb5XXj7ddpTb3BO6w+hSSseyRf8oNWRI7bpMvkJj4blIchOfYdXQZsGMhXJTwcs+d1p0brHaCr5eoZ3mK8bHVnTFCbtgF0ZGUXphSewbvnUw+r6KPNmNOOQeYXyyLJvj2RHCRE3uvXSvbTgVu3n0gKwFqedE4BQ4PCeEeu4WRq1dnQ2jrTm0vVxiY7l/ygxrhRT4mKvCsnPF1na8n3l9zFVXmRYHySCqgcyt3Mbl0PqOaKAbALI3Pl5ibGg+jnkUMHR6pl0ZyoNwYoxsGE0zgAh8KnwoiiLNA51mitwd8oY245TRkHn3R7JCMhyTsyTnpjTHMinBTPz0WqMxkvfz7tUpUAi/8pk3UNcp22Wpxn67++uir+Bc83FFtS+RPm5084PKlMhDkO7FV4GtWj8Xp73vsKC4aw9MKrxIj6VsLt7ARxrl+Cbhc5dhbvhBjr7+k4HWjICaTJERu45I1+14Rf5tq4tNkn3
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6512007)(6506007)(66946007)(186003)(122000001)(36756003)(33656002)(38070700005)(83380400001)(5660300002)(54906003)(8936002)(2616005)(91956017)(53546011)(2906002)(6636002)(37006003)(38100700002)(76116006)(66556008)(66476007)(66446008)(64756008)(316002)(508600001)(71200400001)(6862004)(4326008)(8676002)(966005)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE8BAF5935299B40977F5365D83818A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6559
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3e0b8697-aa95-44ec-1812-08da2222ac4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0z9TY3ER7yxUnpe9JSPbs0NAqIw7Zbm7quwA0m8uX59Y6e43PWkwlSKs9IQuGMeFoerPLFHcds7zP4LuTYaVqcPG79Jbqq8wkvDR7+EMh4Ie8jEHoc1ERIAuynjgrm03/r2MtXFJDDi5SEdhTybe0dTlp7DmdNyu4MdvQT+dDTIQNYXIARsQTQ3qeFsIoZd6HedM20hnMqnrOBTLcKdPriC+buzpIrw1+UdW71aLEKmX8csV7HSQbO5T0lxV/RnJUY6G3DLyk8V6xLODgnEo30UWrSEOF90e49qU7Tle/1VMJU4YyBNtUvAy/j+MR0SLhBWKCtUcqR0R1zisut0+Wj861LgMolnR05bzFpShDxQrLW7+JZwn5nxikpdix+IuP/20RxSNmFyyNr6/tXKpdNEy5ZjgGMAAlxmKeRQsCHwAwhXU2Xi/U6ve12cMVYFze9DoGEruVCB1MSEB7H4czTaClSp7F7rZ68FkHVZKXGZX6wxWOpd6gkM47CfD0+GzgqCjk0YdBvEcN65AcshOi6I0ngIsa4On/2BxhKvWWRmuj8wF7n+hoHwv1r/P/qX/ioepNgOJzKBuW+JICXf40XyhgnF3ID4oiVE8tU2Nk2q8d6kFEJqLPT6qNX0VjA5MCpkIRCMKvDeawXjlC9/NnNVoE9PKp2arDhMVeAztEPmknw079RHqKUmeNsI7q79+Xr1/S8irk+Y0WeCxN2EhC8RKyy4xm//kqzctpMHVDUdkfy95WosaCxL1bvc0ehkTGqJc07lP/j1B9j0igGmDJA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(70206006)(186003)(82310400005)(4326008)(70586007)(6506007)(8676002)(336012)(47076005)(53546011)(54906003)(966005)(33656002)(5660300002)(36756003)(6862004)(2906002)(26005)(2616005)(6512007)(83380400001)(36860700001)(86362001)(356005)(81166007)(8936002)(6486002)(40460700003)(6636002)(316002)(508600001)(37006003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 16:36:02.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5c1c9534-cb23-4cd5-2dd7-08da2222b13d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2432
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7193

Hi Diego,

> On 19 Apr 2022, at 17:33, Diego Sueiro via lists.yoctoproject.org <diego.=
sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> With the patch "xen: only package xencommon systemd components if systemd=
 is
> enabled" (c9554c6), the following error is displayed:
>=20
>    ERROR: xen-tools-4.15+stableAUTOINC+84fa99099b-r0 do_package: QA Issue=
:
>    xen-tools: Files/directories were installed but not shipped in any pac=
kage:
>        /etc/init.d/xencommons
>=20
> To fix this, we need to conditionally include/exclude files in do_install
> depending on whether or not systemd is in the DISTRO_FEATURES.
>=20
> Also, take the opportunity to have the relevant extra sed processing in t=
hese
> conditionals.
>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen-tools.inc | 20 ++++++++++++++------
> 1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xe=
n-tools.inc
> index 6bbc8cd..cf2a344 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -805,14 +805,22 @@ do_install() {
>         for i in $VOLATILE_DIRS; do
>             echo "d $i 0755 root root - -"  >> ${D}${sysconfdir}/tmpfiles=
.d/xen.conf
>         done
> -    fi
>=20
> -    # fixup default path to qemu-system-i386
> -    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=3D\).*$#\1"/usr/bin/qemu=
-system-i386"#' ${D}/etc/init.d/xencommons
> +        if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend=
.service ]; then
> +            sed -i 's#ExecStart=3D.*qemu-system-i386\(.*\)$#ExecStart=3D=
/usr/bin/qemu-system-i386\1#' \
> +                ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend=
.service
> +        fi
> +
> +        # remove sysvinit specific file:
> +        rm -rf ${sysconfdir}/init.d/xencommons
> +
> +    # sysvinit
> +    else
> +        # fixup default path to qemu-system-i386
> +        sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=3D\).*$#\1"/usr/bin/=
qemu-system-i386"#' ${D}/etc/init.d/xencommons
>=20
> -    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.ser=
vice ]; then
> -        sed -i 's#ExecStart=3D.*qemu-system-i386\(.*\)$#ExecStart=3D/usr=
/bin/qemu-system-i386\1#' \
> -            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.ser=
vice
> +        # remove systemd specific files
> +        rm -rf ${systemd_unitdir}
>     fi
> }
>=20
> --=20
> 2.35.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7192): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7192
> Mute This Topic: https://lists.yoctoproject.org/mt/90565672/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


