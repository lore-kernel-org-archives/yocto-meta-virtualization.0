Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.1338.1637722308775871216
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Nov 2021 18:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RGXn5dfS;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6962a6b1c4=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AO2m7tr021479
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Nov 2021 18:51:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ntF5i58mvZIqXO6MM2MDIQ83CGJjexq+2n7GdGjzz9Y=;
 b=RGXn5dfS1AYcUXHl+vMi1XGDtFFm43o+BTkWy5GXYgUk7YFZp3QiaoKIASbNEqRNncci
 olB+1KVl55FZr7Ko2ZCeks6admQxOE8syJ9jhXYalKLoCCqcnS2Sy/4r73mr1TicR44D
 K4Hnl+XPS+k2ifnJz3tpq7cGl01hwm0WaUkXRYLCBFK67bvLdp6kTUkDfjPhwX59ZXm0
 YwDqXxCrEEN9e0MVC0s8c6XoOAYMQoWzDRe8dY3Elb2JP5pRl+A+RsK0JR3JHUV9hSYK
 geFrf+WUCpp7LlNxRq1iSLT2fjUegZ4omO+VXB7G7MnByBxMvJyKMU/xinVYuG09qacd +w== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cgc69sg27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 Nov 2021 18:51:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXh5BW8NlJyOeqkKFNQyLm7eMVipIZhkVNm71Q+SUPWSSdoO9o259R1nDaGZPyjcEELZWPvrHPkx4m+aagIOVX7RyBR3QrF5VPJIBQET4rVqI4PHCZ1pT8X1hSIu4dWnkWndtSWJ8jNhXy937mUL+Fpy4RtFdKXN34Yl6DLKxfVtH5dwJV5iqYkzMXbv7Faa+/vBOYqAnTra+X89QBRoLB+Gql2t0cm5ELxHroDJGztPmaFCJxYoEWgEkQEkTRq24+jxhZ1kvLJnn2WM+xTUiN3hbRBB4ufJshLH1BLyOmyRWqStbYE2KL5CNkVf6f6RuHRWTcYFYR+CZhPsvfT1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntF5i58mvZIqXO6MM2MDIQ83CGJjexq+2n7GdGjzz9Y=;
 b=O/s6rYN7NeuZojb+fQM4dBDl+BIYjalFgRCAt3tUFUna2p5+W3SelENA3jDEzNEfU2KX3aF3d/rCnM3caPVPpFTyPG7OvTu3CocT1g0fgPP8JUQhmk0q95Ht2yTnWW0FucR9WRkqUKiqyfxvegiMohymI+dwdbOX6a++figUvW5Jql9ZeCVb7qqw5YwT7w8PddN0NU1Gzw54Mt/SNvhT+CH1RgaH+XwpMJMq8LhsLI0pMzHcz5imLgpzjBVZd9D5JZctJ+DC8z7e9n5AV6SXGsjuD3928+by7WKcHCkh9AHiH4p2VP4h0E+CTm4WJT7EuTzZWeMjC2v6A3bTBhULIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5734.namprd11.prod.outlook.com (2603:10b6:8:31::22) by
 DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16; Wed, 24 Nov 2021 02:51:46 +0000
Received: from DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::5db7:737e:8ef0:c831]) by DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::5db7:737e:8ef0:c831%3]) with mapi id 15.20.4649.019; Wed, 24 Nov 2021
 02:51:45 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] libvirt: fix CVE-2021-3667
Date: Wed, 24 Nov 2021 10:51:33 +0800
Message-Id: <20211124025133.3006437-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::11) To DM8PR11MB5734.namprd11.prod.outlook.com
 (2603:10b6:8:31::22)
MIME-Version: 1.0
Received: from pek-lpggp1.wrs.com (60.247.85.82) by YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Wed, 24 Nov 2021 02:51:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddea3ea4-d700-42c3-b9b4-08d9aef55a26
X-MS-TrafficTypeDiagnostic: DM6PR11MB4626:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB462661B8EF5109C822754FEEE4619@DM6PR11MB4626.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gHxLbWQ+rH0ZmX/nrCNxIYemq8HErFaAoIjyAfEosrCRdmfFsL3q/H2iJp2KKuBhKcJT5eblbLWxF+O9kWbvWBiSMA2pUgvGigrIJKb4xx+AEFCQbFF3q/1+TWNe4GoxjAgwsiECAeKnuRHi5Zzh8azOrGsRF010PqwHnkRjQWtR0yd8w/MEzDRywN575llyT1KL8nO31KNDM7A0Rv8TWhvLA4uAvr9218r6zmNDpYnOk1WOQI+7zfuNG8FFLlHsa43sujvxRzcDLDH0zGV+IqVeQlevn9OGsTp1sjk2S5EGoL+z2mBS6hyysdWUuGCccsFtmPIVoNdevyF3kzEs449mV4Bg3AqrS52lXRqPif1tES4nompWJqIp+3Iq8J3zQMOqck8RJ/xrq4qc0X9ZQIZaRq7JmmpY0DkRxl9PI/C74QXpMX6OVCxpjUn7KhWxGxfj07mkFuSz3dOWKxC52gsZ+4A//MDM6w0YWXFyO1Hemzrcpyzx+xscgAIjT2zCXbLIAEe9jJs9KBjwp6EzN7YcfuEvKmDUDIQg7wItwdm8PkLSn+/tfCSddQLrzuvjHG7YRSY3IbDhSl01lpKt+Xs0DNho32MCNRz5Kq0/s3nnJPZEiPjfuwuMPSd22Bz3hzW2684wf8oyiM4LIgq+H+UwzAs/A7K5KEuHeIbczumMJYW2JN/1uqcPluyewpILzn9/0tPqEisILch6dE/jQKfTZfUCXGic1srGhO2q7m9Rn5U7hpA3OYw7jp7seLKjLSPU7ROBZqe4LgwUS+0qLnUVpGZXwwPIJ05hsuM3k8QzMMtYZqsRCsoiGD7006TOQMVI/dPXBEYAxqilsO3Hag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5734.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(38350700002)(6506007)(83380400001)(8676002)(6486002)(186003)(6512007)(1076003)(66556008)(5660300002)(26005)(2616005)(36756003)(66476007)(66946007)(2906002)(44832011)(316002)(966005)(52116002)(8936002)(956004)(508600001)(6666004)(86362001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RnUNrsGRoAbuRr/H7OT/PGcwF1EMguKUqCjwFilrkPaI2+JF4I/MvD7oIiu8?=
 =?us-ascii?Q?nae+6k3EbUaV4i18Mc5HhBRNmSlTU56E52UV3YkfuYE/QTu4+P6GoZ5cGGdf?=
 =?us-ascii?Q?NxAYuEfmtqC7iFdWzYjdB8VBQhnknGpDho0n4RbuWjoWiBo8tp9nCyS5oKs6?=
 =?us-ascii?Q?L3tJRu0oRSD0boT1CUW9AX6JQjND9JJSsRhUYBWQSO2yfc/NGPxlz/qbJ7Vm?=
 =?us-ascii?Q?v67n2IeUm8wqjfsa8atBOfaPgbYukhOC1GnSW0b+pOG4UMPumqstojxGAx3D?=
 =?us-ascii?Q?pybD1Aj6FRDcCtcIns3fUwu8lYVny9RK7Nc6f16Erpshay3mmiMq7svygVJd?=
 =?us-ascii?Q?p1CVfoQT4fnVv4f5RtB7fHItoA7oWgkK7/vzCFx7ZLqoUtPJ40lVrJOrsV27?=
 =?us-ascii?Q?FHG5p7sCSfeVp+ozkVkCbqF4eXhd0DIhm1+oQJwfR6bcFrTA9iqDbj4AFKHf?=
 =?us-ascii?Q?HHbp2VRzaTF/kH/dj2OzsrY8VbC1AttbHUOp1Q+rk8Lrj2fQOBbtSEmzDfNH?=
 =?us-ascii?Q?a8HkeK8SnM1sMK5biGUNtWx4xq1Pyu8XblABVSsdrPgy2AXpa5ouiaCspswN?=
 =?us-ascii?Q?xGzL5yhuu4fvRRxfrY2XTADKLwB60EGVs/aTH+9QD5Ywp6Hg6mMlZKUQ3kAp?=
 =?us-ascii?Q?CSM7IfOLnn5nC/nY3ooY7Yc8uscK5RzsiNwz8sbkt/Q1nhkgnACysMaqGlMq?=
 =?us-ascii?Q?8GfMHVzVBoTKva3/nkawEb22ssB0sTkdi4ELqmiToGHqn6oZYfAJUBmTtn1X?=
 =?us-ascii?Q?rMMdCxXCOPyMvZ/F8dsr5TApcm9HIli0feXFD80cGDcUzQ8FDybtJbO/jg2o?=
 =?us-ascii?Q?L39RD/gR4u/diiDed2PkxSv3xYyEczJ2L9ijPS6mcADAtfkzvhNrr+bo+j04?=
 =?us-ascii?Q?rcwZMxY36bcRvJTxjWjE9kz5xPxcEfBMXRRmnc6tTH7AE5r4jBcBMr8hytuj?=
 =?us-ascii?Q?qY6yb3IRMof93pOi9tWXpRsCr6rfdX1dvU7kAmaLD6MRYMCbm51UzUW5akE5?=
 =?us-ascii?Q?xLPQam9yikrt6snqadN5SnzC3pskvMCtCIcIVU9wuZJMnTyARzI81BGeEFRZ?=
 =?us-ascii?Q?ZHA2o3mQoCyi+yfSC1SR9s78Dws5C7oC92I9pbUHrUyDNugpY45vGFTK5FCG?=
 =?us-ascii?Q?ZUiovlWXvWufXLdKtskQHiHWbRvbIVzTCAxSZbpl/i9uwmQ8Vh/sFCBXD1oe?=
 =?us-ascii?Q?is311sJJcgjH22I2ZQgB/smTbSzJmTE43CeZ2XEPDqAdv5IM4fYo6J64wP3j?=
 =?us-ascii?Q?1ya/pDNMJQCjsDHysGEod5CCRoSZ/uGsNJrCATYjCDRbMHdM+5LbNvs5d7Gt?=
 =?us-ascii?Q?jNw8KUY0Oj0Le2LpcyyYhTyGdSXLFUkBZMC7lzBDhOG+Cq4g7AdIIllEhJCc?=
 =?us-ascii?Q?56v3eUm7lQtsa5IEIx9o9ZWKBIAmhELOvVbcf8IVKTB6HM6GgzQpZeik+bDL?=
 =?us-ascii?Q?SxXtC+2aiG3iC+JFw4Q8CZT9vfXro5byV63l6n8prQ2Sl11JFNVdP0APDFVF?=
 =?us-ascii?Q?f8TetXgeGzKahwKNZsLWkp/MXu94A2qK15CHMRJe4NLvXkOjlwtu2lmCPSJ8?=
 =?us-ascii?Q?Hs3G6xHAjrzdAtmTKyBMMS24hPcOkB3bFpWl2YCbbUQRuT3DiQPC5ZXCuPdu?=
 =?us-ascii?Q?VuiWlWAARiXxl09GxdFrDfo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddea3ea4-d700-42c3-b9b4-08d9aef55a26
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5734.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 02:51:45.6425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyXH7suhIoybOstTv0Fd7shu2s4PU8uzcl4MCEW6X2LsRKbqE73Gpiuh0GEXp3YpiXSnMP2Pj6YOUfG4nP8UXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
X-Proofpoint-GUID: OvwmFWzEVTbNqBAbrEgyC5xU9v30EyWP
X-Proofpoint-ORIG-GUID: OvwmFWzEVTbNqBAbrEgyC5xU9v30EyWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_01,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111240015
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport a fix for CVE-2021-3667.

The CVE discription: An improper locking issue was found in the
virStoragePoolLookupByTargetPath API of libvirt. It occurs in the
storagePoolLookupByTargetPath function where a locked virStoragePoolObj
object is not properly released on ACL permission failure. Clients
connecting to the read-write socket with limited ACL permissions could
use this flaw to acquire the lock and prevent other users from accessing
storage pool/volume APIs, resulting in a denial of service condition.
The highest threat from this vulnerability is to system availability.

Refer to: https://bugzilla.redhat.com/show_bug.cgi?id=1986094

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 ...nlock-object-on-ACL-fail-in-storageP.patch | 40 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_6.3.0.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch b/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
new file mode 100644
index 00000000..608322d9
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
@@ -0,0 +1,40 @@
+From d3e20e186ed531e196bb1529430f39b0c917e6dc Mon Sep 17 00:00:00 2001
+From: Peter Krempa <pkrempa@redhat.com>
+Date: Wed, 21 Jul 2021 11:22:25 +0200
+Subject: [PATCH] storage_driver: Unlock object on ACL fail in
+ storagePoolLookupByTargetPath
+
+'virStoragePoolObjListSearch' returns a locked and refed object, thus we
+must release it on ACL permission failure.
+
+Fixes: 7aa0e8c0cb8
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1984318
+Signed-off-by: Peter Krempa <pkrempa@redhat.com>
+Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
+
+Upstream-status: Backport
+CVE-2021-3667 [https://bugzilla.redhat.com/show_bug.cgi?id=1986094]
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
+---
+ src/storage/storage_driver.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/storage/storage_driver.c b/src/storage/storage_driver.c
+index ecb5b86b4f..de66f1f9e5 100644
+--- a/src/storage/storage_driver.c
++++ b/src/storage/storage_driver.c
+@@ -1739,8 +1739,10 @@ storagePoolLookupByTargetPath(virConnectPtr conn,
+                                            storagePoolLookupByTargetPathCallback,
+                                            cleanpath))) {
+         def = virStoragePoolObjGetDef(obj);
+-        if (virStoragePoolLookupByTargetPathEnsureACL(conn, def) < 0)
++        if (virStoragePoolLookupByTargetPathEnsureACL(conn, def) < 0) {
++            virStoragePoolObjEndAPI(&obj);
+             return NULL;
++        }
+ 
+         pool = virGetStoragePool(conn, def->name, def->uuid, NULL, NULL);
+         virStoragePoolObjEndAPI(&obj);
+-- 
+2.27.0
+
diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
index e68053a7..d028366d 100644
--- a/recipes-extended/libvirt/libvirt_6.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://CVE-2020-25637_3.patch \
            file://CVE-2020-25637_4.patch \
            file://CVE-2021-3631.patch \
+           file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
-- 
2.27.0

