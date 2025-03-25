Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398C5C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 08:41:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.60883.1742892061576055996
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 01:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=517946a708=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vAoM020881
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Mar 2025 01:41:01 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg42v8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Mar 2025 01:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0X95ig6D5RpkqdFYghPq9h+WNdFvYJRZFohi2WdYn7qgkeRfip/T9LvScNqQZPISflPDu7CmJjCGGSlOVCmo4Myg5cNM9l+GkNS/UE5VGLK+QuYn5X7hY1vrqU0rXa5Z3KhW+jw4r95/mEYw/jdkHNX4Kq9h3ofUHFmcWANfwYpuUKlZhbyDiChVOqMjSOQySQQte0PYZihIEZOd0nSObHpgANdGPqAUVLANYWRsyB62oL2oPAv9X3QzffV8O3TdwsQ4TO98rxGf5LP0UR0zROUoTKI78+Alzl/v+fteeJ7O2RIlX174YMXuNloS25BRzVFx+Tj+Xfl1/qLYjExow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKGbISnLHm5D/vnKIV6pFWZmqakhYCmL3gzBJQN3y9c=;
 b=KUDDBi95MlKLYwmOx0nd2eZNPExwLKml/FZnpLQ/HOphN7pFJl/yF+e1IjvkIb8h+rZex+0ga9CpX4TaB59ZKtgNgrjQlS9Jy4lDqHVf5kfPP6ffgaGObTZ24Ao/9hqE+IxMxrrof8qyRPMfa+Kk/PnIbhnCO++Iha1PICboctPRjmFHvHMbGgpB/U+f2tJQJpw3MGEqTEDwOfZ+vkXzANM8nRMF91bMRn1EbIUXjOg3Lj3DOmhNyT/ZKcUIfYEcOGud513DorglqFy18cquy7yfV0vqSRkUz2TBcHqIZtKeDnaf9nBELe7NS6s01jenuOBVm8/ClFDR1Q0LcL0DbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Tue, 25 Mar 2025 08:40:57 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%3]) with mapi id 15.20.8534.027; Tue, 25 Mar 2025
 08:40:57 +0000
From: guocai.he.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][carthgap][PATCH 1/1] criu: Adjust to glibc __rseq_size semantic change
Date: Tue, 25 Mar 2025 16:40:39 +0800
Message-Id: <20250325084039.294966-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::6) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|DS7PR11MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 89849e71-2ff0-493a-3cff-08dd6b78c32d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Xk9SwCHXEors8qlLFf46e2Jwr5MVTLTOCbbTVMGetLTCHq8DR56hTrQwgiwB?=
 =?us-ascii?Q?t7V0kpqJ1R3Ze3tOuUoJLZo3yqafmuwtjk9QThVbaaf/AIY+Ie0arY4DB3QY?=
 =?us-ascii?Q?lIdtqDHqH8N/NQHO0xCjtOTDilUXxcExUFfuXNMjo1cQ/xEugMS5yRuEBM0n?=
 =?us-ascii?Q?51htGnQWg830cwAsiycIXmB/vvPoYpp/iUCKQDKoPDYMVu3Hto9AL0B9mwQz?=
 =?us-ascii?Q?+VBn5jKkVaeF4YCTA9j5O5TsXv0i2QsxkIHPYpIl+gi3EXzzPbJ6a9uStm0K?=
 =?us-ascii?Q?/npiX0hrOv21IF3PXQKxzWzK7qKu06tHWxr3GTrERm9xzs7cYtKBa+fyR7Hn?=
 =?us-ascii?Q?mdJTPxIc+RP+hnOc1rj9CqOzaFrUs12fmcrza6zmLT3RUPV0glCiwGzJnB1u?=
 =?us-ascii?Q?VApmKWQtSd/eyQ44G/39qbV0fhr7dWoY6PcuGe/U3xWSf0nOjznVAYJBxRUT?=
 =?us-ascii?Q?KJi1Agg6Bvph4VWUgyHxq5VVYHHYsraHW7IkvWAf0QLODyeEtRW2cmv9sXSx?=
 =?us-ascii?Q?uvwkgWFcV7vWjfLAdm8Yqr69dZngK7BjHx1KchsvMg5n/xqH77P4KHqoepQ/?=
 =?us-ascii?Q?D3vQVQ+eTbLYeYaR7Ilrx8yXOQQ14vBYBnByhjIO91aaYDomraqRagLZWA1Y?=
 =?us-ascii?Q?SHzZSD3cFLlRpBLWcqBKAazscowkukmbri9I8niot/Xj2M0IRthiL8nrkG3y?=
 =?us-ascii?Q?Q8ASDp+Fd/WJNYoABSg0wbX5oE+vT59mnj5PMAnMahYnWyLwo4LjPkwkYWRY?=
 =?us-ascii?Q?/3CHYvSm0WeubqtI2grRM+Yu/YzKpnXkOcTuve2wx6rL/1O+QfB7W94QeXhZ?=
 =?us-ascii?Q?9KzCPcptWy3cruOvGyjsp0fDX9OCjpWbC/wN9NRt6/YR74sdXVnOhfHiqZ1j?=
 =?us-ascii?Q?7Wv+hNxPXkaNpt2UMkYzUem47rLD4MpipDCY0HyJNiC51/LTHNlNTDjbQDCt?=
 =?us-ascii?Q?nOyXrmWDuWXaW1oGKo7Po1oa9qW7LOv3/sAISIcY0B57x6O7/K7GX/mH402X?=
 =?us-ascii?Q?0rPqjLk9O08n5GyM1G7bgdCi5m9munVivhEB7UmOvybO0NZEQyX8SQIau5vp?=
 =?us-ascii?Q?BMdlHnQuoUyxN9XyzWnQsDz7nv0GtGbKSFqqaFumgg2dRCW46zZ6ITlckx53?=
 =?us-ascii?Q?tkCeBT0KEORvwHhRgJkw8EEzBX1q0AHZPfshAo7c80cf9Dfy1NaTXwYXsKhM?=
 =?us-ascii?Q?F3Y7e7eh816rgAMZCyfqEmISkFEsUHw3Y2EbPrqTERQJ01GOV8FKNg2+t8BG?=
 =?us-ascii?Q?PmXO0KTwKqo/XgJ2JGBgBp0sVjepwDrTfEyb+q5XQalM6IqivfztqZ7d0BSr?=
 =?us-ascii?Q?162I7l8lvGk+jpw6fkVAFOzGwBxRYkCIjG6afU4+LAoZGcK5+9ejeGvr4MNM?=
 =?us-ascii?Q?33YoGYYsgjP+/eboa9WohcD2rvDRCP/SQhMHqhQa95XOMbUXy0dFZN+a3HiJ?=
 =?us-ascii?Q?Q7rd53HwxB97AGrA3t9/Qyn+Sp0B+aVu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1vugOKt3XeyShuJSp2KGGdaD1uVBXeKBSN1aOqoUTIhJGcsXtJZ+kmDGXQR6?=
 =?us-ascii?Q?V7DXmdjUc4Kwljs5VkAdCyeHbPTRbRQmjavjqBsEYlCgmrlhOBpf1HjNCmyu?=
 =?us-ascii?Q?yCx5U1QtzJPsbmvANGqnqUZR9uHDodNMBWYAx6zzTLHU5RCFiyvPm2NFgAW/?=
 =?us-ascii?Q?lgFOhu3/55Hx33bVkzOr/Y3bxAk9I1j7KnmVKi++FNHmi2KqWDXZ9pkrA/E3?=
 =?us-ascii?Q?Y4SUlvriv2demFu0XJ/2/jBa6ilXMQKkAKZYesofHY3paRktCNS8MpQ0zNWx?=
 =?us-ascii?Q?/YVPRnzPScRX6+HzhS/XajQQ8i9m2f8YM7MUiMFO+5X5Bk5isLTumUP0bpr7?=
 =?us-ascii?Q?GxS522fULW7uO5Tl93szWaPpz7+2ap2Nnv7FrDGQJ2T6HL0DKgADepmhMvh1?=
 =?us-ascii?Q?CI95FqeF2mYbtmb9hos3D95WFhXdhsxEuNwnuyQZZ24D9H7ipNiptuPL/XAp?=
 =?us-ascii?Q?CwJhXXQ6K/xtq5814gtc6OiffbRYqdyBttumBU6zyse5R5I8qxv2X/aWm2mf?=
 =?us-ascii?Q?Ox/ktHZFc5t4xMAHNMZpF/02OtiIXZSmkCSG6LUaH49Y9zj52h/BggTLg6FW?=
 =?us-ascii?Q?x9G09xYOa6d+RJm5BkiBzC3bp16oIfbgWJHK5SniUJ6NiUfYKs3rXKugvXhg?=
 =?us-ascii?Q?9EZX67q/j3gdajczWPo8NKfVSeZYEqukbZC//lrGzPQreV+VyRILoAFqSggB?=
 =?us-ascii?Q?OYjRGZavFJ72eG7qLiF2SccL164eiPL5oXbUxw8aZt5zP4Uf6u1kKYOEHpMk?=
 =?us-ascii?Q?/zJS/ilyqqmGAYLCHQO+etbFFr2FXbQxM0slsqrNAtg2IUb9QFjrAwpwRQrr?=
 =?us-ascii?Q?Xlqb2z1dfl3LsqpCrPCaliHt+4VEAHeCJaPuIUsCa+71hj0qa+eFTAmXvnl7?=
 =?us-ascii?Q?yq04nAsPTFIYZoRq6d/l7HM3F0d43i1P8V4dG9CDnQRU0JRWShjSaFq6tlZc?=
 =?us-ascii?Q?mlajxdJTBSAXMCiOUOnI8e1YEwKryEmu2x7UsB6FbiW4DK4OkuYZe/WUA1QZ?=
 =?us-ascii?Q?ab8SZkS4MUUZu91xGGDdWMxpSkV33JNmCb5q9n9YSSg5PJIVl2xOzNRvHQlA?=
 =?us-ascii?Q?dYxOMNNlVsrfK5kfANM4CT2ao9e13JR+uAFPDyPjX3RRp2/FZU9zBZv75yXQ?=
 =?us-ascii?Q?OXyOWTbVXaObTDP9ZZszEraRg1I2q2pwUefkgWYcfuRFV+OQgGiAiVNC8z0x?=
 =?us-ascii?Q?h83D3Tt6Nban11vk6skRslsWRbgF5e4koujA2UfGe+pxCyqbrzDz+qGw9K+y?=
 =?us-ascii?Q?KIA/CV87PDNdkyI91HEGKVbsgBy7tsdZls0/ypuD4YVfqKFfW99XF+VYLuSn?=
 =?us-ascii?Q?rA3VGEO4degSjpBoug6IBEAuQRfVPr08omk7tw5lbpHFHzVHwSC3L6D/bPV1?=
 =?us-ascii?Q?TjZkqfsZX0b18ywG/MSGWvaWwAAIUwKm9Kgbl/l+znD2qHB5lYy1m6pTR3Ao?=
 =?us-ascii?Q?BlTn5e17L3t0banidMr4Q7U9Naey67GjybTat2btRJtyjYS4x1I9OT1Aq+FF?=
 =?us-ascii?Q?sfG6niTbb+rwwHf6KdarEHVG6t+WxrIYklEVSbsjRsOVGPHXybEcD6m/PFLA?=
 =?us-ascii?Q?r2ebt65I7fvFYkLe2nH1jNdE2yI3OiBnz0+4aRGajY7xrMgpEms9QZ2TcTy6?=
 =?us-ascii?Q?3g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89849e71-2ff0-493a-3cff-08dd6b78c32d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 08:40:57.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OENSBdu/6hRnitn9p2G2eHQB+u2/ly4wNI7ch6VCrigsi9LWji8wGlBYOEsk/GEhcGGmLf5+CZ6u5mb+wOHhgE1T5k38Q3LH/cmvUO1chk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e26c1c cx=c_pps a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=X_LhyI6JMLcA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=4ogO6T2oHLXmShntCgEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ER_xGxkQWQv8yWD6KaDOW86k7c0ALHRx
X-Proofpoint-ORIG-GUID: ER_xGxkQWQv8yWD6KaDOW86k7c0ALHRx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503250059
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Mar 2025 08:41:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9173

From: Guocai He <guocai.he.cn@windriver.com>

On criu version 3.19.0:
When use "criu restore -d -D checkpoint" to restore, the error is:
1272: Error (criu/cr-restore.c:1498): 1295 killed by signal 11: Segmentation fault

The root casue is that the glibc updated and criu should adjust to glibc __rseq_size semantic change.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 recipes-containers/criu/criu_git.bb           |  3 +-
 ...to-glibc-__rseq_size-semantic-change.patch | 94 +++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/criu/files/0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 09503624..cccd3e3c 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -21,7 +21,8 @@ SRC_URI = "git://github.com/checkpoint-restore/criu.git;branch=master;protocol=h
            file://0002-criu-Change-libraries-install-directory.patch \
            file://0003-crit-pycriu-build-and-install-wheels.patch \
            file://0004-pycriu-attr-pycriu.version.__version__.patch \
-	   file://0005-pycriu-skip-dependency-check-during-build.patch \
+           file://0005-pycriu-skip-dependency-check-during-build.patch \
+           file://0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch \
            "
 
 COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
diff --git a/recipes-containers/criu/files/0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch b/recipes-containers/criu/files/0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch
new file mode 100644
index 00000000..29715614
--- /dev/null
+++ b/recipes-containers/criu/files/0006-criu-Adjust-to-glibc-__rseq_size-semantic-change.patch
@@ -0,0 +1,94 @@
+From 123e558a4bfa8964f9e55d0c0ecc080e6c3a38f3 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 10 Jul 2024 18:34:50 +0200
+Subject: [PATCH] criu: Adjust to glibc __rseq_size semantic change
+
+In commit 2e456ccf0c34a056e3ccafac4a0c7effef14d918 ("Linux: Make
+__rseq_size useful for feature detection (bug 31965)") glibc 2.40
+changed the meaning of __rseq_size slightly: it is now the size
+of the active/feature area (20 bytes initially), and not the size
+of the entire initially defined struct (32 bytes including padding).
+The reason for the change is that the size including padding does not
+allow detection of newly added features while previously unused
+padding is consumed.
+
+The prep_libc_rseq_info change in criu/cr-restore.c is not necessary
+on kernels which have full ptrace support for obtaining rseq
+information because the code is not used.  On older kernels, it is
+a correctness fix because with size 20 (the new value), rseq
+registeration would fail.
+
+The two other changes are required to make rseq unregistration work
+in tests.
+
+Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/
+089345f77a34d1bc7ef146d650636afcd3cdda21]
+
+Signed-off-by: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ criu/cr-restore.c             | 8 ++++++++
+ test/zdtm/static/rseq00.c     | 5 ++++-
+ test/zdtm/transition/rseq01.c | 5 ++++-
+ 3 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/criu/cr-restore.c b/criu/cr-restore.c
+index 270049721..80eb13743 100644
+--- a/criu/cr-restore.c
++++ b/criu/cr-restore.c
+@@ -3103,7 +3103,15 @@ static void prep_libc_rseq_info(struct rst_rseq_param *rseq)
+ 	if (!kdat.has_ptrace_get_rseq_conf) {
+ #if defined(__GLIBC__) && defined(RSEQ_SIG)
+ 		rseq->rseq_abi_pointer = encode_pointer(__criu_thread_pointer() + __rseq_offset);
++		/*
++		 * Current glibc reports the feature/active size in
++		 * __rseq_size, not the size passed to the kernel.
++		 * This could be 20, but older kernels expect 32 for
++		 * the size argument even if only 20 bytes are used.
++		 */
+ 		rseq->rseq_abi_size = __rseq_size;
++		if (rseq->rseq_abi_size < 32)
++			rseq->rseq_abi_size = 32;
+ 		rseq->signature = RSEQ_SIG;
+ #else
+ 		rseq->rseq_abi_pointer = 0;
+diff --git a/test/zdtm/static/rseq00.c b/test/zdtm/static/rseq00.c
+index 471ad6a43..7add7801e 100644
+--- a/test/zdtm/static/rseq00.c
++++ b/test/zdtm/static/rseq00.c
+@@ -46,12 +46,15 @@ static inline void *__criu_thread_pointer(void)
+ static inline void unregister_glibc_rseq(void)
+ {
+ 	struct rseq *rseq = (struct rseq *)((char *)__criu_thread_pointer() + __rseq_offset);
++	unsigned int size = __rseq_size;
+ 
+ 	/* hack: mark glibc rseq structure as failed to register */
+ 	rseq->cpu_id = RSEQ_CPU_ID_REGISTRATION_FAILED;
+ 
+ 	/* unregister rseq */
+-	syscall(__NR_rseq, (void *)rseq, __rseq_size, 1, RSEQ_SIG);
++	if (__rseq_size < 32)
++		size = 32;
++	syscall(__NR_rseq, (void *)rseq, size, 1, RSEQ_SIG);
+ }
+ #else
+ static inline void unregister_glibc_rseq(void)
+diff --git a/test/zdtm/transition/rseq01.c b/test/zdtm/transition/rseq01.c
+index 0fbcc2dca..08a7a8e1a 100644
+--- a/test/zdtm/transition/rseq01.c
++++ b/test/zdtm/transition/rseq01.c
+@@ -33,7 +33,10 @@ static inline void *thread_pointer(void)
+ static inline void unregister_old_rseq(void)
+ {
+ 	/* unregister rseq */
+-	syscall(__NR_rseq, (void *)((char *)thread_pointer() + __rseq_offset), __rseq_size, 1, RSEQ_SIG);
++	unsigned int size = __rseq_size;
++	if (__rseq_size < 32)
++		size = 32;
++	syscall(__NR_rseq, (void *)((char *)thread_pointer() + __rseq_offset), size, 1, RSEQ_SIG);
+ }
+ #else
+ static inline void unregister_old_rseq(void)
+-- 
+2.34.1
+
-- 
2.34.1


