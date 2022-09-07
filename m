Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFF5C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:25:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.8431.1662560732867634160
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 07:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AaQQEQib;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62493dea70=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 287CR2QT020575
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 7 Sep 2022 14:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=9kS9cPDJZO2Wftepi+ssvjHRAMlpnZcBxk5Gu1J773Y=;
 b=AaQQEQib/uVOcRQUlOVNQ6hG0BVM6fu2xV0mBLQahDpeMaF/sKZR+nStjWkZRBMteMgb
 TjpW/DoxbyvD7CZEeMnCRYMQkoWR0F6myp0cKUDmRb/6lbrIRswDsJLG62vBSjDRzbAR
 1sa1k2S3apfLOOGfVEdl8h5yRnJcJCrP9VDM0lXLq58qL6JJrXkb/x0h03sFLneMaYhc
 Ews7w1oyc4P/L/UyrloYsdIpx3mwMjQHfLAf4Q0MLdZ/POneaD+7a4AKK/nvnoSS4oVW
 gz6m43gPQsrZ3sjcJ82JumEszF0Hk5WTQZH4JZSfoPo8dOJnVzA/vIA2p0vRAx1FAZnT 7w==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jegyv0m9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Sep 2022 14:25:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYwQEDV08F9zOczy73Pbw64JbpzG3L9M62Gwsnp2oQIJVGvYMTGo67um01iL4ZYC+hpDEQhfu8KB+JjMgZlC7z01N/kRFd1vyrXLNBeEopAVe2egfWqJ50BtbU+tfp2mkrmd+e1JR/ote4cM4vI9twD9ptdMp83vjYSxI617xPWwy62FO5hea+FoTvGeOBzPsWeUX3PXK2kX/fTu/c3BthAQOG3iuJzxRVqVCFCOv7BOXomwKvgDUasJJJXpBq8cmv9z1EF+E1vv8p9XZRKsgyoSYfsssi+hys3jya5YvV5d0khnBnAaIhfxbYDObvGZdK7L9AY2UgVxmNkxj7d/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kS9cPDJZO2Wftepi+ssvjHRAMlpnZcBxk5Gu1J773Y=;
 b=izoqpMrI2tvyh/8sSVmz4TXGuXSRRvJZowq3ZmfJ+pklDsGhW5ZeY86i7nnRBCTiNvusxSQMBCB5W6pE0BJI7ojALB/yntNr0tBQDYLWgzGTYUy4DQQJU4O4oyZwt5HtdomTO7x1jDawU2x5A/G3Ep+SrQjF1AAq8xNm4AAGQVeCqir08EGWwH/sezZg5acAsDcHQTnhzSrE77toRNoHwqWXhDpGnf0rLFCHYVGlC+UqsKjOhrJJvyUCFIQZ8BxbXMO7xqG/8t8Xw5fcJMFJPGNYyedLlWkqbqpqmwqFuAm6cdxB35eTcnF6It8yfaqvBkuUmPn7K58672Z+f0dNdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BY5PR11MB4022.namprd11.prod.outlook.com (2603:10b6:a03:18a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Wed, 7 Sep
 2022 14:25:27 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 14:25:27 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [RFC][meta-virtualization][PATCH 0/1] Error while compiling ceph
 v17.2.3 as part of uprev from v15.2.15.
Date: Wed,  7 Sep 2022 10:25:13 -0400
Message-Id: <20220907142514.17076-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::16) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 269a45c1-8dd7-472b-bdf1-08da90dccf80
X-MS-TrafficTypeDiagnostic: BY5PR11MB4022:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yFoNh4li7nloG10PD5UV0Hvu5kXxeOhCuyZRY0Cl2UVG1yv9n3jPbDxvLMvkuW6XypS6R/Zz/01fjMgQhx1jLsUA1Fmc6BYh7X1I3bkgXe/X4y0PTVQT3YnAAupv+wajFQVbThK7KSXIwrJTMsfocG6w1EHodkfzZPhreLXgxQiiSU0HpRK06OPd+IIEil91MHIDtULipDl3mgX78RWFApqzmeJqGOfnM6f6NW45mUN/aB9RusG5dMioDdkmL1D67sp+MbMEsciz3KNkUmPu8z93lq1ifUcB4HyXTWkMvsxJkq/0hfkIbxix8wL3oth9Ah3dU1Jdu6sJalnLoTq17ukOhzIrr+KorqLtjk5e340j255IXhKDqMKohfLjFxMUHGzEP/a5lZGZA8yVP2SA45Zqbpex845Jvo6UJoZIZRqEtheJFHTOomq7WObiCkO2lj4qutq3xRZwFhGtxsGQLqdLr3h9oVDKdqExmTRHO7L16hz1C1myzh41r+P1/81c6PhUeDTacmdsSWrxV+IoSE9wFacSp0GOjxMst1EEws/7C9WdvlRQb7Yi2PqCysd++8b4yXsCKgZd6ox1XIKHhHXSfZytUu5oswHlixoh8AndG9G/cB/IBy0vbiAEZ9fEmg7nutSKmqszhYyrykEhJfNelt1Ob/+WN1R8GjQsnUtl8kWFLteE8giuBJp3rRwNB5QUZtNJOoEXYFosz3v2Kt8Irh+0sWTign0LrXnkwLqkJFDrYI1hxfZYPmrHEtcgD7q0+zM0b9qmZllVjwqnHA+PnPnOzeHrjVD+3VhQeZ+eT6RqwHuhxPLdRh98s/90
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(316002)(66556008)(8676002)(66476007)(66946007)(2616005)(38350700002)(1076003)(6486002)(38100700002)(186003)(966005)(41300700001)(6512007)(6666004)(6506007)(83380400001)(6916009)(26005)(44832011)(52116002)(8936002)(478600001)(86362001)(2906002)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rmHnta3McMZAkZOt+TsZ1/ctluORPjwH63rdef9InHIrq6ntcUbAZaOgmzF6?=
 =?us-ascii?Q?ZAn+TvGyiqNKTZtJPDuwZHAmE89f90+bGjEQETYiRXhBAjZ4whfn6r7gVkUN?=
 =?us-ascii?Q?x1F6cbGo4lu+2KvN+PAbyE4t+j1+cR8gBAc80A0ffu6idRkJHyvyM5hWFRH/?=
 =?us-ascii?Q?e58XS4Sq9uAhd/eKDwN15RyccF7idg9Su+PZqIVAKR63Zu8T4w8hyRkzzTK2?=
 =?us-ascii?Q?XXxu4g5eBKCwi1VXBnRiPCu7m2Wod8rf/6HvTZB+dXQ3R0kPuAPbLsQE/yxX?=
 =?us-ascii?Q?AITLUKCU3QyoNIUNFUFHrOLdvdnL+RsD33rbz5np6gYQXf3TWoYGbJNwdIKt?=
 =?us-ascii?Q?DeSiYvWSmGO6sJ7y5TqHg3BGhip4ZaNmrIW/fu4e5PQfCKNCVlbEC4Ztz5yz?=
 =?us-ascii?Q?4Govnze94nFDxO51zPRBxMSxSO4wJqoWbi/flATgP48tP9TLt5U4HfBULbmy?=
 =?us-ascii?Q?NdwGm+F6CEtXLwVacGFlaSN1aSK51eV3LyuCJA4OMzKHm50DRglIZJ+c9Lgr?=
 =?us-ascii?Q?EOG9bCFBPuVhKe05kfuK6k2HtLvRxY31VpE4OLryCZ2mrKAtN+yHeYu/QY6t?=
 =?us-ascii?Q?XHrikebfjia0syaxAo0o3Rxfcm44okKLDER+SIaQiWHP+fXfZZ4D1DLX8ITw?=
 =?us-ascii?Q?I3D52MEogQq2n3sQwBAUW2u4e0iaIV9nQNrUpJTdLd9QZQZtXB27SE/4KIvG?=
 =?us-ascii?Q?6NmQ3R600MTzag0m0W89gRjrPL9lFxm0SV5fr9cFGbuuogeWMraDZ5TYsEaY?=
 =?us-ascii?Q?gu1qrc9/fNPVXPwci5mqxUCj8z64IqFZPT9/BMIAXmqtAjXVhsKUCQX34Qad?=
 =?us-ascii?Q?Igm12BdNb8cVXc6TrXGyzZMMloQU1PCWp0wmDu1Fax2TWUhI6rrpKYUpHe2/?=
 =?us-ascii?Q?1KgksNAiPhQgvV8CChp+upz8n2/L6qBpnl/wonwUXjidgacfxz2BhGZOWMmy?=
 =?us-ascii?Q?WZ0a1jjJHamDR859hjcVSFtd//7paAnrFhzwRugeX8nSevtY8Q/X243SOB3z?=
 =?us-ascii?Q?i8YO1Ko3ClA9vkIPlcl04Oy5up77YooTrGqCbbiEEMOhzMv0Livr5Znxe1rm?=
 =?us-ascii?Q?EIUPh+v8OOtI3uli4zDsgt6K5bd/Lx0nfgZcJcGJH2zx2gDEKiXuvQVD93F4?=
 =?us-ascii?Q?GCPzUG//TF8GQAftJKGv/FJ+YMZnzhwE+hWrU4kKZ4YoPkYmu0JUvwooJAGQ?=
 =?us-ascii?Q?tsA4FrmeHaKNV3uUJ0lsPOc3L54Wy6iuwftN4BbMarYTLfDi7yqfoVbHjoFB?=
 =?us-ascii?Q?kutokkckLCF1TKpLxICR4JGUcoxK0oJm0Da+PJezMJf+XDsfuRTrO9C11uWU?=
 =?us-ascii?Q?DLMufjFfnUfPmEWrBwuC8kZi5kXapZi1ofO8hANZbsjhS9I/w2N2G5r/LYfC?=
 =?us-ascii?Q?A/PdUnhaeISdmIpI35rlxoB5MiPOlllELRc9y2H2wYUHYWPLwKKksg/FRn1x?=
 =?us-ascii?Q?3c6tKth0bY68vl5r2rEbF4/fupnEoMQBhmXE6gNpo1M4azYmPbceFq2vaFOi?=
 =?us-ascii?Q?7tIZpPmGZ11npetuG5yyv17K3sPiXRskJN+ZPR9M1C4cjXC5cDFBxUKehTHa?=
 =?us-ascii?Q?oRzRjze6zoXZdQfBQ+V6YGv58U9T07pJytiQdDuVr7t5U1ogqowi9S/4wkh2?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 269a45c1-8dd7-472b-bdf1-08da90dccf80
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:25:27.6122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2I0u+chyv7VGn6idh3OSGN1jWjbwHs+i/0t/xs8QLuMlIyUQbz+KhPaHGnIfYbN2HeHABxYCu175xdjL6d9iV44sbcz9WUZzJd57+dQEF6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4022
X-Proofpoint-ORIG-GUID: bccdI2KlZ8JOYXxZiMErm_1IVVllHGcI
X-Proofpoint-GUID: bccdI2KlZ8JOYXxZiMErm_1IVVllHGcI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_08,2022-09-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=696 bulkscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070056
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Sep 2022 14:25:35 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7608

I am running into a compilation issue [1] while building ceph v17.2.3 as
part of uprev from v15.2.15.

There is an upstream issue (https://tracker.ceph.com/issues/55256) and
fixes [2] (which are contained in v17.2.3)  that addresses the issue.
However I still end up with the compilation issue.

I have tried a solution provided on a similar compilation issue
(https://tracker.ceph.com/issues/55256) as shown in [3] but end up with
the following error:

make: *** No rule to make target
'cmake_object_order_depends_target_common-options-objs'.  Stop.

I also tried turning of legacy option, ie "with_legacy: false", with no
success.

Does anyone have any suggestions? Am I missing something?

I have attached the patch for the uprev:
New build time deps on lua, cryptsetup and thrift
There was some patch refreshing as well.

[1] :
|     1 | #include "global_legacy_options.h"                                                                                                                                                                       
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~                                                                                                                                                                       
| compilation terminated.                                                                                                                                                                                          
| make[2]: ***
[src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/build.make:90:
src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/openssl_crypto_plugin.cc.o]
Error 1
| make[2]: *** Waiting for unfinished jobs....                                                                                                                                                                     
| make[2]: ***
[src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/build.make:76:
src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/openssl_crypto_accel.cc.o]
Error 1
| make[2]: Leaving directory '/yow-lpggp31/ssajal/repos/build/master/cph_uprev/tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/build'                                                                              
| make[1]: *** [CMakeFiles/Makefile2:6587: src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/all] Error 2                                                                                                      
| In file included from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/config_values.h:59,                                                
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/config.h:27,                                                       
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/config_proxy.h:6,                                                  
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/ceph_context.h:41,                                                 
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/dout.h:29,                                                         
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/include/Context.h:19,                                                     
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/msg/Message.h:24,                                                         
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/msg/DispatchQueue.cc:15:
ceph/17.2.3-r0/ceph-17.2.3/src/common/options/legacy_config_opts.h:1:10:
fatal error: global_legacy_options.h: No such file or directory

[2]:

https://github.com/ceph/ceph/commit/6007448501b3bf3bd8ee4b619a74b9b4146df745
https://github.com/ceph/ceph/commit/d93880880dad2cdbdc9abed1a51edf5264068ff1

[3]

do_compile() {
        cmake_do_compile
}

cmake_do_compile() {
        cmake_runcmake_build --target
cmake_object_order_depends_target_common-options-objs all 
}

Sakib Sajal (1):
  ceph: upgrade v15.2.15 -> v17.2.3

 ...mpressor.h-fix-snappy-compiler-error.patch |  30 ----
 ...h-fix-build-errors-for-cross-compile.patch | 134 ++++++++-------
 ...001-cmake-add-support-for-python3.10.patch |  34 ----
 ...001-fix-host-library-paths-were-used.patch |  30 ++--
 .../ceph/ceph/CVE-2021-3979.patch             | 158 ------------------
 .../ceph/{ceph_15.2.15.bb => ceph_17.2.3.bb}  |  14 +-
 6 files changed, 98 insertions(+), 302 deletions(-)
 delete mode 100644 recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
 delete mode 100644 recipes-extended/ceph/ceph/CVE-2021-3979.patch
 rename recipes-extended/ceph/{ceph_15.2.15.bb => ceph_17.2.3.bb} (91%)

-- 
2.33.0


