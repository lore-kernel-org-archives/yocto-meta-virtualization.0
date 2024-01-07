Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69F4C47077
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 12:56:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14460.1704632185762796916
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 07 Jan 2024 04:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1736c9399a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 407Cf9L0027140
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 7 Jan 2024 04:56:25 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vf78m8qad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jan 2024 04:56:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNpMUo+pww/QXwajYM3O/VhLddapX2687YauaV44TdvbHEiPjquS4o2bIjPN+UC/+yeE64NT6dLO7Fdw9ueVUJE75Kd+xc3SuC/1CBRWMgDZZQ7gTAJ8ZRuFew//f3LfKBTaLq+zYtqTOZkJA/q+xmoo4gG3L08fNAt+2zRoSkQ+DcFAqMZ7gb1qe1PksEYl0rm0SbHwtr6rUjFfCnoB5ZRrHo8jn6453DMutGJ6Pt8K+GOIfLcInA+h1MBogQ53w8ClFqhqvhBC7yhaxs5EeO5w5x7n7t5hZ6XCxtsvW1Q3Bw04mf0tbKW0ehZVBubFH5XWmA0iHB7q1ui5hbZZIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6cExSEnE0n7zNUOO7mQkQ2H7Efh9U+RLLUYIUCjk64=;
 b=QqFcU/gOx9uf8FiWEvwID+MuiR0cSQnXiHNFZa8kwGk55JIER8fzVW2ZAEuMxSEUC9IYYG3zH1a2hkskK1PBONsCS3MNW794DWwABa/+DU6NPFDSBkw44fXocffcfUNatZtmY5XSGw7o5wcWBASglWTSuTcdCeAJSUE4onnhDlDUiUpkkVB0V5XfE4KBPGmemcvuVzfnCDLJTyq1Nrt5LBt4RbvMdlsMNvHMDs4Fg+N7NGZTo3jC5DengNgynwrpYgb5haWJZd2mGDXk78reLbeUGG5s50KRAYI7kE5aMdCOvMJ7tTOY6v0S/gsgXBAGF16aGzu4QSgk3EXqYNOYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BN9PR11MB5305.namprd11.prod.outlook.com (2603:10b6:408:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.20; Sun, 7 Jan
 2024 12:56:23 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::b585:4ce3:5d61:5b8e%4]) with mapi id 15.20.7159.020; Sun, 7 Jan 2024
 12:56:22 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 0/3] small changes on criu and lxc
Date: Sun,  7 Jan 2024 20:56:06 +0800
Message-Id: <20240107125609.3502113-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BN9PR11MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: fe643d58-39a1-426f-95c2-08dc0f800cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2dmvfuPap0DfCZRLTZNbFK0X15U8c04PWdfdb5EZDacPuzSmIAEMXSrQQqYw5P5Dqf2wxvTpURWQjeoViX/2F6FzSdFNDftTrk6GL3jG7mkaFPeWx1MVE/A44oUycGIXfjFjfgFiW4lAcUQNgfS0kwU3ntWLv+TNq2Or6ZErFZXai/kXVBB7MNazB2A58PMN5vpV2QkNVC4ecGuWOgWr5/XpCh4O0517i0bgrv670y1eBHhKUYgoHFm2VYeS/hPrFLEwwTvRxg6jy1hlu+LKTFbPg37f4FJ/8HMvKvGzrOYdrQhqTBj/YWJfvW46ZFF8kzFz8lTI87g6PYDl8Jfdp0DfFp2Vvwwf9ou3X8kedKDctzat/yLQDNw2b2j8mDLa5z/nYluoD8AjxuanPlVs2lD+uudJUvxcMsW21Bz1/SafPJBKO+9QZC4EZmmTyxxE2nGBcwMa4Lo7YmULCOLE1+EnFSbmMP6nfh0UK4KudDt6kvLV3eR8HJqz32+o2Xaazw7QzUUz61hl1MDPyW2eAxko8TMHNgPwdDLDaFqZNYAv2tzCQoEaLelvahaKvGApkt2IDj5E4EXdSP2VSeuEsQwtsBqCJYl9KuxVx92o3s4m2A0fluVO8wEAFaQtKedb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39840400004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6486002)(52116002)(1076003)(26005)(2616005)(478600001)(6506007)(6512007)(6666004)(83380400001)(5660300002)(2906002)(41300700001)(66476007)(66556008)(66946007)(6916009)(316002)(8936002)(8676002)(44832011)(38100700002)(38350700005)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t2cpRGd1YA4np9HtG8hD9ALD78iuk9fhY6AO3/k5GNuqOQg296OuDMhdp18O?=
 =?us-ascii?Q?ojnjD/0Ikz2Sl2QjVU6vX6pUQfdTF/cQ7WL8lgY9yZjwZhWIXiotGm9pYwhb?=
 =?us-ascii?Q?GZy0tJNYLkaCTgAqEWX78Q6Jip4y2nz+NW68VGAepIJV7EyqVgp9yqlXdDlK?=
 =?us-ascii?Q?O/HG9yq2RHemTIXUsyu4kw9JNt6IDiB6ZTINzrPfQDy+YW23Kfa5iQ3zNMxu?=
 =?us-ascii?Q?4kGgRw7iFFuH5INphaq27dMQqhZakZL0EPkTv3yPG1Akf31iU3/DfqZ1BEtc?=
 =?us-ascii?Q?ErT+JOvohevY7z/TD7FYgbxFmpabq3qoYxgDCej35xSP3n2mKo33DuJ7xTXz?=
 =?us-ascii?Q?FkfEps3mJvn0ckd3w/JD8/5bWcqlsEGFC3noKIgim74ewXTZZ6WgR0EZvMTb?=
 =?us-ascii?Q?WiKHKgpqrJeTKudHNNHM3OgfQIQctgHyl+USOCafltWg+f5vMYDibazG1OVR?=
 =?us-ascii?Q?a45EmObida5S4A4mt1kNaV8XsSs8cDLv11O8dJTBjNYJfZJckrsGEyKYelZY?=
 =?us-ascii?Q?R7nepKXyPRn4hcAWBe2SBR3/NPA3pYjMG1IeVxDEgd8e5m9GwunFKSZ0umo2?=
 =?us-ascii?Q?bko/z6yDhTMtjPVN28sp0rCN78dPNF7y601vVSTJnW4v20eQCvSBY+ivQhFn?=
 =?us-ascii?Q?C6fJplY1cXc8TNGBywZYTjzCR2ILpIrBSXh8XtOvnDAtIJTJHnd/Vi+ywSvA?=
 =?us-ascii?Q?NbjUtbOYAg8r4nYjLqFNhgYMLdERV9h3yFWVvzti/WHztrflZKy13vV6ALjp?=
 =?us-ascii?Q?9KLV15kKnbbKA9YqVrw5aSQ/mQK/njnGJZoTs7Zsvi6gGjDSvTQJGSS7YHrL?=
 =?us-ascii?Q?XIK5zHMlFfuuiAuAYSlltcRGB4y87BhzlMoiYT6IkJd5d8MtwTL1Fv8WquJ8?=
 =?us-ascii?Q?NaQn9xjYbrRAjlMjD/bV+d21i6ICumOX+lN08JbpoxsESeO0C79elEkJH29q?=
 =?us-ascii?Q?X6NW5KfmPf/b1U/HLSROy0Q+ZIpSMFkdGaPCoUAXxTzSpa02wApDhRubM+0O?=
 =?us-ascii?Q?UVLhUkR7tcpwivw5ml3RJIr6o4TgvUtO1/mHogzARXG/9Yobfd5VommNSWPt?=
 =?us-ascii?Q?XM7fsHSGUXZC/NipDw5XVKWb5+YPgFhOP5DDOXmOnyU4z5UZfPi/KqkLm/2C?=
 =?us-ascii?Q?SwXSHV1hQJIxSHUtzRyh6ej5mqNgSK7WD7d/9O1njBhSzXCgPJTE3FKU9ukm?=
 =?us-ascii?Q?sBBq5Z1L6bHQXaBRZw6chGAWi/b6T9TN7W5B3D7cLgvK3Fhhr+lPCs++0VVL?=
 =?us-ascii?Q?5PJuPLx//KMDX55Zc8EyVpXcyN7IfA4zke6Neu7DJQYQPLSThqFokT6KWfEY?=
 =?us-ascii?Q?zyuHObmZKwfR9H3IFl87a+TT+T9d0nuzxLIekRPOGzoZvmWh8PmO8Xt2Q5lI?=
 =?us-ascii?Q?AuIJ5wQABcJreMnb5LnwaLjJd9DCg9JerZzHTEGixJL5qpqCdFqy8mVZ35PH?=
 =?us-ascii?Q?FPX5xrRVTx9ZTTenZljb371XvYnmKiNO6QdBv6z7lsFcGk2Kt1Ycl9zSyinJ?=
 =?us-ascii?Q?9GbkBPslr0vCJteH/7fu2UguY1Z1F6wNwkA7QY+3ZKdkrb6wN70fYunVPkIX?=
 =?us-ascii?Q?ieqx5/0tSh72oVuzj1C7wzQUGYdByqZe2iN7oYll7DdIrwkyfqYYXeTySdgs?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe643d58-39a1-426f-95c2-08dc0f800cd7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2024 12:56:22.8353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdwE+SWyWVztqJ574mqmhGyLW/2ncYsN/KO8Z2Ng0tJm14q9ZMlXoVfBojLsol3O88j+XuriD3UK1oYwJvcie8GYi6n890tVUBuxNIaZTP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5305
X-Proofpoint-GUID: KKB3QZSYuAOQC9MQp2pktz0ZT_0o1jUs
X-Proofpoint-ORIG-GUID: KKB3QZSYuAOQC9MQp2pktz0ZT_0o1jUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=938 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401070062
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 07 Jan 2024 12:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8526

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Hi Bruce,

There are 3 small fix on criu and lxc package.

patch 1 and 2 related to criu, when using criu dump, it failed and report errors
due to missing sock diag features in kernel and cgroup not init correctly, so add
kernel configuration fragments to enable sock diag and add crgoup-lite to RDEPENDS.

patch 3 related to lxc ptest, some of test cases cannot fully clean the system environment
after exit, that cause lxc-test-unpriv in failure status, so adjust the lxc-test-unpriv
case order to first.

Thanks,

Br,
Xiangyu


Xiangyu Chen (3):
  criu: add kernel configuration features
  criu: add cgroup-lite to RDEPENDS
  lxc: adjust the lxc-test-unpriv running order

 recipes-containers/criu/criu_git.bb           |  2 +-
 recipes-containers/lxc/files/run-ptest        | 25 ++++++++++++++++++-
 recipes-kernel/linux/linux-yocto/criu.cfg     |  8 ++++++
 recipes-kernel/linux/linux-yocto/criu.scc     |  4 +++
 .../linux/linux-yocto_virtualization.inc      |  1 +
 5 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto/criu.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto/criu.scc

-- 
2.34.1


