Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF294C004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 05:43:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9042.1674020587874475713
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 21:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0382714a72=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30I5dZHm020885
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Jan 2023 21:43:07 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqbahk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 17 Jan 2023 21:43:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYeAmxfndTX2pDeqcV2c8aFo4rYfDE/2x4pBNAsxoR3rUh6TAV8oXyQSTruhYhjT849hKJyenZ5/sssghu9Sz7m5R2yIUj5DCVv6oQ+ofTDalH8QD2Aunu7/Zj5ElY0Y19gjvbi04jz+8BNGP3SSHutF2Uuzpk0kV5j+AScTM3Vs5Y/K/dbHqkpwJEhtvkc8RfsTHkBcbby7w2tjexGDZTSFkrkkiIZxEUzZr/jjOp/C23XTR/M4jrN0ElDiEGPQlOiZ8Ogh8u1qA0KDztdXl9zuL/1zizkOo/sue1de4SJDx99jpHswDw9IIjJfArroExbC2yKWtRrtu7Zz1x/+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mc2/fWdzTNXSwh1WiLUy7Wb3hsxEFEmujTEJ6z1CEw=;
 b=GSFXrMciODgFpaop44PhBe8PZhx6pdZfqHn0gw6CqEElhtlJdS5oRJRB/L8fjsmoxinDaIN5qhpPAZmjKNrqHewZxzTVpbWv0q39Vm3UQOdp8RJBioH8bqKXWnZNxOk7K3XUD2ZuBTe93fEM54D66tvJnfIwiwTZWl3JVw6QJLJmADcsPl9/c9NEyqK+pgWdsWt7svDakbO2ZYyFUM+SG6MTip3GgCfuMGFJxzCDj2sIg0JSUKvI7dzAikQyoUh/jFkdFR+poiotzj8nVrbIIwAWqb6gI9HnPf2yGyN9D8jFWiKT+54Gy27LKddn5ai54IDfzRVHOtXnf4bbmKAUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 05:43:04 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 05:43:04 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix soruce code comments contain build folder path cause QA Issue warning
Date: Wed, 18 Jan 2023 13:42:42 +0800
Message-Id: <20230118054242.2619152-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:74::24) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ba812b-8968-404c-fc99-08daf916de86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KATIPwXdi8dQnTXaTUfsA/smgucFkJyUfQ8qmJWWm7m4zKVf3O5sW82TUJ6gGqztWRAdES8eX7X9cUCpYkvgX6/dbGAVhLp6lQIVIcIHjyvz1iik7lzJWeUTLphg4L52gexWH8QYp3KLdk5BtUDjZMYjfk7yJ0e2yV1F6qvsFSVPshakYxZNNVJ+JWvfgcEDE83KFPNMa7cvtxskkZcZXWwyJGGeQxcHOajIVovkGj9Z8AnS5R6q2sMeaXcT15n/fdWzdCIq1Ff1OwQ4cBe86ORW5+RaF1BSWkPu0NhnuSbclO1ss+5gqtG79eJBvPHgKCFDi9V1Y8SQTHHxTk4eu/FXYrngenXEf7JnxL356/DT532pb7qD8cUDTpOc/5XpiE/bG+gslXhR/Ii7EfCtH9As05QDHqxOqN5DQy4pHMNp44EcoZ1K8ghNy8OGDQ/fFU2jw4iB67pd18GGKme+NswYT7ppvjfzDp+OkKneOAIiP1Vjb+C4l32xzdHk7KSuk3cID3LgjI5S84MqxyE2nmBDnUioSy7U6xj/2XGnR6u4nDkQeaT0zwi/6V7+1h71/b2j7ITMrqseh4Wpmm3RoJkni6d6YQD2q0OtziT4x4jv+OfQy6Hft+gE2bDAl9+KE5czErRozNPDNgryB6PFxqsdWpvFTeazTJPm55D5xDH3qTg6wYWZahebt7x1Wa5dm29GWUGFeyHt9KMruEvO80fokBFZgX/CZfWxTtLmMF4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(451199015)(83380400001)(83170400001)(38350700002)(38100700002)(8676002)(6916009)(5660300002)(8936002)(66476007)(44832011)(2906002)(66556008)(66946007)(41300700001)(6506007)(26005)(186003)(2616005)(1076003)(6512007)(6486002)(316002)(478600001)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PeHYn2Sl418bmE8HgYMoSp+nloURQFeGt7sSu1kGHZ/27FF0y19wDmg3G5BX?=
 =?us-ascii?Q?Corcvky6DF3l7Gh8kiN2nMSBDA5KXiQUBER1kXlUgYnSBZX2054ECNSJCx/Q?=
 =?us-ascii?Q?aqMY/YoIg/op6J5K6kk6P5DXq8g7sWktOtq4hRrc6hhZq0xJG6W7kw7tXnyJ?=
 =?us-ascii?Q?a4EZmtD9bK1a6Nhxqfej5RDvz+yaOn09/TS0TcMfCsIYXooVkCnEaGnnmcnI?=
 =?us-ascii?Q?uJc6Hkyk5mqs3mUM+ZUUrHtl/do8blGVv2pfUXBxtwGl0XyH7gQCPWxsXq1t?=
 =?us-ascii?Q?N1ArVv/Wu+8D0yQL9XID8pQ+rcSXhrIhiYPVAlLcV+8/0yXmvvIdlta9zwCL?=
 =?us-ascii?Q?sHQlbkIQukIdgNud7dA2JuS8wBmI8AaHaztaMEN+l1o9uVNRnaY0WOk2tUMI?=
 =?us-ascii?Q?mt5NTIXUpFH6Q2P2OqEjizoGrz0aeDhUhFRPLcYifdM0oOj4C24SKciVmlbM?=
 =?us-ascii?Q?4ZBiTVO+4l5/vdVU4dUgcNre4d7mBQDgLSVFhJQRHit4xhsTP0aBR6R+IcMZ?=
 =?us-ascii?Q?+LWJtSCX7oVKbbRYyEgADFrMVyEv8xtSg+5zZcJvgD6+HxmsX3kBESMSfe+F?=
 =?us-ascii?Q?uv5xV0uBl+aYLAyZrgMCEttwHHL11ZbLDARh8XwzDKbRPhK2NXNefgN2YkTy?=
 =?us-ascii?Q?nBdmQe+BUOVcAcq16xzLNAAjf3hI1l3dl2rMOd43whrDJUBdqkyZqZzllgIL?=
 =?us-ascii?Q?dh00ZopOI1+CWLX8LOaxMNIFjK30CYn6VImy3VRHdYmmZwMVINU/JAumLnQD?=
 =?us-ascii?Q?jrZ5gmWWzlOtpMSPe/Wk5fAe0nrToEdVQ7C0HmemCgZV3/uPvaIPOIz2wraW?=
 =?us-ascii?Q?eSJ6ozcceYj/yLKEvPurKV3zrHLgrWfoLqWDfjDlJAoGni+pwDzYfFpYkxm8?=
 =?us-ascii?Q?MhChSGr9jgFNoQYIbiT5kIiWbPkCRzkA/bxK2bucwTtsoomgszoIf0gq5QiW?=
 =?us-ascii?Q?egx9uT8iGxLe/Dj1gbD3dqwX1FB0+tKNzz3iwVu8TDkAWkDxNgQSclh86MO5?=
 =?us-ascii?Q?7fr2m+aUMQtsN5GnJPlp3REPa2TJQXwV77hdlhCzVmWMVJstl7ewnWZB7tYz?=
 =?us-ascii?Q?BVEvZjAt5Fw67H/QPUOgjQOMjjSs0NQR/VkAd/5w/hLbzyI3gWShOKPxcXPF?=
 =?us-ascii?Q?eBsN4R/ZS7UnAMTUPQZnAt8/v63oyKpYnHAha9NCPEzT9j0tp4S+8Y22xfUi?=
 =?us-ascii?Q?14szL6RSU15atqVgAKxJTaTzu4PgIv6yGJWmMldsBGt3Ma8KcUv8LLHtiDi2?=
 =?us-ascii?Q?tRxhFcmRXkc9uoRC++ZyFNOXIZwyqq7+5PfI3qcu1/Al+3zIkZEamxDcDZv3?=
 =?us-ascii?Q?HPSjBnJc425SSHpRIU31y5C+uKh2LamEjW6OAAgBA+Iz2rz9LFbZfdAgnQR7?=
 =?us-ascii?Q?7gO2+JuR1qYR4lFzrmMlqBW3t3t55pE3Q8nWgR1Hs8jo2W2bntVCq/WNghL6?=
 =?us-ascii?Q?PNzqjzsj9F6hHhhB7806WIs7zAyQgUlJWOFwhiztSuJ+Jlwjh7yIbYd2Mxbe?=
 =?us-ascii?Q?BNAfnlWELPUHnQfua/HBPw7am4Gmeq/G40o+k+6e9oK7e2diIu6Qz6e+tIks?=
 =?us-ascii?Q?ldJFPjeej2DyKkYBxzxyOG4GjVrTZYcjJvEg3QuzRKi4jVIJpPyizfU/4I9K?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ba812b-8968-404c-fc99-08daf916de86
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 05:43:04.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBbmbUHUKTkj9sJ9rbBdHg5jWMbtEsmJiQN5RmTkme7hdUvP2vMO1AAO0+YSt2PHqtB4DzrHJQRn1Q2iUrRpkrkNyONEWJth4E2JD1KzH2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
X-Proofpoint-GUID: GyU3fYJRUGX22Lky5V1bvyyzcm2gS69F
X-Proofpoint-ORIG-GUID: GyU3fYJRUGX22Lky5V1bvyyzcm2gS69F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_01,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=690 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301180048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Jan 2023 05:43:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7817

From: Xiangyu Chen <xiangyu.chen@windriver.com>

gendispatch.pl add build dir in code comments which was generated
by itself. those build dir information would cause yocto qa report
warnings like:

WARNING: libvirt-8.1.0-r0 do_package_qa: QA Issue:
File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheckqemu.h in package libvirt-src contains reference to TMPDIR
File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapichecklxc.h in package libvirt-src contains reference to TMPDIR
File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheckqemu.c in package libvirt-src contains reference to TMPDIR
File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapichecklxc.c in package libvirt-src contains reference to TMPDIR
File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheck.h in package libvirt-src contains reference to TMPDIR
File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheck.c in package libvirt-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...tch.pl-generating-build-path-in-code.patch | 54 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_8.1.0.bb     |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-prevent-gendispatch.pl-generating-build-path-in-code.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-prevent-gendispatch.pl-generating-build-path-in-code.patch b/recipes-extended/libvirt/libvirt/0001-prevent-gendispatch.pl-generating-build-path-in-code.patch
new file mode 100644
index 0000000..5a909b4
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-prevent-gendispatch.pl-generating-build-path-in-code.patch
@@ -0,0 +1,54 @@
+From ba915b13b92f3a625633ede43789c1ba780371af Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 18 Jan 2023 03:19:07 +0000
+Subject: [PATCH] prevent gendispatch.pl generating build path in code comments
+
+gendispatch.pl will add build dir in code comments which was generated
+by itself. those build dir information would cause yocto qa report
+warnings like:
+
+WARNING: libvirt-8.1.0-r0 do_package_qa: 
+QA Issue: File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheckqemu.h in package libvirt-src contains reference to TMPDIR
+File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapichecklxc.h in package libvirt-src contains reference to TMPDIR
+File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheckqemu.c in package libvirt-src contains reference to TMPDIR
+File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapichecklxc.c in package libvirt-src contains reference to TMPDIR
+File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheck.h in package libvirt-src contains reference to TMPDIR
+File /usr/src/debug/libvirt/8.1.0-r0/src/access/viraccessapicheck.c in package libvirt-src contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/rpc/gendispatch.pl | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/rpc/gendispatch.pl b/src/rpc/gendispatch.pl
+index 9f5bf0e..c73a9dd 100755
+--- a/src/rpc/gendispatch.pl
++++ b/src/rpc/gendispatch.pl
+@@ -449,19 +449,19 @@ sub hyper_to_long
+ 
+ if ($mode eq "aclsym") {
+     print <<__EOF__;
+-# Automatically generated from $protocol by gendispatch.pl.
++# Automatically generated by gendispatch.pl.
+ # Do not edit this file.  Any changes you make will be lost.
+ __EOF__
+ } elsif ($mode eq "aclapi") {
+     print <<__EOF__;
+ <!--
+-  -  Automatically generated from $protocol by gendispatch.pl.
++  -  Automatically generated by gendispatch.pl.
+   -  Do not edit this file.  Any changes you make will be lost.
+   -->
+ __EOF__
+ } else {
+     print <<__EOF__;
+-/* Automatically generated from $protocol by gendispatch.pl.
++/* Automatically generated by gendispatch.pl.
+  * Do not edit this file.  Any changes you make will be lost.
+  */
+ __EOF__
+-- 
+2.33.1
+
diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index 1de2988..0ffd510 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://hook_support.py \
            file://gnutls-helper.py \
            file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
+           file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
           "
 
 SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
-- 
2.34.1


