Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480E3C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:11:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web12.4633.1652775100013563824
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 01:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=kYxHkmQM;
 spf=pass (domain: arm.com, ip: 40.107.22.48,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NCFX/NgPejia/TsU4SRBI64yCtlEC0ptk3Isz0+NeYuA/beDCBkqMqQSAHQPsc70Mcu7XMCZ0m6wmDrivjPRQnhA2pFCJ6+Lfr2yXCAkxgsoQYsndVs2/ppVc5jQt1CBm6Ek2aMzfiWmiUMoOmvSJnXynXxLnnvQBUPOtBci3aVermIp7Z3KVw0eeoLeMSzaJ/KtJFr+eV0Bzna9xxU8sxDjvyq7muMFFxx/Awsdx0rg/ymZVsYUQdlINUNYbb+T1r4epja6Vx05AR/C9AUoB4YyjHSONLEk3sa1ZMUUPzMCD93GM+X5RxTPwcPacjRHslbbtah+6IKpla2j224zzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KQgeMmynSmDAn33bLGRugvTwBd1pdm26sjRWbzDDDs=;
 b=VD6RZ5og7/M8r6hLQOfyz+rSycEEFp+uQ1ovQwsrf1EBAPvtqIhDb2Gq2Ft8pIl3QWTyjiKR2c3bmIiiMMJhVEH2IFvxYto+Qd1QPkNZjUwyyrhbwX0oMAAEm/QEKM7M37KjQabdZmpadBEv12lZoam3csHWO4wlhLhWeat84Uoz6OWV8n1TK/8fMMwhLaDwuCMGDRBOEmgnDIQXj8+8zanFu+9lsgXU5PZegVvAz0XGyygWSBKIG1+b1z9gDn6IR1s5tGkD6CVc2lwNd/MgFcyetMDJccYLr9Z1QnG5bfHgVJmeiY4gIITe+NaHzCqS9COn7W0lqqFshyzF5i2eKw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KQgeMmynSmDAn33bLGRugvTwBd1pdm26sjRWbzDDDs=;
 b=kYxHkmQM3qYoLwLy9QOcfgqKkojbprRVvzO8PmoxXmzaZYlzpWeyEBTdTKBBbH8vTYmZGj/cS5jL5y9A3TUpYFgab3YbMnPpguaW+b1mPjyiUndLPmaJxEDpoE/LGVicu+cUmeNhQmG0RVcuWkqbMzJO7z2Mx0pMcUEHuaLCZKU=
Received: from AM5PR0101CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::29) by VI1PR08MB3856.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 08:11:33 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::ec) by AM5PR0101CA0016.outlook.office365.com
 (2603:10a6:206:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Tue, 17 May 2022 08:11:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 08:11:32 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Tue, 17 May 2022 08:11:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 09744325734ddbc0
X-CR-MTA-TID: 64aa7808
Received: from ae13cf5687c6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66FDD311-59FB-48D0-A4A5-6A6A8B797BE7.1;
	Tue, 17 May 2022 08:11:25 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 ae13cf5687c6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 May 2022 08:11:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONKOrqHpmzjz9Uab8kCbnokorpstQc5sIG8+r0aoLkmWYt0tmqeSj79+X4DxEzjWHKFDHfdYWxwDCW8eckzT85e4mlsgh3IOXd/8tqOm6k+5kyNVU8W4Qro4kitmbxbxb8+s7p/6Ox3UrvW43QMik+lRj/KZ15eUXKi+ldVISfT4jjP1uYmdGPk3pL1nYN5rHKhk7Vf23ZWwLD6tgjATHDQRvx7C7n2SdDhOfyH/+rZUC/o02Huya2I5KUot+xREktHUlZ6OweLCg72p7aF1Cv3cra6Nd+LoLTnREFvUdzTKDu6WbvbPrMkw2v8oYh9KgSkfRUdON1EN5soa8h3prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KQgeMmynSmDAn33bLGRugvTwBd1pdm26sjRWbzDDDs=;
 b=ablXQNVvchjhtT7HrGawdLViFZ7SpPoU0faxLo0Ag7B5Tuc/3bAQ6wkE7CUxFPSnOZ8+5lQdCH6LV3GYr/1Gb36JpmP08pkwhL7SiMafMQ9dqs1jnQSu0GkZLG7luAwxtrPq6mAaNLXW7am1fS+JEcVmVqTm31+iHKpN25tnATQsWTB40uVkJGSIKuub9rJTYThaxqf7cwdaAQACNk+2/XFBUJFmiXKx5k8ykKakVxFQk0/2mQqYxPEJ+Ikz2QKRmdrPGqhh1L0HuvztsCRFNQUcrKTNZWUIt5u/e6gWmvzc4FQiJcpiwQOb5AwGeb0f8I70aTYPZ+NLkrlvLC38Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KQgeMmynSmDAn33bLGRugvTwBd1pdm26sjRWbzDDDs=;
 b=kYxHkmQM3qYoLwLy9QOcfgqKkojbprRVvzO8PmoxXmzaZYlzpWeyEBTdTKBBbH8vTYmZGj/cS5jL5y9A3TUpYFgab3YbMnPpguaW+b1mPjyiUndLPmaJxEDpoE/LGVicu+cUmeNhQmG0RVcuWkqbMzJO7z2Mx0pMcUEHuaLCZKU=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5315.eurprd08.prod.outlook.com (2603:10a6:208:18e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Tue, 17 May
 2022 08:11:23 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 08:11:23 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Christopher Clark <christopher.w.clark@gmail.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Subject: Re: [meta-virtualization] [PATCH v2 0/4] Vairous fixes for qemu
 support
Thread-Topic: [meta-virtualization] [PATCH v2 0/4] Vairous fixes for qemu
 support
Thread-Index: AQHYZIOiSs6iNUcYDUexyp/9kWxJDK0iwlwA
Date: Tue, 17 May 2022 08:11:23 +0000
Message-ID: <9AF8989F-5DC0-410E-AEAB-084C3F979BD8@arm.com>
References: <16EDC85ADC96BC5F.7065@lists.yoctoproject.org>
In-Reply-To: <16EDC85ADC96BC5F.7065@lists.yoctoproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 80404845-8b6c-49f1-afac-08da37dcdaa6
x-ms-traffictypediagnostic: 
	AM0PR08MB5315:EE_|VE1EUR03FT048:EE_|VI1PR08MB3856:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB38560FDB3C3F5FE4D34F51A39DCE9@VI1PR08MB3856.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 fArPmz5fMRNjqS3wvns4lQ9C2xcPuh5umP3j3Q//Ujg8RY5nJS2yoT4itN7QHBI7YMSkIEK0NLZMrHGl423xVVzw2V6MnumDrkhDeKZJ+dvnSeZs25QTfpJu6vzlO4tg+v10Ws9gRyaURHOqBbKE6X2Y0/kie9oqFybkidI8fxu3zdvv5E8vUA5uuUIXxNR1/i0q4MClNBoKM/7Wqf+51PJaxtTAgUO9J0bVOfNmaDifqUuf9kUoLwazIdm5Ph2SiWX6xfCjNaJWCjf1TiSXBbWa8tmOMWv2xI/LFKgpdZywjnA8XOWCtq75rjTKwQP+hYCiU36XPvlMlwxGFS0P+MVWiwM0hXw/R4KmFIt5Q/Txw+Tof/XcpIfvv9U8uq4uCY9bt077sNnW5E0jAG7gnnj4nTVFOWp+tWYf6VQL1qrfeDtYvonb2SE6YPMMsgbEdgezgpJo+LGjcOucKAqF3JmaFafrWcyZjgm1X/ZPkKZlO6YkIHt0RsSzKsOpmOXRM6Evzy3TveugetTrqx4+wIAG2dVHuexV8yO9ZYi5sRTwJIoCgr4E6ipvJ9az7zTXs0/xrShwb0p4Gxu1k310mHx3Sbg7VSxLpnQESbpqy7lepnWkazn+I5kcToGO5Momrr1IXB4BoPYQYRNsHRcM1vTkOHVQIExupjXAAQVtRiqRYtqJcHE03rtoqwImEXBagpUJwzibO0NfoVwqyZvZ/0rE94mXBt14KUpu6LPNdjJsFy4cgmtCaovK8B61c8PX4H+NZNZKUKtJoXWjeD1RUzNzTho89F0QwWB/m53O+g2LZyiqf0gdfk+en5SkaySkRXQQ3CyUOHryRQb2s3Ai0oIzvcGPkmEzUPe3YiNJbhI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(26005)(71200400001)(2616005)(8676002)(4326008)(2906002)(966005)(122000001)(6486002)(83380400001)(33656002)(38070700005)(508600001)(8936002)(53546011)(6512007)(6506007)(38100700002)(5660300002)(36756003)(186003)(316002)(66946007)(66446008)(66556008)(66476007)(110136005)(54906003)(91956017)(76116006)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD1B142D0757F346B166DDE149C0F3A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5315
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32566144-a215-49f4-eb96-08da37dcd51f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5VNqwgyPnhvx7szsfEm46lXw99g5ggDTseagW26SD+m0MJcf2qZR+g+0pU3aF6dyH+No7l1hof9hb6/EjqyPhUdlRN7KxPLfDsPimJ5X82ndF8TaqxCF/lbGzNSSMqz65sUUsQyG5nJgaPuTM9fzVN4YRk5RnkBNGJuVGTXAO30wgVIQmasJ6NdFB6DlZUDtRzsovPtuZ5jqo8yFmstzuphBGIH8Hue4jzyn3QEuTfFGFOQhG0I3oVnKUXYwbPMCgyGulylMsuiJWbTUnaq7kCuPAAlKuo60vV9MsocksbfrlmLwiyHRt0hlTyT9Z2pIHYWolPX+QvyjvYzPc40EuGUZ7Ifedc5U9DAmxtgCA1aAAwnabrXnhgcjwZD1T5NotfaUdGwh2uWmnB2gncoQAYbhon2I4ACEITQhks3GK6eaAC4CdeZF31yA1CKDuYA+rt3D9ftDr4FRpNb3BPkPM7RlXkMT/EMAW+uh6sEvYbJp3HzF+N5CVexG3ttBD903d1kSR1a+aXGa8wCl8y8qKDY8g5ZljB8s45U804haOpjUD9WVarUPraYoDvmba3Nnn/PCiU8KoJu9JO2mbt1MtUTjqBbzj9GPb9Z4r/Rf/BohDtq1xsznaVqmFoLpfK2OpkM1oNShtE8ZfS2E0GyKNjLWNQsTEE3NPNbZkXXsk4UvwqG7smKSzi0jwak5TqwdCc1478W7gqSBLDpwYuYYhwbexZhg7pZXBc+bNkn8J9Fh/wgBgVHGwFWh/BgxD+Up6uDjsCAHpkHplJkiE3EA7w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6486002)(8936002)(33656002)(70206006)(508600001)(2906002)(82310400005)(36756003)(86362001)(186003)(2616005)(83380400001)(6506007)(53546011)(336012)(5660300002)(36860700001)(47076005)(316002)(26005)(54906003)(6512007)(4326008)(8676002)(110136005)(966005)(81166007)(40460700003)(70586007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 08:11:32.6098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 80404845-8b6c-49f1-afac-08da37dcdaa6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3856
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 17 May 2022 08:11:51 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7280

Hi,

Any news not those patches ?

Cheers
Bertrand

> On 10 May 2022, at 16:35, Bertrand Marquis via lists.yoctoproject.org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>=20
> This serie is a rework of the patch named "[PATCH] xen: enable qemuboot
> for arm32" to fix some issues in the qemuboot support for arm and
> introduce arm32 support for it.
>=20
> First 2 patches are small fixes/enhancements
> Patch 3 is adding qemu arm32 support
> Patch 4 needs to be discuss but is a workaround to let qemu-arm32 boot
> right now by disabling PCI as it cause dom0 to hang at the moment.
>=20
> Bertrand Marquis (4):
>  xen: Fix class inherit in xen-image
>  qemuboot: Fix command line and enable other machines
>  xen: enable qemuboot for arm32
>  xen: Disable PCI on qemuarm with Xen
>=20
> classes/qemuboot-xen-defaults.bbclass        | 20 +++++++++----
> classes/qemuboot-xen-dtb.bbclass             | 31 +++++++++++++++++---
> recipes-extended/images/xen-image-minimal.bb |  2 +-
> 3 files changed, 43 insertions(+), 10 deletions(-)
>=20
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7270): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7270
> Mute This Topic: https://lists.yoctoproject.org/mt/91015797/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


