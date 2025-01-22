Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FF8C0218C
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:29:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38718.1737534543241700345
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 00:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6jh5h031042
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3g9nq-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iy3AN2+YFLDrKRigzPugIy/FL4V6OB5SefahHAsJ4jOX0U2v/N9Q+35pfxDDcM1TtmJXECO/fGTvBrw3O3MihYpeZzt/iaghOiaLWkWSy+sQBMYxRPUy4hjPDT786r+VwDrsGqsj2d5kTEmSXSuAMJiDCc99VCcC2MRKyfpwIkWjy+Cd7vw9mu7NhtHVV2ybeShQ6p+BWiyTl7Bj/TDxG94hCquvJZXM/EYOuKsYg4hUDDHuSmRpkxRJpXs38D0q/qpURy+93LySo9Jb6GIVSpkdLmL6LnATwdLvfSvNDqjSteMwByilkjPnEl5i8XQeTuFuIaavZh0S+VFopsBf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cujd2Bweq7lqrwf2NktdBp5dNJO9XRv+m6fIC2FY0kk=;
 b=A147TqitT+P5ZysaqM1twEyTlIQPmizPKK+hYJdQdtkFsLe7hG9N299wdZgL8m/fOZR50a0rOXmuV7mfe96h8067PheSdb0yRO6BVe23gwqZVfoB6jZQnTe/xpWFhObJsLrvRPPK25kCNR/6rXJtWnicfC+NbjSPJiWWWhLyFVb6OhpIZsRMaRb+wOGwrRzceyiiOWuPSGtPrL3Q3M727Ux5q4NpkXHyErhg3lmO/BtnMV9BF2/go3hbCF7cEI6erI8/fVjQWtZMLbwM2+fwa5Q6tcrfJwW8tqizbZWTJ1FxWsPRPLoMafmteUAow4MlPxY85CaOyt9kVsR6hknwTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 08:28:58 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 08:28:58 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 3/5] buildah: fix CVE-2024-9676
Date: Wed, 22 Jan 2025 00:28:45 -0800
Message-Id: <20250122082847.3470429-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122082847.3470429-1-Qi.Chen@windriver.com>
References: <20250122082847.3470429-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To DM8PR11MB5605.namprd11.prod.outlook.com
 (2603:10b6:8:26::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5605:EE_|SA2PR11MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f773ba4-0e49-451a-80c7-08dd3abed0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dB9hr6a6RE1dQLEZi7UlEXtUcY+KFIA0eKmQ8JyO7q8jp7RF8gXYtsAuBMH0?=
 =?us-ascii?Q?qLoeVuDOzsbAyVvcP0Y1tt/DQhqZYWBpyhrOu+HmemfxS2/AOfRvIN2QrMXq?=
 =?us-ascii?Q?7vxh4goiwU1QyB7ZykX92r964qlgxxYcqo38GPciX5QdCtnL0kEUwuHv33OJ?=
 =?us-ascii?Q?LihRk933B7QZrXYtk+n+bnb3taIcjSMaI+JP0/ogTGlS6NysYmWCoMjVvsy9?=
 =?us-ascii?Q?Dx7a5ohF3c00ch+VA5XwoC1gJiBGnw+ntJ52+0ob1vWEp6YKeMsNkLo/Aca/?=
 =?us-ascii?Q?hEISWO0gbdUes5VegTZxpjFgOsCPWdwE0vFllfYPCozTIIFBpTOnbSexJqeR?=
 =?us-ascii?Q?uCLLLCCHTJUWtuH5qhniyWVcSIN+bIYtDy6cfLX6gsrLoJ3CZzSdbxSIbxnH?=
 =?us-ascii?Q?Wd5VWQUUuBIEHKH8UJwmABdqyZGueoAwXdbzDdBRH45RLCGjVRPYYGL1pdRp?=
 =?us-ascii?Q?h4RtQYEAKjeGXEesgR94CfSZexrpONvQa095+aB1b9sAZV3jCT8+Lc3C92z8?=
 =?us-ascii?Q?Av8qPgJG5MHJSm1P3fXxK3628nqTOrD7Xm7u78X4uQGr5JW4JHaXKwek3GNL?=
 =?us-ascii?Q?btpFfvMTKbxvLsleDnDs6xiLWA7UO/s2sYasJLVxoCOQOAKY8KHDA/pPpGtE?=
 =?us-ascii?Q?Im2h5kjgLp19S757MzamhnwwbrYc9hxTMGG5CWKQo/w66OrFQOIcRxUbdImx?=
 =?us-ascii?Q?fgpPgecVe9yDbu5YI/0pG1d4zve/53eNQ148uUGMccO7bg23gpU8WoT44OeN?=
 =?us-ascii?Q?erN+jjkeCxA7WDHMYB/5dJc63H0zWJisW+HNRq9CuUDKcA1EiOvnJufQIRZ2?=
 =?us-ascii?Q?UGaJpVzv1aL7Wq9VtP6A6DXJZTdGZdeOGGCZtz0fdvZWavRO37ril47/79CQ?=
 =?us-ascii?Q?lZl4BzKD9IlMKkmg9L7xh3BXi6EZFwh37NjWkj0NVttKY5ETD3TaWxZWENOH?=
 =?us-ascii?Q?FNCb4eN0C24wZ7llOYP3ha66jDDNBMqaonxjYx97gIsiHaw91Ts4N+OgtW+x?=
 =?us-ascii?Q?brPa2gIdv9gRh5PkXPXARDna4ncKgfE1qE9WMGnJ8C7jqhC44hVlEIc/DFFY?=
 =?us-ascii?Q?Prz3TyBQpmxYAwwDSRIPSvh10k4b14OWr0gtguowM70Brvw9x7SuuujGHTXL?=
 =?us-ascii?Q?lpEZI39TVcEgXzuXJnGo8c5fcf7t8F69oiKbWd3BI9wIO2fdcu368RfQ7smL?=
 =?us-ascii?Q?O13PUx7zQqh8s3GFW4ArqCdQjZJ+Hc2d7evCwvNO7ScjVoKsYjIUd+6PejYV?=
 =?us-ascii?Q?sjSEhLP1sLpSVVb8jcRhZmwmOfTcJP3mtgncvKKnJ+34KRKVcif3GTCJLy/F?=
 =?us-ascii?Q?aF3JIEXJahFsJPoQflFsHc+V9HOFFab3P+QDRgDM3QtYTsYnCOygncl+dgcg?=
 =?us-ascii?Q?qm66RLx517kPomICGlmyR49tfremH0Oim7I2d6yEb6FZ+zqtsQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DnwNgw4HwIxMYk13agopRd1WFoOgLGDygV0NTUdM1jeU0H4UtTT19VRvF10R?=
 =?us-ascii?Q?Dpt58EHWVUZKl2/Zzq0zk+T0DD8CI16uFL0W43Au6SpeRgQ5fspLe6moQK/q?=
 =?us-ascii?Q?rFBtQFK1ZLzo4EMEBDaZMpkc3zTJuOJlxI1J6WVCBSv46xB6KDpbdZzXbboY?=
 =?us-ascii?Q?OZoGQvE/SiQYRcYQWzismAeR/vEQHkgekVnw5Rfh7tpm9EP76THXkWlKek4K?=
 =?us-ascii?Q?1ity/EZK0sat3ZIxenIrOCW/BB7cy6DF9BO3bnL9aJzSaqNy0ov2EKoOLCGn?=
 =?us-ascii?Q?4snDOQrFxaTZeXp//3InNtmmQ3MjZklp7mLLWTy6MoJsy0e+njOXXAEVwnzz?=
 =?us-ascii?Q?UhsFiVm/HAv2AQY47hiKff2vv36PEbYbqEYMWqHwngmWderomGMdW8C5/ZJT?=
 =?us-ascii?Q?rGNtIWarROmoSt1KuSv2jjWOue9pijh9TCUIKo2h5be0WiUuobiz9znEiNiV?=
 =?us-ascii?Q?KTRiIEWJULKv2XyHTbJz9fBWWJ4hGNprgPoKNAtQFQZz3ul7f1izBl6NRl5W?=
 =?us-ascii?Q?GsLXTruUe069RGC35s+2UBemg1VbdDJuxrRfabk6MC3KaS2GoT5cCrdtulvA?=
 =?us-ascii?Q?MRZ9wJ5RM0YNZT27gVCae+taQTrpk8acczrhEky2pdAbyUaYK37AtQ91kDgq?=
 =?us-ascii?Q?LIu44a8DibBWsARxVlDOB0N36DOksOaKjas6zjAkFExVTg00Zw4HqovwcEvA?=
 =?us-ascii?Q?iIdfzzKo1A0X6X2z/pYmSuvVGlJEb5Ooi8bK7TXEwK8LuJpCySq9KIHO+5xD?=
 =?us-ascii?Q?a/9XS/zM9GxLSzXmDrBbPeBafucCNI5SZIDtdVaa3M0c0CgTXF2PAL+JBtkH?=
 =?us-ascii?Q?OUqZ7a9FHXHCyhFMYfyN9oBqImrpiBUyu9Ai6drXTmqxbYlEe9m1DfhIFnDp?=
 =?us-ascii?Q?CILheNjZwGwN/wd5NcrGetqoZ1y3E+14dSMOYKdeGfuuuUqFBrcxTi5yNWaG?=
 =?us-ascii?Q?vIkA8B35q1ajFGHgIndnrgLsarLuyUu515UahAyb8kvbpMzXj5nLqm7Y5v08?=
 =?us-ascii?Q?m2S7r/MSXAzxvU+GhoZ3WbXuCy/bAF8WuwEcYRQC7LXQlyarh3Qw+vBJ9vET?=
 =?us-ascii?Q?9QqwYDPvjo427vYYrzLqe2GyKZUyEOLc7k3LWPcjpWrTmhxuLePR+J2jy5Bz?=
 =?us-ascii?Q?9T9VAhpNEQu4nvV3bePOAvxjECArUdPO45E1/miZfW0iWgSYvpMWwx0UyCBT?=
 =?us-ascii?Q?Pg0GiFEYqupDkNTa2HvL1cMlFSY+A3cgrpALo6nEN4dQhA/bNt+HELNqHzP+?=
 =?us-ascii?Q?OjYTngoF/A0ULExAkc5OwVO3jrV/Rl7SLImzsZZAL72cBv61whP3KAUHjucw?=
 =?us-ascii?Q?GVAcXS+OSm1QU/35DYHRz39sqajMW4ioBEXOm6eUhBW5pzaFvCl0zkxnSbRU?=
 =?us-ascii?Q?22bc41CN7MS5AapMit3hKADLs9dalrrEZeiB4NDWNePVNfHjT8IlJnKGMv6R?=
 =?us-ascii?Q?gaPynmilzEuzH0F5pvl2fhQaSH9AZj7JzFkGUNk0YPAA0Xyl8etJXFxU/5wi?=
 =?us-ascii?Q?WfldqwHrEBF7E5BiJoiGHqZyOR+m99mOruJNPnHleVE05midbPpMGQ/uapAt?=
 =?us-ascii?Q?5OYNRzhFWvUhf0T/leX4roMrka8qoVbWt4uc+WyAybbatuhjXvqMxRKl9gd9?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f773ba4-0e49-451a-80c7-08dd3abed0d1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:28:58.1426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8es6o8b69DhEggKCYg+mIE+8Kr+8x8A9c6c8ZntensOSgCIrZ1g3RAcOge6SfMeqEqJNHXEO0tiMWywGUqdEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-Proofpoint-GUID: TGrZifi6lKvtGN464JSmvrYhp5J54nro
X-Proofpoint-ORIG-GUID: TGrZifi6lKvtGN464JSmvrYhp5J54nro
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=6790ac4e cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Ljcx4Z80PikA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=pM9yUfARAAAA:8 a=GldpUmYGdwxDvKhjopMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9110

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2024-9676.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/buildah/buildah_git.bb     |   1 +
 ...SecureJoin-when-forming-userns-paths.patch | 191 ++++++++++++++++++
 2 files changed, 192 insertions(+)
 create mode 100644 recipes-containers/buildah/files/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch

diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 1c33291a..45d7b31d 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -27,6 +27,7 @@ GOBUILDFLAGS += "-mod vendor"
 
 SRC_URI = " \
     git://github.com/containers/buildah;branch=release-1.26;name=buildah;protocol=https \
+    file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/github.com/containers/buildah/vendor/github.com/containers/storage \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
diff --git a/recipes-containers/buildah/files/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch b/recipes-containers/buildah/files/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
new file mode 100644
index 00000000..d2e3dbbd
--- /dev/null
+++ b/recipes-containers/buildah/files/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
@@ -0,0 +1,191 @@
+From b92233f24f22bc509e2f9fad2dc67f49e482f363 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [0dc4fc9bb826e08b6e25af0af6a296ac172b5e15]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ userns.go             | 93 ++++++++++++++++++++++++++++++-------------
+ userns_unsupported.go | 14 +++++++
+ 2 files changed, 80 insertions(+), 27 deletions(-)
+ create mode 100644 userns_unsupported.go
+
+diff --git a/userns.go b/userns.go
+index e0e530275..bea2a9520 100644
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
+@@ -78,43 +81,63 @@ func (s *store) getAvailableIDs() (*idSet, *idSet, error) {
+ 	return u, g, nil
+ }
+ 
++const nobodyUser = 65534
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
+-			if u.Uid > size {
+-				size = u.Uid
+-			}
+-			if u.Gid > size {
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
+-			if g.Gid > size {
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
+@@ -300,3 +323,19 @@ func getAutoUserNSIDMappings(
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
-- 
2.25.1


