Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.73])
 by mx.groups.io with SMTP id smtpd.web11.13648.1595515216898371200
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 07:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ay1GOzP5;
 spf=pass (domain: arm.com, ip: 40.107.15.73, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cus/4CmyU+/ReaeMjY7y3Hf5ZWzU6kGaorlSGue622A=;
 b=Ay1GOzP5IJMQplUizwWmPe31kA4D0pfrIe/YN/OGp1lAoG3z6R9U+qAp6S1cUz7XOQN6w8uzV0GGoVTR2GFFyEy1amn+9gi+UUpMV7ZE1UQK02YjsMHo805Ecr/RG7VjZAZNrUK0hl6DfZwsWVRXjFoaq7LDPjl7QkgYlg+u6JM=
Received: from AM7PR03CA0012.eurprd03.prod.outlook.com (2603:10a6:20b:130::22)
 by VI1PR08MB2813.eurprd08.prod.outlook.com (2603:10a6:802:1b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 14:40:14 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::be) by AM7PR03CA0012.outlook.office365.com
 (2603:10a6:20b:130::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Thu, 23 Jul 2020 14:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Thu, 23 Jul 2020 14:40:13 +0000
Received: ("Tessian outbound c4059ed8d7bf:v62"); Thu, 23 Jul 2020 14:40:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b81f97cd7a590c00
X-CR-MTA-TID: 64aa7808
Received: from 6a5894f4fa05.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E92FA3A1-868E-479D-B490-9CAE1ADAB395.1;
	Thu, 23 Jul 2020 14:40:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a5894f4fa05.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Jul 2020 14:40:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mduTIJrgByhURXRZ+v0iyM7kbUr+T68Lv8+1ANhoaBX8b9ZyUUMKEekmPIYrCuEX4fdXiHpiyP7WQrshILu4xtT5PsUpoTZp9P6P3fDqTvEuo8qbd+vyZUY10juUnzOdQJgK5xh9YxCqLE2WACV/60HTwqXh/7DFU7TW6HTTtMyicl4WYeTveClBXXH1iiiEgtnGA7TMY2j3rtXe5fVmgTh5axSPrU1TOsUe6C+zBWdqu9ogC7BDoaNtAFicHsXQxqYFyJYAR8Jl9XuqRyAy7Hrj8sGHWQkZQxHTs+rUGYOSO0yu8F7HEAGsobNGjp167sm3tBDweZw5tiFGf3BsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cus/4CmyU+/ReaeMjY7y3Hf5ZWzU6kGaorlSGue622A=;
 b=Az4QhEhSn9ZyQKeWWoMTyTcXncDo5L/XWMis89mBZWbBQsTK26Hs4jQy/0Sz4bIx7RiA9zqkYyUptUZouWyfjThf8zUvn5kVpWqa1NZUhOQ64D3p0mqEU4PHHle1y7txjriURU19P22Wpj5kNmL4AH6DaG2c5XHcLCoCc6ukngdRmPtO3mGUorbe27tfN9l967Z42XPrTEzJwbwTa6r0OBzm/iGaf5/OoY8A9d0Z9rs8Yh1SaLUlQpXwXOOQ73/NdSdr+v8e85vdLOBnUiAZptEjiX97gpQIDYXV/qcTsdqJS/W7k3ogOYP084Ao2pd92vPKXZk5+R0PvV4utH+b2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cus/4CmyU+/ReaeMjY7y3Hf5ZWzU6kGaorlSGue622A=;
 b=Ay1GOzP5IJMQplUizwWmPe31kA4D0pfrIe/YN/OGp1lAoG3z6R9U+qAp6S1cUz7XOQN6w8uzV0GGoVTR2GFFyEy1amn+9gi+UUpMV7ZE1UQK02YjsMHo805Ecr/RG7VjZAZNrUK0hl6DfZwsWVRXjFoaq7LDPjl7QkgYlg+u6JM=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15)
 by AM0PR08MB5426.eurprd08.prod.outlook.com (2603:10a6:208:184::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 14:40:06 +0000
Received: from AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22]) by AM0PR08MB3987.eurprd08.prod.outlook.com
 ([fe80::b9b7:c928:1f9b:cb22%5]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 14:40:06 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [meta-virtualization][PATCH] qemu: Remove duplicated xen PACKAGECONFIG
Date: Thu, 23 Jul 2020 15:40:03 +0100
Message-Id: <1595515203-105178-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::20) To AM0PR08MB3987.eurprd08.prod.outlook.com
 (2603:10a6:208:134::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.51) by LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 14:40:05 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 592b40b0-8cb8-425d-1d99-08d82f164f60
X-MS-TrafficTypeDiagnostic: AM0PR08MB5426:|VI1PR08MB2813:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2813EB542B6EDC55F479917892760@VI1PR08MB2813.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:849;OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 x6snRaCWHmEgDnPdsoVxWKQ5AiVM9YnhML+noDoL1cm2ZxBlzvIiXTU9+3cgjy8YJL7RPnT9mTuPCMzg1SYQPsx8NJCAW20bYeZWMbQ4h6sNGlul3JR8HL1KFHjf/rEEc+OfxcfQx5/3h5Ug/MvIwAoZ0f3m+MW6f7ctNA0BGNvCjxFpUn+0QVDilR9Z8lv/75GpzX/1rqbKIc6rFnEErJkNA1fs/bqKYLRFdgXVFwt4+7LgqA5i6W9TiG7Pk9WXgRrj5ECxD0bXx14GNY9YRveJ6Hhg9k8Cx2YmvBpklDdqQP/tPBUoF39QvdJdTFBUgzAg1irQS6r6CzpOZeKYlw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(2616005)(956004)(5660300002)(4744005)(316002)(8676002)(66946007)(66476007)(66556008)(7696005)(8936002)(6916009)(4326008)(52116002)(186003)(36756003)(478600001)(16526019)(26005)(2906002)(44832011)(83380400001)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 xLL1Yx9cSnwtxUl1IWv7EOpF7XJ9gDMZ3O5CNKBh0YRU/oQAIB0rKXwQeeJ/rsVxPQ+DlxQiVDxQYN2YNoS1C+V86x1CE1DUkjls+9tXJ63KxfSZhLrO3u0Os15CulRSct0cqf/iNxnx+7uovMJbxUpYDtHYi2Vx2sZmjA7C8VtN3mDAhIBXxpCBNMBDsonRMXb00/h7VBWOhgfz1jEW45u6zC1/ob+sgKgYwAiKDSlJv6JUTcM4yMK7GSe7KaQok0OwFh194DZMu9EpBoggErN1G0TzwwBt/7KzWe5VElgiHHhJHQf1eLJw5gzPXHZSpzQb5KvAstYDdgv98Ik07HFFN1axYiAlbeyO0uCYF/52wnrJxLdJ18sD8Cf000YCuMErOnn4LAuD2SQpE8JsxsNtoA0P+GbGOcPzwYZnc4A+jWdoTf54Es06KY8wWiTGEvU9l2z/3RQ9bRv3UuHpdMysYniFyFpdehon2UENpJJYOxFuW5rA8KGtRkT42/OE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5426
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c5cb4e93-c3f1-42b3-26ec-08d82f164a9d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ohQyIUtb+PBvfMLnsnaQrTniB4EE/HmYW5aDVJLxsjcHTu2Eg5iAcqCuWOXrcub4ATDlh+zM2l5AESt4gMupIr6l8y7uNQ65KQac+uiUF9XkrSVKVBp1Elph7z8eDQVY10hkFHMoDPUoJA9WNwPtq2D5eEWzAxpCXOnqPHMEU26KZ4ZliuJdc/uOgt1/Rcdyi7VKkrA91J8unf/Cl/QqE1R68EW7trGouDLf6HTENoimTF+KvkWhFTIEdP/cFK7wRSdRP5fmpDsQ/Xr1s0dAnE6qHN/K64oYp1EaYPj+nMObI3DFsaKG+ZMt0CMZ4DkbHPva61LLIaPeZw7bg4T54jQQELyLcAcsUx53kdyK2oN4fxKY57VfhY2zU+C8/U9U0LkOLG3t9jViE5WJ8+OwvA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(956004)(8936002)(70586007)(36756003)(70206006)(4744005)(8676002)(81166007)(47076004)(5660300002)(82740400003)(2906002)(7696005)(2616005)(478600001)(336012)(316002)(26005)(86362001)(4326008)(6916009)(6486002)(44832011)(83380400001)(82310400002)(356005)(16526019)(186003)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:40:13.9310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 592b40b0-8cb8-425d-1d99-08d82f164f60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2813
Content-Type: text/plain

The "meta/recipes-devtools/qemu/qemu.inc" already sets the PACKAGECONFIG[xen].

Change-Id: I60aeecd357f13fab572885db2d3e00c37681d07b
Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-devtools/qemu/qemu_%.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/recipes-devtools/qemu/qemu_%.bbappend b/recipes-devtools/qemu/qemu_%.bbappend
index 998a401..5cca9e1 100644
--- a/recipes-devtools/qemu/qemu_%.bbappend
+++ b/recipes-devtools/qemu/qemu_%.bbappend
@@ -1,3 +1 @@
-PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
-
 require ${@bb.utils.contains('DISTRO_FEATURES', 'vmsep', '${BPN}-package-split.inc', '', d)}
-- 
2.7.4

