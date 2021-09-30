Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.88])
 by mx.groups.io with SMTP id smtpd.web10.13899.1633013998695954863
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 07:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KU84L5mA;
 spf=pass (domain: arm.com, ip: 40.107.6.88, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLrdkHcTZof9/v0P2l1zQbVqRn7une42RtPvgS4hkTU=;
 b=KU84L5mApVQX1eVaBpc+QzO++0spfAtwN6YA7FNR7kezzauFTY06lD4MWUHNvt/MMR4EJefyKKGgsBw7lQLY0yk+LMBfeZ8S/AmMZxieyqG0QVCi4I9ezZkCXl+Fz7WAaec+m/QFo37Y90HCVkdqaBKu1yNwxER3QDKgWqwet+0=
Received: from AS8PR04CA0204.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::29)
 by AM6PR08MB3336.eurprd08.prod.outlook.com (2603:10a6:209:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 14:59:47 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::9e) by AS8PR04CA0204.outlook.office365.com
 (2603:10a6:20b:2f3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Thu, 30 Sep 2021 14:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 14:59:47 +0000
Received: ("Tessian outbound 010023020eef:v103"); Thu, 30 Sep 2021 14:59:46 +0000
X-CR-MTA-TID: 64aa7808
Received: from f8fae1bcf06f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CD6677CC-3BEC-423C-B750-4B9B6ED7CAD2.1;
	Thu, 30 Sep 2021 14:59:36 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f8fae1bcf06f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Sep 2021 14:59:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKrL8A0IRIJ/lJzf2yPVAlj5Y/7LfBzmQDshDqq3DLzSR0LCCjt4x6aJxzH0CVyIIUanm46gvxZGDn8Gws7jieDDymSuyhYCBWYj3TuKIJEd0/YVD13dJ3YjpVOk6lu1De2acru2oKwMuvFfP0TUUKZYFmZtELJ8RwslOEBeZaoodIncD5fYIaUWjhJsXiWpcu6MBV6IdHSsHHkg5himdBYQtXuyHTIc44S23Fd18kyBQVkYqLFPLguZivzkF0GqfMzJqQcvfKfLo03zvrgeNBSaRpMAJgr5sZvlgTtosU7ciIwiPh74ZPthoQT14v9//DtkEOAnkMR6QvpBcwLg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rLrdkHcTZof9/v0P2l1zQbVqRn7une42RtPvgS4hkTU=;
 b=aOZP6FXgYhCptdCa0kt4+RR15RPt178xg8LPh5BdTt7CeLQQQUBNLDXkN2nFv/tvZotxq5KaAeZ0wCoV9P9tPI79apZHQ9B3mZXNTFSN5A/DtygupFfsYR5lsY6LYJkL2tCIO5FE5dbyS6P+8JavK1HKlKEj+fmtSJNbKYnNkiaiZ1ZpGLnWT9xWAIx9K6QgWaW5tWeeAWaB3KGqh2P1QkV9WqDKbM32G72U52K2V3C7QdRRLzRQtndfaYMj2BP726rrrkReYg/lraBoxKlgtlkRHWFI+/0t2X6rt3rLk172y7YqVQAn9guQR2HHJWrKs63eq7/aNYSE+Q3Kubduqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLrdkHcTZof9/v0P2l1zQbVqRn7une42RtPvgS4hkTU=;
 b=KU84L5mApVQX1eVaBpc+QzO++0spfAtwN6YA7FNR7kezzauFTY06lD4MWUHNvt/MMR4EJefyKKGgsBw7lQLY0yk+LMBfeZ8S/AmMZxieyqG0QVCi4I9ezZkCXl+Fz7WAaec+m/QFo37Y90HCVkdqaBKu1yNwxER3QDKgWqwet+0=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1873.eurprd08.prod.outlook.com (2603:10a6:203:4b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 14:59:33 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::40a1:ebcb:aa97:5718]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::40a1:ebcb:aa97:5718%6]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 14:59:33 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen, rpi4: Fix syntax in linux-yocto bbappend
Thread-Topic: [meta-virtualization] [PATCH 1/2] xen, rpi4: Fix syntax in
 linux-yocto bbappend
Thread-Index: AQHXtgsg+nSHhCwXPUCy+TfkD4tcF6u8qyrQ
Date: Thu, 30 Sep 2021 14:59:32 +0000
Message-ID: 
 <AM6PR08MB3461E73EAF1756D13E60E25D92AA9@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: <20210930145423.17162-1-luca.fancellu@arm.com>
In-Reply-To: <20210930145423.17162-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: E4C3A6510BF90340B930563B8D4A4E13.0
x-checkrecipientchecked: true
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6c9d4658-89d0-4432-013c-08d98422f203
x-ms-traffictypediagnostic: AM5PR0801MB1873:|AM6PR08MB3336:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3336DF3037C09942336A097A92AA9@AM6PR08MB3336.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LK9LtcJSRpX7HtXSneI0AQKQ997K725IyyFwHtG1skMBGexraePuoSN95QbzUPJUFHzUq882dkDm7f5kicOdKDD+En+J7L97MvPLa1cnS2xbJtGBtM0lwR3ZjTAx8ougAHd+mQZO4W1ZD+QvK0wlyoQChAO77UtX/GCNOTXuH8iOwsl4b2xdPCOsPWPVX0CYNaKW2D6mA6FyDKUgB329fSp7MTq7maMhEAqKfbfsZAJjjzzosdfJk24V5i5qdl3g2V2ffAc9KeSB52bwTLl+GhUhgIbIqzDaFfHkVZA+kc+1zIdkReh9N00t0gyrioM1k5J/pTT4wEHgvHfNM3CugFLhN2VbH9nzWicSt4wgO9vo8gKsZu367HRusxq1tRpjjdXjo1h1LxD/pv/xUTUl+zUcltwCHx664O2aylB4C1jJH0Vc6+CHAxSogkYYwTLA25H3qwiJCybliy+lTAR1Oom0q4qaIjgOUqfz1Bdd3RD7oRVYiDteZpjO6DR8JQ3BAKLLbET7AfPNdb0sXkur0PKzIK8JXb1DaVBkL7FDGk8SvNsT1Uyu3hhoiKy4gHF31AftP5Pons/2u6n96ojSlcItHB3BkGKAtxh053rourVx2YZlKZLOrNfiY/p/jNdwB/kv07VEj16LkNlT6++D6gNREqPh5nri2PrXQkSebo4xgt/0E2yJvUaNhOeRaYPCzJOfM/1Wnc5G29VmfZkFHQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(8676002)(26005)(8936002)(186003)(4326008)(55016002)(9686003)(508600001)(2906002)(66476007)(66556008)(38100700002)(66946007)(66446008)(83380400001)(76116006)(54906003)(64756008)(5660300002)(122000001)(316002)(110136005)(33656002)(6506007)(38070700005)(7696005)(55236004)(86362001)(52536014);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1873
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	212f9985-1cb9-4e21-ede6-08d98422e985
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XC+VcC+1B19gHENuzVuxzh2jPhSQjbdqkJ+aG4r49aLx5IRVarw3loQFtHa6+HweVFYcwjNF1sal+cvpQAJGVzA1mnYtAEheqPcEjY1xtuTfuixSRxba8YU+VJARDZVaLM6Io+z2iOvsoR4ns5xnGOKp6vODpDnP9FPQEadKZFrW9d6jwxbJCtCPnwjtMKNDSX+sr+VjFGjM3x39i1VvKNnYRloFIgPT3r8FHVzZQTkQ+FwkSwY2MEXgtObZsUG6OrFXUuex3NpohIQ/H1TV7MtTUT9+ZfJapR4bcVzdsDPLL8ba3M6m2aKc9D8j91X9jNCNOCrWwP8JOUryYXvUJnutS/GqoiUMxwddzGYjeoQT2JVgDdiSzvLTbsQuPxt+v6BYk96CM7qiY1obMggBx1rjHh7GZo/OSpNY9j43ngbSuy72mbZRRCl//Q7O349IB94icDJ5lSf6dHyBAG+3y8Iy17Zfx602GoQaZh/Qd+zSalzYojfkoaJGb9dijOKSBLz50sqAloyqez/xQU73a7EO+L3VsRTsDbeU7GtASfcD5AOhu51xTBWYrvUyWtde6k8LPVBMSFcXtejzQ1dIWn4hRWgbmBk86VTp3ZOo0/3ZigvNRBZNljpk7BEiAALVxsMkyQU6Wnr3m+koIHMSx1Af4bl2DImZ6e53pCbcKAIUSG7XrpLTjM7YjDIIpx/oJEN8UPBiRyZEfxbd0qH1Og==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(26005)(6506007)(8676002)(54906003)(83380400001)(7696005)(52536014)(2906002)(81166007)(70586007)(70206006)(356005)(9686003)(4326008)(86362001)(33656002)(8936002)(36860700001)(508600001)(110136005)(5660300002)(316002)(186003)(336012)(55016002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 14:59:47.2594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9d4658-89d0-4432-013c-08d98422f203
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3336
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-virtualization@lists.yoctoproject.org <meta-
>virtualization@lists.yoctoproject.org> On Behalf Of luca fancellu via
>lists.yoctoproject.org
>Sent: 30 September 2021 15:54
>To: meta-virtualization@lists.yoctoproject.org
>Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>Subject: [meta-virtualization] [PATCH 1/2] xen, rpi4: Fix syntax in linux-=
yocto
>bbappend
>
>Syntax conversion for bbappend linux-yocto_5.10 and linux-yocto-dev inside
>the raspberrypi dynamic layer.
>
>Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>


Reviewed-by: Diego Sueiro <diego.sueiro@arm.com>

>---
> .../recipes-kernel/linux/linux-yocto-dev.bbappend           | 6 +++---
> .../recipes-kernel/linux/linux-yocto_5.10.bbappend          | 6 +++---
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-
>dev.bbappend b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-
>yocto-dev.bbappend
>index 8381e44..5f43052 100644
>--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-
>dev.bbappend
>+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto-dev.bb
>+++ append
>@@ -1,8 +1,8 @@
> # For a Xen-enabled distro on the Raspberry Pi, override the contents of
>cmdline.txt  # with Xen-on-ARM-specific command line options
>
>-KBRANCH_raspberrypi4-64 ?=3D "standard/bcm-2xxx-rpi"
>-KMACHINE_raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
>-COMPATIBLE_MACHINE_raspberrypi4-64 =3D "(raspberrypi4-64)"
>+KBRANCH:raspberrypi4-64 ?=3D "standard/bcm-2xxx-rpi"
>+KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
>+COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
>
> require linux-yocto_xen-rpi.inc
>diff --git a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-
>yocto_5.10.bbappend b/dynamic-layers/raspberrypi/recipes-
>kernel/linux/linux-yocto_5.10.bbappend
>index af92493..f279ef7 100644
>--- a/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-
>yocto_5.10.bbappend
>+++ b/dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.10.b
>+++ bappend
>@@ -1,6 +1,6 @@
> # Enable use of the linux-yocto 5.10 kernel for the Raspberry Pi 4
>-KBRANCH_raspberrypi4-64 ?=3D "v5.10/standard/bcm-2xxx-rpi"
>-KMACHINE_raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
>-COMPATIBLE_MACHINE_raspberrypi4-64 =3D "(raspberrypi4-64)"
>+KBRANCH:raspberrypi4-64 ?=3D "v5.10/standard/bcm-2xxx-rpi"
>+KMACHINE:raspberrypi4-64 ?=3D "bcm-2xxx-rpi4"
>+COMPATIBLE_MACHINE:raspberrypi4-64 =3D "(raspberrypi4-64)"
>
> require linux-yocto_xen-rpi.inc
>--
>2.17.1

