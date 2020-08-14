Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web12.14820.1597399036145583289
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 02:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Zi88qWoX;
 spf=pass (domain: arm.com, ip: 40.107.7.70, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lW2egaDhTHCh8/ssdIltsyzrbBDkxTtjZgqJcANgd4I=;
 b=Zi88qWoXODVpW/7b90LB6+otEZR12ecOlkUVSQNvS/f4l6upZ6KgRPBIXFgvRX6fzLLV3wEGdC29TCNZr968PCRd9CY94rTNepKWWf2iEpoWF1C9jYfOa8PCqooi8vMPKYD4zqino1oNBb3kPYTXh++e8+c5X9FlpFJQZErMOzc=
Received: from DB6PR0202CA0004.eurprd02.prod.outlook.com (2603:10a6:4:29::14)
 by AM5PR0801MB1746.eurprd08.prod.outlook.com (2603:10a6:203:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 14 Aug
 2020 09:57:13 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::fa) by DB6PR0202CA0004.outlook.office365.com
 (2603:10a6:4:29::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend
 Transport; Fri, 14 Aug 2020 09:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:57:12 +0000
Received: ("Tessian outbound 7161e0c2a082:v64"); Fri, 14 Aug 2020 09:57:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b350684ecc7f5bfb
X-CR-MTA-TID: 64aa7808
Received: from 53ed125f95b0.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 752E3D26-ADA2-4ABB-899A-C6B33C82C102.1;
	Fri, 14 Aug 2020 09:56:52 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 53ed125f95b0.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Aug 2020 09:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFyGzJio7qOWtBEPT6TI2h6aZ3aUPe5oizEQo5oBoOWv8X3NwPjknQZ2vgOsNg4w+uyg3KOSrqR+71f3Nroz+f1dHY/G8PB6RgPeX2qYPFjzA9nQsQ27UxbPfm5BfQ+O7wRY/Q30+Gk0NU+Jr/r9Lwvy0aYPc773ivzS34xKGlxQBijw6cqehT1O8f12j4ZUPzgC6Y/AQlgXmVx/UizN/HmzI455VXLy75A6hdgo/KW9hqUg5aoQD1OzGmB94KcgUSuj+r4RvoeOR64FsZ2GDNdywFSQ93dfo/vgG/F3OT8oAJS4WEg69F7pweUF6NeeFINU8rBQ3xj9lsygrqa/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lW2egaDhTHCh8/ssdIltsyzrbBDkxTtjZgqJcANgd4I=;
 b=k2JrzPc+V+PinmSr9+OI5o/zU/q/3C6E7fhWHO1h/031veue5I7kezCgZrl04UVoDjUbr3b2ArAwsCV0z+Q9Fpcleh5mBMfmZ9znx5ktHN2PiROD5N60yPMd/2KSiCCIeauNcrnl9AjEmdvOe7JGs/SHYMgX4F7Skg3i/daX6sAOnRNz0Do6max8ZBmOeSz9QlY+E8B/Vxoor/AIS73nyueNeOfeFfN473GOZQsUxcZkXAUQtQ+PzEErMSg++v2fkdJj0AlddJZ3iH8UQg0eR0ActtxwaqvJu/hZJGVGSm8cNigcN8DarIplR3erjrVWJpCcMCGp6LLDGa0PgYqbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lW2egaDhTHCh8/ssdIltsyzrbBDkxTtjZgqJcANgd4I=;
 b=Zi88qWoXODVpW/7b90LB6+otEZR12ecOlkUVSQNvS/f4l6upZ6KgRPBIXFgvRX6fzLLV3wEGdC29TCNZr968PCRd9CY94rTNepKWWf2iEpoWF1C9jYfOa8PCqooi8vMPKYD4zqino1oNBb3kPYTXh++e8+c5X9FlpFJQZErMOzc=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB5541.eurprd08.prod.outlook.com (2603:10a6:20b:74::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Fri, 14 Aug
 2020 09:56:49 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3283.022; Fri, 14 Aug 2020
 09:56:49 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: christopher.w.clark@gmail.com,
	cardoe@gentoo.org,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH v2] xen: Fix menuconfig and add support for config fragments and diffconfig
Date: Fri, 14 Aug 2020 10:56:32 +0100
Message-Id: <1597398993-36660-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::21) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0345.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 09:56:49 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c1b0f1a-25b9-48ae-c87e-08d840386af3
X-MS-TrafficTypeDiagnostic: AM6PR08MB5541:|AM5PR0801MB1746:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB17466B74A28A3A86F4B30A2D92400@AM5PR0801MB1746.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kxGJhEw46aeIXvMU9mPzXyfCkobtSosFjqMeavoBArg6I6VpkYMkMzl3dTY+bXV4brmsTcRuM7JwZCoAGWW2VH1RNobO0ngk6GR4uWnzFTwp7YcXRcAc9I8PBJBy8C26GJegDgYFUqXoEDUJo8+HplVcGLmo26/HYD1v/R3oa3x9xKp78nB+3wB/s/9JoFbahSP/r7Yxiha9AH+28Lo6C+VuSFmcLAOHMuHV7RKKrw5Tf4AIvo9J2Dmjf05YBoZXZbFf3LBFJVkx9/UZ7KeHF1JRzVeNDGa3kjFyl9XsxRhkEum7NlmzhWtbs/TFKLMRl9mZIHfX2sQ/8Z7n93cQng==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(26005)(6486002)(36756003)(83380400001)(2616005)(5660300002)(16526019)(186003)(44832011)(7696005)(6916009)(86362001)(956004)(52116002)(8936002)(66946007)(4326008)(478600001)(66556008)(8676002)(2906002)(6666004)(316002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 /LTblscj7EdkSXLAoL5xQyOpJBV4UOSbm+gEtYG/zUtfFOdxujpGqtvpYqXraC3+2IYQDKI9NZJIaZ7EIthE/1tpnSMvf1ACo7gESiRb3T8n73CPbvGWQJhoqBsdahZpVIXF8vinwng5u1ja0dfj2QJWo03DmBlYBQNaukzZ8Eq+CarTYZsFmgXU0IO6nkHc5jZMzmhmNB7MCyGgZk7CdQuoyzCqqUDWnhW/pSHH3k3N2wso5BGNtlz+S5WIQRxej7wrC0XRtPhbioLUzif3Rze7MKIJYKFoXME9c4PBxx5iTeEPXYHOQTs95Lnh4llUpJ4uffZYkjKSdlIGzgV1r/Nt5ie3ibnicjR6+MHYvCDs9q6a2eLAoR6nV6R7UjQOC2EozHwVmu7LC5AuOuqdNIuD+2OoAvfTFBDmryO0/6o1SUxHoN9BMKEUNMUJCaT1yNB1J/tZsZQPYRaBaS7UyWSZjPEQcJRUgkg7d5ifHo/PFgbwfjQVRUkZwqpdQZrTcz29rKxf0ZLJy0Ct/f2+wHIEvpZkkPwuI26y/ZcAsYLOxa9iN38yvuG0yiUIiZISnvWRuPt7GmT17QmopwTJLQd4DbIMaDkXraD/gZz1kC0/mWrc2vwCZcbWOLhDKGIKMlbmxDM6vjpsrTjZ3gg3MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5541
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	899c6176-b00d-4057-ba69-08d840385cbe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t1obL9MACndYR40fGhP4FQuOeTi2Ib0m5MukKqhwAzn5uuptjqx2vkK9mR+zm9WmF8xX6sacNFqECsf0mI5ygnt8wlbLFhjcBfZwxcS0kirxnKSUG4JbTK9gFeGGQSvMUlrIvfjouHuMEyOQSZyrDgv5dqvGh5LQ1emkbo+IIpEVfKeGoSTz/hW6sj2ARNFIN/SEr8UisC2mqd0e46W7XJ+Y1ng+Lwf3TVA2Dp/WgrX/9VZMjrWpaZHQSwiskcg5Xs3bcX7eG1ohQ6PAQ5TF7C1pGdEnzTIkBQiWbNlhCXQpJRmIUnIKWQkpyOSjhtkTe/eByBIUHki9VEeLKxbcpPKDsr5A/Gkyvuus9++dy8btAnH0k637+oia7YzoQtDKaIPf57TTjoXTUAZOQkIdkQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(6486002)(36756003)(82310400002)(70206006)(316002)(478600001)(70586007)(356005)(956004)(2616005)(7696005)(47076004)(6666004)(186003)(81166007)(82740400003)(16526019)(44832011)(336012)(8936002)(4326008)(2906002)(83380400001)(26005)(5660300002)(6916009)(86362001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 09:57:12.9558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1b0f1a-25b9-48ae-c87e-08d840386af3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1746
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Changes in v2:
    - Fixed typo in recipes-extended/xen/README
    - Removed documentation changes from 0001-menuconfig-mconf-cfg-Allow-sp=
ecification-of-ncurses-location.patch
    - Updated Upstream-Status in 0001-menuconfig-mconf-cfg-Allow-specificat=
ion-of-ncurses-location.patch
    - Call find_cfgs function only once in recipes-extended/xen/xen-hypervi=
sor.inc

Diego Sueiro (1):
  xen: Fix menuconfig and add support for config fragments and
    diffconfig

 recipes-extended/xen/README                        |  3 ++
 ...g-Allow-specification-of-ncurses-location.patch | 49 ++++++++++++++++++=
++++
 recipes-extended/xen/xen-hypervisor.inc            | 49 +++++++++---------=
----
 recipes-extended/xen/xen_4.14.bb                   |  1 +
 recipes-extended/xen/xen_git.bb                    |  1 +
 5 files changed, 73 insertions(+), 30 deletions(-)
 create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Al=
low-specification-of-ncurses-location.patch

--
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
