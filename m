Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C715C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 07:41:43 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.82])
 by mx.groups.io with SMTP id smtpd.web11.21046.1664955695566127117
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 00:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=xGc5/mBV;
 spf=pass (domain: arm.com, ip: 40.107.2.82,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UBYYTsFxJjJE21TSaeuKSodXNv9ZfRjGPn8kGJO+KHJ+9VZicMuZYp5liWVZuqP0KgLj6KVCHICV4UHbDOdLd2Na48fGIDJ1RJ+TLM7EREq4UvnSnpWcxH3PcApCvU91wLTYeDaU8UTCQn9hUJL8IA39gRy1yAGkYTbE5+bg1PQ08eK+AqdIkTH5i9q9D7ILS80ssEXLwmqaDljSlF4R8J5zY9bCx5JJJMxb0jtS7meqDGLoaUnsOOFDmI5T4/+O/JaXtFXE+3otuEKWN1Rwftwq1trYpmJ+9Jjv+lX8YXxwcdH+Dsy4mHGNN3rf0ltJHGb+XfksvR69N55X07cXdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBVKKMc5A+ZakwiHWMJgx1PPd1gZCNbU+86h1pAWfsg=;
 b=knhV4+WTkiwX8v9YPFbkMKygSEFpO8upm0wkP4syQbGK/mTvDr+YHChO1SCL2axFhwvFk8Boj8DvuCfC3aTFRX3+tmCHC44mgLwdzMdfy191roN9eS/bkMEwybULubH9oAUlCyW5+ytlcwQBn9+9sPOcOcR7r9QLk4Z8jbr3C+K6E0umHHg2c4aEJrS9HZNxFTjLU8nal6BcZ+0OQhxcorr3bn3gTGVqm+2BGdZtpB+85vIKTdjE0RW33aqKIa2s3Alk8lLcJSb7+uOcLhmBQBm3dzhmt4MqghFICvCz9lp2PxMCA561CFgPDQ8yY5xY35f6SFDLlnxtQ9noHQPY8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBVKKMc5A+ZakwiHWMJgx1PPd1gZCNbU+86h1pAWfsg=;
 b=xGc5/mBVCr2upykTWrNLLNLiMewnsbFpQP0gMHkFfXgwLFOlut4a0vt4BLHmc/TJZVAyQIxoo1zyFvYM47XQZ+7c7AIgSEJWvQnm0vXQ5Ja3pDtpWS4NDZanKhVv2ESLcIkmFII6V8QEzEasp3em7+mvhe1Zd9t4J13Nyd+QmQA=
Received: from DB8P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::34)
 by GV2PR08MB8629.eurprd08.prod.outlook.com (2603:10a6:150:b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Wed, 5 Oct
 2022 07:41:29 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::ac) by DB8P191CA0024.outlook.office365.com
 (2603:10a6:10:130::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.29 via Frontend
 Transport; Wed, 5 Oct 2022 07:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 07:41:28 +0000
Received: ("Tessian outbound 99ee3885c6d5:v128");
 Wed, 05 Oct 2022 07:41:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d6fe1cd57d80df5
X-CR-MTA-TID: 64aa7808
Received: from 9b3892be594c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06C5E288-1B3B-4B82-B911-5A5951E0CEDB.1;
	Wed, 05 Oct 2022 07:41:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 9b3892be594c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 05 Oct 2022 07:41:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXh7EY/MnKQ7YZbzcjt0KdT4NozLx1B39CviX70wP810dXNJFvdpDcuh4n4PoS8bo4k8z3g8BLxaQneABRK+Sq38OVIGHBKFmb9+MUfzs9TnrwQiKCUt6e4NF3pwnx2hzyilFmXRGQ74A53WCBWV9N3sUYBhjY+PiZtlJyq8aIuFgpJKrqmRFMC2qFYUwCQbPMnA91ewrOsLMVT5dH8groew4HgyxwJYfr3KWaxP0N774A/z/4x2k/8c59VNCuALTTYnOdx5Idhn0qMWPKnz6swvWUlOgAYWFb++qudDhmCEPMoa4Ym+WFCf0NyBdTRhZxKdlC4gmZ65fFfEn60KUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBVKKMc5A+ZakwiHWMJgx1PPd1gZCNbU+86h1pAWfsg=;
 b=ElYsLdVgJY1oeyltp+mSkqJIWRoqk1uJMYYTiHe3/fkiPWEmhiLamT9LCsWSPON1Q3xE7vA+1alf9g6Jma+bUL87Cvdn0m4CWc872OBlvOdwhvuyQq8Rb7c73iOu1pnqSRDXpo89XKjR/LVYveEEkp3dK5K+SzQGu3tmT95xBmqekMFSLxTbblMkcry9SOp/wBXNdr1VD0Vv8nlK4BRz4Ju1DykzmSZzjsQB2IdsbAbUuAGiQXXdywwGvJvJcs0wxpXTKT/PqSWOba091wRXBqm25Khqzg4GydZksb8zOo9PbfVF6a6nZjdwlFD79dFQqGS/g8BN4m2Y8P1xJPDNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBVKKMc5A+ZakwiHWMJgx1PPd1gZCNbU+86h1pAWfsg=;
 b=xGc5/mBVCr2upykTWrNLLNLiMewnsbFpQP0gMHkFfXgwLFOlut4a0vt4BLHmc/TJZVAyQIxoo1zyFvYM47XQZ+7c7AIgSEJWvQnm0vXQ5Ja3pDtpWS4NDZanKhVv2ESLcIkmFII6V8QEzEasp3em7+mvhe1Zd9t4J13Nyd+QmQA=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9331.eurprd08.prod.outlook.com (2603:10a6:102:303::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Wed, 5 Oct
 2022 07:41:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 07:41:20 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization][PATCH 2/2] xen, xen-tools: remove the
 version 4.15 recipes
Thread-Topic: [meta-virtualization][PATCH 2/2] xen, xen-tools: remove the
 version 4.15 recipes
Thread-Index: AQHY2CoPOA1L97/2hEmLTU0rtvqhD63/a2KA
Date: Wed, 5 Oct 2022 07:41:20 +0000
Message-ID: <A3C72C00-FB07-4222-AD50-AA60F51C39D5@arm.com>
References: <20221004194629.50511-1-christopher.w.clark@gmail.com>
 <20221004194629.50511-2-christopher.w.clark@gmail.com>
In-Reply-To: <20221004194629.50511-2-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB3784:EE_|PAVPR08MB9331:EE_|DBAEUR03FT020:EE_|GV2PR08MB8629:EE_
X-MS-Office365-Filtering-Correlation-Id: eadf7bea-47ad-4cf1-9f43-08daa6a503c2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 8C5uRzsrPU4wNvaSvBFpBFnGEAVI2/wx8RuFpBpYCIIITQa0g0WKIbXY+xRwUbQc+V+jtJgIwz30qREYUaTOV15NGQN4NTA/R80Zzh1thMCNSyHc//LWhAopjixnfW5q+dZVt1sVeMVSwu6Vvh265lBdRTLasGaYs9vHCnB21MA+12EjfU5uBsoF/C42BKNErPDNNdymmRIgGHAO/wO+7kTYj629nGCaDDT02xrGdbOW+NsWB8Ph3KroE1FThex0EUIAF/bdC9RH4K1Sr9VAZoDxQUw6kWvLFkI3TAamIzWN/Z1Tcq9DqKw/I9lsW4E1ZVC0GmuqZDh/rL82y3h98pKvtL5eksmIhvpM4z8ZLCbBdYypwNQQHGRL+rnh3oTVPJG5VrYrftqMaMiuZeIgyvq0uXOjLDQLvTewHEwkQeJcfmfBQNeRIzYyMGlPcsASyshiFJSxkTFn0vqWg4SXuam7BEefghuZdaHGq1PA/CQAZsfAjAMXi44uwcO5wNlEYyJNGc6Ywn3WwnH6LdGJGvdcJ164Yi2y9oZElnLTBYidGPDD/HF0sSFYU+oInkr8qW4tTSQBOzArfZYwOyIVs5HuzYw+DmWSyPySS5fhQRgZROWSeTwUjWQtPuNb/xnN/ugwW/Y9E6kL/8t02AFw2HzHpGPj/fz8tUTYjJ1xoBknSDgZDIdTRp3hX0H/SjjcYRq+y1KeJVCjx6XcDMfbK4lqMXlL8E11U5LdYK5ct5ZLjVmKQSIirjw8GwIwWuAyHk3Vu6IiiwCmIvOPnaIyyFLMJF1nnabgTuWodSVU174=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199015)(186003)(83380400001)(2616005)(38100700002)(122000001)(38070700005)(41300700001)(2906002)(8936002)(5660300002)(478600001)(6506007)(6486002)(6512007)(26005)(53546011)(8676002)(64756008)(91956017)(66556008)(66446008)(66946007)(4326008)(66476007)(316002)(71200400001)(76116006)(6916009)(36756003)(33656002)(54906003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0642A838DF42714FB54CE92F5090FB35@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9331
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3af4ce1f-5a27-4250-470e-08daa6a4fecd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NlzrP3ozA3+YVsqYMNY+ia+9TDHPifYYfuGNORwICxMSmNoXPnQuvJ9rW6xAL/NzCUVg4YmIfXpkZ5hctP5eKexhxAvfX/ZU0E8V0SdX5Tep0bJeQDophlQpje3fWhAGKInb9WtQVKlDw48mIrIdwZkwY8dcAGGxd4zHaWORqBRlAVdUAMK0z41UCArYIJFfwajEfE98Qhras36HSbRJ/eserXQbFZsO5ZdgtZr8k22kwEABgSW+7U5o8m9jtiQzsPKO889RQgcV5YTZIGYIdnnWNQnDVqbiAkatgeEQP5eeRpQr4AZ0NVsesUtlTqWT8+nBt9I46bPVcTaZnmgUjeV1XWnrHj9qRXF91TikiwLZAob03kF6Lm+/1E1UBm+FcXH/rTfDzyR2luogLE6WcbEL2X2tvJQ5JHJPayra6wI+8Dt0hoWiIR63Chmp4xpEL7G6K03G94Z6uT7UoyJEbMAmubkKw2MLx9itmG07GIN+/XAOJwtkri3PbKkzbDbWpg1pqT2UZm7svwkBAI3zGqS5dveqRr1cZrY5Nh0Um2wDxAfYYrgBgnf1ndD9HdwbIP02XuW9R1/PvyvZLaW8HhAWsTtfl4coJQVZcoxT+uuKNGHcmuedxqBe5Og4HJeHvKXgtlLyuQdBzD8C+1Zw7Iavx+KtnjcO+NRU0rbXUX9ZG/hq/XvZx9T2F9hOahUKyO4eGUH3Os/4n/pRfZITOQ2HEZa2+CvdhFRqMNpNEkfp3snXv3KHZmxfL6KuvCR9f280qnSnadShUkc2iCzFng==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(6486002)(86362001)(6862004)(36756003)(82310400005)(54906003)(8936002)(478600001)(41300700001)(316002)(5660300002)(8676002)(107886003)(70586007)(33656002)(36860700001)(70206006)(4326008)(356005)(82740400003)(40480700001)(40460700003)(186003)(6512007)(81166007)(26005)(47076005)(53546011)(83380400001)(336012)(6506007)(2616005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 07:41:28.9247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eadf7bea-47ad-4cf1-9f43-08daa6a503c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8629
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Oct 2022 07:41:43 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7645

Hi Christopher,

> On 4 Oct 2022, at 21:46, Christopher Clark <christopher.w.clark@gmail.com=
> wrote:
>=20
> The existing 4.16 recipes are the current preferred Xen version, so
> per the Xen version update policy, the 4.15 recipes can now be removed.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
> recipes-extended/xen/xen-tools_4.15.bb | 19 -------------------
> recipes-extended/xen/xen_4.15.bb       | 19 -------------------
> 2 files changed, 38 deletions(-)
> delete mode 100644 recipes-extended/xen/xen-tools_4.15.bb
> delete mode 100644 recipes-extended/xen/xen_4.15.bb
>=20
> diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xe=
n/xen-tools_4.15.bb
> deleted file mode 100644
> index 5592dd7..0000000
> --- a/recipes-extended/xen/xen-tools_4.15.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# xen 4.15.2 release sha
> -SRCREV ?=3D "32dcef072fb37d432fd45c7916383472f3fcbc5e"
> -
> -XEN_REL ?=3D "4.15"
> -XEN_BRANCH ?=3D "stable-${XEN_REL}"
> -
> -SRC_URI =3D " \
> -    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> -    "
> -
> -LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> -
> -PV =3D "${XEN_REL}+stable${SRCPV}"
> -
> -S =3D "${WORKDIR}/git"
> -
> -require xen.inc
> -require xen-tools.inc
> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_=
4.15.bb
> deleted file mode 100644
> index 41023b2..0000000
> --- a/recipes-extended/xen/xen_4.15.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# xen 4.15.2 release sha
> -SRCREV ?=3D "32dcef072fb37d432fd45c7916383472f3fcbc5e"
> -
> -XEN_REL ?=3D "4.15"
> -XEN_BRANCH ?=3D "stable-${XEN_REL}"
> -
> -SRC_URI =3D " \
> -    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> -    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-loca=
tion.patch \
> -    "
> -
> -LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338e44=
a4e5"
> -
> -PV =3D "${XEN_REL}+stable${SRCPV}"
> -
> -S =3D "${WORKDIR}/git"
> -
> -require xen.inc
> -require xen-hypervisor.inc
> --=20
> 2.25.1
>=20


