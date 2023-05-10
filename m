Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A295C77B75
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 02:30:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7413.1683685810923759643
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 May 2023 19:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4494c1eca3=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A2LxF4021972
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 9 May 2023 19:30:10 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qf81js9b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 May 2023 19:30:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfoYEvM+8AbD/lCFCyszsI4aHhhR4JeDplZoCMLNoQXqoVdCT6GQ1mUFbIa937O0xwuToKIHzSk7XRsPjjD2t+GUtKRMWQYJ/+MXNn3lB2kBhISMvczrYya4/fr7oQq1s89beTm+q2X5wlHphJ6KdDp51xkMa4RFECXEQZm4hOJ7vVwB8MbHfStNyo3Eez03a6Auc2+l/9SEFUlO0tkeO8d/WZUrZnVUXUx6uPyqqKamPZvhkyBfaCzgE9fdJeo9RZ4HSc3RFuOQWhgKKIxGM0IeW1TBkYgHahC0jYP1pDU4XlfIEhlN3Y1GDfmUE2EhfIc+5Ry4V+RsaLd+N4k/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhQ7emvxOIP+CeNVU4vY0BPryu5dl/l8IFhu/QlaJtA=;
 b=e+YkdnOVZE7yEOhdzJBrueJTk/Z9zqVgMW9vAHTIWmOTOZDVHAHR2aDj816BxC1S41H0MDuHCdx1A/7sNDqFCNXEAFkuZOEsC8GpXBqxSbKiVmFjaWx2GMD0jL0S8HnHMqLJG6xROc/PLTuA4eLg3i/jSctRb/leu6mjddp0CLUY/VsLrD4lJZ+f8xoDhOEy6oDFFY0W4YVI0EblYfj8edPG/CfBagL3XTdTfWNNV40Y2KoEj56LfeLjP6ZMAKh3Juk2Roq/yek47kS+TXL2wePJEid9m7O2nfjYRRLj8hnFc3OAlXooIFpa3w6AeCg6EIcNY50gwzyLwbGX3aQu/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 02:30:08 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%6]) with mapi id 15.20.6363.029; Wed, 10 May 2023
 02:30:07 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][kirkstone][PATCH] xtf: chang the old override syntax
Date: Wed, 10 May 2023 10:29:46 +0800
Message-Id: <20230510022946.2327496-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYBP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::29) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4a2b9a-4157-45a4-5853-08db50fe77ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SAhzxbI6HAFun9wTg2HfPztAqFGqNIYkCYzGIVYLc4Yl2YWMMgN0NxvhiocSBJUim84//dtGwAXcnaQeLfNrHK6wQeZsPss9voovt+qDyyeusJKii3qtDZ31lMIoG8i0NFdPCptPE2Z44Tscbg2GuQRLbjDRGp3EQ9ABq6I4f7rSDtTVzdE1YKsQvJ4piQ5M9TMkNzwjFS1wlwLWovlB0+zgh0pLNiMP3qN6uXUouk25tS4E2WRaFaaByrHmWAj9/R+FKWUECdWyMbzwSTZtGoU9Z9QYqocI2kJRXTG1c1gs3+m1RnFT0c0n8Q1Qn4AefVAxFkYDHqL3H2frN2HTybtOuiAHdb2qEM3YF5n1+DOsL+ii3emwsmW6S91zta8MjnM2d4UPmAZZfIXNvIm78cWD4ehXakhrtvun+D7cm8RaZuoZRadPD++occBqeiM/6lntkpdNFnBnzDBo/IsN4CqaEmf1rAJZSsEt/0ZJCVyoBGpe6zIBmEP3AlCUUoBxnjfkay9QUy6eFW106ia2G3jxpyGy55k/iEsmLGUMHICiKNBbWfapO7c2ul6dCZ7ppiH2zGwKhR8XCpAwlA6UI+dPwyMqubXQw+7KfKZRG7SwcbYqsFauJl75mJUyAF9g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39850400004)(366004)(396003)(346002)(451199021)(26005)(6512007)(6506007)(1076003)(38100700002)(38350700002)(83170400001)(6486002)(52116002)(6666004)(2616005)(83380400001)(186003)(44832011)(4744005)(2906002)(66946007)(66556008)(5660300002)(66476007)(41300700001)(478600001)(8936002)(8676002)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l4O5jGe4oapTu8iiSmRmay16D9XrZx0LfFF5nxnSyyLO9nKsA/aqi39Zf8nt?=
 =?us-ascii?Q?Rw54fUAL8Lm5nyqYR3tu6QtmgmMCrUrGzGf/P3hCjp5FTdMi3mnfIWEbkGtV?=
 =?us-ascii?Q?o3JiqnQTyS0vEuJcP1fR8bIEFdFMhRLlKun7Dm89PQkZ5UQuQhYTkXIVYEHt?=
 =?us-ascii?Q?BvYKr9T9xoCefy0wwDRtmzAJzriTpv/LkEeWo6/l68Q0QUkBdAbZEmFwvDhx?=
 =?us-ascii?Q?E0m3/NZJqiAWx+nT8ROrkZTR8skvuXS0ktsfHjYi46oCgnaf1ErkIsUfdPoD?=
 =?us-ascii?Q?zb8em3B5AYRJLAy5mMaCJFHwadpz/OQk8T/pr5xSic2gQ+fvMTkFsYy+mmUs?=
 =?us-ascii?Q?4YUP6Lhu310Bf/njJpVSH8Sm/4Ta4T+a3HDlMufm9IRdD8jtungqSTgcv+Dc?=
 =?us-ascii?Q?lLqy2b+u2MzWqkAi9wuEL5l2wwFRrTE5yFglxepLWKICKcj3SHITgQDtsSue?=
 =?us-ascii?Q?0dNdHu4i57Hklf6DwK9dIw0RAwmCp5l7Zp8O0tD2w/9ttg9PErw27s8rQWzj?=
 =?us-ascii?Q?/Hk6vlOUOoBNJ9uQVlJSvuVrdQ3t7siW+9iMrN+ENmwQXnNYKEynrKi/nXYh?=
 =?us-ascii?Q?pMXUotrSL3XhBQ/j4ZTMK7L8txbT+fXPgq9fCa6Nhc9jp+PlK8tP+b1EbTI5?=
 =?us-ascii?Q?IfUly6FdUQyw4oFCg22Zd1agMsCh9M5XsxTmSGcUua9A3eyLC/7OVS5Z5dIw?=
 =?us-ascii?Q?N3xrV9nibGnc64BEj+zqvYcSpZEXuscC8JGLi9+UPoWCr2JQ5ynHzMjtpd+s?=
 =?us-ascii?Q?HoBHXVHQICYhR0BHeZ4KwZSrZEIlejs3IMCugVsBwrXEJr1NaPPpWr6QrQ67?=
 =?us-ascii?Q?GVJ3RJbll70JI2monQM6JED+Ln3/e8x1B5VKg5S+cAT1jOCkvrr9a0at4Igl?=
 =?us-ascii?Q?7UeuOAV1dlUVOu5Ml1AAGk4v/a3i06/6YIs44G6nwt7H4z+aPxTY6dWrqfcM?=
 =?us-ascii?Q?vRn0WdXfeAliaG85H8y7ZUVzBMF44a3M8g/FRYb2gHDxQiDKYG+ougM2LG2f?=
 =?us-ascii?Q?cX+udJw9WkqhIs7WuDhmLJqUlTr84AT0mINSdcmVKSq88/Opcvqa+y8PcCUN?=
 =?us-ascii?Q?jl933aat+Jh273QG4fiFEB6eHZa1VEhbFrQLrhMjUbZxQGo5YeVWVDFucO2l?=
 =?us-ascii?Q?bJwdR+FDuneM8a8ODQDlVbuIqFZGoMI+h2hb4YVUI4Wk8Fl6FbfzcW5nbM6x?=
 =?us-ascii?Q?9/ntWh7vzH6sWJPXbm/I0eOL88pDA3adh405YkU/8f8/Z64nFIUfGP+bPRwc?=
 =?us-ascii?Q?b0NTV6ZAoxboV8Ztu5rXZi9a3ncyYq9iStiRR0Ql2ztLs6ya0DlCCa0Fv9+m?=
 =?us-ascii?Q?daVxIe8GxCU172cro1gAnTLG8vwS61DXQvSkPRzRxzJJoTBk8MtFC3dbrahf?=
 =?us-ascii?Q?MRG+3dsyix0B/ZGQPW0fGofdzykVX2DmV90HmGyyZWvlCnrBbjEr/3f5CHyW?=
 =?us-ascii?Q?3wAW4PE9Y6TccQkB/rCeSFy6P44kmvpvfyxSXm8I+kXgLggKBQjRj+NwJFSg?=
 =?us-ascii?Q?KVqHmLMmtFHHBUX15jkVIHrpxAdmYr7ZuUHvyIu7DFGIvduzG685oGxHewad?=
 =?us-ascii?Q?JHtLJ7lvWkBJwmcGT8HTGs79rpMQKl9voqKrAEhkqSDDZozlRs7NgTTGslvF?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4a2b9a-4157-45a4-5853-08db50fe77ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 02:30:06.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQ7RVO2a5OCeshiwBQe7ByTSi33Ac61bkKogmgEF5buYWW7YDKXmrmQXKU0s4PnCzHBPcs3dU4ozH7xH6A3OMlBSBHvZB1N08nMOX/dLXpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
X-Proofpoint-ORIG-GUID: pJdZV5sDzsN_coItHEojfRzmMOP2fUVS
X-Proofpoint-GUID: pJdZV5sDzsN_coItHEojfRzmMOP2fUVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 mlxlogscore=801 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100017
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 May 2023 02:30:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8048

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-extended/images/xtf-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
index a78959d..f9ecea9 100644
--- a/recipes-extended/images/xtf-image.bb
+++ b/recipes-extended/images/xtf-image.bb
@@ -31,4 +31,4 @@ IMAGE_INSTALL:append = " xtf"
 
 DEFAULT_TEST_SUITES:append = " xtf_minimal"
 
-QB_DEFAULT_FSTYPE_x86-64 = "wic"
+QB_DEFAULT_FSTYPE:x86-64 = "wic"
-- 
2.34.1


