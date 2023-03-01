Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E92BC7EE32
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18396.1677664367152731774
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ELxkg3i5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswN023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=/JPSca13aquKvH534qI5cKwutpwCRIa8i7nPfqIWRiU=;
 b=ELxkg3i55yliEzJpnig0+qER5xNwPlMoOVthILi3IvScVs11KZvWaFe3k4BGmC+lG+8Q
 AQ2KF+vhvXS1bnZkcb8sFWdZATTNvdAzYiyJ8iePAkuBS/O7V1MqY2uCIVxCRCjVmBVO
 5BjsJ99FT0ce2V7uur1j/jkCJsyTOh9Hct1bFnCrhAsNCgJiLmVz0YWlz96DbX4qQcHt
 k/IcSfKZxSG7XyollNk0vzNLAff0tmYP82zBJiploFdN9UeqJ0ebJ1A1hp98bZKoxHPN
 VBrX1XSvRmjhUy6ehTpyOa/SdLA6SJCdQD5VJW6xHKgDJzLRtoDWiiTk5hzATP3xZCTf xw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktKUr+etUR6w6+8XhpCSGJ7mX5MISRt1yl/rNKDlL7DcRtrCSZ++qj4p4KWWU4HTTp/S2/ax7kt5CO8N5tVZXW3QtipAYzzXFkYbife8Sq7xQZrCwaUj3UUZRMyN7OUalyKG3u00nHKcEeKxqDZfJoRHA5iDLub4S5WWGnjNHoH8xv38C/FsNFpxa4VjCyNlONLfuchNWBR+2i1hbThaIoo59JHAkv3CgckfJLx2rgrG7j5JCDfXBTl+WkohwjHmpMfBIst5xlACghoF67LSB+mY2jv4Iq4oVF0KkON+yfGT8byPOrzfh9XaxSYJ2nOOt4jKhD0ZDJ05RBRHhInNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JPSca13aquKvH534qI5cKwutpwCRIa8i7nPfqIWRiU=;
 b=fd4n5ttdRr/+LWT7UbTdN5L2BYgK1wMxbcfb8xvhvmc1xNdhWCZwgDDmu+fBKQFaPVDXhWqqy6eCnGxw0syWSNH4ndOHN0HCJZ87WYVthCMAXF6HmnTzkS9QMEjAI59ZETIFnZVpLm4HTv3JU9dZ7VZ2BZjZC6m1rPASnzUcOzOF/A/JHV7Y44LYEK01wQG0QIzIw2B7tKxwRWoVWPIvL4JjlAw7Pa7mPnwUoJf++rjlJik8JVsqUqGqjP3F/YrVrmfeIgiDvd/Bxfh3cG74U+602KUgIcq0rEYott6B2ej6tPtEB7Hgh+TVi884weNJZ6oG8QGL4t1gJmXW51FV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:44 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 05/10] containers: introduce container-host class
Date: Wed,  1 Mar 2023 01:52:23 -0800
Message-Id: <20230301095228.122562-5-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230301095228.122562-1-Qi.Chen@windriver.com>
References: <20230301095228.122562-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 139d909c-b18a-4717-5970-08db1a3ab3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kooo/LQLNnPPLQaKtPcJ3IrCFfOPsuIx9bVEhwOVVPMdIrSE94ICAMaABcVC6r1bgnBSkVLiI1+2VisiAJ2z7jsx3NmuMfiO3AQNchlZOA7y7C4wnFkJd1naZeopsCXgR6KJWfcgxB7g0J/FQDBVXg15QzZDQu6ROKsavQe4ye0hYWWKLG2fYDj66FSPWalFIfWfD2WIPxvjQf5jknSC2Lotqvf6cRjNmx8EvzizGOUWugNFLRnnLwByQbFhm4c057QMumT+OUCwdLOSvrV7/PKwyFVbeLlGdx9R6VmSdOKSaKFdUbaARADVvnVFat/vUm4OmnDAQNcWkJ/44jG3DgI3n5A71vuQ5FGcuLkl+7ytPx7zbOO89mARY/DkzHKVcikTua8bD2rhoGlUbORNxgpSpsNuB9iYklROiDgBg3Wg0DpzFZWs5IswVJJUXJ2Q0PJXlGlUYW7Y7Bw7DANZWbwLDzCiVSs1l/RmimpzMTLGfYRmcM8HgszRcp/vDnyG5raZB68pU12ahtw3hvIEsD+KE77hZgZB3TYHnSbf/PtLiCD7JsFMJj4ZsDdifuKNg43zJz6StW9HwT/XVVEg/49iUlUlxTg7xvDNfS2UG3aZHOp80DdQfmhiDTtWJdweWOmbm+2Pa7AvFrqMZydtRj5uKFZqStOKfBbjLTPy1Kg21OZDCNwS1IadROAtedsihrWIeD9lhtOQxqjfpUSViA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(186003)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?holahk7or1+7G+IOvEcPaTlEkQR9oyAUoTUISoHN/i5h5JcUh7i1VxuyQK/z?=
 =?us-ascii?Q?00YmMrnqZOtlqSaEx5XUZ4MBGO+U0szNeucq1oMW0pj1074kSRJ1T219imCu?=
 =?us-ascii?Q?JJXIN17HV6DVoEgu6pgdHJnPIybL559ZIUZOJodOF4+KyKDkKLhYV63VNRGl?=
 =?us-ascii?Q?A62+iBW8RmtLNPMMhA3L6Ifov1wS7/y82/da31+KCH4UP4jzjtU+4RYaC8t5?=
 =?us-ascii?Q?dww8lsyOuNB2hzQRm7WOcIs07xCtUl9Ya2QnqUoyRc7CurPLbeB1HhAReH00?=
 =?us-ascii?Q?yRDq1BKYdELZqi1Fa1w7yiX/hAs7cq8HPDy1JJKJVVnRnuGaW2vybEG09/aN?=
 =?us-ascii?Q?E2AHfHmSpirbJQ0LoE5ciE8PcljdZNTLuP3nW6ovX83a8ktko3QJhNxBxsMX?=
 =?us-ascii?Q?F8zXAVL/SvvzcAfOI41A9VsgZccxuETJ+YnndBr01PFzjxX/O6LO4e8YGBNZ?=
 =?us-ascii?Q?5m3l9TaS+GmAXDSdxbceaSM4GNT6zdflrGGKFBYyW2oxztf8lV6Th8ZxKdqy?=
 =?us-ascii?Q?bn094BXnA0fperIgSGZ1rrHXYh3fMWKlnWudEB0QHaRUo/tGk/5is5Jg22Fs?=
 =?us-ascii?Q?9MFGfcPtw+rIfhhoTOq5r6uddnE3qBdVwbv9elEA2dRXpET3ex/9aqXzZEF9?=
 =?us-ascii?Q?ckfBeaiC4q1v+kNvwZpFfHBD9nzDZOarK1KiKaLabBTMZokd6ipIThBqV1NM?=
 =?us-ascii?Q?SOX2rrdLWcT5G3w3CGzlJWvDZlwzHbUnVEnPgzrhMeb83YMfcP2MfpsNVjdO?=
 =?us-ascii?Q?LyhcOvfn//rvpcXQOLzSf6NxP1l1McrOPbYNOL6Q7gR8lI8LcLie0s3EWnpe?=
 =?us-ascii?Q?tWQOW3IH9jgPC4wUq7+5L6JkiEFX/QN2PbuIq8sYYZntbDyVwdgcPPJxfac9?=
 =?us-ascii?Q?RRy4tcYtqrJVEDwSsSmG5t42Dd4y+0lq02aqR37//YR2d8BejRRVlHxT48zk?=
 =?us-ascii?Q?qUQKbLfhQ+j9gS8Iw/XG5XM7WiV61oc2z9yWDWoSvbuHrEGafPmAjxyVnzqF?=
 =?us-ascii?Q?5SCFTMIOkAUaVn4KDqKEstJQZy+tsovd848rIllhucGhpyj/CbBT/uMrstbs?=
 =?us-ascii?Q?OGH8Eoa/1oo6dkNDr5YRR+rvD8mrGsC/z24IcODMIwANnvRiqYtrgZu4HAU3?=
 =?us-ascii?Q?pFUcgjZMCIBj3KTPcxfXMkHTmf3C+aQ7nqnrSjZxUjh06PB/o5FCCaKzCn0b?=
 =?us-ascii?Q?sfI2bab+L7gaNPdlso4FHHStSb5qHc+KSWRw9rmbb3v+6a0PHCArIfCUSYIP?=
 =?us-ascii?Q?t1jXn5qJhIVOkOhJJllW8RV3chDyc48r7ZDaz8f2QbRrABLD11LZJYpEXkht?=
 =?us-ascii?Q?2RvGLHigQ8WdOAawZ/GGzbWACBoZGJQQu8QvzGyQ//F+20avJu+pFNACSlXW?=
 =?us-ascii?Q?iKP4nzPCYvX92IECgJZtg+rNrYIVleycRfrT/Ue8B+Z5gpqWQ8b17nKvHvOJ?=
 =?us-ascii?Q?NJjWc/qSCDVsGr0/xNRZnFFQjmKPPWzgkyJxUwo9VtQfgRs+7LdmKD3IdkQ9?=
 =?us-ascii?Q?MQQea2ytg32Z88Lqi6hLsEfbfR+vlLOa+pYWSgrCAxFnsk/9rftcdEfCMizy?=
 =?us-ascii?Q?/QjyaSUDd66c49nsTPQa6eYPk5ZWCqyVlqs3LFtm7eMGUnXjnczY6r4p05vH?=
 =?us-ascii?Q?+Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139d909c-b18a-4717-5970-08db1a3ab3f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:43.4155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJeG3AxKyPahc/VKggDUqBnyPe2T8fHO48/IHWtbeVImr8yY6yjON6zpTsz3SYzJcqXA8sN1+5RXum5jFgLShw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: PekbbfJor-YbxPkjlri5ycyfwi78gpyu
X-Proofpoint-GUID: PekbbfJor-YbxPkjlri5ycyfwi78gpyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=692 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7914

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Introducing a small (at the moment) class that represents configuration
and processing required to prepare a target image to be a container
host.

A recipe that requires container configuration should inherit this
class, and the container-host-config package will be added as a
RDEPENDS, and install common configuration files.

In the future, additional functionality or dependencies will be added
here to synchronize the configuration of multiple container host
packages.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 classes/container-host.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 classes/container-host.bbclass

diff --git a/classes/container-host.bbclass b/classes/container-host.bbclass
new file mode 100644
index 0000000..99a75fe
--- /dev/null
+++ b/classes/container-host.bbclass
@@ -0,0 +1,15 @@
+# This class is the collection point for automatic dependencies,
+# package installs, rootfs postprocessing, etc, that are used
+# by container host images and recipes.
+
+# It currently is largely empty, and simply adds RDEPENDS, but
+# will expand to CRI/CNI configurations in the future.
+#
+
+RDEPENDS:${PN}:append = " container-host-config"
+
+do_install:append() {
+    # placeholder for additional package install, or configuration
+    # of the rootfs
+    true
+}
-- 
2.37.1


