Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C33CC64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18339.1677664366003138141
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oWsXmnQL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswK023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=O4fUvgDV+dRJbJTuQFX/rc8LpVaEfRojYGlBW8fh8Bo=;
 b=oWsXmnQLKOQVGvPeAZh9nd4B1Vusb29W67XkEccGcs2BaT53hKZnP7UDTQ1BQaVU6vb5
 PuYXQXHROiUO1B2aC+PZtMFVa8ARYpTzIBSTTO+WIAEPzjkbRBShqE2TE8wGX/nGbkBQ
 CqZHUhjxg810nZEDIdAZCP4b3gVVkTp2MDJPfoAwdQWn7uRk6iF9wUp+O3HyzmOd0n3B
 Wn8I5QlMJIP+X5fhA0FNhSfJ1D7JnKNPCwvL+2fnfBFcsPsEopOfdq+rp3NvA+H5sooE
 EMx92jFE8Rspk/4Sb3MFAl8g92YFemIW/7A1O28VzJhqeeufP7jppmDWyTSJqYu6JyNu 3A== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QS+Suj6J32m5rJMLRYNEIq5oQ3snOu+K16fOBByQtdp+VqX2YRcqlw3fpEpDTKhS3ovIGOC7sdEV49t68aXZDDXT4YVoVLEHauVSAsV5rIYfnizMHdjqWRdzc+2EUX3rH/DaEtPkqIQXhrVJKHGrXphielIp62OaZCF0qXRSrekprxuMceto+2SV3KUxumIhsDnqYhWJ/39Qz8+mTmHpaN6vQ2y8wXdwM8BoqVkjWn1JuzVLggEeqnrtLpCF5nR0URWcZQK5ip+iBdwNzVtbrJAN2xVORXAOq+QD8ULfdySZu67sosMrFPhwCNq62umUK73w0EaFE40vzHWDQENNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4fUvgDV+dRJbJTuQFX/rc8LpVaEfRojYGlBW8fh8Bo=;
 b=kBz+ePaQa7Wc6W31/MH6riL9Yy8ADuSgg2eHtGKLTaJiUEtCcypgxhwSu47XO8pZiWT7uGa4zJDAB8fl5s6gL7Xlrk4HaX2SWAMYJ55krjxIvu9xWh8UEVqwdxmwXHL8sGwEUm+9Rzg88NL4ufCNKIPnwG0B3TeVLX4tl9FBAHt+ajEfsJ0EfU/1fWpEW99Nzq2CO17llFxyCrBx5SUiV/5zjdG6xrdeyiByjh52r/CsovM4EBhkIz8qU1VtaLGYQNWFYJ4fGzJX+Z8TCSE7eASAmZ3ojdG10gI/p92hDBLXd1pmkzDMFYfTYMmcScwMk9S+iovImQJU6y8kb1+NBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:42 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 01/10] cri-o: remove meta-security check
Date: Wed,  1 Mar 2023 01:52:19 -0800
Message-Id: <20230301095228.122562-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c00797c-b84a-47a6-a638-08db1a3ab300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	li+P7tCJk5O9oIAhOgyEBz3SMFdAn2arbMPatSTUVb/at0KDFk0thKLUE1Za0Kvu0CfkyxMcCzMXlC3ITTFaXHaneVVI8W1qa9mNwhcnai+SoD6La5M/KQxX0Dil8V89w//JCGDuZH6iAhHHq+RGVmbDDaMtAeTfRzg6Yc4XijKyatZGm/tDogVocqrTqTP8Yi8MkEbVns7uKPiz2OQc3sER94WAzljX/unsFjjps9AaOdUwDXliRRgAVJNiGBAE6JJGJZQ2gTQ6T7g7ByTyc6fqaemIoW9LZe82MzGaR+XsaIAwaF61tbXTnKKhllXQf0wWXmM6JgtRiWe7nP7bDlSZuydOCnh14DMPnBVfJwGE2xSAhkNSr8KjEG5FT5I9mXi3Lv0WqAnDFVJe9qFueOo/0f5xWjvPk+uX+F0sXnSZrD8NH2qayuYh8grfOaIrpMXoxAFSMskdGJcpzkZ21wTea/W52ZijhT9UeCtpqBFnvGnXrcmQvQ5UYQI5pkWt/FSlVKTuw5iWfxPRyBnym7mnP2tGRmhvG/vJZ9a0H3NXzQOnWldzoglXWdJYV3pcoTHnSS75V5n3902cz5gnZs+vgyUW4nm2UYmcS5ysKlxg8IynCQoe9WeO3EfhVxJaTgsHLwfsfLE+qJo+Nkmor77qu/p/5gEsF/YOLfwDD/lAfXPDKeK4ygOnajj15RrMw68kAQW5pcSof6ooi6ItsA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(186003)(83380400001)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(15650500001)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hsdhccd+ie/sF80Fiu/S+cGwdOVojWvu7RI7gnxtbOO4JcJcsT8s2ZL+H9SF?=
 =?us-ascii?Q?TgyTKnoKp1jow+StiXoVlJXW7A2fWztQJkTB8Jj+MaEV7KjjSmKYW2uIv5KV?=
 =?us-ascii?Q?MWrQCNv4Ups+1nsLIFi//lANNydD0MFNqd/9/PaBL3St8uWoUzxAUK21J8Qv?=
 =?us-ascii?Q?EVAumXVdNKS6i+iXQo8tqWMF/ZZ2jFiwdrj0X9owCdMfpvzgOyk3gHiOJkW+?=
 =?us-ascii?Q?DbnmNjJwUWVPnKw53dBRF7AP9hBr3ILic9iFA/1mKUaPncDzIQ4b6U4mhcDX?=
 =?us-ascii?Q?Wxk+M/3hq7g9OLE/3goy3XtS3IZ9xyOf+9Zs/VWVunIrBb6/uZUtFpWC5ZyZ?=
 =?us-ascii?Q?rolmU8ZzjlcL7HWEe0z95WoSInyhXyLpYl3rmcsevF2LcinUatcJmf60G750?=
 =?us-ascii?Q?63c1FD06M2iRthMUO7ZTEqVCLtx8JW+NlIMV5OK8uubWhdZ8id+CmpYKlsgU?=
 =?us-ascii?Q?FlAHqPCJcWrK2qK/G964jR5BvL+UFyNngGbEMzIauLVtE5xWGeSCszMvsiQ0?=
 =?us-ascii?Q?xqGATY7UwIjI864aqtBTg8Pxk64prtvqkCBAiMuDU9aJCnDSS4pYgdXJU4Sj?=
 =?us-ascii?Q?BzCG+C8Veoa6pmcG/YR+eje09zXH2gtwSPjoxD0h4JfYflOXUTeDx7faLk37?=
 =?us-ascii?Q?x9K6EP9Kod0m8ZoopwAOVwVuV/bQfbscYhBTpGeMwA+DNEgOIhH6/zYDMrRQ?=
 =?us-ascii?Q?dzIIueZ3g8Vx262wZ5slOlYd8pwu9BJzwTuN5WIkdpQgOQmTJ9/2IVCPlwLG?=
 =?us-ascii?Q?3S946Nko6ISQppsZz/mePVIQSMbW/WK9aSXKkGRqHKMDmTEh3R4fDfnPOdzP?=
 =?us-ascii?Q?HbbahZaMdjDbnisrY045SW0+WXzxuiZKJzEzGq7FCRVx81zjzHAyhDZe7GQ7?=
 =?us-ascii?Q?Kv7TZ2PXLsKh8hH72uLIIacVJ/78/myo3u0LC2GhDE/3ZZmsSs4FDon7eb4E?=
 =?us-ascii?Q?7zEQ6VVxJjTVzGTgEn+FNy6LtHeJTprnGailLT1ZYPSxlcEyhRYTv2siPl0T?=
 =?us-ascii?Q?AV2S7FzIy7aljbvZR9xCCmfANKwPAB3dFEgqUCPObcyJqEl4l5ZFy95TgWJT?=
 =?us-ascii?Q?fTr7cPC4D2FmW3nDF2+JFAvqAuut7xsH3+GPhZWj5B+WeQZU6F3yXiKFIV7l?=
 =?us-ascii?Q?bQKNChcfBCAJf3JZsEbGcRQRPP8Mr/6chI8+AOlcG/kw8cYkfWgGvTvtCNKF?=
 =?us-ascii?Q?5NGVoIyIKKPrACyBEVBiDcE0OXEZJQwFBJHk0gzNaqFXFAxcAw3b8BwpFHaH?=
 =?us-ascii?Q?jK/Rr3+GCR/vmH7lh8AvN5Enp+zwnnKBlsreHe8hx+pLyyz1AQ//Haq9tLH4?=
 =?us-ascii?Q?7MEg3m48m7PqiUA1eOoDuKo7aPW6rWlNvf2M9IyYshX7PP9wkbdEhiE37dsW?=
 =?us-ascii?Q?OBUI6gc6hmAboLklhFokjp9rDxQK0SG/8XxQ0iyoDiAK+dN1D+91iXqAkgCx?=
 =?us-ascii?Q?MWVI2HHxwUVDhPHSw+XhrAXHjcbiP5iW2mkzhgGUcGq2D0/LVMwiNndjPWA7?=
 =?us-ascii?Q?A0P6I+/T2DKYxMeUq+brNjIen1iRFcymgFdw1ZCJoZeKLbfEktS3m1Nxg7bS?=
 =?us-ascii?Q?RVkZBeZfRg4wKLjFBDSKYF6G1roBvV6nrUQHdeb85TNDARdNIDNCHHazkCWE?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c00797c-b84a-47a6-a638-08db1a3ab300
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:41.9614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JaqOk4Da1liYpROhsjc3NRwXlMxnWrBfUFEZ1jzb/xRJyKxFdoIEDx3B7EAKZFzLLoBpJ5KubamGtqrFFSW3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: QBnPTDOWWXsNRqjhnAkZKfGM-6TLtRH7
X-Proofpoint-GUID: QBnPTDOWWXsNRqjhnAkZKfGM-6TLtRH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=795 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7911

libseccomp is not in oe-core. There's no need to check
meta-security any more.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 7940bbd..ee5906e 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -46,7 +46,7 @@ RDEPENDS:${PN} = " \
     libdevmapper \
     "
 
-SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'security', bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d), 'Depends on libseccomp from meta-security which is not included', d)}"
+SKIP_RECIPE[cri-o] ?= "${@bb.utils.contains('BBFILE_COLLECTIONS', 'selinux', '', 'Depends on libselinux from meta-selinux which is not included', d)}"
 
 PACKAGES =+ "${PN}-config"
 
-- 
2.37.1


