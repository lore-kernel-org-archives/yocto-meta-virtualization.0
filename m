Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAFEC636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 08:51:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6409.1675414270382442919
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Feb 2023 00:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Jn100fja;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1398634730=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3137wOMT008624
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 3 Feb 2023 00:51:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+bkD8Rozs3Qou+oMiCO9zZhp3Xi7i8+8b0TLkRuSB20=;
 b=Jn100fjaCr6FDxAi+YodnCnya1hylJ9qZe3VNloeEidT/Zg/PsII4yNO/6GZKOO/VP7u
 UgI5xCw5OvewNdeCj8We1jhQ5ESAr9nTQ5M5LMC00f3hw4JL2I/wC3ktr42ISvVVa9s+
 lAuSs5wS8YthU6eBAqK/7lfSDN+casFxVcXHlN1ZAJnRu0g7u7MGC7N1z1LHo6oI+Q0z
 cnpnzXrvnd3eAG3QqRmswgLmR3gAK+1Y8RztBI9AtV2Hrl4jYThqGmKGBkXrBlOIVU0X
 U/qDQwoBJAr53X8vsropP4utdMrXdv85wtPsgfS7jZXcvcDGnObA/KNEM7sqaQK+kSrd 7A== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nfqn420sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Feb 2023 00:51:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYaGLfmZUGaUzlftvrGHJ3hw+BtWoO2HQ1VQfPVzOVhuRU3A+6Fb4OQOxqr+to+HK44ZFNllb0k07PKSNviAo63znO1YeE9nIfgfga9pepbCAIHFbr/7xC0bHPUmVd6U3xtEh2m30zYeFOm4ldHXsLmxFyUz+F1sRhC0zHiunwm0pUpRtuY0ov+ThnP3oB+WwRwtyGMB5zQJ741Jb5NX2nCAENdJLIT937XyxrmZjoUSi9bNmWr4h/+tJxIdjSb9+613ZIb9D/MOPUNbYm9mUze+3EaakVy9so+guFLWkrWCAnuacgVrfzBUnUpVwE7fZ0kT53xSRn8ep2lPaEdVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bkD8Rozs3Qou+oMiCO9zZhp3Xi7i8+8b0TLkRuSB20=;
 b=lN/je6yFEWyXV7ujnJi0f2/nJ0Qp+PJW+1NyRhIQ8Q/G41ERoCV9FVQPGO0Eti2ibgf8bm2jAb14sL+3ZjOTHpDfLq14PHWMxag8rpyOT+XsNTuDp6RkF0MP9Lo6mBIe7Yl9hNbCmALZLGeVwLfLk0qJGA2m6aRwhHqMBRci9G0xm2NPXwPQhO8lrrBybtx/dhREJUbxjrA9VFzK1E0ipunmW2FH0eY3wCLvzQ6LswWDdbr3ho1xyzlmskPsgMRTk4QvBVGphMk7w2QE3x/zwtvISmjnlSFtoWzXGdCD0+gR+06JC+WxEaTTNPszQxb9RuFN/FR55S756W9tVNwwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6393.namprd11.prod.outlook.com (2603:10b6:208:3ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Fri, 3 Feb
 2023 08:51:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6043.023; Fri, 3 Feb 2023
 08:51:05 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] kubernetes: upgrade to 1.26.1
Date: Fri,  3 Feb 2023 00:50:53 -0800
Message-Id: <20230203085053.16198-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0193.namprd05.prod.outlook.com
 (2603:10b6:a03:330::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: 712316ce-a3d9-4ded-ee3b-08db05c3c938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YbCKGY70NPaMmHXPZ6lx6nubaV7+qa0KMxnl/M/GkjA0XllSF8/PB7htX0SaEYrHdBCFD7dJgOXD8cAKMND7bm2debDyRK32RUXr26SLG+fGlVAglXAhZ8q6YSWPNzAM/mjgYb2RbyGgLinLOEV4qpu3thsBJrqQtuSH31gK8JBkUjff+le9FBXIuMgEry8XZP2FNKDINYAXO24cHq0x7MYutzNZNf7P7/9r3HIANRJuyUJHOjTgH2a4RLb9OEC2DOIeQlcnqJ4/QkqTVxvxhfggYMmQnDxWwHRgTyYRp2YsRY67wXhCbswe46LkGfUDX1YdH/63Owhrq6nG78ftlNEZP0wXOhNlZcJqYIC1AjqS49XlfabOsiIU476k/xA/rROCk67+OsNeLi95S0PtU4dl+5WajqMWVIZmy/d32BBDIrugHwC6qt1uhsMg2+bSrtUCOwocXKiwxRYENBVcJA5Pk2qKCjZ6YNPAzjDFQtTJLGMfGTIn6lYXHMiApG2WAwXfD9eqmepigCQS5K4UynjBaJTeIJTrTYHSIKl6/hyYtWJMGvaq71XbVBHJYo59cSJFapq+cZ0Xf+/Yt/wKtpkv1rAkmdpmNnqpVr2PbqIoak87AcIXai94d4J+KKeUEF0gtCb0NA83k32E7Z9xG6E0DO7kmDArdMLLVoO2HFKKdUELI+qbuiIVEEF/rPbxw0JPHoZuFJ+li86u2agg48Vlg9M9wqk+oz2sRhz1LvumF4yOe9ZqNefJbPc+SXw9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(39850400004)(366004)(376002)(451199018)(52116002)(8676002)(66476007)(478600001)(2906002)(6486002)(316002)(41300700001)(8936002)(6916009)(66946007)(66556008)(5660300002)(86362001)(38350700002)(38100700002)(36756003)(2616005)(84970400001)(6512007)(26005)(186003)(6666004)(83380400001)(6506007)(1076003)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ng3UodxRld8biCL6+eCX1hdTagalLjiXQSpIz4AKGJs4DQ6zsZeeoD7cDgM6?=
 =?us-ascii?Q?yVR2OczirmIYNHhAhzFUQCD2rNqIZrp66P12yWr+74O8YfQjkUjrMsdT0n/0?=
 =?us-ascii?Q?bTAbSlkAYULpGJIpqYfz9AqcOMkmcLPmixTYpc8XDfwfv5lRrhzUZn1xSap7?=
 =?us-ascii?Q?R8D0E6l0+9bknfH6dlgDCnvmOyq089BkftL1eBJ+V6Ze6+eEDF0ddbkYfZ1v?=
 =?us-ascii?Q?jfeCPl+vpHM8EizX4rpVAkl1YJv+7THUMXbZFphUhDNvRNSP6XUYF19YK0Z7?=
 =?us-ascii?Q?VXYSMqj2CR44Nd6xcUC7EqAG30rV/ozvR/SbclHBmrgnDjoM2zt/chfGhdmf?=
 =?us-ascii?Q?M/+f+D/MmU9B7iBAtZr0AQB3COT/BrhQVXiVolSuRUcXgjrp8+Gjs9uYHS+W?=
 =?us-ascii?Q?XRYZbk63QO5Nj8ZV+NSPT3hDejVz3k0xF0JW8Yl0eRMs12wxcmPi1kFVJ4FZ?=
 =?us-ascii?Q?KlAxwS5BSXLVR4JpxoMEZFf4qpR5Lz0IvMG1ibKMI/w5j51JGm8eCHTlUfuQ?=
 =?us-ascii?Q?Vegb+sasW7NuwoSX8+a/X6w23X3otf6KIa2WHd2NWJDxPsqahSgI3uUsVdZY?=
 =?us-ascii?Q?D/AJFfU52JHARumaHUxJ/uHgfEB5VkRf+QYIJHGafOYwDWgGapL2uQWfMXrv?=
 =?us-ascii?Q?zLNbMgj/URr+scjunuRS5D87D0GS/ePW1lvs62GBTEyUhfWEMmhQggzaP2jo?=
 =?us-ascii?Q?VxywnSmKO1qcLB65qI8k/CXgqJQ6ko/2M7W/x1KRawQuc03M8x3Vsihc9otP?=
 =?us-ascii?Q?H+3d4bHoAEMaMvaOjhqi1QQKm7r9W0vM/XvDTQJZy4EV+xm+ovo3+hAiO4Fx?=
 =?us-ascii?Q?wHAz5OqpaYElpH3GQQ9k2BjnXq1zBTmsKV4jsuhHGiMjEALFdxgC0rs0DN3I?=
 =?us-ascii?Q?n4MEdTnrdEtgU3I5OBR3FU5l+uRMAi+Oqp/QrW1QOUt0jE+m/dWk76XRyQ5/?=
 =?us-ascii?Q?WWleNCddBzfcQagMeIQGmtQqQabqOta3Jii00MWeHvWdnn8VT3x66590nZE6?=
 =?us-ascii?Q?83dtzd792ECNM6Il47YCSagVCOik/oKoTPIHrYIaZg10J53k4ceKfjFKRcUL?=
 =?us-ascii?Q?g5fRsMhC9U4RvfnJiNsmXKG/vSoCu09JJ2K2w1FYY3F4VgBAlWbSFb4EWP/f?=
 =?us-ascii?Q?rNCZKTVpoE96achnZ6QB9/efrYK8vXCw7B/aKOGKMv7o9uaUy9l/Ah9YRd8l?=
 =?us-ascii?Q?gtN6ct3DS6yxRbO+TbUqhwd6H/mW7Y3bewWqjJ+owpbXbhg+Ki4TN5fu/cpi?=
 =?us-ascii?Q?2G+D1Sd2hOoSAU/Mz1W7zQxApix450DPhA1/ULYvVZZj1RLeplmUBw7x53jT?=
 =?us-ascii?Q?L4M5h+sD/ekW6bTDSBukikw0eowK+UwgCp2YQQCy0FoevcYbvD8A73OdH1lU?=
 =?us-ascii?Q?4gKD/xERmx6LChVRo2jhkIqsbQBgEEiNnH7r6sv3BZxDLmjAfmF4cXW9xgBe?=
 =?us-ascii?Q?AAgAOEYL4ImgQxrxS5qnmVqJR60B9oFvh6yTOCkUPzRBuc82PTshE+gOFzoK?=
 =?us-ascii?Q?3H0dkukg+WXR8Ky2v+iwdaturfjqJcX1Ub3fd8qHaphAX4Ubi9iLgIlO3wXz?=
 =?us-ascii?Q?M2i6ki6dE+NneY+RLZ4AYV6LWsKXGoUJAgx2O5b4R8lIoZDiHmjw/np3fpZ7?=
 =?us-ascii?Q?BA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712316ce-a3d9-4ded-ee3b-08db05c3c938
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 08:51:05.7957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHBXw/7N2M8XlATv00GuLl0l8xlMhJcCDgM7q+E5xVIJRsAs6KF+bxeeRWlLq3PzeWHUJl1VERy+vbUOsG1wMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6393
X-Proofpoint-ORIG-GUID: mADaF2uRHltnXGznOr74zB104f8n_vG_
X-Proofpoint-GUID: mADaF2uRHltnXGznOr74zB104f8n_vG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 phishscore=0 mlxscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030083
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Feb 2023 08:51:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7843

Changes include:
1. Update SRC_URI an SRCREV
2. Change 0001-hack-lib-golang.sh-use-CC-from-environment.patch to also
   remove the 'export CC=xxx' for amd64. The original patch is a little
   strange, it removes such statements for other archs but leaves amd64
   untouched. If we're using CC from our environment, we use it for all
   targets.
3. Adapt 0001-build-golang.sh-convert-remaining-go-calls-to-use.patch to
   the 1.26.1 version.
4. Comment out the 'make file_generated' command. I'm not sure why it's
   needed in the past, but for 1.26.1, it does seem to be necessary.

This upgrade is tested on qemux86-64 & qemuarm64: k8s + containerd + flannel.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...sh-convert-remaining-go-calls-to-use.patch | 39 +++++++++++--------
 ...ib-golang.sh-use-CC-from-environment.patch | 25 +++++++-----
 .../kubernetes/kubernetes_git.bb              |  8 ++--
 3 files changed, 43 insertions(+), 29 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
index 8c6644a..6849549 100644
--- a/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
+++ b/recipes-containers/kubernetes/kubernetes/0001-build-golang.sh-convert-remaining-go-calls-to-use.patch
@@ -1,18 +1,22 @@
-From 9973a66665992c49593595ae1eb70848907ea6a9 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Wed, 12 Aug 2020 16:01:49 +0000
-Subject: [PATCH] build/golang.sh: convert remaining 'go' calls to use
+From 3a357f4bb769a4127f5107f4ae21ee8f12279677 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 2 Feb 2023 22:29:07 -0800
+Subject: [PATCH 2/2] golang.sh: convert go to $GO
 
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+Upstream-Status: Inappropriate [OE Specific]
+
+[The patch was original created by Bruce.]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  hack/lib/golang.sh | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hack/lib/golang.sh
-===================================================================
---- kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f.orig/hack/lib/golang.sh
-+++ kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hack/lib/golang.sh
-@@ -652,7 +652,7 @@
+diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
+index 0ed2d719dd1..c2ea9e10186 100755
+--- a/hack/lib/golang.sh
++++ b/hack/lib/golang.sh
+@@ -676,7 +676,7 @@ kube::golang::build_some_binaries() {
          kube::golang::create_coverage_dummy_test "${package}"
          kube::util::trap_add "kube::golang::delete_coverage_dummy_test \"${package}\"" EXIT
  
@@ -21,23 +25,23 @@ Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hack/lib/g
            -covermode count \
            -coverpkg k8s.io/...,k8s.io/kubernetes/vendor/k8s.io/... \
            "${build_args[@]}" \
-@@ -664,13 +664,13 @@
+@@ -688,13 +688,13 @@ kube::golang::build_some_binaries() {
      done
      if [[ "${#uncovered[@]}" != 0 ]]; then
        V=2 kube::log::info "Building ${uncovered[*]} without coverage..."
--      go install "${build_args[@]}" "${uncovered[@]}"
-+      $GO install "${build_args[@]}" "${uncovered[@]}"
+-      GO111MODULE=on GOPROXY=off go install "${build_args[@]}" "${uncovered[@]}"
++      GO111MODULE=on GOPROXY=off $GO install "${build_args[@]}" "${uncovered[@]}"
      else
        V=2 kube::log::info "Nothing to build without coverage."
       fi
     else
      V=2 kube::log::info "Coverage is disabled."
--    go install "${build_args[@]}" "$@"
-+    $GO install "${build_args[@]}" "$@"
+-    GO111MODULE=on GOPROXY=off go install "${build_args[@]}" "$@"
++    GO111MODULE=on GOPROXY=off $GO install "${build_args[@]}" "$@"
     fi
  }
  
-@@ -729,7 +729,7 @@
+@@ -756,7 +756,7 @@ kube::golang::build_binaries_for_platform() {
      testpkg=$(dirname "${test}")
  
      mkdir -p "$(dirname "${outfile}")"
@@ -46,3 +50,6 @@ Index: kubernetes-v1.24.0+git8b1b4db3834ddf7cf1b97137180f413cb9e2186f/hack/lib/g
        ${goflags:+"${goflags[@]}"} \
        -gcflags="${gogcflags}" \
        -asmflags="${goasmflags}" \
+-- 
+2.37.1
+
diff --git a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
index 1c4555a..c81bd1a 100644
--- a/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
+++ b/recipes-containers/kubernetes/kubernetes/0001-hack-lib-golang.sh-use-CC-from-environment.patch
@@ -1,21 +1,25 @@
-From 9cbb2d523d481053d405ebac830c2074b00d3417 Mon Sep 17 00:00:00 2001
+From 116ccf93eef322db23e3bd4f35b12be09ebfbde5 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Mon, 23 Jul 2018 15:28:02 +0200
-Subject: [PATCH] hack/lib/golang.sh: use CC from environment
+Subject: [PATCH 1/2] hack/lib/golang.sh: use CC from environment
 
 Toolchain tupples differs, especially when using vendor provides ones.
 
 Upstream-status: Inappropriate [embedded specific]
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
 ---
- hack/lib/golang.sh | 4 ----
- 1 file changed, 4 deletions(-)
+ hack/lib/golang.sh | 5 -----
+ 1 file changed, 5 deletions(-)
 
-Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/hack/lib/golang.sh
-===================================================================
---- kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630.orig/hack/lib/golang.sh
-+++ kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/hack/lib/golang.sh
-@@ -414,19 +414,15 @@
+diff --git a/hack/lib/golang.sh b/hack/lib/golang.sh
+index fb97ee76783..0ed2d719dd1 100755
+--- a/hack/lib/golang.sh
++++ b/hack/lib/golang.sh
+@@ -419,23 +419,18 @@ kube::golang::set_platform_envs() {
+     case "${platform}" in
+       "linux/amd64")
+         export CGO_ENABLED=1
+-        export CC=${KUBE_LINUX_AMD64_CC:-x86_64-linux-gnu-gcc}
          ;;
        "linux/arm")
          export CGO_ENABLED=1
@@ -35,3 +39,6 @@ Index: kubernetes-v1.21.1+git45da3fc33872083fb225c1a8c4d03e530d6f7630/hack/lib/g
          ;;
      esac
    fi
+-- 
+2.37.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 31ef135..af26a39 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "v1.24.0+git${SRCREV_kubernetes}"
-SRCREV_kubernetes = "8b1b4db3834ddf7cf1b97137180f413cb9e2186f"
+PV = "v1.26.1+git${SRCREV_kubernetes}"
+SRCREV_kubernetes = "8f94681cd294aa8cfd3407b8191f6c70214973a4"
 SRCREV_kubernetes-release = "7c1aa83dac555de6f05500911467b70aca4949f0"
 PE = "1"
 
@@ -22,7 +22,7 @@ PV:class-devupstream = "v1.23-alpha+git${SRCPV}"
 
 SRCREV_FORMAT ?= "kubernetes_release"
 
-SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.24;name=kubernetes;protocol=https;destsuffix=git/src/github.com/kubernetes/kubernetes \
+SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.26;name=kubernetes;protocol=https;destsuffix=git/src/github.com/kubernetes/kubernetes \
            git://github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release;protocol=https"
 
 SRC_URI:append = " \
@@ -69,7 +69,7 @@ do_compile() {
 	export CC="${BUILD_CC}"
 	export LD="${BUILD_LD}"
 
-	make generated_files GO="go" KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
+	#make generated_files GO="go" KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
 
 	# Build the target binaries
 	export GOARCH="${TARGET_GOARCH}"
-- 
2.37.1


