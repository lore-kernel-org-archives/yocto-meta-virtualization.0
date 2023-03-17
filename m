Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3C9C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 10:28:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15916.1679048925787207765
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 03:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2440e5e2f2=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HARuca002341
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 10:28:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqm79j0d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 10:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxiDEP/WMjelUkWbRAoWkZyoK6rC1AXFzRkkON9ZMrrgXb9GVcfHZQ3hmbFc6AxT3HoYjdUQPhuFtLXxoKcdB4cvBPg18Y4Ax6ReLxjTMFF2UTC/ChIrA5UYxtqwr/BNwWzIDC8UqY1vaEzlRp1VM9YwSvhSCIHp3Hbf+QtQInLJH3WxQMiTnmDfMH3EwtMDB7vhuflqYCYxyimG6IbfHxhlV/6ccKE2bez3Zv7seQt9IBONgerU9kxbFNOsSxtbo6nE4+gRd80NFgPXrmdE2BPSIahyEhu8V9kOT2Aas/zqWqjKfCHaHIwxv/mwV3jpuhRQsVrt8nJWccd4BQz+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptqhTvoMJnREqgJInL4P5WzjcjfJj8JZw4usblhH1Og=;
 b=mVxITR+df/03iGypI4Mcqb8wzwQRPYLBNlfGKQIDn5YI/uWxGkCNQCkk4ej21mA6NaR5sokl3J4gdiuerJjZZis0dXpkmtfQMY2oFQ7fDOUWdNpsstum+0uWhplRItY9TRr5NrAwbHR8cp9szGRC0XVA5q+7RObrslF1aldmhMsjJL9nu8Alb3ylOLZzWgRbhoYnDqIy+fZoystruXSA6x5OaHpaAdTXrxR5OcjL4Aao8ZFLLRVCjPwgY4cLjP6ONAYAibRKdIVTDnKNLzYkeKQ/oN5P0DAFOYZB6CAeyjZRgKOtqdciJbAachRwkWM2ruvxscdkXELZGm2FuxcW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Fri, 17 Mar
 2023 10:28:43 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 10:28:43 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 1/2] lxc: backport changes from master for templates-use-curl-instead-of-wget.patch
Date: Fri, 17 Mar 2023 18:28:28 +0800
Message-Id: <20230317102829.3833398-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317102829.3833398-1-xiangyu.chen@eng.windriver.com>
References: <20230317102829.3833398-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::46) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH0PR11MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: e7092671-22cf-4790-4d43-08db26d2620e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nHf5sTpf/1PH7sg+F0lsj5P7VwgtyvsE+JKFHPikPZI1YgI7HtFIXF+/lGdpKGoj09v9nY7fUGuADff0gZ+QCq0xuXqCpIQ1E+jx9VrP+Tf3Ks1DgYOSYfxUXmBHBVWIDzOVcytbxPTpmXJTlyIUurE3q0I5qqSopSkrbvOfqIrXN4GXqZNFeOwF/YnVdhFEE0+U8ljiHJnOPAG3g7Szgq3ugYoD1pz8IWSKq1U1Dd81+snMjEszskguucKBHt4XY8ebsEo2Q/eHL7cubMW8WZ6mA/ZP/+L0MgA51isUHMva6K2CUUTJ31/DOQakOpX1N5gRTQ7avaImLFoqgvzP+tmE75VmMHVlF3CbqKMKmYAzx9vLO5lGZAocgpe3jufjhij29SFMnzWUiaJ8e6pv6uas0pgyTbHuDY4g9IX6DWtLKi4G46Ez9qPainpQbYdJPA+56HlP+bFgHlTEycb9sTQLrMmqALiNr+aNhkMN5qxlHaTvNcOjBmsHuyBiRwGEC8EHhUZqu/J9/LpRAuQe/XO4F5oo0Do7lu/xGv12jHR23hBqlA756N+PczBwKm+t1rc4x1Ne5PGtxBmuAPCb/NOffhKWQ1Y7aPYJRMGvKItlkdCgkN1mIRq7Z4BzcHEiURakSnkxKNIprMyo0N/jce2q+jd7y/UxeImahdOcn0AzvgAuYk63QkF4NqvEJZRq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199018)(478600001)(84970400001)(8936002)(5660300002)(41300700001)(38350700002)(2906002)(83170400001)(38100700002)(6916009)(66946007)(8676002)(44832011)(6486002)(966005)(6666004)(66556008)(66476007)(186003)(52116002)(83380400001)(1076003)(6512007)(316002)(2616005)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0s8APBxgOVGBecD5TYkVdCza2kxIY4Dty6Xm0Yd//xTMixp/AQghtql6vBTb?=
 =?us-ascii?Q?35TRPPWoDN6620+lv495h+Ve3mqEuYo/1IuS65FHQZRa7jCZHfjXra1ApHVf?=
 =?us-ascii?Q?I9y0xqwK9uf7zl6c8zO29XiLsVDHUSn7a0eBRL2zyJBcpTRLOZ2fLlJoP9AK?=
 =?us-ascii?Q?a0JBd5L+j0Zm677hDpGfq8e2H+BQHxtvnh1wBQEWSsexL4KopFfkUbz+ww8L?=
 =?us-ascii?Q?lQAiV+gfz5OIlXqdnWYpewDPdkQqgJQdtB5c+A+pS9QTcc6NXTfjBriTqziX?=
 =?us-ascii?Q?zm3TWpoPdpJkkRg6/EJNmKkK/PrFdIJMB/vTvGQR6MY4mcvwpbmJ9nZZmRZ6?=
 =?us-ascii?Q?IdFGyZNW63ICd5xICpZBmv7Pdti5ilJNVSCPRuZD02olY4CSB5qJcih2Vq8z?=
 =?us-ascii?Q?+pySVWSxdRfYRDQJsgdelHDWBYs+ApzYtXjchFiCaf92HRPaLrwAkI7YT0e0?=
 =?us-ascii?Q?9anLydHxXYiLwI9sVNMF/w+O20f8T0pqGC6Z04ElAJAjKR7/nRwk6uofH6vr?=
 =?us-ascii?Q?HaC4xE1gBZY+l385IJqnD1W20ZKelKTbdoyAgkt1+1mqf3Ii5AbCwwOdz898?=
 =?us-ascii?Q?LgC4nmMBZRz7y84mrL75QLdppdhZ1xl/uBpicpUY/P5ehR/Y63ooYHXT9zes?=
 =?us-ascii?Q?oJ95tcTe+ilHvnHialePlopnZO4IHBbW25WxqGT42Ht83d+xSvLEcuDQNgrk?=
 =?us-ascii?Q?ELVrn0xejeXW/ldZfJnZrIAJQSVrYG2RC6oX2g11ETHU9rNDOnOPBPHUlL3d?=
 =?us-ascii?Q?xoA05Or6RTlVLC9kPnaIWzLJ98Op70esyJx71siOtF68bdkzocoeBEeO5Jwt?=
 =?us-ascii?Q?xQRwm3PO1WbcUBM/PlZR+8x3JCFSDLgoAt2vNjyESVTzpirzalAeTMOab6xS?=
 =?us-ascii?Q?axgNA/gGmvxDjBf6dD1NPbCb7GPYayV6upMS/SAPkEfogG4EvRq8K0qds/6Q?=
 =?us-ascii?Q?0jz7brSv1JkzzwTG1HWQQxmTaJQJulWFj74UKzjZ9l1npXMzU/i8Rl2lvxaU?=
 =?us-ascii?Q?rpSKXe3WJRwTS6Wyfk1p8M8tJFKn4djDp2wEO1os1GnP/mM5RgCozQBh9wNP?=
 =?us-ascii?Q?4ObVnrs4kHRTtCK+r+CUMp8gX/5oIqAp72NC8tB73Qu/PUXMelK352MfMxA6?=
 =?us-ascii?Q?CHWaHdJQdPtV9yaQiNV+EbbeDVOxkjDxs5QIi8XpGIW7KVXSUFKHR7DVTE+m?=
 =?us-ascii?Q?oxPxwRpt6+6/sQldKzfh3BYbApP/K8XHJd0zyJR3SuYj0Vw4REqVnfRimgiq?=
 =?us-ascii?Q?JjBgAZdmIZd7JG9k3eNhO3x+NBLtCNEaV+IXFVuRMZRXAiSQiAqvmqcb+G39?=
 =?us-ascii?Q?nZJ/Clv0PHUENvCR5LNYvtBDXs2ZtJ5lm/WTbUMef9OSbkThLl1mI2lPPkK4?=
 =?us-ascii?Q?71aN83jMamzofsn5N296wJsJUpAqDT2zC0gm01qK+HsdLxDkPzPicogwDsoD?=
 =?us-ascii?Q?ds1pT4vTNnE9ZHuL/p2VllWdArv5rx3F5s5JhYnx4oj1voJwcmazZ/8V9J96?=
 =?us-ascii?Q?QqVj87/LRw1g5IhOFwHZW+wrIFuBWTNepU3xCT1rfUiDOe/PHfmG7VJ44LHO?=
 =?us-ascii?Q?LuM1G4lNz6ODC9WmsazT1VMl03h5LKrifAUXrrfu3bTLYrXCeaHf99IPQlNb?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7092671-22cf-4790-4d43-08db26d2620e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 10:28:43.5942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRHnPRwoSFkacUNMLQHuxUPIaJ0mTWXOpSVnUtVFANCb6VMCybo7+jNun/qZlOUtfq7VrryPYYkp62VZHVrAqPKukc7xuTx91HMqLMf/7Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
X-Proofpoint-GUID: TNab2ZuhiTxGGPyS-bT3V5xE04kgsNlp
X-Proofpoint-ORIG-GUID: TNab2ZuhiTxGGPyS-bT3V5xE04kgsNlp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_05,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170069
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 10:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7944

From: Xiangyu Chen <xiangyu.chen@windriver.com>

backport the changes of templates-use-curl-instead-of-wget.patch
from master in following commits:

05f316f70a4d : lxc: update to 5.x and meson
211918936180 : treewide: bulk update patches with status field

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../templates-use-curl-instead-of-wget.patch  | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
index f06e596..ff5c5f6 100644
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
@@ -1,22 +1,24 @@
-From 1db2db7783bd7ec2aa1da86e640019891634c659 Mon Sep 17 00:00:00 2001
-From: Joakim Roubert <joakimr@axis.com>
-Date: Fri, 16 Aug 2019 07:52:48 +0200
-Subject: [PATCH] Use curl instead of wget
+From 3e4cb0b738649f7750413cefbcfdb2115213ad0d Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Sun, 14 Aug 2022 14:08:56 -0400
+Subject: [PATCH] download: Use curl instead of wget
 
 When curl's MIT license is preferable to wget's GPLv3.
 
-Change-Id: I4684ae7569704514fdcc63e0655c556efcaf44f8
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Joakim Roubert <joakimr@axis.com>
 Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
- templates/lxc-download.in | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ templates/lxc-download.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-Index: git/templates/lxc-download.in
-===================================================================
---- git.orig/templates/lxc-download.in
-+++ git/templates/lxc-download.in
-@@ -59,9 +59,9 @@
+diff --git a/templates/lxc-download.in b/templates/lxc-download.in
+index a62ddf482..690307338 100755
+--- a/templates/lxc-download.in
++++ b/templates/lxc-download.in
+@@ -59,9 +59,9 @@ cleanup() {
    fi
  }
  
@@ -28,19 +30,16 @@ Index: git/templates/lxc-download.in
        return 0
      fi
    done
-@@ -70,8 +70,9 @@
+@@ -70,7 +70,7 @@ wget_wrapper() {
  }
  
  download_file() {
 -  if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
--    if [ "$3" = "noexit" ]; then
-+  if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
-+    if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
-+      if [ "$3" = "noexit" ]; then
++  if ! curl_wrapper --user-agent "lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
+     if [ "$3" = "noexit" ]; then
        return 1
      else
-       echo "ERROR: Failed to download https://${DOWNLOAD_SERVER}/$1" 1>&2
-@@ -176,7 +177,7 @@
+@@ -176,7 +176,7 @@ while :; do
  done
  
  # Check for required binaries
@@ -49,3 +48,6 @@ Index: git/templates/lxc-download.in
    if ! command -V "${bin}" >/dev/null 2>&1; then
      echo "ERROR: Missing required tool: ${bin}" 1>&2
      exit 1
+-- 
+2.25.1
+
-- 
2.34.1


