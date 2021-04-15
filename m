Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web09.6701.1618492553974405163
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 06:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xinw8IQR;
 spf=pass (domain: arm.com, ip: 40.107.20.65, mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4PbhSw93Doo3qigtlXEJhf/DMatpfQG8VhRciNXQm4=;
 b=xinw8IQRDXj5BQWHW0B2lIYfgMuHQPTd3KVPUEslzaOtA179WPBEgb9u+Ift4oilf0cfagv0FCiT+5/nJ/FwLs2tIYr1+rzSww+QzqYomxb9UVOXTIIpAoAID232LPs+QWwQeXUyHRI3H3UXoxSRsSa1WRyFwRH5zYjJHIJLHVQ=
Received: from MR1P264CA0017.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2e::22)
 by VI1PR0802MB2399.eurprd08.prod.outlook.com (2603:10a6:800:bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:15:51 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:2e:cafe::e6) by MR1P264CA0017.outlook.office365.com
 (2603:10a6:501:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Thu, 15 Apr 2021 13:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:15:50 +0000
Received: ("Tessian outbound 82c2d58b350b:v90"); Thu, 15 Apr 2021 13:15:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cfac48ce70cceabc
X-CR-MTA-TID: 64aa7808
Received: from 05047885a351.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E4767F62-AA4B-480F-90DD-742570FCF39C.1;
	Thu, 15 Apr 2021 13:15:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 05047885a351.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Apr 2021 13:15:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLB1KJ/aic/OrMALGyr1uiAmijXnDALgCk9gbGndYm2xDco+ur90o+hLjr+m9fJmyC3N+wyK4ns6DLsWt2fVJxZq0y6KhXW/rCSNoyKypa0/9HtR9r/1R64PkcwSx3O+uTe2y2OkapQWFgUoHITB1qCa2pQge1VIjxvsUlDiSCS3AbGTbbJ+Gx2YmHegaWHLBo6ETnmYtgtzV2rnUGg8TbgjYIP2CGaCjACYmDEtYc3S+28/AMf+naCRYQiqrmiOEA7IT2HGFxsC1DYX0WAtnySPYkAM/SeraPzCuDQRb2xMUUibNhjHvs1v7F/R1f6T3/wyx5ffExnHTHVITV22HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4PbhSw93Doo3qigtlXEJhf/DMatpfQG8VhRciNXQm4=;
 b=l1dD368VJE/CXQ93dZ+hPyJxcg7BCDUcn8sl1pGNn1o8l4CfwABbVDFzS87r/uu53AnG0jXEK5y/yvX/RD3hCa4rCTolnQ6zAlSqTb42ptRfE7lB5jlR/lDHYax2NOXi4AHLvUyQ3nCRBMMWm/1ecLyjspupvg9UB63k2Z/puEYB6NqinQXew38fr3mA6c0b5BAx1UTIX7P5iyx64ZbkEGgqkByyg3Hock2gtpPn90DKwuPi9FbBJWYt+D2CrTLDEHwIrhKcnwfnFpnZmZemsOLX5AiKrNcyRtmf77VEFmhAB/AiLP7TxS5HDi/tIIvqDjWyLeQDXak01dKHVhs11Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4PbhSw93Doo3qigtlXEJhf/DMatpfQG8VhRciNXQm4=;
 b=xinw8IQRDXj5BQWHW0B2lIYfgMuHQPTd3KVPUEslzaOtA179WPBEgb9u+Ift4oilf0cfagv0FCiT+5/nJ/FwLs2tIYr1+rzSww+QzqYomxb9UVOXTIIpAoAID232LPs+QWwQeXUyHRI3H3UXoxSRsSa1WRyFwRH5zYjJHIJLHVQ=
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5584.eurprd08.prod.outlook.com (2603:10a6:800:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Thu, 15 Apr
 2021 13:15:39 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.4020.023; Thu, 15 Apr 2021
 13:15:38 +0000
From: "Bertrand Marquis" <bertrand.marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Nathan Dunne <Nathan.Dunne@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH v2 2/2] podman: Added kernel modules for iptables error
Thread-Topic: [meta-virtualization] [PATCH v2 2/2] podman: Added kernel
 modules for iptables error
Thread-Index: AQHXMdKiv3GzEUN0C0GeiQ0RouDiTqq1hMWAgAAKcAA=
Date: Thu, 15 Apr 2021 13:15:38 +0000
Message-ID: <66E0682B-FC2A-4BC9-B971-C0670A760951@arm.com>
References: <20210415083718.19954-1-nathan.dunne@arm.com>
 <20210415083718.19954-2-nathan.dunne@arm.com>
 <CADkTA4Oj4xJ0Cwo5kGEBxB_1pMJuQK51o7e0xcKkybni4F0HZw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Oj4xJ0Cwo5kGEBxB_1pMJuQK51o7e0xcKkybni4F0HZw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [154.57.226.134]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4a3aa1fd-be2e-4109-5b4f-08d900109728
x-ms-traffictypediagnostic: VE1PR08MB5584:|VI1PR0802MB2399:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB239984A208411EF263C428779D4D9@VI1PR0802MB2399.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:283;OLM:283;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 374UFPBBOTDU3TLehAcNxKiTMl6Zqmrf7XAmN0T/pXH25mkG4fu+CrTA/qWgvsJbRZ+ZF386521Oz1v8gK7IpmZls+IckT3b3DZzq5bDp+fQSoQbG1+6bGl9vFsl4WmqcqlhBS1aMUAUQ+hJNUjEIWADu41OTCGoRuARkKOfVpTFHUipYliwPfEEaQqQN01uH5PXPtOsUNccIfHukBmSJ8Keo01YpnBiQ/tkDOV8M2JU206xOof7TovckByDIZc+c5BG61hcQ7JJKntm+uDMe9opYJk3gxKzqWhBLAxppn5kj654rxkF+EIRESFu6LnJ1blhiWUB9JczfbydpS8LScOYjBNs27qibmKC+lcZuAeZbdjJV2RidVOJ4kbgajfx+AZh6W632XjZOL32+atZ7HKyCatugcaPKPlPlsdAFT+TGfcC7WXW9bJgkbwJrgoZms3/APyY/A1v2zvye4iN6Chxao7vhlsW+8ud98kbclO/uW851X97vW1DPp+3300nh/EElch0FjVIlZs4iMcIovc+B0MNmJtQGMDETNYLLcKZwxBQ0UM7qg14piKupFAdJ9uDSrnBKnJB632GLlS20aSONlC537GObCsgVIYuBVkFKrJPGqQInbY1GtauX/mWU/uR/WwqENuIC6CWbveioV34imZ72fIBYzguEsr6fTh3Fcqoe+XsEgogSFAsyuH4tB6dqbx07DPFxHQpsKGds8AeqxTXwXkE/qIn/ouBIBc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(91956017)(316002)(76116006)(5660300002)(66946007)(186003)(26005)(86362001)(8676002)(64756008)(4326008)(66556008)(66476007)(966005)(6506007)(6486002)(71200400001)(36756003)(53546011)(33656002)(66446008)(122000001)(38100700002)(478600001)(2616005)(83380400001)(6916009)(6512007)(8936002)(2906002)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?9cn72ux1hdOi7WZY1zkIjVZCtPgiI3HM+osuoGRnAGrEra93f/COwytVlgQk?=
 =?us-ascii?Q?ZCdz2XvMpifjRdRAdyeQSBm9C34oxC47xMiQ7gB0Up++e7dRfuAq+4gj6yu5?=
 =?us-ascii?Q?V/tEieHJSBjKy85IPvFPaUQHbXjPrrcVsWgM99GarY1Bn/IVoIMkOMCtXue3?=
 =?us-ascii?Q?nH5s7ezNYjF1SYIzeewsw2l+HssdXcXl3O4IYh3rnZTMohmjAJluxsVm68XM?=
 =?us-ascii?Q?R4If1KKrHyNJGLfZO7++ExxFrpaCtQkNdvcgpBnIwHiHgR1yHwMrAVU/ZGQp?=
 =?us-ascii?Q?CwyCboK1fyTMa9DGfvsdrrh7/R/RnOC6QcTWsn+yiJZa5FQcVAbeYNxIobbM?=
 =?us-ascii?Q?n2Tbcheze8OnMDZpd/cAlxWDSvVtliBqDEieM4dqEpEtJVhzYgUEwVpuCSc7?=
 =?us-ascii?Q?ii06rL6kzqrvAMjIfkJoMQn2EExiNqU+uB6+fmL92S/IaHZb9uQnzfgBvgYR?=
 =?us-ascii?Q?YbPrHAQtdB6p6lX5Le091SjOdGLts/qcfZeGLndSBn26bk0Sg99VXT7VgSUU?=
 =?us-ascii?Q?w5sSlxrNZacdL3yV1sV5d11Hp07pp2uALbkmI1JWSgR7G7XnCV8NfAWnmZTT?=
 =?us-ascii?Q?UXYYsB2LwVjui3L/RP1juE6IfRuBTO9C6yt+g8vjdvW3ysubD1CtSn7cylmS?=
 =?us-ascii?Q?nQC5glRrlslW7v62JQ4/sEpksqYfPmpSiv5DJbuIUhRn3Yv99T18DXnZDjXm?=
 =?us-ascii?Q?yhhNKRqHEFR/DCXm2bvv+OJJt6A/NOAaUn3VR11XgxFt+85wiJ2rPRE3lJ5E?=
 =?us-ascii?Q?Y0d/+i9eR3bjgIZJhFfZPpgBgb6+GjXvKSBhrfs2osO+hYt0omP/ySZJVaTJ?=
 =?us-ascii?Q?unQo7pmMP91H8jNqdprpwbtaXBr572mOsnMBJ/3oTSV2dekcricU8/rbWj3k?=
 =?us-ascii?Q?eVyvlF5LpD8WzisWMiSHUXyBSuxzFgbOmCenbVqbaOYfYSVvMyk3VK3k93VW?=
 =?us-ascii?Q?FFRHHwHTHTTC6eULj0jDxH2yw0bdcSvLkT5/prz8KAY1mOgRLYej1tVog88z?=
 =?us-ascii?Q?47rx4Fnx/yodzRMg8bDp7QjcMj/QNa91vCL/8obzLV55BKZHtPFFVK0A1rVt?=
 =?us-ascii?Q?qp4FayCcXonN6PWPrbdA/f8/yvtzu9NKp+gV4UkWhWFmigNmiq6emphkhEfx?=
 =?us-ascii?Q?eT5DDXsCtkS5QOEcOJsMovvKwxkhhTWTX+fvNfuQu8uB8dRWzDraY3CF3+35?=
 =?us-ascii?Q?keag9BnG5O97KKNI5NfWW5YJ0BJKepLBjM/uuLpd7VTdNiuv7VWtoVmn/QWI?=
 =?us-ascii?Q?6EZvompwbALM6PgMwrv5d+SmsyyVvpw2vvxSJhp31bQyGu3MABFbr7JWsN75?=
 =?us-ascii?Q?imBoR43ddCogUCvmIpmA3YgGQb/8dd1Uc4bUNgj4rh8jIQ=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5584
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Bertrand.Marquis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4db47051-8996-4cba-561d-08d90010904a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HC0QM0cnkUC7nDgh8ndP9uo7Y6eUVBiERcMsRS8zdsOBE91VckvQmpYUN05iLsiEPGafYcisVhiMGBIE2f/rJjiCuSaEi2uBjxIVapi9eGWVsu2mKT/OETATiTES6hLKMl5J+8U0XWPps+tnXjTdYvMjy+FrZW7dEwIcZMlYj1Kmhu9Kdg/5hBjXbfcfCSbCoLP20dYkZRbi+M4CBRfuvzjq64AQFr5mLMSDD74xVotBe9XgVXXqp1a8xhqTFFjQdhJrK7vcvmN6tLIRDnV3kbXpH+V4zPoeZoteUD1tIR33Q704WqeKSDtAg34RLJUcX3cQJN6U+i4kLiJtq76j/Gcrb7z7Z5ASZaKEJKHll/f9EKI+7cdfZoUhKXdRyT5tO+cH/qe/Q8GDt5l3ANKlKoflpfgS4G0BZuUnIzZKRFEwn9UcS7SRDnPMhnJDQ9+FWGm1MaJMaG7vBwcdtK2qSO/6vjBc3TRS5TpDLqZ/74LM+GvrqmwVK19qzohH3/5A430VjqU9kzoCKOANHc45j/DKXvK3L9DvBh1vPAbhgMtm9b330KaBoOCQNYHD0ZNCaIf4XoL5ZArCRxPxmrMPVT+0aeibpaeV9PctdIa9ICZEhxvdHfEhQ68CamVOZCJHmUs0AnP7f4GyeHWSwS3iuLbVOMhRsRcYMTsK5te7RWIrCygO2GbOwr6IjMJuKqcWI42XJmHjulsZxLsSErTKGrTxEAv4AFIA68ZqICvDkSo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(6506007)(5660300002)(53546011)(4326008)(82740400003)(186003)(26005)(33656002)(83380400001)(356005)(81166007)(36860700001)(36756003)(6486002)(82310400003)(336012)(6862004)(478600001)(8936002)(47076005)(2616005)(8676002)(966005)(54906003)(86362001)(2906002)(70586007)(6512007)(70206006)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:15:50.3799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3aa1fd-be2e-4109-5b4f-08d900109728
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2399
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <325FF0D9CF024D45B97370893015169D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

> On 15 Apr 2021, at 13:38, Bruce Ashfield via lists.yoctoproject.org <bru=
ce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> What's the delta in v2 from v1 ? It wasn't immediately obvious to me.

Nathan added a commit message to the first patch.

Cheers
Bertrand

>=20
> Bruce
>=20
> On Thu, Apr 15, 2021 at 4:37 AM Nathan Dunne <Nathan.Dunne@arm.com> wrot=
e:
>>=20
>> From: Nathan Dunne <Nathan.Dunne@arm.com>
>>=20
>> Added kernel modules kernel-module-xt-masquerade and
>> kernel-module-xt-comment to RRECOMMENDS, to avoid iptables
>> errors with podman
>>=20
>> Issue-Id: SCM-2355
>> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
>> Change-Id: If806a6802352b2658a695bf5265c1ead82fe3248
>> ---
>> recipes-containers/podman/podman_git.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containe=
rs/podman/podman_git.bb
>> index 62ae024..6fb803e 100644
>> --- a/recipes-containers/podman/podman_git.bb
>> +++ b/recipes-containers/podman/podman_git.bb
>> @@ -109,5 +109,5 @@ FILES_${PN} +=3D " \
>> SYSTEMD_SERVICE_${PN} =3D "podman.service podman.socket"
>>=20
>> RDEPENDS_${PN} +=3D "conmon virtual/runc iptables cni skopeo"
>> -RRECOMMENDS_${PN} +=3D "slirp4netns"
>> +RRECOMMENDS_${PN} +=3D "slirp4netns kernel-module-xt-masquerade kernel=
-module-xt-comment"
>> RCONFLICTS_${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'docker', '=
docker', '', d)}"
>> --
>> 2.17.1
>>=20
>>=20
>>=20
>>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
>=20

