Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF89C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 03:55:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.15799.1653537344167735147
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 20:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=J/4MlfKj;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=214598dbdd=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24Q3c0bJ011571
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 20:55:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=qAmHUa1rNAo72azqOKmTp6dIiBuOOJ/mDHhY16Kxd9I=;
 b=J/4MlfKjUhFFEVET2zaKCi4RZu0ORDE9uUzMaHyOWmTOUjz5o+lw7yVUIwSTmfTndbSl
 P6sHxhWGbMWTglrffko36xIWlnYeUpw1YmivfX0JJCq8h/ufklrIWk5yxHBkJlu67RLz
 j2/prjwehzKNaTKeHDzChME+DRErOM5pLiJq1/tTtYvOINXu8AkP/jwSb+K71ep11EpY
 URKXaYgxC/kGznNkWu0t4EVQvG1PsqxKvttMJaTYlNOBxpRY1YYyxwvPiHejN8vW0my2
 +6jfzn3ckfnCsEMsxNQw/zl+P8P82M+3NAtuRubMyteAk4bfDV6PPQx9oFhk3qPSs63q aw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g93u9s7bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 20:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDNd7OTbsE4ug8VTtIGnBD2w/oZhEWq6Rhoucb4lQ1d/l+/9rDArOdGv604XljUrhqx28sNR6n6V5/MO7g5SwpYdRkjdOhwCpYUqegi3zGuTbKTREZ4U2ScxGQeGG0YoJxnIBvCqCBvKvmIGvNxgGwQYi5h2Sj43bPdHJrEHEXKDd5bS+xdlAapypF6nWuoC3sQUxm774+ZUwmwwDK5qBAst9fm5kn1tN1SB76IQLAaqiT+Hhjq0Ml7fyoEWnuELFTHaA0AQw47DPbwj5UsMdgEf5GFvqfXIOtgnStb1h3iXVTre3lV4u0PYuaI+Y/9jfBYiTcM8ao2hWvJdWhDtKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAmHUa1rNAo72azqOKmTp6dIiBuOOJ/mDHhY16Kxd9I=;
 b=OcZtTJQiDfI1NFsmGddVwO2uheI/Rv8960dslPlbjICXqG2OCAN7nnbdLpc/QUFsZYocwws/984Y9JHmkLsMW4CYD56tGzuWKpFEKmgU2DePLKw1N776Ky4Eq8yCGowx3MmlDiqikZ6vFPNqbNZ2BGsHS1AOW4GDzsOhnyJdlI6SNs392dzQFx1RMKoUA0VQEHSshCPhM2rOvRTNmch+yXbRHJ+AL07ZWGZYvxW64SY5ASTGrFaFBN16MqojB0KXoiitVahvniygm9uRUNrzhcIa1QzYckGBubjZRtTlMTOU90YtpTx4DVUc/4BnfEx8qurNEO0SyJW2E6eI0D2wxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN6PR11MB2656.namprd11.prod.outlook.com (2603:10b6:805:58::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 03:55:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a0a0:842:e19d:e5df]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a0a0:842:e19d:e5df%8]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 03:55:34 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] criu: fix QA issue about shebang too
 long
Date: Wed, 25 May 2022 20:55:19 -0700
Message-Id: <20220526035519.63646-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25e00059-5d04-4f50-87c2-08da3ecb960f
X-MS-TrafficTypeDiagnostic: SN6PR11MB2656:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB26562DA3D77CCC96E24A50A8EDD99@SN6PR11MB2656.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J0G+UZTVv8jF+JvelmtcbBYCrDvovd45EIP2ITQ1IYeBGyOMZSJYuJ3HjYi4fvg9XEcJ+avHlCx0tfyRI+PDTZoNT4+WKf/0LhiUIVAVikoiSfxQegyDQ0XKnOkTRTidGn9NBSHA1MAxs6smUuEkshNn2sLpOTH3+FL2lAFxzRTVDXfUTV8v78qd+LqgRGLnLePD5i13CdsUKP3/Tvet0rN9D6aErJ7+u7wCUTFI8O/kbspISUIuHZsGpkfKuD9OqCYg7iUBMezMNgn6OQQt5s5yDny9sArGumHyemhjMmjw3NPmHv1XcI3E2VgVmpofdrZqOEM84bGPc8TGvVHM3GS44RDOnOPXJBK1rQzyxZYIwSpqSiP4of58Nw0acVq+Y3zJ2eQZC/7xAc8pLs3jOUUBMKT2a2yKKwVuLdsx4Y8DgIKmyYnyPU00rZ4a1IPOHUXDqp8ERpLe/STOqCLR4hSV7epMfjR3o5Ews997mBcEZe3N0sI9hGPTMFLJcANC2nr4BO1XJH5AgEC+sdEyKYv5La343TIr47OLUG6hifsVvz9Ggy6bgDtX/Cy+O25eKgq6AN6WaM5XUWW1xc4RTwAe3X2fkUwF+bco3ewWy9s+YN0zXO6TzEbqQ0jk50SueJXKp0+Z1HJSJACcEjHuBRpNVxOm0BfnnIbxbMIMBBpkY1iVMs9UPDP4PqIS4/WPVU5O/Uc3DAzDBP2smYafYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(52116002)(6506007)(6666004)(2906002)(8936002)(508600001)(26005)(86362001)(36756003)(1076003)(2616005)(186003)(6486002)(38350700002)(38100700002)(5660300002)(66556008)(66476007)(8676002)(316002)(6916009)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w/gm//BfEuIJUXjYKEIH4gQnBvmrFan20z+zX+8RBmiHXIUUmaW9wPrS8eDm?=
 =?us-ascii?Q?t62fes82VQ26C2SppeyFUIGaJ/VAUg7HNI5JQZY7TfsD0gMkD03yGw4mSE4t?=
 =?us-ascii?Q?d78b468z1ki6NXKffKl9gyEvBi5ZkgU+RGqZcu1hMHTUplyYuhp2yAnRFsJd?=
 =?us-ascii?Q?gstPfKnO51ksSyBZJ9P4uqgvlQcEU/iblyvi9ewDkBklv4kn+++qD4tOQQGY?=
 =?us-ascii?Q?wwyzn2VFRWLrDLDFVHVks0IWNk0F/fXbspUFR/5n+/spQMUKFbbDTvKMDvCx?=
 =?us-ascii?Q?sbdT7QzB54QtoHcUaIIHh3UH7hpplMYmKuy+jklRq4aORr8fUDfmZpwLilq6?=
 =?us-ascii?Q?MS8BOioiDMKpEmOVaEsWciIT1+wXKPtUfFwgZzfP51UywA8FRihAK36p5zG0?=
 =?us-ascii?Q?Lee/L/Gwx4W+SrOOcNRqGOTV5H+49svrMhQMmQgk3zQ1vt+xbJIJYE3DZgZT?=
 =?us-ascii?Q?cwaEn2ppOmf0Ux4Yh1+CTDMVPg2iYcjIwwae/ktyEsqEqXBpx7lyUGn6OLqE?=
 =?us-ascii?Q?m2G1iAgL52Yl2A8KWIKkO8teTavVPKrS8gdsw0aK8kZDutnk8CyFAlHZJcKu?=
 =?us-ascii?Q?R54USlvMuRFm645jORdib7pTXSUGkGMf7Quf2OJR2Kl73Z+6DF+ri3AmK1oA?=
 =?us-ascii?Q?cVd9kaLlw7aEiiet2Q0WB+zXeTBME+EG7QdffYpURU1iiRm5cNkl954tgkU1?=
 =?us-ascii?Q?7VC3lBJO17yIbJv+aTPBG8ItNvFc/ZWclA7AmK0vbL+DgC6LAIeXif9U5nyq?=
 =?us-ascii?Q?17thg7yeFRObbZ5BcYFogZQat4yrLuxJyLQSjKXv1MEi7u7JlUu1jTIDlmOs?=
 =?us-ascii?Q?O8pSVb35WtQH8onGxZ15kddghfmre/Q8qKaToRMls6ZgYrW8H7S6oaGGdj16?=
 =?us-ascii?Q?ItlnqqPMWJK827ckeWgrA95Qw+mDUAgFm7DyZy3cG5t+zUaBoWeWrSgg6bdi?=
 =?us-ascii?Q?9kkHLC9hiLxgc4oQXxfE0vgEaDJr7+SdXdc78HRVXRL99YQCF3YNh0DZV4bL?=
 =?us-ascii?Q?IE3YAnxkGHTUkuQKpEO0sEIvEPPidy7ouo+IsOXd6fRAPWXKEy0KkP7X26eO?=
 =?us-ascii?Q?g6eO5Nm8kViobAk3SXjCCrMNaKNRQS3Onz1fFs5ED3ebRy/Ra7EgRWY5znNN?=
 =?us-ascii?Q?gurhQXzeWFpwnHoF4IYLcS871dpwbidhr8jpgn4N1h3V0/Ynzi2eBT+wy+sQ?=
 =?us-ascii?Q?1ZPIQPucPKYTxJk597dPDMeywvc6OxOkmj5wbI4gMrXx0ebQigDP30+rKJHQ?=
 =?us-ascii?Q?eltu5SDg0B016sLNXhgvtzffCoam8qSdwQNccXXJIbSK1297hCwrEplHBcFd?=
 =?us-ascii?Q?tyAmUeff5PHmPZFwbDMlfKk+maQ3VmgqfYRzIQWftvPv/ntg5LXmZRfTBZRN?=
 =?us-ascii?Q?ST5gI46DQTUBtadVdaSafXDM0AD2HTHrkkRUh62XH0T6FikEPqhH+MFzKo2B?=
 =?us-ascii?Q?7OCdK8aAc7EnrvAI+HLRrm5RtWM4q1hRy2xFhP+8K6LAytnUu0wzPgTLLwAE?=
 =?us-ascii?Q?6ZrHTVqcdPc7S6j0ixUSJgcrgek4OKZ8IF2aJbqc2MkegrIS7bEw5Vk5zVQJ?=
 =?us-ascii?Q?dKkxiBOnX8ys3dO9EjsrWays1POS1C0h3fqOkC/Q7AwZ44WxlU67rSeGfep1?=
 =?us-ascii?Q?R8pFvYGQLF3JJ17X2QYjk2r6YHaj3XadZc5oRnDdUxxuWpejKH95qDbbXheN?=
 =?us-ascii?Q?FHzIAgKCByW5iR9UEnTMvZ6pWSUJVim0VavNLxOWFxpvmfPFwjl061yPK5+h?=
 =?us-ascii?Q?Y+9jdO6INmQleX/re42BMTZPgIVZntQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25e00059-5d04-4f50-87c2-08da3ecb960f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 03:55:34.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0BNl0kusit2ej8uDw/gvy68zSbA00NOZxHl8gBYqT/briKRWVKQoye6CF+koGRbD99fIejmM3jIVEITkaGRhtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2656
X-Proofpoint-GUID: 4glmFZ-cfoKwObKyAm2gHpT7FpykD5Qg
X-Proofpoint-ORIG-GUID: 4glmFZ-cfoKwObKyAm2gHpT7FpykD5Qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_01,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=729 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260020
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 May 2022 03:55:50 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7325

There's a QA issue about criu complaining the shebang
of crit script is too long. We should replace it with
'#!/usr/bin/env python3'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/criu/criu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 4b616ccf..77a12abf 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -81,7 +81,7 @@ do_install () {
     # scripts. 'crit' is one of those scripts. The "executable" or "e" option to the
     # setup call should fix it, but it is being ignored. So to avoid getting our native
     # intepreter replaced in the script, we'll do an explicit update ourselves.
-    sed -i 's%^\#\!.*%\#\!/usr/bin/env python3%g' ${D}/usr/bin/crit
+    sed -i 's%^\#\!.*%\#\!/usr/bin/env python3%' ${D}/usr/bin/crit ${D}${libdir}/python3*/site-packages/crit-0.0.1-py3*.egg/EGG-INFO/scripts/crit
 }
 
 FILES:${PN} += "${systemd_unitdir}/ \
-- 
2.36.0


