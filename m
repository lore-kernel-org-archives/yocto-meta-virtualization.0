Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E87C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 10:37:53 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.7609.1699353463698188819
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 02:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KBs+t4J+;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=KBs+t4J+;
 spf=pass (domain: arm.com, ip: 40.107.6.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=N2/+5Ce2lh95Fm3taQtOZwtlJp/mWKcPOSFb9d0/0QtSU32AiT3WKdCC2xOGeEwST6qisZrBFxfWPh1EdO2y4dAhR+sFWgD+qIfnUhMHoY84oGdiNYW/wSv7fOYztuhVjAWAuT2FTucI2TQ5HLWYIAmOW1k9OLFRpxNZP9vJqeJnlOC1S0SakHE7UqOcHh0qtbb0nywcAL9L6D9MmXdK4yD3pK9KkpanBXkmWhHqEd6pb84iCrjBXXpIX6l/yfXpnDpoxlQEEniUqtpJQBhmrh+6qGIhqqgztYgBm78B52hB9In4Sg7SUv4rNnz/6w00Djh643blZZhP/BseLlSl8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ef7YogkteFGSnsZT/bFYypdK6uuIIVJWtloVVQCVrA4=;
 b=OgIa8T/y+gpiuWrXSxBXM9nws8gSrvTiISEsahhZvWAU/1eRMvi5XAY4r2x/bkddDLeGZrautCGtvqwhsSULYrmLbCOPNZNo7PbTCVdal5yhkWJPzjcAliaf0wIsGMJkLDYTyHuBzno7jAl9eXyN7zSN8LdfdL/BQJUVS5cGwmwLa4g+IZBaZ65wyfv2BAF5HtpZ7KWzqy8+fjkovO8nV6gPDjJGoip80T/if6yG3v6m8jGjIHLpKT/jb3y0RkP0lOaVFvrxTyNpocjeqlV5xS+561M11DD1GdMDn8/bMbI2QACSa28VcocolAKSbcb9Gk2v0inX44CXydrL3Xz4QQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef7YogkteFGSnsZT/bFYypdK6uuIIVJWtloVVQCVrA4=;
 b=KBs+t4J+Rm18raWybyYtkDEQSF8w9xhLwN7C0tUinzjBiigeQR3Zvj7w0QjyKNOYGBRq98uwrVzi0VQmzh14dqKUa2yRqt4dCzzBMLH0grsrXJXNShkx1f2F9wfXBQmasZNp83WYmeYSZiN+1pFsL0intSpsBVJ4cJt2jt2uc88=
Received: from DB7PR05CA0056.eurprd05.prod.outlook.com (2603:10a6:10:2e::33)
 by AS8PR08MB8393.eurprd08.prod.outlook.com (2603:10a6:20b:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 10:37:39 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::5) by DB7PR05CA0056.outlook.office365.com
 (2603:10a6:10:2e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Tue, 7 Nov 2023 10:37:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 10:37:38 +0000
Received: ("Tessian outbound 385ad2f98d71:v228"); Tue, 07 Nov 2023 10:37:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2c14e24d8332c2a2
X-CR-MTA-TID: 64aa7808
Received: from c3573f2891d3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BDD6633F-F74C-4143-810D-3B2822849718.1;
	Tue, 07 Nov 2023 10:37:32 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3573f2891d3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Nov 2023 10:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRZvdgKNedZEMvT/7Bnqit2v/w/F/+C2WqQbyUBxQkbbDPEULqa2I5DBrIJtzcB+eUJBaTOrRYESJF1xGQUi6KVPPUBufH83lzwR9otXI1pyda58aFfGuYHICsVtkoFTDPuDpMx9vfwJI2D1/xIX+mPO/InuDmw51Ff+BvoHRAp1TWdJ26QqMKnyFmknnwG3mu3B7U9ppyVfhW7Fzrz3LZZIMuxsEHECBJtKU7+7KyMPAnnCPFx9/BO5WB4Az7yKNuz5aa9iGWSpC2vh3GhGIOKQpFExOwOZCijeohug+/E032XPcOdi7BsKESHZe9RWdglEbX65zj7BgeASCurQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ef7YogkteFGSnsZT/bFYypdK6uuIIVJWtloVVQCVrA4=;
 b=Q0ofDy/LB8FO7+bqgDyjne2szLMiDGhIAjpRg+N95R8ryUhtLeCsY/7r/wd/WVxPL6pGDBRIwxLHrIq50ISxP8yJnybzTl/l30MXIPd+wn8ZkwJh+RhWU908ElvrcXuS3N8qnwP6GNO1RDgK7PiRKIBsS5lm3IqUDY2V+DeZtvw19R8xAHy4zNkX0mMBIJGrH6Izb/ejF3HWnOQvePhsaxMAv3drnF0olm1nOHquBwsAt3lWTpXkvzv/Q5Rs8uL4YndOH8/efqVRjMdah4HVCsXJBbAcZ9NqAU8E0FgHkq8KSu0Qy/rv+/OubaXVCJEm+NxVuwRPhquA0Ochgi+suA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef7YogkteFGSnsZT/bFYypdK6uuIIVJWtloVVQCVrA4=;
 b=KBs+t4J+Rm18raWybyYtkDEQSF8w9xhLwN7C0tUinzjBiigeQR3Zvj7w0QjyKNOYGBRq98uwrVzi0VQmzh14dqKUa2yRqt4dCzzBMLH0grsrXJXNShkx1f2F9wfXBQmasZNp83WYmeYSZiN+1pFsL0intSpsBVJ4cJt2jt2uc88=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6166.eurprd08.prod.outlook.com (2603:10a6:20b:296::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 10:37:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 10:37:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Joshua Watt <JPEWhacker@gmail.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci: Map image
 architecture correctly
Thread-Topic: [meta-virtualization][PATCH v2] classes/image-oci: Map image
 architecture correctly
Thread-Index: AQHaEWZoIgVAwGDvrU6OYAZ1wYgz2Q==
Date: Tue, 7 Nov 2023 10:37:29 +0000
Message-ID: <EA68EAA4-BD24-4273-8F76-0725EB0F2FDB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6166:EE_|DU2PEPF0001E9C6:EE_|AS8PR08MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: bae40b51-043b-4459-8bba-08dbdf7d9060
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KMAXYEv8DgZ8ERnpVpY4s3LtQbNYgNkHK6z4dkz+rTXd57nxhiILiaIQKN6y55mzFVuo4j6xZIhna72M54/z2ou2xt+yHNYTIWmR8gcx4oUPPhku5kAOlsetuGcECdeGNo9cAZ4Q7N/J2jQI+2bgKve+C2sJiVloEiVw81nVLXxZalg96PXlsyX9J0SgbtvUiY04XeDEbvboJMO4q9k0NK3mQTHDRU+arz+KuzDyREVwCFxc0UZaTRGn9RuYMOHKjG9s/w2lV+jm0CM9KV6nDpRJPEdTXkEdmQZsmjFYeGgNQeB8ytM9kOn/vmf7/v5HaHHLGyXxAGaWYjl7AuDgQNzid5XU+RpcGBh8J0MUtfhXfKO5yNNn4a2t1i/bYCAORlWH69aEv4HLtLIIRmfZCNAHJfQns8a0eSdkGwMKVCDKOByNbUrgkxh6wu2K6IF8gAIQ9NGbsXtNyq3TKw/6b3VmUCjLZn1t6MWSFzJxbo1MzYZNwKJqjC/gLlt7X4C4MyX72kUEgjGnTIRKtSmC/3SvcflqWyE/r1j+gSNDZEFebqOsvrmltZ0sTKVUp7KHqo+B7EokoZWH5Kpi37YjTK0X3nfN+pnAStu9ZaHDuqNqIMVYhL7R5NplNWUHxtD/kZIwBOOQbTa31hiNEmHL4A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(478600001)(6486002)(71200400001)(38070700009)(33656002)(558084003)(86362001)(36756003)(122000001)(2616005)(316002)(6512007)(66556008)(91956017)(76116006)(66476007)(54906003)(66446008)(6916009)(64756008)(66946007)(6506007)(26005)(2906002)(5660300002)(41300700001)(4326008)(38100700002)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DCB163BA09EFF4EB02DE414FDD5610A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6166
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9c259fc4-ebd2-444b-0993-08dbdf7d8b14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OZYdlVcLoMp9nWv3zkLE6XmjsWhQuCYYTRzS8UfyJBnQNyj46iAfVTpvU2/pd2nETDphvAFLn3psBJuSmMugwQHlJEREZS35ES8tR8CySbebIJcKzwWTRo8Or00c9Y/PdNWebVtvvgBhfIetY0FbkUMohgkP0T08DiTI/LS5PUuP6bjnHWnp4o+vjaxpPzHBfm3msJDYveD8yL4GabMHVbHnQsAcGRlamGp+4oCB0VuTIEUHI9Qq+BqiIijcOkNMj2RxdhvP9lo7kFbAqh6U6qinl9gNeJDPU+NAY4CTc9yg8mbcfSKT1gocymBDAiKlxp12hfQj3Xe2HJfvb/CzfrsK7U3644KQJVJNXJNQa8YupSY8G5pfOmNg0oT4SdFbdfAjKT2kWBCDWR4rI+L/5j1OAB7H6vQYoLTeRTL88veuarL5e42/v/GjhYl92gub5xbAnu7iNndRSDhh19S+dibiAoU4kUgY6dfmvsnJLx9VfnlhB1gCc8ykhAFxKr4qhdFQjddYVyakOrMPtk0YgMpOXCqMSJiOhFwyZOX+YWz4ArV846V2Ty6O2VksEyAEaZfhNwS7dkmMZSjYHlVopzmxUQCYhomyGafh/a4Zup3ASqajmCOAeRMfmGmGJiG/jSJui83oKmUdBDq5urZbSbumBxsaBtapgA5JCYtyZ/iODSAPHz5/iPEMyYZk/UfQWqwuU5Nly156k+Zp54lbKShnEFNe7113nUqo/7Sk0fs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(47076005)(36860700001)(316002)(356005)(82740400003)(81166007)(6506007)(6486002)(26005)(54906003)(70206006)(336012)(6512007)(2616005)(70586007)(5660300002)(8676002)(6862004)(36756003)(33656002)(86362001)(4326008)(41300700001)(558084003)(478600001)(8936002)(2906002)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 10:37:38.9209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae40b51-043b-4459-8bba-08dbdf7d9060
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8393
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 10:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8436

VGhpcyBwYXRjaCBkZXBlbmRzIG9uIGNoYW5nZXMgaW4gb2UtY29yZSBtYXN0ZXIsIGJ1dCBhcyB0
aGVyZSBpcyBubyBuYW5iaWVsZCBicmFuY2ggb2YgbWV0YS12aXJ0dWFsaXNhdGlvbiBhdCBwcmVz
ZW50IGl04oCZcyBub3QgcG9zc2libGUgdG8gdXNlIG1ldGEtdmlydCB3aXRoIG5hbmJpZWxkIGFu
eW1vcmUuDQoNCkNhbiB0aGlzIGVpdGhlciBiZSByZXZlcnRlZCwgb3IgYSBicmFuY2ggY3JlYXRl
ZD8NCg0KUm9zcw==

