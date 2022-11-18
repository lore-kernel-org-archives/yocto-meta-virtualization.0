Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25820C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 19:40:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3132.1668800445738986941
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Nov 2022 11:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pPdhYAcy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=832165c93d=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIIqO57006674
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Nov 2022 11:40:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Nn3gWKDpoWMzkfXyk3V4tvTkHRcFsU3fWPirkHw3ocs=;
 b=pPdhYAcyOV3IE+lsja4es2bEIAPR171BAUSZtc6dewZtwPggyqE5Bxqlo5cRXA2BInTR
 ELlP9hKAPT4OeKiVsmf0os8iQ0Hki6j2eCf+M/jBxd4ppE2118IqVvZscX4v1O5XvWGV
 waSHbKGBLSW9+QW57TdQB/Fihe2d6+Cdh50Rk6+NJieBgxPzk6n7VqGHtvoeE4O2CTeT
 URkGTewXilUUFCFYX0eb8aGHLiVNzijS5mAF5ZfHc9CFITKvQL4U5zcyRIUcrA6Jidct
 aLry8+yxTiILX+UCDYVayP5XwQda0V9mu3LLZlsKKxHsDQFuw+w9ZPLfncJqFX44jMcZ ng== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kx0ng0qud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Nov 2022 11:40:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhSEFOheCvggkaaBb2KIMKkz2/LMyImc65UC2GxAiuASWdF6Eha3zpjDDf65na6v/wBW2qjX3xcvWe8aeF2k7jTZT5XrMn6PB0YqbAX7mmi94X6o4gXN16ZgD/t5RxrFjKh3mTWulZVSU0FQZOZ16ngen5h2lBS66DRRPiCrBxXAaH8OYisWM3PViqxEgBX9Qy8hfkPFwnymrDmeuMrmrxD+d9E1iHp+Q/bnuyKpab16Rv9TYtqiakx2LINfVBmjwZcMxw23OWYaJNflCSjynjncKGxXfyydErQzRQWv9rZTivXyUDZaQ7pMQ7+P3uEpP0EuR1YBBU9kBd6RO1E61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn3gWKDpoWMzkfXyk3V4tvTkHRcFsU3fWPirkHw3ocs=;
 b=GoIRfg8Z70z3Coaz0Z/1iWmjJymS6HEmtdRhgsrCWDyGoYkECLUxoDooN75P+UZ9C5u8bjAIF9Cykueg746C9TWKcDdu2JwosaxK9HNqE8CW0st0ggZoI6MWVjcvc7Rdhnv2KT1Uu9U2LPrqIH3tYBlhJWI8x4UZxvmDBikj+EMc3RJA+aaX74eNh9R9tsv9Qov0YGONNUQ25BWW6msAsqamGIuqcLq6gECzNhUYZwa3IABbNNu1CB+/XZJk0dKRMEXJaTymCcp69QzUXmEjUe4vaEn5ZUk7PClnbmneBRNfvJnqWj/3hHAkumzUTAPeDr/HmrpKmcjNexBiJM/nIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.9; Fri, 18 Nov 2022 19:40:36 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3ec4:f05a:8bf3:59e0]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3ec4:f05a:8bf3:59e0%7]) with mapi id 15.20.5834.009; Fri, 18 Nov 2022
 19:40:35 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] ceph: support python 3.11
Date: Fri, 18 Nov 2022 14:40:20 -0500
Message-Id: <20221118194020.387979-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0220.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::17) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d96c767-2d1a-47fa-ca7f-08dac99cc354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iPNqhcFGkuEj5heW6UbMHHyU947S9xmrk9i9NwHrnbWf4gdD5Yzsw1ZI/QdfuxhC3Smzx3JZZiL4/s5wKvOl7GCRu6IbCc4c/xj0O3C5pRmrYwb4kk4ibs7dvLDNDuHj1cVxrYXAilF4KBrMoeQKS0rsMT03JyzchT6MHRB3MTvcFrVpctUtcM1WiC8a8kzdE3yDIopewgJlpGiasNB1Vdm+KpkeemmsfVr0ukxld+AMchMVbXUNTCoAgYgYbe8sxXJkvmndcJHyCdReLkdPdWL5v+NTbJIDSgCGWOyafDZdyEZJJaI7ycjq4rvZaV6R9UWig2FiT21z2bekiE3wkJCHbhsWbeoahosreTLKgNziM1De1wZzJ3NIa5CTAZpR8x/Wh18+zKJALKUCP7O+d7i/F+R7CrYaYkR/uGpvyHjPVGpz6p21F9SmwMIPMuwBLYQSf6EOkb2in5YBCf2R4+sUx3fVhwVVdHlXV8KDoxLAw6Dqyq0O08S/NXMB8wlEF1bsHrmdbChwN6lJeJ9h+6jIwa9FIqMy8hD5ha51I+gs2vaFYhnWHL8FPpxjtbhU4SXrAq5KnM78wA3BwxADRQCwlVYvMvTd5eLJfXwaBXnNjZezhzUzGT9UeICFTkEjWKOZoLPhxiflyU02PFak8vpcMj3U4b9o8UrHeJZAf0jAKiOAgG1d1y7WTWE0rfXgIi3hhZoqIcMOq2GPbpkAjvHjicfAMpFkeJ59rvFxXIan2qErGvHlCCJoXbudnhEd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(346002)(396003)(136003)(366004)(451199015)(52116002)(26005)(83380400001)(86362001)(316002)(6512007)(8936002)(6916009)(2616005)(186003)(1076003)(36756003)(44832011)(5660300002)(38350700002)(8676002)(66946007)(38100700002)(66556008)(66476007)(2906002)(41300700001)(6486002)(478600001)(6666004)(6506007)(148694004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HIRr7Hdk+qHwqeuuG/GmLm/eQ6mH4HXfCpHj8JvYcMAXzXIx+qXSiQNV0CU6?=
 =?us-ascii?Q?4pRh7Ra7nrGS6JvDYVQMWLvUlO+kzqMGBx5GnlzuyIdOhkmhi9SDjx80wBBM?=
 =?us-ascii?Q?ibYYA/pHfrbajXiR3/Tt/wUz3bJywgdHrfQzF2eBatL6wr9D0PH/BocPfge/?=
 =?us-ascii?Q?KKq34k+dJLh1bsVF2oChW/yj1ESIlpvISV9smrKO2urUGk7lkk8fu1GpENyZ?=
 =?us-ascii?Q?TWgUv5eXp+xjtTm2vfSPSe1rBoRVGDB5uZYubrDBAEsMumLJhLEcoDrLf6rr?=
 =?us-ascii?Q?oJWcEA/bFDpND3SLQqqqyls767vdt0GqdKNHnMvyeUKkycY5FGCGsDF0uZr5?=
 =?us-ascii?Q?5c7+0sa5uXALvRUn7JHnl2I19Wdr62a4Risy+q6f4FASr+v3rzNZNZcCQZHe?=
 =?us-ascii?Q?AToLdVnxX3LWkD6kGdxQ5Fx3ObRE9aVN7aijIz5khu+gVbLbX8iX1qcLF446?=
 =?us-ascii?Q?ygaphn9EstLJud/+95FAZbKnrGk3PF0mdHfP04qAWzTAwiUJ2hnbEfGMsWeM?=
 =?us-ascii?Q?9k1aGTCB4jPXJoEUY1cBVqeR2SYZQXz8Aa1sCBYyG1x6ZVqb6AgJrpFFupF5?=
 =?us-ascii?Q?KwEpYGMHqvwLJI1F7fWscvBV/akIDC5gTW+is9Stx4rXBaOZ8oiA4zx9crWe?=
 =?us-ascii?Q?k0c5kRvnCXXHbp1KvLZE0GZetIsyW8hvO3t6SbTuIdsiKsmNoQkAAKXtPCsI?=
 =?us-ascii?Q?HCoXmjeGfT9vkoIorvfIhxDBsshOMXjiPw/fN9FjYNvx+frxugKVCsWtlEYh?=
 =?us-ascii?Q?cM0XuNuXPaDVzRuybsAIzSkX9SlmQasHTOSg7FmGhaI2TzEDiA0iPOTL8nLX?=
 =?us-ascii?Q?bFOgEsr6AragxBgjZry1BQMJ6NDKmoXiIqjoaq94M/1YqCJOVZxCc/h7CPjz?=
 =?us-ascii?Q?iQYg8FenwpvpDIYKllJCz6qocJ1vvbvJ/sXapxJ1sLjvVyd/E+WYgAxCW/UM?=
 =?us-ascii?Q?Imp3Ygq8K0vRzi0qvqUsDEbfEQBSCYVC1YB9KJvT2c3BbQsLSfidBgNPbFLK?=
 =?us-ascii?Q?ExECEOsMrk/SPJrKTwTcuYq3ehpadab2YHjWfsT6Nm6RHc9Jvvp9MpblfYbF?=
 =?us-ascii?Q?qlAU462blASFHPmdI10Hb2K0uBeeBGMQ2vEv9KNmDIz2F67T/9hD7+UYP/CY?=
 =?us-ascii?Q?xZQndFuQZ2Rr+fLSGIn4h8Jg3Mp432C8sa9MS0s6TFv4sJVReYAJDZ0Ok585?=
 =?us-ascii?Q?DYr0WC0cvCrIO7jgZG3B26cuy19fCoshDYctL8ThLBk0rJCYjIqMZjQ4yN21?=
 =?us-ascii?Q?/LYY3LYsgNX7R+F9ufSQxy7A0hF12TPShrsxDbqcDt9k8AuGYOcDAMqP9WOG?=
 =?us-ascii?Q?ifYYVznFYzwhXZHpQKlvx3NbT9ddVzc+ljcTUXiFLTS4JcAP4SMGbGgrRKsr?=
 =?us-ascii?Q?cVma36H5xaVno8eZl4Cp2gzNzPdfPj8E7rcbE44TAADPUuFciLmYhkvbASHI?=
 =?us-ascii?Q?oLZsz1Sp92EV/ISQLOLTJehAXk2/3dEanNa+FJrGJ/PWKsiu7c3K7qmMlj5T?=
 =?us-ascii?Q?SyxfmDeYrSrAKNvZG2TP7kxKQhnj4l/mYw7iX7GhaVj7d2O23mHFuSM7qT5+?=
 =?us-ascii?Q?Wxgz+t4vbCuKPbXqQ81FtRHjcKKyV//mjxJtdAFz8gNC3SXM0SbB+Y6do84b?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d96c767-2d1a-47fa-ca7f-08dac99cc354
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 19:40:35.6635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsmpxcdF3+exTwjNBwUKRxzTv6a2CxpAmOgS7d+PGFVsbNWyBFuH316n7D1+HG0/B1fRB2RTEkm+rzV/2Lz+NSIl9b3m90lXasHeUgI2VXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-Proofpoint-GUID: RWu5ThLAj-BnRiL73lQsAVE5viVjZEww
X-Proofpoint-ORIG-GUID: RWu5ThLAj-BnRiL73lQsAVE5viVjZEww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180117
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Nov 2022 19:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7689

python3 has been upgraded to 3.11 in oe-core causing
ceph do_configure to fail with the error:
|   Could NOT find Python3 (missing: Python3_LIBRARY Python3_INCLUDE_DIR
|   Development) (found suitable version "3.6.9", minimum required is "3")

Support python 3.11 to fix the issue

Upstream-Status: sent to upstream (https://github.com/ceph/ceph/pull/48947)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...on3.10.patch => 0001-cmake-add-support-for-python3.11.patch} | 2 +-
 recipes-extended/ceph/ceph_15.2.15.bb                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/ceph/ceph/{0001-cmake-add-support-for-python3.10.patch => 0001-cmake-add-support-for-python3.11.patch} (93%)

diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
similarity index 93%
rename from recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
rename to recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
index 94c4b8a..c0b718a 100644
--- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
+++ b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
@@ -25,7 +25,7 @@ index 6584699b79..c05bbe3306 100644
  endif()
  if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
 -  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
-+  set(_${_PYTHON_PREFIX}_VERSIONS 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
++  set(_${_PYTHON_PREFIX}_VERSIONS 3.11 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
  elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
    set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
  else()
diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
index 14b4c97..6312fd3 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_15.2.15.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
-           file://0001-cmake-add-support-for-python3.10.patch \
+           file://0001-cmake-add-support-for-python3.11.patch \
            file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
            file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
            file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
-- 
2.33.0


