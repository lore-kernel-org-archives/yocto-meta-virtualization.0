Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74187C02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 05:47:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14929.1736920037635896951
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3110ba285b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5F3kW018072
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 445yumrar5-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnNeVtBRif8cU89AtpPRLwCZDGlZk6AMOnqo5VXMC6DDHjJJajO5qK/qzkXFBNFaDFrsjU6iqcSFqx4HdVpyFFNMuEXHuZ2QeQhb+PGHb3/aTCun9TAgF+jXjPyoNgr9LhKHp552BesLW9Iaiabsvl9VyRqeGfhPInE9aA4O9UM10TqX4zdJGlvqvls3Ni5B4+t/b9LEstEq/QZa16Co1fd0cKejPADzbt5Hg+7HuTF+UfOn/k28blhgQarUHQo/GggcxKw0i/AdOQqWtHxYd0r5+viwG8fMMuBsXhxgwZWKGMv580WAb1JY7C6qfguyfva7SX7iKZ37rhuN0ipTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCVvyEhMsUi5eo2sxNCjhvMALI9Yz9PUfAqjwnOLdWQ=;
 b=hVrnlpfzaZ/0YfQ3vKPw6rxrHZTRtD8Fsy71O/gB5jfioT81xiIJR55LyCM0UC+4Rxi++FvsCJRIFfXG5IZiB3CtTNCTYhz/DDmweqcJDiZrhZRlY8qGgUL3QZODqQWInM4RA/TAaw21UWZBiyWY8DUTPIqQtgssQoWdkmtP6ct8ip87Hfjvjh7z4C8uIR9SUpeR8mDQBSgIkk3nGtiGC7JPbiN/Y3uk2jEm99VqObnH9rUxgBQbI1C/I14WUqk2ESNkThLZr9hqMokL3sq4FZHoRUzM4Bwl2Dx7+MHNAaG0BZYWpN8i/CVjTpwtnu6o9HLw/x0Ak+BlY4RL4ZLcng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 05:47:12 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 05:47:12 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 4/4] cri-o: fix textrel QA issue
Date: Tue, 14 Jan 2025 21:46:39 -0800
Message-Id: <20250115054639.1079705-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115054639.1079705-1-Qi.Chen@windriver.com>
References: <20250115054639.1079705-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f13dba-f596-40e4-d810-08dd35280e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4HM4KMs2Se0+ingSFeRyyqSyIgerVCO/PiLySvajHgd0d4YMnWI63uu31z5N?=
 =?us-ascii?Q?h+rL52yLmr4XYlRhL2/WNC64H0iEasHopfCnYnRzpDzPKz5B0uzKe9f/MToY?=
 =?us-ascii?Q?J4TVkx9iHsEVt6OhcpS0nSKzVfbS7bDrv1EI8yU3KlZp5wBenkfJLHSTVDhk?=
 =?us-ascii?Q?dnVs0JHPBBDYFmuyspVE7JDZiyZRrkQYfXrw6Gc+BKb7o2QVpUs4I+Uo7mvQ?=
 =?us-ascii?Q?tgmUbdk0kwVselRzp6C5ReyylR0tssvLp9BEjrMBlzRYHFUwymiOQ43TEKpm?=
 =?us-ascii?Q?xIWhcBZSI3b8rF5PvuKkU8294CX80w7mw9ImjTQv+R6865TyDQFtxbmqR/AF?=
 =?us-ascii?Q?nb1gvoeoB1xAiVXqfAotRLHLnoeceCqi6bJul+wW1/Ak5KZ0hAmJr+hKl15p?=
 =?us-ascii?Q?zq9w7QBaTOSVVeWQPxM4WM6rCHZothioAMMbXsN0ZFuhiUgo8z9sUpJO6y6/?=
 =?us-ascii?Q?dp85B85oq+C+8W6tpVbgYJd6/jWZvhbj87Yb/D2a/ykGP7S08kXUasZ47oi+?=
 =?us-ascii?Q?1v9ug1isQuWVqkHR7oS8uW3pxBprCDGOCqxSCGbC3eaZp3DTRXDiOzuaAEuX?=
 =?us-ascii?Q?P+xHSoUc2iftchaZTvhK7ppxeDDna+uDv49VZQS8YktJK40J0oB+QADODsNR?=
 =?us-ascii?Q?tzbRUC/ToVx+G7knpWTgnqR+rOYt4FOG258woN29g1a1YL6/rl0nsIZdU2SC?=
 =?us-ascii?Q?6lCW3suWrZjWdTFsevh9aBc1LXO/SlJwa555niNQR5hkVs1K25FrILqBvQNU?=
 =?us-ascii?Q?CK6M3iKd7L64iGlHAABwR+9Ioo9Li05y6L8V+mHbGjmErC1JFyf3lTyFm4j3?=
 =?us-ascii?Q?zqeDGHKKqPvavkiQY8wChDdg5zrZyyW5EI2Yh4eHs0qhxXxW5a1HItZsw+xB?=
 =?us-ascii?Q?SVRgO0J9N4GFHsmdE76KE/1JObFn3vy9C46sOOqnDTv7x+mPumFIJnJvcMZb?=
 =?us-ascii?Q?3vGuQdpq5IMxAZ1AIB4cwOS32R1f7K/COvtEdpQQgW0ODWcZLvAdckoBViEy?=
 =?us-ascii?Q?fM61ATt1nZz7l1DEa/7jT8Ds8k+slrwmVuZHo60DTDkGQqWTIA5sIsfVsc/J?=
 =?us-ascii?Q?CgqZ08M09AjB0lM4ZkMZRKSzH8FIJR3hvvIxhlRy+88SVOQEkCTDQoSi+1yE?=
 =?us-ascii?Q?GRq4L8lsk8vhsMSlm8Wwdcp/Fp2uMEu1+Wi2+yt9iZs3NQIfosYf0Y4tBzx/?=
 =?us-ascii?Q?39bo4MFCOaxFXz7mExh465HNjxQmYouIWCt9CSXbrY5NREdgD1Lmx+pS7DmU?=
 =?us-ascii?Q?O78evibajpcxF3bmL5e9efFsD0V471sj4TuZH7GluW3DLzfh6PuOj5wxjhI3?=
 =?us-ascii?Q?li5zDv4FEtzWEIH8hQzQvbAutTYXJ+N6WecToxN4cNhUtTZylWc4iYybT7DV?=
 =?us-ascii?Q?E+bv5TfVaii9U+WJ3RXPf+qvT90x4Ur4vBhe0bVqjfI4mNhIcw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3A+rF7vCsxCuywYP4U5WrTzyK5pQDhdeO583AfNVKIK7dZ6OgVLC4yXvzeXI?=
 =?us-ascii?Q?mEOIm5V8yE3HOvAkA6qKTaMMvIPDCycEbyQjzLnBmqulYc6Np1Jd0l9QL/Ix?=
 =?us-ascii?Q?1SEQXiU8sRaej6zSJemSRxi3I0Y37WCx1Dd7ad1YRtMQmV5zKOa3OXlCoWub?=
 =?us-ascii?Q?e2pD1RenFq5JCa3oxlr4WNg2bTRlpLb4acjMdtZH/Qoh89YAQUI8eJWiBO4W?=
 =?us-ascii?Q?myrSjZY+Zkh3qpZggxwP9oHc1vUU2jGlkgW8100x8DUcZS+NSYvciwkR8vUh?=
 =?us-ascii?Q?LfoOoSTXfYTqhUUaKrQPfz4ZHVsHorjKnNXdF0VFejSf9Upw3PxA2ABCS82U?=
 =?us-ascii?Q?xTpYk34DRkpBcU3AmgOcnjFVFlxucxwaxbeneLBTWEELQrAybzrHR6hEb+bl?=
 =?us-ascii?Q?jVhmqHe5tRxVyFLJdkISTiM2qY+fJgaSRBArPOxpnCpkYCCsLjbP2m5qEH9S?=
 =?us-ascii?Q?0OBcJK3+ghdZunpVqDn5pdWdI47XydYXIaoZtl72I3XuxgOQYpcIgBslo/Gl?=
 =?us-ascii?Q?1uYtgRyclG53s68AyEGwXc0CKRmYpVcK+C/wcllBDjw211katBtL96rzC4Ii?=
 =?us-ascii?Q?iNKh/S3+NIWS8O5QyfqLK4h0CTEzqR/5fE7Nb7Wgdld+OwuDlBT+w0dIy1bY?=
 =?us-ascii?Q?5oOXkDX5DSu4MxMJVze5jgXl5X6eLo7T2wRUJmNk1i37PHEw4rHZO0hdNUKn?=
 =?us-ascii?Q?3Gy3tAPfehWLqv/hWQSOBtNc74BxNtG5ID/mKnfBs9Zp1PdEsy19wk3XuB/3?=
 =?us-ascii?Q?iBLkDPmzwwr95xUPPiMVNJ4/J8slFZjlizT3Ul+bESyqfBa+PnvVL31ZuX8p?=
 =?us-ascii?Q?BlOUmW2s9GwEVbYZaaoz6k3wqsHwhn6sbMybiCXkouknGyBt0sJMu3A2nvfZ?=
 =?us-ascii?Q?ijoQBsyKy2pNLVZ5bQYiZVrzZzF+jpjJdfh6N/Wcddrbmlhal+F8CapHMrLh?=
 =?us-ascii?Q?r5CUn/mQ8T0rDj7gRpddOIq0/7hXkuiQcPghhlDyv/83hvPpz4hSrLGaR81u?=
 =?us-ascii?Q?F8Z/oG2RDQvd+W4LzNvLGlqkneoAwdz0HVf0sS7iEIHRHiWMMARRzEoBIAVc?=
 =?us-ascii?Q?B+lUOIjMo7qcDfE//zMuyfFt7y9aI7ZHxFZq8LKmCua59RLrLAd86KQr+rW/?=
 =?us-ascii?Q?9r64xFmS8zYz0ebcz6HvdVylzOes07xDC1Kpyk1WV3GUSr+7ha12GErEwR8S?=
 =?us-ascii?Q?PAYOVwTANPdLqJbjiYOeu7eUjnFiyBCGTP0UeLAfGHqPUwdPRBbmf7f3afFe?=
 =?us-ascii?Q?qtJz23x1+QEt8Pbm/LF7IrKqqys/GnyZik82ofQj/r6GmNief49SsnzZREKL?=
 =?us-ascii?Q?UfekgVIXbyX127qP+yM/Xju5lqJkeqqI7t6ZvS+Ky3ftYlXdbuJQk4K2Eaqh?=
 =?us-ascii?Q?Kksozdfxkhdr4inSPP5qkC9NIMMgTIyMGh6pg6ZvwpfwK2Jw7dR0rGYaq4kx?=
 =?us-ascii?Q?ZjrnVKiGHUnUukxfI5YaoYHwGsscvDU6RWiAifdVObueemQhVF/yD9M/Yr8K?=
 =?us-ascii?Q?JrOCMK3nttrKe6ShNHGMEw1Pl66p1GDM6w0L1eUEYnVBVTB5bgfpsTWJN8zg?=
 =?us-ascii?Q?m/JUM8H0hueUHeGssh954CdfpElrrgv0UME8UU5JIqG+QVaiWa5qbhVnHR69?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f13dba-f596-40e4-d810-08dd35280e6b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 05:47:11.4891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+MGOyLn3w6iIIjvuMdtiVgdOIWLg3C+rqnEm7Rebzlhvh2sz09RnZRMai7SPpOBJrv48QZXmV9zPuqyFDQL4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-Proofpoint-GUID: q4nD46pUEgSiWIg-ByaURD3iPhJ-VjCf
X-Authority-Analysis: v=2.4 cv=EeoyQOmC c=1 sm=1 tr=0 ts=67874be4 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Pp7WbQjNLw5SkzeQ7asA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: q4nD46pUEgSiWIg-ByaURD3iPhJ-VjCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501150040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9083

From: Chen Qi <Qi.Chen@windriver.com>

Basically we pass "-buildmode=pie" to fix textrel QA issue.

A new patch is added and submitted to upstream:

  0001-Makefile-introduce-GO_TEST-for-more-flexible-configu.patch.

With this new patch, the old patch, 0001-Add-trimpath-to-build-nri.test.patch,
could be dropped.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb         |  8 ++--
 .../0001-Add-trimpath-to-build-nri.test.patch | 31 --------------
 ...ce-GO_TEST-for-more-flexible-configu.patch | 41 +++++++++++++++++++
 3 files changed, 46 insertions(+), 34 deletions(-)
 delete mode 100644 recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
 create mode 100644 recipes-containers/cri-o/files/0001-Makefile-introduce-GO_TEST-for-more-flexible-configu.patch

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 10c811fe..1ef32ab0 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -17,7 +17,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
 SRCREV_cri-o = "33d75981bee230f791709975125d7386fe2c530a"
 SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.31;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
-        file://0001-Add-trimpath-to-build-nri.test.patch;patchdir=src/import \
+        file://0001-Makefile-introduce-GO_TEST-for-more-flexible-configu.patch;patchdir=src/import \
         file://crio.conf \
         file://run-ptest \
 	"
@@ -61,6 +61,9 @@ inherit pkgconfig
 inherit container-host
 
 EXTRA_OEMAKE = "BUILDTAGS='' DEBUG=1 STRIP=true"
+# avoid textrel QA issue
+EXTRA_OEMAKE += "GO_BUILD='${GO} build -trimpath -buildmode=pie'"
+EXTRA_OEMAKE += "GO_TEST='${GO} test -trimpath -buildmode=pie'"
 
 do_compile() {
 	set +e
@@ -121,8 +124,7 @@ FILES:${PN} += "${systemd_unitdir}/system/*"
 FILES:${PN} += "/usr/local/bin/*"
 FILES:${PN} += "/usr/share/containers/oci/hooks.d"
 
-INSANE_SKIP:${PN} += "ldflags textrel"
-INSANE_SKIP:${PN}-ptest += "textrel"
+INSANE_SKIP:${PN}-ptest += "ldflags"
 
 RDEPENDS:${PN}-ptest += " \
     bash \
diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
deleted file mode 100644
index bf73250a..00000000
--- a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a1eafac8256fbff81b72c82213eb5a37858d2e6a Mon Sep 17 00:00:00 2001
-From: Peng Zhang <peng.zhang1.cn@windriver.com>
-Date: Fri, 25 Oct 2024 10:42:02 +0800
-Subject: [PATCH] Add --trimpath to build nri.test
-
-when build test-binary, TMPDIR[buildpaths] error found in nri.test
-to fix this error, add "--trimpath" option to build nri.test.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 34f9d429d..f5a033023 100644
---- a/Makefile
-+++ b/Makefile
-@@ -213,7 +213,7 @@ test/checkcriu/checkcriu: $(GO_FILES) ## Build the checkcriu test binary.
- 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./test/checkcriu
- 
- test/nri/nri.test: $(wildcard test/nri/*.go) ## Build the NRI test binary.
--	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
-+	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@ ${TRIMPATH}
- 
- bin/crio: $(GO_FILES) ## Build the CRI-O main binary.
- 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./cmd/crio
--- 
-2.25.1
-
diff --git a/recipes-containers/cri-o/files/0001-Makefile-introduce-GO_TEST-for-more-flexible-configu.patch b/recipes-containers/cri-o/files/0001-Makefile-introduce-GO_TEST-for-more-flexible-configu.patch
new file mode 100644
index 00000000..33c65b5a
--- /dev/null
+++ b/recipes-containers/cri-o/files/0001-Makefile-introduce-GO_TEST-for-more-flexible-configu.patch
@@ -0,0 +1,41 @@
+From 656cb24b07b1e5b63939c15dc31d8c9839ecce75 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 14 Jan 2025 20:55:50 -0800
+Subject: [PATCH] Makefile: introduce GO_TEST for more flexible configuration
+
+Introduce GO_TEST and make it similar to GO_BUILD.
+
+Note that with this change, the default behavior changes a little bit,
+that is, TRIMPATH, GCFLAGS and GO_LDFALGS all have effect on test/nri/nri.test.
+
+Upstream-Status: Submitted [https://github.com/cri-o/cri-o/pull/8912]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 34f9d429d..f02213894 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,6 +3,7 @@ GO ?= go
+ TRIMPATH ?= -trimpath
+ GO_ARCH=$(shell $(GO) env GOARCH)
+ GO_BUILD ?= $(GO) build $(TRIMPATH)
++GO_TEST ?= $(GO) test $(TRIMPATH)
+ GO_RUN ?= $(GO) run
+ NIX_IMAGE ?= nixos/nix:2.24.3
+ 
+@@ -213,7 +214,7 @@ test/checkcriu/checkcriu: $(GO_FILES) ## Build the checkcriu test binary.
+ 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./test/checkcriu
+ 
+ test/nri/nri.test: $(wildcard test/nri/*.go) ## Build the NRI test binary.
+-	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
++	$(GO_TEST) $(GCFLAGS) $(GO_LDFLAGS) --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
+ 
+ bin/crio: $(GO_FILES) ## Build the CRI-O main binary.
+ 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./cmd/crio
+-- 
+2.25.1
+
-- 
2.25.1


