Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F50DEB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 06:44:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2279.1687761882982105011
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 25 Jun 2023 23:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=An99vXJD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5541ef15b8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35Q5s1Vc027714
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 06:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=5a/ZU/bjuG0TfwuQ8xnykVPWm+uHPqdyfMsuqQ6RL28=; b=
	An99vXJDOGDLVrhvsgmmRJC0/mJN4ZwUf/O28yWqzS6I/oe46HeddzLtjTrmHaTG
	UKZ6cT+oxylYuX1HHjZVtvTnv45asuc3tFa7LmtRig30mDXqkyhYFvBNZtL8UJ9J
	g6l8MPlQAGutKs+UtpWQz/l5t2o7vURMHK0mSZ5VE2TZYIPI01RIOgZWikVK0YQ0
	ZUsdCke15s9wR+zctu0XZbns8vSra+nw8shxFeuu3Ba68WVugk8fBxPOek/0ioRJ
	aQ6BeNv4BZGxQTE5QqXg7TOaLKUAuTQAeHpE1vD/vE/NNadvxcCAdqZdo3u0XaKZ
	lxGqRp3h/rL0O40pVdIJYA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb1gaf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 06:44:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mdi8TCP7D5/ycvg0DvjqAdfi+oj+ENDQBtTVT7Jmm6b8KdUx4rimVCcgyp9PsC54uJp7x8bKOjlcqevECsVmf5xd2qG9DUVr1g2jQZF3TOU7+gBJ5SScYw3KogY1jDzzLBvpZniuAt1reNI23sluwv+M7TKbPExmcgpG1hagWPIJ7h2N6IEcKV0r8CTjNEhggsMuZrl+9oyA6ymoMrQi0mjKM89ufHKOtKLI2vKWudrQSv1L2HhK91Qksk9CgS/x7HpOs3lI0VVxOrWiLQBdAbMAMWyzfbpyplwYhOi/LoGBX12P2Kz1i79VwNbdzjNDh3U4PuFZdr9R9cMuIMcmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5a/ZU/bjuG0TfwuQ8xnykVPWm+uHPqdyfMsuqQ6RL28=;
 b=HVaFZrIg+RvXQN9oc6h4L0V4/Z0ZrhSSTu50GJD3OpAh60OBC533y2yGQfdD0ydsMtvUmVM/98/KzKEVrrPbmPZTcKxNSNBTG9JBYlweMX3BWWLFpOrPcazhN6h8xC8/xW7dbBfcl06cSs1rNbM+FU3Nb51uQa0kjVEfDIwEBDQ3LsH1O29AQNTg7CegFPmXf4L2Es0vj/a4EWkyy0inzuQOPwLrtux/ywlIJDw6Xk5df/hI/xZEZN8ZWqPOd1kwuq+fbEwxwcInuvfCHK/V87e4TQKxlA2lcaT7dKDZIgPTqWzBmLhkeKwG8ZOKTlJLh0OXlUAEVX8wp8ixkwqMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7711.namprd11.prod.outlook.com (2603:10b6:510:291::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 06:44:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 06:44:38 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/2] meta-virt: rename containerd-opencontainers to containerd
Date: Mon, 26 Jun 2023 14:44:20 +0800
Message-Id: <20230626064420.1012760-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626064420.1012760-1-Qi.Chen@windriver.com>
References: <20230626064420.1012760-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: afc3cdfe-1802-4713-11f8-08db7610cf74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	42Lk953QNWAkFTFqCdmWQHa+4jPAmk01l4WrqCEQECaF3R05sYmHJIX1Jk+2ZHCpWmBH5aTDB0dwQTlELhLnx3StwUzdVJO35AzWc+eg67EtlohJlTf0GpLshp15t5iU+8lACXKrBZnRj0da7w+auFTNN9yc1NjG4joawUlQxeoqa1VFFucvw31VWXUKE4a0SWbTG1i4EWrk9anpWCiSNLSKHYrKLufDbinJkZXJq7csgFCjRnudCujHYd3RF5yr1pisFcgUJCxsdvE5exHX3bQoajUgMKN/PjRYPOk9OHI6DxUIZW39DpvZjBdy2eQplPpB0sbRHUpgZZqEPNjxUTxUmbqHfCm7xeiAZ5aJqx8+SGv0V2Jdhf5R87sEYQvJiA1ySFADjwKvsLeO02XsdKxiXq1MJ1b7hFA9yjGYWCQcej7gbZaQvgPx6mmHirNqj85KpIYRlfyAjGRFBn3v5iwP4uDgqsE/WrYdVxxsr/UrC9GHaZFbDsXDq0/AnuQHRCM49j4eXvKB8BPFyjqoo3MN/j3m5sXzpL8ae0lmQbnigIkVHSAA3bx/QwJNNC8lynm1ru/kBkvgclD0XMYO20V0WIOzhtUOUZIJ/WH++gYnlEJmGg1pTJcFjqB4zvEq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(39840400004)(136003)(346002)(451199021)(26005)(36756003)(5660300002)(6916009)(8936002)(66556008)(8676002)(41300700001)(86362001)(66476007)(38350700002)(38100700002)(316002)(66946007)(6506007)(2906002)(6512007)(1076003)(6486002)(9686003)(186003)(6666004)(52116002)(478600001)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bz1ixfBardha66/d09s6MP8G4Iqhhktaxk0YIvZ5vq+gSQ1jvjyuffpf2g3L?=
 =?us-ascii?Q?GZpyT/X2lhre3oVbCWTwuSOXXkp7kmE4wxktrLxKD++GM85svotbO0e2CYvm?=
 =?us-ascii?Q?YRuIgJ3qeisTtrph4Na7nxyWCne+CqdmuA+lU9ERSqUtB5lbeEK89DJv7J+Q?=
 =?us-ascii?Q?nkA705Pw4WvdCy6eKI57M/5cxPBcqoPowt1wKz+2Au1K1y+2FxQkxJvW/K35?=
 =?us-ascii?Q?+jXjQHEYvRLw6Zc3g5J+uti4xpSwSLB03JGqzmbCkoj6W1YcDjiSyM4k7thq?=
 =?us-ascii?Q?mvbF8Ew06Pz0Jz9ClaRYvnF52RjL8fBF0/P7JSXfT+CzhcrOZFmKffgDB/3L?=
 =?us-ascii?Q?+x7SY4SjLOQNnv2UKY20tblXFSHaMi51h4xGPwn7jZpr6JTuYEYUoFV9Rw4B?=
 =?us-ascii?Q?ikaqA1+NE3DM7TV49HSCb3yUB5nx84hMx21X6iXtbv4b1tgIU/QSgljzrFpm?=
 =?us-ascii?Q?AmVRzZxPrz62QX4jvHp32Ru8xll8jIAA3t4vQa9vt/bwZ5Ph/gENYYa+9Mws?=
 =?us-ascii?Q?Wc4GHeImJ7gzr3St2xayoJlAdzyEi5jn+7eQyUxj6brnuZuyFCekRJCLuCfK?=
 =?us-ascii?Q?uvmJaYw1D/6MAAWiYf86HBUgb0kgQM52Gd6MR5FMAny+VJ2DRMlRXlfKLFdd?=
 =?us-ascii?Q?67ch49wK/OC1jhzNA+XYv4YVfcPSld9HvoaruM6l8lncE39S7vBgW2P+lt9R?=
 =?us-ascii?Q?qkuyhKWkvY3WuQALYilerX3tgBCNcs+muvOI62eBeux46WB+IGBc+oBFx6ua?=
 =?us-ascii?Q?KMoiLQCsafGbCnFxmzyKcbcGVYr0IEeNc09ThWclG8U7mvL4bbooJqH+zP+j?=
 =?us-ascii?Q?mjfVcg5zFuWrQMIWdvu5Eb316R2aq9NgFr1Zk2mcRp8Cf8JgDigP7BP3CwDR?=
 =?us-ascii?Q?MQKMro4j4n+26faiOac30ckaeVeodC1tlcwcTM3hL++pIKOVqFPuAiwyJu64?=
 =?us-ascii?Q?ocI3j2PN4fLsGm1R89/HSqRKBYMVC/XZknQqrkL1klDWleQ3P/PKGi22hoVC?=
 =?us-ascii?Q?lY1Zo/38Cr4sFQJ+0Pj7k8djhZWGb4SrktVh3K9aDx0NeFDCsgCIwwu1TcC6?=
 =?us-ascii?Q?ouP8Gf3LW6oI2ZKmzZwc9lYNyoD1Oh4xeeUhR1BG3eQFbaZ0fm1qu3bfSgC9?=
 =?us-ascii?Q?PxaZebi1UrGuSi2ZbbJQViNEomZ5rFXGyUIpUHcJsQUagGTWMfIKb+G3lkh0?=
 =?us-ascii?Q?XnFp9+emp3Fbi6z107igT2gOk5u/raj/Q5j78HfFQY+phLoAvIbK7PWLf0Jh?=
 =?us-ascii?Q?y5bXZx1v6kB8vjjOdToQtXxI9gS08+Jhd3X8oyfOlUiMjwMId8UqP5If6DJV?=
 =?us-ascii?Q?AiFZESr3Mt5N7dXsqY+7gjYEEsDxLWM7ZehgTDoDLY4rxmiX0W+YqKRLUkrv?=
 =?us-ascii?Q?ehH9FSfrdhge/ZwBHJEHcc1LmyKh7/fqu5DMy5w43e28IPIeBIhd/CD07AQq?=
 =?us-ascii?Q?mKoRNzBsk2T9mZ0wfuBAEXp9vxsfhBfMjEDe8z+T3A+CycKanU7x+QvSS4yH?=
 =?us-ascii?Q?hlckCZnZa5Maa4t68X5PmMFspr8t6qpu4vFL9MzRQi5DytrxOZ6kFqxCEEA4?=
 =?us-ascii?Q?7VoFmZfc65bhYyAXsX4Ihu4IjFyU5Tgv2JoDEbbj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc3cdfe-1802-4713-11f8-08db7610cf74
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:44:37.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCQAAuPIeAHIFnaVKckyzolbf1E9TCO94G1xSEBkHYTJJtdv6oQQxFeXW9j0+4kMyhnebweRL+u5Dksob/3kuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7711
X-Proofpoint-ORIG-GUID: 971i4GQHXMXjbNp6kzIgx20iPEixOez_
X-Proofpoint-GUID: 971i4GQHXMXjbNp6kzIgx20iPEixOez_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_04,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=944 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jun 2023 06:44:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8106

From: Chen Qi <Qi.Chen@windriver.com>

We had two containerd recipes, containerd-opencontainers and
containerd-docker. But now we have only one containerd recipe.
We should just use the name 'containerd'.

The previous CVE_PRODUCT setting in containerd-opencontainers
is deleted, as it's no longer needed.

The 'containerd-opencontainers' is added in PROVIDES and RPROVIDES
for backward compatibility.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 conf/layer.conf                                             | 2 +-
 ...kefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch | 0
 .../0001-build-don-t-use-gcflags-to-define-trimpath.patch   | 0
 .../{containerd-opencontainers_git.bb => containerd_git.bb} | 6 ++----
 4 files changed, 3 insertions(+), 5 deletions(-)
 rename recipes-containers/containerd/{containerd-opencontainers => containerd}/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch (100%)
 rename recipes-containers/containerd/{containerd-opencontainers => containerd}/0001-build-don-t-use-gcflags-to-define-trimpath.patch (100%)
 rename recipes-containers/containerd/{containerd-opencontainers_git.bb => containerd_git.bb} (96%)

diff --git a/conf/layer.conf b/conf/layer.conf
index 9ff61f1..cbd75f5 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -40,7 +40,7 @@ LAYERRECOMMENDS_virtualization-layer = " \
 require conf/distro/include/virt_security_flags.inc
 
 PREFERRED_PROVIDER_virtual/runc ?= "runc-opencontainers"
-PREFERRED_PROVIDER_virtual/containerd ?= "containerd-opencontainers"
+PREFERRED_PROVIDER_virtual/containerd ?= "containerd"
 PREFERRED_PROVIDER_virtual/docker ?= "docker-moby"
 
 # Sanity check for meta-virtualization layer.
diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch b/recipes-containers/containerd/containerd/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
similarity index 100%
rename from recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
rename to recipes-containers/containerd/containerd/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch b/recipes-containers/containerd/containerd/0001-build-don-t-use-gcflags-to-define-trimpath.patch
similarity index 100%
rename from recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch
rename to recipes-containers/containerd/containerd/0001-build-don-t-use-gcflags-to-define-trimpath.patch
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd_git.bb
similarity index 96%
rename from recipes-containers/containerd/containerd-opencontainers_git.bb
rename to recipes-containers/containerd/containerd_git.bb
index c804caa..ab41a6c 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -20,8 +20,8 @@ CVE_VERSION = "v1.7.1"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-PROVIDES += "virtual/containerd"
-RPROVIDES:${PN} = "virtual-containerd"
+PROVIDES += "virtual/containerd containerd-opencontainers"
+RPROVIDES:${PN} = "virtual-containerd containerd-opencontainers"
 
 S = "${WORKDIR}/git/src/github.com/containerd/containerd"
 
@@ -99,5 +99,3 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
 COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
 
 RDEPENDS:${BPN} += " ${VIRTUAL-RUNTIME_container_runtime}"
-
-CVE_PRODUCT = "containerd"
-- 
2.34.1


