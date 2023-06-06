Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828B4C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 07:47:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3442.1686037677107101180
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 00:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QjuZfvQt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5521525cda=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3567gVds017020
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 6 Jun 2023 00:47:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=6ZaDkRN2a2WeFjNR1J81eXC2I31Lgyu8LapDhIwEP/8=;
 b=QjuZfvQtNVuigHn2mIvbrhdjDygEvTsA6Cg1mabpXL8RTPItfAf0/UTNhTiuXtalSTpq
 BCT7ip7JJ4EryhnKKSti44+ARJIKdG04cA7IbJBljWlo8c0oG/c5xNfeDjuaxKGAlo0t
 1GQF2jyjylat+aUw9tT6A87qdRGZyY/FLJL99T1/WqU8z60BjpYBl9sALrEFlwx0v8jl
 XPZ0ULAxghtET/GQD7m2bxCBQdREQ1Qo8aaI6/sive/TqTmigb5Zxo92n/vnwYcAnmlW
 MPoxNoPzS4ICvgNBlI2bZ03jaHwtnJeH5Etm/rUsoetinVWBAviY3mFUB1lHWBfVbZHn Fg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r051j9ym7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 00:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsSNiuxvcFx6NmaIUTJag+3jjU99ni7J1AiGC+itExm4A7EXDrAQmmOOwWBJG6NSbck40/kJnLrqe9Sf3rrya6m5xTK4xRaOtehPgVJ5bLMQfMUa3l4sgQnqvc8lnHY1W+AXFveuHb6yMJNtepSqqBFpATPtGk1qGoBiDoEDwEV1+CeSb9fYcxJ9+2uTDqJCoRlJwEkj+zOR8dWIFdRvBxoBsTFQits516BAEomnJi8g5pyFX/I05EAvbi4uizgBJhaKDwuUsCCwcr757Bo4tupGQRAKkYwzc1Ms1DKbUMf0vsU7wzYs2/xf8EF9eKo7bf0oZkeb8VMHHdt+OSyleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZaDkRN2a2WeFjNR1J81eXC2I31Lgyu8LapDhIwEP/8=;
 b=ddZfzR6IBC+nFGu6EF4S7zSmBiHbQCKMfzOnSde92Malj9j+a9P7QPVrJ1otKzkHbD8AyXmjdDgvpv4QlQKcYK2xusp4QUj3u7+O8Sq+9m4uXYoFC/qtFEFPfYzcY7kFLZZgGQA2Hb4aRYvrJg4b42hRirBdZym77scwghlpl3SDJlyQAINWzZtLtx4mDDxN7RgAbp5WZPEFHO14ed4uV0Fozk4AsXhi6iqvrjEqXFHxifjv3WiOEzGdw7afA9iT8kLmX9KtRS1xthMd6gSKvzzeNJ8LRY5qptk5WCZgU0VOaOLb1xx3lECXxkgki8G4lyY/Yfj63VWG3oJ44mbgPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 07:47:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 07:47:54 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][mickledore][PATCH] docker: upgrade to 23.0.6
Date: Tue,  6 Jun 2023 00:47:44 -0700
Message-Id: <20230606074744.2270710-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0040.namprd17.prod.outlook.com
 (2603:10b6:a03:167::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: d26725fa-11fd-4f43-95ca-08db66625615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LnmzQZXYOBbafei4bETDe+vE5G1dxP1T1PDJ8d6CZ7E+LAVse1Eb5UsQ02/jArwda4TMvdaYSxnKx7BpJD91civUhiQHVd4I2DhFGKqeXL8dMH1eCNTIeoE9KEgwzwukMEw038PoIiD/bGXRK7lAsQLgcnEK00uvyQyFrVucAKgyAIG6xqP0qD/OP7bTs6yJhgcfNTAPU40MzUuSRel/BWS9IhNMJ+9tlLgOYQDdxxJMVmi6YXdIOjqYAVmhV9ghoZXL/k+b0I62oC7CVja6vlmN0G+P7A6l5baot9XfFDElr1L1bDufteOaVmtFIe+4/CIlxnEjTfJ+i3RqzsjbdFdS2zhqWmaBREyoRolZpZbFtcA0xThgVUg04mwVOF3x6Is9YoglwO1PmbwUm8joDxiLD5PV+i6nQR2b2a8smpbALLPJztH3aDApp4o6HJPJKa3Ip1JQVYu8EyvShYo+YhiWz8eUXs2ENneK9WUdlvG783iu0Y2KpCRa07LJX+1TtGLZlQSZjQ3CZbX6OlX0qRkx6jfVPKVS6mwHxqQZfAS0SZCtOMiVFgylpfXAxvBVkLlEWKYgpEa1PnNonIkdYZNnIwlpV72/s587cz+I3xmDZeVSouUlx/lppP88Bb+0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(39850400004)(376002)(366004)(451199021)(6512007)(9686003)(1076003)(6506007)(26005)(36756003)(83380400001)(86362001)(38350700002)(38100700002)(186003)(2616005)(41300700001)(2906002)(478600001)(66946007)(66476007)(8676002)(8936002)(6916009)(316002)(5660300002)(6486002)(52116002)(66556008)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Wj2Mw+ajw8ZOj9AapmuJRuQHfenQVDLPXI85ZjmqY5W/8C7O/u78kNKTiwNO?=
 =?us-ascii?Q?MrE2mWXcTFBPvX6oj0zyvbI0trtCi2sy9ISoGUDOeOFeKKsmvX4BssGiP6tv?=
 =?us-ascii?Q?8TuXE52AypseBLE65uY7p6/nYsHf5vQjMxDDHibJY5Pj5mJ8yGK5vOT1pVX6?=
 =?us-ascii?Q?HSqRzfygruxduvo5UhlUup5j2XjztGTrkoDTW28X4QU/iowEbqGyeKhgjzZi?=
 =?us-ascii?Q?BspCwbnsoQ+VQzP5B1I9k9A/tnkYF760CSIm7XT53lXCNiZGskXHdBnhhlvr?=
 =?us-ascii?Q?mVBqUyceInJ9bpZk3DEHC+vs4wJvLdLleU9Tmvpo/Ppi9OKGf1MSM3Aq0Qv+?=
 =?us-ascii?Q?jyk1/B7t2YP8xQVNlot+KlO/7JRLWa7opWnTXhGoode5wFDEihdzW0XsTG8y?=
 =?us-ascii?Q?DvTy8ay/8yOy9TuD7LGKgAl5lkKnAwUyCLB0pzwKohWSe/Uz5ZEnhA6lSwLR?=
 =?us-ascii?Q?EdmBOkJ0W/w6jNrCGFtj4Niwxnz2JwFGBc7CYUWbYenGgef5+SvcFbCFm+0C?=
 =?us-ascii?Q?ub7ZjpBPqkjNe71wo3xW4PM1kEzsfHSZFbOdCXZlu8dalNKez0NdsUB8KjLv?=
 =?us-ascii?Q?dQzoffTVbUv38nsNRBcnViKi82DuG27GLNX+FdxsUsC88UGVAfhroYG4A7OG?=
 =?us-ascii?Q?az1536CYb4+BXlbmGp3Bg0QqiFReVt7bufFWHxgoE1DtPYNmDanjRfCyUEv1?=
 =?us-ascii?Q?4oHwh5LEK3lBEKznKAiO3/nSjka0TcQjhTf9YKgA3ue1g81KdKo8f/Xvr0gI?=
 =?us-ascii?Q?SFytWNt/z04uhS+7OALYMNf/06J3p44orqK6MQ8KXkWEA2YBbAhA+0lgqDaQ?=
 =?us-ascii?Q?7l17yfMS1V6Zu3z7Duy01zORMv+COVHJJFE7dwziO0rSMzlNQMfKL5Hcuxkd?=
 =?us-ascii?Q?HEwo0bcKqyWfY42hLvyDo7QW6mrrUny0sOgWH+hn42b+KwNGCvLCfNnCDZzu?=
 =?us-ascii?Q?7ehHJu4dertwyruzrQGHdPDRPXEIHCUITP5qVGNDTxe6bYGSYMu4dbMCxgQR?=
 =?us-ascii?Q?TYysEhQTBEmWFYylGD4chTW9vqvRpAwUpnGDIbsKlfXI6WpokSUOo/QYHZkZ?=
 =?us-ascii?Q?zmipa++ShywUB/YIp5BM4h6r00dq4FmMEYj77pAPICglks15RpjY5HikqGNy?=
 =?us-ascii?Q?On7pTBTDXzdwTfyiSRtWXuOI77zuYAOL1EicC3cjYudpaJeqCa7F8nlCjRgX?=
 =?us-ascii?Q?hnQ/bRtrHHduKAKipnyfAh/BsmxzXjiZikCgnrIrL1mmjDgGEmysxMj8UZ/A?=
 =?us-ascii?Q?G63xfHMBbe2iidgeykzpPRv3ThJ6ARv4xO46zICSmgLp1SVtFu7l+8k7jxsm?=
 =?us-ascii?Q?um6I6CUVc263nBGjHh3I3mcyNLlc5uHI4N+tAMFUYIl+KHucVOCvdvzPsJ6A?=
 =?us-ascii?Q?aYeBRhWqmixNTMHSIQqhgej1Xo/vMSWfmuWcC2vigzI7p74f673B1KHFjF8Q?=
 =?us-ascii?Q?eX5dSqqQ39Z8yYonwWSVztdWXpCLrImma/a3JdPLfoLAKqVgukGoIuA/jFgt?=
 =?us-ascii?Q?j/Z+EpcMelWTttrF/W4PPg+SdKLr+8AQx+nLCgeJ8s/6/c4fP5RCMt1r4AiE?=
 =?us-ascii?Q?TaYb0/KLo/QKm7LzgLv7q5QdsZhnJKcZU20fM2toF8I3TSoScuQZFVbJ0BTQ?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d26725fa-11fd-4f43-95ca-08db66625615
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 07:47:54.1088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tde1RcAYimm4O0aE5v9M/Dj0uXsuTqYU36J1VDfuHl3UWLpIaIi9UahkY1jUiAcW22ZIb64OZ74eUQJuhZ/1JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
X-Proofpoint-ORIG-GUID: PQF4ee-MQrYlQF3m_DCi8XepKX9G4vD4
X-Proofpoint-GUID: PQF4ee-MQrYlQF3m_DCi8XepKX9G4vD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_04,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=743 adultscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060067
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 07:47:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8091

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker/docker-ce_git.bb   | 6 +++---
 recipes-containers/docker/docker-moby_git.bb | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 6781c778..ea5468fb 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -31,9 +31,9 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_docker = "219f21bf07502b447095649b5a2764661737f164"
+SRCREV_docker = "9dbdbd4b6d7681bd18c897a6ba0376073c2a72ff"
 SRCREV_libnetwork = "25ec449c45d2075c85fb3688ef4c1730be0466e0"
-SRCREV_cli = "569dd73db13099a7c3104d73aa15117b359045bc"
+SRCREV_cli = "ef23cbc4315ae76c744e02d687c09548ede461bd"
 SRCREV_FORMAT = "docker_libnetwork"
 SRC_URI = "\
 	git://github.com/docker/docker.git;branch=23.0;name=docker;protocol=https \
@@ -53,7 +53,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "23.0.2-ce"
+DOCKER_VERSION = "23.0.6-ce"
 PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index cd6a7419..e6a813bd 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -34,9 +34,9 @@ DESCRIPTION = "Linux container runtime \
 #   - The common components of this recipe and docker-ce do need to be moved
 #     to a docker.inc recipe
 
-SRCREV_moby = "219f21bf07502b447095649b5a2764661737f164"
+SRCREV_moby = "9dbdbd4b6d7681bd18c897a6ba0376073c2a72ff"
 SRCREV_libnetwork = "25ec449c45d2075c85fb3688ef4c1730be0466e0"
-SRCREV_cli = "569dd73db13099a7c3104d73aa15117b359045bc"
+SRCREV_cli = "ef23cbc4315ae76c744e02d687c09548ede461bd"
 SRCREV_FORMAT = "moby_libnetwork"
 SRC_URI = "\
 	git://github.com/moby/moby.git;branch=23.0;name=moby;protocol=https \
@@ -56,7 +56,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "23.0.2"
+DOCKER_VERSION = "23.0.6"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
-- 
2.40.0


