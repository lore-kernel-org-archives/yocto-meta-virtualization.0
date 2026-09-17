Return-Path: <kaloyan.rusev@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF35C982D1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 13:49:53 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.103])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39979.1789652984747170085
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 06:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@elektrobit.com header.s=selector1 header.b=KPR4oesU;
 dkim=fail reason="dkim: body hash did not verify" header.i=@elektrobit.com header.s=selector1 header.b=KPR4oesU;
 spf=pass (domain: elektrobit.com, ip: 40.107.208.103, mailfrom: kaloyan.rusev@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ep1lMpdm7dDtr5XGNwRDTxr/lP5BM+ovSNi8SxfKDjYdCBAWkcxbzsYr8JsJOsF2vtQHABUL+pMSZx65lJQ07A1Bnb9EHRSVDR+I8nZCwDYxgWgechNksJZK9YxCDH+gCzHw94vnoI9JyS3OBW+ssbuzwz/VDp63woluaMc8eKPdZuzB7Uc4ILxUqRcWxH9RS2NCZmQB46kI1mm8W/EmXS0dpE9u68/Gv/ZnCsL0pXf1w3rlZz0IQSdMtfTpxI7bArYw3Z6eP9XEYbQ5DBYrHRxGAijYJnLUtT/4xNF2+mdXfB9KN7YfSIhZ+I5Hf+pU0p1cAvHYuIFGQ47NLAV/ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vON2yAqkPv7DqCYu6J+tuOXzf9+SpbpSxp1p+GxGZrc=;
 b=MVwyP+rRtbxOv7zNPP0Y2Hir8UKT02jEHnp7EQ4QnnWZ0+jYVvchPDzgskF/GyKxNO1hmpDcIo8T6RZuYcM2ybEtjM99ioRD6Otr/U4fJ0VBPW5MhAHrnW12WKrmZtqoinBmAdvsHTIEvSRl0VEQueIZC9NE8KDO1mpQzAEIzvNbCe5/HlNg3mWwfzM0df0koNXOqKUwbB+c1KaWXcC8jbKFZOA8Uimbu3JNx/KDarbviI7gq49CRPYp6OFa0uhYvdc0Ar90K1Q3kdufwTrZZonZ/B/xnF7rILAyjUTqM1F4WVSwexpw+7RMI7r68gO6skVJtADGdqnzlUSN+Gb6MQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.14.97) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=elektrobit.com]
 dmarc=[1,1,header.from=elektrobit.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vON2yAqkPv7DqCYu6J+tuOXzf9+SpbpSxp1p+GxGZrc=;
 b=KPR4oesUBOb/uMKMSdt8/ocrG6JJYQVyx5sGuLWH04Rt/xRwnHdrBkksZfQczNopBwVfF28kzyF7YzBHS+YzY7zZ8cYC8vvO1gs9eG6X6niFps6jYZq26MVHZVjmUnoR6suMUUzIutHkSGy4nTk3+tjDwIGWqPrpiFEfGHADTSs=
Received: from CH0PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:b0::12)
 by EA2PR08MB9712.namprd08.prod.outlook.com (2603:10b6:303:24f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 13:49:37 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::a0) by CH0PR03CA0007.outlook.office365.com
 (2603:10b6:610:b0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 13:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.14.97)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.com;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 40.93.14.97 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.14.97; helo=SN1PR07CU001.outbound.protection.outlook.com;
 pr=C
Received: from usbth1es004.ebgroup.elektrobit.com (4.79.107.244) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 17 Sep 2026 13:49:36 +0000
Received: from usbth1es004 (localhost [127.0.0.1])
	by usbth1es004.ebgroup.elektrobit.com (Postfix) with SMTP id 4hlxvM64lLz27bb
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Sep 2026 06:49:35 -0700 (PDT)
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00101.outbound.protection.outlook.com [40.93.14.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp384r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Sep 2026 06:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmP6MgwSzsrN1mco/YLViL5NqtwRuqotc+kMBlmyN+ByxoHTg6X+xiapRPI2WziMGoKkjFtlSX1DhOUqnot3vcsJu2Lvm4R6Dx1D0a2usi9pw6PL2MA90tRMw/0DSVwZL8c3fn/TCsQleNpsyt4Cxv9E4WS2v72U8+lSF3s9lnr0KZ/ro6cxoc8sUAKRw2DkPM8LxwYL8wE5Fd2Zsicjro6Se92xQ8WRZE2LzZY4kwGSlve+cMb3Y5pSxTKFsEsVw1fHZnl/tDdKtaV/3/qg1CcNggSFgCwXHzRdF9VQIwtqlL4i+vjkW7BD8dWjsF80zdFA4th3XBykehTkAL/gAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vON2yAqkPv7DqCYu6J+tuOXzf9+SpbpSxp1p+GxGZrc=;
 b=JsrVCxqUJKx9TMRDcD2mf5HiBnOvNonCd14sEsFi+PI7I7oom7RSwGWLzBbXVM8OVtbOUIWBBVLI0ahE/mJ9Z/uihtnGEDvtNbdCOEMEkoJwUTKUTvp2mdUxK6FYmXWRbq5uXoztTO3x8sCL3kuNWjbCAH92u4BO52kkncEzvy6YxcwpZHXhnm/85kxBaGdsZRN4YwO3BxixG48UyF+mwqUTSSA1CmZxcI8EFgfQrxfKB1J25/w8vjL1xmQgSp0xCc2FstNNCNT0NZQD8ZLCogrUrjYTsVzMSOLXg46cjOHXW7IZ7tpYwEMpc8uEeKpHXAtJiWB81wMFBRYrtzW5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 213.95.148.172) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=elektrobit.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=elektrobit.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elektrobit.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vON2yAqkPv7DqCYu6J+tuOXzf9+SpbpSxp1p+GxGZrc=;
 b=KPR4oesUBOb/uMKMSdt8/ocrG6JJYQVyx5sGuLWH04Rt/xRwnHdrBkksZfQczNopBwVfF28kzyF7YzBHS+YzY7zZ8cYC8vvO1gs9eG6X6niFps6jYZq26MVHZVjmUnoR6suMUUzIutHkSGy4nTk3+tjDwIGWqPrpiFEfGHADTSs=
Received: from SJ0PR05CA0128.namprd05.prod.outlook.com (2603:10b6:a03:33d::13)
 by LV4PPF8220EFDCE.namprd08.prod.outlook.com (2603:10b6:40f:fc02::88f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 17 Sep
 2026 13:49:27 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::23) by SJ0PR05CA0128.outlook.office365.com
 (2603:10b6:a03:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Thu, 17
 Sep 2026 13:49:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 213.95.148.172)
 smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=elektrobit.com;
Received-SPF: Pass (protection.outlook.com: domain of elektrobit.com
 designates 213.95.148.172 as permitted sender)
 receiver=protection.outlook.com; client-ip=213.95.148.172;
 helo=denue6es012.ebgroup.elektrobit.com; pr=C
Received: from denue6es012.ebgroup.elektrobit.com (213.95.148.172) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 13:49:26 +0000
Received: from DEL03066.ebgroup.elektrobit.com (10.10.185.92) by
 denue6es012.ebgroup.elektrobit.com (10.243.160.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 17 Sep 2026 15:49:24 +0200
From: <kaloyan.rusev@elektrobit.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Kaloyan Rusev <kaloyan.rusev@elektrobit.com>
Subject: [meta-virtualization][wrynose][PATCH] ankaios: add Eclipse Ankaios container orchestrator recipe
Date: Thu, 17 Sep 2026 15:47:20 +0200
Message-ID: <20260917134911.95950-1-kaloyan.rusev@elektrobit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aaaa2a3.98235939.208b75.d30f@mx.google.com>
References: <6aaaa2a3.98235939.208b75.d30f@mx.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.10.185.92]
X-ClientProxiedBy: denue6es013.ebgroup.elektrobit.com (10.243.160.141) To
 denue6es012.ebgroup.elektrobit.com (10.243.160.140)
X-EOPAttributedMessage: 1
X-MS-Exchange-SkipListedInternetSender: ip=[213.95.148.172];domain=denue6es012.ebgroup.elektrobit.com
X-MS-TrafficTypeDiagnostic: 
	SJ1PEPF00001CE6:EE_|LV4PPF8220EFDCE:EE_|BY1PEPF0001AE18:EE_|EA2PR08MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 96eb9943-a6d2-4768-828b-08df14c28325
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|82310400026|23010399003|30052699003|1800799024|36860700016|6133799003|13003099007|22082099003|18002099003|10086099003|3023799007|56012099006|11063799006|5063699009|10067099003;
X-Microsoft-Antispam-Message-Info-Original: Xt3Zwol2kjIaRvk7x/pdxUv/wT3vGjToQVe7NaXRRN38n6m1H93HhjUOrVTr5J5wjOeEE0WjfndLUQ/NII0RQMkFlWkuYYthPqM7KEhhCzR5TLno98g3aOIhSLs0E0du8QmTu9kQiTK7iC/27J5ihVoEpK2bDiiVGIdapZGj8BpY/hD1/ZiIxHl5CQDH7fAgGt7PSbEUpIJXr0zdgCy8k68yJ/WRETASePuBL7zDl1opK+llpXZDhXfPQzfr7ovG0n3EaxOJFIaXbM7f9fbKeph/Fr2/WIk18olsWjQdzgdRYyO7kX/WXgarEA7IKD2cJHrA7VS50N3zD3SUBuxrTdygBQkUIw4ZRlkNQUwAWDxc4gxg1e7YIrimryOFks4pLIaQx1Pe6eX8LpUoJvt6LqYJISJ0wmnL4Z27LVnXCdGSVhwomLnXZzIlWTPyKEXSdTE1m10HfU3Y9u6ALK5t51xXG24uhwOZhzlW8tRckbMKHRZ2OC66wk6UxFhWDJf4zrHCWIhCSa0xvWiRXE8GadWd9vq39oiXx4+MK7s8FQzxx4MOM2mlcWk+o1YqlYa1a9cVqXBt9wHJolVx8tLdprzE29mVm1qOKkViD1l5aPA4QowIP/gwuH7T8NWNFh7ZhE5vPn2ypuy3hSGVGm9cHK3xKM4KZ0byRWI4ObSmFAN8IdSkuEyGsKI53iKMBkj91RcQDoeM3yKV/qkAeoBt0dAZak9Z5vCkTmpn4Z9VQzi7oM4BPatcIwHNK/8FUcrxTEijOFFDPbS+5y+hXMCqeaxIWq+lK5PeW0clsgC7n9jX5rdPoJGhK25yriY6zgWOkOJFy+uFQaVqp+MijhZe6y2PGXOrmkYT1uXIbRqJ/XhJVtHfsvVwzswCK025X34w
X-Forefront-Antispam-Report-Untrusted: CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es012.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(30052699003)(1800799024)(36860700016)(6133799003)(13003099007)(22082099003)(18002099003)(10086099003)(3023799007)(56012099006)(11063799006)(5063699009)(10067099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: FwKtDeDL0eZCs11QqpY3k+z1kejHMUJiXipDnU/BMAQiVlLOzIg8fKcFstVcLTC/AJIf49RUiSp0h3ToHV4wlnjQNVr5b45lfT99CnJLNvVr77imTBFbHzFJzp4gLpXMas+6bVbDgwL21asdaGRk923EIOJ69/2L3zCVidSEBVSboYEf/keergJvWFhNAQphIM9SWo8UkF4DuOmk6uUxA2Wt/zt56/oCzjLS9BzVs38ABs6BKfrYpT8iNB4oNabVLzSgn1kKVcfXTZFtc/x/wD5v/RL7bKkAqURMOoRnvUekdC6Cnagd8d5IU/qqZdRePLOLSR17QuC5IdWKGvtrgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPF8220EFDCE
X-MS-Exchange-SkipListedInternetSender: ip=[40.93.14.97];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender: ip=[40.93.14.97];domain=SN1PR07CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	da56a4e5-029f-4536-8ee4-08df14c27d50
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|82310400026|14060799003|156008|36860700016|1800799024|35042699022|18002099003|13003099007|5063699009|3023799007|6133799003|10067099003|56012099006|11063799006|22082099003|10086099003;
X-Microsoft-Antispam-Message-Info: 
	aV2PKAFdnqfmtyZGV+0cM4z9CUXNYT6paaQ0mHDsi4lwe/68lVTzMl422fgMWfcQvTH3tG8MEy3va9XHSGbu3eoz1Nb3UaDHWpuTPGMw0iW5HZKPHsfRNjSzbhOO9W74IoJZMzkwHAszTI6s0bhUQ2jUAZRAgTocUKohV6MHBSuelOSfuqkdr7UAf3MD5IJkVjPk8yYQzJQzejczgkeehK1o3BKEOlO5w3hXeWbu16v6msJnuXvuVqhHpeYYAC/lgtz8ZYt35ZiSbrt0ZjjHj68cAATpeefkxPcQyQ5pvR+CUZBZ1WQjfw3cEclTBWpJpgPPriHxako3bv4MNV3OQVVVULVRrXu/PENtG0UeBaifLlZVNMhK0JU9UOpzAV2NHG266GuaBUWnRwYbtApgR8lBVUjbkPybp3J7saerkOSVdXn4fv2QhbF7rSEynbw6s3S3TQGUMpbyk2aG6i/pJsYgjl1IQi1KnqeLlUyYr3oSxEByR8eikGdpCb8PZkPPoxqha+w8b06fyWBbCrE7Xu22ZLzdML8MT7EW8vy18wkTajHTooJajpd5h4HCidtU6tsBfBLpqJ3ur6EeHw/guQrw2YsgObUzvUz2JjOqWVT3zSC5nOY9uDlxi9f9KyWliHEIeEJlgT4dsJWAkPsXBGH0HOrnumdccMKhQGPlfYbAljdpZumEWSIyLwL0EVHv6dH61fMzqqX2k8Nei3ft2zvilVo20tZhmOmL40RNW+M3nYwGin9/3XG0z2dOaZM8sOUVN0gWEy0oJ0gWdVQD0vZ+eUZ55vVZ+g3clEdk/rMgQ7aTXIWbh5P326Rz/qqb5h1QyOoZ9wLqmZt2jqj251E6ffyqP5IrA3IC4dv+QQaaJpdMnydQUzVux2oXGLSC
X-Forefront-Antispam-Report: 
	CIP:4.79.107.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07CU001.outbound.protection.outlook.com;PTR:mail-sn1pr07cu00101.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(14060799003)(156008)(36860700016)(1800799024)(35042699022)(18002099003)(13003099007)(5063699009)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(10086099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	O+ouNrcmTaDirUGCIb3rjcxaRAVyO9yj21tjALkj9GVYDdyxJDhXAhesn76D+2XJ6i9oFTko1L8XNsWeugMXuhZjk6JmjonfGpp3gMrpQnvDokmlqCJP7IPq1Rii3rLXMCJgBCcBkGPAgYfTxYc3yw250h1tmmmQPqycNtvQIhI2+Xg36W4oSHiVqd17pb9A8WEBgMhXuCLPuE5b5sc/ukpUnBak/995Yo920TC7KPPijBZfTv1g3MLKQq5WqYOu5aMr9KZsWv0j8SL6Npeb4hpuT5QUza4Gz/QULdsaqo0xnmj0vG2i4dsvN8i1gsYIHuHGXoCASspcyDjLu8siQugdjQv6OS6gU0pRQm9cHj6/+KYqNjf+Z4wZG0+EbmlDhxG1Gf4rbuI0ByPmubniLwbyaIQYVIdS550L1gjBFyFbNvC9gfdcBHaq2dIrikq/
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 13:49:36.3729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96eb9943-a6d2-4768-828b-08df14c28325
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.244];Helo=[usbth1es004.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR08MB9712
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Sep 2026 13:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10084

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

Signed-off-by: Kaloyan Rusev <kaloyan.rusev@elektrobit.com>
---

Hi Bruce,

the 'Signed-off-by' is now in. Again, sorry about that, I must have missed =
the -s and did not see it in the patch.

Also here I took the chance and directly went to v1.0.4.

I understand that this is an exception and I really appreciate it.
Thanks you very much for that!

Best regards,
Kaloyan

 recipes-containers/ankaios/ankaios-crates.inc | 700 ++++++++++++++++++
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
 15 files changed, 1364 insertions(+)
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
index 00000000..e6f486f2
--- /dev/null
+++ b/recipes-containers/ankaios/ankaios-crates.inc
@@ -0,0 +1,700 @@
+# Autogenerated with 'bitbake -c update_crates ankaios'
+
+# from Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/ahash/0.8.12 \
+    crate://crates.io/aho-corasick/1.1.5 \
+    crate://crates.io/allocator-api2/0.2.21 \
+    crate://crates.io/android_system_properties/0.1.6 \
+    crate://crates.io/anstream/1.0.0 \
+    crate://crates.io/anstyle/1.0.14 \
+    crate://crates.io/anstyle-parse/1.0.0 \
+    crate://crates.io/anstyle-query/1.1.5 \
+    crate://crates.io/anstyle-wincon/3.0.11 \
+    crate://crates.io/anyhow/1.0.104 \
+    crate://crates.io/asn1-rs/0.7.2 \
+    crate://crates.io/asn1-rs-derive/0.6.0 \
+    crate://crates.io/asn1-rs-impl/0.2.0 \
+    crate://crates.io/async-trait/0.1.92 \
+    crate://crates.io/atomic-waker/1.1.2 \
+    crate://crates.io/autocfg/1.5.1 \
+    crate://crates.io/axum/0.8.9 \
+    crate://crates.io/axum-core/0.5.6 \
+    crate://crates.io/base64/0.22.1 \
+    crate://crates.io/bit-set/0.8.0 \
+    crate://crates.io/bit-vec/0.8.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.13.2 \
+    crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/borrow-or-share/0.2.4 \
+    crate://crates.io/bumpalo/3.20.3 \
+    crate://crates.io/bytecount/0.6.9 \
+    crate://crates.io/bytes/1.12.1 \
+    crate://crates.io/cc/1.4.6 \
+    crate://crates.io/cfg-if/1.0.4 \
+    crate://crates.io/cfg_aliases/0.2.2 \
+    crate://crates.io/chacha20/0.10.2 \
+    crate://crates.io/chrono/0.4.45 \
+    crate://crates.io/clap/4.6.7 \
+    crate://crates.io/clap_builder/4.6.7 \
+    crate://crates.io/clap_complete/4.6.11 \
+    crate://crates.io/clap_derive/4.6.7 \
+    crate://crates.io/clap_lex/1.1.1 \
+    crate://crates.io/colorchoice/1.0.5 \
+    crate://crates.io/convert_case/0.10.0 \
+    crate://crates.io/core-foundation-sys/0.8.7 \
+    crate://crates.io/cpufeatures/0.2.17 \
+    crate://crates.io/cpufeatures/0.3.1 \
+    crate://crates.io/crossterm/0.29.0 \
+    crate://crates.io/crossterm_winapi/0.9.1 \
+    crate://crates.io/crypto-common/0.1.7 \
+    crate://crates.io/darling/0.20.11 \
+    crate://crates.io/darling_core/0.20.11 \
+    crate://crates.io/darling_macro/0.20.11 \
+    crate://crates.io/data-encoding/2.11.1 \
+    crate://crates.io/defmt/1.1.1 \
+    crate://crates.io/defmt-macros/1.1.1 \
+    crate://crates.io/defmt-parser/1.0.0 \
+    crate://crates.io/der-parser/10.0.0 \
+    crate://crates.io/deranged/0.5.8 \
+    crate://crates.io/derive_builder/0.20.2 \
+    crate://crates.io/derive_builder_core/0.20.2 \
+    crate://crates.io/derive_builder_macro/0.20.2 \
+    crate://crates.io/derive_more/2.1.1 \
+    crate://crates.io/derive_more-impl/2.1.1 \
+    crate://crates.io/difflib/0.4.0 \
+    crate://crates.io/digest/0.10.7 \
+    crate://crates.io/displaydoc/0.2.7 \
+    crate://crates.io/document-features/0.2.12 \
+    crate://crates.io/downcast/0.11.0 \
+    crate://crates.io/dyn-clone/1.0.20 \
+    crate://crates.io/either/1.18.0 \
+    crate://crates.io/email_address/0.2.9 \
+    crate://crates.io/env/1.0.1 \
+    crate://crates.io/env_filter/2.0.0 \
+    crate://crates.io/env_logger/0.11.11 \
+    crate://crates.io/equivalent/1.0.2 \
+    crate://crates.io/errno/0.3.14 \
+    crate://crates.io/fancy-regex/0.17.0 \
+    crate://crates.io/fastrand/2.5.0 \
+    crate://crates.io/find-msvc-tools/0.1.12 \
+    crate://crates.io/fixedbitset/0.5.7 \
+    crate://crates.io/float-cmp/0.9.0 \
+    crate://crates.io/fluent-uri/0.4.1 \
+    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/foldhash/0.1.5 \
+    crate://crates.io/foldhash/0.2.0 \
+    crate://crates.io/fraction/0.15.4 \
+    crate://crates.io/fragile/2.1.0 \
+    crate://crates.io/futures-channel/0.3.34 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-macro/0.3.34 \
+    crate://crates.io/futures-sink/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
+    crate://crates.io/futures-util/0.3.34 \
+    crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.2.17 \
+    crate://crates.io/getrandom/0.3.4 \
+    crate://crates.io/getrandom/0.4.3 \
+    crate://crates.io/h2/0.4.19 \
+    crate://crates.io/handlebars/6.4.4 \
+    crate://crates.io/hashbrown/0.15.5 \
+    crate://crates.io/hashbrown/0.16.1 \
+    crate://crates.io/hashbrown/0.17.1 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/hex/0.4.3 \
+    crate://crates.io/http/1.5.0 \
+    crate://crates.io/http-body/1.1.0 \
+    crate://crates.io/http-body-util/0.1.5 \
+    crate://crates.io/httparse/1.10.1 \
+    crate://crates.io/httpdate/1.0.3 \
+    crate://crates.io/hyper/1.11.1 \
+    crate://crates.io/hyper-timeout/0.5.2 \
+    crate://crates.io/hyper-util/0.1.20 \
+    crate://crates.io/iana-time-zone/0.1.65 \
+    crate://crates.io/iana-time-zone-haiku/0.1.2 \
+    crate://crates.io/icu_collections/2.3.0 \
+    crate://crates.io/icu_locale_core/2.3.0 \
+    crate://crates.io/icu_normalizer/2.3.0 \
+    crate://crates.io/icu_normalizer_data/2.3.0 \
+    crate://crates.io/icu_properties/2.3.0 \
+    crate://crates.io/icu_properties_data/2.3.0 \
+    crate://crates.io/icu_provider/2.3.1 \
+    crate://crates.io/ident_case/1.0.1 \
+    crate://crates.io/idna/1.1.0 \
+    crate://crates.io/idna_adapter/1.2.2 \
+    crate://crates.io/indexmap/2.14.2 \
+    crate://crates.io/is_executable/1.0.6 \
+    crate://crates.io/is_terminal_polyfill/1.70.2 \
+    crate://crates.io/itertools/0.10.5 \
+    crate://crates.io/itertools/0.14.0 \
+    crate://crates.io/itoa/1.0.18 \
+    crate://crates.io/jiff/0.2.37 \
+    crate://crates.io/jiff-core/0.1.1 \
+    crate://crates.io/jiff-static/0.2.37 \
+    crate://crates.io/js-sys/0.3.105 \
+    crate://crates.io/jsonschema/0.44.1 \
+    crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/linux-raw-sys/0.12.1 \
+    crate://crates.io/litemap/0.8.3 \
+    crate://crates.io/litrs/1.0.0 \
+    crate://crates.io/lock_api/0.4.14 \
+    crate://crates.io/log/0.4.34 \
+    crate://crates.io/matchit/0.8.4 \
+    crate://crates.io/memchr/2.8.3 \
+    crate://crates.io/mime/0.3.17 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/mio/1.2.3 \
+    crate://crates.io/mockall/0.11.4 \
+    crate://crates.io/mockall_derive/0.11.4 \
+    crate://crates.io/mockall_double/0.3.1 \
+    crate://crates.io/multimap/0.10.1 \
+    crate://crates.io/nix/0.31.3 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/normalize-line-endings/0.3.0 \
+    crate://crates.io/ntapi/0.4.3 \
+    crate://crates.io/num/0.4.3 \
+    crate://crates.io/num-bigint/0.4.8 \
+    crate://crates.io/num-cmp/0.1.0 \
+    crate://crates.io/num-complex/0.4.6 \
+    crate://crates.io/num-conv/0.2.2 \
+    crate://crates.io/num-integer/0.1.47 \
+    crate://crates.io/num-iter/0.1.46 \
+    crate://crates.io/num-modular/0.6.5 \
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
+    crate://crates.io/pest/2.9.1 \
+    crate://crates.io/pest_derive/2.9.1 \
+    crate://crates.io/pest_generator/2.9.1 \
+    crate://crates.io/pest_meta/2.9.1 \
+    crate://crates.io/petgraph/0.8.3 \
+    crate://crates.io/pin-project/1.1.13 \
+    crate://crates.io/pin-project-internal/1.1.13 \
+    crate://crates.io/pin-project-lite/0.2.17 \
+    crate://crates.io/portable-atomic/1.15.0 \
+    crate://crates.io/portable-atomic-util/0.2.8 \
+    crate://crates.io/potential_utf/0.1.6 \
+    crate://crates.io/powerfmt/0.2.0 \
+    crate://crates.io/predicates/2.1.5 \
+    crate://crates.io/predicates-core/1.0.10 \
+    crate://crates.io/predicates-tree/1.0.13 \
+    crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro-error-attr2/2.0.0 \
+    crate://crates.io/proc-macro-error2/2.0.1 \
+    crate://crates.io/proc-macro2/1.0.107 \
+    crate://crates.io/prost/0.14.4 \
+    crate://crates.io/prost-build/0.14.4 \
+    crate://crates.io/prost-derive/0.14.4 \
+    crate://crates.io/prost-types/0.14.4 \
+    crate://crates.io/pulldown-cmark/0.13.4 \
+    crate://crates.io/pulldown-cmark-to-cmark/22.0.1 \
+    crate://crates.io/quote/1.0.47 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/r-efi/6.0.0 \
+    crate://crates.io/rand/0.10.2 \
+    crate://crates.io/rand_core/0.10.1 \
+    crate://crates.io/redox_syscall/0.5.18 \
+    crate://crates.io/ref-cast/1.0.27 \
+    crate://crates.io/ref-cast-impl/1.0.27 \
+    crate://crates.io/referencing/0.44.1 \
+    crate://crates.io/regex/1.13.1 \
+    crate://crates.io/regex-automata/0.4.18 \
+    crate://crates.io/regex-syntax/0.8.11 \
+    crate://crates.io/ring/0.17.14 \
+    crate://crates.io/rustc_version/0.4.1 \
+    crate://crates.io/rusticata-macros/4.1.0 \
+    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustls/0.23.45 \
+    crate://crates.io/rustls-pki-types/1.15.1 \
+    crate://crates.io/rustls-webpki/0.103.15 \
+    crate://crates.io/rustversion/1.0.23 \
+    crate://crates.io/ryu/1.0.23 \
+    crate://crates.io/schemars/1.2.2 \
+    crate://crates.io/schemars_derive/1.2.2 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/semver/1.0.28 \
+    crate://crates.io/serde/1.0.229 \
+    crate://crates.io/serde_core/1.0.229 \
+    crate://crates.io/serde_derive/1.0.229 \
+    crate://crates.io/serde_derive_internals/0.30.0 \
+    crate://crates.io/serde_json/1.0.151 \
+    crate://crates.io/serde_spanned/1.1.1 \
+    crate://crates.io/serde_yaml/0.9.34+deprecated \
+    crate://crates.io/sha2/0.10.9 \
+    crate://crates.io/sha256/1.6.0 \
+    crate://crates.io/shlex/2.0.1 \
+    crate://crates.io/signal-hook/0.3.18 \
+    crate://crates.io/signal-hook-mio/0.2.5 \
+    crate://crates.io/signal-hook-registry/1.4.8 \
+    crate://crates.io/slab/0.4.12 \
+    crate://crates.io/smallvec/1.16.1 \
+    crate://crates.io/socket2/0.6.5 \
+    crate://crates.io/stable_deref_trait/1.2.1 \
+    crate://crates.io/strsim/0.11.1 \
+    crate://crates.io/subtle/2.6.1 \
+    crate://crates.io/syn/1.0.109 \
+    crate://crates.io/syn/2.0.119 \
+    crate://crates.io/syn/3.0.5 \
+    crate://crates.io/sync_wrapper/1.0.2 \
+    crate://crates.io/synstructure/0.13.2 \
+    crate://crates.io/synstructure/0.14.0 \
+    crate://crates.io/sysinfo/0.38.4 \
+    crate://crates.io/tabled/0.17.0 \
+    crate://crates.io/tabled_derive/0.9.0 \
+    crate://crates.io/tempfile/3.27.0 \
+    crate://crates.io/termtree/0.5.1 \
+    crate://crates.io/thiserror/1.0.69 \
+    crate://crates.io/thiserror/2.0.20 \
+    crate://crates.io/thiserror-impl/1.0.69 \
+    crate://crates.io/thiserror-impl/2.0.20 \
+    crate://crates.io/time/0.3.55 \
+    crate://crates.io/time-core/0.1.9 \
+    crate://crates.io/time-macros/0.2.32 \
+    crate://crates.io/tinystr/0.8.4 \
+    crate://crates.io/tokio/1.53.1 \
+    crate://crates.io/tokio-macros/2.7.2 \
+    crate://crates.io/tokio-rustls/0.26.5 \
+    crate://crates.io/tokio-stream/0.1.19 \
+    crate://crates.io/tokio-util/0.7.19 \
+    crate://crates.io/toml/0.9.12+spec-1.1.0 \
+    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.1.2+spec-1.1.0 \
+    crate://crates.io/tonic/0.14.6 \
+    crate://crates.io/tonic-build/0.14.6 \
+    crate://crates.io/tonic-prost/0.14.6 \
+    crate://crates.io/tonic-prost-build/0.14.6 \
+    crate://crates.io/tower/0.5.3 \
+    crate://crates.io/tower-layer/0.3.3 \
+    crate://crates.io/tower-service/0.3.3 \
+    crate://crates.io/tracing/0.1.44 \
+    crate://crates.io/tracing-attributes/0.1.31 \
+    crate://crates.io/tracing-core/0.1.36 \
+    crate://crates.io/try-lock/0.2.5 \
+    crate://crates.io/typenum/1.20.1 \
+    crate://crates.io/ucd-trie/0.1.7 \
+    crate://crates.io/umask/2.1.0 \
+    crate://crates.io/unicase/2.9.0 \
+    crate://crates.io/unicode-general-category/1.1.0 \
+    crate://crates.io/unicode-ident/1.0.24 \
+    crate://crates.io/unicode-segmentation/1.13.3 \
+    crate://crates.io/unicode-width/0.2.2 \
+    crate://crates.io/unsafe-libyaml/0.2.11 \
+    crate://crates.io/untrusted/0.9.0 \
+    crate://crates.io/utf8_iter/1.0.4 \
+    crate://crates.io/utf8parse/0.2.2 \
+    crate://crates.io/uuid/1.26.1 \
+    crate://crates.io/uuid-simd/0.8.0 \
+    crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/vsimd/0.8.0 \
+    crate://crates.io/want/0.3.1 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
+    crate://crates.io/wasm-bindgen/0.2.128 \
+    crate://crates.io/wasm-bindgen-macro/0.2.128 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.128 \
+    crate://crates.io/wasm-bindgen-shared/0.2.128 \
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
+    crate://crates.io/windows-sys/0.61.2 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-threading/0.2.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/winnow/0.7.15 \
+    crate://crates.io/winnow/1.0.4 \
+    crate://crates.io/wit-bindgen/0.57.1 \
+    crate://crates.io/writeable/0.6.4 \
+    crate://crates.io/x509-parser/0.18.1 \
+    crate://crates.io/yoke/0.8.3 \
+    crate://crates.io/yoke-derive/0.8.3 \
+    crate://crates.io/zerocopy/0.8.57 \
+    crate://crates.io/zerocopy-derive/0.8.57 \
+    crate://crates.io/zerofrom/0.1.8 \
+    crate://crates.io/zerofrom-derive/0.1.8 \
+    crate://crates.io/zeroize/1.9.0 \
+    crate://crates.io/zerotrie/0.2.5 \
+    crate://crates.io/zerovec/0.11.8 \
+    crate://crates.io/zerovec-derive/0.11.6 \
+    crate://crates.io/zmij/1.0.23 \
+"
+
+SRC_URI[ahash-0.8.12.sha256sum] =3D "5a15f179cd60c4584b8a8c596927aadc462e2=
7f2ca70c04e0071964a73ba7a75"
+SRC_URI[aho-corasick-1.1.5.sha256sum] =3D "c982642fa9e8606056828ee9a850573=
7230110bb1099153c79efe865c59d12ba"
+SRC_URI[allocator-api2-0.2.21.sha256sum] =3D "683d7910e743518b0e34f1186f92=
494becacb047c7b6bf616c96772180fef923"
+SRC_URI[android_system_properties-0.1.6.sha256sum] =3D "ae221649c9976a6f6c=
56ae1facf410f3ddb33cc661c4b7b61020a912d4237fbc"
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
+SRC_URI[anyhow-1.0.104.sha256sum] =3D "330a5ed07fa54e4702c9d6c4174f74427fc=
0ef6e214bbd677ae50a5099946470"
+SRC_URI[asn1-rs-0.7.2.sha256sum] =3D "b7f43a50ac4fdca5df8e885c21b835997f0a=
1cdee65494a6847694a98652d9d8"
+SRC_URI[asn1-rs-derive-0.6.0.sha256sum] =3D "3109e49b1e4909e9db6515a30c633=
684d68cdeaa252f215214cb4fa1a5bfee2c"
+SRC_URI[asn1-rs-impl-0.2.0.sha256sum] =3D "7b18050c2cd6fe86c3a76584ef5e0ba=
f286d038cda203eb6223df2cc413565f7"
+SRC_URI[async-trait-0.1.92.sha256sum] =3D "82f6aeea286b8eb4dd3431a1be1b59d=
290ace00f5bfd8e2a159bc2a05e2c1667"
+SRC_URI[atomic-waker-1.1.2.sha256sum] =3D "1505bd5d3d116872e7271a6d4e16d81=
d0c8570876c8de68093a09ac269d8aac0"
+SRC_URI[autocfg-1.5.1.sha256sum] =3D "f2032f911046de80f0a198e0901378627c33=
f59ea0ac00e363d481118bd70a53"
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
+SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf595c=
92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.13.2.sha256sum] =3D "3ded4057c258ba199e2d26386d3af37809=
57ecaee6c4ef4041c6b4b8b97c0b06"
+SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa394996=
acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[borrow-or-share-0.2.4.sha256sum] =3D "dc0b364ead1874514c8c2855ab55=
8056ebfeb775653e7ae45ff72f28f8f3166c"
+SRC_URI[bumpalo-3.20.3.sha256sum] =3D "72f5acc6cb2ba439de613abc23857ec3d78=
374d8ed5ac84e9d11336e87da8649"
+SRC_URI[bytecount-0.6.9.sha256sum] =3D "175812e0be2bccb6abe50bb8d566126198=
344f707e304f45c648fd8f2cc0365e"
+SRC_URI[bytes-1.12.1.sha256sum] =3D "fc652a48c352aef3ea3aed32080501cf3ef6e=
d5da78602a020c991775b0aff04"
+SRC_URI[cc-1.4.6.sha256sum] =3D "a3eb0f42d6c360dc3f8a821f6bf2fdea7f72bfd36=
b3076eb0e6d1e9e0752fff4"
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef3511182572=
7b38d33286ef986142615121801"
+SRC_URI[cfg_aliases-0.2.2.sha256sum] =3D "f079e83a288787bcd14a6aea84cee5c8=
7a67c5a3e660c30f557a3d24761b3527"
+SRC_URI[chacha20-0.10.2.sha256sum] =3D "65c35e4b699c7e15ccbe7ee35c005e4fc0=
a278d22238a2857e6ce2dadeda1b06"
+SRC_URI[chrono-0.4.45.sha256sum] =3D "1aa79e62e7697b8e29b513a68abacf485adc=
d1fe8284a4316c5ae868e6633327"
+SRC_URI[clap-4.6.7.sha256sum] =3D "aa8876b300ab35ba921adea3dfd70157a46249b=
33f95c9084ae5709785478946"
+SRC_URI[clap_builder-4.6.7.sha256sum] =3D "ec0797fb7aeb1406c84efac526901f7=
ec3ead2124f946b494e72879d4b54704d"
+SRC_URI[clap_complete-4.6.11.sha256sum] =3D "037e2a1a92236d0aff7e845093f64=
661d6df4c02c9fcc61a60e9e1d736fa392f"
+SRC_URI[clap_derive-4.6.7.sha256sum] =3D "f9c751b79415d4e559e3d1fcf128e09e=
720eb673a06d26cf6f392d37d75b66e0"
+SRC_URI[clap_lex-1.1.1.sha256sum] =3D "1c133bc6a41be0d194c306b5506d15e6fee=
ea7b1d6604bd3f8310dfb2ca96486"
+SRC_URI[colorchoice-1.0.5.sha256sum] =3D "1d07550c9036bf2ae0c684c4297d503f=
838287c83c53686d05370d0e139ae570"
+SRC_URI[convert_case-0.10.0.sha256sum] =3D "633458d4ef8c78b72454de2d54fd6a=
b2e60f9e02be22f3c6104cdc8a4e0fceb9"
+SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D "773648b94d0e5d620f64f280=
777445740e61fe701025087ec8b57f45c791888b"
+SRC_URI[cpufeatures-0.2.17.sha256sum] =3D "59ed5838eebb26a2bb2e58f6d5b5316=
989ae9d08bab10e0e6d103e656d1b0280"
+SRC_URI[cpufeatures-0.3.1.sha256sum] =3D "5ca28b0ae3115b884660db4118d80379=
1fd6756b6e88f39c0f3f7859060d7566"
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
+SRC_URI[data-encoding-2.11.1.sha256sum] =3D "4583a4551df46e2792f82ceeac45e=
850d2e2d5debba0b91f102385cda5b11f06"
+SRC_URI[defmt-1.1.1.sha256sum] =3D "e2953bfe4f93bbd20cc71198842756f77d1618=
84c99ebbabc41d80231ded88d1"
+SRC_URI[defmt-macros-1.1.1.sha256sum] =3D "bad9c72e7ca2137e0dc3813245a0d28=
2fd6daad32fd800af018306a9169b5fe8"
+SRC_URI[defmt-parser-1.0.0.sha256sum] =3D "10d60334b3b2e7c9d91ef8150abfb6f=
a4c1c39ebbcf4a81c2e346aad939fee3e"
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
+SRC_URI[displaydoc-0.2.7.sha256sum] =3D "c6232dd377dcc64799954cbd3a9bb882e=
9cdc1308ccd87b1c098f1fb2eaf82a8"
+SRC_URI[document-features-0.2.12.sha256sum] =3D "d4b8a88685455ed29a21542a3=
3abd9cb6510b6b129abadabdcef0f4c55bc8f61"
+SRC_URI[downcast-0.11.0.sha256sum] =3D "1435fa1053d8b2fbbe9be7e97eca7f33d3=
7b28409959813daefc1446a14247f1"
+SRC_URI[dyn-clone-1.0.20.sha256sum] =3D "d0881ea181b1df73ff77ffaaf9c7544ec=
c11e82fba9b5f27b262a3c73a332555"
+SRC_URI[either-1.18.0.sha256sum] =3D "252afb9ae5eaa683babdc6a068b3f5726eb1=
9e05070c731f9b2a23a7c3e8ed34"
+SRC_URI[email_address-0.2.9.sha256sum] =3D "e079f19b08ca6239f47f8ba8509c11=
cf3ea30095831f7fed61441475edd8c449"
+SRC_URI[env-1.0.1.sha256sum] =3D "bc95de49ad098572c02d3fbf368c9a020bfff5ae=
78483685b77f51d8a7e9486d"
+SRC_URI[env_filter-2.0.0.sha256sum] =3D "900d271a03799a1ee8d1ca9b19893b48c=
a674a9284fefcfb85f05e74ed314217"
+SRC_URI[env_logger-0.11.11.sha256sum] =3D "de671bd27a75a797dc9ae289ba1e772=
76e75e2026408aab65185384e2d5cd3f6"
+SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c02=
9f1d0619886d18145fea96c3ffe5c0f"
+SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f866391735b5=
1691dbda63cf6f96d042b63efeb"
+SRC_URI[fancy-regex-0.17.0.sha256sum] =3D "72cf461f865c862bb7dc573f643dd6a=
2b6842f7c30b07882b56bd148cc2761b8"
+SRC_URI[fastrand-2.5.0.sha256sum] =3D "da7c62ceae207dd37ea5b845da6a0696c79=
9f85e97da1ab5b7910be3c1c80223"
+SRC_URI[find-msvc-tools-0.1.12.sha256sum] =3D "3e0f1c7c3a72c66fd80abe96517=
5f7523475c0489a87d3ff9d6e8c87d87a9d2d"
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
+SRC_URI[futures-channel-0.3.34.sha256sum] =3D "b1f9e3d69d39e4862ffed03ed07=
1a76f9a13ba1d9109d355b0f0aa6b15e393c4"
+SRC_URI[futures-core-0.3.34.sha256sum] =3D "92d699e522242e69e3003b94ecc1f9=
60f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-macro-0.3.34.sha256sum] =3D "9fb9654ba8355388abeb8dcb4fc62=
f511300867002afc858860463bdd9fe0c44"
+SRC_URI[futures-sink-0.3.34.sha256sum] =3D "1944426bf7d03f1d14f708785e4b33=
efd750b36d48a157b836b3efc15ede8e1d"
+SRC_URI[futures-task-0.3.34.sha256sum] =3D "cd417de3d1d015fc3bfd2b1ea46dfc=
7bab72ef86f1cc7cc9c78e728b34a6d1fd"
+SRC_URI[futures-util-0.3.34.sha256sum] =3D "0d50a92467f8ba5dd6e3ee5d4bd04d=
73ab2e4e1c44474a0674821dfce14b79bc"
+SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51fd72272d7821adaf274a=
d91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.2.17.sha256sum] =3D "ff2abc00be7fca6ebc474524697ae276a=
d847ad0a6b3faa4bcb027e9a4614ad0"
+SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120ecec1=
38e4d395b459e5ca34f9cce2dd77fd"
+SRC_URI[getrandom-0.4.3.sha256sum] =3D "300e883d756b2e4ec94e02791f39b04b52=
2276138852cfc41d9fb7e904106099"
+SRC_URI[h2-0.4.19.sha256sum] =3D "ef8e5e5a340588f4452631496976cf8636d4a7ec=
f600239fdc27615d2530bc16"
+SRC_URI[handlebars-6.4.4.sha256sum] =3D "75c54236f9045c8004a77942bebc52145=
b4844639db934a5c70fe08617fbe61a"
+SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461bd930=
01ea1ef889cd5529dd176593f5338a1"
+SRC_URI[hashbrown-0.16.1.sha256sum] =3D "841d1cc9bed7f9236f321df977030373f=
4a4163ae1a7dbfe1a51a2c1a51d9100"
+SRC_URI[hashbrown-0.17.1.sha256sum] =3D "ed5909b6e89a2db4456e54cd5f673791d=
7eca6732202bbf2a9cc504fe2f9b84a"
+SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440a1=
9336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
+SRC_URI[hex-0.4.3.sha256sum] =3D "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e48=
6a595ed5fd8f86ba55232a70"
+SRC_URI[http-1.5.0.sha256sum] =3D "918d3568bebf352712bc2ef3d46a8bcf1a75b37=
3be6539de198e9105cbbf9ce0"
+SRC_URI[http-body-1.1.0.sha256sum] =3D "ca2a8f2913ee65f60facd6a5905613afaa=
448497a0230cc41ce022d93290bc2c"
+SRC_URI[http-body-util-0.1.5.sha256sum] =3D "23169fe34a5fbcdd3f3862e78fb9b=
6fccd5f02a6dc6f732547005d45631ce71c"
+SRC_URI[httparse-1.10.1.sha256sum] =3D "6dbf3de79e51f3d586ab4cb9d5c3e2c14a=
a28ed23d180cf89b4df0454a69cc87"
+SRC_URI[httpdate-1.0.3.sha256sum] =3D "df3b46402a9d5adb4c86a0cf463f42e1999=
4e3ee891101b1841f30a545cb49a9"
+SRC_URI[hyper-1.11.1.sha256sum] =3D "27b501faa50e7a26c3d3560ca625132f4078a=
17771f4810baf70475ae48cbe43"
+SRC_URI[hyper-timeout-0.5.2.sha256sum] =3D "2b90d566bffbce6a75bd8b09a05aa8=
c2cb1fabb6cb348f8840c9e4c90a0d83b0"
+SRC_URI[hyper-util-0.1.20.sha256sum] =3D "96547c2556ec9d12fb1578c4eaf448b0=
4993e7fb79cbaad930a656880a6bdfa0"
+SRC_URI[iana-time-zone-0.1.65.sha256sum] =3D "e31bc9ad994ba00e440a8aa5c9ef=
0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
+SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590ba=
56d5d2d085f558508192593743f16b2306495269f"
+SRC_URI[icu_collections-2.3.0.sha256sum] =3D "fa68d21081c4a05d5a901a1c62ad=
d574c77048b6a1c67be3b50ce0b60d4ca513"
+SRC_URI[icu_locale_core-2.3.0.sha256sum] =3D "d56e28588da92eee5c3201a6eff3=
3fabdd49b62269c8938d4ff050ce4d900deb"
+SRC_URI[icu_normalizer-2.3.0.sha256sum] =3D "12f9cf5f235641ed274641dd81c3f=
28d870e276763d0797aeeab72317b1c646f"
+SRC_URI[icu_normalizer_data-2.3.0.sha256sum] =3D "1563da1ed3e0b3bf3d74c9b8=
5917ac9c56464d2f57242270c09c9e752f8021a0"
+SRC_URI[icu_properties-2.3.0.sha256sum] =3D "7e7ca276ad3145661a65914e6daf1=
31ca5120cd3dcee8f8f3214b8875184a148"
+SRC_URI[icu_properties_data-2.3.0.sha256sum] =3D "e590f038c1464a96894fd6d1=
0127e90a8be4509f56ff7ecef851b15cee0b7caa"
+SRC_URI[icu_provider-2.3.1.sha256sum] =3D "d27bbb9d3abbefac45d55f647c9de1d=
44aafcd1186eb91879afef17c396c3e73"
+SRC_URI[ident_case-1.0.1.sha256sum] =3D "b9e0384b61958566e926dc50660321d12=
159025e767c18e043daf26b70104c39"
+SRC_URI[idna-1.1.0.sha256sum] =3D "3b0875f23caa03898994f6ddc501886a45c7d3d=
62d04d2d90788d47be1b1e4de"
+SRC_URI[idna_adapter-1.2.2.sha256sum] =3D "cb68373c0d6620ef8105e855e7745e1=
8b0d00d3bdb07fb532e434244cdb9a714"
+SRC_URI[indexmap-2.14.2.sha256sum] =3D "cc4e190f5d26ca7051642629da2c52fc03=
bde85a03197c99408dcd291734c855"
+SRC_URI[is_executable-1.0.6.sha256sum] =3D "82cb6a9f675da968c63b6208c641b9=
dca58fc0133ae53375736b1767b0cab8bd"
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1bd460=
005623e142ef0181e3d0219cb493e02f7d08a35695"
+SRC_URI[itertools-0.10.5.sha256sum] =3D "b0fd2260e829bddf4cb6ea802289de2f8=
6d6a7a690192fbe91b3f46e0f2c8473"
+SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488aa=
bdbf3d2da73885b31bd0abd03351285"
+SRC_URI[itoa-1.0.18.sha256sum] =3D "8f42a60cbdf9a97f5d2305f08a87dc4e09308d=
1276d28c869c684d7777685682"
+SRC_URI[jiff-0.2.37.sha256sum] =3D "0ab1baf72f08796de0260609515130699b890a=
c25f30e610ad894bc5856cafdb"
+SRC_URI[jiff-core-0.1.1.sha256sum] =3D "5e52fe76043ccecc9005d2305ebaadf7d7=
fc0cc89ca6baa10a94d6bc68c7128c"
+SRC_URI[jiff-static-0.2.37.sha256sum] =3D "378268a1116ad67ae6228701118ac9f=
491d78fda38a40a1f1a9e1348de6f7212"
+SRC_URI[js-sys-0.3.105.sha256sum] =3D "ce57d20d1ea864ce2ac172ab472d409214f=
4fd359f0b2a2775abdf522e2af99e"
+SRC_URI[jsonschema-0.44.1.sha256sum] =3D "f98b64a413c93a1b413dfbaf973b78d2=
71648b9cae50b10302ad88af78991672"
+SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f359=
1312473c50c6685e1f298068316e66fe"
+SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc=
6d17f656fb07896ee72867612f2"
+SRC_URI[linux-raw-sys-0.12.1.sha256sum] =3D "32a66949e030da00e8c7d4434b251=
670a91556f4144941d37452769c25d58a53"
+SRC_URI[litemap-0.8.3.sha256sum] =3D "47d9d19d1d6efa0109d2f65ff4c85cddd50b=
d572e5a00127ab10987290bcefae"
+SRC_URI[litrs-1.0.0.sha256sum] =3D "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9=
db1621bafc7ed66e35ff9fe092"
+SRC_URI[lock_api-0.4.14.sha256sum] =3D "224399e74b87b5f3557511d98dff8b1408=
9b3dadafcab6bb93eab67d3aace965"
+SRC_URI[log-0.4.34.sha256sum] =3D "f9f8bd3e56ce4dfc153cf470fffbfa98c762095=
8b312ca5c3a4b8d5181fd13c6"
+SRC_URI[matchit-0.8.4.sha256sum] =3D "47e1ffaa40ddd1f3ed91f717a33c8c0ee23f=
ff369e3aa8772b9605cc1d22f4c3"
+SRC_URI[memchr-2.8.3.sha256sum] =3D "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4=
beb022d3b367256b91b87513d98"
+SRC_URI[mime-0.3.17.sha256sum] =3D "6877bb514081ee2a7ff5ef9de3281f14a4dd4b=
ceac4c09388074a6b5df8a139a"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05ef=
a59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[mio-1.2.3.sha256sum] =3D "4b18443e9c262bfe8fa82f51666e2642c53393f7=
e5c27b3e1aeab922cff5b9d8"
+SRC_URI[mockall-0.11.4.sha256sum] =3D "4c84490118f2ee2d74570d114f3d0493cbf=
02790df303d2707606c3e14e07c96"
+SRC_URI[mockall_derive-0.11.4.sha256sum] =3D "22ce75669015c4f47b289fd4d4f5=
6e894e4c96003ffdf3ac51313126f94c6cbb"
+SRC_URI[mockall_double-0.3.1.sha256sum] =3D "f1ca96e5ac35256ae3e13536edd39=
b172b88f41615e1d7b653c8ad24524113e8"
+SRC_URI[multimap-0.10.1.sha256sum] =3D "1d87ecb2933e8aeadb3e3a02b828fed80a=
7528047e68b4f424523a0981a3a084"
+SRC_URI[nix-0.31.3.sha256sum] =3D "cf20d2fde8ff38632c426f1165ed7436270b44f=
199fc55284c38276f9db47c3d"
+SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c8172=
b73826411a55751e404a0a4a"
+SRC_URI[normalize-line-endings-0.3.0.sha256sum] =3D "61807f77802ff30975e01=
f4f071c8ba10c022052f98b3294119f3e615d13e5be"
+SRC_URI[ntapi-0.4.3.sha256sum] =3D "c3b335231dfd352ffb0f8017f3b6027a4917f7=
df785ea2143d8af2adc66980ae"
+SRC_URI[num-0.4.3.sha256sum] =3D "35bd024e8b2ff75562e5f34e7f4905839deb4b22=
955ef5e73d2fea1b9813cb23"
+SRC_URI[num-bigint-0.4.8.sha256sum] =3D "c89e69e7e0f03bea5ef08013795c25018=
e101932225a656383bd384495ecc367"
+SRC_URI[num-cmp-0.1.0.sha256sum] =3D "63335b2e2c34fae2fb0aa2cecfd9f0832a1e=
24b3b32ecec612c3426d46dc8aaa"
+SRC_URI[num-complex-0.4.6.sha256sum] =3D "73f88a1307638156682bada9d7604135=
552957b7818057dcef22705b4d509495"
+SRC_URI[num-conv-0.2.2.sha256sum] =3D "521739c6d2bac4aa25192232afe68412313=
76b2b26d4d9fae5ecf8ca5772e441"
+SRC_URI[num-integer-0.1.47.sha256sum] =3D "7ce2d95d4b3734dc35aa2f45e1aa22c=
d416814592a4f9d9205e11affd5b8e10b"
+SRC_URI[num-iter-0.1.46.sha256sum] =3D "c92800bd69a1eac91786bcfe9da64a897e=
b72911b8dc3095decbd07429e8048b"
+SRC_URI[num-modular-0.6.5.sha256sum] =3D "bd8e500409e6cd603b03e477c26a6cae=
cdc27ac58979a53e881c75eafc079f44"
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
+SRC_URI[pest-2.9.1.sha256sum] =3D "6d45aeb61b4bf818e12d4205f2466f8c4748f85=
f4fce0146d1c03d69d753f0ad"
+SRC_URI[pest_derive-2.9.1.sha256sum] =3D "89cc5a242e25ed4e7704d0be240f2cfb=
e20a8c27e7e252d94835be93d92dc39f"
+SRC_URI[pest_generator-2.9.1.sha256sum] =3D "7abf21475cc3820fe4b2ca2dc2142=
902f67a02189f3b5b3a229f4febc01a43e5"
+SRC_URI[pest_meta-2.9.1.sha256sum] =3D "adba4db388f687393c18c51348d44a41d8=
70ca9df71a2c98172ea3035dc6936e"
+SRC_URI[petgraph-0.8.3.sha256sum] =3D "8701b58ea97060d5e5b155d383a69952a60=
943f0e6dfe30b04c287beb0b27455"
+SRC_URI[pin-project-1.1.13.sha256sum] =3D "2466b2336ed02bcdca6b294417127b9=
0ec92038d1d5c4fbeac971a922e0e0924"
+SRC_URI[pin-project-internal-1.1.13.sha256sum] =3D "c96395f0a926bc13b1c176=
22aaddda1ecb55d49c8f1bf9777e4d877800a43f8b"
+SRC_URI[pin-project-lite-0.2.17.sha256sum] =3D "a89322df9ebe1c1578d689c923=
18e070967d1042b512afbe49518723f4e6d5cd"
+SRC_URI[portable-atomic-1.15.0.sha256sum] =3D "05c8b63e8d9609db387f0324918=
f81d68fe27748f084ef092fb35954d0539a85"
+SRC_URI[portable-atomic-util-0.2.8.sha256sum] =3D "10ab3eb7f3becc3a1cbc4f2=
c6f20267996cfc1a6467a873763411b136a122715"
+SRC_URI[potential_utf-0.1.6.sha256sum] =3D "d83eb9bc6d8e5cf568e7a1101d60ee=
05e81ed50ea106026f3d18deeb046d7661"
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
+SRC_URI[proc-macro2-1.0.107.sha256sum] =3D "985e7ec9bb745e6ce6535b544d84d6=
cd6f7ad8bd711c398938ae983b91a766d9"
+SRC_URI[prost-0.14.4.sha256sum] =3D "528ac67416ff8646872a3c02cad9cc4ee5dc9=
f9540c9b10771855c95cb2e5ae1"
+SRC_URI[prost-build-0.14.4.sha256sum] =3D "03da047801ff44bb6a4d407d4860c05=
fd70bb81714e6b2f3812603d5b145b042"
+SRC_URI[prost-derive-0.14.4.sha256sum] =3D "b570b25f7617e43d59005d0990ccb7=
9e950a423952cea19671b7a876da390adf"
+SRC_URI[prost-types-0.14.4.sha256sum] =3D "f94967dc7688f3054c7fac87473ffae=
4cc4c3904800e2d9f5b857246d8963b0a"
+SRC_URI[pulldown-cmark-0.13.4.sha256sum] =3D "e9f068eba8e7071c5f9511831b44=
f32c740d5adf574e990f946ddb53db2f314e"
+SRC_URI[pulldown-cmark-to-cmark-22.0.1.sha256sum] =3D "ab1ad36992cead65f02=
aa399a373a42730922f1525d988172634fdefdecb8a60"
+SRC_URI[quote-1.0.47.sha256sum] =3D "1fbf4db142a473a8d80c26bbf18454ed458bf=
8d26c8219c331daecfdbd079001"
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
+SRC_URI[ref-cast-1.0.27.sha256sum] =3D "7e440fb4e4b4147295338efb76001ab9e4=
efc0e5839df2c47fc5ac2381d365c3"
+SRC_URI[ref-cast-impl-1.0.27.sha256sum] =3D "92ecd8964f8453721699a1ed72037=
b0db49ce2f5a5138486ee89bed6f67cdf3a"
+SRC_URI[referencing-0.44.1.sha256sum] =3D "22952642836711d7a730d23a4dfb0d7=
32e75a85e4c4f5704266d9c8fac278ff1"
+SRC_URI[regex-1.13.1.sha256sum] =3D "f020237b6c8eed93db2e2cb53c00c60a8e1bc=
73da7d073199a1180401450218d"
+SRC_URI[regex-automata-0.4.18.sha256sum] =3D "ad8553b9b26413251cbf30e62059=
5c7a41b3887f03da04579c0e6b0d6a06b4b2"
+SRC_URI[regex-syntax-0.8.11.sha256sum] =3D "d6f6ff9a378485b298a5286656da66=
5ba74413d36db0979633275d2e708145d4"
+SRC_URI[ring-0.17.14.sha256sum] =3D "a4689e6c2294d81e88dc6261c768b63bc4fcd=
b852be6d1352498b114f61383b7"
+SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e79d06=
3319ebb6594faafcf1c225ea92ab6e9b92"
+SRC_URI[rusticata-macros-4.1.0.sha256sum] =3D "faf0c4a6ece9950b9abdb62b1cf=
cf2a68b3b67a10ba445b3bb85be2a293d0632"
+SRC_URI[rustix-1.1.4.sha256sum] =3D "b6fe4565b9518b83ef4f91bb47ce29620ca82=
8bd32cb7e408f0062e9930ba190"
+SRC_URI[rustls-0.23.45.sha256sum] =3D "0d41d731c7d2f962d1ccc364cec258de3c0=
e93b38c2fb3ba97ac74513048d634"
+SRC_URI[rustls-pki-types-1.15.1.sha256sum] =3D "2f4925028c7eb5d1fcdaf19697=
1378ed9d2c1c4efc7dc5d011256f76c99c0a96"
+SRC_URI[rustls-webpki-0.103.15.sha256sum] =3D "f3c3cf1d8b1e7d4927e2d154c3f=
cb02979afb9939629c62cd9048d4f07b60ac2"
+SRC_URI[rustversion-1.0.23.sha256sum] =3D "cf54715a573b99ac80df0bc206da022=
bcd442c974952c7b9720069370852e21f"
+SRC_URI[ryu-1.0.23.sha256sum] =3D "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5=
cccb8cc655a4e50009e06477f"
+SRC_URI[schemars-1.2.2.sha256sum] =3D "687274d293b6cdc6e73e0fee520bf204965=
0090d7164f87672d212a3c530cf4a"
+SRC_URI[schemars_derive-1.2.2.sha256sum] =3D "d98c67716b46af2f0b8cf752abc9=
30f6f9aecfbf671ecfb531db8a31dbe4e2ba"
+SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59bce=
7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[semver-1.0.28.sha256sum] =3D "8a7852d02fc848982e0c167ef163aaff9cd9=
1dc640ba85e263cb1ce46fae51cd"
+SRC_URI[serde-1.0.229.sha256sum] =3D "4148590afebada386688f18773da617792bf=
2ef03ffc1e4cbd2b1d45b023e0ba"
+SRC_URI[serde_core-1.0.229.sha256sum] =3D "67dca2c9c51e58a4791a4b1ed58308b=
39c64224d349a935ab5039aa360942a48"
+SRC_URI[serde_derive-1.0.229.sha256sum] =3D "e7a5d71263a5a7d47b41f6b3f06ba=
276f10cc18b0931f1799f710578e2309348"
+SRC_URI[serde_derive_internals-0.30.0.sha256sum] =3D "f852137cce035d6a4df6=
7ccce505ff6b3e9fd3a10e3e52b24dc71e650bb1a9bd"
+SRC_URI[serde_json-1.0.151.sha256sum] =3D "c841b55ecdae098c80dcae9cf767f6f=
8a0c2cdb3416bbef72181df4d0fe73f14"
+SRC_URI[serde_spanned-1.1.1.sha256sum] =3D "6662b5879511e06e8999a8a235d848=
113e942c9124f211511b16466ee2995f26"
+SRC_URI[serde_yaml-0.9.34+deprecated.sha256sum] =3D "6a8b1a1a2ebf674015cc0=
2edccce75287f1a0130d394307b36743c2f5d504b47"
+SRC_URI[sha2-0.10.9.sha256sum] =3D "a7507d819769d01a365ab707794a4084392c82=
4f54a7a6a7862f8c3d0892b283"
+SRC_URI[sha256-1.6.0.sha256sum] =3D "f880fc8562bdeb709793f00eb42a2ad0e672c=
4f883bbe59122b926eca935c8f6"
+SRC_URI[shlex-2.0.1.sha256sum] =3D "f8fadd59c855ef2080decdef8ff161eb6661b8=
6933c9d82e5ba29dc602a55aba"
+SRC_URI[signal-hook-0.3.18.sha256sum] =3D "d881a16cf4426aa584979d30bd82cb3=
3429027e42122b169753d6ef1085ed6e2"
+SRC_URI[signal-hook-mio-0.2.5.sha256sum] =3D "b75a19a7a740b25bc7944bdee617=
2368f988763b744e3d4dfe753f6b4ece40cc"
+SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D "c4db69cba1110affc0e9f7b=
cd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
+SRC_URI[slab-0.4.12.sha256sum] =3D "0c790de23124f9ab44544d7ac05d60440adc58=
6479ce501c1d6d7da3cd8c9cf5"
+SRC_URI[smallvec-1.16.1.sha256sum] =3D "ba467056f1b547ed52077911161fc86985=
becbc60e8e1857c8a144dab0def891"
+SRC_URI[socket2-0.6.5.sha256sum] =3D "c3d1e2c7f27f8d4cb10542a02c49005dbd6e=
93095799d6f3be745fae9f8fedd4"
+SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D "6ce2be8dc25455e1f91df71bf=
a12ad37d7af1092ae736f3a6cd0e37bc7810596"
+SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628564b=
3b043a70948a3f0b778838c5fb4f"
+SRC_URI[subtle-2.6.1.sha256sum] =3D "13c2bddecc57b384dee18652358fb23172fac=
b8a2c51ccc10d74c157bdea3292"
+SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3bafa6=
7b529ead792a6d0160888b4237"
+SRC_URI[syn-2.0.119.sha256sum] =3D "872831b642d1a07999a962a351ed35b955ea2c=
fc8f3862091e2a240a84f17297"
+SRC_URI[syn-3.0.5.sha256sum] =3D "12df2e0110f65b775f769bb17ef989067a1d931b=
2eb822bd4346631eeada89f9"
+SRC_URI[sync_wrapper-1.0.2.sha256sum] =3D "0bf256ce5efdfa370213c1dabab5935=
a12e49f2c58d15e9eac2870d3b4f27263"
+SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7ae=
5ea60a4b5549c8a5914361c99147a709d2"
+SRC_URI[synstructure-0.14.0.sha256sum] =3D "901704edd0dfe137f1987838ee4f25=
9e4e063c31371bdb423f7ae38ec6f77f02"
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
+SRC_URI[thiserror-2.0.20.sha256sum] =3D "ec86235f5fcc2a73650310756d2ac5b13=
8a5780bbbdfae3eeccec992c435ba4f"
+SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D "4fee6c4efc90059e10f81e6d42c6=
0a18f76588c3d74cb83a0b242a2b6c7504c1"
+SRC_URI[thiserror-impl-2.0.20.sha256sum] =3D "bc04cd3e1236dd4a98afca4569f2=
deb3f120e5422a4023be2cb683f8486292af"
+SRC_URI[time-0.3.55.sha256sum] =3D "cdb87b95ec50ddfa440816d227a17b2ccbdda9=
63a316a727fda0fc4334f7d134"
+SRC_URI[time-core-0.1.9.sha256sum] =3D "9e1c906769ad99c88eaa54e728060edef0=
82f8e358ff32030cb7c7d315e81109"
+SRC_URI[time-macros-0.2.32.sha256sum] =3D "7e689342a48d2ea927c87ea50cabf85=
94854bf940e9310208848d680d668ed85"
+SRC_URI[tinystr-0.8.4.sha256sum] =3D "b1e27c91459209c2986af3dcf603a5a74a43=
68754ce37414f59acc971167f643"
+SRC_URI[tokio-1.53.1.sha256sum] =3D "202caea871b69668250d242070849eb495be1=
78ed697a3e98aebce5bc81a0bed"
+SRC_URI[tokio-macros-2.7.2.sha256sum] =3D "78773a2a397f451582ce068015985c3=
3193cf6dea8b74d2a639fe457b2f07b0e"
+SRC_URI[tokio-rustls-0.26.5.sha256sum] =3D "b0c85f2c3ef0b1cd58b36682f4b17a=
aa995f0e5db534d85692b4903abce21f67"
+SRC_URI[tokio-stream-0.1.19.sha256sum] =3D "a3d06f0b082ba57c26b79407372e57=
cf2a1e28124f78e9479fe80322cf53420b"
+SRC_URI[tokio-util-0.7.19.sha256sum] =3D "494815d09bf52b5548659851081238f0=
ca39ff638363907596da739561c62c52"
+SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] =3D "cf92845e79fc2e2def6a5d828f0=
801e29a2f8acc037becc5ab08595c7d5e9863"
+SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] =3D "92e1cfed4a3038bc5a1=
27e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
+SRC_URI[toml_parser-1.1.3+spec-1.1.0.sha256sum] =3D "1d38ac1cf9b95face3229=
6c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56"
+SRC_URI[toml_writer-1.1.2+spec-1.1.0.sha256sum] =3D "7d56353a2a665ad0f41a4=
21187180aab746c8c325620617ad883a99a1cbe66d2"
+SRC_URI[tonic-0.14.6.sha256sum] =3D "ac2a5518c70fa84342385732db33fb3f44bc4=
cc748936eb5833d2df34d6445ef"
+SRC_URI[tonic-build-0.14.6.sha256sum] =3D "c68f61875ac5293cf72e6c8cf015808=
6428c82c37229e98c840878f1706b0322"
+SRC_URI[tonic-prost-0.14.6.sha256sum] =3D "50849f68853be452acf590cde0b1466=
65b8d507b3b8af17261df47e02c209ea0"
+SRC_URI[tonic-prost-build-0.14.6.sha256sum] =3D "654e5643eff75d7f8c99197ce=
1440ed19a3474eada74c12bbac488b2cafdae27"
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
+SRC_URI[typenum-1.20.1.sha256sum] =3D "b6f5e870be6c3b371b77fe0ee0bafb859fa=
4964b4404c27de1d380043c4dda20"
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
+SRC_URI[unicode-segmentation-1.13.3.sha256sum] =3D "c6f5d3c3b1bf09027a88a6=
bc961fc00497d651009560b5463668dc81b0fa87a8"
+SRC_URI[unicode-width-0.2.2.sha256sum] =3D "b4ac048d71ede7ee76d585517add45=
da530660ef4390e49b098733c6e897f254"
+SRC_URI[unsafe-libyaml-0.2.11.sha256sum] =3D "673aac59facbab8a9007c7f6108d=
11f63b603f7cabff99fabf650fea5c32b861"
+SRC_URI[untrusted-0.9.0.sha256sum] =3D "8ecb6da28b8a351d773b68d5825ac39017=
e680750f980f3a1a85cd8dd28a47c1"
+SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084a5=
9b5ffc27a8859a5f0d494b5d52b6be"
+SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
+SRC_URI[uuid-1.26.1.sha256sum] =3D "2ef6dac1e96601b4fb3acccccff2139741fcb7=
57cb9a36089bf5be91cfb285ce"
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
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] =3D "b67efb37e106e55ce722a510d=
6b5f9c17f083e5fc79afc2badeb12cc313d9487"
+SRC_URI[wasm-bindgen-0.2.128.sha256sum] =3D "aecb87a33d3b0c5e3b7aa46336eaf=
486cffafbd281b195e4c8b80d50df2351bf"
+SRC_URI[wasm-bindgen-macro-0.2.128.sha256sum] =3D "a690d511e3c1a8b3a55e335=
11e3c2c00c78415cd23650f32b808627f5696b9ed"
+SRC_URI[wasm-bindgen-macro-support-0.2.128.sha256sum] =3D "411e4887f0071ef=
2d2164a9d5fdf2d20efbef78fccd3a78b0c10a1dc5295e48a"
+SRC_URI[wasm-bindgen-shared-0.2.128.sha256sum] =3D "81941cd78d0c92026c33e5=
e01312845a4cb1e9af3407f9134b100dd03144103e"
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
+SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df6176=
6145077ddf49416a728b02cb3921ff3fc"
+SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d47=
80d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-threading-0.2.1.sha256sum] =3D "3949bd5b99cafdf1c7ca86b43c=
a564028dfe27d66958f2470940f73d86d75b37"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec044=
bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53fa=
7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295ac6=
720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76c5=
63b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28bf=
89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901cb5=
895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc41741267968=
1396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d127=
0a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[winnow-0.7.15.sha256sum] =3D "df79d97927682d2fd8adb29682d1140b343b=
e4ac0f08fd68b7765d9c059d3945"
+SRC_URI[winnow-1.0.4.sha256sum] =3D "23b97319f7b8343df12cc98938e5c3eb43606=
4524c8d2b4e30a1d3a36eecdf81"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] =3D "1ebf944e87a7c253233ad6766e082e3=
cd714b5d03812acc24c318f549614536e"
+SRC_URI[writeable-0.6.4.sha256sum] =3D "3ad82d2a33cdc9674dc7465672f271e096=
168fcdbe0f799d9e6db8c5892679dc"
+SRC_URI[x509-parser-0.18.1.sha256sum] =3D "d43b0f71ce057da06bc0851b23ee24f=
3f86190b07203dd8f567d0b706a185202"
+SRC_URI[yoke-0.8.3.sha256sum] =3D "709fe23a0424b6a435d82152b1bd3fdfb083348=
7d5fa90d05d42762a9891fef5"
+SRC_URI[yoke-derive-0.8.3.sha256sum] =3D "33811428bee40dbceb6d545e95754741=
d17a6aef9a4849f0fd62e2ba4f412a78"
+SRC_URI[zerocopy-0.8.57.sha256sum] =3D "d35102a9f36d089ccae9e4c6802bc118be=
4487b80aaffc0ab4e0cf5ce92d2873"
+SRC_URI[zerocopy-derive-0.8.57.sha256sum] =3D "146c01f5ab44258da43cf276c74=
a2763db2ff3969c9c652c3f2de07041d0b2bc"
+SRC_URI[zerofrom-0.1.8.sha256sum] =3D "0ec05a11813ea801ff6d75110ad09cd0824=
ddba17dfe17128ea0d5f68e6c5272"
+SRC_URI[zerofrom-derive-0.1.8.sha256sum] =3D "f75b4683f6c7f45248d4d64056a2=
4298c6281e0993356d7d1b4a1a962ef10d4a"
+SRC_URI[zeroize-1.9.0.sha256sum] =3D "e13c156562582aa81c60cb29407084cdb54c=
4164760106ab78e6c5b0858cf64e"
+SRC_URI[zerotrie-0.2.5.sha256sum] =3D "4ea269c3bd32f0a32c321907a2ae912ba6f=
4649bb0fc764a15627e99a7095a3f"
+SRC_URI[zerovec-0.11.8.sha256sum] =3D "bb0464e17806c1d976d5cba29399c7f08e5=
16e279e2ba493f63123b5fca67dd8"
+SRC_URI[zerovec-derive-0.11.6.sha256sum] =3D "34df6fc39dbd26ddc9c10e6a2984=
476e13acce22e64e4487636ef494369225da"
+SRC_URI[zmij-1.0.23.sha256sum] =3D "29666d0abbfad1e3dc4dcf6144730dd3a3ab22=
5bbbdac83319345b1b44ccfc1b"
diff --git a/recipes-containers/ankaios/ankaios_git.bb b/recipes-containers=
/ankaios/ankaios_git.bb
new file mode 100644
index 00000000..4f9f2e12
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
+PV =3D "1.0.4+git"
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
+# v1.0.4 tag commit
+# When bumping SRCREV, re-diff upstream deny.toml and re-check LICENSE aga=
inst the crate graph.
+SRCREV =3D "1604423b3906fc1d1dd7cb59a6442a18215074e7"
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


