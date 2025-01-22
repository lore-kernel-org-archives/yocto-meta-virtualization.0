Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CADC0218E
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:29:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38715.1737534542177748730
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 00:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6jh5f031042
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3g9nq-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lDshIHW1BTWI0m+1aoBoeWS0ARqOdftUWu0buPoH8aEHGAz3mIODbMGPXxCpsw/ina2orWnYTTjFd6qY6GjQfHvcWOFVCbKKa8mLspNNTU7Q8PKxyLyh1UAj02SIwfdCg3fXtg2HrDq3eUgBCKtvIh5ceiM8hdWkBScQPp9pr80Xn/jBAhGCxeG6wKTVRdQoAL8CCChyER5Z4bHGWyD8rAz79gMOZnvXJItyr7gweeJxjBSt5LeUHG1yak0N6mJXxVTImWfNSJInIMNs6e3dGWXQpnibDCCcqEDEqSzw/Xd6UAqF9XKhwzz9UNlTREPsLUNIafhqn/ZlJTWdbYUNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCFHKXdsNzqVNVrPkwHuqP/g/RCh5qmw+gSiw5429XU=;
 b=VfLIovSQXbvAJbiNk73+kkW79bJGQtLC7fhfUM/ABILpXLfrIaEH+vrb++GXv217J9abJpi05+m524PX/0sXb16IZaswSrRcC1yF2GdXv4ESHYVZKqnbrRwRPb/vsDZ5CZH6IXg+oHMXmcJo3KSGTNH9KkpV7+c0A1gIhafk7N9qsDr39DwkrYMaJkvTdOASbvDdacNGEfv8iVHwUniiSNdoNfuvJuoN1S5i83cdejNpeVzRbXa2FCAAAVRT2vmH3oSSEbxC2DECgjFqDXDLKTmdGp1Bk9NhEJP9GbkfboC5evL3cWmKqKghfgqTnH2O6z3HbE2cUitm0FwBFJPn1w==
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
Subject: [meta-virtualization][kirkstone][PATCH 4/5] cri-o: fix CVE-2024-9676
Date: Wed, 22 Jan 2025 00:28:46 -0800
Message-Id: <20250122082847.3470429-4-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: b4ded3e5-9cb9-46b9-f2e5-08dd3abed12d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7oSld3kTVm17NL9WA/QxZZJTsH9y2DW2xEVMK+XmThkpKgAQu6dgpfxUTVNK?=
 =?us-ascii?Q?cabOqsGuTHLDMfOXBslT/furtl9BxhJKZw3VrBfJDud8Xl1GwFiS6RM/yu2G?=
 =?us-ascii?Q?b3Yc9KqEhDeQm23KzvwDgIFwvHZSCKfNAnRI3l0v26OFR9B9rsHJUqHgTjEA?=
 =?us-ascii?Q?hL79wS0HbEVUc/RkuL1n7ZozbROAMDm8g6W6SKR7a74YSmyF2lUMk+5TKZGN?=
 =?us-ascii?Q?+muywDzTvmyQcg+HGKt/+IjwYijTW6bQfiCUZqjkw6APC/I/7qO4iJJraTMt?=
 =?us-ascii?Q?pLel6IZ9OpkTYy7FaW1A+Jo3mhTc+AyaoWvaVz6/nCGNgNOY0089qJ2KLaK5?=
 =?us-ascii?Q?4IMEYWNVTdb6CFD9geT/VAXisvgLDdl90/R3HffjW8GJXH4YJLp5sGjWMpjH?=
 =?us-ascii?Q?YXEvxNx85Mbnj8W6RBL932ji4k8cHdJeKW+VRz7Dfq/0hBJ1DHSSdLDMpwj9?=
 =?us-ascii?Q?i4b0PsM7Vi99P7Js/aTaFhiBwtlvJUeFUVU4DezkaMtfCiMU6j6DLpOMtilN?=
 =?us-ascii?Q?HMesuN1RME51rg+lykMNzR6HXICy6KZyGL/8yyKEIlu8gJvCMwPBCORU+YwZ?=
 =?us-ascii?Q?oJLh5pZtGt1pfHIccDp9cnJ7ta8ZWitcuQGjoFJpenn5n4k60ibKb4P/Vn+q?=
 =?us-ascii?Q?+ImYIoLuxdDT8oIxDkKv4yQmQBNO07nNHM5bAvN7wExKw3ULUMwSfWjYj7Br?=
 =?us-ascii?Q?Ld7c0N0VE2EKeCCGq9RHmiX7fesu0rloc/eDBeJHRQTuRIIwDG2XXVLuYWQ4?=
 =?us-ascii?Q?Eb/9SRFlyYT3d5KgsA1mWvTWNORiKcqSfdpWJhSxRQiw/5thKAiaNeiolqzh?=
 =?us-ascii?Q?z1dcT8bS20CgOW+yYkglBSdGEnoVWNTGr/3dEAxlLhvzWpylMxJ2pm0nDETq?=
 =?us-ascii?Q?CRJtLpgxy0V8guoBaAKKjKMx/gEyvk1m7PvHknJu3cwWUks3TpcjdhIJtBbZ?=
 =?us-ascii?Q?1yAQ2OZ1FxwtF9wQJJ2Bi8Dq63WcBQTGI+y8O34r2geZKlTIjfoqyf8zmmy8?=
 =?us-ascii?Q?Mw2ryYkNHfqD4xuejzB4sh1EFCjmw6CIabmBLNIQ9+a+Cs3vJlsEmOKZUcWP?=
 =?us-ascii?Q?pY7CF95RMy+oA8ONUpZGNbiZpiov3jNe1PzjH+uHlz+6S8snIvprEgzBa/9u?=
 =?us-ascii?Q?tdK8eo0tQlFCjvW/ZPGneTbQDLTfT1P92CsSqGFJXsxmghkGGrYA99/GJ06i?=
 =?us-ascii?Q?mpVISqJFeEy/PlIWMRji841t2YbMF04U/7b/BKbRAzZ8reWj5JHS5hvvu8gT?=
 =?us-ascii?Q?EBCAuDrgVHQ23dJ0ze6eafoiU7jK6vSGaGUXx3Bpcy/MXrn0S/aYbht0I7E/?=
 =?us-ascii?Q?5qDbtuOwPEpOBM3LXBZ0webxWacgIqIolf3tOJBPEwQl3v+kA5oakeefJT9e?=
 =?us-ascii?Q?/NzsW9EI4lO1y1mzeW6b89fpK5Uu2QNkf3IdCmx6oTjK74emGQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vDg6XA/FrulsDpAj1rfjXv7Bmb6Jmq+ERUZ7n1AE347n+wcC3nxlF/w4KON2?=
 =?us-ascii?Q?aSozcUNbUJoa/oAwb+WCOdzr/1O0j2yPzNYtjfo1wP1IgxQ2SG+aigkiNRx5?=
 =?us-ascii?Q?KMmH1mmQoKn8cGiUOyAXOdxn0KyFML++yojKBByRQ5Qv/kEnPXbitMYZw07t?=
 =?us-ascii?Q?MyYO07dmr5LuqwMW88DObLtGCXQvYnrrd7Zzd2y6lf/rHsrrSMSZlrszUarO?=
 =?us-ascii?Q?ruHdjdcOpCjuz1gSZaq0zEkUmQQMn/5uvEMiBsk/+d8MhNy2AfAGyyEiZBIm?=
 =?us-ascii?Q?gDvwu83oSDH53AYEj3WKnfLpS4/r79KshEeXNYTCZ1H8ZQDuyWZrxUidD7e/?=
 =?us-ascii?Q?RHujD1FP6P5/oZOe95ycyaJrYYqlniztblL6OJ9RgGYfqundP6PRdeEKqcwZ?=
 =?us-ascii?Q?S+SjoH30yvgWqvvb87NWRrUmnVWO/dq+V/f1iqhIzKaH4p0eQkyUlAOSze3m?=
 =?us-ascii?Q?FrGsrfZYHo2IbV1O8BbinTkz6Ofju80wOgaAxKcp5sAiWb86+KVs0ulT8QCD?=
 =?us-ascii?Q?ZTPHU1RuQpYNhkaHbX4cKlt7hRXmF/ob8DhoKAuqTGRFpaE07BXN+ZqI6awk?=
 =?us-ascii?Q?7nUXTEMXijAFcVAmt9NPsKKs6WjKeYdeSxaqLgbdoGUX95TsD+qT66ibCCle?=
 =?us-ascii?Q?TQ6tF0RIijR958Jb5rVlPtmMLgc7RueP2tn4rNObLs5Ohhjv3KBmN+wk2wrc?=
 =?us-ascii?Q?2vKWhnvhQtkl4JxPMaogsQwYQv7VXQ8e3wv4ZLGRXq74HJYyjSdDMCW3EusQ?=
 =?us-ascii?Q?WVRw5ld9ETCxXvekVPj4rQtWoFR5BNKisTAEe6jg+vK+1xMSVuyVlDeiz0MI?=
 =?us-ascii?Q?JCaYOeyY/oOH58gJXy4yZUtTWgck++VT7XmCrVmHcSqSnC5IdO2sXabTldBY?=
 =?us-ascii?Q?549RwOdGHAYQOjPQLqA30xE3RCbMNrK34tTri20RphMM4Iu4bRTb0bIflI4Q?=
 =?us-ascii?Q?10Ec3LrsnI1JwR5gL/wkIIVE71WGyD999rTlDZTiQv5LoraFdCwzc6oBVCc5?=
 =?us-ascii?Q?M3O/1Wq2g7SdXo3eWkHpP6TbW2R4mZI49hWkDkgW9Lt63yh7mQsew9b7XzRN?=
 =?us-ascii?Q?qmOIdJofF20VOjVBWwz8WvJOW+W2ubkVK7zdDeTZyDNYvcftHwwy+LsiF+sv?=
 =?us-ascii?Q?efQoL2LKx/+OfcQ/cJwcf35Flf1M0+cn3J2O4zqMbwOR+kgOAwbWrhEAATCi?=
 =?us-ascii?Q?+v4aM+8Eh+WkwpQaLWu4w07SFg+AvPpRgRtl39Hl+y9FF8qeBUofyRN/FlgK?=
 =?us-ascii?Q?BVGOXivvbWTmn3QcDUW+VdBmE6ezneY2p5Tq6qS4raarGCYWAdO8QHrqryG8?=
 =?us-ascii?Q?K74wW3Nyv1MkMJEtHcADTQZZIt6SnKLRjt41ZshGo6f1x6ZGk7KHTD11x+lT?=
 =?us-ascii?Q?BNXjdLeREhve8u9imMLSIhMngSXuzu07+fLAFxoVA+/KkF/l/aXSI9mNKCTc?=
 =?us-ascii?Q?NdIVTz6KpyZW6PjbDXSgv/ctmEPhVeamOSQ/lKiIu8n0u6zDtpbYClGA3aXY?=
 =?us-ascii?Q?mnUwQ/feF03litQTH3AQbXtcgY473YMQeAR31B0RPL9RDCyDXYU00Uv2vBxM?=
 =?us-ascii?Q?g4DxlpTZDlngTJs4tOHgiBgB1S3nedGXlMWJVWXeNbb7L4wiwxtnyaUoOce1?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ded3e5-9cb9-46b9-f2e5-08dd3abed12d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:28:58.6314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJRTqKeQsqArm657P6nRf1hUxJwP041GsmR7z/QVOz15/8QScM6uxEk4r270hP+BB2R74xiDP3vwWRvYIeP9rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-Proofpoint-GUID: RWDAs4uY2ZU2nYAIvTx2AbMDGraSIlPu
X-Proofpoint-ORIG-GUID: RWDAs4uY2ZU2nYAIvTx2AbMDGraSIlPu
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=6790ac4d cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Ljcx4Z80PikA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9108

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2024-9676.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb         |   1 +
 ...SecureJoin-when-forming-userns-paths.patch | 191 ++++++++++++++++++
 2 files changed, 192 insertions(+)
 create mode 100644 recipes-containers/cri-o/files/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index d74a17fc..429c49a7 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.23;name=cri-o;protocol=https \
 	file://0001-Makefile-force-symlinks.patch \
         file://crio.conf \
+        file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
 	"
 
 # Apache-2.0 for docker
diff --git a/recipes-containers/cri-o/files/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch b/recipes-containers/cri-o/files/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
new file mode 100644
index 00000000..1cb7eb0e
--- /dev/null
+++ b/recipes-containers/cri-o/files/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
@@ -0,0 +1,191 @@
+From 03aff6270b389f27bc1edc4985dab753a38e7c7b Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [0dc4fc9bb826e08b6e25af0af6a296ac172b5e15]
+
+CVE: CVE-2024-9676
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ userns.go             | 93 ++++++++++++++++++++++++++++++-------------
+ userns_unsupported.go | 14 +++++++
+ 2 files changed, 80 insertions(+), 27 deletions(-)
+ create mode 100644 userns_unsupported.go
+
+diff --git a/userns.go b/userns.go
+index 523c92dc8..c234414ef 100644
+--- a/userns.go
++++ b/userns.go
+@@ -1,18 +1,21 @@
++//go:build linux
++
+ package storage
+ 
+ import (
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
+ 	"github.com/pkg/errors"
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


