Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67ABEC636D4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 05:32:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.996.1676611969644503924
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 21:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=grw6ydyU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H5WkxF003676
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=WDNAjpS3N1543Zp4k869s7u8iwpZrWM7e+0rDfeG1rE=;
 b=grw6ydyUAE+yOaHXL57asyhXb1sb2vR1Ap10rAI2SueZGyltp9SpfnBJ7sVJXtFSshKr
 JnxP8S0AB0a/sebubRmTmSzjU0I2rXkfa9/6mQ7I2i1TLINlbTjQ9Q4kYnRFqmjyoYcf
 Zpgi7265ZDDr/P9Ew1Tufn/lLxaHwAIsGJJ4zBi/k2VtQZENo5VLrwS2LP9SQKmPKRzB
 2JImxcHiUsbPVH1UkV3rys1mw4PCcq2pRUd85cX9KjjGvt/UgxsL9l8p5JWDwmOy290Q
 EO+LnzyKL38O7hvhackII2U4f1st7GfR8pE/T/wbVYeSvGcA3NzLkCQa1v77+KISz8Er Kg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc1ks5q1-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvwXYmDLVbX9QuA/oYwWSx5No4qVCqe8tlQnQhigiw5fhb8Z509pKGIQvBqN/Gpp+Dwt9ZR60jG10FrCVbSJ3fCdvLYT6BSkeo2SspXjBTgoT7/BYZBzGBtMXpcXzT9SxqRdQUAUH9d2KiMk5vBc82T2d2mx7NdfiBCAIMHw4CyvxhTAtzLUscxmmtBw0oIIlaxp8JxMtS8te7rJrFRwGPYVOueM6jG/ys1KP2BuoO/XifcHIltHMSTWVfTLvGi0ULX2UN32d9Yh0As8810YE9ECP/UUkgvvxZXl2tx69O0x9Veq1U+cY5BtDaXzFo0Gd+ObRzsRckVtJIazwNEYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDNAjpS3N1543Zp4k869s7u8iwpZrWM7e+0rDfeG1rE=;
 b=Z9aBiiDowSoGo3yBLHG6qsdMJoozPkz7XoS4/4I5SdRG1uKq98AZXQoHGnqBkWSWX1Y0x0OWusoqaDLhY8e+kd1SRxvYpqKOdiO9JaKhlxLsHKrbo4LhUN+t7AhBGPKS7fT+RXS0jIJxnG4qeJrlW8XU4SU+wAqqijPeg/u9noZh78w3qCzZtHgkGsSMbxAlGRl2EhVkFPwSPGC5XIJIvbWbxGz/tZusDpTV6DZvZ/aMZQETcWRgPZcTkAeyYkFNJfURLMlosmmyCozyfnPZe5oMrjMdYEu5Zj52M9Rw01aegfP7rUAgCvBV3UdDziemvBN8RliYUtkF9wbzMOmelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 05:32:43 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 05:32:42 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 3/5] cri-o: update crio.conf to match the current version
Date: Thu, 16 Feb 2023 21:32:22 -0800
Message-Id: <20230217053224.3870-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230217053224.3870-1-Qi.Chen@windriver.com>
References: <20230217053224.3870-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e89dd2-38e6-4b35-005d-08db10a86408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c0c2FXkva41J+JOQHGmFwLBQJaGmg7dlAWLblRpulBVXH1192lPaWVT9BRBk90L7q7MLyD8NDccSGwN7DBKTra2g8GeZ36QePME7A2Q1yXo9hqa94dBTEXT/Qipp6C2jwxMgT1Uteaj7RiJ8VKMephKHXfIbHGFehmbMBg3s/La+xYKR1DblPFWEmUbZCnmOJYIX4Tg17X0tZShabtIuHzv2X98bE/omytcNy584f5Nf8uhDW9T8aeNkM3ab2wb3CwYr5l/WyUZ1COsKD3mGibdRBh+t6KLrfsfpLQs2loKPDxdFGYsIAXcq3Sgzm2Sg8kYoSM3DiASOqQwOCMSNuzi1SObUWeGgOppQglcyMDjxuoBAQ6K5QYxbpN2VCzcPdN2lBCle/Lgzdf9GR8dOdLTLveX106/gwX/jWWMUkQu0ngsxY4WKqKnWmZwHA9YPttoyRR7khZKqu59wCrIUEx+qJHXemRj9XvCUI/IsPF1KtazOsZEZ8fBzJ0dCe89Ix7V2SOlGxTNs/Wtwq2DHUir683IoN2WY6lYlHAnk+rZbg8nl/YwWf1tbUjQKERkjQ/P7Tdkgmo7cxM24Qdy1eeA7dntlJNa242aGcTDLX9xhVvT/NPuBYTRfWOAQu9yjFBqV8ESbZ4IXsyNg1Dkv2bZewmkUEUALUfGH+aKxYeuuWVz+hzs8JgApdqOTGBQwEmsknPrVCxJ+aRfAt2ILbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(451199018)(86362001)(8936002)(5660300002)(316002)(478600001)(41300700001)(66556008)(8676002)(66476007)(6916009)(36756003)(66946007)(26005)(1076003)(6506007)(186003)(2616005)(15650500001)(6666004)(6486002)(2906002)(38350700002)(30864003)(83380400001)(52116002)(6512007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tejJ6T+IgiPyyjNRl82ITm4zGAJzSEcUTPHTIHIei3lJvB1qEPp4FxNVla1G?=
 =?us-ascii?Q?eMeF/3UbKSjpN5pXpp1uOjDsVqQV02WGBd3qO0il3XkZsmITwO9u5F5pAx+e?=
 =?us-ascii?Q?7JX82yE3jqKWwTxYJCVi75X3hThB9Ircks43alNZ8sFUo19wEcY/Hmpc8qyp?=
 =?us-ascii?Q?TO/jRJ9XX5e3C65dYoOJCiEnijymCDJnEKH31Oa08RzWKXogjj9+czIlp8dg?=
 =?us-ascii?Q?NUbrFycBqJ2RkZ+30Jbe3ZjkImeChE+Wp1GnZTyYmFdOM20xKMpzU7QbT0NX?=
 =?us-ascii?Q?eFpQ2kpIQu2eUPGU/FdMng1q1FsLhVnqNOy1gNPT/XaoXV52k7/aOE+L6Hbx?=
 =?us-ascii?Q?ky5I/0ebVRQVK4yLHbde6E53KstTbcZqvncQqbVyITmEFFojdrYOT5Fz+Fpl?=
 =?us-ascii?Q?3TQrAyOunBuYUZ209N2kC41CeYupvB4uhZUf+bZoB0dFRdnbfWjg8M5SNtqM?=
 =?us-ascii?Q?Q0HPu93iK+JU73tbS1UyrViVpJw/41yoVYGyXq0qMYaQQxrfwMqlSU2DMDIZ?=
 =?us-ascii?Q?LTm47AlYrqlM5G/cyVY07T7PEP3NfPjNsoRqjTUmCj3seGA19YgTZpWI451U?=
 =?us-ascii?Q?xQ8LJvwhFGN95EGKNG4JouG+HWZpZWv2ydaE4o3CMKdHiQ86noJbpyOiFIS3?=
 =?us-ascii?Q?QQyVDoppSy3AbsqRk30oqdeRbZ/Trlra0pAdW+thdpwb2xTmwzKPjFJ1I3A5?=
 =?us-ascii?Q?DtlhLfePO2PrmzJ2QzNvoCAYhj9kRdndEKprmeWPlFzYc3/ew9Tj2j2okGYH?=
 =?us-ascii?Q?7H1GiqSvmvS2uhajIg3t7qXkCHT1rHMYLCRUSPnxiyXitAgkMHH9xtVsZhYS?=
 =?us-ascii?Q?yyrb5pA1am6ltGvQUE/QheMhae8RFrbtFYW441G/5u4U696TpK+xP5b6kUAa?=
 =?us-ascii?Q?/GJcL0FZxTJtOM2PvzUurefaSI37lkmwug6q9Mat4LN/mwWc2d8GPHHnwnyU?=
 =?us-ascii?Q?SURY7LFV0NOGNgNq20OpUFnftCgab4rRRVo0juP8HekJlW7WB+4dgbhDAIUQ?=
 =?us-ascii?Q?XLhc+fMiRpskrVVrISmIKOXVe+cIG1Zd/NYVMVJWaNcFgGq1xT2WiuY2yg4p?=
 =?us-ascii?Q?er08Wq5kh4nr21xTQL6fkFuS6jXhg4EFIsbj/SJwykJL/gl+lAuQAQcrJNkf?=
 =?us-ascii?Q?dxgI4Lb6exbQ0HoN5SMn0RXXu4VlSygI7YkfxGZuB/6aZbd1MvxQ4uLaTBju?=
 =?us-ascii?Q?bAiimbENwRpgcXfLcnBPYJBgO/UPn8Do8b3JgSpDa8ONOVxEKZxyCMIVj5ty?=
 =?us-ascii?Q?RzyA+kbxh8C+GAHkZwiL7sdLZCWtys4jWcWUu8jDJcCfSFQa90qtj0fNCUcX?=
 =?us-ascii?Q?8SHbKUks3z6JWb/jBlaIW7KMUZNubkSY7APRTNzQbanUWzQtLYdqCxtYcaqz?=
 =?us-ascii?Q?6JSFdL+j5SPHw3E2oeFVfAW7xxILwKr+Tqgvko/P6qYQ4FdNAwoaU3BoDSLc?=
 =?us-ascii?Q?R5NOCBtuGuAPODb8pYkxrcLyMLBpbt8605AmeV+siYm6L2UgdegiZ4HGTpfU?=
 =?us-ascii?Q?4LgcbiikkAJ5bA3jZcHYl+eBE6E3JRNfBRFc/HYyuI5jC8HidZZ4FU/CcujC?=
 =?us-ascii?Q?hOW2DxsmTRIRpBOS1d7XN8ZEIMoOLQaDWZq6mVl7fz5HuEFA1G84AE9KKSs9?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e89dd2-38e6-4b35-005d-08db10a86408
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 05:32:42.3741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CK4P1XoN1eveqd24STFsljYlS3AXFGmA7AFHzkJrjSRHvU5Mhf8hwIKYbHzhKkZMl2WW5MWetbm5EECqV1il+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-Proofpoint-GUID: 5zZ0h3XGzO_5JVPpY5DieeU68srLi8Pu
X-Proofpoint-ORIG-GUID: 5zZ0h3XGzO_5JVPpY5DieeU68srLi8Pu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_02,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7863

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
 recipes-containers/cri-o/files/crio.conf | 623 +++++++++++++++++++----
 1 file changed, 525 insertions(+), 98 deletions(-)

diff --git a/recipes-containers/cri-o/files/crio.conf b/recipes-containers/cri-o/files/crio.conf
index 899d255..84472d8 100644
--- a/recipes-containers/cri-o/files/crio.conf
+++ b/recipes-containers/cri-o/files/crio.conf
@@ -1,146 +1,573 @@
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
+# Storage driver used to manage the storage of images and containers. Please
+# refer to containers-storage.conf(5) to see all available storage drivers.
 storage_driver = ""
 
-# storage_option is used to pass an option to the storage driver.
+# List to pass options to the storage driver. Please refer to
+# containers-storage.conf(5) to see all available storage options.
 storage_option = [
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
+version_file_persist = ""
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
+
+# Length of time until open streams terminate due to lack of activity
+stream_idle_timeout = ""
 
-# stream_port is the port on which the stream server will listen
-stream_port = "10010"
+# Path to the x509 certificate file used to serve the encrypted stream. This
+# file can change, and CRI-O will automatically pick up the changes within 5
+# minutes.
+stream_tls_cert = ""
 
-# file_locking is whether file-based locking will be used instead of
-# in-memory locking
-file_locking = true
+# Path to the key file used to serve the encrypted stream. This file can
+# change and CRI-O will automatically pick up the changes within 5 minutes.
+stream_tls_key = ""
 
-# The "crio.runtime" table contains settings pertaining to the OCI
-# runtime used and options for how to set up and manage the OCI runtime.
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
+# This option is currently deprecated, and will be replaced with RuntimeHandler.MonitorEnv.
+conmon = ""
+
+# Cgroup setting for conmon
+# This option is currently deprecated, and will be replaced with RuntimeHandler.MonitorCgroup.
+conmon_cgroup = ""
+
+# Environment variable list for the conmon process, used for passing necessary
+# environment variables to conmon or the runtime.
+# This option is currently deprecated, and will be replaced with RuntimeHandler.MonitorEnv.
 conmon_env = [
-	"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
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
+seccomp_use_default_when_empty = true
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
 
-# hooks_dir_path is the oci hooks directory for automatically executed hooks
-hooks_dir_path = "/usr/share/containers/oci/hooks.d"
+# List of default sysctls. If it is empty or commented out, only the sysctls
+# defined in the container json file by the user/kube will be added.
+default_sysctls = [
+]
 
-# pids_limit is the number of processes allowed in a container
-pids_limit = 1024
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
 
-# The "crio.image" table contains settings pertaining to the
-# management of OCI images.
+# List of directories to scan for CDI Spec files.
+cdi_spec_dirs = [
+	"/etc/cdi",
+	"/var/run/cdi",
+]
+
+# Change the default behavior of setting container devices uid/gid from CRI's
+# SecurityContext (RunAsUser/RunAsGroup) instead of taking host's uid/gid.
+# Defaults to false.
+device_ownership_from_security_context = false
+
+# Path to OCI hooks directories for automatically executed hooks. If one of the
+# directories does not exist, then CRI-O will automatically skip them.
+hooks_dir = [
+	"/usr/share/containers/oci/hooks.d",
+]
+
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
+# This option is deprecated. The Kubelet flag '--pod-pids-limit' should be used instead.
+pids_limit = 0
+
+# Maximum sized allowed for the container log file. Negative numbers indicate
+# that no size limit is imposed. If it is positive, it must be >= 8192 to
+# match/exceed conmon's read buffer. The file is truncated and re-opened so the
+# limit is never exceeded. This option is deprecated. The Kubelet flag '--container-log-max-size' should be used instead.
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
+# - monitor_exec_cgroup (optional, string): if set to "container", indicates exec probes
+#   should be moved to the container's cgroup
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
+monitor_path = ""
+
+monitor_env = [
+	"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
+]
+
+monitor_cgroup = "system.slice"
+monitor_exec_cgroup = ""
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
+
+# The image used to instantiate infra containers.
+# This option supports live configuration reload.
+pause_image = "registry.k8s.io/pause:3.6"
 
-# pause_command is the command to run in a pause_image to have a container just
-# sit there.  If the image contains the necessary information, this value need
-# not be specified.
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


