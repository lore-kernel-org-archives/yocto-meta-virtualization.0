Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.58])
 by mx.groups.io with SMTP id smtpd.web12.11177.1634656392666527451
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 08:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yt8NHhRc;
 spf=pass (domain: arm.com, ip: 40.107.7.58, mailfrom: kamil.dziezyk@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmvcOAwGZMewoN9//hcYXeg4KAGwS1Ec2VwKA31HGVo=;
 b=yt8NHhRcxNsFU4EIXi9OLjCXKMpcKOzooyMOm5PvA0q4R6ShYW9frGj+HaFeNsONptJ8ng/Mum9y2gYTrfhQKuvqbV/1D3jFCTFRTBk0US3bs2Bzh5z12r5PqIZ9mxW+Ji//ei7UAcA6QgqFdpoQeGkU5n+IjAr8421+QwmnCNQ=
Received: from AM7PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:20b:100::11)
 by AM0PR08MB4356.eurprd08.prod.outlook.com (2603:10a6:208:13f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 15:13:05 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::22) by AM7PR02CA0001.outlook.office365.com
 (2603:10a6:20b:100::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 15:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.yoctoproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.yoctoproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 15:13:02 +0000
Received: ("Tessian outbound d5def7722ff7:v103"); Tue, 19 Oct 2021 15:13:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7a76463038ccea2e
X-CR-MTA-TID: 64aa7808
Received: from 3546f389071e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0AF1CECB-26B1-48E0-A313-CEE8C7AB9DC0.1;
	Tue, 19 Oct 2021 15:12:56 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3546f389071e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 19 Oct 2021 15:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V++jw5HrX8HfKl54oQe21kEXxfhBqDjxPwn1Pz4Uaz1Un0/Akqp7ss4yf0omuQjeHXQYTd9Kaox/3NFAy6vkGp9qWN5BMyQw7f17z0bvZe8sR11VT0lAMXrIhQGqbgTOjJC6IEnJTiltxhTNHsv6X4l3pngDw+8MLPZOn8m9MRtWDgXs/ldOg/cgUPwTWEnd8LPMEvT4veyF1K81Io0r1XWq7aEwfsjk+ErazKgHI8v+CWd9seo2Ule4QCC6WoKWSVaejBNOT98YIt5apRU4s3vs5nad+uNOio/lkONPefSiaY7MEAvi2myfKnHPFvOOosMoZW1vguXa5yh/4O86xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmvcOAwGZMewoN9//hcYXeg4KAGwS1Ec2VwKA31HGVo=;
 b=RDmd+0HwMQTlCGUnx7Fsqox7EVhtH0/JH2MQdhejeq2mpgHcsNJQHKKfkxfmEysJ2q+v13282xU4fN9d/09di5epTrk991CAInPd2yO3rSTP8dTwwhohAy1BAdZfJGfUkxR1yVk2qeKtzOsLPlYrKrHqJ92FB5TmhSihnuqvmPfhtNlIN/T4D4/fcTxZVoBtb25hjjd3CTPzd4eQoPxd5wpRwEKGXbld1aG0gke8ckn3nRXyEwX5c0tB8zupwwR6f7QMFxn7vrfpNVSnquR6fn6ylGeJq8Ve+fYk0zVWokREZtW3a7bfEWW1TOut0i0CQVFP7byHZbyYJHK8tJOWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmvcOAwGZMewoN9//hcYXeg4KAGwS1Ec2VwKA31HGVo=;
 b=yt8NHhRcxNsFU4EIXi9OLjCXKMpcKOzooyMOm5PvA0q4R6ShYW9frGj+HaFeNsONptJ8ng/Mum9y2gYTrfhQKuvqbV/1D3jFCTFRTBk0US3bs2Bzh5z12r5PqIZ9mxW+Ji//ei7UAcA6QgqFdpoQeGkU5n+IjAr8421+QwmnCNQ=
Authentication-Results-Original: lists.yoctoproject.org; dkim=none (message
 not signed) header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com (2603:10a6:10:f3::13)
 by DBBPR08MB5916.eurprd08.prod.outlook.com (2603:10a6:10:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 15:12:54 +0000
Received: from DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::985a:674:337f:5b70]) by DBBPR08MB4696.eurprd08.prod.outlook.com
 ([fe80::985a:674:337f:5b70%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 15:12:54 +0000
From: "Kamil Dziezyk" <kamil.dziezyk@arm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [meta-virtualization][PATCH 1/2] k3s: Update k3s service configuration
Date: Tue, 19 Oct 2021 17:12:11 +0200
Message-Id: <20211019151212.23410-1-kamil.dziezyk@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::12) To DBBPR08MB4696.eurprd08.prod.outlook.com
 (2603:10a6:10:f3::13)
MIME-Version: 1.0
Received: from e120195-lin.arm.com (217.140.99.251) by LO4P123CA0367.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18e::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 15:12:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ab3c90a-f164-4a01-83c7-08d99312f1d9
X-MS-TrafficTypeDiagnostic: DBBPR08MB5916:|AM0PR08MB4356:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB435612029BDB7B8E57C66CADFDBD9@AM0PR08MB4356.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 k+S/ZvNKiEi3D90iJKOBBydRSi7/ga8ORHO0oirt8ae6n1LNnqDgz7qPHc4tXNyts1x4WrvhKIQ882vsv3KM8Q0Fv/AIBWCaynT1OGm+wllTcp1h/Mno2RbAB3EDHcYthJ0XVqTZWSeZLX1lFeC3AsZxXPBJGizymmCsDm/eTjf0Zh7ieqDvKotliPuZqLuWcaKkEJly82x5Pd/PE3ZOJpBrJLaKnaozQlrmL0abCk+NLIYGXueAuY9jq2dfMHsFiTqauF1nEmAx72jSrv9ndEuWCimNj9RB6J6vXN7CjjUC4DBhuoC82U/RRuI0MjKjnKCilNEEPcbvap/TmvlwuclXbmyprB+31HtEvbbh5BP53RIjMn3Zbj3wkVl1brnsf6LO/xFIEwd0jOvOAps8m1nFeaaeW7oz54ZgmEyv4oF7Si0MeG3u75c9Fj58aIxL2ikLS5MxtJyrqoYyXv65Zji6lkp4AryBTDQoPkll1pVJx6n3T+tGj9rP2jV1GP7/xnxeROpcDf2Qcp8cHIAptlCVqJArZ71TwKt3U/5+JyAI8ioXPpYkRHzSP5EYrU6YA7EaXQLEDzAyJra/gMhKnq3PijLDJHvv/pZ5i7/e1AIWaCrdrQdbH7qxHGGTqvN5X72Cjbt7fK4K3CL0CVAiILRsvp9BY/xQg4Qu6y9uUlsV2eQoYPOPOwKoLeQWd4BGBjCylybrwEHhge1VxqObU5ux0yON/7I1D3L85MMsO1UbvwlT3CoGhN6eqFoHu386qk0y0cl2Dy/6c0SuEWEwG7xvcEgj7dkCOz/ZrTD9kfN2laxSNbtFVg1G7Czp0en9
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(36756003)(316002)(44832011)(966005)(6916009)(83380400001)(956004)(7696005)(38100700002)(26005)(4326008)(38350700002)(2616005)(66476007)(6666004)(6486002)(2906002)(8936002)(5660300002)(66946007)(15650500001)(66556008)(186003)(8676002)(1076003)(52116002)(86362001)(42413004);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5916
Original-Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Kamil.Dziezyk@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3b96d153-b30a-4db0-1810-08d99312ec70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F8TbeY0vnZ2T8nwRXcumB2ZY3ryjJcwVPNl3SBHq+GXV/YrtN1uwzN5iSmbaDHkQoVpvvndnlmb70WG+CbzA0Wsn6YsCm0b8HoXeHzFPPJRwM0ngFpzmmCxqQFdE6/8TxY4aOGY59fbdxB+Dus3b9FMjBQK7bnrTTfM5uFfVyC7AmnYGGQEzVkbqgjnOYTWgGHC2yla2g+Ca0Z+yAeg9AtETdsViLD6tW3oRxByGR3t2mUOADXNJDqTvWW9wWJg7BeEyPzJE5N0yKP/qZpqJjNuMXiJRhMJ0eU8RttlTa0kMj88w+2Y9GDr7rK1xBdPQN19RmIjwhzIp3WXLjTo8agpIu247y/yQwMRmwr3OMw6b1ZKBwL5M+WCthOtkFsVb5W0P9LaZLBUf7IioAZr5/dmXytM9xo2AZuOFVgtp4++pmOLVSEIxOAWPfcl29xoQInEo2JkDYw9zs3BZAGIA+2BiyrHIsNZ028m/MhnwE3pjeXyvpdPUolJBSMInHY+Z2rZTqKtqVEU1msAnsqgbotlJ4LUdnKsEMab0XLGIdmtA5RnV8fp9TQXCAWyMwPDHKZNPnT1UnmvUCrlMIqM7KphtfPz6Se+JWxxgFnATfI2NXWJDAHobGCozzIbkiDQ2bmF6wckA+2+rtBLwWZF0cEPom2EXtMBEPYliQweyKqz8VGHB3uPN6S7S/VYdMWcqmJi+mWl+eUYetlM0Aq//W0gYE5f5T6+okmys48y2sqyFhUpqtvwKGwDHBpCFvF1ySDgLC4gLua2Oid8kNvCCNzwI81xJb6izZMrrAm7NsNXMjttCklg6dGOPnb+ueinc
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(186003)(508600001)(1076003)(336012)(36756003)(356005)(81166007)(2616005)(70206006)(4326008)(47076005)(6486002)(8676002)(82310400003)(83380400001)(2906002)(70586007)(44832011)(6916009)(966005)(86362001)(36860700001)(956004)(7696005)(15650500001)(26005)(8936002)(6666004)(316002)(42413004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 15:13:02.4796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab3c90a-f164-4a01-83c7-08d99312f1d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4356
Content-Type: text/plain

Update k3s.service with the latest changes from install.sh script.
Add k3s-killall.sh script to stop all of the K3s containers and reset
the containerd state.

The killall script cleans up containers, K3s directories, and networking
components while also removing the iptables chain with all the associated
rules. The cluster data will not be deleted.

Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
Change-Id: If1794367cabfc18fc8e3ecaf26badd4d0bc25114
---
 recipes-containers/k3s/k3s/k3s-killall.sh | 82 +++++++++++++++++++++++
 recipes-containers/k3s/k3s/k3s.service    | 12 +++-
 recipes-containers/k3s/k3s_git.bb         |  2 +
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/k3s/k3s/k3s-killall.sh

diff --git a/recipes-containers/k3s/k3s/k3s-killall.sh b/recipes-containers/k3s/k3s/k3s-killall.sh
new file mode 100644
index 0000000..9e72615
--- /dev/null
+++ b/recipes-containers/k3s/k3s/k3s-killall.sh
@@ -0,0 +1,82 @@
+#!/bin/sh
+
+# Based on: k3s-killall.sh installed when running Rancher Lab's K3S install.sh
+# In open-source project: https://github.com/k3s-io/k3s
+#
+# Original file: Copyright (c) 2021 Rancher Labs and Contributors.
+# Modifications: Copyright (c) 2021 Arm Limited and Contributors. All rights reserved.
+#
+# Modifications:
+# - Change systemd service directory location
+# - Fix PID parsing to run on core image
+# - Remove service stopping code (as this is intended to run as part of service
+#   stop)
+# - Changes to resolve warnings from the ShellCheck static analysis tool
+#
+# SPDX-License-Identifier: Apache License 2.0
+
+[ "$(id -u)" -eq 0 ] || exec sudo "$0" "$@"
+
+for bin in /var/lib/rancher/k3s/data/**/bin/; do
+    [ -d "$bin" ] && export PATH=$PATH:$bin:$bin/aux
+done
+
+set -x
+
+pschildren() {
+    ps -e -o ppid= -o pid= | sed -e 's/^\s*//g; s/\s\s*/\t/g;' | grep -w "^$1" | cut -f2
+}
+
+pstree() {
+    for pid in "$@"; do
+        echo "$pid"
+        for child in $(pschildren "$pid"); do
+            pstree "$child"
+        done
+    done
+}
+
+killtree() {
+    while read -r pid; do
+        if [ -n "${pid}" ]; then
+                kill -9 "${pid}" 2>/dev/null
+        fi
+    done <<EOF
+$({ set +x; } 2>/dev/null; pstree "$@"; set -x;)
+EOF
+}
+
+getshims() {
+    ps -e -o pid= -o args= | sed -e 's/^ *//; s/\s\s*/\t/;' | grep -w '[^/]*/bin/containerd-shim' | cut -f1
+}
+
+killtree "$({ set +x; } 2>/dev/null; getshims; set -x)"
+
+# shellcheck disable=SC2016
+do_unmount_and_remove() {
+    set +x
+    while read -r _ path _; do
+        case "$path" in $1*) echo "$path" ;; esac
+    done < /proc/self/mounts | sort -r | xargs -r -t -n 1 sh -c 'umount "$0" && rm -rf "$0"'
+    set -x
+}
+
+do_unmount_and_remove '/run/k3s'
+do_unmount_and_remove '/var/lib/rancher/k3s'
+do_unmount_and_remove '/var/lib/kubelet/pods'
+do_unmount_and_remove '/var/lib/kubelet/plugins'
+do_unmount_and_remove '/run/netns/cni-'
+
+# Remove CNI namespaces
+ip netns show 2>/dev/null | grep cni- | xargs -r -t -n 1 ip netns delete
+
+# Delete network interface(s) that match 'master cni0'
+ip link show 2>/dev/null | grep 'master cni0' | while read -r _ iface _; do
+    iface=${iface%%@*}
+    [ -z "$iface" ] || ip link delete "$iface"
+done
+ip link delete cni0
+ip link delete flannel.1
+ip link delete flannel-v6.1
+rm -rf /var/lib/cni/
+iptables-save | grep -v KUBE- | grep -v CNI- | iptables-restore
diff --git a/recipes-containers/k3s/k3s/k3s.service b/recipes-containers/k3s/k3s/k3s.service
index 34c7a80..33d3ee7 100644
--- a/recipes-containers/k3s/k3s/k3s.service
+++ b/recipes-containers/k3s/k3s/k3s.service
@@ -4,12 +4,17 @@ Description=Lightweight Kubernetes
 Documentation=https://k3s.io
 Requires=containerd.service
 After=containerd.service
+After=network-online.target
+Wants=network-online.target
 
 [Install]
 WantedBy=multi-user.target
 
 [Service]
 Type=notify
+EnvironmentFile=-/etc/default/%N
+EnvironmentFile=-/etc/sysconfig/%N
+EnvironmentFile=-/etc/systemd/system/k3s.service.env
 KillMode=process
 Delegate=yes
 # Having non-zero Limit*s causes performance problems due to accounting overhead
@@ -21,7 +26,12 @@ TasksMax=infinity
 TimeoutStartSec=0
 Restart=always
 RestartSec=5s
+ExecStartPre=/bin/sh -xc '! systemctl is-enabled --quiet nm-cloud-setup.service'
 ExecStartPre=-/sbin/modprobe br_netfilter
 ExecStartPre=-/sbin/modprobe overlay
 ExecStart=/usr/local/bin/k3s server
-
+# Avoid any delay due to this service when the system is rebooting or shutting
+# down by using the k3s-killall.sh script to kill all of the running k3s
+# services and containers
+ExecStopPost=/bin/sh -c "if systemctl is-system-running | grep -i \
+                           'stopping'; then /usr/local/bin/k3s-killall.sh; fi"
diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index 5971dde..0300fc3 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.22;name=k3s \
            file://k3s-clean \
            file://cni-containerd-net.conf \
            file://0001-Finding-host-local-in-usr-libexec.patch;patchdir=src/import \
+           file://k3s-killall.sh \
           "
 SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
 SRCREV_k3s = "737f722315b9832e9180fa232253d28ae1f2272f"
@@ -60,6 +61,7 @@ do_install() {
         # ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/ctr"
         ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/kubectl"
         install -m 755 "${WORKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
+        install -m 755 "${WORKDIR}/k3s-killall.sh" "${D}${BIN_PREFIX}/bin"
 
         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
                 install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
-- 
2.17.1

