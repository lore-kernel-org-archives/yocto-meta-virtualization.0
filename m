Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.47])
 by mx.groups.io with SMTP id smtpd.web11.202.1588393243547960066
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 May 2020 21:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=RZ/Fyu7N;
 spf=pass (domain: xilinx.com, ip: 40.107.94.47, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lArxwgAIqlAmVzNVpvZLDgAPlcjTrTbRypQLgh+jeNzScUDW+Sh4MyS65gJ2KJuJXiGIPgk9kaDT6K7x6DUqxx9nrvcX+JZY62AwV+l7G8Lp/QKwgYD/Rxcz9Nr7VMuSApHF8GAS4chfF48GchYzDOIkLf44GPlxZXdnVidNJO6NbNIFVTLGfZbx7f5JX2j20syKVygovTq9EfhdaNO/BvPygQ0mPpzCWuwLPCBHgpRp9/LtPLHF/NNjAZYXXj76IHotEepP1xw1rFTFcEyPXpukoY7jNWa2C7/48AhhPXSzBECz2dyHxkg1Hvfu7MOpqdIT+cBWyxjDfQb7Ll3lJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjEFuXq2YKVGTIAAi9Rbm5z3aoAcU8DDfpv4b4e0DYo=;
 b=mSemLPzjXi04v56LtmqyoMM0Dj1neZdF8950eSqYeVKBXCVIZFBz9F9ZXMDNeDFB1PMmAjfUz7INzESRwC5gvlIEOvsP77RTMwN4Z8yaC2bUm09IDKaILhDB/mTthmCYLlEUr4z3ttW3aahYzoM9LobkmomKS4NxeAjMbfB9DI2AuBhO16QKlDVSOlk8Y/yF35BzK5Em2q31uWZiypU4bCoyngEixTlmfsf3mnvHwkeh+jx9pcrgfyHEqjdQiaFjnB+84NmuSmna6cM/ju0fQO8ZBi3ORlqwxjFz5B0VZB7Pth92ARxAXIR0BrrXPD7miVHxpBpPknOJ4aftnzaUUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjEFuXq2YKVGTIAAi9Rbm5z3aoAcU8DDfpv4b4e0DYo=;
 b=RZ/Fyu7NIffpkyjkKTxBg7TWapprdhcSbiP+r178lk9cmu/oC/wWjwyINHdU4gBnz5TPHr9uxuS0qzvmkyc66Mb3prSNzqu5NfTSAi1iAuWKSM6Ju7rWPdPv7gXmahWwP49IS0CSBgSxf7G20O54uVHmhCgptayhrJSKFvE3Q44=
Received: from SA9PR10CA0014.namprd10.prod.outlook.com (2603:10b6:806:a7::19)
 by DM6PR02MB6732.namprd02.prod.outlook.com (2603:10b6:5:219::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Sat, 2 May
 2020 04:20:41 +0000
Received: from SN1NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:a7:cafe::52) by SA9PR10CA0014.outlook.office365.com
 (2603:10b6:806:a7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Sat, 2 May 2020 04:20:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT044.mail.protection.outlook.com (10.152.72.173) with Microsoft SMTP
 Server id 15.20.2958.27 via Frontend Transport; Sat, 2 May 2020 04:20:40
 +0000
Return-Path: chandana.kalluri@xilinx.com
Received: from [149.199.38.66] (port=50777 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jUjdm-0002Ni-3v; Fri, 01 May 2020 21:20:38 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jUjdo-0002Bb-JI; Fri, 01 May 2020 21:20:40 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may be forged))
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 0424Kcd5031955;
	Fri, 1 May 2020 21:20:38 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jUjdm-0002BR-Fn; Fri, 01 May 2020 21:20:38 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
        Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [meta-virtualization][master][PATCH] busybox_vmsep.inc: busybox changes for runx support
Date: Fri,  1 May 2020 21:20:37 -0700
Message-Id: <1588393237-11939-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: 
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(70206006)(47076004)(186003)(82310400002)(4326008)(426003)(26005)(2616005)(6916009)(8936002)(70586007)(8676002)(4744005)(336012)(356005)(107886003)(316002)(82740400003)(7696005)(2906002)(5660300002)(36756003)(81166007)(9786002)(478600001)(42866002);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d471308b-589b-4653-a244-08d7ee502c9a
X-MS-TrafficTypeDiagnostic: DM6PR02MB6732:
X-Microsoft-Antispam-PRVS: 
	<DM6PR02MB67325EB6F76ED7FBCC6763CAB0A80@DM6PR02MB6732.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 039178EF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X0fNUzm5twhSC9haCO+q5rus6IRLeEpArJKEOGAfRQ0MwiXeevFjt5s6wtWQka6WLc87GpjwDbUUPXDfzc6vtuRvP28f6Xr1ZIKzsHyt7xpqEsepE2ly5eGDcN9uoADRHrq4z4BVWVfSBzzzaCXA2nIZJZGnS8R/I4nZeLC3yJaSxR/MohdHFxorhqJdaZ2RRxLcXWAQyAgOEQGVOjHaAOmFRUBYQH7EVEGewzy3o0Pr04ppCPbW3rbKGq03XW9Z0h0mx59+SS3pDxYG3kWyQy6b64SgFzdg1TVYKhicQCwSMhSTd9hnAnGdmEIek64t+4uXbHm1O8TnZSlf5pmLsJTzZNq8DGkbTRIJKVrVYYU26kZzMJloO7eMt4Y1ooGdz7U/i74SUlCHnNFdlyINA4Ytwy0F8VPvWrqo9knEvFjLT03dcnn+llspzrnMDviRm+jQmj4o+sN5LH8MLo1hNdGd+Nb6eE8dd7E26EEhH1uKotpHqvP3JDnN1gU0m676GKdqFzz/cEXhWyn6Qp5O45ochcK1e6ikGf3G3c5rDYs=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2020 04:20:40.9230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d471308b-589b-4653-a244-08d7ee502c9a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6732
Content-Type: text/plain

Runx needs busybox static binary that contains symlinks to mount.  However, in
zeus, busybox by default uses BUSYBOX_SPLIT_SUID = 1.  With the variable set,
busybox binary gets split into two busybox.suid and busybox.nosuid busybox.suid
contains links to mount while runx recipes pulls in busybox.nosuid.

When vmsep is enabled, set BUSYBOX_SPLIT_SUID = 0 so that an unstripped busybox
binary is generated which contains all the required links including mount.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 recipes-core/busybox/busybox_vmsep.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/busybox/busybox_vmsep.inc b/recipes-core/busybox/busybox_vmsep.inc
index b70a065..d4b1e6c 100644
--- a/recipes-core/busybox/busybox_vmsep.inc
+++ b/recipes-core/busybox/busybox_vmsep.inc
@@ -6,3 +6,4 @@ SRC_URI += " \
 # we do this to get the target binary available to recipes that
 # depend on busybox
 SYSROOT_DIRS += "/bin"
+BUSYBOX_SPLIT_SUID = "0"
-- 
2.7.4

