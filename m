Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFBEC67800
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.5431.1650014562678448909
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 02:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ELlMBLTW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1104f3b100=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23F9G16I014252
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 09:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=55nR68Tk7YWysiily49EIB5iQnarIYPOtitIE+315Q0=;
 b=ELlMBLTWCUUEir7De1Dhd58KaHwK7vYXf9uCI7dP8vhpflNbue+TfCjDWgyNUyllpavC
 AwpVbOJ1XPBNckNc50dcOqZbISIWmUOjTbjxOFoYuSStz1S8bILBel0cmxvBnquHZYPY
 bbrV4Qm6k3C2ADOSpQbIxbXpkARfzCxJZoHR+ZN6hNR8jH/MTX1M+sVmtKRVSB3fhgNc
 0x4XNaHx6cn9nE6yX+cb7yHvTjDkxUsFfzVaLjWWkpsSFtcVEWxga+HMyXutPpUd7pi/
 xZ87dWUQV+AyEDHJRS1IPLBR5q7BdvNcPIMSHYYHv5yazcsb8N5/vmCwhYNEDvT//CBU XA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb66evmtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 09:22:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EehcqmQwLF2eu2C9edT6MPtHNNrHRfUFAHwzTJgylYC5bOZclf/6VQm5iEP7741Ky424jhO8VMCaZnAdmGL4TK4Nddq/T7nhDIiOJ8q6jbCMWdJXqrg0mRtwYWLQlxLmlT5UAFBTJeBl+6gZqHqTXqacpIdTLxQXdNtTv4myG4wipZjlNrfKhZzEoLv3w8NLUtLnk+hgjYv14A6Na/j2fbQNStmY59WokNl20EzI/rbw5UfgcwFs4juH5cYP5MSwz61Mri6P/FRyLGdQ96YSyhmRV0r4HiD1R00hJull3IQfW19v8zUWgP3rAK+/ddNbCvlLVkY+uS9UDx5O7dgV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55nR68Tk7YWysiily49EIB5iQnarIYPOtitIE+315Q0=;
 b=A9U/ymgWUPSzS/YpYVCG2W8bPvXn9uw5LpPFMacnjJXx86L8NSubuAoatyu5G+zYT1hqJni3PWcIwn1rG6iDL+nNQ/6tp91mDgZdNy7jgF4Ds5KTyvst8AaxxMLV8mwNdfFBcgVVO8hNxLBrxoKx7NKHLeQt420n0Vws1X3z4sYvgJXZDYTRiE45jjcuXfQ+br/j4szVqM5l1y6XT3o6Y6lMFNAON+WazxHaGcfgH3wOWFX4Ze9yfA1TZiRPfJIFlel8IbmzRF0oPVOknrHVlyVjQ0/PWCKBwj/TT/xUVLiDwHljd4E9byt/HADFzz/RVbsfpLEn90goxD649UWUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MWHPR11MB1728.namprd11.prod.outlook.com (2603:10b6:300:2b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 09:22:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%4]) with mapi id 15.20.5164.018; Fri, 15 Apr 2022
 09:22:39 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH]
  contaicontainerd-opencontainers: bump to v1.4.13
Date: Fri, 15 Apr 2022 02:22:26 -0700
Message-Id: <20220415092226.3819-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2be7d16d-4200-43e2-d0f5-08da1ec17ca8
X-MS-TrafficTypeDiagnostic: MWHPR11MB1728:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB172835B71580F8E801B2CE08EDEE9@MWHPR11MB1728.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dNuTAxsscWbi2RL9wn5+V84ug2wpsjQwBzLQvPHaOO9vyhP0nGybopBkBnezg+ZgFVCAy6AT/EilcsPaM8v7mles/8ljV6OUHr6do4pqe2R8sWpYdGEgVDOYnfVJKtqYcd2PcSzuJk+Ie3q+jiu5oE2BOsvKM1Xv+nLj/UWefXRC34fp+87bIAYynjBSB13y5NKS19wm2yZVs3t51CC19d5D+WfCNCF6ymL5irv9yAZoBpG4tu1kByUlWF62k9bcUpXQsI7HOuh6AueM0n13m1Mxu8/ZTKhABPPaGzPPzS+YgNnzP5cJYqH1+3gxB+Fn4urJpuKPvAqiHdNQkEzhb7CFjqEtWF9uEUYxGQtjhg47ZQL4hj5Dcre7+d6TPpb+NmvYJhhiZincH0g83OO1MOLiRa6Ura5elO2CzYP2gEqhh+GLkz62GtPV5oPapHUuhzASdBLrQ8OogpG4jsnLFE6jsvFD05yJlO6ShBDqteyE7+fwtSh3l7xDVbH1JdFayvjFoWPIdHxnaBgYxdP8g1w0kMvaHXLB8/bx+vYV3FUa1eeWgs+LIwPfnNPcuexyIwtHx3uEuksx+Fx/qSOXLsr58SYpm70PDD120QsqaCNKHlVd00OnuKbgYuEyQ2fKpSNEaSPnb3tdV8th2T+vAasUxebWCbImT9S5zWaKlV9HnKE9bpzm1IPwXiZ2oLIoCfcgPtOD5tKIrsZT9kdkyA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(38350700002)(316002)(5660300002)(8676002)(508600001)(86362001)(6486002)(66556008)(66476007)(2906002)(8936002)(36756003)(66946007)(2616005)(1076003)(83380400001)(6916009)(38100700002)(6512007)(6506007)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x6vkR66LpBRLjzQQcSA6RWO2cu6RQQRChXLzSMWYbeXfeBXjiYdssU6iEOSh?=
 =?us-ascii?Q?7mIqjnpxR6TzCD+noyqHXsrd7PIwfxQ7tx6/mBaz1Abq+q56dQL9bUzS7HfE?=
 =?us-ascii?Q?J+p/rKhIgVTqblCTm6kd8bMae2eGK90pr4LoDrqALVqxM3LBsrYr/Llw/D1V?=
 =?us-ascii?Q?XA+XdeRhucGKmLKKrEwlaovXQAZXHeeGrsFkxT9Ve1ytOJl5KQJkh5JCgs+o?=
 =?us-ascii?Q?oGbZZqgKfnRtvQVbujn+OFfqzpMcxZFbBZqyXALZlLNBK4q87EAtTR35wvlM?=
 =?us-ascii?Q?GPJaiZBkGbD/mX82KWLW8OAyR2EpAZm9mihJmLaXgx6u2PLFQkM3uqd2YCpt?=
 =?us-ascii?Q?1CQwj3nT+V3uQcO7v1EsOsRUBul/2hA5sv5E99zWZf+Ynr/Q2PZ7GfczBIK8?=
 =?us-ascii?Q?pp7UyMm2rvTRelaK0t8V0/So1+l2O/+ECirzelF5WSN2egKeYpr6EF6T612L?=
 =?us-ascii?Q?hSXWE+MFpaDHumn+kvsEsDhwOm1iGBueXiIwv2WCEeMAOkBWlpJ9Ek9CIP6a?=
 =?us-ascii?Q?djVaJfkA8wbi56mNEhZTD0PpxsYb87+XuAK03etQhXFNAksiAIsp+SrsMeHu?=
 =?us-ascii?Q?woLZrR3eYmjsJUi6Pa6ey/OoZeQpIH1lMVYj97nIs0KgUO5xRvONZs8NR9On?=
 =?us-ascii?Q?t0TzWWXABwWKtX1zjqIJvb2qGaTLWByagQSG0+wcQDL2SHa7V4NSs7cNyB0G?=
 =?us-ascii?Q?aIPYGEvoIOXyiCSyjPWk1jUzQsWVLaJLyzdyf8TrMDuyrn2tRB6PwE2RDnOR?=
 =?us-ascii?Q?pSVk86JAPZvJjrSU3KkKJcscVvRCaESyT/T8ei2qQDcFD8dt04uA0fZGEP+6?=
 =?us-ascii?Q?kULhm0GT23txr1oSrdEqZBA5UcFpIFBBJYKsrj46sP/i/GRHxl3mTfIbZVBB?=
 =?us-ascii?Q?1zlxrwSbnNFiPaq7zedMODaxgWzirwc9Hpp/xriH80KtPNIDrkxujcESvqlB?=
 =?us-ascii?Q?V1rF7McIf70E380oVqEwmjvuvpLO8KHLXeyt6cEgXhsAT1zMx66qrxmZ10K3?=
 =?us-ascii?Q?v0hd1x5MUVDCu6x7DFLdIXJwi1TGzPXvuayObxXt2ruajIKz2mtmWZdEux7m?=
 =?us-ascii?Q?NX9wu1Xl1q76o8T7q86s+chEsrQcyxAGHMfRmzmIRnumPWDTSeZvW+Ynv8ZD?=
 =?us-ascii?Q?nszOVZdziHz9repSfJHPdR+VsHuiIRF0mqUvMJcspwCmfgLFaKR5q8OBM6PT?=
 =?us-ascii?Q?flkEBMHqARsVEvXvIO5HBJ3NIGzYJ2jXLsndlKoEio7NTp2P/5vAYDC19wuF?=
 =?us-ascii?Q?e1i72zDlFBuwmGuZ/IVMqcaxkmUlNcEH/ami0Y/HqRWAMVUcZ89qN08wewVZ?=
 =?us-ascii?Q?NGNdfhlMdP1RdEDFkIa43v8I+hRS4ls2hbAgXwpFSMq+WR63UrsF8rvavhHP?=
 =?us-ascii?Q?DuQ7s9TzFMS6zTZp8UiUODXwcl8jyqV4/rEmPDev7XdJbbFUOLSdCVbWmK71?=
 =?us-ascii?Q?WVZZSwVxMO/kualLtP7BxJI/ytprfl9MFB2H8S0ph6RKdvVDWQEVTMDFWOMo?=
 =?us-ascii?Q?MXFHeGpMyY7pUb2RRjl44DbJ+gF4TXMCAXUY9jbqtPkLd80HDou45cSugIN1?=
 =?us-ascii?Q?PLyPWL0Z87VljlmN0L+3C3Lwp5QgciZXzatCfKi0Sq6Cwx3rUK02sB4j/SSf?=
 =?us-ascii?Q?mhj+++X4oWAen+30ND9YR5/TE1S0qpTTTsxcIno0m4UoSoB4/TbFOHi+WPq1?=
 =?us-ascii?Q?ohOuoJF3IdLMkzE8yHhIcqHKhvdb0HPmMZxesewnZw3+vvRZXuF/2XLfRQx2?=
 =?us-ascii?Q?M5E5lfSjBq1Q1Pmnym3Bk8Jtl3QaM9o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2be7d16d-4200-43e2-d0f5-08da1ec17ca8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 09:22:39.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EATlmTfZs3EM4HuAV6XU9tFGlsHgNHco/wAKxTUcX4+K+KDd7O8gXXsiS7I3BSFTUHnurJVPn491j59DZF+L2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1728
X-Proofpoint-GUID: joGsI25ejpMeOwOLkfOugzMSEXePdLRT
X-Proofpoint-ORIG-GUID: joGsI25ejpMeOwOLkfOugzMSEXePdLRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_03,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=850 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204150054
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7178

Bump from v1.4.12 to v.1.4.13, which solves CVE-2022-23648.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../containerd/containerd-opencontainers_git.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 7f6c75d9..40b03163 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "7b11cfaabd73bb80907dd23182b9347b4245eb5d"
+SRCREV = "9cc61520f4cd876b86e77edfeb88fbcd536d1f9d"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
            file://0001-build-use-oe-provided-GO-and-flags.patch \
            file://0001-Add-build-option-GODEBUG-1.patch \
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.4.12"
+CONTAINERD_VERSION = "v1.4.13"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.33.0


