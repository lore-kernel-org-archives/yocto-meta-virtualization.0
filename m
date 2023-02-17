Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EDBC636D6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 09:20:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3074.1676625634408055257
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 01:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hBROgjNo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H7H0jB004145
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 09:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=klh9ebE5AbjsviHuuHMtslMskxbhmfOE96yYStaotIA=;
 b=hBROgjNofeGg1x5kqFQo1oUaXl8Ak8MoKVBqJfWrt8mgnqM4dZl6PblHhHvfB5RjOksP
 EGKMGJHn7Qng0LtefEhOK2Og0sLjG0h5vZcT2GW32paGNpEzyV1B6SWF1aNzKqCOF3/c
 a0b2pVNJdBLJDRtjVGuJ1qMfGm9920O0ZqufFdEGI8En219i/i142ZA14FpXRogSvURc
 I+0q/YYaWQr2xQFTjS4bOnuakF7moCdQK6QSR02TT5DWQKS3OzcyPlBVjp6dJeT6Aej8
 STe/PKIq0UuLEdhrdi2usXj/ubXkflGzSvS+PLy7v9AiS2uRekhItXFw+dCgeVxMEnDV Sg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsbx41aqr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 09:20:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaQn+vud+SPPNaIWJfoOsPdRv+kACHckVv6mqyrL1gYCXvV5clDGP40P/PxO5rsLtcIWQhEh/6RQMxWD9noxmdYX266F2+kf0DTbgbvv3evTNS86X5GvrKKws1oXoAgEIDAFTBhbuUsHR4l2DAUjQcg2c/HK3h0Cgyp4i8DxCK7PJRUtGps/LqhXhQOv/DVGZHPYtoOI4NwVpDqOTNebNYkxCk7S11/X+8HKNIXFc5oLVWCdvlI/NFVxJvIYERZPlTiBIq9LreiyvQM4yjX1vg54/bCR1crEK0Br3c0/IsMcg/K3q48QfgArIfsz2u4PXPXgK8VaM7TQ0lzMZXkp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klh9ebE5AbjsviHuuHMtslMskxbhmfOE96yYStaotIA=;
 b=K6obaJ0+0/qU7WO+vX8AqPXXdCmcehh6FbOSGsxrWVw8sKTWsnmfMVV5f+ALpHH+harZ/Qh4iCjCE0qMom2Pzb3SC5YqP/u8rmIlkq2VbAdZvkcT8rtLw81IuH2wd+OdQ+gnSJlFgcyOpAQdArAaB+yZyy7TmArmP5QaoTLA4OZmSA2A73a2uR3sGXGqm8o5UWgHOHEkYqCRH7pTPQRbSttAT5PuZQ6u7HyeHvk85la4ZWDoPqGM1d2no8owXIxtJzAvi695TZV+LMIuC6u6h3oObq6mgRGACHlPf8oH2b0zmnG2rQXR9gLI5G37ZsC7ndW01VSAw6jWi/VDW52mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 09:20:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Fri, 17 Feb 2023
 09:20:28 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/2] cri-o: create registries.conf to avoid image inspection error
Date: Fri, 17 Feb 2023 01:20:14 -0800
Message-Id: <20230217092014.3810-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230217092014.3810-1-Qi.Chen@windriver.com>
References: <20230217092014.3810-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db90bac-82b0-4b89-e7b5-08db10c8351a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iP/Om2LSdWLTxXTtNnU0beevhue5CeaXI6pVwNJX9THlbIYJRpmyr58fjs4wU61Yo064ZwR+i00fEcGRcNg+PCl0o+2pwWGLSLd4vEJMPVdLxdOWezMqSXtY4Ki9YmuIWDqOl76ZKRI00TzV7JsoEh5q2FVB/6CWagkKxBCjCVJmmsn6nPRNgDsvJDSGJFTRJ6scwx7pbjTg3GvOg3aJPixAhtmwKY1y9ievuXIj79mJuF0rYCgeIfVyBUbNdIi30A78P0TP9+GyAfjTaTrvgUL0PRxAuIEV9gzEn6r30wFVGdaVlF8ewYcnIG5KbkbEdtAcd5CY8ft1vFkPvGc8j/BTmkEgfDUC6Q3OT4iZ3QSV50bk63cXmIzfvQ5VVhmioLgya5DD/uQIRlE84rPpStPYszEbJSnVT0OS51LPdYT8wPeFZQ9Wt8Q1h44zCofCWt6TDF1kfcuc9EeMGk5ofNa2RbXDzYyiaLTuYmNBtOtY7bjiqYi6DjoYEnkQ6uEPzBqgviKroLDX3Df8taqrpb5dzUkE8HP9FckCX9iH9UgjflMqBbjIntE/Vd30qRQD/y97FdNPuEFhXCcEL/LIKxX8DrucI7RlkCzgvcUp86v2uJ5QrEEIDWWoi5Hx7f/SsOqgC1udy5bLAmTMVQ7anWm6kbO3Y8Nf28kny37bLZbLxCryr8zNd1HU0xMKHMqq8SQ8Kp7nq30x1Sd09rZDNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(451199018)(86362001)(38350700002)(38100700002)(36756003)(5660300002)(8676002)(2906002)(66476007)(6916009)(66946007)(66556008)(8936002)(41300700001)(26005)(186003)(2616005)(6512007)(83380400001)(316002)(6506007)(1076003)(6666004)(52116002)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dpBmtjN/oeIVa8OnaevDEwyTd9b2V6jm90ngORem9UXxZStc+SXl3DHPwPIH?=
 =?us-ascii?Q?wKGTLxACzQk2IirDmVtl2HQ8XTp+7EJNhtrNdWgMM3cm0ymKF1Nz0QdmYsO6?=
 =?us-ascii?Q?wm+jvkn3R/Z9B+kRtI4h/VLqwDCsKygLUHixk3I3PukyhFPtGhgth1JIIf3T?=
 =?us-ascii?Q?tH1xWm9PNNBvXzKcpKQQOhN4jiZ4h9StJgZMO2wkxZC5AIUy8ed7+WQyIEBK?=
 =?us-ascii?Q?ogSDdJu7vEx3wTrRCHsKbjQP3VuzDV87KFW/nnKAzqp+AMSMjCFuHGnjmVIh?=
 =?us-ascii?Q?T1OmZTgJQ9u9dg9tY2zfg5iXMkHRZNm6vcmjShX47B2tYXsMczXkt5kpytOv?=
 =?us-ascii?Q?dOAuEBLm3sERobopJxhIrIOOHkxZEeOCL6jtGT+2vg0dpnF+nSb6V0rxt6Fn?=
 =?us-ascii?Q?tjuIu9uzECZvUiJauFGmjpfc2d1E2bi4ucM5lu2LUWed/k2U7QwO5PRAblCI?=
 =?us-ascii?Q?8eg2L4lIWMGdbREq/BB2RdCkOHA2y9z/xHF286tukSIXOc50AllA60LVUlsb?=
 =?us-ascii?Q?X0ev75gI4RV6S4EDYorH4hjk6w3/1xgaDLVNRfstWD6k8azAZvk8GE4MP+e8?=
 =?us-ascii?Q?WPFF3txtXM0TkRI/zhxuxHJY3biYSb0NZzFQQclydc+0kSn9bM0CZNcMO5NP?=
 =?us-ascii?Q?r/W5sFk0G+eY7V36L0Sn9Rl5xbPnMqaCrk3i3FSoPiHHyf5KtXWY/elr9DeI?=
 =?us-ascii?Q?Ab2sPh3VOTD68vRZIS6ZMunDf5I4Y+gw88eJ3b/35iHy/wzRGv/zl1CVbwdn?=
 =?us-ascii?Q?IBvUaOXig4iLbiRRwIZKVs9d0/wwBCFTXFCaMYQWDDwwpZ6BK3ZkCssvhHcg?=
 =?us-ascii?Q?zfuWTgEMcnvaNDtdKjGLABBnj9gaCMyeADBAixGx6Juc+MqAPwqvL1xIzPXO?=
 =?us-ascii?Q?HyzOGadB93OwSZ0HuiVuUjDx3uU0gFlGOjJUMmhBzDKxIjwILmfHpXLFNluO?=
 =?us-ascii?Q?loB1kQg8ldzQZ50GK0IGnfbTe2R9Dr20+1yZWLb/FtVp4oVO0COUJwvtzsFX?=
 =?us-ascii?Q?hNEJl22eE5qr4k5y8opH60l2TuzFg8zUriDcfAMMdq/gFgKqPgNbhZNUFIob?=
 =?us-ascii?Q?vowb7jW+PCx30FgRlSmoPAqEAAamfPqh0x7MmHI4Aa7EtoW6y0bZhVaqrzTJ?=
 =?us-ascii?Q?xBIsiZKxR8Hu4IGlTQPqAVAGRFLUzl3bHn8y3PWMo1IJ/SbASglFbwBgxU8y?=
 =?us-ascii?Q?EY1qOc/s/Uxs/bYqcy/N/kVmioh1yYjWTVfqcEGrM0V9rH5m3ufoIjD0h22i?=
 =?us-ascii?Q?CiJnlsPrlk2XIBmO57grNIHGzaYpzjeeeM4TDLadX6hnfkoOnJiS7kHtdcT+?=
 =?us-ascii?Q?ZP6Elfxdxzxscq1U9oM+oabN3M3PWxzIrcWKfgnIozqEILU5LDgxLXq+1m06?=
 =?us-ascii?Q?uaft4sUxS2BVCxAPEMbxI0AUF75QIEXzdq4E5muVUDVo1mnoKXQ0jui2oxj1?=
 =?us-ascii?Q?dcyN5Y41B8aI6lLBCi8Tejfehk/svp0BaucVd7tdAak0GGGFIbY3d/X9Yk5h?=
 =?us-ascii?Q?SQIuDTtI73VQS11diCRVYW1Z93H3K95xbzHm2XSBQU4daub3pI8RjIaTb77Z?=
 =?us-ascii?Q?3/N4vwta4lrC/nx6DqTQHVui+WvrSz5lDeAs1NGTQSvfXdKavr69CjoUD6m8?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db90bac-82b0-4b89-e7b5-08db10c8351a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 09:20:27.4765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o36bZuBNQk73FPKvDJQyKme9CAJZAHL9a6K4/LkKVYq9nITBIvWSfMjqnjgWoGv7V1imZcuDMVpx6bBrgzIrGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
X-Proofpoint-ORIG-GUID: Ht7SMY3TxDrbqiYlMRXwDyAkpCUGfQ9-
X-Proofpoint-GUID: Ht7SMY3TxDrbqiYlMRXwDyAkpCUGfQ9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_04,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=998
 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302170082
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 09:20:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7865

When deploying a simple workload using 'kubectl appy -f', we
met the following error.

  Failed to inspect image "ubuntu:latest": rpc error: code = Unknown
  desc = short-name "ubuntu:latest" did not resolve to an alias and
  no containers-registries.conf(5) was found

Create a registries.conf and install it to /etc/containers to fix
this issue. The contents come from test/registries.conf in cri-o
git repo, with test specific alias removed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb          | 2 ++
 recipes-containers/cri-o/files/registries.conf | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 recipes-containers/cri-o/files/registries.conf

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index f69dc0f..6e58b49 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.25;name=cri-o;protocol=https \
 	file://0001-Makefile-force-symlinks.patch \
         file://crio.conf \
+        file://registries.conf \
 	"
 
 # Apache-2.0 for docker
@@ -100,6 +101,7 @@ do_install() {
     install -d ${D}${localstatedir}/lib/crio
     install -d ${D}${sysconfdir}/containers
     install -m 0644 ${S}/src/import/contrib/policy.json ${D}${sysconfdir}/containers
+    install -m 0644 ${WORKDIR}/registries.conf ${D}${sysconfdir}/containers
 }
 
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
diff --git a/recipes-containers/cri-o/files/registries.conf b/recipes-containers/cri-o/files/registries.conf
new file mode 100644
index 0000000..0b929da
--- /dev/null
+++ b/recipes-containers/cri-o/files/registries.conf
@@ -0,0 +1 @@
+unqualified-search-registries = ['quay.io' ,'registry.access.redhat.com', 'registry.fedoraproject.org', 'docker.io']
-- 
2.37.1


