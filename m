Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.54])
 by mx.groups.io with SMTP id smtpd.web09.225.1619197313402278347
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 23 Apr 2021 10:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=isrGxR7S;
 spf=pass (domain: windriver.com, ip: 40.107.100.54, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvwC9T+EfSzmdvxQk/bv1qZf0McWqHaNt+1V2QFJ0RrQLdXasMdFFRqI3X0nEc/+WAqzLwk+0F/c8JTYwCoz9P0V8r+1k1FirmAHVB8eei67iStz5AamGH3vTvjdBxBszOly7a/nG1ps5uVpbBCSNPrZwKUABKdQRf9bZw7Agp/v3f66KsjmcoAEFecJa+5CeQra2FBB3YFsMRksPdgxum30tDtSRCKBs4zJLHx0x+21KWAhT4z3XkH+RRDQctTl8+5HU5cwnBIiDoyzMptcIF2gYSwzmdOE8GN0DHdxm+1B6Du3S5i/GAm2oo0hqeiYyb+7vymdAS1YNjKj0mhNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqEXQUFCftkOIbJDRJIhL7SEkZ1mbKHSp7buxaHk55g=;
 b=WZb1cr0gzdIc6wwPKbaYPJGDUzsuAHKZ7BISqqLOUUpUqKgCOiX9xqv2ncbz0Qp5HyrIcjvBdTM9rwWhSV7cedm035q816XWebND0jHGUk+U4jt5Eyiob9aKh4iZY08R3tg1zwHSJm17AiadaxRZuoluFbGO6SbLOvDenH8EliIvgtIq8SR/tYSZwFMw9pm6Ax+fPz+GxawxKXgBTfJonujD1OXdBj5JgDC4rrHfImoQrmpkYbshlwwX3kqKwPXMQFqZxIDnAjH+jRGaMZpXM9EGzK9XDYb1gaY69z7lS/XtUPxUqu7V4ilnVXbkAmgJpj2Scncp78SsbHw4jSJyBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqEXQUFCftkOIbJDRJIhL7SEkZ1mbKHSp7buxaHk55g=;
 b=isrGxR7SUpLUHBmd1Z/I9Il5GfEHsH9Jwz3OE0jnqUfwvq6qyN0m9X6so0phxgQvg6oJDzsuGYECnBV5/FwcRL3++hWputpx+cgm2Bvfv29z8DzqrlfwV+oUUW2xmOvshisk4Lj25rZxOc9eivm5heTjEwR81ge9EfpzFEjm6zU=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:95::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 17:01:51 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 17:01:51 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] ceph: Upgrade to 16.2.1
Date: Fri, 23 Apr 2021 10:01:39 -0700
Message-ID: <20210423170139.605545-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:300:13d::26) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MWHPR20CA0016.namprd20.prod.outlook.com (2603:10b6:300:13d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Fri, 23 Apr 2021 17:01:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66b05e6d-3278-423e-658d-08d906797cf0
X-MS-TrafficTypeDiagnostic: CO1PR11MB5170:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB51705D31BADDE0347E27EFCDEE459@CO1PR11MB5170.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PqCcR3vPvX8W/DB+dbRan3eTDV6r3lmF38NBlDeVgpnypPHIUXI6dkAbPuYPvs86rdhpw8TzKLh7IkpGk+5sX1IXu4er5bC2bR+cA/qrmxIHsbMDTJO1GMnIi0OAQCzsYTRKv0fBS0ym0kDvj29yxkgKQcwouoalHh05Hbp8/myFpn2wRtl54BM8wFrx5uoVVOjptvE+Plsq/4o72RN56fm4RCJZ307kGDi4KaOd06YAulb+zyL3nsYMEIPgMhhyTzQDaPOKn2XfC9bPi1cbtlpmoHttrV/uj/tQOXRXyOU02VlHqwfX5Pnj2LlBKSZMXwGN5P9Sbeh3g0/TDu8DVJbU4ZKu2oSpcREXoERG+0Mr9MF2rmrHVhu7tcNBlGBMMbjSs+y66/jqBtSs73xDSxrv8WxS8AEdVIOMNAH0NP7kCNBFEWLFGmHVTmdqJdEifi4SIz6TrpqMs3GkBMCP1WUHr92w1Xhs3BfaMA4OJl28CI5M8kmcDR9bNcVuDXZSnxarDv1X8Y9WDb42VSxfE6mAfm/Im+T3fBuL8eHV7ZLxD3IHLGh7z0w6iFhmpmLvxcxSctrKuot+2hfxN1418veCjIaG72EUjYLAVrL+sgLhYRX8swy6hwhti52yfmdZz3EY1i2ZpydA8M4SVc3xaU+N0JaR3+kmv7yrH50JKQJ+TOpI5bLfIwpjMEhf60jsPmyli/fQLDWSUf652vPq7bgUe7BAmn2MZb5GRyedn1x0EUfB0WTVIi0ebcWjnkuirJyXbsMl9omIR9uWiK93Sg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39840400004)(136003)(346002)(52116002)(6506007)(316002)(53546011)(6666004)(66556008)(66946007)(26005)(38350700002)(38100700002)(66476007)(1076003)(86362001)(16526019)(956004)(2616005)(186003)(30864003)(2906002)(5660300002)(6512007)(44832011)(83380400001)(478600001)(6486002)(8936002)(8676002)(6916009)(36756003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?R9BRTEwu3FUj78GDIa7vkeHhFOlrT7DT3YiPuH1+JVobA/TactYgDpzIxlU3?=
 =?us-ascii?Q?CuwVd6jysx37kZkje/m5/XUc9ZpYwkGRRbZBXPjIjtkOwecCBmgaRJpe8xEy?=
 =?us-ascii?Q?Ld8UoTC1aS16JuJwDYe2Iv8ic4EZdeD3X37Tmd0aqNjTLmvjAFOQE5Wf8HgH?=
 =?us-ascii?Q?ggPMeeAs5KcVl/6EwiHxg9MPg6Id+2AcAoZA/cK17x7rhEHwY7QeC7giVaUK?=
 =?us-ascii?Q?XTlUI1VKKHYad0HQPfbyjXbo9euwrt/3zoqqIcHOqbJl5BHE68+qbITJ00Pz?=
 =?us-ascii?Q?q1hJqWhCbc4y8d1vaRx1CCEFxUo3/fG6ZI6f1tW16Zc0DsX2XTsiFrqpN7Uw?=
 =?us-ascii?Q?bKjXRT3Rx3VFQZGDCA/w3UBIvSx/eH37P6SuE2Y45zxZ4e1iLhhGMqpFfWmj?=
 =?us-ascii?Q?brFoGgJBAPYCOjxYNEnfssoADKhHVqqeZwcwsaPpN+0Ba14P3ZQSdyHpgOMQ?=
 =?us-ascii?Q?/fv3dNWPLU/tptpRRy7KJXtJrmnmW+lqC8OHemzjwDfeHgbBcf5dhN0Uc+Qf?=
 =?us-ascii?Q?mphE3WX/lWIDOOZvrRKSe5cUHHPrZVheYt3PgwWRcXwyXeP5+WiDV4TXi5v8?=
 =?us-ascii?Q?WcgAGuPt18z+uKLbENrXoURFHUMY1ajYNS1axQzSus3Mq/QWjClBV8gDbv0J?=
 =?us-ascii?Q?xSvD2sMWqEy9mwO+fc/fcLTcfl1apV4q3ANrktxWR006CL5HcLzUrf3PVdVf?=
 =?us-ascii?Q?fRNWs5AYJnmivONnKd85B3Z+Aadlh5zcqTM0Yb6ohCjBvSbJ4d0vbLxEiTyf?=
 =?us-ascii?Q?Kja1HomIJfYj8bE55f1V+wpQpw2NtDGZOmMra0R6/6AtRfvnCmkSeNxcVQTE?=
 =?us-ascii?Q?wQiEPD4osmqxC7Wc6bcHCthRJX+hfbpy9JV/3lN8rqhvpI3/g4FrRxnTQED7?=
 =?us-ascii?Q?9sogPfzcDoPvdGhoNH9XyYU5M8CBv7H9DwePtrVcsTvdLiyuazlA5qO+q2d/?=
 =?us-ascii?Q?FdPlriNjQL1a0EXXNONX5vIUckdAI6d1UsY2UdN+0SWv2A3lsKHPtt41NPhF?=
 =?us-ascii?Q?6dwCs1yNuxuJMCOkV4NcFP98lxI9pSDAFNjeTGki/mLfZv5+p5VNo8ChrPic?=
 =?us-ascii?Q?nkbjeDhQ5n4vuz0zlyOM1GgxyJjV5K2DE6iHXhO+cJY2+Fu5USdrviNDnRhm?=
 =?us-ascii?Q?lFHEXAiapNQcVdbFwYkd0YOgdV3JYnR9VqeoDj3mPAlLYWj/eiWJ5ZRalQ1p?=
 =?us-ascii?Q?141ERO3K6YyrsJ601MB7l+/Pg62biaMKtl8UkC7EuHz56Yn5jqOkHrxpShYq?=
 =?us-ascii?Q?sjvh49OnYNeeJHhnOrzgYpbPhJ/Kol5YaZv/vmUv8Ag0PLal4uKsCli6MO1X?=
 =?us-ascii?Q?RN2gqpLq6B5DNAcwGAhpFoC8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b05e6d-3278-423e-658d-08d906797cf0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 17:01:50.9471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SPb6LbIMOGl93s+BDvs81i3OximqtEha3mPBIl8PD9dqTEOd6UCNyX51cNhVgiEDedVnpULrAzaHEOT247BHVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This updates the Ceph version to 16.2.1 which required a couple
changes to base code via a rebased patch which also disabled the
sanity check due to it not working correctly, but the actual
compile worked.  Also added a new patch to add soversion information
for the new libcephsqlite library so it would be packaged correctly

Added fixex for new python script to adjust #! from the native path
and moved the ceph-python package in order for it to get the correct
set of files before the ceph package.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 ...-add-missing-include-for-atomic-bool.patch |  25 ----
 ...h-fix-build-errors-for-cross-compile.patch | 125 ++++++++++++------
 ...0001-cmake-add-support-for-python3.9.patch |  30 -----
 ...001-fix-host-library-paths-were-used.patch |  58 ++++----
 ...ite-Add-library-soversion-properties.patch |  31 +++++
 .../ceph/{ceph_15.2.9.bb =3D> ceph_16.2.1.bb}   |  84 +++++++++---
 6 files changed, 211 insertions(+), 142 deletions(-)
 delete mode 100644 recipes-extended/ceph/ceph/0001-add-missing-include-for=
-atomic-bool.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-p=
ython3.9.patch
 create mode 100644 recipes-extended/ceph/ceph/0001-libcephsqlite-Add-libra=
ry-soversion-properties.patch
 rename recipes-extended/ceph/{ceph_15.2.9.bb =3D> ceph_16.2.1.bb} (64%)

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
similarity index 64%
rename from recipes-extended/ceph/ceph_15.2.9.bb
rename to recipes-extended/ceph/ceph_16.2.1.bb
index 0d821f0..ec62c7b 100644
--- a/recipes-extended/ceph/ceph_15.2.9.bb
+++ b/recipes-extended/ceph/ceph_16.2.1.bb
@@ -1,26 +1,80 @@
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
+#inherit cmake setuptools3 systemd
+inherit cmake distutils3-base systemd
+
 # Disable python pybind support for ceph temporary, when corss compiling p=
ybind,
 # pybind mix cmake and python setup environment, would case a lot of error=
s.
=20
+SRC_URI[sha256sum] =3D "30ff943287361b4c3f0a9bf8bcd4399751b91434eec7d602ce=
6e93c42c741be3"
 SRC_URI =3D "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
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
+SRC_URI[sha1sum] =3D "f8cc85e4cc519d7e469a0c3c8327bd1675f0b287"
+SRC_URI[sha384sum] =3D "29a75a733e5ae8039a5ad603558a9707e36b8c337419039ee9=
7351cdbad57875fa57a365fcde29124cee72734608e245"
+SRC_URI[sha512sum] =3D "aeb9a91c33221c64ea24603dc88cab346bf0abdf0d41ff85c2=
e1cf134130737ec1fab1246be0a2fa3af8a655ae1dabb69688855f229f54438e60cb8098175=
b8e"
=20
 DEPENDS =3D "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
@@ -28,6 +82,7 @@ DEPENDS =3D "boost bzip2 curl expat gperf-native \
            oath openldap openssl \
            python3 python3-cython-native rabbitmq-c rocksdb snappy udev \
            valgrind xfsprogs zlib \
+           lua cryptsetup \
 "
 SYSTEMD_SERVICE_${PN} =3D " \
         ceph-radosgw@.service \
@@ -116,7 +171,7 @@ FILES_${PN} +=3D "\
 		${libdir}/rados-classes/*.so.* \
 		${libdir}/ceph/compressor/*.so \
 		${libdir}/rados-classes/*.so \
-		${libdir}/ceph/*.so \
+	 	${libdir}/ceph/*.so \
 "
=20
 FILES_${PN} +=3D " \
@@ -133,11 +188,10 @@ RDEPENDS_${PN} +=3D "\
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

