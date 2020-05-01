Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.53])
 by mx.groups.io with SMTP id smtpd.web12.4642.1588308759624428937
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Apr 2020 21:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=ZeAk6Ijv;
 spf=pass (domain: xilinx.com, ip: 40.107.244.53, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfLdDdTrkUpGnv5h70Xpd3RETuserQRtWq9QcLNKVhN1LqztUwww5Y7UXGkYSUSjs+6kzcq3A9iVrMUNKycGaBItmudA/8kEh78qLAJn4/KBr9f/2J/wgLSJRn44sevpsOog1F44nQoAFxcbjeO0IE6tkfDSSu67YwpBskdLpGeWMnGEdYUEvx6WCGDkNhhvSK7LXXEvNavEq6E9CtCvsKqGtDb+paryY8wK5JfWY3Unj1142Nx49cDf3U8opFl83a7iArUl5EioTPBUfboB+ZWvtJX543Ocncypex3ZNbfs9Lz7vyMbCPQoWizv86avNne82OaY0snX6D8pHq6bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0N6wzrqo375F0ShexH7lVYLwr/7mif21b00kShZsizg=;
 b=UeAZE6FaYiy22PI9bz+7Grwhr2pRQg0t9ShdWriucD3CKWFklRODaCNI48BA9zNidexdAOgYMa93d6vBM5SGpXBUfzVtpFbyLkJ+tL3/WGOtJ145FGpmyCZ+tk9r9vnfCtEBkG7T+F+6tOJ3HyN2mf29l5I8ANORQ7KoP2ZVBX5y8/fkMdK6zb5e4kwNJMSVbd993duauRHjZCpehUicik7K2nsHhRHiqcRV1/HwvQwWSeX81UQXpKzhMpdNS0RVQ1A5MFzFJdqYGHS3LEytnZL5B4DfCcFUXoajz0bLhd24Vdr+77HM2lEeXoz7n9d2eXqaINPUaPLw04NqIRhdaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0N6wzrqo375F0ShexH7lVYLwr/7mif21b00kShZsizg=;
 b=ZeAk6IjvGcyPPAE2PKKx/4xO5QGdvs+JA8oAzhkN47bAK9rplDX3LwNYtkrdDb/OfRdn6XXjWwlzD+bpgYKuyMi03hDMQgr7O0XDLw7yKbryWEnHExb2/sG0Xqxq7mpaqC7EDfyDofd1m/4nil97jbRSwqQYGVEp+WqFfb+UgUs=
Received: from BL0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:207:3c::29)
 by MN2PR02MB7022.namprd02.prod.outlook.com (2603:10b6:208:1f4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 04:52:36 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:3c:cafe::8e) by BL0PR02CA0016.outlook.office365.com
 (2603:10b6:207:3c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Fri, 1 May 2020 04:52:36 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.yoctoproject.org; dkim=none (message not
 signed) header.d=none;lists.yoctoproject.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with Microsoft SMTP
 Server id 15.20.2937.19 via Frontend Transport; Fri, 1 May 2020 04:52:36
 +0000
Return-Path: chandana.kalluri@xilinx.com
Received: from [149.199.38.66] (port=34134 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jUNf8-0005nY-Ge; Thu, 30 Apr 2020 21:52:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jUNf9-0003FB-Nm; Thu, 30 Apr 2020 21:52:35 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jUNf1-0003Ea-6c; Thu, 30 Apr 2020 21:52:27 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [meta-virtualization][master][PATCH] lxc: Update python3.5 reference to latest python version
Date: Thu, 30 Apr 2020 21:52:26 -0700
Message-Id: <1588308746-14653-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: 
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966005)(4326008)(36756003)(26005)(4744005)(186003)(336012)(2616005)(2906002)(81166007)(426003)(82740400003)(47076004)(15650500001)(6916009)(82310400002)(316002)(356005)(8936002)(5660300002)(70206006)(478600001)(9786002)(70586007)(7696005)(107886003)(8676002);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cf506cd-bcc3-4afd-36cb-08d7ed8b77b3
X-MS-TrafficTypeDiagnostic: MN2PR02MB7022:
X-Microsoft-Antispam-PRVS: 
	<MN2PR02MB7022FAE9EC3775D7E89DB2D8B0AB0@MN2PR02MB7022.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XJVVUGuO7EpeYtvKSFmNEN23phl2+m9BEIoJ9YKADSuIxw79VL3jEV1U6r/PSXvDSJP+fe/wH8YzafZ7YhZCPwK7O4BUdPYuSU+YeoQ1rNJm05Tx5nBFlr2wCV2AsIj8mrOjXj3itSwFlSrbYNjwEN5JGvSrvyjde2Zm83QA3zl0OvngmpFgycrFfEQ9NF6vnuCkN/PcHLRd55YbHDQ+QV3e0fw8oWy/lul3KxG3OlDpcZIVyBXGuXfNtWV81RIsTM4NqUMjdiOMTQmA44EK1+j7SN/dzTYmpQftgnoe6UHEMPNd0jeZwvR/hosoPddbaFvhnD2Ft0GGGuGic87eZy2vjzF55zKaYFtkfJio6GLdy8nhmFgO2syBgrqeeG5D2Iob2vshc2lV4rafxlJY76YX8BtcR816kXZD6lvxMU0v+hIyp9FQwxi2AUuWIhGMpJRcrmlFuml/o2QIi7DtoOabwr6lCqnafywKd4LuRliYjLF3baah3rDLHa3fNha3Hm902M1JzMJ6rEDOw2LpFw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 04:52:36.0645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf506cd-bcc3-4afd-36cb-08d7ed8b77b3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB7022
Content-Type: text/plain

Python3.5 is no longer supported, update references to latest python version
using variables from python3-dir bbclass

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 recipes-containers/lxc/lxc_4.0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
index bc7f88b..441cf96 100644
--- a/recipes-containers/lxc/lxc_4.0.2.bb
+++ b/recipes-containers/lxc/lxc_4.0.2.bb
@@ -121,8 +121,8 @@ FILES_${PN}-networking += " \
 
 CACHED_CONFIGUREVARS += " \
     ac_cv_path_PYTHON='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
-    am_cv_python_pyexecdir='${exec_prefix}/${libdir}/python3.5/site-packages' \
-    am_cv_python_pythondir='${prefix}/${libdir}/python3.5/site-packages' \
+    am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
+    am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
 "
 
 do_install_append() {
-- 
2.7.4

