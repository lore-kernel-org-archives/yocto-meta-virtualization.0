Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.55])
 by mx.groups.io with SMTP id smtpd.web09.12056.1638969049888012124
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 05:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NRap8HXn;
 spf=pass (domain: arm.com, ip: 40.107.13.55, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yzi0JgcQAkILe8xtM3sZr4P22Q/kVO7gpkJfK9m+74=;
 b=NRap8HXnZpW6VWnQ73pgY2DZdQu9W/8Y6bWYaUyUL94EoO38SP3gdnBQKFXVAsCrtSd2hWhIScG0HoROT9nEwX7UjSLX8wu25UnkfiF2DHew29jh/y0ipIz00beyf+MCl0nUP7v1wK2E/5cBi25ld/51A+CTpbAZARUiRjgh8W8=
Received: from AS8PR04CA0041.eurprd04.prod.outlook.com (2603:10a6:20b:312::16)
 by AS8PR08MB6421.eurprd08.prod.outlook.com (2603:10a6:20b:31c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Wed, 8 Dec
 2021 13:10:47 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::f9) by AS8PR04CA0041.outlook.office365.com
 (2603:10a6:20b:312::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Wed, 8 Dec 2021 13:10:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 8 Dec 2021 13:10:46 +0000
Received: ("Tessian outbound 157533e214a9:v110"); Wed, 08 Dec 2021 13:10:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: efd4a5511d99cadf
X-CR-MTA-TID: 64aa7808
Received: from dc592b848eb6.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 46CC1DCF-CFF9-4CC3-853D-5545129EF315.1;
	Wed, 08 Dec 2021 13:10:39 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc592b848eb6.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 08 Dec 2021 13:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZxq2fQh4g6WfzoOGMkfHtAS29T3b72GDJV1X8mlfr2JWKQ38l7wjZ/mhURWps+g4P5z6Gm8+4cDKyNj8iq8f0KR+39gjhQqZ2qyyQQRhtNm5OsIJPT8TW+yb4lSfueFAzEdRAOsjxU57G/JmUWzAAe+cI8nOezDqpK+1NsJLheYbxCRFixKFQHsRMhyN96lsI+LCtu1dcsZsJRkY6QcpdiSWlOphPxi4YZU6IYBpBXz+NmQtSJfxlcDnWxqybzXbg12dIqL+UgMarcOi2kNKRsppsV6Qv+iAjGlPtAT+MowbcxhaTlEKI0keS584LPJqEOeVe1BVTDjDYSuhEU7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yzi0JgcQAkILe8xtM3sZr4P22Q/kVO7gpkJfK9m+74=;
 b=SJmy2NcNpS7bW6gPDzI6+A4URtNIH79kZj98wAza/CsrWox0pgJ9lZrIw7AZBP32kNWXnU8jRWD4+qIVQot7VromTaIN6rx+djLAdneIt7I0hMtTxxEsCMic0FH3wndYFr6V/MAjuDKwZU0lwq59w3SjCcyJlledIxCrG8n7TN/N70SubIbB49j0DKN2OLw99AXd3C+mw3cr1HHLYR9v6VnPJsQz5vaUM7xek2Xt37/nKMTKYWNWUkl9pHfDKTXpARfm8rQqVg+LYJpFIRH3Z1HTe6FXOqp5LDsfBNAB2Vufs5rIIZJx//Zbu3ilbG1Qz50RyZEBYPMylcyn0q9HPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yzi0JgcQAkILe8xtM3sZr4P22Q/kVO7gpkJfK9m+74=;
 b=NRap8HXnZpW6VWnQ73pgY2DZdQu9W/8Y6bWYaUyUL94EoO38SP3gdnBQKFXVAsCrtSd2hWhIScG0HoROT9nEwX7UjSLX8wu25UnkfiF2DHew29jh/y0ipIz00beyf+MCl0nUP7v1wK2E/5cBi25ld/51A+CTpbAZARUiRjgh8W8=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB5220.eurprd08.prod.outlook.com (2603:10a6:20b:c3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 8 Dec
 2021 13:10:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4778.012; Wed, 8 Dec 2021
 13:10:38 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: =?iso-8859-2?Q?Kamil_Dzie=BFyk?= <Kamil.Dziezyk@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization][PATCH 2/3] xen: Clear TUNE_CCARGS for Xen build for aarch64 machines
Thread-Topic: [meta-virtualization][PATCH 2/3] xen: Clear TUNE_CCARGS for Xen
 build for aarch64 machines
Thread-Index: AQHX7CDuYXKHK4ltJkS6DsKAgyor4awokbmA
Date: Wed, 8 Dec 2021 13:10:37 +0000
Message-ID: <FACFF13B-0192-4895-B9C7-24EB7C9BFAF3@arm.com>
References: <20211208104458.28009-1-kamil.dziezyk@arm.com>
 <20211208104458.28009-2-kamil.dziezyk@arm.com>
In-Reply-To: <20211208104458.28009-2-kamil.dziezyk@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 68bddda5-4003-466b-1e79-08d9ba4c261d
x-ms-traffictypediagnostic: 
	AM6PR08MB5220:EE_|AM5EUR03FT025:EE_|AS8PR08MB6421:EE_
X-Microsoft-Antispam-PRVS: 
	<AS8PR08MB6421F1298323036CCC9394129D6F9@AS8PR08MB6421.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0E+d3DVx4828QI1FrNXguZC5FjjS1ded0yKJDlGQ0xtyJttj5JV8+WhXtSAO1k3Wr65N5n7IPoe++EBefrKQCRFbsR6+R/N/mxjLFO/82xCsDrAjIwrNvEBf8EyZlNzFluROQhQpB2JizA+cb8b4U18xM3Um03IoQHmXKw5fi2fiRBDmu56WlUmw906IPVShf1VCyFZVnqQ0SYe3U9znagK99QAmILoqYA+yza7LeIqIAsZYvB4h7to80GrDVLVBcT3oYpyxSAeTw5xy2xvcYYXjo2C4MLzaPwB5RVV3IaxVr8xfA+oT8iz7iWX68CtDgGCBMfzXh1Ya6xcrpG5H+xrVYNSt7ktij/yhCFdmouh9eVtAaqoeNY0zjzOl/4w/UFdkVtK6AAy8uLrNfRsmj4Io5+WS+f4FH+5THY+LbuiJBFB1D5kGhNWtUhSi0dFnXJxu/t5EvGd/mDPsNuQyr8H/367vLfe2od61M57/kjJIoR7Wh6DW7oTQ2KjBlwJTMsQt8TOVkEJd0But3YiPvNjSxXnIZbxRHUjjCY0AfQqINoeCya2Yt35zpXtenvxuttWv5wl24DgyW/TzOKi0uAdtn1hx8Vi9McYTSSr1eehN9M5I3gVP06Uww+zcrwLOltjqvWcG1U9rmWSzilTlRD7jy3kY2qxh9PSPx6AzjpFJ/HuTtptdIqRNUNYuLsPX4IhjphDyy860KkH0FoPIrXXYJtkg2x00/oelwYPqwEAU5PNa4g60T0rgpNpbCOkJica8YCMBQZhdtDSxsaajbmxbxO3edj+k+Z/Csz66Qj/nETiBLuc5B8a8v3oJeMIQTL33QXeWWrU1JkSqqX/DFxqwzcNLapl1znLxVL0TPTM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(508600001)(6636002)(53546011)(6506007)(2616005)(86362001)(2906002)(316002)(5660300002)(966005)(54906003)(122000001)(71200400001)(66556008)(37006003)(64756008)(66476007)(66446008)(8676002)(8936002)(83380400001)(6486002)(38070700005)(76116006)(6862004)(66946007)(36756003)(4326008)(91956017)(33656002)(186003)(38100700002)(26005)(45980500001);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5220
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35c15c8f-f239-4593-d794-08d9ba4c20ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Pi3xuwmRwIOeHqvg/gMmdsW7CQhbG9qArpbWnoynFBSpl6gqdmRGGWPYZWTZWTnMb4StcwOXTd9hzt3el87+KnuPOxdigeHINcnjFur14bYozUccC4uDXSpJybprPtoQ+WMOs8it7rA27ar6oHi2a+cxlQDWqQ5oMRyuGpT+9UkQ9kvKdJusxlESuJjuKH9vB3XsrUGfLNRTNqt+El8w2Fx0lQFlfCYnt+rzo+r4YgG9c61ZmAKIRbq3grFlOj86j9KmYLt5csq+XBefqin7kV7WN+GJb2mL+dDTTJSK2/wWwGYecGCHfItjew+y5LgBlEO0QU9Dj+qyNgC8ahCDHLJIJXMb1GB1O5CK00laiRqRLJBCh8d51gDmQxwJTQ+N1CAJw2oQPNJYy741rb6dNcyY3rsXivb1zZWabVPEuitf1qe9iRVex7hUs/D8M8PdjS4Cek7MGrbVCY9z5EX9yFUl9pPcS17+2Dp7Xco3nkY6P80t3Z7I1TVK5S8mWVvraLmbCkeaDT+NkdMtr8D68U7MCQ3soOisyVPQ4gvn7KLRL2o+yPvvMsybfpuLQ2+REwtH8XCvski7D3K6Jxq6VtO8X84gR/jKMJMAOeIwt00UZZzzsCM62+I435utnqs5K4WfUEVRW01RD3YtuYj01hbs8+ofv3WKP0Bo4+/RfyFhpicauePj0ZMexrjBQjKHidJ8Z3VJ2wLam/3iu1Z20AAOdTQqfeuIpDCBUvH5ai9KSSLMud8zxYD0Q0hqdXwNJI34EWloi5Zkrg8jvjdyzsfeuFmwhkdzUDfQ+/lGgK8RaFTz79ow22I8gPksOL1HUIckglDaOjupKlApMaCn8Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(81166007)(33656002)(86362001)(36756003)(70206006)(356005)(2616005)(6512007)(186003)(6506007)(82310400004)(53546011)(4326008)(36860700001)(6486002)(6636002)(26005)(336012)(2906002)(5660300002)(54906003)(316002)(37006003)(508600001)(6862004)(83380400001)(966005)(8936002)(8676002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 13:10:46.8734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bddda5-4003-466b-1e79-08d9ba4c261d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6421
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <0989A9609EADF04B9324603E44B6DA77@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

> On 8 Dec 2021, at 10:44, Kamil Dziezyk via lists.yoctoproject.org <kamil.=
dziezyk=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> Xen build may fail for arm machines that have enabled extra flags,
> that can be enabled only for specific architecture version, e.g. armv8-2a=
.
>=20
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen.inc | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index d3c7a7d..9ac82ef 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -102,6 +102,11 @@ EXTRA_CFLAGS_XEN_CORE=3D"${DEBUG_PREFIX_MAP}"
> #   EXTRA_CFLAGS_XEN_TOOLS: so clear TUNE_CCARGS on x86 to prevent that.
> TUNE_CCARGS:x86-64=3D""
>=20
> +# - The Xen build for aarch64 systems with HVM-mode enabled may include
> +#   architecture specific flags '-march=3D*' which causes build failure,=
 so clear
> +#   TUNE_CCARGS on aarch64 to prevent that.
> +TUNE_CCARGS:aarch64=3D""
> +
> # - Yocto supplies the _FORTIFY_SOURCE flag via CC/CPP/CXX but then passe=
s the
> #   optimization -O via C*FLAGS which is problematic when the CFLAGS are =
cleared
> #   within the build because compilation fails with the compiler stating
> --=20
> 2.17.1
>=20
>=20
>=20
>=20

