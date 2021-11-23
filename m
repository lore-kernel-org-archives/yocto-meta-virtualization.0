Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.8489.1637653859846860552
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Nov 2021 23:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HyTHqZO6;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=696142a71a=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN7oZ1m001725
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Nov 2021 23:50:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Z8u7MyJp1JIaijVBBvbngveru4WgTNVFmiOoHJM0xR0=;
 b=HyTHqZO6cGoL969O3fKOgbdGq/t/94WlGzKYxJSnlx+n0JsgdQnduRaSN5jsyjKjRwbF
 JhU/tOVQYt3k+mqJHNNqJfHAhGlWdkg6ujaTy6K0f53lrvE7Uhs6PNgxNm2KC5YwfruG
 TLVtsjTKwVWk3k+cNWx+jqKFHi+vsKxRlnmdFzwH/jjA8G2D5sr5WgufKeD0qBpu1cDs
 1RMK7A0cbeRF7VifctQGulATb6sD6JSxR5akyaDbgUh93xokvJUC1iXrNeDFVxPz1oz0
 SBhYxJn92/DGn+gToUNLZSRjqvnqcPlxq4V0G6SEQobPuCTcRn4dmo8daDQ+/+B4+PMp AA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cgc69rq0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Nov 2021 23:50:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnSyMJrN60xYfWrRl16Vlx2rmZsw7eyPWAdmQR5G0pFkmTGwqFUBWBwUYAVjxr4ccWOcIWqH3eWjDKM62rB+0MSh/uQDV39vRfBTq5CI20WaWBCEdqbgdeAGCb3ZCeRlsD4zDY6KCwYdYAVe3V34oVFFZ/CyD6bGWSqJpboHSirdyi33KGfK/cW3xn7wWW10EK5s0V+TgejTxb5GfUlDo2VGfVOwLCrO0o16gFZpYGLlTD/DdIOBFfOIwJCB0m8EdJ6OlvwLISrnvRT9wXzPVZ1KTcp/1s/e29VucEvHVjzYd1e7olbnKkC5WGLPLTb8nkmNBVACQD1sSHWpXw9NQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8u7MyJp1JIaijVBBvbngveru4WgTNVFmiOoHJM0xR0=;
 b=hA6c0/IRxP8gou/elxTgdBTZjmsuN2uFbnhcLqTX4VhGtB1gbLhc8qH2FLXAsLz5sGWZ8I0wKnoyvhKblefhgZmA8obBwR/XmYpuLqx3xtXaWgIeapvy6dmgaeGLhN7gROvFioBhoFQtJlJz/3jKobLr4LEisrWy1XYwxnALxHx+G52DzGKt728tBb1u6GaWLUJ/dDz0VqLS7cK4h9JL6My3bEt/RP9yh0u6uFKkRV/ojO3uBbvE7mGbtDUzWTdMMCTsUZRzlqvSmNLj+eZJRXO9eGD8kgUjQaD3emxmeDICOXawEpb9z5cQS8sB2afXl+Tm8zJMk9/zXofWZQy6vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5734.namprd11.prod.outlook.com (2603:10b6:8:31::22) by
 DM5PR11MB1434.namprd11.prod.outlook.com (2603:10b6:4:9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Tue, 23 Nov 2021 07:50:46 +0000
Received: from DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::5db7:737e:8ef0:c831]) by DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::5db7:737e:8ef0:c831%3]) with mapi id 15.20.4649.019; Tue, 23 Nov 2021
 07:50:46 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix CVE-2021-3667
Date: Tue, 23 Nov 2021 15:50:31 +0800
Message-Id: <20211123075031.2902715-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-ClientProxiedBy: SLXP216CA0029.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:4::15) To DM8PR11MB5734.namprd11.prod.outlook.com
 (2603:10b6:8:31::22)
MIME-Version: 1.0
Received: from pek-lpggp1.wrs.com (60.247.85.82) by SLXP216CA0029.KORP216.PROD.OUTLOOK.COM (2603:1096:100:4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 07:50:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4401130e-1f9a-4e0e-021a-08d9ae55f538
X-MS-TrafficTypeDiagnostic: DM5PR11MB1434:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB14349C34102AE6B7AE896284E4609@DM5PR11MB1434.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D427/hCC4EFy397wGcWcCU8KFz1+60Xryp1m/53Qdo+9cJEidII7VKrsdUcEtLlhrkFCweoIOFkeddH+g9G1HJ02WIJdEAnsv1I7uz5DngiVUnKOe0RywJkf2oD8kniEkJLzd1Eq23w+BFjGmXRQlhATINVWgHKQCz2yRbJMTlBF2gIt5RHkPjoiVEmFSl6kyvyvnGqbP/M0F7bgOc/cWUNAiJlxweEQBjPLk6FFc8/OVSQNzREvyz6sJxsCaqpnKGT0eHBEg6fB1xGaSLH5sG015ypkR6v1EmYB80V+GrPrc924oQx/GxAw4scC0j71TbjYG2zUt5bnqu7kyY9NGThI/R4YEFzpxuu15s0j93KiS3XXPs/f7CLyb1N7LmAtJ418Et0JxjEQCkOqC8rjhGfiK5hH3gdqEWAaisiNSsoX4ITwAlIRqCaYzIhCOwHPIoTYv/8Fz3ocpdUJFrO3NSsEXvpymQzeZ6UuYeHXxs5fi57lgSMJkbysC16DEwwTnjwet8YJ2MvDosMeZMe8/Jk6tGl5tDioMqykcfov5MzHuaVmf8XEc7VqfQkvp/mfgpbFD3V2PsmPmFIIQzlMehIwj43WoBA7n5YLHeIfXAvSTCCSFbDLAQouoDgPk/LI6mrzIybfOekwtkUEU9RuvnUXbIT935Y8PIUVVKzwbyjQ09eKUiLl8nemm9T9YY9x/wuVB1ykzyAIRNVUehzTHlGUAVyBuDCl4iBqVg2CtM3WNpHvtuO82cXa+/Og6aASFe+pJTZvCGmlt59cu76Yd36TgolZzclI+EEQkwJa440q61fGV0Yl7JVvbNdygZzRcWY/2I3Pd8Vz/Tfqm5f0vQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5734.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66946007)(186003)(66476007)(52116002)(1076003)(6486002)(86362001)(44832011)(36756003)(6666004)(6916009)(8936002)(316002)(508600001)(956004)(6506007)(8676002)(26005)(83380400001)(966005)(5660300002)(2906002)(38350700002)(38100700002)(2616005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZkafyKsGxleW8C/TC9g7ehPE9UJoN3HnsFEGawg4XW+9mzSIyRxAPAjLtBtN?=
 =?us-ascii?Q?iABaFjEsirEwMqE9/UGzBEndkABcESIHmMsYoB7qUaxZRjk9ri1K6+k4C8pU?=
 =?us-ascii?Q?yCRoZ4gUXKWO2UOOdQPTrd8xEZo9dCB08s4cCmNpWW9NUzc3gSse496jL1DQ?=
 =?us-ascii?Q?3eljywJYBs1pLIQi/U2JLsqwkwKxa3Phti36WW9eg6BKH1bKh2pox6KG292U?=
 =?us-ascii?Q?puYyHeBLAEz53y+2auSZ2+1cp00Uw1n1V3RY1dwaJHrxv2POTWxhlXHmFPg8?=
 =?us-ascii?Q?xuh//mYYlvjdXpQLqvrGREjcGo0l0Fa8f4OqkrWSjNsz2wvsTYT3N+uC4zLc?=
 =?us-ascii?Q?RH6jrLLDW2xhMLacv+4hzt9Pb7Ay790RKLBfrVUssZ6kONxyYIqWih8VDBln?=
 =?us-ascii?Q?9w8hiXfTWCvzlXcLfJ8JRMEbZP6eY3KLfZ6rhAvczkcrObB3cNsv8EPmOhZQ?=
 =?us-ascii?Q?jouw/8gxXYgQVmB6FyviuNp7MANOSPCoTgXh36R10jNDKX3x6V2mL8sBJp+2?=
 =?us-ascii?Q?L7RBh+juu3TcbI1bOQmScua41Ne34IC0EJ02JgngbDfBSKGptM/s9SuPm/TA?=
 =?us-ascii?Q?VWeGdlA+aT4UH051tvzBeiiRUIbkYMoX3gBhAbrrl4r+MgYW3umW/N9ei13u?=
 =?us-ascii?Q?ZPjQ8MksxG79OFuUi26acX4/yNt00Fz2XNZSEhoHGwwXpE4IzTAjwCD+vByU?=
 =?us-ascii?Q?R9oZJuCHKtA5vLsMqJFC0KsL6lHzXoARLgu3ME4LuWR05IOZ9iOXdcmJDHXJ?=
 =?us-ascii?Q?DY9di2QsfRdcEMvQd6Xfu8n5yAMFMM3+sWb7hdgvN8OXOvcnqRpOcFZf8q6W?=
 =?us-ascii?Q?L0TO8/hNGJ0F5pjH8JJgcx8CIAFHAFVerNFBDEYiO/5NtgSoScbiovkfRSI+?=
 =?us-ascii?Q?b0dvJDslVc9EGkk0GzMBDcmUB+223iCyB0vDLkkhRZPAWgi8drHLou4LMR2E?=
 =?us-ascii?Q?idRSiYBtRHWwQAKGNTY6CXAOG8IMmIFKUrtL6fcTaoe3ksQt+R0D5Y+GTKZL?=
 =?us-ascii?Q?VNqyQO5StOJrjpXUBgDPZwhgpdzmmy0sVtMPdMAdjwaMgN9iTMVM9yqrnizO?=
 =?us-ascii?Q?AcbibytT8QmCA6mhHEDdQ6MAKt+3wGcxoZucM/+YbmY4QYNdeT8u7AqOFJr2?=
 =?us-ascii?Q?l8POW9Weu9P+BKhxak1IiGkM8VxmtbFWSLlQ6/Pt9+g7mcNbYhD0+wgb/s6C?=
 =?us-ascii?Q?Hm1Z3GMVMHsn9tQ5VbCeGM/nBqVlou7lywL8AsfgS8zET72Raxg+70pLhr3E?=
 =?us-ascii?Q?hViu/faFlDTsz78LIMpZvrhzYAezwi432HD3Nv03+ofuGQrLxDhScjKK3Fbq?=
 =?us-ascii?Q?SgHYHyxvP7tqZj9s4y7rsOzixero41eIBB29wBOCg4BXJdvYCvm+vV0kjizW?=
 =?us-ascii?Q?JLwyAIjsAqpGQedPdEuf0cOLXT76KZ2bYXx0k22Hqy5pLwN0jAKfKBBp5Nme?=
 =?us-ascii?Q?/kctZVTAWRgkBu7+Y2mwTP9kZaJH7Nm2Ib2rdStEdr2fFW9nWDSQXPHMA/91?=
 =?us-ascii?Q?Odss2td9xanQ7UrWyLXdqz8n64GS8zm0ZBpqo27Bm10iMOrDuAO3m9UJyx8d?=
 =?us-ascii?Q?wt3DCMq7lWmZsXcPaG9NezNdZOHhcxAK6iGQ3Nq4awX9Fthjd4T/k8DVPur4?=
 =?us-ascii?Q?zVvZElR/r66C61lOTLIipAc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4401130e-1f9a-4e0e-021a-08d9ae55f538
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5734.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 07:50:46.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxYv5oFLI++VdMdfmsf4sJg9yeRwwCD9kc2GzE4gjSgJyIuV/KLhjYtF2+EPmWVdQAiIupo4rKOfYMt4HZByDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1434
X-Proofpoint-GUID: 1zmxWDhKOAylxm8YrV5yM7Ck-6lxWTfm
X-Proofpoint-ORIG-GUID: 1zmxWDhKOAylxm8YrV5yM7Ck-6lxWTfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_02,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230041
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
 recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
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
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
index cc7bb2cb..4ec11fb5 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://gnutls-helper.py \
            file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
            file://0001-security-fix-SELinux-label-generation-logic.patch \
+           file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "92044b629216e44adce63224970a54a3"
-- 
2.27.0

