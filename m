Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E84C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 04:47:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23697.1653281233432644147
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 May 2022 21:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DhjeR3wU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=21423e1917=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24N4lDkr001368
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 May 2022 21:47:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=LCA32v0I4lv2NUtLOUYGz7u2Zu+dYx4zmJ4mgm6aBXg=;
 b=DhjeR3wUdKjEf72i6oX8CWOmqdRcHouloljtLGmG8793li5npV1cEII0ahGkTA2qT/y9
 Wyk+MP0DBK8cNbj3lYd0qymsI7iGoh9Dch9Q9qtyZsHJqw5DhW3OqG82zZEqIud3cEPq
 bj9C93pCvTcWQmn2p7mVblOTz12cLrt/Xz0WGZOYmaVj822U3g4+WnWR/6oYLfN1MsIc
 pTUN6jzgfeLUf20ppLGufNJOHC40+mdEVD3IaF5D7VL59DgbFokJqMpk7eULbf9HVUeC
 GievS2GKVWVcxm0QlEcsU5uYETDSMpprEP5EKZEIR2ty9r2DycydDMJ3Tb/VHJrtG/lB tA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g6uc191jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 May 2022 21:47:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuDsvl8d8CPmLlGpxh5fGIMzRCha235QM1qXEPKzSrhMilj9Jtv+H598MCE7jSOyy+aETt8Nrc5IyDPpVFayJh9k8SIWfO1lGJ9nfOA4r3Nl35ulEpkrKCnmtEnM7cRuhuS6MzahxYkJNnScOSQZZfUc9XRFS8ZwnftFJ2s24VhwWWmmcsPsdIxP7xkdZLgiqHWkIKvdRp5nwzWSffGznJwCjnaRJ9dKhxEjYXmgqBa7wbyk9PcOw4MsoF5tt7X6JV8SdJlEHpdzK71PydrHtXKgNP7urQquYLb0YZHMbiRkeSmLtLpKvDKFth+NbfvfybSn8o5VwfSzClumBVhj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCA32v0I4lv2NUtLOUYGz7u2Zu+dYx4zmJ4mgm6aBXg=;
 b=drpsPekCAS4TCQTzoMhMAX8aM+RsnlPBw3PYw1WRiz81fVksUCXX24CpX4Q5irve52XDw/nN8MzOrM/wgOnTtkCQAxcpkiCOuH+F0skCOCiC0skz7ZKdCJQIBM+vOH/mN/hANtA1UsEtEO4V6AGkjw0bhLFggDk4VptOE9qfq1roCBN+VnHMHQRs7p7pEvZCYUMaxubNlaPuLixAwqdvnaHtAvF8aAMjSVB732YfM2NUMa4+rrk8GWWFZ98ezfeqCLdHDy2SuApvvQKCgL68JGRVsce6vv6RX5KPKSGpB+cmFJdE79L8uKVfOD+SuHrx01Idf3/JOErm3CnomTEH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN6PR11MB0033.namprd11.prod.outlook.com (2603:10b6:405:63::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Mon, 23 May
 2022 04:47:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a0a0:842:e19d:e5df]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a0a0:842:e19d:e5df%6]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 04:47:09 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] ceph: fix gcc-12 compile failure
Date: Sun, 22 May 2022 21:46:55 -0700
Message-Id: <20220523044655.59281-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:5:177::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71d2ca05-d8d0-41f6-ee3f-08da3c774b51
X-MS-TrafficTypeDiagnostic: BN6PR11MB0033:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB00330D8A69FD1298B32DD78CEDD49@BN6PR11MB0033.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fMEer7Wrg1m9PMTJveIC4nmvup6vnyZEmsxObsuT7NTVgRURcbn61nimU1Ewvcvz2AwwBm2sPvLFq8FPiJU02xq1+UmNWpO0cm6HVHhqbKljNX7pgKIpnpHYNezl5QA0SxHtFQmIC/gFGpSCDuIVpLp/lTfF+W+0ChKYy3bxjB0zegbK6l1dANvFE7CkAnRqgAOg9mmgN6xnBKwQPii5CY+hdjptbXMwdOncx8IgjbnPBFnMScTOfU56BJoCmxYw90KgkqLHSDL6wADWJO60ubBVf1y3jGXIn/9WWsh/6XjniyfBd0OC93A8DmOFcT+Wdkg3PSdV8CztzvjG+vpl5n3R1VGu1rgY4TtXXdlb/WvqTP8Am2H7WrnZ0pgj+8jpzGIMZNU8w22GL/BqL/7HIhyfu5B/F+8Yh1DuI8xJNaia7xvhebB4nUNeC+4x+bAKJ6dbxYzJ6OqOw9EuxJhzwSFltHXj1cBD+FlcLu5rxTPjl5bQSYAbxF+LzScVlVQH2US159gmw5rutf+PdE5jhWif3XZjdbf3V87kvggJzKgc9MWx14Iprdt9+dTb+bPrrh9ZzfF3pN62NLXk78CtZmsP4fmjcZ0tno5C36SMjDxjUob42ALQEbciV8XPv76wrmn3C9GdpcD5CrBTonJHBcuYxFRcwRhT7zL3G6Ni968jf25aiLcFUv1CTCooxBoXuvwGEZNMakhJBvuqlIcPa0sMxxBQeh6qOd673++cUeEhzDaUofunqdkCA38Zum2ZQvPkYNwiXiGy0sw+xX7QqG1dEh7we91aOvpWpHLruneka3csvw9LUB+CQ3NOD2rNW5hag3aNPnQ7+ckFmYAVCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(86362001)(36756003)(186003)(6916009)(316002)(6666004)(52116002)(83380400001)(66476007)(38100700002)(38350700002)(66946007)(2616005)(1076003)(5660300002)(66556008)(6506007)(966005)(6486002)(2906002)(26005)(8936002)(6512007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9qoFi/XYpqRZWwdHyyH2AdBVN31NYpxSZ+bVWU/V3Ov2XaLoqhKumUYxFSHm?=
 =?us-ascii?Q?6LGyqfsSHpbfYkRVBg6L8vs3xQf0fNFL6Q5UMiYIioZRn8lT5f0ep/rXNXjD?=
 =?us-ascii?Q?2Wf+AC1m+DsskmnBnoi9EN7PYyfaKRR3E9ibBNdKfG2AciPnqoLfWGIIvEHp?=
 =?us-ascii?Q?i+CNQC7MuJjw5b+1SuIjHay0y6MqgxEu0v+UmD5A5TJnI/2jKxRwqSiyoQjp?=
 =?us-ascii?Q?AFHM/VfSn9oLIpR6I3vxGYVXVWpp1lASLzXy1B896eC4HwUuSeF82mN6NaeM?=
 =?us-ascii?Q?xYhaBQDZbNGU5ZlkSxfXPzcypaGqetok5KRpsWhM7lWfmW8j/m1FEKVRM4Z7?=
 =?us-ascii?Q?hse25CcCQhGbEEL8GHNePPNm0KhtVXyJ3kCmpOYk/he+p2GcF4u8bt9M+AZL?=
 =?us-ascii?Q?u/KxO2iY5Fw1LCz+bk2Wv6PR53oJ5IVaus26xfyP5Qk95WyqnkrkM2Wl4RPe?=
 =?us-ascii?Q?IevNmtHtmB9RaOhkqWOc8+gMU2bQ7LlreamaK4G6V9Bxwbv7Qtan0FbJkNH0?=
 =?us-ascii?Q?fjRmYcr3utUSciaAFGSwZkXc08bRqo+EFUJTYNtJ2nJ3IP85bMyNxGzxkfzu?=
 =?us-ascii?Q?yOpYgMdz1pynsS7WO9yUR1RElpr6wOvL56ARtyZYp+1kWkJOgsqdxbIZCHbI?=
 =?us-ascii?Q?RO+1gdM3YOw2oSld960Ffg7sg2pTYiKTAc7XUjioWhveEYlvDvMCDSZ85Sdk?=
 =?us-ascii?Q?vH9OuIMJHh2dGvQEVEMdbcDkN0uK+9xxK3IcAKT2aVo65wBaGLSONV8J97wz?=
 =?us-ascii?Q?jegEjQ0Ofdx7XxJc++bRCSDtZoNvKsC5Q4CfxmfRj/u0WM/U1u4z4gIbAsra?=
 =?us-ascii?Q?rsswQIdI0PSxWeGAY0NKzWZlE4qS6eqPib/KZYNgo9tQZ7pMwgeB+QqSwrlS?=
 =?us-ascii?Q?Q2TPwUUYGLY2LsvWEnvHfCeL5JUEcjF1JkySodP+/c349U6iDr3ZLAvqmtsF?=
 =?us-ascii?Q?NbIyZUcY/0Pmt8a/nZP5tiqW/FG7z+uyx/e6ZkSfLsTHURkl7eKzvVTP+Tq6?=
 =?us-ascii?Q?bEik0h1XGwQSDLV+PL4tbNzMBpk+57y7AT3RVCtPPShYHYL1gLbIrw75UHQl?=
 =?us-ascii?Q?ilOUp5QlcJfyZlBslx28nfWpXIaHPKVN9XciTyl9og8Uvr7+EPeEL2UWJlCk?=
 =?us-ascii?Q?+nc3BZ3dXbmLRRDPVjJ39uU8jAKoTbf/kmO7S09Lh5q+Yq8OpauBDjVmVZD6?=
 =?us-ascii?Q?+5ygiJ+RU6IerViWzled0PxKbIJH3oxoMhs5iiU8CzUyjDqOe8/M4L3JVold?=
 =?us-ascii?Q?IBgLER666ewssrjqNHFvCBVDxvVfi8F1g9FE5y03/Aoh0ftro/c1foHvd69U?=
 =?us-ascii?Q?VAlN/j018fb8OQyzp2vfYzSKNxpYdMA5o6oGemculDCVqKU/Fv+IVHHLQKpU?=
 =?us-ascii?Q?sQGTWn7Amay1+gATkGU/8aDW0qeG2QBeQDDNUStx6SL6v+tUHH2L4tPmyPUf?=
 =?us-ascii?Q?uWMfVf0+/+8slwYX0vTI45ZHZt97XfFdQ2rAPNofgR8g87op8cOA9Cvq3GCQ?=
 =?us-ascii?Q?hHfv2gOMzjusK16n2f4kjgZmujeF5VZZBQ+SEjAxje9dmH4J3m/kKo+sr5Kt?=
 =?us-ascii?Q?2dO2GGxibDFIq8GVwprtDQLqi0+wGBZnn58ypPb2YuYRuejMoCnboOnKHGNQ?=
 =?us-ascii?Q?ZueA0MJrdoOMtG09Fp8w4fgRS51lGoQBO5qltWdycIKUemahFR9+0qYIetlR?=
 =?us-ascii?Q?Fo6+mwv4HNBtEyQYBtt3VkThdARR+/Cv14UkjP76ZmFpEACHRcnTxjdqLUcP?=
 =?us-ascii?Q?ZpwzDHzLag5yzI53vxQsGit75rEu80U=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71d2ca05-d8d0-41f6-ee3f-08da3c774b51
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 04:47:09.0656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wUsZZWViBpqKOQ749Zhh8RSXWFEAbT52Y9YF/g6MvUSLnyGpPWhpZ4ITli677zfTs0uFB6EvGx1l1EftqRiyzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0033
X-Proofpoint-GUID: orZpZFOXb9Vw5R7VMUEhanhtmtqy7pLN
X-Proofpoint-ORIG-GUID: orZpZFOXb9Vw5R7VMUEhanhtmtqy7pLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_01,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205230030
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 May 2022 04:47:22 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7310

Add two patches to fix gcc-12 compile failure.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ssing-header-file-due-to-gcc-upgrade.patch | 30 +++++++++++++
 ...S-due-to-dout-need_dynamic-on-GCC-12.patch | 42 +++++++++++++++++++
 recipes-extended/ceph/ceph_15.2.15.bb         |  2 +
 3 files changed, 74 insertions(+)
 create mode 100644 recipes-extended/ceph/ceph/0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch
 create mode 100644 recipes-extended/ceph/ceph/0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch

diff --git a/recipes-extended/ceph/ceph/0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch b/recipes-extended/ceph/ceph/0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch
new file mode 100644
index 0000000..70d3eb9
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch
@@ -0,0 +1,30 @@
+From 496465d9238109a93612e28682273e5bf576823b Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sun, 22 May 2022 19:40:59 -0700
+Subject: [PATCH 1/2] buffer.h: add missing header file due to gcc upgrade
+
+The header file <memory> have been changed to be no longer included by other
+heades, thus requiring explicit include. See https://gcc.gnu.org/gcc-12/porting_to.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/include/buffer.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/include/buffer.h b/src/include/buffer.h
+index 5c8b427d..88845ee6 100644
+--- a/src/include/buffer.h
++++ b/src/include/buffer.h
+@@ -43,6 +43,7 @@
+ #include <list>
+ #include <vector>
+ #include <string>
++#include <memory>
+ #if __cplusplus >= 201703L
+ #include <string_view>
+ #endif // __cplusplus >= 201703L
+-- 
+2.36.0
+
diff --git a/recipes-extended/ceph/ceph/0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch b/recipes-extended/ceph/ceph/0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch
new file mode 100644
index 0000000..d119bf1
--- /dev/null
+++ b/recipes-extended/ceph/ceph/0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch
@@ -0,0 +1,42 @@
+From 841806de212226921eeaeb3eea054bda8ccce616 Mon Sep 17 00:00:00 2001
+From: Radoslaw Zarzynski <rzarzyns@redhat.com>
+Date: Wed, 19 Jan 2022 15:24:11 +0000
+Subject: [PATCH 2/2] common: fix FTBFS due to dout & need_dynamic on GCC-12
+
+For details see:
+https://gist.github.com/rzarzynski/d6d2df6888923bef6a3e764f4856853f.
+
+Special thanks to Kaleb Keithley who reported the issue
+and tested the fix!
+
+Fixes: https://tracker.ceph.com/issues/53896
+Signed-off-by: Radoslaw Zarzynski <rzarzyns@redhat.com>
+
+Upstream-Status: Backport [963d756ded40f5adf2efef53893c917bec1845c1]
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/common/dout.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/dout.h b/src/common/dout.h
+index c7c08182..42f49915 100644
+--- a/src/common/dout.h
++++ b/src/common/dout.h
+@@ -99,11 +99,12 @@ namespace ceph::dout {
+ template<typename T>
+ struct dynamic_marker_t {
+   T value;
+-  operator T() const { return value; }
++  // constexpr ctor isn't needed as it's an aggregate type
++  constexpr operator T() const { return value; }
+ };
+ 
+ template<typename T>
+-dynamic_marker_t<T> need_dynamic(T&& t) {
++constexpr dynamic_marker_t<T> need_dynamic(T&& t) {
+   return dynamic_marker_t<T>{ std::forward<T>(t) };
+ }
+ 
+-- 
+2.36.0
+
diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
index 17dbcf3..0fb32b2 100644
--- a/recipes-extended/ceph/ceph_15.2.15.bb
+++ b/recipes-extended/ceph/ceph_15.2.15.bb
@@ -14,6 +14,8 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://ceph.conf \
            file://0001-cmake-add-support-for-python3.10.patch \
            file://0001-SnappyCompressor.h-fix-snappy-compiler-error.patch \
+           file://0001-buffer.h-add-missing-header-file-due-to-gcc-upgrade.patch \
+           file://0002-common-fix-FTBFS-due-to-dout-need_dynamic-on-GCC-12.patch \
 "
 
 SRC_URI[sha256sum] = "5dccdaff2ebe18d435b32bfc06f8b5f474bf6ac0432a6a07d144b7c56700d0bf"
-- 
2.36.0


