Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51FEC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 08:58:03 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.67])
 by mx.groups.io with SMTP id smtpd.web10.3574.1646989082224862013
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 00:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=lbTuIpA8;
 spf=pass (domain: arm.com, ip: 40.107.3.67,
 mailfrom: bertrand.marquis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tid6MsDQRKu4cxJx+LhsZh8uGqWQOeJFZCHDiMoQdXo=;
 b=lbTuIpA8xlRvoElxfmUg407BwwnoDnVPB2RCIFx5EIwRbEOFGol2hoPDoBeJag/UU8qK/SkFcKTmgVyHk7s9ZIc3xTi/wP7hjDkXYnYriabviGq1s13Z0kpAygCeMjhTmF5KJU01iQ7dyHIZsDIqrIcsrLpXbuApe/IrYPxt0oo=
Received: from AM6P194CA0043.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::20)
 by PAXPR08MB6544.eurprd08.prod.outlook.com (2603:10a6:102:157::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 08:57:57 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::c5) by AM6P194CA0043.outlook.office365.com
 (2603:10a6:209:84::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 08:57:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 08:57:57 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Fri, 11 Mar 2022 08:57:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0093f6519c72e26
X-CR-MTA-TID: 64aa7808
Received: from bf480f7e4e76.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3DFF2A02-58EB-40B8-9455-E4C704D7E64F.1;
	Fri, 11 Mar 2022 08:57:46 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 bf480f7e4e76.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 11 Mar 2022 08:57:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZ6HVx/5LYHZ6RUct6tRVpW+42yMcvtv8PFovSHMOM5iH6dR4AC93flPWSL5pb2Y6mMkjhjgjpall7U+p+8wMCYVLJ3SOvgvUL+t9QYgerqe5NBqllslZTOswU08ut1x38v3hRkpLJ2iEVdf2rn8oOMJIMKC12nQV1NJ2OG8EqO3VTPxUIowkAi8wrr1rAmwGiXRksljDhj7bGAm611UO05LHIhAKRONAKKpmrEDtrpl7Z6f9xdkyW6t7EyWsJ05/TxLkv0fx8NlDv/N/uMvGidwZWASF/1bYCYyvX2FuTfI0NT0aTNWpe2wv0jlp0f5bu1PsKgaS/UBvhaMuWgyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tid6MsDQRKu4cxJx+LhsZh8uGqWQOeJFZCHDiMoQdXo=;
 b=M1Xh+72PX9d6PjG8tRpncPW2ejZ+D+fiCvbvSVPWHh2QeNF+rONr9SVS7P0uBYls8XmU5Vo8m4mtkUVH/5GHO71JRyS6se9FiYZnoiUu4pJFH3oa1GCwdOJfkz0pXO74sM/UlwnqYk1yw7Pn40+R/ZV0QXaYdBkCgOj74STXd7fzlnVO15Bjxf+JBd7OY+UglNuvb2/ee1jbqdYEPcI+6vWAfPoO7aRBbXOczybRkdroEkhDYb6mYMrsCpwEfiWbVDFrI88qSTYufeHLhGwqdkxYrfOULs1CEf7AjvdgbIx/CXO1OgrFN7QY3aJ6fT0CQmkQUSZHJBFNWRxhuWuzJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tid6MsDQRKu4cxJx+LhsZh8uGqWQOeJFZCHDiMoQdXo=;
 b=lbTuIpA8xlRvoElxfmUg407BwwnoDnVPB2RCIFx5EIwRbEOFGol2hoPDoBeJag/UU8qK/SkFcKTmgVyHk7s9ZIc3xTi/wP7hjDkXYnYriabviGq1s13Z0kpAygCeMjhTmF5KJU01iQ7dyHIZsDIqrIcsrLpXbuApe/IrYPxt0oo=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB8PR08MB5034.eurprd08.prod.outlook.com (2603:10a6:10:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 11 Mar
 2022 08:57:43 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5061.022; Fri, 11 Mar 2022
 08:57:43 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"cardoe@gentoo.org" <cardoe@gentoo.org>, Michal Orzel <Michal.Orzel@arm.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Override CC and CPP in make
 command line
Thread-Topic: [meta-virtualization] [PATCH] xen: Override CC and CPP in make
 command line
Thread-Index: AQHYNLceHAwHb9MYt0O6jlYHGguBfay54rQA
Date: Fri, 11 Mar 2022 08:57:42 +0000
Message-ID: <78A69072-AA10-42A5-BF2D-685E529C5D4C@arm.com>
References: <20220309110906.2925117-1-bertrand.marquis@arm.com>
 <20220310194302.GB37392@gmail.com>
In-Reply-To: <20220310194302.GB37392@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6953e5fb-2484-4da6-01d7-08da033d3ce1
x-ms-traffictypediagnostic: 
	DB8PR08MB5034:EE_|AM5EUR03FT056:EE_|PAXPR08MB6544:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB65442407C79F70EBA6EC22C59D0C9@PAXPR08MB6544.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yFI3BNwpsuips7seyfXmuasJ7jPWDqRpYfW/WL6D7CmsXkXN31fouJSmHZYu/NITwPrhv2Y66HfBZKaUHPawis2/JChPdHtFeFmzI0g/Kkpxa7hF39t7e5hm4YJnVvNZcjCxT+JzLwNKrnrF7atN/+D0wI/Rlt0TpK4/S2zwOeET61+XnxIGqRxOchst6oLyTHvJUN+ah3WOOzog7eYNLzrrXj33FsaGuBzhy+m4uJZKgdxI02PbpXQKER+kMAgy4i+chlAJGgTDfvd3YkXGclZVvtEiLojo4nJmrmCuKYCOOz1yT07Ur9QZSXqLuRob8qCQ+IFd5CNJy5cQzgJf6J24NwXXJKysZyekothiwDdnZinNIPgXQvDLXzhhTdgXjO5TANVt9fc+/qr+sPl8fdmzFVyB4UEvm8O3vuDFOAql5+qw+i62P6AUkMqwcG1VBbydbM0rmGKTfKRYZs5l8aozqe0Ts0gH0wA1uiA96/A2ZOnOZ9UWyvaRSVky2WbxugQ8E8Bxnon0bSOut2FRZ7TPjUfCaPcQwSXEWN6wN/1LWis7W04K3EIEIYweTpOceKwJZBu2ZHjLGR8XA8lunKL+J6K3njJJsdbMKv1PIUpniMsfztuPG3LYVBj+7fYuBhNcpA2kWVuq/VwaGKOgDtOXEWRLFPGGd1VK7jX5o3tvMfxAFi5wLkqTpaC2Q0Q0MSGWCK/9cS8/lhDUCsNKg1ssvZwyxnSAKEShkCAZQ76OOnkT513snFaUglr6DFkOqQ9+T3Qo6b3kkvc3YpRr4jdzCC02e6iWwxV4cXDCk4AOYor1jvgHUnB6SXCdXZse+M2v0bso7KDJTcD8AzMpo1rxHyr83GuC0lgJgnxUlsY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(66946007)(6512007)(33656002)(6486002)(26005)(38100700002)(2616005)(122000001)(4001150100001)(83380400001)(966005)(6506007)(5660300002)(2906002)(71200400001)(316002)(508600001)(8936002)(66556008)(66446008)(66476007)(8676002)(186003)(64756008)(76116006)(91956017)(38070700005)(54906003)(36756003)(4326008)(6916009)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5091CF3CAE4B0D4E860BFBA74727203F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5034
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c6a3471e-773e-459f-3e61-08da033d3439
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nAn/hHV7ymh4NVD5MrHjkQY8H1CeK2dohCzk/4jVQUmSbBF0Hzn7E1P1YOJDUBlwY27xwYi36LjmmgpbkmZnT0TT07E/VXJwHWYoOa4R4Hngjd4QFOvxVB1DOYfku27+kviu9OBZaxG3hNlfjGwRhfSEtQejkmtQW8KlLNp5j3bLuNDepUc8rhz9TVS4VfTJAOBwYqiXedQnT9oG2g8wyHX8RiGZtJ9u6Ix1glEvt6IM5vjb7xMGn4yRy9+Wbg0uotfrA/Z7uAoOZLIwjNNP0jfQI8Bxj9MfN0j3N2GTshruretmlFg0M0rKgbm/lLmbTb/B7azHlvCDq6DObvhFwYf0BVkhUOqBNqQUM3c/iPguEURKNd9e1/mB352qX5347oxH+68slqsXrYZmasL+NDaOIV20D6Mrpe3Diz4CMuY9pZ5Js3S2bkSO6xJqAdV0wXaQ+FhDoX228tiL5Rdc8TR6KrUkSaEZ5PW530BceKAVmq8b6i7YfrqqK4ultzI2049WwvRZB1swYKjJEHPx1Xg9nB+VRAdf0G407L8Fm5jedw5dpjeIEzHVrUwb1x34AZXr0nwfUQ+GNdCr9bJj7RhBcBTuxQZP8jVnmF0W1uVWO5Agcu2uJQ1r11DLMVj8kaMQegWvHojTVaUzYvNV1XU6iGsEpNh9ep78gIVTSbQBwKk26gmuNgjUFEZAEooQTz78aActmSXfUrVc4TaOKolEu5AFXrp+QHDOJm24Yhcs3diqLpxbIcdJepJG1D6fuxw0Y4Ivpy/RB6qcSTNRrFI5FPEHQHF3xkM16W3jZ5g=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(36860700001)(81166007)(70206006)(186003)(26005)(53546011)(33656002)(70586007)(6486002)(40460700003)(336012)(508600001)(8676002)(47076005)(6862004)(4326008)(4001150100001)(356005)(54906003)(6512007)(6506007)(83380400001)(8936002)(966005)(82310400004)(316002)(5660300002)(2616005)(86362001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 08:57:57.4975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6953e5fb-2484-4da6-01d7-08da033d3ce1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6544
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Mar 2022 08:58:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7090

Hi Bruce,

> On 10 Mar 2022, at 19:43, Bruce Ashfield via lists.yoctoproject.org <bruc=
e.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>=20
> I've merged the patch, if Christopher has any review comments or needs
> changes, we'll stack them on top.

Could this be also added in honister branch ?

Thanks
Bertrand

>=20
> Bruce
>=20
> In message: [meta-virtualization] [PATCH] xen: Override CC and CPP in mak=
e command line
> on 09/03/2022 Bertrand Marquis wrote:
>=20
>> From: Michal Orzel <michal.orzel@arm.com>
>>=20
>> After 4.16 release, Xen build system has been changed significantly.
>> When building latest status of Xen it was observed that commit
>> 317c98cb91 broke the hypervisor build on arm32 due to the change in
>> handling Rules.mk that xen.inc modifies to override CC and CPP.
>>=20
>> In order to fix the issue this patch moves overriding CC and CPP from
>> Rules.mk to make command line by adding them to EXTRA_OEMAKE:arm.
>>=20
>> Take the opportunity to bump SRCREV of xen_git.bb and xen-tools_git.bb
>> to the current status of master.
>>=20
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>> recipes-extended/xen/xen-hypervisor.inc | 8 ++++++++
>> recipes-extended/xen/xen-tools_git.bb   | 4 ++--
>> recipes-extended/xen/xen.inc            | 6 ------
>> recipes-extended/xen/xen_git.bb         | 4 ++--
>> 4 files changed, 12 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/=
xen/xen-hypervisor.inc
>> index 81e361f..6f3d24d 100644
>> --- a/recipes-extended/xen/xen-hypervisor.inc
>> +++ b/recipes-extended/xen/xen-hypervisor.inc
>> @@ -48,6 +48,14 @@ do_configure() {
>>     fi
>> }
>>=20
>> +# The hypervisor binary for arm must not be built with the hard floatin=
g point
>> +# ABI. Override CC and CPP when invoking make so that they do not conta=
in
>> +# TUNE_CCARGS.
>> +EXTRA_OEMAKE:arm +=3D "CC=3D'${CCACHE}${HOST_PREFIX}gcc ${TOOLCHAIN_OPT=
IONS} \
>> +                         ${CC_REPRODUCIBLE_OPTIONS}' \
>> +                     CPP=3D'${CCACHE}${HOST_PREFIX}gcc -E ${TOOLCHAIN_O=
PTIONS} \
>> +                         ${CC_REPRODUCIBLE_OPTIONS}'"
>> +
>> do_compile() {
>>     oe_runmake xen PYTHON=3D"${PYTHON}" \
>>                    EXTRA_CFLAGS_XEN_CORE=3D"${EXTRA_CFLAGS_XEN_CORE}"
>> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xe=
n/xen-tools_git.bb
>> index 8ff9c4c..e733f1d 100644
>> --- a/recipes-extended/xen/xen-tools_git.bb
>> +++ b/recipes-extended/xen/xen-tools_git.bb
>> @@ -1,5 +1,5 @@
>> -# master status on 2020-10-21
>> -SRCREV ?=3D "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
>> +# master status on 2022-03-08
>> +SRCREV ?=3D "9d4a44380d273de22d5753883cbf5581795ff24d"
>>=20
>> XEN_REL ?=3D "4.16"
>> XEN_BRANCH ?=3D "master"
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index 4df99bf..8b86de5 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -193,12 +193,6 @@ do_post_patch() {
>>     fi
>> }
>>=20
>> -do_post_patch:append:arm()  {
>> -    # The hypervisor binary must not be built with the hard floating po=
int ABI.
>> -    echo "CC :=3D \$(filter-out ${TUNE_CCARGS},\$(CC))" >> ${S}/xen/arc=
h/arm/Rules.mk
>> -    echo "CPP :=3D \$(filter-out ${TUNE_CCARGS},\$(CPP))" >> ${S}/xen/a=
rch/arm/Rules.mk
>> -}
>> -
>> addtask post_patch after do_patch before do_configure
>>=20
>> # Allow all hypervisor settings in a defconfig
>> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_=
git.bb
>> index e014733..2fbfb54 100644
>> --- a/recipes-extended/xen/xen_git.bb
>> +++ b/recipes-extended/xen/xen_git.bb
>> @@ -1,5 +1,5 @@
>> -# master status on 2020-10-21
>> -SRCREV ?=3D "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
>> +# master status on 2022-03-08
>> +SRCREV ?=3D "9d4a44380d273de22d5753883cbf5581795ff24d"
>>=20
>> XEN_REL ?=3D "4.16"
>> XEN_BRANCH ?=3D "master"
>> --=20
>> 2.25.1
>>=20
>=20
>>=20
>>=20
>>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7086): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7086
> Mute This Topic: https://lists.yoctoproject.org/mt/89659618/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


