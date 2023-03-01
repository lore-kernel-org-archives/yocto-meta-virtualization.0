Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E620C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18341.1677664367788430174
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O5Erhx9s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswO023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=NBetYGXHrwgMypb9Mi59VJBG/40Tw4NG0PI4zp/6VAc=;
 b=O5Erhx9spdyAYL2XCo00OsVAQGTw3PND5Z4wXsNKbBFn6eOLga/iNu4SoTqqXs4qPrKW
 tba/kmFBO0Kiqg1NTMlBKCZzRDH5pS2dSermetOvajjV4OGHVSA9Z0IsGtYKyGhmcUEg
 aI11e76UE+xKcs4lg/kTq9OrUsIvhCIm2fI8TLpew8zeW00NJQTe8tSCIbYaCFzCV8Ds
 ZHT1SlpnP2leyBWd6uNoMjVY7++JMEcmKSxXbT4PudOE/B5kpXhQl5ETSUNIu2+e5CCq
 YNX9Q5OoWuSGqFFtiBUnUTLWqQy/LVa8Ly5ultrcAeZsiT64g3rDACWiBlFkjWxg0ao9 Cg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyfLoAQ6QVRiivKV2T9YQ74PuelrdohHVDZXYUqXsY7cgcAtZLXSf4eL43JWQecflmOqFNSQlsHD+EhBceai9VTR4G02x/G2WcHdeTBmiXJJ1E0L5KIn+8oH/XTDOtujXLFDGOjhkvNbBwnMn5r7J1li+T/xOoSd2D6ZDkzrYm+gGue9lusbMn0u/KSZCiD7Nqvk5vr7YTaR75V/QJfX2TzZo9UUUaSgTSv05c8+QwVCTWusOps1/zyXCDOQRl6Jyr+iysPUw/yvY7Joha/4ZXlaiEV63ODnNCekR4PC79mwW9HzeSVSSAlTSZ8+Cqmwsy+MVtKOfMevvQmwuOJHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBetYGXHrwgMypb9Mi59VJBG/40Tw4NG0PI4zp/6VAc=;
 b=M5m2JxfzVuGsDNd1N6Z3n1ruMo3IwcyAk68cxQzLUgNu4kPEry16VBxP8YGpWyPj9xYcus4mS3lOolrd+/V67HU6U1HfFf14bXaZ1jnvwYZGJJ+UqrXBhJzHfSZWlyILHCSfp1sGC8ROvDzLszoI/aaqjhYtBLsCQZES+r8NdKSsjEkpVvWmlVHtSmDY2MkGsfgXsuTA/oZIKT7FEd5vfluhplU7TPkkHah7M/HfEfV23xsDoKB4aiVN08qewlbUakKAmfmRVDy5OBOag/06JIT3x4MVawTFAH+8t3yzU2yE3K8cuHJLUyi2XZe8GsYqfuLLIo4D+sONtvDNxf9Rrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:43 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:43 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 04/10] cri-o: update crio.conf to match the current version 1.23
Date: Wed,  1 Mar 2023 01:52:22 -0800
Message-Id: <20230301095228.122562-4-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3cfef834-9666-4d22-1bbc-08db1a3ab3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hd+NzKjrQ3h6SkOcWcoEdfBaPNPoYdGwJ8LfPdqqzs3JvMWkOZDCCxBzd8ddrlHwg0upzZzcTsDzPCEoATPMxcowo8sGbnySKuI4laCSLsH6kJ93+QQVh2hPqzfm7Zb1WTL90FMu2BZStwGj+bfnDtLwZjvOt5gQCeJrDPmX2D8D4JCe7BJfjK9UXwvv/ZqumQXr0pHBC99g90ZN+HliUKuYuiSZux3O0/i1rctHR2gakeMJpbnt2WqomQSHoK6QbGUenieK+VARJzU8V0n91o7d6mjQf+DYoESZHsqNV3DISPKjwouaY9cqLD9k7qj7qnggjYe9xJ+h0oA9WcmqvAMOeB0TX6izLjq7NjmgS172wxBtOAKV0PyYQEPEtV1eaMLmQtky00qoiapWcxkhQ93D9rEx3MuZse+FHgyl0kADQQbcQD/oF0ZxDpqka8pUPiYuvaNVFZP9I6Sp2or5KriOYCu6SVwNxyEuS2ldXpWOnOsEUs4vOIVa4x+S2f0jhOKZY+jmvhxswYB+I/kkDiB9ppcIhRIbpkBsnMQAyMzn20H6Iq5B5Y0VsBPfX8P6hVQFz8tVOGzqDEg/NGU7if6dwjRGF9yt1FVcyh8d6cNvbDhqELb56Kjq8VTQzFtHMocNgP+9Y0O7WbgO9Grm6nRQNelO3lh81E/LL7hIgwpPlSfvOcarfQXuk+uAQlptH4ocw3mnyH8hEMiAGpU2eQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(30864003)(186003)(83380400001)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(15650500001)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h745+HdBTBcWw/5EflzwSRlovhgcJkUWd4zcJKDG8//OQuTfNg3EZ0tHjPCM?=
 =?us-ascii?Q?OyJ6bxDlOjNtqFyCgeXQGZgWmBwTtxT37Bn7h3/htD0fpeSIkI4pVGSmupIB?=
 =?us-ascii?Q?jLrHFRKKYQgObY9I1WLAsVuCghdYtgW1ZrPZ6ysD8Hqvq3Vc3dpzGOixj+aF?=
 =?us-ascii?Q?v/tzm6AhWOkmYydfCTJLMxrHrvSXvqSbabnfGN3rxnbBM3G7Hk+8hQSxu4i0?=
 =?us-ascii?Q?6UeorxL8yohw0NUzhKHcZd7/ZpuRB+G9wd54W1zNwItNB+xUikrFwNyvbKOI?=
 =?us-ascii?Q?M5DBihaHVv0uRl+TdfeaL4wJPmyuuJm0aQvNYXKOg7yPf06lLrkzBoA4w2os?=
 =?us-ascii?Q?eER1ys1RxAmwbFH4Dx4AY4i7v0p+9EmJyDglerkBTcRNIGL7Rcf7roiLGxLv?=
 =?us-ascii?Q?R/NEX/gZ3hO29SN+p4py4+KGkz/NRMsMS0dm3Ck0+ePRzhPdNcJyyFk2fiE1?=
 =?us-ascii?Q?rl0Bd8I8ciwOIlqcSrRwBghl/dFESpk7fd3UNfOPl6aVien5jXpfH0a+vWdN?=
 =?us-ascii?Q?wiEitiQtCJXOsAGAUhWXX/kuHxyrDS58gCU0E8pbYfbpmputFGtiiySvldzY?=
 =?us-ascii?Q?Z9q0l/P9+qxyEgdgf28eJgw18Alj6Rfonkp9rpv4yf8fV5pir6CAHP5rlWWO?=
 =?us-ascii?Q?81t7ecbRIGmNEvvs2hUxd3XnTNt9vrdp8gK3BgjWvDPiCf76Tp+Pg6eqejkY?=
 =?us-ascii?Q?oBKC5fSEifaGl96xJ8xWd0fp47+2JTkUR0lUDr+5RChjKHf7vVNR0f7nBH1Q?=
 =?us-ascii?Q?roSQNbYKDlP23x51lfAj/gdPYUI8UIXP5iMSS/PdL1lpYh0iVQo0U36kECWV?=
 =?us-ascii?Q?lN6sg2J8lAPxFhOEeH7u/uPXgkHukttBFREZFJCl6MyX1wqAR35F+DniZXlv?=
 =?us-ascii?Q?PdVgyZKTNp0IMoOqohOwwAR63LRY+k7Wh13Lt2zf49+YY2SE8aiXjBn/flSS?=
 =?us-ascii?Q?3KSMNKQ1SAIVC+wLTV1KRIKlK3brcrl5Eb5mpkMcA7N3EGXf1fD1kd7JW4Q8?=
 =?us-ascii?Q?dIyRXR8HrRVW7mKVv8nm6pGcL+8LcLe95cle+CUG0n8eOSjspgcmCkJZnKU8?=
 =?us-ascii?Q?9iYX/vwYby1SXqPC3DwvGkb4yUPyIdtytiaQYP2t+kMQQpkTRClBEg21P6ig?=
 =?us-ascii?Q?XScPULjF6SN4sXS6Os+qG5T/69P1vL4HZABa59y/l5vvJhgpx8oM/uKoWuaa?=
 =?us-ascii?Q?uuCUOCovXxG+/DQY7nz43+QhT2hs/LCXelJ3VBuVgnomCGamxY/7E80lD+5V?=
 =?us-ascii?Q?BFMbnbR9Q9GtAHRNyVGg9h2LWBWiBOKBbuI3S0SAm1YIfHe1dCVgUOKgJsJj?=
 =?us-ascii?Q?Zca35mj1KXfzq5xwHbIaUieEbqeatL5ukUcv+4+VuDz14TDWv8DVdXZUIuth?=
 =?us-ascii?Q?BxAaJIBPGxjZ4tYGbAvKxFAuveUhgaHs31ByPjvB12nMPP+tb597Nu/JaTZS?=
 =?us-ascii?Q?skO9iRQDoAF5WPTvHGwzoIoLZCrLWdWxDjsHMwIzpT6dA6F1miWgqlB+6ic1?=
 =?us-ascii?Q?NVkhxXhXzBuUpBgzTXA+g2nZ39Jiesuql5x/alh2uT8lP0XmFACgx0ijXbQN?=
 =?us-ascii?Q?s0jspDuonfH6b7pSAlUAtWMw8Dzdt8teUB0xz/MYnUZE/qq8ooLbDE/NWnzr?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cfef834-9666-4d22-1bbc-08db1a3ab3c4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:43.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQopn220s6x4hYArZ7/doN3kd+D4G27vtK5AGIfI1IDSGVke2Ejlj5+5CxHL4P5rA7MB/MchYFWDpFoxYQKTeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: 9sUwKviYhPkUzl86R_IEZD2lOdR-aKaF
X-Proofpoint-GUID: 9sUwKviYhPkUzl86R_IEZD2lOdR-aKaF
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7915

The old crio.conf file can cause cri-o start failure. The error
message is as below.

  validating runtime config: runtime validation: failed to \
  translate monitor fields for runtime runc: cgroupfs manager \
  conmon cgroup should be 'pod' or empty

Use new crio.conf file to solve this issue. The file is generated
by 'crio --config="" config --default' command, as indicated in
the old crio.conf file.

With this config file update, the crio.service can now start correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/files/crio.conf | 604 +++++++++++++++++++----
 1 file changed, 507 insertions(+), 97 deletions(-)

diff --git a/recipes-containers/cri-o/files/crio.conf b/recipes-containers/cri-o/files/crio.conf
index 899d255..d48ddae 100644
--- a/recipes-containers/cri-o/files/crio.conf
+++ b/recipes-containers/cri-o/files/crio.conf
@@ -1,146 +1,556 @@
 # generated via: crio --config="" config --default
 
-# The "crio" table contains all of the server options.
+# The CRI-O configuration file specifies all of the available configuration
+# options and command-line flags for the crio(8) OCI Kubernetes Container Runtime
+# daemon, but in a TOML format that can be more easily modified and versioned.
+#
+# Please refer to crio.conf(5) for details of all configuration options.
+
+# CRI-O supports partial configuration reload during runtime, which can be
+# done by sending SIGHUP to the running process. Currently supported options
+# are explicitly mentioned with: 'This option supports live configuration
+# reload'.
+
+# CRI-O reads its storage defaults from the containers-storage.conf(5) file
+# located at /etc/containers/storage.conf. Modify this storage configuration if
+# you want to change the system's defaults. If you want to modify storage just
+# for CRI-O, you can change the storage configuration options here.
 [crio]
 
-# root is a path to the "root directory". CRIO stores all of its data,
-# including container images, in this directory.
+# Path to the "root directory". CRI-O stores all of its data, including
+# containers images, in this directory.
 root = "/var/lib/containers/storage"
 
-# run is a path to the "run directory". CRIO stores all of its state
-# in this directory.
-runroot = "/var/run/containers/storage"
+# Path to the "run directory". CRI-O stores all of its state in this directory.
+runroot = "/run/containers/storage"
 
-# storage_driver select which storage driver is used to manage storage
-# of images and containers.
-storage_driver = ""
+# Storage driver used to manage the storage of images and containers. Please
+# refer to containers-storage.conf(5) to see all available storage drivers.
+storage_driver = "overlay"
 
-# storage_option is used to pass an option to the storage driver.
+# List to pass options to the storage driver. Please refer to
+# containers-storage.conf(5) to see all available storage options.
 storage_option = [
+	"overlay.mountopt=nodev",
 ]
 
-# The "crio.api" table contains settings for the kubelet/gRPC
-# interface (which is also used by crioctl).
+# The default log directory where all logs will go unless directly specified by
+# the kubelet. The log directory specified must be an absolute directory.
+log_dir = "/var/log/crio/pods"
+
+# Location for CRI-O to lay down the temporary version file.
+# It is used to check if crio wipe should wipe containers, which should
+# always happen on a node reboot
+version_file = "/var/run/crio/version"
+
+# Location for CRI-O to lay down the persistent version file.
+# It is used to check if crio wipe should wipe images, which should
+# only happen when CRI-O has been upgraded
+version_file_persist = "/var/lib/crio/version"
+
+# InternalWipe is whether CRI-O should wipe containers and images after a reboot when the server starts.
+# If set to false, one must use the external command 'crio wipe' to wipe the containers and images in these situations.
+internal_wipe = true
+
+# Location for CRI-O to lay down the clean shutdown file.
+# It is used to check whether crio had time to sync before shutting down.
+# If not found, crio wipe will clear the storage directory.
+clean_shutdown_file = "/var/lib/crio/clean.shutdown"
+
+# The crio.api table contains settings for the kubelet/gRPC interface.
 [crio.api]
 
-# listen is the path to the AF_LOCAL socket on which crio will listen.
+# Path to AF_LOCAL socket on which CRI-O will listen.
 listen = "/var/run/crio/crio.sock"
 
-# stream_address is the IP address on which the stream server will listen
-stream_address = ""
+# IP address on which the stream server will listen.
+stream_address = "127.0.0.1"
+
+# The port on which the stream server will listen. If the port is set to "0", then
+# CRI-O will allocate a random free port number.
+stream_port = "0"
+
+# Enable encrypted TLS transport of the stream server.
+stream_enable_tls = false
 
-# stream_port is the port on which the stream server will listen
-stream_port = "10010"
+# Length of time until open streams terminate due to lack of activity
+stream_idle_timeout = ""
 
-# file_locking is whether file-based locking will be used instead of
-# in-memory locking
-file_locking = true
+# Path to the x509 certificate file used to serve the encrypted stream. This
+# file can change, and CRI-O will automatically pick up the changes within 5
+# minutes.
+stream_tls_cert = ""
 
-# The "crio.runtime" table contains settings pertaining to the OCI
-# runtime used and options for how to set up and manage the OCI runtime.
+# Path to the key file used to serve the encrypted stream. This file can
+# change and CRI-O will automatically pick up the changes within 5 minutes.
+stream_tls_key = ""
+
+# Path to the x509 CA(s) file used to verify and authenticate client
+# communication with the encrypted stream. This file can change and CRI-O will
+# automatically pick up the changes within 5 minutes.
+stream_tls_ca = ""
+
+# Maximum grpc send message size in bytes. If not set or <=0, then CRI-O will default to 16 * 1024 * 1024.
+grpc_max_send_msg_size = 83886080
+
+# Maximum grpc receive message size. If not set or <= 0, then CRI-O will default to 16 * 1024 * 1024.
+grpc_max_recv_msg_size = 83886080
+
+# The crio.runtime table contains settings pertaining to the OCI runtime used
+# and options for how to set up and manage the OCI runtime.
 [crio.runtime]
 
-# runtime is the OCI compatible runtime used for trusted container workloads.
-# This is a mandatory setting as this runtime will be the default one
-# and will also be used for untrusted container workloads if
-# runtime_untrusted_workload is not set.
-runtime = "/usr/bin/runc"
-
-# runtime_untrusted_workload is the OCI compatible runtime used for untrusted
-# container workloads. This is an optional setting, except if
-# default_container_trust is set to "untrusted".
-runtime_untrusted_workload = ""
-
-# default_workload_trust is the default level of trust crio puts in container
-# workloads. It can either be "trusted" or "untrusted", and the default
-# is "trusted".
-# Containers can be run through different container runtimes, depending on
-# the trust hints we receive from kubelet:
-# - If kubelet tags a container workload as untrusted, crio will try first to
-# run it through the untrusted container workload runtime. If it is not set,
-# crio will use the trusted runtime.
-# - If kubelet does not provide any information about the container workload trust
-# level, the selected runtime will depend on the default_container_trust setting.
-# If it is set to "untrusted", then all containers except for the host privileged
-# ones, will be run by the runtime_untrusted_workload runtime. Host privileged
-# containers are by definition trusted and will always use the trusted container
-# runtime. If default_container_trust is set to "trusted", crio will use the trusted
-# container runtime for all containers.
-default_workload_trust = "trusted"
-
-# conmon is the path to conmon binary, used for managing the runtime.
-conmon = "/usr/bin/conmon"
-
-# conmon_env is the environment variable list for conmon process,
-# used for passing necessary environment variable to conmon or runtime.
+# A list of ulimits to be set in containers by default, specified as
+# "<ulimit name>=<soft limit>:<hard limit>", for example:
+# "nofile=1024:2048"
+# If nothing is set here, settings will be inherited from the CRI-O daemon
+default_ulimits = [
+]
+
+# If true, the runtime will not use pivot_root, but instead use MS_MOVE.
+no_pivot = false
+
+# decryption_keys_path is the path where the keys required for
+# image decryption are stored. This option supports live configuration reload.
+decryption_keys_path = "/etc/crio/keys/"
+
+# Path to the conmon binary, used for monitoring the OCI runtime.
+# Will be searched for using $PATH if empty.
+conmon = ""
+
+# Cgroup setting for conmon
+conmon_cgroup = "system.slice"
+
+# Environment variable list for the conmon process, used for passing necessary
+# environment variables to conmon or the runtime.
 conmon_env = [
 	"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
 ]
 
-# selinux indicates whether or not SELinux will be used for pod
-# separation on the host. If you enable this flag, SELinux must be running
-# on the host.
-selinux = false
+# Additional environment variables to set for all the
+# containers. These are overridden if set in the
+# container image spec or in the container runtime configuration.
+default_env = [
+]
 
-# seccomp_profile is the seccomp json profile path which is used as the
-# default for the runtime.
-seccomp_profile = "/etc/crio/seccomp.json"
+# If true, SELinux will be used for pod separation on the host.
+selinux = false
 
-# apparmor_profile is the apparmor profile name which is used as the
-# default for the runtime.
+# Path to the seccomp.json profile which is used as the default seccomp profile
+# for the runtime. If not specified, then the internal default seccomp profile
+# will be used. This option supports live configuration reload.
+seccomp_profile = ""
+
+# Changes the meaning of an empty seccomp profile. By default
+# (and according to CRI spec), an empty profile means unconfined.
+# This option tells CRI-O to treat an empty profile as the default profile,
+# which might increase security.
+seccomp_use_default_when_empty = false
+
+# Used to change the name of the default AppArmor profile of CRI-O. The default
+# profile name is "crio-default". This profile only takes effect if the user
+# does not specify a profile via the Kubernetes Pod's metadata annotation. If
+# the profile is set to "unconfined", then this equals to disabling AppArmor.
+# This option supports live configuration reload.
 apparmor_profile = "crio-default"
 
-# cgroup_manager is the cgroup management implementation to be used
-# for the runtime.
-cgroup_manager = "cgroupfs"
+# Path to the blockio class configuration file for configuring
+# the cgroup blockio controller.
+blockio_config_file = ""
+
+# Used to change irqbalance service config file path which is used for configuring
+# irqbalance daemon.
+irqbalance_config_file = "/etc/sysconfig/irqbalance"
+
+# Path to the RDT configuration file for configuring the resctrl pseudo-filesystem.
+# This option supports live configuration reload.
+rdt_config_file = ""
+
+# Cgroup management implementation used for the runtime.
+cgroup_manager = "systemd"
+
+# Specify whether the image pull must be performed in a separate cgroup.
+separate_pull_cgroup = ""
+
+# List of default capabilities for containers. If it is empty or commented out,
+# only the capabilities defined in the containers json file by the user/kube
+# will be added.
+default_capabilities = [
+	"CHOWN",
+	"DAC_OVERRIDE",
+	"FSETID",
+	"FOWNER",
+	"SETGID",
+	"SETUID",
+	"SETPCAP",
+	"NET_BIND_SERVICE",
+	"KILL",
+]
+
+# List of default sysctls. If it is empty or commented out, only the sysctls
+# defined in the container json file by the user/kube will be added.
+default_sysctls = [
+]
+
+# List of devices on the host that a
+# user can specify with the "io.kubernetes.cri-o.Devices" allowed annotation.
+allowed_devices = [
+	"/dev/fuse",
+]
+
+# List of additional devices. specified as
+# "<device-on-host>:<device-on-container>:<permissions>", for example: "--device=/dev/sdc:/dev/xvdc:rwm".
+# If it is empty or commented out, only the devices
+# defined in the container json file by the user/kube will be added.
+additional_devices = [
+]
+
+# Change the default behavior of setting container devices uid/gid from CRI's
+# SecurityContext (RunAsUser/RunAsGroup) instead of taking host's uid/gid.
+# Defaults to false.
+device_ownership_from_security_context = false
 
-# hooks_dir_path is the oci hooks directory for automatically executed hooks
-hooks_dir_path = "/usr/share/containers/oci/hooks.d"
+# Path to OCI hooks directories for automatically executed hooks. If one of the
+# directories does not exist, then CRI-O will automatically skip them.
+hooks_dir = [
+	"/usr/share/containers/oci/hooks.d",
+]
 
-# pids_limit is the number of processes allowed in a container
+# Path to the file specifying the defaults mounts for each container. The
+# format of the config is /SRC:/DST, one mount per line. Notice that CRI-O reads
+# its default mounts from the following two files:
+#
+#   1) /etc/containers/mounts.conf (i.e., default_mounts_file): This is the
+#      override file, where users can either add in their own default mounts, or
+#      override the default mounts shipped with the package.
+#
+#   2) /usr/share/containers/mounts.conf: This is the default file read for
+#      mounts. If you want CRI-O to read from a different, specific mounts file,
+#      you can change the default_mounts_file. Note, if this is done, CRI-O will
+#      only add mounts it finds in this file.
+#
+default_mounts_file = ""
+
+# Maximum number of processes allowed in a container.
 pids_limit = 1024
 
-# The "crio.image" table contains settings pertaining to the
-# management of OCI images.
+# Maximum sized allowed for the container log file. Negative numbers indicate
+# that no size limit is imposed. If it is positive, it must be >= 8192 to
+# match/exceed conmon's read buffer. The file is truncated and re-opened so the
+# limit is never exceeded.
+log_size_max = -1
+
+# Whether container output should be logged to journald in addition to the kuberentes log file
+log_to_journald = false
+
+# Path to directory in which container exit files are written to by conmon.
+container_exits_dir = "/var/run/crio/exits"
+
+# Path to directory for container attach sockets.
+container_attach_socket_dir = "/var/run/crio"
+
+# The prefix to use for the source of the bind mounts.
+bind_mount_prefix = ""
+
+# If set to true, all containers will run in read-only mode.
+read_only = false
+
+# Changes the verbosity of the logs based on the level it is set to. Options
+# are fatal, panic, error, warn, info, debug and trace. This option supports
+# live configuration reload.
+log_level = "info"
+
+# Filter the log messages by the provided regular expression.
+# This option supports live configuration reload.
+log_filter = ""
+
+# The UID mappings for the user namespace of each container. A range is
+# specified in the form containerUID:HostUID:Size. Multiple ranges must be
+# separated by comma.
+uid_mappings = ""
+
+# The GID mappings for the user namespace of each container. A range is
+# specified in the form containerGID:HostGID:Size. Multiple ranges must be
+# separated by comma.
+gid_mappings = ""
+
+# If set, CRI-O will reject any attempt to map host UIDs below this value
+# into user namespaces.  A negative value indicates that no minimum is set,
+# so specifying mappings will only be allowed for pods that run as UID 0.
+minimum_mappable_uid = -1
+
+# If set, CRI-O will reject any attempt to map host GIDs below this value
+# into user namespaces.  A negative value indicates that no minimum is set,
+# so specifying mappings will only be allowed for pods that run as UID 0.
+minimum_mappable_gid = -1
+
+# The minimal amount of time in seconds to wait before issuing a timeout
+# regarding the proper termination of the container. The lowest possible
+# value is 30s, whereas lower values are not considered by CRI-O.
+ctr_stop_timeout = 30
+
+# drop_infra_ctr determines whether CRI-O drops the infra container
+# when a pod does not have a private PID namespace, and does not use
+# a kernel separating runtime (like kata).
+# It requires manage_ns_lifecycle to be true.
+drop_infra_ctr = true
+
+# infra_ctr_cpuset determines what CPUs will be used to run infra containers.
+# You can use linux CPU list format to specify desired CPUs.
+# To get better isolation for guaranteed pods, set this parameter to be equal to kubelet reserved-cpus.
+infra_ctr_cpuset = ""
+
+# The directory where the state of the managed namespaces gets tracked.
+# Only used when manage_ns_lifecycle is true.
+namespaces_dir = "/var/run"
+
+# pinns_path is the path to find the pinns binary, which is needed to manage namespace lifecycle
+pinns_path = ""
+
+# default_runtime is the _name_ of the OCI runtime to be used as the default.
+# The name is matched against the runtimes map below. If this value is changed,
+# the corresponding existing entry from the runtimes map below will be ignored.
+default_runtime = "runc"
+
+# A list of paths that, when absent from the host,
+# will cause a container creation to fail (as opposed to the current behavior being created as a directory).
+# This option is to protect from source locations whose existence as a directory could jepordize the health of the node, and whose
+# creation as a file is not desired either.
+# An example is /etc/hostname, which will cause failures on reboot if it's created as a directory, but often doesn't exist because
+# the hostname is being managed dynamically.
+absent_mount_sources_to_reject = [
+]
+
+# The "crio.runtime.runtimes" table defines a list of OCI compatible runtimes.
+# The runtime to use is picked based on the runtime handler provided by the CRI.
+# If no runtime handler is provided, the runtime will be picked based on the level
+# of trust of the workload. Each entry in the table should follow the format:
+#
+#[crio.runtime.runtimes.runtime-handler]
+#  runtime_path = "/path/to/the/executable"
+#  runtime_type = "oci"
+#  runtime_root = "/path/to/the/root"
+#  privileged_without_host_devices = false
+#  allowed_annotations = []
+# Where:
+# - runtime-handler: name used to identify the runtime
+# - runtime_path (optional, string): absolute path to the runtime executable in
+#   the host filesystem. If omitted, the runtime-handler identifier should match
+#   the runtime executable name, and the runtime executable should be placed
+#   in $PATH.
+# - runtime_type (optional, string): type of runtime, one of: "oci", "vm". If
+#   omitted, an "oci" runtime is assumed.
+# - runtime_root (optional, string): root directory for storage of containers
+#   state.
+# - runtime_config_path (optional, string): the path for the runtime configuration
+#   file. This can only be used with when using the VM runtime_type.
+# - privileged_without_host_devices (optional, bool): an option for restricting
+#   host devices from being passed to privileged containers.
+# - allowed_annotations (optional, array of strings): an option for specifying
+#   a list of experimental annotations that this runtime handler is allowed to process.
+#   The currently recognized values are:
+#   "io.kubernetes.cri-o.userns-mode" for configuring a user namespace for the pod.
+#   "io.kubernetes.cri-o.cgroup2-mount-hierarchy-rw" for mounting cgroups writably when set to "true".
+#   "io.kubernetes.cri-o.Devices" for configuring devices for the pod.
+#   "io.kubernetes.cri-o.ShmSize" for configuring the size of /dev/shm.
+#   "io.kubernetes.cri-o.UnifiedCgroup.$CTR_NAME" for configuring the cgroup v2 unified block for a container.
+#   "io.containers.trace-syscall" for tracing syscalls via the OCI seccomp BPF hook.
+#   "io.kubernetes.cri.rdt-class" for setting the RDT class of a container
+
+
+[crio.runtime.runtimes.runc]
+runtime_path = ""
+runtime_type = "oci"
+runtime_root = "/run/runc"
+runtime_config_path = ""
+
+
+allowed_annotations = [
+	"io.containers.trace-syscall",
+]
+
+
+
+# crun is a fast and lightweight fully featured OCI runtime and C library for
+# running containers
+#[crio.runtime.runtimes.crun]
+
+# Kata Containers is an OCI runtime, where containers are run inside lightweight
+# VMs. Kata provides additional isolation towards the host, minimizing the host attack
+# surface and mitigating the consequences of containers breakout.
+
+# Kata Containers with the default configured VMM
+#[crio.runtime.runtimes.kata-runtime]
+
+# Kata Containers with the QEMU VMM
+#[crio.runtime.runtimes.kata-qemu]
+
+# Kata Containers with the Firecracker VMM
+#[crio.runtime.runtimes.kata-fc]
+
+# The workloads table defines ways to customize containers with different resources
+# that work based on annotations, rather than the CRI.
+# Note, the behavior of this table is EXPERIMENTAL and may change at any time.
+# Each workload, has a name, activation_annotation, annotation_prefix and set of resources it supports mutating.
+# The currently supported resources are "cpu" (to configure the cpu shares) and "cpuset" to configure the cpuset.
+# Each resource can have a default value specified, or be empty.
+# For a container to opt-into this workload, the pod should be configured with the annotation $activation_annotation (key only, value is ignored).
+# To customize per-container, an annotation of the form $annotation_prefix.$resource/$ctrName = "value" can be specified
+# signifying for that resource type to override the default value.
+# If the annotation_prefix is not present, every container in the pod will be given the default values.
+# Example:
+# [crio.runtime.workloads.workload-type]
+# activation_annotation = "io.crio/workload"
+# annotation_prefix = "io.crio.workload-type"
+# [crio.runtime.workloads.workload-type.resources]
+# cpuset = 0
+# cpushares = "0-1"
+# Where:
+# The workload name is workload-type.
+# To specify, the pod must have the "io.crio.workload" annotation (this is a precise string match).
+# This workload supports setting cpuset and cpu resources.
+# annotation_prefix is used to customize the different resources.
+# To configure the cpu shares a container gets in the example above, the pod would have to have the following annotation:
+# "io.crio.workload-type/$container_name = {"cpushares": "value"}"
+
+
+# The crio.image table contains settings pertaining to the management of OCI images.
+#
+# CRI-O reads its configured registries defaults from the system wide
+# containers-registries.conf(5) located in /etc/containers/registries.conf. If
+# you want to modify just CRI-O, you can change the registries configuration in
+# this file. Otherwise, leave insecure_registries and registries commented out to
+# use the system's defaults from /etc/containers/registries.conf.
 [crio.image]
 
-# default_transport is the prefix we try prepending to an image name if the
-# image name as we receive it can't be parsed as a valid source reference
+# Default transport for pulling images from a remote container storage.
 default_transport = "docker://"
 
-# pause_image is the image which we use to instantiate infra containers.
-pause_image = "kubernetes/pause"
+# The path to a file containing credentials necessary for pulling images from
+# secure registries. The file is similar to that of /var/lib/kubelet/config.json
+global_auth_file = ""
 
-# pause_command is the command to run in a pause_image to have a container just
-# sit there.  If the image contains the necessary information, this value need
-# not be specified.
+# The image used to instantiate infra containers.
+# This option supports live configuration reload.
+pause_image = "k8s.gcr.io/pause:3.6"
+
+# The path to a file containing credentials specific for pulling the pause_image from
+# above. The file is similar to that of /var/lib/kubelet/config.json
+# This option supports live configuration reload.
+pause_image_auth_file = ""
+
+# The command to run to have a container stay in the paused state.
+# When explicitly set to "", it will fallback to the entrypoint and command
+# specified in the pause image. When commented out, it will fallback to the
+# default: "/pause". This option supports live configuration reload.
 pause_command = "/pause"
 
-# signature_policy is the name of the file which decides what sort of policy we
-# use when deciding whether or not to trust an image that we've pulled.
-# Outside of testing situations, it is strongly advised that this be left
-# unspecified so that the default system-wide policy will be used.
+# Path to the file which decides what sort of policy we use when deciding
+# whether or not to trust an image that we've pulled. It is not recommended that
+# this option be used, as the default behavior of using the system-wide default
+# policy (i.e., /etc/containers/policy.json) is most often preferred. Please
+# refer to containers-policy.json(5) for more details.
 signature_policy = ""
 
-# image_volumes controls how image volumes are handled.
-# The valid values are mkdir and ignore.
-image_volumes = "mkdir"
-
-# insecure_registries is used to skip TLS verification when pulling images.
+# List of registries to skip TLS verification for pulling images. Please
+# consider configuring the registries via /etc/containers/registries.conf before
+# changing them here.
 insecure_registries = [
 ]
 
-# registries is used to specify a comma separated list of registries to be used
-# when pulling an unqualified image (e.g. fedora:rawhide).
-registries = ['docker.io', 'registry.fedoraproject.org', 'registry.access.redhat.com']
+# Controls how image volumes are handled. The valid values are mkdir, bind and
+# ignore; the latter will ignore volumes entirely.
+image_volumes = "mkdir"
+
+# Temporary directory to use for storing big files
+big_files_temporary_dir = ""
 
-# The "crio.network" table contains settings pertaining to the
-# management of CNI plugins.
+# The crio.network table containers settings pertaining to the management of
+# CNI plugins.
 [crio.network]
 
-# network_dir is is where CNI network configuration
-# files are stored.
+# The default CNI network name to be selected. If not set or "", then
+# CRI-O will pick-up the first one found in network_dir.
+# cni_default_network = ""
+
+# Path to the directory where CNI configuration files are located.
 network_dir = "/etc/cni/net.d/"
 
-# plugin_dir is is where CNI plugin binaries are stored.
-plugin_dir = "/opt/cni/bin"
+# Paths to directories where CNI plugin binaries are located.
+plugin_dirs = [
+	"/opt/cni/bin/",
+]
+
+# A necessary configuration for Prometheus based metrics retrieval
+[crio.metrics]
+
+# Globally enable or disable metrics support.
+enable_metrics = false
+
+# Specify enabled metrics collectors.
+# Per default all metrics are enabled.
+# It is possible, to prefix the metrics with "container_runtime_" and "crio_".
+# For example, the metrics collector "operations" would be treated in the same
+# way as "crio_operations" and "container_runtime_crio_operations".
+metrics_collectors = [
+	"operations",
+	"operations_latency_microseconds_total",
+	"operations_latency_microseconds",
+	"operations_errors",
+	"image_pulls_by_digest",
+	"image_pulls_by_name",
+	"image_pulls_by_name_skipped",
+	"image_pulls_failures",
+	"image_pulls_successes",
+	"image_pulls_layer_size",
+	"image_layer_reuse",
+	"containers_oom_total",
+	"containers_oom",
+	"processes_defunct",
+	"operations_total",
+	"operations_latency_seconds",
+	"operations_latency_seconds_total",
+	"operations_errors_total",
+	"image_pulls_bytes_total",
+	"image_pulls_skipped_bytes_total",
+	"image_pulls_failure_total",
+	"image_pulls_success_total",
+	"image_layer_reuse_total",
+	"containers_oom_count_total",
+]
+
+# The port on which the metrics server will listen.
+metrics_port = 9090
+
+# Local socket path to bind the metrics server to
+metrics_socket = ""
+
+# The certificate for the secure metrics server.
+# If the certificate is not available on disk, then CRI-O will generate a
+# self-signed one. CRI-O also watches for changes of this path and reloads the
+# certificate on any modification event.
+metrics_cert = ""
+
+# The certificate key for the secure metrics server.
+# Behaves in the same way as the metrics_cert.
+metrics_key = ""
+
+# A necessary configuration for OpenTelemetry trace data exporting
+[crio.tracing]
+
+# Globally enable or disable exporting OpenTelemetry traces.
+enable_tracing = false
+
+# Address on which the gRPC trace collector listens on.
+tracing_endpoint = "0.0.0.0:4317"
+
+# Number of samples to collect per million spans.
+tracing_sampling_rate_per_million = 0
+
+# Necessary information pertaining to container and pod stats reporting.
+[crio.stats]
+
+# The number of seconds between collecting pod and container stats.
+# If set to 0, the stats are collected on-demand instead.
+stats_collection_period = 0
+
-- 
2.37.1


