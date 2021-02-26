Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.72])
 by mx.groups.io with SMTP id smtpd.web10.3545.1614303859633259332
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Feb 2021 17:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hmZKzMQP;
 spf=pass (domain: windriver.com, ip: 40.107.237.72, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac36S/Y2/QHNDt5jl6wzDbSbw0oIJO0FhBSfLGjsjBWwbr2U2PQt+Fd3iVwfqfVVn5+pD1WRTwWUVoWX4kzjbeLA65XNCJOpHWAZGMdndqatpbKr+SGODU6AyFGIRcojvexMGOAOGi6vjBFZ5OJyGJqVwDq5iIkOO9vtuzR0ySFPT+fkJBXJDnj3Wri+PAqp2yPTdxzif5lyBA5J0bTjc4KAV51rQaQVHgZx29VhIz3bIK2QDwVqRGz0sIME43W8UJVPeP7CJ2URM+iJ5AV1LeHa+ceelqnCRqZzvZ2/tc7utxSd1WbOJ7M2w+LUTUTjIhHQ5b8s03QX0i7KB5op6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grhXK5MarichFcFIVY5qyFe8dSRqU2YhznkYlcZp6zU=;
 b=aHmUOuIfd5iyeYBmpb9FrH8pTyYoVqVR4ARFwy/+3mWe6ab9ZlWjk90wlppXECgZsdO4fZq9gvPtJ5qEXp+8maEDnAbCDwMOPr6x6xOkiTv/EgWHP9QKmmG0rj+BJMdX940ruY1/3B50j2VYhC24nEFvYwUJEW6KCVK52KA3XhZwsBmv6evWoJIJZ6ayTQOZirk1WBpKvgHZTrbbRSxUWDMhOkhNUki1wScOFUSHnAJp8Eazef5okW63tamLZra4iQouB2K2ohnpVJQu1rnj3WfVSRyizZSIxeWyZlxqTg7A/hb969ocJhjXLbim706NWi3uzcSh44VzabLDfgnneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grhXK5MarichFcFIVY5qyFe8dSRqU2YhznkYlcZp6zU=;
 b=hmZKzMQPgRH4TmfuB8kgrJHc1YTO3N0QFJpyNRyr2OYSkiyw3wUfqTICzI4UG+AJvaLQEGIP8lmHMfplSeqglCWbGkcCwHIVVCm5SQA/Tc0OtWcsoVEssTD5mdmrkDL0mJC00/0ZnJ9W74TmhjrS1LpHmb648G0McmVLPhlaRFE=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by BL0PR11MB3012.namprd11.prod.outlook.com (2603:10b6:208:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 26 Feb
 2021 01:44:17 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::dd39:cdb1:4287:3fbf]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::dd39:cdb1:4287:3fbf%5]) with mapi id 15.20.3868.033; Fri, 26 Feb 2021
 01:44:16 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] openvswitch: set CVE_VERSION
Date: Fri, 26 Feb 2021 09:43:56 +0800
Message-Id: <20210226014356.31274-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:c9::20) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0033.apcprd03.prod.outlook.com (2603:1096:203:c9::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.10 via Frontend Transport; Fri, 26 Feb 2021 01:44:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 354c067a-b28e-48ad-7d26-08d8d9f806e3
X-MS-TrafficTypeDiagnostic: BL0PR11MB3012:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB301242313FE5EEAB733F7D2FED9D9@BL0PR11MB3012.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CaImHJzw45Aq1KlAED6aQmGrfLlcG+vbHTlOzpYSKB9t0CP377NXxEjWvL7NN36xsiuLCMJES9UwcjQezd68lV7ZpuM3Rta+E2QeFNdgJIqU15kMwdmNMShGfUTQ0n72tcDgQQ3/+tHWSLTLRrVeWat3IpOsg2ME/BEkVO90sTNcKTjnCoflyvqkppUoXpqOZAbBVzrjU1G8YOk5rymxmHOx/H0omCWkx6VVR1kPtQ48VsXz69zTdzE3sTpn5BHF8ItLnf7kottLFfkXUg2j3S+gKBfHkpi00Pt7C43fF4UPg/farC9/cHfX8+WAmz/EZqu95pMtoQ+warRwWqtBRQlz5QH/aTkEswgwKSuIHIbBMtIiaG3RICxpjsWwJn8aeNTEWHC1vIGQZ6AiWIMfVXUV9FZmvqMO8G5alvW9XFOe4i/L/y852BEmT4+mU7wfN/SmvIWAI+cCn7DQKoDd3ZzxDmbC/3beQJYO1IMpMBUmymHxTjI6oeSNFSp9VoVVIf2PuilCS+4BwSQg4i1OBJseGEQYepS2nBlR4ngzlJyMRkV9G6ZrlgWWMl/U9IMj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39850400004)(366004)(2906002)(4744005)(83380400001)(6512007)(66476007)(52116002)(316002)(6486002)(16526019)(26005)(1076003)(86362001)(186003)(6666004)(66556008)(36756003)(6916009)(956004)(8676002)(8936002)(5660300002)(66946007)(6506007)(478600001)(2616005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?YE3wVkKEk0cz21YgKPprEAd3tRNMsIuBuHrVZGs1LHinfLWVHxgxxip/YF2I?=
 =?us-ascii?Q?dirir1gzNn6ELj0jetqSVVLTLGx67m+Nw6n2l7rGJtq9pTwTyw3cWXKf2XWe?=
 =?us-ascii?Q?XL+O19ib1wtJwui1SKIXGzg4g9FMWtWhgb5LHklLwGGmqBtsYyTjD3q8Vclb?=
 =?us-ascii?Q?vlLxduMEFGmMeLcCkyR1N7AIOA/7uUfvR0WVplGvLWAZniQzCya6D75Fthzc?=
 =?us-ascii?Q?MJviSdazQnaT6Bh+lJsDG+z9Kt9XPdFIJ8KkostwQDzKiTrPwZDKkfE/Ymgv?=
 =?us-ascii?Q?llM6rnVoxUgw6SUgvjhO/GLCg/qUiyqI46UsfAThtOo0XhJ3VjdHjIvaXUDS?=
 =?us-ascii?Q?Ay+c+ZIkXB0k8ndK7VocaEx5RjAubm6sfyaoH2dgYbTpKRuLpOdf/SxFVtmk?=
 =?us-ascii?Q?iqXzGxUPTYpuPT3tXaF1NVO8bsea5yVn24/B813u/coDbpXObb5iD/ReAGpp?=
 =?us-ascii?Q?eQ1s+ETubaCN+wbtnG6RKXPT///op4ABrQmU1c01Wr684qrbO4DRJRndVyCm?=
 =?us-ascii?Q?I9neatoudv2dj68oiuXvpGCIKwrV9i4jXX+hA9HZEgxygROJ0ePiegI3P/vd?=
 =?us-ascii?Q?D0ipbiov7QIy50cPkijDBJ5fejHdtFQS5ESSpSqverYYSRQ4tIkdL0zsWyZL?=
 =?us-ascii?Q?63BE1mtJ8nQoNYJk6R9xyiE1OPAzjriC6kUTo870S3lGaGpLt1C9LeO5T+5g?=
 =?us-ascii?Q?atOfW6i0v5fC/CDzYir13+TKI3PtChzUQO+WzTCG0fQBOereEd08lcJPRI7G?=
 =?us-ascii?Q?G1Cco/9q2wDNlRSbU5/fXHsgdx3+CY7SxXefo7PnKLbWdlw+QTNL/w5c4OI0?=
 =?us-ascii?Q?yFomslakJSoz8MXrKYz0VT07JvTuX0W6mVi4kjISv6t4nb5m/LlGgJxRCbg8?=
 =?us-ascii?Q?DT1+QrsUBgaAOWHzbIpFLe/qQvtKsTosUGylgde/u5Z2FenpUMGRMOcWUADU?=
 =?us-ascii?Q?ryobtge1vbcUTIDEUJR34UDuaqyGYn5Kof7Tg4vDRgeBYopk8IPX2qQG3A6d?=
 =?us-ascii?Q?SmcwjJFb4TZPp08I9bsLEWBsR1BT8hYwMsgmFp56rfdgbku96brj0/EKItyM?=
 =?us-ascii?Q?tJLSccVjM1KNs5NhLh0eIf2S3HBJ+/xXwTG27OIIuTKD9T0oxH7pYYkfW/s6?=
 =?us-ascii?Q?JkeDarHWGFTm8p43F/MoP7Xtz0+5nqpaNs7AieEWqg34qh3weN+ZBVl1hN8w?=
 =?us-ascii?Q?gl46HCY01vcvP/Y/SxHBaWb/pOUJCxYOaZd85ebE8ofXlrxaFksleQyZC6bj?=
 =?us-ascii?Q?RdoBo80ioYj042Ievl4gQVgcOKGCO8kW8KzBmjyQwllJpgZPdXP4N9LJ3e27?=
 =?us-ascii?Q?WSDoqmYZiSuINpQJADC3+jUu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354c067a-b28e-48ad-7d26-08d8d9f806e3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 01:44:16.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZTHt+UzIY9Mky+8hkO123d8rskcQ8u+xKeRG1h1Gba7XbND+SEPiJQGqKK2gCBVgMcFgNeb+vOSsXeCS13zcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3012
Content-Type: text/plain

CVE entries are using version 2.xx.xx, our PV is 2.13+xxx, this causes
problem for CVE detection. So we need to set a CVE_VERSION for better
CVE scanning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index fa1ec4dc..60aaf496 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -15,6 +15,7 @@ RDEPENDS_${PN}-ptest += "\
 
 S = "${WORKDIR}/git"
 PV = "2.13+${SRCPV}"
+CVE_VERSION = "2.13.0"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-- 
2.17.1

