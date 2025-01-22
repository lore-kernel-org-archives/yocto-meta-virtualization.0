Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C05C0218D
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:29:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38717.1737534542694076700
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 00:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31173a9983=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6jh5g031042
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqk3g9nq-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 Jan 2025 08:29:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZhVR/zsWSpzLfPVcq/lLQ4OLfQ1Clq83Euh7j3RGNXr9f7YLYSoan7O7ri6eMWLTAIQvbFVF9XgZSr6MLvAGI+TflNHNug6LnJDgjqS89jqUtMSQlKjUO9pCSSYwMOkAUNc01JjQ6/T+D3sG+UM3qpzXLuvhoMZd58en8ZioizpEOrc7ShyDumYnvW0NYSmFo1Wm4WE3A9nZlvbs4L0PtUaSXpR6In+birkWNZrajLBF5K/haC4aTfTv72Wwi8bK/Y96tikam4f8MJgzHnjNrS8CZCoPirJHZGkQoBWpbVNY6s4SzgEHmvn/8PAU2pFBMCjqTXzpqDA4PbRZ4huEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZabFcjZk9gHRXmEV/ueiRqaNk1bpZCxr3jG4cDIx8g=;
 b=uoHOuvOuw4OG/LbB2r6C+qebkoHMH391wuxXFawSiTc4pJ2lQrRJIO3cdUr9rwY9/XQnT9RwR8gT7f/o0xWoMLulGd6Jhlz0cVI+uel7SlkMXKLlD1vUQTGKrh4MXqeqQAddc2BrtJmsiThE3YoWIVbI8txCelgIZA0Ou45R0DmGPDJkjxACEaIZJSkBPbjJkY2J/LxsFILyc3aABPCew7N99dWOgqj5Qz52AcznRT9txnYZRdXYAMGOzYfDTTgXORDiok9VyX7SNNSNdKlNyJdVtDeMySErgw/CAWwOls6BAJtVBkoH/osZj5/WqOXZHxNLWQT7SWsxVnjw/kh1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) by
 SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 08:28:59 +0000
Received: from DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a]) by DM8PR11MB5605.namprd11.prod.outlook.com
 ([fe80::b868:94:9e07:104a%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 08:28:59 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 5/5] podman: fix CVE-2024-9676
Date: Wed, 22 Jan 2025 00:28:47 -0800
Message-Id: <20250122082847.3470429-5-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 59ffa209-f15e-4824-2b18-08dd3abed185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BQtMpzHf1hkfDia1Og/cnMTi2LdFSMrH14psDGGFYjgIBpxYlqZCyeOMxgh9?=
 =?us-ascii?Q?/rqJJenzW9LFPPvLDu7Mhu4MYQzv4EsioQfcBv81J1HhIL0B/WTFvvPj/ii7?=
 =?us-ascii?Q?MDQ8n90tFCwXy65ctZ6Sniy85dXRjgnrdPUq70JrN0RtVskW7sLOiod0DJYI?=
 =?us-ascii?Q?5OqPgJDHZFCCBGtbf0pAxGGSSMhnYhs9FlJYxxfz3wcCxxpdUclFmsRuNfG8?=
 =?us-ascii?Q?mrt7TAx81ozMi57rQv6UtEsEecKbOGwKyD4/yDSWxfes3ZAv1apecpoL9FqJ?=
 =?us-ascii?Q?XaSakrWSJWRHfVy0Y8xh4BrV+HthHHSets5yODL5uslZ6BajyImguc6FTQoB?=
 =?us-ascii?Q?Djs0Qluxe3g6t0J4LiBqseag5/yE27kKvCGTFWo0MzowbqSfAKFJrGmWHPrn?=
 =?us-ascii?Q?R4RGpODVD1HtgDrdCq/1wE2bLMgUnLH/6NwVbysz7PQbVxKCeHUNBY2bXAI6?=
 =?us-ascii?Q?WCX7NXRBr3cmuj+Xxxgm8MQBI4zBN8RCDRTDklSmPfpHBKVBmlc63dEjwNWR?=
 =?us-ascii?Q?7RFx6WpSxyAY/c4WPcAwxictJYOOkG0l/vJ63ATk/lH5tLhFrZWCERhOD8uw?=
 =?us-ascii?Q?b+YTSKAWx80O/4tcjwyyaKMrbWMAU3g/kvgiPAsZFJNEjQuHG3+demADSl//?=
 =?us-ascii?Q?y3HUj2THsJUqhyKfsybNX7JI5wptnTv0hEXb0MFf5usF0PCrGzAkcQCf+h25?=
 =?us-ascii?Q?nsbIaycf2SEQjbOW3Dthp1D9ZmDWD3JWfL9LNfNCFWjJCTargD0P8ESFZrgQ?=
 =?us-ascii?Q?GJDl4hwDEOvyjBdaNYXhiagtKznd8vuBLSflLjAs879N8+wcfNvE6WUGwZVT?=
 =?us-ascii?Q?+V4dAHWAIBV5fPfgF6jfP+r6dc1+kWS7SOg2qUFZAcv5UE7NCxu/LM8dbNRk?=
 =?us-ascii?Q?4JhZ9NzinQa36VXpYOLM4UwxUP5V4nj7pPKTFBO6vpJgdYMeZKPoOAos/1q/?=
 =?us-ascii?Q?Mw4H0/y9kTwZx3wG65qb5+tzeuxrhVWGhAuLuzm1lhfKNG3EYviOMWAw7cD1?=
 =?us-ascii?Q?N2AYQAxQNe5i6q0nbOa+45izU7Fa0t7t5J/m3SEI7vIW3fKEd/3FWSoILczI?=
 =?us-ascii?Q?yzlHiPOLU/5mEqTRqJDb2BwkdI8Z39ezsuNxsXKPEu6pjDpTPPCcSOzRCdyz?=
 =?us-ascii?Q?j4/E4AOkxWythqrf9+7NsduSHxyCzSuC2E+GT7zHWxMNtKI9XLgXtxIgva+N?=
 =?us-ascii?Q?wf49D0AXU+YClzzst06GMaeKjIFWepAwZ8XRDjWzYbolC/uJW7+gFTwqs1q0?=
 =?us-ascii?Q?MwNyVch5OE2m/5Zv23eCRzy6QSXF4KF6zLk3gPdHNbFe5iz8eoOlQCP4D5lT?=
 =?us-ascii?Q?vb0xQmGGEqXVT93Y3GtHI0UKtLQqUv9ONYEhbwYazPi/TLWMwIqWpEpPYk53?=
 =?us-ascii?Q?z93buB5OyRU0Q0Zs11kmzIsr1l+wlVLnVueKHOq0jjyriplHIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s8YfMp6/G+WO6MTwK6z7R8qrClMlEfr7qt8YSKj+/Byb7IO84U2+HJ2Q62Zb?=
 =?us-ascii?Q?nCOWrDdMoebWtV3skyFIL8KMq6dXrKnIYq1ELsa6nRw/LV3baEAgmxN0o2Jq?=
 =?us-ascii?Q?64vwLpisb36uTgYItuf5Rmo/4Lr+lBk38aBRgqoXW91Fzu287DFG0zBNLoP3?=
 =?us-ascii?Q?NVvlcL7fMLwrAI7hK+1HruQN7bO+J3sgevcYXFVXlag8OyOHm9lkYyDacL6e?=
 =?us-ascii?Q?VBCCV0uiyEw9aDeSFaIaQIsDrGutS+ZHT/+Ga0Qs3vcBTTsJkFq9bzTaPeHu?=
 =?us-ascii?Q?z390fIc4B7nZ+BPq9+fcKKoP5ImV2dwNCrLve9jWnUDroAFLmd9hiJmYCWBp?=
 =?us-ascii?Q?zrDAFU5hNkTe+a/4RdYjiPfwLAO5YVLfO5S2CiLCADQ46QNeCeyt0ztq3ORc?=
 =?us-ascii?Q?H/UsiuOXdAmcgAdTR1nRiuy/yvVgWsYGC0RdBO+q7/7gxb9nocGE7zIh1bod?=
 =?us-ascii?Q?gSDlGoIyoODhc2rKplPA1dKTLWybWQSwCB0TKrlIN0QwNHgWU7wCBjq7wqh/?=
 =?us-ascii?Q?oYrHV8/6R9MPc7mHSHpCOSu0+6GAW0iTyUuJ0swvaH3F1afUR1yqAu/K7fyB?=
 =?us-ascii?Q?AMinaHNvLpsrb5CRXRMtklh9IBRDru6VUXV6y76xtZMGcQadSed/B0t2vABJ?=
 =?us-ascii?Q?xzi0BfZ5njXQ0ndCiPwKcuQ406E3UNY4ggATR7DRbS3PU73Qncx3ivIixTZP?=
 =?us-ascii?Q?Lxjf7KfF8ftyRJwY06z9BCH72MqpcdnRHBfcBW7ETFLSylSK7rAv1jAT7xBV?=
 =?us-ascii?Q?IOa1wdqPw4mzdkTPhKcLgf5zt7lVWca9bgSgsMM6HZJDbV65cfYCIowemWxJ?=
 =?us-ascii?Q?QuJ9WFiY8iSyqXe38EWH04PCoupbKDe4Ctw93nyyNCDHamyxK84sz+cprCEH?=
 =?us-ascii?Q?EENN/A9iaEwG0YG5U5eQThTPABRyZJxItnPw58tfx5K9m0nh0LB36Bj7RRUy?=
 =?us-ascii?Q?9Y7mGyz/gbBrUm/Nsw96npLCK/MrYGp1q/KJrDrbJSppjhTiyNh4rI5T5WNy?=
 =?us-ascii?Q?XQhbeshSpeWKEojro/Ecx4mjCEHiYeRDfoj80ntbl7QfScqirroXwdEKZnbD?=
 =?us-ascii?Q?uyXow8qjqdRJqwmY3/7V0Fk6Kobq41KCeDKioe87sSB1N6jKMZvFA5k+u8dq?=
 =?us-ascii?Q?fIep6vEHG7km0JrNVqEw10dqfq/haL+0MdqM997Pzn/j9NDP9dLUZIVPhttI?=
 =?us-ascii?Q?6uW+CD0P9bdcU97+CbxThpy0Ghy7FHskm/VrIdHQwM1WAYxgYeD88SMI8L4Q?=
 =?us-ascii?Q?WyDnmfTTamBkuoozazpEgDDQHOU5psfjC5DANB/Kht2/g+GyAodJ1zWSDoX6?=
 =?us-ascii?Q?7PCfJrAGVrNhZwHRsGjR70wJEcrlNgiTia87CYEAtloMO1nD1NJQJoMwgwEW?=
 =?us-ascii?Q?W8kcfBg61aaDwO5W8gVcbD9szecuaoJgefYMryyaDPmq9uJa6e/v5i22sUyX?=
 =?us-ascii?Q?Cc99RgVlf4ukXesIHkH3aZw4ACsdNkZOlTzsHke1RVTbzAyPyBSoxKWtShRB?=
 =?us-ascii?Q?qoYCtQX9G3iFPO6msov4Z7UX89LL+EfmQDJbAvcf/jHehE5tJcymP7njW6B/?=
 =?us-ascii?Q?96dO+NZd1ViMKLPjdwKaqs5QDgN7H6N8TO2nI0Tmx1eVpRI4/qeAB77+Zwtk?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ffa209-f15e-4824-2b18-08dd3abed185
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:28:59.4301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPk2y2b0DJp3CdHJRaI+pIKGzLqaNy2xnbxTgH2zOeJSdOBxC6XuQcieur6GsnksqAvnpdnJZ7KDkfyyXWnn2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-Proofpoint-GUID: Kgt1AfvP9UIU5NP7YfEzllRFQ_TL3HPp
X-Proofpoint-ORIG-GUID: Kgt1AfvP9UIU5NP7YfEzllRFQ_TL3HPp
X-Authority-Analysis: v=2.4 cv=fZVXy1QF c=1 sm=1 tr=0 ts=6790ac4d cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Ljcx4Z80PikA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8 a=pM9yUfARAAAA:8 a=DW9BZRXJI4ggSEzpmzkA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9109

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2024-9676.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...SecureJoin-when-forming-userns-paths.patch | 191 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 recipes-containers/podman/podman/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch

diff --git a/recipes-containers/podman/podman/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch b/recipes-containers/podman/podman/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
new file mode 100644
index 00000000..1cb7eb0e
--- /dev/null
+++ b/recipes-containers/podman/podman/0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch
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
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 09bf8270..6d9e4749 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
     file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
     file://CVE-2022-27649.patch;patchdir=src/import \
+    file://0001-Use-securejoin.SecureJoin-when-forming-userns-paths.patch;patchdir=src/import/vendor/github.com/containers/storage \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
 "
 
-- 
2.25.1


