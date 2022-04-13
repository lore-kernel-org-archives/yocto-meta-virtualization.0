Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F52C47092
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.4612.1649845289552947749
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 03:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XlP4Lh4T;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=1102153c25=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23D9wvui008797
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 03:21:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=q8rFzxWMAMAQEwuGmDkJU0/WisMquBSsJIIzOIPwHr4=;
 b=XlP4Lh4TdXT7OrUucxmwhgd6eYqHMzoDWfLaB2yQ+gaUwKeY0IrCIANLm0R4+BPG4DD0
 ogHVfm5JPMX+U5h7RZWYVsLsbgz4Su6gVKeaAUty45kKwos29txdn/XqrJFRpDoHXwnt
 X83C3rTtDTBM8hesY/bRiIY1PMSmywJ/MwHV7j4bPgynX4Xh3aoF8WgW/HRhnJ/GZPMc
 eHpUEt6QzaV1u4sqWNLOr7vBmoLArMwXTryN0R0UrjksCZ2I8nihcZqVDdVEJKne9pps
 YBRhrsOEFEKR0zf15AMJz2gqZuupSmXKUQ57U2GV7e4XTY646RJIEtbk93SMZHto8/3y aQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb9nftxbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 03:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeQYA5/U/1RjsUI8q+ntF/nf6kR3ToWcFXBeL3bfEDfGKhPEcmaLYVpKfNrVQIoprzLcQftRfb/b+lu+mk3gYCAnL+a7yHxNIAVpHD0Pw5UfKZCDtbHouLvzGRykrZM62X3dYpUSiooVX7hJMzswjvk/dCwhpRzXxStTUgtNR/0wFbb8DwglUi3l9Pz+7Q6PG/4u+koWHQ9BiYVMYCd3M7kFshr0T5dZtPiM1faoqxrhn3P9jCmhCGlrzIsXBOJcpq/iTBjmSmDyexpc4AmGUVsecQv5wpBvi8qyI4ka/dmmF0x9nFso8vx/YgoDpKesAH+lw4rPLUlIA/WMaPlj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8rFzxWMAMAQEwuGmDkJU0/WisMquBSsJIIzOIPwHr4=;
 b=B+YprE4IHgKgdzlJ1n2c0VjHQLm052fctAn3tiylaEa0bKGYUAWVj8eJakkQeytgRRmzloAf5y7XhweHGfxaKzRj+6SDEWJDRDgs/m8PeFJ6fMV7grxVlKG8RPMhSZ686vRsetUzER3DDhPszqFL709sibqN8Wn7gO4RPjHJD4TjJaLqb0EeFdUDqDejY/tAUlF14M9ROW6ZuRvEYVSM1pShUcLurh7JmdF3dBgMjg9TA7IOYNKuIlJ9g4fFLS257sV62CzBQiJNOuN8XD7UHrFo1JVH7cUJ07hIMZgLXngkx9DGYPd8zzSBT7UxdqjQ0KHUPgRb0IaS69puYTtcgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BYAPR11MB2599.namprd11.prod.outlook.com (2603:10b6:a02:c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 10:21:25 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2cb7:7dbc:9904:2c3e]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::2cb7:7dbc:9904:2c3e%5]) with mapi id 15.20.5144.029; Wed, 13 Apr 2022
 10:21:25 +0000
From: He Zhe <zhe.he@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvmi: Fix out of box build failure
 with xen disabled
Date: Wed, 13 Apr 2022 18:20:55 +0800
Message-Id: <20220413102055.9763-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0101.apcprd03.prod.outlook.com
 (2603:1096:203:b0::17) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e27e147-63bd-419d-436e-08da1d375ce7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2599:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2599AA99AB92E834EB3374B78FEC9@BYAPR11MB2599.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	atbsRXA9QVU6q0jQOyN5g1StL9IPh23rgZuIStzsneHfkDgGcj9L79ZWIPLlpdbHXr62YsJ3Fs1OLTmfJgC+IEWh+leZbWZ1ijlj6n8vZYozxRWqTK471HxnHcqthY2Oc90vGJHhUWUIz3M2Ys1pZ6oYL/9uRdF4tkj4JQ14vJvNcso3RUa/tpdaPCCUlzQseMq+Dru8zMeFu0ie+c0+o/r2fo1dQTTk0mwqP66VTxqRMOJxFyTYI+B9jfYCkHVJBxWqsOnGxNevn8SZonbpm9UoY9Zj+qnvtFEYsNGNq7Gqi6vit9RRbNNkxnRbI5wlNOM40wfSsOQRmJTSpTqIBWDEbOGwqAppYxI3sHn1++NDNglgjM+HnTw7zo/p33IRVJOWcqHxP0+OxM9sq2YaJHUO1VA9qD0T0HVppb+3ghwpcMP6hR0G1gWl+7+gPXLOiNptk49TdZticGHqt2fg4hhjD1TdjaVwpKGr/9HxSIWTpG5QsMgjrNKVKxAJdBqRdSxT6hoaLSVCg/7g6ixgmGAwjs1aM74kRcYTBrrLmyPLOrSGRC4nt7hcvBnnDnSJ6j3Wm44In3hk7HJLH++3JN46JrYkKXXCpUzpLA6zE4fQVvRvzY8Pjli97wPhmlFhqsqSj652TWYtaHJG8fd72aKv2+TbwG1wCBIlhRrDhdu4NpyBdqSK8FiA8bKpMSbPtJpN34N12xlVgDridu1M6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6666004)(6916009)(38350700002)(316002)(83380400001)(52116002)(6506007)(86362001)(36756003)(38100700002)(508600001)(2616005)(1076003)(6512007)(2906002)(5660300002)(66556008)(66946007)(186003)(8936002)(8676002)(26005)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XIIkqsc3DFVNMgBSNQKWWetsn2m2AxfLUFTuUfsYCcJxeWrRXyip+0Hp2Rcj?=
 =?us-ascii?Q?e5QgoE5+i8fRc14e+Sec5coyGAVi8X96f6nhnjQwJywO5Un3T20pmPybaNMC?=
 =?us-ascii?Q?6EI8uOYM3juCj9T1SWU/aVGEZXL6FUKl5lJiGdNmbZSxtZ8/rWIUge2XBDA2?=
 =?us-ascii?Q?KW6c13JcEWLa+pX0s3n6SZ7XzmP/ir6eMkVPhLODjgaURa8XCxBKvT98Nboo?=
 =?us-ascii?Q?GxZWLK7rKymtf1zUqIbj9GYnAFYcO6FbnZn6NHg5Id+V2T7r0SavfG0ChyyS?=
 =?us-ascii?Q?EhJcaE2qyecWaCGgsMf/+JEXF5Ax5aPIGyWh4d6YWtByqcx2x9nHT9CYv3Xk?=
 =?us-ascii?Q?gJb/PiWIKkZIFgHbBdreTr0ph0O03ZDvr8c5ZFlfMG4yDTI8o5VkmU1jroTR?=
 =?us-ascii?Q?sHtxLKXTcSj4rQIPZ1yIKNDOihxlp/3mmbI/mQWgbMrpBFNkhDfg12lniej2?=
 =?us-ascii?Q?3eTgS2kkpenE5KzK13IjM5DPB8LjG+xEQYaqEMhVnuWpklfUU4SkbBTxoW4t?=
 =?us-ascii?Q?9l5FkDhhR/9HbvIqEbYp1+iDQ6Ums0J31I/h/Tpg+G8JrmReWt2fkmDcQ20D?=
 =?us-ascii?Q?lVrrlUYnw7em6s6DtrvU4hFiRZFVf6ffjrUwDBCp0CTLU684FTyyKYrW9NSN?=
 =?us-ascii?Q?2ltPVZ+63732JtmemDZN8nMtaexB90Nw1Uaqrm2fS3h9whSl2TLVibxnYiiH?=
 =?us-ascii?Q?vs8VJAjk2ODzwizY0GkJKe1lIUZ6ugz0t9nh1Ume1f9rQa4rGdVN5UdYXQ+F?=
 =?us-ascii?Q?tJm/K9+fw7wO+3D/sfmQeqlo3eg4WxXmY6B9N06ROzDb4rzMycZIgPaUdKQ4?=
 =?us-ascii?Q?Ne0aIpo6PaEscY2Tu27Dd9zdMoxunkvFlb1FaSWq8CD+p8oKNAKsXpFWzOBE?=
 =?us-ascii?Q?Ilo9vExwUOrgerJnf0zVr4b0A3aReWKdvgHLmFjrQ5ibi8wdnmaI0IgecOyQ?=
 =?us-ascii?Q?mEZO8u1Fnd+qt3QoAa7zI/tFTzUNHDj1tNDqZmswLX8FrQfaIHZiCIwvv43r?=
 =?us-ascii?Q?t0AuBZwDU79GumF12UssFDMQgtO3VRs4XrvCPtLQezn6feCzld1sAY7hAhM+?=
 =?us-ascii?Q?dM862jFcH4rtRVtEEDI1z5pHRnSzR0Cp/aJLy3mK0ih7MYdkGXWjzzGabj7H?=
 =?us-ascii?Q?YBTgG2RwfznoV3YTDuo+kZjDAWjZzuZX4+FEg6K5kmqtiYVtpHqxDuPI7ME3?=
 =?us-ascii?Q?zMeLloL7ET5GK2px3rO36Gf3rvyIB3X1NcwSjw474cEvhe6iX7FyVXfjMxGO?=
 =?us-ascii?Q?McdzFr9XPgxv1ZgMon04E9Zv+qrbQ4VbEyxeaD3cPIP8xhyHnARoDE+sKuQQ?=
 =?us-ascii?Q?iCZ7c16ddRGVU1KfZUfI7P3/qk6teLY3hHQBV4AQ9XwvTJ16srCbs88zHosF?=
 =?us-ascii?Q?veawc0P8z1QUP9FWB0kDsyTgLHXOjaWlmh17pATxhIqKHTUYV/7NtIeyPa4K?=
 =?us-ascii?Q?NpdAQaf8Akur6GqLRhHgXR/45wo/PA+Jxt7ii5HM/G4mcMNcrTRNk4meq8Yj?=
 =?us-ascii?Q?fGw5XWhfet6tmJ7BBIeMHIF/0/KYQX+DcxXJnUFZU0S4gwEvLjpM9RHyd1NC?=
 =?us-ascii?Q?D1wNz+ZCcmZM+Tpv+T7TrKA4jCAlBali8L3pd7gwzKdBGFRFnOcbB+4drjb1?=
 =?us-ascii?Q?Y33L9c/YwTSzPXX5pfDdVMVUmdoSWH0Ktm1rSWpWU14FONzCgInPdxvBEW/C?=
 =?us-ascii?Q?h5MRGsflkiReCDQgSw4LH7/BVC9aT6RC+RKsBheUTw5RA+9dsOx5b4VZnTvC?=
 =?us-ascii?Q?Ama6/2TPdw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e27e147-63bd-419d-436e-08da1d375ce7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 10:21:24.6506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9Xvj+qQGPpRotPTopBeXz9QeoajVzPl78gu7JCVvZ/YNN32pRxKVW8Z1grWOP2HnxHYWKIfcRgTYK8kgxo/LQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2599
X-Proofpoint-ORIG-GUID: 0R7jNYSWYLGvqovFPlWktQ0My9P5jQHv
X-Proofpoint-GUID: 0R7jNYSWYLGvqovFPlWktQ0My9P5jQHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_01,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=313 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204130058
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7167

vbd was added for xen based VMs since
bdee00fac9b4 ("Disk reading interface for Xen based VMs and example")
and should be built only when xen is enabled, otherwise there would not be
necessary xen headers and cause the following failure.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...1-Build-vbd-only-when-xen-is-enabled.patch | 76 +++++++++++++++++++
 recipes-extended/libvmi/libvmi_git.bb         |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 recipes-extended/libvmi/files/0001-Build-vbd-only-when-xen-is-enabled.patch

diff --git a/recipes-extended/libvmi/files/0001-Build-vbd-only-when-xen-is-enabled.patch b/recipes-extended/libvmi/files/0001-Build-vbd-only-when-xen-is-enabled.patch
new file mode 100644
index 00000000..bf6e9f0e
--- /dev/null
+++ b/recipes-extended/libvmi/files/0001-Build-vbd-only-when-xen-is-enabled.patch
@@ -0,0 +1,76 @@
+From fb7a1493c7d4a30ae930d8cb7dcb84c83c0cacce Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 13 Apr 2022 09:26:01 +0000
+Subject: [PATCH] Build vbd only when xen is enabled
+
+vbd was added for xen based VMs since
+bdee00fac9b4 ("Disk reading interface for Xen based VMs and example")
+and should be built only when xen is enabled, otherwise there would not be
+necessary xen headers and cause the following failure.
+
+xen_private.h:38:10: fatal error: xenctrl.h: No such file or directory
+
+Upstream-Status: Pending
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ Makefile.am           | 8 ++++----
+ libvmi/CMakeLists.txt | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 097c23c..c560a1d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -17,8 +17,7 @@ h_private = \
+     libvmi/os/os_interface.h \
+     libvmi/driver/driver_interface.h \
+     libvmi/driver/driver_wrapper.h \
+-    libvmi/driver/memory_cache.h \
+-    libvmi/disk/vbd_private.h
++    libvmi/driver/memory_cache.h
+ 
+ c_sources = \
+     libvmi/accessors.c \
+@@ -39,8 +38,7 @@ c_sources = \
+     libvmi/arch/ept.c \
+     libvmi/driver/driver_interface.c \
+     libvmi/driver/memory_cache.c \
+-    libvmi/os/os_interface.c \
+-    libvmi/disk/vbd.c
++    libvmi/os/os_interface.c
+ 
+ if ENABLE_ADDRESS_CACHE
+     c_sources   += libvmi/cache.c
+@@ -104,6 +102,8 @@ if WITH_XEN
+                    libvmi/driver/xen/libxc_wrapper.h \
+                    libvmi/driver/xen/libxs_wrapper.c \
+                    libvmi/driver/xen/libxs_wrapper.h
++    h_private   += libvmi/disk/vbd_private.h
++    c_sources   += libvmi/disk/vbd.c
+ endif
+ 
+ if WITH_BAREFLANK
+diff --git a/libvmi/CMakeLists.txt b/libvmi/CMakeLists.txt
+index ac57d79..7e87751 100644
+--- a/libvmi/CMakeLists.txt
++++ b/libvmi/CMakeLists.txt
+@@ -18,7 +18,6 @@ set(libvmi_src
+     driver/driver_interface.c
+     driver/memory_cache.c
+     os/os_interface.c
+-    disk/vbd.c
+ )
+ 
+ add_library(vmi OBJECT ${libvmi_src})
+@@ -169,6 +168,7 @@ add_subdirectory(os)
+ 
+ 
+ if (ENABLE_XEN)
++    list(APPEND libvmi_src disk/vbd.c)
+     find_package(Xen REQUIRED)
+     list(APPEND VMI_PUBLIC_HEADERS events.h)
+     # CMAKE_DL_LIBS -> dlopen* lib
+-- 
+2.32.0
+
diff --git a/recipes-extended/libvmi/libvmi_git.bb b/recipes-extended/libvmi/libvmi_git.bb
index d856256a..72069c68 100644
--- a/recipes-extended/libvmi/libvmi_git.bb
+++ b/recipes-extended/libvmi/libvmi_git.bb
@@ -9,6 +9,7 @@ PV = "0.14.0+git${SRCPV}"
 DEPENDS = "libvirt libcheck bison fuse byacc-native"
 
 SRC_URI = "git://github.com/libvmi/libvmi.git;branch=master;protocol=https \
+           file://0001-Build-vbd-only-when-xen-is-enabled.patch \
 "
 
 SRCREV = "41600b602815a9c42620cd5a96c5b88739fc6d9b"
-- 
2.32.0


