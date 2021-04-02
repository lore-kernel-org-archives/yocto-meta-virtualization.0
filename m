Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.55])
 by mx.groups.io with SMTP id smtpd.web12.14041.1617357949843425800
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 03:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VBfTywFD;
 spf=pass (domain: windriver.com, ip: 40.107.70.55, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9Y5wu7HiMG/zMtUTJLyrpsn0+vPoeQiYx5un47Z6W4bet1vFJOQVc8o1gxEUzJlN35m4iuTmcowJOP25lww9AkkF2a3doPOr2+4QNO3GwwF/aj8JswnxXVxQMA50kE7IqW+7iJWodbxreLWSyJHc7XA7Dqy2VDWI3pMxExzg+eEWGtCND9h/n38vPt0wLYG1LWghc/olDw93tozPm1Iv91TEPGZ9KnmDXDO+NcCxHVMP139S3La4jI/OoQ4i+SNgmNCmlsOBDq8P58Z98ysNLanARuWn+JWgmaNTuabOcL2akmiRWJP0WsmyAGwM4chb0g7pypqT0k0kyOJVflGTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2hcsFoBCD+LckQHyQJu5jqsd0QY38bLIbjMFl5FaGo=;
 b=b3V94WhNslYfP4tKnGSUuQEbM+u+S9yfXRE+yZWO5khQh+b4qrc5+htL1eGX3zaMwkIuNj8RCnr1mpCTcDhEmEBu2WT7nSRD5Vc5LmAHiIEIpvii8IL/KtLxgyxpT2u0zXKsnsNwpaieiGIMWQr3wiDifWHNn+1PLd+iUMD+u/Pvn9oCZ1tEH8czFtL6DghoKMPldUoM3L0ce7rDlhTSG4ELFpfqlmAby84y+V4hVUKM+6kobWasm+d/dh07mduFAPAzNyaraR727cwpfR/4g7P9Ce/IKbyrydQL5CrjDZruZfde5KLBqEIr8uXIZ3CcuX63Y1u8Ch4wYw4Zo6vJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2hcsFoBCD+LckQHyQJu5jqsd0QY38bLIbjMFl5FaGo=;
 b=VBfTywFDKC7f8YGiHSk8S5NYuZfXL0T6h/54STzwVrIBuAMaJVj81aGLZD45HlZgEJO8ATGMew8gVRPTgWO41X3y7UjF0eOPM0Zd24r7WdB0GKKiEWwLvBL3jz04ipGobhNuV+5NsWWKk7L9wiPMaTAYajArmbjq3WMrf5N+F1Y=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Fri, 2 Apr
 2021 10:05:46 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::551b:e310:2ae4:3011%6]) with mapi id 15.20.3999.028; Fri, 2 Apr 2021
 10:05:46 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: uprev v6.3 -> v7.2
Date: Fri,  2 Apr 2021 18:05:31 +0800
Message-ID: <20210402100531.1044353-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0140.apcprd02.prod.outlook.com
 (2603:1096:202:16::24) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR02CA0140.apcprd02.prod.outlook.com (2603:1096:202:16::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend Transport; Fri, 2 Apr 2021 10:05:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c13e99a-90c2-43f1-2777-08d8f5bee195
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3767B9C1BE1AA002FFEE3444E47A9@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:22;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	glywKZKyJyE1WwUKue5QoN30TPcGsnSQyl9mT7cL2xi3KFskmU4pSQrtiUDISNhAgvpEWC9oYf1XQy8Kpw0zDoslOCZbQ1aUYLDdLq8CT82lUKLi5XqPemSphNTo2ChP+T11+YBo/mEoVZFbMtEbG6q62EY1bR/8IHg92kTigUlbY7IthLtOVqsTUdkUYx6Lz8QIO5oUSD83qzVKjwIVYr3BlS1ZuH7tKL4iITay4ey3R1F6A7lUocG+CJsiMckkE+4eHtFm5FIpFV/myzeO9MjoofCYNBdX9jI03+CES9yNaU1bEwh1gzMVJ0/xzNG50LmoERO3PproJWIt62PA3znxMw5leYEgQqzIZvgEUHRDBh5qYDSvn3ITbfmuxa9uSAjO8PBXhz3kliWWHaz1xG7oGPwSeVRvIcMnhHMtp4Y009NArW7Y+6e5sNrlPzJ3UStzhEc7wi9vGmaiAXyYLvGEyh6C7fgb2V09W3aWSPUTgkmHgcRd2k0CJ2nJdPhszJVzbeI2UbL05Md77MyFZXBTpvpMOTZlga5s4YFLr1qWYT75yqSrJAeKLpbl7/Ga2CYgyJbSNlGwR9SSjV68TZuHSD/XEooYTUCdF6A4Rky7gD0x3mpIhu1Tam8emPQf6JcDJgceeTuvmMs/aspnAhx8glK7Vd4F9QxWSz6a0q0xBAr5EG9Wx044qG/H3p3+XmoteamtQbeCrYZWWLHuvk6nECdWudhqgfX2OjCleUP7ny15ZkWumJ6v7/8eksxQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39850400004)(1076003)(66946007)(36756003)(956004)(66556008)(5660300002)(6512007)(66476007)(86362001)(52116002)(30864003)(6506007)(8936002)(6486002)(6916009)(186003)(16526019)(2906002)(8676002)(26005)(478600001)(6666004)(83380400001)(9686003)(966005)(316002)(38100700001)(2616005)(21314003)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gsBLd8vibcT2Lb81xf2QI3fV3MSn6fb2FeeopDwYFihr7vO9l2zmFDUKo5rs?=
 =?us-ascii?Q?+B2nNNUwzgS+pC1EY+qV3NSU+MhV1NqWu5KNL/eymysTaD8WZLSJCsYZCxAr?=
 =?us-ascii?Q?h5jjOCk21kyTTtLaLd8Ot0llOgXw8Ib9Bm/R7WeAJFrp0PCgOVJJcC+PB4n8?=
 =?us-ascii?Q?6u+YarQUBGP0tvZm3tTjI0IYCcErV3Ba1q2vCnetpz2EYEUloUBuvIkoY1tX?=
 =?us-ascii?Q?gW774Brd7fejTu3I9cTO8h8Ip8wHWCEWlsdsXztQ5LuSRLCDYoQcptrt5GdH?=
 =?us-ascii?Q?lirC+EgOxA/6t7SIX08iOE99ZfcKaJz7kT9DKdcUoI8i+Zr49Bn47UOHWW+4?=
 =?us-ascii?Q?JcVABbsHB7fWl3AUnfdUY/Po83ucYZjPBfwgbAZRedwvcz06l2rdX8EC+lCK?=
 =?us-ascii?Q?XTtZ7W2r7Mu1iIelCxti9L6KpsWneZ5CErlct48X1FV4hg53VAawCY94ZKsp?=
 =?us-ascii?Q?paZX7rmq8kyjt8IImns75NLcSEfSs0IYFYv3io6TZ4H8gprq0mC85/mi5g1N?=
 =?us-ascii?Q?8DRXmzUrVD2CMCChqzjsIhLWICuUO+HNihilbOJvSpBjH9GxoKn7kzUGragl?=
 =?us-ascii?Q?i+X0Whk7xnNOYzk5Im2FQ183uRwKKK8FNzvYT5t+SufgikGRXvxW8lj4ezFv?=
 =?us-ascii?Q?NuPMGvol0jplT7JeMuskGgh/nTs3Rqet7s/L9ugjtS3AAzYyF5hZkVqMabPc?=
 =?us-ascii?Q?gZ/WnEoIm7Wfnb9A2jCmX1CYKOkWlC4kliGDdoTOGvG8kMe8ROrgcrgUnnOs?=
 =?us-ascii?Q?G/tQqrE59eglzZJQQY2egQj4Cz1/uuYv6x4jnJ6mz7Lt17eSJ4dBsk0bcxMQ?=
 =?us-ascii?Q?UqlNO2Uvm0ks2oKvPReOAaiCheHL5A7cvN688IYC0+AS5F1MyFTG3idT4jSj?=
 =?us-ascii?Q?zKjuuYpdSX5XStbHqe81G5UkbDSvk3o4eI9IEMpA/vSocPWIqgtAa/UVerVu?=
 =?us-ascii?Q?8w/8Ca1BB7FhoNghbz+rKrQmG5sjZuwxKfSzxjNgoVbzczg5uq/LLDRXqxwY?=
 =?us-ascii?Q?Q9l9YvGf57yg2BP33puE1Ub0E90a+1VWUaMk9tCWrj7Oi8bTxHcp7WhfxWzL?=
 =?us-ascii?Q?0j9+6dqHQFHpeGv+HQ91bXK+RrBD1Ozf6ZRA+Ps2RqQXO8TQ47mfDm+SoDMJ?=
 =?us-ascii?Q?x3MGd7sZ2PnIUz3N7e5ElobJvXgX6BjjHKagr/oMvHbEGhvpmIGy9BEuvpp/?=
 =?us-ascii?Q?EFQIac1/287Qf3ZAy8MY+7fY0dr+IGpJH3hq4RUFoahaq+ucqK43pmRlbnnU?=
 =?us-ascii?Q?tKFWNejpQSo54APfsAP3W5IErVMkB0VePzPXKE1BBUouLYWIy5r+fPa36xHu?=
 =?us-ascii?Q?iKkoKEDDzVTKh6odA6Rp/nQ/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c13e99a-90c2-43f1-2777-08d8f5bee195
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 10:05:45.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/pDWmzXl2PGeatNxygLQSkLcfpPeSfNV7ToGmWJ3xI4XmegZMv9XV4z9FN7xya+ge7uGhwJwmVmFzZQ4u6Yew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

This upgrade spans 9 small release. The detailed realese logs could
refer to: https://gitlab.com/libvirt/libvirt/-/blob/master/NEWS.rst

Libvirt's buildsystem has changed to meson, So this upgrade drop some
obsolete patches applied to makefile.

Due to libvirt's meson currently doesn't support to explicit the runtime
binaries path. I made a patch which is
0001-meson-add-options-to-explicit-binaries-path.patch for solving the
problem.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc   |   4 +-
 ...drop-unnecessary-libgnu.la-reference.patch |  31 ----
 ...dd-options-to-explicit-binaries-path.patch |  86 ++++++++++
 .../libvirt/0001-to-fix-build-error.patch     |  47 -----
 ...-search-for-rpc-rpc.h-in-the-sysroot.patch |  34 ----
 .../libvirt/install-missing-file.patch        |  50 ------
 ...read-safety-in-lxc-callback-handling.patch |  63 -------
 ...virt-use-pkg-config-to-locate-libcap.patch |  43 -----
 .../libvirt/qemu-fix-crash-in-qemuOpen.patch  |  39 -----
 .../libvirt/libvirt/runptest.patch            | 116 -------------
 ...t-net-rpc-to-virt-host-validate-when.patch |  91 ----------
 .../{libvirt_6.3.0.bb =3D> libvirt_7.2.0.bb}    | 161 ++++++------------
 12 files changed, 141 insertions(+), 624 deletions(-)
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-build-drop-unnece=
ssary-libgnu.la-reference.patch
 create mode 100644 recipes-extended/libvirt/libvirt/0001-meson-add-options=
-to-explicit-binaries-path.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/0001-to-fix-build-erro=
r.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/configure.ac-search-fo=
r-rpc-rpc.h-in-the-sysroot.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/install-missing-file.p=
atch
 delete mode 100644 recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thre=
ad-safety-in-lxc-callback-handling.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/libvirt-use-pkg-config=
-to-locate-libcap.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemu=
Open.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/runptest.patch
 delete mode 100644 recipes-extended/libvirt/libvirt/tools-add-libvirt-net-=
rpc-to-virt-host-validate-when.patch
 rename recipes-extended/libvirt/{libvirt_6.3.0.bb =3D> libvirt_7.2.0.bb} (=
69%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc
index bcd76572..0c661af8 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -17,8 +17,8 @@ FILES_${PN}-python =3D "${bindir}/* ${libdir}/* ${libdir}=
/${PYTHON_DIR}/*"
=20
 SRC_URI +=3D "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.g=
z;name=3Dlibvirt_python"
=20
-SRC_URI[libvirt_python.md5sum] =3D "4cf898350ee9a47f94986d402c153bdb"
-SRC_URI[libvirt_python.sha256sum] =3D "c772421ecc144f098f4ab15db700c62db9b=
9e6e76b876217edcfd62e9ce02750"
+SRC_URI[libvirt_python.md5sum] =3D "19bf22414a43d358581b9259b52047a7"
+SRC_URI[libvirt_python.sha256sum] =3D "c0c3bac54c55622e17927b09cd984386960=
0d71842fb072c99491fe2608dcee7"
=20
 export LIBVIRT_API_PATH =3D "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS =3D "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-l=
ibgnu.la-reference.patch b/recipes-extended/libvirt/libvirt/0001-build-drop=
-unnecessary-libgnu.la-reference.patch
deleted file mode 100644
index f02a5d64..00000000
--- a/recipes-extended/libvirt/libvirt/0001-build-drop-unnecessary-libgnu.l=
a-reference.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 30a056069cb35804434fb036e51ae97f33c02025 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Sat, 7 Mar 2020 21:36:27 -0500
-Subject: [PATCH] build: drop unnecessary libgnu.la reference
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
----
- tools/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 2a0a989..93fe283 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -168,7 +168,6 @@ virt_host_validate_LDADD =3D \
-=20
- if WITH_GNUTLS
- virt_host_validate_LDADD +=3D ../src/libvirt-net-rpc.la \
--                            ../gnulib/lib/libgnu.la   \
-                             $(NULL)
- endif
-=20
-@@ -270,7 +269,6 @@ BUILT_SOURCES =3D
-=20
- if WITH_GNUTLS
- virsh_LDADD +=3D ../src/libvirt-net-rpc.la \
--               ../gnulib/lib/libgnu.la   \
-                $(NULL)
- endif
-=20
diff --git a/recipes-extended/libvirt/libvirt/0001-meson-add-options-to-exp=
licit-binaries-path.patch b/recipes-extended/libvirt/libvirt/0001-meson-add=
-options-to-explicit-binaries-path.patch
new file mode 100644
index 00000000..4c545d4a
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-meson-add-options-to-explicit-b=
inaries-path.patch
@@ -0,0 +1,86 @@
+From 2e061ccf093063267277893cd5cacc9e7188c629 Mon Sep 17 00:00:00 2001
+From: Yanfei Xu <yanfei.xu@windriver.com>
+Date: Thu, 25 Mar 2021 16:24:04 +0800
+Subject: [PATCH] meson: add options to explicit binaries path
+
+In cross compile evironment, path of binaries is possiblely different
+between target and host. Let's add options to explicit binaries path
+to solve this problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
+---
+ meson.build       | 18 ++++++++++++------
+ meson_options.txt | 23 +++++++++++++++++++++++
+ 2 files changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 369548f127..6c93be8e4b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -943,18 +943,24 @@ optional_programs =3D [
+   'udevadm',
+ ]
+=20
++# if -Dxxx-path option is found, use that. Otherwise, check in $PATH,
++# /usr/sbin, /sbin, and fall back to the default from middle column.
+ foreach name : optional_programs
+-  prog =3D find_program(name, required: false, dirs: libvirt_sbin_path)
+   varname =3D name.underscorify()
+-  if prog.found()
+-    prog_path =3D prog.path()
++  prog_path =3D get_option(name + '-path')
++  if prog_path !=3D ''
++    message('Using @1@ for @0@'.format(name, prog_path))
+   else
+-    prog_path =3D name
++    prog =3D find_program(name, required: false, dirs: libvirt_sbin_path)
++    if prog.found()
++      prog_path =3D prog.path()
++    else
++      prog_path =3D name
++    endif
++  set_variable('@0@_prog'.format(varname), prog)
+   endif
+-
+   conf.set_quoted(varname.to_upper(), prog_path)
+   conf.set_quoted('@0@_PATH'.format(varname.to_upper()), prog_path)
+-  set_variable('@0@_prog'.format(varname), prog)
+ endforeach
+=20
+=20
+diff --git a/meson_options.txt b/meson_options.txt
+index e5d79c2b6b..f06f46c7bb 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -102,3 +102,26 @@ option('numad', type: 'feature', value: 'auto', descr=
iption: 'use numad to manag
+ option('pm_utils', type: 'feature', value: 'auto', description: 'use pm-u=
tils for power management')
+ option('sysctl_config', type: 'feature', value: 'auto', description: 'Whe=
ther to install sysctl configs')
+ option('tls_priority', type: 'string', value: 'NORMAL', description: 'set=
 the default TLS session priority string')
++
++
++option('addr2line-path', type : 'string', description : 'path to addr2lin=
e')
++option('augparse-path', type : 'string', description : 'path to augparse'=
)
++option('dmidecode-path', type : 'string', description : 'path to dmidecod=
e')
++option('dnsmasq-path', type : 'string', description : 'path to dnsmasq')
++option('ebtables-path', type : 'string', description : 'path to ebtables'=
)
++option('flake8-path', type : 'string', description : 'path to flake8')
++option('ip-path', type : 'string', description : 'path to ip')
++option('ip6tables-path', type : 'string', description : 'path to ip6table=
s')
++option('iptables-path', type : 'string', description : 'path to iptables'=
)
++option('iscsiadm-path', type : 'string', description : 'path to iscsiadm'=
)
++option('mdevctl-path', type : 'string', description : 'path to mdevctl')
++option('mm-ctl-path', type : 'string', description : 'path to mm-ctl')
++option('modprobe-path', type : 'string', description : 'path to modprobe'=
)
++option('ovs-vsctl-path', type : 'string', description : 'path to ovs-vsct=
l')
++option('pdwtags-path', type : 'string', description : 'path to pdwtags')
++option('radvd-path', type : 'string', description : 'path to radvd')
++option('rmmod-path', type : 'string', description : 'path to rmmod')
++option('scrub-path', type : 'string', description : 'path to scrub')
++option('tc-path', type : 'string', description : 'path to tc')
++option('udevadm-path', type : 'string', description : 'path to udevadm')
++
+--=20
+2.27.0
+
diff --git a/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch=
 b/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
deleted file mode 100644
index b0148e5c..00000000
--- a/recipes-extended/libvirt/libvirt/0001-to-fix-build-error.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 3566bcacaa6408fb8f655d1749a20b2f30e0c765 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 31 Jul 2015 03:17:07 +0900
-Subject: [PATCH] to fix build error
-
-The error likes as following
-
-| Generating internals/command.html.tmp
-| /bin/sh: line 3: internals/command.html.tmp: No such file or directory
-| rm: Generating internals/locking.html.tmp
-| cannot remove `internals/command.html.tmp': No such file or directory
-| make[3]: *** [internals/command.html.tmp] Error 1
-| make[3]: *** Waiting for unfinished jobs....
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
-[ywei: rebased to libvirt-1.3.2]
-Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
-[MA: rebase to v4.3.0]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-
----
- docs/Makefile.am | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/docs/Makefile.am b/docs/Makefile.am
-index ce3d296..2c8180f 100644
---- a/docs/Makefile.am
-+++ b/docs/Makefile.am
-@@ -366,7 +366,7 @@ EXTRA_DIST=3D \
-   aclperms.htmlinc \
-   $(schema_DATA)
-=20
--acl_generated =3D aclperms.htmlinc
-+acl.html:: $(srcdir)/aclperms.htmlinc
-=20
- aclperms.htmlinc: $(top_srcdir)/src/access/viraccessperm.h \
-         $(top_srcdir)/scripts/genaclperms.py Makefile.am
-@@ -432,8 +432,7 @@ manpages/%.html.in: manpages/%.rst
- 	$(AM_V_GEN)$(MKDIR_P) `dirname $@` && \
- 	  $(RST2HTML) --strict $< > $@ || { rm $@ && exit 1; }
-=20
--%.html.tmp: %.html.in site.xsl subsite.xsl page.xsl \
--		$(acl_generated)
-+%.html.tmp: %.html.in site.xsl subsite.xsl page.xsl
- 	$(AM_V_GEN)name=3D`echo $@ | sed -e 's/.tmp//'`; \
- 	  genhtmlin=3D`echo $@ | sed -e 's/.tmp/.in/'`; \
- 	  rst=3D`echo $@ | sed -e 's/.html.tmp/.rst/'`; \
diff --git a/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-r=
pc.h-in-the-sysroot.patch b/recipes-extended/libvirt/libvirt/configure.ac-s=
earch-for-rpc-rpc.h-in-the-sysroot.patch
deleted file mode 100644
index 395d5610..00000000
--- a/recipes-extended/libvirt/libvirt/configure.ac-search-for-rpc-rpc.h-in=
-the-sysroot.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 79f5975db01af0599860ccca7ef44b0e27105a04 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 10 May 2018 12:05:04 -0400
-Subject: [PATCH] configure.ac: search for rpc/rpc.h in the sysroot
-
-We want to avoid host contamination and use the sysroot as the base
-directory for our search so add the '=3D' the the '-I' when searching
-for libtirpc's rpc.h header.
-
-Upstream-Status: Inappropriate [old release]
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-
----
- m4/virt-xdr.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/m4/virt-xdr.m4 b/m4/virt-xdr.m4
-index 8375415..12b51f7 100644
---- a/m4/virt-xdr.m4
-+++ b/m4/virt-xdr.m4
-@@ -30,10 +30,10 @@ AC_DEFUN([LIBVIRT_CHECK_XDR], [
-     ])
-     with_xdr=3D"yes"
-=20
--    dnl Recent glibc requires -I/usr/include/tirpc for <rpc/rpc.h>
-+    dnl Recent glibc requires -I=3D/usr/include/tirpc for <rpc/rpc.h>
-     old_CFLAGS=3D$CFLAGS
-     AC_CACHE_CHECK([where to find <rpc/rpc.h>], [lv_cv_xdr_cflags], [
--      for add_CFLAGS in '' '-I/usr/include/tirpc' 'missing'; do
-+      for add_CFLAGS in '' '-I=3D/usr/include/tirpc' 'missing'; do
-         if test x"$add_CFLAGS" =3D xmissing; then
-           lv_cv_xdr_cflags=3Dmissing; break
-         fi
diff --git a/recipes-extended/libvirt/libvirt/install-missing-file.patch b/=
recipes-extended/libvirt/libvirt/install-missing-file.patch
deleted file mode 100644
index 6aa36df8..00000000
--- a/recipes-extended/libvirt/libvirt/install-missing-file.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From aa75f5136066d239d48a21373b3d96ee12378e8d Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 May 2019 17:24:17 +0800
-Subject: [PATCH] Install missing conf file
-
-openvzutilstest.conf file is needed by openvzutilstest test.
-
-Upstream-Status: Inapproriate
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
-[KK: Update context for 1.3.5.]
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-[MA: Update context for v4.3.0]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-[DDU: Update context for v5.3.0]
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
----
- tests/Makefile.am | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 4a808dd..0c3e799 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -173,6 +173,7 @@ EXTRA_DIST =3D \
- 	$(NULL)
-=20
- test_helpers =3D commandhelper ssh
-+test_misc =3D
- test_programs =3D virshtest sockettest \
- 	virhostcputest virbuftest \
- 	commandtest seclabeltest \
-@@ -311,6 +312,7 @@ endif WITH_LXC
-=20
- if WITH_OPENVZ
- test_programs +=3D openvzutilstest
-+test_misc +=3D openvzutilstest.conf
- endif WITH_OPENVZ
-=20
- if WITH_ESX
-@@ -1551,7 +1553,7 @@ endif  ! WITH_LINUX
-=20
- buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
-=20
--PTESTS =3D $(TESTS) $(test_helpers) test-lib.sh virschematest
-+PTESTS =3D $(TESTS) $(test_helpers) $(test_misc) test-lib.sh virschemates=
t
-=20
- install-ptest:
- 	list=3D'$(TESTS) $(test_helpers) test-lib.sh virschematest'
diff --git a/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safe=
ty-in-lxc-callback-handling.patch b/recipes-extended/libvirt/libvirt/libvir=
t-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch
deleted file mode 100644
index 558d5ef6..00000000
--- a/recipes-extended/libvirt/libvirt/libvirt-1.0.3-fix-thread-safety-in-l=
xc-callback-handling.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From ad5d9cee87357f9f38f62583119606ef95ba10df Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Fri, 24 May 2013 16:46:00 +0300
-Subject: [PATCH] Fix thread safety in LXC callback handling
-
-Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
----
- src/lxc/lxc_process.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/src/lxc/lxc_process.c b/src/lxc/lxc_process.c
-index aaa81a7..0eadc67 100644
---- a/src/lxc/lxc_process.c
-+++ b/src/lxc/lxc_process.c
-@@ -609,8 +609,13 @@ static void virLXCProcessMonitorExitNotify(virLXCMoni=
torPtr mon ATTRIBUTE_UNUSED
-                                            virLXCProtocolExitStatus statu=
s,
-                                            virDomainObjPtr vm)
- {
-+    virLXCDriverPtr driver =3D lxc_driver;
-     virLXCDomainObjPrivatePtr priv =3D vm->privateData;
-=20
-+    lxcDriverLock(driver);
-+    virObjectLock(vm);
-+    lxcDriverUnlock(driver);
-+
-     switch (status) {
-     case VIR_LXC_PROTOCOL_EXIT_STATUS_SHUTDOWN:
-         priv->stopReason =3D VIR_DOMAIN_EVENT_STOPPED_SHUTDOWN;
-@@ -628,6 +633,8 @@ static void virLXCProcessMonitorExitNotify(virLXCMonit=
orPtr mon ATTRIBUTE_UNUSED
-     }
-     VIR_DEBUG("Domain shutoff reason %d (from status %d)",
-               priv->stopReason, status);
-+
-+    virObjectUnlock(vm);
- }
-=20
- /* XXX a little evil */
-@@ -636,12 +643,21 @@ static void virLXCProcessMonitorInitNotify(virLXCMon=
itorPtr mon ATTRIBUTE_UNUSED
-                                            pid_t initpid,
-                                            virDomainObjPtr vm)
- {
--    virLXCDomainObjPrivatePtr priv =3D vm->privateData;
-+    virLXCDriverPtr driver =3D lxc_driver;
-+    virLXCDomainObjPrivatePtr priv;
-+
-+    lxcDriverLock(driver);
-+    virObjectLock(vm);
-+    lxcDriverUnlock(driver);
-+
-+    priv =3D vm->privateData;
-     priv->initpid =3D initpid;
-     virDomainAuditInit(vm, initpid);
-=20
-     if (virDomainSaveStatus(lxc_driver->caps, lxc_driver->stateDir, vm) <=
 0)
-         VIR_WARN("Cannot update XML with PID for LXC %s", vm->def->name);
-+
-+    virObjectUnlock(vm);
- }
-=20
- static virLXCMonitorCallbacks monitorCallbacks =3D {
---=20
-1.7.11.7
-
diff --git a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-loc=
ate-libcap.patch b/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-=
to-locate-libcap.patch
deleted file mode 100644
index 87b55915..00000000
--- a/recipes-extended/libvirt/libvirt/libvirt-use-pkg-config-to-locate-lib=
cap.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 94bd514e1b6e602a48285db94e65050f8f0c2585 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Wed, 8 Apr 2015 13:03:03 -0400
-Subject: [PATCH] libvirt: use pkg-config to locate libcap
-
-libvirt wants to use pcap-config to locate the exisence and location
-of libpcap. oe-core stubs this script and replaces it with pkg-config,
-which can lead to the host pcap-config triggering and either breaking
-the build or introducing host contamination.
-
-To fix this issue, we patch configure to use 'pkg-config libcap' to
-locate the correct libraries.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-[MA: Update to apply agains v4.3.0]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-
----
- m4/virt-libpcap.m4 | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/m4/virt-libpcap.m4 b/m4/virt-libpcap.m4
-index 605c2fd..e0ab018 100644
---- a/m4/virt-libpcap.m4
-+++ b/m4/virt-libpcap.m4
-@@ -23,14 +23,14 @@ AC_DEFUN([LIBVIRT_ARG_LIBPCAP], [
-=20
- AC_DEFUN([LIBVIRT_CHECK_LIBPCAP], [
-   LIBPCAP_REQUIRED=3D"1.5.0"
--  LIBPCAP_CONFIG=3D"pcap-config"
-+  LIBPCAP_CONFIG=3D"pkg-config libpcap"
-   LIBPCAP_CFLAGS=3D""
-   LIBPCAP_LIBS=3D""
-=20
-   if test "x$with_libpcap" !=3D "xno"; then
-     case $with_libpcap in
--      ''|yes|check) LIBPCAP_CONFIG=3D"pcap-config" ;;
--      *)      LIBPCAP_CONFIG=3D"$with_libpcap/bin/pcap-config" ;;
-+      ''|yes|check) LIBPCAP_CONFIG=3D"pkg-config libpcap" ;;
-+      *)      LIBPCAP_CONFIG=3D"$with_libpcap/bin/pkg-config libpcap" ;;
-     esac
-     AS_IF([test "x$LIBPCAP_CONFIG" !=3D "x"], [
-       AC_MSG_CHECKING(libpcap $LIBPCAP_CONFIG >=3D $LIBPCAP_REQUIRED )
diff --git a/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.pa=
tch b/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch
deleted file mode 100644
index 3cf9e839..00000000
--- a/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 74bff2509080912ea8abf1de8fd95fa2412b659a Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?J=3DC3=3DA1n=3D20Tomko?=3D <jtomko@redhat.com>
-Date: Thu, 11 Apr 2013 11:37:25 +0200
-Subject: [PATCH] qemu: fix crash in qemuOpen
-
-commit 74bff2509080912ea8abf1de8fd95fa2412b659a from upsteam
-git://libvirt.org/libvirt.git
-
-If the path part of connection URI is not present, cfg is used
-unitialized.
-
-https://bugzilla.redhat.com/show_bug.cgi?id=3D950855
----
- src/qemu/qemu_driver.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/qemu/qemu_driver.c b/src/qemu/qemu_driver.c
-index 2c0d7d1..0d41e39 100644
---- a/src/qemu/qemu_driver.c
-+++ b/src/qemu/qemu_driver.c
-@@ -1026,6 +1026,7 @@ static virDrvOpenStatus qemuOpen(virConnectPtr conn,
-             goto cleanup;
-         }
-=20
-+        cfg =3D virQEMUDriverGetConfig(qemu_driver);
-         if (conn->uri->path =3D=3D NULL) {
-             virReportError(VIR_ERR_INTERNAL_ERROR,
-                            _("no QEMU URI path given, try %s"),
-@@ -1033,7 +1034,6 @@ static virDrvOpenStatus qemuOpen(virConnectPtr conn,
-             goto cleanup;
-         }
-=20
--        cfg =3D virQEMUDriverGetConfig(qemu_driver);
-         if (cfg->privileged) {
-             if (STRNEQ(conn->uri->path, "/system") &&
-                 STRNEQ(conn->uri->path, "/session")) {
---=20
-1.7.1
-
diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-exte=
nded/libvirt/libvirt/runptest.patch
deleted file mode 100644
index f6bc7736..00000000
--- a/recipes-extended/libvirt/libvirt/runptest.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From d210838a4433dd254c1a11b08b804ebe9ff5f378 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 May 2019 10:20:47 +0800
-Subject: [PATCH] Add 'install-ptest' rule
-
-Change TESTS_ENVIRONMENT to allow running outside build dir.
-
-Upstream-status: Pending
-Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
-[KK: Update context for 1.3.5.]
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-[MA: Allow separate source and build dirs]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-[ZH: add missing test_helper files]
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-[MA: Update context for v4.3.0]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-[DDU: Update context for v5.3.0]
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
----
- tests/Makefile.am | 68 +++++++++++++++++++++++++++++++++++++++++------
- 1 file changed, 60 insertions(+), 8 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index ada5b8f..4a808dd 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -28,11 +28,13 @@ AM_CPPFLAGS =3D \
-=20
- WARN_CFLAGS +=3D $(RELAXED_FRAME_LIMIT_CFLAGS)
-=20
-+PTEST_DIR ?=3D $(libdir)/libvirt/ptest
-+
- AM_CFLAGS =3D \
--	-Dabs_builddir=3D"\"$(abs_builddir)\"" \
--	-Dabs_top_builddir=3D"\"$(abs_top_builddir)\"" \
--	-Dabs_srcdir=3D"\"$(abs_srcdir)\"" \
--	-Dabs_top_srcdir=3D"\"$(abs_top_srcdir)\"" \
-+	-Dabs_builddir=3D"\"$(PTEST_DIR)/tests\"" \
-+	-Dabs_top_builddir=3D"\"$(PTEST_DIR)\"" \
-+	-Dabs_srcdir=3D"\"$(PTEST_DIR)/tests\"" \
-+	-Dabs_top_srcdir=3D"\"$(PTEST_DIR)\"" \
- 	$(LIBXML_CFLAGS) \
- 	$(GLIB_CFLAGS) \
- 	$(LIBNL_CFLAGS) \
-@@ -474,10 +476,10 @@ TESTS =3D $(test_programs) \
-=20
- VIR_TEST_EXPENSIVE ?=3D $(VIR_TEST_EXPENSIVE_DEFAULT)
- TESTS_ENVIRONMENT =3D \
--  abs_top_builddir=3D"$(abs_top_builddir)" \
--  abs_top_srcdir=3D"$(abs_top_srcdir)" \
--  abs_builddir=3D"$(abs_builddir)" \
--  abs_srcdir=3D"$(abs_srcdir)" \
-+  abs_top_builddir=3D"$(PTEST_DIR)" \
-+  abs_top_srcdir=3D"$(PTEST_DIR)" \
-+  abs_builddir=3D"$(PTEST_DIR)/tests" \
-+  abs_srcdir=3D"$(PTEST_DIR)/tests" \
-   LIBVIRT_AUTOSTART=3D0 \
-   LC_ALL=3DC \
-   VIR_TEST_EXPENSIVE=3D$(VIR_TEST_EXPENSIVE) \
-@@ -1547,4 +1549,54 @@ else ! WITH_LINUX
- EXTRA_DIST +=3D virscsitest.c
- endif  ! WITH_LINUX
-=20
-+buildtest-TESTS: $(TESTS) $(test_libraries) $(test_helpers)
-+
-+PTESTS =3D $(TESTS) $(test_helpers) test-lib.sh virschematest
-+
-+install-ptest:
-+	list=3D'$(TESTS) $(test_helpers) test-lib.sh virschematest'
-+	install -d $(DEST_DIR)/tools
-+	@(if [ -d ../tools/.libs ] ; then cd ../tools/.libs; fi; \
-+	install * $(DEST_DIR)/tools)
-+	install -d $(DEST_DIR)/src/network
-+	cp $(top_srcdir)/src/network/*.xml $(DEST_DIR)/src/network
-+	install -d $(DEST_DIR)/src/cpu_map
-+	cp $(top_srcdir)/src/cpu_map/*.xml $(DEST_DIR)/src/cpu_map
-+	install ../src/libvirt_iohelper $(DEST_DIR)/src
-+	install -D ../src/libvirtd $(DEST_DIR)/src/libvirtd
-+	install -d $(DEST_DIR)/src/remote
-+	install -D $(top_srcdir)/../build/src/remote/libvirtd.conf $(DEST_DIR)/s=
rc/remote/libvirtd.conf
-+	install -d $(DEST_DIR)/src/remote/.libs
-+	@(if [ -d ../src/remote/.libs ] ; then cd ../src/remote/.libs; fi; \
-+	install * $(DEST_DIR)/src/remote/.libs)
-+	install -d $(DEST_DIR)/src/.libs
-+	@(if [ -d ../src/.libs ] ; then cd ../src/.libs; fi; \
-+	install * $(DEST_DIR)/src/.libs)
-+	install -d $(DEST_DIR)/docs/schemas
-+	cp $(top_srcdir)/docs/schemas/*.rng $(DEST_DIR)/docs/schemas
-+	cp -r $(top_srcdir)/build-aux $(DEST_DIR)
-+	install -d $(DEST_DIR)/examples/xml
-+	cp -r $(top_srcdir)/examples/xml/test $(DEST_DIR)/examples/xml
-+	install -d $(DEST_DIR)/tests/.libs
-+	find . -type d -name "*xml2xml*" -exec cp -r {} $(DEST_DIR)/tests \;
-+	find . -type d -name "*data" -exec cp -r {} $(DEST_DIR)/tests \;
-+	@(for file in $(PTESTS); do \
-+		if [ -f .libs/$$file ]; then \
-+			install .libs/$$file $(DEST_DIR)/tests; \
-+		elif [ -f $(srcdir)/$$file ]; then \
-+			install $(srcdir)/$$file $(DEST_DIR)/tests; \
-+		else \
-+			install $(builddir)/$$file $(DEST_DIR)/tests; \
-+		fi; \
-+	done;)
-+	@(if [ -d .libs ]; then install .libs/*.so $(DEST_DIR)/tests/.libs; fi;)
-+	cp ../config.h $(DEST_DIR)
-+	cp Makefile $(DEST_DIR)/tests
-+	sed -i -e 's/^Makefile:/_Makefile:/' $(DEST_DIR)/tests/Makefile
-+	cp ../Makefile $(DEST_DIR)
-+	sed -i -e 's|^Makefile:|_Makefile:|' $(DEST_DIR)/Makefile
-+	sed -i -e 's|$(BUILD_DIR)|$(PTEST_DIR)|g' $(DEST_DIR)/tests/Makefile
-+	sed -i -e 's|$(BUILD_DIR)|$(PTEST_DIR)|g' $(DEST_DIR)/Makefile
-+	sed -i -e 's|^\(.*\.log:\) \(.*EXEEXT.*\)|\1|g' $(DEST_DIR)/tests/Makefi=
le
-+
- CLEANFILES =3D *.cov *.gcov .libs/*.gcda .libs/*.gcno *.gcno *.gcda
diff --git a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-=
virt-host-validate-when.patch b/recipes-extended/libvirt/libvirt/tools-add-=
libvirt-net-rpc-to-virt-host-validate-when.patch
deleted file mode 100644
index bb500fde..00000000
--- a/recipes-extended/libvirt/libvirt/tools-add-libvirt-net-rpc-to-virt-ho=
st-validate-when.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 7dc21edd851b260485b432c096f8e90f6fa07778 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Tue, 7 May 2019 15:26:32 +0800
-Subject: [PATCH] tools: add libvirt-net-rpc to virt-host-validate when TLS=
 is
- enabled
-
-When gnu-tls is enabled for libvirt references to virNetTLSInit are
-generated in libvirt. Any binaries linking against libvirt, must also
-link against libvirt-net-rpc which provides the implementation.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
-[ywei: rebased to libvirt-1.3.2]
-Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
-[MA: rebase to v4.3.0]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-[ddu: rebase to v5.3.0]
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
----
- examples/Makefile.am | 20 ++++++++++++++++++++
- tools/Makefile.am    | 12 ++++++++++++
- 2 files changed, 32 insertions(+)
-
-diff --git a/examples/Makefile.am b/examples/Makefile.am
-index ad635bd..a94f41d 100644
---- a/examples/Makefile.am
-+++ b/examples/Makefile.am
-@@ -74,6 +74,10 @@ LDADD =3D \
- 	$(top_builddir)/src/libvirt-admin.la \
- 	$(NULL)
-=20
-+if WITH_GNUTLS
-+LDADD +=3D $(top_builddir)/src/libvirt-net-rpc.la
-+endif
-+
- noinst_PROGRAMS =3D \
- 	c/admin/client_close \
- 	c/admin/client_info \
-@@ -111,6 +115,22 @@ c_misc_openauth_SOURCES =3D c/misc/openauth.c
- examplesdir =3D $(docdir)/examples
-=20
- adminexamplesdir =3D $(examplesdir)/c/admin
-+
-+if WITH_GNUTLS
-+dominfo_info1_LDADD =3D $(top_builddir)/src/libvirt-net-rpc.la  \
-+               $(LDADD)    \
-+               $(NULL)
-+domsuspend_suspend_LDADD =3D $(top_builddir)/src/libvirt-net-rpc.la  \
-+               $(LDADD)    \
-+               $(NULL)
-+hellolibvirt_hellolibvirt_LDADD =3D $(top_builddir)/src/libvirt-net-rpc.l=
a  \
-+               $(LDADD)    \
-+               $(NULL)
-+openauth_openauth_LDADD =3D $(top_builddir)/src/libvirt-net-rpc.la  \
-+               $(LDADD)   \
-+               $(NULL)
-+endif
-+
- adminexamples_DATA =3D $(ADMIN_EXAMPLES)
-=20
- domainexamplesdir =3D $(examplesdir)/c/domain
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 53df930..2a0a989 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -166,6 +166,12 @@ virt_host_validate_LDADD =3D \
- 		$(GLIB_LIBS) \
- 		$(NULL)
-=20
-+if WITH_GNUTLS
-+virt_host_validate_LDADD +=3D ../src/libvirt-net-rpc.la \
-+                            ../gnulib/lib/libgnu.la   \
-+                            $(NULL)
-+endif
-+
- virt_host_validate_CFLAGS =3D \
- 		$(AM_CFLAGS) \
- 		$(NULL)
-@@ -262,6 +268,12 @@ virt_admin_CFLAGS =3D \
- 		$(READLINE_CFLAGS)
- BUILT_SOURCES =3D
-=20
-+if WITH_GNUTLS
-+virsh_LDADD +=3D ../src/libvirt-net-rpc.la \
-+               ../gnulib/lib/libgnu.la   \
-+               $(NULL)
-+endif
-+
- if WITH_WIN_ICON
- virsh_LDADD +=3D virsh_win_icon.$(OBJEXT)
-=20
diff --git a/recipes-extended/libvirt/libvirt_6.3.0.bb b/recipes-extended/l=
ibvirt/libvirt_7.2.0.bb
similarity index 69%
rename from recipes-extended/libvirt/libvirt_6.3.0.bb
rename to recipes-extended/libvirt/libvirt_7.2.0.bb
index 41abb06f..790071d5 100644
--- a/recipes-extended/libvirt/libvirt_6.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -18,96 +18,42 @@ RDEPENDS_${PN} =3D "gettext-runtime"
=20
 RDEPENDS_${PN}-ptest +=3D "make gawk perl bash"
=20
-RDEPENDS_libvirt-libvirtd +=3D "bridge-utils iptables pm-utils dnsmasq net=
cat-openbsd"
+RDEPENDS_libvirt-libvirtd +=3D "bridge-utils iptables pm-utils dnsmasq net=
cat-openbsd ebtables"
 RDEPENDS_libvirt-libvirtd_append_x86-64 =3D " dmidecode"
 RDEPENDS_libvirt-libvirtd_append_x86 =3D " dmidecode"
=20
 #connman blocks the 53 port and libvirtd can't start its DNS service
 RCONFLICTS_${PN}_libvirtd =3D "connman"
=20
+HOSTTOOLS_NONFATAL +=3D "getent"
+
 SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibvir=
t \
-           file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.pat=
ch \
            file://libvirtd.sh \
            file://libvirtd.conf \
            file://dnsmasq.conf \
-           file://runptest.patch \
            file://run-ptest \
-           file://libvirt-use-pkg-config-to-locate-libcap.patch \
-           file://0001-to-fix-build-error.patch \
-           file://install-missing-file.patch \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.p=
atch \
-           file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
-           file://0001-build-drop-unnecessary-libgnu.la-reference.patch \
            file://hook_support.py \
            file://gnutls-helper.py \
+           file://0001-meson-add-options-to-explicit-binaries-path.patch \
           "
=20
-SRC_URI[libvirt.md5sum] =3D "1bd4435f77924f5ec9928b538daf4a02"
-SRC_URI[libvirt.sha256sum] =3D "74069438d34082336e99a88146349e21130552b96e=
fc3b7c562f6878127996f5"
+SRC_URI[libvirt.md5sum] =3D "92044b629216e44adce63224970a54a3"
+SRC_URI[libvirt.sha256sum] =3D "01f459d0c7ba5009622a628dba1a026200e8f4a299=
fea783b936a71d7e0ed1d0"
=20
-inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perl=
native
+inherit meson gettext update-rc.d pkgconfig ptest systemd useradd perlnati=
ve
 USERADD_PACKAGES =3D "${PN}"
 GROUPADD_PARAM_${PN} =3D "-r qemu; -r kvm"
 USERADD_PARAM_${PN} =3D "-r -g qemu -G kvm qemu"
=20
-# Override the default set in autotools.bbclass so that we will use relati=
ve pathnames
-# to our local m4 files.  This prevents an "Argument list too long" error =
during configuration
-# if our project is in a directory with an absolute pathname of more than =
about 125 characters.
-#
-acpaths =3D "-I ./m4"
-
-CACHED_CONFIGUREVARS +=3D "\
-ac_cv_path_XMLCATLOG=3D/usr/bin/xmlcatalog \
-ac_cv_path_AUGPARSE=3D/usr/bin/augparse \
-ac_cv_path_DMIDECODE=3D/usr/sbin/dmidecode \
-ac_cv_path_DNSMASQ=3D/usr/bin/dnsmasq \
-ac_cv_path_BRCTL=3D/usr/sbin/brctl \
-ac_cv_path_TC=3D/sbin/tc \
-ac_cv_path_UDEVADM=3D/sbin/udevadm \
-ac_cv_path_MODPROBE=3D/sbin/modprobe \
-ac_cv_path_IP_PATH=3D/bin/ip \
-ac_cv_path_IPTABLES_PATH=3D/usr/sbin/iptables \
-ac_cv_path_IP6TABLES_PATH=3D/usr/sbin/ip6tables \
-ac_cv_path_MOUNT=3D/bin/mount \
-ac_cv_path_UMOUNT=3D/bin/umount \
-ac_cv_path_MKFS=3D/usr/sbin/mkfs \
-ac_cv_path_SHOWMOUNT=3D/usr/sbin/showmount \
-ac_cv_path_PVCREATE=3D/usr/sbin/pvcreate \
-ac_cv_path_VGCREATE=3D/usr/sbin/vgcreate \
-ac_cv_path_LVCREATE=3D/usr/sbin/lvcreate \
-ac_cv_path_PVREMOVE=3D/usr/sbin/pvremove \
-ac_cv_path_VGREMOVE=3D/usr/sbin/vgremove \
-ac_cv_path_LVREMOVE=3D/usr/sbin/lvremove \
-ac_cv_path_LVCHANGE=3D/usr/sbin/lvchange \
-ac_cv_path_VGCHANGE=3D/usr/sbin/vgchange \
-ac_cv_path_VGSCAN=3D/usr/sbin/vgscan \
-ac_cv_path_PVS=3D/usr/sbin/pvs \
-ac_cv_path_VGS=3D/usr/sbin/vgs \
-ac_cv_path_LVS=3D/usr/sbin/lvs \
-ac_cv_path_PARTED=3D/usr/sbin/parted \
-ac_cv_path_DMSETUP=3D/usr/sbin/dmsetup"
-
-# Ensure that libvirt uses polkit rather than policykit, whether the host =
has
-# pkcheck installed or not, and ensure the path is correct per our config.
-CACHED_CONFIGUREVARS +=3D "ac_cv_path_PKCHECK_PATH=3D${bindir}/pkcheck"
-
-# Some other possible paths we are not yet setting
-#ac_cv_path_RPCGEN=3D
-#ac_cv_path_XSLTPROC=3D
-#ac_cv_path_RADVD=3D
-#ac_cv_path_UDEVSETTLE=3D
-#ac_cv_path_EBTABLES_PATH=3D
-#ac_cv_path_PKG_CONFIG=3D
-#ac_cv_path_ac_pt_PKG_CONFIG
-#ac_cv_path_POLKIT_AUTH=3D
-#ac_cv_path_DTRACE=3D
-#ac_cv_path_ISCSIADM=3D
-#ac_cv_path_MSGFMT=3D
-#ac_cv_path_GMSGFMT=3D
-#ac_cv_path_XGETTEXT=3D
-#ac_cv_path_MSGMERGE=3D
-#ac_cv_path_SCRUB=3D
-#ac_cv_path_PYTHON=3D
+
+EXTRA_OEMESON +=3D " \
+    -Dip6tables-path=3D/usr/sbin/ip6tables \
+    -Ddmidecode-path=3D/usr/sbin/dmidecode \
+    -Ddnsmasq-path=3D/usr/bin/dnsmasq \
+    -Diptables-path=3D/usr/sbin/iptables \
+    -Debtables-path=3D/sbin/ebtables \
+    "
=20
 ALLOW_EMPTY_${PN} =3D "1"
=20
@@ -191,7 +137,7 @@ PRIVATE_LIBS_${PN}-ptest =3D " \
 # full config
 PACKAGECONFIG ??=3D "gnutls qemu yajl openvz vmware vbox esx iproute2 lxc =
test \
                    remote macvtap libvirtd netcf udev python ebtables \
-                   fuse iproute2 firewalld libpcap \
+                   fuse firewalld libpcap \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'sel=
inux audit libcap-ng', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl',=
 '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polk=
it', '', d)} \
@@ -208,37 +154,34 @@ PACKAGECONFIG_remove_armeb =3D "numactl"
 # enable,disable,depends,rdepends
 #
 PACKAGECONFIG[gnutls] =3D ",,,gnutls-bin"
-PACKAGECONFIG[qemu] =3D "--with-qemu --with-qemu-user=3Dqemu --with-qemu-g=
roup=3Dqemu,--without-qemu,qemu,"
-PACKAGECONFIG[yajl] =3D "--with-yajl,--without-yajl,yajl,yajl"
-PACKAGECONFIG[libxl] =3D "--with-libxl=3D${STAGING_DIR_TARGET}/lib,--witho=
ut-libxl,xen,"
-PACKAGECONFIG[openvz] =3D "--with-openvz,--without-openvz,,"
-PACKAGECONFIG[vmware] =3D "--with-vmware,--without-vmware,,"
-PACKAGECONFIG[vbox] =3D "--with-vbox,--without-vbox,,"
-PACKAGECONFIG[esx] =3D "--with-esx,--without-esx,,"
-PACKAGECONFIG[hyperv] =3D "--with-hyperv,--without-hyperv,,"
-PACKAGECONFIG[polkit] =3D "--with-polkit,--without-polkit,polkit,polkit"
-PACKAGECONFIG[lxc] =3D "--with-lxc,--without-lxc, lxc,"
-PACKAGECONFIG[test] =3D "--with-test=3Dyes,--with-test=3Dno,,"
-PACKAGECONFIG[remote] =3D "--with-remote,--without-remote,,"
-PACKAGECONFIG[macvtap] =3D "--with-macvtap=3Dyes,--with-macvtap=3Dno,libnl=
,libnl"
-PACKAGECONFIG[libvirtd] =3D "--with-libvirtd,--without-libvirtd,,"
-PACKAGECONFIG[netcf] =3D "--with-netcf,--without-netcf,netcf,netcf"
-PACKAGECONFIG[dtrace] =3D "--with-dtrace,--without-dtrace,,"
-PACKAGECONFIG[udev] =3D "--with-udev --with-pciaccess,--without-udev,udev =
libpciaccess,"
-PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux,libselinux,"
-PACKAGECONFIG[ebtables] =3D "ac_cv_path_EBTABLES_PATH=3D/sbin/ebtables,ac_=
cv_path_EBTABLES_PATH=3D,ebtables,ebtables"
+PACKAGECONFIG[qemu] =3D "-Ddriver_qemu=3Denabled -Dqemu_user=3Dqemu -Dqemu=
_group=3Dqemu,-Dqemu=3Ddisabled,qemu,"
+PACKAGECONFIG[yajl] =3D "-Dyajl=3Denabled,-Dyajl=3Ddisabled,yajl,yajl"
+PACKAGECONFIG[libxl] =3D "-Dlibxl=3D${STAGING_DIR_TARGET}/lib,,xen,"
+PACKAGECONFIG[openvz] =3D "-Ddriver_openvz=3Denabled,-Ddriver_openvz=3Ddis=
abled,,"
+PACKAGECONFIG[vmware] =3D "-Ddriver_vmware=3Denabled,-Ddriver_vmware=3Ddis=
abled,,"
+PACKAGECONFIG[vbox] =3D "-Ddriver_vbox=3Denabled,-Ddriver_vbox=3Ddisabled,=
,"
+PACKAGECONFIG[esx] =3D "-Ddriver_esx=3Denabled,-Ddriver_esx=3Ddisabled,,"
+PACKAGECONFIG[hyperv] =3D "-Ddriver_hyperv=3Denabled,-Ddriver_hyperv=3Ddis=
abled,,"
+PACKAGECONFIG[polkit] =3D "-Dpolkit=3Denabled,-Dpolkit=3Ddisabled,polkit,p=
olkit"
+PACKAGECONFIG[lxc] =3D "-Ddriver_lxc=3Denabled,-Ddriver_lxc=3Ddisabled,lxc=
,"
+PACKAGECONFIG[test] =3D "-Ddriver_test=3Denabled,-Ddriver_test=3Ddisabled,=
,"
+PACKAGECONFIG[remote] =3D "-Ddriver_remote=3Denabled,-Ddriver_remote=3Ddis=
abled,,"
+PACKAGECONFIG[libvirtd] =3D "-Ddriver_libvirtd=3Denabled,-Ddriver_libvirtd=
=3Ddisabled,,"
+PACKAGECONFIG[netcf] =3D "-Dnetcf=3Denabled,-Dnetcf=3Ddisabled,netcf,netcf=
"
+PACKAGECONFIG[dtrace] =3D "-Ddtrace=3Denabled,-Ddtrace=3Ddisabled,,"
+PACKAGECONFIG[udev] =3D "-Dudev=3Denabled -Dpciaccess=3Denabled,-Dudev=3Dd=
isabled,udev libpciaccess,"
+PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,libse=
linux,"
 PACKAGECONFIG[python] =3D ",,python3,"
-PACKAGECONFIG[sasl] =3D "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
-PACKAGECONFIG[iproute2] =3D "ac_cv_path_IP_PATH=3D/sbin/ip,ac_cv_path_IP_P=
ATH=3D,iproute2,iproute2"
-PACKAGECONFIG[numactl] =3D "--with-numactl,--without-numactl,numactl,"
-PACKAGECONFIG[fuse] =3D "--with-fuse,--without-fuse,fuse,"
-PACKAGECONFIG[audit] =3D "--with-audit,--without-audit,audit,"
-PACKAGECONFIG[libcap-ng] =3D "--with-capng,--without-capng,libcap-ng,"
-PACKAGECONFIG[wireshark] =3D "--with-wireshark-dissector,--without-wiresha=
rk-dissector,wireshark libwsutil,"
-PACKAGECONFIG[apparmor-profiles] =3D "--with-apparmor-profiles, --without-=
apparmor-profiles,"
-PACKAGECONFIG[firewalld] =3D "--with-firewalld, --without-firewalld,"
-PACKAGECONFIG[libpcap] =3D "--with-libpcap, --without-libpcap,libpcap,libp=
cap"
-PACKAGECONFIG[numad] =3D "--with-numad, --without-numad,"
+PACKAGECONFIG[sasl] =3D "-Dsasl=3Denabled,-Dsasl=3Ddisabled,cyrus-sasl,cyr=
us-sasl"
+PACKAGECONFIG[numactl] =3D "-Dnumactl=3Denabled,-Dnumactl=3Ddisabled,numac=
tl,"
+PACKAGECONFIG[fuse] =3D "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse,"
+PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
+PACKAGECONFIG[libcap-ng] =3D "-Dcapng=3Denabled,-Dcapng=3Ddisabled,libcap-=
ng,"
+PACKAGECONFIG[wireshark] =3D "-Dwireshark_dissector=3Denabled,-Dwireshark_=
dissector=3Ddisabled,wireshark libwsutil,"
+PACKAGECONFIG[apparmor_profiles] =3D "-Dapparmor_profiles=3Dtrue, -Dapparm=
or_profiles=3Dfalse,"
+PACKAGECONFIG[firewalld] =3D "-Dfirewalld=3Denabled, -Dfirewalld=3Ddisable=
d,"
+PACKAGECONFIG[libpcap] =3D "-Dlibpcap=3Denabled, -Dlibpcap=3Ddisabled,libp=
cap,libpcap"
+PACKAGECONFIG[numad] =3D "-Dnumad=3Denabled, -Dnumad=3Ddisabled,"
=20
 # Enable the Python tool support
 require libvirt-python.inc
@@ -255,7 +198,7 @@ do_compile() {
=20
 	cd ${B}
 	export PKG_CONFIG_PATH=3D"$PKG_CONFIG_PATH:${B}/src:"
-	oe_runmake all
+	ninja all
 }
=20
 do_install_prepend() {
@@ -278,6 +221,8 @@ do_install_append() {
 	fi
=20
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; t=
hen
+            mkdir -p ${D}/lib
+            mv ${D}/usr/lib/systemd ${D}/lib
 	    # This variable is used by libvirtd.service to start libvirtd in the =
right mode
 	    sed -i '/#LIBVIRTD_ARGS=3D"--listen"/a LIBVIRTD_ARGS=3D"--listen --da=
emon"' ${D}/${sysconfdir}/sysconfig/libvirtd
=20
@@ -360,7 +305,7 @@ do_install_append() {
 	    # connection via 127.0.0.1 is available out of box.
 	    install -d ${D}/etc/pki/CA
 	    install -d ${D}/etc/pki/libvirt/private
-	    install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
+            install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
 	    install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/p=
rivate/cakey.pem
 	    install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacer=
t.pem
 	    install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvi=
rt/private/serverkey.pem
@@ -376,10 +321,10 @@ do_install_append() {
 	chmod 4755 ${D}${bindir}/virt-login-shell
 }
=20
-EXTRA_OECONF +=3D " \
-    --with-init-script=3Dsystemd \
-    --with-test-suite \
-    --with-runstatedir=3D/run \
+EXTRA_OEMESON +=3D " \
+    -Dinit_script=3Dsystemd \
+    -Drunstatedir=3D/run \
+    -Dtests=3Denabled \
     "
=20
 # gcc9 end up mis-compiling qemuxml2argvtest.o with Og which then
@@ -392,11 +337,11 @@ EXTRA_OEMAKE =3D "BUILD_DIR=3D${B} DEST_DIR=3D${D}${P=
TEST_PATH} PTEST_DIR=3D${PTEST_PATH
 PRIVATE_LIBS_${PN}-ptest_append =3D "libvirt-admin.so.0"
=20
 do_compile_ptest() {
-	oe_runmake -C tests buildtest-TESTS
+	ninja -C tests buildtest-TESTS
 }
=20
 do_install_ptest() {
-	oe_runmake -C tests install-ptest
+	ninja -C tests install-ptest
=20
 	find ${S}/tests -maxdepth 1 -type d -exec cp -r {} ${D}${PTEST_PATH}/test=
s/ \;
=20
--=20
2.27.0

