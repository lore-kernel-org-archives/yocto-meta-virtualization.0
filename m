Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420CFC07E9D
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 20:45:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3150.1664225135506287447
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 13:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dJiizcZe;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62685639fc=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28QKLChJ025750
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 13:45:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Pcg666dC0ITQjd5jFMTS7t0IXPNjPehN/JMiAesoen8=;
 b=dJiizcZeKUz+0AVXiuqduIQAp+O38PyhBfDA/OiPxLhPFu+O0MVMF/6Aj3A1hom2VX+/
 JiQ9wiuhvyRKtkgyBWvQ1ZmZnRbVwpXPYL52GLaBsVatblW5I0b9/sgP4MaAe/I9zdgI
 Idib365steAvSbAIwyGdo+LhW4fTUmzinHYj0YMtWALAHFxsvidGQVF5ETRyWdH3NyAf
 8hVUxPp/fw6zIwR6OHZ88Y7EchQYU+iNgXdzeis51cq1w8Kon+MGYFYcEF/w338PtCds
 eygV63raqEmKM85DT1SrdzJPEFDmLU75cMA4Pg9JjtHoKjvlI2rU6juJYmt8xL6uTBqc Bw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jsw65hsu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 13:45:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3H1g+uUOo6BUN/9Yan3b5tsGoreBGqPiVFbhEPJgoCSYQQG5sAatSL2zdCjm/fvrmEkKLHg7Fy22vqMBRPlNiVLOUZEF16GCVwwvQmPbCyJvaR07gCYP5zAQRBtA1N2onyC+Kn3lO2fyMQt/OjfakyM0v3JWMcOgKGpmG0aHGQbyxaCPO1ek0lHkyo63R+PmpvHA9oacMuZcsBzes542Dbe0EXXrZEtlwTEeSPMXdhNC5oLDcf91nEMNgjPgyXLEIyvOqCPs9IPc9kwvQqwbk08u6BtuUqFiLdgP2ya4ohohp4x9eQPXPHjxqHhVB8NrBizQWj5ZGWTxHQAXAFn7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pcg666dC0ITQjd5jFMTS7t0IXPNjPehN/JMiAesoen8=;
 b=G3Pkxuxx5jDmC4UytEtJyCtqYDapiclLoU04wMZuBIrhij2u0I+5+drrvZevB8xeMm90ilWpjD+qHlaIZruXYxDuctwQ0rL+F74rpQQvL8DyxHqMpJlAgsjiIELcKeRCUj14BqiaWKcfYJEbQJ9VRDfEBiWNh/lVzipGghCWHq6fwBoIsYFMYNbnX0E5d6noycId5cLxVNyfLSmGS0ObA0wfoytJ3sq+7uRaUVILbd0J4dVPMqn8RHslhbS621uoCHlANB600Nv0sHBNMxEFgSF7O6hNtdCPwIzImqKBbAakE1wG3h54t+5DpdOT5TknYGYVxhluPs0WCZOkRk5r6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SA2PR11MB5100.namprd11.prod.outlook.com (2603:10b6:806:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Mon, 26 Sep
 2022 20:45:31 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::857e:8b45:98bb:2336]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::857e:8b45:98bb:2336%2]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 20:45:31 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] ceph: fix compile issue
Date: Mon, 26 Sep 2022 16:45:16 -0400
Message-Id: <20220926204516.4819-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0297.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::16) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|SA2PR11MB5100:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abf8cee-8ac1-4a16-cabc-08daa0000d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MgKSyBFN6BSwxN7VbuQnNTMx1ZlhMai/Wo1+UhvqeNspPJpJyIcdrNxGu1F4jq2Wtq8gI1f9yAnarwn0HDi8YiyEg6C+++QlS604GRBtMPAjDlkdnXeF1FiOE7Sc+5XXspR9MnzrKwGbbqVjl47/esgdFRqpVgsex1l7KH1dmG4MCI1JVfF8J6Q4o64c/URAS0ECuUps3SqqhThdaZ4cahVbcSqQBnl3zy/6m36XZ+qLTUBUEVKYaVnZXaRkpx3RAlMREb5Iz0q2624S6w1g2KCAtBsfLr8L+1m0zwQuL5Ln+Mj3rj8KOTgBYZ1/AvdEZra1fqPogII+TE1dpgG1CFWlfyjNT9vrrHbPeIJ1OZYk3xPqT9Nx6wVK3rc1EzgAba6y2A27BPAvtmaOjpm8WEB9FB+XGHc8EMgfVWjvwL/kKwmHu8J4zvOVanha2e8Ctcpl7uAxcoFq47ZU63mmNzpydFTUfhbvL3jNHApStoVR0FtqkJQMmsMh61U7xAiSyfKSnRh4ys0wDVo2Uh504uoB6wVzAKnzyltA0+sidFAx8vG9lmI+TepotyxqkBocJTKaFywFYcPLCrCrCN7ZSUFCbcon0URxfYKifNGlPQtEwJNQujtA4MRlDFXufSG/tvEHgJsvb2k6tRMMudOCto3laWo+UpXFv6Cj77f19uDoz+529yCuInWlqMZNc66BUU57Hsas/2nHT5JKkUSYbhaUJ6/w/co7bYj1npvc8b+QpiERxmB1pU1eXrXjPIUON92WmY0NEbNCuBFDlwZohj52ZvgYjoWvZ7xFfVy6ImOaSeI0voo+gs4xzTb8AP75T/J8QS5RTH8beVqmJcHI814BnfqjPk0skN4a21Qhpb4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(136003)(39850400004)(346002)(451199015)(83380400001)(2616005)(86362001)(186003)(1076003)(38350700002)(38100700002)(66476007)(44832011)(66946007)(5660300002)(2906002)(8936002)(41300700001)(66556008)(478600001)(6666004)(30864003)(52116002)(26005)(6512007)(6506007)(6916009)(8676002)(6486002)(316002)(36756003)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/wAAcp/LuvMBahG//6IMAdoZfqja26voRgxeLfG0E4IWzNfJ0wF4ZzNv4pOf?=
 =?us-ascii?Q?+1D8rfOYaGdSMmGmOsbn8gDVnf3H35wiiS9vO0rjp1Fde1wZEKz68CTIirA2?=
 =?us-ascii?Q?pjv2XYNsbU8BobNBkj0gTrxGKQKUUEUZms85aWAI4eLu9dUYExvhR4QI2q6B?=
 =?us-ascii?Q?HrgYXHDzjzRT7c0jINW3cppPoTh5vUzQKW/qArJYhV1p/GWKt3HK5dM0qAah?=
 =?us-ascii?Q?wtvqwWbYtgIqBFYBF0T9xSpcA2N/nh/+nJTIqyqyWvQux8mG5noO+hast6Fj?=
 =?us-ascii?Q?dhc2rNr87W6m9wpkUHfoIlJZZ7jBaawzKUFfE3qd73YAOuYOrytyI/REVeOC?=
 =?us-ascii?Q?mdCs2CYw2FbfE3b08PnzK2YGzgJOAUtRUOcyXn43PnfSJkki1my6Czz2xsy3?=
 =?us-ascii?Q?cM2FgVW2bX3FRKCXbyC1iDDOLw0KFLk1fDD1fhNvFksytJBQ69sIonODAV11?=
 =?us-ascii?Q?bf6FHEZfwvSbV63n3hjociii5dUl8hOeSL4AZcBEX9sev6AUtGYdWVxFa6F4?=
 =?us-ascii?Q?ctMPeSUG7sHZIwFqQRSBT7ow8nR2BiZe5ysj8H+DcpkWr8LSd0VcSzSyjNhv?=
 =?us-ascii?Q?nsHpbc/yR5CnH1s/+IjUsulBleyx2Pai0U0FCHXX6legyFb7Rpq6bw4Xfcdf?=
 =?us-ascii?Q?u9UbPmy5IcudJrIkDWlWT0x2hAawzZIJT8I8EnUWyFYBRF7Y92u5b3/UjbTS?=
 =?us-ascii?Q?+L38U0kjIykR4jo79OqSmc5wtX2U4Z/IFy50yDEPN6zcPp9lSke3+VW/mmCG?=
 =?us-ascii?Q?g6bPbfYDY5VjLrKl6PcXOFG9xv30WXZ1a5+AZQ+RKRsdBXHTBvWbYdv7SEBX?=
 =?us-ascii?Q?iK3DHjCciIuwoJZtIMsa4P5C5I3l7RSOWtHpymWb0UBgQxl1YVTWEbuLmVpV?=
 =?us-ascii?Q?DTBopxBqqPLP2TZmU5ahYSabRIPTHgHuXyCWJzdWONbiOlttD0KICde4A6+E?=
 =?us-ascii?Q?c/AI33C0a5DYzOX0ThP11vRWvHc8OAvPmOG8+RDwKdpEatKm7zA3P/AOugyG?=
 =?us-ascii?Q?YMgVe9U4Z4zSUeJukw0250WVxwUGMbc42qBntg7koACNX+U3qyBXvUWR+gLb?=
 =?us-ascii?Q?2ycio0kC0+C5cauYLeju6Kz9SM7YWyoDsbCiFqqMk/zYHf5wYaaFTaFjyO/u?=
 =?us-ascii?Q?6CQ9o9uuA8Q1+VglrZTqXyHqcEc8MdFL4Z9IKcTp/y+5XBEor1om53HJLHyl?=
 =?us-ascii?Q?LHCbTQrq69hkK1iXS4asTnFRmNYeWYLSIgs8FHJbqRx++tLGQ9sT0sRoTeU0?=
 =?us-ascii?Q?UkCGs5d8Kp5cck+v367IIJ4AhQdXWyrhH/P1+5woWqmZOGy7ZRzufmMEuWCT?=
 =?us-ascii?Q?9DLrojTW1wkIqL2fYj/ZvBb5s6H3/IA4CClOdzO6JMflfhouERsfWzx+Va3t?=
 =?us-ascii?Q?+Kf1yxvpdm5IvYaZ7bRRT67EQ0/GRgZmvt9OdHZIyxo1ak5EEilP6nbgSFfc?=
 =?us-ascii?Q?huhEbu2yOA2M7XqhNTdO77nou7/6jly+GfjIWVskjPgPo+GCTCP7BPQwK1zn?=
 =?us-ascii?Q?4+sagW8A1Oiv6yYmqRgt6rjMixJ4N23qaNzsDaQS5by+YP+lUrkz4qODIIZ7?=
 =?us-ascii?Q?YGW4EDIUt9UFlMCeVnELMLf9wM0dtecj2yDRE7kLuuNRVpUB+jrzsgoGtlrM?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7abf8cee-8ac1-4a16-cabc-08daa0000d38
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 20:45:31.0803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6Vw2OsG53o0F+/cdqREK4F8LThfV04lQ9pJgbH1Gvo0ExfiXb2w3avM4BERb51CIAlMd5W0uIrB1GlJQdcGShw1M0FLjt6FZfwEIz455c2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5100
X-Proofpoint-GUID: 5GEFlICPEzEdrWQpwiTbGWKu9dddUJJv
X-Proofpoint-ORIG-GUID: 5GEFlICPEzEdrWQpwiTbGWKu9dddUJJv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_09,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209260127
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Sep 2022 20:45:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7630

rocksdb has been updated to 7.5.3 in meta-oe causing
ceph compilation to fail.

Backport necessary patches to allow ceph to work with
newer versions rocksdb.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch |  51 +++++
 ...-reorder-ShardedCache-methods-declar.patch |  70 ++++++
 ...-define-DeleterFn-function-pointer-t.patch | 101 +++++++++
 ...-implement-methods-required-by-rocks.patch | 207 ++++++++++++++++++
 ...05-kv-rocksdb_cache-mark-Shard-const.patch |  32 +++
 ...006-rocksdb-build-with-rocksdb-7.y.z.patch | 109 +++++++++
 recipes-extended/ceph/ceph_15.2.15.bb         |   6 +
 7 files changed, 576 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch
 create mode 100644 recipes-extended/ceph/ceph/0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch
 create mode 100644 recipes-extended/ceph/ceph/0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch
 create mode 100644 recipes-extended/ceph/ceph/0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch
 create mode 100644 recipes-extended/ceph/ceph/0005-kv-rocksdb_cache-mark-Shard-const.patch
 create mode 100644 recipes-extended/ceph/ceph/0006-rocksdb-build-with-rocksdb-7.y.z.patch

diff --git a/recipes-extended/ceph/ceph/0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch b/recipes-extended/ceph/ceph/0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch
new file mode 100644
index 0000000..795c60f
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch
@@ -0,0 +1,51 @@
+From b7b58010fd10b95c681df78cc4322e6586a39099 Mon Sep 17 00:00:00 2001
+From: Kefu Chai <kchai@redhat.com>
+Date: Tue, 17 Aug 2021 15:20:24 +0800
+Subject: [PATCH 1/6] kv/rocksdb_cache: drop ROCKSDB_PRIszt
+
+ROCKSDB_PRIszt is a macro for "zu", which is in turn use for printing an
+(unsigned) size_t variable.
+
+there is no point having it in the header file or define a macro for it,
+as %zu is standard compliant, and we don't get any advantage by using a
+macro for it.
+
+Signed-off-by: Kefu Chai <kchai@redhat.com>
+
+Upstream-Status: Backport [44f5b827eb3c65665373a86908bf5d47e7d02687]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+
+---
+ src/kv/rocksdb_cache/ShardedCache.cc | 2 +-
+ src/kv/rocksdb_cache/ShardedCache.h  | 1 -
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/kv/rocksdb_cache/ShardedCache.cc b/src/kv/rocksdb_cache/ShardedCache.cc
+index 367140a9..8e08deb8 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.cc
++++ b/src/kv/rocksdb_cache/ShardedCache.cc
+@@ -131,7 +131,7 @@ std::string ShardedCache::GetPrintableOptions() const {
+   char buffer[kBufferSize];
+   {
+     std::lock_guard<std::mutex> l(capacity_mutex_);
+-    snprintf(buffer, kBufferSize, "    capacity : %" ROCKSDB_PRIszt "\n",
++    snprintf(buffer, kBufferSize, "    capacity : %zu\n",
+              capacity_);
+     ret.append(buffer);
+     snprintf(buffer, kBufferSize, "    num_shard_bits : %d\n", num_shard_bits_);
+diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
+index 4d64893a..8ab2587b 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.h
++++ b/src/kv/rocksdb_cache/ShardedCache.h
+@@ -22,7 +22,6 @@
+ #ifndef CACHE_LINE_SIZE
+ #define CACHE_LINE_SIZE 64 // XXX arch-specific define 
+ #endif
+-#define ROCKSDB_PRIszt "zu"
+ 
+ namespace rocksdb_cache {
+ 
+-- 
+2.33.0
+
diff --git a/recipes-extended/ceph/ceph/0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch b/recipes-extended/ceph/ceph/0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch
new file mode 100644
index 0000000..3fc8c86
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch
@@ -0,0 +1,70 @@
+From 6cdb1387a713fad765b5193d5acf4504f206a66f Mon Sep 17 00:00:00 2001
+From: Kefu Chai <kchai@redhat.com>
+Date: Tue, 17 Aug 2021 15:39:00 +0800
+Subject: [PATCH 2/6] kv/rocksdb_cache: reorder ShardedCache methods
+ declarations
+
+in the exact order in which rocksdb::Cache declare its public virtual
+methods.
+
+Signed-off-by: Kefu Chai <kchai@redhat.com>
+
+Upstream-Status: Backport [633656f8ade2c1d67a66f8b7ca3aa0a2ae82e6b1]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/kv/rocksdb_cache/ShardedCache.h | 21 ++++++++++-----------
+ 1 file changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
+index 8ab2587b..a16cf561 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.h
++++ b/src/kv/rocksdb_cache/ShardedCache.h
+@@ -56,34 +56,33 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
+  public:
+   ShardedCache(size_t capacity, int num_shard_bits, bool strict_capacity_limit);
+   virtual ~ShardedCache() = default;
++  // rocksdb::Cache
+   virtual const char* Name() const override = 0;
+-  virtual CacheShard* GetShard(int shard) = 0;
+-  virtual const CacheShard* GetShard(int shard) const = 0;
+-  virtual void* Value(Handle* handle) override = 0;
+-  virtual size_t GetCharge(Handle* handle) const = 0;
+-  virtual uint32_t GetHash(Handle* handle) const = 0;
+-  virtual void DisownData() override = 0;
+-
+-  virtual void SetCapacity(size_t capacity) override;
+-  virtual void SetStrictCapacityLimit(bool strict_capacity_limit) override;
+-
+   virtual rocksdb::Status Insert(const rocksdb::Slice& key, void* value, size_t charge,
+                                  void (*deleter)(const rocksdb::Slice& key, void* value),
+                                  rocksdb::Cache::Handle** handle, Priority priority) override;
+   virtual rocksdb::Cache::Handle* Lookup(const rocksdb::Slice& key, rocksdb::Statistics* stats) override;
+   virtual bool Ref(rocksdb::Cache::Handle* handle) override;
+   virtual bool Release(rocksdb::Cache::Handle* handle, bool force_erase = false) override;
++  virtual void* Value(Handle* handle) override = 0;
+   virtual void Erase(const rocksdb::Slice& key) override;
+   virtual uint64_t NewId() override;
+-  virtual size_t GetCapacity() const override;
++  virtual void SetCapacity(size_t capacity) override;
++  virtual void SetStrictCapacityLimit(bool strict_capacity_limit) override;
+   virtual bool HasStrictCapacityLimit() const override;
++  virtual size_t GetCapacity() const override;
+   virtual size_t GetUsage() const override;
+   virtual size_t GetUsage(rocksdb::Cache::Handle* handle) const override;
+   virtual size_t GetPinnedUsage() const override;
++  virtual size_t GetCharge(Handle* handle) const = 0;
++  virtual void DisownData() override = 0;
+   virtual void ApplyToAllCacheEntries(void (*callback)(void*, size_t),
+                                       bool thread_safe) override;
+   virtual void EraseUnRefEntries() override;
+   virtual std::string GetPrintableOptions() const override;
++  virtual CacheShard* GetShard(int shard) = 0;
++  virtual const CacheShard* GetShard(int shard) const = 0;
++  virtual uint32_t GetHash(Handle* handle) const = 0;
+ 
+   int GetNumShardBits() const { return num_shard_bits_; }
+ 
+-- 
+2.33.0
+
diff --git a/recipes-extended/ceph/ceph/0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch b/recipes-extended/ceph/ceph/0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch
new file mode 100644
index 0000000..01144b7
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch
@@ -0,0 +1,101 @@
+From 29f1e556c1e7c5ab195983552387e1410e0b5b6c Mon Sep 17 00:00:00 2001
+From: Kefu Chai <kchai@redhat.com>
+Date: Tue, 17 Aug 2021 16:25:32 +0800
+Subject: [PATCH 3/6] kv/rocksdb_cache: define DeleterFn function pointer type
+
+this paves the road to rocksdb v6.22.1 compatible implementation
+
+Signed-off-by: Kefu Chai <kchai@redhat.com>
+
+Upstream-Status: Backport [c7a6c74b62dfcc96f676eb6d8844852c4705b66f]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/kv/rocksdb_cache/BinnedLRUCache.cc | 2 +-
+ src/kv/rocksdb_cache/BinnedLRUCache.h  | 4 ++--
+ src/kv/rocksdb_cache/ShardedCache.cc   | 2 +-
+ src/kv/rocksdb_cache/ShardedCache.h    | 6 ++++--
+ 4 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.cc b/src/kv/rocksdb_cache/BinnedLRUCache.cc
+index 2391a7f6..4e5f4dd4 100644
+--- a/src/kv/rocksdb_cache/BinnedLRUCache.cc
++++ b/src/kv/rocksdb_cache/BinnedLRUCache.cc
+@@ -344,7 +344,7 @@ bool BinnedLRUCacheShard::Release(rocksdb::Cache::Handle* handle, bool force_era
+ 
+ rocksdb::Status BinnedLRUCacheShard::Insert(const rocksdb::Slice& key, uint32_t hash, void* value,
+                              size_t charge,
+-                             void (*deleter)(const rocksdb::Slice& key, void* value),
++                             DeleterFn deleter,
+                              rocksdb::Cache::Handle** handle, rocksdb::Cache::Priority priority) {
+   auto e = new BinnedLRUHandle();
+   rocksdb::Status s;
+diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.h b/src/kv/rocksdb_cache/BinnedLRUCache.h
+index 96023ce2..b0fb7148 100644
+--- a/src/kv/rocksdb_cache/BinnedLRUCache.h
++++ b/src/kv/rocksdb_cache/BinnedLRUCache.h
+@@ -56,7 +56,7 @@ std::shared_ptr<rocksdb::Cache> NewBinnedLRUCache(
+ 
+ struct BinnedLRUHandle {
+   void* value;
+-  void (*deleter)(const rocksdb::Slice&, void* value);
++  DeleterFn deleter;
+   BinnedLRUHandle* next_hash;
+   BinnedLRUHandle* next;
+   BinnedLRUHandle* prev;
+@@ -189,7 +189,7 @@ class alignas(CACHE_LINE_SIZE) BinnedLRUCacheShard : public CacheShard {
+   // Like Cache methods, but with an extra "hash" parameter.
+   virtual rocksdb::Status Insert(const rocksdb::Slice& key, uint32_t hash, void* value,
+                         size_t charge,
+-                        void (*deleter)(const rocksdb::Slice& key, void* value),
++                        DeleterFn deleter,
+                         rocksdb::Cache::Handle** handle,
+                         rocksdb::Cache::Priority priority) override;
+   virtual rocksdb::Cache::Handle* Lookup(const rocksdb::Slice& key, uint32_t hash) override;
+diff --git a/src/kv/rocksdb_cache/ShardedCache.cc b/src/kv/rocksdb_cache/ShardedCache.cc
+index 8e08deb8..ef3b3b98 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.cc
++++ b/src/kv/rocksdb_cache/ShardedCache.cc
+@@ -44,7 +44,7 @@ void ShardedCache::SetStrictCapacityLimit(bool strict_capacity_limit) {
+ }
+ 
+ rocksdb::Status ShardedCache::Insert(const rocksdb::Slice& key, void* value, size_t charge,
+-                            void (*deleter)(const rocksdb::Slice& key, void* value),
++                            DeleterFn deleter,
+                             rocksdb::Cache::Handle** handle, Priority priority) {
+   uint32_t hash = HashSlice(key);
+   return GetShard(Shard(hash))
+diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
+index a16cf561..674e5322 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.h
++++ b/src/kv/rocksdb_cache/ShardedCache.h
+@@ -25,6 +25,8 @@
+ 
+ namespace rocksdb_cache {
+ 
++using DeleterFn = void (*)(const rocksdb::Slice& key, void* value);
++
+ // Single cache shard interface.
+ class CacheShard {
+  public:
+@@ -33,7 +35,7 @@ class CacheShard {
+ 
+   virtual rocksdb::Status Insert(const rocksdb::Slice& key, uint32_t hash, void* value,
+                                  size_t charge,
+-                                 void (*deleter)(const rocksdb::Slice& key, void* value),
++                                 DeleterFn deleter,
+                                  rocksdb::Cache::Handle** handle, rocksdb::Cache::Priority priority) = 0;
+   virtual rocksdb::Cache::Handle* Lookup(const rocksdb::Slice& key, uint32_t hash) = 0;
+   virtual bool Ref(rocksdb::Cache::Handle* handle) = 0;
+@@ -59,7 +61,7 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
+   // rocksdb::Cache
+   virtual const char* Name() const override = 0;
+   virtual rocksdb::Status Insert(const rocksdb::Slice& key, void* value, size_t charge,
+-                                 void (*deleter)(const rocksdb::Slice& key, void* value),
++                                 DeleterFn,
+                                  rocksdb::Cache::Handle** handle, Priority priority) override;
+   virtual rocksdb::Cache::Handle* Lookup(const rocksdb::Slice& key, rocksdb::Statistics* stats) override;
+   virtual bool Ref(rocksdb::Cache::Handle* handle) override;
+-- 
+2.33.0
+
diff --git a/recipes-extended/ceph/ceph/0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch b/recipes-extended/ceph/ceph/0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch
new file mode 100644
index 0000000..ee1e141
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch
@@ -0,0 +1,207 @@
+From 90696cb3652eb307c6aadde4af7d9198dc00c15f Mon Sep 17 00:00:00 2001
+From: Kefu Chai <kchai@redhat.com>
+Date: Tue, 17 Aug 2021 16:27:47 +0800
+Subject: [PATCH 4/6] kv/rocksdb_cache: implement methods required by rocksdb
+ v6.22.1
+
+rocksdb v6.22.1 added couple pure methods, so let's implement them.
+
+Signed-off-by: Kefu Chai <kchai@redhat.com>
+
+Upstream-Status: Backport [2c445598ce5280e85feb1f0e94d1940a444ee421]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/kv/rocksdb_cache/BinnedLRUCache.cc | 26 +++++++++++++++++++++++---
+ src/kv/rocksdb_cache/BinnedLRUCache.h  | 14 +++++++++++---
+ src/kv/rocksdb_cache/ShardedCache.cc   | 25 ++++++++++++++++++++++++-
+ src/kv/rocksdb_cache/ShardedCache.h    | 20 ++++++++++++++++++--
+ 4 files changed, 76 insertions(+), 9 deletions(-)
+
+diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.cc b/src/kv/rocksdb_cache/BinnedLRUCache.cc
+index 4e5f4dd4..1e6ba7af 100644
+--- a/src/kv/rocksdb_cache/BinnedLRUCache.cc
++++ b/src/kv/rocksdb_cache/BinnedLRUCache.cc
+@@ -150,13 +150,20 @@ void BinnedLRUCacheShard::EraseUnRefEntries() {
+   }
+ }
+ 
+-void BinnedLRUCacheShard::ApplyToAllCacheEntries(void (*callback)(void*, size_t),
+-                                           bool thread_safe) {
++void BinnedLRUCacheShard::ApplyToAllCacheEntries(
++  const std::function<void(const rocksdb::Slice& key,
++                           void* value,
++                           size_t charge,
++                           DeleterFn)>& callback,
++  bool thread_safe)
++{
+   if (thread_safe) {
+     mutex_.lock();
+   }
+   table_.ApplyToAllCacheEntries(
+-      [callback](BinnedLRUHandle* h) { callback(h->value, h->charge); });
++    [callback](BinnedLRUHandle* h) {
++      callback(h->key(), h->value, h->charge, h->deleter);
++    });
+   if (thread_safe) {
+     mutex_.unlock();
+   }
+@@ -463,6 +470,12 @@ std::string BinnedLRUCacheShard::GetPrintableOptions() const {
+   return std::string(buffer);
+ }
+ 
++DeleterFn BinnedLRUCacheShard::GetDeleter(rocksdb::Cache::Handle* h) const
++{
++  auto* handle = reinterpret_cast<BinnedLRUHandle*>(h);
++  return handle->deleter;
++}
++
+ BinnedLRUCache::BinnedLRUCache(CephContext *c, 
+                                size_t capacity, 
+                                int num_shard_bits,
+@@ -518,6 +531,13 @@ void BinnedLRUCache::DisownData() {
+ #endif  // !__SANITIZE_ADDRESS__
+ }
+ 
++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++DeleterFn BinnedLRUCache::GetDeleter(Handle* handle) const
++{
++  return reinterpret_cast<const BinnedLRUHandle*>(handle)->deleter;
++}
++#endif
++
+ size_t BinnedLRUCache::TEST_GetLRUSize() {
+   size_t lru_size_of_all_shards = 0;
+   for (int i = 0; i < num_shards_; i++) {
+diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.h b/src/kv/rocksdb_cache/BinnedLRUCache.h
+index b0fb7148..ba0c2720 100644
+--- a/src/kv/rocksdb_cache/BinnedLRUCache.h
++++ b/src/kv/rocksdb_cache/BinnedLRUCache.h
+@@ -205,13 +205,19 @@ class alignas(CACHE_LINE_SIZE) BinnedLRUCacheShard : public CacheShard {
+   virtual size_t GetUsage() const override;
+   virtual size_t GetPinnedUsage() const override;
+ 
+-  virtual void ApplyToAllCacheEntries(void (*callback)(void*, size_t),
+-                                      bool thread_safe) override;
++  virtual void ApplyToAllCacheEntries(
++    const std::function<void(const rocksdb::Slice& key,
++                             void* value,
++                             size_t charge,
++                             DeleterFn)>& callback,
++    bool thread_safe) override;
+ 
+   virtual void EraseUnRefEntries() override;
+ 
+   virtual std::string GetPrintableOptions() const override;
+ 
++  virtual DeleterFn GetDeleter(rocksdb::Cache::Handle* handle) const override;
++
+   void TEST_GetLRUList(BinnedLRUHandle** lru, BinnedLRUHandle** lru_low_pri);
+ 
+   //  Retrieves number of elements in LRU, for unit test purpose only
+@@ -303,7 +309,9 @@ class BinnedLRUCache : public ShardedCache {
+   virtual size_t GetCharge(Handle* handle) const override;
+   virtual uint32_t GetHash(Handle* handle) const override;
+   virtual void DisownData() override;
+-
++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++  virtual DeleterFn GetDeleter(Handle* handle) const override;
++#endif
+   //  Retrieves number of elements in LRU, for unit test purpose only
+   size_t TEST_GetLRUSize();
+   // Sets the high pri pool ratio
+diff --git a/src/kv/rocksdb_cache/ShardedCache.cc b/src/kv/rocksdb_cache/ShardedCache.cc
+index ef3b3b98..6cbd89ad 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.cc
++++ b/src/kv/rocksdb_cache/ShardedCache.cc
+@@ -109,13 +109,36 @@ size_t ShardedCache::GetPinnedUsage() const {
+   return usage;
+ }
+ 
++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++DeleterFn ShardedCache::GetDeleter(Handle* handle) const
++{
++  uint32_t hash = GetHash(handle);
++  return GetShard(Shard(hash))->GetDeleter(handle);
++}
++
++void ShardedCache::ApplyToAllEntries(
++    const std::function<void(const rocksdb::Slice& key, void* value, size_t charge,
++                             DeleterFn deleter)>& callback,
++    const ApplyToAllEntriesOptions& opts)
++{
++  int num_shards = 1 << num_shard_bits_;
++  for (int s = 0; s < num_shards; s++) {
++    GetShard(s)->ApplyToAllCacheEntries(callback, true /* thread_safe */);
++  }
++}
++#else
+ void ShardedCache::ApplyToAllCacheEntries(void (*callback)(void*, size_t),
+                                           bool thread_safe) {
+   int num_shards = 1 << num_shard_bits_;
+   for (int s = 0; s < num_shards; s++) {
+-    GetShard(s)->ApplyToAllCacheEntries(callback, thread_safe);
++    GetShard(s)->ApplyToAllCacheEntries(
++      [callback](const rocksdb::Slice&, void* value, size_t charge, DeleterFn) {
++        callback(value, charge);
++      },
++      thread_safe);
+   }
+ }
++#endif
+ 
+ void ShardedCache::EraseUnRefEntries() {
+   int num_shards = 1 << num_shard_bits_;
+diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
+index 674e5322..4d3ca302 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.h
++++ b/src/kv/rocksdb_cache/ShardedCache.h
+@@ -14,6 +14,7 @@
+ #include <string>
+ #include <mutex>
+ 
++#include "rocksdb/version.h"
+ #include "rocksdb/cache.h"
+ #include "include/ceph_hash.h"
+ #include "common/PriorityCache.h"
+@@ -45,10 +46,15 @@ class CacheShard {
+   virtual void SetStrictCapacityLimit(bool strict_capacity_limit) = 0;
+   virtual size_t GetUsage() const = 0;
+   virtual size_t GetPinnedUsage() const = 0;
+-  virtual void ApplyToAllCacheEntries(void (*callback)(void*, size_t),
+-                                      bool thread_safe) = 0;
++  virtual void ApplyToAllCacheEntries(
++    const std::function<void(const rocksdb::Slice& key,
++                             void* value,
++                             size_t charge,
++                             DeleterFn)>& callback,
++    bool thread_safe) = 0;
+   virtual void EraseUnRefEntries() = 0;
+   virtual std::string GetPrintableOptions() const { return ""; }
++  virtual DeleterFn GetDeleter(rocksdb::Cache::Handle* handle) const = 0;
+ };
+ 
+ // Generic cache interface which shards cache by hash of keys. 2^num_shard_bits
+@@ -77,9 +83,19 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
+   virtual size_t GetUsage(rocksdb::Cache::Handle* handle) const override;
+   virtual size_t GetPinnedUsage() const override;
+   virtual size_t GetCharge(Handle* handle) const = 0;
++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++  virtual DeleterFn GetDeleter(Handle* handle) const override;
++#endif
+   virtual void DisownData() override = 0;
++#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++  virtual void ApplyToAllEntries(
++      const std::function<void(const rocksdb::Slice& key, void* value, size_t charge,
++                               DeleterFn deleter)>& callback,
++      const ApplyToAllEntriesOptions& opts) override;
++#else
+   virtual void ApplyToAllCacheEntries(void (*callback)(void*, size_t),
+                                       bool thread_safe) override;
++#endif
+   virtual void EraseUnRefEntries() override;
+   virtual std::string GetPrintableOptions() const override;
+   virtual CacheShard* GetShard(int shard) = 0;
+-- 
+2.33.0
+
diff --git a/recipes-extended/ceph/ceph/0005-kv-rocksdb_cache-mark-Shard-const.patch b/recipes-extended/ceph/ceph/0005-kv-rocksdb_cache-mark-Shard-const.patch
new file mode 100644
index 0000000..bc18574
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0005-kv-rocksdb_cache-mark-Shard-const.patch
@@ -0,0 +1,32 @@
+From 52c57e25a5e2c617bc797b8ce50060b5894bd7fc Mon Sep 17 00:00:00 2001
+From: Kefu Chai <kchai@redhat.com>
+Date: Tue, 17 Aug 2021 18:06:31 +0800
+Subject: [PATCH 5/6] kv/rocksdb_cache: mark Shard() const
+
+it does not mutate anything, so mark it `const`.
+
+Signed-off-by: Kefu Chai <kchai@redhat.com>
+
+Upstream-Status: Backport [0296ac4458c0be0609f033e15b0fa8c6c9c20049]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/kv/rocksdb_cache/ShardedCache.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
+index 4d3ca302..f98421a0 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.h
++++ b/src/kv/rocksdb_cache/ShardedCache.h
+@@ -136,7 +136,7 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
+ //    return Hash(s.data(), s.size(), 0);
+   }
+ 
+-  uint32_t Shard(uint32_t hash) {
++  uint32_t Shard(uint32_t hash) const {
+     // Note, hash >> 32 yields hash in gcc, not the zero we expect!
+     return (num_shard_bits_ > 0) ? (hash >> (32 - num_shard_bits_)) : 0;
+   }
+-- 
+2.33.0
+
diff --git a/recipes-extended/ceph/ceph/0006-rocksdb-build-with-rocksdb-7.y.z.patch b/recipes-extended/ceph/ceph/0006-rocksdb-build-with-rocksdb-7.y.z.patch
new file mode 100644
index 0000000..c7ca704
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0006-rocksdb-build-with-rocksdb-7.y.z.patch
@@ -0,0 +1,109 @@
+From 06f23837c757ff7a8aa8db4e5965e25e9ca69f45 Mon Sep 17 00:00:00 2001
+From: "Kaleb S. KEITHLEY" <kkeithle@redhat.com>
+Date: Mon, 23 May 2022 07:41:26 -0400
+Subject: [PATCH 6/6] rocksdb: build with rocksdb-7.y.z
+
+RocksDB 7, specifically 7.2.2 has landed in Fedora 37/rawhide.
+
+https://tracker.ceph.com/issues/55730
+
+Signed-off-by: Kaleb S. KEITHLEY <kkeithle@redhat.com>
+(cherry picked from commit eea10281e6f4078f261b05b6bd9c9c9aec129201)
+
+Upstream-Status: Backport [be3ca10e60ade9dbe7d3e5cb018f32c7cc97e2ed]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/kv/RocksDBStore.cc                 | 7 ++-----
+ src/kv/rocksdb_cache/BinnedLRUCache.cc | 2 +-
+ src/kv/rocksdb_cache/BinnedLRUCache.h  | 2 +-
+ src/kv/rocksdb_cache/ShardedCache.cc   | 2 +-
+ src/kv/rocksdb_cache/ShardedCache.h    | 4 ++--
+ 5 files changed, 7 insertions(+), 10 deletions(-)
+
+diff --git a/src/kv/RocksDBStore.cc b/src/kv/RocksDBStore.cc
+index 328277e5..115d28fc 100644
+--- a/src/kv/RocksDBStore.cc
++++ b/src/kv/RocksDBStore.cc
+@@ -728,19 +728,16 @@ int64_t RocksDBStore::estimate_prefix_size(const string& prefix,
+ {
+   auto cf = get_cf_handle(prefix);
+   uint64_t size = 0;
+-  uint8_t flags =
+-    //rocksdb::DB::INCLUDE_MEMTABLES |  // do not include memtables...
+-    rocksdb::DB::INCLUDE_FILES;
+   if (cf) {
+     string start = key_prefix + string(1, '\x00');
+     string limit = key_prefix + string("\xff\xff\xff\xff");
+     rocksdb::Range r(start, limit);
+-    db->GetApproximateSizes(cf, &r, 1, &size, flags);
++    db->GetApproximateSizes(cf, &r, 1, &size);
+   } else {
+     string start = combine_strings(prefix , key_prefix);
+     string limit = combine_strings(prefix , key_prefix + "\xff\xff\xff\xff");
+     rocksdb::Range r(start, limit);
+-    db->GetApproximateSizes(default_cf, &r, 1, &size, flags);
++    db->GetApproximateSizes(default_cf, &r, 1, &size);
+   }
+   return size;
+ }
+diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.cc b/src/kv/rocksdb_cache/BinnedLRUCache.cc
+index 1e6ba7af..c4918355 100644
+--- a/src/kv/rocksdb_cache/BinnedLRUCache.cc
++++ b/src/kv/rocksdb_cache/BinnedLRUCache.cc
+@@ -531,7 +531,7 @@ void BinnedLRUCache::DisownData() {
+ #endif  // !__SANITIZE_ADDRESS__
+ }
+ 
+-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
+ DeleterFn BinnedLRUCache::GetDeleter(Handle* handle) const
+ {
+   return reinterpret_cast<const BinnedLRUHandle*>(handle)->deleter;
+diff --git a/src/kv/rocksdb_cache/BinnedLRUCache.h b/src/kv/rocksdb_cache/BinnedLRUCache.h
+index ba0c2720..266667f0 100644
+--- a/src/kv/rocksdb_cache/BinnedLRUCache.h
++++ b/src/kv/rocksdb_cache/BinnedLRUCache.h
+@@ -309,7 +309,7 @@ class BinnedLRUCache : public ShardedCache {
+   virtual size_t GetCharge(Handle* handle) const override;
+   virtual uint32_t GetHash(Handle* handle) const override;
+   virtual void DisownData() override;
+-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
+   virtual DeleterFn GetDeleter(Handle* handle) const override;
+ #endif
+   //  Retrieves number of elements in LRU, for unit test purpose only
+diff --git a/src/kv/rocksdb_cache/ShardedCache.cc b/src/kv/rocksdb_cache/ShardedCache.cc
+index 6cbd89ad..7d160f9c 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.cc
++++ b/src/kv/rocksdb_cache/ShardedCache.cc
+@@ -109,7 +109,7 @@ size_t ShardedCache::GetPinnedUsage() const {
+   return usage;
+ }
+ 
+-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
+ DeleterFn ShardedCache::GetDeleter(Handle* handle) const
+ {
+   uint32_t hash = GetHash(handle);
+diff --git a/src/kv/rocksdb_cache/ShardedCache.h b/src/kv/rocksdb_cache/ShardedCache.h
+index f98421a0..855912d7 100644
+--- a/src/kv/rocksdb_cache/ShardedCache.h
++++ b/src/kv/rocksdb_cache/ShardedCache.h
+@@ -83,11 +83,11 @@ class ShardedCache : public rocksdb::Cache, public PriorityCache::PriCache {
+   virtual size_t GetUsage(rocksdb::Cache::Handle* handle) const override;
+   virtual size_t GetPinnedUsage() const override;
+   virtual size_t GetCharge(Handle* handle) const = 0;
+-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
+   virtual DeleterFn GetDeleter(Handle* handle) const override;
+ #endif
+   virtual void DisownData() override = 0;
+-#if (ROCKSDB_MAJOR >= 6 && ROCKSDB_MINOR >= 22)
++#if (ROCKSDB_MAJOR >= 7 || (ROCKSDB_MAJOR == 6 && ROCKSDB_MINOR >= 22))
+   virtual void ApplyToAllEntries(
+       const std::function<void(const rocksdb::Slice& key, void* value, size_t charge,
+                                DeleterFn deleter)>& callback,
+-- 
+2.33.0
+
diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
index f2ece8c..14b4c97 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_15.2.15.bb
@@ -17,6 +17,12 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
            file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
            file://CVE-2021-3979.patch \
+           file://0001-kv-rocksdb_cache-drop-ROCKSDB_PRIszt.patch \
+           file://0002-kv-rocksdb_cache-reorder-ShardedCache-methods-declar.patch \
+           file://0003-kv-rocksdb_cache-define-DeleterFn-function-pointer-t.patch \
+           file://0004-kv-rocksdb_cache-implement-methods-required-by-rocks.patch \
+           file://0005-kv-rocksdb_cache-mark-Shard-const.patch \
+           file://0006-rocksdb-build-with-rocksdb-7.y.z.patch \
 "
 
 SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
-- 
2.33.0


