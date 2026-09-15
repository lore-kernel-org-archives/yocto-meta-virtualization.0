Return-Path: <kaloyan.rusev@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D38BC88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:53:30 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19513.1789466008163918317
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 02:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@elektrobit.com header.s=selector1 header.b=jCqQjWpV;
 dkim=fail reason="dkim: body hash did not verify" header.i=@elektrobit.com header.s=selector1 header.b=jCqQjWpV;
 spf=pass (domain: elektrobit.com, ip: 52.101.57.138, mailfrom: kaloyan.rusev@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ImX5iRcwClbFEjZzoX1TKRzLcCLc4z7S+1eIiJbBkq1M6jy5fuX2iousmtOfyDy6QdbCTB0vAuUmu/PcsMTaGl1rrpsciwI4pKGBykbVJh/qEFudP4YlCieZv5yYd4XpVTiBZMOkyBA73kR16wnXqbmif3cLHkQWgMdo9AD8pF0PqFW3A7UFHRQ75sFzYqVq0Brex2bDr8cg6BA0mZ8g12PAqq6rDpy6BbKZ17Qh6H9vQFHphNpAbb/B/FOXxLeBG7FjdjlYrwLSI1cl3dAb2ubjgd8uYT1c02/klpWqiNh5YWzZ6t+ykKJcdMHlwHckugoLoPpvengZCZXlP1rxlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnSiCaEZRPIPZ7PqtqO2R0Sa7Al6Tf2HKe98Vnq+CAs=;
 b=ojlEmhmHpir/lWvV86UITTUVffdIAOcYAjFx4cu01osRWUEcdjoo+Wu6TcybM7l3WtnSjKaAtmEBcSku8UdeGmcMViC2O/9WDz8oipNxq4Xkz1joWl5DgbgLLHAlLr4K3uH/6F+zPfgrhuF0kURqtSfRA1VzdtC/tuS/qAF/whRan78Ixe9zvsUQ92QNnk0qRoVfd/fveGJy/86TDveASOrC1tC7jwljctKxGE36LnuYB3avguF/41lMqJZdzPmxLHNAEHF2mAGRGlWaS5N/Hh5adQY15Lf7DgpPXm+Dwtfjlh0LYNoEX7w676sVqHYpm2bMaqu7fXKXFI+WmCmMkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.13.100) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnSiCaEZRPIPZ7PqtqO2R0Sa7Al6Tf2HKe98Vnq+CAs=;
 b=jCqQjWpVjNm5v2qYcfvwANTUuj1G/u0tnwbGtgfozxoVKt1QuRGFN+N1z+iEw4e6fKT9r3awkwGp4/kUZbdEo4aM/SbUqluwGOsupIEftP6QLGbJUXnUrigi6UtqykJ9r31TWQEjSH5SWqxJ7EfmM1tpYJ9yoIgq1UnkQ6QxDLE=
Received: from BYAPR21CA0014.namprd21.prod.outlook.com (2603:10b6:a03:114::24)
 by CH8PR08MB10833.namprd08.prod.outlook.com (2603:10b6:610:2b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 09:53:21 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::59) by BYAPR21CA0014.outlook.office365.com
 (2603:10b6:a03:114::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.4 via Frontend Transport; Tue, 15
 Sep 2026 09:53:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.13.100)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.13.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.13.100; helo=DM5PR08CU004.outbound.protection.outlook.com;
 pr=C
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 09:53:20 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4hkclh0v12z1wdP
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Sep 2026 02:53:20 -0700 (PDT)
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00404.outbound.protection.outlook.com [40.93.13.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Sep 2026 02:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHuAGhWgeC/VodjmKd/63KamlEdVYvMd+veGIIJzcrfSwCcjbb5hN079/gPSgsU5Or1x37htau4n298w2Kh+6AQELMWBqVTgf6YZKSYSJ6aEnhrH+KrJYPHRwqff6BlOQ0U9N/hMSDBjpcdd4gB0+c/+LXWpJ7H17nYxqW1fDXzblIr4MLFal1Q6hh9AXnrRFIH8UPOTsCMkdnUTi6mdHx2poSv7SefRswUYqQ7H+CJc/rHwphtQLIekjb/0RTOWD2k1al6D+WxVk7VbmllX7+uZzNiEbc969fOhmEhsQrgKLDNSWW4NbIbIPztvR1ZRRzjQc4gccicQmBgAoS10gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnSiCaEZRPIPZ7PqtqO2R0Sa7Al6Tf2HKe98Vnq+CAs=;
 b=jevHbZfWbl0Wi1TcGFU5N8lZFWnr3TVWY+wb4cbVQ9r+eC00fVTt/FSsWjp6sYgKA4FWuB9+9+SYzoPDZ4pkwrZ2HhlW0CXy+rFOOYKWggel4cOGjzvkQ+0PIS8h2mx16yK7PlMiFM+n5LDEaHDxkV9Oo2xe4pDbv7y0/aiKISBMaPVl4sLTPWtx4PA9P63afMDY0V7b/OudkOwXsU/GhUmARRvudiFX+kNq54PDsn4qaZ7bnBmvkgqxVaBVRp8i6AjHX47htfhjDQDE4c114O0SbDcWqtfpy69wYyTC5n2T09RJYfAvW2hzLjW7isktQ73sR8vVCsqcyeEF/NAQMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnSiCaEZRPIPZ7PqtqO2R0Sa7Al6Tf2HKe98Vnq+CAs=;
 b=jCqQjWpVjNm5v2qYcfvwANTUuj1G/u0tnwbGtgfozxoVKt1QuRGFN+N1z+iEw4e6fKT9r3awkwGp4/kUZbdEo4aM/SbUqluwGOsupIEftP6QLGbJUXnUrigi6UtqykJ9r31TWQEjSH5SWqxJ7EfmM1tpYJ9yoIgq1UnkQ6QxDLE=
Received: from SA0PR11CA0095.namprd11.prod.outlook.com (2603:10b6:806:d1::10)
 by SA1PR08MB7120.namprd08.prod.outlook.com (2603:10b6:806:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 09:53:14 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com (2603:10b6:806:d1::4)
 by SA0PR11CA0095.outlook.office365.com (2603:10b6:806:d1::10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9
 via Frontend Transport; Tue, 15 Sep 2026 09:53:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 09:53:13 +0000
Received: from DEL03066.ebgroup.elektrobit.com (10.10.189.51) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 15 Sep 2026 11:53:12 +0200
From: <kaloyan.rusev@elektrobit.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Kaloyan Rusev <kaloyan.rusev@elektrobit.com>
Subject: [meta-virtualization][PATCH] Update Ankaios to v1.0.3
Date: Tue, 15 Sep 2026 11:52:04 +0200
Message-ID: <20260915095304.1339104-1-kaloyan.rusev@elektrobit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.10.189.51]
X-ClientProxiedBy: denue6es012.ebgroup.elektrobit.com (10.243.160.140) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender: ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic: 
	SA2PEPF00003F66:EE_|SA1PR08MB7120:EE_|CO1PEPF000075F4:EE_|CH8PR08MB10833:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd18f38-a716-472c-4015-08df130f2c9e
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|18002099003|3023799007|13003099007|10067099003|56012099006|11063799006|5063699009;
X-Microsoft-Antispam-Message-Info-Original: 09GNF7FT7ilJbmRw3zGRB/XkM3w4/AKUT2Rkf0kDeLHCkxgjvQ7ysO8E5HfoJPW8DWlYoXMJToGm0N79SJhDC/wCqBoHwz8js9Iqqn2VM/vN90ZNzcIwSNf6+NGjNc/zXwx+EYH5iH842cPhfLK2+YysVY5qF9xmLYuH50yKloGuSr25htYQYfyRkG/c237bBFEq8MG+ZssKgV2puLNm6pXnA4Jy8VV9pbyK6RSIFKkpUhDGYaQtd8AIGnGb5kgUYlpmfTs6u9ZhA+HKR7ldrBwUjSqqJQ6kHBijGYozhmHKzeV/uI4AA/wHib2YPKkDlyBcvdpy0OdjJ3a5lwu9ALNkhrgPqpmxhT5dHBg5zIqn8iJRSTA0SDw3YQDjy8UcPBQorTT+otVydeFmQ7SQDVefvQSrVyucDSqzFGvKRo60gJhh9xh0YSZyrqx11aX3pfJsTO9rRi4VwnvffaPV9/b5avRB2MOgRVNrO5uDj//b/T+aG11iB6q8TEncQhFzVfsytBiLwQnj/upQJfDqqrItU6JA0InXAcFbhJCXF31we+9DcQpceOJxQxFlze+zN3Bo8UogX5FwVlgig7jZZkLrzOuISRR0sj+xn6tvcy/FC0yORgqHab179dVMFce84bZ5q1DKUnRZ9eGBJdoYnhIPXunBWTN367dIZBSSLM7JGkW4X1BcQo2XYnFxJvrLw96bnst/xJBsPDMSQ0K+lD06HYKf99kxW05q8cIi4mStkuTsoeWghXBmyxVYQYPLs5P/L2lFA4c+TiLz3KwOZnulHip7nbS/HnjrSWyZuWVAamPdCAyIeqfEnWhvAfyV2+QweH4wu6mblhYJxycfPxDTR4apWfDSLNmUv3rjh0ihP3Wyk8oOKf1avT7YCGtCqjHSuoMM765G72AhEwSX0g==
X-Forefront-Antispam-Report-Untrusted: CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(3023799007)(13003099007)(10067099003)(56012099006)(11063799006)(5063699009);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: fdjMw0GeuVKXYUGqjdRFvSE/pn/VAI+NaZ9A2JPkeB5lEGjkazV7OGQ6xXw6NGxfca7nA+gfLDG7laVhszOoNuawheCu4hNHCnp4j8l3KolbPUQYfSWqpgLcxuQ4ala54i0VAJ2HDxuNI5XjTuDifzeeAgLmRcmfGaI9n50YHkFx9DCUw6peZAMoF1GoASaYvr2z9tg39L46C7+00pRqlArS/bj0yB88XyvP39Omti4lR2eyjHus1eFNi6oPdSipFM1MtNOqpm67EX28fKAPdrd6Aq/X3+0zvbw8B4chZAKT3vR8l2qmQPSQTSRPilLAkSE7OFdQaPgeDIbk7MxT6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7120
X-MS-Exchange-SkipListedInternetSender: ip=[40.93.13.100];domain=DM5PR08CU004.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender: ip=[40.93.13.100];domain=DM5PR08CU004.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd46c3f4-70f3-40b6-4a74-08df130f28bd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|14060799003|376014|156008|23010399003|36860700016|18002099003|13003099007|3023799007|10067099003|11063799006|56012099006|5063699009;
X-Microsoft-Antispam-Message-Info: 
	k8EwZ5WjI4OBy4w+EVEtW995fUl97s2LyoYLQjmSw9UGkiYRYtWgrMwM+s8dj9Aoy3K7pYnFObaNoFpuFkoSS5Qx5WTQzyyHLAQ2gXjEEfjpKlQxBDeQ1XLGKlJ5lU1ixMlsjbIriMOKU2ADpk2QGlHTi95s6zly6VkEBJGrfXl2d9GKztRu3HgICMtOO2Nx3WKePmeZmYb56RB81sQNca5EHmSAAPpHq8AA/966AJGabv3QQi/EFTCwrua1W20O+H6M4umFrgwtBUn0QolX6ZmFuCzRnchZlTKeqMMpr3Sl8Ug0HdFoan2aDUleXH4SPGiOxoh+lrFIzDQPS5e2xdg11gVZCtT1lKsktLEB4iVGnWteSJYP5prDXMv9Rj1kDihUfE7mPaUEevEK43XFdsSeE7vPlxqCzt4ay/0KG/yURGqvDKCkIkFL75+vGKOV0eYaxPPz49fxcV8CZ/9+Sw0eEQxPV+VfOfqqvoVZNw0KdnyMD0DKGPpGQAA32vBqnEP+e45iJaPsD9COwGrDuI6udYv/IWZHaxYW8fH3CCibTZ32TZT6JGd5muSkY0xbuA6MrWbJfpGWtqoOGJs6h/Sk9IiL9GflYyPt5lwH2oZcYswBhtUvwHMgq6TMFoB+XDvw0JKgfMxS2oTq1bMsPQccJ7difxOfsRaNpAZVYB6/+TMcaIKddblazN4cTWpinqefbkovb1bzFRULMUrYqEw2g4JPQ5PeXv8U5PDm8msWL873JIeIYD/RLXOBtzIoR1Gwy4srt+S4wfvLilI5ivXwB8Y0vgCFf/crt1xZcU7X/tXipLaO4zwhMY2b8VoKBukkm1jydEXYFblfhYECU0YTGR2ha+E8u0IQLS1ZOq4QTUuRaHcDmMmA3/h144WTKIjHqPzlgBeT7EQJKfuhOQ==
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR08CU004.outbound.protection.outlook.com;PTR:mail-dm5pr08cu00404.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(14060799003)(376014)(156008)(23010399003)(36860700016)(18002099003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(5063699009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gNfGhVvu5eIhKgvHmR6aPTHTLu8+PPd35h0Jm2O9rkv9qSHadMn/iHHyutKN12bMIat5d/zDxSk7DGREoQjW529xLakIlGwYdDOfIU4AqFZBwAA6QuC3hxsSB0aJ724ySeBTJm7bXCaYjUBsaXQKSyqLncQLPO8sI+98vFKuZfqNHpEzTm2scLCspuJbNfQylFkoIITe7fUWn8Il2bqFivXIt3K80fhystUCYrdVEKBvt+NeCswyMr2B1BFiFJelOYIVHqoz24L4Od0QZcw2i0xdGN9ZLMAcMr+8uBZ5vvw3sdYKM+vBhi/8llp1MoGOP5O9BunArcWG+S1h0PLi9tdYh3TQ3nh08pPCQxZuopufN03hCzQaLPNFe0YiDxhqrjwKMLU8cT9y7wYpAxztXZGJfZMBvudhoAATNK7RgZkIAjSCkGUA+SG2jMB3FA4M
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:53:20.2981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd18f38-a716-472c-4015-08df130f2c9e
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR08MB10833
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Sep 2026 09:53:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10076

From: Kaloyan Rusev <kaloyan.rusev@elektrobit.com>

This patch release contains security fixes for the the following CVEs:
* https://www.cve.org/cverecord?id=3DCVE-2026-84173
* https://www.cve.org/cverecord?id=3DCVE-2026-85201
* https://www.cve.org/cverecord?id=3DCVE-2026-86836
---

Hi Bruce,

the patch updates to the newest Ankaios version which addresses 3 recent CV=
Es.

Thanks a lot for your time and efforts!

Best regards,
Kaloyan

 recipes-containers/ankaios/ankaios-crates.inc | 20 +++++-----------
 recipes-containers/ankaios/ankaios_git.bb     |  6 ++---
 recipes-extended/images/README-ankaios.md     | 23 +++++++++++++++++++
 3 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/recipes-containers/ankaios/ankaios-crates.inc b/recipes-contai=
ners/ankaios/ankaios-crates.inc
index cffef0ce..4dbd8c46 100644
--- a/recipes-containers/ankaios/ankaios-crates.inc
+++ b/recipes-containers/ankaios/ankaios-crates.inc
@@ -32,7 +32,7 @@ SRC_URI +=3D " \
     crate://crates.io/cc/1.2.61 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/chacha20/0.10.0 \
+    crate://crates.io/chacha20/0.10.2 \
     crate://crates.io/chrono/0.4.44 \
     crate://crates.io/clap/4.6.1 \
     crate://crates.io/clap_builder/4.6.0 \
@@ -92,7 +92,7 @@ SRC_URI +=3D " \
     crate://crates.io/getrandom/0.2.17 \
     crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.2 \
-    crate://crates.io/h2/0.4.13 \
+    crate://crates.io/h2/0.4.16 \
     crate://crates.io/handlebars/6.4.0 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.16.1 \
@@ -186,7 +186,6 @@ SRC_URI +=3D " \
     crate://crates.io/portable-atomic-util/0.2.7 \
     crate://crates.io/potential_utf/0.1.5 \
     crate://crates.io/powerfmt/0.2.0 \
-    crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/predicates/2.1.5 \
     crate://crates.io/predicates-core/1.0.10 \
     crate://crates.io/predicates-tree/1.0.13 \
@@ -203,10 +202,7 @@ SRC_URI +=3D " \
     crate://crates.io/quote/1.0.45 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/rand/0.9.4 \
-    crate://crates.io/rand/0.10.1 \
-    crate://crates.io/rand_chacha/0.9.0 \
-    crate://crates.io/rand_core/0.9.5 \
+    crate://crates.io/rand/0.10.2 \
     crate://crates.io/rand_core/0.10.1 \
     crate://crates.io/redox_syscall/0.5.18 \
     crate://crates.io/ref-cast/1.0.25 \
@@ -401,7 +397,7 @@ SRC_URI[bytes-1.11.1.sha256sum] =3D "1e748733b7cbc798e1=
434b6ac524f0c1ff2ab456fe201
 SRC_URI[cc-1.2.61.sha256sum] =3D "d16d90359e986641506914ba71350897565610e8=
7ce0ad9e6f28569db3dd5c6d"
 SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb082=
c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[chacha20-0.10.0.sha256sum] =3D "6f8d983286843e49675a4b7a2d174efe13=
6dc93a18d69130dd18198a6c167601"
+SRC_URI[chacha20-0.10.2.sha256sum] =3D "65c35e4b699c7e15ccbe7ee35c005e4fc0=
a278d22238a2857e6ce2dadeda1b06"
 SRC_URI[chrono-0.4.44.sha256sum] =3D "c673075a2e0e5f4a1dde27ce9dee1ea4558c=
7ffe648f576438a20ca1d2acc4b0"
 SRC_URI[clap-4.6.1.sha256sum] =3D "1ddb117e43bbf7dacf0a4190fef4d345b9bad68=
dfc649cb349e7d17d28428e51"
 SRC_URI[clap_builder-4.6.0.sha256sum] =3D "714a53001bf66416adb0e2ef5ac8571=
40e7dc3a0c48fb28b2f10762fc4b5069f"
@@ -461,7 +457,7 @@ SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51f=
d72272d7821adaf274ad91c2882
 SRC_URI[getrandom-0.2.17.sha256sum] =3D "ff2abc00be7fca6ebc474524697ae276a=
d847ad0a6b3faa4bcb027e9a4614ad0"
 SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ecec1=
38e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.2.sha256sum] =3D "0de51e6874e94e7bf76d726fc5d13ba782=
deca734ff60d5bb2fb2607c7406555"
-SRC_URI[h2-0.4.13.sha256sum] =3D "2f44da3a8150a6703ed5d34e164b875fd14c2cda=
b9af1252a9a1020bde2bdc54"
+SRC_URI[h2-0.4.16.sha256sum] =3D "a9f37a958b41b3b19ee2707c06439c0e9e547e84=
7223eb791ecb0cb821c65e27"
 SRC_URI[handlebars-6.4.0.sha256sum] =3D "9b3f9296c208515b87bd915a2f5d1163d=
4b3f863ba83337d7713cf478055948e"
 SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd930=
01ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.16.1.sha256sum] =3D "841d1cc9bed7f9236f321df977030373f=
4a4163ae1a7dbfe1a51a2c1a51d9100"
@@ -555,7 +551,6 @@ SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471=
896f1c69cecef8d20cbe2f7accd
 SRC_URI[portable-atomic-util-0.2.7.sha256sum] =3D "c2a106d1259c23fac8e5432=
72398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
 SRC_URI[potential_utf-0.1.5.sha256sum] =3D "0103b1cef7ec0cf76490e969665504=
990193874ea05c85ff9bab8b911d0a0564"
 SRC_URI[powerfmt-0.2.0.sha256sum] =3D "439ee305def115ba05938db6eb1644ff941=
65c5ab5e9420d1c1bcedbba909391"
-SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc30=
deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[predicates-2.1.5.sha256sum] =3D "59230a63c37f3e18569bdb90e4a89cbf5=
bf8b06fea0b84e65ea10cc4df47addd"
 SRC_URI[predicates-core-1.0.10.sha256sum] =3D "cad38746f3166b4031b1a0d39ad=
9f954dd291e7854fcc0eed52ee41a0b50d144"
 SRC_URI[predicates-tree-1.0.13.sha256sum] =3D "d0de1b847b39c8131db0467e9df=
1ff60e6d0562ab8e9a16e568ad0fdb372e2f2"
@@ -572,10 +567,7 @@ SRC_URI[pulldown-cmark-to-cmark-22.0.0.sha256sum] =3D =
"50793def1b900256624a7094394
 SRC_URI[quote-1.0.45.sha256sum] =3D "41f2619966050689382d2b44f664f4bc593e1=
29785a36d6ee376ddf37259b924"
 SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] =3D "f8dcc9c7d52a811697d2151c701e0d08956f92=
b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[rand-0.9.4.sha256sum] =3D "44c5af06bb1b7d3216d91932aed5265164bf384=
dc89cd6ba05cf59a35f5f76ea"
-SRC_URI[rand-0.10.1.sha256sum] =3D "d2e8e8bcc7961af1fdac401278c6a831614941=
f6164ee3bf4ce61b7edb162207"
-SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5f1df60f26e1ffddd6c66e8aa1=
5de382ae63b3a0c1bfc0e4d3e3f325cb"
-SRC_URI[rand_core-0.9.5.sha256sum] =3D "76afc826de14238e6e8c374ddcc1fa19e3=
74fd8dd986b0d2af0d02377261d83c"
+SRC_URI[rand-0.10.2.sha256sum] =3D "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e=
4c55fa90477bef2dfcdbc4be80"
 SRC_URI[rand_core-0.10.1.sha256sum] =3D "63b8176103e19a2643978565ca18b5054=
9f6101881c443590420e4dc998a3c69"
 SRC_URI[redox_syscall-0.5.18.sha256sum] =3D "ed2bf2547551a7053d6fdfafda3f9=
38979645c44812fbfcda098faae3f1a362d"
 SRC_URI[ref-cast-1.0.25.sha256sum] =3D "f354300ae66f76f1c85c5f84693f0ce81d=
747e2c3f21a45fef496d89c960bf7d"
diff --git a/recipes-containers/ankaios/ankaios_git.bb b/recipes-containers=
/ankaios/ankaios_git.bb
index a9fea90b..da172f8d 100644
--- a/recipes-containers/ankaios/ankaios_git.bb
+++ b/recipes-containers/ankaios/ankaios_git.bb
@@ -20,7 +20,7 @@ COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
 # Build dependencies
 DEPENDS +=3D "protobuf-native"
=20
-PV =3D "1.0.1+git"
+PV =3D "1.0.3+git"
=20
 SRC_URI =3D "\
     git://github.com/eclipse-ankaios/ankaios.git;protocol=3Dhttps;branch=
=3Drelease-1.0 \
@@ -36,9 +36,9 @@ SRC_URI =3D "\
     file://ank-agent.default \
 "
=20
-# v1.0.1 tag commit
+# v1.0.3 tag commit
 # When bumping SRCREV, re-diff upstream deny.toml and re-check LICENSE aga=
inst the crate graph.
-SRCREV =3D "cde70616706b58fd03e4de3f7423addaffa58720"
+SRCREV =3D "3f7ab7f148e814c57cb7de1e2bb11b9a05b7814b"
=20
 # cargo-update-recipe-crates provides the `update_crates` task used to
 # regenerate ankaios-crates.inc after an SRCREV bump.
diff --git a/recipes-extended/images/README-ankaios.md b/recipes-extended/i=
mages/README-ankaios.md
index de8a05e6..47776edb 100644
--- a/recipes-extended/images/README-ankaios.md
+++ b/recipes-extended/images/README-ankaios.md
@@ -31,6 +31,29 @@ do not. systemd is required (enforced via `REQUIRED_DIST=
RO_FEATURES`) because it
 mounts cgroups and configures DNS out of the box; with sysvinit you have t=
o do
 both manually before podman can run a workload.
=20
+> **Note: netavark needs the native nftables kernel modules.** podman's de=
fault
+> network backend (netavark) builds its firewall ruleset with the native
+> nftables expression modules (`nft_ct`, `nft_nat`, `nft_chain_nat`, `nft_=
masq`,
+> `nft_reject`, `nft_compat`). The stock `linux-yocto` kernel builds these=
 as
+> loadable modules, which a minimal image does not pull in automatically. =
Without
+> them the workload never starts and netavark fails at container creation =
with:
+>
+> ```
+> nft ... Error: Could not process rule: No such file or directory
+> ```
+>
+> Make sure they are present in your image (they live outside this layer),=
 e.g.:
+>
+> ```bitbake
+> IMAGE_INSTALL:append =3D " \
+>     kernel-module-nft-ct kernel-module-nft-nat kernel-module-nft-chain-n=
at \
+>     kernel-module-nft-masq kernel-module-nft-reject kernel-module-nft-re=
ject-inet \
+>     kernel-module-nft-compat"
+> ```
+>
+> On a kernel that builds these features in (`=3Dy`) the modules and their
+> `kernel-module-*` packages do not exist, and none of this is needed.
+
 ## Build
=20
 ```shell
--=20
2.43.0


