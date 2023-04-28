Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A21C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 01:45:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9857.1682646353723318959
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 18:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UaCbo7Zt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3482c0b599=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33S1d2Di005692
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 01:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=XMvO9TGYIHb+pnqKPr7DD6iyULywiCye2L2AJT0g3PA=;
 b=UaCbo7ZtJAoJ03tgw1Vz5lozfRQgp+bQuy9viNpRrIYeQBcK1rWJeAdK6m5pI3lbO44Q
 TcRKK3uLjVSQLkLkPv+uK7Ug5CvoZAqZitxO7FYq4wqoCPPL4dish61nbfkwUmTt7PFW
 4y8Zo9RS7jYTP3YAMYeqD6HXWXB8ILUTdaeZaYcl7rJohQxwHJnGFnm5YyTliaw+EHSS
 JmDePgt/jT93aose9fsWJfrL6O3ciujXctn6k3ovI4IPRhNCfF6kLb6UskupdJRYZIaE
 qrBHnEVjvLjlyZ/b7Zvq9k2N6ruqGbQclrTnsPTPzHlg+B7dBeyFppJCB0zYTnf2pH1F QQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q44t3xbc3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 01:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NALUQPNyejZgi/d++r1qTM2LGe/wFmR4zWIa5gPTvh7K5spT3n2GCB527evUWVRkgxvyLHVcuWGFJ/DnKayX25ApMRl0WiHiLVGTLswDRUxp4iozKza1XceZgLHkkWA/WmoFgW/waHlA/lY/gyV14zIF1+Mnrc9n2jPiOgrU1tPvHegXpzHDN+OaDebMVUJOjehxuO8XnCmqbkMm8sKTx4O+8ZOw9ybHURNK9UFeznKhmbV4bFrJQ1dIBbnYobvX/1+QWROSDpX0WlCv4x6A6n2OBckl7j+cU31wxwH/Xg81dgpGMV2B2pmumW76lUwvzW2PVvLWccPpSAnxVXMhXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMvO9TGYIHb+pnqKPr7DD6iyULywiCye2L2AJT0g3PA=;
 b=ixND+VMl4SjXHKiN7OkFM7zEDGdXyh5TeD1m1dPowpcfPk1Z1vyLOw6eCHp0NB4bnBRHsaLMc95jlsTITDVUiw4wZ0SEKzTeFHdMtHdwnuproEonzxks0XJVrbjMtN+t3KgeoPBtx/iwFbcbr5/PQ3OuL2DpfNVz1RUuTTMbButlZggi3D7F98Bn9yR62efs2/w36MfyP2iYse6Solu3QUw4A7tWdgeXJwKRVYBjaQGHscaovb86Yvo0ztg4oo0g6jQNNKMlPetFQM2gp1/CplmDLFiFw99i8503ZxhxW7Zj+o5ebLWpHMbR0BoniyhcZ1FJKmH4kX7DdXProMpmCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB8355.namprd11.prod.outlook.com (2603:10b6:208:480::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 01:45:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 01:45:48 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/2] docker-moby/docker-ce: merge into one
Date: Thu, 27 Apr 2023 18:45:33 -0700
Message-Id: <20230428014534.2376049-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:a03:60::46) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ca1c0b8-d8a1-44db-027f-08db478a4a1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2shBRvob15zIh9wLRszW5intIXwm0XQT6zojpmv1+wFbnIhGxdYc7pxJ63Q4/6tQFztJIYtQ1gPapj9ofU9iso8/lwz7upNbZ25iMqFlgUYNH+Xn0P0y9lGLQDwMTJnYJaa4FL24yUI6+nfR8+mHtPIDnfHLSqUwDE4Pny6SjAMFNoJCzRtLbmCR11uLLtmsyyrJp3vthmNoGV9eRHBwAi/Ix7orXtfdRrBjHtCycK3s4kwS1G3DGMrv3GLHNxYnjn7p6sOgnU2HRID5y4XAa2u+7h3UqYjdQxEZzn4cHx7mfgU8kg8hX+LgUTYsn6jkV3Tj49SaMHpD2CBvelt1xHfR/s0Lepp74r8ST3oTRsgf0/4+JiyNxFNRrjZKEe/iODH0meRmIcRyd/0YyRfQKNr1lX+sXh6bQ1N1LktztscZZM77+QclaMRJiTPEEND+CjX9Z3db5lPJHberUU5YNcsODqnkI+s3mFmaQAknLTKAQQQzp5/r+P3t5tQmj/x+17iDjJGcQhmc/eGQireuhhP/+AVT9uJAkoHiiQIf7weu3Hc2WrovmX3lqK1CpQgvWfEJQdrH6nxQrL5bndanhfJRBULR+rG/4f+HAcZyDSkToKkyowdrttsnt6w/P+ZetsuV7gF6e1mmoZBCFbuQKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(451199021)(26005)(1076003)(6506007)(6512007)(86362001)(186003)(478600001)(5660300002)(966005)(8936002)(8676002)(6666004)(52116002)(6486002)(36756003)(2906002)(41300700001)(66946007)(9686003)(316002)(38350700002)(38100700002)(66476007)(66556008)(6916009)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kDhSDR7+hvXsiyJFETDhZR0/xyqHDUPVJNaQoA8IFjthFg5VUTpFaOrr6yNG?=
 =?us-ascii?Q?yq+tzmzkI6p7CCTxo53R2Hxpb4R0aQ+YP11hjIfWEXqttshCDrfENi1Tv6M1?=
 =?us-ascii?Q?f3uTveLNF1y+KSmSCaL6Xv3SuGDDMByUawi1+XI6WHmTgzmTlk/0BZQn0ctp?=
 =?us-ascii?Q?9m5445Yd5DKhTLBrb0Vuws10WGRJHBrWuyW9Zbik4OKhsKLTmPUxZuvLw+kM?=
 =?us-ascii?Q?j+qW8hbRa4pKw5ilbrc8xTqoVzJMIO3QwaQyNwVTbN0lcJxYe5K4wrvlGFoO?=
 =?us-ascii?Q?/OSH79yv02IRYYyiinGhwEe/Hd2Sx4BLkv2YQYyhapzZmDpCKocu75R9LMtR?=
 =?us-ascii?Q?hiENhoXf6V3+BL/6i8Ouno8KPD1/qTCwuf3OXh31Jno4/AkqOBYSgtYDvJRq?=
 =?us-ascii?Q?XAJpbFsr3Q/n68ADuhLdD6aolVY7Cqv85MdXZK6VXOcauo3vFMaZ/UMphLOp?=
 =?us-ascii?Q?p4znE/Zwc+XIp+tg6NsxgPcaBLphuAa3v1C7LaLbCcLcWx4oIoDmAfExBIGp?=
 =?us-ascii?Q?DV8/vKC5s7Z5+yJoCS+hWhfAhwB16LrPT22/u2pU8Ip6tnUCbALcy/mjx/Mq?=
 =?us-ascii?Q?D+bO3B8l7I49zBhbKcSryJhp+zL2YCFznPQ5mfo1FGKTjXBkkiLsgAix6RQu?=
 =?us-ascii?Q?evgBI3yhQUG/T1joYw435X9AOyNhNMf7EeeznRHX/7JCylTgFMkhW/nVWiy7?=
 =?us-ascii?Q?4xLoEER5Tuu+wHteTKjQhqMzMRcrbBCFlBp+DSJDhZJt4z0hg9wYnuuX0vxa?=
 =?us-ascii?Q?SgmU8Q6uMO2wxmOVQFGmYnvcDDyIdoCTqwIyKNXS4oOxyi1xabQn9sfOprNT?=
 =?us-ascii?Q?HuxdWzMvKi7Sd5+X3TjBxpT7LI0OpJdMeWRcerb4JH7yfAdBhWVzj7sc8w5N?=
 =?us-ascii?Q?kpJA7LcP0Z914/hN0zCMc/KEweord00/chgoKJGZxkHyT5SnrEcJA4fG6he5?=
 =?us-ascii?Q?alwjnIDMjd1JqI2Y8kyOIZPv38+9sedGx/HLwhOj2pGvIJNRO0SQKkFYUOIq?=
 =?us-ascii?Q?mNnQM2qB75ZgB8RBBqeWdljE54dxXRxcChzNzGJRguOyDL0LsOOQAAgAsUJO?=
 =?us-ascii?Q?HgEKKglKMdDcFULcfoR0jp/ctkf0oBfiQJgwiKRbdYgoIu/ltCZZAfBu70ci?=
 =?us-ascii?Q?taMjATa0AAMe770TrsMf4BLRCVOYp5RbV/qydK0KuheMoup3yhwFprnp/012?=
 =?us-ascii?Q?cKCKWmFxwoOwHqxS09TdUv7I42n5M6NDRC40qHAZRVq9uowK6u3FHlUUOUzC?=
 =?us-ascii?Q?YaywGbSNdhSdy5bJrj7rUZ6qlRwXuz45YfY+9Ni5HHwtKE2mIbZgzPQpXOZ1?=
 =?us-ascii?Q?Fw6AkLzjhiFQkcyODsUH0hdBbNNHCmBoo4v8AvnckQeEVhbOrvTkc4+ItQ3u?=
 =?us-ascii?Q?1Z1JJNFEZXG3Gi7xrcS1W44H8CfAYmFKLJDKxVz0VWpJ4Fapp4fShIQiYa9K?=
 =?us-ascii?Q?xvNsKHYrDj6BpHAOJ2hKn6mUXCXng+4abbmaQITQdYuS0D/Lo5c/T/LyP3bS?=
 =?us-ascii?Q?Un/0mkQGAp2gUmceKkI0KDhWe7cGXUxr0QTVWKf/fMw6rmzmDgUM6NJE+ZKk?=
 =?us-ascii?Q?7yBldbUSQeCuvV7cSmEP/uxvt6ap56UWbNfIRnfHjX8vGJ5+CW6jfC+gL4Ob?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca1c0b8-d8a1-44db-027f-08db478a4a1c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 01:45:47.9953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDkqzLCqjjE+OU9xxnpk6i7JAOgMK26SHiYQ6+qkVB0oRxDvNYBjkLfcCcUnDYR+QxgkeHz5LeiZ6BuSi86smw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8355
X-Proofpoint-GUID: jqoZT3mKyMESI1kSrtMslkRrq80wvCmk
X-Proofpoint-ORIG-GUID: jqoZT3mKyMESI1kSrtMslkRrq80wvCmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_01,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280011
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 28 Apr 2023 01:45:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8014

From: Chen Qi <Qi.Chen@windriver.com>

Things have changed since these two recipe were added. Now
https://github.com/docker/docker has been redirected to
https://github.com/moby/moby. This means the contents of
docker-ce_git.bb and docker-moby_git.bb are essentially
the same except for some comments.

So let's merge them into one and keep the merged recipe's name
docker-moby, as the repo's name is moby.

The PROVIDES and RPROVIDES are added 'docker-ce' for backward
compatibility.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 conf/layer.conf                              |  1 -
 recipes-containers/docker/docker-ce_git.bb   | 59 --------------------
 recipes-containers/docker/docker-moby_git.bb | 27 ++++-----
 recipes-containers/docker/docker.inc         |  8 ++-
 4 files changed, 17 insertions(+), 78 deletions(-)
 delete mode 100644 recipes-containers/docker/docker-ce_git.bb

diff --git a/conf/layer.conf b/conf/layer.conf
index 88ac390..9a26bcc 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -41,7 +41,6 @@ require conf/distro/include/virt_security_flags.inc
 
 PREFERRED_PROVIDER_virtual/runc ?= "runc-opencontainers"
 PREFERRED_PROVIDER_virtual/containerd ?= "containerd-opencontainers"
-PREFERRED_PROVIDER_virtual/docker ?= "docker-ce"
 
 # Sanity check for meta-virtualization layer.
 # Setting SKIP_META_VIRT_SANITY_CHECK to "1" would skip the bbappend files check.
diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
deleted file mode 100644
index 6781c77..0000000
--- a/recipes-containers/docker/docker-ce_git.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-HOMEPAGE = "http://www.docker.com"
-SUMMARY = "Linux container runtime"
-DESCRIPTION = "Linux container runtime \
- Docker complements kernel namespacing with a high-level API which \
- operates at the process level. It runs unix processes with strong \
- guarantees of isolation and repeatability across servers. \
- . \
- Docker is a great building block for automating distributed systems: \
- large-scale web deployments, database clusters, continuous deployment \
- systems, private PaaS, service-oriented architectures, etc. \
- . \
- This package contains the daemon and client, which are \
- officially supported on x86_64 and arm hosts. \
- Other architectures are considered experimental. \
- . \
- Also, note that kernel version 3.10 or above is required for proper \
- operation of the daemon process, and that any lower versions may have \
- subtle and/or glaring issues. \
- "
-
-#
-# https://github.com/docker/docker-ce-packaging.git
-#  common.mk:
-#    DOCKER_CLI_REPO    ?= https://github.com/docker/cli.git
-#    DOCKER_ENGINE_REPO ?= https://github.com/docker/docker.git
-#    REF                ?= HEAD
-#    DOCKER_CLI_REF     ?= $(REF)
-#    DOCKER_ENGINE_REF  ?= $(REF)
-#
-# These follow the tags for our releases in the listed repositories
-# so we get that tag, and make it our SRCREVS:
-#
-
-SRCREV_docker = "219f21bf07502b447095649b5a2764661737f164"
-SRCREV_libnetwork = "25ec449c45d2075c85fb3688ef4c1730be0466e0"
-SRCREV_cli = "569dd73db13099a7c3104d73aa15117b359045bc"
-SRCREV_FORMAT = "docker_libnetwork"
-SRC_URI = "\
-	git://github.com/docker/docker.git;branch=23.0;name=docker;protocol=https \
-	git://github.com/docker/libnetwork.git;branch=master;name=libnetwork;destsuffix=git/libnetwork;protocol=https \
-	git://github.com/docker/cli;branch=23.0;name=cli;destsuffix=git/cli;protocol=https \
-	file://0001-libnetwork-use-GO-instead-of-go.patch \
-	file://docker.init \
-        file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
-        file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
-	"
-
-DOCKER_COMMIT = "${SRCREV_docker}"
-
-require docker.inc
-
-# Apache-2.0 for docker
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
-
-DOCKER_VERSION = "23.0.2-ce"
-PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
-
-CVE_PRODUCT = "docker mobyproject:moby"
diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index cd6a741..94c72e7 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -18,21 +18,18 @@ DESCRIPTION = "Linux container runtime \
  subtle and/or glaring issues. \
  "
 
-# Notes:
-#   - This docker variant uses moby and the other individually maintained
-#     upstream variants for SRCREVs
-#   - It is a true community / upstream tracking build, and is not a
-#     docker curated set of commits or additions
-#   - The version number on this package tracks the versions assigned to
-#     the curated docker-ce repository. This allows compatibility and
-#     functional equivalence, while allowing new features to be more
-#     easily added.
-#   - This could be called "docker-moby" or just "moby" in the future, but
-#     that would require the creation of a virtual/docker dependency, which
-#     is possible, but overkill at the moment (while we wait for the upstream
-#     to stop changing).
-#   - The common components of this recipe and docker-ce do need to be moved
-#     to a docker.inc recipe
+#
+# https://github.com/docker/docker-ce-packaging.git
+#  common.mk:
+#    DOCKER_CLI_REPO    ?= https://github.com/docker/cli.git
+#    DOCKER_ENGINE_REPO ?= https://github.com/docker/docker.git
+#    REF                ?= HEAD
+#    DOCKER_CLI_REF     ?= $(REF)
+#    DOCKER_ENGINE_REF  ?= $(REF)
+#
+# These follow the tags for our releases in the listed repositories
+# so we get that tag, and make it our SRCREVS:
+#
 
 SRCREV_moby = "219f21bf07502b447095649b5a2764661737f164"
 SRCREV_libnetwork = "25ec449c45d2075c85fb3688ef4c1730be0466e0"
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 4a4bc4f..5cd8bdc 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -31,15 +31,17 @@ RDEPENDS:${PN} += "virtual-containerd ${VIRTUAL-RUNTIME_container_runtime}"
 
 RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-masquerade"
 
-PROVIDES += "virtual/docker"
-
-# we want all the docker variant recpes to be installable via "docker"
+# make it installable via "docker"
 PACKAGE_NAME = "docker"
 RPROVIDES:${PN} += "docker"
 RPROVIDES:${PN}-dbg += "docker-dbg"
 RPROVIDES:${PN}-dev += "docker-dev"
 RPROVIDES:${PN}-contrip += "docker-dev"
 
+# For docker-ce backward compatibility
+PROVIDES += "docker-ce"
+RPROVIDES:${PN} += "docker-ce"
+
 inherit pkgconfig
 PACKAGECONFIG ??= "docker-init seccomp"
 PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
-- 
2.40.0


