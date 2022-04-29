Return-Path: <bertrand.marquis@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B8CC433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 13:39:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web12.10208.1651239558065391251
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 29 Apr 2022 06:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=ooEVl1oc;
 spf=pass (domain: arm.com, ip: 40.107.8.41,
 mailfrom: bertrand.marquis@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KgOiCVbTKKTGPcJ5GFSAjbq4WEEfcoFzcCXg3k+1cXSGKi74YE6FNBbFqEapXKtH8Fy0kWqZ7aXJFoE7NLalQEmetbnW0oKygeAkCmsG/6ZKy/vt94x9DWnhX6XKIkbx5LY8GStQ5re8u0g73NjL8A3WeTm9ggaX0torv85OhBMaRVOTDNQ1uC7yVf4AqnRqochMs3arytf22jaloKAONtlaHhExeL0z/F55qBty8qI0BUl9ZcHIEyNDPjVtEvFY1y7sFWR87GtQfjcqodgUfhzyeHa8E2Y3AHYd0KOdZTqnI6/uLHsCP00qHH/qpoipR7ePu+l8mHnJGZXtOoQykQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMGZyAugW4upZcfGUCdt161KAkkWVWw5IHvdGEXDweU=;
 b=XxCQPyWgS2Z4IyQ4iMF7H4jCzkaLo1BlCbp0WQF8f8cUy47I0OOMe7z0KsYtKGS4o/YHE8gr7xJT6zXlg/lS5L2WTroT9JU/fc5ERjyvddUCA8LuX3sjYYKzw0f2kfUTveDqGrG5aMiCahmJo7Ge8CFOPhv2vXY6W6zUK6hxzA/sP+PQ8xcLPP8pScphW3hr6v+I8646qMFSyEZBbBsuu04Qz5iPdG74hOrZH0w6p4+WbXAaZ4NUvDYa8kHZJJn3QCGmuj1e+FdBhTJzfx1PIgFjsIbyAK0hcCAwc51oYk0nDEwrhNeKBJv0ll0lZYRoPnl8+dIEYdxDO+S62ScwSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMGZyAugW4upZcfGUCdt161KAkkWVWw5IHvdGEXDweU=;
 b=ooEVl1ocAOn8EKFkvEubE88cFqCwLfId9ygZc69sPHP8hdfJ6a6cQ3Tikljb128sak53hpnGNqyeGa6D5aubHkgy9zhYwhShzRolMCQWY/8ygRP3TsfghJL4n67H0rPioeJNDYea0BFxUrGztcdPZujeqygv1MRnNHBCtJExD+c=
Received: from AS9PR05CA0055.eurprd05.prod.outlook.com (2603:10a6:20b:489::6)
 by AM8PR08MB5843.eurprd08.prod.outlook.com (2603:10a6:20b:1df::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 29 Apr
 2022 13:39:14 +0000
Received: from VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::4b) by AS9PR05CA0055.outlook.office365.com
 (2603:10a6:20b:489::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Fri, 29 Apr 2022 13:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT012.mail.protection.outlook.com (10.152.18.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 13:39:13 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Fri, 29 Apr 2022 13:39:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a92c5b3666873d9e
X-CR-MTA-TID: 64aa7808
Received: from 7ea62b13d016.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0809F62E-1B09-499E-931D-730C0D839AC0.1;
	Fri, 29 Apr 2022 13:39:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 7ea62b13d016.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 29 Apr 2022 13:39:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lv22sABX+G+gWkVbqpMR84WrtPn4+phNwe1TgRFpiFCfYj0X6bs95sUYxTBrGj2aeI5rt4ljPVqAFB8sO0u005tPIz/rPFRbbaqW59Dx5QtTbf0KQHyqLSRYBj/aaklblXinnnBah2FinoH6oJfW6wviYIeTeKp4vy0odWaqRp37GlFBj2ivGV0u1Mk8Xnea/EmTw/aLyFR0z09rd0GKlC2Kv8+UFbCXYTLZt4xPjg5xmjNpaBcQuufc1cD9ES0+qyBFM8+U2PjL5EcJCDRgmekWob7rc+Opu+h06XMQgssSl5U0xa+ThJtt9fSfBD7eDnbjDrIBsB7QxCFUKjQzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMGZyAugW4upZcfGUCdt161KAkkWVWw5IHvdGEXDweU=;
 b=FgPQ/kanLsyP5yaFDCs9Aj9wB8vsua6kfAQqjaW1s939PwY38IvSG2kTTi3hoHWoOiwSfIqLbzoXIrkfrOUkEUoNHYv5TDULWBZh5Z2ATAKZXRLEekf+lUnok286tSbdSLoWn56puNmRT68IPmQbS4SQ50QtF5aDNv5oR6RC9cttnL4OUJBT/ckEbWoNrmRVLh/4vEJk0blYaJCvstfNHqgFDuH4mPib1chZBMpe+ZQGZnwPPPWSi08EU13M2xvpBw0NfWv980CyzOytHXJCM9iV0+XsoSzObo34rMMYu+C+jg+LL5BTBqLadkir8CCZiM9Ku8tVrDZcVtAY91ThZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMGZyAugW4upZcfGUCdt161KAkkWVWw5IHvdGEXDweU=;
 b=ooEVl1ocAOn8EKFkvEubE88cFqCwLfId9ygZc69sPHP8hdfJ6a6cQ3Tikljb128sak53hpnGNqyeGa6D5aubHkgy9zhYwhShzRolMCQWY/8ygRP3TsfghJL4n67H0rPioeJNDYea0BFxUrGztcdPZujeqygv1MRnNHBCtJExD+c=
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6610.eurprd08.prod.outlook.com (2603:10a6:20b:36a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 29 Apr
 2022 13:39:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.021; Fri, 29 Apr 2022
 13:39:02 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "cardoe@cardoe.com" <cardoe@cardoe.com>,
	"dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>, Diego Sueiro
	<Diego.Sueiro@arm.com>, "jdmason@kudzu.us" <jdmason@kudzu.us>
Subject: Re: [meta-virtualization][PATCH v2 2/3] qemuboot, xen-image-minimal:
 enable runqemu for qemuarm Xen images
Thread-Topic: [meta-virtualization][PATCH v2 2/3] qemuboot, xen-image-minimal:
 enable runqemu for qemuarm Xen images
Thread-Index: AQHYWpPptJBKUYj2t0KnMn3mAau6Ka0G59CA
Date: Fri, 29 Apr 2022 13:39:02 +0000
Message-ID: <2E2EBAC1-A31E-470C-8EF5-B68CF7964ED4@arm.com>
References: <20220428000609.26814-1-christopher.w.clark@gmail.com>
 <20220428000609.26814-3-christopher.w.clark@gmail.com>
In-Reply-To: <20220428000609.26814-3-christopher.w.clark@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ab8d856c-f135-4e9a-81e3-08da29e5a62d
x-ms-traffictypediagnostic: 
	AM8PR08MB6610:EE_|VE1EUR03FT012:EE_|AM8PR08MB5843:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR08MB584300BB207DFB891F99B2349DFC9@AM8PR08MB5843.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 U6vpQIUWrLsJO23IkW5JZGuJao0fOpLePFDivUw4iBDvy4PFqF7ozBBnAXDujixDOywYXn7IIlLEOSLQwNYqhFKpUidgZ/aa5PUGJ9tSMLbObIkyiDrWL2xMOoB4NbaesNQsPsf3L/cLIKNArKF7SPbsI6eumoiAkjGvInI5SJOk+IaecKSsXxPPXGKcMEYWA93ywBqQDlXcFKyiadPJrTwrAxJSdGio6gnWvcNXqZXRBUDcHr+S5r8HsJ5YNbYOWNNB/5+wLMQn4qi3MVECcWm6GUGzuxOs6QrwaOXU4fwJCiKT4yW8gh6unVR8Jv6pRsZhEt210B9WBAbsb8UtDrze0NsnT8DXSq3vTYfT2Vci080bKHAOxyHnBGZWB1THxlF6Wmd6GD7QjyyI9mnp6HPYIFLu6ePeEB59CJUyH3AZ3syxxzqyoNFTDcuc7ZL4jtR9TTkMbiFmytEqnZYzMwaVVGqF2dtiOJom5GQA9x/r6HrnklhawDtBM4wqjaTK5+fupNsBcPpK1U/0ejDyYnxTXlJPtfjxFao2+BqqrV4DfOaenCevFxc0DMmatoOQMlZ4pK48s3AK6gYjKgly4atHbHYl+wiqXS4vHrqlKMeULmDR7av2P/oi63pRJhoTTPQZBfiJaxI0eXrbj9EZSYeGkINyZbthLg/tS3fbegSFo1ng6LHou4ph2M0Gx2fr5yoCA0JoT1s9+rXvLuwCWHsc8AKknPnDTli/yrLpDFryCk74oEtGnWZwGgS9a+eTtp/EDT9PeGbm28HI+PR5RW4NML4zU2sG8mmKHLoj2Dlr6AQT2PorkyiFUd7xL1Lg
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(508600001)(2616005)(186003)(33656002)(71200400001)(6486002)(966005)(83380400001)(6512007)(8676002)(4326008)(66556008)(91956017)(26005)(66476007)(66446008)(30864003)(64756008)(6506007)(53546011)(76116006)(66946007)(2906002)(36756003)(38070700005)(316002)(38100700002)(5660300002)(122000001)(86362001)(54906003)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F380ADEA635B6B45B70773F23C0BE162@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6610
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b86b81fd-ec3f-4818-ec2b-08da29e59f5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uKHZJiIMXAufV0FfAxMBxrXK6n7aO7d2eYGQmR31o2htmGaBtxvnViHJhf9/Ec3JV4dCh/V/QVfkhPO/TjyyfmqWyP47dVPGtT87x5/bIGrp+u9Z46F8NWTWMKfTeHOrmQrf9rex4bb3AJUv3biaMZYE60iVxV/OLGjAmRIdUP3sPGehCZrIkq8CMYGB37WaQff19h+cfNkZxThdzVVMVsXIsSz6aWSCUyFUP+NwgZQDypu/PP4KBr+2HPf6HY/xXnCFwrlABfcKAlIBcPap1WmM05aAj11t2NOtZhDwTz2NpsUl8fRnL4H58Meyj21FtU9H24eNaZfHvK5roqOE6ya8LJWN4/jTqBkHel47NR56/V8b61hDUceoWn5yOK/Bj+dp7yQVpfkGDtBxzcZETDPp/veW8eOxn5UVvkNs9os6ywtPGMk5/c+JaLEOBqc33DQPNd7ed//e6Hv/m+TGwuR5QsHef6b0nJggE9v7uLOda53iP9Tfpu74T6Y/ir4+UJQorGyWPKxNzaHRYjuVdxC9SllpLR5jpxBch6xI2kdIhMUTf3hsuRkDqlOumZnQdgCwp2mClxgVmtAiiBjDCGRJln8OEjP0ok+eRgZJJN8X0XQAPyRY8FI9DimNDV20szCrz9ebjasAmPYWCw8shOue63Ib/7WLtinI59riZWw6Lp2taJ5Y+Mc4MPTyfYQ9O+x8yv2wUCo6R/x0gi4WQNTt2daQQGSuDLF6M5gCIG+D7OUmGutt3LXInKo8gT0M
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(4326008)(6862004)(8936002)(30864003)(966005)(5660300002)(70206006)(70586007)(508600001)(6486002)(8676002)(54906003)(86362001)(316002)(36860700001)(83380400001)(107886003)(47076005)(186003)(336012)(40460700003)(81166007)(36756003)(2906002)(2616005)(6512007)(6506007)(26005)(33656002)(356005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 13:39:13.7243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab8d856c-f135-4e9a-81e3-08da29e5a62d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5843
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 Apr 2022 13:39:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7234

Hi Christopher,

> On 28 Apr 2022, at 01:06, Christopher Clark via lists.yoctoproject.org <c=
hristopher.w.clark=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> The Xen hypervisor built for Arm 32-bit targets can be launched with
> runqemu by providing a u-boot script and configuration for Qemu, which
> enables interactive testing of Xen images.
>
> Add qemuboot-xen-u-boot.bbclass to add a new bitbake task for generating
> the u-boot script. Since this increases the number of qemuboot-specific
> classes that are inherited by the xen-image-minimal recipe, change the
> inherit of all of these to only apply to qemu machines with the qemuall
> override.
>
> Update qemuboot-xen-defaults.bbclass to supply working default
> parameters for the qemuarm machine needed to boot successfully in
> testing. Also change all the arch-specific variable overrides into
> narrower qemu platform overrides instead to avoid unnecessary
> interactions with other Arm platform machines.

First: this does not work on my side as u-boot is stuck waiting for a dhcp
server to download something from the deploy directory but I do not quite
understand how this should work.

But more than that I think there are 2 issues here:
- qemuboot-xen-dtb is already doing exactly what you do in your uboot
  script. Why not use it ?
- qemu arm32 can perfectly boot xen using -kernel and -dtb in the exact
  same way than what is done on arm64. Why do you want to use uboot ?

I will push a patch to the mailing to show how I did this.

All the changes to cleanup the existing code are quite nice and it would be
good to push them in a separate patch.

Cheers
Bertrand

>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> ---
> Changes since v1:
> - replace all qemuboot arch overrides with qemu machine platform override=
s
> - only include the qemu classes in the image for qemu build targets
>
>
> classes/qemuboot-xen-defaults.bbclass        |  26 +++-
> classes/qemuboot-xen-u-boot.bbclass          | 128 +++++++++++++++++++
> conf/distro/include/meta-virt-xen.inc        |   1 +
> recipes-extended/images/xen-image-minimal.bb |   6 +-
> 4 files changed, 155 insertions(+), 6 deletions(-)
> create mode 100644 classes/qemuboot-xen-u-boot.bbclass
>
> diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen=
-defaults.bbclass
> index c7e74c3..62bbf8f 100644
> --- a/classes/qemuboot-xen-defaults.bbclass
> +++ b/classes/qemuboot-xen-defaults.bbclass
> @@ -10,21 +10,37 @@ DOM0_KERNEL ??=3D "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE=
TYPE}"
> DOM0_KERNEL_LOAD_ADDR ??=3D "0x45000000"
> QB_XEN_DOMAIN_MODULES ??=3D "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:mult=
iboot,kernel"
>
> +# Qemuboot for 32-bit Arm loads Xen via device loader parameter rather t=
han
> +# kernel and boots using u-boot as bios
> +XEN_BINARY ??=3D "${DEPLOY_DIR_IMAGE}/xen-${MACHINE}"
> +QB_XEN_LOAD_ADDR ??=3D "0x46000000"
> +QB_OPT_APPEND:append:qemuarm =3D " \
> +    -device loader,file=3D${XEN_BINARY},addr=3D${QB_XEN_LOAD_ADDR},force=
-raw=3Don \
> +    -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADDR}=
 \
> +    -bios ${DEPLOY_DIR_IMAGE}/u-boot.bin \
> +    "
> +QB_DEFAULT_KERNEL:qemuarm =3D "none"
> +
> # Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
> # and the device loader option for the dom0 kernel:
> -QB_OPT_APPEND:append:aarch64 =3D " \
> +QB_OPT_APPEND:append:qemuarm64 =3D " \
>     -device loader,file=3D${DOM0_KERNEL},addr=3D${DOM0_KERNEL_LOAD_ADDR} =
\
>     "
> -QB_DEFAULT_KERNEL:aarch64 =3D "xen-${MACHINE}"
> +QB_DEFAULT_KERNEL:qemuarm64 =3D "xen-${MACHINE}"
>
> +# 32-bit Arm: gic version 2
> +QB_MACHINE:qemuarm =3D "-machine virt -machine virtualization=3Dtrue"
> # 64-bit Arm: gic version 3
> -QB_MACHINE:aarch64 =3D "-machine virt,gic-version=3D3 -machine virtualiz=
ation=3Dtrue"
> +QB_MACHINE:qemuarm64 =3D "-machine virt,gic-version=3D3 -machine virtual=
ization=3Dtrue"
>
> # Increase the default qemu memory allocation to allow for the hypervisor=
.
> # Use a weak assignment to allow for change of default and override elsew=
here.
> QB_MEM_VALUE ??=3D "512"
> QB_MEM =3D "-m ${QB_MEM_VALUE}"
>
> +# 32-bit Arm: qemuboot with a u-boot script image
> +QB_XEN_U_BOOT_SCR:qemuarm =3D "boot.scr.uimg"
> +
> # 64-bit Arm: qemuboot with a device tree binary
> -QB_DTB:aarch64 =3D "${IMAGE_NAME}.qemuboot.dtb"
> -QB_DTB_LINK:aarch64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
> +QB_DTB:qemuarm64 =3D "${IMAGE_NAME}.qemuboot.dtb"
> +QB_DTB_LINK:qemuarm64 =3D "${IMAGE_LINK_NAME}.qemuboot.dtb"
> diff --git a/classes/qemuboot-xen-u-boot.bbclass b/classes/qemuboot-xen-u=
-boot.bbclass
> new file mode 100644
> index 0000000..4401eba
> --- /dev/null
> +++ b/classes/qemuboot-xen-u-boot.bbclass
> @@ -0,0 +1,128 @@
> +# Enable booting Xen with qemuboot / runqemu: u-boot configuration
> +#
> +# Copyright (c) 2021-2022 Star Lab Corp. All rights reserved.
> +#
> +# Author: Christopher Clark <christopher.clark@starlab.io>
> +
> +# Interface variables:
> +#
> +# QB_XEN_U_BOOT_SCR :
> +# If this variable is set, this class will generate the u-boot script im=
age file
> +# It must be set to the name of the compiled command file that u-boot wi=
ll tftp
> +# from the image deploy directory during boot, currently: "boot.scr.uimg=
"
> +#
> +# QB_XEN_CMDLINE_EXTRA :
> +# A string to be appended to the default Xen hypervisor boot command lin=
e,
> +# for supplying Xen boot options.
> +# The device tree that this bbclass generates will contain Xen command
> +# line options to connect the Xen console to the Qemu serial port.
> +#
> +# QB_XEN_LOAD_ADDR :
> +# The hypervisor load address
> +#
> +# QB_XEN_DOM0_BOOTARGS :
> +# A string for specifying Dom0 boot options for the Xen section of the d=
evice
> +# tree.
> +#
> +# QB_XEN_UBOOT_SCR_TASK_DEPENDS:
> +# The task dependencies for the u-boot script generation. A default is p=
rovided.
> +#
> +# QB_XEN_DOMAIN_MODULES:
> +# A space-separated list of colon-separated entries:
> +#   "<file for the module>:<load memory address>:<module compatibility s=
tring>"
> +
> +# Set the default value for this variable to empty: no file generated.
> +QB_XEN_U_BOOT_SCR ??=3D ""
> +
> +write_add_chosen_module() {
> +    CMD_FILE=3D"$1"
> +    ADDR=3D"$2"
> +    SIZE=3D"$3"
> +    MODULE_TYPE=3D"$4"
> +    cat <<EOF >>"${CMD_FILE}"
> +fdt mknod /chosen module@${ADDR}
> +fdt set /chosen/module@${ADDR} compatible "multiboot,module" "${MODULE_T=
YPE}"
> +fdt set /chosen/module@${ADDR} reg <${ADDR} ${SIZE}>
> +EOF
> +}
> +
> +generate_xen_u_boot_conf() {
> +    CMD_FILE=3D"${B}/qemuboot-xen.cmd"
> +    cat <<EOF >"${CMD_FILE}"
> +echo "Running u-boot launch script"
> +fdt addr 0x40000000
> +fdt resize
> +echo "Device tree resized"
> +
> +fdt set /chosen \#address-cells <1>
> +fdt set /chosen \#size-cells <1>
> +
> +fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3D/pl011@90000=
00 ${QB_XEN_CMDLINE_EXTRA}"
> +fdt set /chosen xen,dom0-bootargs "${QB_XEN_DOM0_BOOTARGS}"
> +EOF
> +
> +    if [ -z "${QB_XEN_DOMAIN_MODULES}" ]; then
> +        bbwarn "No domain modules: please set QB_XEN_DOMAIN_MODULES"
> +    fi
> +
> +    for DOMAIN_MODULE in ${QB_XEN_DOMAIN_MODULES}
> +    do
> +        MODULE_FILE=3D"$(echo ${DOMAIN_MODULE} | cut -f1 -d:)"
> +        ADDR=3D"$(echo ${DOMAIN_MODULE} | cut -f2 -d:)"
> +        MODULE_TYPE=3D"$(echo ${DOMAIN_MODULE} | cut -f3 -d:)"
> +        RESOLVED_FILE=3D"$(readlink -f ${MODULE_FILE})"
> +        SIZE=3D$(printf '0x%x\n' $(stat -c '%s' "${RESOLVED_FILE}"))
> +        [ "x${SIZE}" !=3D "x0x0" ] || bbfatal No module: "${MODULE_FILE}=
"
> +        write_add_chosen_module "${CMD_FILE}" "${ADDR}" "${SIZE}" "${MOD=
ULE_TYPE}"
> +    done
> +
> +    cat <<EOF >>"${CMD_FILE}"
> +fdt print /chosen
> +
> +echo Boot Xen
> +bootz ${QB_XEN_LOAD_ADDR} - 0x40000000
> +EOF
> +
> +    uboot-mkimage -A "${UBOOT_ARCH}" -T script -C none \
> +                  -a 0x20000 -e 0x20000 \
> +                  -d "${CMD_FILE}" "${CMD_FILE}.uimg"
> +
> +    # u-boot tftps this filename from DEPLOY_DIR_IMAGE:
> +    install -m 0644 "${CMD_FILE}.uimg" "${DEPLOY_DIR_IMAGE}/${QB_XEN_U_B=
OOT_SCR}"
> +}
> +
> +do_write_qemuboot_xen_u_boot_conf() {
> +    # Not all architectures qemuboot with u-boot, so check to see if thi=
s
> +    # is needed. This allows this bbclass file to be used in the same im=
age
> +    # recipe for multiple architectures.
> +
> +    if [ -n "${QB_XEN_U_BOOT_SCR}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; the=
n
> +        generate_xen_u_boot_conf
> +    fi
> +}
> +
> +addtask do_write_qemuboot_xen_u_boot_conf after do_write_qemuboot_conf b=
efore do_image
> +# Task dependency:
> +# An expected common case is that the kernel for at least one of the ini=
tial
> +# domains (eg. dom0) is deployed from the virtual/kernel recipe, so
> +# add that as a task dependency here since the kernel size needs to be k=
nown
> +# for generating the device tree.
> +# Dependencies are only introduced if a device tree will be generated.
> +QB_XEN_UBOOT_SCR_TASK_DEPENDS ?=3D " \
> +    ${@[ ' \
> +        u-boot-tools-native:do_populate_sysroot \
> +        u-boot:do_deploy \
> +        virtual/kernel:do_deploy \
> +    ', ''][d.getVar('QB_XEN_U_BOOT_SCR') =3D=3D '']} \
> +    "
> +do_write_qemuboot_xen_u_boot_conf[depends] =3D "${QB_XEN_UBOOT_SCR_TASK_=
DEPENDS}"
> +
> +def qemuboot_xen_u_boot_vars(d):
> +    build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> +                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
> +                'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
> +                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
> +    return build_vars + [k for k in d.keys() if k.startswith('QB_')]
> +
> +do_write_qemuboot_xen_u_boot[vardeps] +=3D "${@' '.join(qemuboot_xen_u_b=
oot_vars(d))}"
> +do_write_qemuboot_xen_u_boot[vardepsexclude] +=3D "TOPDIR"
> diff --git a/conf/distro/include/meta-virt-xen.inc b/conf/distro/include/=
meta-virt-xen.inc
> index 5fbb57f..89f98f2 100644
> --- a/conf/distro/include/meta-virt-xen.inc
> +++ b/conf/distro/include/meta-virt-xen.inc
> @@ -12,4 +12,5 @@ include ${@bb.utils.contains('MACHINE', 'raspberrypi4-6=
4', \
>     '${XEN_RPI4_64_CONFIG_PATH}', '', d)}
>
> # Set serial for working qemuboot console
> +SERIAL_CONSOLES:qemuarm ?=3D "115200;ttyAMA0"
> SERIAL_CONSOLES:qemuarm64 ?=3D "115200;ttyAMA0"
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-exten=
ded/images/xen-image-minimal.bb
> index f6fa5ed..c17c153 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -34,7 +34,11 @@ XEN_ACPI_PROCESSOR_MODULE:x86-64 =3D "kernel-module-xe=
n-acpi-processor"
>
> LICENSE =3D "MIT"
>
> -inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb qemuboot-testi=
mage-network
> +inherit core-image
> +# Only inherit the qemuboot classes when building for a qemu machine
> +QB_QEMU_CLASSES =3D ""
> +QB_QEMU_CLASSES:qemuall =3D "qemuboot-xen-defaults qemuboot-xen-dtb qemu=
boot-xen-u-boot qemuboot-testimage-network"
> +inherit ${QB_QEMU_CLASSES}
>
> do_check_xen_state() {
>     if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no', d)=
}" =3D "no" ]; then
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7227): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7227
> Mute This Topic: https://lists.yoctoproject.org/mt/90743683/3619089
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bertrand.marquis@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

