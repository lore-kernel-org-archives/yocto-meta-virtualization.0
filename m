Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841D1C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 02:38:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13166.1677638332478518408
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 18:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=242464cc29=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3212TgwN020632
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Feb 2023 18:38:52 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqrbefk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Feb 2023 18:38:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpFfK9+bKvFXlAdZSwI0NhJfcG5VXmQPfg92aUsE8t0rgUSWokvIVNhBY1SdV2jlIjp1zOMq2Qdu0g8UvarEtXxCErMqy6mkxjHvZn9ZFkPxVvYBKh3AfGSYaGkf62ngmRfM1B4C+Yzxso6C7Dzl9DTqPnJcz9Rys1JyCU2jzQJRq2Q6+PgsVEo4pOYbR4uCx19MQbVTRz2AA724d4Bn8u5+6eNGBIeDRzJyho3WMOhoG0NJZy7Y31sQfS4RyGTJs9ubvqS+wqni0ho3L0ens9fCanW/yEoTli1ShtJeuuqK0pVAuqpLDxy0WRQSKPDMPEnaKrVksPD+XssE2YgS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1coVrH3vbE8l1frv6PlfliNmAO3hPr101A9QOVNdCDY=;
 b=oWDox9BLHhM8GTNE/1attj0HEQVcU3PT9+J4VyD+BnyGIB8fQaiJtsZtzWUJv185Xd56p4ZCh8YCu6gyZMe4Oy/Dkigx3rUBnaTLI3Zhi+J8x6kUYL4uXl6IwKZQwXVyzHy6XJbB3rhNG/19Q3FJiFtlX7OovPWcsqv8EOQdqDuIjlGVp8gmr/vqz4O2a/y/OH2rJ756ltiNECRYBZnOmp/YTQQEVF+mwEYJkwYnykLWJAHW54C1mBGRxaPrGC3HNUc+WfbyIVh2sRzCLdIL9AzDAZTxRLp1xuARe0rLsRSxD/SsqzyZUmQ5rXgfPzqBQJUrWidBjHK0yhPUkCSGiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Wed, 1 Mar
 2023 02:38:50 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%5]) with mapi id 15.20.6134.025; Wed, 1 Mar 2023
 02:38:50 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/1] lxc: templates/lxc-busybox.in: if busybox contains init then use it
Date: Wed,  1 Mar 2023 10:38:25 +0800
Message-Id: <20230301023825.124974-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbb9b5f-2a84-44eb-7094-08db19fe16d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KZe1qjAIAe76cugeDtQjLzBXpngp18Ga8qjd030ZAldkMXeD8vSeKcE2fdyw2jqYrAa1Vh7k9G+k5rtrYlshNx6CtW6xkYxIGK2GS79Baoh1tig+puLIs7oVagDL3PZ7jxNfidRZFRU3Px35JXKTg+gGytUru4EbSu6FpQauoV2dVnDpNVQqsluepcQMZGwirufcoa6tQ7mD8JAme6ni4Ln5OVA22ak//Xd92QoWs1ZRd7sETqwkxpUFN381M/Yl4KI3Qww/UKHSloNpxfdGJzmC0qI8HcOf7O/me6pXRarFnJAd4xjPhZQPqB/FRYbZYVOv32KPBFBU0OPvyvxamgP+pznDjdxhrILMOqPxN6HaY6oZbqNib7drulXCSDl6shr9A5r74sEQaTrBkeKJMzBLlqHOR7c9+pYZsm9pthyjTM/R/mj2ZpYxJqqEi8tKW0irTQ2dEYUHgOs3U8Y6PCiJEBpJZOPiaFXxTZszcG4WIblqq9VczCfBj7JEgngaLmmGO0kVodjSiY+ecRlJObaVpE9+Bz7L39xVbF39uR5CXE8ZjxTnY2/lPpBYJMicZYTjxhtZvTA2xrnCCNwgMTFtFQnUFvsvpbs2HIJAC8ES56sEyqM+8cBhTT5mQIHsprntssI+l3F4xDJ42TvLesVuRfzm+mB9u83PE3HRInw+SQg0RR8B8ydbQqmV5oyWnY/zRd8+vCD0kxzClGIJbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(366004)(396003)(346002)(376002)(451199018)(83170400001)(38100700002)(38350700002)(8936002)(41300700001)(44832011)(2906002)(8676002)(66946007)(66476007)(66556008)(5660300002)(6916009)(52116002)(2616005)(6512007)(6506007)(83380400001)(26005)(186003)(1076003)(478600001)(316002)(6666004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ekTnZ79Wss7A2DXzadz9Jy6lzhQ/OIJcbmew6Jqj/k1WI+Nl9cHU9oe7jTgx?=
 =?us-ascii?Q?/pWLSMC0UdfjUXpVBEORyu+HS+0GMGIQoaMLxtyQWIANKDsf42axYwMhWhft?=
 =?us-ascii?Q?Mr7ZIXIdKEtwlRMtlDOzDvunxEae5jUEKS6Me+K/BJioMlUctfhYyZeIfkp6?=
 =?us-ascii?Q?bs52m0jHQzei7rEjXK+GEda1TpNRP2+3S9bsaeKZ7o5UZC8hII1NKq5dTKIR?=
 =?us-ascii?Q?A0lu4YRQgV1hauimVOHjj369uHlNNzOm8Is18vZ/LIGRk5v8UEHAkuYC5JKJ?=
 =?us-ascii?Q?U8kOxPl+R0xa2tXjiq1y/kkboznboeZmzBy7x5zbLRc6bkShZJ40/ldjAj4d?=
 =?us-ascii?Q?q11fFI4M/BQteFu6IAQn+mSaPSlqDbrx7PrcRNQgxLb7thr8s81RYQgz2Baq?=
 =?us-ascii?Q?+KsQoUbyq3EO9dZUiuLV1/PITbvrAClV9jKiWr201j0jqYCQWkvsgCDYTRG+?=
 =?us-ascii?Q?4pbFNJQvnisV7mjdJkU6NSEz2YWl+22RMF4+PFgc/0YC9WTqt7R8oAKa3+W2?=
 =?us-ascii?Q?QXVQVMbWW6mW7d9fld7YPc1UOZOenhL14RuKIDRdWaqhzbAQIZJKFDyOXS/B?=
 =?us-ascii?Q?P7SnFMwh1m4eNmDaA1SXqTTE0ysaEmsLBxYE49SiuSJtdVbGXW+6JF2zBs9B?=
 =?us-ascii?Q?vX6VWt/6ybSvmjdxIMZfsOYjSuXNFyd3+Z9w7Er9KobYb3B2ZGqRuEP+eDHW?=
 =?us-ascii?Q?GYkiZtIY2gyMFfvYjYZAtIYuGrdte1m11A+aNqYOhsJCKmaDfNbSZep0wEw9?=
 =?us-ascii?Q?wpHk91nx/O0m9KevrPt/w+xQAdaW3zKEtB8U1DUACd1RtQgRe4iSlMmeOyji?=
 =?us-ascii?Q?Rhh6xbNTtO9xRO+ZoVNO4xgbqiXMgvp7lelND+NQ3fqPYFpI3uJO3qMljkhE?=
 =?us-ascii?Q?vObYjbAfeyd4akKKSYaQwOn66U1QEbQDT+1BeLiRbmaz6IV8JoiSCQf/8nnA?=
 =?us-ascii?Q?V0cJDRmdRNQ76ZB+FNEmt2mx1wkfqPQYwJC04KFqFW/PLs4BZhVOhrSYfbVM?=
 =?us-ascii?Q?HOw2fTK0pyfCZx2u4K1jHAJIdahBOe4LJBByg3r9ZSJ0RZtbetYIgAEba50p?=
 =?us-ascii?Q?k/lCipNJpjK1by0DPo2eNA89T0W0qQ4e2f4zI8j++2y9Yfu0tZCcfYQIh++M?=
 =?us-ascii?Q?dXdVuipigjEZuz6+7XaPwITmHtEdIwKlSuWUudYj06eNNetIKWA8gqCAG2qg?=
 =?us-ascii?Q?VOzJ9P0cATyFAo+T1on0z00mEJIxPVkHB4W0RLdzEmKrorEMpqLNG+4kqJBi?=
 =?us-ascii?Q?D55vY8+jixtce5q1mvbVGz30xSZ6RJnS+00BhuNFafl/GXFjI4pRAzkYUFIo?=
 =?us-ascii?Q?9Ezuo0SKmz7C/rhKNUuCmtnz2Xed+wg4L1E7QWLAAisc8hQTxnj6PleLO04I?=
 =?us-ascii?Q?zc00oyfRRCX9UpkD/a2XvbgA6ip0l/otIsYRvuiDm07/gMOTiBoXWrDrSWNO?=
 =?us-ascii?Q?nLi68zHIM75FdKsv7AvIwXW8LPfg77yKXcPEat1ySprxoNyVWUemoHy9JJpE?=
 =?us-ascii?Q?J6lEJcgiRXmLOl+C3jq0LNIVDlv4HIj76T8SqbHB0roIHghHtfT+V374D+Uq?=
 =?us-ascii?Q?rX3knSm5B7pW8xmBAzFNe2B8Bf2odxl/iEU8Zuhx7o3/Kvy5ZjeziiHPXEjj?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbb9b5f-2a84-44eb-7094-08db19fe16d2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 02:38:50.1628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1j488pgj6WLlLoEhGFFCvKSFDgEk6+qOCeekDOnIEusdbQZCGN4jpIMweKWzPSczt6FUwbIZJpqCUiRDojMQODhu6O3DBCXSJB1+gXSzwe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
X-Proofpoint-GUID: JyKkr_cHTSl_8wCcrTgJ8K-OkgxgY4UV
X-Proofpoint-ORIG-GUID: JyKkr_cHTSl_8wCcrTgJ8K-OkgxgY4UV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_19,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303010018
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 02:38:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7909

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...box-contains-init-use-it-in-containe.patch | 45 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-template-if-busybox-contains-init-use-it-in-containe.patch

diff --git a/recipes-containers/lxc/files/0001-template-if-busybox-contains-init-use-it-in-containe.patch b/recipes-containers/lxc/files/0001-template-if-busybox-contains-init-use-it-in-containe.patch
new file mode 100644
index 0000000..760ebe6
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-template-if-busybox-contains-init-use-it-in-containe.patch
@@ -0,0 +1,45 @@
+From 2789860daaa7780e1542bb1c60a89860e5661739 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 1 Mar 2023 09:25:35 +0800
+Subject: [PATCH] template: if busybox contains init, use it in container
+
+The lxc test code using busybox template, some cases would be failed or hang 
+if the init progress not from busybox. This cause ptest report lots of failed.
+
+The changes is checking whether the busybox has built-in init, if it has,use it.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ templates/lxc-busybox.in | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index dab7c1faf..e2beae7a4 100755
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -184,10 +184,16 @@ configure_busybox()
+       return 1
+   fi
+ 
+-  # copy bash binary as the container init
+-  if ! cp "$(which bash)" "${rootfs}/sbin/init"; then
+-      echo "ERROR: Failed to copy bash binary"
+-      return 1
++  # checking whether busybox has init or not
++  if ! ${rootfs}/bin/busybox --list | grep "init" > /dev/null; then
++      # copy bash binary as the container init
++      if ! cp "$(which bash)" "${rootfs}/sbin/init"; then
++          echo "ERROR: Failed to copy bash binary"
++          return 1
++      fi
++  else
++      # relink /sbin/init
++      ln "${rootfs}/bin/busybox" "${rootfs}/sbin/init"
+   fi
+ 
+ 
+-- 
+2.34.1
+
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index 7bc969e..073ed9c 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-5.0;protocol=https \
 	file://templates-use-curl-instead-of-wget.patch \
 	file://0001-download-don-t-try-compatbility-index.patch \
 	file://tests-our-init-is-not-busybox.patch \
+	file://0001-template-if-busybox-contains-init-use-it-in-containe.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	file://0001-Patching-an-incoming-CVE-CVE-2022-47952.patch \
-- 
2.34.1


