Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.66])
 by mx.groups.io with SMTP id smtpd.web08.33290.1615191570533053811
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Mar 2021 00:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SlEkjSQW;
 spf=pass (domain: windriver.com, ip: 40.107.94.66, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TN4Jdh+q9O9PSld9aN2uWDNctr50rGV2S2uh4tefBU4mNJGIzcADTFP+YXEFec/fFG9+dA3i6nofNI8y/AopguUvEnHunK3du1R6I7Nbb2bf4c/Nyyacv6ogzsbSmm7Fn6VUD9IiGLaRW6f8JxRAfvLLPL5MoXFETo1GaY/CJwjdkD4mEgA76pBtwRpMzAoEx/5rsr3LHzN1iPwmzrA33unJOVh3bfRPhaPMWsGDV2sd6NrzetCmtIMV6Ote/O0Olr/rRd60+35G5Ps609qTbdKDrT+MxwanFBIZhcXqMC84hsW1pHfTX50Zwak4L3D9PVSxFyhLFqW6yS/NLBxh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FLO6MSeBpVjn6e9rg3YtiBpicDpJndmndzZ3C2+kCI=;
 b=bv/NEMJlQeGU6EcK+1GAS8BP8rGFWOz9cL38d2C6r1V71wCOikqHUFyufT2DhHvFdBG92KPBevAHhzXYVlCp0x1NCPUnUtJwwtGmWpq5y3bD6hjFk7gkkPAvDTIucNrf+yku7CEmP2M9gsjts7E5vCdjDPP/FmnH2Ljvd9N2hsiX6ejKCOJRDIogAJ0J8CcbsG3y89K3tZRrzxNjpIfQtcr1cBAOK+JwfLN16zVKnRPaB0FBekgMXvkVv7OnJ3BtcHNzZEzzaEURqMRigQCvxxgJMtakEvBvKuclpn1ewHUzfG1WKA0Ei6jyYwaTpmomCgpUx+1+v46uoihxKeYskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FLO6MSeBpVjn6e9rg3YtiBpicDpJndmndzZ3C2+kCI=;
 b=SlEkjSQWUZB7o5nwe1g48A2+mL1pcoE+2O9QdvGtpbF04FrukdNiGAhZwFvG6hj3MWtoNgIsGlZvb9iKOjSdtwLTFUCcJArQ1RM05Ge13UsK0ZDUkQNV4+k1jIL/eZnUMz27XQoNjjIIWrX21FuO+b/uer+soDfSD/rVOvHOslA=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 08:19:28 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 08:19:28 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] irqbalance: upgrade 1.6.0 -> 1.7.0
Date: Mon,  8 Mar 2021 16:19:15 +0800
Message-ID: <20210308081915.504129-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:c8::17) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HKAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:203:c8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.23 via Frontend Transport; Mon, 8 Mar 2021 08:19:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abfbbc2f-17ce-4f92-8dd6-08d8e20ae403
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4782:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB47820A9C2574D7F054B4B47EE4939@SJ0PR11MB4782.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9Kzb6G2rNk/vXeBE1hMpuPT13W8gVxsHC+TIcLY00/wWAv53G+CPKLcpAWH4GsdgL1ORGkMf+UR6KkJsW1Kg+1uTM0wZhKeh1WQuL977ZEmMhnNrJzmba3qguCjmnmOrwR6xLOjcCwTTy5mC8jTAJpvGBRjhtV/4L4N6jOqmVI+V1tZoe3ANGD/pzjdqGf/oQXBZOYghmObivH7C12IbbRchwHw8p9txtO3KvlxxHE/ezSs1byHEI/XlQIYE3SgTPeODtrTw+0tuO1jD2kYS+0yMtTF0Waq7AbZ2u9WBOCOULBQAYBkLzialch3RQrfCzlqjxAKbB392B8z5MEy8UO42cvUTWkth40Z4bCkw7xgeqgLSoU/vOqjxs+9C9uLiUsGQ91OHKcJOBG2Olyi9jYIAzv2G+HeCYzhlIbHUK4NXBVMb+7Yvh3p+m4M91B0GJEI05Fz0dJ8ef4AQKR6GvLBUHahBPohqnsEwp0P6QOoT10tBEvt9IwA1rm1G6oKb3Sy3r0w3prPKcG1XAO2leA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(396003)(376002)(136003)(346002)(86362001)(16526019)(66946007)(52116002)(1076003)(36756003)(6486002)(5660300002)(186003)(26005)(6666004)(9686003)(478600001)(8676002)(2906002)(8936002)(316002)(6916009)(83380400001)(66556008)(6506007)(956004)(2616005)(66476007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?1ewgVfcd4yfDPwyjbNN6yEhklaPhqgIVQsfSYnIpKQHcCpb/9d98adcV4LWB?=
 =?us-ascii?Q?QronO8qeubefSA6klt0LPPojobrrDG7pDO9yh/FdztYzvaHxhiNTgmo7elLr?=
 =?us-ascii?Q?eX8YphAnwqNkfz6/1n/k6AzGoDQjd806dqWfNvSfzd1HnEycQzko6yla4bwT?=
 =?us-ascii?Q?pzW7FJ2MLW1/6Av3ILcshFlDEnRl+Q+QWOB3QkxN+5TdLUFva/a2DJDw1i/x?=
 =?us-ascii?Q?hfZVxBtoXTmErkYv3kED5uMLEvGtiKSkxNB5lr/MEJvSF/zyrTyLiyi5BSlg?=
 =?us-ascii?Q?kFaZVrom7to8bHd2iDXsu/L8F+eS4JOiwlJBU0GmP0sjDzET/13mzqMpcNF2?=
 =?us-ascii?Q?433aFSYcJyUao74wfeT3xAxS7lY+yZIXsbKPR/9EacZ9iNVP9d2jN5kQvggk?=
 =?us-ascii?Q?pITROvzlimujmOBh5e5O64NqcfZswy19Uj8ny193OiPZ/ChsVjlgs7CNHbhd?=
 =?us-ascii?Q?Yp9J+6+hA2QsvyT1DXwYwlRPUSbfhK6jMKcAtNCJCnXBI+Qdza9lrf6/H9T3?=
 =?us-ascii?Q?mAB/bUrVHe/FKg/4J9MFesQhzEHHbez1alVZRPEmaeSzHf5NVt6+5l4V3bGk?=
 =?us-ascii?Q?jelTcCJ6jDtXKNwX9OtnaHuZqcplAtgbpeApQEsY3tb5pu4THGq07pmi5W1U?=
 =?us-ascii?Q?KX9PmZDhhNmERmQ2xm+IX2C4F/Rh5rhdHE1rP51NtFIttaqmdcu3bh/eZngW?=
 =?us-ascii?Q?OYXFeizLIX475RVM0XLlpJsGspRgkMfc90tP32G0WCgRzrO+6x6JSq6f/PcW?=
 =?us-ascii?Q?tXbKuKSHdNyXB2Z4kt/LDOq/RaHLQHyWdKvrlnTV+1N80x5IOBpNSNc0FaMd?=
 =?us-ascii?Q?s6i1RDt8v3bPSTyTNnQNdHhKXRpC1qMR0RRVdYx6Kutt/8CaME6wjyeK/ENb?=
 =?us-ascii?Q?DdOWvDa59W0LqlbjDFbnzzp3YDNBgh2xNFckrKfGrRdeGiFfxDAbR5XSVuLx?=
 =?us-ascii?Q?cWYAL/rrRuDzb97YnlwrQaLMc8EmluZh/7rADZz96s9UoSzoUFl3/i4YULbY?=
 =?us-ascii?Q?ly04biyrV+vZo3OcClG+0C/zvZpb0xeOH2OxfKHioozXSglKhGTZqSFzHrPA?=
 =?us-ascii?Q?tIQAGS6JLr4Chmz4uPalTZ7VV1nlPY3ouZsvoEhBFYM5yH2vyxjmfz7olEGZ?=
 =?us-ascii?Q?wDm2tlo7EMkRmlvoSIceHQPQeOuY3EWj0D0UKeu+crzRxQ9G+LIP0cVUHDvs?=
 =?us-ascii?Q?QSowOx/lb8VP8bDb7AynpQXMoUvBdhW1EsZKjyrhgR81X9mjUWm3l0YC50V2?=
 =?us-ascii?Q?MDgaFlRvE9f++ufTs6QnZofFhYhj0AQCpbE0NTv13R85nr1Zji0zOABSl82D?=
 =?us-ascii?Q?/47FHo2y4UryBDtdOi+V0UFl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfbbc2f-17ce-4f92-8dd6-08d8e20ae403
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 08:19:28.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QjaxcMf+M8LEDkN2MB+wJrQZnwrrRXN9NEkTcu766aqjHteDbH1F+8j7z7GT0ad5GZEXwJRzfAFoJoG8Wcdig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Miscellaneous bug fix release, consisting of:

  Strlen checking for IRQBALANCE_BANNED_CPU env var
  Typo cleanup in SOCKET_TMPFS
  consolidation of numa node creation on non-numa systems
  fix uninitialized use of package_mask in affinity setup
  use num_online_cpus instead of core_count
  fix a null ptr crash in do_one_cpu
  make list searching common from glib
  fix a calloc parameter bug
  remove some unused variables
  use g_list_free_full
  remove redundant call to free_cl_opts
  fix some resource leaks in main()
  fix some use after free issues in check_for_irq_ban
  fix resource leaks in irqballance-ui, and in add_one_node

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 recipes-extended/irqbalance/irqbalance_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extend=
ed/irqbalance/irqbalance_git.bb
index 7755e8ea..1a96c169 100644
--- a/recipes-extended/irqbalance/irqbalance_git.bb
+++ b/recipes-extended/irqbalance/irqbalance_git.bb
@@ -4,10 +4,10 @@
=20
 require irqbalance.inc
=20
-# commit tagged as version 1.6.0
+# commit tagged as version 1.7.0
 #
-SRCREV =3D "b47eea84cbb93f533b0cba2f1aaf9ca4da8706b9"
-PV =3D "1.6.0"
+SRCREV =3D "641edc6f5d56f1b3eb8be0fa8a8e9b6a22e53218"
+PV =3D "1.7.0"
=20
 SRC_URI =3D "git://github.com/Irqbalance/irqbalance \
            file://add-initscript.patch \
--=20
2.27.0

