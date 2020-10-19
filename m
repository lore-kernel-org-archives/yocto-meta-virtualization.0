Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.84])
 by mx.groups.io with SMTP id smtpd.web11.8899.1603092628162893987
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 00:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g5crr+lh;
 spf=pass (domain: windriver.com, ip: 40.107.223.84, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYpdE47+QQ0G0Hju0Nx9mSrcSECObwPeVq+35gm48vAlAFVr0Bhpwo3NDFLn2RyUf/XoJaa3YWwqsVnyFOkAy3+AI6H1cci6YBUkofoAhlsqces/aMkhNbYG0VPU+ovVCYqoW7zAGmG91KP8audc1+tcmpl0/1McGyVJ4Ptq7E/XZ7YYp5vino1PV+EuWeopB3ld6DYg1R7doH8xDYe4xWMW5KJOgiy3gVJ2WKq59P1fBBL3k+Cv8QLWBz9ePgTY3olLRsDou5k8oeFCZcSBL+EMCLU4t0LBk3hVVS0q70zmxd0CPagWyg+LM9e7LYPlaKchRyktd/7rfpT2Iw0OrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH/Nal9xd3fowBBBMy4TBNZnvy0MILrtbjzqLx+sKrw=;
 b=ZYfds1WVNZJlzaExofpEhDNm/zyl2dUqiv6K85mdvE/YZT1T6lrLG9sIcYpWLzEour5gX1C8xluBhfdWEMounCprZbl4o//vr1YoaaKG4LUIpWtrqf7M1KE5DilU6tfWVRUHuhwJbZpk/uDVkQWp/vthFLC4gSzSrLm2NFyCwyVFjG4fZlmuvmx+/CeoNCHLHtwH81lnMkFRKe8Qil7+VURRwP0nTHfd8WuMvxxP6qFnvWZvos5WMsExctVHlwa/S4lsUHT7laBD2tk7OID5YMSOT52siqjjnExsxvgOAWFpNS0w3xTVMdCKj+4KIxuDNEZCJPn1mT1Gh4rM40ferw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH/Nal9xd3fowBBBMy4TBNZnvy0MILrtbjzqLx+sKrw=;
 b=g5crr+lhNDskhYrLdc0UQTLlneyJASJw2jYMVjCd6HxsC6mY61oFX1iQVQ7pBcC6hPW3ltN/db2g7DMV5HB7UC7SSJTYgn1vIwAYTrFSBzLiwETK2ZY4jWP9X28A/alDeB8yzVMzbwrv4r/n1ftVgxA3xv4OuYhH8WqG8CB+MAc=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2630.namprd11.prod.outlook.com (2603:10b6:a02:c2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Mon, 19 Oct
 2020 07:30:26 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4%5]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 07:30:26 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nagios-nsca: use /run instead of /var/run in systemd service file
Date: Mon, 19 Oct 2020 15:30:11 +0800
Message-Id: <20201019073011.23528-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0211.apcprd02.prod.outlook.com
 (2603:1096:201:20::23) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0211.apcprd02.prod.outlook.com (2603:1096:201:20::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 07:30:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88c11d00-8843-4951-fc19-08d87400d896
X-MS-TrafficTypeDiagnostic: BYAPR11MB2630:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26308F02894AF31CE6E94BD2ED1E0@BYAPR11MB2630.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NDO4wmSq3UnUKdW39TQoclqVIus07lbBrWVjTSyMKx7Yh3XXQ7ud7J64pkT8A1JF9RFVD2j5m8jZ2kVQI6EuDIL0YJNiTyOxbWXC9gwG9tthLMbklneq9qaqUkcHvUP61lTXFKD8gUtM3nK6xeLIRjIqkih7E9msG7dbudpCIj9jtt70SGqMRtACwUJEMeijOPcZU/q9OLVdxEdX+udCxY/uPjtMWDJYwDOh1sqXaGCcYv/VhCLfUpat5bjaCn0bePD7+SfJ5lceYBlxpP9CzDT9IHbOsNYboJiH5vYcn1AAzbYC6NDkysTbl7NlofA/dPzBX63Ym9ZXggq5Mp0uEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(366004)(396003)(136003)(346002)(376002)(4744005)(6512007)(478600001)(2906002)(316002)(86362001)(6506007)(16526019)(6486002)(26005)(1076003)(5660300002)(36756003)(6666004)(66946007)(66476007)(83380400001)(66556008)(186003)(6916009)(956004)(8676002)(2616005)(52116002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	30FqozK12fC8bSvbs+zOo1Oo6Bu1vbtWS4ZVe4UCVWCdrLrAY+Jo0QtOqv8+Y7DhsCq2vPj2xd9JrTZTjfn7J7PZ/l9cbhdPmSNS1lVAAe4PXZW4xGs5Meu7ocYZOa8UOO8MFN6mWY052RuvsEAlA1JAgoON0+wOPldBEkhq2Dl6C0O4jw0SbKlQnVUc6oe0NGBCTwI8GDL1mhcfZEtDSJiyyYQBj03oHDE4HxedwEhzXBHLUNCXznb/M1K0NbuqIQA1riGaFLmu3/zwjAKeI44XlDFbjsdt2QfXQKP8Nf6+2m79xmTwUXVgSJ7pLPCDOF4OTtXSsi8d3DTRczGL19MdkgPimrY/9Wrl/TFj4eIIEUG50DdA1GdVEUQa2NMcGKg29dSQPQMBODcThnQIHaDDS5+5ds27TF0lzRLfskgno1DxoeAFYX0ZWw9yFbKhVmPcJeA2MwTuDWM+N2VlChjkKspk8t6FwxoE0xDrt4rYo4pmyTGSqdZQMvnWOlE35qIhJyPpq5sg4oIUax+Dx2zRQr928yxwu0/4V1jFYIDtFaf7O5v0t7y0jWy9W5mKXp6EZN+VFjI86WTwmrMLpsX+1wlTSWkQ8KOjsumckzYCzFlN5cQpe7xNwVGQfGNERmN9703MnTS2RL3x6nxMIg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c11d00-8843-4951-fc19-08d87400d896
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 07:30:25.9068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wU7FaSWJMAi6qIZyNCG1GPHD6eHL6PA1DJwdM1P5yT3NWJFrf47xQAMi7PpORx4tQlJV3aVWP2u2kIfDdawAeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2630
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/nagios/nagios-nsca/nagios-nsca.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/nagios/nagios-nsca/nagios-nsca.service b/recipes-extended/nagios/nagios-nsca/nagios-nsca.service
index aa38b7f..f6eb33e 100644
--- a/recipes-extended/nagios/nagios-nsca/nagios-nsca.service
+++ b/recipes-extended/nagios/nagios-nsca/nagios-nsca.service
@@ -5,7 +5,7 @@ After=syslog.target network.target
 [Service]
 Type=forking
 ExecStart=/usr/bin/nsca -s -c /etc/nagios/nsca.cfg
-PIDFile=/var/run/nsca.pid
+PIDFile=/run/nsca.pid
 TimeoutSec=60
 
 [Install]
-- 
2.17.1

