Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E16C05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 04:54:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6492.1676868881923189322
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Feb 2023 20:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oPspIigq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14150b1c1b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K4jmoV012246
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Feb 2023 20:54:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=jIPO/mM5t6oUuVDFQVL7qGyXskRinC9l+eaKaVLVAq4=;
 b=oPspIigqZnErKMq3z9PWYb13Q60h89jhNqnNor4MXdnOiq4HUFCtm+FjXy8LFI8SJarC
 zh+ynq+M6aX5paav69pjeEdy7NQ/oZrKe76l0yNq1XXsCBxKP1WAuYW6d7ICi5nhYsuD
 lxom6IU3jrdzbWxrfG+UmgOVUgIgTpUZmePRwKUtIfRp+7h6u8x6+6wxxJXJu+KSrTst
 K1ycPX6weKp6j1mGhmXZTWa01n+R6R8vBYsRPQ9dMBfWP1jPtBJLgkHYvBaDYgJCDrxz
 jKttTdAVsXljaWRJwR1EMTwzTw8vFhMjaZLieV+FS3djZGgbibFZJsk/vg/5XYTpHRC+ iw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6s9dr-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Feb 2023 20:54:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwq82uxNCM/liRY0OETkxhHRpyLDUPrkC7eahEPLwqlx9CNyh/QdfFmOQDujRDhYUkc8+qcZVC4C3tpH3964W3FooRq7T7o7EOHeWnvVgLADr6OC2KyzJDa1xSFGRnv0Fu2GgB37pPyZWSrwg1rKU2FGIZoEqLvp5ZIFgqB/ILIx+scswpEV4LQlTZmoh1BZgUW28ahrbX4J4m4rFERff4e8eK115mYlHiUFFueK6AEHvtx5MODQl3ZaXxIKdfdXgvqh5xRBaNAnP/n81MBJdjwNaoNLdPmZITU2Kb4LNJ8Sly9WXuiU6cPufbV30IXRwgLcRHEdjIhR5dFZZeOP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIPO/mM5t6oUuVDFQVL7qGyXskRinC9l+eaKaVLVAq4=;
 b=eXGZadvhkY26XBWIsUV9OGkG1wwd36O931nqJiphEpUO5ImHyVezj5A/k64i7Fptp+g9Fo1Ypx62vaW6dOOnZor2dD0bEM7VPVsSbP+vpKKoKP2ajEGqad0MCIz1QpzCmQ5kbvcIHGKY5jolte4UGyVTL8anQKa+6mXcTww+lSDf0hfWw2os+hg2zBm0SXWP9n3dUAGZ/h3YT+bj7hDtwUu7SNb4e/BjDrkqeQ+ha0SLxL+IQ0Eq4sqKal01d0shT1h/GuP1b/I0/fqTdb1MbOIaaItioqKUyJPRS0ulEJ5weou9YD3WrWadtV4zbBz9Lk6lO17hKmds0mhlpGZ4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 04:54:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Mon, 20 Feb 2023
 04:54:37 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master-next][PATCH 2/3] container-host-config: provide /etc/containers/policy.json
Date: Sun, 19 Feb 2023 20:54:22 -0800
Message-Id: <20230220045423.84802-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230220045423.84802-1-Qi.Chen@windriver.com>
References: <20230220045423.84802-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 85666a80-bc3d-42bf-b252-08db12fe90fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8+0lFMekrc8PsTYy+kLr5ejw5hsqQtDHmKAQJQUSicIczE6ePFT5I8T0FSuebW22fzGYU/aoeCxjzliubC8154r2LbWxUYT4L/6ODrBFuenfke1UuVxcJsaO4nvYT36+TofBspSAZckbsEIkP4NYc9czaTau9YTZeGRdt7bXuNgfWrvIxGjc5XHkRysczoA2uyniy5qNiDgKfePLZlv342zs1Qbrhi36voJcPhvwXvEaqSKoEF+9/mRsvPGS4jWdUzjGQ4LLN++1o6Mf+3nhZTweFAdHokhq31ayx7yPip8U9QfktsuinMZaJm/5ZyIckR++y7Lpei81z8/TRcSVlENgOFx4AtTTwzf9luDgjJYgXQY/isouZDFA05wi8WbIWj37KzoScrR530o+NxfMwXF8HtNtJbt6yOexOqgSRD4qpC2n7JLBchOosOiiq+OE7/Hp5KnHkzJJEKQuzihCczTJdNUSMNFsfTbrpG2/rdF8LpHj/O5AcpZosFtMiNO03sOEs8g2vaHYKFw8bhlK8yqNtWGZKtEuGyHQeetVPgkfaDdHI3g8ehjvqB/TYFG9605XJaVbB9zhxkmX2+8WuhLgBqrFEdqsrMjjnsR/cHldVNspVeUY+fwDRyFfGXU55Z/KA7KcQxJIo32fFp1pG1+FV40lN6+0Zy8vxWXDM56yIY4m41ZJpW+9d2Wooqro
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(39850400004)(366004)(376002)(451199018)(8676002)(6916009)(66946007)(66556008)(66476007)(6486002)(316002)(52116002)(966005)(8936002)(5660300002)(41300700001)(86362001)(36756003)(478600001)(6666004)(38350700002)(38100700002)(6512007)(6506007)(1076003)(26005)(186003)(2616005)(2906002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ITiJqWPM9S3QDtQYIWx02eZhPdFAMjxVXXZ/YSYJIM8HNyr95Th1qyOKASdM?=
 =?us-ascii?Q?aFk6oyOd0XD6aaTqFy5ZjtRCEw4M6L0faYksN3Kmkpq7/9UhMsCBxnzVv+g0?=
 =?us-ascii?Q?rL6HB484auiY3H/layn05kpxqcnp8geL3/WstCgQGQ2rInc/yoeOws92RVyg?=
 =?us-ascii?Q?reIazLlD0OEMxEMpi9LLggT3LcS1wyViYcad+75VYxDbKB8NQDu/GGZXcTi9?=
 =?us-ascii?Q?DyiYnSOoB3QyLS6phaWucMZJxNt0jWHHakfrPMD9RbzfRMpQx8sUZ2WTcEAT?=
 =?us-ascii?Q?Y8+fpZf3k1ntcuSKK3FdlZXlXkdLx7ErliTnpIFlKP8belw2BNZB4Ag+DEfV?=
 =?us-ascii?Q?22tT4g64mj0/yKjbTIdCq6AKSweT9v8rmYkNaL9NAPyPeQSk9wYrUFbBi4+3?=
 =?us-ascii?Q?jN82bQBckE5cguZqUv8qjnQYxlko5y2ozlI4E5Nb4DfqB6IwlPlwnTR04koP?=
 =?us-ascii?Q?HV60bHZGhGAFeB8p2VGK2VjhgXC1er3UGop55V8q54OVG+WD9YkO58yPX2uF?=
 =?us-ascii?Q?GzUiVcnF6g/en0crlGksP4FHWX51ubBzMGAU3Vp22lP3/ItMWBvs0iTrGP0O?=
 =?us-ascii?Q?jgveVvCljZbz7YS4/OH+1K7the9nANRoEtKcIEsNhYsooofCW7+lfCj9oZK5?=
 =?us-ascii?Q?xLTcyfIzGLLAlYs1WLpWeiHCPXDKMso6XmSUREkgMzzND3pGeHDVgCaXeuA8?=
 =?us-ascii?Q?vAHOqu+h7CfSZfhHBoHFCT4DmZOLSISEfEGqM3KdgOv2YPC8pGHkT4oT0g5t?=
 =?us-ascii?Q?TAOYFG77pIuDsx8hnKhcQq1bFZsBG3VHdSyNB6fxVQPNB3yRzcoYN81n9eUa?=
 =?us-ascii?Q?0QZNzx64ujjXxfqa/k+PpyZeFKlXUX70jPi3fU5uOIsZWmGZvWUoAVSiOnQG?=
 =?us-ascii?Q?hmx9UQSozDDRqjwiQRadTMeWqsZL1qH8oav+ngPEGKjzi08hfwtMw7vEr0cx?=
 =?us-ascii?Q?YkT9SJF7/e4SD54SpjbiAUByDd0jWh6LlwjUO4IvlN/9Wl65STwpTP+LDvFc?=
 =?us-ascii?Q?g8xwO7dTfyAz4nX3QAlarnR4e2j5f+++3p8MhksLKoqhcObO8xwR3lTIqUHo?=
 =?us-ascii?Q?Dw98HRcjnryRD0SXrRQZPb9nfudSQyMd8PiI/feBTkbIt0ddkeWJJIQGG1AH?=
 =?us-ascii?Q?GxyRMYku3foxnxxfTuOFsBoU8XHcj6US/4kthSUkYyniVNTMMhAFxPCL4h5I?=
 =?us-ascii?Q?cSxv6mzrGXDDpkxl+d6cOswrsBUacv+cKloGXqsn9rjlziAMRQ5gWeqV5Q/7?=
 =?us-ascii?Q?phVUy7Nw965tEKpqdnetW38JE0qdYv338TLVJ/yUrqxhsFF3BRgtXq0OVle+?=
 =?us-ascii?Q?oze69qBOhrHFCrFDDHmQJ0tj83G0wEh8oUxIH7//ARjKnc5BfanQ/Ac1TwIf?=
 =?us-ascii?Q?xxheAEme6vaXr5C1i0hV9+L5nuJKhjUVhnBu+zwrYGqjRgyRPlcQ9jmtiu+S?=
 =?us-ascii?Q?hwZ3DGEvl71UVwl3i98NsVbVdUKkNT9uwSe6sezeQXXkY6hWy64fQRURGQ+m?=
 =?us-ascii?Q?mNRbJ9NPubiIlwGkBVOcyPxUNkr5KIdIyYmGA4G+vNKtAF6jDoJcZ8ohKO/L?=
 =?us-ascii?Q?3Rg4L4mqvU/WqgDWtw4Z+m7KhBZyJC0nW56g5c9/0rXSRj3w/9R+CVBKAcZw?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85666a80-bc3d-42bf-b252-08db12fe90fd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 04:54:36.7545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jumHXY6kw0/ZCZ1pM5TuP0Usob3mG9YFuHR+mI6DnCrrnA6DoAqVulxt2aHXdZvTNWSIOBMRVnkMcBphMlXEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-Proofpoint-ORIG-GUID: D62T2hZh0iKecQvneRPY03k9mHm_Iq5g
X-Proofpoint-GUID: D62T2hZh0iKecQvneRPY03k9mHm_Iq5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_02,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200044
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Feb 2023 04:54:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7883

The /etc/containers/policy.json[1] file is used to specify verification
policy. For now, we can see it's used by both cri-o and skopeo. To avoid
conflict, we use container-host-config to provide this file and make both
skopeo and cri-o depend on it.

[1] https://github.com/containers/image/blob/main/docs/containers-policy.json.5.md

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../container-host-config/container-host-config.bb         | 2 ++
 .../container-host-config/policy.json                      | 7 +++++++
 recipes-containers/cri-o/cri-o_git.bb                      | 1 +
 recipes-containers/skopeo/skopeo_git.bb                    | 1 -
 4 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100755 recipes-containers/container-host-config/container-host-config/policy.json

diff --git a/recipes-containers/container-host-config/container-host-config.bb b/recipes-containers/container-host-config/container-host-config.bb
index c762dea..c2f17bf 100644
--- a/recipes-containers/container-host-config/container-host-config.bb
+++ b/recipes-containers/container-host-config/container-host-config.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 SRC_URI = " \
     file://storage.conf \
     file://registries.conf \
+    file://policy.json \
 "
 
 do_install() {
@@ -15,4 +16,5 @@ do_install() {
 
 	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
 	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
+	install ${WORKDIR}/policy.json ${D}/${sysconfdir}/containers/policy.json
 }
diff --git a/recipes-containers/container-host-config/container-host-config/policy.json b/recipes-containers/container-host-config/container-host-config/policy.json
new file mode 100755
index 0000000..bb26e57
--- /dev/null
+++ b/recipes-containers/container-host-config/container-host-config/policy.json
@@ -0,0 +1,7 @@
+{
+    "default": [
+        {
+            "type": "insecureAcceptAnything"
+        }
+    ]
+}
diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 9467cf1..2ae3303 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -57,6 +57,7 @@ inherit systemd
 inherit go
 inherit goarch
 inherit pkgconfig
+inherit container-host
 
 EXTRA_OEMAKE="BUILDTAGS=''"
 
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 66168ca..4d062ed 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -82,7 +82,6 @@ do_install() {
 	install -d ${D}/${sysconfdir}/containers
 
 	install ${S}/src/import/bin/skopeo ${D}/${sbindir}/
-	install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
 }
 
 do_install:append:class-native() {
-- 
2.37.1


