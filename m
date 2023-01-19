Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E08BC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 09:24:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41752.1674120274095851483
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 01:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03835df60b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J96Qfw001263
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 01:24:33 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6vvwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 01:24:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auIDTfnd/DkLLK1b/5/26npTHSzfh4mKc3ojpv0ahXRPp6Zl8YewW/+z54TXnYwPka3CrFEb1CjsN6bYeS4UxYcaW/uYvs1AH07I5vlVIA+7g9NIrlkUTw+Wq1NzmQbm/FBT7KFhPRA6L1CDukmiowS3kQRfjceEQjBepCNouljDwmoQSm/D9SySc4fCRWFmk4aOX06Q4KW0Yf9ueei6AaKkaPnjO61LVC+YeoypfmlxikQN4AtRrnRiPZFMbgDKINYGOWvTjetXrcxlgfDzXzVlyUUCnA4aAxEWVDo71doHHDTSLhj+7o/ATBu5wc8g62zrQ4MhKOB9STPOoYX2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oew+J8/sgBcTgr8XqnUJuzP4jGGlH4wEZAf9+00y+2M=;
 b=hWY1CemIdjeLTONBSxq1rRzj8gtGvNuhkmxhZA/w/HEr6akUwqIkAwn8EiiM6FxV8ekNIWqxZCdvMoQ/b2MTd5os7unVmgCt0BrALYpGMu0NUeBcjDEDfnk11lUErt6ixNlTl33BvYtZ72ZV6rWzjVoJEE3OMEO1zg/i8K3RIy+ixbRZ7ceRlD1aS9WG7PZ/e8S649v4/vQASOdUebRQz1SmfOjuYpa+bdpoakb1JKv5Fh5foiY69azGy6hsZk0/QWNbOU0ydLJNTWGdQooSFDMVf2NrxS7NNb8MQDA5nsAjf4TDj2bLbmgBIRMuKZlzq5JGBnPpp69zDiywSHOL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 09:24:30 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 09:24:29 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix libraries contain build folder path cause QA warning
Date: Thu, 19 Jan 2023 17:24:12 +0800
Message-Id: <20230119092412.630153-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e0045a-aa33-478f-b77c-08daf9fef76e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KrpcVj7VGa92cjYvCtcpeB9zmSbU7oJndoi2k6cyDEpYBAUtE4xETwVn0AqWMMoi/8sTsdsUTcsgt6ZFsWGQXNfe6kPz0PpDr7Ff8qMCFsvE2xz/WqbrNDOc7u6tT6A6oS1IfzEjAMcpSy/YtMxEpOnP0qSv/LoXQ7g+qq3hMo9VWoOFLDKkr1rK09+pifSuM1XrqW5/4XOuPug+66ibpE83kmMsFa8EuZgjBtd56vZgUG46eYs/YlsrRRyIGCgQ9oWOGZxJWYs4na4FI6eMjwyzGHVO2OyDYHAre0DBTFrEjY4YSbSXQKTUt+xx1vuCqKoxRF6PIpuVTwzRauFfenjGa+50mAr0u77xP1mfMggsZkqbj8dXbjljIBcELO/jj0alAcy3vgzZTvtUu2SSn04ABEYhem08UE8GAHOKKi22xm2HsGd5XR61qOFnI3A29dk45WDLjfNWm1qLOUUbaH3xifgzpHJ5ljUYqbsreYfLQ6VE2Mqcmv4fK53e8/6tkwbUpJ0zALcpVQh/gvlpOGP0U20YrCkzzAAjiRKtnGrIUTYo2+rIA7Mp8+5LeUIj+J1pMLZUarUwFxbxylCni1DgQK17Hzw7OEJtoq4YViEGvv2tAgmEu8o51STqloAVTNhygWmFOHjS/hOrVKO0GfQUa/egd3noPD88FVZO44/WHTZeUW9lLTQVQK05i9iR99evdN3qNGaFKjcL2zQUoFfLQVnppPMSKffDytGKkTo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39850400004)(346002)(366004)(376002)(451199015)(66946007)(8676002)(41300700001)(6916009)(66556008)(66476007)(44832011)(83380400001)(186003)(478600001)(26005)(6512007)(6486002)(6506007)(6666004)(8936002)(1076003)(316002)(52116002)(2616005)(5660300002)(2906002)(38350700002)(83170400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g1Pk67cOlVzo+DHHZhqCQq5iqF6mFY2wdqlU8Nh9hOIEHcoiUGfh68SGTQbM?=
 =?us-ascii?Q?JAFmOc62NRFD3v5M3EJ1m/CTpI1A+KDn5PDeUFGvUQeG8MSpJ3oa+1PU8aIQ?=
 =?us-ascii?Q?bsP3JevNt47X2lDsR5r+XsTgdoLSU2PZ5lD8RLBInsjWYgtCqVGK9OZI02zt?=
 =?us-ascii?Q?h5y85/OPGSScj4f8eMnWFXaJsl7rTngdKjQewvEWlvSPk7CiuIJkDe8oqmmd?=
 =?us-ascii?Q?pUyglNB95NuggFbFamQychalB+dq0L/6zu5C6lqKGvrPIpMaes50U0bqZwPj?=
 =?us-ascii?Q?7bCEQT9b7JnpzQHI5FUM1wQC+wWIeP8LQ1mSEOT1dY6vb0jA6HO6CHmK89eg?=
 =?us-ascii?Q?cXISgg71pXuQinMYY0qNyUAf0bnJY0lodL4CvQCfn3qXWxLMUQcnQM5oKr7G?=
 =?us-ascii?Q?3NsetkFbPxJm/YZxdEkb2iXOJ4sPv+gehFn8BGjeWBqRGr1wUQt5VPbPVb+I?=
 =?us-ascii?Q?9i+w/nhxQ8hZSIJclVN9EuRrfFcWK6aWKoEgP7ygnM/jGDQIVoZ1jYm/Bn6J?=
 =?us-ascii?Q?/FQUsLxAidagjbiLZG5K80Czdjo0r1yvUn9hQf08oRfLDhcNQYj5hpHK4AA+?=
 =?us-ascii?Q?OcwyT5IHLkEkgQE9KtrdfvE1Ycb5vEYXt/3TfjPLB9fJNvNNZhaX5yGeQWCO?=
 =?us-ascii?Q?pghrzct8bEiidYeKw49jcJeX5I7RpUDqUqKO2EackFWpqJ0JW5apELdS5+GM?=
 =?us-ascii?Q?857OT/zNrXbV9uAQyJa2fh4+7umOPuBlh5C/yHHcH87WkftIaZeOwXdUgK5I?=
 =?us-ascii?Q?XrWrRVWg9XcQYxzssxg1SHvcBhAp9RD1KwXvlaCKDDr10MKUgXyZsrD2IyxZ?=
 =?us-ascii?Q?k9gUkCjssV1cTw/sJZLXqwGhTGCCjo1wFQRupDvg9gLc7CMok1ctqKvvo2w/?=
 =?us-ascii?Q?YVpZwYHbgMgnRoXR8eSGRGC7VKS5Tkf5tnyuaMrxRhGg622csja/09OuWhsS?=
 =?us-ascii?Q?SS5fShb10q3O1qGQKXG7d9VJxOikW3veW32k/ndQ0CfRPYZWXfUvAFCO+TOX?=
 =?us-ascii?Q?MOj9Zv2B921PTyydFOwt4MuTN36GHZe6RJcXunxLzHsWKcZ0lnNSUEaIThhk?=
 =?us-ascii?Q?cOf/XeExWUYStRO0S/48S1TuiMikAsf9a4pJTUJs2K+maS6ctAzwqYPP2l+E?=
 =?us-ascii?Q?FwjwcWe4AzCvWBBVgbWRyL0AEguNhbMRqO+3VFFJQ6hW6/Qez9BQ8Ro4qZLk?=
 =?us-ascii?Q?ovwXCesEGV1LfVUjdIQeVVDxSRrAM7Rdx0IBJh2cCXDbsgNRqrhuJG1JrM9P?=
 =?us-ascii?Q?HtQeeW5rAXkLPh4ytafkJ0YIX3iPDH3jVnPaLykq5twvGTs59m9Qhf3W59Kd?=
 =?us-ascii?Q?/LukO6IWfCSFC6oBgh1RhHJhB7uwBWfP5WiUdsl7SzZGxynDEJKGBtJ67Oyf?=
 =?us-ascii?Q?mx+1bzMWILnlj33/Rcm0V/wmeZOxiwzwxMdH3eAoUqQmsPojfTSdPHojQHZ7?=
 =?us-ascii?Q?wnoPpAZr78bmKMe2GzMH/juE7YymZc9LAoxYNijq3SM2gA4/YmYV+Z6/NY4I?=
 =?us-ascii?Q?AuLx8Y3kDWFuGbqWDOIbeGukAh2+EipnULGE976Aa7VqDUckabM+1FD0SU0w?=
 =?us-ascii?Q?BqC0oaI9i/j9oV9W3l0n3evZ/sBK56tZqMsZiJyCp410Zsxp/5iowt2+/NN/?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e0045a-aa33-478f-b77c-08daf9fef76e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 09:24:29.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRoS+y1c1fsxlIBGwfFqYnXxA/HDsV5T0fls+sM4e6JnWHi1ZcUdJijfbXn+7CwE+JVewrQPzJPmt//xHCSXcLoO1Jyg/PRtY5NMCKzv4Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
X-Proofpoint-GUID: XTy5cRpHsyrJ1EWxFi-onXpeXj4UcgXp
X-Proofpoint-ORIG-GUID: XTy5cRpHsyrJ1EWxFi-onXpeXj4UcgXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_07,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=949 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190076
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 09:24:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7818

From: Xiangyu Chen <xiangyu.chen@windriver.com>

libvirt debug trace contains source path, and some utils was located to
yocto sysroot folder, those full source path cause yocto QA buildpath
check failed and report "xxxx contains reference to TMPDIR" warnings.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...ove-build-path-information-to-avoid-.patch | 58 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_8.1.0.bb     |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch b/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch
new file mode 100644
index 0000000..1e09cd6
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-messon.build-remove-build-path-information-to-avoid-.patch
@@ -0,0 +1,58 @@
+From 9660b76325c841a5f5c7d5b2fb439a1fd64105c9 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Thu, 19 Jan 2023 17:07:37 +0800
+Subject: [PATCH] messon.build: remove build path information to avoid yocto QA
+ buildpath check warnings
+
+libvirt debug trace contains source path, and some utils was located to
+yocto sysroot folder, those full source path cause yocto QA buildpath check failed and report warnings as below:
+
+WARNING: libvirt-8.1.0-r0 do_package_qa: QA Issue: File /usr/libexec/libvirt_lxc in package libvirt contains reference to TMPDIR
+File /usr/lib64/libvirt.so.0.8001.0 in package libvirt contains reference to TMPDIR
+File /usr/lib64/libvirt/lock-driver/lockd.so in package libvirt contains reference to TMPDIR
+File /usr/lib64/libvirt/connection-driver/libvirt_driver_lxc.so in package libvirt contains reference to TMPDIR
+File /usr/lib64/libvirt/connection-driver/libvirt_driver_storage.so in package libvirt contains reference to TMPDIR
+File /usr/lib64/libvirt/connection-driver/libvirt_driver_network.so in package libvirt contains reference to TMPDIR
+File /usr/lib64/libvirt/storage-backend/libvirt_storage_backend_fs.so in package libvirt contains reference to TMPDIR
+File /usr/lib64/libvirt/storage-backend/libvirt_storage_backend_disk.so in package libvirt contains reference to TMPDIR
+File /usr/bin/virt-ssh-helper in package libvirt contains reference to TMPDIR [buildpaths]
+
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ meson.build | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 9016c04..fb78d44 100644
+--- a/meson.build
++++ b/meson.build
+@@ -26,8 +26,8 @@ endif
+ conf = configuration_data()
+ 
+ conf.set('_GNU_SOURCE', 1)
+-conf.set_quoted('abs_top_builddir', meson.build_root())
+-conf.set_quoted('abs_top_srcdir', meson.source_root())
++conf.set_quoted('abs_top_builddir', ' ')
++conf.set_quoted('abs_top_srcdir', ' ')
+ conf.set_quoted('PACKAGE', meson.project_name())
+ conf.set_quoted('PACKAGE_NAME', meson.project_name())
+ conf.set_quoted('PACKAGE_VERSION', meson.project_version())
+@@ -1830,9 +1830,9 @@ if conf.has('WITH_LIBVIRTD')
+       use_storage = true
+ 
+       conf.set('WITH_STORAGE_FS', 1)
+-      conf.set_quoted('MOUNT', mount_prog.path())
+-      conf.set_quoted('UMOUNT', umount_prog.path())
+-      conf.set_quoted('MKFS', mkfs_prog.path())
++      conf.set_quoted('MOUNT', '/usr/bin/mount')
++      conf.set_quoted('UMOUNT', '/usr/bin/umount')
++      conf.set_quoted('MKFS', '/usr/sbin/mkfs')
+ 
+       showmount_prog = find_program('showmount', required: false, dirs: libvirt_sbin_path)
+       showmount_path = ''
+-- 
+2.17.1
+
diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb b/recipes-extended/libvirt/libvirt_8.1.0.bb
index 0ffd510..d529db1 100644
--- a/recipes-extended/libvirt/libvirt_8.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://gnutls-helper.py \
            file://0001-qemu-segmentation-fault-in-virtqemud-executing-qemuD.patch \
            file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
+           file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
           "
 
 SRC_URI[libvirt.sha256sum] = "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
-- 
2.34.1


