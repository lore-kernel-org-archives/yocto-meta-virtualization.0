Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D71EC7EE30
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18395.1677664366373672764
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OHs2PqTE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswL023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=XN0bES+nm4RV/aiQJ5mIvI7bJvZoaQHsznL8n7Vyogg=;
 b=OHs2PqTEb4pAETaeioXDr8TtUDBVgvUaux5Od9vqhdj0s8rU6Q1Nmc67c3/RXlaLO+qo
 5be2S5QEuBFdqUSZoyQDa2UFTbzXu7c8H6FiY2XTO3jTBL/fpW48xfIexUA+S+NpJXyf
 S7W/nVDOylTrE4RQTwiEmz5tBC27DscV+KkrDYbrWhtpt6NcBzxGY5qr1M62xQApBMbj
 9u39HCxaUPxsX5TqRQbI61o3jWNdi25RBu0g4UfuLL9svFn2umNK5UtKkhSU1eoWhELb
 G6Y89rtbZV1efPJO8mLl5WI6tblSo/1h4x+CLWfu602MNbBhGoiWiOEwwiOOMAIM+aaG SA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arJReQHSK3bx+WP/3zfEZr8pDOuJDoPzAWdgTp6MwYkLN0/wBIwULByqXhsT3E6Fspq7bEipQlE3VecI6irsN7Gr1Uf7Y9mOYeqdCJXYUW1DRcIdx7eQGjUismc7OfjlPf4/Il2UKewzN8LZJRFJDaogmWzR81Qwp0Bc/JlaUi/2kTzGfTR/vmLwf8X1MctET04yrXOQNQ2iFtKqdvWaEL52Bg5wcqISIK05dn0b5GoRBqHmFVIsaf9fLjtS6beWqPRsvFh38EJPjWQ0kr23YoHdjRntiWQQZK9sL3Oh4C85178BgsihX9gurK3rFP33gVnNCtT9OsMgDhVi8dVl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN0bES+nm4RV/aiQJ5mIvI7bJvZoaQHsznL8n7Vyogg=;
 b=KLm5CQ2bNMtYHO/fOHbxmUsL40/5qkGgIja48e5T8XP3FEm6oMcbaBOrn3L+8KT7S3nHvVjlWKYEd+w1cVhcF1N/sCdUdqYEz5g0hJ1tVkmMiZ9UzZqTiS2uVRgBr093x5sN42QYfcvURYu7S1FIYHlryKFZ1aXaRXMiYh0GuVa4FrAzrSKCeOuMgNH1BbJcEKpuvjIfn1GhKOirEkchESPyo7VkBXWT/BtpmaJalBtYKwVl3IOE0VZHBQre0FY/iAKj9zW+GeGwwKkmRcw6QX/Z6DzIR0pk/u49GVbT/pnLUQs+jD5lpVH6IcMq7bq9XDqiUSnxuF8M0MjqKfaiEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:42 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 02/10] cri-o: use PACKAGECONFIG to handle selinux
Date: Wed,  1 Mar 2023 01:52:20 -0800
Message-Id: <20230301095228.122562-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230301095228.122562-1-Qi.Chen@windriver.com>
References: <20230301095228.122562-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 6168a9d6-b3a4-4931-ec4b-08db1a3ab34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cpozpHPCFQNNOVbv8lP5uX604lTeCzrkKmydW/keeE43TqIt+MkLvFwuy2wInZTysQQmJs9z84Yq3p+wOMgH9boa/ymGoDfR5jI84oRutB6k6rJUkcTi8cr93x66pboW+6h8m7RCur6CT8ZETF/GV25BHzhA2LqLB13IhAXae8ks6wBQO77OXPBkY+Nt7BbWffM+OraqGSYA8RdTdTT6jcygIZ7ovPdzdy2CJf52hDLohy0/I/LyNquJvtxXa1qlW7Odh6y5aFzPY4Nr1bXlxhjPTzXjGjvHrNFtembDNOUCJ5fkT13OnD4wzPBkz4P1vWN9jyj7ztuDaoyB6qnEmrAyoPeaZRCXIN3k4THDpBZZq+BDguzqRBes77mjgFMBJUxplj0aR/htMTf9NG8trnwjaevsDIFVwdn0iRIcRndbsSzH1hJzzT0odz9+Rpyopoo7TYux4sJj9gIxgpM1XpwK1XR7Em0E/EUQJHe0KEQ6i49NtLpuu96OhMtdkSFjiKp/FlO21zoFELvwu8o82i7HYam8+Nsl3XdN72/TiLquYgAVnAdVevifQyfOyqKwTCYDVVLqsbVqLz/jSvCAUJFDIUJNaKBeKBTYl/q/zAKQjkmPGP/pNiTAZc89aujwlcjZGSsxOvYGfUJPixZMTGRpTUPzijbOAHaD4SyzFvmlCYRZlo4ao1TEQDX6nHsK4rgYL03m92J355+Xd8a9ag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(186003)(83380400001)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/m+eNWgNlkxlcxHpaOBfBwTVhifMEFu4XwOy+URMnFM2t/5g6C3MPo1KGqi8?=
 =?us-ascii?Q?AooCo2SxBNCbP0G5ZQ03PiOR+7TfiBrF+XUbKcG/qqqO3bkeGwXoXOJ99Yp2?=
 =?us-ascii?Q?p/wWABlc3hJWYkU3tpjId0/uwLc7uLDuhk6v2yHFnilUM26QQT9pWzHhGOM2?=
 =?us-ascii?Q?2fxB6e2aJccxCX3ukQ27ofu4KDysYHkVInLhSWjxzoXiI6Iz2SJmsb/PRJio?=
 =?us-ascii?Q?mh6LljthHBRg+whJ6niM9k/C0WsSTAMZh/xQ6fdt7o85ZulOCx7P3O4wO59S?=
 =?us-ascii?Q?okh0oprYkjMxICa9mFz+9HozmqJY4tN9hLomEbTpSw03QWwRCEjFUpI0rAKo?=
 =?us-ascii?Q?cNk/qgcAFthlByGWyiLTUphuZEGgeT5I0clNKCfnuAUJ84/utmh0hGlkTnRf?=
 =?us-ascii?Q?NGlnaixcR7GwZ0RXvpdNTOZUD+W0OCs468txmtbH3/h+FYMCZQU5eP8+wtW4?=
 =?us-ascii?Q?9Vi4J+QdebcvAVtngtL5fuqjqvTt2WczHrZL6DThMTgdcWIYF7xslMzJIkSB?=
 =?us-ascii?Q?JhyN/e+n5GW69JuwGkC5v2RlgbuSOkMrFhRLOX6o0uOGxBmTWGaYBNomx2yA?=
 =?us-ascii?Q?ebHfORK+hxy8khdHKyNMeIVfV/yEng0vT79IT7pJdMyHg/tZqa/Gg//Kl1PY?=
 =?us-ascii?Q?YDQCwPkwcxaP2L7KgZmUGwKj5W9+cD8vUDeiuZfSdaj8uhFt8UBsGTChP1wA?=
 =?us-ascii?Q?OVWH5C2kX/tCuK7OyetTLBYdawCm+L6//sgULssbmcPGVQ5/OpEV3Qxh6lAH?=
 =?us-ascii?Q?EgIzIPZhWKyxYszF/14SSySUt9fRMRpHNcqm6xIRO+Z0URUlAq1b7zwtxS+L?=
 =?us-ascii?Q?NSfojGxtFP+nXWh3JM8NXkxoRG/YT2LZA473Kd/ssrEK3Prgskq35lup35n3?=
 =?us-ascii?Q?zS0nH3iIc6L/vLukd2dE5gF/a17zX2aW34sR56SlyY/grL2OBC71lMVssiwu?=
 =?us-ascii?Q?oD+L9wqMZNiflGyA0E+r3BXP0lW3XVkCbGbAznPeFCTFgeHkX/PrTU/NlN7A?=
 =?us-ascii?Q?L0tWLCtHvmgDVHL+fAaCX2/2gsTmqP+Gfu9AWr79G6JFM0k1TrUgmN9gnbND?=
 =?us-ascii?Q?u2SBio7gdxJllSl8KY9/f7EGlenTqZXulPTVXae/P1H5cNtrp4oNmqgnkxjt?=
 =?us-ascii?Q?JyCvnmde6V4eZWFNpiJM5Tlf0Feyu1hEIQwssfVHvd4TLZbOXXVIGMlDFsMx?=
 =?us-ascii?Q?6pdG0yPfJYM4Bkp8twCI9pfmt1TtHTTjaCioH26/NiObW19LeG+yJH7QNIyC?=
 =?us-ascii?Q?GNF8DQqY8YWWLAxSEr7lVlFbz/JXBlcbwm8l8nUSeH1aXeAqdSLRD3dN1x3R?=
 =?us-ascii?Q?r9HeD/d1JVQp23w5GYavD7MOYyAMrP23s2YKovlfaEfF53jlW+iDxY/5+31e?=
 =?us-ascii?Q?kSSkuYHXZNnu0TiFuDz/O1v1p4ugORPuNWcbyndVta52DWYw9oiPgaE7kADB?=
 =?us-ascii?Q?of2lVgr/MB6YS+Trh8rnB0Ol2gZH3nPE8CH1j5Vsv2Bfmdwjhou5Og5BakIh?=
 =?us-ascii?Q?DNsqQYmvyiSMtNa03iW0lRByqyswpvp1p+Ei3YS5Rgh0CBdUJxjDki8QUD/U?=
 =?us-ascii?Q?JyaQJCWJ/OETMoK6ZjzsgQG/DBBfdVSnR5rYnx0AbwhDMccJse+NWWc8tX/M?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6168a9d6-b3a4-4931-ec4b-08db1a3ab34c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:42.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5pmIDWvhm4Ikn+PXGX5rdeNttyBskp8Ka93rjQQzMD4O6+HKU10f1hjrRZqqC+nXMBqBmRxp9SnuMdYeLnKDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: DcnyZydOkYcuWPECbcs3K2QwElpoqhnF
X-Proofpoint-GUID: DcnyZydOkYcuWPECbcs3K2QwElpoqhnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=749 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7912

For cri-o, libselinux is optional, this can be seen from
its Makefile. So let's make selinux optional by using PACKAGECONFIG,
whose default value is determined by the DISTRO_FEATURES. In this
way, meta-selinux dependency is not necessary.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index ee5906e..ca155a7 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -39,14 +39,14 @@ DEPENDS = " \
     ostree \
     libdevmapper \
     libseccomp \
-    libselinux \
     "
 RDEPENDS:${PN} = " \
     cni \
     libdevmapper \
     "
 
-SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG[selinux] = ",,libselinux"
 
 PACKAGES =+ "${PN}-config"
 
-- 
2.37.1


