Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB42C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 11:09:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14001.1710328138604283256
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 04:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OB7DX+Ii;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38026f99e1=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D9o28i009085
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 04:08:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=sz6Zs70x/BuD82zLyN
	n5ITGamd2fnKYUmMw2uqKnMBA=; b=OB7DX+IidwddA04TUeuOOGV1kEQdGKtRU2
	GdvLsYht/C+gGlMCuZhQj3tNSi8k7xDqROc72z2UHPS5wUYbl5zJ0XDFUtLERIRX
	/2G0+G3ryUXtjx7KsOq6wmMW7ES2Yiq5oZi+K3KmxVxuARotbB4nrBiGPeMpdb9G
	XxR98T2qV53VpO7bv6xg/ztstohOWUSnq1xrG20yyTRM8OhH9moZB+6GvqJTFcXT
	6G63K3LcqzcCzl/626fOUXxqz/QYrsUUk0dGa+aOakrKW2pqnBiJEOXL8rnTl5MI
	5f6RXbsxkilo5Zy73CF9R5IVFe59T4lDpqs83kmRFTqhb5q/+xQA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrr5mbgnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 04:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLqx6DFeTVSo2FiCFUl+UnTVqs8N8oFIeE2YLFr/8FmF6KuhB4rXCnOZhc+2RFJJAMr03JNcVQtQAW5hIOmZJFeltAdv9ce2r5xI1x7Jn1Vaz85xZgYFZO//yGHAZjMovoP3x+Lm/EZoeNP+Kaf3TLboM97fzSMRbeJGuldi0zANh5Vs+Hl2Qsb5LuGUnOc+S9PqeBcUjydo448tQIYFxupDEZYCDMjhi7TN3jRZR5kYdQ/wLP8s2Fa2dNFsAC+JLG0rVZMd8k1xIZj/cBhRoOOEuCese53RjHOXmM0Uj3HG4kU5HApoLpRbtZKhgxdfAQiHedLW/ZDXwVdl03QV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz6Zs70x/BuD82zLyNn5ITGamd2fnKYUmMw2uqKnMBA=;
 b=hMsCE0i2BUQ1/J2jokjmets58puBPZF6QKA2EDdDv1UDCg9AnUH8GWS0EMt86bYpWZ3ubRoiZJgzPIvTgGkArbo33xnUPOJZ9Tf8f+npDdyyM+diG/eyUZHzAkaEkwIxTKYh1oOg8oz37kydiVqvnuRxFjsIMqucNPF4mKuM1W2i8id8o0AXleCvkiC3d+XUzC/ezNtrOrWi7EPDjdGZcI+L8oASpLIhDK71HvC5jlGwkANXf3ZruNk6w3WrqPz2BSShbvK8yKIOJ0P8jebM+gAYOUNbXW9mUkRGKrkekj+p1fTJ1ohc5WRw749hL+07yzvKN2mOh0195GZSVRD/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ1PR11MB6107.namprd11.prod.outlook.com (2603:10b6:a03:48a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Wed, 13 Mar
 2024 11:08:41 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 11:08:41 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master-next][PATCH] ceph: fix do_compile/do_install failures
Date: Wed, 13 Mar 2024 04:07:27 -0700
Message-ID: <20240313110727.3748134-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ1PR11MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f5f3a11-b562-478d-9bc0-08dc434df10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H3dCAe/JJod4Nvd1xMWGkDpzPecTtJQcoASsAR6ZVE0T1sBnhcBmEcCWi9GDe46h7NwxgQ+Yj3EXRzOUXC9IipnymU2+LqAf8olImsms/ATGR9xxxFDEvW1ZDylr5zMWW+N7PtUeQ22UPdjGH1cbD1EYbokDa2bSNzERBPeTPJtPMBOkeF76SEhV5NnthbaRuNoBgepucVGKGM6Pjrcp6cUEDb1TreVJo2dP7W2lv1on6RYleNdwo6kC7fZCz03Xtu7gyN8lcyURx52L2syPorAqaNjRIEWUe/T9G1e3qWX0sHzhOPL2AfWY9CtJYPXo+sxVHmKT0ejHOsjgbb9B1iXK4x/XC6W+lGokTknP3TaLWvihorwCZlrdtdvIEFE2zegdw51WCrxAVjxuALhAItcTf1TsVQwXVJBaDULrBHHQ/A1UfwR4NUr3rhte4hIpNm/2gUy7bSRlmN2Ee3Q2WKRYyTwMQSNJBw3GumP+UVBu6A3xzLxdxRKPrO2SbaFbOlE0geOGNeuAk37KV5fXJ9KRJbJZVq67Fw/RM0rxh59IrWcJ6DsT5XI8GrBDw7vPmvsY4QoKEBjjapU8oGNe3Cb6qyBZhDNvhQERhtxnT81qvG7vQtyZznqMGXEYtXdSYhrJ/FTgN0tmaQuibzd6DIPpKsCbrbjTEBDtOrRJaso=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YyKDIH3ZudyvDODqpsNO4/ea7kqdSHYjl0EVnnHo3R5TYJQPpi/fiYwNyWOq?=
 =?us-ascii?Q?GQ0RWa18pzgMU6nA/utpwRkxsTr7tEVZJ2f5MK1XV7/Rm2BFHuvY+c+N3T92?=
 =?us-ascii?Q?4IeeYLynWuysehBC0xX3lXAm+kyPyYlSRjLN6AZ0YkJQiyFQkWKGHEKp4NTg?=
 =?us-ascii?Q?EgHmczMl5nwFUEtLnyfnIzycRfW72qBCgO0AxSrDEG6+SOL9IB8CzNgs9gjl?=
 =?us-ascii?Q?4/XOxnhYL4h321McQUWKzZpSfUPL1jUiEQbuu3eUceUT/iFPKwCKM9TRcqvc?=
 =?us-ascii?Q?h+y1PEntaFEpPp7D7QrFBs/DfkhTfzm3/89skSqMGsIjvIT7cbdvzqwtPF+h?=
 =?us-ascii?Q?20emP+/D6kMop4efu0iW7iUKQtbucMPCDDtm+STkodUTH+VlYzfKkOdDNouH?=
 =?us-ascii?Q?1qA88qBHZK9OgnEVJB6ZDixUoI0K6ELkcRAwTRSt1Am7ZORNy5l7oVqfU9q5?=
 =?us-ascii?Q?j/egO9xlohGu2EWGyGUo4GOgVJw/0lG0FpGviVNMoWiEQgfx5sHk9t6C08sW?=
 =?us-ascii?Q?EJxDnonPFk+zMyw0FUrmisTMzW7th8gBbcBf4SZaNNkuyEyaGKXbESDa6ltL?=
 =?us-ascii?Q?jDjuGMX5ns3RxN66WSWk8HkdsM30ouHYBfuIYsEJjhyCFMcY1tfGN9X2Q0dF?=
 =?us-ascii?Q?LmiRL1XYm9uQQOnj2AYPIE655aExpVI5No6V3abIOy3NC+m3589RzMUH1sgz?=
 =?us-ascii?Q?69aF1ZHBj/LukXM8wsTSRmur9gqL/eUB1jloXHzwSFOgo8c19dJmEG2jcscB?=
 =?us-ascii?Q?QCxqKj4tDtDhj+JqUOfU6lM4ApCNaPYQHzLd9jzhhmn0PO03TiCIZtf9AMNg?=
 =?us-ascii?Q?ckTSS7dn3S0JpFRTH9QMpAutKc6TxV4sg2Xu5P0tlkaLOUOqrfPUbPMswwWP?=
 =?us-ascii?Q?Q/Cb7bFB+WU8Jqwz0W3Qjgp400WipsAdaUTWaMBPPll50HFXO9UIoFo2ML+p?=
 =?us-ascii?Q?abAL2iCr8lqdLIA0Fn3WS26tYxDNsKLalcr42BJViBy6kS1GnfYMX6NOc3Gq?=
 =?us-ascii?Q?JvW9+5lL4GBsWRwfzJlgATNqj+8EKrqRoSB7uoZz6OcN1jvQADODR6VZDfdh?=
 =?us-ascii?Q?S4/brQTcG0motIZT3t9QKrm5oe+RQArvsA8xpcZceCp0OmksSjaKU9Ym3sXk?=
 =?us-ascii?Q?4rdXdOhmYfMiygfZc9f6PP4sGWa+UmRA5WMqBfjKg/U+Ka+ZLuRHRvDL9g6v?=
 =?us-ascii?Q?jDxQBWR5dBggPtq9QpRcujAP9FJ+E6rwJQSpQDBESCyO/qw83rGmQwKyxt2n?=
 =?us-ascii?Q?nm0vOhzCQGGn4qb2zQLNTSti7dg5IbJGNDRmFWJ1cWoDcEbM5+orP+LZBd6d?=
 =?us-ascii?Q?8HimXtGUzgWktAM/9uYILLxzUOAy1wYzssfwDDQ5HW042aaAXmMPrhpKu9QL?=
 =?us-ascii?Q?8gQ30g5kBlHAdostH4J3elOo092X833HB/4w+F/TpTEzb39u+v3A45vFqD4L?=
 =?us-ascii?Q?F/2mnKfUg1cxTJvXLJYMZmuaCTugjmsmD0Ti/rHzsrjQ8+uNAv8isMbWLcrN?=
 =?us-ascii?Q?qgx7BNdiIbHN2rC59agnmnEp0a+TLaJJ20rdHHNuOJDuFRq3ly1PfIQkZqm8?=
 =?us-ascii?Q?Og57SvqExD/7QqOgipNy7ppZzO3pklrfIxKJF8n+72WztIN0NHtIl2X5zfHw?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5f3a11-b562-478d-9bc0-08dc434df10e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 11:08:41.6644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uis3JlULVd5MHB2BlqszFzTOHAnRtB4Hfsc562YHLqWIuJFqf3IyQuJdUt730P9kyF+pWD+bVQM0bWasCumJUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6107
X-Proofpoint-ORIG-GUID: TTq69Au9Oj3HBPflqp5VqMyPBqi9SyBX
X-Proofpoint-GUID: TTq69Au9Oj3HBPflqp5VqMyPBqi9SyBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130083
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Mar 2024 11:09:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8633

From: Chen Qi <Qi.Chen@windriver.com>

1. OECMAKE_C/CXX_COMPILER needs to have sysroot setting in it, because
   ceph's cmake files are using it to construct PY_CC. Without it, files
   such as stdlib.h cannot be found.
2. re2 is added to deps. Seems no way to disable it.
3. 0001-ceph-fix-build-errors-for-cross-compile.patch is dropped. It's useless
   and problematic for new version.
4. 0001-cmake-add-support-for-python3.11.patch is dropped as it's not needed anymore.
5. 0001-avoid-to_string-error.patch is added to fix build error, maybe caused by
   boost version incompatibility.
6. Some cleanups.
7. A few more options are set.
8. BUILD_DOC=1 is exported so that check_sanity() causes compilation error.
   This is a workaround and may need further visit in the future.
9. Delete the conditional check for /etc/debian_version which adds '--install-layout deb'
   and causes the following error.
     error: option --install-layout not recognized
   The patch is 0001-delete-install-layout-deb.patch.
10. ceph-volume[-systemd] are now in sbin.
11. cephfs-mirror units are added to avoid package QA issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../ceph/0001-avoid-to_string-error.patch     |  73 +++++++
 ...h-fix-build-errors-for-cross-compile.patch | 189 ------------------
 ...001-cmake-add-support-for-python3.11.patch |  31 ---
 .../ceph/0001-delete-install-layout-deb.patch |  37 ++++
 recipes-extended/ceph/ceph_18.2.0.bb          |  61 +++---
 5 files changed, 136 insertions(+), 255 deletions(-)
 create mode 100644 recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch

diff --git a/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch b/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch
new file mode 100644
index 00000000..0b4fc984
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-avoid-to_string-error.patch
@@ -0,0 +1,73 @@
+From f807220d13adc0656c30d3207d11c70360b88d06 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 13 Mar 2024 03:14:55 -0700
+Subject: [PATCH] avoid to_string error
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/rgw/rgw_asio_client.cc | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/src/rgw/rgw_asio_client.cc b/src/rgw/rgw_asio_client.cc
+index a0ec0bf5c..17880eda5 100644
+--- a/src/rgw/rgw_asio_client.cc
++++ b/src/rgw/rgw_asio_client.cc
+@@ -3,6 +3,7 @@
+ 
+ #include <boost/algorithm/string/predicate.hpp>
+ #include <boost/asio/write.hpp>
++#include <string_view>
+ 
+ #include "rgw_asio_client.h"
+ #include "rgw_perf_counters.h"
+@@ -39,11 +40,11 @@ int ClientIO::init_env(CephContext *cct)
+     const auto& value = header->value();
+ 
+     if (field == beast::http::field::content_length) {
+-      env.set("CONTENT_LENGTH", value.to_string());
++      env.set("CONTENT_LENGTH", std::string(value));
+       continue;
+     }
+     if (field == beast::http::field::content_type) {
+-      env.set("CONTENT_TYPE", value.to_string());
++      env.set("CONTENT_TYPE", std::string(value));
+       continue;
+     }
+ 
+@@ -62,26 +63,26 @@ int ClientIO::init_env(CephContext *cct)
+     }
+     *dest = '\0';
+ 
+-    env.set(buf, value.to_string());
++    env.set(buf, std::string(value));
+   }
+ 
+   int major = request.version() / 10;
+   int minor = request.version() % 10;
+   env.set("HTTP_VERSION", std::to_string(major) + '.' + std::to_string(minor));
+ 
+-  env.set("REQUEST_METHOD", request.method_string().to_string());
++  env.set("REQUEST_METHOD", std::string(request.method_string()));
+ 
+   // split uri from query
+   auto uri = request.target();
+   auto pos = uri.find('?');
+   if (pos != uri.npos) {
+     auto query = uri.substr(pos + 1);
+-    env.set("QUERY_STRING", query.to_string());
++    env.set("QUERY_STRING", std::string(query));
+     uri = uri.substr(0, pos);
+   }
+-  env.set("SCRIPT_URI", uri.to_string());
++  env.set("SCRIPT_URI", std::string(uri));
+ 
+-  env.set("REQUEST_URI", request.target().to_string());
++  env.set("REQUEST_URI", std::string(request.target()));
+ 
+   char port_buf[16];
+   snprintf(port_buf, sizeof(port_buf), "%d", local_endpoint.port());
+-- 
+2.42.0
+
diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
deleted file mode 100644
index 9686becb..00000000
--- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
+++ /dev/null
@@ -1,189 +0,0 @@
-From 4712fe18405ffea31405308357a8e7fca358bcce Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Mon, 11 Mar 2019 09:14:09 +0800
-Subject: [PATCH] ceph: fix build errors for cross compile
-
-1. set the cross compile sysroot to find the rocksdb library
-2. correct the install path for library in Distutils.cmake
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
-Adjust context for v14.2.3
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- cmake/modules/Distutils.cmake      | 25 +++++--------------------
- cmake/modules/FindRocksDB.cmake    |  4 ++--
- src/compressor/zstd/CMakeLists.txt |  2 +-
- src/pybind/cephfs/setup.py         |  8 --------
- src/pybind/rados/setup.py          |  8 --------
- src/pybind/rbd/setup.py            |  8 --------
- src/pybind/rgw/setup.py            |  8 --------
- 7 files changed, 8 insertions(+), 55 deletions(-)
-
-Index: ceph-18.2.0/cmake/modules/Distutils.cmake
-===================================================================
---- ceph-18.2.0.orig/cmake/modules/Distutils.cmake
-+++ ceph-18.2.0/cmake/modules/Distutils.cmake
-@@ -29,17 +29,10 @@
-   cmake_parse_arguments(DU "" "INSTALL_SCRIPT" "" ${ARGN})
-   install(CODE "
-     set(options --prefix=${CMAKE_INSTALL_PREFIX})
--    if(DEFINED ENV{DESTDIR})
--      if(EXISTS /etc/debian_version)
--        list(APPEND options --install-layout=deb)
--      endif()
--      list(APPEND options
--        --root=\$ENV{DESTDIR}
--        --single-version-externally-managed)
--    endif()
-     if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
-       list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
--    endif()
-+    list(APPEND options --root=${CMAKE_DESTDIR})
-+    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
-     execute_process(
-     COMMAND ${Python3_EXECUTABLE}
-         setup.py install \${options}
-@@ -65,7 +58,7 @@
-   if(DU_DISABLE_VTA AND HAS_VTA)
-     list(APPEND PY_CFLAGS -fno-var-tracking-assignments)
-   endif()
--  list(APPEND PY_CPPFLAGS -iquote${CMAKE_SOURCE_DIR}/src/include -w)
-+  list(APPEND PY_CPPFLAGS -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT})
-   # This little bit of magic wipes out __Pyx_check_single_interpreter()
-   # Note: this is reproduced in distutils_install_cython_module
-   list(APPEND PY_CPPFLAGS -D'void0=dead_function\(void\)')
-@@ -135,14 +128,8 @@
-     set(ENV{CEPH_LIBDIR} \"${CMAKE_LIBRARY_OUTPUT_DIRECTORY}\")
- 
-     set(options --prefix=${CMAKE_INSTALL_PREFIX})
--    if(DEFINED ENV{DESTDIR})
--      if(EXISTS /etc/debian_version)
--        list(APPEND options --install-layout=deb)
--      endif()
--      list(APPEND options --root=\$ENV{DESTDIR})
--    else()
--      list(APPEND options --root=/)
--    endif()
-+    list(APPEND options --root=${CMAKE_DESTDIR})
-+    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
-     execute_process(
-        COMMAND
-            ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
-Index: ceph-18.2.0/cmake/modules/FindRocksDB.cmake
-===================================================================
---- ceph-18.2.0.orig/cmake/modules/FindRocksDB.cmake
-+++ ceph-18.2.0/cmake/modules/FindRocksDB.cmake
-@@ -9,9 +9,9 @@
- #  ROCKSDB_VERSION_MINOR
- #  ROCKSDB_VERSION_PATCH
- 
--find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h)
-+find_path(ROCKSDB_INCLUDE_DIR rocksdb/db.h ${CMAKE_SYSROOT})
- 
--find_library(ROCKSDB_LIBRARIES rocksdb)
-+find_library(ROCKSDB_LIBRARIES rocksdb ${CMAKE_SYSROOT})
- 
- if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
-   foreach(ver "MAJOR" "MINOR" "PATCH")
-Index: ceph-18.2.0/src/pybind/cephfs/setup.py
-===================================================================
---- ceph-18.2.0.orig/src/pybind/cephfs/setup.py
-+++ ceph-18.2.0/src/pybind/cephfs/setup.py
-@@ -135,20 +135,6 @@
-     finally:
-         shutil.rmtree(tmp_dir)
- 
--
--if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
--    ext_args = {}
--    cython_constants = dict(BUILD_DOC=True)
--    cythonize_args = dict(compile_time_env=cython_constants)
--elif check_sanity():
--    ext_args = get_python_flags(['cephfs'])
--    cython_constants = dict(BUILD_DOC=False)
--    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
--    cythonize_args = dict(compile_time_env=cython_constants,
--                          include_path=include_path)
--else:
--    sys.exit(1)
--
- cmdclass = {}
- try:
-     from Cython.Build import cythonize
-Index: ceph-18.2.0/src/pybind/rados/setup.py
-===================================================================
---- ceph-18.2.0.orig/src/pybind/rados/setup.py
-+++ ceph-18.2.0/src/pybind/rados/setup.py
-@@ -130,17 +130,6 @@
-     finally:
-         shutil.rmtree(tmp_dir)
- 
--
--if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
--    ext_args = {}
--    cython_constants = dict(BUILD_DOC=True)
--elif check_sanity():
--    ext_args = get_python_flags(['rados'])
--    cython_constants = dict(BUILD_DOC=False)
--else:
--    sys.exit(1)
--
--cmdclass = {}
- try:
-     from Cython.Build import cythonize
-     from Cython.Distutils import build_ext
-Index: ceph-18.2.0/src/pybind/rbd/setup.py
-===================================================================
---- ceph-18.2.0.orig/src/pybind/rbd/setup.py
-+++ ceph-18.2.0/src/pybind/rbd/setup.py
-@@ -133,20 +133,6 @@
-     finally:
-         shutil.rmtree(tmp_dir)
- 
--
--if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
--    ext_args = {}
--    cython_constants = dict(BUILD_DOC=True)
--    cythonize_args = dict(compile_time_env=cython_constants)
--elif check_sanity():
--    ext_args = get_python_flags(['rados', 'rbd'])
--    cython_constants = dict(BUILD_DOC=False)
--    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
--    cythonize_args = dict(compile_time_env=cython_constants,
--                          include_path=include_path)
--else:
--    sys.exit(1)
--
- cmdclass = {}
- try:
-     from Cython.Build import cythonize
-Index: ceph-18.2.0/src/pybind/rgw/setup.py
-===================================================================
---- ceph-18.2.0.orig/src/pybind/rgw/setup.py
-+++ ceph-18.2.0/src/pybind/rgw/setup.py
-@@ -134,20 +134,6 @@
-     finally:
-         shutil.rmtree(tmp_dir)
- 
--
--if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
--    ext_args = {}
--    cython_constants = dict(BUILD_DOC=True)
--    cythonize_args = dict(compile_time_env=cython_constants)
--elif check_sanity():
--    ext_args = get_python_flags(['rados', 'rgw'])
--    cython_constants = dict(BUILD_DOC=False)
--    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
--    cythonize_args = dict(compile_time_env=cython_constants,
--                          include_path=include_path)
--else:
--    sys.exit(1)
--
- cmdclass = {}
- try:
-     from Cython.Build import cythonize
diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
deleted file mode 100644
index c72c91b2..00000000
--- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.11.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
-From: Yanfei Xu <yanfei.xu@windriver.com>
-Date: Tue, 10 Nov 2020 17:17:30 +0800
-Subject: [PATCH] cmake: add support for python 3.9 and 3.10
-
-add support for python3.9.
-
-Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
-
-Add support for python 3.10.
-
-Upstream-Status: Submitted [https://github.com/ceph/ceph/pull/43630]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- cmake/modules/FindPython/Support.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: ceph-18.2.0/cmake/modules/FindPython/Support.cmake
-===================================================================
---- ceph-18.2.0.orig/cmake/modules/FindPython/Support.cmake
-+++ ceph-18.2.0/cmake/modules/FindPython/Support.cmake
-@@ -17,7 +17,7 @@
-   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
- endif()
- if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
--  set(_${_PYTHON_PREFIX}_VERSIONS 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
-+  set(_${_PYTHON_PREFIX}_VERSIONS 3.11 3.10 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
- elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
-   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
- else()
diff --git a/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
new file mode 100644
index 00000000..91eacfa9
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-delete-install-layout-deb.patch
@@ -0,0 +1,37 @@
+From 903bb882a44eb5567f8b1fc7f7c4857c2f03579d Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 13 Mar 2024 03:41:47 -0700
+Subject: [PATCH] delete install-layout=deb
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ cmake/modules/Distutils.cmake | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
+index daaae4ba6..e606e3890 100644
+--- a/cmake/modules/Distutils.cmake
++++ b/cmake/modules/Distutils.cmake
+@@ -30,9 +30,6 @@ function(distutils_install_module name)
+   install(CODE "
+     set(options --prefix=${CMAKE_INSTALL_PREFIX})
+     if(DEFINED ENV{DESTDIR})
+-      if(EXISTS /etc/debian_version)
+-        list(APPEND options --install-layout=deb)
+-      endif()
+       list(APPEND options
+         --root=\$ENV{DESTDIR}
+         --single-version-externally-managed)
+@@ -136,9 +133,6 @@ function(distutils_install_cython_module name)
+ 
+     set(options --prefix=${CMAKE_INSTALL_PREFIX})
+     if(DEFINED ENV{DESTDIR})
+-      if(EXISTS /etc/debian_version)
+-        list(APPEND options --install-layout=deb)
+-      endif()
+       list(APPEND options --root=\$ENV{DESTDIR})
+     else()
+       list(APPEND options --root=/)
+-- 
+2.42.0
+
diff --git a/recipes-extended/ceph/ceph_18.2.0.bb b/recipes-extended/ceph/ceph_18.2.0.bb
index 35188106..ca713bc6 100644
--- a/recipes-extended/ceph/ceph_18.2.0.bb
+++ b/recipes-extended/ceph/ceph_18.2.0.bb
@@ -9,10 +9,10 @@ inherit cmake pkgconfig python3native python3-dir systemd
 # pybind mix cmake and python setup environment, would case a lot of errors.
 
 SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
-           file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
-           file://0001-cmake-add-support-for-python3.11.patch \
+           file://0001-avoid-to_string-error.patch \
+           file://0001-delete-install-layout-deb.patch \
 "
 
 SRC_URI[sha256sum] = "495b63e1146c604018ae0cb29bf769b5d6235e3c95849c43513baf12bba1364d"
@@ -23,8 +23,13 @@ DEPENDS = "boost bzip2 curl cryptsetup expat gperf-native \
            oath openldap openssl \
            python3 python3-native python3-cython-native python3-pyyaml-native \
 	   rabbitmq-c rocksdb snappy thrift udev \
-           valgrind xfsprogs zlib libgcc \
+           valgrind xfsprogs zlib libgcc zstd re2 \
 "
+
+
+OECMAKE_C_COMPILER = "${@oecmake_map_compiler('CC', d)[0]} --sysroot=${RECIPE_SYSROOT}"
+OECMAKE_CXX_COMPILER = "${@oecmake_map_compiler('CXX', d)[0]} --sysroot=${RECIPE_SYSROOT}"
+
 SYSTEMD_SERVICE:${PN} = " \
         ceph-radosgw@.service \
         ceph-radosgw.target \
@@ -34,6 +39,8 @@ SYSTEMD_SERVICE:${PN} = " \
         ceph-mds.target \
         ceph-osd@.service \
         ceph-osd.target \
+        cephfs-mirror@.service \
+        cephfs-mirror.target \
         ceph.target \
         ceph-rbd-mirror@.service \
         ceph-rbd-mirror.target \
@@ -45,15 +52,20 @@ SYSTEMD_SERVICE:${PN} = " \
         ceph-immutable-object-cache@.service \
         ceph-immutable-object-cache.target \
 "
-OECMAKE_GENERATOR = "Unix Makefiles"
 
-EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
+EXTRA_OECMAKE += "-DWITH_MANPAGE=OFF \
+                 -DWITH_JAEGER=OFF \
+                 -DWITH_SYSTEM_ZSTD=ON \
                  -DWITH_FUSE=OFF \
                  -DWITH_SPDK=OFF \
                  -DWITH_LEVELDB=OFF \
                  -DWITH_LTTNG=OFF \
                  -DWITH_BABELTRACE=OFF \
                  -DWITH_TESTS=OFF \
+                 -DARROW_GANDIVA=OFF \
+                 -DARROW_WITH_RE2=OFF \
+                 -DWITH_RADOSGW_SELECT_PARQUET=OFF \
+                 -DWITH_RADOSGW_ARROW_FLIGHT=OFF \
                  -DWITH_MGR=OFF \
                  -DWITH_MGR_DASHBOARD_FRONTEND=OFF \
                  -DWITH_SYSTEM_BOOST=ON \
@@ -67,34 +79,6 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
 		 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake \
 		 "
 
-EXTRA_OECMAKE += "-DThrift_INCLUDE_DIR:PATH=${STAGING_INCDIR} \
-                  -DThrift_LIBRARIES:PATH=${STAGING_LIBDIR} \
-                 "
-
-# retired options:
-#		 -DPython3_VERSION=${PYTHON_BASEVERSION}
-#		 -DPython3_USE_STATIC_LIBS=FALSE
-#		 -DPython3_INCLUDE_DIR:PATH=${PYTHON_INCLUDE_DIR}
-#		 -DPython3_LIBRARY:PATH=${PYTHON_LIBRARY}
-#		 -DPython3_ROOT_DIR:PATH=${PYTHON_SITEPACKAGES_DIR}
-#                -DPython3_EXECUTABLE:PATH="${PYTHON}"
-
-CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
-CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
-
-export STAGING_DIR_HOST
-
-do_compile:prepend() {
-	cmake_runcmake_build --target legacy-option-headers
-}
-
-# do_compile() {
-# 	ninja -v ${PARALLEL_MAKE}
-# }
-do_compile() {
-        cmake_runcmake_build --target all
-}
-
 do_configure:prepend () {
 	echo "set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )" >> ${WORKDIR}/toolchain.cmake
 	echo "set( CMAKE_DESTDIR \"${D}\" )" >> ${WORKDIR}/toolchain.cmake
@@ -104,16 +88,23 @@ do_configure:prepend () {
 	echo "set( CMAKE_C_COMPILER_FORCED TRUE )" >> ${WORKDIR}/toolchain.cmake
 }
 
+do_compile:prepend() {
+	export BUILD_DOC=1
+}
+
+do_install:prepend() {
+	export BUILD_DOC=1
+}
+
 do_install:append () {
 	sed -i -e 's:^#!/usr/bin/python$:&3:' \
 		-e 's:${WORKDIR}.*python3:${bindir}/python3:' \
 		${D}${bindir}/ceph ${D}${bindir}/ceph-crash \
-		${D}${bindir}/ceph-volume ${D}${bindir}/ceph-volume-systemd
+		${D}${sbindir}/ceph-volume ${D}${sbindir}/ceph-volume-systemd
 	find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
 	install -d ${D}${sysconfdir}/ceph
 	install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
 	install -d ${D}${systemd_unitdir}
-	mv ${D}${libexecdir}/systemd/system ${D}${systemd_unitdir}
 	mv ${D}${libexecdir}/ceph/ceph-osd-prestart.sh ${D}${libdir}/ceph
 	mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
 	# WITH_FUSE is set to OFF, remove ceph-fuse related units
-- 
2.42.0


