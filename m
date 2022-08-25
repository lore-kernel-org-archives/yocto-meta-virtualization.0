Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF3DC04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 13:17:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.23791.1661433441401720254
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 06:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Y1OHNXQX;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5236a41fb2=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27PD1Rf9026828
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 13:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ttJe12ghMOkIijp167rVbPm9RsoE82QSvDOjLSBpmy0=;
 b=Y1OHNXQXkp5XVGLGFGqgJD5HhEQ9TJNXAM3StFfrCATasxTjoCq7yUXjF4OVmx/RJSQk
 Y8mmICDcjNXHYSAZsGt1Ui/7MCSCnGi5nVFtePHHCmFPvqiGa/1ZSH+37Zx/aeFtGhjv
 5ynGX9dWgtFrgUtcJ7OSQK7gD/UrL6rF/z73y19PTV+fb1aan3LhwEiCeZaiXl7HFwMs
 vu/ouuSQOxhUrPuOTRq2GtJUeHvzkTkW8gm+8k0qkU2pIxaxGhSoCGiTr9n6tmcvVnuQ
 diC90XdHMCYOuC6xlmueniGbgnuAHJXexbMUcsar2dWyVUJQw+rOfb4vudLsa/wKWKXO +g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53s31qfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Aug 2022 13:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Siuzu7SiElPA2Z2VVxHwYqqs28CHK41+YS2jqjroi6F0LpiSy4aD6XRb/MMUvkutdo4vLfwgCsOzMr09bXrorNXOGWhfh3b19Gf03R/TbXhuOx1d30622B8O2LqZuoMVituKb72avCXbtsgmljSuN1YljDTdUHkCq/Kgcj0BvrjH/YBOokKD6VDXjy+CZkOIj0fh8q+Pi+ROIoJm6IBELISs1HGWzn3t/vNAZfbxmPrQ2WR4EeayhNwxysrB5iqdJiDwd5rFyERMwnNScHwntZavHMN6k5i3SAzG5ly2gRvOGoQpk5k5w5w9ENj7LWkUvPsbEqTdz+XCdVd/GB1HCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttJe12ghMOkIijp167rVbPm9RsoE82QSvDOjLSBpmy0=;
 b=V7Ko3+r5v+x+MrTnGXnqfnX6kOtFzmZxg1f/tLQWgwv5SX+gAXs8t0/iPX2d2e7vJhrB9ZB/gF0wK3jY6JTwFcVISbx4XIkf1WwYU2Eh9bjAH6uUhKiBh5LHQkA1EeqruY+dKAR4AFUJHUAwTyB1bDThRiTvvDv0bcxrgEvhbEK9N6U2PGn0Kf+FkI3cJh4JQ6CN3eloh2apauw1pZU3eVaZsHjQ5ocenK9yR0kVfTmdh9EFalEmYqoNJ/npq3hfoBwInQ+YOGT9VJbKQh9BRw9HcrM9edout2CEBGMainRcLKuFlduhDpixX7lJIfmPsJP9RdJ/eGf2IoRh1H3fag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BYAPR11MB2903.namprd11.prod.outlook.com (2603:10b6:a03:89::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Thu, 25 Aug
 2022 13:17:15 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5566.014; Thu, 25 Aug 2022
 13:17:15 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master-next][PATCH] lxc: fix compilation error
 for ARM/ARM64
Date: Thu, 25 Aug 2022 06:17:05 -0700
Message-Id: <20220825131705.17413-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::49) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9270b8a6-a622-4353-2aa5-08da869c2125
X-MS-TrafficTypeDiagnostic: BYAPR11MB2903:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kGnHySIln5hLWbbVt1cExqle4xqIUDmI5nse8Q4ZRrHOl+46f3JQIWv2rxMtHp6YK45RyQx+NHKo2pM0mvSbISvnqoINa6Zg9tiKAnDo21aP3XGG1nee8bD0NPmLg6mLLQf+qA1IEPCCGYzBigqkeD1wC6najCko/R2szJozVzAo7xjNfas1KvcQEDc6eyJPyQtTApJUOoVUtDS6TuGLJqvvjEMvu1vlH6R0p+HBUt3pn9UXxpaWoDgF/2NnFCvmrRfH8cuFwCqIhk9aO+Z/y2PFlW4X9VUSeeBGTmgqHFaOf+EydQk/f4a8QJ45BJH2TtBftaSuZW4OiY13BRqbGcq5WNwIrgbh1fr7Bz05mlRH+m6CYLTQ+gBVMizuSrdb56xkV1G92fgLYGnMdESPYCDAgjb1TrR44RwCWGYhUyCVH9KfhqVqBsYckH8uBstqlvbFcBOVYv5hFpP9Qmgsu4ynQMf4xGK0EXe1y6j5a4X0ezgNPGpZQHpXRUM2bT9+Q9Bsx67TWkcNd8CObc4pmTsflzcxNnpFWFNCfjXtlieBO+maGJ2zQi3ZCIP0aMwz5tXoNf4SmKzzY5WK2Jc/e9VYc5OCjVTF25F2RMSqsLNQeX7Fc+pgTOw0L4jx76ywkeYzJzjS3UoGz5H886fWBcXFUn+AuSeY0z37nWtyAc0Zej8KW/nNa+OxqcJt0uf1qMG3x6IMbg8viCOqAKGYk5CYyXjzQxKjN6NdCx1SmQatkKmYVS5CszUXSAnICxD2fln+Yn/SidQZSJ40kMGRhmfCaY3b5xIcheWwkwJaenM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39850400004)(376002)(346002)(136003)(66946007)(38100700002)(83380400001)(38350700002)(8676002)(36756003)(66556008)(66476007)(6512007)(8936002)(6506007)(5660300002)(6486002)(478600001)(316002)(26005)(6916009)(6666004)(41300700001)(52116002)(186003)(86362001)(2906002)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ilzB4pT0q0hHmCtlXTwagDJr6H7aFVF3bLmJQY/gKT6WWLk3ikTWI4VpSvXC?=
 =?us-ascii?Q?oys68y3bpt2X1wSzZ+sSsIItomAbf7802a5F+m0DXhQM+SXFMc7Gqn47EiTR?=
 =?us-ascii?Q?1t4PRLbn3xLR7xxHvPP9PtFaCE2aVpqEMP4bS4x5WonXxsvKzRNmgc16ibJ1?=
 =?us-ascii?Q?3IChzTnq2Iq6VTGMn6oZ1dIzMLHuavEjn0L70JssIQIrdKxd/xPctOkA2hZC?=
 =?us-ascii?Q?bNVhbc63hA+hM5VSKIh6EHakBQEDfTo2MBO6p6URxpANB3ee/fjo+p5djuKn?=
 =?us-ascii?Q?YyuTCJsod6BO/DT5UcLi6hxqCCksf3aqqPXHYIlpC4RXPfEsc8LcE2ixexgE?=
 =?us-ascii?Q?4O/uk+xsovbosGPPk5aLY/zW3bJpL3DTn6JtnoO3g8FPEjRvBiAxvLohP0WF?=
 =?us-ascii?Q?NgQwUYfRU0spFDx4Edmxfk8O3Ko9jniSrCd+7KcynAas4gRdJ0WuLKOy1Fgz?=
 =?us-ascii?Q?Zgztms3heub7a82fTvtc+9l6SBZlz19jdctBlNvUWUmALoF7lbK6eEInKSgZ?=
 =?us-ascii?Q?CSJ1YmYNYzj+jo0HipAibRcwE3tYMj3zsj7lFAivuD3dqY8vc8mGJjxsWaTP?=
 =?us-ascii?Q?c/732kiUrGGVQny/+nCcAE/GLZXvYZ19KkW8kzTXG6NQJ/jl1KaVaF3/u4KB?=
 =?us-ascii?Q?b/vWFiBUcYejF261RtC2VsZ6aZ7GzRplWplWOYledDJUyt7CG0CQkbfY0Lf5?=
 =?us-ascii?Q?+VlsMMH7P2q/k4aI97Urpsgzr4//j47sYNLKP7wfMPa6l3jBYaV4UxtSnNWq?=
 =?us-ascii?Q?KxxBBYSITLIrKj9kPcAbhOIC/Ue+6c+nIjbVVImTWOX/plhijqmhdj0w7Xji?=
 =?us-ascii?Q?2OuP8yEZtWpsPFiTJ7iNevkpFlS71hmYm0jkREGkkXNUXmEXorSCoa9xxRy2?=
 =?us-ascii?Q?dWGCU1uNvXj3hA7GYgwx9iK47nY89vkQZsPt+1zW+Tu/FretKLOLAxUonFgP?=
 =?us-ascii?Q?TvOtVTEW7xFUaR3nd64JpYHSoCaVqRpyBsgO9nl5TZIdZT0vPJDRPJfqIZeL?=
 =?us-ascii?Q?qZcsX+H/sZyHU3oeBtUnJL1nu12kc4BnslB0Ks/ez/5sCvHLHiqSK53Kd/5P?=
 =?us-ascii?Q?M+WGnOgTi6ybw1PzG+L8NWcNVJaeGZakHFGmVTDuUupzJD6bvvKESnL0KY4T?=
 =?us-ascii?Q?lqapw2Si2SNK94y8CrZegQmJTFYXolpqza7GiiW5izsya19hyOYnYNYMsc2k?=
 =?us-ascii?Q?Vtxqu6173z4sypgG3fz0HJnyWUV7fKy5qrMEqiKoMipS/p43LPSz8YMATaF2?=
 =?us-ascii?Q?hLfHScJlUGGR+rQQcGeMg7TTTuBpemg47SzLo8tRoaElP9SN0WVKpjiH7ZGe?=
 =?us-ascii?Q?gR/+n1URfXLItMZOvtHTbVT/hy3bXe/zFItxwtDoxzS/8uNFAGpv/yCflWg0?=
 =?us-ascii?Q?JUz0LRLB2IxAdXNlM8sP5Q1inqqCfJtIxOTKXSMDN8LAioClzP/WMfXqURUO?=
 =?us-ascii?Q?7mWf3BUu5pfU3no4TxeGKCc1488NgPzjUUNpxPN8SPacckPcI1u1k5NQV97s?=
 =?us-ascii?Q?gQsny3iM3jkVNdCsyXE2OJ/S8jg2tog0COagB2ASjHaH/nv+bfK9CFnAcVPj?=
 =?us-ascii?Q?EDzYvrwgwsZo8MzNiyOv2Vif+jeCi5agZT3vFevX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9270b8a6-a622-4353-2aa5-08da869c2125
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 13:17:15.7793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fgoh0Xp6lWV5QfcivqTqfHgxe/vE1fja5WhJWvpN38RHuub0qK4IlWSY6fwX2QjzqF5mCgM3LvUTko5qC5K8PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2903
X-Proofpoint-ORIG-GUID: 6QAm_h8eqbPTD8XTw-jsslXsp3j6_uqr
X-Proofpoint-GUID: 6QAm_h8eqbPTD8XTw-jsslXsp3j6_uqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_05,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250051
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Aug 2022 13:17:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7562

There's compilation error when building lxc for ARM/ARM64 BSPs.
The error message is as below:

  | ../git/src/lxc/cgroups/cgfsng.c:1234:111: error: incompatible
    type for argument 10 of 'sd_bus_call_method_asyncv'

The 10th argument is of type va_list but NULL is supplied, thus causing
compilation error.

So we use sd_bus_call_method_async to replace the asyncv one to
solve this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...method_async-to-replace-the-asyncv-o.patch | 49 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch

diff --git a/recipes-containers/lxc/files/0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch b/recipes-containers/lxc/files/0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch
new file mode 100644
index 0000000..ef87a0c
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch
@@ -0,0 +1,49 @@
+From b0abedf60b40adf0f2fb3cf9dfee4bc601f7b39f Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 25 Aug 2022 05:45:53 -0700
+Subject: [PATCH] use sd_bus_call_method_async to replace the asyncv one
+
+The sd_bus_call_method_asyncv's 10th parameter is of type
+va_list and supplying NULL when invoking it causes compilation
+error. Just replace it with the async one.
+
+Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/4187]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build              | 4 ++--
+ src/lxc/cgroups/cgfsng.c | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 21955a050..f8bdcf4e8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -295,9 +295,9 @@ if not want_sd_bus.disabled()
+         has_sd_bus = false
+     endif
+ 
+-    if not cc.has_function('sd_bus_call_method_asyncv', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
++    if not cc.has_function('sd_bus_call_method_async', prefix: '#include <systemd/sd-bus.h>', dependencies: libsystemd) 
+         if not sd_bus_optional
+-            error('libsystemd misses required sd_bus_call_method_asyncv function')
++            error('libsystemd misses required sd_bus_call_method_async function')
+         endif
+ 
+         has_sd_bus = false
+diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
+index 8a3615893..d90e5385e 100644
+--- a/src/lxc/cgroups/cgfsng.c
++++ b/src/lxc/cgroups/cgfsng.c
+@@ -1232,7 +1232,7 @@ static int unpriv_systemd_create_scope(struct cgroup_ops *ops, struct lxc_conf *
+ 	if (r < 0)
+ 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to connect to user bus: %s", strerror(-r));
+ 
+-	r = sd_bus_call_method_asyncv(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL, NULL);
++	r = sd_bus_call_method_async(bus, NULL, DESTINATION, PATH, INTERFACE, "Subscribe", NULL, NULL, NULL);
+ 	if (r < 0)
+ 		return log_error(SYSTEMD_SCOPE_FAILED, "Failed to subscribe to signals: %s", strerror(-r));
+ 
+-- 
+2.37.1
+
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index bcc1795..9cabe05 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=master;protocol=https \
 	file://templates-use-curl-instead-of-wget.patch \
 	file://0001-download-don-t-try-compatbility-index.patch \
 	file://tests-our-init-is-not-busybox.patch \
+	file://0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
 	"
-- 
2.37.1


