Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD25AC76195
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 10:28:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15917.1679048927408136812
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 03:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2440e5e2f2=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32H9XYNJ030905
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 03:28:47 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqkshje9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 03:28:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPmYJV3bBGPr8/7IbuDsnLR4zcqtG7aI2IEIyOsLDXTLVuHC3u2z52fIUToaBRS8YDaHrLbp76QODnlkicWlzJlO/QVJOlS7ZqsNAXrlRt2BuLcHvKV089amEOuFr/5ORrqmmoH6rEH1lNgoZYizBQ8RXBKLiyCPTOSXBE6fE793HgBkGGSR5QCdPkUGeyRsk3fbaSHsblgTuDqJtJcVx6di19uLtok46tqR1i5XWuogtPP/rnd8l/9GFkOYnBZMz/5BdwHJQkhcJYDGFqiHJmz93KsvpCEUtG3jQ4RCUf5kvSag4BTmWEal/lx4mLKeM3p2yFLgmX1Q8ksjU6odKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTxxwDE+gksDRp4NuJKoL4LbJbycDL4Z6Prw2YWf+dg=;
 b=ZXSaQspE8Frmq7V7XfRKIDoYQRFX2eHEF0mXD1gKYhXKmBl7oRTofH9OVZ6l44+0bJ62LvAjBsIK9Hn93oD7EyHkXCsRVGLG+F4VAjfK/M7HEbpc3A04M1XjKcMghZcQ16Bvv9yKaVZjirQTnb9cLW8P3JvaqEpQEXZ6gKcBzWCCTe6jgAWQYQY0JZjpWJ+V92vnieck6Qx9oygIpv+4GO1qsoXKIny1D3e+ov7X8s/Jj8HMm8ogw2Tm70Mrtf8+u8uq98c2cz5KCCbYurkf1BFKnCk+yeyDxAseR79uVqv0NnXzlmdekCDaTMHOhfkKeL8USbU8MRAlYlvemAEY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Fri, 17 Mar
 2023 10:28:45 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 10:28:44 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 2/2] lxc: add -L and -f for curl in templates-use-curl-instead-of-wget.patch
Date: Fri, 17 Mar 2023 18:28:29 +0800
Message-Id: <20230317102829.3833398-3-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230317102829.3833398-1-xiangyu.chen@eng.windriver.com>
References: <20230317102829.3833398-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::46) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH0PR11MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa5f8a4-9532-4c93-96e6-08db26d262be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l5zXvgsJLA6gLCE0h0t9bnEPWZQcl2wblFetvQrvN/nC647ZD2V9k2SRTTqAg0JmKD/eFAKqpyTjpbbs9RQ3v4uV/ohsYCRxda7XOxcVuRUGlVy10I5+LC5+Vx53h5YCZUa2/LvLu2VrM0SFKXQX04LTqY9tfc6koCdQ+GLUru8OOYzYbsbTw28CI3DgV8VJqGo1OUv9QkdCeo55h0VjXlU9QiaUdbN+bEvl2Yy4KrPsDdc1zICgw8VdEDJ2bFDZ1dA0uo5tW2yCVeXMy+b1K3wCu7l9RcmDGASykdCwlDQGB4L+2CSnh+u0tDoMdSbh40fAzucIVzzuaWiFggUPmAVsKN7qstZNlWmg2xu4CWfR8oEHZnOY1jnJ/KMYk656CWILrmUTkJc+BrGaNGJ8A8QTGiX6b7uTYjOJj44ZgDhHWN6dKanOob//dyFrwCDqCdEdeEsoci03Nz/Apef2CaXczZ6CslPbee2SeHoXrrl9gD7qSq2PBro5xnPRA9bbU4F0merabcnIOeBLYeyuMkn3U9FrWiSUbpI0SF7xcui0t0RbMwk50kF/YaACtDLA4CXCGvk6Hu5bKQ34jhaPBzZN3dWVZzOnQ8TESAi/cfW1yDRNhI7t2sjv0I6UY0ZqLxSx8EtOpe/d1xQO0LHlGgiW+NcTUsApc1OxVSEvwOLPNAHonZXahwVRFWLqTSM1iK8fuVBVJ7uRMdCerPuTJw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199018)(478600001)(8936002)(5660300002)(41300700001)(38350700002)(2906002)(83170400001)(38100700002)(6916009)(66946007)(8676002)(44832011)(6486002)(6666004)(66556008)(66476007)(186003)(52116002)(83380400001)(1076003)(6512007)(316002)(2616005)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZofOLvSh1vwe126S1mk5QG6pxF6H+KuYU5XI67Aut5OdVphufziH3ZbrqWS8?=
 =?us-ascii?Q?uwiWKaBZFckoy9YevRyNpO2LPqYh8dbX9Jef8UbnhhF6xBvDx2xarXaKjDZB?=
 =?us-ascii?Q?6hyZ2FfGS+LmggQnEpS3TFSHe0HFMFiK9T6sNxTxqjG+9NctnYVHFQO6lkd/?=
 =?us-ascii?Q?7sqyyaFSmsEruR7wgbXRkF9EGVftSQ7XqLYWhOBPFOAlqa5LgnKhgTSdvxzE?=
 =?us-ascii?Q?H3LbNUWxT2RhHUExxa6YUdCntrQlgL+RZA5FXZiu0pOKUCo6SAR+39PMoePM?=
 =?us-ascii?Q?gX90XCR/63a7UA5LvHZ8JMj6URLQbAo60PvvXritGb7UK8waq1xQ6dxojR0F?=
 =?us-ascii?Q?lXmP9C+yH+i81aie921dW3eKjhiFnCCj4YB0eNKy5tlNjBLQg+BdpyOXKaoj?=
 =?us-ascii?Q?n9cxmJB5ogvqUHwyzzxxpZfjP01VF4ljsFybkxMHub9y8imMbcA8aKMwc2gk?=
 =?us-ascii?Q?n7ewxKgmjZgDEj1WqWKGOfRwqeAk5/f6Pd/0WM5tpRlfVHUsdt2lQ+nm0uzk?=
 =?us-ascii?Q?ZXO5rfMnLvGHSrz9JresO+CHDI9fjj6Ong6qqf5p68eOL20H2yjlkce/LSSP?=
 =?us-ascii?Q?umJIjSmhsOmOCIpxpyjQ9jXCEdKejK75GvYnKmfo5rfYyMgeIfFcWdtzcrop?=
 =?us-ascii?Q?7QTyyfuR7+xG7GRuH1kH6lfxWtWGP7ZmAZ2nl9nuhFScOwgwqRKUvAiB8pCF?=
 =?us-ascii?Q?0+ltKP4UrCbVkjDQWbvih6/xDDTa7UMITfXkGSQVpOOfmxnz6ssBz+yrGlyi?=
 =?us-ascii?Q?ZSSIsSWLhLYQ74fUzMHEXFViH++a5jCMHisbO3OvtNOEuxLqq7cA3UAZ6Voc?=
 =?us-ascii?Q?c0CIC8vuC+iAsRjSI4EGGc5Eq10i2PgmfBa7QYPcdBmQYbU9wt5KQDaL4vWS?=
 =?us-ascii?Q?iv0wwQHAnZnGVJvDF3111WtLKy6l6XltjwIh+CRDSJnQq0GE6b5ENL8/De+I?=
 =?us-ascii?Q?kK4qNMIki++hiy2SwBsDP7R1Ksw65M1TWhPqs/w0Hyxpid37p0gSHkbCYtyR?=
 =?us-ascii?Q?lpO9oGr/qT6QcnCwWWQTwBl+pp5/fmqSYpLpegIgMnhTVb3mEcF+1BLvkqo4?=
 =?us-ascii?Q?vfhBJda6Elc3crxtZPJvCajIeV68+HctNhKgpSOUgrLCrhFo65Fua6ZUSYyi?=
 =?us-ascii?Q?UuBc7aCNmCkeaJbFOuF1TUXTdipG/mrThBhd1WO5dgyYIb/iq3DktrMRKLIn?=
 =?us-ascii?Q?irn7WvF56/byJJ4uv/QWcaJMeubVvnTt7ryuoEzumHgtLC1m/Gx5UkQKiqmU?=
 =?us-ascii?Q?BwKsW23OVuc8RhxnTfgUfmAJbhxnON1tvsIqxlCHoGrWaECKm92PQ30HCMzI?=
 =?us-ascii?Q?gQjEyKYdXYsjcV95cccjp7B5jjhgPRedeU/Ak4RZXn4kDqHuV8ZgZ+LSnVZS?=
 =?us-ascii?Q?L2/W8Dh3sEi8DApXoe+lGhzkVczLfh2UPX5YRscYI7hbJt8bCi6tIkh5ecOc?=
 =?us-ascii?Q?e15yn4UdnWP6kgn4aPj1R/morbIirDNIY3bpy12m0i4OkkxmFutG5crH1IIc?=
 =?us-ascii?Q?kmIB0X7MEZNwDNBYhO4IEZVOe4/bMg/1GY2A0MNZeao0CRWIzG/Rc1UX9Irn?=
 =?us-ascii?Q?r5Q5FqpdHhMdLXCT1NdnerHGjNfU0eUjvUQpNxFfT4DNdyLFRPZeJoU6bgrQ?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa5f8a4-9532-4c93-96e6-08db26d262be
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 10:28:44.7358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnvjWF9h1CLekDvhS0UWuxobJDIbToDY3WthgEpvEIojnJWERxTHi2RtjFQ0jAf6ENQHBh9/K7H04Mg+P8jRzLnIMHn+RVGvJ7Sp9IP5Zmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
X-Proofpoint-ORIG-GUID: 7YjNo68ZKF53O1q1HGKnODB4lEHCFUJK
X-Proofpoint-GUID: 7YjNo68ZKF53O1q1HGKnODB4lEHCFUJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_06,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=844 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170070
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 10:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7945

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Add support of redirect option -L for curl, the
linuxcontainers.org sometimes redirect to other
mirror site such like us.lxd.images.canonical.com,
this would cause the lxc-download script report
download failed.

The version of curl in kirkstone also need to add an
option -f to use an error code to tell the caller
when http/https has errors.

Reproduce and verified on following command:
lxc-create -t download -n test -- --dist archlinux --release current --arch arm64

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../lxc/files/templates-use-curl-instead-of-wget.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
index ff5c5f6..a334723 100644
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
@@ -35,7 +35,7 @@ index a62ddf482..690307338 100755
  
  download_file() {
 -  if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2" >/dev/null 2>&1; then
-+  if ! curl_wrapper --user-agent "lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
++  if ! curl_wrapper -L -f --user-agent "lxc/@PACKAGE_VERSION@ compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2" >/dev/null 2>&1; then
      if [ "$3" = "noexit" ]; then
        return 1
      else
-- 
2.34.1


