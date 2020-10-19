Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.55])
 by mx.groups.io with SMTP id smtpd.web10.8735.1603092299044234120
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 00:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hBYbHV19;
 spf=pass (domain: windriver.com, ip: 40.107.223.55, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyW+lqPrBcPVcjbLotCTjWGj9T+W89UQFGs/JKDNnV3H8wPF5C/Oh8wLKN6zoPJcT4EWNn2KavnqZoUJsv9No6HYxiha5257ZVIWWmW7CUnRH/6V+zrdCG5IO+RfC9s3dmxPAHIlIu0+d9d6eoVBkWJ5cSuGhqEbOzgG+IaEzg0XVcfiLgTXS+VaJghYGAqQuEMzEXga0B6YNEGqF9C3mRf0B163U8xjkw4jEggx5+aGYlzQD4Invlw8u2yD+HEBzBjdvmWCtBWkuKfCUfLnsYHEj2q/FT74SXJPZp9SXD9KmgOxu9yUZHQ0GLlNMpfUH/SFVzhlJZuuyN/SGV4hAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4OksiaLgxwiIw1IhzYMaKfW84Broc4AOfTyfwlq7FM=;
 b=glJYhD1iRP9UFLN/MXbGmnniB0wXd5DTYD0kUfJGACBKGWJCZcSVJrqdpwTX9YBd21IteULlFiY4RPRJ71bBpcGf9z2NBcapR3t9bWhkWVKA8PTuJe9tse2T46nrUWre0Z/9U62rz23L3HjVt0W8kj54FE91il73wx3/4riOAdSAEkIm/6bqcbk+on4qV8s1h8PwL8ykAVqCAdqJyGXm657g9/AahS6H6rzpbZJMWGuCGJ9IMMaQyJvod3sxUBcC8luOZETZLZQ5jIVTinhwBoY5fNE/rIi5efuEM0RX2Q1xAb6mOU7gKokxmbo7kMgyVBMc81oKt9pAAlttUYUWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4OksiaLgxwiIw1IhzYMaKfW84Broc4AOfTyfwlq7FM=;
 b=hBYbHV19Uzaz91NrOULLjJvo3Ah5Szs9ZcDhuUo2B5hJsHOjV94d7xzVXiMrm4KTJFrvPWmaTfjeg+JrPsPuFYMO5Y3Iv8jFVQZIoZz/R6xVmDY+fYlOqPDxH5oeCpOwDic0iXqjkb0Up8/TbyfC4t0sEvF+Ii5hOT0C06DHSr0=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4151.namprd11.prod.outlook.com (2603:10b6:a03:18f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 07:24:57 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4%5]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 07:24:57 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nagios-core: use /run instead of /var/run in systemd service file
Date: Mon, 19 Oct 2020 15:24:42 +0800
Message-Id: <20201019072442.25583-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:203:d0::14) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR04CA0004.apcprd04.prod.outlook.com (2603:1096:203:d0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Mon, 19 Oct 2020 07:24:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8817e7c-8db1-43bc-fa28-08d8740014cb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4151:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4151F67E2A4AF7907EE448A4ED1E0@BY5PR11MB4151.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OOABkjhAg5N1ojB9bDoM4wcHEkxwH57kRUpx3uwHvID7Sti+bGs+l535SYDdjfqRaRapUkG8bOlhPYgNz6CZkWEE/wkw8DJ03Fjqc0o64dDnthMJeJIrj1to5DKnWuOwjwvRF6zz7Ds5hpOZsEQzvPYuCoc8zKdK8mkcroydvIohEMIZ/gxcS7xwosFZodGTCKJI8JjBPk2otyk02J6Ae9/PdSqAOTF0HIYk26FcTmaUQLhjpqGB3v8DDIhBHDR7Ol36WgDtkqiGRsv4yY2bgFdIMb3XZdSiF59z+NnfSUwchjp6CaNbEpv+31lcohRWOx0XA5XRaX36/c0Dv+Z5IA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39840400004)(366004)(396003)(36756003)(956004)(316002)(6506007)(6916009)(2616005)(1076003)(6512007)(8676002)(8936002)(2906002)(26005)(16526019)(478600001)(186003)(4744005)(66476007)(66946007)(52116002)(86362001)(6666004)(83380400001)(66556008)(5660300002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	D2qbKoQsJxulQHaFsYq2KIOhwKKFUwaXUlxZfZo+3lEdZC6xzV6cmbeJu6PZtgx+VjDI+qhmJDaLqdT2LM/5BUGABCorI+OqJh04ftefZ9PgSQve7W9PrSFICaT67o4bKT4Olfxe7uhChv5imXZyDNJeGwqqQojffF+qCS8LqWMwpqE9u1v0vLWE9ycje0YO/Md3CYvymXga6D7ZDe8boU0+caYz2g3hwa7C2M/tLgtGlraiSZDUEBz+Z05jiH/qo5nHvMQUK8B8vaLzcVJncXmnuhJfHzCijamgXr6iTKMH0xFmewW2XvTxT6B99/UFTNJvsZG0oPMxJfOmMr/pUU+N5rWluZAeiQTkkJBZeHfQ8rN31WCx3Gz8WGhNnLYIrCTqRn4P/+oFNfob+umz3BhB+r5Fd3peCN9gVPr056RHCdZfEr9RrQfV3ts2zCi3kh47KxWJtI12xdAZx1MUJLlwBQr65e8JZxjFI+iNml43YcOYWFZuTK8AmjrTX80UXtkZo/ymNxi1k08f4ALEUwGK3WMJopFgqcxVMyb+B9fJ8KWbZ3IKb8KAfU79cIQtlsLK/Y06s0L6czNAuZR/sW+UqihLphoo3wDs06vZNSfdYwDI2kO6lGZPB0V23U4jvw04NKVQdJ50cIeG7+PpZA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8817e7c-8db1-43bc-fa28-08d8740014cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 07:24:57.4297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32nW5WQb7vFNt2SBZtWB427t7USx2cXlaJDi7XXsTIhekkNPe0RMlTKbJTzgh9RrPXxViATxi8/78Y4MOkASEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/nagios/nagios-core/nagios-core.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/nagios/nagios-core/nagios-core.service b/recipes-extended/nagios/nagios-core/nagios-core.service
index 61fda3f..0fdbfc9 100644
--- a/recipes-extended/nagios/nagios-core/nagios-core.service
+++ b/recipes-extended/nagios/nagios-core/nagios-core.service
@@ -6,7 +6,7 @@ After=network.target local-fs.target
 Type=forking
 User=nagios
 Group=nagios
-PIDFile=/var/run/nagios/nagios.pid
+PIDFile=/run/nagios/nagios.pid
 # Verify Nagios config before start as upstream suggested
 ExecStartPre=/usr/bin/nagios -v /etc/nagios/nagios.cfg
 ExecStart=/usr/bin/nagios -d /etc/nagios/nagios.cfg
-- 
2.17.1

