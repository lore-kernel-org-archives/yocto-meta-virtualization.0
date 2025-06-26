Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B76CC7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:01:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3889.1750928498316875997
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Jun 2025 02:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82729d404e=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q794Ua012049
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:01:37 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqanbb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:01:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewgfjP7Lhy9we/YV7wzA8Pr0iIEoHI1ZXAdhItGyV0F1s380gbqYcmf1uVIQfzu5jQKt1D7Eh+/do5qbvdLQ6stWq9C1bmxULp+tTIId+PNq3S3MkN9a6aJlghmMb8B+T/3IpxDaFS+EE+9ws7y1QjzEaOtWDWcNDBnze5ku4YAnT5PeRjFmv2t68PtS/UB41nR/rQHtEsEXFbPMt4K+I8vhL4Zjeslmit11yQWzyURkoT2LWX2gkTnOzz6hfnD+MWGIR2mNjPxHYEznKQuOJ2ejv6Bs5w0xHZ5NLuc0qMjSLEctVnGpWKNs4C5pthhsnFveJjpNFVIJrzPtX6P6Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vrwXfC+WxJ+6CF7DMbtsjYkXhW5rrguZ1RMhp7Nfm0=;
 b=FP9EEqfhA6OYT6DPCFfPoAH2ob1SzfOBWBLKiJAQz96TDf7ccYA4hjyESDmQhztFENEuITceFwVRE/d11Wy6DXZGdANQUdJB3agHxEM9zWMASGEC58Bgv8LzVIERrtaexTLmvnImNkM22zRk+BC7rmRiAF9ihPJG6NUX3Ni4/ypsCa4Gt8Pr0KvadMN/bxZZQKdqiR9Zpa1qLgp6/U6ULqkjdTu14XK9qd+TGbkgHER20kouUlQWMSe62vfSEXD90v/3Jsu0YB0zczkNDD1kQjE6XQmpHCj82hBWFWS8QtZ3tLU/rFwj4uhFv5ryhQ1URHlznEfMhh+WTkYie2ewwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BL4PR11MB8800.namprd11.prod.outlook.com (2603:10b6:208:5a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 09:01:32 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 09:01:31 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH] containerd: upgrade from 2.0.0-beta to 2.0.5
Date: Thu, 26 Jun 2025 17:01:11 +0800
Message-Id: <20250626090111.680442-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0124.apcprd03.prod.outlook.com
 (2603:1096:4:91::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|BL4PR11MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: dc45f760-5098-4a8f-7636-08ddb4900ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UyjB4ZGNe7Er9UopNpLkUSEFf2XF3sTE2lOgngrVOU/OCDk7VaUTDywruBym?=
 =?us-ascii?Q?GNHDwiMv54Vj5bT1FW53/YQtlUFQCbFaNy3nCRRq5Lsf91f9DLDWMOZqSDQH?=
 =?us-ascii?Q?MJ06Q39VGp5Dm9PlMDwcRQ/ESSO08NrWEeI4hnc+tQI/p0FW0lPe7tCWJMlX?=
 =?us-ascii?Q?t0qzHVzPGXuItGj72I/BMDkieEyr4xzH5UsX3Y7Dm9oJdqqU6xst4BqHqYDi?=
 =?us-ascii?Q?4IPe+jeO/NDZL6Invo3Tzjv23pRT3/KDozMSKrDWOPLr+8snPBh71Sc1RGZu?=
 =?us-ascii?Q?iJQtQ5R6KE+vCA4rp2s44Oi7iaroMmZrF386q2tDrTcVN4TjdWqs+GjNyOtm?=
 =?us-ascii?Q?+nSfgnxg59Os0jSSa3d8vAoIZAcZG7z8PCkG8wC0b4XSdi+KS3mfN8TomQ6o?=
 =?us-ascii?Q?3FEtTvUCXInx4sqk1v2028mGeNispF7BUGHVApodz5HHMRvc4yCjRPWiwm1N?=
 =?us-ascii?Q?0F5fR7n7+ONVQ48LP9xbiziS4HFHrNuIKEb86mkcJi0OHp8SbErV8gxw+Lea?=
 =?us-ascii?Q?smzHsV4ufc3MJcMec4dU7gZE5FeDqZnH4vbK6EiE283SokpyDXZqHHm3VGBq?=
 =?us-ascii?Q?oP7B5j6+mDJKzzkTUPndkzpr+SOT5PzYgbELtYzjBbM5OZ2sVJm6mKiCEjZJ?=
 =?us-ascii?Q?F3mMcFSnB4RcR6pUOQAWKNfbWfUu9YJ3FwudII4PL8+UlEOTCNDcUXhS0WiT?=
 =?us-ascii?Q?jCd2oePOk6aeJRUfo6tn4jkAZ2keV9CKytlCy2hIKnBRsTV8XpfH5XVNPZLH?=
 =?us-ascii?Q?YKFWKPrRc9EBNfEUd7xPW+xVRpyYivc4jjaQNeJkX235Doj3EYBJDBMVc12m?=
 =?us-ascii?Q?xic2+tm2pOq7AZSieh4yHPk4uc/w7jyPEXjyZ5qMe1WneW62Y8NsX7ynUPw6?=
 =?us-ascii?Q?/QJ8x/UbK9tcsmdg50HxdUMQQy0NyUw1+rTnxCGaUg5MiWhxghiEKbI5eBHn?=
 =?us-ascii?Q?1+GwjA/O/sRPOIX0PnMlk9ndanCxQQmjVaQAgHaFYcCQesKSjWWfDhomJX6g?=
 =?us-ascii?Q?WKrMoSwyLvz1rS1Enbj0qIDiOnyMWdB7kRGJeYXisM/ZzXxUMgUOamUSwVk4?=
 =?us-ascii?Q?5vYcaT7zP6uI+Iwixp+NvS68qTlWU6pYzKwfujstL9bWio9XiSQ+9Nju3ExN?=
 =?us-ascii?Q?ApUEitky4JkvIsI8n7tyL/taqd9BwUCmaCDJzhY/P7H+mrMoTiRB5aYRutNf?=
 =?us-ascii?Q?joxpGOXuBm8Ry+nIymb1jx+bm0f6LzX6qKaYhRC6J05MbYOgTiD4fZ+ncf1U?=
 =?us-ascii?Q?NdcK6NdNw6P6NP6yzU22MB5vOx9zUw7CkeK6nAEmo0wd+tKNpcMg9ZlMYlKr?=
 =?us-ascii?Q?jSE3J84PTuQUhRXSMjrv9ZLf/2ghNcSsvAhEOauhyc8P+XKk2RmjsZybe0/n?=
 =?us-ascii?Q?Ds7Rd81KdTu2Uh7o8ZnS3ZVmjdqufTyQn4KDmt/6+norPc0loJpQ2D6N8tnp?=
 =?us-ascii?Q?PGGgWQQTWtY+Th/C84UCBMxPrJ/fQ991?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dagsyDVU3WEcYIkUvIcO9woSYAkijGLP1TMdGrpkNd9GaryJtpGAhzpP3mT5?=
 =?us-ascii?Q?izPDf0Vg9KAExYfHEp1/SgFWiYH9hk+m8LgCzvEzV0FU8A16ttB2HNnHKiPv?=
 =?us-ascii?Q?3BW/8qhyrbkR3Vp0OvfJq5ji8vVx0jT40tfBwsM3rcxahAmvy9VURymr8bMe?=
 =?us-ascii?Q?H56jTxU6dFao5RuyZxhEpq3kuQlERr6pQny7OHXTGZ9SQOio75dwtc2WwCBD?=
 =?us-ascii?Q?SocTVGRd3qeDj43OtCtPO/Hkt3tGaJvwJV3NBD1q2Gfu/+h+E5eNR1KA3kPk?=
 =?us-ascii?Q?5w8RzAryJ77zfg9KPs61LRe0F9njiMKddVJJ7t4L1gND2Opa3K6F+VHK25Y7?=
 =?us-ascii?Q?Sxa4VmHV/Lgh+DzfMfZ7grjzB7/Cwi+yYh4j8lSQdQ/dqunQB/wTcGqlyBWu?=
 =?us-ascii?Q?zPBheHspocE18g2Ct+yBWtb3ilfnxaGTqMW/Ih6p2MaUMwIl9SNoCV1SaSSE?=
 =?us-ascii?Q?UuJfL/qn1R6UTg7EwRsFZBIIBD34MKEr6/FtNox3T+HbvJzrDSXdnznftDyl?=
 =?us-ascii?Q?0V1ZaqXmQVDIUpwyDcFZZU8qum1o5PnMavde7PxxGub7jAU9OakvhOkjRU1b?=
 =?us-ascii?Q?g86baKgHjqiNXJR0vpQKpdlLT4YpmXgQp90BNw+vGC2vtS6nRnYDuVBJGRml?=
 =?us-ascii?Q?kAkhUJ17hAbFcfOHZsnxSqd8XLFDhIF5o9G2iAkHxvYXm/J6AcoC/kV/bsPD?=
 =?us-ascii?Q?9+KJviZl3d3b6vXhF0o20489LnMb2yRzy5WrcRT6wR8q3s79/rzqRzFKG8wp?=
 =?us-ascii?Q?1gaIeGBp2dcEkj/YTXGUP6mDZ06BcC1bz1UbDoW7GK/UVZoBShk7Jo16ulDy?=
 =?us-ascii?Q?r0ExuU5eg8sVY1UQBToSx0dXkyo3HedaOo22EuI5JApsCY5OrqESez+Nu316?=
 =?us-ascii?Q?rlKjCsUDUv/eZYq+itoUZivEn1hII4EpjxP3Mgvpxr72A2r9piUE+o5SkAZT?=
 =?us-ascii?Q?5M30bfEeBidZsxYEyg0CJJbP+UTWdvHsTGcEjEbl+18TGhKhFXkC0QELIFHS?=
 =?us-ascii?Q?9aU8gy2Gx6SmVJg7OYXAQUovu7Pj3eEnKLj+Pb18r+Sd12e51AuQbKo4axvK?=
 =?us-ascii?Q?pkncAJeVb/LrpZnYdGHqGcOUnU+Svds/mFfiojn+sVEKBFKLcvhlUyal/X5S?=
 =?us-ascii?Q?4kwKLzlEaLNtZFGvsoIWZscg2BZVpHTYxNtrFZGeEdQnC/fruFS3gOvwTEO8?=
 =?us-ascii?Q?F5DowPxmOnO8t2p9aw2+gB3P+oWSGrrxPfK97LU0AAyr5l1pOyTMTvMeprsU?=
 =?us-ascii?Q?Yogt9IELu8mbqCu8O/MzXz8iLxS9w+NUOsS5mXurE7U7zyJPulWXzq5PUUHQ?=
 =?us-ascii?Q?v6F+lRhLQsspBN7D8OSHvptTim1AUl76UGD5zZ9rpDVc9s7SufavFsegJAbu?=
 =?us-ascii?Q?91W9D/eaOeqfY3ddTf/tmjZ+abvziz0G9GbYOO13G6aJE4OLYq0/Mfs+Tdtp?=
 =?us-ascii?Q?qkHl3+g1+55PMF/BVgJp/qoRwp/QWJggEOej8DMtOnm2dawtU9d2eVZX2y1A?=
 =?us-ascii?Q?1OJg8+VB/rbMbeurX2Uyr0zIXLP3lNpVn+kEM7MnhHCcxVjydnCme/LCh80A?=
 =?us-ascii?Q?ogcfrhRhhuoR7YGt/2JclBV9bKEEb8EC1E6EJOwX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc45f760-5098-4a8f-7636-08ddb4900ad5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 09:01:30.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euSEMWMb53lbcfKyyq+V7fl88PAUNwr4hTMqIsYXAHzz6wYPSQLBtTOQyS9POflhjOuC9+oqJV37fIg3pbXdZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8800
X-Proofpoint-ORIG-GUID: lTt9nhaAD58A8D8AYN1SfoKVh2YaG6aN
X-Proofpoint-GUID: lTt9nhaAD58A8D8AYN1SfoKVh2YaG6aN
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685d0c70 cx=c_pps a=b6iQ4nEtd725l5RCOKWvWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=VZzbbjECq-QA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=q13UE7ff9vCxrEr2xfkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3NCBTYWx0ZWRfX8JkilQlTQaW5 mftQ0IMlAYe2Fqgt/7/muOXmKojIYK3IRVcdl2NVPvUOR/fq/+JvFb51uzWm/DvMoAdQVTZH7b5 HzSlGpGLYwMIEk7avr6mGb1FnO82WXT1QFVF0jGIk2xSYoQhaVSF5e6wXKSL+41PBThKBmZBHXc
 av7MqpoC453LTyPqptOaUDPpvQRxWpSopA/unzoZda4asnpGxKkOvyJGFW1Z9Z+R9z0aeoWINST M5RDe9E1/Wftb7ANvzDT/IvgySZEsE9KP9kBax10TWa7GNMjzKn7oqA5xSnmN+gUsxDCw0pKtbR rSwvVJASF116IveDwzAWbdN/9Vz9GLPDtlRrUWyfoS+EecCQ1RUW/ecEmyE/JKYmfxaUopN7EIU
 MyzbBZMe6Cp9fvQpILWjsEh9KUpnVmSzdqGSHT0/ntGGCvENzMYnmi1mFYnfZVu4o/iqKBdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260074
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Jun 2025 09:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9286

From: Chen Qi <Qi.Chen@windriver.com>

0001-Makefile-update-default-PACKAGE-to-v2.patch is dropped as
it has been merged in new version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...akefile-update-default-PACKAGE-to-v2.patch | 28 -------------------
 .../containerd-opencontainers_git.bb          | 12 ++++----
 2 files changed, 6 insertions(+), 34 deletions(-)
 delete mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-default-PACKAGE-to-v2.patch

diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-default-PACKAGE-to-v2.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-default-PACKAGE-to-v2.patch
deleted file mode 100644
index 74e313b5..00000000
--- a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-update-default-PACKAGE-to-v2.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From eb39888898a9d196e3eb63724c6c07777f3b9402 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 24 Apr 2024 14:10:11 +0800
-Subject: [PATCH] Makefile: update default PACKAGE to v2
-
-Upstream-Status: Submitted [https://github.com/containerd/containerd/pull/10125]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index a5b244191..cb9ff4172 100644
---- a/Makefile
-+++ b/Makefile
-@@ -34,7 +34,7 @@ TEST_IMAGE_LIST ?=
- # Used to populate variables in version package.
- VERSION ?= $(shell git describe --match 'v[0-9]*' --dirty='.m' --always)
- REVISION ?= $(shell git rev-parse HEAD)$(shell if ! git diff --no-ext-diff --quiet --exit-code; then echo .m; fi)
--PACKAGE=github.com/containerd/containerd
-+PACKAGE=github.com/containerd/containerd/v2
- SHIM_CGO_ENABLED ?= 0
- 
- ifneq "$(strip $(shell command -v $(GO) 2>/dev/null))" ""
--- 
-2.25.1
-
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index ed73e398..d041b699 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,19 +5,18 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "b1624c3628954e769dd50783b63823040b2db38c"
-SRC_URI = "git://github.com/containerd/containerd;branch=main;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
+SRCREV = "fb4c30d4ede3531652d86197bf3fc9515e5276d9"
+SRC_URI = "git://github.com/containerd/containerd;branch=release/2.0;protocol=https;destsuffix=git/src/github.com/containerd/containerd/v2 \
            file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
-           file://0001-Makefile-update-default-PACKAGE-to-v2.patch \
           "
 
 # Apache-2.0 for containerd
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v2.0.0-beta.0"
-CVE_VERSION = "v2.0.0-beta.0"
+CONTAINERD_VERSION = "v2.0.5"
+CVE_VERSION = "2.0.5"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
@@ -26,7 +25,7 @@ RPROVIDES:${PN} = "virtual-containerd"
 
 S = "${WORKDIR}/git/src/github.com/containerd/containerd/v2"
 
-PV = "${CONTAINERD_VERSION}+git"
+PV = "${CONTAINERD_VERSION}"
 
 inherit go
 inherit goarch
@@ -58,6 +57,7 @@ do_compile() {
     #        cannot open file : open : no such file or directory
     export GO_BUILD_FLAGS="-trimpath -a -pkgdir dontusecurrentpkgs"
     export GO111MODULE=off
+    export VERSION="${CONTAINERD_VERSION}"
 
     cd ${S}
 
-- 
2.34.1


