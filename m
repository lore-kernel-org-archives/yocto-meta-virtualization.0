Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.82])
 by mx.groups.io with SMTP id smtpd.web08.2830.1619119957017621826
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Apr 2021 12:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lV3YVQWn;
 spf=pass (domain: windriver.com, ip: 40.107.94.82, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+OZeJ1JoB67EB777D7iUjHiAZrpZMZNTXxZUsbtzNGg4U6ZIitoaAoxxhKu3J4eW/nPiq7pJLx2YX7C0dmJEC1cidUfUGysSoXUlyGjLKjHY/yAuFpb1NNl2YEtI0A+lOEiw5Jn3/hkt+BOhCFsCKuCHLSRS8HaAjQEI+2/ruTULULD7L0bPuAXNbBlKX4JOsfYOuk/OmRPxdqslFYPMQXYhdriCqdKsubmE8kEmrA3jlflkRjqqb6sfLB/vt4+qWvsLmulLd5ey5gwpyxJqe+D0WObugN1c1GP7M2Y/8ITeEloQGxWqZRPOAtNZD9Zp4Qd21UxWSjovIdrY9Xh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukMav7ZVxPq40t2XbTDKGFBAQ+nAFf/MUxb79JlTRlI=;
 b=CT7OuM9qVXXmXuTmse4M+Xdt7vgWxVFMD5VVH5f31M80ianp3AsZkgyVPsRfpxaUrGxACpJFmtoaLcZjI1zr97icxs+lBNXKyD3oeUscf1OVu2t35Z5dy2PRRrzQ4z6RvD53atRUXJ6U53hwRQKnTvFJyHd0WxFBuPotDhOR4J3rYnuCQ67rzuXtbq65cOjDnR6uxF3d2T40qi16rmADDnGxkHrnKzJNUrNxjkTYY6o/K1CxfJmw45HjHsvzKEhlQ/jbitbaycX3dLX52ufbsOIfXL1JiMIWI2FPibab7crcl0+V3ehLdOi1q3MqCfT5vxMR5ih3okbuBE36m+m9wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukMav7ZVxPq40t2XbTDKGFBAQ+nAFf/MUxb79JlTRlI=;
 b=lV3YVQWncyaD33d7YadfeXuFZqwWcx3VvNpJb3URmwXHbBiJ0H5Cl9fKsDE09W4yxOgAPIuNKyYIgeTq5Jql4Mrs9eF1ST5GpeEsv6GZy0NYZcMVlxFQ+9eXALPOUXQ7cDd03EUPUUjztxiXYE8zdbC80EIkfW9sqlvHq/Vtl90=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4553.namprd11.prod.outlook.com (2603:10b6:303:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 22 Apr
 2021 19:32:35 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 19:32:35 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] ceph: Upgrade to 16.2.0
Date: Thu, 22 Apr 2021 12:32:21 -0700
Message-ID: <20210422193221.328504-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR1701CA0004.namprd17.prod.outlook.com
 (2603:10b6:301:14::14) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MWHPR1701CA0004.namprd17.prod.outlook.com (2603:10b6:301:14::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Thu, 22 Apr 2021 19:32:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcb223b4-0fd0-4cf7-d299-08d905c561ba
X-MS-TrafficTypeDiagnostic: MW3PR11MB4553:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB45535ABA434E5B28BF486A16EE469@MW3PR11MB4553.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	34kifXiL6y/kehYK/GiHayFZJkk6MZS6+c+WESTRJQMqqJZKeXi+uQAyNEL8GgP9Q4Ogc308TIfgvgFHIkVBJvTxJWTT86ZvmE6KfFqGBJg4DRVzROfCnXUaIs8H6+LUd7ClGCn5xHD+pFHvt4YavHa4vbsKhCwZFndExvjzbSqaohb4JREUe5erc01GtCNej+LIJq1BoWORYhAY1iAhipHN+oAoyfYI3MFCLKx6YgxiqIZYQJY5VEVyDvIuQbyb3iUhIYg/f1JYzFPo1uJsud9SoLQcZ4CcC20qLczETfIml4BvsQum61TxqZSvQ+6AYHKjG+J9HRArqtWk6vwNPqsb00W0SFMRnG4uhEFjWjSnMYrzj78ojdZkPoFZvIxX/aLe4uQliyTJKqul9VzEIy9XP10AGbBdC3QwXfEzGgT/LEIG3eD3wUA/kPioKhoM+nS8iv1dl60CxM6IIfYdRatayBEkX5M6QOl/JeaR9fY+fn/t+VJYt0clwkN5C3XSaUteOqwEOqYPTlQKc3VBSHVRQugjoiZpLdCmbfLk+ym4qTAcWsHV7BJ+Lh+oH69UHe95/I0rscDzO4Lf7CYK0mWlY9/9Xga9Ntc4idkSjtXv7cOQaZGm6rHukZw9LNpm2LpvB08ave7EBiY3SHJz+bKU/mtB00Fdw35TCFj3cdFUxqHQMF8Hmdv0YzxFtKzuGaRY7s5zuCxUMLCx63v4UDxYUSYESFwkv5DW1aXUAwH+qJFx6qPssEqrZLK6Bi+svcYsVzXvv9+6obAf0oMqYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(52116002)(38100700002)(38350700002)(86362001)(26005)(186003)(478600001)(6506007)(8676002)(53546011)(6486002)(8936002)(6512007)(16526019)(6666004)(1076003)(30864003)(2906002)(6916009)(5660300002)(316002)(66946007)(44832011)(956004)(2616005)(83380400001)(36756003)(66556008)(66476007)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?lxOWsd0QOUtBPA5Hhh8ystt1yf4J0Js6uBsWjddp6rJhBmZhRlX6m2p/sOmT?=
 =?us-ascii?Q?ntwf5nTvmAiUUUF5hWd8e55JSHo3HwQjZfRDd7yhDifmqknTrJKeTY+QRtUI?=
 =?us-ascii?Q?eNQatlA8/pG7jl+6CKpc98U4UkPWodR+m1h7mmNYnDsjhe5x3GsF6c7nXOZ3?=
 =?us-ascii?Q?oZjyRdNwLn01NaP7+hntulZPRJntpCxMjsI47A3IvhbLDg0Mo+X4Nb/i993w?=
 =?us-ascii?Q?OyV/8XxytsHs5UxBudFCE2QH3IBD0JAUWF2pdp9BIV9O6ijOX9EZwVuUOP+T?=
 =?us-ascii?Q?ngCMJ3p+vGLrNvTWgK4fV3H8j0iynxPLIOhFtwSXWsKDeZPRYOmmh0JkFVP7?=
 =?us-ascii?Q?8W9BTx14l8tWH3bvKmGBTTAIfQC1od9MM8bXNjmnGjcU7JBBVfxxiw2cyhmr?=
 =?us-ascii?Q?2Dl/gWMAdv60BFJtJD3VI3Mb3MU7aOgXAAOX8T0zISIROIds3Q4cCmlfbqbL?=
 =?us-ascii?Q?AY1G9+VqP44U91vPupGKR7hv7Vz9vhzs5652IJCcUlxdwkutSrfb1YJXCJGr?=
 =?us-ascii?Q?gkzmiRhVuuvYS1TqwRF9MmEIEE0nR+Wagkj68b3V0Qo1s2MfmjkTbAF1Bs9H?=
 =?us-ascii?Q?ucfCSk2MjQKPobD8WE3EjKbHQMnOmzjJlwQOAVwidUaNEsWGvBWpQSKXScpm?=
 =?us-ascii?Q?kYVr7uYl8RV7f+GiGBG927CwY/kSH+V7BZYK8u4uhfFzgfaFa8Ov8z3uNbMg?=
 =?us-ascii?Q?cGVwXaP5VoK0sARsTCYiCZnjI0malxzGIwH7xZtvqnsmiWnPSjIputHkMNoc?=
 =?us-ascii?Q?iDMANYuhXipCk2J2hoJQ/1iIbU06iu0vdqU2NYxVW2JgtGvjZPJoCduz3Awe?=
 =?us-ascii?Q?L+Qr4tgDR7fK4C5j8QOjiYpivf+UIb/1idfjYdq2ye09HukPPPLYleNaeN0t?=
 =?us-ascii?Q?WN8nD9WFpNNBEmGwfwjipOtYSxZVwipXN3Ni/qOITY9CqF0Uj0f4GdEyJ3bJ?=
 =?us-ascii?Q?YyA61ltZ72nJFVtcZ081Er++wwv2um3OeG9+u99J9mKzfphI5FDW+ZXNzRvL?=
 =?us-ascii?Q?4QojOBLBsGnVwjSpRg+8o+vTs3ZgeusMXvo1mQKFWQzKnPzVOTFJ2TaiiNye?=
 =?us-ascii?Q?T+JDTR1laFCViRW8PT48D37GTmJFAfMxfcCyERmNY15dUpYaI3Sd9GyXm4TU?=
 =?us-ascii?Q?D5NSUAEtgYF+W5zpngZmSmKuwhCAF3r1cGxlZ2YzfgrNlVMNcZ6urnBGVc8R?=
 =?us-ascii?Q?26B1FvpGAVPasA0T8dzjcZxAkwnsQ52zm3/xdBYBOr1RMszWq7cP6YtGa4FG?=
 =?us-ascii?Q?oQaxKTMnmuo8JBk5qfuOFGX/nNrJL/02zjISPlg7ZsHJx/9sWeTMVpuIcxSP?=
 =?us-ascii?Q?8fP144Bg7C99lCDp7pOitW6t?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb223b4-0fd0-4cf7-d299-08d905c561ba
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 19:32:35.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NTnLtdqBxD0dg0FFTfucVbjBG5s+ndSVKvoOkl2FZVC8eRImCM9fK+LlT9aWG8Rfth8XBXDDpIKmaNMqOBApQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4553
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This updates the Ceph version to 16.2.0 which required a couple
changes to base code via a rebased patch which also disabled the
sanity check due to it not working correctly, but the actual
compile worked.  Also added a new patch to add soversion information
for the new libcephsqlite library so it would be packaged correctly

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 ...h-fix-build-errors-for-cross-compile.patch | 119 ++++++++++++++----
 ...ite-Add-library-soversion-properties.patch |  31 +++++
 recipes-extended/ceph/ceph_16.2.0.bb          |  22 ++--
 3 files changed, 138 insertions(+), 34 deletions(-)
 create mode 100644 recipes-extended/ceph/ceph/0001-libcephsqlite-Add-libra=
ry-soversion-properties.patch

diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cros=
s-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for=
-cross-compile.patch
index 7764a2b..00c7e5b 100644
--- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compi=
le.patch
+++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compi=
le.patch
@@ -1,10 +1,15 @@
-From 04b53b669dbd75c9a90bf7f8ae2b47ff96176239 Mon Sep 17 00:00:00 2001
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
@@ -14,16 +19,17 @@ Adjust context for v14.2.3
=20
 Signed-off-by: He Zhe <zhe.he@windriver.com>
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+Signed-off-by: Saul Wold <saul.wold@windriver.com>
=20
 ---
  cmake/modules/Distutils.cmake      | 25 +++++--------------------
  cmake/modules/FindRocksDB.cmake    |  4 ++--
  src/compressor/zstd/CMakeLists.txt |  2 +-
- src/pybind/cephfs/setup.py         |  1 -
- src/pybind/rados/setup.py          |  1 -
- src/pybind/rbd/setup.py            |  1 -
- src/pybind/rgw/setup.py            |  1 -
- 7 files changed, 8 insertions(+), 27 deletions(-)
+ src/pybind/cephfs/setup.py         | 18 +++++-------------
+ src/pybind/rados/setup.py          | 11 ++---------
+ src/pybind/rbd/setup.py            | 18 +++++-------------
+ src/pybind/rgw/setup.py            | 18 +++++-------------
+ 7 files changed, 25 insertions(+), 71 deletions(-)
=20
 diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
 index ff01aaf81..18656c5a5 100644
@@ -105,50 +111,111 @@ index b53b0d944..4955711a9 100644
               -G${CMAKE_GENERATOR}
    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
 diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
-index c3d40df05..87cdeb473 100755
+index c3d40df05..24c26c3ed 100755
 --- a/src/pybind/cephfs/setup.py
 +++ b/src/pybind/cephfs/setup.py
-@@ -137,7 +137,6 @@ def check_sanity():
+@@ -137,19 +137,11 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
 =20
 -
- if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
-     ext_args =3D {}
-     cython_constants =3D dict(BUILD_DOC=3DTrue)
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args =3D {}
+-    cython_constants =3D dict(BUILD_DOC=3DTrue)
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
+-elif check_sanity():
+-    ext_args =3D get_python_flags(['cephfs'])
+-    cython_constants =3D dict(BUILD_DOC=3DFalse)
+-    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rado=
s")]
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
+-                          include_path=3Dinclude_path)
+-else:
+-    sys.exit(1)
++ext_args =3D get_python_flags(['cephfs'])
++cython_constants =3D dict(BUILD_DOC=3DFalse)
++include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rados")]
++cythonize_args =3D dict(compile_time_env=3Dcython_constants,
++                      include_path=3Dinclude_path)
+=20
+ cmdclass =3D {}
+ try:
 diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
-index 0d1047825..feafb605d 100755
+index 0d1047825..cff85a063 100755
 --- a/src/pybind/rados/setup.py
 +++ b/src/pybind/rados/setup.py
-@@ -131,7 +131,6 @@ def check_sanity():
+@@ -131,15 +131,8 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
 =20
 -
- if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
-     ext_args =3D {}
-     cython_constants =3D dict(BUILD_DOC=3DTrue)
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args =3D {}
+-    cython_constants =3D dict(BUILD_DOC=3DTrue)
+-elif check_sanity():
+-    ext_args =3D get_python_flags(['rados'])
+-    cython_constants =3D dict(BUILD_DOC=3DFalse)
+-else:
+-    sys.exit(1)
++ext_args =3D get_python_flags(['rados'])
++cython_constants =3D dict(BUILD_DOC=3DFalse)
+=20
+ cmdclass =3D {}
+ try:
 diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
-index 73ea4555f..b9c6a78d2 100755
+index 73ea4555f..e7f57ddb5 100755
 --- a/src/pybind/rbd/setup.py
 +++ b/src/pybind/rbd/setup.py
-@@ -135,7 +135,6 @@ def check_sanity():
+@@ -135,19 +135,11 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
 =20
 -
- if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
-     ext_args =3D {}
-     cython_constants =3D dict(BUILD_DOC=3DTrue)
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args =3D {}
+-    cython_constants =3D dict(BUILD_DOC=3DTrue)
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
+-elif check_sanity():
+-    ext_args =3D get_python_flags(['rados', 'rbd'])
+-    cython_constants =3D dict(BUILD_DOC=3DFalse)
+-    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rado=
s")]
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
+-                          include_path=3Dinclude_path)
+-else:
+-    sys.exit(1)
++ext_args =3D get_python_flags(['rados', 'rbd'])
++cython_constants =3D dict(BUILD_DOC=3DFalse)
++include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rados")]
++cythonize_args =3D dict(compile_time_env=3Dcython_constants,
++                      include_path=3Dinclude_path)
+=20
+ cmdclass =3D {}
+ try:
 diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
-index 663604e8f..695038c0e 100755
+index 663604e8f..489c9ba1f 100755
 --- a/src/pybind/rgw/setup.py
 +++ b/src/pybind/rgw/setup.py
-@@ -135,7 +135,6 @@ def check_sanity():
+@@ -135,19 +135,11 @@ def check_sanity():
      finally:
          shutil.rmtree(tmp_dir)
 =20
 -
- if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
-     ext_args =3D {}
-     cython_constants =3D dict(BUILD_DOC=3DTrue)
+-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
+-    ext_args =3D {}
+-    cython_constants =3D dict(BUILD_DOC=3DTrue)
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants)
+-elif check_sanity():
+-    ext_args =3D get_python_flags(['rados', 'rgw'])
+-    cython_constants =3D dict(BUILD_DOC=3DFalse)
+-    include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rado=
s")]
+-    cythonize_args =3D dict(compile_time_env=3Dcython_constants,
+-                          include_path=3Dinclude_path)
+-else:
+-    sys.exit(1)
++ext_args =3D get_python_flags(['rados', 'rgw'])
++cython_constants =3D dict(BUILD_DOC=3DFalse)
++include_path =3D [os.path.join(os.path.dirname(__file__), "..", "rados")]
++cythonize_args =3D dict(compile_time_env=3Dcython_constants,
++                      include_path=3Dinclude_path)
+=20
+ cmdclass =3D {}
+ try:
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
diff --git a/recipes-extended/ceph/ceph_16.2.0.bb b/recipes-extended/ceph/c=
eph_16.2.0.bb
index 806a03f..d55e602 100644
--- a/recipes-extended/ceph/ceph_16.2.0.bb
+++ b/recipes-extended/ceph/ceph_16.2.0.bb
@@ -58,7 +58,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING-LGPL2.1;md5=3Dfbc093=
901857fcd118f065f900982c24
                     file://COPYING-GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263 \
                     file://COPYING;md5=3Dd140fb1fedb53047f0d0830883e7af9f =
\
                     "
-inherit cmake python3native python3-dir systemd
+#inherit cmake setuptools3 systemd
+inherit cmake distutils3-base systemd
+
 # Disable python pybind support for ceph temporary, when corss compiling p=
ybind,
 # pybind mix cmake and python setup environment, would case a lot of error=
s.
=20
@@ -66,14 +68,9 @@ SRC_URI =3D "http://download.ceph.com/tarballs/ceph-${PV=
}.tar.gz \
            file://0001-ceph-fix-build-errors-for-cross-compile.patch \
            file://0001-fix-host-library-paths-were-used.patch \
            file://ceph.conf \
+           file://0001-libcephsqlite-Add-library-soversion-properties.patc=
h \
            "
=20
-#SRC_URI[md5sum] =3D "5a949b91199efe130bfe2e57f200eacd"
-#SRC_URI[sha256sum] =3D "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e=
5c4ef375a209ace"
-#SRC_URI[sha1sum] =3D "0503649d7c7d9268cb61b03bbe839106988f87d7"
-#SRC_URI[sha384sum] =3D "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005=
b0792bdfd51b13391af325658d0f68f961f94175d93e891"
-#SRC_URI[sha512sum] =3D "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6=
ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329b=
f8ff"
-SRC_URI[sha256sum] =3D "dfeee542536607220dc2ca49f47c41127c8562dea234a88662=
5e0f7ee1524904"
 SRC_URI[sha1sum] =3D "f8cc85e4cc519d7e469a0c3c8327bd1675f0b287"
 SRC_URI[sha384sum] =3D "29a75a733e5ae8039a5ad603558a9707e36b8c337419039ee9=
7351cdbad57875fa57a365fcde29124cee72734608e245"
 SRC_URI[sha512sum] =3D "aeb9a91c33221c64ea24603dc88cab346bf0abdf0d41ff85c2=
e1cf134130737ec1fab1246be0a2fa3af8a655ae1dabb69688855f229f54438e60cb8098175=
b8e"
@@ -149,6 +146,13 @@ do_install_append () {
 	mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
 	# WITH_FUSE is set to OFF, remove ceph-fuse related units
 	rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/=
system/ceph-fuse@.service
+
+	for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+		if [ -f "$i" ]; then
+			sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
+			sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+		fi
+	done
 }
=20
 do_install_append_class-target () {
@@ -173,7 +177,8 @@ FILES_${PN} +=3D "\
 		${libdir}/rados-classes/*.so.* \
 		${libdir}/ceph/compressor/*.so \
 		${libdir}/rados-classes/*.so \
-		${libdir}/ceph/*.so \
+	 	${libdir}/ceph/*.so \
+                ${libdir}/libcephsqlite.so \
 "
=20
 FILES_${PN} +=3D " \
@@ -190,6 +195,7 @@ RDEPENDS_${PN} +=3D "\
 		python3-modules \
 		python3-prettytable \
 		${PN}-python \
+                gawk \
 "
 COMPATIBLE_HOST =3D "(x86_64).*"
 PACKAGES +=3D " \
--=20
2.25.1

