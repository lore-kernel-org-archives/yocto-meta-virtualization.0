Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C691C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 02:27:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33854.1737512851478565101
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 18:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M204O3000556
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 18:27:31 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqg0r0mk-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 18:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIMC3iylbGTcjSzJu7AIrqZjYY+B87yTcrAaRcw5mWe7f9NKuP2wWreoBfPCRJ5thx6L+UckleJXTmmE5vYE5BJAXyzO7AcbhtgFMmfNMVhTdWlLrefUzwxLM+S1hbsiffxSCCanzUAP47jqG6p29DmxkNAlwSq2TsZ8EAGKcMXlu7l2ykHdj823hMayzPegnv5OYSPj2fDu16jhNjNOzn3nnEr/Dfaiwk+XXTkDn61Zd3jPGILK/brIqU1bjuwAYI0iy1h2YRFSBCzP1Zvbb7eZx0uceyrSxTt899pr2vZlPpftpqVUBR/VCUH2YKhQVcm48PTaEq6+KwBYlBFy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHor5yHlivDgULnv6JmOnio2fmkXGx18GHTk6LPwG70=;
 b=dZ4b1lZIWFSYMeHhThSh7kfvFpdLebfD3clmYphWLlZWrFRvOzPkkO5NWe2j+ar4xQvLT4673KHrTBbN5zR+8QReKSxESJ3qasA2jlXBV3xz1/KI+XM00o9/xKyOOVrjQwKyhRQsYhixx/wonXB+LWIJFwjMUUgV5pChuGZ/ejFc5QPf6sSBeYQW0U8GkDjo0wlUSDRzcaCq5/bBoTuoHyUO6Bi+Y9i9JjtyoHSechkh0l4Y3J+KgFQvYmYIAFd5s1mPgRjsAspVMZq1a4Ivcs7s58YGsEJ6OtjKWtxlMGyda32fFvnwFGA4hwXRY3S0TLEK5O1sizjvB7r0/71FoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.22; Wed, 22 Jan 2025 02:27:26 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 02:27:26 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH 2/3] buildah: fix CVE-2024-9676
Date: Tue, 21 Jan 2025 18:27:13 -0800
Message-Id: <20250122022714.1792229-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122022714.1792229-1-Qi.Chen@windriver.com>
References: <20250122022714.1792229-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c14f2d3-5ec1-4700-0cdf-08dd3a8c4f8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zXT1UP6cVEBFZk4UlVw70ZIu73bts4Nb+Hw4siMDNFMt5ky8zJ1Gfi6VWnR2?=
 =?us-ascii?Q?Js3FRG8ZNBnCIhh7npMoQBNg6P1H+pGIiugdWAxg+/hvqVfaDdZDTueevjcl?=
 =?us-ascii?Q?0cgVjoublUQSHhvO2xWmu60aATH3yVcmsAohmyEhYG8ivaUSLLHKFS8BwRWr?=
 =?us-ascii?Q?f4d+uEsafO7xhTrqZKsa3/rm0G+iUGva/E9hQbm+LTgVDWKVrPy7tIp6g9Hg?=
 =?us-ascii?Q?kmQfKG3fYdtB/t92a2KQp1zWkS6/RlyJ9ZFDyXi4hpWpAp3t36uGpvplKWIf?=
 =?us-ascii?Q?E4bcz13l4Ly7tmaOCnWONYfAyn3p2T+PDS9oOM4emkWgWqvgoAsZNnKwlUkh?=
 =?us-ascii?Q?5eFUbPXagXG4soewTqvPVagcieX2hirjGBB2touK74n9sVg4L/5gGiukJXB8?=
 =?us-ascii?Q?P7pge7/Q6AW1DDMK2Y084LvReANXyOUEEj/CGIUaEmRWiIRWa86sSHGTMV3L?=
 =?us-ascii?Q?tOANJThu7qsXIZUUtTd/YuwGNUy8rPsGCHOs9sGZZ55lW0Bm3tqEo/4IQPra?=
 =?us-ascii?Q?RraP2x/lGD4GFtuNkKqxiIV2PaqXRxaxeVRpwUtGTpFcjL3eyaZ6te02nVI9?=
 =?us-ascii?Q?Ku++deq/+uIlbwJgmy4mngxXBMk41pmGSe6mQF6mCWM+049CKnaU4v7Ckjmh?=
 =?us-ascii?Q?dm+ziSGimajdgBShDEqF5JXPvSL27irDDVElNVJ/eJN4OOJfwpwmFsyPiHBi?=
 =?us-ascii?Q?w72ZRbLYJkcFjxRdmo1I+6HHVSpjN0r4WecR1ViWDFfwgbV1mjfa0NWCAXlA?=
 =?us-ascii?Q?XKCK7uoXR84anjLFhXc4Mc6QxKstHhB7JixGLRQB3pwDDbSzkv8pJzicuirl?=
 =?us-ascii?Q?FnI9YcLVnTTvuDAJre+/UYZrQXHjoic4mzispbgy1KzWRsKieP7aHWpg0t5E?=
 =?us-ascii?Q?3pa0GAXjdd54iIfIqmXUX08UEaFp5bmC1zi0UzoK18UtGNE3BhAUfcKWKFwk?=
 =?us-ascii?Q?9ijm2Bm7Y45TGP/qp/FUNfHABh9wZihwHvDLusu2Va6fmYnYKx1iPUPOPQzY?=
 =?us-ascii?Q?ePk4IcJJTcKe3L5iaod4mF6VkUiwUcHSCZsL6SNhPGZAL0bXq6sxDIIzqpFx?=
 =?us-ascii?Q?9XfVaMVoliK/SJyOINaWKn0RIdw2GV63UZ5fxGMPJrmm8cVN176ndt8l3dib?=
 =?us-ascii?Q?/jghqBGKNNWHDmDSJ3bW+9GNFK+9pXEhD/ICp0GJAH4ixUYCi0LYVT4D5s4I?=
 =?us-ascii?Q?D5yaMD5/0x3+AxH+wDJmIwYsIfyfARyzQL/z+4MVu18C80I83z0LGJyLfbew?=
 =?us-ascii?Q?Mz6FoIqddeSirtNEI6K1IDIWpazg7p7K0mknqZi+gwmsZ4luapoYHvywzyaB?=
 =?us-ascii?Q?DeVytmgEnwEllSyk0+7EYAaZRZqLqrpsASfCgdnxj4KoxIcb+yQ0wRL31Igc?=
 =?us-ascii?Q?45x3LBD38loB7o/usYGUtyfvr7o5dZl6eX3KiGVa7DjGryG/gg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iTITEe9AaS78snlPRbdy6+ALgm2PTjOOsrMuuSHzigdmYhqdOH1exqSQ8Vn4?=
 =?us-ascii?Q?9TwfdoWKZLjDrnLdj24JxXgfcdEGRwAKSpR4MTxN0HZcOWkA7MKBwRZ3n37d?=
 =?us-ascii?Q?eEghd/NVdjrvVqWeLJl78qyUT14xhK68OxGVusi5NO6K3LuHf+/5r+78Oif0?=
 =?us-ascii?Q?UZ4ZZsgXAhuBu3ST+DdXrYOC6Zu5mqfjH6Ui+TzHL6vsCdR9gESHdar5VCwB?=
 =?us-ascii?Q?hgG4cO9oLFizuyDGRZuFgen5Ue9kQHc7GbCbz1zfN3pkhrOys9hWFhtyw+GJ?=
 =?us-ascii?Q?SgaL5+qLpHLb8jLqv5eYs0jV47SNglIaUrzmr+kGIF7932XyOCib3FwRrocj?=
 =?us-ascii?Q?FkO1VXPFIpkMSLNHdpZfkj3stHkpJ4ORAlwN9YPIv3m42bsAVFVsavqnu25k?=
 =?us-ascii?Q?4wPzdAEeWlsmGqGx+KpXTMqoHCRZalu7fryGzRziPMoFTL4pYKs0A5BQdnbh?=
 =?us-ascii?Q?P8s5auW/HIvydCtdRJJy1iFjd7LrQQt5AQy+6QkyrSXnP8uBSsq8UINZn9PK?=
 =?us-ascii?Q?ew03behM15E07XK/JRoC8iZKjcLw8LoinJ23IEMu8cj31QNmRCKh+RkNHEJw?=
 =?us-ascii?Q?ESo4CU9nSumM93g6KmFejWjpphb2peymU4u9YmCMbAh4iYZt0lM2y3ltKJ+J?=
 =?us-ascii?Q?WpanbXaxEhjoiX1MTiS7wZ87WN7wlmWBhbxbsOdZIVjJPve97c1dmJRJUc+X?=
 =?us-ascii?Q?AR2SuvCa1CdmVesPDCUyWnBMNrEsJxY+MFET2bSAl/2x+Sg0ld5Tgwl5W0Vt?=
 =?us-ascii?Q?/H7x3+qwDwEJwq7G/IEOgYY1G6RGwAvFxksIQbCMpg2CyyF02XPKBNn9pStn?=
 =?us-ascii?Q?E5H7IgY6SIcOnXNONI2TOSF0OTqW2n4SdiLzLH0DY+fI11liSm90C6T/u/cW?=
 =?us-ascii?Q?3WOWZAhRfYEDjF5QNLL09o+G9rIrrTZnxaXVoQ65FrTMcJ+x28iWBZkclZJ+?=
 =?us-ascii?Q?/wJqu1KupN0X3kksHZViAHisaWvXzG2FgnHXg4pod8SaqY0KsuqTog7p9PSe?=
 =?us-ascii?Q?jtuwGDNtjrPXTP2/8KI6256qjl5m16FijVYgqdkSiOz6KXOz4/xLqnLgUysz?=
 =?us-ascii?Q?wSyqiQbWziB3xj8Rv0hpY7qvHC1AkDsZQhttUbK2vQBEIRX1/SJuPedu7+kG?=
 =?us-ascii?Q?MKOzOK6rtAPq0FkjOSqCThRR+rFZlnGpVLOOx9r555ryBKq6w28W6+HiZz20?=
 =?us-ascii?Q?xxRdIwog5zN46Wxwzh+Ph3Sa6NEfFeErJcn+KSB5klUs2/l39/G04OVLlPtr?=
 =?us-ascii?Q?mWzSI7ZARxmXlPfLu+ZDxEZMXtVOIg5ypIvVYQDe5JFAr2SgPHnO4+cGa4kC?=
 =?us-ascii?Q?xf9wB3iKg5g/XqO0ikbN5gyPd0jEeEjUA/Ib7AUxv1SpLVLnIC1BKSFOBw0I?=
 =?us-ascii?Q?IWD4EsP8IjI91+gJCH6Oo858ecskW2Y+93zkIdq41n5DMga1gRrkXDR+yuuD?=
 =?us-ascii?Q?2ssZVeLyUsjCZraieqpGkkfG5gX73SGvUOO8wydF6Xis3PcK8xX1ZEPKBNJI?=
 =?us-ascii?Q?mqIGiZ7QVjpEdFLpWkuDbaX45llZxtxsyakC4hiIxZZW7a0FGQOMtmcNt5X4?=
 =?us-ascii?Q?P9FixyJMIXKxNWqFIzJYb70cYI2szrJTLzzceVZ2Twvldw5NQH88oEUQtfg8?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c14f2d3-5ec1-4700-0cdf-08dd3a8c4f8f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 02:27:26.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbH/p67pteHlfd8ARMReYZa3sQQ/UCMY3YqYY08A18kKzwRwjKnD/J7X8s/jKkVfhkbQMzkkA2hx7rPW4CXeDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-Proofpoint-GUID: 8tC9aL6BNi0ypZsZcufXdCIktg-oqWzC
X-Authority-Analysis: v=2.4 cv=Kue32XWN c=1 sm=1 tr=0 ts=67905793 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VZzbbjECq-QA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8 a=pM9yUfARAAAA:8 a=GldpUmYGdwxDvKhjopMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-ORIG-GUID: 8tC9aL6BNi0ypZsZcufXdCIktg-oqWzC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_10,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220015
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 02:27:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9105

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2024-9676.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...SecureJoin-when-forming-userns-paths.patch | 187 ++++++++++++++++++
 recipes-containers/buildah/buildah_git.bb     |   1 +
 2 files changed, 188 insertions(+)
 create mode 100644 recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch

diff --git a/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch b/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
new file mode 100644
index 00000000..73040e82
--- /dev/null
+++ b/recipes-containers/buildah/buildah/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
@@ -0,0 +1,187 @@
+From 854570c44c219c2b92b03b36b7a2069a32e2c08a Mon Sep 17 00:00:00 2001
+From: Matt Heon <mheon@redhat.com>
+Date: Wed, 9 Oct 2024 09:54:22 -0400
+Subject: [PATCH] Use securejoin.SecureJoin when forming userns paths
+
+We need to read /etc/passwd and /etc/group in the container to
+get an idea of how many UIDs and GIDs we need to allocate for a
+user namespace when `--userns=auto` is specified. We were forming
+paths for these using filepath.Join, which is not safe for paths
+within a container, resulting in this CVE allowing crafted
+symlinks in the container to access paths on the host instead.
+
+Cherry-pick conflict fixed for v1.51 branch, and converted to use
+the old securejoin API (securejoin.SecureJoin and then os.Open)
+as this branch is too old to have the new API.
+
+Addresses CVE-2024-9676
+
+Signed-off-by: Matt Heon <mheon@redhat.com>
+
+CVE: CVE-2024-9676
+
+Upstream-Status: Backport [854570c44c219c2b92b03b36b7a2069a32e2c08a]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ userns.go             | 92 ++++++++++++++++++++++++++++++-------------
+ userns_unsupported.go | 14 +++++++
+ 2 files changed, 79 insertions(+), 27 deletions(-)
+ create mode 100644 userns_unsupported.go
+
+diff --git a/userns.go b/userns.go
+index 32ae830be..2c855da7c 100644
+--- a/userns.go
++++ b/userns.go
+@@ -1,18 +1,21 @@
++//go:build linux
++
+ package storage
+ 
+ import (
+ 	"fmt"
+ 	"os"
+ 	"os/user"
+-	"path/filepath"
+ 	"strconv"
+ 
+ 	drivers "github.com/containers/storage/drivers"
+ 	"github.com/containers/storage/pkg/idtools"
+ 	"github.com/containers/storage/pkg/unshare"
+ 	"github.com/containers/storage/types"
++	securejoin "github.com/cyphar/filepath-securejoin"
+ 	libcontainerUser "github.com/opencontainers/runc/libcontainer/user"
+ 	"github.com/sirupsen/logrus"
++	"golang.org/x/sys/unix"
+ )
+ 
+ // getAdditionalSubIDs looks up the additional IDs configured for
+@@ -85,40 +88,59 @@ const nobodyUser = 65534
+ // parseMountedFiles returns the maximum UID and GID found in the /etc/passwd and
+ // /etc/group files.
+ func parseMountedFiles(containerMount, passwdFile, groupFile string) uint32 {
++	var (
++		passwd *os.File
++		group  *os.File
++		size   int
++		err    error
++	)
+ 	if passwdFile == "" {
+-		passwdFile = filepath.Join(containerMount, "etc/passwd")
+-	}
+-	if groupFile == "" {
+-		groupFile = filepath.Join(groupFile, "etc/group")
++		passwd, err = secureOpen(containerMount, "/etc/passwd")
++	} else {
++		// User-specified override from a volume. Will not be in
++		// container root.
++		passwd, err = os.Open(passwdFile)
+ 	}
+-
+-	size := 0
+-
+-	users, err := libcontainerUser.ParsePasswdFile(passwdFile)
+ 	if err == nil {
+-		for _, u := range users {
+-			// Skip the "nobody" user otherwise we end up with 65536
+-			// ids with most images
+-			if u.Name == "nobody" {
+-				continue
+-			}
+-			if u.Uid > size && u.Uid != nobodyUser {
+-				size = u.Uid
+-			}
+-			if u.Gid > size && u.Gid != nobodyUser {
+-				size = u.Gid
++		defer passwd.Close()
++
++		users, err := libcontainerUser.ParsePasswd(passwd)
++		if err == nil {
++			for _, u := range users {
++				// Skip the "nobody" user otherwise we end up with 65536
++				// ids with most images
++				if u.Name == "nobody" || u.Name == "nogroup" {
++					continue
++				}
++				if u.Uid > size && u.Uid != nobodyUser {
++					size = u.Uid + 1
++				}
++				if u.Gid > size && u.Gid != nobodyUser {
++					size = u.Gid + 1
++				}
+ 			}
+ 		}
+ 	}
+ 
+-	groups, err := libcontainerUser.ParseGroupFile(groupFile)
++	if groupFile == "" {
++		group, err = secureOpen(containerMount, "/etc/group")
++	} else {
++		// User-specified override from a volume. Will not be in
++		// container root.
++		group, err = os.Open(groupFile)
++	}
+ 	if err == nil {
+-		for _, g := range groups {
+-			if g.Name == "nobody" {
+-				continue
+-			}
+-			if g.Gid > size && g.Gid != nobodyUser {
+-				size = g.Gid
++		defer group.Close()
++
++		groups, err := libcontainerUser.ParseGroup(group)
++		if err == nil {
++			for _, g := range groups {
++				if g.Name == "nobody" || g.Name == "nogroup" {
++					continue
++				}
++				if g.Gid > size && g.Gid != nobodyUser {
++					size = g.Gid + 1
++				}
+ 			}
+ 		}
+ 	}
+@@ -309,3 +331,19 @@ func getAutoUserNSIDMappings(
+ 	gidMap := append(availableGIDs.zip(requestedContainerGIDs), additionalGIDMappings...)
+ 	return uidMap, gidMap, nil
+ }
++
++// Securely open (read-only) a file in a container mount.
++func secureOpen(containerMount, file string) (*os.File, error) {
++	filePath, err := securejoin.SecureJoin(containerMount, file)
++	if err != nil {
++		return nil, err
++	}
++
++	flags := unix.O_PATH | unix.O_CLOEXEC | unix.O_RDONLY
++	fileHandle, err := os.OpenFile(filePath, flags, 0)
++	if err != nil {
++		return nil, err
++	}
++
++	return fileHandle, nil
++}
+diff --git a/userns_unsupported.go b/userns_unsupported.go
+new file mode 100644
+index 000000000..e37c18fe4
+--- /dev/null
++++ b/userns_unsupported.go
+@@ -0,0 +1,14 @@
++//go:build !linux
++
++package storage
++
++import (
++	"errors"
++
++	"github.com/containers/storage/pkg/idtools"
++	"github.com/containers/storage/types"
++)
++
++func (s *store) getAutoUserNS(_ *types.AutoUserNsOptions, _ *Image, _ rwLayerStore, _ []roLayerStore) ([]idtools.IDMap, []idtools.IDMap, error) {
++	return nil, nil, errors.New("user namespaces are not supported on this platform")
++}
+-- 
+2.25.1
+
diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 90ffc238..288a1cb0 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -33,6 +33,7 @@ SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
 
 SRC_URI = " \
     git://github.com/containers/buildah;branch=release-1.34;name=buildah;protocol=https \
+    file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/storage \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
-- 
2.25.1


