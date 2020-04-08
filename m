Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.51])
 by mx.groups.io with SMTP id smtpd.web10.16039.1586364772383570432
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 09:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=inUoPj15;
 spf=pass (domain: xilinx.com, ip: 40.107.77.51, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGWFKYI2QjTWJj1g61NnOkzmULheRtPsNCERWXzhcmfkzko+fVIfgUNV7dAFykxm0zXus3BvQBZcdz4bDaPO3xGFGCyjxIY+YLqY0r9kIz9D8UH+VPHwSrievT7GPuBOuGDdVnCbeIjrkMC22troQ3pqhOpFG0kwEVugNcih3nBWnWFbWCcSzcrraZDWCKqsISRod6rIZiSnn9AYclOaPckZj8GoxY3dk8zupkAD2xRAClpu+Z/bOP+BqSzmm/gL/Fb6RUcRLRqYCvzrJAJbLw1wpPiGfbt+lJC5BRs4+hD0OS4IqtDB08qh3qcMAsF9KG+r8G1UEEx0rCViDa8mbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wuh1bDhf7YRY3otPG88kU3ZmIethr7TlZcAiHm4FxQo=;
 b=hGuCkTFIZRP/97WNKeQ1jx4ArLa7rJQB3JmpAPyYcnQw19ynf1reauwUtuYXlXkVnrYyZoNIfIccSIgHoZt+JJZpfvSrRZrua6UVL9S0/gP6u2wfXbxfVHRnmz6q57BtfV+mxarrH5ujLD0I8jxcX/V7AdGTWCT54e6ajxLtvu8teUU931FVoAT4KtDeMUpKJkUR59sjyaiuK1Cs/a663d3TLBpk9yXHNO470mxKKNAqFy2nKp1fpL17KY/Kc21+Kk6zGluksFUSQ4z2ov16Lj87uATHYQ5HjQK9Yj7Ty/6dwv9s25SUC1a8Np9eUgBhDMJywFnFC4tBVmhTfJ8wDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wuh1bDhf7YRY3otPG88kU3ZmIethr7TlZcAiHm4FxQo=;
 b=inUoPj15cHjx6b3zn+AuhMGVxF9nmmzzBSb2hi425RJkdeGDGV/CBECiq3VzP50riOyXhFWBsw3XRrI43x+2Q3CT/8wL78Ie11kKLWH9MtbYH2/U8ZnvYchPaH9Uc8NOoh/DA1TEhDy4k4rVp9j6xDTbOZg+sGjjaIDoK7MLQJ8=
Received: from MN2PR04CA0010.namprd04.prod.outlook.com (2603:10b6:208:d4::23)
 by DM5PR02MB3719.namprd02.prod.outlook.com (2603:10b6:4:ba::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.17; Wed, 8 Apr
 2020 16:52:51 +0000
Received: from BL2NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:d4:cafe::9d) by MN2PR04CA0010.outlook.office365.com
 (2603:10b6:208:d4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Wed, 8 Apr 2020 16:52:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.yoctoproject.org; dkim=none (message not
 signed) header.d=none;lists.yoctoproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT037.mail.protection.outlook.com (10.152.77.11) with Microsoft SMTP
 Server id 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 16:52:50
 +0000
Return-Path: chandana.kalluri@xilinx.com
Received: from [149.199.38.66] (port=51368 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jMDwA-0006D7-Mt
	for meta-virtualization@lists.yoctoproject.org; Wed, 08 Apr 2020 09:52:26 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jMDwX-0001Kt-Uo
	for meta-virtualization@lists.yoctoproject.org; Wed, 08 Apr 2020 09:52:49 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jMDwU-0001KA-2t; Wed, 08 Apr 2020 09:52:46 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>,
	Bruce Ashfield <bruce.ashfield@xilinx.com>
Subject: [meta-virtualization][master][PATCH 2/2] go-build_git.bb: go-build: set GO_PARALLEL_BUILD to default value
Date: Wed,  8 Apr 2020 09:52:41 -0700
Message-Id: <1586364761-16281-2-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586364761-16281-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1586364761-16281-1-git-send-email-chandana.kalluri@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: 
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966005)(2906002)(336012)(107886003)(4744005)(478600001)(8676002)(6916009)(81156014)(6666004)(4326008)(8936002)(356004)(82740400003)(186003)(316002)(26005)(9786002)(7696005)(81166007)(70206006)(2616005)(47076004)(426003)(70586007)(5660300002)(36756003)(54906003);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 709319ef-8633-42af-fd9b-08d7dbdd45ef
X-MS-TrafficTypeDiagnostic: DM5PR02MB3719:
X-Microsoft-Antispam-PRVS: 
	<DM5PR02MB371969310CBE42023D467718B0C00@DM5PR02MB3719.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:201;
X-Forefront-PRVS: 0367A50BB1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yMWizRi5SddcVNA6Fl93y7Ef6PscI+xluM7FtBU7RNMcvaSLsIy/x81/oj0kAD8WGPAbCusgm2vP4+plaE699no5LrrNmDb6Z+KlZYL5aC68ZPK33H+Rw/oyDn5WZVS3D/wKrmledwLUKUcZXnYyrUCTVoqYSRPeUzBS5+jHu5DzpvDU+uY5RvGob2qFNV5uIcyx8FPy0QPK+mm74ZGla+nAdxCNpS7ItckjlVfehccRnk6dLW/MrjGzRMjQ+t9rcM9FnCjNMlbXg3i8AMNqdY+Zt3kLRMh4d6Z8lXINXD6XzIhv8NazI8BrHFpfexf0df2h5Z8wqatvVBHaRnpN2TGldpyxn6inZ5Qw6LItcdPv6cWCjhLM/ZWPAwSZl35xi7p9WtK2JPVuKU9/g8+Uo3UVQhh8yLfj/oOEXB6o4Hss4a9aZ8WYLJhZ5buEnhLdhr0MsCsPc4IdIkidz5ah98n3uRUYLh34GBJsSPXR4bqwSk3V1iuNNsXtg/6OmsJTQ66Trg04+4u7Ky3UHHIjBg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 16:52:50.3795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 709319ef-8633-42af-fd9b-08d7dbdd45ef
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3719
Content-Type: text/plain

Set GO_PARALLEL_BUILD to default to prevent the following error:

failed to create new OS thread (have 13 already; errno=11)
runtime: may need to increase max user processes (ulimit -u)
fatal error: newosproc

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@xilinx.com>
---
 recipes-devtools/go/go-build_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go-build_git.bb
index f94a722..e057b6d 100644
--- a/recipes-devtools/go/go-build_git.bb
+++ b/recipes-devtools/go/go-build_git.bb
@@ -20,6 +20,7 @@ PV = "0.1-git${SRCREV_runx}"
 
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "vmsep"
+GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
 
 inherit pkgconfig
 
-- 
2.7.4

