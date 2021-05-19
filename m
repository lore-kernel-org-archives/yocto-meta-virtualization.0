Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.282.1621462558436092369
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 May 2021 15:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ReOfFy6M;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077372f3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14JMEtOY001073;
	Wed, 19 May 2021 15:15:57 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 38mctd8x1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 May 2021 15:15:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPfmvDWI1CA8NpvuCbo1Ls6+OpHDv0Ib00I2tZ4df5EOO6yiVEqZUxdNNm+Hym/AXBz/X9ciS1oxbcMeO+mYLDcXiSRoTgVXa3OzxMJkreyHf90S57FQ1zyqx55we9YttVsx59a05b69IthwvIA1Btsk2PVVj/eDFZGn0ovXlMR7DGbclZPUWkoY7jYGSwZqEkXuovDTXsfu2DmxHsijd7Rrd9Qk0P41CD0QWy91S81vtmzfREgaxgl23iX0u74oUzmlrwjDcESwupuL6K3TWAGtBgfmp+So00XQFqeWR4Nnv/qqlAdP+DhboH9W2nl58toOcwN/9Lj9/1izIB6Ocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJde9AnzB52/U/1y6mKzxJ/NW4PkQgWPuS9v3PAeIQU=;
 b=h0UqPLcoQxDVGCB8g30w2Peg6999xooYFuS8KcNBZuQsJ7O5jQGY1asVSfYlaoZALe1Yb+qZrAg2lcmQrhbbPkTAR1DG2HJwfea2fWkZxVcOyiOrLQE2hOGDNzsED0s0HVpxvZJ56PtGvDdFXOp0KPl4l8k7BmH6nTwdlOcYvrYvGzBsqF/Q5tTH3V0iFV5QbGuMWN25RaZdhiKdAV6yvZzXXxA3foqgO1TZeiWxLdDJ/ilxcOYJMHMwz/gV5cSTRBBb+Zt1EdeX2aIPrISUw6sxg+VQ9trJPElvSIYHvJ9zZvC/XYms0YG1G0g4exXClMFbMiwKpLV865+d0whDKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJde9AnzB52/U/1y6mKzxJ/NW4PkQgWPuS9v3PAeIQU=;
 b=ReOfFy6MGr+LDIsm5wo6ZYlcLTce3yEXteqtELtAkJtFTKgtO7uzqmMGfHmvKGHW8EKKERi8zD4K0szXOYS4mq3RV0NePVC3w/y+38EWZcYT4ewKRKulJmCbDTNBdZgJR/JfXNfx5lliShsvW9WHuEMlTIYs9Qn5VsChNxiVdQA=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 22:15:53 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 22:15:53 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] crun: switch branch to main
Date: Wed, 19 May 2021 15:13:32 -0700
Message-Id: <20210519221332.289403-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519221332.289403-1-saul.wold@windriver.com>
References: <20210519221332.289403-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:303:6a::20) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0045.namprd04.prod.outlook.com (2603:10b6:303:6a::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend Transport; Wed, 19 May 2021 22:15:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3113118c-8bcf-4295-1578-08d91b13aaaf
X-MS-TrafficTypeDiagnostic: CO1PR11MB5027:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50271EB24A0CA7E296DD71C2EE2B9@CO1PR11MB5027.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rAvf4ng7Ya59EE7606lgFVJcs0p5TU2LiPVWjYwGhj90gMIfpkYQOx0H6Lf/nlmyb18gSyYb8hVSbyV5k7scnUKGYion838eaFrnoh2bgO8lkOdzO1OJB7XhHY3YHcS5Uf8ijf9gZANE5IjGc2g1ejuXWrapwyAeF8or2eo7NSc5KjIJD7Cr75mJ7rFym8Shd8NmEZW7rEwR8FgseKA5XEW/l/yxzQGQyCdqEQaR6mommQX6GxYnuGmo/u6Ucoc3tiY6PJ7JhTkSw1JZm61HZS0tOw62+M1iHmmsAaJsLoITOnVWMBjtmopTmhP819nQwdnst2mkXP0AcxUmIoHaS5Lnv6MdLEAAOebkr1IADBrGTg5qNAW2Hd/H/PZvdiN9kADpmDpTdOcEghNkS1Iasj1Gh9fXUQSLnjWFXJQRHesv9IdK9kUFrogDKG6ThxzhAYFWyNAHCMV5cXvNLeMTOfuG9GiKdmTJzB/3caZdViWcK5SpL1kP5oBsVH3AO79GuTRVY4pfL6R0+1RC9NfHPlYWnI2QyY4v01x4+nbNiGwvhEpVPdi/AR5NIQERtvR8P7RNyZXsaw1TaOwrZ88COi1AJUg+iCWOZKtgmP1Qo9HEzIv3sCsVMTZw9vX0lGpwZgGQziFeDJOQA/WSn/7r7iTA95/7Oz5WwHppVU8rcNQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39840400004)(346002)(376002)(366004)(36756003)(6666004)(6512007)(26005)(6486002)(44832011)(4326008)(2906002)(1076003)(6916009)(66476007)(2616005)(83380400001)(6506007)(38100700002)(316002)(38350700002)(5660300002)(186003)(478600001)(8936002)(52116002)(86362001)(956004)(16526019)(66946007)(8676002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?46fdWZipUlSAWrf8yeqcuKFGIHnjPZ4Mmpbw+1TEb9NG8k8yEuHSav4Jxt81?=
 =?us-ascii?Q?UBTUmF43bFxWBx0pM+86C5a6aVhw3WAYj/aSlWfkUIWw8lbVqTpLVWqOASQa?=
 =?us-ascii?Q?I+TLXF5VnLdhVPOylj4qRvnBlHVm2157GC9znBAYLxiE0JhNW+vosK6z3rN5?=
 =?us-ascii?Q?1wf4Vn4ydqqWfrxSHeVgDeUQD8fiNV5Fw3Bj63YpRu7c0IjBs5tfScruHjTg?=
 =?us-ascii?Q?Ugqcm0FOFLmknC9D1s7cRjdcQ0BrEu+LOt9M6hUATshbKwHimWnscMu1/IAw?=
 =?us-ascii?Q?AWfOlSfFBeYWntQEM47f5Rso4rTDjZ0nTrlz1iufbGxi7m+vfgzI+bB8+D2C?=
 =?us-ascii?Q?s02oc7GvSmjiafmc+xpyxDIKjr4P1cfLbHxW0SPG53p+8XCepkeub5vtZ+4T?=
 =?us-ascii?Q?m2Nfuv8Je9hx4417voBiqEHTw6vB5HfaoMLXG124PWf18tfhK9Giu1ByZ9yt?=
 =?us-ascii?Q?uzXkf3kOeTQIdLgYuskwWa9opzmNqDUbPGlFWgkjyJiurqsPQVPO91xtqJqn?=
 =?us-ascii?Q?avW7mDV3zE9CIfo77rMjCDpXEPuhvUB+V0Opn9rqMGtDQLqXaV9UDaEHqU1q?=
 =?us-ascii?Q?wRZxXdlridEI8BDhufCi4ZxgTlXPWarF1YpDqoKFeISV+ZXG4KSFukFhXyAV?=
 =?us-ascii?Q?EZMr60Q3y2LpZtSnmQiX50r5La0xPd5CWn3noSPRg7TdM/JvwIlkUnsYLJwA?=
 =?us-ascii?Q?5KUscn6CIQsYIztyjdEHLVhkiyxiSYABwyuc572QtL0Qf3rymiLes5Zrdy8l?=
 =?us-ascii?Q?4jX4K0JeEk3SPaEzzsnUIvXELFxXeHgoH9Csn7XvLMXrdB3+i/zKuwnS/Cxk?=
 =?us-ascii?Q?xZVGin4f60/VKQTBAaHy1Mu03Q4cX4ucGTt7MifYKCT9aMdxeksbd4o/7Iwt?=
 =?us-ascii?Q?zs+xwFxTknbPbWFzn3SqpBoghLWM+Z3vzmk/Wo+6iHaMRL2rRlzgyWoBlbNE?=
 =?us-ascii?Q?SDc61BB1K4joLtr7Clp6BK0QtjLy5RbdFbeoR72ncZnrheq4m5xLDtlFlt+f?=
 =?us-ascii?Q?o7ZsyePRmlxkKXkduBos3hJVBFdLdWfyvpzK89C+EbRZRWceuDCwm/Y9iQXf?=
 =?us-ascii?Q?6Xa/UJ6p+pyjUNSUiGHLjkBwuddjUxZh2CZfJvu5/RUNpS+P4nhRdpqXX+kP?=
 =?us-ascii?Q?rfFsG2n/RIe17rzU1PB68ZsO1Uz0NjOiMOJX5j36mobZG/+47rui3mMwNmlr?=
 =?us-ascii?Q?YDMNv1olgvaCc/R4bpZXM9WJoPQMz8WEFrK0u6jcFL8Jng00LXGYr8Trqzmg?=
 =?us-ascii?Q?SCBKPHmJaWiWZbBwhT7VTOCS53LHKjbAJ1MI6e1hDd1RKxq73nGYQ6iFPf/R?=
 =?us-ascii?Q?U9V34aUCvpJz8axon+Ki3k8b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3113118c-8bcf-4295-1578-08d91b13aaaf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 22:15:53.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiOy6r1a0GK3JSUVlO51fR8eXFLbtAWRvqNUXxmpu+fkxoSZl9oEDrVXNwl+iTTZAew5KL0gG3W6gWWbDf0glw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
X-Proofpoint-GUID: bzfGeG_rP9bFakqOKRZyCkEpCxCRqA-U
X-Proofpoint-ORIG-GUID: bzfGeG_rP9bFakqOKRZyCkEpCxCRqA-U
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-19_10:2021-05-19,2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=944 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190135
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Bruce Ashfield <bruce.ashfield@gmail.com>

crun has renamed master -> main, so we adjust our fetching to
match.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/crun/crun_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index 549f609..e463a20 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -10,7 +10,7 @@ SRCREV_rspec = "7413a7f753e1bd9a6a9c6dc7f96f55888cbbd476"
 
 SRCREV_FORMAT = "crun_rspec"
 SRC_URI = "git://github.com/containers/crun.git;branch=master;name=crun \
-           git://github.com/containers/libocispec.git;branch=master;name=libocispec;destsuffix=git/libocispec \
+           git://github.com/containers/libocispec.git;branch=main;name=libocispec;destsuffix=git/libocispec \
            git://github.com/opencontainers/runtime-spec.git;branch=master;name=rspec;destsuffix=git/libocispec/runtime-spec \
            git://github.com/opencontainers/image-spec.git;branch=master;name=ispec;destsuffix=git/libocispec/image-spec \
           "
-- 
2.25.1

