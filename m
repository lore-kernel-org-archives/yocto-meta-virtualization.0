Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.45])
 by mx.groups.io with SMTP id smtpd.web09.861.1603814211726899558
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 08:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DW2xiITV;
 spf=pass (domain: arm.com, ip: 40.107.14.45, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLSwUhE0tfUYmFENlaH3MPj1/fcdGPbE2m+YtW/V5Tk=;
 b=DW2xiITVjfEzZAs1F/23gdPffHBg6VI+dy3PGe+/DrLvUdtlJjgW6EEuSY5t/0rOSqod1ll0cBJZq4oWYQg7jZl2aYupGQHuCqXSdzxG+gBjFxGAfsPEttpWG+bNb+/eTd3b8qUQvjntlwAJxnIU2nSDmoalURD2P3hPCMCQaRA=
Received: from DB6PR0601CA0042.eurprd06.prod.outlook.com (2603:10a6:4:17::28)
 by DB6PR0801MB2086.eurprd08.prod.outlook.com (2603:10a6:4:7a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Tue, 27 Oct
 2020 15:56:48 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::bd) by DB6PR0601CA0042.outlook.office365.com
 (2603:10a6:4:17::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 27 Oct 2020 15:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 15:56:47 +0000
Received: ("Tessian outbound 7c188528bfe0:v64"); Tue, 27 Oct 2020 15:56:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ebe18a21f1a44c4
X-CR-MTA-TID: 64aa7808
Received: from d4830b67ca64.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 126984EE-285F-4EB1-9165-41A8B78FAA1D.1;
	Tue, 27 Oct 2020 15:56:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4830b67ca64.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 27 Oct 2020 15:56:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuEPrSYlPNH9e3WpJzDLBhg8ftIpKvnLS/SI3KNW3sQwz6nLH9k8m09Qc+rixgtRnOQxwHzeoq3k3yTKo+LXbhW5ScjGlNW+Ns7UFB3zSsVSpwZdrbThQ29Va9BCsjCpScuOMsCJV/bkBt4n35Khx3yVafee2rvoa+j29iK+A2yWJs4aQIbuPZVzjdqJtVjHa+jNkD8MQefOB4mw0FfO81NgSiji2JFfLVBTsZvR2Fw1Rt2lZqHv0XX4K2v+fQmllyD8MI3hyurJxHAP3mtOt+CT0j7HRRNupmKhjMbqpFm1lJ3yBHHus+K8hmquQm2LC2yHVSuzNQPGy2ExvgdnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLSwUhE0tfUYmFENlaH3MPj1/fcdGPbE2m+YtW/V5Tk=;
 b=JYj6eo4XUZUHymRpuaADvJQVoPJHuao07njJeAMPdZkfi0w3E6h219gTPfAzAb5eG6+feLlXxZOpNlSk1Jo61rpF21zrgAape365B4fpWP+CwHk4zy5QnvKWrXtxggpx9J0d62ioQpSZI+78q+WCUJGZTkdEg8XmWIxAj8/EPudfYQEqs9E2hGvPOfpSWb8T5BpOhjUAJ6JjenjBIaLSbrSkTHi+o2hoDUx3tzfvbcqLURrWPBLw5qCXxBJVM6g4g/wK3rCXDGJd4i6e1SyhQhv5KwQxzT/A9tKUt4EmTNoXS2w6rJoDP3AeQngwkYlGfqiKu/GjZAKMO+YnqCgKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLSwUhE0tfUYmFENlaH3MPj1/fcdGPbE2m+YtW/V5Tk=;
 b=DW2xiITVjfEzZAs1F/23gdPffHBg6VI+dy3PGe+/DrLvUdtlJjgW6EEuSY5t/0rOSqod1ll0cBJZq4oWYQg7jZl2aYupGQHuCqXSdzxG+gBjFxGAfsPEttpWG+bNb+/eTd3b8qUQvjntlwAJxnIU2nSDmoalURD2P3hPCMCQaRA=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3468.eurprd08.prod.outlook.com (2603:10a6:10:4a::11)
 by DB6PR0801MB1958.eurprd08.prod.outlook.com (2603:10a6:4:73::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.26; Tue, 27 Oct
 2020 15:56:08 +0000
Received: from DB7PR08MB3468.eurprd08.prod.outlook.com
 ([fe80::e4f9:119e:aee8:362d]) by DB7PR08MB3468.eurprd08.prod.outlook.com
 ([fe80::e4f9:119e:aee8:362d%7]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 15:56:08 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>,
	christopher.w.clark@gmail.com,
	cardoe@gentoo.org
Subject: [meta-virtualization] [PATCH 2/2] xen: extend SYSROOT_DIRS
Date: Tue, 27 Oct 2020 15:55:36 +0000
Message-Id: <20201027155536.12513-2-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027155536.12513-1-diego.sueiro@arm.com>
References: <20201027155536.12513-1-diego.sueiro@arm.com>
X-Originating-IP: [217.140.106.50]
X-ClientProxiedBy: MRXP264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::16) To DB7PR08MB3468.eurprd08.prod.outlook.com
 (2603:10a6:10:4a::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from scm-wfh-server-dievar01.stack04.eu02.mi.arm.com (217.140.106.50) by MRXP264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Tue, 27 Oct 2020 15:56:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e6ba3ed-3dd7-4721-6dbd-08d87a90e930
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1958:|DB6PR0801MB2086:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB20869CE366E778C677363E6F92160@DB6PR0801MB2086.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /zl/FQ5OO+uQcHBoIjUhKsrmf1DtTc3hvPkVhZvYQd6EuDmDk6AxpoaN8r6DaiX12bdDlh7a1Sjsxgw5CgeqSkZpSZd4Nwyj9tBSsC2kbq5YXNgtOeReJ7ABlp6A9FekO3bV/t8dHGQ4IXBJpIGInz+5HY5Iw/5dZFXg0j8DY2GGZm1oqb5U5hc4BSNHV0YNggrCxeMp0xs+gqVzGRUUHyqKRbYostYNze13Pe01eoT/yrC1cCxfx+4b75ZDlfJtE4izuA2No/k/CGgoJFl8EHsuKkaKMoQd+bJ26Srk2F3lTmSaE6ZMkdPoy0Lzk7cZ/jZG2UFQJTblaso2CCpAuw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3468.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(8676002)(26005)(52116002)(6916009)(5660300002)(86362001)(36756003)(186003)(316002)(44832011)(16526019)(4326008)(8936002)(6486002)(7696005)(1076003)(6666004)(478600001)(4744005)(66476007)(956004)(66946007)(66556008)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 +5V9K7HphV+D6MjjHHdSvnTbTZG3cUcMeBiEVM5C7HZZsJ7QuDb/MCk1hlZ1awxWc7JgmzvZ+dowfuttDLDp4isfOkrjJJU/ZYz+9qrtqEPRNcRTRErZMwsMkp5MnAoxV4VDDPcBucvmsVpgeWbA7NAqgHRLdJQPP1Uxx/qti0adXkgIZHe7MbYmh+vaP6FCSVaUq9JaXR4G040TKNeOLkvQwGYb20P3AhAV69SOEzqDtLIsS0MwQGwGEZYgMK5ccT9cyqNP7+oGb2bvZX+mqewYJiF5vzsHFObGrt7Sf0zjZdT4H5Ubr8O0jFB/EkbfjUiWCNAIPxFT69gW3dCiZi4FiY8ZkPfBSZOTxvYbtnwPZ2w0XfWUNy/fI4kWDBovRcgazcPohbQklPco5fRnilzg/dSaZVyzQKCiudXWD2okIdFjAo18ALWh+FtK9+CAkKZoDlPzHYjRm6oD7qmg0JJQiimF+Hpkogf/nu2ckE4Ob0xyuwn8Pb0XsZKlJeigbop3nYqU6v+o59OyB9OLJcCMbC5Ku/fE2LtIlSzjxr4/3L/xHYntc+4dRZQCDnP9Ek32njDHv2kKUemBLvQ7xyt4MF1fv7Chs0Whw3Md3QeQSmXAWc9egr10MnxTR89S/RnMyg+SyysZ6aZ2ve9KYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1958
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c5409c8b-902e-4dbc-e19b-08d87a90d197
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0jyhO3h/iMmeFQErTRnzyerPqEDebKp03XywGy+2JRiwv6/mwxT2oGxjv4kD03InelqJGOMhMO/7/XftjnJH9SPxJDCm+SviU6KeMQuSVn2/oMXwmiINt5AFR7gLX7Fn93von1/jJZVoO8ymoLvOB+Zv7VE8OTff/PuxCB9n9KdxfH93emptcAQsmwX9hIiK9IkIn8iOGOzzs7c93j7OPeGXRZaRwTC7DL38psyA4FWTfG7wNewZHb4ssElNyFGXlsobkJUKPPJjPbCiSCZ7tHEqlYc0gFdj3+01uvxloZcLfjsOjqq5u/NHamTb9fLzUsXv7V5tMWhFefRK432oaDKsYKUk2W/mj8AOccLxmw+4vGKHw3l9EqI8n/TU6GCd6WudWYHNS6z8ZEgHOlLwcg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(46966005)(5660300002)(82740400003)(316002)(36756003)(86362001)(2906002)(336012)(356005)(47076004)(70206006)(16526019)(81166007)(478600001)(70586007)(186003)(107886003)(6916009)(44832011)(7696005)(8676002)(956004)(4744005)(4326008)(8936002)(1076003)(26005)(82310400003)(6666004)(2616005)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 15:56:47.8999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6ba3ed-3dd7-4721-6dbd-08d87a90e930
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2086
Content-Type: text/plain

The do_install task also ships files to /boot and /usr/lib64. Hence, extend
SYSROOT_DIRS to include these paths.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 recipes-extended/xen/xen-hypervisor.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
index 6a75d16..916bd3c 100644
--- a/recipes-extended/xen/xen-hypervisor.inc
+++ b/recipes-extended/xen/xen-hypervisor.inc
@@ -55,6 +55,8 @@ do_compile() {
 do_install() {
     oe_runmake DESTDIR="${D}" install-xen
 }
+# The do_install also ships files in /boot and /usr/lib64
+SYSROOT_DIRS += "/boot ${exec_prefix}/lib64"
 
 do_deploy() {
     install -d ${DEPLOYDIR}
-- 
2.17.1

