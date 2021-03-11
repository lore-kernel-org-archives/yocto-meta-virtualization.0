Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.64])
 by mx.groups.io with SMTP id smtpd.web10.3512.1615452667892427073
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 00:51:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YKf1C/8P;
 spf=pass (domain: windriver.com, ip: 40.107.68.64, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Il1OsY7OlPb49od1myD8tOzBAMDeISeo4eHRhnaIrdR0DE+VibvqFFcHC2eA2v6CNQK46I3ZCOKOvuZX0pnDTnUdTfaSw8gZnGdfYI6Hbsvw8OGmmdQdu54G5bBmvynB2BAw+h9AAUYoEccwx7qUdOwn2zqwRAFoi46Us829hMqik3EmQUc3WhkEt7/AfpZGpmN6XpJIO+fWCTRRwExs1bCOrLdWF+zketIBNkvFRe765QIU2WRaf9cIpnvfNWJkK8HAAxTCOouppTRlgXqulSEKVEJFm9iDUb7sDmATrA46VbI52WyqTAKgYyQZi3VMONZv0cwiy4JcJ6FOiPu8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b9g2y08zAr3pRMPI4xYhn2lBPlC+rtsNcZstG1us/I=;
 b=lmyS85rzeCCfa5ocZ7W1eVXmvEmEgnKmDVc6jYQxD3xhqTH/JvBJarpQ6qHGZEHeGJcvYKCtkWhNNQY+hs9uk18HPNtEYLtCJlqgvfw3dEAu3Nl5K5dN4QQ5vcL0DWjDA7D+NTiZvxVVGAdKrd7DQv0uqzEDluHXD/yqiedC+B2EOrBXgo8swRbfM6/8EQH34596nVU862rFKkmpCL4S6NlyHXFD+gZXI3uqApy3kHtRao2JNTANFNBWGDMz4WU8EuQ7j29vTjXFzJFo+eBLGnb/9oMo4TPVqdLMUZXjfpfy3uJ+yLkvwjpW39r99At5ZPPof/hWVb2H3TPN0wM4WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5b9g2y08zAr3pRMPI4xYhn2lBPlC+rtsNcZstG1us/I=;
 b=YKf1C/8PmmAyRc4hpsqtit5+BoRAhWYkUW1qeCLzxZ+wD5JvsONJYHSi7YDTKxcXaE7PBe914wBRZJLd7Dts60l8xzfwMP0t8xUx2DDuOCLhZ+ZNkXWttLXqt44FsClrVa9O3fgiAgHJTJS4UKsN9fgKjuY31pIJ0ebIkVKSvLI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Thu, 11 Mar
 2021 08:51:05 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd%4]) with mapi id 15.20.3890.038; Thu, 11 Mar 2021
 08:51:04 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] openvswitch: uprev from 2.13 to 2.15
Date: Thu, 11 Mar 2021 16:50:50 +0800
Message-Id: <20210311085050.8132-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:202:2e::16) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
Return-Path: qiang.zhang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by HK2PR06CA0004.apcprd06.prod.outlook.com (2603:1096:202:2e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 08:51:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 668e6eb1-7e09-400d-a569-08d8e46acde3
X-MS-TrafficTypeDiagnostic: BY5PR11MB3895:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3895F7AB8A2E5E7A4849FC07FF909@BY5PR11MB3895.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LjZWW/ZofHPJYOrpoML/z3IA9GvtAlIfniiqtIRKBjeDEwsZkwZLAssdfqSNKiJjon9ycDs2lo5ZSNU/v1clBivlrpv87k+uk6Fy2QQ4E/lULdjj8kzNkvhrUsjt7zMiykG3TvIQ+uQcN4blxRMufAvI51Rp9eUj6Yj9DE2uR6ygO8/M4PPlelEfAZHeiiWvMIMp9ak/wuTLI/jVP6lnjC5Dm/ndl+6vz4E297u5tjVKxjBiuDGCfjnDbyZdQmLhHpU6bIvzJ8MqdZ4ejLCCWe0PcC8+gIcnQkHbboPyw03pWQFLXZwJZqk8XhFfVtwCdVIlHi4DvPNIVlPG1dH3FPsKr1vZ1TUyYWb/RwnwxdUlJGHzDv7rWMHC0Ot9Ua2fTV50cwgg+3M34TMk2/d4LRtBUnGG5kYQGu/vxSb9bpKrw4vE7EBwGzbtLlP0EGY21aydbjRmVriq5aBhUPpGaTJiPXsXRo2JBN96LLyhwO8uWaD8Jno2cZv3V/6W3O47zA/aY2HhfYrqdMYuWMRCSw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(6512007)(36756003)(6916009)(6666004)(2906002)(66946007)(83380400001)(66476007)(5660300002)(1076003)(186003)(9686003)(66556008)(478600001)(52116002)(30864003)(6486002)(8676002)(86362001)(8936002)(26005)(4326008)(316002)(16526019)(6506007)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+2r5p/DBdPrQCmsFleHOpmv+1VYGawlCcZ41yvnUybrTM9zS7x/jrJ2edN/y?=
 =?us-ascii?Q?EJaRtMU2MvnczQR82IZvgkSdtWe4eeXtmfxGZUfiezwGAesvX35TGVlx7hpl?=
 =?us-ascii?Q?b5oIi8C14BJgTmtZjFLteFXjF4tz5m7zIfrnMIHvA2aEzovtkh2B/1PKLUf1?=
 =?us-ascii?Q?W6GX3YBE4D2uV7rXSu7KVopBxWTyODy+XaXJso1082b+2ADcWN6biRMhZI1s?=
 =?us-ascii?Q?cW0qGFlwh1eQPX49ZGv7mX7ZqWbVwh/Dbu58l9hPSuHVfuQpQVXqvh+vn/PO?=
 =?us-ascii?Q?OsMEMEqNAF3I6BTjLIdOpolpXkutx9uhj3jHPuLKjgheHiZGjB9ORZAfLWBD?=
 =?us-ascii?Q?3m7EX3qPeQZ4xEDEg9s8LSNSnK56nfX8P6HwJL6l2FWaddng2jxZoWHBcfaP?=
 =?us-ascii?Q?iZHb1z/hVMN6H3XbnO7jl27KUrIdWhEmaUst45WgoR8x9mSUL7F6Yzyx/Vjc?=
 =?us-ascii?Q?A+RGerbBdR6meH4jCYpjPq85tI5MH1UAxyfYnOjxPKJ7PKMMIDqm2l07ONuc?=
 =?us-ascii?Q?PTlrJR/m4ywT6P+HHX7qHpOF73yFVVS8XjIgO8oA7cIiscxUkFOFDrbcu1Zr?=
 =?us-ascii?Q?IoxTDerfXtFxNff6WJbohPy1ohx+dJAAwHS4u4lMB6wd2/h+CdGidcueiI2h?=
 =?us-ascii?Q?LHlSmKxZTSgnveThgi5Kd/DduOKP30oDsXZ3lMKx/CiXmlpYstRG1ejZ2wzY?=
 =?us-ascii?Q?kXJeSXoQi6g4uhgKi/fOPrk7Sot6a64bc8dKY1V+2PrrP0+/TYUQixZIVs0Q?=
 =?us-ascii?Q?5HicMZsXt/ipss2WNT4/oNRvJkwBWqA/9vBrCkP/BmARsmynpeY80KjjUcsL?=
 =?us-ascii?Q?Zuy7P13P6fGBaA19J1cAJNKPo51pgHtVwsscfUgk6NaWI9rVpgO5TQuckRTG?=
 =?us-ascii?Q?4shxruM9m4Zx3RkVu/uoXy9LAmZXwpt7ocXAI3CyqN/rF1KrMCZUqINmgKL1?=
 =?us-ascii?Q?t+HRXuQ2KuaSFzbIzSSF0h4U9b+RAup3pLaL47iCldwp3hSN/ESPd1HFZRWw?=
 =?us-ascii?Q?p1maCBuT4R/olPGkmcXpyEVv811NmzZHL+Wmo4slRGjmkm0PNjKiWsCAIc5g?=
 =?us-ascii?Q?70a/YER2WFzoS5fCQbFOx8EhFiR6oFZtohVCy95LhXyjVj7guy00ijnVPs/p?=
 =?us-ascii?Q?qUsBP75o9tTqMNaaLs1rcWbJOSPRMlY/ieKedp/wdxop8kZ0AEEPc0joCTmy?=
 =?us-ascii?Q?9BjoYmuw0Jd3eT/vOabW+xlYJvs8Bz2UxqmpeJZjOHt952WmyLCIeRMK5d2G?=
 =?us-ascii?Q?64qitQ1Hp6zf7ILL+2RxZ+A/Y5+qjiMWKxN2ZgQq7NrmX4RVlF8lpyEWU81y?=
 =?us-ascii?Q?+qCP6mXNd1XKwwvLyHOQP+28?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 668e6eb1-7e09-400d-a569-08d8e46acde3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 08:51:04.8548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqLAtRGfqOWvxv4s1iX4jZz1PcxzfZPGpf9wS+h4vl7L/7leITy5Bp5k6NV6Hq5Vq60G99HLQWaevNWkYXlcZPew52ZiMWkuSRlXmRlmzMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

- OVSDB:
     * Changed format in which ovsdb transactions are stored in database files.
       Now each transaction contains diff of data instead of the whole new
       value of a column.
       New ovsdb-server process will be able to read old database format, but
       old processes will *fail* to read database created by the new one.
       For cluster and active-backup service models follow upgrade instructions
       in 'Upgrading from version 2.14 and earlier to 2.15 and later' section
       of ovsdb(7).
     * New unixctl command 'ovsdb-server/get-db-storage-status' to show the
       status of the storage that's backing a database.
     * New unixctl command 'ovsdb-server/memory-trim-on-compaction on|off'.
       If turned on, ovsdb-server will try to reclaim all the unused memory
       after every DB compaction back to OS.  Disabled by default.
     * Maximum backlog on RAFT connections limited to 500 messages or 4GB.
       Once threshold reached, connection is dropped (and re-established).
       Use the 'cluster/set-backlog-threshold' command to change limits.
- DPDK:
     * Removed support for vhost-user dequeue zero-copy.
     * Add support for DPDK 20.11.
- Userspace datapath:
     * Add the 'pmd' option to "ovs-appctl dpctl/dump-flows", which
       restricts a flow dump to a single PMD thread if set.
     * New 'options:dpdk-vf-mac' field for DPDK interface of VF ports,
       that allows configuring the MAC address of a VF representor.
     * Add generic IP protocol support to conntrack. With this change, all
       none UDP, TCP, and ICMP traffic will be treated as general L3
       traffic, i.e. using 3 tupples.
     * Add parameters 'pmd-auto-lb-load-threshold' and
       'pmd-auto-lb-improvement-threshold' to configure PMD auto load balance
        behaviour.
- The environment variable OVS_UNBOUND_CONF, if set, is now used
     as the DNS resolver's (unbound) configuration file.
- Linux datapath:
     * Support for kernel versions up to 5.8.x.
- Terminology:
     * The terms "master" and "slave" have been replaced by "primary" and
       "secondary", respectively, for OpenFlow connection roles.
     * The term "slave" has been replaced by "member", for bonds, LACP, and
       OpenFlow bundle actions.
- Support for GitHub Actions based continuous integration builds has been
     added.
- Bareudp Tunnel
     * Bareudp device support is present in linux kernel from version 5.7
     * Kernel bareudp device is not backported to ovs tree.
     * Userspace datapath support is not added
- ovs-dpctl and 'ovs-appctl dpctl/':
     * New commands '{add,mod,del}-flows' where added, which allow adding,
       deleting, or modifying flows based on information read from a file.
- IPsec:
     * Add option '--no-cleanup' to allow ovs-monitor-ipsec to stop without
       tearing down IPsec tunnels.
     * Add option '--no-restart-ike-daemon' to allow ovs-monitor-ipsec to start
       without restarting ipsec daemon.
- Building the Linux kernel module from the OVS source tree is deprecated
     * Support for the Linux kernel is capped at version 5.8
     * Only bug fixes for the Linux OOT kernel module will be accepted.
     * The Linux kernel module will be fully removed from the OVS source tree
       in OVS branch 2.18

fix some do_patch error about local patch.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 ...tead-of-var-run-for-in-systemd-units.patch | 16 ++++++----
 .../systemd-create-runtime-dirs.patch         | 23 +++++++-------
 .../systemd-update-tool-paths.patch           | 31 ++++++++++---------
 .../openvswitch/openvswitch_git.bb            |  7 ++---
 4 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
index 244a216d..f7ec3fa0 100644
--- a/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
+++ b/recipes-networking/openvswitch/files/0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch
@@ -1,6 +1,6 @@
-From ea98129777784b0e750a20078f01093dbdbe7b9b Mon Sep 17 00:00:00 2001
+From ae55fa8168b4b9692ad757c54255a89f935c587e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 20 Oct 2020 14:14:06 +0800
+Date: Thu, 11 Mar 2021 11:35:24 +0800
 Subject: [PATCH] ovs: use /run instead of /var/run for in systemd units
 
 Upstream-Status: Pending
@@ -78,10 +78,10 @@ index f88b57cae..82748bf2d 100644
  EnvironmentFile=-/etc/sysconfig/openvswitch
  EnvironmentFile=-/run/openvswitch.useropts
 diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
-index 69b0bf61a..5f83f281f 100644
+index 74e5acb7f..39698f238 100644
 --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
 +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
-@@ -7,12 +7,12 @@ PartOf=openvswitch.service
+@@ -7,7 +7,7 @@ PartOf=openvswitch.service
  
  [Service]
  Type=forking
@@ -90,13 +90,17 @@ index 69b0bf61a..5f83f281f 100644
  Restart=on-failure
  EnvironmentFile=/etc/openvswitch/default.conf
  EnvironmentFile=-/etc/sysconfig/openvswitch
+@@ -17,8 +17,8 @@ EnvironmentFile=-/run/openvswitch.useropts
+ # remove openvswitch.useropts first to reload a fresh
+ # OVS_USER_ID from default.conf or sysconfig.
+ ExecStartPre=/bin/rm -f /run/openvswitch.useropts
 -ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
 -ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
 +ExecStartPre=-/bin/mkdir /run/openvswitch /var/log/openvswitch
 +ExecStartPre=-/bin/chown ${OVS_USER_ID} /run/openvswitch /var/log/openvswitch
- ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
+ ExecStartPre=/bin/sh -c '/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
  ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
- EnvironmentFile=-/run/openvswitch.useropts
+ ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
 -- 
 2.17.1
 
diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
index 0438cf88..12b9e17a 100644
--- a/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/systemd-create-runtime-dirs.patch
@@ -1,6 +1,6 @@
-From 6876e0c155b7f83e1f8545446e2dd69c2b7989f2 Mon Sep 17 00:00:00 2001
+From fc540d0dee7d1f801c781905735f0f4619aba511 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Tue, 4 Sep 2018 15:38:59 -0400
+Date: Thu, 11 Mar 2021 11:26:58 +0800
 Subject: [PATCH] systemd: create runtime dirs
 
 The recommendation would be to make use of "RuntimeDirectory=" and
@@ -11,21 +11,22 @@ directories won't exist.
 
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
- rhel/usr_lib_systemd_system_ovsdb-server.service | 1 +
- 1 file changed, 1 insertion(+)
+ rhel/usr_lib_systemd_system_ovsdb-server.service | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
-index aad557f..69b0bf6 100644
+index 5002ddf10..74e5acb7f 100644
 --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
 +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
-@@ -11,6 +11,7 @@ PIDFile=/var/run/openvswitch/ovsdb-server.pid
- Restart=on-failure
- EnvironmentFile=/etc/openvswitch/default.conf
- EnvironmentFile=-/etc/sysconfig/openvswitch
+@@ -17,7 +17,7 @@ EnvironmentFile=-/run/openvswitch.useropts
+ # remove openvswitch.useropts first to reload a fresh
+ # OVS_USER_ID from default.conf or sysconfig.
+ ExecStartPre=/bin/rm -f /run/openvswitch.useropts
+-
 +ExecStartPre=-/bin/mkdir /var/run/openvswitch /var/log/openvswitch
  ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
- ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
+ ExecStartPre=/bin/sh -c '/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
  ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
 -- 
-2.7.4
+2.17.1
 
diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
index aae44fe7..be6fa5d9 100644
--- a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
+++ b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
@@ -1,6 +1,6 @@
-From efd6b8f03ef7278d2477833f84bb8488bd0c346d Mon Sep 17 00:00:00 2001
+From a79bf6caf915d2a00a52a73033b1c903f2df894f Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Tue, 29 May 2018 18:57:46 +0000
+Date: Wed, 10 Mar 2021 11:17:37 +0800
 Subject: [PATCH 1/2] systemd: update tool paths
 
 We are using the rhel files but we install our tools in a slightly
@@ -9,11 +9,11 @@ different path, update accordingly.
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 ---
  rhel/usr_lib_systemd_system_ovs-vswitchd.service.in | 4 ++--
- rhel/usr_lib_systemd_system_ovsdb-server.service    | 6 +++---
- 2 files changed, 5 insertions(+), 5 deletions(-)
+ rhel/usr_lib_systemd_system_ovsdb-server.service    | 8 ++++----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
-index ff43dae..f88b57c 100644
+index ff43dae96..f88b57cae 100644
 --- a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
 +++ b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
 @@ -17,8 +17,8 @@ EnvironmentFile=-/etc/sysconfig/openvswitch
@@ -28,22 +28,25 @@ index ff43dae..f88b57c 100644
  ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
            --no-ovsdb-server --no-monitor --system-id=random \
 diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
-index 4c170c0..aad557f 100644
+index 98338b9df..5002ddf10 100644
 --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
 +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
-@@ -11,9 +11,9 @@ PIDFile=/var/run/openvswitch/ovsdb-server.pid
- Restart=on-failure
- EnvironmentFile=/etc/openvswitch/default.conf
- EnvironmentFile=-/etc/sysconfig/openvswitch
+@@ -16,11 +16,11 @@ EnvironmentFile=-/run/openvswitch.useropts
+ # Environment is reloaded for each Exec*, make sure to
+ # remove openvswitch.useropts first to reload a fresh
+ # OVS_USER_ID from default.conf or sysconfig.
+-ExecStartPre=/usr/bin/rm -f /run/openvswitch.useropts
++ExecStartPre=/bin/rm -f /run/openvswitch.useropts
+
 -ExecStartPre=-/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
--ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /usr/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
+-ExecStartPre=/bin/sh -c '/usr/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
 -ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
 +ExecStartPre=-/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
-+ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch.useropts; /bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
++ExecStartPre=/bin/sh -c '/bin/echo "OVS_USER_ID=${OVS_USER_ID}" > /run/openvswitch.useropts'
 +ExecStartPre=/bin/sh -c 'if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /bin/echo "OVS_USER_OPT=--ovs-user=${OVS_USER_ID}" >> /run/openvswitch.useropts; fi'
- EnvironmentFile=-/run/openvswitch.useropts
  ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
            --no-ovs-vswitchd --no-monitor --system-id=random \
+           ${OVS_USER_OPT} \
 -- 
-2.7.4
+2.17.1
 
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index fa1ec4dc..99c4070e 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -14,21 +14,20 @@ RDEPENDS_${PN}-ptest += "\
 	"
 
 S = "${WORKDIR}/git"
-PV = "2.13+${SRCPV}"
+PV = "2.15+${SRCPV}"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
 
-SRCREV = "71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3"
+SRCREV = "8dc1733eaea866dce033b3c44853e1b09bf59fc7"
 SRC_URI = "file://openvswitch-switch \
            file://openvswitch-switch-setup \
            file://openvswitch-testcontroller \
            file://openvswitch-testcontroller-setup \
-           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.13 \
+           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15 \
            file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
            file://run-ptest \
            file://disable_m4_check.patch \
            file://kernel_module.patch \
-           file://python-switch-remaining-scripts-to-use-python3.patch \
            file://systemd-update-tool-paths.patch \
            file://systemd-create-runtime-dirs.patch \
            file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
-- 
2.29.2

