Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A648FC7EE36
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18342.1677664368227824882
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TNUSZudU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswP023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=c7iA234e0ODafRIKvafy8NydkUhhUlkE+VAtxlOxVRI=;
 b=TNUSZudU7h1QczE8p0StE4RFoND9RXE4BidWHj5NynEg79x6tPoTcL13cZdynv/6Rao9
 wT4QHaPABLP89WvPox4WG0hCX5rFjvyN5m2nnmVJiGClrXIQHBlkyBN+f07SpRI3UXz8
 kST2fS7N3cYHDEyfJrDHfBOkxGaNssjm/BmeYLWJ1D2x8WOzeUeHmmzbboscbnhgy3ab
 rhAJO7m2OteD42cEQnU7Fy+t075q9JDK37zAmgaZKVsiCS/nMm4ekIiDIMNE9bUZR4ao
 tKdFLYeSeWB3zCC20Pw0WvD5RI9eVhu00O95MWqabiuNdmNAnYRRLKJN/UwgZ+VVPj8j Mw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3hI+WvcBJwDo5hy9s3TztXcToAqk/j4bVNd2mljyEooxyuh3OfdNLDy11+g71MF/1wAJG/82i+yqcLeoWFG58F0MlXk/Kn2ORnUxYECyrhqwffpJaFtzXULgA3+m63F3T9RFX2WELof7jRT5y2x30y7dMcYnIW+tJi3NZ0+yG4VDZBjmE9KDQD7bgLm8SFkBAwWegUkzUMhSN56v56es3aivvEuphPBmvpDsorhgQ91n/eNmx8ZNmo/VF6FdNF57roE5M9RxfUNBT+uzFC0WpQQdvC1PYLqt1sFSTOwGY8bdrKPNnsIikYc6aKQmz4dpaK85PWCEoTerTBSA/YNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7iA234e0ODafRIKvafy8NydkUhhUlkE+VAtxlOxVRI=;
 b=IqCmVKer8ZaWPmPQ8hyBBiT1V/IekTObM/9Lrqrdm2WQPm3X3V8YnLf1g21kbACuM3eyMdd2cMyJm6SlN93lWq3lt6NH6+ewmkAD0hb0mwkaBg3A463vTh7Qeu8Aq1bnjQcdTLRyLqBG3N34c7fNduCJoODVECPpjqhU8wnFRHWSgs+KaVAa7mqDCNbWi8Zga6rh5WGZty27s07vQgugTJq50JL3g6Qh+e+Z28aH7AGDKspuD4PuQp0J6O4g4TGvJSbcliwhBp/D4ZB9OPlkyPlCnmVlDO6H/o8fnBpsdtM1G8JdyPn24GqhEaNRSb1MhTyJd/VaahYEezktiyQ6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:44 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 06/10] containers: add container-host-config recipe
Date: Wed,  1 Mar 2023 01:52:24 -0800
Message-Id: <20230301095228.122562-6-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230301095228.122562-1-Qi.Chen@windriver.com>
References: <20230301095228.122562-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 61dada77-843e-4da5-061b-08db1a3ab426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ewLGO98lUmLAKy9k1c181kjfg/Q4/8Uxop17gyzw2cexAd9zKXB8ZIlne89e944bjefjqRpVe4o/LM6SPdtikv8pCzIYHCDFhmVGCuVZMkleHkAArT7uVuQZjLM0uPIdZIASZwPn33iA6/3hI4Ti9iuIvfEV4J+u6hKNCcwoQBVkf6I1LUiDFVhZDr4kbMp9Elk9X2Uet+78mCWcocZL/rrMEXpGOeuqqqM3rQFtQQ9wQqrnuvqo1SseP5q5okhsWRNlD8yI/8+rQAtrnA/8h8azLVOyRc142zhNfSTsHbg1MSzORgDvAYIFfAxxB8+UbaicFbSXOeZgWSiotmzQptMsW3m/51EYbwDq4v7ChFUKwWOYmo2tZk2+d89QOyqCwRtlYJoNTndHcelYb1cRdyXZ1hNxBHbEjtEtGGQKG/VTW3OAGXrRIYSGIrS5o5kHdskUf885i5vwPAkDKdea3j9RSjM2vuP9UhA+pHKE1RpN/qdd238t+JS7pxCDrLgYHOOvc2PMrhrkSYzWSfauVj1ZzgfS0/g8o0ZMDCEE7yO1ON+ICw67CZgUY5zTvH7r7NlbyJKccBX9N9g58+IhtCzG4vwh+/mexDOsW9Thvgrn7SzvBe3HrlTtYmlpDAGCkKQGvXRKm+Dd85a8sfwuEdYAr2+n8egQgyZXfAX6Y/bDl9345KblhovqKyD2M4Nx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(30864003)(186003)(83380400001)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lovX4zq9Pt3/gWBHOBbGhpy+a+Rx+8noGQJYLfY1t2FQi9IE+5LWtO9PTdta?=
 =?us-ascii?Q?g4cTkX9MXbehJPohpgWzSFaQQjG9tpbohdhEIMbV0d6w9hccYd5aI5HaVJW2?=
 =?us-ascii?Q?+1GAyoEXSgnGIzOgGpTQ6dXYBgBPmxaRI+B/RZN/KzMBgnZxanTsO0uxo7po?=
 =?us-ascii?Q?9LsxJ7+9iSKQGqrmtNOwe6qHHxqPd2pLyhf8YlU6OYxAUnTzfpFkcQHqMN0r?=
 =?us-ascii?Q?ZUJ/o+2O0HFweZWsHQSD1AoN/UEQviAhtnFig2FpwroKqCboUkeNMzcux2sb?=
 =?us-ascii?Q?/wh/+yWFRWQb2pLDox9AgC/G5mjvg/tx8JngVK1G1jeTG1hI2TM1HvlkT8j6?=
 =?us-ascii?Q?+BvwrpxmSRN8/Rkn5sDzgGAU+M5x+XD2PR0ZLXgoLRD31XqVNur005ZSQlby?=
 =?us-ascii?Q?6ekiqtyzUbRWNfolH+FsLWIina1yOVrNIRMJAhcCCxAHbEQy0uhF9xBYyZXE?=
 =?us-ascii?Q?ktp2dLSC/tSgj/pAsjsxDXHSHqwhAHc1B85SaBxIZW5HHEceWxhi6TkiGkI/?=
 =?us-ascii?Q?lmqxR+7IOmBq8Btncw2/2928xBSaN75+fBAPkxgoMbtMNsU+URznTafMmm7D?=
 =?us-ascii?Q?BYyAceUT+tEAO+1ylSaoATG0RTL41F3d2yAgZ1iCm/zPUIblVD8Du8hSLb2C?=
 =?us-ascii?Q?GYSjf2kWTZauVQ2X/vp9Nd9XGEjPrIvtArACd2nTppTQALvMet8jOwaj7FuD?=
 =?us-ascii?Q?Yuth5LaWvbOyQVkJXjBgsTUU9iPx2ZjzLbMsKT3A8wYtxo9QzMOS4V1u7cT+?=
 =?us-ascii?Q?1KCTDb40AoXEyQ0okdHPrH0+xmOJRjedgibHZmiEvYFHGGNzMQnrvanC1DPY?=
 =?us-ascii?Q?8Zx1BtkqmQdB23ij0wQm0OCf6N9rUXiSU4wVptZG/2pYXJ6078sdWiPBR2Uu?=
 =?us-ascii?Q?UsQBb61oneFdRLxiwyGP8Oo42YLhKFeIbKnJOCn29NUitlsO4rb5/p8eHNZG?=
 =?us-ascii?Q?HLtoPT3efTIH/kQkRk8yAPviV/pWF1bjphbDH5Dq8LJJ5ImGz3KpZKZefXLk?=
 =?us-ascii?Q?J6Ih16VCtwhjMfInlhyb6oazo1ZoxoJ4tACgCAHpA5xjtogTD1E5044WMxxq?=
 =?us-ascii?Q?csJlubTUUznQMkHsRnbm/mc2zV7dfvQ3p1DDKQn6zzlCXGpYsAnrH9E6ev7s?=
 =?us-ascii?Q?Mx2Nr2ntn4JSE/7HjMPnHL5qxwqkOYFWPvR1Yz+rRMyIsJ424NLTnHqlstNp?=
 =?us-ascii?Q?auJ58rLicjOG2nnxOgch6nd4N7Le7gZMN9iN5WjXE47fL28ZMnUJuQDMAwgD?=
 =?us-ascii?Q?K7iS8NWJcSdmjiLS+UROgsGUIvwAiFn/qfvHc6tAeIVlh71HJa9B8Wo8Lm6Q?=
 =?us-ascii?Q?kV092RWZiggSHLir9a+rtP3tgz9BuYubeKb3lhphKeVRW7Ysi/JPPZhJoRaL?=
 =?us-ascii?Q?UkqpjxkSWkqZp40YHPCoQ+tioPcHQ9u690bxhjOClPOFwKbATtCpN4B58A+R?=
 =?us-ascii?Q?X1KAyZJFMV3hEMxA3DI0X48lkfaMOP7qHHUzL92FAgDzbMvMiDBhwQCSux/6?=
 =?us-ascii?Q?N43JWJ/2P5EY5Qx4om1Nj9emAFZ1hUBfm4JR3eWPG93e5WgqGhd2cyMJSwsC?=
 =?us-ascii?Q?gZ8jD/PsfbyMBmpavGAqUAeZNuJMmMyGKWxyw1k7AtGuO4WoVz765fic6o0Z?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61dada77-843e-4da5-061b-08db1a3ab426
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:43.7124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7m6/RAFZyojudOA03AwynIyi8VbbqdG4AecFvzK1mRcGSKuVZGjKnubeGX3jag4BJdHLCQlYMyZcT/UeF+sDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: pp4ASVGhgY_zyi7wsWRcccsQaT-TfLW3
X-Proofpoint-GUID: pp4ASVGhgY_zyi7wsWRcccsQaT-TfLW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7916

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This is a configuration only recipe that produces a package which
installs some common configuration files.

In this introduction we have both registries.conf and storage.conf.

Packages that require these files should RDEPEND on this package
(or inherit container-host.bbclass) and the files will be installed.

If conflicting requirements for these global configuration files
arise, they can be resolved through additions to this recipe, or by
providing a higher priority version of the .conf files.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../container-host-config.bb                  |  18 ++
 .../container-host-config/registries.conf     |  25 +++
 .../container-host-config/storage.conf        | 195 ++++++++++++++++++
 3 files changed, 238 insertions(+)
 create mode 100644 recipes-containers/container-host-config/container-host-config.bb
 create mode 100644 recipes-containers/container-host-config/container-host-config/registries.conf
 create mode 100644 recipes-containers/container-host-config/container-host-config/storage.conf

diff --git a/recipes-containers/container-host-config/container-host-config.bb b/recipes-containers/container-host-config/container-host-config.bb
new file mode 100644
index 0000000..c762dea
--- /dev/null
+++ b/recipes-containers/container-host-config/container-host-config.bb
@@ -0,0 +1,18 @@
+HOMEPAGE = "https://git.yoctoproject.org/meta-virtualization"
+SUMMARY =  "Configuration Package for container hosts"
+DESCRIPTION = "Common / centralized configuration files for container hosts"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = " \
+    file://storage.conf \
+    file://registries.conf \
+"
+
+do_install() {
+	install -d ${D}/${sysconfdir}/containers
+
+	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
+	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
+}
diff --git a/recipes-containers/container-host-config/container-host-config/registries.conf b/recipes-containers/container-host-config/container-host-config/registries.conf
new file mode 100644
index 0000000..ba6c3f6
--- /dev/null
+++ b/recipes-containers/container-host-config/container-host-config/registries.conf
@@ -0,0 +1,25 @@
+# This is a system-wide configuration file used to
+# keep track of registries for various container backends.
+# It adheres to TOML format and does not support recursive
+# lists of registries.
+
+# The default location for this configuration file is /etc/containers/registries.conf.
+
+# The only valid categories are: 'registries.search', 'registries.insecure', 
+# and 'registries.block'.
+
+[registries.search]
+registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com', 'registry.centos.org']
+
+# If you need to access insecure registries, add the registry's fully-qualified name.
+# An insecure registry is one that does not have a valid SSL certificate or only does HTTP.
+[registries.insecure]
+registries = []
+
+
+# If you need to block pull access from a registry, uncomment the section below
+# and add the registries fully-qualified name.
+#
+# Docker only
+[registries.block]
+registries = []
diff --git a/recipes-containers/container-host-config/container-host-config/storage.conf b/recipes-containers/container-host-config/container-host-config/storage.conf
new file mode 100644
index 0000000..722750c
--- /dev/null
+++ b/recipes-containers/container-host-config/container-host-config/storage.conf
@@ -0,0 +1,195 @@
+# This file is is the configuration file for all tools
+# that use the containers/storage library.
+# See man 5 containers-storage.conf for more information
+# The "container storage" table contains all of the server options.
+[storage]
+
+# Default Storage Driver, Must be set for proper operation.
+driver = "overlay"
+
+# Temporary storage location
+runroot = "/run/containers/storage"
+
+# Primary Read/Write location of container storage
+graphroot = "/var/lib/containers/storage"
+
+# Storage path for rootless users
+#
+# rootless_storage_path = "$HOME/.local/share/containers/storage"
+
+[storage.options]
+# Storage options to be passed to underlying storage drivers
+
+# AdditionalImageStores is used to pass paths to additional Read/Only image stores
+# Must be comma separated list.
+additionalimagestores = [
+]
+
+# Remap-UIDs/GIDs is the mapping from UIDs/GIDs as they should appear inside of
+# a container, to the UIDs/GIDs as they should appear outside of the container,
+# and the length of the range of UIDs/GIDs.  Additional mapped sets can be
+# listed and will be heeded by libraries, but there are limits to the number of
+# mappings which the kernel will allow when you later attempt to run a
+# container.
+#
+# remap-uids = 0:1668442479:65536
+# remap-gids = 0:1668442479:65536
+
+# Remap-User/Group is a user name which can be used to look up one or more UID/GID
+# ranges in the /etc/subuid or /etc/subgid file.  Mappings are set up starting
+# with an in-container ID of 0 and then a host-level ID taken from the lowest
+# range that matches the specified name, and using the length of that range.
+# Additional ranges are then assigned, using the ranges which specify the
+# lowest host-level IDs first, to the lowest not-yet-mapped in-container ID,
+# until all of the entries have been used for maps.
+#
+# remap-user = "containers"
+# remap-group = "containers"
+
+# Root-auto-userns-user is a user name which can be used to look up one or more UID/GID
+# ranges in the /etc/subuid and /etc/subgid file.  These ranges will be partitioned
+# to containers configured to create automatically a user namespace.  Containers
+# configured to automatically create a user namespace can still overlap with containers
+# having an explicit mapping set.
+# This setting is ignored when running as rootless.
+# root-auto-userns-user = "storage"
+#
+# Auto-userns-min-size is the minimum size for a user namespace created automatically.
+# auto-userns-min-size=1024
+#
+# Auto-userns-max-size is the minimum size for a user namespace created automatically.
+# auto-userns-max-size=65536
+
+[storage.options.overlay]
+# ignore_chown_errors can be set to allow a non privileged user running with
+# a single UID within a user namespace to run containers. The user can pull
+# and use any image even those with multiple uids.  Note multiple UIDs will be
+# squashed down to the default uid in the container.  These images will have no
+# separation between the users in the container. Only supported for the overlay
+# and vfs drivers.
+#ignore_chown_errors = "false"
+
+# Inodes is used to set a maximum inodes of the container image.
+# inodes = ""
+
+# Path to an helper program to use for mounting the file system instead of mounting it
+# directly.
+#mount_program = "/usr/bin/fuse-overlayfs"
+
+# mountopt specifies comma separated list of extra mount options
+mountopt = "nodev"
+
+# Set to skip a PRIVATE bind mount on the storage home directory.
+# skip_mount_home = "false"
+
+# Size is used to set a maximum size of the container image.
+# size = ""
+
+# ForceMask specifies the permissions mask that is used for new files and
+# directories.
+#
+# The values "shared" and "private" are accepted.
+# Octal permission masks are also accepted.
+#
+#  "": No value specified.
+#     All files/directories, get set with the permissions identified within the
+#     image.
+#  "private": it is equivalent to 0700.
+#     All files/directories get set with 0700 permissions.  The owner has rwx
+#     access to the files. No other users on the system can access the files.
+#     This setting could be used with networked based homedirs.
+#  "shared": it is equivalent to 0755.
+#     The owner has rwx access to the files and everyone else can read, access
+#     and execute them. This setting is useful for sharing containers storage
+#     with other users.  For instance have a storage owned by root but shared
+#     to rootless users as an additional store.
+#     NOTE:  All files within the image are made readable and executable by any
+#     user on the system. Even /etc/shadow within your image is now readable by
+#     any user.
+#
+#   OCTAL: Users can experiment with other OCTAL Permissions.
+#
+#  Note: The force_mask Flag is an experimental feature, it could change in the
+#  future.  When "force_mask" is set the original permission mask is stored in
+#  the "user.containers.override_stat" xattr and the "mount_program" option must
+#  be specified. Mount programs like "/usr/bin/fuse-overlayfs" present the
+#  extended attribute permissions to processes within containers rather then the
+#  "force_mask"  permissions.
+#
+# force_mask = ""
+
+[storage.options.thinpool]
+# Storage Options for thinpool
+
+# autoextend_percent determines the amount by which pool needs to be
+# grown. This is specified in terms of % of pool size. So a value of 20 means
+# that when threshold is hit, pool will be grown by 20% of existing
+# pool size.
+# autoextend_percent = "20"
+
+# autoextend_threshold determines the pool extension threshold in terms
+# of percentage of pool size. For example, if threshold is 60, that means when
+# pool is 60% full, threshold has been hit.
+# autoextend_threshold = "80"
+
+# basesize specifies the size to use when creating the base device, which
+# limits the size of images and containers.
+# basesize = "10G"
+
+# blocksize specifies a custom blocksize to use for the thin pool.
+# blocksize="64k"
+
+# directlvm_device specifies a custom block storage device to use for the
+# thin pool. Required if you setup devicemapper.
+# directlvm_device = ""
+
+# directlvm_device_force wipes device even if device already has a filesystem.
+# directlvm_device_force = "True"
+
+# fs specifies the filesystem type to use for the base device.
+# fs="xfs"
+
+# log_level sets the log level of devicemapper.
+# 0: LogLevelSuppress 0 (Default)
+# 2: LogLevelFatal
+# 3: LogLevelErr
+# 4: LogLevelWarn
+# 5: LogLevelNotice
+# 6: LogLevelInfo
+# 7: LogLevelDebug
+# log_level = "7"
+
+# min_free_space specifies the min free space percent in a thin pool require for
+# new device creation to succeed. Valid values are from 0% - 99%.
+# Value 0% disables
+# min_free_space = "10%"
+
+# mkfsarg specifies extra mkfs arguments to be used when creating the base
+# device.
+# mkfsarg = ""
+
+# metadata_size is used to set the `pvcreate --metadatasize` options when
+# creating thin devices. Default is 128k
+# metadata_size = ""
+
+# Size is used to set a maximum size of the container image.
+# size = ""
+
+# use_deferred_removal marks devicemapper block device for deferred removal.
+# If the thinpool is in use when the driver attempts to remove it, the driver
+# tells the kernel to remove it as soon as possible. Note this does not free
+# up the disk space, use deferred deletion to fully remove the thinpool.
+# use_deferred_removal = "True"
+
+# use_deferred_deletion marks thinpool device for deferred deletion.
+# If the device is busy when the driver attempts to delete it, the driver
+# will attempt to delete device every 30 seconds until successful.
+# If the program using the driver exits, the driver will continue attempting
+# to cleanup the next time the driver is used. Deferred deletion permanently
+# deletes the device and all data stored in device will be lost.
+# use_deferred_deletion = "True"
+
+# xfs_nospace_max_retries specifies the maximum number of retries XFS should
+# attempt to complete IO when ENOSPC (no space) error is returned by
+# underlying storage device.
+# xfs_nospace_max_retries = "0"
-- 
2.37.1


