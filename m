Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.71])
 by mx.groups.io with SMTP id smtpd.web11.4747.1618480508796179094
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1FERpPcm;
 spf=pass (domain: arm.com, ip: 40.107.8.71, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZJVnnGDsHCziNeqV4jN/5CyM+kQDa+XfAhz/0qx9OU=;
 b=1FERpPcmIZM6HON9ELWonYG3S3X8rafO/BOuEi56AO3sBrxZSH8ybW48ikIooJtS2tLgQrqWxLeH5TkVtEq0Tl2zLfSpzZpHNnG4LZaxZeogbQKSiVfYdhWMeCbrThBu6wxFWg/B+G/rGWIIroo6sENwPdoPNsM6GtBqfmV6bno=
Received: from AM0PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:208:fa::24)
 by DB8PR08MB5290.eurprd08.prod.outlook.com (2603:10a6:10:a5::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 09:55:05 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:fa:cafe::4d) by AM0PR06CA0083.outlook.office365.com
 (2603:10a6:208:fa::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 09:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 09:55:04 +0000
Received: ("Tessian outbound b610e7b4d771:v90"); Thu, 15 Apr 2021 09:55:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b858bdfa7208dc2
X-CR-MTA-TID: 64aa7808
Received: from d7fc73fc0d59.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 91D11805-0157-45D0-A431-C94B5811F93D.1;
	Thu, 15 Apr 2021 09:54:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7fc73fc0d59.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Apr 2021 09:54:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuU4jOP6C/10w2/hZOjL9zQqeQoeMpQXE9gpyRsW285GEkvOLc1Vhuu6slGzQ2osyuGn1knnP5pxM5BrnoZfRBNleeVoCPshSlVt5QCeR9rM7W0mHm8kAga+JNHgIyIvyLn//XJW68uRFdHcAHwGSQ6/BrUDMLpYc7JBqwPSnvhxqQO2PwwI3sxq7ncfqd9r6kk/zlaVhvAsMMVJG28f3n1EnIKBDgRtcsxKHYnqjkwCEUOtUkw9YpFOJHLVqvGRxR86nnKmq2QF1Gr9vhdsWZI2FZj9tZKzSTptjarUCopoB9C0G6qoEowS/0CTireo7kltDo2V9gQortLYtUf9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZJVnnGDsHCziNeqV4jN/5CyM+kQDa+XfAhz/0qx9OU=;
 b=DrBBO93BnDExLy3/F+GPr42oQ/BUfDlSMlXztpV2hwnqQ/APSiLodSMJRMyuSlL4mW15TajTVt657tVd3UShnLmtSr4W19D2AE3YexKvC1voQS8GbomrD866QQM46wjjWKuBaUDuBVWwvjkfUAgZyWzBshDEZH2Apya3HrYuNkgpiJv667HGzt5sLfjXvGNjuHYbHDnkaqbyVfksOENBd+WZmRTI8EPE5sHhHLEFxRxAZW7JIXlcpE9JqZXE+LMghUeb7vm+MXESy+TzBmxecU2V6fGbPeNIRliGJeRfeEJzeQ2FTLlf0VxD0vISMm07zTgB1KeANYD0oBRYJfqGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZJVnnGDsHCziNeqV4jN/5CyM+kQDa+XfAhz/0qx9OU=;
 b=1FERpPcmIZM6HON9ELWonYG3S3X8rafO/BOuEi56AO3sBrxZSH8ybW48ikIooJtS2tLgQrqWxLeH5TkVtEq0Tl2zLfSpzZpHNnG4LZaxZeogbQKSiVfYdhWMeCbrThBu6wxFWg/B+G/rGWIIroo6sENwPdoPNsM6GtBqfmV6bno=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB2927.eurprd08.prod.outlook.com (2603:10a6:802:21::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 09:54:53 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 09:54:53 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, Doug Goldstein
	<cardoe@gentoo.org>, Bruce Ashfield <bruce.ashfield@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH v2 5/6] xtf: introduce recipe for the Xen Test Framework
Thread-Topic: [meta-virtualization][PATCH v2 5/6] xtf: introduce recipe for
 the Xen Test Framework
Thread-Index: AQHXMYeNvDGiaX+MRkCH7KkFB8mdqKq1V7SA
Date: Thu, 15 Apr 2021 09:54:53 +0000
Message-ID: <E3CF93DD-2B94-4E4F-970D-EA2F818EFD31@arm.com>
References: <20210414233924.55589-1-christopher.w.clark@gmail.com>
 <20210414233924.55589-5-christopher.w.clark@gmail.com>
In-Reply-To: <20210414233924.55589-5-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d9d98e4e-3bac-4e54-0644-08d8fff48b64
x-ms-traffictypediagnostic: VI1PR08MB2927:|DB8PR08MB5290:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5290C77C9852D17E2DA9DEF79D4D9@DB8PR08MB5290.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hrU+ik+TgByjU3qCcVE9ZMXtafMGs0HhNgKwAsEbXWt/K28v+Aroi/zsRzgk8XAQbxvqwLuU/7gNEcqIvJ3CJp+Akacmyz817Z2CfcwDxk7a9k8wFxf0/bNFlyWhZ5ZRmoTli0jyiHDtWeLOY9RRbSmlMLBENB3kHU0m2hW0c8OnAkAgu31lQkmGQnBqSEWECKaQ+lZ/ZmpEVJsi1KBT1l3RxWwzyF0a2URlfe3FcxNC4vji3UNb0xoEYWFJACLv1fB7PbKB+XL7nLxvvaTTtevsI6jPFuePzRJLHnc5MkByJfAy7D0zkeImEZJS0rSYtqMKMdFcsr27s+K9iZh/pfMMMimGcVjYyOtXe5QpXS1I0TJRjo/D+xp0eMuuJIdCvXobmHDAN0/L0JwqA+x4mLokEJLyVAv5+ku3YU7zuZER52epxiq5Tyf8DMxQ+lDeFZOC59zvxtbi3D+aDxOctEeeE7pcxUZFnyDW5dWc/oKz6JXzklFtSt2b35seNN1gwfaKdSRET9pttsbslDhXpKyWaRp/2TiAsFpYecL4mAc5/HeYKeE8jhlrpr1qNxBa3YDpDkg5/ENkc9EaAzl5Fgln59VcvUL6xMbE6gLI244skJaSFsAk1e/zurJonJj+rwuzeGnfj5tecOvP3IoRTgVOeDq3RslRS7RIDpxvMKprVFWG+i/xA/kxXQRg/wcwlCSp71gAIYkUNrq+4gSH3SOL9gxzT5NFBCKY22mOsIg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(86362001)(5660300002)(76116006)(2616005)(91956017)(8936002)(71200400001)(54906003)(8676002)(26005)(4326008)(6506007)(53546011)(2906002)(66556008)(186003)(33656002)(122000001)(478600001)(83380400001)(6486002)(6512007)(6916009)(966005)(66946007)(64756008)(316002)(66446008)(36756003)(66476007)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?PiTGagPE8rkwvJP0VpD72CaTeX3IIr98gnDxPigDPmV6BNvyJQOmztYZ/h0v?=
 =?us-ascii?Q?H74+bPTuhgGcKzn97v5eWyyrqkcXwehkbU02rszL7C8og9FnmOAM65UQe0gk?=
 =?us-ascii?Q?OxCeSSuIsPoPux65kXZwMDqMacIBQd0vqimvNIV7AhurlO1E+pGjHkresPnh?=
 =?us-ascii?Q?Y15ueiZ0WUG3Z+OANgqIW+W7/UNo7dIoQiWCbaylQYj/ta+LmUNw6gGo8QW3?=
 =?us-ascii?Q?vChqdOCU6BSfCtjN6oxsrgp/ZzKM4F4b0kB8Kj3RcAaOErhPFapd/UNYKjbr?=
 =?us-ascii?Q?QSoTFpShYZwGG8j9ec1bBabpqgyDrHRQi1rGsmqz7CXIHiM0f5TQ/b+Znk17?=
 =?us-ascii?Q?zz0kQOACFTFUnVPVG35Hx7f/8v+PsikSReHA5vl0tfecAaUFtS3pAIW4ic8C?=
 =?us-ascii?Q?SQbLdXUj1+loLe9sqS6upXmoYa8cGoRsEMPHEq/g8C7CB/OZcJKsdPEu7UWe?=
 =?us-ascii?Q?SarGe4SSnP5XASNJjh0CkTeDXVfHwd+cTwRVHiPRCv/TfZaSNbedF7/RYRaG?=
 =?us-ascii?Q?u8/2xYL6NXkwZFH1gGaXUSQAcA9UZoMKntb3XNetSKBFHIJS2pqffji8az5a?=
 =?us-ascii?Q?l1fQv11PMM/gb6ITrJikFn3jS4KvDYRqZPIdIKR1zg6cEdN1Nrh35wJz59kb?=
 =?us-ascii?Q?4pb+K6dBPNhhMCdchoiT/6t/QoIW6R8uDfCEDmhBCL4MQFJRJsv1qh5Niw0G?=
 =?us-ascii?Q?J1TTN2eVCl+VTo3TDwBeStyEsPugROEt7vX/dTWZTyL1EWIXg+JcETiFJ77k?=
 =?us-ascii?Q?rC9sThjvUpvVleufxmakeCvbG70MFZiu1YK/rK+rge+1+JcGL6HArPzxAzFZ?=
 =?us-ascii?Q?ihr+dx2uR8T8BTZe9DvZrRlaoihGjJLMU/JqBOzeWDMwQtaCG9dEBcMjWXTK?=
 =?us-ascii?Q?jGtcASTndqmovERMws26av4S64cd2YtYeyzN1YBfCmWV72vxz/94C3Jep3t5?=
 =?us-ascii?Q?QKMiTnoLboY7LVGW9NhtuM6pUolK7tOurefAv+DwW6RqhM8aEj+LDwrh363k?=
 =?us-ascii?Q?QyFbojaWXZBwYkLhUfY0TQ7HUBtvugFOdPidxMwz6igruQKaxYcUbaJHTABI?=
 =?us-ascii?Q?I0wn+aRi0Y5x9iECp2Pzrt3gDtJHnCNBdSbVURxLLTMWazUDdjoYm9ATZVYO?=
 =?us-ascii?Q?cCQGGnrvI3I4CUv1BvuRdulMXwtfMODVuoCNjSnMlK/VmOfez2oQscdqRpth?=
 =?us-ascii?Q?XwazLpRG2CSYpF4aX+1WkFDzUiWe5F333cY4hjMsaSfCsmn9WmAubI8PcbV1?=
 =?us-ascii?Q?xpA/HlcgQ8HSEEajafk6vmEm9Z975xhB4tky0IkhLTLMMzU7iCyRnn+AVUG3?=
 =?us-ascii?Q?jA6RBuoDajcoojL5RvOfpgwZS1GwFhj1I/yjHnB8MekRPA=3D=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2927
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b73f748e-acbc-495a-03a0-08d8fff484bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tsKJPMWQnESSM5pZA5RNrhIaRjLui84j+TmS0tcx9l+rHM538NvOASjLnn1+5RwgSjdpqcKlecGUP93sUR/I8bdCQY4SPEow2JbecBiG2L/bBImayR8KuQKFLJpsuLAiDQ5CfK8iCWYqouDaE1S31ID2vIAwYXqZrLO2iSW6AtX0ZIX9Jjp2wwCl7cv0Y8fMRNN/P7rE3WCI/mOI5SIE3kn7IfJvcCfgNcfazuhDYagQ7G4K4ziA9uhYaigdcOrnYruSRLTPPvPMSO1UDIZZktqA9eiwBtVnwPdFR4MpCcnEbZk0hLCEENbM6qzLXaupIfKx/yLAttc/Q4KtwM0dRIkd2+Ax80qE7bp8PMIpdTs/7yjRap76fFX3xwC5OAPzXq2Pd93IOLs3zhTIImyNcSDVUPQKtJttAt6sx2ezr3QNRBhqW00+l5uQbOTQyCtOS4MikUIrdh+xdy7GnbWKu+2mEadFDxInCsw+kvAeNV6r0z9sUBtDxsPsROAcdmoB3A//uea4BNGpLaJaewqWWqNPMICOCMMYjuFjaKIhZVdZ207o5NXoJz7ARO1zFghyq967g11DTFp4qr5awOg3bTwqUmE6XgxKUNryYKpER1e3Yj5W1s/aqpeaOQxK6C6FAKY6+1Yjt2LCULJcdvzyD47plDhmg8Af4r4qDb2BxYKePjeUt8bQf7vmc7SqP4XxaRSzTpzg8VVD/BrE8OTauPO+U+h4JCxC/mKG68jsfD8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(36840700001)(46966006)(5660300002)(6506007)(6862004)(86362001)(336012)(8936002)(70206006)(26005)(70586007)(966005)(8676002)(4326008)(36756003)(82310400003)(356005)(54906003)(478600001)(2616005)(6512007)(36860700001)(33656002)(83380400001)(2906002)(47076005)(186003)(6486002)(316002)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 09:55:04.7996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d98e4e-3bac-4e54-0644-08d8fff48b64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5290
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <61F88CA0543A3A4A9C7645A31C8A6825@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 15 Apr 2021, at 00:39, Christopher Clark via lists.yoctoproject.org <=
christopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

All is now building properly on my side :-)

Cheers
Bertrand

> ---
> recipes-extended/xen/xtf_git.bb | 72 +++++++++++++++++++++++++++++++++
> 1 file changed, 72 insertions(+)
> create mode 100644 recipes-extended/xen/xtf_git.bb
>=20
> diff --git a/recipes-extended/xen/xtf_git.bb b/recipes-extended/xen/xtf_=
git.bb
> new file mode 100644
> index 0000000..db08643
> --- /dev/null
> +++ b/recipes-extended/xen/xtf_git.bb
> @@ -0,0 +1,72 @@
> +SUMMARY =3D "Xen Test Framework"
> +HOMEPAGE =3D "https://xenbits.xenproject.org/docs/xtf/"
> +LICENSE =3D "BSD-2-Clause"
> +
> +# For additional reference on XTF, please see:
> +# https://static.sched.com/hosted_files/xendeveloperanddesignsummit2017=
/79/xtf.pdf
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
> +    # packaging: rpmbuild can package the XTF test unikernels when they=
 are
> +    # installed as non-executable files (they are run within VMs anyway=
).
> +    oe_runmake install DESTDIR=3D"${D}" \
> +                       xtfdir=3D"${libexecdir}/${BPN}" \
> +                       PYTHON=3D"${PYTHON}" \
> +                       INSTALL_PROGRAM=3D"install -m 644 -p"
> +    install -m 755 -p "${B}/xtf-runner" "${D}${libexecdir}/${BPN}/xtf-r=
unner"
> +}
> +
> +INSANE_SKIP =3D "arch"
> +# xen-tools-xl is a runtime but not build time dependency
> +INSANE_SKIP_${PN} =3D "build-deps"
> +INHIBIT_PACKAGE_STRIP =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> --=20
> 2.25.1
>=20
>=20
>=20
>=20

