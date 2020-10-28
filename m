Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.64])
 by mx.groups.io with SMTP id smtpd.web12.5880.1603875122815431005
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 01:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=brRgYHo2;
 spf=pass (domain: arm.com, ip: 40.107.0.64, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg7SQjjPte+AqkQi/sSX9dysekpYEma58aXmA7O6rxA=;
 b=brRgYHo2lTqXFEO6vHQxq4ozbPWmn5Oqt97fHAFtkH0Ef9Vp0bGERHVGR35tbUsEkw1ydAP7Ic0ndLduZs6ugs94cG/BPT60wgMo6WFxCKu13NvaOu80JXd/EVyPv0TZYB2zkiMq/ZrsgivrpaDqf3Z1CbkRyA4qDEZy27UQ+1E=
Received: from AM6P195CA0026.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::39)
 by AM8PR08MB5604.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 08:52:00 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::18) by AM6P195CA0026.outlook.office365.com
 (2603:10a6:209:81::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Wed, 28 Oct 2020 08:52:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Wed, 28 Oct 2020 08:51:59 +0000
Received: ("Tessian outbound c579d876a324:v64"); Wed, 28 Oct 2020 08:51:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56e58d6fc2a731ee
X-CR-MTA-TID: 64aa7808
Received: from 77e1c48efbc6.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 44D1FAD6-6748-4343-BD42-02FEFAE4A48E.1;
	Wed, 28 Oct 2020 08:51:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77e1c48efbc6.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Oct 2020 08:51:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oX6S10RFTAk2Gy/bdzCM4H87lqoE8iUhP+bHeB/sDwqunid/q6D+5kQzi0PONTq5Nk8wTrKQGLoH/2CkavbO/cwYB9sVyzQl5vI5Q6on4Qy4VRmGTZNPZXBLXP6Of5rYm1tAcPzQl/WcKy18TLQEdi2pSkwRcwjxYJVHRUwtN/pU1DZC3+hPlAsKm0LImiW6aiDg2egN0w+fKNE8KagqM+4KOT+92tj/p+PGUm1vAHy4A9gk3yBKX+QH3TOJBZVuaW/oX6rvCX4XYb8fP7YpLgrzvfFpdNk5O+mUW6AOoAV1LoceNRU7gl8+PDEJByYTyBARWKY2A98D9UFb10JbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg7SQjjPte+AqkQi/sSX9dysekpYEma58aXmA7O6rxA=;
 b=Ovs3QlyLYobhzm6mhbNsScYK9FS+lp/yepp+tAT3RuDOIEkUhIJ7M62zCT+tUQFRTqO2Bu01EsV3NsfcMe40b3wPvUpMbLxoQJuoflLBnpaP0kGAgmudCRbQwKcmcLqFvUXEQbg78V+Hz2s+ykKZW2uwYj63B6ZIS/gO7n/SpJB2sX2qeqY4VjM9R7VgkbduX8rnrYdin1k4i3fncCPHsB+AaifmlQPSxFx6fbWqk+OejW/3WnhVfrsv0/k5Mrmu8QIgTIDUUoPpB9jojeVyvt9z046+tpFzDgLrkapTyZozOPzs7Alqvgo53pJ+li2eXKdD0d8MM89XyCCGSrSAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg7SQjjPte+AqkQi/sSX9dysekpYEma58aXmA7O6rxA=;
 b=brRgYHo2lTqXFEO6vHQxq4ozbPWmn5Oqt97fHAFtkH0Ef9Vp0bGERHVGR35tbUsEkw1ydAP7Ic0ndLduZs6ugs94cG/BPT60wgMo6WFxCKu13NvaOu80JXd/EVyPv0TZYB2zkiMq/ZrsgivrpaDqf3Z1CbkRyA4qDEZy27UQ+1E=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6236.eurprd08.prod.outlook.com (2603:10a6:10:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 08:51:52 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::cf6:86:f034:aec4%6]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 08:51:52 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Diego Sueiro <Diego.Sueiro@arm.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Subject: Re: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
Thread-Topic: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
Thread-Index: AQHWrHn5J+GVb/uyRUu7rArkPAqVXamstjOA
Date: Wed, 28 Oct 2020 08:51:51 +0000
Message-ID: <DD82EF8E-8C4D-467C-B6FE-5B0CBB482E34@arm.com>
References: <20201027155536.12513-1-diego.sueiro@arm.com>
 <20201027155536.12513-2-diego.sueiro@arm.com>
In-Reply-To: <20201027155536.12513-2-diego.sueiro@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e70be3c7-78cc-4f21-39bb-08d87b1ebb7f
x-ms-traffictypediagnostic: DBBPR08MB6236:|AM8PR08MB5604:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB5604A7ABC5BFEF2F862513F09D170@AM8PR08MB5604.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:494;OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gFMXHzDmGdesaI9iJL5YfdtPM+C9U81RnxAm1mfKEaYws6w7eF9EX1XSxoyQuZHmMWLT8Uzpj4NFerwxfyW+3cglFE8ze1AKBY+sTAbu7zKEFv8MgZzY7Ufn3iz0t7aLY3x7QU2CvAwN1SFPVGImY7LpxZkU5UmTj/Ga5yA6t9YZzhetbDenaZFbADN51cGTmb1Tn5qedECJLiqQNTB+DnBUDcqvmlspSvbEZXn0N5zK7Kley1M0FuDpHOFF6TTjQ3et/gtKHaOHGZKZhaRPLHWTIaUdSbMYAJ7PMHyVFR1UDSL8YHHLBfh6BsiFhrw8iMNIb6Uzbq84kYXCFdPVArlOlJHYu7PUs5Jay5BmmS76L4omUcUmIITiwoW/XYX694DKgCZkmlIpdwfY1xjkhw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(5660300002)(6862004)(71200400001)(33656002)(8676002)(37006003)(53546011)(6636002)(966005)(4326008)(8936002)(64756008)(86362001)(6486002)(66446008)(54906003)(6512007)(66476007)(76116006)(316002)(66556008)(91956017)(83380400001)(66946007)(26005)(478600001)(6506007)(2616005)(36756003)(186003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 J3xhVnBuKHBNoczaZXO6N8uj4+n4j+DfleWYfjvo6CM/katI1sFP5cdAi2jgNIc4IQ9G52Kz9nH6sunEMzzUcwJhwfVnM1koQH1+tVkx42hFHb8Bz2eeWb0MzqESzC9fXytkLGlZAT3GJ3bucqDJg4JRHu+rs+oNrpEpCaCzNPLuiKOXPxRBukbELvMIRU3CAs3xWK6Nyq2Sx32UDcDlnE9mlJPELbak8/3YZwIQaBkwOKBqKLd1OL4Ql9ubeYMYKEPfY8+jPRbtsQzS6tns5xfqACx2e2v76IQWe1FCALYXcP1ic8tOATW0QQPklKAx5K93E4djnoaKCmFeCQoOGYOLoX9fGsZofAOaGhHSphlcv2xm9RjVO2f91nLbQVYQAugoeC7vVU+5/vjpBNyJ+Cs3VfVwqYJr0sWIWaTA2WA5aE0VChz5y3Cqd0fDZGOSjH/9Mt4lAr0AhX1CDHFbtNs1ZfT57ajyG5Q5xt/8kFfcWu5RQ8wxj4ZN++tm0FkWXA8iwNDhPjw3A1JHKGRDDcKIpfL0Q/+LA4g1Ow6Uvdwl+CETDTdByBGQCf4vkCttP58HM7/ho64SfRFn5QI0exn8bYcGRQWcfCM8btrkvS90bssJv9QQWThd9o/5jdJUv467Bq8s0mcZLZLRJBKlSQ==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6236
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e3b7b115-08a6-440c-b1c5-08d87b1eb6f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rhFEoV+CIC1vLK9JQr+6/y001IBKCytWOgBhWUlth85/T7XoZhbNhWItbyGbmxrSnYUNaE9VS0iVW8hgrtBqAocEL7ANBS6HJoKb2jYetE7jXYyXJq1QT4BykIKZGUHnmAvy75tU++0NX/Ua+S8exSC7goQq3EhYhG3U+NuM+USySwCBWWYv7yf6Qx35fMM3s9tHC4eidOHIHMOmjJIJANfNx4wShHZIJU7tw4cAur8YvfBjm9c+hRdXbCfijHRRQuNhpaIYO4u1aihQo3R6GxczL7G5vSfDhTBm6i8epn8+16lRbQVV7Y2kKHZ8/kOVNTr3sH4PTHXYmjM+tG6722+pypKPF9vujehA3WlZLMDtR/xV7MkobIl+1jpDpl3R8C41Bv4jCyCDMpm/D4aIVWgqo6BjH8GwJmCpvV8DtDcfMgVxszOwWq84UrpUeEwo2bl/fXihPgUydteEfVf7K2/k0Iu8irTIHNARf2ebtxI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(336012)(83380400001)(54906003)(6636002)(37006003)(186003)(36756003)(81166007)(36906005)(2616005)(70206006)(316002)(5660300002)(70586007)(8936002)(82740400003)(8676002)(33656002)(47076004)(82310400003)(356005)(26005)(2906002)(966005)(53546011)(6486002)(4326008)(86362001)(6512007)(6506007)(107886003)(6862004)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 08:51:59.6788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e70be3c7-78cc-4f21-39bb-08d87b1ebb7f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5604
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <088F6FFAF2A6134384C0C56FD03E35E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi,

> On 27 Oct 2020, at 15:55, Diego Sueiro via lists.yoctoproject.org <diego=
.sueiro=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> The do_install task also ships files to /boot and /usr/lib64. Hence, ext=
end
> SYSROOT_DIRS to include these paths.
>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen-hypervisor.inc | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/=
xen/xen-hypervisor.inc
> index 6a75d16..916bd3c 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -55,6 +55,8 @@ do_compile() {
> do_install() {
>     oe_runmake DESTDIR=3D"${D}" install-xen
> }
> +# The do_install also ships files in /boot and /usr/lib64
> +SYSROOT_DIRS +=3D "/boot ${exec_prefix}/lib64"
>=20
> do_deploy() {
>     install -d ${DEPLOYDIR}
> --=20
> 2.17.1
>=20
>=20
>=20
>=20

