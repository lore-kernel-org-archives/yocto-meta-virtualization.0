Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D0FC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 05:47:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14872.1736920036011776072
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jan 2025 21:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3110ba285b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5F3kT018072
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:15 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 445yumrar5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGOuwLtqgpvZy/70sbzIfZg2adlMzCIMDtYKqe6o8m8O7QoxCIfIyz3Cr769hDjwX246tktz9A+H4zsmo6GJ9FFRTEMEBbWpKG5V2ZKho5kbqxYYsTaLFIPRfo9FEExL4+YZ2gS4v9B3jMSE9HxlMpenfjXzkIdM/gJ12U5AjeDFXoAtD2b8Hk20xegQXWRsbNqThWeWU0zCqweiOcift6PApdjdMdTzChlOOEx3jlHZ/fnMtjZXQTqCYMl+3Dk37WcrR8V/78obg/6Aj1/1IXj3xzpcjc4AxLU3Q9J9CN4XsHmnGbfWp5xDIem0liq6t6qAktt3qoKP9pqlO5yzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DsPxGtQW+pgnpK625U2ZP4QnjbJez0p+D+gPpXSRU0=;
 b=OKuA9FY3zl/Yxx76NVRRWquUee1ddy5+s0Ffl5gmKC/TQIOynY3KqtuQDUudrnMdj55y9fRX7seTFPD8nFMmj0xgSkSNAuyHLkBjBIOTD76MN2Zn8eKZ3SqmNrG871XZxsqwJ67xg2MFD9yiB9qGmqwkTg7i8p8w14uQHC8X5B94NGOZNJAPJRt7yGG300cl7hUd1W7tzOt1+3c9RwL7lDdsPj+3cvmqHJn3KdWy08B/4DrWMN1papyKHhoGLXLF6CdMRkEl/GJjFKq9qzF6kSDWLsK4fa4DUP06lbmzSl7O3txSkLTZm0oFhM/gVAejLs10lqi2s6Hy1KXk4evweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB6127.namprd11.prod.outlook.com (2603:10b6:8:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 05:47:12 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 05:47:12 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 3/4] cri-o: fix already-stripped QA issue and clean up
Date: Tue, 14 Jan 2025 21:46:38 -0800
Message-Id: <20250115054639.1079705-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250115054639.1079705-1-Qi.Chen@windriver.com>
References: <20250115054639.1079705-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0169.namprd05.prod.outlook.com
 (2603:10b6:a03:339::24) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e4ded3-c9be-4ace-efe0-08dd35280e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F2Lb8mXzvKLmp8ILqag/nnm8jSLGs9EViYhKKffCb5D6Dt5gf3gA/i32a+MB?=
 =?us-ascii?Q?7hKlajSuKuhe8r5MYKBLY7IrHD4ofio11tZnBKSQzIMDkXgEQ8mRYT8galTZ?=
 =?us-ascii?Q?4nwjdBLmlC+P9uDMhYHcFeZBrEdDurcXTeo4SazkXcLmbrkbuvsFg3fwjKI+?=
 =?us-ascii?Q?uSzkQl64OOGj6BxyIp20geH9Rk91rFkZ1BVnML/qsViVH1iNQK6pv5GSRNgf?=
 =?us-ascii?Q?9p74YOfVCZJbK8J4Hj7EluW4ulTvw2v629qe0vbeVQ0izURISCsvlxEJyxma?=
 =?us-ascii?Q?4Jud+1VydWNeywskgJFkq3zkFf1g624yVbuQbWU6d1flQazNqmMmHjjpPX6J?=
 =?us-ascii?Q?CMahhWxMzo2xMcc9GCOH+AS5iU+TgB2pCXdixmrriA1PNd9O5jIyiVTeoL8N?=
 =?us-ascii?Q?0R26Rp9X6djOjpDJlC4GvnTxK0aIsKXiYwuzsp5uKcKB/3TWsxg0EFumUHj/?=
 =?us-ascii?Q?btEp607tKGs65j6WJ45JiYW4ekrERBE2RFnPp7/Fkdha90RVRH/7Gp5B2Atu?=
 =?us-ascii?Q?QBDyesx4fC1bNqY8lVHuGuOQyMJF7TtrUgjmPsJMiNuC6tSINviXHYn/mIco?=
 =?us-ascii?Q?5TmvVNK4Lt2ex4bXEx4FbcQ8HDGesmJCslsqx3/N4s+TGhRtE7KaIXoNcDHE?=
 =?us-ascii?Q?jH1zJTweHNrUVUxgzO/pigAw5/FXxwYWaUxIS3P4abakv/NZL83QiK7oTQF+?=
 =?us-ascii?Q?YTAAjYw1N8qKU067ziXoV3oOhN2PygA1RWC1cKUbZP1r5WsrTf2vvvIG9tT1?=
 =?us-ascii?Q?IZHE13Za+QARmiz1+Qn9olRDDwUAYUJlc+VZ7oyhA8leAGdDFpAPkrLkyGho?=
 =?us-ascii?Q?Kld6LPfhqNP7hzPXwHfXlvQsWDTeNToHO6v+/XQdHy7hRRi9UBwvOYxWaD01?=
 =?us-ascii?Q?6MMFo2t2/06ryHYcml4KijsII71Ho8IzKGcSbFRZqnVwByWvqGw4LmnxOcMS?=
 =?us-ascii?Q?VsHdZ7HjbObUee/qbLTE73xqGR3OeKRGD8HvBlfUp6DrsEg8VizxkrbafeUK?=
 =?us-ascii?Q?ElCeCft5p7BPrXw2URo6jZ3H0oxdG7qpu1+7K3BhouA8NFk9y9P875XMsckH?=
 =?us-ascii?Q?RF6KyyNIt1eZ+o/Ndr6UCojxGZ95qP/gDLxGO93gKsZIQiu99BWX6m0DxB2B?=
 =?us-ascii?Q?vGtuRDDfvufrwHHNqHU3cJtdcIPva9ImmyLGb5n8QoFaDfmacJTEmN9gUP87?=
 =?us-ascii?Q?v2BwDsXsIkswDxXKELC41Tfgd+xwT15mH5gemnyRoTUk5UmjKhnXArBTBeF4?=
 =?us-ascii?Q?kKQkCjW9Ej/L+scqt4H2IyElVmO0h6tstuHe7HmIGRGSuE6s39XXBcAYKxm3?=
 =?us-ascii?Q?eDEjQWxErDYyNn+1ybQzmNipk4loBokVqBDCRjpjIl+/Hu6mjAGgv2WSyUVr?=
 =?us-ascii?Q?osZCH8o5vMWFm6eSpYOPOTOPnpO7GWbCZpqW478YmwfSYqRxVw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GzDlHfjAuWQGtR5pr/FYxxXsqTQ85bz9FirCrlDdZAPtADXdbV1ynS7jOfZb?=
 =?us-ascii?Q?dKmLnRwKCoS1cRNlwXe5nFGikxzu2cTPTkqi98fT3KQ0rvOiQJd/GxFZs8Hh?=
 =?us-ascii?Q?7D8RGWJQaw619giYxaCZcqTsbSnbkm3hWvwns7ZlDCctg9DpOurTOSSgaPdd?=
 =?us-ascii?Q?uE1sf8p/fgYn3Nlmpg+y15MEEVy+cLv4qWk9Ct+roNTJKznArb0YsOG+ziWx?=
 =?us-ascii?Q?lmm4G6/OApUum1+VRrNesJa7/j98YpJP60GCg4ii5LQE64m473o9diNcOAjP?=
 =?us-ascii?Q?UPxeY8jJY2KA3xDJ/MAvI2lNysHp7bnz0Xl/TuuD9nbZ2dgIhGmtAk1FYTs4?=
 =?us-ascii?Q?CQnV/5nN7F5Je3Bj/7KZzYVVA9+gGAfsk7JSgorB8HqCm7xLmCxDfrmcPyTY?=
 =?us-ascii?Q?26mFIIUqiFlGXruEQRErBQPAjc7KKrmYi4olKyYv7rc84g+sfXTUfqLjW1IO?=
 =?us-ascii?Q?BMwJmET70s7jRClbioFUuVNhKl/eWzGMYpPSCzEFMiQVfD4GoYc0hZJrVfty?=
 =?us-ascii?Q?VBpcBrqivcCC7Po4FKyXmnlTGc7n5Le5mQEbpW3OECduG/StrkU33ebqAoAB?=
 =?us-ascii?Q?bNftKv6fpJslZRPTH8AUhxoKRL6OfU+eQiHAYZL89n0s4ajY5UMXVTzTpxcA?=
 =?us-ascii?Q?uXBnfEFbqA++5hBEVzfM8fXNSeA8/Bm8z0gKWczuQcCDmHfBjpYNNeV7Knhm?=
 =?us-ascii?Q?6EhYFxMZKBWvqiwdahyprWfvBCOEn8XrJV3373Fo62/POYg0i3unPzBe0ixA?=
 =?us-ascii?Q?kRwsKB4jExatoDu/xjjsKKcOniKFezWiG1Jr0W4gIqQlLD8gHslzBQ6wfzTH?=
 =?us-ascii?Q?Dyk49BuwiRs4BmoH+EOcAKz8SE1yXjOYTYv88+v2Y15dJGs1+nUqH+WXhyBK?=
 =?us-ascii?Q?OG/02gYbxHLpyRRRWz8Cwob7QplAr1gp2HWwLmKp7V3n5Iil5X+YfWGZp2N3?=
 =?us-ascii?Q?3mcK7kqkOv1HAylVpZLaam3UPxWQgoEyQ4axEiyw2bdxzHTycelRdD60rLy1?=
 =?us-ascii?Q?kG1cm6ypkqIdQmcE+0HmYsoB7QzqQYFVf+zrjauWwDLnXlLRaiqhve7VKZza?=
 =?us-ascii?Q?O1uzVdIkr+Hh6EB7QScxZQPKjhCoFGCJ624B6rCtWVvXSup0gtTNj6f85tch?=
 =?us-ascii?Q?GLIQdvz0PwOto0PsJSPzYXPn0hXBbkMf9CDCR7QFl/mHQP4Lsp1TTuRCWPt3?=
 =?us-ascii?Q?Dr2pXbeeCFwJnY2oe9BadSHibit7uL8lSHEKGidsVJGJ0KmkwaAb0bk3fI0l?=
 =?us-ascii?Q?4MAwb0nirNxNBuv/8pR/QsZpgsHUokkdzGLvhmD8z+LWtQTJfpVo8dJcd2Fc?=
 =?us-ascii?Q?Aop2BWszHsuEklsvgAz7r2h21JCGo9N9liOlYA1Sr82QAFA0u/HMmGLWITY/?=
 =?us-ascii?Q?GGnm1jmzd7Kd0yNMGCIjjPBujdap5hfMfV4Aqu00gW7puTInKU9K3KCGrUgH?=
 =?us-ascii?Q?nJVHwvrnWcQC6QRVNC+dL/DsTLnYsEx4sm1i/Q/cghGnybf5f4ONSRyNTKvJ?=
 =?us-ascii?Q?WqzSGXaSetsDeLURyY4yw1zYXNzXz2CPpQyNHynWyaLU1X8P4MqgbjrOXx2K?=
 =?us-ascii?Q?zRwToopcDBFKgKRxNbkpbfUD7dnnptTGiQmtR+54OK7L0wN36NDxQ+yFZY7A?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e4ded3-c9be-4ace-efe0-08dd35280e3c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 05:47:11.1238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nreOf5CY5KfkHL8WyR6AtgIvlLL9L+VQ4eVqrSbAjh6U3YDE6tWLCV5OZ+9fCHfrMbQTsooL9EB+mFTzlxoVDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6127
X-Proofpoint-GUID: lRrOTlhZuaB_ObhxUwWswZUFWM4xK1zt
X-Authority-Analysis: v=2.4 cv=EeoyQOmC c=1 sm=1 tr=0 ts=67874be3 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=mSbf5KX9a_9rNpNEI64A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lRrOTlhZuaB_ObhxUwWswZUFWM4xK1zt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501150040
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:47:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9080

From: Chen Qi <Qi.Chen@windriver.com>

Set DEBUG=1 to avoid stripping.
See https://github.com/cri-o/cri-o/blob/main/Makefile#L93

Set STRIP=true to avoid stripping bin/pinns.
See https://github.com/cri-o/cri-o/blob/main/pinns/Makefile#L4

ALLOW_EMPTY:${PN} = "1" is not needed. Remove it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 5c2c453e..10c811fe 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -60,7 +60,7 @@ inherit goarch
 inherit pkgconfig
 inherit container-host
 
-EXTRA_OEMAKE="BUILDTAGS=''"
+EXTRA_OEMAKE = "BUILDTAGS='' DEBUG=1 STRIP=true"
 
 do_compile() {
 	set +e
@@ -115,15 +115,13 @@ do_install_ptest() {
     cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
     cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
 }
+
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
 FILES:${PN} += "${systemd_unitdir}/system/*"
 FILES:${PN} += "/usr/local/bin/*"
 FILES:${PN} += "/usr/share/containers/oci/hooks.d"
 
-# don't clobber hooks.d
-ALLOW_EMPTY:${PN} = "1"
-
-INSANE_SKIP:${PN} += "ldflags already-stripped textrel"
+INSANE_SKIP:${PN} += "ldflags textrel"
 INSANE_SKIP:${PN}-ptest += "textrel"
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.25.1


