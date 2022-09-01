Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D1CECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 15:32:08 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.61])
 by mx.groups.io with SMTP id smtpd.web11.13832.1662046317708886695
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Sep 2022 08:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=THEEj7pX;
 spf=pass (domain: arm.com, ip: 40.107.104.61,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=itB8zVQpGzaj0DcYVDRB/5LvY/N7x9pY1GPrWmoBI0QgLncDQWubgATubSSt20ItlmWPk10pnu2zzCpeY5l18VkrsToV+xXr/6pAgoWaSYg0SbN/sa4dL/yeLl+OAdTTLpThRL+05cZjsCJCALpzSpCkv0E+chzi3TtFEbda3tyv5P+1OaZ8fMvTi5lD89v8wjcF1xzU2ifoun+paBUdZSjN+7EE9G27jY9S5oIxsm8wU04jBYB3oVMKLBp1OzmLu6In4kIHuUXcqYoJaeUK9gVcFaxf8kLCUIxVNvuLP1VjTFFLE/OGOKVn9uoN1H6MAyLZ56rHmkPLFdrfIKQtFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACnG0pThMsm00jYaxOIM4n02WmS+u1kU8m+Wxel9Jtc=;
 b=ZqqIwZ8t/+tulhYRq/9cma3595r6j39Wj3hICQQYzlvqOOag+T9/KSxK/shgGamm+WQxy/IDpoOZqK2FxW4qbkfSAiPRiGYWGy0XxjtyAMuNxbBcF3wu1ByiCRkgkxLqTGSdpvgOOV4hmCl5bEyiYSx2yGVdw+CWnOEPLJ1wY8sqkqWiwpDfbUUUahD8jRY9ouy3WI6mkN91hcXdhafBMRAEREE55oPO13HcFbHELRewbYBnvdELSWA9OB2S8BMz9yzUaofrOMi9O6hZr+KHJk7+Uy9wb8lfX6+8E1u8VYKXEyw58DYn0pU5tUgapKESwKwtR6y7EhebnFVghWM0+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACnG0pThMsm00jYaxOIM4n02WmS+u1kU8m+Wxel9Jtc=;
 b=THEEj7pXUgc6wQ7XQ+aJZv0INXDESOW2FGaHtqkwi9e2DLRKn6JXazOvwxKvCWPXkKK9iCGcNzjX1eObuDEUX0Qv832qozPD8xAHYi+Wi2iR30hH9VxrNeIHVKRdgI8sY03NBll3+Zlvr20gxkdLDP/HZpVrwJE+AxpwQIYky60=
Received: from DU2PR04CA0240.eurprd04.prod.outlook.com (2603:10a6:10:2b1::35)
 by PA4PR08MB6160.eurprd08.prod.outlook.com (2603:10a6:102:e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 15:31:53 +0000
Received: from DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::4f) by DU2PR04CA0240.outlook.office365.com
 (2603:10a6:10:2b1::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Thu, 1 Sep 2022 15:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT013.mail.protection.outlook.com (100.127.142.222) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 15:31:53 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 01 Sep 2022 15:31:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32c944a07d3ef3e7
X-CR-MTA-TID: 64aa7808
Received: from 95115694db54.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E680155-D842-450C-84F5-75DB3369D22F.1;
	Thu, 01 Sep 2022 15:31:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 95115694db54.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 01 Sep 2022 15:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hl8G+JWs0oxnMyPFQ5eiH8YuURwPzXQ1C3JE/LRJHj3QqxnW1tXqQVAQDcYylyb0KYVYTfQfOFthe3cPq8albL80ycfkxxy6syNM53epIU6zReNgPA8+crdtwNIuxlVMLO8w2YsiWBNmdSTI7riT7HoGIPUfJPkU5HvElKDhdF+iD9daXAIkbLxBS4+vBW9dQqrDTe4cbfg0AP4llPksVtKujYiiaCsTYeoSkxqxaA6gDluCpQrMmsNBtqn2MkM8/4X9+IjQnRxGGibi1DvGDZoBHDoCekIc3qijOF3gvaljmXlv6VCqe++ZNsH729rDBqjiHDxsOClR65kc4wHe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACnG0pThMsm00jYaxOIM4n02WmS+u1kU8m+Wxel9Jtc=;
 b=iX6rsj0iMUvm1A5DqbvtuiHVPowd7o93Zk3Q1X0YKJJt28IGJgTFxmZBh5kML3CBFUFUYeQ6/u0pufSeGnMFt39Rz1Ajn+sBI6awQFsb32qiNTTuCLvNf+z8eVRNBllzLsRNK4bTxJolCw9dLGHRSlTpW7CkHq5B7TUoTN7xJ+SfeUQ+5NYfnDR20wMuUkkTJa9wjKEcKHP3qtlILIGaE1CvreFDVVCPgIOoGvCWeM6g9GyHycM7slEg8hOzEed0A/Df5egOZzqraeEZK4O4eLVhRETmZcv97JvhP1BUVpw5QlLC11K8vtJG5Oi8IYVc3GYHZewb8BFwYykfwx19Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACnG0pThMsm00jYaxOIM4n02WmS+u1kU8m+Wxel9Jtc=;
 b=THEEj7pXUgc6wQ7XQ+aJZv0INXDESOW2FGaHtqkwi9e2DLRKn6JXazOvwxKvCWPXkKK9iCGcNzjX1eObuDEUX0Qv832qozPD8xAHYi+Wi2iR30hH9VxrNeIHVKRdgI8sY03NBll3+Zlvr20gxkdLDP/HZpVrwJE+AxpwQIYky60=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6189.eurprd08.prod.outlook.com (2603:10a6:102:ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 1 Sep
 2022 15:31:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 15:31:44 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH] meta-xilinx xen
 bbappend: Rename
Thread-Topic: [meta-virtualization][kirkstone][master][PATCH] meta-xilinx xen
 bbappend: Rename
Thread-Index: AQHYvhHfMCje81XZ/keJvnjjzhqW5a3Ks70A
Date: Thu, 1 Sep 2022 15:31:44 +0000
Message-ID: <A6FC080D-B739-4E70-A40C-E9713BF0C9F6@arm.com>
References: <20220901144751.3895401-1-mark.hatle@kernel.crashing.org>
In-Reply-To: <20220901144751.3895401-1-mark.hatle@kernel.crashing.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 42577a3a-0148-4cfc-bf67-08da8c2f18b0
x-ms-traffictypediagnostic: 
	PA4PR08MB6189:EE_|DBAEUR03FT013:EE_|PA4PR08MB6160:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6VBMDmJC30Qbhb35Cb1Bv2ws5A873W615ebAT8vASHIcXUIZAtVFdCrSLmu0RDz4Tzs0spS67E9eHZeYq/ZD+Zht/BK/IULjH+5Cv9bBcmBfpyt+ARRuHNKMSAiKTOX0G5OodSwFFgNX83Q7c0ACW/w4jYurqeZCYjOsTGUHkj+ogOxp8Fk8a4HyNfPAuQwRVzO7RZEqXmBu1xdsqEoNGyJEz7lJ90QhhbHvoSvMAOXBm7Opp1RnwWemxMZnoyV5WRb6h9h/hIDgsfUxgnGTyTz5Ylf5YEnMwIH9b3n1r80ybXvUJCEJcW0UYHJ9PEzfNJYxKWNAqvtWIo8a3/Hg/L2aIaTccHbgE5uj/jBWgK0QZm09AGekOt3VYvp5gRgZ8Xv38bkZZXu81gARmcD8Kk/hhSU3Xu/n2ng/2ThSdVeDz0cdWpUxWYtEFZh4Y+l8hUwUthY9LbB+QHEZ892YjoiFhFmJh4Ov7Fq//DwUCkZO1ixO33G6JSZIeQ6djyMZm7dyKmPw/tcRgMS0FkeldDAIYx867eo2KjfCArMnid/1blIkn3KtorHlyHgN+SbREQ4R5uDj35KZ3+YmeA5eYslwVxPxbRQ9ocfw7/QXOG3l8a2ZMYQhKbCcq1pMLAa/CSSV1TfxRivN7K2kx34QBqrLNEBSKUBU6/IlOOX10jw0aa41tzZIyx3pe+t2QvDjJVwaMf5YRFWCMaP9ahMyEeFNSU+HmNM0fbaRt2ktxHfC5wBwZHQRK1Wm3zHd5viMmDkd7cg3RGvdztcvk2y5yjLny3W7fVpIo3fSdPprc8+aMzvY98PDhfdBvXMQ1CS0A9ePVLOWR62Rt+9dvFn6i/i0jej6iyLGdJ4F0kbTvh9Nqqoz29T5td9KT2tQBrkX
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(38070700005)(8676002)(66476007)(66446008)(76116006)(91956017)(66556008)(66946007)(6916009)(86362001)(64756008)(316002)(6506007)(83380400001)(41300700001)(53546011)(6512007)(26005)(38100700002)(2616005)(186003)(122000001)(71200400001)(4326008)(478600001)(966005)(6486002)(36756003)(5660300002)(33656002)(8936002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1C72BBF60AD6E4F8C364D81510BF4E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6189
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bbeb3754-e235-4939-9ad7-08da8c2f138e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T5JdqsP1vG95IBmJQzZpVD3TUUBlb0ti5f5/SRAYU1NlA+KaYivuU7fM+AiCT5ao+wlhm8eqggN5x25wpJOR94ed5xRj5V4JNAFo+IQEhON8AVlMQX1JKPlrT/xfiZ/7bt4d7snc//L1GYzwva2p5Ldz9EaMDEC4UnhH6ikpCPJpQ3l8Vyp8KqtYKxJdai5CC9PZPS1bzphyy17RAPJyGJ+qCRK/2e/E6eLW1N98bQ8PP9W2OauibOGOfl381R6WAvG3MDKSezFep0S5ZJoi7DMzZMcHwLtsXYz4Shtgl1y6JOAzfILEvmVNUOwcNUc14RrY8LY8dLwfSktmXzW0+/Jn5PuvwZRAJAJ1CZTgP6KGgv4br7xGe72u4LehicCMfhG+i5NHN1nSxFQxfmwZ2GyY6z2e5y02PdSHzLoDQIioy9mGfZcNDmirgMVr8Vb31sS1QHtLkSQZgijhSIK/DMFgzWV2Th3jEeml9b8cpW8EmRsYcvvnSFo7Qgbbbl5Al6y2QKYad76WhWMjlGADHn7hmzTWqkMlT5sivlbKantxz3dFkMRjyclXfZAablne3/FFRhXWN951q7Bxr0rriudWi70i2dt5kJpvRUfXo/FiVamuhYdugN0y/pEwG/9hC0K/QlvDRoaDSz5Yyfykv+kD+eH7jcQDsZWZKp2BYwAXtU7A8AARLcAFzmrKvnW9kaJdyzxdp4UFrJ9JmyXemSAqptk2gOG6RJpMjZd3GD5m2JDnwOggfqdnyYkXDxVg8iJDm635dEStyPY3QPNr3AieDbokEeg2Q64DyHSElnne9tUFkncPdcW+jX/XeVrIekPQ5nmQF1rEUee70rWEwA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(40470700004)(36840700001)(46966006)(70586007)(81166007)(86362001)(53546011)(2906002)(8676002)(33656002)(6486002)(41300700001)(8936002)(4326008)(6862004)(40460700003)(966005)(336012)(478600001)(2616005)(5660300002)(47076005)(83380400001)(36860700001)(186003)(70206006)(6506007)(26005)(356005)(6512007)(40480700001)(82310400005)(316002)(82740400003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 15:31:53.1934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42577a3a-0148-4cfc-bf67-08da8c2f18b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6160
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Sep 2022 15:32:08 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7591

Hi Mark,

> On 1 Sep 2022, at 15:47, Mark Hatle via lists.yoctoproject.org <mark.hatl=
e=3Dkernel.crashing.org@lists.yoctoproject.org> wrote:
>=20
> Xen is no longer on 4.14, rename to 4.% to avoid having to regularly upda=
te it.

There is also a bbappend for git version, might be a good solution to just =
have a xen_%.bbappend and remove both 4.14 and git bbappend.

Cheers
Bertrand


>=20
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
> .../recipes-extended/xen/{xen_4.14.bbappend =3D> xen_4.%.bbappend}  | 0
> 1 file changed, 0 insertions(+), 0 deletions(-)
> rename dynamic-layers/xilinx/recipes-extended/xen/{xen_4.14.bbappend =3D>=
 xen_4.%.bbappend} (100%)
>=20
> diff --git a/dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend=
 b/dynamic-layers/xilinx/recipes-extended/xen/xen_4.%.bbappend
> similarity index 100%
> rename from dynamic-layers/xilinx/recipes-extended/xen/xen_4.14.bbappend
> rename to dynamic-layers/xilinx/recipes-extended/xen/xen_4.%.bbappend
> --=20
> 2.25.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7589): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7589
> Mute This Topic: https://lists.yoctoproject.org/mt/93397059/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


