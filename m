Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B7DCCA47F
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:28:49 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.47])
 by mx.groups.io with SMTP id smtpd.web10.9825.1657636126588998757
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Jul 2022 07:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ud59XP1X;
 spf=pass (domain: arm.com, ip: 40.107.20.47,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=H/x6NSsde4JdxMKMaxf3Vg2lEXWmBBndwExWccH4FBv8+9V0hgM9pq85o2pfebq1OatxEyIG3O6W6euJo/IcCYGYmikA4qu3Hv4tOors1rEew9411cSt+ry7nnhF1sIQtI8bCeQqno+k0SPfWasP8vucn8YwS50X6aJ7XVwWMcQS9P22CPuWf1QEikXyF5GloWV8I1eHfCArGM2fjQ4daIUv/QclVKy2g2th52zjMGG8R+ebkRpZmDAoQ42s77alnhgvVPtzSG80rANtUuck2+zaVDCUiWtXn+1trFHlZpTkqfqTB01QvLsx/3RhTw5sOZCSU1Dz+M9fBbwXtzcRKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHUuOPqY0BlitpdSMuJPx44PEMwTbhuzl6hy2a6eQxQ=;
 b=M7eyqqkhOHfINkny1wj0zhv24BDzZxltpS9rUofBEsG0+W2QPWz5hhqwR0PUH81s1WYktgUPR1vBjXL312G1SPYZ/87abu93OGCkjLorBdZvr9zmKiX+HdR750c1Icni1H70xHQiC/BUhdJ3YISzNQGn2GMAOgLuUIpVoShAUZn8koKM6DDDQIrFPJJwB2XRIkW1Kx084Cz6E4baHcClY2HY2G87XWYrN/B4hjzXTYM1+iNFeLkiBB/2M16uZzM12zURQhIcc4QnF/NctzMHlOHVGCCxUYIjSqSeV/LDxT0lci+iBlDc5BmIbcD71VfQt5oXuMjieaKHQIRHmGr6qQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHUuOPqY0BlitpdSMuJPx44PEMwTbhuzl6hy2a6eQxQ=;
 b=ud59XP1XL+CQIef0pe9DQhc7Nn41/V3YRAD1TVJHiNDsUjjQo4fiH3hJS/0/thVbo4/78N7zKlAJMK7F6HiS2xJVm7eMjBaemf5y6t79/GzFEljNm+fAwZDyQi9aqtYiHiB4COD9Q1QLmWcFY4xflO9+ljn/RF3XGds1TZK7ZTw=
Received: from DB6P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::24) by
 AM0PR08MB4980.eurprd08.prod.outlook.com (2603:10a6:208:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17; Tue, 12 Jul
 2022 14:28:41 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::88) by DB6P191CA0014.outlook.office365.com
 (2603:10a6:6:28::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Tue, 12 Jul 2022 14:28:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 14:28:41 +0000
Received: ("Tessian outbound afad550a20c6:v122");
 Tue, 12 Jul 2022 14:28:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe5431d2e0764845
X-CR-MTA-TID: 64aa7808
Received: from e797ff359126.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F0F40975-2FCB-4066-9F54-0076A100925A.1;
	Tue, 12 Jul 2022 14:28:33 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 e797ff359126.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Jul 2022 14:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7GZ9Rrzm6DpvXPa4I+JJgbUlK2MjxRxOOuC/airTEOKdTB993BbbxlNtKImnkJddGdBfe9Uc5Uwert4r1w/Slf/lmdfbYj6CaAX+NrsxJc+uySOJB9GG81mDfhxS8L4anudOWGdUeMmCuMkwz/LLrQR9qENpW6vfJYzvkKgaIXKLoxJyPk6znhUOMm7McJ1+pk3hfLDD9jZ1/R9nGD85CJYzxNkhIhAzFW6PHrPInWSTicHLZpCUbzyt0Me7r8uYVJQoy8yrtab7w2sQOUUHz1tfZbQ+ymCl97dco7EkTlHVHSLXISxYt1CM3kL6pDeTYfn8PUtMMk9SXORNOwTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHUuOPqY0BlitpdSMuJPx44PEMwTbhuzl6hy2a6eQxQ=;
 b=BP4vNC5rbXOqh02fXzjuaLKQBLqeW+hC114WyRV7+YfQcueWGGKBpEmX8tQOTqsxvVedkD+Pf0KI54apzg0fuXliS3YvTK3XQXJhDCO7qqJmlFZDiwi27KYaw6awHgv6jCWUnSvNEdx/ryVe0Cc04GCz9HIFYvACnEqqQW2wmtSqB6bcJ5VzvjduOs/wlCwiqWGF82WwmFjJ6nWhwF+DjA3XTUFgp1V6XXHq6H/2SXzWl/w6h5f5BLJPYVq6ULxfoYQB9XRnoXu2eO5lZNfgvLGBTY2RkHbyoTE3gwgkFBX/kD3P+Ff0I44uJpgI3kFUgViXm/KuEQsnH5syalQ2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHUuOPqY0BlitpdSMuJPx44PEMwTbhuzl6hy2a6eQxQ=;
 b=ud59XP1XL+CQIef0pe9DQhc7Nn41/V3YRAD1TVJHiNDsUjjQo4fiH3hJS/0/thVbo4/78N7zKlAJMK7F6HiS2xJVm7eMjBaemf5y6t79/GzFEljNm+fAwZDyQi9aqtYiHiB4COD9Q1QLmWcFY4xflO9+ljn/RF3XGds1TZK7ZTw=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB5971.eurprd08.prod.outlook.com (2603:10a6:20b:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Tue, 12 Jul
 2022 14:28:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 14:28:32 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "cardoe@cardoe.com"
	<cardoe@cardoe.com>
Subject: Re: [meta-virtualization][PATCH] xen, xen-tools: pass prefix maps to
 fix buildpaths reproducible build issues
Thread-Topic: [meta-virtualization][PATCH] xen, xen-tools: pass prefix maps to
 fix buildpaths reproducible build issues
Thread-Index: AQHYlB/q/eEG3WiWS0iJn4PDRQzEQq16zxGA
Date: Tue, 12 Jul 2022 14:28:32 +0000
Message-ID: <5DF4C582-1126-4727-9E5D-A6E3987BBFFE@arm.com>
References: <20220710054216.40558-1-christopher.w.clark@gmail.com>
In-Reply-To: <20220710054216.40558-1-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2d0302c4-2051-4fae-c55d-08da6412d16d
x-ms-traffictypediagnostic: 
	AM9PR08MB5971:EE_|DBAEUR03FT052:EE_|AM0PR08MB4980:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aFNqa/KY6YRuLp8RM4fXOuwaY6cv5wzr42ya3RjzMRdLZ/0nLUANX8NYMGmiaeZ5+M/Z03sY4lZtlw0mpsYSj2Y872DdxRYlnVqhAs3snpdUAJt9XLR48U6NyDASuJdC5Qhg2gXxV+VwzHL1WAaCr0Zn2s/6fWNSv6MZwIprW8fVKSGZvrx323EFQvYy83tfW1fHhObbv2V6JTW32oEfD4j5FHGJlk5XGRzM6Aos/uuxgwKEB1xe9pbhVfgTTp/msomiuiTTl5x4VoyjBIvXk9H2QL6XWuiB9JSMs2LwKPmoB4b0CgsEWigVAY7GmBBg3kCxnViL8I8hJJYwI1/RBCcu7xHg5thvpSJS8XqXEhmPlDySLf7cKMdVQCnxNJHTcBiaV2lC3ezqie3WAUmSB4WvR/pRT0to49ke4SFJQNrixor4qqP8flbZlAKi3XaGqFhoU9xEiCFdsQhAPnbUdWS+S/xak/QdJojMPJsIF6rLQrPEP6neJZwre6EgZH4qqASZ9nxiMURTLGiCNYjKHPXYIeQbPucUV2gqBVULyDGyYE0kHzk9DPyIFlz+nqI4MsodfA90EAJLQwooDp4UrPpp9RVk+pnNBX1rH2DQKRSdeZA8akR6kICbW9NnkpzgeWMStw7L5ymzXrgsYuuDbvhIqEiwhAtRIdvJ/wMewf8vTCtuuP6e3i0nns/waviBNEkdOH7opCv9gXPC3FirWmjtGL5gRhi5rpJ4Xc/piJ1DUCxuH+zx23oIW6KzSZeRKUZY7UU/XHp/pDQRZH9cD2Dqln8BGHsF//i/lZA1NrthWcTJOY7TAckxSR1POfoRporLg5EiFxhjPOqYX398PaVaP0gPH8T7NGOZnaJ76ik=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(66556008)(91956017)(122000001)(64756008)(66476007)(83380400001)(8676002)(76116006)(66446008)(66946007)(8936002)(38100700002)(186003)(2616005)(86362001)(4326008)(2906002)(5660300002)(6486002)(6506007)(316002)(53546011)(6916009)(54906003)(41300700001)(26005)(33656002)(6512007)(36756003)(38070700005)(478600001)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E5C50B548799C43AC151838C3597A51@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5971
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9ac0cf1e-d4c3-4197-9f54-08da6412cc12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MEPxj90BPI0G7HIRsGf1WVQ2hLSGjh88NNtF0rr9wwQG191eVwcfIfId9A/3GGOnEPfZR5YzQzowdQL96f7tYh2u6oxoRPfYhUWQSnljyh2qf1tJE26/ImoD2QiT2l3MsDnLGmwsTcxXrPaV42O6YBsjoD35yk9L5XXmpfKzz9P8R/c7k5U2MIxiWHo/XUH6TGvWuzLy+65ukJqmkorWbvfj1ZoFrZvjbKbtFMY8PHWXpb+QaCN9vOaGSV1REkpOPdWyvR7qn6G2fiW//1f5xCGYFYtUZrMhewJKHGr/ePnWF3LfH8+Y4AI+HvUrhubAIPtNg9eZu2FLeSupGrf/oPEk8eBhy8fVZyne69ykp2CW+3x3puE7+HtRRIfT2rrp2yhbiKwvBGLu4RP0mp/7dxXCzSr1OlC7aWlgMQUkpKlrFWUNvrmRtCupFeXUKhWoYF2yegKQiZxF+ZCuLSLSKEDIIfnjmVLG3i5HN3RuN+HI33WS5JfbeYBRPhBh1OS9EU9aRf9FuHwuxhXj05eeoAEfholpBvcafq84JGTsvvyorpLoBQQh5d3vr/9loa+4iA1XtKBNxIOpH1upwTW68iZnCz9zGcejfYoaNpJC8UsQBHfOklJUZmFoFSvyZMFuDzU8jhR8RAKuktZ+XB0/g/B8oNd61IlhFVq+sGW8bP/vr1rYxEIVHP99yRA5reCJAJguquSJnJpmjlIPuYl6InxOqnYRS67CeJrlBsyAzetJsRdMZPyQ5iV/wz1+N+PwlViEgQ/Ptlol4M/AfvR1txEBuk1n2XemLFX3N5mys6Hcd7fee+nGQy4sMFOgpWq6
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(40470700004)(36840700001)(41300700001)(2906002)(81166007)(6512007)(316002)(6506007)(26005)(53546011)(83380400001)(356005)(82310400005)(82740400003)(36860700001)(40480700001)(107886003)(2616005)(47076005)(8676002)(86362001)(5660300002)(70206006)(186003)(4326008)(6862004)(8936002)(6486002)(33656002)(478600001)(336012)(36756003)(70586007)(40460700003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:28:41.2167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2d0302c4-2051-4fae-c55d-08da6412d16d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4980
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Jul 2022 14:28:49 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7449

Hi Christopher,

> On 10 Jul 2022, at 06:42, Christopher Clark <christopher.w.clark@gmail.co=
m> wrote:
>=20
> To fix warnings when the buildpaths QA test is enabled, pass the file
> and debug prefix map options that were previously supplied only for
> reproducible builds, adding them to the DEBUG_PREFIX_MAP variable
> and supplying that to CC.
>=20
> Testing indicates that passing the prefix maps needs to be via CC
> rather than the EXTRA_CFLAGS_XEN_CORE/TOOLS variables.
>=20
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Also I applied this in kirkstone and did a build and run on arm64, arm32 an=
d x86 with success so:
Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> recipes-extended/xen/xen.inc | 21 ++++++++++-----------
> 1 file changed, 10 insertions(+), 11 deletions(-)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index ed6e6a7..2bbf1e3 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -88,12 +88,13 @@ export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> # overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: unr=
ecognized option '-Wl,-O1'"
> export LDFLAGS=3D""
>=20
> -# Pass through the Yocto distro compiler flags via the Xen-provided vari=
ables.
> -# Special handling:
> -# - The Yocto distro compiler flags are typically set to be appropriate =
for
> -#   user-space software rather than for generation of a hypervisor binar=
y, so
> -#   only pass the debug prefix map to the hypervisor build:
> -EXTRA_CFLAGS_XEN_CORE=3D"${DEBUG_PREFIX_MAP}"
> +# No additional C flags for the main hypervisor build
> +EXTRA_CFLAGS_XEN_CORE ?=3D ""
> +# Add prefix maps to support buildpaths QA test and reproducibility
> +DEBUG_PREFIX_MAP:append =3D " \
> +    -ffile-prefix-map=3D${S}=3D${PN}-source \
> +    -fdebug-prefix-map=3D${WORKDIR}=3D${PN} \
> +    "
>=20
> # - The Xen tools build for x86 systems with HVM-mode enabled includes hv=
mloader
> #   which fails to build when "-m64" is included in flags set via the
> @@ -109,11 +110,11 @@ TUNE_CCARGS:x86-64=3D""
> #   It must not be compiled with SSE compiler options enabled and the Xen=
 build
> #   explicitly clears CFLAGS to ensure that, so such options must not be =
passed
> #   in via the tool variable. hvmloader is required to run HVM-mode guest=
 VMs.
> -CC=3D"${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${CC_REPRODUCIBLE_=
OPTIONS}"
> +CC=3D"${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP=
} ${CC_REPRODUCIBLE_OPTIONS}"
> EXTRA_CFLAGS_XEN_TOOLS=3D"${HOST_CC_ARCH} ${CFLAGS}"
> # 32-bit ARM needs the TUNE_CCARGS component of HOST_CC_ARCH to be passed
> # in CC to ensure that configure can compile binaries for the right arch.
> -CC:arm=3D"${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS}=
 ${CC_REPRODUCIBLE_OPTIONS}"
> +CC:arm=3D"${CCACHE}${HOST_PREFIX}gcc ${TUNE_CCARGS} ${TOOLCHAIN_OPTIONS}=
 ${DEBUG_PREFIX_MAP} ${CC_REPRODUCIBLE_OPTIONS}"
>=20
> # There are no Xen-provided variables for C++, so append to the tool vari=
ables:
> CPP:append =3D " ${CPPFLAGS}"
> @@ -158,9 +159,7 @@ EXTRA_OEMAKE +=3D "${@['', 'XEN_WHOAMI=3D${PF} XEN_DO=
MAIN=3D${DISTRO} XEN_BUILD_HOST=3D$
>                     [d.getVar('BUILD_REPRODUCIBLE_BINARIES') =3D=3D '1']}=
${@get_build_time_vars(d)}"
>=20
> # Improve build reproducibility: compiler flags to remove filesystem diff=
erences.
> -CC_REPRODUCIBLE_OPTIONS =3D "${@['', '-gno-record-gcc-switches ' + \
> -                                   '-ffile-prefix-map=3D${S}=3D${PN}-sou=
rce ' + \
> -                                   '-fdebug-prefix-map=3D${WORKDIR}=3D${=
PN}'] \
> +CC_REPRODUCIBLE_OPTIONS =3D "${@['', '-gno-record-gcc-switches'] \
>                              [d.getVar('BUILD_REPRODUCIBLE_BINARIES') =3D=
=3D '1']}"
>=20
> # check for XSM in package config to allow XSM_ENABLE to be set
> --=20
> 2.25.1
>=20


