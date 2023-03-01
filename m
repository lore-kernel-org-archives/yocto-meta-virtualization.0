Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE19C7EE37
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18398.1677664368688962960
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FQCGNUZd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswQ023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Bg7hdoGmXnu1lhTjIod4oIKztdZ0n/u+PdMzE8f21gQ=;
 b=FQCGNUZd/WMK50s2QhRoQ0gdjzIdIt1dOJPfM27G7SnSLjenBp37YAB+MdWsuEj4vM4L
 uvrEyJBjaDKzw94bGi1rIVRqp6kvhapR7EWh69+Qcj1q6F0Yoc0G7MOJuhn3LcZB21dF
 Nr4lElMb3fw6YdES2qakB/tgb7PjH5EDLMAe+N+569UEyiz5uuRuJvrMCYBbqhSR8ZWg
 j/VKjRHfsIXvmI8Q2r1hANg0qJQYLqxyZ8BDeI4fVOJxGa0AQgfRZSK8LwNyvwsXg8DC
 vST71REqDVu40staKvJeTkD1WlBN6Vep9oqBbRUDMDIa1ihYQXe8GMxrGpPsH3zSJ3Ce lw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIehFbz+KuI9JS0YVgBNNjxuhxEeNEOTDOwv2rGc+5g1ulQRUwRgoHd7DYMMcjujDQmaZW1sripHDN3I0ya3ux/Vgu1xZ3ROOAFxwdoqHorIqkeMobw0wlBrQcPmcfOnlh6PesgJ7U2NVFOGWxW0M+5NW+ByhnLB0wovqvFIwliOfq7oVbVIX+GGLqPzzzP579r7fUHaKlnb7GTAkAvmU9jsZasKFpOK3yG/ouVnvg9KnVYtKIsdeCFDsS3MPg2MVePiX5cMLTI8dSvs8yLl9m71sRrl4bGtl7bx7Jv/hzbaVYEr/yfP33ejbObH8Sn1UJgKKvNdhNTEFfcLk4S17Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bg7hdoGmXnu1lhTjIod4oIKztdZ0n/u+PdMzE8f21gQ=;
 b=h7gSryVaayS5Rgc/BM4zMlUEfxMqQVhPgpVoEbHUHeQ5QPrRejnAHN6bsmbqfKMXwhcM+p6E31uoFp/3xh79wrbcM0zM54Iu9uf/gahRZJyIYZfWckL2/8bhwaOgsPe2dhhzG+/0n6KsGG6TiyJt8ACexZN8pkpd7Z/PFXYX2sAZiBrRDbmy8JNmAMfuN3PkceqX2sTuA4esLsSft9kxLvQta74uxq3RLrLQFZIfuJVteMNp3aEpUtBh2cOrkIfCuJonc+aXoS0xi1HjXRm1ZXi1+sie/d+TbDHLJW9LRU1Uz8VdjrIDWXg5bIp89Ft+zJ/toFqPDlCl12oKtQo0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:45 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:45 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 07/10] skopeo: use container-host bbclass to provide configuration
Date: Wed,  1 Mar 2023 01:52:25 -0800
Message-Id: <20230301095228.122562-7-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 815d96f4-69dc-42de-524d-08db1a3ab453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3jNQRILIzTm7CVVIbtlnL9n6DPCZCnCo+g8NuVlNENI2wfbxanK1gqb/J5VWrNf5noVoafiuJwMiJwbh70AlwRB9DyLBY/CDF+ciRW33nJE189D9/yd++iB3iMO2fJx8cuLESjvVlV/ukq7UPaYxImJ1rjEcGaiP2dE9iBa6laFFdpSaqAdHTkugt21S/DrCMR7vKVyNBYjOkhwGyKhNQuqPvri9Ej7wVqEqJ13E/moXsHPtavDxXaD6N4ifefuk5TQg4lkQIgxpZzlE+y8BRUnIq1c+dQBOCJXThRNzYrwKAHYeer9RA34/n0Qmd374ZmeYzOllYYmMWhx5u2pAREAbU9X40MQQHs+10o1zDOTxl0KZGxigUvAh0YmqrbHMBnk97mZh13mEuAq0GYJ1S+3hbFJI+gwfIusmjqpo0t8jiuqbnXfW6hclEEa3U6f1KT+yzy/7HBo2slOmgI+SWz0ZY9QPvRl3NkSO7tZpedDKWeMG2Eqbq8Up35m5iCwI9HZpabPc4MJ+OsInq1mzVrsBAjrexOhe9D/1F+RgCjYCkI1CBl+H7Q4IZkrpsI7jBNk1nJeDe6ffFPtQtktYsJ+x3PtuAYW8Yz2q96yhdYbrn/dsuaR/rd2HEe9KfEYiD2N0VFUXgFe4T32y+Dc9cGVuN2HA+z6SDDT8jOzUfV7UGz8l2bNbjy3AQ1lAkf+/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(30864003)(186003)(83380400001)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(966005)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PtK6dcgMooBKtkEkaIaWdUfZnaZTWq9HSwrm6W8aDdB5YLIH6R6ebHYKtqSi?=
 =?us-ascii?Q?70pagKJC+9lMv9QCPwd022mH1QsKg81jkjQwC+u8m14BRwxl/45+nsCkz7Um?=
 =?us-ascii?Q?mMqNJQ/cF2oK/LhriTnKK4Ao+/DcEQK/kqaHCjyrscRIYLGSyO4d2EERhW18?=
 =?us-ascii?Q?4RFwQTWs1bjJzNzJ7Pro7HAmSrnk57QSZ+/oonW7nYUdf2mplapEePh+KeH/?=
 =?us-ascii?Q?7dWl4EVLWx7lylAie7eeFPz5kOCrvuA2yjpeJKVA8kpMhkFXYUKUcNwUITS1?=
 =?us-ascii?Q?rb3cIfZMKMNHDvkKza0BqSkA/750P3vxyX/Kacf6EAftE2E6aeMcsuGAFkiu?=
 =?us-ascii?Q?n23agdvUIoYWTsKLvyP4NS0E4rHBZJxswkGDLVkfZ5YpH5SHPBZyn8qSyW4F?=
 =?us-ascii?Q?SIAjyRLUJU3qx/6CBUpYKaQgQMRr6r/1ealehaGbAPMZI9ULnYNF6oHOw62n?=
 =?us-ascii?Q?ozpoWN5aeFL5QsXh09Ryfwf9wOTBZiV/4BDL1EB98Be8TWbTYwcl9HmGIBJY?=
 =?us-ascii?Q?dON12Xjd3dUw6jn36lVoZiSMqxt82J4AcYFEmCZrzLGcN0ZPvAsfe1Z4AqPa?=
 =?us-ascii?Q?NSpKtqZriD/LKO+iuMp+U/9F8nCMkbCimX7OmONY26g3p+xJpnWUSM8Jbftw?=
 =?us-ascii?Q?6GpVrPnDFOiy8Vv7zMtc7TaaAQ7E1Tfm89cCRPUUBJVrH57XWuG1s8Rhc4bm?=
 =?us-ascii?Q?/xVmvpKQY9l9w3b13pq8Lgfq2D+BnzUKeWal9L1RS38sB89fx/+WwZlVmGYG?=
 =?us-ascii?Q?uCHv3KWkjbavS5sxxAfIrIhLGI4xGzXcoXzYerp1NFBZAujG3T5dR2wLqNUu?=
 =?us-ascii?Q?exshofzQbLuTFYhcWqnQbvvDR3hBt2qHnfJlSZE0tpAzCnSxnwT0texkx74P?=
 =?us-ascii?Q?iVHs97z1/kyMkl3+by7SnCU1uL9WV7xoqJDZQDYmAq5VHY3rq8D2tf/8szWT?=
 =?us-ascii?Q?leUOpf3Cd9reqlXk674rwrbcrs/okJ1g+JMAbN12KTHePWWGSPHayzU05C4X?=
 =?us-ascii?Q?9DNyekR7RCtXTXk34avHhITbSacbIO048aqyLR+EjZvyJjot+hLpJztLgrPz?=
 =?us-ascii?Q?VLFmZuqW0dwKtvFYlPyjhTZGEVn/vtp9Wn2GsCt4xzPGSmVpeI5MyYiDo3d3?=
 =?us-ascii?Q?mEQ3mHvj3lvu76Njvg8aNylLvaBz1GE9X/vft6IBW2lvI/j2crvZM9eWtUxG?=
 =?us-ascii?Q?MnM4I+b79tTRbD6X4FGhj3Per5/5KK5yEUFh8J0/vEtNA/N4SSr7AtRPe+N6?=
 =?us-ascii?Q?xkzIacvz5YdLgOlyW1tzV4mG7KJ1GGlAF7N5zqkn2XH8O0/S5IhMUPmcXgRn?=
 =?us-ascii?Q?B90w2sRprw1H51qJrzl6Np+b7QF5zL2fXAHIBCVkfB92LIARZwecBJdXNmzR?=
 =?us-ascii?Q?Wyy9TGQhfTs9NYBZ6HBXTEhhbROXgM8ey2R3j8tkyHJSnZXGRYTuPR3jDz/l?=
 =?us-ascii?Q?sMjsC01u1cPZiw6tH9fQWSmmFVntemiSajQtYYO/8h5cIwxok52xPyXaZhfp?=
 =?us-ascii?Q?JUjYIqF9xBSa5LATSk8j/k7xMspqqI3OVv88SPsNoJc7gMI6WXIfu+IuVkEN?=
 =?us-ascii?Q?D20f9ALCzUU/GRN1Kkbb1yeorua9it+jGZ2IdJUBdPr/JZU8SrS5DAoghhOE?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 815d96f4-69dc-42de-524d-08db1a3ab453
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:44.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq1TLMjMar+dnEEbhUFy3RB2rGzi4U8RWiDbYl8UjDPINTxvWzJ6X1lNL9rlpodX/nHPeky7LNXzF555oZTqxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: 8CJT7ePXanzUtwtCXIQbBHWZaMN9B5uZ
X-Proofpoint-GUID: 8CJT7ePXanzUtwtCXIQbBHWZaMN9B5uZ
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7917

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Instead of providing storage and registries configuration files
in this package, we inherit container-host which will provide a
common definition of these configs.

This allows multiple packages to ensure that the configuration
files are present, and not conflict in their installation.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../skopeo/files/registries.conf              |  25 ---
 recipes-containers/skopeo/files/storage.conf  | 195 ------------------
 recipes-containers/skopeo/skopeo_git.bb       |   7 +-
 3 files changed, 2 insertions(+), 225 deletions(-)
 delete mode 100644 recipes-containers/skopeo/files/registries.conf
 delete mode 100644 recipes-containers/skopeo/files/storage.conf

diff --git a/recipes-containers/skopeo/files/registries.conf b/recipes-containers/skopeo/files/registries.conf
deleted file mode 100644
index ba6c3f6..0000000
--- a/recipes-containers/skopeo/files/registries.conf
+++ /dev/null
@@ -1,25 +0,0 @@
-# This is a system-wide configuration file used to
-# keep track of registries for various container backends.
-# It adheres to TOML format and does not support recursive
-# lists of registries.
-
-# The default location for this configuration file is /etc/containers/registries.conf.
-
-# The only valid categories are: 'registries.search', 'registries.insecure', 
-# and 'registries.block'.
-
-[registries.search]
-registries = ['docker.io', 'registry.fedoraproject.org', 'quay.io', 'registry.access.redhat.com', 'registry.centos.org']
-
-# If you need to access insecure registries, add the registry's fully-qualified name.
-# An insecure registry is one that does not have a valid SSL certificate or only does HTTP.
-[registries.insecure]
-registries = []
-
-
-# If you need to block pull access from a registry, uncomment the section below
-# and add the registries fully-qualified name.
-#
-# Docker only
-[registries.block]
-registries = []
diff --git a/recipes-containers/skopeo/files/storage.conf b/recipes-containers/skopeo/files/storage.conf
deleted file mode 100644
index 722750c..0000000
--- a/recipes-containers/skopeo/files/storage.conf
+++ /dev/null
@@ -1,195 +0,0 @@
-# This file is is the configuration file for all tools
-# that use the containers/storage library.
-# See man 5 containers-storage.conf for more information
-# The "container storage" table contains all of the server options.
-[storage]
-
-# Default Storage Driver, Must be set for proper operation.
-driver = "overlay"
-
-# Temporary storage location
-runroot = "/run/containers/storage"
-
-# Primary Read/Write location of container storage
-graphroot = "/var/lib/containers/storage"
-
-# Storage path for rootless users
-#
-# rootless_storage_path = "$HOME/.local/share/containers/storage"
-
-[storage.options]
-# Storage options to be passed to underlying storage drivers
-
-# AdditionalImageStores is used to pass paths to additional Read/Only image stores
-# Must be comma separated list.
-additionalimagestores = [
-]
-
-# Remap-UIDs/GIDs is the mapping from UIDs/GIDs as they should appear inside of
-# a container, to the UIDs/GIDs as they should appear outside of the container,
-# and the length of the range of UIDs/GIDs.  Additional mapped sets can be
-# listed and will be heeded by libraries, but there are limits to the number of
-# mappings which the kernel will allow when you later attempt to run a
-# container.
-#
-# remap-uids = 0:1668442479:65536
-# remap-gids = 0:1668442479:65536
-
-# Remap-User/Group is a user name which can be used to look up one or more UID/GID
-# ranges in the /etc/subuid or /etc/subgid file.  Mappings are set up starting
-# with an in-container ID of 0 and then a host-level ID taken from the lowest
-# range that matches the specified name, and using the length of that range.
-# Additional ranges are then assigned, using the ranges which specify the
-# lowest host-level IDs first, to the lowest not-yet-mapped in-container ID,
-# until all of the entries have been used for maps.
-#
-# remap-user = "containers"
-# remap-group = "containers"
-
-# Root-auto-userns-user is a user name which can be used to look up one or more UID/GID
-# ranges in the /etc/subuid and /etc/subgid file.  These ranges will be partitioned
-# to containers configured to create automatically a user namespace.  Containers
-# configured to automatically create a user namespace can still overlap with containers
-# having an explicit mapping set.
-# This setting is ignored when running as rootless.
-# root-auto-userns-user = "storage"
-#
-# Auto-userns-min-size is the minimum size for a user namespace created automatically.
-# auto-userns-min-size=1024
-#
-# Auto-userns-max-size is the minimum size for a user namespace created automatically.
-# auto-userns-max-size=65536
-
-[storage.options.overlay]
-# ignore_chown_errors can be set to allow a non privileged user running with
-# a single UID within a user namespace to run containers. The user can pull
-# and use any image even those with multiple uids.  Note multiple UIDs will be
-# squashed down to the default uid in the container.  These images will have no
-# separation between the users in the container. Only supported for the overlay
-# and vfs drivers.
-#ignore_chown_errors = "false"
-
-# Inodes is used to set a maximum inodes of the container image.
-# inodes = ""
-
-# Path to an helper program to use for mounting the file system instead of mounting it
-# directly.
-#mount_program = "/usr/bin/fuse-overlayfs"
-
-# mountopt specifies comma separated list of extra mount options
-mountopt = "nodev"
-
-# Set to skip a PRIVATE bind mount on the storage home directory.
-# skip_mount_home = "false"
-
-# Size is used to set a maximum size of the container image.
-# size = ""
-
-# ForceMask specifies the permissions mask that is used for new files and
-# directories.
-#
-# The values "shared" and "private" are accepted.
-# Octal permission masks are also accepted.
-#
-#  "": No value specified.
-#     All files/directories, get set with the permissions identified within the
-#     image.
-#  "private": it is equivalent to 0700.
-#     All files/directories get set with 0700 permissions.  The owner has rwx
-#     access to the files. No other users on the system can access the files.
-#     This setting could be used with networked based homedirs.
-#  "shared": it is equivalent to 0755.
-#     The owner has rwx access to the files and everyone else can read, access
-#     and execute them. This setting is useful for sharing containers storage
-#     with other users.  For instance have a storage owned by root but shared
-#     to rootless users as an additional store.
-#     NOTE:  All files within the image are made readable and executable by any
-#     user on the system. Even /etc/shadow within your image is now readable by
-#     any user.
-#
-#   OCTAL: Users can experiment with other OCTAL Permissions.
-#
-#  Note: The force_mask Flag is an experimental feature, it could change in the
-#  future.  When "force_mask" is set the original permission mask is stored in
-#  the "user.containers.override_stat" xattr and the "mount_program" option must
-#  be specified. Mount programs like "/usr/bin/fuse-overlayfs" present the
-#  extended attribute permissions to processes within containers rather then the
-#  "force_mask"  permissions.
-#
-# force_mask = ""
-
-[storage.options.thinpool]
-# Storage Options for thinpool
-
-# autoextend_percent determines the amount by which pool needs to be
-# grown. This is specified in terms of % of pool size. So a value of 20 means
-# that when threshold is hit, pool will be grown by 20% of existing
-# pool size.
-# autoextend_percent = "20"
-
-# autoextend_threshold determines the pool extension threshold in terms
-# of percentage of pool size. For example, if threshold is 60, that means when
-# pool is 60% full, threshold has been hit.
-# autoextend_threshold = "80"
-
-# basesize specifies the size to use when creating the base device, which
-# limits the size of images and containers.
-# basesize = "10G"
-
-# blocksize specifies a custom blocksize to use for the thin pool.
-# blocksize="64k"
-
-# directlvm_device specifies a custom block storage device to use for the
-# thin pool. Required if you setup devicemapper.
-# directlvm_device = ""
-
-# directlvm_device_force wipes device even if device already has a filesystem.
-# directlvm_device_force = "True"
-
-# fs specifies the filesystem type to use for the base device.
-# fs="xfs"
-
-# log_level sets the log level of devicemapper.
-# 0: LogLevelSuppress 0 (Default)
-# 2: LogLevelFatal
-# 3: LogLevelErr
-# 4: LogLevelWarn
-# 5: LogLevelNotice
-# 6: LogLevelInfo
-# 7: LogLevelDebug
-# log_level = "7"
-
-# min_free_space specifies the min free space percent in a thin pool require for
-# new device creation to succeed. Valid values are from 0% - 99%.
-# Value 0% disables
-# min_free_space = "10%"
-
-# mkfsarg specifies extra mkfs arguments to be used when creating the base
-# device.
-# mkfsarg = ""
-
-# metadata_size is used to set the `pvcreate --metadatasize` options when
-# creating thin devices. Default is 128k
-# metadata_size = ""
-
-# Size is used to set a maximum size of the container image.
-# size = ""
-
-# use_deferred_removal marks devicemapper block device for deferred removal.
-# If the thinpool is in use when the driver attempts to remove it, the driver
-# tells the kernel to remove it as soon as possible. Note this does not free
-# up the disk space, use deferred deletion to fully remove the thinpool.
-# use_deferred_removal = "True"
-
-# use_deferred_deletion marks thinpool device for deferred deletion.
-# If the device is busy when the driver attempts to delete it, the driver
-# will attempt to delete device every 30 seconds until successful.
-# If the program using the driver exits, the driver will continue attempting
-# to cleanup the next time the driver is used. Deferred deletion permanently
-# deletes the device and all data stored in device will be lost.
-# use_deferred_deletion = "True"
-
-# xfs_nospace_max_retries specifies the maximum number of retries XFS should
-# attempt to complete IO when ENOSPC (no space) error is returned by
-# underlying storage device.
-# xfs_nospace_max_retries = "0"
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index d32c525..12a24b0 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -22,8 +22,6 @@ RDEPENDS:${PN} = " \
 SRC_URI = " \
     git://github.com/containers/skopeo;branch=main;protocol=https \
     file://0001-Makefile-use-pkg-config-instead-of-gpgme-config.patch \
-    file://storage.conf \
-    file://registries.conf \
 "
 
 SRCREV = "3e2defd6d37b742adde2aac6cb01f6c3c17da8e2"
@@ -35,6 +33,8 @@ S = "${WORKDIR}/git"
 inherit goarch
 inherit pkgconfig
 
+inherit container-host
+
 # This CVE was fixed in the container image go library skopeo is using.
 # See:
 # https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2019-10214
@@ -81,9 +81,6 @@ do_install() {
 
 	install ${S}/src/import/bin/skopeo ${D}/${sbindir}/
 	install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
-
-	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
-	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
 }
 
 do_install:append:class-native() {
-- 
2.37.1


