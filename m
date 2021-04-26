Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.81])
 by mx.groups.io with SMTP id smtpd.web12.10155.1619457599619142464
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 10:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=REA2GUj8;
 spf=pass (domain: windriver.com, ip: 40.107.95.81, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jV5dbKeHyTjgDnODpHABH4kK7cnQ8IitsLCK1OipYUkBHBEsT8tK9/e8qiLst+tEViONcpvC565Dq/WNRemdWhEcSIaqaQn1iQDWFTlQbHb7ohYkcgbt73mCYVMU2QuwFcPYbHDzuviV7gmjC5ZRhyE/T1c6NGhEgxLF8PdvPWN/Oeofy1qY5J1XfxPky4HTXdqgX2jb6/kGeiaxFrTkPfD8uf78XJqK7p8ipUUuIKY7n4Gvvfp9qvdx5zX6m5oRYeunqKQ9CalnSNRFIHF829YJ47fpzR8JQnv8Ca5qu3O/G7ftSnkeyu35EUM3MZoZRlHtBStcxB46mP/EtLjlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J0GY/JK5NzwE2UbNV3MB4AkaQGwDpsqk+6gHDl1dXs=;
 b=BstUNRoGHw2sngfBDVPuCNwbJ8mH2cpXeZmRIx7avzZnARmswXTYt9boa5LUQrIGEy9/9v/+QEO9DOroXp4sExu88oUlG/+og74ufjYn+nydUe3Wfvwgof53+UcXw2R14yggtfVe0BbkubDoqVIT/hSsLj4okgYahM1OnZYmKz7ETrZpcAe/DTI6hPFQmcwlBiupqvIg4U/oU7ynRaqSFLjoq3CfpBOolMU/1ecW1vlc1ogSksqH1aOppAP6GL4P7m/ATMVrA6zaZif0HGU2jUbxTvaNjgRLmtT25y0CHb1L2sZNBZovhOzwztluzz2PUGUW3jo795pNHX0bx7FyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J0GY/JK5NzwE2UbNV3MB4AkaQGwDpsqk+6gHDl1dXs=;
 b=REA2GUj8ID4v9W9jRCbpJWyDGrbJv4IQsgvz5A91VrSQa2X/+oa56rYvMKoAi5OMpnwcYZdR9aiIB2hmM+GfstYp2S2aI/DRr3HIvQTkEt8aaxISBZotFA7+xYzDpCXjlyRCvZncLWGph19qC0f+bR7RANG/LawcAhzYiqbWqn0=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 17:19:57 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 17:19:57 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
CC: Saul Wold <Saul.Wold@windriver.com>
Subject: [PATCH v3] ceph: Upgrade to 16.2.1
Date: Mon, 26 Apr 2021 10:19:44 -0700
Message-ID: <20210426171944.1602352-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR1701CA0020.namprd17.prod.outlook.com
 (2603:10b6:301:14::30) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MWHPR1701CA0020.namprd17.prod.outlook.com (2603:10b6:301:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Mon, 26 Apr 2021 17:19:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3eb8d22d-2bc0-4b40-7a07-08d908d783e0
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4698D27C03BABC3394CE8A8AEE429@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	92DoHeMmPvvs+/H/2q8sDjeZ/hBD/fkY/Z22CiYs1n1bgVlZjndaIiOeTNf9XEiIibaP5xx5rXqaW665lCdrHAuSKBWNOywUxWnOyTQSPPcXIZrrzr+y8yhne/qG3GO+dpXfF5cSiNVmRjVDdmsol8YSld6XF+XACD2RSiiWDe8e5LoosyD5aJ1u/jDre1kaWVRmnS9Owpk7oxZ3GUWe7TTIuVnMw4IE+/gKn6MFiax+D9vuh+r4FX7KV/3xt+LHPn1RB/Lz6z3I5tR6akyBoq+KHPeSoKO0WMr9AUsgk7mb3SrhiX/05rpodbCrMwd3Z4k5b32zM0rUuplGp1+uzZ/rMLejryYOskWnHdDe8Rxe2g1gW+UDmwbfBVn2UpFuYFMXSug5BTIDeJSOPdOMptEIKYI+49RRL+zfVZvQay6PfGHxA1u2s8iBuTJCRCt2YsTiOA7ud3xttoM54stRRQ5a6Tehai4JSjo5p7cm+iBIFChzMCzsz+w4eAMQ29KKNiB9r8b940NV+ERhlwm6Pt1mytSMAdQMq6Nkwjeauvrqkf9TVoVbKuFA2iXzEKGuhiTQY7VSGtrUGbno92BaEO/R5hwbx+gwef6wXmoPxE5LlUZM5K5usExTkb5M+aj99sF3Kq09vPHHF/dTD1XQE9JmsZzvfZsKdk3W1EK13GuO8jJaQbFGbdBJBBZ7StULrj3GXQRKr9nSy+T53mZx+Y82PjwOvM2JB+I6H82ZKH5/BgcT05q0EaFl87gXSWwf1HSUa91tfMvTJT4JeQh9YA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39850400004)(346002)(376002)(36756003)(6666004)(26005)(53546011)(6486002)(107886003)(6916009)(1076003)(6506007)(4326008)(478600001)(6512007)(2616005)(8936002)(83380400001)(30864003)(16526019)(186003)(956004)(66946007)(66476007)(66556008)(8676002)(52116002)(86362001)(38350700002)(38100700002)(316002)(2906002)(5660300002)(44832011)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qYa9tfCp0CUZUY02M/GlEUTJMY2FVAq6cwuOIwkE3Ih6Cb8Nv6azeiT24Acy?=
 =?us-ascii?Q?VmGp7ho8Dlu3rFimMz3nz8AZV4uq0uoZ9yZ23KSG9pBlRH1wooxCImHJ1Z9N?=
 =?us-ascii?Q?6W0zIgoTHkB5rej8VksiR4gHoACNzYgmK+ZAeTxii3qlVoFO3ASHYAM+zF3v?=
 =?us-ascii?Q?IQGAXrLtY3jhStl+NyVz/eeMNmVaRqlyrzNEPFze5oEyutDCS7rFTOVcCOFG?=
 =?us-ascii?Q?9eA8kkH8g3B3mjIbBIascKh6+IANyzxY2Jw7yZZXfoOB5IYE2wVLh7z8cjGo?=
 =?us-ascii?Q?rysb649eEbqTlHm92zpQnUUp/VEOWE9hLyMYWK67Cb/cV4RWNWOmqSdGzQgx?=
 =?us-ascii?Q?+QrLeS9bQRSrUeXviS2cClt7Cj7DxcGVUERjV7c9PdgToPaUIZWkWJ4Y1Dzk?=
 =?us-ascii?Q?fLJmLVdDo0nuHr4y2pQ4c5Ip7x9grfu4E4RXUTS04+3meAJ+vcpg7X5p+pFT?=
 =?us-ascii?Q?U+JSlV1MS4eeet6uoeKtk3Q21uO7JNumSKnDhZKsIvaNywje1jZ0VaRb9okw?=
 =?us-ascii?Q?n9ULiHfH22wnzTQKV5GzlgIlSm/Z61SFmR/osK6NY10pSvyq2WsFRLn7Tlw0?=
 =?us-ascii?Q?SVt2ZBS898Jl24CdqTp72EXL1ntfVTkhKmXigkk27jqQhsF/Ve/bbciyRCOz?=
 =?us-ascii?Q?3i0Pl/vv1rxU7L8P2QPNLtzkOoq7guCgr5S1r/LcKaT0caYlUhp8DyPVjocM?=
 =?us-ascii?Q?cjFzBZnKuDbfEtVBR+PjCh2u/H6pW/s22pKxWr2y6mIvJsxFQAN++JxvPeaL?=
 =?us-ascii?Q?NK/VfyM9vA3XntBfZHzZdoCU98UE/hqcL268QpqZ2XjBfxpygKwii/F86MwF?=
 =?us-ascii?Q?m9lgMSQMhoywnUtQT3+kooIqu7zkmwBvSy/FGutAaBGVwri0bEimC9RNkGiX?=
 =?us-ascii?Q?/zuovDI97SX2VnalPHx4QfPJV6yGPrSUt5GyuqrIvHZyH5PU/h5b6vGESPcq?=
 =?us-ascii?Q?1lauN55fZiRzWsn2eBRZxyfr9uTHIomnNp1Zpy1k+kEsZupgvtxbsM79UOmF?=
 =?us-ascii?Q?QAdSv7hw4vtz+VCOvWzQS2IOZTKALQmTKYCZVU8cq978rAlsqceNmNJ5F89W?=
 =?us-ascii?Q?n7hwasoMDfOFw8S5v3FfiJw9wPD4EEzzDTlF7K+uQeBBt6dwZIuObEn4Jvrg?=
 =?us-ascii?Q?ydbmGLnE9V3b8XvBxzwCkT86kbiNnBAAW5RzP1AvYg1bYFF9V1s6xxnyytMw?=
 =?us-ascii?Q?yhHoBForJDvONHjoGnItBMh6578QKafF/wAWrMeONSn2/a11ltW7PkGnw+bd?=
 =?us-ascii?Q?MTi1jkSSwaTAoufeKqLvS+I/Hw9l2aHtPdn6QpKfNWHCiBNPXjltQx3QsVcl?=
 =?us-ascii?Q?z9K04g1II0Xn+o63GFzi4EQM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb8d22d-2bc0-4b40-7a07-08d908d783e0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 17:19:57.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2GWWTd/RoUAsSSZDZg59m8g1Lsj/yBqZtiKNcCJBXmMEXFWHk+wUy/2CeyYPfIrd8tGI9Rs7eyfJCYbBLcm+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Saul Wold <Saul.Wold@windriver.com>

This updates the Ceph version to 16.2.1 which required a couple
changes to base code via a rebased patch which also disabled the
sanity check due to it not working correctly, but the actual
compile worked.  Also added a new patch to add soversion information
for the new libcephsqlite library so it would be packaged correctly

Added fixed for new python script to adjust #! from the native path
and moved the ceph-python package in order for it to get the correct
set of files before the ceph package.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 ...-add-missing-include-for-atomic-bool.patch |  25 ----
 ...h-fix-build-errors-for-cross-compile.patch | 125 ++++++++++++------
 ...0001-cmake-add-support-for-python3.9.patch |  30 -----
 ...001-fix-host-library-paths-were-used.patch |  58 ++++----
 ...ite-Add-library-soversion-properties.patch |  31 +++++
 .../ceph/{ceph_15.2.9.bb =3D> ceph_16.2.1.bb}   |  91 ++++++++++---
 6 files changed, 218 insertions(+), 142 deletions(-)
 delete mode 100644 recipes-extended/ceph/ceph/0001-add-missing-include-for=
-atomic-bool.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-p=
ython3.9.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-libcephsqlite-Add-libra=
ry-soversion-properties.patch
 rename recipes-extended/ceph/{ceph_15.2.9.bb =3D> ceph_16.2.1.bb} (61%)

diff --git a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic=
-bool.patch b/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomi=
c-bool.patch
deleted file mode 100644
index ffcbc58..0000000
--- a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.p=
atch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 502be73be3c3645094525aa552f5e53d8782a004 Mon Sep 17 00:00:00 2001
-From: Sakib Sajal <sakib.sajal@windriver.com>
-Date: Fri, 28 Aug 2020 19:36:19 -0400
-Subject: [PATCH] add missing include for atomic<bool>
-
-Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
----
- src/tools/rbd/action/Bench.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/tools/rbd/action/Bench.cc b/src/tools/rbd/action/Bench.cc
-index aa6edbc1..90c551c1 100644
---- a/src/tools/rbd/action/Bench.cc
-+++ b/src/tools/rbd/action/Bench.cc
-@@ -9,6 +9,7 @@
- #include "common/ceph_mutex.h"
- #include "include/types.h"
- #include "global/signal_handler.h"
-+#include <atomic>
- #include <iostream>
- #include <boost/accumulators/accumulators.hpp>
- #include <boost/accumulators/statistics/stats.hpp>
---=20
-2.27.0
-
diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cros=
s-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for=
-cross-compile.patch
index 4d54549..00c7e5b 100644
--- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compi=
le.patch
+++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compi=
le.patch
@@ -1,10 +1,15 @@
-From 4712fe18405ffea31405308357a8e7fca358bcce Mon Sep 17 00:00:00 2001
+From 2a3ccc8079040a7e783b8a9091618878e7cf0719 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Mon, 11 Mar 2019 09:14:09 +0800
 Subject: [PATCH] ceph: fix build errors for cross compile
=20
 1. set the cross compile sysroot to find the rocksdb library
 2. correct the install path for library in Distutils.cmake
+3. remove / disable the sanity_check(), for some reasong the
+   sanity check gets the wrong settings and will not link=20
+   correctly, but the actual build works correctly, this needs
+   more investigation later, earlier versions of the patch also
+   removed it but no comment on why. (sgw)
=20
 Upstream-Status: Inappropriate [oe specific]
=20
@@ -14,18 +19,20 @@ Adjust context for v14.2.3
=20
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+Signed-off-by: Saul Wold <saul.wold@windriver.com>
+
 ---
  cmake/modules/Distutils.cmake      | 25 +++++--------------------
  cmake/modules/FindRocksDB.cmake    |  4 ++--
  src/compressor/zstd/CMakeLists.txt |  2 +-
- src/pybind/cephfs/setup.py         |  8 --------
- src/pybind/rados/setup.py          |  8 --------
- src/pybind/rbd/setup.py            |  8 --------
- src/pybind/rgw/setup.py            |  8 --------
- 7 files changed, 8 insertions(+), 55 deletions(-)
+ src/pybind/cephfs/setup.py         | 18 +++++-------------
+ src/pybind/rados/setup.py          | 11 ++---------
+ src/pybind/rbd/setup.py            | 18 +++++-------------
+ src/pybind/rgw/setup.py            | 18 +++++-------------
+ 7 files changed, 25 insertions(+), 71 deletions(-)
=20
 diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
-index 5fe929499d..802eb37e32 100644
+index ff01aaf81..18656c5a5 100644
 --- a/cmake/modules/Distutils.cmake
 +++ b/cmake/modules/Distutils.cmake
 @@ -18,17 +18,8 @@ function(distutils_install_module name)
@@ -39,9 +46,9 @@ index 5fe929499d..802eb37e32 100644
 -      list(APPEND options
 -        --root=3D\$ENV{DESTDIR}
 -        --single-version-externally-managed)
--      if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
--        list(APPEND options --install-script=3D${DU_INSTALL_SCRIPT})
--      endif()
+-    endif()
+-    if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
+-      list(APPEND options --install-script=3D${DU_INSTALL_SCRIPT})
 -    endif()
 +    list(APPEND options --root=3D${CMAKE_DESTDIR})
 +    list(APPEND options --install-lib=3D${PYTHON_SITEPACKAGES_DIR})
@@ -51,7 +58,7 @@ index 5fe929499d..802eb37e32 100644
 @@ -50,7 +41,7 @@ function(distutils_add_cython_module target name src)
    # Note: no quotes, otherwise distutils will execute "/usr/bin/ccache gc=
c"
    # CMake's implicit conversion between strings and lists is wonderful, i=
sn't it?
-   string(REPLACE " " ";" cflags ${CMAKE_C_FLAGS})
+   set(cflags ${COMPILE_OPTIONS})
 -  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w)
 +  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=
=3D${CMAKE_SYSROOT})
    # This little bit of magic wipes out __Pyx_check_single_interpreter()
@@ -75,7 +82,7 @@ index 5fe929499d..802eb37e32 100644
         COMMAND
             ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
 diff --git a/cmake/modules/FindRocksDB.cmake b/cmake/modules/FindRocksDB.c=
make
-index c5dd3dfaf6..be38597af2 100644
+index c5dd3dfaf..be38597af 100644
 --- a/cmake/modules/FindRocksDB.cmake
 +++ b/cmake/modules/FindRocksDB.cmake
 @@ -9,9 +9,9 @@
@@ -91,7 +98,7 @@ index c5dd3dfaf6..be38597af2 100644
  if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version=
.h")
    foreach(ver "MAJOR" "MINOR" "PATCH")
 diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMak=
eLists.txt
-index a5ebdaf538..a234068150 100644
+index b53b0d944..4955711a9 100644
 --- a/src/compressor/zstd/CMakeLists.txt
 +++ b/src/compressor/zstd/CMakeLists.txt
 @@ -9,7 +9,7 @@ ExternalProject_Add(zstd_ext
@@ -104,81 +111,111 @@ index a5ebdaf538..a234068150 100644
               -G${CMAKE_GENERATOR}
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
 diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
-index 19ae6c329a..c9a25ccfff 100755
+index c3d40df05..24c26c3ed 100755
 --- a/src/pybind/cephfs/setup.py
 +++ b/src/pybind/cephfs/setup.py
-@@ -135,14 +135,6 @@ def check_sanity():
+@@ -137,19 +137,11 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
 =20
 -
--if 'BUILD_DOC' in os.environ.keys():
--    pass
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args =3D {}
+-    cython_constants =3D dict(BUILD_DOC=3DTrue)
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
 -elif check_sanity():
--    pass
+-    ext_args =3D get_python_flags(['cephfs'])
+-    cython_constants =3D dict(BUILD_DOC=3DFalse)
+-    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rado=
s")]
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
+-                          include_path=3Dinclude_path)
 -else:
 -    sys.exit(1)
--
++ext_args =3D get_python_flags(['cephfs'])
++cython_constants =3D dict(BUILD_DOC=3DFalse)
++include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rados")]
++cythonize_args =3D dict(compile_time_env=3Dcython_constants,
++                      include_path=3Dinclude_path)
+=20
  cmdclass =3D {}
  try:
-     from Cython.Build import cythonize
 diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
-index e2c5696404..4e99d26721 100755
+index 0d1047825..cff85a063 100755
 --- a/src/pybind/rados/setup.py
 +++ b/src/pybind/rados/setup.py
-@@ -134,14 +134,6 @@ def check_sanity():
+@@ -131,15 +131,8 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
 =20
 -
--if 'BUILD_DOC' in os.environ.keys():
--    pass
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args =3D {}
+-    cython_constants =3D dict(BUILD_DOC=3DTrue)
 -elif check_sanity():
--    pass
+-    ext_args =3D get_python_flags(['rados'])
+-    cython_constants =3D dict(BUILD_DOC=3DFalse)
 -else:
 -    sys.exit(1)
--
++ext_args =3D get_python_flags(['rados'])
++cython_constants =3D dict(BUILD_DOC=3DFalse)
+=20
  cmdclass =3D {}
  try:
-     from Cython.Build import cythonize
 diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
-index 634484f140..f5bbbdab4f 100755
+index 73ea4555f..e7f57ddb5 100755
 --- a/src/pybind/rbd/setup.py
 +++ b/src/pybind/rbd/setup.py
-@@ -133,14 +133,6 @@ def check_sanity():
+@@ -135,19 +135,11 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
 =20
 -
--if 'BUILD_DOC' in os.environ.keys():
--    pass
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args =3D {}
+-    cython_constants =3D dict(BUILD_DOC=3DTrue)
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
 -elif check_sanity():
--    pass
+-    ext_args =3D get_python_flags(['rados', 'rbd'])
+-    cython_constants =3D dict(BUILD_DOC=3DFalse)
+-    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rado=
s")]
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
+-                          include_path=3Dinclude_path)
 -else:
 -    sys.exit(1)
--
++ext_args =3D get_python_flags(['rados', 'rbd'])
++cython_constants =3D dict(BUILD_DOC=3DFalse)
++include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rados")]
++cythonize_args =3D dict(compile_time_env=3Dcython_constants,
++                      include_path=3Dinclude_path)
+=20
  cmdclass =3D {}
  try:
-     from Cython.Build import cythonize
 diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
-index eb1591a460..b9f2428cf9 100755
+index 663604e8f..489c9ba1f 100755
 --- a/src/pybind/rgw/setup.py
 +++ b/src/pybind/rgw/setup.py
-@@ -134,14 +134,6 @@ def check_sanity():
+@@ -135,19 +135,11 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
 =20
 -
--if 'BUILD_DOC' in os.environ.keys():
--    pass
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args =3D {}
+-    cython_constants =3D dict(BUILD_DOC=3DTrue)
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
 -elif check_sanity():
--    pass
+-    ext_args =3D get_python_flags(['rados', 'rgw'])
+-    cython_constants =3D dict(BUILD_DOC=3DFalse)
+-    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rado=
s")]
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
+-                          include_path=3Dinclude_path)
 -else:
 -    sys.exit(1)
--
++ext_args =3D get_python_flags(['rados', 'rgw'])
++cython_constants =3D dict(BUILD_DOC=3DFalse)
++include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rados")]
++cythonize_args =3D dict(compile_time_env=3Dcython_constants,
++                      include_path=3Dinclude_path)
+=20
  cmdclass =3D {}
  try:
-     from Cython.Build import cythonize
---=20
-2.20.1
-
diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.=
9.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.p=
atch
deleted file mode 100644
index d9116c4..0000000
--- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
-From: Yanfei Xu <yanfei.xu@windriver.com>
-Date: Tue, 10 Nov 2020 17:17:30 +0800
-Subject: [PATCH] cmake: add support for python3.9
-
-add support for python3.9.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
----
- cmake/modules/FindPython/Support.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/modules/FindPython/Support.cmake b/cmake/modules/FindPy=
thon/Support.cmake
-index 6584699b79..c05bbe3306 100644
---- a/cmake/modules/FindPython/Support.cmake
-+++ b/cmake/modules/FindPython/Support.cmake
-@@ -17,7 +17,7 @@ if (NOT DEFINED _${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJO=
R)
-   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
- endif()
- if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
--  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
-+  set(_${_PYTHON_PREFIX}_VERSIONS 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0=
)
- elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
-   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
- else()
---=20
-2.18.2
-
diff --git a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-us=
ed.patch b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used=
.patch
index 310bfa4..1062ae7 100644
--- a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patc=
h
+++ b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patc=
h
@@ -1,4 +1,4 @@
-From bbf1cba8feb0e43492a1f6a6b31d024117cad262 Mon Sep 17 00:00:00 2001
+From a7f56278dd4762c56cccd559e260e51092763cac Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 13 Apr 2020 23:35:41 -0700
 Subject: [PATCH] fix host library paths were used
@@ -8,6 +8,7 @@ Test the existence of recipe-sysrooot, add it back if lost
 Upstream-Status: Inappropriate [oe specific]
=20
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  src/pybind/cephfs/setup.py | 6 +++++-
  src/pybind/rados/setup.py  | 6 +++++-
@@ -16,11 +17,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 20 insertions(+), 4 deletions(-)
=20
 diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
-index c9a25ccf..972f936c 100755
+index 87cdeb473..5144c8441 100755
 --- a/src/pybind/cephfs/setup.py
 +++ b/src/pybind/cephfs/setup.py
-@@ -63,9 +63,13 @@ def get_python_flags(libs):
-                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')=
), [])
+@@ -65,10 +65,14 @@ def get_python_flags(libs):
+                filter(lambda lib: lib.startswith('-l'), py_libs)]
      compiler =3D new_compiler()
      distutils.sysconfig.customize_compiler(compiler)
 +    libpl =3D distutils.sysconfig.get_config_var('LIBPL')
@@ -29,17 +30,18 @@ index c9a25ccf..972f936c 100755
 +        libpl =3D sysroot + libpl
      return dict(
          include_dirs=3D[distutils.sysconfig.get_python_inc()],
--        library_dirs=3Ddistutils.sysconfig.get_config_vars('LIBDIR', 'LIB=
PL'),
-+        library_dirs=3D[distutils.sysconfig.get_config_var('LIBDIR'), lib=
pl],
-         libraries=3Dlibs + [lib.replace('-l', '') for lib in py_libs],
+         library_dirs=3Ddistutils.sysconfig.get_config_vars('LIBDIR', 'LIB=
PL'),
+-        libraries=3Dlibs + py_libs,
++        libraries=3Dlibs + [lib.replace('-l', '') for lib in py_libs],
          extra_compile_args=3Dfilter_unsupported_flags(
              compiler.compiler[0],
+             compiler.compiler[1:] + distutils.sysconfig.get_config_var('C=
FLAGS').split()),
 diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
-index 4e99d267..de24f766 100755
+index feafb605d..82aff5154 100755
 --- a/src/pybind/rados/setup.py
 +++ b/src/pybind/rados/setup.py
-@@ -66,9 +66,13 @@ def get_python_flags(libs):
-                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')=
), [])
+@@ -63,10 +63,14 @@ def get_python_flags(libs):
+                filter(lambda lib: lib.startswith('-l'), py_libs)]
      compiler =3D new_compiler()
      distutils.sysconfig.customize_compiler(compiler)
 +    libpl =3D distutils.sysconfig.get_config_var('LIBPL')
@@ -48,17 +50,18 @@ index 4e99d267..de24f766 100755
 +        libpl =3D sysroot + libpl
      return dict(
          include_dirs=3D[distutils.sysconfig.get_python_inc()],
--        library_dirs=3Ddistutils.sysconfig.get_config_vars('LIBDIR', 'LIB=
PL'),
-+        library_dirs=3D[distutils.sysconfig.get_config_var('LIBDIR'), lib=
pl],
-         libraries=3Dlibs + [lib.replace('-l', '') for lib in py_libs],
+         library_dirs=3Ddistutils.sysconfig.get_config_vars('LIBDIR', 'LIB=
PL'),
+-        libraries=3Dlibs + py_libs,
++        libraries=3Dlibs + [lib.replace('-l', '') for lib in py_libs],
          extra_compile_args=3Dfilter_unsupported_flags(
              compiler.compiler[0],
+             compiler.compiler[1:] + distutils.sysconfig.get_config_var('C=
FLAGS').split()),
 diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
-index f5bbbdab..a1f70e1d 100755
+index b9c6a78d2..4ef714f8d 100755
 --- a/src/pybind/rbd/setup.py
 +++ b/src/pybind/rbd/setup.py
-@@ -63,9 +63,13 @@ def get_python_flags(libs):
-                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')=
), [])
+@@ -65,10 +65,14 @@ def get_python_flags(libs):
+                filter(lambda lib: lib.startswith('-l'), py_libs)]
      compiler =3D new_compiler()
      distutils.sysconfig.customize_compiler(compiler)
 +    libpl =3D distutils.sysconfig.get_config_var('LIBPL')
@@ -67,17 +70,18 @@ index f5bbbdab..a1f70e1d 100755
 +        libpl =3D sysroot + libpl
      return dict(
          include_dirs=3D[distutils.sysconfig.get_python_inc()],
--        library_dirs=3Ddistutils.sysconfig.get_config_vars('LIBDIR', 'LIB=
PL'),
-+        library_dirs=3D[distutils.sysconfig.get_config_var('LIBDIR'), lib=
pl],
-         libraries=3Dlibs + [lib.replace('-l', '') for lib in py_libs],
+         library_dirs=3Ddistutils.sysconfig.get_config_vars('LIBDIR', 'LIB=
PL'),
+-        libraries=3Dlibs + py_libs,
++        libraries=3Dlibs + [lib.replace('-l', '') for lib in py_libs],
          extra_compile_args=3Dfilter_unsupported_flags(
              compiler.compiler[0],
+             compiler.compiler[1:] + distutils.sysconfig.get_config_var('C=
FLAGS').split()),
 diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
-index b9f2428c..f5119f73 100755
+index 695038c0e..2521f0cbb 100755
 --- a/src/pybind/rgw/setup.py
 +++ b/src/pybind/rgw/setup.py
-@@ -64,9 +64,13 @@ def get_python_flags(libs):
-                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')=
), [])
+@@ -65,10 +65,14 @@ def get_python_flags(libs):
+                filter(lambda lib: lib.startswith('-l'), py_libs)]
      compiler =3D new_compiler()
      distutils.sysconfig.customize_compiler(compiler)
 +    libpl =3D distutils.sysconfig.get_config_var('LIBPL')
@@ -86,11 +90,9 @@ index b9f2428c..f5119f73 100755
 +        libpl =3D sysroot + libpl
      return dict(
          include_dirs=3D[distutils.sysconfig.get_python_inc()],
--        library_dirs=3Ddistutils.sysconfig.get_config_vars('LIBDIR', 'LIB=
PL'),
-+        library_dirs=3D[distutils.sysconfig.get_config_var('LIBDIR'), lib=
pl],
-         libraries=3Dlibs + [lib.replace('-l', '') for lib in py_libs],
+         library_dirs=3Ddistutils.sysconfig.get_config_vars('LIBDIR', 'LIB=
PL'),
+-        libraries=3Dlibs + py_libs,
++        libraries=3Dlibs + [lib.replace('-l', '') for lib in py_libs],
          extra_compile_args=3Dfilter_unsupported_flags(
              compiler.compiler[0],
---=20
-2.21.0
-
+             compiler.compiler[1:] + distutils.sysconfig.get_config_var('C=
FLAGS').split()),
diff --git a/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-sove=
rsion-properties.patch b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-=
library-soversion-properties.patch
new file mode 100644
index 0000000..2c9cd11
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-p=
roperties.patch
@@ -0,0 +1,31 @@
+From ce36ce7d1c0f954d1532a759f4d7b09d87287dac Mon Sep 17 00:00:00 2001
+From: Saul Wold <saul.wold@windriver.com>
+Date: Thu, 22 Apr 2021 08:05:57 -0700
+Subject: [PATCH] libcephsqlite: Add library soversion properties
+
+This additional properties are needed to ensure the library
+is installed with an soversion so that when the library is
+packaged it gets packaged corectly in the ceph package and
+ceph-dev package as the link.
+
+Upstream-Status: pending
+Signed-off-by: Saul Wold <saul.wold@windriver.com>
+---
+ src/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 37db48f86..8dc7bdb56 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -804,6 +804,10 @@ if(WITH_LIBCEPHSQLITE)
+   set(cephsqlite_srcs libcephsqlite.cc SimpleRADOSStriper.cc)
+   add_library(cephsqlite ${CEPH_SHARED} ${cephsqlite_srcs})
+   target_link_libraries(cephsqlite PRIVATE cls_lock_client librados ceph-=
common SQLite3::SQLite3 ${EXTRALIBS})
++  set_target_properties(cephsqlite PROPERTIES
++    OUTPUT_NAME cephsqlite
++    VERSION 1.0.0
++    SOVERSION 1)
+   install(TARGETS cephsqlite DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ endif(WITH_LIBCEPHSQLITE)
+=20
diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/c=
eph_16.2.1.bb
similarity index 61%
rename from recipes-extended/ceph/ceph_15.2.9.bb
rename to recipes-extended/ceph/ceph_16.2.1.bb
index 0d821f0..2771c29 100644
--- a/recipes-extended/ceph/ceph_15.2.9.bb
+++ b/recipes-extended/ceph/ceph_16.2.1.bb
@@ -1,10 +1,65 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade=
'.
+# The following is the difference between the old and the new license text=
.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -7,6 +7,11 @@
+#  Copyright: (c) 2004-2010 by Sage Weil <sage@newdream.net>
+#  License: LGPL-2.1 or LGPL-3 (see COPYING-LGPL2.1 and COPYING-LGPL3)
+# =20
+# +Files: cmake/modules/FindPython*
+# +Copyright:
+# +    Copyright 2000-2020 Kitware, Inc. and Contributors
+# +License: BSD 3-clause
+# +
+#  Files: cmake/modules/FindLTTngUST.cmake
+#  Copyright:
+#      Copyright 2016 Kitware, Inc.
+# @@ -31,6 +36,10 @@
+#  Files: src/include/ceph_hash.cc
+#  Copyright: None
+#  License: Public domain
+# +
+# +Files: src/include/rados.h, except ceph_stable_mod(), which is public d=
omain
+# +Copyright: the authors
+# +License: LGPL-2.1 or LGPL-3 (see COPYING-LGPL2.1 and COPYING-LGPL3)
+# =20
+#  Files: src/common/bloom_filter.hpp
+#  Copyright: Copyright (C) 2000 Arash Partow <arash@partow.net>
+# @@ -191,4 +200,17 @@
+# =20
+#  Files: src/include/function2.hpp
+#  Copyright: 2015-2018, Denis Blank
+# -License: Boost Software License, Version 1.0+License: Boost Software Li=
cense, Version 1.0
+# +
+# +Files: src/include/expected.hpp
+# +Copyright: 2017, Simon Brand
+# +License: CC0
+# +
+# +Files: src/include/uses_allocator.h
+# +Copyright: 2016, Pablo Halpern <phalpern@halpernwightsoftware.com>
+# +License: Boost Software License, Version 1.0
+# +
+# +Files: src/common/async/bind_allocator.h
+# +Copyright: 2020 Red Hat <contact@redhat.com>
+# +           2003-2019 Christopher M. Kohlhoff <chris@kohlhoff.com>
+# +License: Boost Software License, Version 1.0
+#=20
+#
+
 SUMMARY =3D "User space components of the Ceph file system"
 LICENSE =3D "LGPLv2.1 & GPLv2 & Apache-2.0 & MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING-LGPL2.1;md5=3Dfbc093901857fcd118f065f=
900982c24 \
                     file://COPYING-GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263 \
-                    file://COPYING;md5=3D4eb012c221c5fd4b760029a2981a6754 =
\
-"
-inherit cmake python3native python3-dir systemd
+                    file://COPYING;md5=3Dd140fb1fedb53047f0d0830883e7af9f =
\
+                    "
+inherit cmake distutils3-base systemd
+
 # Disable python pybind support for ceph temporary, when corss compiling p=
ybind,
 # pybind mix cmake and python setup environment, would case a lot of error=
s.
=20
@@ -12,15 +67,13 @@ SRC_URI =3D "http://download.ceph.com/tarballs/ceph-${P=
V}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
-           file://0001-add-missing-include-for-atomic-bool.patch \
-           file://0001-cmake-add-support-for-python3.9.patch \
-"
+           file://0001-libcephsqlite-Add-library-soversion-properties.patc=
h \
+           "
=20
-SRC_URI[md5sum] =3D "5a949b91199efe130bfe2e57f200eacd"
-SRC_URI[sha256sum] =3D "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5=
c4ef375a209ace"
-SRC_URI[sha1sum] =3D "0503649d7c7d9268cb61b03bbe839106988f87d7"
-SRC_URI[sha384sum] =3D "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b=
0792bdfd51b13391af325658d0f68f961f94175d93e891"
-SRC_URI[sha512sum] =3D "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6c=
cb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf=
8ff"
+SRC_URI[sha1sum] =3D "2a977307df2e054361e2c20e378ecc50b399b1ee"
+SRC_URI[sha256sum] =3D "30ff943287361b4c3f0a9bf8bcd4399751b91434eec7d602ce=
6e93c42c741be3"
+SRC_URI[sha384sum] =3D "1974cd6877afcc8d90aa389326f9462174f47260d26066b7b6=
e09d4218622226d504c9d5405fea5b295bf68364c1990b"
+SRC_URI[sha512sum] =3D "42e404aa41565485dc4c08b66efb3de719adee72cfc5355869=
92e15ab4601bfbd909ef61abf412badbbfa7ef13bf91a7c0576fbbf3f9f687bc7b465b21a8c=
416"
=20
 DEPENDS =3D "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
@@ -28,6 +81,7 @@ DEPENDS =3D "boost bzip2 curl expat gperf-native \
            oath openldap openssl \
            python3 python3-cython-native rabbitmq-c rocksdb snappy udev \
            valgrind xfsprogs zlib \
+           lua cryptsetup \
 "
 SYSTEMD_SERVICE_${PN} =3D " \
         ceph-radosgw@.service \
@@ -92,6 +146,14 @@ do_install_append () {
 	mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
 	# WITH_FUSE is set to OFF, remove ceph-fuse related units
 	rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/=
system/ceph-fuse@.service
+        # Fix up cehpfs-top and any other python installed with wrong #!
+        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+            if [ -f "$i" ]; then
+                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHO=
N}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+            fi
+        done
+
 }
=20
 do_install_append_class-target () {
@@ -116,7 +178,7 @@ FILES_${PN} +=3D "\
 		${libdir}/rados-classes/*.so.* \
 		${libdir}/ceph/compressor/*.so \
 		${libdir}/rados-classes/*.so \
-		${libdir}/ceph/*.so \
+	 	${libdir}/ceph/*.so \
 "
=20
 FILES_${PN} +=3D " \
@@ -133,11 +195,10 @@ RDEPENDS_${PN} +=3D "\
 		python3-modules \
 		python3-prettytable \
 		${PN}-python \
+                gawk \
 "
 COMPATIBLE_HOST =3D "(x86_64).*"
-PACKAGES +=3D " \
-	${PN}-python \
-"
+PACKAGE_BEFORE_PN +=3D "${PN}-python"
 INSANE_SKIP_${PN}-python +=3D "ldflags"
 INSANE_SKIP_${PN} +=3D "dev-so"
 CCACHE_DISABLE =3D "1"
--=20
2.25.1

