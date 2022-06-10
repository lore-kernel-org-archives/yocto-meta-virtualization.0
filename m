Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA32C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 04:21:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22987.1654834869736848226
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 21:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qBxGEcGR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31600aeb41=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25A41bII025481
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 04:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=jW+NBfBbhfjeNCg7hDaX2WVuJv7xONULDkmz8ZE41EY=;
 b=qBxGEcGR8hxn/dC3Jq3/fpL4VgdTMdH+Brb2CVZZ1xWn29g5xte29Po/mz+/m6MB+bMf
 +X5fm6xYvO8QrUhRIgaay+mSYj2g3sZTzabo63dCDbAY0aCpCCQz28FY2eTYFg//FzbL
 X/IOxJyJ1ofukYkP0r/1Mg1OCY7pdoRI6fwz3uHSsfDUkiIdjXfFMPTmcHttuZKHAgrK
 Uxo4cd51xDIgCESq8HRDjZloFyxQX7jkS6mYSr2VsgBtuiov9fqCp9W1CxYtZan+wb3V
 kfsWttcYFr5ZupUWMZNXOJ6Fddtcl3GJD5ytslZluUObJ9C0bPa8EBxDlRhA5YO2zgcD DQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gkuvb02vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jun 2022 04:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCQsAH0aEVHfX9AxysYCsjnGsvONo7Z1EKaRKRJ5MgLm5HoDyBDqdQ0lWAx2oDdjyUx97XX/AVnOpGTGntbilQXw8gYSefuoLq+sQ58SvXlTio4800Mkq9KLArzM+rm9I9DIL1r+QrTyGgPTnuDNCPBvnOtkrA1LOKq90EXCvkoLc4UgsXJVWsWyR6mPWArnd+xDC/TDMR3S6EPt7MDZC4ngDoQkNmxsrpTp9yXp5ZXRCtyOb0Yp/T38KoOGPlgSaEpJ1Oc60Gt3rCbyTeLMVj7VmJ55r7mmmaoSEVy5yCDuA+kxBLY5LTgeZ+aerNdave5RN00sZ8hnk+9SsoUH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW+NBfBbhfjeNCg7hDaX2WVuJv7xONULDkmz8ZE41EY=;
 b=lARWrmh+Xe/Y/+54CKA8pxcZ8MjP4RQuojEzfpXU8pStze+j4xzwfSjeLIdHNu3h1vvNA+/hBxCDdAviGD68FeVafn60i++HAll2qZm1Hs/hN43vuGKsPynH8j0xJx6Zm7S7m5GX50kD2CvF+SQqpdKt/Z/wWZEE+LQGlHRizsbY1xzN54LAQYQesw+msEjweApzS7hrO8nszeLiLsE1CPuA4YqbxpayB/kwasR+sHNAsAFe3x/uvXlZidDDQVWIiiOALvCAOYZDF2VPF62w4BXPyOtqDz6LzbEzoLucJt59qCLJ+jXWdaptOhxe6Hp2Mo9OyTYT/GviC1Qsqm/jzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4652.namprd11.prod.outlook.com (2603:10b6:303:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 04:21:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::38d5:6ff6:8771:8e8%5]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 04:21:06 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][kirkstone][PATCH 2/3]
  docker-distribution: fix build error on new hosts
Date: Thu,  9 Jun 2022 21:20:52 -0700
Message-Id: <20220610042053.4051-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220610042053.4051-1-Qi.Chen@windriver.com>
References: <20220610042053.4051-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dac7da1d-0cab-4aac-f931-08da4a98a2c0
X-MS-TrafficTypeDiagnostic: MW3PR11MB4652:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4652EFE2BA0F9B2FE6DE43C9EDA69@MW3PR11MB4652.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FcxS6VxX5A70j3y5J6x6WO9Z6pHVBOglsnoKaqq/KQNgHlONltT9/KJ64pjMcw/Z6/ZviyVSJi1bgeM2zoaD3Rp07BkjNTDR3SwMNEZS+F0op+INZKE8Tz9wnQa4WC0oN72AqpLIvBN98KluKktnpaTuLQbWYnXrPdqcsI9EtT76KWnuPh39Q/t+ri9QNqoT4nonf1mM+0sQ0PsPoqanlkUy/50Gua2St66lSHW4tyAtQu6SncpGZt38a7xlB0twKavSWS0dvUX41FBIUvCrcns/uHnj1jjIysxPimlXJqibp30MwtD4Ox9m28fMAO5L5IOF0rb3ECOm6p5yrJV4S36t1reb0c/eFd/ZRFQgyPcujsgV1gkQUTVhxuArgyq5L+nwOueTU7UadG+v/56DVDqN7p5VSwyABhYCJAzTF150v9g5EywY/DvbATAOxFQcBF6lHrEl5wo2QtQLxVXpAfkiuHne0eh8gtnOUMqSAkLsCPguyyQ/pumYJsxqa8okVUg8VQpJa/FQ8tZy0v3St2K8xHjSUWkpXYPb786bEwntqGFUy9ykMOrlVKaivXHgwtAJv5HK1xVZeopaPDlkks2YwS+XOrsO31QztGALE5QL7FsjiR+DaD8OA7DoScxPOc826cXeVLWiUnOVeKRUCAsOMlr9q5p5ldw+/p4EF8rrX7Du1FUYsVSAK6NZSWvGf1BhE60G1MGZtWwWcauRYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(83380400001)(2906002)(66476007)(66946007)(66556008)(6486002)(5660300002)(8676002)(36756003)(26005)(6666004)(6512007)(86362001)(6506007)(52116002)(508600001)(2616005)(1076003)(6916009)(186003)(8936002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6GnytExDSOM7GUnC5CahYkeEIcbr2ZaMiKQzqz3GEMB449V0BFzSYB84ufrt?=
 =?us-ascii?Q?i4LrEODujNwDLQTYwGkAKyXsKNy8eJIWye4VQdA9vajilDu2DfYAAUsJd7EO?=
 =?us-ascii?Q?i0jDKWDPaOlDxIeP6b9iupKZ7eUq7nqrzrUtYk4/xdatGajx8zYv5ZlyBt0Z?=
 =?us-ascii?Q?vYNhzzbLjnHeEDkOKujPMUyZzxUQgqD4i5HcA2uMf3rM/q1uBdcfG4b6TCgW?=
 =?us-ascii?Q?Oi6K0WAs/p6UPCumVzf/CxuxM+VvbbPb7+f9V7AljY5oV0HJaY9b6J3z3Yiq?=
 =?us-ascii?Q?i9hWJWT1XTOPxUohFB0aep6ziJcOQxpXD87d+6qwMfekpYpRTQ/wZvnSPAio?=
 =?us-ascii?Q?yPy1+pVIGYy8/z3gDBDP68NTuqWbg7VxLular/brDPs6F6jI717C1CO7j12Y?=
 =?us-ascii?Q?A4y8CcAtm6P8q7kMpNTla2pWJ1iQAmyg0h0xF8n0FCY+BBNkHHLf63Nz0i11?=
 =?us-ascii?Q?8aeped9o7OYKuNrL2gFi6aeUu8vuLlwrNpGE4ruU9/CkIQ0ZXeIPHnQN2vSJ?=
 =?us-ascii?Q?ZVoTMXBR5hYoqB55hm5wBaeu5/efLu/EaE02HyaLAUwjotyZXj5oU7wCecji?=
 =?us-ascii?Q?DioXCBJmN/08u/c5FSpxxPz+Tfor726EuVl4KJGIWr5C5WFYR/1xr2yILKKp?=
 =?us-ascii?Q?o65a3VfzBf0ehTwlUcYxqfLezvyPwUs8YqEe+l9saXfIEQB27k2+EZ3C4IdR?=
 =?us-ascii?Q?c/1HP9IyDE/yrxTApZQMURIyDrS1qwRa/9TQTrTo4JQKCFwUnlLUeWE8cyWt?=
 =?us-ascii?Q?S3IrVPT4YJduY7oVBWotJ6qek2NBAURYEd6f+vSLFbN7jVM3zvuCC4OTQjy+?=
 =?us-ascii?Q?7HwrPQsXMFcm8mbvd5xIMo6pXk40fzbaMFvXHZfm/z5qBPa8ihnMXEgwbSTO?=
 =?us-ascii?Q?fDOOkjPYt7HTyaxTCIB8IhhFi8D8E9UxP9dyAcocFaty7LefDBmQdnGTjwJx?=
 =?us-ascii?Q?+0PXj6fCU+lAlSkjU3swldkOJAwR5Uv65s/M9iwk6P/pbUqxdZiqYNbB3Bav?=
 =?us-ascii?Q?nSsh3X7qjppchYhwcD2YL+VcmTl1hnu1AMBlpvkSdxiheYLx7rg4ywg3b/Ng?=
 =?us-ascii?Q?Muc7dCBxF13ez4TunUL19eiFmYkI9BedrycE0SXvXMAuXfithaZn3uaQ3ZQS?=
 =?us-ascii?Q?aCjBif1o882qGd1rAYdnX4n8E8DGngN/+6Qvw2bAb8u8uQc2fb6qGJY6WOoB?=
 =?us-ascii?Q?ZuLBYtSXFBpyhdEsxy3L22e5GXS2MWd1nXUNSuEhV5zuC7HSlOHcmdSsaihq?=
 =?us-ascii?Q?1jNz07PiUWkPupCq1cyuy/zr6SC6MV2Al5xr3Xt8P6iTg4qzQRYEQpBZUuY1?=
 =?us-ascii?Q?teefNX3HntuK2eopaBxQAlj9LeI6F3A+tQQn0bN/EBnw/F9qTQe0sJeSFeaN?=
 =?us-ascii?Q?dGDZVq5dR8plTI6MF+oAiOYtQpgojZ38Cz1fXpXkZITIgK/yxWU/eZZrkCLV?=
 =?us-ascii?Q?lWydNV/uFzlH73pAMWZqkXEdog3KwKO9M/GUatPUtRJD1YyDtM0+h/7RXAMe?=
 =?us-ascii?Q?oK1FEs+sBjJRtIMPu3r4o/I/A9iSmPXpiEimBMkstM6UEX1Ai501zsO8FmEx?=
 =?us-ascii?Q?kR00+lxrlrIfM1ncmqNsnxOy1uuktVDXHDJmseqeBo9cEnj7Y46jQFct88Ek?=
 =?us-ascii?Q?EDeRAe6o53OxRPcG9dI9DUVA2lQ9EJgdQk6B5+emTwSnWMdx2sNUT7eh0d8P?=
 =?us-ascii?Q?3Hq8L0bdSWKQoeuBYpYVJAfA9QAm40CW2Fcwlq8Mr+h1jNVtQhZYAszDtYfN?=
 =?us-ascii?Q?9roTQd6onNd215+R/aH2lWkAWvX3ws0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dac7da1d-0cab-4aac-f931-08da4a98a2c0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 04:21:05.8935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VbvKWnxmrzpup6QO6MPiXk/Na7geQQmZXqvoO/lagoy8wnZJkpEA+h5vjJUoPwWpmM4fgUnsUMFJueTQ2aOrbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4652
X-Proofpoint-GUID: -FgHO9XpXEadQM8UAEgoMVUQVbTXw55p
X-Proofpoint-ORIG-GUID: -FgHO9XpXEadQM8UAEgoMVUQVbTXw55p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_01,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206100013
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jun 2022 04:21:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7356

The CGO_CFLAGS and other related variables have already been set
appropriately by the go.bbclass in oe-core. Setting them in this
recipe is not only unncessary but also error prone.

For example CGO_CFLAGS is set to use BUILDSDK_CFLAGS, and this is
incorrect. We need target flags instead of SDK related flags. Such
setting happens to work for some hosts. However, when building on
newer hosts, we get QA error like below:

  ERROR: docker-distribution-v2.7.1-r0 do_package_qa:
  QA Issue: /usr/sbin/registry contained in package docker-registry requires
  libc.so.6(GLIBC_2.34)(64bit), but no providers found in RDEPENDS_docker-registry? [file-rdeps]

The above error was found on hardknott on host Fedora 35.
Tracking down the error and I found it's using host stuff which is likely
to be caused by using incorrect CGO_CFLAGS. As the master branch is
using the same settings, it has the same issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../docker-distribution/docker-distribution_git.bb       | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index 1d074bf3..679bcf8b 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -23,17 +23,8 @@ inherit go systemd
 EXTRA_OEMAKE="BUILDTAGS=''"
 
 do_compile() {
-	export GOARCH="${TARGET_GOARCH}"
 	export GOPATH="${WORKDIR}/git/"
-	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
-	# Pass the needed cflags/ldflags so that cgo
-	# can find the needed headers files and libraries
-	export CGO_ENABLED="1"
-	export CFLAGS=""
-	export LDFLAGS=""
-	export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export GO_GCFLAGS=""
-	export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export GO111MODULE=off
 
 	cd ${S}
-- 
2.36.0


