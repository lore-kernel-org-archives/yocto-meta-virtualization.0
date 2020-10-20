Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.77])
 by mx.groups.io with SMTP id smtpd.web11.1749.1603177186657861952
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 23:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EvUeKc0/;
 spf=pass (domain: windriver.com, ip: 40.107.100.77, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cr2J1rgIVhmfkObsmF/DynI7gGO++TZWEFoO5x2eOw96bSwHgNXJDEJSfCeH7ce+5lQntr1r4YaVxHxqBYOvqBltkF0pfn9psrIvo9hvopzzob6vClg8bbxwrzIjhYWs8yzy+I/B4OVozjgC8HVf1Qe3Dzw1dY2UJ2rAKQhJazgoK/VneOm7caUDxupZjxxdalVp7gxUEptNrdoJBoICabPkXA2Yhdbh0hScmdo/8pQKWzQu9Wz+kL3HB0xXCDTZ+mmXFjeOoUyl83B9eGkXIigSeqdXacoZK/bcLCl4FnKLoY2Yl9DfKwGvy97H9JAP6ubSXvamvtl7/xhu8BOlaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeIHmcc8hTcvq8/VG6dRM47ThgnO9J5hu1nnmoxPXc4=;
 b=NkvsLP4DTlPb8rkNAtmQ5n6ujbJfvfZSLeDLcf8vazIfJksMDgtRrTw8934Y1lQ8Z1KLiXrelJYyJc5q4D8WiRiVW7aa/nMMg8AlqNfg4F78yNsTemgfxd3frXBDs2a5ZK3vvqEZdFGRIu0fA04G+LiI33PjKwvRucfhHm7ZH9M+7EPIIyKx8InL6WJwubdgxiOAD2dst88FrxVSSZhtoXrtCwqOvCQBz2pK3wxzQRvAYpqJYpDqI9N3jsDQS4L6YLqgVLiNc0ybwQmoqvIiqlUiGNWABzl2HKhLOZMm8NXl/0yp4fZSwMdeJZZEG1wu9DOfT3pO+CExYl+D6cLPww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeIHmcc8hTcvq8/VG6dRM47ThgnO9J5hu1nnmoxPXc4=;
 b=EvUeKc0/IPMBRgaKAeRdcKwLyl1qY+AuhDueERzqBYmQr7qkGupDJm8263bYkLjMgoqBk5JO1ixF/4Ml4jE/+z9ZIgsv+IsuZy+OUl1gWdI+nMw8iewHG/s64d70gGoPBqyqmEpFoLp5YHWnuYkDAIQ4K3lqtNmgVp+xP4dkF+M=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 06:59:43 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4%5]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 06:59:43 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] openvswitch: use /run instead of /var/run in systemd service file
Date: Tue, 20 Oct 2020 14:59:28 +0800
Message-Id: <20201020065928.19256-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0008.apcprd04.prod.outlook.com
 (2603:1096:202:2::18) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0401CA0008.apcprd04.prod.outlook.com (2603:1096:202:2::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 06:59:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a04ee7-6d31-4b31-7b93-08d874c5b8fc
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5053561B930F00945BD56C36ED1F0@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+U8l64CaAt6jynUvCCmAGGtAlF0YChp9Zumyj28Kg73xAO8seNRxoE8nIOwXDKWrU1x/PB2rGpQvxuePpcHCU+bga3tssrt3BtOPyBBKFvjYGbQTB6icsW/blWFdmPi6VqT+ZLzlmHefoixRVPKqhr2fSC6ZN4L1Ifw7CrdmZ39BRrube4TusD4zcAsxWisY5fU33TQtROkK6Y3mIO5n1wEW8TKvq1zbpRUL84wr2BU0yXsksGzVyvE8TQazNE1F+mgS++DcM9aFsNhxen/u2GtINQhxuIoNH9x1po78FwMI9zVMIfXVPjnLNhC6nMJQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(8936002)(52116002)(5660300002)(6506007)(2906002)(8676002)(316002)(83380400001)(6666004)(6512007)(186003)(66556008)(66476007)(26005)(36756003)(66946007)(86362001)(1076003)(478600001)(956004)(6486002)(6916009)(16526019)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bWGRMEi9VIRMjqsnW49r53Fj6xPcFCJsRFdNJ5Rs/WgfnRC3dSXec6/xHFIon5AyTfxOxr/JgHVUqMNiuTWgK4s38buTHzPg3XXI5qb7IsWD+Vi0rxjwo6nZ7J97uJibHvgCyVoGNjeswoXcBiiHDbJz33b/h/NH6mNxzT9RxkyguFG/49Nj1yYYpD/vxJlJZ8jIoL34YqukhFvy8vgtvbaeY9GyQSKvMcPxGv5Ez0+YqBSMmC0YxJrB9spXs4kSmp5+IQzoVV8DJNAk7xtCNCWCpQ+Y1ZtlZJVYgFjoEwBPY6OmiId8dVKcbDxkMqcTUFSTP9GG/N7evXpI1YpY+hy8OVxOb7FNM43GiLQLdE5DXeys+Ulppk5Cx2Y+LcCBJwoeAshSLb5wXYREv0B6pjcCGMkhFyAaacu5DeSFHoaYchSAji3fzl5cmg4CkSw56sxvsoxarUav3EIdjngFkqdnpr+xoTSjXTPVHxcq8p2BPQL+H+IfI02TcdxwkodrlWY7npcpNC581mjoPfwphYw9kqnGwT1f0fL69es90bNUs/ae2pk1sRClG1MMz95R8iXrp7pJqHcoFtGakzPBd78mhK6ux2mWMLugilM8prKp1Xdz/ttJzNjmtGSE2UAULQr7tNJGRttDdvVUz+4lrQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a04ee7-6d31-4b31-7b93-08d874c5b8fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 06:59:43.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guCuWEqLxqaOxWa9h158fiknu3vq4dqEChVHrr7rP3R/rjnBAGZ90S89jTWB4H61m8Z5NUyFuJxp7J73MgvKLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...tead-of-var-run-for-in-systemd-units.patch | 102 ++++++++++++++++++
 .../openvswitch/openvswitch_git.bb            |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch

diff --git a/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
new file mode 100644
index 0000000..244a216
--- /dev/null
+++ b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
@@ -0,0 +1,102 @@
+From ea98129777784b0e750a20078f01093dbdbe7b9b Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 20 Oct 2020 14:14:06 +0800
+Subject: [PATCH] ovs: use /run instead of /var/run for in systemd units
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ rhel/etc_logrotate.d_openvswitch                            | 4 ++--
+ rhel/usr_lib_systemd_system_openvswitch-ipsec.service       | 2 +-
+ ...sr_lib_systemd_system_ovs-delete-transient-ports.service | 2 +-
+ rhel/usr_lib_systemd_system_ovs-vswitchd.service.in         | 6 +++---
+ rhel/usr_lib_systemd_system_ovsdb-server.service            | 6 +++---
+ 5 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/rhel/etc_logrotate.d_openvswitch b/rhel/etc_logrotate.d_openvswitch
+index f4302ffbc..c0f476744 100644
+--- a/rhel/etc_logrotate.d_openvswitch
++++ b/rhel/etc_logrotate.d_openvswitch
+@@ -13,8 +13,8 @@
+     missingok
+     postrotate
+         # Tell Open vSwitch daemons to reopen their log files
+-        if [ -d /var/run/openvswitch ]; then
+-            for ctl in /var/run/openvswitch/*.ctl; do
++        if [ -d /run/openvswitch ]; then
++            for ctl in /run/openvswitch/*.ctl; do
+                 ovs-appctl -t "$ctl" vlog/reopen 2>/dev/null || :
+             done
+         fi
+diff --git a/rhel/usr_lib_systemd_system_openvswitch-ipsec.service b/rhel/usr_lib_systemd_system_openvswitch-ipsec.service
+index d8f47af68..92dad44f9 100644
+--- a/rhel/usr_lib_systemd_system_openvswitch-ipsec.service
++++ b/rhel/usr_lib_systemd_system_openvswitch-ipsec.service
+@@ -5,7 +5,7 @@ After=openvswitch.service
+ 
+ [Service]
+ Type=forking
+-PIDFile=/var/run/openvswitch/ovs-monitor-ipsec.pid
++PIDFile=/run/openvswitch/ovs-monitor-ipsec.pid
+ ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
+                     --ike-daemon=libreswan start-ovs-ipsec
+ ExecStop=/usr/share/openvswitch/scripts/ovs-ctl stop-ovs-ipsec
+diff --git a/rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service b/rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service
+index 4cd4d7f57..d4d7b204b 100644
+--- a/rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service
++++ b/rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service
+@@ -2,7 +2,7 @@
+ Description=Open vSwitch Delete Transient Ports
+ After=ovsdb-server.service
+ Before=ovs-vswitchd.service
+-AssertPathExists=/var/run/openvswitch/db.sock
++AssertPathExists=/run/openvswitch/db.sock
+ 
+ [Service]
+ Type=oneshot
+diff --git a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
+index f88b57cae..82748bf2d 100644
+--- a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
++++ b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
+@@ -4,14 +4,14 @@ After=ovsdb-server.service network-pre.target systemd-udev-settle.service
+ Before=network.target network.service
+ Requires=ovsdb-server.service
+ ReloadPropagatedFrom=ovsdb-server.service
+-AssertPathIsReadWrite=/var/run/openvswitch/db.sock
++AssertPathIsReadWrite=/run/openvswitch/db.sock
+ PartOf=openvswitch.service
+ 
+ [Service]
+ Type=forking
+-PIDFile=/var/run/openvswitch/ovs-vswitchd.pid
++PIDFile=/run/openvswitch/ovs-vswitchd.pid
+ Restart=on-failure
+-Environment=XDG_RUNTIME_DIR=/var/run/openvswitch
++Environment=XDG_RUNTIME_DIR=/run/openvswitch
+ EnvironmentFile=/etc/openvswitch/default.conf
+ EnvironmentFile=-/etc/sysconfig/openvswitch
+ EnvironmentFile=-/run/openvswitch.useropts
+diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
+index 69b0bf61a..5f83f281f 100644
+--- a/rhel/usr_lib_systemd_system_ovsdb-server.service
++++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
+@@ -7,12 +7,12 @@ PartOf=openvswitch.service
+ 
+ [Service]
+ Type=forking
+-PIDFile=/var/run/openvswitch/ovsdb-server.pid
++PIDFile=/run/openvswitch/ovsdb-server.pid
+ Restart=on-failure
+ EnvironmentFile=/etc/openvswitch/default.conf
+ EnvironmentFile=-/etc/sysconfig/openvswitch
+-ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
+-ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
++ExecStartPre=-/bin/mkdir /run/openvswitch /var/log/openvswitch
++ExecStartPre=-/bin/chown ${OVS_USER_ID} /run/openvswitch /var/log/openvswitch
+ ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
+ ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
+ EnvironmentFile=-/run/openvswitch.useropts
+-- 
+2.17.1
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 07258be..fa1ec4d 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -31,6 +31,7 @@ SRC_URI = "file://openvswitch-switch \
            file://python-switch-remaining-scripts-to-use-python3.patch \
            file://systemd-update-tool-paths.patch \
            file://systemd-create-runtime-dirs.patch \
+           file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.17.1

