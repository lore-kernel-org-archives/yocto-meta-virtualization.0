Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F057C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.1268.1650349843917149120
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Apr 2022 23:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IgYvfjGE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=11081c7a60=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23J5t0XK023639;
	Tue, 19 Apr 2022 06:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=O5nujbo9Kpl6oiGEts1A+UAYgMF1jF9TyKGDSHg6IR4=;
 b=IgYvfjGEENe0C3aAG0YjnXbF40HpOfvhH8icJWvfgy/fIJU2Ay3V1ffeyyQO9bflTJQ8
 g+gHar+KbOBnN08EJaUqYDdUn0QwFjfq1/jlH6hzKK0AjpKfs0ih50ufIV1YgLaM3bNA
 JgLQC5M8lquZSPbuVDaX0Fd3jDvViafQwtMgZzInA7VmuS3egis3M322UY2Jxj1vtsPp
 o9HSVIOamSaR030KdfFn6vCO2QBx/f8AOu48qQW0boEJkqo5YzieEykriSI7LLz7WMfT
 gqOPW7Iidx8uLrklH+poCkrdO3iaq1GHdTjrG9JHBiemAatpPhc0cyr/ozy4H+AiaqP8 6w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpj2swfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Apr 2022 06:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Be9SDrayixIf2U/VsUkiVUehB1fBrYDGJzAZ4LAzudqaYhojdDN0cBykZsEefwtJBxVXWsW/yK53DZymovAC7KN8eMHJjiTlnHdhALqc8QCBmaOdGzK0yuRmQ+pUgElMVM+ATcWjLmW4SKwR063hjMAMKN029KbiisLjUNn+qHeTKCHMzNQrho7yYwAFnYRtmnYH3rMJg8K0CBOG/ohhn6lTmpNFbiF43RxbNHS6vrQZAfIl5R14fscOil/EG9/WE6KbxJjCsYC9ILBBJX080Vmycn1J5Nbne0+6VAaB/XKDm3XhKX770xuUalbRtu6EeP0No9hclHb4acUzDSTT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5nujbo9Kpl6oiGEts1A+UAYgMF1jF9TyKGDSHg6IR4=;
 b=EaL+QIPaqo2yq/FcoEZAme3DhSf1PKSK3zLOAQgbE+P0H7RQHip3k8OY2QIBoIe8Jj4NRCPXePUckWqfE8sSj2hCr9vCfkwpjhD+V0Fso4saN6WAqC4FS4ZgoqNdKySnKpM3LsyDEhkWiTb+hlatQCddBdW7YlP1YXJLfL83ERCT4Br8XtwvTIK8LWK288Tn0h7qYd2Gp1hg6cyiJ0gxpyPu++noWjkPiIX1btsIMpLOiXqfoKvADUGCf50A2L79F4edsLDTbHr7Ccy1u4yba/r/UkGESbK7UemHIxDtQsgDG1EsCHZXPU6nXrHjQ6wlLnwY0PGRYNo+VsoS+ClfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by BN6PR11MB1969.namprd11.prod.outlook.com (2603:10b6:404:fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 06:30:40 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 06:30:40 +0000
From: He Zhe <zhe.he@windriver.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] openvswitch: uprev from
 v2.17.0-30-g2404d4536 to v2.17.1
Date: Tue, 19 Apr 2022 14:30:24 +0800
Message-Id: <20220419063024.2344118-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::13) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd657fc9-f990-4bb0-c9e2-08da21ce1f7e
X-MS-TrafficTypeDiagnostic: BN6PR11MB1969:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1969A336B1633C5C50BC38788FF29@BN6PR11MB1969.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2E+ltU/RtMKRHBR7Twin5CbWNHP8KRQQnJpQuXZ452JDLH7DscbCZAwtLBkn5AOuaR60lXvQQDxbyFus6GfDT83ukgiq8nyQeWWnk80PR2lWrfVjeX2xQbQS1dxyVa6avlOrKrXPHxWuASXv/GE+b/FqpQ9dXryFEwb8rCL1WANhadwvDgScV0NjJgQ9023PWnfSUdCiviX1vbToIMTzD1BukH9dRm5452+fOh5f2Vo7S44EpjYFX6VTYleRQyPcEuqkTGDw/oN+IbjE+QtfeZPX43qnNhEyZ/L0Ym4QJkdm9CjKJgN/E4xwMM/pkhzFMDDFcu6hRd/RennESP/EpEzPO2h8ueoPZArQM+ZxIO6hIrTQtXuqc7pjcLMuzuxACzpOwo4KV6UtkB512looYE/ORjf0NQBWoDTyqlwi4GUUMkMKczABmPKmYqdpcQvjQWd0cC49HUaJ7lAPe9rFIjYWb0IeJ5aWK1+j4RqSb7B2RftbNgqc4NpLgwT4MFydtPDHOMMkQRAXbvEDn7/4yXfvghnH+Z1/o1tDzq9Fj2xDKU0t1BzUeNZGdhWwhXp9RXmGWYhKqo+aSWiK4M5Z1VSxUs2QHDmmMWaZG8k7PdyAySubrUwA/ve3eWEaI8jxbANrE44CmTTDcNZqZbE+iDAYT6gIL8AFA5KBmXo3tBH35VmUH1SE1Ta5U15paFY51paWQdC4t6OvW7ux/A1G8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(83380400001)(38350700002)(86362001)(508600001)(66946007)(8676002)(66556008)(36756003)(66476007)(2906002)(6486002)(38100700002)(316002)(5660300002)(8936002)(1076003)(2616005)(186003)(40140700001)(6666004)(6512007)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yeZ5gdvVh7hoNjZ8jW4LnvLU2l6tLvZ+l4sOsdikVSpzp39xjRDA7BFbLLxo?=
 =?us-ascii?Q?Yr70LT3Kiw5ECT3jg7UNz/rPVbhqVhfQLvZoMMtjgFe0agRRjONdslB4lTtn?=
 =?us-ascii?Q?hsM5pKD0VIUCnU9nW9mZF4h+C+phZqU6+Vbe1vWO3AjBlsfxxmxV6V7hSRv7?=
 =?us-ascii?Q?jCR3ljmEa8SPczogiL3tEb65TiCDAQdzzpXFrRdJ5+VSUqM3xKkOAL6CidpD?=
 =?us-ascii?Q?5+OWRCECLS+/RNMvL5Aii0Xq9A33gBhuA0dHRoKdSiDXGlS5PMoOMy1xnEJh?=
 =?us-ascii?Q?Im46PJ8+8bUo2otQqrLRL5tyij8KcmVl5WsUuhgwwwO2XW9hzhG8yoorV4ik?=
 =?us-ascii?Q?FlKEjdJL4JdbD82XdSFjDU9Z2IkUvCC+eOOG1FYW5TBOLqGRFGIwJ9eZWnLC?=
 =?us-ascii?Q?tYbeuPAo5Pm/Ue1+dX82qPVV3Xos4IUyAFuyPIj1GhqUCgDbMCt+d0qkv0S6?=
 =?us-ascii?Q?925v0kG5FfHG1/g9vCKrWIwt0V/OoJ0tfVee8BPmqTWarLxGzpnLHzZfxEzo?=
 =?us-ascii?Q?9yBhxDbDPX2X5LkVoHTMDyHwLvygPreENubtEnGjV2CjaxrGntkZFjV6q+Vf?=
 =?us-ascii?Q?21UVZqjx7kH0pEy5KpBEpJ5QWmmx/LeT4id/r+VNxj18N/+TxlZeDz04kwv/?=
 =?us-ascii?Q?mLFA/aI6JEfCguBnd5HjVn6S5w7x/Pe3z0o7qWA76hO6lA/Q2SLze4OCEuLV?=
 =?us-ascii?Q?nLPE4OYx6zjjnCuGjaqaZEY4kGxZMwlD4eb4pqGEUhrpHvYsIdj/rLkpv0zW?=
 =?us-ascii?Q?Jgy7GwPyrhKWP2al8M7jFZGlR/FCNR47U0xrB2k/ER42/q+Qy/+cjJnARZsx?=
 =?us-ascii?Q?HgqYoJRjGIwwKQGusGvjViOgOjcj6j5D8X0cZppQr3TNQtUrWCzId+TtkkUK?=
 =?us-ascii?Q?HCC0aKffDEir/Xv/akXqClUxsIoYk2hWiMlerS8mHreTTkW3tbOKjythQXv/?=
 =?us-ascii?Q?SiB+Z7dC/KbJGFXmOK3WekQ88ARzhWi5MGxdXO8bukKZS2p522pGCs33mOvm?=
 =?us-ascii?Q?4Is80jyR+aX10oaaZqyyyizhoIbbBkaftGPLeoFuQO3aPG3XPFqjd82c7uMO?=
 =?us-ascii?Q?d++6JI5Ck53EhyDSOBWMSA2oqRHeWhExe1p5Wzazm8SzPq/7vuEKs6+47+S0?=
 =?us-ascii?Q?jhsjx07Rtus/BuANoggh5jwENlXnrtDJ25H3bTUi3sSrOyTnASriqjy8JDOY?=
 =?us-ascii?Q?sq5Li0nIIwWvWb5kagowi+yeq7WBe6PUKm4N+xQiaEcFpGsJUsAWRPhd4d+v?=
 =?us-ascii?Q?GQZlGe+bSQYCvZRyhJjRxYLwuz7an1BR4wmzOV/LdPJ2hsKlVQ2Seu8SAYEG?=
 =?us-ascii?Q?P0UhKs3dNF2wi1TiysIAEmgUhardVQ7VejCH9SBnCT4sx4BS69PGMNi5zBik?=
 =?us-ascii?Q?cPbO82130G7XsbyYTTtnW0gBEWx70LYoU1MiShSsPGIdxIUyRbMr70lkSU2W?=
 =?us-ascii?Q?Cz48TTHsUEd7vMK2vcyrbtspqSqECr2awSz+UABaZUn+O4YzKS+Yychig5qu?=
 =?us-ascii?Q?/JOO0NYAwZ57mHJ4BfqDPx/USZffgnUSTCQwat77Q47hUa7y8TaFjZ37wGtw?=
 =?us-ascii?Q?ehjEzaBvC3VGouGwfOeUdNI0rs+8UdVxe0GeUeOg1rpBZmGW9yWj7JT3pYNH?=
 =?us-ascii?Q?t3UrzxRs831BnIe5FRQrc5pg32Fi4txRmV+5XRdGupVhKW0Y8ca/31J2mgNi?=
 =?us-ascii?Q?D2Z9PJaYwDTh5cqa1z0DfGKfFpnmjLSc3Xa3wD0CNBsgoZWXQPObIS/Li5cx?=
 =?us-ascii?Q?LIvW1vPI+w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cd657fc9-f990-4bb0-c9e2-08da21ce1f7e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 06:30:40.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TP/Bjss+rESDAsPCzyxCZh5x4zpOC1wag6MiXcgCmxNIIiQQa+BQKQWKzrbs8VfDwYi+vusEhRI4MCZZy9ignA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1969
X-Proofpoint-ORIG-GUID: zyYwWcj9rlX_bZG362N_8ap-IlM9NXRn
X-Proofpoint-GUID: zyYwWcj9rlX_bZG362N_8ap-IlM9NXRn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=903 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190034
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7187

commits short log:
41bb202fb (tag: v2.17.1) Set release date for 2.17.1.
8f42d4f59 NEWS: Highlight libopenvswitch API change caused by UB fixes.
14301b3a3 netdev-offload-tc: Check for ct_state flag combinations that are not offloadable.
3a2eef792 python: idl: Set cond_changed to true if condition change requested.
d05ccf288 dpif-netdev: Fix dp_netdev_get_pmd() function getting correct core_id.
79e291f98 alb.at: Add tests for cross-numa polling.
9c3b74fb2 dpif-netdev: Fix PMD auto load balance with pmd-rxq-isolate.
8580ff9dd pmd.at: Add tests for multi non-local numa pmds.
6bf4eeddb dpif-netdev: Fix non-local numa selection for more than two numas.
c41434b3b dpif-netdev: Fix typo in function name.
e0aa5e132 python: idl: Set cond_changed to false if last id is zero.
8da40d31c ofproto-dpif-xlate: Fix NULL pointer dereference in xlate_normal().
63a903ab4 ofproto/ofproto-dpif: Fix dpif_type for userspace tunnels.
14d54eb8b sset: add SHORT version of SAFE loop macros.
f0e63b115 sparse: bump recommended version and include headers.
70b87cf72 idlc: support short version of SAFE macros.
3777ed90c rculist: use multi-variable helpers for loop macros.
bb52e9beb hindex: remove the next variable in safe loops.
7d6cbfa24 hindex: use multi-variable iterators.
97ad96b63 cmap: use multi-variable iterators.
cd62fda22 hmap: use short version of safe loops if possible.
d56bfd752 hmap: implement UB-safe hmap pop iterator.
e2c835486 hmap: use multi-variable helpers for hmap loops.
897d6647e list: use short version of safe loops if possible.
979a9eb5b list: use multi-variable helpers for list loops.
6bacf802c util: add helpers to overload SAFE macro.
f127123d6 util: add safe multi-variable iterators.
38e73f0b6 util: add multi-variable loop iterator macros.
e91edf456 ovsdb: raft: Fix inability to read the database with DNS host names.

The ptest results BEFORE uprev:
ERROR: 2340 tests were run,
30 failed unexpectedly.
65 tests were skipped.
failed cases:
10 11 12 13 14 15 16 17 18 462 769 785 786 787 788 791 792 793 1024 1180 1181
1182 1183 1184 1185 1290 1291 2387 2391 2394

The ptest results AFTER uprev:
ERROR: 2343 tests were run,
30 failed unexpectedly.
65 tests were skipped.
failed cases:
10 11 12 13 14 15 16 17 18 462 769 785 786 787 788 791 792 793 1025 1183 1184
1185 1186 1187 1188 1293 1294 2390 2394 2397

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 7051ac5c..2e125e78 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.17.0+${SRCPV}"
-CVE_VERSION = "2.17.0"
+PV = "2.17.1+${SRCPV}"
+CVE_VERSION = "2.17.1"
 
 FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "2404d45367d104e74cc9eea50d27dcaa8c8917c0"
+SRCREV = "41bb202fb37f184b0a8820a029c62d03c118614e"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.17 \
             file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
             file://run-ptest \
-- 
2.25.1


