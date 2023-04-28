Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4904AC77B7C
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 01:45:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9856.1682646353230352867
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 18:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ELjm8tGp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3482c0b599=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33S1d2Dh005692
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 01:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=96tIu9VmcSi61K/IX4ozHGccTWmgIK3qNO65nKKJYB4=;
 b=ELjm8tGpaEQrIvjopJKczwMp+FtChvkB337sjpc5E8qI33G8eEU0ZctqSuQvZmC/csAM
 uoQ5hvXr63A9ECgTKrbiXZVjpG4SSccj3n7OXmk/+4o5ku3dfAcJBgLptyCWmtxaQeLl
 wguVDAbC/tP6gyJhh4aI5Tp7ORCoFJjDRCkdvWMYISnttUDuE047mjQujtjdPrhWF9lt
 /JBwa6JwlkYyvW17NmB1HgOcPjXxrm6qEJ4N7R3wVKJ0hg7nPxo3eVh1S+N9hZgbGj20
 HdM37iXMpzHONA0EphSFBM+l1B553vY419Vvqn0TDYW54UmqHktWOzfz+9Q7TgOeOqDM dA== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q44t3xbc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 01:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUt32FXTEFyd2WZ3RMCGTafNYxlIUkh0u93A11bSeP7xA3k/N/EHTIvRA74y3mO1w78b8eAfkDg8+mzc743pRgFMbqzwZHSA1kzXfPakI/Z/nSs/pmt4NI3Bt8daKtDxqeWj1ZaF+xj0zcIecexZ9abCxNMW0dhnDXni4GVJEReLzVtafiLrwYCdKk3uruV8gck0iXJwkx+8sVPKpkSrfjGbF+yLlEbzJO2e8BhDjEtG7TTttgIubK2rtQxQ05/nWovMsSerkzmA0cHW39Al+L+9SmZaClhkw/7qCSG2yTsqlh0pyo5pa6+MWqOjv99DHjr8a5v8+4ptNAZA3FptyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96tIu9VmcSi61K/IX4ozHGccTWmgIK3qNO65nKKJYB4=;
 b=aP2hT0yt9nDahffezxlj+lc5pq/tQ009Vy1/6/gNWaupAIEmnlT0JSnEc9ucgHd8eSjT1cK+SlIPqAB9lAfu2wCYR06dWeITwObI2UnQwFxkckxAoaQUl0HNl/gXCwUYnU/yQvOb4NaYzJjq1GyIfKf3/WOit4ug6a1Dr7usPdj4tjOcfpFfAaFaPQlskttfkTBVrBhJCuwcTfcAnU0kH/KHMdHktkTuqiImLsX0uC+n3aP30IAjWrkZgSIpnYuZFPhtjwlPe+OG73hNbaFM+bWwXzauj7a1Lzd6u+lk5CpVkrxSZh2nne3nCJOAFVclnkQz+so5E8pmghRUFsrl4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB8355.namprd11.prod.outlook.com (2603:10b6:208:480::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 01:45:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 01:45:49 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/2] docker-moby: fix docker run on NFS
Date: Thu, 27 Apr 2023 18:45:34 -0700
Message-Id: <20230428014534.2376049-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428014534.2376049-1-Qi.Chen@windriver.com>
References: <20230428014534.2376049-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a2033b-fdc0-45b1-c120-08db478a4a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nOegQ5YY3j0SsNFfLaRd7+YOdqu/YpZmC6qqmS0xdmVUt2BjcJ+NAlJZJLzc3lhjAhFIuQYCdBxeJoI0TuUiohpUXABDcWJlI79VsR9bcSgnX05Z1PVs331JDtaNdv8YV5VZBPL0GMkhlV51t5jmm1i2DTV2cPM3TZgI6tw0xkSMa9GibhMn3Y0+WGc7CDyaoY/BKeRvRpI2Jz+0reDXYuxnBJQNOeurEHQFcJIPQEu1hV0Waxwmc96fBebDWCu2s11KUrZRRgWv3N0ltNVMtMbcq7Oa/GvSkJ01uXBe1apoFBtnVHpaOqyHPVyaarCLG2C0dwuV7vHcytM5Bs2fX3CcnoW7vbyqPwKaxfoQtCzjMA6p1Yuf4FVnPDNsDQDCdgCTbJsuQPW17gVy9yztcTuYw6IjC8bNY/VLXr7AIUkWVz3gjnq5iCzKZDyougOFx5jmPcsXG9P50panGHktf1L8KuezdqxtxusGtBZsoaIuiah3LQPyxnkiLeWOLFcKgq7quFC2Rx6HjywkMY7177AQQZJjp2a5zW4gGqDix1oFE/3I8bnWszVcWvJ2cznCtUHRFBbbo+61ukPYYFKGyOzyBkBbvS9OnRHtEIg/ILNWkOFoX2WN0XMgnLSwcOuk40nUjwd+u3MBbeYRw4tp7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(451199021)(26005)(1076003)(6506007)(6512007)(86362001)(186003)(478600001)(5660300002)(966005)(8936002)(8676002)(6666004)(52116002)(6486002)(36756003)(2906002)(41300700001)(66946007)(9686003)(316002)(38350700002)(38100700002)(66476007)(66556008)(6916009)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PRrxWPXxATMflFpfmbbYEwqDu8lpfAbRh+w9lC5r0sN0RopRFhh9HIOCzc6y?=
 =?us-ascii?Q?Tt1i1niQRoAKVkzvSqDAsaJkb5UKww4TZARIMkwPl3cPtlb2Tq4lfDEq8M49?=
 =?us-ascii?Q?1xfiH3pzK7KIduz6hX5IZaEeprITaHaKbcqX9XTsuQFfpydZw4P47pIAVdKb?=
 =?us-ascii?Q?SFgYndV/m/sc8wczVsfQMaO308pPi/LkrQvVqCexNNdM3/zfZoCXY9OJkeBN?=
 =?us-ascii?Q?gqyowla9ToTtJvkxv8Bt8/rsiuHyU4ydgkagqP2yT2UON7ao+GV7jCgxE6Tq?=
 =?us-ascii?Q?tSqPW9i4sP+thBLCBIdR2+KGjweJw4RMjpmKflq+Crz1bdmlpz0JgHq36cz+?=
 =?us-ascii?Q?oq3FVR1Sr9aciii5vU1U6Y82almmDwH8WFgBb1LP7enVjtlstHMwt96uJJ3V?=
 =?us-ascii?Q?8IFtcKo+tBNyl3R85tLCwGVPRUkb7mKddk2fjrmiQgX5l2fIjxpdUXkOvFun?=
 =?us-ascii?Q?eJKCP7pO05wM64O2V8Pi+MxLrWmrDk5e3POnVPwLfZcni9+v68iSA+s5ymfN?=
 =?us-ascii?Q?0wkCa4RWNrv2QKwt5Z3z+HhhFOEI8rMi+5kuds70Jd5kdpmGO1q2un8Bzeh2?=
 =?us-ascii?Q?watVUzi1iR2eBrkRQYxdMsj67+eYD8pYxBuqWlAzS9owp/lOx22EzhwNRrZL?=
 =?us-ascii?Q?/4kmi2samVClULOyTChLbNnYTgoh1tW4zfpYc7+hiST9z/TW7USZBD2BzaAo?=
 =?us-ascii?Q?4FHDVS2L/p+2lcAkyC/W0QPJ+IvXz2c95h0ZQdiyoCuRu/F2qZiKDwTjG7+Q?=
 =?us-ascii?Q?fxa7ZPeQRATyXVeeys7u9bknqlfz1gRvsakRQ9McWwGUR+d9JO5Rvh69Aeq5?=
 =?us-ascii?Q?x7aFX3GcM7ex+ifWrUOUE/VMjIlYBiVrxsWolo4e2AHVkwn7QTxQkPSf1rGB?=
 =?us-ascii?Q?TMR2H9tIX1pviWrSvb5bOaRo0YeF1acEf5RaPt2cWmJU0RxbH1HnAohLHsvb?=
 =?us-ascii?Q?90LZNkhZHDRIDO/ByqWUJrXYxyGWM4KC3kfsfky1ajGtdb0mcefp18N/z9Q9?=
 =?us-ascii?Q?Mbu/9cZ2xhJtT/tSxb1KkdjoWQSlfBTGYhsdb+LmiD0r4ITC1TsHlU2AVcR5?=
 =?us-ascii?Q?teZ51f38AmqJL/6Zn23pxbbbjhjnPcSyJKD1TN4HRksyBYTIXI++bbP8pTQR?=
 =?us-ascii?Q?ZA5KYiRtjo/gJFtqiD8MuHjWb6n4XPmSXBvIPSuvndu//1BV/lNTwh/zlznE?=
 =?us-ascii?Q?vyUElnTAdNdCXYyZf291oqv1Qe0yAuYshsHomFGCPI/lppaPt8KX8NhumHnL?=
 =?us-ascii?Q?IvVnaR616oJuAP/pmMF/baP2BodCnS+XMGojuAiCyrDOPzVf3Ucvj4Yd5Ag+?=
 =?us-ascii?Q?uLyG/IVNDw2CGCJ5bnPBv3SdNde+lHPbSZ3gSA+hJgiDLEcbJmtGxfhmZOOU?=
 =?us-ascii?Q?ru1IC8hXLzPoCwZJTIsSXkwN2EkCDudSeQLfUbtSYhnmQyFCr0LAw+VLoIPs?=
 =?us-ascii?Q?sfBPTqyfnJqxbV61PLNdGzZhh0i6jOHdMtovKPQwL/s20lasOfSSIQNC7t8G?=
 =?us-ascii?Q?1uolYNthEip4NZSzyu6FGEWvI9aZFZOQNDQAZlhpy5t3kSbY4LMLSqFsTSLe?=
 =?us-ascii?Q?ipqVEOk+39hg3uM8LsBUnurlEiCwArBJ+aw64CjtccV4RJcfQY//hzwqm/cU?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a2033b-fdc0-45b1-c120-08db478a4a5e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 01:45:48.3676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAHyuUyhsCViy2i3ENuANpIAILa1akhz411JWBxKKogvM85rdND78X4WRLLYPqtGRJxAYuxx2NZJLg/H8Y446w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8355
X-Proofpoint-GUID: 4ok9h7r4Bi5_P6qRJ9nkH5CHUDS_yN0T
X-Proofpoint-ORIG-GUID: 4ok9h7r4Bi5_P6qRJ9nkH5CHUDS_yN0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_01,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280011
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 01:45:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8013

From: Chen Qi <Qi.Chen@windriver.com>

For now, a simple `docker run -it alpine' fails on NFS.
This regression was introduced by a commit[1] which makes
DirCopy error out if failing to copy xattr.

As the vfs storage driver is supposed to just work on
any filesystem[2], we need to allow its failure on copying
extended attributes as the support for xattr depends on
filesystem.

[1] https://github.com/moby/moby/commit/31f654a704f61768828d5950a13f30bb493d1239
[2] https://docs.docker.com/storage/storagedriver/select-storage-driver/

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   1 +
 ...Allow-for-xattr-copy-failure-for-vfs.patch | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-for-vfs.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 94c72e7..1bc758a 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -43,6 +43,7 @@ SRC_URI = "\
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
+        file://0001-Allow-for-xattr-copy-failure-for-vfs.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-for-vfs.patch b/recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-for-vfs.patch
new file mode 100644
index 0000000..b657caf
--- /dev/null
+++ b/recipes-containers/docker/files/0001-Allow-for-xattr-copy-failure-for-vfs.patch
@@ -0,0 +1,113 @@
+From f0dbd4eaf1416074bc8845063f4b6fb285bf75bd Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 27 Apr 2023 00:42:19 -0700
+Subject: [PATCH] Allow for xattr copy failure for vfs
+
+vfs is declared to work with any filesystem, but after
+https://github.com/moby/moby/commit/31f654a704f61768828d5950a13f30bb493d1239
+it's no longer working with NFS.
+
+As the extended attribute support depends on filesystem and
+if we do copy it in vfs and do not allow failure, that would
+essentially mean that vfs does NOT support all filesystems but
+only those that support xattr.
+
+So we should just try to copy security.capabilities and allow
+for failure. In this way, vfs come back to the state of
+being able to run on any filesystem as declared in
+https://docs.docker.com/storage/storagedriver/select-storage-driver/.
+
+Fixes https://github.com/moby/moby/issues/45417
+
+Upstream-Status: Submitted [https://github.com/moby/moby/pull/45420]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ daemon/graphdriver/copy/copy.go       | 6 ++++--
+ daemon/graphdriver/copy/copy_test.go  | 4 ++--
+ daemon/graphdriver/overlay/overlay.go | 4 ++--
+ daemon/graphdriver/vfs/copy_linux.go  | 2 +-
+ 4 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/daemon/graphdriver/copy/copy.go b/daemon/graphdriver/copy/copy.go
+index 0fb8a1a9d9..f6a5b74af5 100644
+--- a/daemon/graphdriver/copy/copy.go
++++ b/daemon/graphdriver/copy/copy.go
+@@ -116,7 +116,7 @@ type dirMtimeInfo struct {
+ //
+ // The copyOpaqueXattrs controls if "trusted.overlay.opaque" xattrs are copied.
+ // Passing false disables copying "trusted.overlay.opaque" xattrs.
+-func DirCopy(srcDir, dstDir string, copyMode Mode, copyOpaqueXattrs bool) error {
++func DirCopy(srcDir, dstDir string, copyMode Mode, copyOpaqueXattrs bool, allowXattrFailure bool) error {
+ 	copyWithFileRange := true
+ 	copyWithFileClone := true
+ 
+@@ -210,7 +210,9 @@ func DirCopy(srcDir, dstDir string, copyMode Mode, copyOpaqueXattrs bool) error
+ 		}
+ 
+ 		if err := copyXattr(srcPath, dstPath, "security.capability"); err != nil {
+-			return err
++			if !allowXattrFailure {
++				return err
++			}
+ 		}
+ 
+ 		if copyOpaqueXattrs {
+diff --git a/daemon/graphdriver/copy/copy_test.go b/daemon/graphdriver/copy/copy_test.go
+index 8dcd8d9d56..340c715f5f 100644
+--- a/daemon/graphdriver/copy/copy_test.go
++++ b/daemon/graphdriver/copy/copy_test.go
+@@ -40,7 +40,7 @@ func TestCopyDir(t *testing.T) {
+ 	assert.NilError(t, err)
+ 	defer os.RemoveAll(dstDir)
+ 
+-	assert.Check(t, DirCopy(srcDir, dstDir, Content, false))
++	assert.Check(t, DirCopy(srcDir, dstDir, Content, false, true))
+ 	assert.NilError(t, filepath.Walk(srcDir, func(srcPath string, f os.FileInfo, err error) error {
+ 		if err != nil {
+ 			return err
+@@ -146,7 +146,7 @@ func TestCopyHardlink(t *testing.T) {
+ 	assert.NilError(t, os.WriteFile(srcFile1, []byte{}, 0777))
+ 	assert.NilError(t, os.Link(srcFile1, srcFile2))
+ 
+-	assert.Check(t, DirCopy(srcDir, dstDir, Content, false))
++	assert.Check(t, DirCopy(srcDir, dstDir, Content, false, true))
+ 
+ 	assert.NilError(t, unix.Stat(srcFile1, &srcFile1FileInfo))
+ 	assert.NilError(t, unix.Stat(srcFile2, &srcFile2FileInfo))
+diff --git a/daemon/graphdriver/overlay/overlay.go b/daemon/graphdriver/overlay/overlay.go
+index 2ed53d82e9..909478963e 100644
+--- a/daemon/graphdriver/overlay/overlay.go
++++ b/daemon/graphdriver/overlay/overlay.go
+@@ -320,7 +320,7 @@ func (d *Driver) Create(id, parent string, opts *graphdriver.CreateOpts) (retErr
+ 		return err
+ 	}
+ 
+-	return copy.DirCopy(parentUpperDir, upperDir, copy.Content, true)
++	return copy.DirCopy(parentUpperDir, upperDir, copy.Content, true, false)
+ }
+ 
+ func (d *Driver) dir(id string) string {
+@@ -460,7 +460,7 @@ func (d *Driver) ApplyDiff(id string, parent string, diff io.Reader) (size int64
+ 		}
+ 	}()
+ 
+-	if err = copy.DirCopy(parentRootDir, tmpRootDir, copy.Hardlink, true); err != nil {
++	if err = copy.DirCopy(parentRootDir, tmpRootDir, copy.Hardlink, true, false); err != nil {
+ 		return 0, err
+ 	}
+ 
+diff --git a/daemon/graphdriver/vfs/copy_linux.go b/daemon/graphdriver/vfs/copy_linux.go
+index 7276b3837f..592825c1a5 100644
+--- a/daemon/graphdriver/vfs/copy_linux.go
++++ b/daemon/graphdriver/vfs/copy_linux.go
+@@ -3,5 +3,5 @@ package vfs // import "github.com/docker/docker/daemon/graphdriver/vfs"
+ import "github.com/docker/docker/daemon/graphdriver/copy"
+ 
+ func dirCopy(srcDir, dstDir string) error {
+-	return copy.DirCopy(srcDir, dstDir, copy.Content, false)
++	return copy.DirCopy(srcDir, dstDir, copy.Content, false, true)
+ }
+-- 
+2.40.0
+
-- 
2.40.0


