Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9902BC64EAF
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38121.1650278800643444461
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 03:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PVYIV88v;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1107eb1758=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23IAkdIh015310
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 10:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=er1CKSN/32Qu8AE8qsr6rmf85RLgHCpWisurOTvrK0Q=;
 b=PVYIV88vnw+4lH4s2kFgUXXX1cNd0aYfg055PRRO70s2WR+hKDJ6jQkqQ+9XDvsQh4t9
 QyKuBwC3v233G2Jn9/qYUgsZxShoc2cikHuKfAxHPW8q3ddpHiZw2SvWzwHczNAyRGOe
 UQi37WVJTflXoug6O4UPG/JE7Wa5dZKufNuQlstz31OwojhSH56184RSeIkhEDGCyKNN
 i5G1k7IsqXDEfztUq0+jH2vWxVP3D0y81wsMlwVc0eYtZxT5zyVkR0C3tjsH36DlxsoE
 zOhoqAEvTR/ZzsSzr0B4+fa/emSUSzWI7EBEaOe0SC/QdVWx8fquKj0uV0eGqrWQ2Oow IQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpj2s868-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 10:46:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxekeI8D8IyMa3GNEQB7dFRg7D2HittGNvknLazth2oo3etfBCNPPOej2r75XiywH5qesZ/ilRGHldL6x+/VnEYDVMz0wpLnxaDkeKyB5oOkD1x1AuZTFfrjhNAZqDxJ5pxZ7uEKjVf8hNl2GXiUD83ybW7EBwxuiZs59XcCnBmU5uMohCpiqWJNKJ9SSbwcBf0ZPZEbN24mnsMI/uKEwEV40x0+DsE4Cf0tWW7VGneNMIEuaBzf+RzOTgEqj5ZOQjPNJktfmMpoUYEmPRxVQiPwda9ewbw7MHYzmQOu5mEaIc+Glwfm/oReSSkmmnAC4HIxZMsMD3GO/1fq8xw4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=er1CKSN/32Qu8AE8qsr6rmf85RLgHCpWisurOTvrK0Q=;
 b=FAwzHgTz0YJLagu/9SQM7UbZc/HVe6l4FC1M9caU9RXX01ltSCl+RbUTVVbMpngNveAK37OfOb26YlQJSDHkPaxPCiGZtL3LlJWwK6o5pmL9dUi73+CiuhzgZ56YGFcCpw0UlqtqGLXezKwtRlClZInQUt6Z1GqehGcKtNI8EhLuWI8m5QcGu4SUlD+BzPe4rRdCTGzN3slLvwZPIqIly0HsrtIpaWnH8/QV5Ty5/K04zh9WHuwqFbWCibZC8po//At4UITrS8gnbBstkt/HkuLNRlf6NI7bf8cmEgjWYrHSLnbzN9aivruxfqHTHS0NxQTETh5Dy/a4Ardk7oOJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM6PR11MB3673.namprd11.prod.outlook.com (2603:10b6:5:145::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 10:46:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%4]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 10:46:34 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nerdctl: upgrade to v0.18.0
Date: Mon, 18 Apr 2022 03:46:23 -0700
Message-Id: <20220418104623.4194-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9801d70-d789-4af0-1c7e-08da2128b494
X-MS-TrafficTypeDiagnostic: DM6PR11MB3673:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB36731DBA46A57672F5ADB356EDF39@DM6PR11MB3673.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I26cPol7bfW63YgOrvvdN3l2bcqHn6g8hliox3ziK5o1tsy+jZG0tmYhQqfNs/tqek1NtSkwlucfKd9adO8c4le3Rld7XlXzFCRyLO1g9Be3CsudVecl9i86udbyYQ0wC+e12DIWL8i8F6zW8LAApjnVb9i9TgVtOWKeh7a4GQ+9rB5/i4INHay/V787ryrp7dvmBw9+yjkhRPNsXZZCaW7gGyjpl/Iz9lBCBnHGwZRAaMNlOAn8zlZv7KHnLSvb3Hd6pE5YhJzsy0lKQ/FuGY0kfKV+9hB0Qd7hoKz13iIRqOX2yTb6KAFHDyrDis4QCu9bnGheqp0yrzcpJG+ntMFw4cucijucfekPQn1nZWZNDfkJ0ozF3o7/TVcBloBsOdWIToFkX7jz//Fg52X8FxqH1Jv5Qex8/dxpy3vHgXG7q6/Y22Cs7LyGrYKZbnSpN1w45iuzSrDQswnVUjbEVfA4qnd4LzLAdE+1f/Ib8Rq+TDkqJQjdfTJzfgnxFpEuor+CdNDfEo7SzHxM40VGMpF3J9Ha5RcFgcvFGeII3gMVy0kZd6ihdqYbFkyFJDL0f2amRr02d9SlZuVK/1NAYp6zus1zjDonDTzqwwJKv07z0kSWuKDJz8T7O01rpHpVcbA9RfkARJTh9i+ckbd1jkAFidoDnfuWEgoMRwpAg5uJc5k3CZ32RidJrwhlsHJPoSt+FTUL0POOur8Y5s1uJmmNesbuYuoDn9rQ4RkfYR2cky9lyGVozSwJWiR7Pm3m2q1HpVm1Ir+1oqP6tSoCqsDOkiu5R2DroE75Ckt4MGIqaRVim+JOygIpew0HSsd9vkLWL3GXzv/hN1p0Vi/edg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(83380400001)(38100700002)(66946007)(66556008)(66476007)(508600001)(8676002)(2906002)(86362001)(316002)(36756003)(38350700002)(6916009)(6486002)(966005)(5660300002)(45080400002)(84970400001)(8936002)(52116002)(6512007)(6666004)(30864003)(186003)(26005)(2616005)(1076003)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ocfeIEXEN/vQj7ohpP4HvWMFarY07ky6P30D5kP8O1PfASBkbY/3T6B6x01T?=
 =?us-ascii?Q?Cfhvn5gvDSCwJtfJmi1kjHngjGfs1WsE6juwdrTRHq/BofXqwJ/nyO34++ru?=
 =?us-ascii?Q?QuRf+xXQRhKILuomBQaSJnWC939T8U/cHQAq0Kn/5JKwt6OEIfYUq7WEf3qj?=
 =?us-ascii?Q?ubVHuKXuePLZRmQZ2NfcGg67/2/Up2M1r1lCCEzqu9iKbSqTtyWjSdJxKAyd?=
 =?us-ascii?Q?2q8hKN5QeI3aZbAvnFcQR1eXLkUDFWqYbhTnywFa2RHVqXNE6TRevJpxD6ci?=
 =?us-ascii?Q?HTENi90MUSmCX84n1BCulhfkvq7CxpEoCSnmxdIt7BSlsKtRx4T6cJSqjEnx?=
 =?us-ascii?Q?FGNanRBfTCNDDbVMsxbnWpJdGZOj+4GKczcqVWXaETfrIC8nLEdzNAjZ+cBi?=
 =?us-ascii?Q?GvfMq76plrrXvu0sWcYPcBKuFK30QdaEoQz+EYYhYZ/CHJnCVMeWkQE9slOQ?=
 =?us-ascii?Q?nwTySGb0rJWSkKMG31KKQ2pmXlOORH3g4aIYVEuSfvmxnlQ2JGiioT8Ba6Fw?=
 =?us-ascii?Q?8xORAXHuPwUlS+Lym82QoQp874nZkvZsDqKVBBf64xImgzxPCEjJsaBMm15T?=
 =?us-ascii?Q?jPS1JHk3AZXRjcIyteBeTllkY/jqazo+hl8iv2LjbwvtlFu3QilSzH0PVFs/?=
 =?us-ascii?Q?qdDqMmNmtCld9KgicVCs4pBRTX4JvAzwpwQzMgB/ASdZiRRJ4oK346KCHyLv?=
 =?us-ascii?Q?oTTOZJz1CeizO754WUTwYg7JiL2K8W2UKNrGeHw1gL8+zGK+QmK2Bk192hQe?=
 =?us-ascii?Q?VNC1dljZy/x/aUY69LNsawLOUyvIbAtzdNxpl7wqlVJoatrfKuJvLXEgDnR+?=
 =?us-ascii?Q?jUIA2offi66dlhzbx0Q35li6LAlhgk2ofXg7qGgZ3tl3RUr1eWRezGNw7Qrd?=
 =?us-ascii?Q?Fex6kOd6eJ97NN7Rvu2iEgnSA3FlZ9ib6B1znb5HUe8Q3iH8UUbQe16AgiQ6?=
 =?us-ascii?Q?1WXLECDEG8vwPV1O2R1Et9sCd6YNyBmRLf/keZV/ipgE1yJPvvzLbYQRoqXZ?=
 =?us-ascii?Q?8iE36sOIiFdixpbM206l+bc5rxHgAVF79kr+/xhBUIvOIq+BW4A6xjcIeGBR?=
 =?us-ascii?Q?xbhSg5y22Ry7lnu8JKfWDZNOvTfSxgs48/PIZydUR2ZyKmbzbj5KrmctuXbo?=
 =?us-ascii?Q?hpEYM2Y3kAqDqqCQc4CsgfYjmT95231bP4N7bT2SqIHmMNFZebSltfuaTcyz?=
 =?us-ascii?Q?Qk//PLFtdmeDT/U4lKzsK6F35SMR/XpDRr2vaW3GnJi9ASw8oateAXfYZy40?=
 =?us-ascii?Q?vNEYDmC+cAW7YUrfjR59OEGsmptQ88bnOz3qJermXxnqMgf+1cA3RG9IHj5y?=
 =?us-ascii?Q?OYpuAKNcC/QjMgasMXgFbvp6LteZNaTcqTH0SXCaKH+C0/YsEwH7P1iv2iU/?=
 =?us-ascii?Q?sOFLkoAlN4xQF4xEh81PrDhDdlTKmvG/B8ZbIZCRUbYSQ/CAVtFmxLdWpfq9?=
 =?us-ascii?Q?0EsBX+Yy9PPfgyOQM3SVc3J2j6BYxw/gpcXH0GJZerz5R0rBAksnxGnanEzY?=
 =?us-ascii?Q?Eq00c7moIMhB/4TyZKh4NkCPZbbm8ElLVhgiOWeGLCIoO5orfLkPu8TnvP73?=
 =?us-ascii?Q?esLMgDsbqw97e8ffPRLCJxAN+nP6xvzFDwITUOgkihc609+ii9LJUcu+EKtN?=
 =?us-ascii?Q?0led/ONxi50YMG2HEAgyoHq2aImMfQPnhuOn5GKpwCCSHlap6i1FhdCycZbK?=
 =?us-ascii?Q?tGUgyJIdf3kFqy5fK9ZEudzTsx5KvJCiVeMag6X3hFHfneu7lHm+o/v2C3gO?=
 =?us-ascii?Q?lTNmfPjtQqZfso2ss+WbIDKzXSUNPWU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b9801d70-d789-4af0-1c7e-08da2128b494
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 10:46:34.0235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XiMstV+udOTkCik0QOTuMqeKPkjehZMNW9ZTh2/7Vx918wLBCyFdiaLKuHpneTj5fHH5KjOT+RLSjXDDAxojrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3673
X-Proofpoint-ORIG-GUID: ab4LeChnekSJNnIqOHRwf3xw51aRHp11
X-Proofpoint-GUID: ab4LeChnekSJNnIqOHRwf3xw51aRHp11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180065
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7182

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../nerdctl/nerdctl/modules.txt               |  72 +++---
 recipes-containers/nerdctl/nerdctl_git.bb     | 205 +++++++++---------
 2 files changed, 137 insertions(+), 140 deletions(-)

diff --git a/recipes-containers/nerdctl/nerdctl/modules.txt b/recipes-conta=
iners/nerdctl/nerdctl/modules.txt
index 3b144736..5f90f206 100644
--- a/recipes-containers/nerdctl/nerdctl/modules.txt
+++ b/recipes-containers/nerdctl/nerdctl/modules.txt
@@ -1,36 +1,38 @@
+# github.com/Masterminds/semver/v3 v3.1.1
+## explicit
 # github.com/Microsoft/go-winio v0.5.2
 ## explicit
-# github.com/compose-spec/compose-go v1.0.9
+# github.com/compose-spec/compose-go v1.1.0
 ## explicit
 # github.com/containerd/cgroups v1.0.3
 ## explicit
 # github.com/containerd/console v1.0.3
 ## explicit
-# github.com/containerd/containerd v1.6.0
+# github.com/containerd/containerd v1.6.2
 ## explicit
 # github.com/containerd/continuity v0.2.2
 ## explicit
-# github.com/containerd/go-cni v1.1.3
+# github.com/containerd/go-cni v1.1.4
 ## explicit
-# github.com/containerd/imgcrypt v1.1.3
+# github.com/containerd/imgcrypt v1.1.4
 ## explicit
-# github.com/containerd/stargz-snapshotter v0.11.0
+# github.com/containerd/stargz-snapshotter v0.11.3
 ## explicit
-# github.com/containerd/stargz-snapshotter/estargz v0.11.0
+# github.com/containerd/stargz-snapshotter/estargz v0.11.3
 ## explicit
-# github.com/containerd/stargz-snapshotter/ipfs v0.11.0
+# github.com/containerd/stargz-snapshotter/ipfs v0.11.3
 ## explicit
 # github.com/containerd/typeurl v1.0.2
 ## explicit
 # github.com/containernetworking/cni v1.0.1
 ## explicit
-# github.com/containernetworking/plugins v1.0.1
+# github.com/containernetworking/plugins v1.1.1
 ## explicit
 # github.com/cyphar/filepath-securejoin v0.2.3
 ## explicit
-# github.com/docker/cli v20.10.12+incompatible
+# github.com/docker/cli v20.10.14+incompatible
 ## explicit
-# github.com/docker/docker v20.10.12+incompatible
+# github.com/docker/docker v20.10.14+incompatible
 ## explicit
 # github.com/docker/go-connections v0.4.0
 ## explicit
@@ -48,9 +50,7 @@
 ## explicit
 # github.com/ipfs/go-ipfs-http-client v0.2.0
 ## explicit
-# github.com/ipfs/interface-go-ipfs-core v0.5.2
-## explicit
-# github.com/jaytaylor/go-hostsfile v0.0.0-20211120191712-f53f85d8b98f
+# github.com/ipfs/interface-go-ipfs-core v0.6.1
 ## explicit
 # github.com/mattn/go-isatty v0.0.14
 ## explicit
@@ -60,35 +60,35 @@
 ## explicit
 # github.com/opencontainers/go-digest v1.0.0
 ## explicit
-# github.com/opencontainers/image-spec v1.0.3-0.20211215212317-ea0209f50ae1
+# github.com/opencontainers/image-spec v1.0.3-0.20220303224323-02efb9a75ee1
 ## explicit
-# github.com/opencontainers/runtime-spec v1.0.3-0.20211214071223-8958f9303=
9ab
+# github.com/opencontainers/runtime-spec v1.0.3-0.20220311020903-6969a0a09=
ab1
 ## explicit
 # github.com/pelletier/go-toml v1.9.4
 ## explicit
-# github.com/rootless-containers/bypass4netns v0.1.1-0.20220214050838-562b=
4845f47e
+# github.com/rootless-containers/bypass4netns v0.2.2
 ## explicit
-# github.com/rootless-containers/rootlesskit v0.14.6
+# github.com/rootless-containers/rootlesskit v1.0.0
 ## explicit
 # github.com/sirupsen/logrus v1.8.1
 ## explicit
-# github.com/spf13/cobra v1.3.0
+# github.com/spf13/cobra v1.4.0
 ## explicit
 # github.com/spf13/pflag v1.0.5
 ## explicit
 # github.com/tidwall/gjson v1.14.0
 ## explicit
-# github.com/vishvananda/netlink v1.1.1-0.20220125195016-0639e7e787ba
+# github.com/vishvananda/netlink v1.1.1-0.20220318152240-083e92e21eeb
 ## explicit
 # github.com/vishvananda/netns v0.0.0-20211101163701-50045581ed74
 ## explicit
-# golang.org/x/crypto v0.0.0-20211215153901-e495a2d5b3d3
+# golang.org/x/crypto v0.0.0-20220321153916-2c7772ba3064
 ## explicit
-# golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd
+# golang.org/x/net v0.0.0-20220225172249-27dd8689420f
 ## explicit
 # golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
 ## explicit
-# golang.org/x/sys v0.0.0-20220128215802-99c3d69c2c27
+# golang.org/x/sys v0.0.0-20220319134239-a9b59b0215f8
 ## explicit
 # golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
 ## explicit
@@ -112,7 +112,7 @@
 ## explicit
 # github.com/containerd/ttrpc v1.1.0
 ## explicit
-# github.com/containers/ocicrypt v1.1.2
+# github.com/containers/ocicrypt v1.1.3
 ## explicit
 # github.com/coreos/go-systemd/v22 v22.3.2
 ## explicit
@@ -156,31 +156,31 @@
 ## explicit
 # github.com/ipfs/go-block-format v0.0.3
 ## explicit
-# github.com/ipfs/go-blockservice v0.1.7
+# github.com/ipfs/go-blockservice v0.3.0
 ## explicit
-# github.com/ipfs/go-datastore v0.4.5
+# github.com/ipfs/go-datastore v0.5.0
 ## explicit
-# github.com/ipfs/go-ipfs-blockstore v0.1.6
+# github.com/ipfs/go-ipfs-blockstore v1.2.0
 ## explicit
 # github.com/ipfs/go-ipfs-cmds v0.6.0
 ## explicit
-# github.com/ipfs/go-ipfs-ds-help v0.1.1
+# github.com/ipfs/go-ipfs-ds-help v1.1.0
 ## explicit
-# github.com/ipfs/go-ipfs-exchange-interface v0.0.1
+# github.com/ipfs/go-ipfs-exchange-interface v0.1.0
 ## explicit
 # github.com/ipfs/go-ipfs-util v0.0.2
 ## explicit
 # github.com/ipfs/go-ipld-cbor v0.0.5
 ## explicit
-# github.com/ipfs/go-ipld-format v0.2.0
+# github.com/ipfs/go-ipld-format v0.3.0
 ## explicit
 # github.com/ipfs/go-ipld-legacy v0.1.0
 ## explicit
 # github.com/ipfs/go-log v1.0.5
 ## explicit
-# github.com/ipfs/go-log/v2 v2.1.3
+# github.com/ipfs/go-log/v2 v2.3.0
 ## explicit
-# github.com/ipfs/go-merkledag v0.4.0
+# github.com/ipfs/go-merkledag v0.6.0
 ## explicit
 # github.com/ipfs/go-metrics-interface v0.0.1
 ## explicit
@@ -196,7 +196,7 @@
 ## explicit
 # github.com/jbenet/goprocess v0.1.4
 ## explicit
-# github.com/klauspost/compress v1.14.2
+# github.com/klauspost/compress v1.15.1
 ## explicit
 # github.com/klauspost/cpuid/v2 v2.0.6
 ## explicit
@@ -212,7 +212,7 @@
 ## explicit
 # github.com/matttproud/golang_protobuf_extensions v1.0.2-0.20181231171920=
-c182affec369
 ## explicit
-# github.com/miekg/pkcs11 v1.0.3
+# github.com/miekg/pkcs11 v1.1.1
 ## explicit
 # github.com/minio/blake2b-simd v0.0.0-20160723061019-3f5f724cb5b1
 ## explicit
@@ -254,7 +254,7 @@
 ## explicit
 # github.com/polydawn/refmt v0.0.0-20201211092308-30ac6d18308e
 ## explicit
-# github.com/prometheus/client_golang v1.12.0
+# github.com/prometheus/client_golang v1.12.1
 ## explicit
 # github.com/prometheus/client_model v0.2.0
 ## explicit
@@ -302,7 +302,7 @@
 ## explicit
 # google.golang.org/genproto v0.0.0-20220126215142-9970aeb2e350
 ## explicit
-# google.golang.org/grpc v1.44.0
+# google.golang.org/grpc v1.45.0
 ## explicit
 # google.golang.org/protobuf v1.27.1
 ## explicit
@@ -310,4 +310,4 @@
 ## explicit
 # github.com/ktock/golang-lru v0.5.5-0.20211029085301-ec551be6f75c
 ## explicit
-# github.com/hashicorp/golang-lru  =3D> github.com/ktock/golang-lru v0.5.5=
-0.20211029085301-ec551be6f75c
+# github.com/hashicorp/golang-lru =3D> github.com/ktock/golang-lru v0.5.5-=
0.20211029085301-ec551be6f75c
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers=
/nerdctl/nerdctl_git.bb
index e0e87de4..c402c578 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -9,19 +9,23 @@ DEPENDS =3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
=20
-#SRCREV_FORMAT=3D"nerdcli_cgroups"
-SRCREV_nerdcli =3D "f2427ffbd1dd67231722fb307f39eecf702de980"
+SRCREV_nerdcli =3D "77276ff0fffad3f855ab9f2f5a4ad5527ef76485"
=20
 SRC_URI =3D "git://github.com/containerd/nerdctl.git;name=3Dnerdcli;branch=
=3Dmaster;protocol=3Dhttps"
=20
+# 	github.com/Masterminds/semver/v3 v3.1.1
+# [1] git ls-remote https://github.com/Masterminds/semver/v3 v3.1.1
+SRCREV_semver=3D"d387ce7889a157b19ad7694dba39a562051f41b0"
+SRC_URI +=3D "git://github.com/Masterminds/semver;name=3Dsemver;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/Masterminds/semver/v3"
+
 # 	github.com/Microsoft/go-winio v0.5.2
 # [1] git ls-remote https://github.com/Microsoft/go-winio dfd7da8f92a38299=
9d77b5d9cfe8cc6bec1894c6=20
 SRCREV_go-winio=3D"dfd7da8f92a382999d77b5d9cfe8cc6bec1894c6"
 SRC_URI +=3D "git://github.com/Microsoft/go-winio;name=3Dgo-winio;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/Microsoft/go-winio"
=20
-# 	github.com/compose-spec/compose-go v1.0.9
-# [1] git ls-remote https://github.com/compose-spec/compose-go ad7931673da=
9b06dd2a326d91a2ab015d62a31d8=20
-SRCREV_compose-go=3D"ad7931673da9b06dd2a326d91a2ab015d62a31d8"
+# 	github.com/compose-spec/compose-go v1.1.0
+# [1] git ls-remote https://github.com/compose-spec/compose-go 8c0547c3943=
78beefe7100ffd419b476fb99eb60
+SRCREV_compose-go=3D"8c0547c394378beefe7100ffd419b476fb99eb60"
 SRC_URI +=3D "git://github.com/compose-spec/compose-go;name=3Dcompose-go;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/compose-spec/compose-go"
=20
 # 	github.com/containerd/cgroups v1.0.3
@@ -34,9 +38,9 @@ SRC_URI +=3D "git://github.com/containerd/cgroups;name=3D=
cgroups;protocol=3Dhttps;nobr
 SRCREV_console=3D"060a791de16aeb90b3bb4dcd78dfec3ca45fa5df"
 SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/containerd/console"
=20
-# 	github.com/containerd/containerd v1.6.0
-# [1] git ls-remote https://github.com/containerd/containerd 13a9d2087b04c=
1a99ba3fb3159fbd6b2493ca6dd=20
-SRCREV_containerd=3D"13a9d2087b04c1a99ba3fb3159fbd6b2493ca6dd"
+# 	github.com/containerd/containerd v1.6.2
+# [1] git ls-remote https://github.com/containerd/containerd v1.6.2
+SRCREV_containerd =3D "b30221197bbf818a48ec3f20f5e72a739f84ebeb"
 SRC_URI +=3D "git://github.com/containerd/containerd;name=3Dcontainerd;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/containerd/containerd"
=20
 # 	github.com/containerd/continuity v0.2.2
@@ -44,19 +48,19 @@ SRC_URI +=3D "git://github.com/containerd/containerd;na=
me=3Dcontainerd;protocol=3Dhttp
 SRCREV_continuity=3D"3a5e5b882aed17b35e1cea5bbc0a4c26b40ab268"
 SRC_URI +=3D "git://github.com/containerd/continuity;name=3Dcontinuity;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/containerd/continuity"
=20
-# 	github.com/containerd/go-cni v1.1.3
-# [1] git ls-remote https://github.com/containerd/go-cni d3dcbd535b9e30516=
7e3d27e1b8cd7bbd4c3c382=20
-SRCREV_go-cni=3D"d3dcbd535b9e305167e3d27e1b8cd7bbd4c3c382"
+# 	github.com/containerd/go-cni v1.1.4
+# [1] git ls-remote https://github.com/containerd/go-cni v1.1.4
+SRCREV_go-cni =3D "1ae42404d2502e705c1c61de9c254a7cd7f6e74b"
 SRC_URI +=3D "git://github.com/containerd/go-cni;name=3Dgo-cni;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/containerd/go-cni"
=20
-# 	github.com/containerd/imgcrypt v1.1.3
-# [1] git ls-remote https://github.com/containerd/imgcrypt 41198ab93e7616c=
40a1ed505256a664b81fe84c1=20
-SRCREV_imgcrypt=3D"41198ab93e7616c40a1ed505256a664b81fe84c1"
+# 	github.com/containerd/imgcrypt v1.1.4
+# [1] git ls-remote https://github.com/containerd/imgcrypt v1.1.4
+SRCREV_imgcrypt =3D "7931b2f099de27afc80e84df85f9361ee6668dd1"
 SRC_URI +=3D "git://github.com/containerd/imgcrypt;name=3Dimgcrypt;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/containerd/imgcrypt"
=20
-# 	github.com/containerd/stargz-snapshotter v0.11.0
-# [1] git ls-remote https://github.com/containerd/stargz-snapshotter 7216b=
07a2f8f0ec3ec1fb8c6ac8a933c70b82eec=20
-SRCREV_stargz-snapshotter=3D"7216b07a2f8f0ec3ec1fb8c6ac8a933c70b82eec"
+# 	github.com/containerd/stargz-snapshotter v0.11.3
+# [1] git ls-remote https://github.com/containerd/stargz-snapshotter v0.11=
.3
+SRCREV_stargz-snapshotter =3D "84c8e540467f8701fbf1ba7fb9fce749fdbaf160"
 SRC_URI +=3D "git://github.com/containerd/stargz-snapshotter;name=3Dstargz=
-snapshotter;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/sr=
c/import/vendor.fetch/github.com/containerd/stargz-snapshotter"
=20
 # 	github.com/containerd/typeurl v1.0.2
@@ -69,9 +73,9 @@ SRC_URI +=3D "git://github.com/containerd/typeurl;name=3D=
typeurl;protocol=3Dhttps;nobr
 SRCREV_cni=3D"1694fd7b57e0176a98a12823a5ffc03337fdc152"
 SRC_URI +=3D "git://github.com/containernetworking/cni;name=3Dcni;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/containernetworking/cni"
=20
-# 	github.com/containernetworking/plugins v1.0.1
-# [1] git ls-remote https://github.com/containernetworking/plugins 56d8364=
f1bd3fa0d35717936ec5cd385e61d3815=20
-SRCREV_plugins=3D"56d8364f1bd3fa0d35717936ec5cd385e61d3815"
+# 	github.com/containernetworking/plugins v1.1.1
+# [1] git ls-remote https://github.com/containernetworking/plugins v1.1.1
+SRCREV_plugins =3D "587d42b2ca2b8fb2f111b50fd90f0089cc03b8ad"
 SRC_URI +=3D "git://github.com/containernetworking/plugins;name=3Dplugins;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/containernetworking/plugins"
=20
 # 	github.com/cyphar/filepath-securejoin v0.2.3
@@ -79,14 +83,14 @@ SRC_URI +=3D "git://github.com/containernetworking/plug=
ins;name=3Dplugins;protocol=3Dh
 SRCREV_filepath-securejoin=3D"a89baba1e4f44c5512e245cbd156de1293d6185a"
 SRC_URI +=3D "git://github.com/cyphar/filepath-securejoin;name=3Dfilepath-=
securejoin;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/=
import/vendor.fetch/github.com/cyphar/filepath-securejoin"
=20
-# 	github.com/docker/cli v20.10.12+incompatible
-# [1] git ls-remote https://github.com/docker/cli 60293e390eba4de1a06309b7=
5bbf61dd7a45bbcb=20
-SRCREV_cli=3D"60293e390eba4de1a06309b75bbf61dd7a45bbcb"
+# 	github.com/docker/cli v20.10.14+incompatible
+# [1] git ls-remote https://github.com/docker/cli v20.10.14
+SRCREV_cli=3D"0a7772e9b73210a9c25df0d1d74a6566b5e410eb"
 SRC_URI +=3D "git://github.com/docker/cli;name=3Dcli;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/d=
ocker/cli"
=20
 # 	github.com/docker/docker v20.10.12+incompatible
-# [1] git ls-remote https://github.com/docker/docker bd6d47cb470e2c31acaef=
7dc0da42dc8cfb42085=20
-SRCREV_docker=3D"bd6d47cb470e2c31acaef7dc0da42dc8cfb42085"
+# [1] git ls-remote https://github.com/docker/docker v20.10.14
+SRCREV_docker=3D"0ea83a3744846f1b998016406c457c3d6c68c7a6"
 SRC_URI +=3D "git://github.com/docker/docker;name=3Ddocker;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/docker/docker"
=20
 # 	github.com/docker/go-connections v0.4.0
@@ -129,16 +133,11 @@ SRC_URI +=3D "git://github.com/ipfs/go-ipfs-files;nam=
e=3Dgo-ipfs-files;protocol=3Dhttp
 SRCREV_go-ipfs-http-client=3D"434ac969c653f7c4781144aaa2834b5f8828ce22"
 SRC_URI +=3D "git://github.com/ipfs/go-ipfs-http-client;name=3Dgo-ipfs-htt=
p-client;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/github.com/ipfs/go-ipfs-http-client"
=20
-# 	github.com/ipfs/interface-go-ipfs-core v0.5.2
-# [1] git ls-remote https://github.com/ipfs/interface-go-ipfs-core 275b80e=
1f34ead0fb06a9216e3bffee57a01b636=20
-SRCREV_interface-go-ipfs-core=3D"275b80e1f34ead0fb06a9216e3bffee57a01b636"
+# 	github.com/ipfs/interface-go-ipfs-core v0.6.1
+# [1] git ls-remote https://github.com/ipfs/interface-go-ipfs-core v0.6.1
+SRCREV_interface-go-ipfs-core =3D "d61758a39392e9853a304189a26c3e546e00ee3=
a"
 SRC_URI +=3D "git://github.com/ipfs/interface-go-ipfs-core;name=3Dinterfac=
e-go-ipfs-core;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/github.com/ipfs/interface-go-ipfs-core"
=20
-# 	github.com/jaytaylor/go-hostsfile v0.0.0-20211120191712-f53f85d8b98f
-# [1] git ls-remote https://github.com/jaytaylor/go-hostsfile f53f85d8b98f=
8f4925bceab7890a431e2f46c38f=20
-SRCREV_go-hostsfile=3D"f53f85d8b98f8f4925bceab7890a431e2f46c38f"
-SRC_URI +=3D "git://github.com/jaytaylor/go-hostsfile;name=3Dgo-hostsfile;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/jaytaylor/go-hostsfile"
-
 # 	github.com/mattn/go-isatty v0.0.14
 # [1] git ls-remote https://github.com/mattn/go-isatty 504425e14f742f1f517=
c4586048b49b37f829c8e=20
 SRCREV_go-isatty=3D"504425e14f742f1f517c4586048b49b37f829c8e"
@@ -159,14 +158,14 @@ SRC_URI +=3D "git://github.com/multiformats/go-multia=
ddr;name=3Dgo-multiaddr;protoco
 SRCREV_go-digest=3D"4a41a1fddd8208cc64f911e551a7f361716f8ae5"
 SRC_URI +=3D "git://github.com/opencontainers/go-digest;name=3Dgo-digest;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/opencontainers/go-digest"
=20
-# 	github.com/opencontainers/image-spec v1.0.3-0.20211215212317-ea0209f50a=
e1
-# [1] git ls-remote https://github.com/opencontainers/image-spec ea0209f50=
ae1a3707cff054cdb6b7487050487de=20
-SRCREV_image-spec=3D"ea0209f50ae1a3707cff054cdb6b7487050487de"
+# 	github.com/opencontainers/image-spec v1.0.3-0.20220303224323-02efb9a75e=
e1
+# [1] git ls-remote https://github.com/opencontainers/image-spec 02efb9a75=
ee11e05937b535cc5f228f9343ab2f5=20
+SRCREV_image-spec=3D"02efb9a75ee11e05937b535cc5f228f9343ab2f5"
 SRC_URI +=3D "git://github.com/opencontainers/image-spec;name=3Dimage-spec=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/opencontainers/image-spec"
=20
-# 	github.com/opencontainers/runtime-spec v1.0.3-0.20211214071223-8958f930=
39ab
-# [1] git ls-remote https://github.com/opencontainers/runtime-spec 8958f93=
039ab90be53d803cd7e231a775f644451=20
-SRCREV_runtime-spec=3D"8958f93039ab90be53d803cd7e231a775f644451"
+# 	github.com/opencontainers/runtime-spec v1.0.3-0.20220311020903-6969a0a0=
9ab1
+# [1] git ls-remote https://github.com/opencontainers/runtime-spec 6969a0a=
09ab162a574cafcc9ac814e498962c943=20
+SRCREV_runtime-spec=3D"6969a0a09ab162a574cafcc9ac814e498962c943"
 SRC_URI +=3D "git://github.com/opencontainers/runtime-spec;name=3Druntime-=
spec;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/opencontainers/runtime-spec"
=20
 # 	github.com/pelletier/go-toml v1.9.4
@@ -174,14 +173,14 @@ SRC_URI +=3D "git://github.com/opencontainers/runtime=
-spec;name=3Druntime-spec;proto
 SRCREV_go-toml=3D"b8ba995eaaba4be30c8a8090bdfb4aa61af52054"
 SRC_URI +=3D "git://github.com/pelletier/go-toml;name=3Dgo-toml;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/pelletier/go-toml"
=20
-# 	github.com/rootless-containers/bypass4netns v0.1.1-0.20220214050838-562=
b4845f47e
-# [1] git ls-remote https://github.com/rootless-containers/bypass4netns 56=
2b4845f47e3bb1019e37369948845a27ef5b58=20
-SRCREV_bypass4netns=3D"562b4845f47e3bb1019e37369948845a27ef5b58"
+# 	github.com/rootless-containers/bypass4netns v0.2.2
+# [1] git ls-remote https://github.com/rootless-containers/bypass4netns c3=
682687bc69a704c4ca312ab61febe2606c9680
+SRCREV_bypass4netns=3D"c3682687bc69a704c4ca312ab61febe2606c9680"
 SRC_URI +=3D "git://github.com/rootless-containers/bypass4netns;name=3Dbyp=
ass4netns;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/rootless-containers/bypass4netns"
=20
-# 	github.com/rootless-containers/rootlesskit v0.14.6
-# [1] git ls-remote https://github.com/rootless-containers/rootlesskit 0f8=
8c14fd0966e018bb8f0eefc57c5283459a56c=20
-SRCREV_rootlesskit=3D"0f88c14fd0966e018bb8f0eefc57c5283459a56c"
+# 	github.com/rootless-containers/rootlesskit v1.0.0
+# [1] git ls-remote https://github.com/rootless-containers/rootlesskit v1.=
0.0
+SRCREV_rootlesskit =3D "4c5afdcdb381581c7eaaea09ac9cdf226b8dda03"
 SRC_URI +=3D "git://github.com/rootless-containers/rootlesskit;name=3Droot=
lesskit;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/imp=
ort/vendor.fetch/github.com/rootless-containers/rootlesskit"
=20
 # 	github.com/sirupsen/logrus v1.8.1
@@ -189,9 +188,9 @@ SRC_URI +=3D "git://github.com/rootless-containers/root=
lesskit;name=3Drootlesskit;pr
 SRCREV_logrus=3D"bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
 SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/sirupsen/logrus"
=20
-# 	github.com/spf13/cobra v1.3.0
-# [1] git ls-remote https://github.com/spf13/cobra 178edbb247f35e466578211=
dcf5f4892dbbd369b=20
-SRCREV_cobra=3D"178edbb247f35e466578211dcf5f4892dbbd369b"
+# 	github.com/spf13/cobra v1.4.0
+# [1] git ls-remote https://github.com/spf13/cobra v1.4.0
+SRCREV_cobra =3D "5b2b9e9f61d36ccb66167301f76a2292c3729855"
 SRC_URI +=3D "git://github.com/spf13/cobra;name=3Dcobra;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/spf13/cobra"
=20
 # 	github.com/spf13/pflag v1.0.5
@@ -204,9 +203,9 @@ SRC_URI +=3D "git://github.com/spf13/pflag;name=3Dpflag=
;protocol=3Dhttps;nobranch=3D1;de
 SRCREV_gjson=3D"7a94820afd8a0d993c07b9cde761b95943823a9f"
 SRC_URI +=3D "git://github.com/tidwall/gjson;name=3Dgjson;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/tidwall/gjson"
=20
-# 	github.com/vishvananda/netlink v1.1.1-0.20220125195016-0639e7e787ba
-# [1] git ls-remote https://github.com/vishvananda/netlink 0639e7e787ba725=
7fc7d097a14d203b1cf1fece9=20
-SRCREV_netlink=3D"0639e7e787ba7257fc7d097a14d203b1cf1fece9"
+# 	github.com/vishvananda/netlink v1.1.1-0.20220318152240-083e92e21eeb
+# [1] git ls-remote https://github.com/vishvananda/netlink 083e92e21eebde7=
a218b0da26a7a1b27c9b5e0f0
+SRCREV_netlink=3D"083e92e21eebde7a218b0da26a7a1b27c9b5e0f0"
 SRC_URI +=3D "git://github.com/vishvananda/netlink;name=3Dnetlink;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/vishvananda/netlink"
=20
 # 	github.com/vishvananda/netns v0.0.0-20211101163701-50045581ed74
@@ -214,14 +213,14 @@ SRC_URI +=3D "git://github.com/vishvananda/netlink;na=
me=3Dnetlink;protocol=3Dhttps;nob
 SRCREV_netns=3D"50045581ed74c15eded78746bae9fb3df07d6655"
 SRC_URI +=3D "git://github.com/vishvananda/netns;name=3Dnetns;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/vishvananda/netns"
=20
-# 	golang.org/x/crypto v0.0.0-20211215153901-e495a2d5b3d3
-# [1] git ls-remote https://go.googlesource.com/crypto e495a2d5b3d3be43468=
d0ebb413f46eeaedf7eb3=20
-SRCREV_crypto=3D"e495a2d5b3d3be43468d0ebb413f46eeaedf7eb3"
+# 	golang.org/x/crypto v0.0.0-20220321153916-2c7772ba3064
+# [1] git ls-remote https://go.googlesource.com/crypto 2c7772ba30643b7a202=
6cbea938420dce7c6384d
+SRCREV_crypto=3D"2c7772ba30643b7a2026cbea938420dce7c6384d"
 SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/crypto"
=20
-# 	golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd
-# [1] git ls-remote https://go.googlesource.com/net cd36cc0744dd695657988f=
15f08446dc81e16efc=20
-SRCREV_net=3D"cd36cc0744dd695657988f15f08446dc81e16efc"
+# 	golang.org/x/net v0.0.0-20220225172249-27dd8689420f
+# [1] git ls-remote https://go.googlesource.com/net 27dd8689420fcde0885143=
97d015e4fea5174e0e
+SRCREV_net=3D"27dd8689420fcde088514397d015e4fea5174e0e"
 SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googles=
ource.com/net"
=20
 # 	golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
@@ -229,9 +228,9 @@ SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;=
protocol=3Dhttps;nobranch=3D1;des
 SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
 SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/sync"
=20
-# 	golang.org/x/sys v0.0.0-20220128215802-99c3d69c2c27
-# [1] git ls-remote https://go.googlesource.com/sys 99c3d69c2c27d4f16bc6cb=
2698ad877a3ba5fe75=20
-SRCREV_sys=3D"99c3d69c2c27d4f16bc6cb2698ad877a3ba5fe75"
+# 	golang.org/x/sys v0.0.0-20220319134239-a9b59b0215f8
+# [1] git ls-remote https://go.googlesource.com/sys a9b59b0215f867c0675d50=
602208ab8c4f4fe9c7
+SRCREV_sys=3D"a9b59b0215f867c0675d50602208ab8c4f4fe9c7"
 SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googles=
ource.com/sys"
=20
 # 	golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
@@ -289,9 +288,9 @@ SRC_URI +=3D "git://github.com/containerd/fifo;name=3Df=
ifo;protocol=3Dhttps;nobranch=3D1
 SRCREV_ttrpc=3D"5e8fe05f04c91bc8713ee4241e58d0b9da1c4a59"
 SRC_URI +=3D "git://github.com/containerd/ttrpc;name=3Dttrpc;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/containerd/ttrpc"
=20
-# 	github.com/containers/ocicrypt v1.1.2
-# [1] git ls-remote https://github.com/containers/ocicrypt 1272152ccae67a2=
c3a4ed543d72b7e42928c99bb=20
-SRCREV_ocicrypt=3D"1272152ccae67a2c3a4ed543d72b7e42928c99bb"
+# 	github.com/containers/ocicrypt v1.1.3
+# [1] git ls-remote https://github.com/containers/ocicrypt v1.1.3
+SRCREV_ocicrypt =3D "01e7d427cd74fec566a69393e3de805df382f77c"
 SRC_URI +=3D "git://github.com/containers/ocicrypt;name=3Docicrypt;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/containers/ocicrypt"
=20
 # 	github.com/coreos/go-systemd/v22 v22.3.2
@@ -399,19 +398,19 @@ SRC_URI +=3D "git://github.com/ipfs/bbloom;name=3Dbbl=
oom;protocol=3Dhttps;nobranch=3D1;d
 SRCREV_go-block-format=3D"b30b45004baf0d2dcd3d1b5b5604fb4c0ccb0825"
 SRC_URI +=3D "git://github.com/ipfs/go-block-format;name=3Dgo-block-format=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/ipfs/go-block-format"
=20
-# 	github.com/ipfs/go-blockservice v0.1.7
-# [1] git ls-remote https://github.com/ipfs/go-blockservice 7e86180be5c295=
9033db973c0eae033de03dd423=20
-SRCREV_go-blockservice=3D"7e86180be5c2959033db973c0eae033de03dd423"
+# 	github.com/ipfs/go-blockservice v0.3.0
+# [1] git ls-remote https://github.com/ipfs/go-blockservice v0.3.0
+SRCREV_go-blockservice =3D "888c7cc7c29cf4752865ce2e856237cb1d5c85b2"
 SRC_URI +=3D "git://github.com/ipfs/go-blockservice;name=3Dgo-blockservice=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/ipfs/go-blockservice"
=20
-# 	github.com/ipfs/go-datastore v0.4.5
-# [1] git ls-remote https://github.com/ipfs/go-datastore 73ce3192124c5781b=
c875f2e5d4f483ab8de0d04=20
-SRCREV_go-datastore=3D"73ce3192124c5781bc875f2e5d4f483ab8de0d04"
+# 	github.com/ipfs/go-datastore v0.5.0
+# [1] git ls-remote https://github.com/ipfs/go-datastore v0.5.0
+SRCREV_go-datastore =3D "7548998537794105418980aeb5dac19802712392"
 SRC_URI +=3D "git://github.com/ipfs/go-datastore;name=3Dgo-datastore;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/ipfs/go-datastore"
=20
-# 	github.com/ipfs/go-ipfs-blockstore v0.1.6
-# [1] git ls-remote https://github.com/ipfs/go-ipfs-blockstore 95a1a08b33f=
8e55a45a4c306f6f05cf91e8f0728=20
-SRCREV_go-ipfs-blockstore=3D"95a1a08b33f8e55a45a4c306f6f05cf91e8f0728"
+# 	github.com/ipfs/go-ipfs-blockstore v1.2.0
+# [1] git ls-remote https://github.com/ipfs/go-ipfs-blockstore v1.2.0
+SRCREV_go-ipfs-blockstore =3D "ffd43a8d91e6ee80b26d3a6eca5b8c4816c5508b"
 SRC_URI +=3D "git://github.com/ipfs/go-ipfs-blockstore;name=3Dgo-ipfs-bloc=
kstore;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impo=
rt/vendor.fetch/github.com/ipfs/go-ipfs-blockstore"
=20
 # 	github.com/ipfs/go-ipfs-cmds v0.6.0
@@ -419,14 +418,14 @@ SRC_URI +=3D "git://github.com/ipfs/go-ipfs-blockstor=
e;name=3Dgo-ipfs-blockstore;pro
 SRCREV_go-ipfs-cmds=3D"4ade007405e5d3befb14184290576c63cc43a6a3"
 SRC_URI +=3D "git://github.com/ipfs/go-ipfs-cmds;name=3Dgo-ipfs-cmds;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/ipfs/go-ipfs-cmds"
=20
-# 	github.com/ipfs/go-ipfs-ds-help v0.1.1
-# [1] git ls-remote https://github.com/ipfs/go-ipfs-ds-help 48b9cc210923d2=
3b39582b5fa6670ed0d08dc2af=20
-SRCREV_go-ipfs-ds-help=3D"48b9cc210923d23b39582b5fa6670ed0d08dc2af"
+# 	github.com/ipfs/go-ipfs-ds-help v1.1.0
+# [1] git ls-remote https://github.com/ipfs/go-ipfs-ds-help v1.1.0
+SRCREV_go-ipfs-ds-help =3D "0ce85d6dd676a9c7d3018dd79f43b2b1d7f31082"
 SRC_URI +=3D "git://github.com/ipfs/go-ipfs-ds-help;name=3Dgo-ipfs-ds-help=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/ipfs/go-ipfs-ds-help"
=20
-# 	github.com/ipfs/go-ipfs-exchange-interface v0.0.1
-# [1] git ls-remote https://github.com/ipfs/go-ipfs-exchange-interface b6e=
88260772433e18af18bb3f237d78678e65f0b=20
-SRCREV_go-ipfs-exchange-interface=3D"b6e88260772433e18af18bb3f237d78678e65=
f0b"
+# 	github.com/ipfs/go-ipfs-exchange-interface v0.1.0
+# [1] git ls-remote https://github.com/ipfs/go-ipfs-exchange-interface v0.=
1.0
+SRCREV_go-ipfs-exchange-interface =3D "2e7c882a034eacabca59c5cd2d9ab959c2d=
a78f7"
 SRC_URI +=3D "git://github.com/ipfs/go-ipfs-exchange-interface;name=3Dgo-i=
pfs-exchange-interface;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR=
}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-ipfs-exchange-interface"
=20
 # 	github.com/ipfs/go-ipfs-util v0.0.2
@@ -439,9 +438,9 @@ SRC_URI +=3D "git://github.com/ipfs/go-ipfs-util;name=
=3Dgo-ipfs-util;protocol=3Dhttps;
 SRCREV_go-ipld-cbor=3D"f689d2bb3874cf3fafb71721cafb2c945234e781"
 SRC_URI +=3D "git://github.com/ipfs/go-ipld-cbor;name=3Dgo-ipld-cbor;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/ipfs/go-ipld-cbor"
=20
-# 	github.com/ipfs/go-ipld-format v0.2.0
-# [1] git ls-remote https://github.com/ipfs/go-ipld-format c582c36b708672f=
99752a0b6171adec7820e0049=20
-SRCREV_go-ipld-format=3D"c582c36b708672f99752a0b6171adec7820e0049"
+# 	github.com/ipfs/go-ipld-format v0.3.0
+# [1] git ls-remote https://github.com/ipfs/go-ipld-format v0.3.0
+SRCREV_go-ipld-format =3D "c545ab0d87f91c656e48d1adf0ec4dcf4d21f1dc"
 SRC_URI +=3D "git://github.com/ipfs/go-ipld-format;name=3Dgo-ipld-format;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/ipfs/go-ipld-format"
=20
 # 	github.com/ipfs/go-ipld-legacy v0.1.0
@@ -454,14 +453,14 @@ SRC_URI +=3D "git://github.com/ipfs/go-ipld-legacy;na=
me=3Dgo-ipld-legacy;protocol=3Dht
 SRCREV_go-log=3D"0e04229b160a92ebd2a924d9078e087161c8d53f"
 SRC_URI +=3D "git://github.com/ipfs/go-log;name=3Dgo-log;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/ipfs/go-log"
=20
-# 	github.com/ipfs/go-log/v2 v2.1.3
-# [1] git ls-remote https://github.com/ipfs/go-log 7f9ba9d7836afbe44710289=
d1c3a7c111f093149=20
-SRCREV_v212=3D"7f9ba9d7836afbe44710289d1c3a7c111f093149"
-SRC_URI +=3D "git://github.com/ipfs/go-log;name=3Dv212;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/ipfs/go-log/v2"
+# 	github.com/ipfs/go-log/v2 v2.3.0
+# [1] git ls-remote https://github.com/ipfs/go-log v2.3.0
+SRCREV_go-log2 =3D "2c2975b5095a771b0d8066a458b944ac71591bc7"
+SRC_URI +=3D "git://github.com/ipfs/go-log;name=3Dgo-log2;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/ipfs/go-log/v2"
=20
-# 	github.com/ipfs/go-merkledag v0.4.0
-# [1] git ls-remote https://github.com/ipfs/go-merkledag 8794146d52c211b8a=
f0456e734a248649e636be0=20
-SRCREV_go-merkledag=3D"8794146d52c211b8af0456e734a248649e636be0"
+# 	github.com/ipfs/go-merkledag v0.6.0
+# [1] git ls-remote https://github.com/ipfs/go-merkledag v0.6.0
+SRCREV_go-merkledag =3D "c076715ad64cccb1976de3686b0d6304ec3f2839"
 SRC_URI +=3D "git://github.com/ipfs/go-merkledag;name=3Dgo-merkledag;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/ipfs/go-merkledag"
=20
 # 	github.com/ipfs/go-metrics-interface v0.0.1
@@ -499,9 +498,9 @@ SRC_URI +=3D "git://github.com/ipld/go-ipld-prime;name=
=3Dgo-ipld-prime;protocol=3Dhttp
 SRCREV_goprocess=3D"23d20c20149e1f362afda26f4500cb9d6393f0ad"
 SRC_URI +=3D "git://github.com/jbenet/goprocess;name=3Dgoprocess;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/jbenet/goprocess"
=20
-# 	github.com/klauspost/compress v1.14.2
-# [1] git ls-remote https://github.com/klauspost/compress 7f260be218b66dc1=
c5b2d6be2d5c0925aa9a4a0d=20
-SRCREV_compress=3D"7f260be218b66dc1c5b2d6be2d5c0925aa9a4a0d"
+# 	github.com/klauspost/compress v1.15.1
+# [1] git ls-remote https://github.com/klauspost/compress v1.15.1
+SRCREV_compress =3D "7c7079ec1ed2c07fd15e6f3f369dbae5288051d5"
 SRC_URI +=3D "git://github.com/klauspost/compress;name=3Dcompress;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/klauspost/compress"
=20
 # 	github.com/klauspost/cpuid/v2 v2.0.6
@@ -539,9 +538,9 @@ SRC_URI +=3D "git://github.com/mattn/go-shellwords;name=
=3Dgo-shellwords;protocol=3Dhtt
 SRCREV_golang_protobuf_extensions=3D"c182affec369e30f25d3eb8cd8a478dee585a=
e7d"
 SRC_URI +=3D "git://github.com/matttproud/golang_protobuf_extensions;name=
=3Dgolang_protobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protobu=
f_extensions"
=20
-# 	github.com/miekg/pkcs11 v1.0.3
-# [1] git ls-remote https://github.com/miekg/pkcs11 210dc1e16747c5ba98a03b=
cbcf728c38086ea357=20
-SRCREV_pkcs11=3D"210dc1e16747c5ba98a03bcbcf728c38086ea357"
+# 	github.com/miekg/pkcs11 v1.1.1
+# [1] git ls-remote https://github.com/miekg/pkcs11 v1.1.1
+SRCREV_pkcs11 =3D "f3481918a208bd212aa995a41f92d786eb418a7d"
 SRC_URI +=3D "git://github.com/miekg/pkcs11;name=3Dpkcs11;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/miekg/pkcs11"
=20
 # 	github.com/minio/blake2b-simd v0.0.0-20160723061019-3f5f724cb5b1
@@ -634,9 +633,9 @@ SRC_URI +=3D "git://github.com/pkg/errors;name=3Derrors=
;protocol=3Dhttps;nobranch=3D1;de
 SRCREV_refmt=3D"30ac6d18308e584ca6a2e74ba81475559db94c5f"
 SRC_URI +=3D "git://github.com/polydawn/refmt;name=3Drefmt;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/polydawn/refmt"
=20
-# 	github.com/prometheus/client_golang v1.12.0
-# [1] git ls-remote https://github.com/prometheus/client_golang 01087964d0=
2726ef7438fdb19c2672e6e5d0b48a=20
-SRCREV_client_golang=3D"01087964d02726ef7438fdb19c2672e6e5d0b48a"
+# 	github.com/prometheus/client_golang v1.12.1
+# [1] git ls-remote https://github.com/prometheus/client_golang v1.12.1
+SRCREV_client_golang =3D "2e1c4818ccfdcf953ce399cadad615ff2bed968c"
 SRC_URI +=3D "git://github.com/prometheus/client_golang;name=3Dclient_gola=
ng;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/prometheus/client_golang"
=20
 # 	github.com/prometheus/client_model v0.2.0
@@ -754,9 +753,9 @@ SRC_URI +=3D "git://go.googlesource.com/xerrors;name=3D=
xerrors;protocol=3Dhttps;nobran
 SRCREV_genproto=3D"9970aeb2e350469c6bdc3e220a3ddecf38a85f61"
 SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dgenproto;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/google.golang.org/genproto"
=20
-# 	google.golang.org/grpc v1.44.0
-# [1] git ls-remote https://github.com/grpc/grpc-go b4c5e24c7373b22c6c38d6=
8379c39ecdc616a968=20
-SRCREV_grpc=3D"b4c5e24c7373b22c6c38d68379c39ecdc616a968"
+# 	google.golang.org/grpc v1.45.0
+# [1] git ls-remote https://github.com/grpc/grpc-go v1.45.0
+SRCREV_grpc=3D"a82cc96f07c960e02623688e4067ae6b7895334a"
 SRC_URI +=3D "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.go=
lang.org/grpc"
=20
 # 	google.golang.org/protobuf v1.27.1
@@ -781,8 +780,6 @@ SRC_URI +=3D "file://0001-Makefile-allow-external-speci=
fication-of-build-setti.pat
             file://modules.txt \
            "
=20
-SRC_URI[sha256sum] =3D "d7b05a9bff34dfb25abe7e5b1e54cf2607f953d91cb33fb231=
a4775a1a4afa3d"
-
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D3b83ef96387f14655fc8=
54ddc3c6bd57"
=20
@@ -790,7 +787,7 @@ GO_IMPORT =3D "import"
=20
 # S =3D "${WORKDIR}/git"
=20
-PV =3D "v0.17.0"
+PV =3D "v0.18.0"
=20
 NERDCTL_PKG =3D "github.com/containerd/nerdctl"
=20
@@ -824,7 +821,7 @@ do_compile() {
=20
 	# this moves all the fetches into the proper vendor structure
 	# expected for build
-	sites=3D"github.com/Microsoft/go-winio:github.com/Microsoft/go-winio gith=
ub.com/compose-spec/compose-go:github.com/compose-spec/compose-go github.co=
m/containerd/cgroups:github.com/containerd/cgroups github.com/containerd/co=
nsole:github.com/containerd/console github.com/containerd/containerd:github=
.com/containerd/containerd github.com/containerd/continuity:github.com/cont=
ainerd/continuity github.com/containerd/go-cni:github.com/containerd/go-cni=
 github.com/containerd/imgcrypt:github.com/containerd/imgcrypt github.com/c=
ontainerd/stargz-snapshotter:github.com/containerd/stargz-snapshotter githu=
b.com/containerd/stargz-snapshotter/estargz:github.com/containerd/stargz-sn=
apshotter//estargz github.com/containerd/stargz-snapshotter/ipfs:github.com=
/containerd/stargz-snapshotter//ipfs github.com/containerd/typeurl:github.c=
om/containerd/typeurl github.com/containernetworking/cni:github.com/contain=
ernetworking/cni github.com/containernetworking/plugins:github.com/containe=
rnetworking/plugins github.com/cyphar/filepath-securejoin:github.com/cyphar=
/filepath-securejoin github.com/docker/cli:github.com/docker/cli github.com=
/docker/docker:github.com/docker/docker github.com/docker/go-connections:gi=
thub.com/docker/go-connections github.com/docker/go-units:github.com/docker=
/go-units github.com/fatih/color:github.com/fatih/color github.com/gogo/pro=
tobuf:github.com/gogo/protobuf github.com/hashicorp/go-multierror:github.co=
m/hashicorp/go-multierror github.com/ipfs/go-cid:github.com/ipfs/go-cid git=
hub.com/ipfs/go-ipfs-files:github.com/ipfs/go-ipfs-files github.com/ipfs/go=
-ipfs-http-client:github.com/ipfs/go-ipfs-http-client github.com/ipfs/inter=
face-go-ipfs-core:github.com/ipfs/interface-go-ipfs-core github.com/jaytayl=
or/go-hostsfile:github.com/jaytaylor/go-hostsfile github.com/mattn/go-isatt=
y:github.com/mattn/go-isatty github.com/moby/sys/mount:github.com/moby/sys/=
mount//mount github.com/moby/sys/mountinfo:github.com/moby/sys/mount//mount=
info github.com/moby/sys/signal:github.com/moby/sys/mount//signal github.co=
m/multiformats/go-multiaddr:github.com/multiformats/go-multiaddr github.com=
/opencontainers/go-digest:github.com/opencontainers/go-digest github.com/op=
encontainers/image-spec:github.com/opencontainers/image-spec github.com/ope=
ncontainers/runtime-spec:github.com/opencontainers/runtime-spec github.com/=
pelletier/go-toml:github.com/pelletier/go-toml github.com/rootless-containe=
rs/bypass4netns:github.com/rootless-containers/bypass4netns github.com/root=
less-containers/rootlesskit:github.com/rootless-containers/rootlesskit gith=
ub.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/spf13/cobra:gi=
thub.com/spf13/cobra github.com/spf13/pflag:github.com/spf13/pflag github.c=
om/tidwall/gjson:github.com/tidwall/gjson github.com/vishvananda/netlink:gi=
thub.com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishva=
nanda/netns golang.org/x/crypto:go.googlesource.com/crypto golang.org/x/net=
:go.googlesource.com/net golang.org/x/sync:go.googlesource.com/sync golang.=
org/x/sys:go.googlesource.com/sys golang.org/x/term:go.googlesource.com/ter=
m gopkg.in/yaml.v2:gopkg.in/yaml.v2 gotest.tools/v3:github.com/gotestyourse=
lf/gotest.tools/v3 github.com/Azure/go-ansiterm:github.com/Azure/go-ansiter=
m github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim github.com/beor=
n7/perks:github.com/beorn7/perks github.com/btcsuite/btcd:github.com/btcsui=
te/btcd github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 github.co=
m/cilium/ebpf:github.com/cilium/ebpf github.com/containerd/fifo:github.com/=
containerd/fifo github.com/containerd/ttrpc:github.com/containerd/ttrpc git=
hub.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/coreo=
s/go-systemd/v22:github.com/coreos/go-systemd/v22 github.com/cpuguy83/go-md=
2man/v2:github.com/cpuguy83/go-md2man/v2 github.com/crackcomm/go-gitignore:=
github.com/crackcomm/go-gitignore github.com/distribution/distribution/v3:g=
ithub.com/distribution/distribution/v3 github.com/docker/distribution:githu=
b.com/docker/distribution github.com/docker/docker-credential-helpers:githu=
b.com/docker/docker-credential-helpers github.com/docker/go-events:github.c=
om/docker/go-events github.com/docker/go-metrics:github.com/docker/go-metri=
cs github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.com/gogo/goog=
leapis:github.com/gogo/googleapis github.com/golang/groupcache:github.com/g=
olang/groupcache github.com/golang/protobuf:github.com/golang/protobuf gith=
ub.com/google/go-cmp:github.com/google/go-cmp github.com/google/uuid:github=
.com/google/uuid github.com/gorilla/mux:github.com/gorilla/mux github.com/h=
ashicorp/errwrap:github.com/hashicorp/errwrap github.com/hashicorp/golang-l=
ru:github.com/hashicorp/golang-lru github.com/imdario/mergo:github.com/imda=
rio/mergo github.com/inconshreveable/mousetrap:github.com/inconshreveable/m=
ousetrap github.com/ipfs/bbloom:github.com/ipfs/bbloom github.com/ipfs/go-b=
lock-format:github.com/ipfs/go-block-format github.com/ipfs/go-blockservice=
:github.com/ipfs/go-blockservice github.com/ipfs/go-datastore:github.com/ip=
fs/go-datastore github.com/ipfs/go-ipfs-blockstore:github.com/ipfs/go-ipfs-=
blockstore github.com/ipfs/go-ipfs-cmds:github.com/ipfs/go-ipfs-cmds github=
.com/ipfs/go-ipfs-ds-help:github.com/ipfs/go-ipfs-ds-help github.com/ipfs/g=
o-ipfs-exchange-interface:github.com/ipfs/go-ipfs-exchange-interface github=
.com/ipfs/go-ipfs-util:github.com/ipfs/go-ipfs-util github.com/ipfs/go-ipld=
-cbor:github.com/ipfs/go-ipld-cbor github.com/ipfs/go-ipld-format:github.co=
m/ipfs/go-ipld-format github.com/ipfs/go-ipld-legacy:github.com/ipfs/go-ipl=
d-legacy github.com/ipfs/go-log:github.com/ipfs/go-log github.com/ipfs/go-l=
og/v2:github.com/ipfs/go-log/v2 github.com/ipfs/go-merkledag:github.com/ipf=
s/go-merkledag github.com/ipfs/go-metrics-interface:github.com/ipfs/go-metr=
ics-interface github.com/ipfs/go-path:github.com/ipfs/go-path github.com/ip=
fs/go-unixfs:github.com/ipfs/go-unixfs github.com/ipfs/go-verifcid:github.c=
om/ipfs/go-verifcid github.com/ipld/go-codec-dagpb:github.com/ipld/go-codec=
-dagpb github.com/ipld/go-ipld-prime:github.com/ipld/go-ipld-prime github.c=
om/jbenet/goprocess:github.com/jbenet/goprocess github.com/klauspost/compre=
ss:github.com/klauspost/compress github.com/klauspost/cpuid/v2:github.com/k=
lauspost/cpuid/v2 github.com/libp2p/go-buffer-pool:github.com/libp2p/go-buf=
fer-pool github.com/libp2p/go-libp2p-core:github.com/libp2p/go-libp2p-core =
github.com/libp2p/go-openssl:github.com/libp2p/go-openssl github.com/mattn/=
go-colorable:github.com/mattn/go-colorable github.com/mattn/go-shellwords:g=
ithub.com/mattn/go-shellwords github.com/matttproud/golang_protobuf_extensi=
ons:github.com/matttproud/golang_protobuf_extensions github.com/miekg/pkcs1=
1:github.com/miekg/pkcs11 github.com/minio/blake2b-simd:github.com/minio/bl=
ake2b-simd github.com/minio/sha256-simd:github.com/minio/sha256-simd github=
.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir github.com/mitche=
llh/mapstructure:github.com/mitchellh/mapstructure github.com/moby/locker:g=
ithub.com/moby/locker github.com/moby/term:github.com/moby/term github.com/=
morikuni/aec:github.com/morikuni/aec github.com/mr-tron/base58:github.com/m=
r-tron/base58 github.com/multiformats/go-base32:github.com/multiformats/go-=
base32 github.com/multiformats/go-base36:github.com/multiformats/go-base36 =
github.com/multiformats/go-multibase:github.com/multiformats/go-multibase g=
ithub.com/multiformats/go-multihash:github.com/multiformats/go-multihash gi=
thub.com/multiformats/go-varint:github.com/multiformats/go-varint github.co=
m/opencontainers/runc:github.com/opencontainers/runc github.com/opencontain=
ers/selinux:github.com/opencontainers/selinux github.com/opentracing/opentr=
acing-go:github.com/opentracing/opentracing-go github.com/pkg/errors:github=
.com/pkg/errors github.com/polydawn/refmt:github.com/polydawn/refmt github.=
com/prometheus/client_golang:github.com/prometheus/client_golang github.com=
/prometheus/client_model:github.com/prometheus/client_model github.com/prom=
etheus/common:github.com/prometheus/common github.com/prometheus/procfs:git=
hub.com/prometheus/procfs github.com/rs/cors:github.com/rs/cors github.com/=
russross/blackfriday/v2:github.com/russross/blackfriday/v2 github.com/space=
monkeygo/spacelog:github.com/spacemonkeygo/spacelog github.com/stefanberger=
/go-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/tidwall/match=
:github.com/tidwall/match github.com/tidwall/pretty:github.com/tidwall/pret=
ty github.com/urfave/cli:github.com/urfave/cli github.com/vbatts/tar-split:=
github.com/vbatts/tar-split github.com/whyrusleeping/cbor-gen:github.com/wh=
yrusleeping/cbor-gen github.com/xeipuuv/gojsonpointer:github.com/xeipuuv/go=
jsonpointer github.com/xeipuuv/gojsonreference:github.com/xeipuuv/gojsonref=
erence github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonschema go.m=
ozilla.org/pkcs7:go.mozilla.org/pkcs7 go.opencensus.io:go.opencensus.io go.=
uber.org/atomic:go.uber.org/atomic go.uber.org/multierr:go.uber.org/multier=
r go.uber.org/zap:go.uber.org/zap golang.org/x/text:go.googlesource.com/tex=
t golang.org/x/xerrors:go.googlesource.com/xerrors google.golang.org/genpro=
to:google.golang.org/genproto google.golang.org/grpc:google.golang.org/grpc=
 google.golang.org/protobuf:google.golang.org/protobuf gopkg.in/square/go-j=
ose.v2:gopkg.in/square/go-jose.v2 github.com/hashicorp/golang-lru :github.c=
om/hashicorp/golang-lru "
+	sites=3D"github.com/Masterminds/semver/v3:github.com/Masterminds/semver/v=
3 github.com/Microsoft/go-winio:github.com/Microsoft/go-winio github.com/co=
mpose-spec/compose-go:github.com/compose-spec/compose-go github.com/contain=
erd/cgroups:github.com/containerd/cgroups github.com/containerd/console:git=
hub.com/containerd/console github.com/containerd/containerd:github.com/cont=
ainerd/containerd github.com/containerd/continuity:github.com/containerd/co=
ntinuity github.com/containerd/go-cni:github.com/containerd/go-cni github.c=
om/containerd/imgcrypt:github.com/containerd/imgcrypt github.com/containerd=
/stargz-snapshotter:github.com/containerd/stargz-snapshotter github.com/con=
tainerd/stargz-snapshotter/estargz:github.com/containerd/stargz-snapshotter=
//estargz github.com/containerd/stargz-snapshotter/ipfs:github.com/containe=
rd/stargz-snapshotter//ipfs github.com/containerd/typeurl:github.com/contai=
nerd/typeurl github.com/containernetworking/cni:github.com/containernetwork=
ing/cni github.com/containernetworking/plugins:github.com/containernetworki=
ng/plugins github.com/cyphar/filepath-securejoin:github.com/cyphar/filepath=
-securejoin github.com/docker/cli:github.com/docker/cli github.com/docker/d=
ocker:github.com/docker/docker github.com/docker/go-connections:github.com/=
docker/go-connections github.com/docker/go-units:github.com/docker/go-units=
 github.com/fatih/color:github.com/fatih/color github.com/gogo/protobuf:git=
hub.com/gogo/protobuf github.com/hashicorp/go-multierror:github.com/hashico=
rp/go-multierror github.com/ipfs/go-cid:github.com/ipfs/go-cid github.com/i=
pfs/go-ipfs-files:github.com/ipfs/go-ipfs-files github.com/ipfs/go-ipfs-htt=
p-client:github.com/ipfs/go-ipfs-http-client github.com/ipfs/interface-go-i=
pfs-core:github.com/ipfs/interface-go-ipfs-core github.com/mattn/go-isatty:=
github.com/mattn/go-isatty github.com/moby/sys/mount:github.com/moby/sys/mo=
unt//mount github.com/moby/sys/mountinfo:github.com/moby/sys/mount//mountin=
fo github.com/moby/sys/signal:github.com/moby/sys/mount//signal github.com/=
multiformats/go-multiaddr:github.com/multiformats/go-multiaddr github.com/o=
pencontainers/go-digest:github.com/opencontainers/go-digest github.com/open=
containers/image-spec:github.com/opencontainers/image-spec github.com/openc=
ontainers/runtime-spec:github.com/opencontainers/runtime-spec github.com/pe=
lletier/go-toml:github.com/pelletier/go-toml github.com/rootless-containers=
/bypass4netns:github.com/rootless-containers/bypass4netns github.com/rootle=
ss-containers/rootlesskit:github.com/rootless-containers/rootlesskit github=
.com/sirupsen/logrus:github.com/sirupsen/logrus github.com/spf13/cobra:gith=
ub.com/spf13/cobra github.com/spf13/pflag:github.com/spf13/pflag github.com=
/tidwall/gjson:github.com/tidwall/gjson github.com/vishvananda/netlink:gith=
ub.com/vishvananda/netlink github.com/vishvananda/netns:github.com/vishvana=
nda/netns golang.org/x/crypto:go.googlesource.com/crypto golang.org/x/net:g=
o.googlesource.com/net golang.org/x/sync:go.googlesource.com/sync golang.or=
g/x/sys:go.googlesource.com/sys golang.org/x/term:go.googlesource.com/term =
gopkg.in/yaml.v2:gopkg.in/yaml.v2 gotest.tools/v3:github.com/gotestyourself=
/gotest.tools/v3 github.com/Azure/go-ansiterm:github.com/Azure/go-ansiterm =
github.com/Microsoft/hcsshim:github.com/Microsoft/hcsshim github.com/beorn7=
/perks:github.com/beorn7/perks github.com/btcsuite/btcd:github.com/btcsuite=
/btcd github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 github.com/=
cilium/ebpf:github.com/cilium/ebpf github.com/containerd/fifo:github.com/co=
ntainerd/fifo github.com/containerd/ttrpc:github.com/containerd/ttrpc githu=
b.com/containers/ocicrypt:github.com/containers/ocicrypt github.com/coreos/=
go-systemd/v22:github.com/coreos/go-systemd/v22 github.com/cpuguy83/go-md2m=
an/v2:github.com/cpuguy83/go-md2man/v2 github.com/crackcomm/go-gitignore:gi=
thub.com/crackcomm/go-gitignore github.com/distribution/distribution/v3:git=
hub.com/distribution/distribution/v3 github.com/docker/distribution:github.=
com/docker/distribution github.com/docker/docker-credential-helpers:github.=
com/docker/docker-credential-helpers github.com/docker/go-events:github.com=
/docker/go-events github.com/docker/go-metrics:github.com/docker/go-metrics=
 github.com/godbus/dbus/v5:github.com/godbus/dbus/v5 github.com/gogo/google=
apis:github.com/gogo/googleapis github.com/golang/groupcache:github.com/gol=
ang/groupcache github.com/golang/protobuf:github.com/golang/protobuf github=
.com/google/go-cmp:github.com/google/go-cmp github.com/google/uuid:github.c=
om/google/uuid github.com/gorilla/mux:github.com/gorilla/mux github.com/has=
hicorp/errwrap:github.com/hashicorp/errwrap github.com/hashicorp/golang-lru=
:github.com/hashicorp/golang-lru github.com/imdario/mergo:github.com/imdari=
o/mergo github.com/inconshreveable/mousetrap:github.com/inconshreveable/mou=
setrap github.com/ipfs/bbloom:github.com/ipfs/bbloom github.com/ipfs/go-blo=
ck-format:github.com/ipfs/go-block-format github.com/ipfs/go-blockservice:g=
ithub.com/ipfs/go-blockservice github.com/ipfs/go-datastore:github.com/ipfs=
/go-datastore github.com/ipfs/go-ipfs-blockstore:github.com/ipfs/go-ipfs-bl=
ockstore github.com/ipfs/go-ipfs-cmds:github.com/ipfs/go-ipfs-cmds github.c=
om/ipfs/go-ipfs-ds-help:github.com/ipfs/go-ipfs-ds-help github.com/ipfs/go-=
ipfs-exchange-interface:github.com/ipfs/go-ipfs-exchange-interface github.c=
om/ipfs/go-ipfs-util:github.com/ipfs/go-ipfs-util github.com/ipfs/go-ipld-c=
bor:github.com/ipfs/go-ipld-cbor github.com/ipfs/go-ipld-format:github.com/=
ipfs/go-ipld-format github.com/ipfs/go-ipld-legacy:github.com/ipfs/go-ipld-=
legacy github.com/ipfs/go-log:github.com/ipfs/go-log github.com/ipfs/go-log=
/v2:github.com/ipfs/go-log/v2 github.com/ipfs/go-merkledag:github.com/ipfs/=
go-merkledag github.com/ipfs/go-metrics-interface:github.com/ipfs/go-metric=
s-interface github.com/ipfs/go-path:github.com/ipfs/go-path github.com/ipfs=
/go-unixfs:github.com/ipfs/go-unixfs github.com/ipfs/go-verifcid:github.com=
/ipfs/go-verifcid github.com/ipld/go-codec-dagpb:github.com/ipld/go-codec-d=
agpb github.com/ipld/go-ipld-prime:github.com/ipld/go-ipld-prime github.com=
/jbenet/goprocess:github.com/jbenet/goprocess github.com/klauspost/compress=
:github.com/klauspost/compress github.com/klauspost/cpuid/v2:github.com/kla=
uspost/cpuid/v2 github.com/libp2p/go-buffer-pool:github.com/libp2p/go-buffe=
r-pool github.com/libp2p/go-libp2p-core:github.com/libp2p/go-libp2p-core gi=
thub.com/libp2p/go-openssl:github.com/libp2p/go-openssl github.com/mattn/go=
-colorable:github.com/mattn/go-colorable github.com/mattn/go-shellwords:git=
hub.com/mattn/go-shellwords github.com/matttproud/golang_protobuf_extension=
s:github.com/matttproud/golang_protobuf_extensions github.com/miekg/pkcs11:=
github.com/miekg/pkcs11 github.com/minio/blake2b-simd:github.com/minio/blak=
e2b-simd github.com/minio/sha256-simd:github.com/minio/sha256-simd github.c=
om/mitchellh/go-homedir:github.com/mitchellh/go-homedir github.com/mitchell=
h/mapstructure:github.com/mitchellh/mapstructure github.com/moby/locker:git=
hub.com/moby/locker github.com/moby/term:github.com/moby/term github.com/mo=
rikuni/aec:github.com/morikuni/aec github.com/mr-tron/base58:github.com/mr-=
tron/base58 github.com/multiformats/go-base32:github.com/multiformats/go-ba=
se32 github.com/multiformats/go-base36:github.com/multiformats/go-base36 gi=
thub.com/multiformats/go-multibase:github.com/multiformats/go-multibase git=
hub.com/multiformats/go-multihash:github.com/multiformats/go-multihash gith=
ub.com/multiformats/go-varint:github.com/multiformats/go-varint github.com/=
opencontainers/runc:github.com/opencontainers/runc github.com/opencontainer=
s/selinux:github.com/opencontainers/selinux github.com/opentracing/opentrac=
ing-go:github.com/opentracing/opentracing-go github.com/pkg/errors:github.c=
om/pkg/errors github.com/polydawn/refmt:github.com/polydawn/refmt github.co=
m/prometheus/client_golang:github.com/prometheus/client_golang github.com/p=
rometheus/client_model:github.com/prometheus/client_model github.com/promet=
heus/common:github.com/prometheus/common github.com/prometheus/procfs:githu=
b.com/prometheus/procfs github.com/rs/cors:github.com/rs/cors github.com/ru=
ssross/blackfriday/v2:github.com/russross/blackfriday/v2 github.com/spacemo=
nkeygo/spacelog:github.com/spacemonkeygo/spacelog github.com/stefanberger/g=
o-pkcs11uri:github.com/stefanberger/go-pkcs11uri github.com/tidwall/match:g=
ithub.com/tidwall/match github.com/tidwall/pretty:github.com/tidwall/pretty=
 github.com/urfave/cli:github.com/urfave/cli github.com/vbatts/tar-split:gi=
thub.com/vbatts/tar-split github.com/whyrusleeping/cbor-gen:github.com/whyr=
usleeping/cbor-gen github.com/xeipuuv/gojsonpointer:github.com/xeipuuv/gojs=
onpointer github.com/xeipuuv/gojsonreference:github.com/xeipuuv/gojsonrefer=
ence github.com/xeipuuv/gojsonschema:github.com/xeipuuv/gojsonschema go.moz=
illa.org/pkcs7:go.mozilla.org/pkcs7 go.opencensus.io:go.opencensus.io go.ub=
er.org/atomic:go.uber.org/atomic go.uber.org/multierr:go.uber.org/multierr =
go.uber.org/zap:go.uber.org/zap golang.org/x/text:go.googlesource.com/text =
golang.org/x/xerrors:go.googlesource.com/xerrors google.golang.org/genproto=
:google.golang.org/genproto google.golang.org/grpc:google.golang.org/grpc g=
oogle.golang.org/protobuf:google.golang.org/protobuf gopkg.in/square/go-jos=
e.v2:gopkg.in/square/go-jose.v2 github.com/hashicorp/golang-lru :github.com=
/hashicorp/golang-lru "
 	for s in $sites; do
             site_dest=3D$(echo $s | cut -d: -f1)
             site_source=3D$(echo $s | cut -d: -f2)
--=20
2.33.0


