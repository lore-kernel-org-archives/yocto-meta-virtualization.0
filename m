Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A63EC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 05:12:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6263.1709010753355793907
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 21:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hnjO8DnD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27871b5145=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R4t2t9005128
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 21:12:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=6bONDEh08KqwdBkp1U4AfWu1uI4kEUJ2PrxYePzzax0=; b=
	hnjO8DnDa4v/oU8LT43dUQkIfUB1+TyeDmOjQYv1Ppa3HAW3VasbR7Y7lH8AyjGg
	8u11tMc0a2gvkT9yafoXe8uXqVCO3YAHfTWQh0o7VhSKzaBauf5HEi/xCyg7lFip
	STMwYksv/Uh1cEsanUWR9N4jpD0NRJKaz9u06J/Ylep+XbRJYRsnxRlLZBCS59Ie
	EAzig5Xx1cbbhIZPaeB8QfE8In9AQQ2RFRK6TeixtuaMWQE95/2azjKCjCKyC321
	UvAA8RCL4zxRxes/AgrcIplCCVjQU6Z+QWoWvllJoUxx2oEmJtsgGKfzOEV++YAA
	3LroYjGtcbr5fiktCHQo9Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm42heg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Feb 2024 21:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JB7dPhWdi91SFmi7QagBr/p8vJQNXRq7/3zSpbyz5/jNVe/0WaEOi8Fu7IcVo0WVqWKh7Rev9Z3AfyWr0CV3DA4ZlMO4kzC3wg87r/S/x4FNZzah8VpCS4FlPPCYRL9F3bOY1PE/tSMsTp+U7h3ip7kYIOat6KB0IY+ga5MYfxzfEfnpbpBdHtIts42xtTeUbosJEFvEOHoI5XS0nT3OFGYERUFMjv0neibqoS06pkzIzc9UlNhjLdPK10RNoihzJQERfzKRfIY+JcfF9dmtVs5UJSq81og/TdsNd0+yxlHd2IxYYauWA9Rj+56uibyTSpsi0Xj49WhQydYpeJ8R2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bONDEh08KqwdBkp1U4AfWu1uI4kEUJ2PrxYePzzax0=;
 b=nYsZVAFDg0VZoLPKmQ94D6saP+4ptyflOATSd+Gva8LAVu9PvD/Zy6HRL3iOP/jQwuWTLxAcZ7xtRKFxsPuRmOSXGQ4wjn49Vz1nzPpsUG9quPGRSjSQktpya9r+JrrNYkLAzRwNP1O82S/A/tWJi/SXk+3uuCRPGOKbS8Zsch0+PuQ1yRM+2mT5334NEZiJ5bbgSaQq1RXn93JviC/HSe26vAwnrMLkkUhBs8KSkbVgSITX5T+x61jtt+HC/jPjawjQz0GRns27Mtlr/WgV9Tba16qClq+lsa0RKEt5bPobfvc1ol1ByoJAnnRHGcqn7TovOcOEh65huuTo8qgp2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Tue, 27 Feb
 2024 05:12:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 05:12:25 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 4/4] meta-virt: rename containerd-opencontainers to containerd
Date: Mon, 26 Feb 2024 21:12:11 -0800
Message-ID: <20240227051211.3390256-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240227051211.3390256-1-Qi.Chen@windriver.com>
References: <20240227051211.3390256-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b21bab-0ec3-4908-5222-08dc3752af3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	euKqnRFmEPx3I9hTfIg7uscDpeJfsNMdhGa5cKd+ypNz68vEPJEY4JmQmJvqcVeQzWypVf/vvIXgr04fwwf48Nau51/6sp0XR256MgD3cqAZNYpYhllbMR3V2FTTNlKZWDNeHr1MshV8q9DQYpEy0M+nUzHC1mk728wfrHUmxiyDDQhgA9iknEDKUd1E2vEW8eEuvGTX3AR+GjbPIwfmpi6DQdJd4E6BfNVhISs75wcZFsJ6FraD5Ep0hMNgi7ytEt97gofqQI6VFXMlJNaSb0wakejrLQ0j+QHeW11Cw1D2bBlrz8Wtq/1SRLuPQLCC/EYw8fuiNRPmOiqQNDKvw8wh46i/8JEbsAU+Oclr2+uYUl4EXMlubX9VMhuNM/0IEJi1wL5LnHjO7QoeQm8kESaslK1dMP9pVey3XihsoEVVNe0sTWOW9wHu/UQ2k2WYZ5+hQkUawm7h0psu2eoroSyuxk5HGXx+JxKbPx98hkI6zQ/18rndS5yE0RDZ2QLtmWKGkv6N07++Ob4C0VhVYAXmclo2jAceyB6Tw/ysb7p197cu/aMF3BTl7lCd2wQ8UdoYGOqKJSpr/LEYpMdI9Bsm2zPm62mv6A/AAg7CrmGAWfwNe5IR5gk9IfLZvCMjWTBIRQnmPURyN4+x37Ygvmz23QQeq02ZOojZTkxFTldHmrkSeCpE1XUYw70yIseJ+Bm2U9xHXcWdH57eY1diMgY1N28MdR3diOFT8Lo/V+k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zwE70IS4xFs5hSRAkQvTK3rJJaqadWNXbpdB9OfYNCrH0X8EO+6BwEJxvWKW?=
 =?us-ascii?Q?JPmPLZRAft/O5rVUBjRq5z7pVCIvHJZQs/TADOpOhAqizO/sw0IilII3IAA8?=
 =?us-ascii?Q?GZ/RcMsufI/m4cWadCY3SVBGxRLkS9MSRYvbnoenoz8XYvHQhX+LLdRLve6q?=
 =?us-ascii?Q?NlY8hReptp9dQFl6x5pgs3SfQGSpf7efoShvbeqgw0OkFAWiCa5nDvWuMAeb?=
 =?us-ascii?Q?ziIGz5BnVOpPOMhn+AhBDUvNUdrL8Gon7IHZSRUtP/94+JoDusPAw7Tesabs?=
 =?us-ascii?Q?misie9C1xE6C8+dvviR08Ps1O01n8lluy+Ub6gkGmp+BHETqqqqhgmYrdsxh?=
 =?us-ascii?Q?KcBw6ojuIwxQt6jkCLJjTU40iLUb8LHqMuBhOjfHA872SyPt02dDPsq7iOcE?=
 =?us-ascii?Q?R5ZTtStKGpN1ygwnAgsENT5ha75OoUBLzZrJEkBbegkqKYQpma/2CGwkb5VI?=
 =?us-ascii?Q?RPj52/sMidjitpE2V4A3lagEBX39L3UcicR8Wdizq4u+72nnog7IyAD+BCXX?=
 =?us-ascii?Q?VDTjrqKeHyFUVQNFaNLo+n01pMwRPI2A6cAkEkRlGg5qRSl6c2oNKoO8m5KO?=
 =?us-ascii?Q?QMX6ZkASdccI5CuJrNPtwVHwdHNjTxl2bRNXiogg9zGP3at5daxT94FqmcdT?=
 =?us-ascii?Q?Hlb22V2q01oYnVtcjmu5VmyBgBb2XiMxyJv5w5MgGLKR2acjj8TpFN4ptHu4?=
 =?us-ascii?Q?XjJzu8HwkBHrktrYrOu3sNyKX8Rso9P7hVcMTgUofAX2mD3t/QrPwPtLiux9?=
 =?us-ascii?Q?GFMKd7sLNfBcNHFiNy/XA3aod6Qzl2ZVbk5TNBcl3oHauKjSeTisopiL2AHn?=
 =?us-ascii?Q?xjQCEDbmx13VGVuldQpQ7QxIrGAWKLG+5GG77kk+yvdFlo/AMRqNRXsLx2cy?=
 =?us-ascii?Q?6Qr6Ww7P++RyPDsnfOYzv2M/bsqMl/sdy+Hib5RA2rbAw2XdgpbAHP6MRVq3?=
 =?us-ascii?Q?CYZVng83uBcbQudzcKooOf6JSlUc8+C5ZtAHsTxw9hQf/D0ZnvjylY4MYQKA?=
 =?us-ascii?Q?44RyeRJKN47mTYVEGqS4j7fSEkYEJbovM3nGsi+R6DtaCkAebqQRrjUpSPyG?=
 =?us-ascii?Q?kJtKwstfGXWbDto4TdV/5GMxd1EKlXR368KfYoTztWsPAWFMB40rt38rK44r?=
 =?us-ascii?Q?0xTEVvRf/n66qSuNBcgygJEsP/jPN66v4C9D4ZRmsqKZvmYfbmmCjHlkkvwB?=
 =?us-ascii?Q?9/UKYj239qNiddGr3n2lVeymkGur/2MgStg83tHL/SqwjYTj+ewLsPwL2LJC?=
 =?us-ascii?Q?k6YFuQK3t3cGRt1/vH6pww+4M3GGLYNXlgvcL0XFmrZ9inamsn2aOoSt7zRF?=
 =?us-ascii?Q?KXQ/+z5A8MRZJ8xSYTsCtyaQBG0/8Dyo0Oo0zGVuE+Cc6T2xMnjTYEWGtFlD?=
 =?us-ascii?Q?Ms8xIeSd60bdmlqhpXYAV1wlvTRu+QHybVD3zxeUy4mYiMMYfWi4s43Qf0yc?=
 =?us-ascii?Q?Vf8kLtIjFWB2Zpw3CiTRCoN8rEvwrJo2Y4QjLuie3BPGet0Udr6ZqGQBFhuj?=
 =?us-ascii?Q?BjqhZATBjyFKyxX9vRcIelMkavPZyinS+JmRm+djQXtJcZA9kWciDq+nIMhj?=
 =?us-ascii?Q?a+RgVyaj45LfPCjm2jfEdBYeClxu7jKPpMWJMQjgD0Gp6Umsee17eaIAPJYE?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b21bab-0ec3-4908-5222-08dc3752af3c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 05:12:24.8564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMMaIy+unQzoRCzNmwqRedHK470c/4ZDSea+kCE3n3u59FlEGIsNDNtY0lLQfGhuWwoLyS/z9dmQkg0er1BIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
X-Proofpoint-ORIG-GUID: qu7FnT1g53oRX3yzx9TkhsDiaL0BGzpw
X-Proofpoint-GUID: qu7FnT1g53oRX3yzx9TkhsDiaL0BGzpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270039
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 27 Feb 2024 05:12:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8585

From: Chen Qi <Qi.Chen@windriver.com>

We had two containerd recipes, containerd-opencontainers and
containerd-docker. But now we have only one containerd recipe.
We should just use the name 'containerd'.

The previous CVE_PRODUCT setting in containerd-opencontainers
is deleted, as it's no longer needed.

The 'containerd-opencontainers' is added in PROVIDES and RPROVIDES
for backward compatibility.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 conf/layer.conf                                             | 2 +-
 ...kefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch | 0
 .../0001-build-don-t-use-gcflags-to-define-trimpath.patch   | 0
 .../{containerd-opencontainers_git.bb => containerd_git.bb} | 6 ++----
 4 files changed, 3 insertions(+), 5 deletions(-)
 rename recipes-containers/containerd/{containerd-opencontainers => containerd}/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch (100%)
 rename recipes-containers/containerd/{containerd-opencontainers => containerd}/0001-build-don-t-use-gcflags-to-define-trimpath.patch (100%)
 rename recipes-containers/containerd/{containerd-opencontainers_git.bb => containerd_git.bb} (96%)

diff --git a/conf/layer.conf b/conf/layer.conf
index c44d585c..fa9468f3 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -40,7 +40,7 @@ LAYERRECOMMENDS_virtualization-layer = " \
 require conf/distro/include/virt_security_flags.inc
 
 PREFERRED_PROVIDER_virtual/runc ?= "runc-opencontainers"
-PREFERRED_PROVIDER_virtual/containerd ?= "containerd-opencontainers"
+PREFERRED_PROVIDER_virtual/containerd ?= "containerd"
 PREFERRED_PROVIDER_virtual/docker ?= "docker-moby"
 
 # Sanity check for meta-virtualization layer.
diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch b/recipes-containers/containerd/containerd/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
similarity index 100%
rename from recipes-containers/containerd/containerd-opencontainers/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
rename to recipes-containers/containerd/containerd/0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch
diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch b/recipes-containers/containerd/containerd/0001-build-don-t-use-gcflags-to-define-trimpath.patch
similarity index 100%
rename from recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch
rename to recipes-containers/containerd/containerd/0001-build-don-t-use-gcflags-to-define-trimpath.patch
diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd_git.bb
similarity index 96%
rename from recipes-containers/containerd/containerd-opencontainers_git.bb
rename to recipes-containers/containerd/containerd_git.bb
index 1dadf287..ac874397 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -20,8 +20,8 @@ CVE_VERSION = "v2.0.0-beta.0"
 
 # EXTRA_OEMAKE += "GODEBUG=1"
 
-PROVIDES += "virtual/containerd"
-RPROVIDES:${PN} = "virtual-containerd"
+PROVIDES += "virtual/containerd containerd-opencontainers"
+RPROVIDES:${PN} = "virtual-containerd containerd-opencontainers"
 
 S = "${WORKDIR}/git/src/github.com/containerd/containerd"
 
@@ -96,5 +96,3 @@ INSANE_SKIP:${PN} += "ldflags already-stripped"
 COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
 
 RDEPENDS:${PN} += " ${VIRTUAL-RUNTIME_container_runtime}"
-
-CVE_PRODUCT = "containerd"
-- 
2.42.0


