Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD29C0218B
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 02:27:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33620.1737512850895241015
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 18:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M204O2000556
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 18:27:30 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqg0r0mk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jan 2025 18:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq0YMRetmDZtdQ9ynWSqNw6Tra9Uozp0lEozWYef4eQU6xKaF9xgEUzHc7H1Brf/WH/IN3FEviUxNESr+rUZXTu/P3B8EMaJQhhIPRTfJ6ycHwnDAlsD+++6gdueg3gnEG01MHRRb0JG45eViCVhA/r3KlynDkDAcaLqqqZBBYF5+fczEpDBpt5UIwoXkJp8QtaZsPlEVyrcboQxSWJrWa6pnVRyIZ8nUhxJFuj6e1sSVvmexJzXQGJmjgzmCx9ZKUiqmUnCn0r1f6RF1ASayhcL+fbjbxurHhvpJvXJof5wMQk9n/LCt76sq/cf6mh8Y6WO0qBFaKvBRpFJw7q4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2/XUJCwVxt7DNKKPwe2BTE0WiLaHFsx6pCKg21cJtE=;
 b=BUGCa4SNgy/up3WCtTDWe3XMMZVjyK+7LoZ/BNUdcJW14EegEBJNnIkzjzh/BZSidruA/s+82U5j01ebZGoG/ylyO2hcb40q+xDpBOd63yEIo0GwZNJaxvI+HdJ4OAuWVhnBHfmqY9BxhChACrhZahCHHoK3dfp6MhKzoHAlSjqP8JS5mU4TYfDQQ4Bw5ecCmvEb08PdrHgGvRUNwvErlBZ6dmgQmqTkgIcNapECDcZaPiWQs0+/TbCNkoaYidrQu2Z72k4Er8WNpQabIrg8R0XJWyb2xf6tTyPvHJQ9GUOXK8GEsohMxWbk8j7spLpbyc/gIgOkyGbkYRZPaOrwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.22; Wed, 22 Jan 2025 02:27:27 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 02:27:27 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH 3/3] podman: fix CVE-2024-9676
Date: Tue, 21 Jan 2025 18:27:14 -0800
Message-Id: <20250122022714.1792229-3-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 06e2c63c-7652-4d9c-64c4-08dd3a8c4fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nW/JWp6jeCxRCEoaGFAsSCFUl4Ts26gM+uZA9sElWGLM7SH1hLrburHFZV9U?=
 =?us-ascii?Q?rXyml9SoPF7Oj+ytqxQg9zNnclUwFDgzCtj0gwTV5ItEZ97NEbZ5hez4abYM?=
 =?us-ascii?Q?+KzQI42bKSVhAdLLkGspaPwNtDmqfkqEpf1wUc0B3jWq14Rtwx5wQXO1pqNs?=
 =?us-ascii?Q?Yx+r11vGrE6h6VXgXFJrwXPwwxUkj4ba8hOITswhQureDVOIf1dlcM6vviwT?=
 =?us-ascii?Q?I49oTUs8vhYw5TEK/79eig4U1l2mGIGxaSUN2T32jEZ5cz6O3nkIay41BMYN?=
 =?us-ascii?Q?XB6dlk/4Z7f0a+EJbiSMsHnZIJXzMlOd9KvECQ3vlFQGf36VRRFsVgFxAhVm?=
 =?us-ascii?Q?Z3ULHmg5Wwq2gWtvErrvYL78eljwE7WPRxSBauWXgaAdYlNUxIBRULF50kkf?=
 =?us-ascii?Q?Eaf42CR9Y+ufcPQMT+/ZFfi3x7Th+k9uq0G6wM8ECIsj1LUH9l6Z+TGnSyTe?=
 =?us-ascii?Q?nAK58uCP3eyxnHsYfgswmvJEdnySUVbVh3jwxm8u9whI2CwuIdbN5ltGQg5u?=
 =?us-ascii?Q?NsYJwdMZBrd03eYaWIG+XXWwYwdqdNZbCBtkTafwbaoZrTBwYeBeAPtSFXed?=
 =?us-ascii?Q?4y01sgsga3zPZTembPvriV3FB8/u5nPCULegBaXvKhtyup+4KYkHYmuVoFFQ?=
 =?us-ascii?Q?XWYFbmzCR2fSilyWbxgIF2lJqCMX+gZC3lclftE2Go9YZgb3G1bvPBa60v21?=
 =?us-ascii?Q?w0EA7TedItL/yvvd5SVNtikxHGz3eUq6wxjIpNeVkWoA1+heHQD8Z5B1iThr?=
 =?us-ascii?Q?XhtWh8ZY0PDmWgE+UE3MSr3oYnJPTFg9e6Rwm1vgojM584ZXX+i0SJOn6TIZ?=
 =?us-ascii?Q?/kzn2WU4Sj7u+IaOWZNffbXo0LIohr+AG1/iC6eKrYaJ1sTaR673MntqY87j?=
 =?us-ascii?Q?U+zSohAZEroSTodNnL9xuu/Rt5mtnZqH72y2ClgL6Z8SovB2HxNX1GiJycrN?=
 =?us-ascii?Q?zZVg/1fSok/cBIYnJLmejZkbqxcYiSUPL5Z57tascy00x5I14KTZlK+nq/ga?=
 =?us-ascii?Q?Ql7wIweG51dA09/HU8Rl/tXMhFh3Kgi6n+68kL8rVqBMl9BHCttsczb/i8TU?=
 =?us-ascii?Q?bDvgbnNuTlCo/FwEsVYKzP1ZtCqwqhm94ZGBNikCoSFYdhtdjAioV2p/i0DG?=
 =?us-ascii?Q?d++Gl770/h/EQywtH9EgLCbMGaWbf9YBDLcmMcBk0kB+7KPMGpDViHBWIDKV?=
 =?us-ascii?Q?0cbGDhgGBPrh5IWl21ANeW/Po+KUT8Az2dxChN+XW2wo7S6XMtTkY9BVqscO?=
 =?us-ascii?Q?pEvLPHnYJG0aBMAypYM7WcBZstqMUxJ0LGo9TXPqE3PsWGWI3I7YdPODIC6z?=
 =?us-ascii?Q?S7UtUm70DtDxuRhaLMAftIHJT9Y57pJz0t1rvLtcIX8S0VX2Vx0Dbo7dW2NP?=
 =?us-ascii?Q?PpGJ3BX7a5o/vfRiOTBq5PpdqAwHTP0uK9HeaHyz3rZMCblLxw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vu6w7VuTgJkCqlZJgncbBPlwYaWX1ylZ74/J+vpsbHbkxclAucmT++k5PNDN?=
 =?us-ascii?Q?vKNrLNuCn1YWEFztqlZBUZX9WhR4Tw1cGBnukDvzT1bec7f9m0h8rqSe/yux?=
 =?us-ascii?Q?RQ/bsvNbankms1h+ZkfP5w8yXwCks7x+CZSQXQkUuZcfJ5+C+PU5yZbQiXUO?=
 =?us-ascii?Q?BzEaZaG6R+qTqn9AOalm1Drn/3kVUMaJxRUUzVr7MpjtKprQVUGKj5FOWTwr?=
 =?us-ascii?Q?hK8EeixxRNHzQFThz7KoUkFKKJHxGZbBbgqUjdCY2SkGOaExlcLvDdlJgsmO?=
 =?us-ascii?Q?kdm6ZYCynJ230PuvaALXGrtL3+OpdSNNQvR7vogO4OPe21TL/H1Ba6el3uqw?=
 =?us-ascii?Q?JSfDlqpMKSOnXRKRlYCJl8VyFCrksdbE/zyKSCxjfmSfGGJ3SV1ZEjuBsFRV?=
 =?us-ascii?Q?e6DEITBE2jROZNlyVmiQvZe4KA9n9pwFtp+RhV6s5i0RBNv0FFlmVDk2Hddi?=
 =?us-ascii?Q?vKLs4D9mUuZF9K5tIDYsMi5OhvAVDO58i5Av4mh0l4903d30fm/X/RKdAzKo?=
 =?us-ascii?Q?MCXoT8xZklv/8W/pSHxbGO47Q4/PagR9e3phvSLXNmsefc8d26egyojHbHA5?=
 =?us-ascii?Q?WFvC3Fg5hrQEPgzjDlvZZWXzhMef+wrNjbDOclFRWhOwzB37QbwgCZU33pf8?=
 =?us-ascii?Q?kj4Bx7lWfWYK4idy0L4jf7jW9s/PMdw/2JXbcK/Fttef7qZIWAorivLgSGCY?=
 =?us-ascii?Q?ZbVp8cl7vCydYf35jP0ZVZr0dmQJNVjnvelM89W5F2IF8OQAnX5ST/zgJuNM?=
 =?us-ascii?Q?QFE+iTQ4uD+RGht0kyEh3XZxG/7vyE5WUyzX3GaC9GEibgw0AlPI86EGeIBK?=
 =?us-ascii?Q?ycquPAxuv51wN9eBJlcN+RF4styfKzTo0OvdG5pJwG1a9Ca9aR2eQkjQDvI4?=
 =?us-ascii?Q?joeh/9XkF0cCEyfe8lphygDeWKP0DDSyKpJFWH/kbY76SiHIdepRMHZUCcuL?=
 =?us-ascii?Q?LSE4hLjGWey6rjMTZk09TKhTlvy+X4Rv0qMaTxlkSJr6CYMA8WfRcltwXxnL?=
 =?us-ascii?Q?Uhq6e9jUyu11A2zoUb+iWek29FeDvKedYeYfzlVXUdKxZo9PqHnbmr0O53bP?=
 =?us-ascii?Q?qqgzcPnzlFmdG0Z+NyKNzTbZpZxADSIso20GIzwFOQRA5DyZNoKB5VIJ6G8r?=
 =?us-ascii?Q?AO+2DF9SD2JKKMd1WSIPpYvbcQwytyRwGTdIhE+04KVAE6emloFCYjKD7Qvn?=
 =?us-ascii?Q?hYFjwAF0nWQPUBK2Hmo63rFduBHJgsKQn8oU/Pvx/w4yU690W7O7qWOuCewF?=
 =?us-ascii?Q?/PTFU/4z/AFAVZEuDE6Dm/s0K4SJyILJbWL6Bp3vleDuUH9C5NYmP4488BTW?=
 =?us-ascii?Q?10h3rKK9DQ/7pRmp61Lew5+xcavAuFYqk79yZ98zIquN2Y1lrd7h2GdJViqH?=
 =?us-ascii?Q?5AQ/5dfX1LKTdfgoomR8ur9INtjDRADi2O+77qtgA2F/72uNsU3Rq+cRpVe3?=
 =?us-ascii?Q?EShXktzezg0qDN5Ecrb9w/QTw6RX+EWMYX7WDeX2yFqYnlczjGMOH+WA5ZQ0?=
 =?us-ascii?Q?Os7Ur/9F18Zhwr/26/MFFQe6tKnRVhHgJU8lr+zjK3o9pZY3N8oAlxywVkRY?=
 =?us-ascii?Q?qoNwTknEj1sontHxcayMxk/ueV42MvPozPoxGcOBPFbAi/iG6n1uzgR2p25U?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e2c63c-7652-4d9c-64c4-08dd3a8c4fce
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 02:27:26.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DvEbWALZFxQc0LdEE2kBt44ZcHjQyuFjR7PMHYSmqvlXKqydV/PFoZMylJHcD1u6FsS2k4SHrnYv2OuWZD7RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
X-Proofpoint-GUID: vJRaK27t_EpIwmnJVyN7Z-OR3MQSFzfD
X-Authority-Analysis: v=2.4 cv=Kue32XWN c=1 sm=1 tr=0 ts=67905792 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VZzbbjECq-QA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8 a=pM9yUfARAAAA:8 a=GldpUmYGdwxDvKhjopMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-ORIG-GUID: vJRaK27t_EpIwmnJVyN7Z-OR3MQSFzfD
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9104

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2024-9676.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...SecureJoin-when-forming-userns-paths.patch | 187 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   1 +
 2 files changed, 188 insertions(+)
 create mode 100644 recipes-containers/podman/podman/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch

diff --git a/recipes-containers/podman/podman/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch b/recipes-containers/podman/podman/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
new file mode 100644
index 00000000..585c5638
--- /dev/null
+++ b/recipes-containers/podman/podman/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
@@ -0,0 +1,187 @@
+From 88302fa49db1c1527fee31715e785c44d249976f Mon Sep 17 00:00:00 2001
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
+ userns.go             | 92 ++++++++++++++++++++++++++++++-------------
+ userns_unsupported.go | 14 +++++++
+ 2 files changed, 79 insertions(+), 27 deletions(-)
+ create mode 100644 userns_unsupported.go
+
+diff --git a/userns.go b/userns.go
+index 57120731b..913acf7c5 100644
+--- a/userns.go
++++ b/userns.go
+@@ -1,10 +1,11 @@
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
+@@ -12,7 +13,9 @@ import (
+ 	"github.com/containers/storage/pkg/unshare"
+ 	"github.com/containers/storage/types"
+ 	libcontainerUser "github.com/moby/sys/user"
++	securejoin "github.com/cyphar/filepath-securejoin"
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
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 32de3f0c..8b4f0680 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     git://github.com/containers/libpod.git;branch=v5.0;protocol=https \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
     file://run-ptest \
+    file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.25.1


