Return-Path: <kaloyan.rusev@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6A8C88E7B
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 12:23:34 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.123])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21611.1789475008658217764
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 05:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@elektrobit.com header.s=selector1 header.b=T1vOU10C;
 dkim=fail reason="dkim: body hash did not verify" header.i=@elektrobit.com header.s=selector1 header.b=T1vOU10C;
 spf=pass (domain: elektrobit.com, ip: 52.101.48.123, mailfrom: kaloyan.rusev@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I95msHP3SmaI5MGZrIqMNVfcLxDH2ZYSghZ8NP9AuKSL8EYHZKcLfMojNuGLsmvJpwMNnbWPmRPR22s5MGZ6vvgPVdAtHug0SNoUv4EXuV7bwu/l6RO+Q2C1k/jBBn9FitSf+IqDLMjkoYxFix4Qs5RWBVQkcNeDfDNexmCpB9LtAjXU7H5NiBmYsE5Tjk5VIOaS4pMAKXPOijXL2kXKI4DYfDZvcYYsZQl5WiJtiiAit3D3XqjVMtn9fFIfY2CgWP5sUg8cB07LODetA0EKfLHRpsvPbChPC3DxIV1yTvTPOll4cMNgR5JGeQskkw1O+97Qa2+SrUD6Pou7ftKYUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNItDBQdbMNj8/c9iY/neyXC+SmhY2fYjnyPz+FWPH4=;
 b=KoqgW2qj3+y+CLR3iqCMaKl4g+fYQm72OCHWz0xXZND3oQkt5QBULyuYRckNqiegD5d5N2DjFI6p5du7a2sdy76AmB0SOsDSjm27eoVycTD3hzBZeb4GYsWPY65coxP/DLRrIMlI9gYnPsEBQZpZOZlbmFKjbzepUNb+y5RP4+NMW+HCWK7/oxSUWm/NGoRVZVe5GOZbn00I7LHGDy+azur5pkFDOp6TdH5RplZ6zZ/6H5FwG8EV/9k/uMzxDl9geOZtYZa0TNvJv/NWqksU3R4hbuK+uduLzS3Ghngpoj67bIS4vEy0Cc3WQmsHZkIl28aDxCkx9UWzuJEmUzI51A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.6.105) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNItDBQdbMNj8/c9iY/neyXC+SmhY2fYjnyPz+FWPH4=;
 b=T1vOU10ClTVsOIu84ty+RCy+Mao0hs/VDwq/X3dGOnDL8BdW95Cm69tZBa+fr8AY1u6iMubJncIAnhJDw+FGz65an4CYdtLHxcilafxpEXy764f6IYqQWCP1sISXud0CmOc+iXQRr/VITYqLMlLjoI8Ya4LSM/Itws2jRbcfbUY=
Received: from CH2PR15CA0004.namprd15.prod.outlook.com (2603:10b6:610:51::14)
 by PH7PR08MB8580.namprd08.prod.outlook.com (2603:10b6:510:248::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 12:23:14 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::a4) by CH2PR15CA0004.outlook.office365.com
 (2603:10b6:610:51::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 12:23:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.6.105)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.6.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.6.105; helo=CY3PR08CU001.outbound.protection.outlook.com;
 pr=C
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Tue, 15 Sep 2026 12:23:13 +0000
Received: from usbth1es003 (localhost [127.0.0.1])
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with SMTP id 4hkh4c6X47z1wdQ
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Sep 2026 05:23:12 -0700 (PDT)
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00101.outbound.protection.outlook.com [40.93.6.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Sep 2026 05:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rk94VPm8mCT1UtbNxkP7+1gqQnPyXI71I84QNescD1t0KJGDNp1kY5ZotgmS1/K8C0CpUuAVpUrTWA+MOib0lYxa7DOtfVv9Ti1rhBd8FsOAe1zB8ZftpdBoUKl6y2MSMq3w2QOrqqwb7cz84qt9gagrCEw8XRN5cE6y6g03h+mAySOGGcA3+NF4nljZciQaHmjDhQlZK3ATuZhuK2R4iKcUN9S5jy2vjPqe0DMbIKd1al/fKJVj6frglVDhDfCAySQ+nC9Wh9zOgkpaTDbV8LepkQ8hwji99knKhtvXabR/3VbPDKKDm/QZWVOj7CLmTv2tsrRvV8JIWsJFgRHQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNItDBQdbMNj8/c9iY/neyXC+SmhY2fYjnyPz+FWPH4=;
 b=xoaMsUr2V7m0el8WmIGHNaIC56Vn7VgitxZPmrHi5AZOIVFpyzCYZkkQthjJ11QEAT30njKyzzpNZRh9Y4EbrDdjnWNX2hPT27rYux4zX42zEueqxE5eWuAS8Gy1tTKqDqcPKkNlZ0mM8TcOjntJ62egP1oq7q0qI1fyOMH7jXUJUlIBxa9z14Fyy/Lyphwx6gmKxb0KVkqOo6eZeancLVM3N+AiHNcDn9mBZuTDNigP35WBxDlHh0Pd3K4zq9GJEdaVt+EJUnqE2PuvAK+a4SGdQxFfq9IEDH4vexJxGI/zpq7GK6LLmBwFY8EzemhwO449a6K21u7XMAQ481DK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNItDBQdbMNj8/c9iY/neyXC+SmhY2fYjnyPz+FWPH4=;
 b=T1vOU10ClTVsOIu84ty+RCy+Mao0hs/VDwq/X3dGOnDL8BdW95Cm69tZBa+fr8AY1u6iMubJncIAnhJDw+FGz65an4CYdtLHxcilafxpEXy764f6IYqQWCP1sISXud0CmOc+iXQRr/VITYqLMlLjoI8Ya4LSM/Itws2jRbcfbUY=
Received: from SJ0PR05CA0109.namprd05.prod.outlook.com (2603:10b6:a03:334::24)
 by SJ0PR08MB973125.namprd08.prod.outlook.com (2603:10b6:a03:403::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 12:23:01 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::9f) by SJ0PR05CA0109.outlook.office365.com
 (2603:10b6:a03:334::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7 via Frontend Transport; Tue, 15
 Sep 2026 12:23:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 12:23:00 +0000
Received: from DEL03066.ebgroup.elektrobit.com (10.10.189.51) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 15 Sep 2026 14:22:58 +0200
From: <kaloyan.rusev@elektrobit.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Kaloyan Rusev <kaloyan.rusev@elektrobit.com>
Subject: [meta-virtualization][wrynose][PATCH] ankaios: add Eclipse Ankaios container orchestrator recipe at v1.0.3
Date: Tue, 15 Sep 2026 14:08:51 +0200
Message-ID: <20260915122238.1558501-1-kaloyan.rusev@elektrobit.com>
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
	SJ1PEPF0000231B:EE_|SJ0PR08MB973125:EE_|CH1PEPF0000A347:EE_|PH7PR08MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd9b4da-6c9e-44ac-5381-08df13241d2c
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|6133799003|10086099003|18002099003|13003099007|3023799007|10067099003|11063799006|56012099006|5063699009;
X-Microsoft-Antispam-Message-Info-Original: a+rP0Iz9+rhwqKDUP4WlzW3LDqP03xAVrmrj4FCGq1fDXxnCiHuO26mcvC4JmaWeXNnXnXWBairXAFFF3F3qoL4UagWx/SuA68beEoSkTLrswdOwFI0oRuM+vJ04cvYttjlqDTqWfOTZ8TV2sAi1q25EG8GAcUFi0/foI3VhCe0GXnPOmr/a8my0ZfpgPY62vlKAUGqGy6X7KoDOW1z5cLc2vUHqIQs/7ydqejf4rQ3KcS9RSuLI+6iFbNOucXCJZqwJnMlTEyGmDOZBqMfde0wp4T9TFxxXaIFZT6J0PoF07dCMk8fZXLCL+DLqqUGD+Qkdgv9kH4JOIXBuBfCMs7DBhrmdyGNmd7orYXtDXiOQeKJOQLQgdMT6aihjASb8JJ7CSf9FabjRceLCA6RBgNn765TRQ42r8avHiGEwyATRHIQ4Bx+NVzRjzKGTXt1OzyxnNa6QwFgtwD6Y5j1BpJFE51RI0G8bW0HRdX7Pkhd3U0mfQezLDWR/RG9spYSwAXmlAy9Xhg+A+973qfxOw51ugW/35n3qxjnAzNzEWf6YNrUN5Iioc7Ug0JAw0uQ+lMeoLMD5FoLczbKtgu86hKL3UX+ukcEyA8o9h50QCkft+VRWqqeQJfhGJo8cnIa9edVqdm5/knmwoiSlABt4CavCTVU6iA2WQXk+MN6H9R8hA5ilbOH9oQ1nDPUG3Vq9Qr27hNragoD3nwtYSJE6gz0yBJ3s4xzfhmS2uAg6d3cvLX4k7I5au3DEAReLGbzvACg3mmmiszjmFewM2BZw5dM9nRFqr9cm4qp0yBEDwpuBv+V4nuDsWOirzBObYzFtTsOcSJQbSIAVyKOGU41SnN+ebKw4058UqWd3+F6oqbX0vzwXcKsK1zCuoHeSAKjyx1vr9g9s45PDcJanCzik8OSJVQEjuGdgsG9YxWbAaJ0=
X-Forefront-Antispam-Report-Untrusted: CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(6133799003)(10086099003)(18002099003)(13003099007)(3023799007)(10067099003)(11063799006)(56012099006)(5063699009);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: 0McEOgTxd0+fhqfDJ0BMW8lLR7NGm7oPjrmwzX8Wo/uAs3RresafG0lN3qO1BO5WhMa4L3RYD7hsvN8K6oIZEgk3U7H0ODLRqlyFNTebLzKLwbcavlKPjo47lbaezFKSJ6LCaWtkzPRe/ImxcvESsh17xXczK0/R6dTpvCuP7t3kzkINU5OkZw6DcubMPhqYR4I2ePdZ5XacSFuoc5D/+T6Vs9Ma51PwcptjldwDhBTtAc9D8TdvTI0DWSdZYvMRovkubxs5dc6ZHA7Xd5cy4BA5ZxT/LIppzBMd5NcE9Esh4zZ/XXNkaTbvoIpx96eS9dPrtzc759NULoXy5v99vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB973125
X-MS-Exchange-SkipListedInternetSender: ip=[40.93.6.105];domain=CY3PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender: ip=[40.93.6.105];domain=CY3PR08CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9f3f7c44-d4c0-457b-716d-08df13241527
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|23010399003|376014|35042699022|156008|36860700016|10067099003|3023799007|10086099003|6133799003|18002099003|11063799006|5063699009|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	vaPjedF+LZw9dJVzZvoCz13ibGMRRD/A8wKRb/bH6Se9nEoCDdyaJi2t8Q5lt4jgjnH2N2bYtnTPUBlU/p3M/D2uIpD8Qxbh8hjPy1BcwNcqeoy5gkrdGtPRDAgAPkbcV7otp+rKSrF26Cy9PKeh3nT0GInaN2ZXgk7yUZuVag6SaeZMNiYUKZqbJ83CHwDVQ0RTdT8mfKn00wrZVH5t8BFwOJrYd0CnqZP6EjL1GMQD+xPWVQr6LUDrVGFkyT79o5xyM+UxdGgR6b/eThaM/GiBU/Hj7IKeft9H8EvkT+krkG/gZGUTuOWsO5OlCw2Jb45K/IUjlSyUfZvTDlZVGMgnmmh7lO4ItCgBStaY94MEQesHlJtWrW3J7bLU7pFVa7ZhiC89DRd3s6ZesskfSFUcl/UaKyUouVdI3JNGfh29MZ0ReAoPMAbHdYOHiHxY6hwM3nwXCjNDnx5xvkFaLWPCZjkHoHBORKTZt2fr5bqz8ful28dkX6AwdmikZIzAYQd5O2Fd3B9WpWRyd22JOucNv1MGMOlXZovEd7ne9964OPFFPgK41j97QrZZiPis3nfvBMANsFoq5wGO3IYX1BzrNDzwmwT7oEx4Png+TQsiPLqOH9OYPWaFmxMsCkbf7msKF12+uZuA6mX5/Ql/Le7tohQjW0Y4dYZQDcS3UV4fVWUlskBySnFMT5IB9nYseSVAjk98yBSnQOCwDu5Nk78SZd98yC/pOE5rXnXTe5vXYERKikTlyARQEuGHmkD5EcRgxRmlEp1k5diYG6UiiZYFjs06GfakalftCoDqOFnB623ej+4XmE3UcDLSglOBKtYj+KDaIQaDuMlDEoYxdjz5+jEclBFrTAHaRsrOPnXPHv/16USWKEF3Sw7tG7BezBTAeVfJlo6ENlSCequvIoUlYBqqAdBxCEhL4ZLtw6g=
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY3PR08CU001.outbound.protection.outlook.com;PTR:mail-cy3pr08cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(23010399003)(376014)(35042699022)(156008)(36860700016)(10067099003)(3023799007)(10086099003)(6133799003)(18002099003)(11063799006)(5063699009)(56012099006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hcF6VcWFd3JriUM2ou8LOad0yGwuuZgwn9L5tL/pQPEXoGXJnDX8czmUu3bv7ai+0izmfcgdULN/ag+6kKMNx5fllePW82aLcO/YfhbmukhF5/nu5w1aeDcsHQtmTw06CI63zOefYULWLbRrc3iZEnfjXOKGzMKtITCTwV3ycyNT+cQfXi8nzBcRX4lBoEbylg6hIki2UwS5j53Pm2GwAP/bPrjoScGd0WRMFVxrRNd8XADTpS7FQnCNeXFPk6wim7ewF/pag4DhjWQjckCpLvWzZs6q2BKP+LVLduongXjGbzRdoVAZxFxwMWSuvpKhaw9YD9pEzUqn+iM40Y4uJAkznnAJg86teFY3IiZUTJH7XUme+YnUWZhC7V/XGsm5NySoWVN8tDpSqOqooJhSKUyjrIh2+x0qavjvy7Yx/XPbdw1l+qsSfOi2T7j3smRi
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:23:13.6123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd9b4da-6c9e-44ac-5381-08df13241d2c
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR08MB8580
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Sep 2026 12:23:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10077

From: Kaloyan Rusev <kaloyan.rusev@elektrobit.com>

Eclipse Ankaios (https://eclipse-ankaios.github.io/ankaios/latest/) is a li=
ghtweight workload orchestrator for embedded and automotive systems (part o=
f the Eclipse SDV initiative).  It manages OCI containers across one or mor=
e nodes through a central server and per-node agents, providing a declarati=
ve desired-state model with a small resource footprint.  Workloads are desc=
ribed in a manifest and reconciled by the server, while the CLI is used to =
apply state and inspect the cluster.

The recipe splits the output into ank-server, ank-agent and ank (CLI) packa=
ges, with a meta package pulling them together, and ship default configurat=
ion plus systemd units and sysvinit scripts gated on the corresponding DIST=
RO_FEATURES.  Additionally a minimal example image is provided to preproduc=
e and end-to-end workflow.
---

Hi Bruce,

this is the backported recipe for wrynose including the CVE fixes from mast=
er.
The only differences are:
* LICENSE uses '&' operators instead of 'AND' as this is the standard on wr=
ynose.
* the image README skips the note about nftables as no extra handling is ne=
eded on wrynose

Thanks a lot for your time and efforts!

Best regards,
Kaloyan

 recipes-containers/ankaios/ankaios-crates.inc | 732 ++++++++++++++++++
 recipes-containers/ankaios/ankaios_git.bb     | 135 ++++
 recipes-containers/ankaios/files/ank-agent    |  96 +++
 .../ankaios/files/ank-agent.conf              |  49 ++
 .../ankaios/files/ank-agent.default           |   8 +
 .../ankaios/files/ank-agent.service           |  10 +
 recipes-containers/ankaios/files/ank-server   |  96 +++
 .../ankaios/files/ank-server.conf             |  40 +
 .../ankaios/files/ank-server.default          |   8 +
 .../ankaios/files/ank-server.service          |  10 +
 recipes-containers/ankaios/files/ank.conf     |  54 ++
 recipes-containers/ankaios/files/state.yaml   |  12 +
 recipes-extended/images/README-ankaios.md     |  96 +++
 .../images/ankaios-image-minimal.bb           |  39 +
 .../images/ankaios-image-minimal/state.yaml   |  11 +
 15 files changed, 1396 insertions(+)
 create mode 100644 recipes-containers/ankaios/ankaios-crates.inc
 create mode 100644 recipes-containers/ankaios/ankaios_git.bb
 create mode 100644 recipes-containers/ankaios/files/ank-agent
 create mode 100644 recipes-containers/ankaios/files/ank-agent.conf
 create mode 100644 recipes-containers/ankaios/files/ank-agent.default
 create mode 100644 recipes-containers/ankaios/files/ank-agent.service
 create mode 100644 recipes-containers/ankaios/files/ank-server
 create mode 100644 recipes-containers/ankaios/files/ank-server.conf
 create mode 100644 recipes-containers/ankaios/files/ank-server.default
 create mode 100644 recipes-containers/ankaios/files/ank-server.service
 create mode 100644 recipes-containers/ankaios/files/ank.conf
 create mode 100644 recipes-containers/ankaios/files/state.yaml
 create mode 100644 recipes-extended/images/README-ankaios.md
 create mode 100644 recipes-extended/images/ankaios-image-minimal.bb
 create mode 100644 recipes-extended/images/ankaios-image-minimal/state.yam=
l

diff --git a/recipes-containers/ankaios/ankaios-crates.inc b/recipes-contai=
ners/ankaios/ankaios-crates.inc
new file mode 100644
index 00000000..4dbd8c46
--- /dev/null
+++ b/recipes-containers/ankaios/ankaios-crates.inc
@@ -0,0 +1,732 @@
+# Autogenerated with 'bitbake -c update_crates ankaios'
+
+# from Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/ahash/0.8.12 \
+    crate://crates.io/aho-corasick/1.1.4 \
+    crate://crates.io/allocator-api2/0.2.21 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/anstream/1.0.0 \
+    crate://crates.io/anstyle/1.0.14 \
+    crate://crates.io/anstyle-parse/1.0.0 \
+    crate://crates.io/anstyle-query/1.1.5 \
+    crate://crates.io/anstyle-wincon/3.0.11 \
+    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/asn1-rs/0.7.1 \
+    crate://crates.io/asn1-rs-derive/0.6.0 \
+    crate://crates.io/asn1-rs-impl/0.2.0 \
+    crate://crates.io/async-trait/0.1.89 \
+    crate://crates.io/atomic-waker/1.1.2 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/axum/0.8.9 \
+    crate://crates.io/axum-core/0.5.6 \
+    crate://crates.io/base64/0.22.1 \
+    crate://crates.io/bit-set/0.8.0 \
+    crate://crates.io/bit-vec/0.8.0 \
+    crate://crates.io/bitflags/2.11.1 \
+    crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/borrow-or-share/0.2.4 \
+    crate://crates.io/bumpalo/3.20.2 \
+    crate://crates.io/bytecount/0.6.9 \
+    crate://crates.io/bytes/1.11.1 \
+    crate://crates.io/cc/1.2.61 \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/cfg_aliases/0.2.1 \
+    crate://crates.io/chacha20/0.10.2 \
+    crate://crates.io/chrono/0.4.44 \
+    crate://crates.io/clap/4.6.1 \
+    crate://crates.io/clap_builder/4.6.0 \
+    crate://crates.io/clap_complete/4.6.2 \
+    crate://crates.io/clap_derive/4.6.1 \
+    crate://crates.io/clap_lex/1.1.0 \
+    crate://crates.io/colorchoice/1.0.5 \
+    crate://crates.io/convert_case/0.10.0 \
+    crate://crates.io/core-foundation-sys/0.8.7 \
+    crate://crates.io/cpufeatures/0.2.17 \
+    crate://crates.io/cpufeatures/0.3.0 \
+    crate://crates.io/crossterm/0.29.0 \
+    crate://crates.io/crossterm_winapi/0.9.1 \
+    crate://crates.io/crypto-common/0.1.7 \
+    crate://crates.io/darling/0.20.11 \
+    crate://crates.io/darling_core/0.20.11 \
+    crate://crates.io/darling_macro/0.20.11 \
+    crate://crates.io/data-encoding/2.11.0 \
+    crate://crates.io/der-parser/10.0.0 \
+    crate://crates.io/deranged/0.5.8 \
+    crate://crates.io/derive_builder/0.20.2 \
+    crate://crates.io/derive_builder_core/0.20.2 \
+    crate://crates.io/derive_builder_macro/0.20.2 \
+    crate://crates.io/derive_more/2.1.1 \
+    crate://crates.io/derive_more-impl/2.1.1 \
+    crate://crates.io/difflib/0.4.0 \
+    crate://crates.io/digest/0.10.7 \
+    crate://crates.io/displaydoc/0.2.5 \
+    crate://crates.io/document-features/0.2.12 \
+    crate://crates.io/downcast/0.11.0 \
+    crate://crates.io/dyn-clone/1.0.20 \
+    crate://crates.io/either/1.15.0 \
+    crate://crates.io/email_address/0.2.9 \
+    crate://crates.io/env/1.0.1 \
+    crate://crates.io/env_filter/1.0.1 \
+    crate://crates.io/env_logger/0.11.10 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.14 \
+    crate://crates.io/fancy-regex/0.17.0 \
+    crate://crates.io/fastrand/2.4.1 \
+    crate://crates.io/find-msvc-tools/0.1.9 \
+    crate://crates.io/fixedbitset/0.5.7 \
+    crate://crates.io/float-cmp/0.9.0 \
+    crate://crates.io/fluent-uri/0.4.1 \
+    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/foldhash/0.1.5 \
+    crate://crates.io/foldhash/0.2.0 \
+    crate://crates.io/fraction/0.15.4 \
+    crate://crates.io/fragile/2.1.0 \
+    crate://crates.io/futures-channel/0.3.32 \
+    crate://crates.io/futures-core/0.3.32 \
+    crate://crates.io/futures-macro/0.3.32 \
+    crate://crates.io/futures-sink/0.3.32 \
+    crate://crates.io/futures-task/0.3.32 \
+    crate://crates.io/futures-util/0.3.32 \
+    crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.2.17 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/getrandom/0.4.2 \
+    crate://crates.io/h2/0.4.16 \
+    crate://crates.io/handlebars/6.4.0 \
+    crate://crates.io/hashbrown/0.15.5 \
+    crate://crates.io/hashbrown/0.16.1 \
+    crate://crates.io/hashbrown/0.17.0 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/hex/0.4.3 \
+    crate://crates.io/http/1.4.0 \
+    crate://crates.io/http-body/1.0.1 \
+    crate://crates.io/http-body-util/0.1.3 \
+    crate://crates.io/httparse/1.10.1 \
+    crate://crates.io/httpdate/1.0.3 \
+    crate://crates.io/hyper/1.9.0 \
+    crate://crates.io/hyper-timeout/0.5.2 \
+    crate://crates.io/hyper-util/0.1.20 \
+    crate://crates.io/iana-time-zone/0.1.65 \
+    crate://crates.io/iana-time-zone-haiku/0.1.2 \
+    crate://crates.io/icu_collections/2.2.0 \
+    crate://crates.io/icu_locale_core/2.2.0 \
+    crate://crates.io/icu_normalizer/2.2.0 \
+    crate://crates.io/icu_normalizer_data/2.2.0 \
+    crate://crates.io/icu_properties/2.2.0 \
+    crate://crates.io/icu_properties_data/2.2.0 \
+    crate://crates.io/icu_provider/2.2.0 \
+    crate://crates.io/id-arena/2.3.0 \
+    crate://crates.io/ident_case/1.0.1 \
+    crate://crates.io/idna/1.1.0 \
+    crate://crates.io/idna_adapter/1.2.1 \
+    crate://crates.io/indexmap/2.14.0 \
+    crate://crates.io/is_executable/1.0.5 \
+    crate://crates.io/is_terminal_polyfill/1.70.2 \
+    crate://crates.io/itertools/0.10.5 \
+    crate://crates.io/itertools/0.14.0 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/jiff/0.2.24 \
+    crate://crates.io/jiff-static/0.2.24 \
+    crate://crates.io/js-sys/0.3.95 \
+    crate://crates.io/jsonschema/0.44.1 \
+    crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/leb128fmt/0.1.0 \
+    crate://crates.io/libc/0.2.186 \
+    crate://crates.io/linux-raw-sys/0.12.1 \
+    crate://crates.io/litemap/0.8.2 \
+    crate://crates.io/litrs/1.0.0 \
+    crate://crates.io/lock_api/0.4.14 \
+    crate://crates.io/log/0.4.29 \
+    crate://crates.io/matchit/0.8.4 \
+    crate://crates.io/memchr/2.8.0 \
+    crate://crates.io/mime/0.3.17 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/mio/1.2.0 \
+    crate://crates.io/mockall/0.11.4 \
+    crate://crates.io/mockall_derive/0.11.4 \
+    crate://crates.io/mockall_double/0.3.1 \
+    crate://crates.io/multimap/0.10.1 \
+    crate://crates.io/nix/0.31.2 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/normalize-line-endings/0.3.0 \
+    crate://crates.io/ntapi/0.4.3 \
+    crate://crates.io/num/0.4.3 \
+    crate://crates.io/num-bigint/0.4.6 \
+    crate://crates.io/num-cmp/0.1.0 \
+    crate://crates.io/num-complex/0.4.6 \
+    crate://crates.io/num-conv/0.2.1 \
+    crate://crates.io/num-integer/0.1.46 \
+    crate://crates.io/num-iter/0.1.45 \
+    crate://crates.io/num-modular/0.6.1 \
+    crate://crates.io/num-order/1.2.0 \
+    crate://crates.io/num-rational/0.4.2 \
+    crate://crates.io/num-traits/0.2.19 \
+    crate://crates.io/num_threads/0.1.7 \
+    crate://crates.io/objc2-core-foundation/0.3.2 \
+    crate://crates.io/objc2-io-kit/0.3.2 \
+    crate://crates.io/oid-registry/0.8.1 \
+    crate://crates.io/once_cell/1.21.4 \
+    crate://crates.io/once_cell_polyfill/1.70.2 \
+    crate://crates.io/outref/0.5.2 \
+    crate://crates.io/papergrid/0.13.0 \
+    crate://crates.io/parking_lot/0.12.5 \
+    crate://crates.io/parking_lot_core/0.9.12 \
+    crate://crates.io/percent-encoding/2.3.2 \
+    crate://crates.io/pest/2.8.6 \
+    crate://crates.io/pest_derive/2.8.6 \
+    crate://crates.io/pest_generator/2.8.6 \
+    crate://crates.io/pest_meta/2.8.6 \
+    crate://crates.io/petgraph/0.8.3 \
+    crate://crates.io/pin-project/1.1.11 \
+    crate://crates.io/pin-project-internal/1.1.11 \
+    crate://crates.io/pin-project-lite/0.2.17 \
+    crate://crates.io/portable-atomic/1.13.1 \
+    crate://crates.io/portable-atomic-util/0.2.7 \
+    crate://crates.io/potential_utf/0.1.5 \
+    crate://crates.io/powerfmt/0.2.0 \
+    crate://crates.io/predicates/2.1.5 \
+    crate://crates.io/predicates-core/1.0.10 \
+    crate://crates.io/predicates-tree/1.0.13 \
+    crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro-error-attr2/2.0.0 \
+    crate://crates.io/proc-macro-error2/2.0.1 \
+    crate://crates.io/proc-macro2/1.0.106 \
+    crate://crates.io/prost/0.14.3 \
+    crate://crates.io/prost-build/0.14.3 \
+    crate://crates.io/prost-derive/0.14.3 \
+    crate://crates.io/prost-types/0.14.3 \
+    crate://crates.io/pulldown-cmark/0.13.3 \
+    crate://crates.io/pulldown-cmark-to-cmark/22.0.0 \
+    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/rand/0.10.2 \
+    crate://crates.io/rand_core/0.10.1 \
+    crate://crates.io/redox_syscall/0.5.18 \
+    crate://crates.io/ref-cast/1.0.25 \
+    crate://crates.io/ref-cast-impl/1.0.25 \
+    crate://crates.io/referencing/0.44.1 \
+    crate://crates.io/regex/1.12.3 \
+    crate://crates.io/regex-automata/0.4.14 \
+    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/ring/0.17.14 \
+    crate://crates.io/rustc_version/0.4.1 \
+    crate://crates.io/rusticata-macros/4.1.0 \
+    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustls/0.23.39 \
+    crate://crates.io/rustls-pki-types/1.14.1 \
+    crate://crates.io/rustls-webpki/0.103.13 \
+    crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/ryu/1.0.23 \
+    crate://crates.io/schemars/1.2.1 \
+    crate://crates.io/schemars_derive/1.2.1 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/semver/1.0.28 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
+    crate://crates.io/serde_derive_internals/0.29.1 \
+    crate://crates.io/serde_json/1.0.149 \
+    crate://crates.io/serde_spanned/1.1.1 \
+    crate://crates.io/serde_yaml/0.9.34+deprecated \
+    crate://crates.io/sha2/0.10.9 \
+    crate://crates.io/sha256/1.6.0 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/signal-hook/0.3.18 \
+    crate://crates.io/signal-hook-mio/0.2.5 \
+    crate://crates.io/signal-hook-registry/1.4.8 \
+    crate://crates.io/slab/0.4.12 \
+    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/socket2/0.6.3 \
+    crate://crates.io/stable_deref_trait/1.2.1 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/subtle/2.6.1 \
+    crate://crates.io/syn/1.0.109 \
+    crate://crates.io/syn/2.0.117 \
+    crate://crates.io/sync_wrapper/1.0.2 \
+    crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/sysinfo/0.38.4 \
+    crate://crates.io/tabled/0.17.0 \
+    crate://crates.io/tabled_derive/0.9.0 \
+    crate://crates.io/tempfile/3.27.0 \
+    crate://crates.io/termtree/0.5.1 \
+    crate://crates.io/thiserror/1.0.69 \
+    crate://crates.io/thiserror/2.0.18 \
+    crate://crates.io/thiserror-impl/1.0.69 \
+    crate://crates.io/thiserror-impl/2.0.18 \
+    crate://crates.io/time/0.3.47 \
+    crate://crates.io/time-core/0.1.8 \
+    crate://crates.io/time-macros/0.2.27 \
+    crate://crates.io/tinystr/0.8.3 \
+    crate://crates.io/tokio/1.52.1 \
+    crate://crates.io/tokio-macros/2.7.0 \
+    crate://crates.io/tokio-rustls/0.26.4 \
+    crate://crates.io/tokio-stream/0.1.18 \
+    crate://crates.io/tokio-util/0.7.18 \
+    crate://crates.io/toml/0.9.12+spec-1.1.0 \
+    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.1+spec-1.1.0 \
+    crate://crates.io/tonic/0.14.5 \
+    crate://crates.io/tonic-build/0.14.5 \
+    crate://crates.io/tonic-prost/0.14.5 \
+    crate://crates.io/tonic-prost-build/0.14.5 \
+    crate://crates.io/tower/0.5.3 \
+    crate://crates.io/tower-layer/0.3.3 \
+    crate://crates.io/tower-service/0.3.3 \
+    crate://crates.io/tracing/0.1.44 \
+    crate://crates.io/tracing-attributes/0.1.31 \
+    crate://crates.io/tracing-core/0.1.36 \
+    crate://crates.io/try-lock/0.2.5 \
+    crate://crates.io/typenum/1.20.0 \
+    crate://crates.io/ucd-trie/0.1.7 \
+    crate://crates.io/umask/2.1.0 \
+    crate://crates.io/unicase/2.9.0 \
+    crate://crates.io/unicode-general-category/1.1.0 \
+    crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/unicode-segmentation/1.13.2 \
+    crate://crates.io/unicode-width/0.2.2 \
+    crate://crates.io/unicode-xid/0.2.6 \
+    crate://crates.io/unsafe-libyaml/0.2.11 \
+    crate://crates.io/untrusted/0.9.0 \
+    crate://crates.io/utf8_iter/1.0.4 \
+    crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/uuid/1.23.1 \
+    crate://crates.io/uuid-simd/0.8.0 \
+    crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/vsimd/0.8.0 \
+    crate://crates.io/want/0.3.1 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.3+wasi-0.2.9 \
+    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
+    crate://crates.io/wasm-bindgen/0.2.118 \
+    crate://crates.io/wasm-bindgen-macro/0.2.118 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.118 \
+    crate://crates.io/wasm-bindgen-shared/0.2.118 \
+    crate://crates.io/wasm-encoder/0.244.0 \
+    crate://crates.io/wasm-metadata/0.244.0 \
+    crate://crates.io/wasmparser/0.244.0 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows/0.62.2 \
+    crate://crates.io/windows-collections/0.3.2 \
+    crate://crates.io/windows-core/0.62.2 \
+    crate://crates.io/windows-future/0.3.2 \
+    crate://crates.io/windows-implement/0.60.2 \
+    crate://crates.io/windows-interface/0.59.3 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-numerics/0.3.1 \
+    crate://crates.io/windows-result/0.4.1 \
+    crate://crates.io/windows-strings/0.5.1 \
+    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-sys/0.60.2 \
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.5 \
+    crate://crates.io/windows-threading/0.2.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.1 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.1 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.1 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.1 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.1 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.53.1 \
+    crate://crates.io/winnow/0.7.15 \
+    crate://crates.io/winnow/1.0.2 \
+    crate://crates.io/wit-bindgen/0.51.0 \
+    crate://crates.io/wit-bindgen/0.57.1 \
+    crate://crates.io/wit-bindgen-core/0.51.0 \
+    crate://crates.io/wit-bindgen-rust/0.51.0 \
+    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
+    crate://crates.io/wit-component/0.244.0 \
+    crate://crates.io/wit-parser/0.244.0 \
+    crate://crates.io/writeable/0.6.3 \
+    crate://crates.io/x509-parser/0.18.1 \
+    crate://crates.io/yoke/0.8.2 \
+    crate://crates.io/yoke-derive/0.8.2 \
+    crate://crates.io/zerocopy/0.8.48 \
+    crate://crates.io/zerocopy-derive/0.8.48 \
+    crate://crates.io/zerofrom/0.1.7 \
+    crate://crates.io/zerofrom-derive/0.1.7 \
+    crate://crates.io/zeroize/1.8.2 \
+    crate://crates.io/zerotrie/0.2.4 \
+    crate://crates.io/zerovec/0.11.6 \
+    crate://crates.io/zerovec-derive/0.11.3 \
+    crate://crates.io/zmij/1.0.21 \
+"
+
+SRC_URI[ahash-0.8.12.sha256sum] =3D "5a15f179cd60c4584b8a8c596927aadc462e2=
7f2ca70c04e0071964a73ba7a75"
+SRC_URI[aho-corasick-1.1.4.sha256sum] =3D "ddd31a130427c27518df266943a5308=
ed92d4b226cc639f5a8f1002816174301"
+SRC_URI[allocator-api2-0.2.21.sha256sum] =3D "683d7910e743518b0e34f1186f92=
494becacb047c7b6bf616c96772180fef923"
+SRC_URI[android_system_properties-0.1.5.sha256sum] =3D "819e7219dbd41043ac=
279b19830f2efc897156490d7fd6ea916720117ee66311"
+SRC_URI[anstream-1.0.0.sha256sum] =3D "824a212faf96e9acacdbd09febd34438f8f=
711fb84e09a8916013cd7815ca28d"
+SRC_URI[anstyle-1.0.14.sha256sum] =3D "940b3a0ca603d1eade50a4846a2afffd5ef=
57a9feac2c0e2ec2e14f9ead76000"
+SRC_URI[anstyle-parse-1.0.0.sha256sum] =3D "52ce7f38b242319f7cabaa68130554=
67063ecdc9d355bbb4ce0c68908cd8130e"
+SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd53cd289104fc64099abc=
a73db4166ad86ea0b4341abe65af83dadc"
+SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112fb889=
8808a366d8f9f58ce16d1f538353ad55747d"
+SRC_URI[anyhow-1.0.102.sha256sum] =3D "7f202df86484c868dbad7eaa557ef785d5c=
66295e41b460ef922eca0723b842c"
+SRC_URI[asn1-rs-0.7.1.sha256sum] =3D "56624a96882bb8c26d61312ae18cb45868e5=
a9992ea73c58e45c3101e56a1e60"
+SRC_URI[asn1-rs-derive-0.6.0.sha256sum] =3D "3109e49b1e4909e9db6515a30c633=
684d68cdeaa252f215214cb4fa1a5bfee2c"
+SRC_URI[asn1-rs-impl-0.2.0.sha256sum] =3D "7b18050c2cd6fe86c3a76584ef5e0ba=
f286d038cda203eb6223df2cc413565f7"
+SRC_URI[async-trait-0.1.89.sha256sum] =3D "9035ad2d096bed7955a320ee7e22305=
74d28fd3c3a0f186cbea1ff3c7eed5dbb"
+SRC_URI[atomic-waker-1.1.2.sha256sum] =3D "1505bd5d3d116872e7271a6d4e16d81=
d0c8570876c8de68093a09ac269d8aac0"
+SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c0867=
08fe954eaa885384a6165172e7e8"
+SRC_URI[axum-0.8.9.sha256sum] =3D "31b698c5f9a010f6573133b09e0de5408834d0c=
82f8d7475a89fc1867a71cd90"
+SRC_URI[axum-core-0.5.6.sha256sum] =3D "08c78f31d7b1291f7ee735c1c6780ccde7=
785daae9a9206026862dab7d8792d1"
+SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[bit-set-0.8.0.sha256sum] =3D "08807e080ed7f9d5433fa9b275196cfc3541=
4f66a0c79d864dc51a0d825231a3"
+SRC_URI[bit-vec-0.8.0.sha256sum] =3D "5e764a1d40d510daf35e07be9eb06e757709=
08c27d411ee6c92109c9840eaaf7"
+SRC_URI[bitflags-2.11.1.sha256sum] =3D "c4512299f36f043ab09a583e57bceb5a5a=
ab7a73db1805848e8fef3c9e8c78b3"
+SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa394996=
acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[borrow-or-share-0.2.4.sha256sum] =3D "dc0b364ead1874514c8c2855ab55=
8056ebfeb775653e7ae45ff72f28f8f3166c"
+SRC_URI[bumpalo-3.20.2.sha256sum] =3D "5d20789868f4b01b2f2caec9f5c4e0213b4=
1e3e5702a50157d699ae31ced2fcb"
+SRC_URI[bytecount-0.6.9.sha256sum] =3D "175812e0be2bccb6abe50bb8d566126198=
344f707e304f45c648fd8f2cc0365e"
+SRC_URI[bytes-1.11.1.sha256sum] =3D "1e748733b7cbc798e1434b6ac524f0c1ff2ab=
456fe201501e6497c8417a4fc33"
+SRC_URI[cc-1.2.61.sha256sum] =3D "d16d90359e986641506914ba71350897565610e8=
7ce0ad9e6f28569db3dd5c6d"
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
+SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babcb082=
c5994d996f20b8b159f2ad1658eb5724"
+SRC_URI[chacha20-0.10.2.sha256sum] =3D "65c35e4b699c7e15ccbe7ee35c005e4fc0=
a278d22238a2857e6ce2dadeda1b06"
+SRC_URI[chrono-0.4.44.sha256sum] =3D "c673075a2e0e5f4a1dde27ce9dee1ea4558c=
7ffe648f576438a20ca1d2acc4b0"
+SRC_URI[clap-4.6.1.sha256sum] =3D "1ddb117e43bbf7dacf0a4190fef4d345b9bad68=
dfc649cb349e7d17d28428e51"
+SRC_URI[clap_builder-4.6.0.sha256sum] =3D "714a53001bf66416adb0e2ef5ac8571=
40e7dc3a0c48fb28b2f10762fc4b5069f"
+SRC_URI[clap_complete-4.6.2.sha256sum] =3D "3ff7a1dccbdd8b078c2bdebff47e40=
4615151534d5043da397ec50286816f9cb"
+SRC_URI[clap_derive-4.6.1.sha256sum] =3D "f2ce8604710f6733aa641a2b3731eaa1=
e8b3d9973d5e3565da11800813f997a9"
+SRC_URI[clap_lex-1.1.0.sha256sum] =3D "c8d4a3bb8b1e0c1050499d1815f5ab16d04=
f0959b233085fb31653fbfc9d98f9"
+SRC_URI[colorchoice-1.0.5.sha256sum] =3D "1d07550c9036bf2ae0c684c4297d503f=
838287c83c53686d05370d0e139ae570"
+SRC_URI[convert_case-0.10.0.sha256sum] =3D "633458d4ef8c78b72454de2d54fd6a=
b2e60f9e02be22f3c6104cdc8a4e0fceb9"
+SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D "773648b94d0e5d620f64f280=
777445740e61fe701025087ec8b57f45c791888b"
+SRC_URI[cpufeatures-0.2.17.sha256sum] =3D "59ed5838eebb26a2bb2e58f6d5b5316=
989ae9d08bab10e0e6d103e656d1b0280"
+SRC_URI[cpufeatures-0.3.0.sha256sum] =3D "8b2a41393f66f16b0823bb79094d54ac=
5fbd34ab292ddafb9a0456ac9f87d201"
+SRC_URI[crossterm-0.29.0.sha256sum] =3D "d8b9f2e4c67f833b660cdb0a352306586=
9fb35570177239812ed4c905aeff87b"
+SRC_URI[crossterm_winapi-0.9.1.sha256sum] =3D "acdd7c62a3665c7f6830a51635d=
9ac9b23ed385797f70a83bb8bafe9c572ab2b"
+SRC_URI[crypto-common-0.1.7.sha256sum] =3D "78c8292055d1c1df0cce5d180393dc=
8cce0abec0a7102adb6c7b1eef6016d60a"
+SRC_URI[darling-0.20.11.sha256sum] =3D "fc7f46116c46ff9ab3eb1597a45688b671=
5c6e628b5c133e288e709a29bcb4ee"
+SRC_URI[darling_core-0.20.11.sha256sum] =3D "0d00b9596d185e565c2207a0b01f8=
bd1a135483d02d9b7b0a54b11da8d53412e"
+SRC_URI[darling_macro-0.20.11.sha256sum] =3D "fc34b93ccb385b40dc71c6fceac4=
b2ad23662c7eeb248cf10d529b7e055b6ead"
+SRC_URI[data-encoding-2.11.0.sha256sum] =3D "a4ae5f15dda3c708c0ade84bfee31=
ccab44a3da4f88015ed22f63732abe300c8"
+SRC_URI[der-parser-10.0.0.sha256sum] =3D "07da5016415d5a3c4dd39b11ed26f915=
f52fc4e0dc197d87908bc916e51bc1a6"
+SRC_URI[deranged-0.5.8.sha256sum] =3D "7cd812cc2bc1d69d4764bd80df88b4317ea=
ef9e773c75226407d9bc0876b211c"
+SRC_URI[derive_builder-0.20.2.sha256sum] =3D "507dfb09ea8b7fa618fcf76e953f=
4f5e192547945816d5358edffe39f6f94947"
+SRC_URI[derive_builder_core-0.20.2.sha256sum] =3D "2d5bcf7b024d6835cfb3d47=
3887cd966994907effbe9227e8c8219824d06c4e8"
+SRC_URI[derive_builder_macro-0.20.2.sha256sum] =3D "ab63b0e2bf4d5928aff72e=
83a7dace85d7bba5fe12dcc3c5a572d78caffd3f3c"
+SRC_URI[derive_more-2.1.1.sha256sum] =3D "d751e9e49156b02b44f9c1815bcb94b9=
84cdcc4396ecc32521c739452808b134"
+SRC_URI[derive_more-impl-2.1.1.sha256sum] =3D "799a97264921d8623a957f6c3b9=
011f3b5492f557bbb7a5a19b7fa6d06ba8dcb"
+SRC_URI[difflib-0.4.0.sha256sum] =3D "6184e33543162437515c2e2b48714794e378=
45ec9851711914eec9d308f6ebe8"
+SRC_URI[digest-0.10.7.sha256sum] =3D "9ed9a281f7bc9b7576e61468ba615a66a5c8=
cfdff42420a70aa82701a3b1e292"
+SRC_URI[displaydoc-0.2.5.sha256sum] =3D "97369cbbc041bc366949bc74d34658d6c=
da5621039731c6310521892a3a20ae0"
+SRC_URI[document-features-0.2.12.sha256sum] =3D "d4b8a88685455ed29a21542a3=
3abd9cb6510b6b129abadabdcef0f4c55bc8f61"
+SRC_URI[downcast-0.11.0.sha256sum] =3D "1435fa1053d8b2fbbe9be7e97eca7f33d3=
7b28409959813daefc1446a14247f1"
+SRC_URI[dyn-clone-1.0.20.sha256sum] =3D "d0881ea181b1df73ff77ffaaf9c7544ec=
c11e82fba9b5f27b262a3c73a332555"
+SRC_URI[either-1.15.0.sha256sum] =3D "48c757948c5ede0e46177b7add2e67155f70=
e33c07fea8284df6576da70b3719"
+SRC_URI[email_address-0.2.9.sha256sum] =3D "e079f19b08ca6239f47f8ba8509c11=
cf3ea30095831f7fed61441475edd8c449"
+SRC_URI[env-1.0.1.sha256sum] =3D "bc95de49ad098572c02d3fbf368c9a020bfff5ae=
78483685b77f51d8a7e9486d"
+SRC_URI[env_filter-1.0.1.sha256sum] =3D "32e90c2accc4b07a8456ea0debdc2e758=
7bdd890680d71173a15d4ae604f6eef"
+SRC_URI[env_logger-0.11.10.sha256sum] =3D "0621c04f2196ac3f488dd583365b9c0=
9be011a4ab8b9f37248ffcc8f6198b56a"
+SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c02=
9f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735b5=
1691dbda63cf6f96d042b63efeb"
+SRC_URI[fancy-regex-0.17.0.sha256sum] =3D "72cf461f865c862bb7dc573f643dd6a=
2b6842f7c30b07882b56bd148cc2761b8"
+SRC_URI[fastrand-2.4.1.sha256sum] =3D "9f1f227452a390804cdb637b74a86990f2a=
7d7ba4b7d5693aac9b4dd6defd8d6"
+SRC_URI[find-msvc-tools-0.1.9.sha256sum] =3D "5baebc0774151f905a1a2cc41989=
300b1e6fbb29aff0ceffa1064fdd3088d582"
+SRC_URI[fixedbitset-0.5.7.sha256sum] =3D "1d674e81391d1e1ab681a28d99df0792=
7c6d4aa5b027d7da16ba32d1d21ecd99"
+SRC_URI[float-cmp-0.9.0.sha256sum] =3D "98de4bbd547a563b716d8dfa9aad1cb19b=
fab00f4fa09a6a4ed21dbcf44ce9c4"
+SRC_URI[fluent-uri-0.4.1.sha256sum] =3D "bc74ac4d8359ae70623506d512209619e=
5cf8f347124910440dbc221714b328e"
+SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2da=
24a9afd88aca000531ab82c1"
+SRC_URI[foldhash-0.1.5.sha256sum] =3D "d9c4f5dac5e15c24eb999c26181a6ca40b3=
9fe946cbe4c263c7209467bc83af2"
+SRC_URI[foldhash-0.2.0.sha256sum] =3D "77ce24cb58228fbb8aa041425bb1050850a=
c19177686ea6e0f41a70416f56fdb"
+SRC_URI[fraction-0.15.4.sha256sum] =3D "e076045bb43dac435333ed5f04caf35c74=
63631d0dae2deb2638d94dd0a5b872"
+SRC_URI[fragile-2.1.0.sha256sum] =3D "8878864ba14bb86e818a412bfd6f18f9eabd=
4ec0f008a28e8f7eb61db532fcf9"
+SRC_URI[futures-channel-0.3.32.sha256sum] =3D "07bbe89c50d7a535e539b8c17bc=
0b49bdb77747034daa8087407d655f3f7cc1d"
+SRC_URI[futures-core-0.3.32.sha256sum] =3D "7e3450815272ef58cec6d564423f6e=
755e25379b217b0bc688e295ba24df6b1d"
+SRC_URI[futures-macro-0.3.32.sha256sum] =3D "e835b70203e41293343137df5c066=
4546da5745f82ec9b84d40be8336958447b"
+SRC_URI[futures-sink-0.3.32.sha256sum] =3D "c39754e157331b013978ec91992bde=
1ac089843443c49cbc7f46150b0fad0893"
+SRC_URI[futures-task-0.3.32.sha256sum] =3D "037711b3d59c33004d3856fbdc83b9=
9d4ff37a24768fa1be9ce3538a1cde4393"
+SRC_URI[futures-util-0.3.32.sha256sum] =3D "389ca41296e6190b48053de0321d02=
a77f32f8a5d2461dd38762c0593805c6d6"
+SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51fd72272d7821adaf274a=
d91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.2.17.sha256sum] =3D "ff2abc00be7fca6ebc474524697ae276a=
d847ad0a6b3faa4bcb027e9a4614ad0"
+SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ecec1=
38e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[getrandom-0.4.2.sha256sum] =3D "0de51e6874e94e7bf76d726fc5d13ba782=
deca734ff60d5bb2fb2607c7406555"
+SRC_URI[h2-0.4.16.sha256sum] =3D "a9f37a958b41b3b19ee2707c06439c0e9e547e84=
7223eb791ecb0cb821c65e27"
+SRC_URI[handlebars-6.4.0.sha256sum] =3D "9b3f9296c208515b87bd915a2f5d1163d=
4b3f863ba83337d7713cf478055948e"
+SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd930=
01ea1ef889cd5529dd176593f5338a1"
+SRC_URI[hashbrown-0.16.1.sha256sum] =3D "841d1cc9bed7f9236f321df977030373f=
4a4163ae1a7dbfe1a51a2c1a51d9100"
+SRC_URI[hashbrown-0.17.0.sha256sum] =3D "4f467dd6dccf739c208452f8014c75c18=
bb8301b050ad1cfb27153803edb0f51"
+SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440a1=
9336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
+SRC_URI[hex-0.4.3.sha256sum] =3D "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e48=
6a595ed5fd8f86ba55232a70"
+SRC_URI[http-1.4.0.sha256sum] =3D "e3ba2a386d7f85a81f119ad7498ebe444d2e22c=
2af0b86b069416ace48b3311a"
+SRC_URI[http-body-1.0.1.sha256sum] =3D "1efedce1fb8e6913f23e0c92de8e62cd5b=
772a67e7b3946df930a62566c93184"
+SRC_URI[http-body-util-0.1.3.sha256sum] =3D "b021d93e26becf5dc7e1b75b1bed1=
fd93124b374ceb73f43d4d4eafec896a64a"
+SRC_URI[httparse-1.10.1.sha256sum] =3D "6dbf3de79e51f3d586ab4cb9d5c3e2c14a=
a28ed23d180cf89b4df0454a69cc87"
+SRC_URI[httpdate-1.0.3.sha256sum] =3D "df3b46402a9d5adb4c86a0cf463f42e1999=
4e3ee891101b1841f30a545cb49a9"
+SRC_URI[hyper-1.9.0.sha256sum] =3D "6299f016b246a94207e63da54dbe807655bf9e=
00044f73ded42c3ac5305fbcca"
+SRC_URI[hyper-timeout-0.5.2.sha256sum] =3D "2b90d566bffbce6a75bd8b09a05aa8=
c2cb1fabb6cb348f8840c9e4c90a0d83b0"
+SRC_URI[hyper-util-0.1.20.sha256sum] =3D "96547c2556ec9d12fb1578c4eaf448b0=
4993e7fb79cbaad930a656880a6bdfa0"
+SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D "e31bc9ad994ba00e440a8aa5c9ef=
0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590ba=
56d5d2d085f558508192593743f16b2306495269f"
+SRC_URI[icu_collections-2.2.0.sha256sum] =3D "2984d1cd16c883d7935b9e07e440=
71dca8d917fd52ecc02c04d5fa0b5a3f191c"
+SRC_URI[icu_locale_core-2.2.0.sha256sum] =3D "92219b62b3e2b4d88ac5119f8904=
c10f8f61bf7e95b640d25ba3075e6cac2c29"
+SRC_URI[icu_normalizer-2.2.0.sha256sum] =3D "c56e5ee99d6e3d33bd91c5d85458b=
6005a22140021cc324cea84dd0e72cff3b4"
+SRC_URI[icu_normalizer_data-2.2.0.sha256sum] =3D "da3be0ae77ea334f4da67c12=
f149704f19f81d1adf7c51cf482943e84a2bad38"
+SRC_URI[icu_properties-2.2.0.sha256sum] =3D "bee3b67d0ea5c2cca5003417989af=
8996f8604e34fb9ddf96208a033901e70de"
+SRC_URI[icu_properties_data-2.2.0.sha256sum] =3D "8e2bbb201e0c04f7b4b3e143=
82af113e17ba4f63e2c9d2ee626b720cbce54a14"
+SRC_URI[icu_provider-2.2.0.sha256sum] =3D "139c4cf31c8b5f33d7e199446eff9c1=
e02decfc2f0eec2c8d71f65befa45b421"
+SRC_URI[id-arena-2.3.0.sha256sum] =3D "3d3067d79b975e8844ca9eb072e16b31c3c=
1c36928edf9c6789548c524d0d954"
+SRC_URI[ident_case-1.0.1.sha256sum] =3D "b9e0384b61958566e926dc50660321d12=
159025e767c18e043daf26b70104c39"
+SRC_URI[idna-1.1.0.sha256sum] =3D "3b0875f23caa03898994f6ddc501886a45c7d3d=
62d04d2d90788d47be1b1e4de"
+SRC_URI[idna_adapter-1.2.1.sha256sum] =3D "3acae9609540aa318d1bc588455225f=
b2085b9ed0c4f6bd0d9d5bcd86f1a0344"
+SRC_URI[indexmap-2.14.0.sha256sum] =3D "d466e9454f08e4a911e14806c24e16fba1=
b4c121d1ea474396f396069cf949d9"
+SRC_URI[is_executable-1.0.5.sha256sum] =3D "baabb8b4867b26294d818bf3f651a4=
54b6901431711abb96e296245888d6e8c4"
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1bd460=
005623e142ef0181e3d0219cb493e02f7d08a35695"
+SRC_URI[itertools-0.10.5.sha256sum] =3D "b0fd2260e829bddf4cb6ea802289de2f8=
6d6a7a690192fbe91b3f46e0f2c8473"
+SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488aa=
bdbf3d2da73885b31bd0abd03351285"
+SRC_URI[itoa-1.0.18.sha256sum] =3D "8f42a60cbdf9a97f5d2305f08a87dc4e09308d=
1276d28c869c684d7777685682"
+SRC_URI[jiff-0.2.24.sha256sum] =3D "f00b5dbd620d61dfdcb6007c9c1f6054ebd753=
19f163d886a9055cec1155073d"
+SRC_URI[jiff-static-0.2.24.sha256sum] =3D "e000de030ff8022ea1da3f466fbb0f3=
a809f5e51ed31f6dd931c35181ad8e6d7"
+SRC_URI[js-sys-0.3.95.sha256sum] =3D "2964e92d1d9dc3364cae4d718d93f227e3ab=
b088e747d92e0395bfdedf1c12ca"
+SRC_URI[jsonschema-0.44.1.sha256sum] =3D "f98b64a413c93a1b413dfbaf973b78d2=
71648b9cae50b10302ad88af78991672"
+SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
+SRC_URI[leb128fmt-0.1.0.sha256sum] =3D "09edd9e8b54e49e587e4f6295a7d29c3ea=
94d469cb40ab8ca70b288248a81db2"
+SRC_URI[libc-0.2.186.sha256sum] =3D "68ab91017fe16c622486840e4c83c9a37afef=
f978bd239b5293d61ece587de66"
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b251=
670a91556f4144941d37452769c25d58a53"
+SRC_URI[litemap-0.8.2.sha256sum] =3D "92daf443525c4cce67b150400bc231607610=
0ce0b3686209eb8cf3c31612e6f0"
+SRC_URI[litrs-1.0.0.sha256sum] =3D "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9=
db1621bafc7ed66e35ff9fe092"
+SRC_URI[lock_api-0.4.14.sha256sum] =3D "224399e74b87b5f3557511d98dff8b1408=
9b3dadafcab6bb93eab67d3aace965"
+SRC_URI[log-0.4.29.sha256sum] =3D "5e5032e24019045c762d3c0f28f5b6b8bbf3856=
3a65908389bf7978758920897"
+SRC_URI[matchit-0.8.4.sha256sum] =3D "47e1ffaa40ddd1f3ed91f717a33c8c0ee23f=
ff369e3aa8772b9605cc1d22f4c3"
+SRC_URI[memchr-2.8.0.sha256sum] =3D "f8ca58f447f06ed17d5fc4043ce1b10dd205e=
060fb3ce5b979b8ed8e59ff3f79"
+SRC_URI[mime-0.3.17.sha256sum] =3D "6877bb514081ee2a7ff5ef9de3281f14a4dd4b=
ceac4c09388074a6b5df8a139a"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05ef=
a59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[mio-1.2.0.sha256sum] =3D "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f9=
2d3aac1a6ed369ee08cc56c1"
+SRC_URI[mockall-0.11.4.sha256sum] =3D "4c84490118f2ee2d74570d114f3d0493cbf=
02790df303d2707606c3e14e07c96"
+SRC_URI[mockall_derive-0.11.4.sha256sum] =3D "22ce75669015c4f47b289fd4d4f5=
6e894e4c96003ffdf3ac51313126f94c6cbb"
+SRC_URI[mockall_double-0.3.1.sha256sum] =3D "f1ca96e5ac35256ae3e13536edd39=
b172b88f41615e1d7b653c8ad24524113e8"
+SRC_URI[multimap-0.10.1.sha256sum] =3D "1d87ecb2933e8aeadb3e3a02b828fed80a=
7528047e68b4f424523a0981a3a084"
+SRC_URI[nix-0.31.2.sha256sum] =3D "5d6d0705320c1e6ba1d912b5e37cf18071b6c2e=
9b7fa8215a1e8a7651966f5d3"
+SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c8172=
b73826411a55751e404a0a4a"
+SRC_URI[normalize-line-endings-0.3.0.sha256sum] =3D "61807f77802ff30975e01=
f4f071c8ba10c022052f98b3294119f3e615d13e5be"
+SRC_URI[ntapi-0.4.3.sha256sum] =3D "c3b335231dfd352ffb0f8017f3b6027a4917f7=
df785ea2143d8af2adc66980ae"
+SRC_URI[num-0.4.3.sha256sum] =3D "35bd024e8b2ff75562e5f34e7f4905839deb4b22=
955ef5e73d2fea1b9813cb23"
+SRC_URI[num-bigint-0.4.6.sha256sum] =3D "a5e44f723f1133c9deac646763579fdb3=
ac745e418f2a7af9cd0c431da1f20b9"
+SRC_URI[num-cmp-0.1.0.sha256sum] =3D "63335b2e2c34fae2fb0aa2cecfd9f0832a1e=
24b3b32ecec612c3426d46dc8aaa"
+SRC_URI[num-complex-0.4.6.sha256sum] =3D "73f88a1307638156682bada9d7604135=
552957b7818057dcef22705b4d509495"
+SRC_URI[num-conv-0.2.1.sha256sum] =3D "c6673768db2d862beb9b39a78fdcb1a6943=
9615d5794a1be50caa9bc92c81967"
+SRC_URI[num-integer-0.1.46.sha256sum] =3D "7969661fd2958a5cb096e56c8e1ad04=
44ac2bbcd0061bd28660485a44879858f"
+SRC_URI[num-iter-0.1.45.sha256sum] =3D "1429034a0490724d0075ebb2bc9e875d65=
03c3cf69e235a8941aa757d83ef5bf"
+SRC_URI[num-modular-0.6.1.sha256sum] =3D "17bb261bf36fa7d83f4c294f834e9125=
6769097b3cb505d44831e0a179ac647f"
+SRC_URI[num-order-1.2.0.sha256sum] =3D "537b596b97c40fcf8056d153049eb22f48=
1c17ebce72a513ec9286e4986d1bb6"
+SRC_URI[num-rational-0.4.2.sha256sum] =3D "f83d14da390562dca69fc84082e73e5=
48e1ad308d24accdedd2720017cb37824"
+SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72ad=
0ffa95f0c74596bc250dcfd960262841"
+SRC_URI[num_threads-0.1.7.sha256sum] =3D "5c7398b9c8b70908f6371f47ed367379=
07c87c52af34c268fed0bf0ceb92ead9"
+SRC_URI[objc2-core-foundation-0.3.2.sha256sum] =3D "2a180dd8642fa45cdb7dd7=
21cd4c11b1cadd4929ce112ebd8b9f5803cc79d536"
+SRC_URI[objc2-io-kit-0.3.2.sha256sum] =3D "33fafba39597d6dc1fb709123dfa828=
9d39406734be322956a69f0931c73bb15"
+SRC_URI[oid-registry-0.8.1.sha256sum] =3D "12f40cff3dde1b6087cc5d5f5d4d657=
12f34016a03ed60e9c08dcc392736b5b7"
+SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f85d45ae3e3a179218570=
6c8e16d043238c593331cc7cd313b50"
+SRC_URI[once_cell_polyfill-1.70.2.sha256sum] =3D "384b8ab6d37215f3c5301a95=
a4accb5d64aa607f1fcb26a11b5303878451b4fe"
+SRC_URI[outref-0.5.2.sha256sum] =3D "1a80800c0488c3a21695ea981a54918fbb37a=
bf04f4d0720c453632255e2ff0e"
+SRC_URI[papergrid-0.13.0.sha256sum] =3D "d2b0f8def1f117e13c895f3eda65a7b56=
50688da29d6ad04635f61bc7b92eebd"
+SRC_URI[parking_lot-0.12.5.sha256sum] =3D "93857453250e3077bd71ff98b6a65ea=
6621a19bb0f559a85248955ac12c45a1a"
+SRC_URI[parking_lot_core-0.9.12.sha256sum] =3D "2621685985a2ebf1c516881c02=
6032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
+SRC_URI[percent-encoding-2.3.2.sha256sum] =3D "9b4f627cb1b25917193a259e49b=
dad08f671f8d9708acfd5fe0a8c1455d87220"
+SRC_URI[pest-2.8.6.sha256sum] =3D "e0848c601009d37dfa3430c4666e147e49cdcf1=
b92ecd3e63657d8a5f19da662"
+SRC_URI[pest_derive-2.8.6.sha256sum] =3D "11f486f1ea21e6c10ed15d5a7c77165d=
0ee443402f0780849d1768e7d9d6fe77"
+SRC_URI[pest_generator-2.8.6.sha256sum] =3D "8040c4647b13b210a963c1ed407c1=
ff4fdfa01c31d6d2a098218702e6664f94f"
+SRC_URI[pest_meta-2.8.6.sha256sum] =3D "89815c69d36021a140146f26659a81d6c2=
afa33d216d736dd4be5381a7362220"
+SRC_URI[petgraph-0.8.3.sha256sum] =3D "8701b58ea97060d5e5b155d383a69952a60=
943f0e6dfe30b04c287beb0b27455"
+SRC_URI[pin-project-1.1.11.sha256sum] =3D "f1749c7ed4bcaf4c3d0a3efc2853884=
4fb29bcdd7d2b67b2be7e20ba861ff517"
+SRC_URI[pin-project-internal-1.1.11.sha256sum] =3D "d9b20ed30f105399776b9c=
883e68e536ef602a16ae6f596d2c473591d6ad64c6"
+SRC_URI[pin-project-lite-0.2.17.sha256sum] =3D "a89322df9ebe1c1578d689c923=
18e070967d1042b512afbe49518723f4e6d5cd"
+SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20cb=
e2f7accd12527ce60845ff44c153bb2a21b49"
+SRC_URI[portable-atomic-util-0.2.7.sha256sum] =3D "c2a106d1259c23fac8e5432=
72398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
+SRC_URI[potential_utf-0.1.5.sha256sum] =3D "0103b1cef7ec0cf76490e969665504=
990193874ea05c85ff9bab8b911d0a0564"
+SRC_URI[powerfmt-0.2.0.sha256sum] =3D "439ee305def115ba05938db6eb1644ff941=
65c5ab5e9420d1c1bcedbba909391"
+SRC_URI[predicates-2.1.5.sha256sum] =3D "59230a63c37f3e18569bdb90e4a89cbf5=
bf8b06fea0b84e65ea10cc4df47addd"
+SRC_URI[predicates-core-1.0.10.sha256sum] =3D "cad38746f3166b4031b1a0d39ad=
9f954dd291e7854fcc0eed52ee41a0b50d144"
+SRC_URI[predicates-tree-1.0.13.sha256sum] =3D "d0de1b847b39c8131db0467e9df=
1ff60e6d0562ab8e9a16e568ad0fdb372e2f2"
+SRC_URI[prettyplease-0.2.37.sha256sum] =3D "479ca8adacdd7ce8f1fb39ce9ecccb=
fe93a3f1344b3d0d97f20bc0196208f62b"
+SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] =3D "96de42df36bb9bba5542f=
e9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
+SRC_URI[proc-macro-error2-2.0.1.sha256sum] =3D "11ec05c52be0a07b08061f7dd0=
03e7d7092e0472bc731b4af7bb1ef876109802"
+SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b32617f=
68fcb9fa3bb7640c23e9c748e53fb30934"
+SRC_URI[prost-0.14.3.sha256sum] =3D "d2ea70524a2f82d518bce41317d0fae741515=
05651af45faf1ffbd6fd33f0568"
+SRC_URI[prost-build-0.14.3.sha256sum] =3D "343d3bd7056eda839b03204e68deff7=
d1b13aba7af2b2fd16890697274262ee7"
+SRC_URI[prost-derive-0.14.3.sha256sum] =3D "27c6023962132f4b30eb4c172c91ce=
92d933da334c59c23cddee82358ddafb0b"
+SRC_URI[prost-types-0.14.3.sha256sum] =3D "8991c4cbdb8bc5b11f0b074ffe286c3=
0e523de90fee5ba8132f1399f23cb3dd7"
+SRC_URI[pulldown-cmark-0.13.3.sha256sum] =3D "7c3a14896dfa883796f1cb410461=
aef38810ea05f2b2c33c5aded3649095fdad"
+SRC_URI[pulldown-cmark-to-cmark-22.0.0.sha256sum] =3D "50793def1b900256624=
a709439404384204a5dc3a6ec580281bfaac35e882e90"
+SRC_URI[quote-1.0.45.sha256sum] =3D "41f2619966050689382d2b44f664f4bc593e1=
29785a36d6ee376ddf37259b924"
+SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
+SRC_URI[r-efi-6.0.0.sha256sum] =3D "f8dcc9c7d52a811697d2151c701e0d08956f92=
b0e24136cf4cf27b57a6a0d9bf"
+SRC_URI[rand-0.10.2.sha256sum] =3D "c7f5fa3a058cd35567ef9bfa5e75732bee0f9e=
4c55fa90477bef2dfcdbc4be80"
+SRC_URI[rand_core-0.10.1.sha256sum] =3D "63b8176103e19a2643978565ca18b5054=
9f6101881c443590420e4dc998a3c69"
+SRC_URI[redox_syscall-0.5.18.sha256sum] =3D "ed2bf2547551a7053d6fdfafda3f9=
38979645c44812fbfcda098faae3f1a362d"
+SRC_URI[ref-cast-1.0.25.sha256sum] =3D "f354300ae66f76f1c85c5f84693f0ce81d=
747e2c3f21a45fef496d89c960bf7d"
+SRC_URI[ref-cast-impl-1.0.25.sha256sum] =3D "b7186006dcb21920990093f30e3de=
a63b7d6e977bf1256be20c3563a5db070da"
+SRC_URI[referencing-0.44.1.sha256sum] =3D "22952642836711d7a730d23a4dfb0d7=
32e75a85e4c4f5704266d9c8fac278ff1"
+SRC_URI[regex-1.12.3.sha256sum] =3D "e10754a14b9137dd7b1e3e5b0493cc9171fdd=
105e0ab477f51b72e7f3ac0e276"
+SRC_URI[regex-automata-0.4.14.sha256sum] =3D "6e1dd4122fc1595e816261894547=
6892eefca7b88c52820e74af6262213cae8f"
+SRC_URI[regex-syntax-0.8.10.sha256sum] =3D "dc897dd8d9e8bd1ed8cdad82b5966c=
3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[ring-0.17.14.sha256sum] =3D "a4689e6c2294d81e88dc6261c768b63bc4fcd=
b852be6d1352498b114f61383b7"
+SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e79d06=
3319ebb6594faafcf1c225ea92ab6e9b92"
+SRC_URI[rusticata-macros-4.1.0.sha256sum] =3D "faf0c4a6ece9950b9abdb62b1cf=
cf2a68b3b67a10ba445b3bb85be2a293d0632"
+SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca82=
8bd32cb7e408f0062e9930ba190"
+SRC_URI[rustls-0.23.39.sha256sum] =3D "7c2c118cb077cca2822033836dfb1b97535=
5dfb784b5e8da48f7b6c5db74e60e"
+SRC_URI[rustls-pki-types-1.14.1.sha256sum] =3D "30a7197ae7eb376e574fe940d0=
68c30fe0462554a3ddbe4eca7838e049c937a9"
+SRC_URI[rustls-webpki-0.103.13.sha256sum] =3D "61c429a8649f110dddef65e2a5a=
d240f747e85f7758a6bccc7e5777bd33f756e"
+SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb54a02=
9961a8215f9619753635a9c0d2538d46d"
+SRC_URI[ryu-1.0.23.sha256sum] =3D "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5=
cccb8cc655a4e50009e06477f"
+SRC_URI[schemars-1.2.1.sha256sum] =3D "a2b42f36aa1cd011945615b92222f6bf73c=
599a102a300334cd7f8dbeec726cc"
+SRC_URI[schemars_derive-1.2.1.sha256sum] =3D "7d115b50f4aaeea07e79c1912f64=
5c7513d81715d0420f8bc77a18c6260b307f"
+SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59bce=
7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[semver-1.0.28.sha256sum] =3D "8a7852d02fc848982e0c167ef163aaff9cd9=
1dc640ba85e263cb1ce46fae51cd"
+SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a9143618=
0c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c3983=
b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885ab66=
608367b6574e925011a9353e4badda91d79"
+SRC_URI[serde_derive_internals-0.29.1.sha256sum] =3D "18d26a20a969b9e3fdf2=
fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
+SRC_URI[serde_json-1.0.149.sha256sum] =3D "83fc039473c5595ace860d8c4fafa22=
0ff474b3fc6bfdb4293327f1a37e94d86"
+SRC_URI[serde_spanned-1.1.1.sha256sum] =3D "6662b5879511e06e8999a8a235d848=
113e942c9124f211511b16466ee2995f26"
+SRC_URI[serde_yaml-0.9.34+deprecated.sha256sum] =3D "6a8b1a1a2ebf674015cc0=
2edccce75287f1a0130d394307b36743c2f5d504b47"
+SRC_URI[sha2-0.10.9.sha256sum] =3D "a7507d819769d01a365ab707794a4084392c82=
4f54a7a6a7862f8c3d0892b283"
+SRC_URI[sha256-1.6.0.sha256sum] =3D "f880fc8562bdeb709793f00eb42a2ad0e672c=
4f883bbe59122b926eca935c8f6"
+SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3=
524c3cb8fb653a3023f6323e64"
+SRC_URI[signal-hook-0.3.18.sha256sum] =3D "d881a16cf4426aa584979d30bd82cb3=
3429027e42122b169753d6ef1085ed6e2"
+SRC_URI[signal-hook-mio-0.2.5.sha256sum] =3D "b75a19a7a740b25bc7944bdee617=
2368f988763b744e3d4dfe753f6b4ece40cc"
+SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D "c4db69cba1110affc0e9f7b=
cd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
+SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc58=
6479ce501c1d6d7da3cd8c9cf5"
+SRC_URI[smallvec-1.15.1.sha256sum] =3D "67b1b7a3b5fe4f1376887184045fcf45c6=
9e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[socket2-0.6.3.sha256sum] =3D "3a766e1110788c36f4fa1c2b71b387a7815a=
a65f88ce0229841826633d93723e"
+SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6ce2be8dc25455e1f91df71bf=
a12ad37d7af1092ae736f3a6cd0e37bc7810596"
+SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628564b=
3b043a70948a3f0b778838c5fb4f"
+SRC_URI[subtle-2.6.1.sha256sum] =3D "13c2bddecc57b384dee18652358fb23172fac=
b8a2c51ccc10d74c157bdea3292"
+SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3bafa6=
7b529ead792a6d0160888b4237"
+SRC_URI[syn-2.0.117.sha256sum] =3D "e665b8803e7b1d2a727f4023456bbbbe74da67=
099c585258af0ad9c5013b9b99"
+SRC_URI[sync_wrapper-1.0.2.sha256sum] =3D "0bf256ce5efdfa370213c1dabab5935=
a12e49f2c58d15e9eac2870d3b4f27263"
+SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7ae=
5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[sysinfo-0.38.4.sha256sum] =3D "92ab6a2f8bfe508deb3c6406578252e491d=
299cbbf3bc0529ecc3313aee4a52f"
+SRC_URI[tabled-0.17.0.sha256sum] =3D "c6709222f3973137427ce50559cd564dc187=
a95b9cfe01613d2f4e93610e510a"
+SRC_URI[tabled_derive-0.9.0.sha256sum] =3D "931be476627d4c54070a1f3a9739cc=
bfec9b36b39815106a20cce2243bbcefe1"
+SRC_URI[tempfile-3.27.0.sha256sum] =3D "32497e9a4c7b38532efcdebeef879707aa=
9f794296a4f0244f6f69e9bc8574bd"
+SRC_URI[termtree-0.5.1.sha256sum] =3D "8f50febec83f5ee1df3015341d8bd429f2d=
1cc62bcba7ea2076759d315084683"
+SRC_URI[thiserror-1.0.69.sha256sum] =3D "b6aaf5339b578ea85b50e080feb250a3e=
8ae8cfcdff9a461c9ec2904bc923f52"
+SRC_URI[thiserror-2.0.18.sha256sum] =3D "4288b5bcbc7920c07a1149a35cf9590a2=
aa808e0bc1eafaade0b80947865fbc4"
+SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D "4fee6c4efc90059e10f81e6d42c6=
0a18f76588c3d74cb83a0b242a2b6c7504c1"
+SRC_URI[thiserror-impl-2.0.18.sha256sum] =3D "ebc4ee7f67670e9b64d05fa4253e=
753e016c6c95ff35b89b7941d6b856dec1d5"
+SRC_URI[time-0.3.47.sha256sum] =3D "743bd48c283afc0388f9b8827b976905fb217a=
d9e647fae3a379a9283c4def2c"
+SRC_URI[time-core-0.1.8.sha256sum] =3D "7694e1cfe791f8d31026952abf09c69ca6=
f6fa4e1a1229e18988f06a04a12dca"
+SRC_URI[time-macros-0.2.27.sha256sum] =3D "2e70e4c5a0e0a8a4823ad65dfe1a693=
0e4f4d756dcd9dd7939022b5e8c501215"
+SRC_URI[tinystr-0.8.3.sha256sum] =3D "c8323304221c2a851516f22236c5722a72ea=
a19749016521d6dff0824447d96d"
+SRC_URI[tokio-1.52.1.sha256sum] =3D "b67dee974fe86fd92cc45b7a95fdd2f99a36a=
6d7b0d431a231178d3d670bbcc6"
+SRC_URI[tokio-macros-2.7.0.sha256sum] =3D "385a6cb71ab9ab790c5fe8d67f1645e=
6c450a7ce006a33de03daa956cf70a496"
+SRC_URI[tokio-rustls-0.26.4.sha256sum] =3D "1729aa945f29d91ba541258c8df890=
27d5792d85a8841fb65e8bf0f4ede4ef61"
+SRC_URI[tokio-stream-0.1.18.sha256sum] =3D "32da49809aab5c3bc678af03902d4c=
cddea2a87d028d86392a4b1560c6906c70"
+SRC_URI[tokio-util-0.7.18.sha256sum] =3D "9ae9cec805b01e8fc3fd2fe289f89149=
a9b66dd16786abd8b19cfa7b48cb0098"
+SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] =3D "cf92845e79fc2e2def6a5d828f0=
801e29a2f8acc037becc5ab08595c7d5e9863"
+SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] =3D "92e1cfed4a3038bc5a1=
27e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
+SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] =3D "a2abe9b86193656635d24=
11dc43050282ca48aa31c2451210f4202550afb7526"
+SRC_URI[toml_writer-1.1.1+spec-1.1.0.sha256sum] =3D "756daf9b1013ebe47a877=
6667b466417e2d4c5679d441c26230efd9ef78692db"
+SRC_URI[tonic-0.14.5.sha256sum] =3D "fec7c61a0695dc1887c1b53952990f3ad2e3a=
31453e1f49f10e75424943a93ec"
+SRC_URI[tonic-build-0.14.5.sha256sum] =3D "1882ac3bf5ef12877d7ed57aad87e75=
154c11931c2ba7e6cde5e22d63522c734"
+SRC_URI[tonic-prost-0.14.5.sha256sum] =3D "a55376a0bbaa4975a3f10d009ad763d=
8f4108f067c7c2e74f3001fb49778d309"
+SRC_URI[tonic-prost-build-0.14.5.sha256sum] =3D "f3144df636917574672e93d0f=
56d7edec49f90305749c668df5101751bb8f95a"
+SRC_URI[tower-0.5.3.sha256sum] =3D "ebe5ef63511595f1344e2d5cfa636d973292ad=
c0eec1f0ad45fae9f0851ab1d4"
+SRC_URI[tower-layer-0.3.3.sha256sum] =3D "121c2a6cda46980bb0fcd1647ffaf6cd=
3fc79a013de288782836f6df9c48780e"
+SRC_URI[tower-service-0.3.3.sha256sum] =3D "8df9b6e13f2d32c91b9bd719c00d19=
58837bc7dec474d94952798cc8e69eeec3"
+SRC_URI[tracing-0.1.44.sha256sum] =3D "63e71662fa4b2a2c3a26f570f037eb95bb1=
f85397f3cd8076caed2f026a6d100"
+SRC_URI[tracing-attributes-0.1.31.sha256sum] =3D "7490cfa5ec96374656874065=
1ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
+SRC_URI[tracing-core-0.1.36.sha256sum] =3D "db97caf9d906fbde555dd62fa95ddb=
a9eecfd14cb388e4f491a66d74cd5fb79a"
+SRC_URI[try-lock-0.2.5.sha256sum] =3D "e421abadd41a4225275504ea4d656692341=
8b7f05506fbc9c0fe86ba7396114b"
+SRC_URI[typenum-1.20.0.sha256sum] =3D "40ce102ab67701b8526c123c1bab5cbe42d=
7040ccfd0f64af1a385808d2f43de"
+SRC_URI[ucd-trie-0.1.7.sha256sum] =3D "2896d95c02a80c6d6a5d6e953d479f5ddf2=
dfdb6a244441010e373ac0fb88971"
+SRC_URI[umask-2.1.0.sha256sum] =3D "ec9a46c2549e35c054e0ffe281a3a6ec000779=
3db4df106604d37ed3f4d73d1c"
+SRC_URI[unicase-2.9.0.sha256sum] =3D "dbc4bc3a9f746d862c45cb89d705aa10f187=
bb96c76001afab07a0d35ce60142"
+SRC_URI[unicode-general-category-1.1.0.sha256sum] =3D "0b993bddc193ae5bd0d=
623b49ec06ac3e9312875fdae725a975c51db1cc1677f"
+SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa179702e=
2b244f760991f45397d14d4ebf38247da75"
+SRC_URI[unicode-segmentation-1.13.2.sha256sum] =3D "9629274872b2bfaf8d66f5=
f15725007f635594914870f65218920345aa11aa8c"
+SRC_URI[unicode-width-0.2.2.sha256sum] =3D "b4ac048d71ede7ee76d585517add45=
da530660ef4390e49b098733c6e897f254"
+SRC_URI[unicode-xid-0.2.6.sha256sum] =3D "ebc1c04c71510c7f702b52b7c350734c=
9ff1295c464a03335b00bb84fc54f853"
+SRC_URI[unsafe-libyaml-0.2.11.sha256sum] =3D "673aac59facbab8a9007c7f6108d=
11f63b603f7cabff99fabf650fea5c32b861"
+SRC_URI[untrusted-0.9.0.sha256sum] =3D "8ecb6da28b8a351d773b68d5825ac39017=
e680750f980f3a1a85cd8dd28a47c1"
+SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084a5=
9b5ffc27a8859a5f0d494b5d52b6be"
+SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
+SRC_URI[uuid-1.23.1.sha256sum] =3D "ddd74a9687298c6858e9b88ec8935ec45d22e8=
fd5e6394fa1bd4e99a87789c76"
+SRC_URI[uuid-simd-0.8.0.sha256sum] =3D "23b082222b4f6619906941c17eb2297fff=
4c2fb96cb60164170522942a200bd8"
+SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f283853=
ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[vsimd-0.8.0.sha256sum] =3D "5c3082ca00d5a5ef149bb8b555a72ae84c9c59=
f7250f013ac822ac2e49b19c64"
+SRC_URI[want-0.3.1.sha256sum] =3D "bfa7760aed19e106de2c7c0b581b509f2f25d3d=
acaf737cb82ac61bc6d760b0e"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847eb=
01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.3+wasi-0.2.9.sha256sum] =3D "20064672db26d7cdc89c7798c4=
8a0fdfac8213434a1186e5ef29fd560ae223d6"
+SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] =3D "5428f8bf88ea=
5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
+SRC_URI[wasm-bindgen-0.2.118.sha256sum] =3D "0bf938a0bacb0469e83c1e148908b=
d7d5a6010354cf4fb73279b7447422e3a89"
+SRC_URI[wasm-bindgen-macro-0.2.118.sha256sum] =3D "eeff24f84126c0ec2db7a44=
9f0c2ec963c6a49efe0698c4242929da037ca28ed"
+SRC_URI[wasm-bindgen-macro-support-0.2.118.sha256sum] =3D "9d08065faf983b2=
b80a79fd87d8254c409281cf7de75fc4b773019824196c904"
+SRC_URI[wasm-bindgen-shared-0.2.118.sha256sum] =3D "5fd04d9e306f1907bd13c6=
361b5c6bfc7b3b3c095ed3f8a9246390f8dbdee129"
+SRC_URI[wasm-encoder-0.244.0.sha256sum] =3D "990065f2fe63003fe337b932cfb5e=
3b80e0b4d0f5ff650e6985b1048f62c8319"
+SRC_URI[wasm-metadata-0.244.0.sha256sum] =3D "bb0e353e6a2fbdc176932bbaab49=
3762eb1255a7900fe0fea1a2f96c296cc909"
+SRC_URI[wasmparser-0.244.0.sha256sum] =3D "47b807c72e1bac69382b3a6fb3dbe8e=
a4c0ed87ff5629b8685ae6b9a611028fe"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe939=
92746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426dd=
9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d057c=
1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-0.62.2.sha256sum] =3D "527fadee13e0c05939a6a05d5bd6eec6cd2=
e3dbd648b9f8e447c6518133d8580"
+SRC_URI[windows-collections-0.3.2.sha256sum] =3D "23b2d95af1a8a14a3c7367e1=
ed4fc9c20e0a26e79551b1454d72583c97cc6610"
+SRC_URI[windows-core-0.62.2.sha256sum] =3D "b8e83a14d34d0623b51dce95811993=
02a221863196a1dde71a7663a4c2be9deb"
+SRC_URI[windows-future-0.3.2.sha256sum] =3D "e1d6f90251fe18a279739e78025bd=
6ddc52a7e22f921070ccdc67dde84c605cb"
+SRC_URI[windows-implement-0.60.2.sha256sum] =3D "053e2e040ab57b9dc951b72c2=
64860db7eb3b0200ba345b4e4c3b14f67855ddf"
+SRC_URI[windows-interface-0.59.3.sha256sum] =3D "3f316c4a2570ba26bbec72203=
2c4099d8c8bc095efccdc15688708623367e358"
+SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e57f7521d6a62e36fa9163b=
c891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-numerics-0.3.1.sha256sum] =3D "6e2e40844ac143cdb44aead537b=
bf727de9b044e107a0f1220392177d15b0f26"
+SRC_URI[windows-result-0.4.1.sha256sum] =3D "7781fa89eaf60850ac3d2da7af8e5=
242a5ea78d1a11c49bf2910bb5a73853eb5"
+SRC_URI[windows-strings-0.5.1.sha256sum] =3D "7837d08f69c77cf6b07689544538=
e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
+SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3f9=
beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-sys-0.60.2.sha256sum] =3D "f2f500e4d28234f72040990ec9d39e3=
a6b950f9f22d3dba18416c35882612bcb"
+SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df6176=
6145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d47=
80d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.5.sha256sum] =3D "4945f9f551b88e0d65f3db0bc25=
c33b8acea4d9e41163edf90dcd0b19f9069f3"
+SRC_URI[windows-threading-0.2.1.sha256sum] =3D "3949bd5b99cafdf1c7ca86b43c=
a564028dfe27d66958f2470940f73d86d75b37"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec044=
bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] =3D "a9d8416fa8b42f5c947=
f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53fa=
7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] =3D "b9d782e804c2f632e39570=
8e99a94275910eb9100b2114651e04744e9b125006"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295ac6=
720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] =3D "960e6da069d81e09becb0ca57a=
65220ddff016ff2d6af6a223cf372a506593a3"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76c5=
63b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] =3D "fa7359d10048f68ab8b09f=
a71c3daccfb0e9b559aed648a8f95469c27057180c"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28bf=
89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] =3D "1e7ac75179f18232fe9c28516=
3565a57ef8d3c89254a30685b57d83a38d326c2"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901cb5=
895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] =3D "9c3842cdd74a865a8066ab39=
c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc41741267968=
1396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] =3D "0ffa179e2d07eee8ad8f=
57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d127=
0a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] =3D "d6bbff5f0aada427a1e5a6d=
a5f1f98158182f26556f345ac9e04d36d0ebed650"
+SRC_URI[winnow-0.7.15.sha256sum] =3D "df79d97927682d2fd8adb29682d1140b343b=
e4ac0f08fd68b7765d9c059d3945"
+SRC_URI[winnow-1.0.2.sha256sum] =3D "2ee1708bef14716a11bae175f579062d4554d=
95be2c6829f518df847b7b3fdd0"
+SRC_URI[wit-bindgen-0.51.0.sha256sum] =3D "d7249219f66ced02969388cf2bb044a=
09756a083d0fab1e566056b04d9fbcaa5"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] =3D "1ebf944e87a7c253233ad6766e082e3=
cd714b5d03812acc24c318f549614536e"
+SRC_URI[wit-bindgen-core-0.51.0.sha256sum] =3D "ea61de684c3ea68cb082b7a885=
08a8b27fcc8b797d738bfc99a82facf1d752dc"
+SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] =3D "b7c566e0f4b284dd6561c786d9=
cb0142da491f46a9fbed79ea69cdad5db17f21"
+SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] =3D "0c0f9bfd77e6a48eccf5=
1359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
+SRC_URI[wit-component-0.244.0.sha256sum] =3D "9d66ea20e9553b30172b5e831994=
e35fbde2d165325bec84fc43dbf6f4eb9cb2"
+SRC_URI[wit-parser-0.244.0.sha256sum] =3D "ecc8ac4bc1dc3381b7f59c34f00b67e=
18f910c2c0f50015669dde7def656a736"
+SRC_URI[writeable-0.6.3.sha256sum] =3D "1ffae5123b2d3fc086436f8834ae3ab053=
a283cfac8fe0a0b8eaae044768a4c4"
+SRC_URI[x509-parser-0.18.1.sha256sum] =3D "d43b0f71ce057da06bc0851b23ee24f=
3f86190b07203dd8f567d0b706a185202"
+SRC_URI[yoke-0.8.2.sha256sum] =3D "abe8c5fda708d9ca3df187cae8bfb9ceda00dd9=
6231bed36e445a1a48e66f9ca"
+SRC_URI[yoke-derive-0.8.2.sha256sum] =3D "de844c262c8848816172cef550288e7d=
c6c7b7814b4ee56b3e1553f275f1858e"
+SRC_URI[zerocopy-0.8.48.sha256sum] =3D "eed437bf9d6692032087e337407a86f04c=
d8d6a16a37199ed57949d415bd68e9"
+SRC_URI[zerocopy-derive-0.8.48.sha256sum] =3D "70e3cd084b1788766f53af483dd=
21f93881ff30d7320490ec3ef7526d203bad4"
+SRC_URI[zerofrom-0.1.7.sha256sum] =3D "69faa1f2a1ea75661980b013019ed6687ed=
0e83d069bc1114e2cc74c6c04c4df"
+SRC_URI[zerofrom-derive-0.1.7.sha256sum] =3D "11532158c46691caf0f2593ea835=
8fed6bbf68a0315e80aae9bd41fbade684a1"
+SRC_URI[zeroize-1.8.2.sha256sum] =3D "b97154e67e32c85465826e8bcc1c59429aaa=
f107c1e4a9e53c8d8ccd5eff88d0"
+SRC_URI[zerotrie-0.2.4.sha256sum] =3D "0f9152d31db0792fa83f70fb2f83148effb=
5c1f5b8c7686c3459e361d9bc20bf"
+SRC_URI[zerovec-0.11.6.sha256sum] =3D "90f911cbc359ab6af17377d242225f4d751=
19aec87ea711a880987b18cd7b239"
+SRC_URI[zerovec-derive-0.11.3.sha256sum] =3D "625dc425cab0dca6dc3c3319506e=
6593dcb08a9f387ea3b284dbd52a92c40555"
+SRC_URI[zmij-1.0.21.sha256sum] =3D "b8848ee67ecc8aedbaf3e4122217aff8926392=
31befc6a1b58d29fff4c2cabaa"
diff --git a/recipes-containers/ankaios/ankaios_git.bb b/recipes-containers=
/ankaios/ankaios_git.bb
new file mode 100644
index 00000000..3f8c93c3
--- /dev/null
+++ b/recipes-containers/ankaios/ankaios_git.bb
@@ -0,0 +1,135 @@
+SUMMARY =3D "Eclipse Ankaios: Lightweight container orchestrator for embed=
ded Linux"
+DESCRIPTION =3D "Eclipse Ankaios is a lightweight container/workload orche=
strator for embedded Linux systems. This recipe builds Ankaios from source =
using vendored Rust crates."
+HOMEPAGE =3D "https://eclipse-ankaios.github.io/ankaios/latest/"
+BUGTRACKER =3D "https://github.com/eclipse-ankaios/ankaios/issues"
+
+SECTION =3D "virtualization/tools"
+
+CVE_PRODUCT =3D "eclipse:ankaios"
+
+# Ankaios itself is Apache-2.0; the rest is the license union of the >700 =
vendored
+# crates, derived from upstream deny.toml (release-1.0) and verified again=
st
+# ankaios-crates.inc (ring->OpenSSL, foldhash->Zlib, borrow-or-share->MIT-=
0,
+# unicode-ident->Unicode-3.0).
+LICENSE =3D "Apache-2.0 & BSD-3-Clause & ISC & MIT & MIT-0 & OpenSSL & Uni=
code-3.0 & Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd5=
7"
+
+# Container runtime stack is not supported on MIPS
+COMPATIBLE_HOST =3D "^(?!(qemu)?mips).*"
+
+# Build dependencies
+DEPENDS +=3D "protobuf-native"
+
+PV =3D "1.0.3+git"
+
+SRC_URI =3D "\
+    git://github.com/eclipse-ankaios/ankaios.git;protocol=3Dhttps;branch=
=3Drelease-1.0 \
+    file://state.yaml \
+    file://ank.conf \
+    file://ank-server.conf \
+    file://ank-agent.conf \
+    file://ank-server.service \
+    file://ank-agent.service \
+    file://ank-server;subdir=3Dinit-scripts \
+    file://ank-agent;subdir=3Dinit-scripts \
+    file://ank-server.default \
+    file://ank-agent.default \
+"
+
+# v1.0.3 tag commit
+# When bumping SRCREV, re-diff upstream deny.toml and re-check LICENSE aga=
inst the crate graph.
+SRCREV =3D "3f7ab7f148e814c57cb7de1e2bb11b9a05b7814b"
+
+# cargo-update-recipe-crates provides the `update_crates` task used to
+# regenerate ankaios-crates.inc after an SRCREV bump.
+inherit cargo cargo-update-recipe-crates systemd update-rc.d
+
+require ${BPN}-crates.inc
+
+# Package split:
+# - ank-server: server binary + server config + systemd unit
+# - ank-agent: agent binary + agent config + systemd unit
+# - ank: CLI binary ("ank")
+# - ankaios (${PN}): meta package pulling server+agent+cli
+PACKAGE_BEFORE_PN =3D "ank ank-agent ank-server"
+
+ALLOW_EMPTY:${PN} =3D "1"
+
+FILES:ank +=3D "${bindir}/ank \
+    ${sysconfdir}/ankaios/ank.conf \
+"
+
+FILES:ank-agent +=3D "\
+    ${bindir}/ank-agent \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_system_u=
nitdir}/ank-agent.service', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/ini=
t.d/ank-agent', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/def=
ault/ank-agent', '', d)} \
+    ${sysconfdir}/ankaios/ank-agent.conf \
+"
+
+FILES:ank-server +=3D "\
+    ${bindir}/ank-server \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${systemd_system_u=
nitdir}/ank-server.service', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/ini=
t.d/ank-server', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/def=
ault/ank-server', '', d)} \
+    ${sysconfdir}/ankaios/state.yaml \
+    ${sysconfdir}/ankaios/ank-server.conf \
+"
+
+RDEPENDS:${PN} =3D "ank ank-agent ank-server"
+
+# The agent shells out to a container runtime to launch workloads
+# Ankaios does not require the following to start, but running workloads r=
equires Podman and/or containerd + nerdctl.
+RRECOMMENDS:ank-agent +=3D "podman \
+                          containerd \
+                          nerdctl \
+                          "
+
+CONFFILES:ank =3D "${sysconfdir}/ankaios/ank.conf"
+CONFFILES:ank-server =3D "${sysconfdir}/ankaios/state.yaml ${sysconfdir}/a=
nkaios/ank-server.conf ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', =
'${sysconfdir}/default/ank-server', '', d)}"
+CONFFILES:ank-agent =3D "${sysconfdir}/ankaios/ank-agent.conf ${@bb.utils.=
contains('DISTRO_FEATURES', 'sysvinit', '${sysconfdir}/default/ank-agent', =
'', d)}"
+
+# Install/enable systemd units when systemd is enabled
+SYSTEMD_PACKAGES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
ank-server ank-agent', '', d)}"
+SYSTEMD_SERVICE:ank-server =3D "ank-server.service"
+SYSTEMD_SERVICE:ank-agent =3D "ank-agent.service"
+SYSTEMD_AUTO_ENABLE:ank-server =3D "enable"
+SYSTEMD_AUTO_ENABLE:ank-agent =3D "enable"
+
+INITSCRIPT_PACKAGES =3D "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit=
', 'ank-server ank-agent', '', d)}"
+INITSCRIPT_NAME:ank-server =3D "ank-server"
+INITSCRIPT_PARAMS:ank-server =3D "start 70 2 3 4 5 . stop 30 0 1 6 ."
+INITSCRIPT_NAME:ank-agent =3D "ank-agent"
+INITSCRIPT_PARAMS:ank-agent =3D "start 71 2 3 4 5 . stop 29 0 1 6 ."
+
+do_install() {
+    # Install binaries
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/ank-server ${D}${bi=
ndir}/
+    install -m 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/ank-agent ${D}${bin=
dir}/
+    install -m 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/ank ${D}${bindir}/
+
+    # Install configuration directory
+    install -d ${D}${sysconfdir}/ankaios
+    install -m 0644 ${UNPACKDIR}/state.yaml ${D}${sysconfdir}/ankaios/
+    install -m 0644 ${UNPACKDIR}/ank.conf ${D}${sysconfdir}/ankaios/
+    install -m 0644 ${UNPACKDIR}/ank-server.conf ${D}${sysconfdir}/ankaios=
/
+    install -m 0644 ${UNPACKDIR}/ank-agent.conf ${D}${sysconfdir}/ankaios/
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/ank-server.service ${D}${systemd_syst=
em_unitdir}/
+        install -m 0644 ${UNPACKDIR}/ank-agent.service ${D}${systemd_syste=
m_unitdir}/
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false'=
, d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${UNPACKDIR}/init-scripts/ank-server ${D}${sysconf=
dir}/init.d/ank-server
+        install -m 0755 ${UNPACKDIR}/init-scripts/ank-agent ${D}${sysconfd=
ir}/init.d/ank-agent
+
+        install -d ${D}${sysconfdir}/default
+        install -m 0644 ${UNPACKDIR}/ank-server.default ${D}${sysconfdir}/=
default/ank-server
+        install -m 0644 ${UNPACKDIR}/ank-agent.default ${D}${sysconfdir}/d=
efault/ank-agent
+    fi
+
+}
diff --git a/recipes-containers/ankaios/files/ank-agent b/recipes-container=
s/ankaios/files/ank-agent
new file mode 100644
index 00000000..05b32d72
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank-agent
@@ -0,0 +1,96 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          ank-agent
+# Required-Start:    $remote_fs $network $syslog
+# Required-Stop:     $remote_fs $network $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Ankaios agent
+### END INIT INFO
+
+set -e
+
+NAME=3D"ank-agent"
+DAEMON=3D"/usr/bin/ank-agent"
+CONFIG=3D"/etc/ankaios/ank-agent.conf"
+PIDFILE=3D"/run/${NAME}.pid"
+
+[ -r "/etc/default/${NAME}" ] && . "/etc/default/${NAME}"
+
+RUST_LOG=3D"${RUST_LOG:-info}"
+LOGFILE=3D"${LOGFILE:-/var/log/${NAME}.log}"
+
+is_running() {
+    [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE" 2>/dev/null)" 2>/dev/nu=
ll
+}
+
+do_start() {
+    if [ ! -x "$DAEMON" ]; then
+        echo "$DAEMON not installed"
+        return 5
+    fi
+
+    if is_running; then
+        echo "$NAME already running"
+        return 0
+    fi
+
+    export RUST_LOG
+    mkdir -p "$(dirname "$PIDFILE")" "$(dirname "$LOGFILE")"
+
+    start-stop-daemon -S -b -m -p "$PIDFILE" -x /bin/sh -- -c "exec \"$DAE=
MON\" -x \"$CONFIG\" >>\"$LOGFILE\" 2>&1"
+}
+
+do_stop() {
+    if ! [ -f "$PIDFILE" ]; then
+        return 0
+    fi
+
+    start-stop-daemon -K -p "$PIDFILE" -x "$DAEMON" -s TERM || true
+
+    for _i in 1 2 3 4 5; do
+        if is_running; then
+            sleep 1
+        else
+            break
+        fi
+    done
+
+    if is_running; then
+        start-stop-daemon -K -p "$PIDFILE" -x "$DAEMON" -s KILL || true
+    fi
+
+    rm -f "$PIDFILE"
+}
+
+do_status() {
+    if is_running; then
+        echo "$NAME running"
+        return 0
+    fi
+
+    echo "$NAME not running"
+    return 3
+}
+
+case "$1" in
+    start)
+        do_start
+        ;;
+    stop)
+        do_stop
+        ;;
+    restart|force-reload)
+        do_stop
+        do_start
+        ;;
+    status)
+        do_status
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|force-reload|status}"
+        exit 2
+        ;;
+esac
+
+exit 0
diff --git a/recipes-containers/ankaios/files/ank-agent.conf b/recipes-cont=
ainers/ankaios/files/ank-agent.conf
new file mode 100644
index 00000000..fb91d4ab
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank-agent.conf
@@ -0,0 +1,49 @@
+# This is the configuration file for an Ankaios agent.
+# This configuration file is formatted in the TOML language.
+
+# The format version of the configuration file to ensure compatibility.
+version =3D 'v1'
+
+# The name to use for the registration with the server.
+# Every agent has to register with a unique name.
+# Agent name shall contain only regular upper and lowercase characters
+# (a-z and A-Z), numbers and the symbols "-" and "_".
+name =3D 'agent_A'
+
+# The server url.
+# server_url =3D 'https://127.0.0.1:25551'
+
+# An existing path where to manage the fifo files.
+# The default path is '/tmp/ankaios/'.
+# run_folder =3D '/tmp/ankaios/'
+
+# The flag to disable TLS communication with the server.
+# If set to 'true', then the agent shall not use TLS.
+insecure =3D true
+
+# The path to the ca certificate pem file.
+# ca_pem =3D '/etc/ankaios/certs/ca.pem'
+
+# The path to agent certificate pem file.
+# crt_pem =3D '/etc/ankaios/certs/ank-agent.pem'
+
+# The path to agent key pem file.
+# key_pem =3D '/etc/ankaios/certs/ank-agent-key.pem'
+
+# The content of the ca certificate pem file.
+# You can either provide ca_pem or ca_pem_content, but not both
+# ca_pem_content =3D '''-----BEGIN CERTIFICATE-----
+# ...
+# -----END CERTIFICATE-----'''
+
+# The content of the agent certificate pem file.
+# You can either provide crt_pem or crt_pem_content, but not both
+# crt_pem_content =3D '''-----BEGIN CERTIFICATE-----
+# ...
+# -----END CERTIFICATE-----'''
+
+# The content of the agent key pem file.
+# You can either provide key_pem or key_pem_content, but not both
+# key_pem_content =3D '''-----BEGIN PRIVATE KEY-----
+# ...
+# -----END PRIVATE KEY-----'''
diff --git a/recipes-containers/ankaios/files/ank-agent.default b/recipes-c=
ontainers/ankaios/files/ank-agent.default
new file mode 100644
index 00000000..501afab9
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank-agent.default
@@ -0,0 +1,8 @@
+# Environment overrides for the ank-agent sysvinit service.
+# Sourced by /etc/init.d/ank-agent. Uncomment and adjust as needed.
+
+# Log level for the Ankaios agent (error, warn, info, debug, trace).
+#RUST_LOG=3Dinfo
+
+# Log file written by the init script.
+#LOGFILE=3D/var/log/ank-agent.log
diff --git a/recipes-containers/ankaios/files/ank-agent.service b/recipes-c=
ontainers/ankaios/files/ank-agent.service
new file mode 100644
index 00000000..e14551df
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank-agent.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=3DAnkaios agent
+After=3Dnetwork.target
+
+[Service]
+Environment=3D"RUST_LOG=3Dinfo"
+ExecStart=3D/usr/bin/ank-agent -x /etc/ankaios/ank-agent.conf
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/recipes-containers/ankaios/files/ank-server b/recipes-containe=
rs/ankaios/files/ank-server
new file mode 100644
index 00000000..3d4a0f19
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank-server
@@ -0,0 +1,96 @@
+#!/bin/sh
+### BEGIN INIT INFO
+# Provides:          ank-server
+# Required-Start:    $remote_fs $network $syslog
+# Required-Stop:     $remote_fs $network $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Ankaios server
+### END INIT INFO
+
+set -e
+
+NAME=3D"ank-server"
+DAEMON=3D"/usr/bin/ank-server"
+CONFIG=3D"/etc/ankaios/ank-server.conf"
+PIDFILE=3D"/run/${NAME}.pid"
+
+[ -r "/etc/default/${NAME}" ] && . "/etc/default/${NAME}"
+
+RUST_LOG=3D"${RUST_LOG:-info}"
+LOGFILE=3D"${LOGFILE:-/var/log/${NAME}.log}"
+
+is_running() {
+    [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE" 2>/dev/null)" 2>/dev/nu=
ll
+}
+
+do_start() {
+    if [ ! -x "$DAEMON" ]; then
+        echo "$DAEMON not installed"
+        return 5
+    fi
+
+    if is_running; then
+        echo "$NAME already running"
+        return 0
+    fi
+
+    export RUST_LOG
+    mkdir -p "$(dirname "$PIDFILE")" "$(dirname "$LOGFILE")"
+
+    start-stop-daemon -S -b -m -p "$PIDFILE" -x /bin/sh -- -c "exec \"$DAE=
MON\" -x \"$CONFIG\" >>\"$LOGFILE\" 2>&1"
+}
+
+do_stop() {
+    if ! [ -f "$PIDFILE" ]; then
+        return 0
+    fi
+
+    start-stop-daemon -K -p "$PIDFILE" -x "$DAEMON" -s TERM || true
+
+    for _i in 1 2 3 4 5; do
+        if is_running; then
+            sleep 1
+        else
+            break
+        fi
+    done
+
+    if is_running; then
+        start-stop-daemon -K -p "$PIDFILE" -x "$DAEMON" -s KILL || true
+    fi
+
+    rm -f "$PIDFILE"
+}
+
+do_status() {
+    if is_running; then
+        echo "$NAME running"
+        return 0
+    fi
+
+    echo "$NAME not running"
+    return 3
+}
+
+case "$1" in
+    start)
+        do_start
+        ;;
+    stop)
+        do_stop
+        ;;
+    restart|force-reload)
+        do_stop
+        do_start
+        ;;
+    status)
+        do_status
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|force-reload|status}"
+        exit 2
+        ;;
+esac
+
+exit 0
diff --git a/recipes-containers/ankaios/files/ank-server.conf b/recipes-con=
tainers/ankaios/files/ank-server.conf
new file mode 100644
index 00000000..a7d3b5e8
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank-server.conf
@@ -0,0 +1,40 @@
+# This is the configuration file for an Ankaios server.
+# This configuration file is formatted in the TOML language.
+
+# The format version of the configuration file to ensure compatibility.
+version =3D 'v1'
+
+# The path to the startup configuration manifest file.
+# By default, no startup configuration manifest is used.
+startup_manifest =3D '/etc/ankaios/state.yaml'
+
+# The address, including the port, to which the server should listen.
+# address =3D '127.0.0.1:25551'
+
+# The flag to disable TLS communication between
+# the Ankaios server, agents and the ank CLI.
+# If set to 'true' and the certificates are not provided, then the server =
shall not use TLS.
+insecure =3D true
+
+# The path to ca certificate pem file.
+# ca_pem =3D '/etc/ankaios/certs/ca.pem'
+# The path to server certificate pem file.
+# crt_pem =3D '/etc/ankaios/certs/ank-server.pem'
+# The path to server key pem file.
+# key_pem =3D '/etc/ankaios/certs/ank-server-key.pem'
+
+# The content of the ca certificate pem file.
+# You can either provide ca_pem or ca_pem_content, but not both.
+# ca_pem_content =3D '''-----BEGIN CERTIFICATE-----
+# ...
+# -----END CERTIFICATE-----'''
+# The content of the server certificate pem file.
+# You can either provide crt_pem or crt_pem_content, but not both.
+# crt_pem_content =3D '''-----BEGIN CERTIFICATE-----
+# ...
+# -----END CERTIFICATE-----'''
+# The content of the server key pem file.
+# You can either provide key_pem or key_pem_content, but not both.
+# key_pem_content =3D '''-----BEGIN PRIVATE KEY-----
+# ...
+# -----END PRIVATE KEY-----'''
diff --git a/recipes-containers/ankaios/files/ank-server.default b/recipes-=
containers/ankaios/files/ank-server.default
new file mode 100644
index 00000000..a16f3c92
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank-server.default
@@ -0,0 +1,8 @@
+# Environment overrides for the ank-server sysvinit service.
+# Sourced by /etc/init.d/ank-server. Uncomment and adjust as needed.
+
+# Log level for the Ankaios server (error, warn, info, debug, trace).
+#RUST_LOG=3Dinfo
+
+# Log file written by the init script.
+#LOGFILE=3D/var/log/ank-server.log
diff --git a/recipes-containers/ankaios/files/ank-server.service b/recipes-=
containers/ankaios/files/ank-server.service
new file mode 100644
index 00000000..425920d5
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank-server.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=3DAnkaios server
+After=3Dnetwork.target
+
+[Service]
+Environment=3D"RUST_LOG=3Dinfo"
+ExecStart=3D/usr/bin/ank-server -x /etc/ankaios/ank-server.conf
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/recipes-containers/ankaios/files/ank.conf b/recipes-containers=
/ankaios/files/ank.conf
new file mode 100644
index 00000000..ec925131
--- /dev/null
+++ b/recipes-containers/ankaios/files/ank.conf
@@ -0,0 +1,54 @@
+# This is the configuration file for the ank CLI.
+# This configuration file is formatted in the TOML language.
+
+# The format version of the configuration file to ensure compatibility.
+version =3D 'v1'
+
+# The timeout in milliseconds to wait for a response from the ank-server.
+# response_timeout =3D 3000  # milliseconds
+
+# The flag to enable verbose output.
+# verbose =3D false
+
+# The flag to disable all output.
+# quiet =3D false
+
+# The flag that enables waiting for workloads to be created/deleted.
+# no_wait =3D false
+
+[default]
+# The URL to Ankaios server.
+# If started in insecure mode then the HTTP protocol shall be used,
+# otherwise the HTTPS protocol shall be used.
+# server_url =3D 'https://127.0.0.1:25551'
+
+# The flag to disable TLS communication with the server.
+# If set to 'true', then the CLI shall not use TLS.
+insecure =3D true
+
+# The path to the ca certificate pem file.
+# ca_pem =3D '/etc/ankaios/certs/ca.pem'
+
+# The path to CLI certificate pem file.
+# crt_pem =3D '/home/ankaios/.config/ankaios/ank.pem'
+
+# The path to CLI key pem file.
+# key_pem =3D '/home/ankaios/.config/ankaios/ank-key.pem'
+
+# The content of the ca certificate pem file.
+# You can either provide ca_pem or ca_pem_content, but not both.
+# ca_pem_content =3D '''-----BEGIN CERTIFICATE-----
+# ...
+# -----END CERTIFICATE-----'''
+
+# The content of the CLI certificate pem file.
+# You can either provide crt_pem or crt_pem_content, but not both.
+# crt_pem_content =3D '''-----BEGIN CERTIFICATE-----
+# ...
+# -----END CERTIFICATE-----'''
+
+# The content of the CLI key pem file.
+# You can either provide key_pem or key_pem_content, but not both.
+# key_pem_content =3D '''-----BEGIN PRIVATE KEY-----
+# ...
+# -----END PRIVATE KEY-----'''
diff --git a/recipes-containers/ankaios/files/state.yaml b/recipes-containe=
rs/ankaios/files/state.yaml
new file mode 100644
index 00000000..3ed730a8
--- /dev/null
+++ b/recipes-containers/ankaios/files/state.yaml
@@ -0,0 +1,12 @@
+# Per default no workload is started. Adapt the file according to your nee=
ds.
+apiVersion: v1
+workloads:
+#   nginx:
+#     runtime: podman
+#     agent: agent_A
+#     restartPolicy: NEVER
+#     tags:
+#       owner: Ankaios team
+#     runtimeConfig: |
+#       image: docker.io/nginx:latest
+#       commandOptions: ["-p", "8081:80"]
diff --git a/recipes-extended/images/README-ankaios.md b/recipes-extended/i=
mages/README-ankaios.md
new file mode 100644
index 00000000..de8a05e6
--- /dev/null
+++ b/recipes-extended/images/README-ankaios.md
@@ -0,0 +1,96 @@
+# Booting and testing Ankaios in QEMU
+
+`ankaios-image-minimal` is a small reference image used to exercise Eclips=
e
+Ankaios end-to-end. It boots a single QEMU node running the Ankaios **serv=
er**
+and **agent** with the **podman** runtime, and starts one hello-ankaios
+workload from `/etc/ankaios/state.yaml`.
+
+Reference target: **`MACHINE =3D "qemux86-64"`**.
+
+## Prerequisites
+
+Because the image pulls in `podman`, the following layers and distro setti=
ngs
+must be present in your build configuration (they live outside this layer)=
:
+
+* Layers: `meta-openembedded` (`meta-oe`, `meta-python`, `meta-networking`=
) and
+  `meta-virtualization`, in addition to `openembedded-core`.
+* systemd as the init manager, in your distro or `local.conf`:
+
+  ```bitbake
+  INIT_MANAGER =3D "systemd"
+  ```
+
+* Distro features:
+
+  ```bitbake
+  DISTRO_FEATURES:append =3D " virtualization seccomp"
+  ```
+
+`podman` requires the `seccomp` distro feature; the Ankaios recipes themse=
lves
+do not. systemd is required (enforced via `REQUIRED_DISTRO_FEATURES`) beca=
use it
+mounts cgroups and configures DNS out of the box; with sysvinit you have t=
o do
+both manually before podman can run a workload.
+
+## Build
+
+```shell
+MACHINE=3Dqemux86-64 bitbake ankaios-image-minimal
+```
+
+## Boot
+
+```shell
+runqemu qemux86-64 ankaios-image-minimal nographic slirp qemuparams=3D"-m =
2048"
+```
+
+* `nographic` keeps everything on the serial console.
+* `slirp` gives the guest outbound networking so podman can pull
+  `docker.io/alpine:latest` on first start.
+
+Log in as `root` on the serial console with no password. The image sets
+`allow-empty-password empty-root-password allow-root-login`, so this is a
+debug/test image and not suitable for production use.
+
+## Verify the workload
+
+The server auto-starts from `/etc/ankaios/state.yaml`, the agent registers=
 as
+`agent_A`, and podman pulls and runs the `hello-ankaios` workload. Query t=
he state
+with the `ank` CLI:
+
+```shell
+ank get workloads
+```
+
+Expected output (the pull may take a few seconds on first boot, during whi=
ch
+the state passes through `Pending(...)`):
+
+```
+ WORKLOAD NAME   AGENT     RUNTIME   EXECUTION STATE   ADDITIONAL INFO
+ hello-ankaios   agent_A   podman    Running(Ok)
+```
+
+You can cross-check at the runtime level:
+
+```shell
+podman ps
+```
+
+which should list the running `hello-ankaios` container.
+
+## Tear down
+
+Stop the workload by deleting it through Ankaios (the agent tells podman t=
o
+remove the container):
+
+```shell
+ank delete workload hello-ankaios
+```
+
+`ank get workloads` should then show no workloads, and `podman ps` no
+containers. To shut the whole node down, power off the guest:
+
+```shell
+poweroff
+```
+
+or terminate QEMU from the host with `Ctrl-a x` (in `nographic` mode).
diff --git a/recipes-extended/images/ankaios-image-minimal.bb b/recipes-ext=
ended/images/ankaios-image-minimal.bb
new file mode 100644
index 00000000..91cae890
--- /dev/null
+++ b/recipes-extended/images/ankaios-image-minimal.bb
@@ -0,0 +1,39 @@
+SUMMARY =3D "Minimal image to boot and test Eclipse Ankaios end-to-end in =
QEMU"
+DESCRIPTION =3D "A small reference image that lands the Ankaios server, ag=
ent and \
+ank CLI together with the podman runtime and a state.yaml manifest. \
+It boots on qemux86-64 and starts a demo workload so the orchestrator can =
be \
+exercised end-to-end. See README-ankaios.md for the boot/verify/teardown s=
teps."
+
+LICENSE =3D "Apache-2.0"
+
+inherit core-image features_check
+
+# Podman needs virtualization + seccomp; systemd is required because it mo=
unts
+# cgroups and sets up DNS out of the box, which the sysvinit path does not=
.
+REQUIRED_DISTRO_FEATURES ?=3D "virtualization seccomp systemd"
+
+# Reference target documented in README-ankaios.md
+COMPATIBLE_MACHINE =3D "qemux86-64"
+
+# Debug/test image: passwordless root login on the serial console
+IMAGE_FEATURES +=3D "allow-empty-password empty-root-password allow-root-l=
ogin"
+
+# ankaios pulls server + agent + ank CLI; podman is the workload runtime t=
he
+# agent shells out to for the hello-world state.yaml below.
+IMAGE_INSTALL:append =3D " ankaios podman"
+
+# Headroom (1 GB) for the workload container image podman pulls at runtime
+IMAGE_ROOTFS_EXTRA_SPACE =3D "1000000"
+
+# Capture the in-layer path at parse time (only valid during parsing, henc=
e
+# ':=3D'), and track it so do_rootfs reruns when state.yaml changes.
+STATE_YAML_SRC :=3D "${THISDIR}/${PN}/state.yaml"
+do_rootfs[file-checksums] +=3D "${STATE_YAML_SRC}:True"
+
+# Override the (empty) default state.yaml shipped by ank-server with one t=
hat
+# defines the hello-ankaios workload.
+ROOTFS_POSTPROCESS_COMMAND +=3D "install_ankaios_test_state;"
+install_ankaios_test_state() {
+    install -d ${IMAGE_ROOTFS}${sysconfdir}/ankaios
+    install -m 0644 ${STATE_YAML_SRC} ${IMAGE_ROOTFS}${sysconfdir}/ankaios=
/state.yaml
+}
diff --git a/recipes-extended/images/ankaios-image-minimal/state.yaml b/rec=
ipes-extended/images/ankaios-image-minimal/state.yaml
new file mode 100644
index 00000000..89fe43b5
--- /dev/null
+++ b/recipes-extended/images/ankaios-image-minimal/state.yaml
@@ -0,0 +1,11 @@
+# Example startup state for the ankaios-image-minimal test image.
+# Starts a single long-running "hello-ankaios" workload under podman so th=
e
+# orchestrator can be exercised end-to-end (see README-ankaios.md).
+apiVersion: v1
+workloads:
+  hello-ankaios:
+    runtime: podman
+    agent: agent_A
+    runtimeConfig: |
+      image: docker.io/alpine:latest
+      commandArgs: [ "sh", "-c", "trap 'echo; exit' SIGINT SIGTERM; while =
true; do echo 'Hello Ankaios!'; sleep 1; done" ]
--=20
2.43.0


