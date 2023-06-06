Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3715C7EE39
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 07:43:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3432.1686037407504391882
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 00:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BLjTYrvB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5521525cda=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35660Bli018027
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 6 Jun 2023 07:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Up8p+lJZ7bDhp/ME4sLN5YB2Zq7oSTPbAMXiKmAsTSI=;
 b=BLjTYrvBeqgiyOVpKwHvaisN1ghcGvNYdROvjk1Cn0PqVtIzpnr8zmaA/sBFMRNQJyVD
 N/gxm5bNziLZHQnoKnkQJUFFwpihriZwOuA6DeePXigCii/lpJkLYlstXtbLDzRFsRcx
 /7TXMJJ1ms6atSToRtJJnjpjB90q7FstcP+GJA6Qy1P4dgxdrJEydtB5XSblKPDYGSP3
 I4YAyX/TAmNrocwhuxE7z/wXlCF00GUqFIhQLC+KMQJSXRUjHzNoSK2U+wkSync6Rmwi
 JQNYYhn4zGCTh91+lilY6qOmGgsxSKgR/SbhoLipcUEfvmeYCEmv38WblROCuij9o0PI GQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qyvg8j8hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 07:43:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfkMkIx0jm2MECd5jHC4UXec7PCBV05+Lkki3vzIzVtw6TCq+rQzyg4GyzhLYpYBAg1mKdwHXVwKiEydhbl2Nquvnz+iLCvA9Y+Qksujx6dmq36dGei/RLsBKwUOSt8w6cD05fbrJ9lorSKIgp/LRe2VCQEPnurO/MzCSiGOwJe37gaL7lZU2wQwYdg6eQ7R9tak5ssCBEiQJFrGWH0UEEwgLjlFfLj7f0kpMiIIH1iKdCDZ87qVcvszhY2Mwg3aFnHaPUPxtCqe5LI1pQLsHHpyj8pZLxKocxOy3jC6nV5dOXtx5uyUrP18VS8xUQmNO82h4wvXFB9UZyk4d2sepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up8p+lJZ7bDhp/ME4sLN5YB2Zq7oSTPbAMXiKmAsTSI=;
 b=mw6Z/xxOmpya1EENXGJ+/9uFLQnOcGnSDyz3zPvAxs/8LVoyYh/VDTM3Yj44psyUO00z/A2sEKXfVVhbvvSplfXKV9KWFgrLdpTHISI/tu7Gyr5uEVbgn07ryIMUa4WZA4xdGFxQxyuzobKetdg+YzUkmowinQS3wzOk+6cWwSzCJDuf0LSOOO4z4kAJ3qmRENiGQH2cVGJWxFE8XOypvGPYkqLfOEq043L1A1+V9dWlu1oPJ5o8mCiphVD3COf204D1V6iH8/Ij2bd49yxlLPbDped+dFXg3HMa8Xh0FnxeEQXjnR7WEZHxsmwOgiBrst81XPmKDIlI3sa+4sMJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6351.namprd11.prod.outlook.com (2603:10b6:8:cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 07:43:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 07:43:22 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/2] docker: upgrade to 23.0.6
Date: Tue,  6 Jun 2023 00:43:10 -0700
Message-Id: <20230606074311.2269186-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0131.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: 960d91be-dcbe-48cf-ca2a-08db6661b463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8zA0VcblKWBPXWmNX0BvvqDdz7RjQsgJe60gY/3PZZeh397SWvWD7UlgEb5Q8CthTSk/MuZSy5wusWew/rRP/1Wth0e3JdnyVYJQRt68ZiXQ1e0S/lGbyz++NdDt1Y5FkfbbogIjGhatTTTj0DxWZaggLoHCSGLk/o2zYWQlx+0nw6tHQZJEJX4asmt0yfXBiayUYZD8RFku5SMMSm64jh+64mjK8ALw0JM3XtjpUFn4jiaeU+I+PgbfRObRihjEs/2gSlnG6NN6kCBF47NhSEZ/ZGGEKnkn+N50gq9LyJpLwhlhN6/3dc6eLx/bWmt/eiJs+G7yGduSjc35hz+ZI5k5KTBzlInQM5CrI6XkkOF/0V31qJM76IX7P8Bxt6VQeSZESyUNr4JeB2qFDa2eNHzPAKPev8ISguSL6iYo8alLuXfQ4SS1HIH85kbasdp0Z3MlxS0Bs8otC6NVyl7OESOl48a38XToi1CptiVIHe3fnxYnnTjKWr0AKjRJBFSeS/ucCXcvF7irEYX/4mxNMndhb5OGt8lp/KAhBlLsDY/a2ZfY97Ijt4w3Yx9IfTLwq/GTm7ZuvGKXYnbqZ6N/MI1p23RqBMSJLra6BPlpTiY2XWsM2VXnnwNSK/aM9gng9RPFYejW2bdsejBN91LAFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(451199021)(8676002)(8936002)(478600001)(966005)(6666004)(52116002)(5660300002)(316002)(41300700001)(6486002)(1076003)(26005)(186003)(66946007)(66476007)(6916009)(66556008)(6512007)(9686003)(6506007)(2616005)(83380400001)(2906002)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7yBi5HvTw/Oh3TU8l/PezRRtoIPuTBtB9JS+miTRo5ja5x29CFqvQAAEX/XI?=
 =?us-ascii?Q?ClbR/8ggMxHWdyrDxiS+JH3anzhrph8bQ4EtDGjKJ8SDgarbuXMUDJNjirvj?=
 =?us-ascii?Q?eQFAW0n7m39czy1AlhDkplfWxnyKIbb6X0Y/gM8pd1cT1SHXtuWUQsEu6pcC?=
 =?us-ascii?Q?YZj6shizE51j7ZPbv5ZE2hztQ+9ANSoieirbN389jYMRZiAZ6UJNzgksmFJm?=
 =?us-ascii?Q?/CEH93v/s0ARJX6qjrjbHtpC+S7Bw0y40a95fzkw3LE4JvyT0bYcMbp5QpTP?=
 =?us-ascii?Q?krVZeGGx53erGXW5XkMHTARHEKVYmFlpEFDzBmJT2Boqud01b4R2gmI0mgxo?=
 =?us-ascii?Q?TxNBeZKc+zazganIU+BDGYVdwQK7dc0pnupm9UUCrMQ9w/Yx+t4PnM503r1P?=
 =?us-ascii?Q?nRzsFOLFCy7IJTnGCJCgCZn0R8H1yGys7kg9yB6juBThHEM2qhUh16jCCnxx?=
 =?us-ascii?Q?n5RAlsxIexDkk3ps+GKseT3RHmSBiLh9u9MTV2UcjlqMhRVppUl4DAn98J50?=
 =?us-ascii?Q?6D9rnFUuINFbl62beGAR3TpfbhAUQF2m8DGRPlg/KUimK1OVjnIPJBqS+Qsx?=
 =?us-ascii?Q?dNgz5QzU1g9MAqc3D9SURwR3UMGMN0ZeXOUb7yk58082Xt7m/wXEATFQcKhb?=
 =?us-ascii?Q?IxKOV+LyEY2O8Vy2iQu6UYE2XHbVZtPZyolLpoF5lvUfzwi9O15TL/vu36mq?=
 =?us-ascii?Q?ewEQBda/59ypsB1B8rosjdIE32YLG7pbo1EaTzdBMsq+1yDuw6OVeyQxT9U3?=
 =?us-ascii?Q?h1WAVmO/EZmMc9JdCVRcA3cuvdhuuJp8tjF7xqNJjlUqM2fgJiB2Gs0jV7q7?=
 =?us-ascii?Q?Zz9W6aWga+5DlnJqcf+YMqCtm8cAzQn6BGr43PAZ4n6tJkUzL+BH0+EDS5nq?=
 =?us-ascii?Q?Tn/3tkEAoGb69mripkWsyOXgw5H/NRlc+7GVrp6H9khpd2r5Ni77YG8L2bE9?=
 =?us-ascii?Q?/y7kIRPkFKb/BfarFEUYi8Y1pZuoFPyLzPh6pNxrSsA8XZPJW5HtxlzvjRaR?=
 =?us-ascii?Q?XdEn6ZIFVO1laZSYG4Pd6feJlPp/xb3/aevu587nPGyoDrwtV5PsKmG7D68I?=
 =?us-ascii?Q?HaMWveolIyZ27hd4Nifj4VmN7tELNI7lG3V+as0EmReKg4AiBXsvruJeTpH/?=
 =?us-ascii?Q?cQCc7cnrYoS9TDDW5o8OYnjH9k/XrKfcnYN2DvpIrdB8WiOgd8JWZzDQMJcj?=
 =?us-ascii?Q?QW2jrqjizwaEiLcyklyMDVJ9fRIWmPPEwWUfY5vn+fAP0bl9Ab1ycwlAq2Ut?=
 =?us-ascii?Q?yFkGLW/1JkDrQCIGfBJfVU3eFXrTO3/wEDyUME0myyrTkoBfiANeqMlcCfAo?=
 =?us-ascii?Q?wNcx1j33T/E58J0M00zYAVGqeVL8AfApOdlj2wSXhXVv7igq4smTqCAgu+wA?=
 =?us-ascii?Q?tzfp1upYCgRnSyfW1OoBpdrS83Z9eczAZJw/qBLfa+u2mml+xpgJnNOzLyo/?=
 =?us-ascii?Q?8FzvXS3FKFG6bVnEIS5vXgQYlBZdzGAZc7EKvLAEk6JmHWYMJCylIQ1wgYrk?=
 =?us-ascii?Q?VVJFQbH3zuGKF/6TYh87F9TK1kRBl8lpi/6iBcwY+YwgVGG4KqTplURerTgJ?=
 =?us-ascii?Q?Zz7qhbiaK/1v1i57gpGuudMuba9KEA/ZGcLaw0wlSyf3cdlXCsNIItdZh5Wg?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960d91be-dcbe-48cf-ca2a-08db6661b463
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 07:43:22.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HSbEe8FJKGgRR5/uqnKMWb1gXcsw/GwxOq5aEb7BsLIW9383WhBf72BVXwdGgOhqJtlBxIC6gsRM0V/vbQ3/OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6351
X-Proofpoint-ORIG-GUID: amqq5EMoARo5Vc2-6qRW7kf7dqEXniTQ
X-Proofpoint-GUID: amqq5EMoARo5Vc2-6qRW7kf7dqEXniTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_04,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2306060066
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 07:43:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8089

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   7 +-
 ...Allow-for-xattr-copy-failure-for-vfs.patch | 113 ------------------
 2 files changed, 3 insertions(+), 117 deletions(-)
 delete mode 100644 recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-for-vfs.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 7858bebf..507d968a 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -44,9 +44,9 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_moby = "219f21bf07502b447095649b5a2764661737f164"
+SRCREV_moby = "9dbdbd4b6d7681bd18c897a6ba0376073c2a72ff"
 SRCREV_libnetwork = "25ec449c45d2075c85fb3688ef4c1730be0466e0"
-SRCREV_cli = "569dd73db13099a7c3104d73aa15117b359045bc"
+SRCREV_cli = "ef23cbc4315ae76c744e02d687c09548ede461bd"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
 	git://github.com/moby/moby.git;branch=23.0;name=moby;protocol=https \
@@ -56,7 +56,6 @@ SRC_URI = "\
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
-        file://0001-Allow-for-xattr-copy-failure-for-vfs.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
@@ -67,7 +66,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "23.0.2"
+DOCKER_VERSION = "23.0.6"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-for-vfs.patch b/recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-for-vfs.patch
deleted file mode 100644
index b657cafd..00000000
--- a/recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-for-vfs.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From f0dbd4eaf1416074bc8845063f4b6fb285bf75bd Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 27 Apr 2023 00:42:19 -0700
-Subject: [PATCH] Allow for xattr copy failure for vfs
-
-vfs is declared to work with any filesystem, but after
-https://github.com/moby/moby/commit/31f654a704f61768828d5950a13f30bb493d1239
-it's no longer working with NFS.
-
-As the extended attribute support depends on filesystem and
-if we do copy it in vfs and do not allow failure, that would
-essentially mean that vfs does NOT support all filesystems but
-only those that support xattr.
-
-So we should just try to copy security.capabilities and allow
-for failure. In this way, vfs come back to the state of
-being able to run on any filesystem as declared in
-https://docs.docker.com/storage/storagedriver/select-storage-driver/.
-
-Fixes https://github.com/moby/moby/issues/45417
-
-Upstream-Status: Submitted [https://github.com/moby/moby/pull/45420]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- daemon/graphdriver/copy/copy.go       | 6 ++++--
- daemon/graphdriver/copy/copy_test.go  | 4 ++--
- daemon/graphdriver/overlay/overlay.go | 4 ++--
- daemon/graphdriver/vfs/copy_linux.go  | 2 +-
- 4 files changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/daemon/graphdriver/copy/copy.go b/daemon/graphdriver/copy/copy.go
-index 0fb8a1a9d9..f6a5b74af5 100644
---- a/daemon/graphdriver/copy/copy.go
-+++ b/daemon/graphdriver/copy/copy.go
-@@ -116,7 +116,7 @@ type dirMtimeInfo struct {
- //
- // The copyOpaqueXattrs controls if "trusted.overlay.opaque" xattrs are copied.
- // Passing false disables copying "trusted.overlay.opaque" xattrs.
--func DirCopy(srcDir, dstDir string, copyMode Mode, copyOpaqueXattrs bool) error {
-+func DirCopy(srcDir, dstDir string, copyMode Mode, copyOpaqueXattrs bool, allowXattrFailure bool) error {
- 	copyWithFileRange := true
- 	copyWithFileClone := true
- 
-@@ -210,7 +210,9 @@ func DirCopy(srcDir, dstDir string, copyMode Mode, copyOpaqueXattrs bool) error
- 		}
- 
- 		if err := copyXattr(srcPath, dstPath, "security.capability"); err != nil {
--			return err
-+			if !allowXattrFailure {
-+				return err
-+			}
- 		}
- 
- 		if copyOpaqueXattrs {
-diff --git a/daemon/graphdriver/copy/copy_test.go b/daemon/graphdriver/copy/copy_test.go
-index 8dcd8d9d56..340c715f5f 100644
---- a/daemon/graphdriver/copy/copy_test.go
-+++ b/daemon/graphdriver/copy/copy_test.go
-@@ -40,7 +40,7 @@ func TestCopyDir(t *testing.T) {
- 	assert.NilError(t, err)
- 	defer os.RemoveAll(dstDir)
- 
--	assert.Check(t, DirCopy(srcDir, dstDir, Content, false))
-+	assert.Check(t, DirCopy(srcDir, dstDir, Content, false, true))
- 	assert.NilError(t, filepath.Walk(srcDir, func(srcPath string, f os.FileInfo, err error) error {
- 		if err != nil {
- 			return err
-@@ -146,7 +146,7 @@ func TestCopyHardlink(t *testing.T) {
- 	assert.NilError(t, os.WriteFile(srcFile1, []byte{}, 0777))
- 	assert.NilError(t, os.Link(srcFile1, srcFile2))
- 
--	assert.Check(t, DirCopy(srcDir, dstDir, Content, false))
-+	assert.Check(t, DirCopy(srcDir, dstDir, Content, false, true))
- 
- 	assert.NilError(t, unix.Stat(srcFile1, &srcFile1FileInfo))
- 	assert.NilError(t, unix.Stat(srcFile2, &srcFile2FileInfo))
-diff --git a/daemon/graphdriver/overlay/overlay.go b/daemon/graphdriver/overlay/overlay.go
-index 2ed53d82e9..909478963e 100644
---- a/daemon/graphdriver/overlay/overlay.go
-+++ b/daemon/graphdriver/overlay/overlay.go
-@@ -320,7 +320,7 @@ func (d *Driver) Create(id, parent string, opts *graphdriver.CreateOpts) (retErr
- 		return err
- 	}
- 
--	return copy.DirCopy(parentUpperDir, upperDir, copy.Content, true)
-+	return copy.DirCopy(parentUpperDir, upperDir, copy.Content, true, false)
- }
- 
- func (d *Driver) dir(id string) string {
-@@ -460,7 +460,7 @@ func (d *Driver) ApplyDiff(id string, parent string, diff io.Reader) (size int64
- 		}
- 	}()
- 
--	if err = copy.DirCopy(parentRootDir, tmpRootDir, copy.Hardlink, true); err != nil {
-+	if err = copy.DirCopy(parentRootDir, tmpRootDir, copy.Hardlink, true, false); err != nil {
- 		return 0, err
- 	}
- 
-diff --git a/daemon/graphdriver/vfs/copy_linux.go b/daemon/graphdriver/vfs/copy_linux.go
-index 7276b3837f..592825c1a5 100644
---- a/daemon/graphdriver/vfs/copy_linux.go
-+++ b/daemon/graphdriver/vfs/copy_linux.go
-@@ -3,5 +3,5 @@ package vfs // import "github.com/docker/docker/daemon/graphdriver/vfs"
- import "github.com/docker/docker/daemon/graphdriver/copy"
- 
- func dirCopy(srcDir, dstDir string) error {
--	return copy.DirCopy(srcDir, dstDir, copy.Content, false)
-+	return copy.DirCopy(srcDir, dstDir, copy.Content, false, true)
- }
--- 
-2.40.0
-
-- 
2.40.0


