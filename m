Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53E9C4829A
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:32:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18616.1707215569870665847
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Feb 2024 02:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2766d7bfcc=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4167mpU5010805
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 6 Feb 2024 10:32:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cq0ju2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Feb 2024 10:32:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyZ2/tryt0NdhAWJyNmJKoUZn3Xx77Wwu4CmB4VStJ1doH6ZsGygLAq+PKZVEdpMvfmpAaCSpm+Z8uYvf15ZIM7HEyyYlP+ex5VmvsWaiHPGh9qAh5ttPfBtSZf/BPhAYzJXqBfQW/6hzviWudgBuL6pLye4WxuJTkpDbRb8Cj84Ix0rot/gYyA5EYeHzbyPXJ3PX+K7qp+pTfpUvcgxT3oXm5rICW3D+a2hpSILTslVGQucNJL3/mHLsHSM4B1eNrpduLrApD9qiOLwSusbGSfotXdQRsvc5hBu+KGtF0d55KNqpEd6FmyzyXDmI4tdKHXMGJ01HxuMOKWiEhtLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rxn/uscvFXRp9YRlQewXbXU9Jgi8WG3JmdW5FNwlQM=;
 b=Q1sqGxeiOLgnBvvi4aYupRevSWzbRje2Ni2rzBI1emB+wTTVf6T25UU/hxD146A3Q5pnjCCaJlqYbSlhFTUhMbKbRF3OswigXYA+nsQ46lEGC++1AUYwT1YTnNNOKN97xeHDa2Zf3lY1WdgZwUr9x0ZtkUgf9fiBeIfs9IInVwwMIentR1fQp4QWAWIkG8Wq+zsIIyLYQvLE1oWByWB3W5KHj0JdK6NwCSx36yKq9j7fMW8caYODxOCLC3lruGWxL9i9Hvo+Uk0yPR08+yzMG8RSHRcFuBStVIw2EfnK9Mvi3RSL2QJFXgadWAMsP92MpdYo9219VbkNIT4z11JY/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH0PR11MB5625.namprd11.prod.outlook.com (2603:10b6:510:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 10:32:46 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 10:32:46 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] libvirt: fix postinstall scriptlets failure
Date: Tue,  6 Feb 2024 19:11:53 +0800
Message-Id: <20240206111153.3645955-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH0PR11MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: d4343d2f-f8b3-490d-f05e-08dc26fef5b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OYy5sb3Fzbph+y6arNItD+xRQ2QZnO0PU1zNA29If/RL8OULn++W8Odfsi1ARUF06lGwSes7yM9SD/2C1y4SnLMHHQ8kub16RhOlmB2HKfUir1D6/HPJ1Mx+Jx5pTyXOZMUtSOQ+eV0uNcysTBcmkFDiazB84njEXlc5WNjT0BsDHS4oWm+33qnkiPYfs3GMRNqtH5nLq8krl8z1KasPnWJpbrNjP+mJtLVkuKlZ8/ga7ygCbSbomUuIvIv0G/Wg+a1bSFu22JSsb4K4mb3fq8rtTkUmBBTuZtPkFR+P7kqfl0qc5vkShJeZPAYO5rdt9JRGVOneD7HYg0MPuIQRG3Cg71SlpySkx+norhe3C9UkTA4HHdUW2Tbpp9usKhxgOXdBx9A7poOmS59cBoNk9BNm8GnZqe9TVzTyS/R7yNzP2PSRKjLx8DuzLpzWVT/yMK6r3ba8flnbcLw0m9NN2dkJQ4y2PdsyRT3zvymi8exgccDmIjhoGIQDsmvaNsOQPbCbZzG4oCaCmAZrVuK2lLCxhcWXIGVsTeXg7ecvktZENAEjpgj4oRJa9tK558jY465x3EPBCQPfJD7jNE6VAu6tPORAibsq4yNGgWPB3Gw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(136003)(39850400004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83170400001)(2906002)(83380400001)(38100700002)(41300700001)(26005)(316002)(66556008)(6916009)(66476007)(66946007)(38350700005)(44832011)(8936002)(8676002)(52116002)(6506007)(478600001)(6512007)(2616005)(6666004)(6486002)(5660300002)(966005)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ROZ6DdTkuTensoYNCUqwvgcC/QWboL7+lgBbp4FmP3XmnYsp/eDPZBdPKVXt?=
 =?us-ascii?Q?5RxGUWKVpvTQm0nP2/WaqdLd8uE4AYJq1cbOag4qs9tE3gOMBrBZzEZeqFuE?=
 =?us-ascii?Q?d0PxS7h53guxzN/VuHJBg9D48VbYM+lWhPX8ma+uu5ZtTXEC/Xw8Xyn0L6V1?=
 =?us-ascii?Q?nsoQ6GeA60wpeAKUvC0PXCrplOqkO+WfOFZSGLVp7EbAwyaZqikbvsRroQnv?=
 =?us-ascii?Q?uaqLYc86sENf/IWTADZPvpH3GWiJj/1IB78N6Ao5z9Dgdf3NJ0stiYHrs9zP?=
 =?us-ascii?Q?6MKj+A1G7jWREndJEcpiizZfoBWcF+/XSX7oh+FspAcIBoaFrMnVye+WY3ll?=
 =?us-ascii?Q?C+jW9GzRL0WxeMVMbJrLPdyjNYLeCXwFnD2VFq1p/l/4Vtt96jK0ZtKbuqxI?=
 =?us-ascii?Q?LiicW2UCR/TAE/9ohuJ1kymZf03QmKKFX1Cf36M8eECWXKuMV0sqLqHZ17Py?=
 =?us-ascii?Q?wdVuQk1ja+lze5bS8oOr2YOQha40aTgjCHLv0ed7PcChrmlUoDZ9OLtvR1V+?=
 =?us-ascii?Q?srLpsZwu2gSaRvdp7bA60+zJl2f5DnpHTxNnerApORi86tKQn/0ejGasJkfZ?=
 =?us-ascii?Q?/s4g+NEFWvv1RCBa6IcaPaFWG9PGcPV86hVA5IsUMI17kxwV281RCw2jhhvd?=
 =?us-ascii?Q?a/ukdDmsURokl4dzTm6UZjFQ0gNqvJaWHTEBQjKG8LqxuzL2UEGsEo7I7VWG?=
 =?us-ascii?Q?fPd7liTqHSk8gAwRGRRj/FZfYuOwMdUy4gsejk+GHXAIXTEP14DdUpuIu85t?=
 =?us-ascii?Q?LEcipszRveykorJd8zSh06oRS7qvBui07FQPPnRmkPQ/grZNZgB/ZaBCRLmq?=
 =?us-ascii?Q?3ZY0agMqZC4dPTdCzrF6QX+LF4YgDK+UtkGqEHVtaW5QzflyYeh7c02W75zX?=
 =?us-ascii?Q?YiEgHBL0p1GtnmXxEWhTlqVFEhT/+SDj/+ZOkd27P55ym0oGIQIxxsRqSjXf?=
 =?us-ascii?Q?CaZe4svGTMuVJI4naYBHGcNPFl5hGXllWIJizr3KhEqBLg73bu/XpMyKgWVk?=
 =?us-ascii?Q?5x+7ZPdd7YrAtyenuNvN4iAwn2Bv4VPCQu6wc83WJ/wNvb2vTebfz+lNhKfs?=
 =?us-ascii?Q?piTViPArL/WHJBIBA4bCckUbYfAKkCdV0ED0ngollmSSS0lGM6vEI/ij+7d1?=
 =?us-ascii?Q?3F8lUiMQGvaEHcfJcVQQiJiA++Udho3dsHjVXJnIzPwOhc1DVW0ZW7BlBBNR?=
 =?us-ascii?Q?rOji2CGVirwAjToO0u0TTxZCzg85kgT7tEZlrdPgNwovMNOXHd/X6bhmluoQ?=
 =?us-ascii?Q?Tyj2qaAglVa6+r575ZiwPkTYfTeMpYz36i3bzJZfRZ0TJgWvDsWKv3vho+gP?=
 =?us-ascii?Q?j6jG6EH4Ulwj4hAE3BtX8TCVavzK529mW6Mep1os0O8lHcaDyGePvhpf83vi?=
 =?us-ascii?Q?3klSB47TTS7nEySefDeB2dZHjDK9ynTmUIeVnawbmmVjxToUylZwWxQfktdq?=
 =?us-ascii?Q?Nxci0NSnurEhZgQSS9B8pH+d+A7dsaLtr93DgyfuYVurcEe+9x4p5+co+1rr?=
 =?us-ascii?Q?yFfeCbC2Fp5yJz1nulGZl7ADvGMW+M9bv28A7a6efe2XrFr5VCPZlixdA1po?=
 =?us-ascii?Q?O0M5dx9ZoIlBa9t70YUy9bzTE7dzX9tEHAMy4d1aA/XzKz/r/kWOcSOdHk+s?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4343d2f-f8b3-490d-f05e-08dc26fef5b7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 10:32:46.7131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnvXyCnuW5fAhL263pUZfYequvK4qTcWKexS7v/YBgahsli7ctO/7yc4MEeNrMh+aFJeN0JIOfAZGGsHKbLjzdEQLloM8NcrdslaS5rqVkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5625
X-Proofpoint-ORIG-GUID: rI6QY_9moS4BHeIT5f7FSoHleg3918vy
X-Proofpoint-GUID: rI6QY_9moS4BHeIT5f7FSoHleg3918vy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_03,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=291 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402060073
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Feb 2024 10:32:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8562

From: Xiangyu Chen <xiangyu.chen@windriver.com>

libvirt upstream has added all sockets for a service being enabled when a
single one of them is[1], it likes serviceA enable serviceB, serviceB enable
serviceA, that cause our systemctl script[2] trap into a dead loop in postinstall
stage, the error message as below:

Traceback (most recent call last):
  File "/usr/lib/python3.8/pathlib.py", line 722, in __str__
    return self._str
AttributeError: _str

During handling of the above exception, another exception occurred:
Traceback (most recent call last):
  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
    SystemdUnit(self.root, also).enable(unit)
  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
    SystemdUnit(self.root, also).enable(unit)
  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
    SystemdUnit(self.root, also).enable(unit)
  [Previous line repeated 988 more times]
......
RecursionError: maximum recursion depth exceeded while calling a Python object

Since we are using systemctl script to process the dependency, so revert that
commit from upstream.

[1] https://github.com/libvirt/libvirt/commit/826931e95a38af8322f8ad069dc89117c6404a00
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/systemd/systemd-systemctl/systemctl

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...ert-systemd-Add-Also-between-sockets.patch | 143 ++++++++++++++++++
 recipes-extended/libvirt/libvirt_10.0.0.bb    |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-Revert-systemd-Add-Also-between-sockets.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-Revert-systemd-Add-Also-between-sockets.patch b/recipes-extended/libvirt/libvirt/0001-Revert-systemd-Add-Also-between-sockets.patch
new file mode 100644
index 00000000..84367fc3
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-Revert-systemd-Add-Also-between-sockets.patch
@@ -0,0 +1,143 @@
+From 66aa101abb639c64f71a2867424fb58a39a3bd21 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Tue, 6 Feb 2024 18:45:53 +0800
+Subject: [PATCH] Revert "systemd: Add Also between sockets"
+
+This reverts commit 826931e95a38af8322f8ad069dc89117c6404a00.
+
+We have systemctl script to process the service dependency, this cause our oe-core systemctl script
+trap into a dead loop.
+
+Error as below:
+Traceback (most recent call last):
+  File "/usr/lib/python3.8/pathlib.py", line 722, in __str__
+    return self._str
+AttributeError: _str
+
+During handling of the above exception, another exception occurred:
+Traceback (most recent call last):
+  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
+    SystemdUnit(self.root, also).enable(unit)
+  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
+    SystemdUnit(self.root, also).enable(unit)
+  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
+    SystemdUnit(self.root, also).enable(unit)
+  [Previous line repeated 988 more times]
+......
+RecursionError: maximum recursion depth exceeded while calling a Python object
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/locking/virtlockd-admin.socket.in | 1 -
+ src/locking/virtlockd.socket.in       | 1 -
+ src/logging/virtlogd-admin.socket.in  | 1 -
+ src/logging/virtlogd.socket.in        | 1 -
+ src/remote/libvirtd-admin.socket.in   | 2 --
+ src/remote/libvirtd-ro.socket.in      | 2 --
+ src/remote/libvirtd.socket.in         | 2 --
+ src/virtd-admin.socket.in             | 2 --
+ src/virtd-ro.socket.in                | 2 --
+ src/virtd.socket.in                   | 2 --
+ 10 files changed, 16 deletions(-)
+
+diff --git a/src/locking/virtlockd-admin.socket.in b/src/locking/virtlockd-admin.socket.in
+index ed5b94edba..8902ae4225 100644
+--- a/src/locking/virtlockd-admin.socket.in
++++ b/src/locking/virtlockd-admin.socket.in
+@@ -11,4 +11,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=virtlockd.socket
+diff --git a/src/locking/virtlockd.socket.in b/src/locking/virtlockd.socket.in
+index 4eec90a95e..afd42d124e 100644
+--- a/src/locking/virtlockd.socket.in
++++ b/src/locking/virtlockd.socket.in
+@@ -9,4 +9,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=virtlockd-admin.socket
+diff --git a/src/logging/virtlogd-admin.socket.in b/src/logging/virtlogd-admin.socket.in
+index 7207878008..a634af8942 100644
+--- a/src/logging/virtlogd-admin.socket.in
++++ b/src/logging/virtlogd-admin.socket.in
+@@ -11,4 +11,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=virtlogd.socket
+diff --git a/src/logging/virtlogd.socket.in b/src/logging/virtlogd.socket.in
+index e1d6e30e4d..7c14d03ce4 100644
+--- a/src/logging/virtlogd.socket.in
++++ b/src/logging/virtlogd.socket.in
+@@ -9,4 +9,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=virtlogd-admin.socket
+diff --git a/src/remote/libvirtd-admin.socket.in b/src/remote/libvirtd-admin.socket.in
+index 37efc11357..5cbb83deaa 100644
+--- a/src/remote/libvirtd-admin.socket.in
++++ b/src/remote/libvirtd-admin.socket.in
+@@ -11,5 +11,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=libvirtd.socket
+-Also=libvirtd-ro.socket
+diff --git a/src/remote/libvirtd-ro.socket.in b/src/remote/libvirtd-ro.socket.in
+index 6e1fad2272..7e25498728 100644
+--- a/src/remote/libvirtd-ro.socket.in
++++ b/src/remote/libvirtd-ro.socket.in
+@@ -11,5 +11,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=libvirtd.socket
+-Also=libvirtd-admin.socket
+diff --git a/src/remote/libvirtd.socket.in b/src/remote/libvirtd.socket.in
+index 9cd37dc766..919b874acd 100644
+--- a/src/remote/libvirtd.socket.in
++++ b/src/remote/libvirtd.socket.in
+@@ -9,5 +9,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=libvirtd-ro.socket
+-Also=libvirtd-admin.socket
+diff --git a/src/virtd-admin.socket.in b/src/virtd-admin.socket.in
+index 63eabd70f8..d3b260e5b1 100644
+--- a/src/virtd-admin.socket.in
++++ b/src/virtd-admin.socket.in
+@@ -13,5 +13,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=@service@.socket
+-Also=@service@-ro.socket
+diff --git a/src/virtd-ro.socket.in b/src/virtd-ro.socket.in
+index 3284af5a4a..2f701c8adb 100644
+--- a/src/virtd-ro.socket.in
++++ b/src/virtd-ro.socket.in
+@@ -13,5 +13,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=@service@.socket
+-Also=@service@-admin.socket
+diff --git a/src/virtd.socket.in b/src/virtd.socket.in
+index 502c792e7d..3605b0103e 100644
+--- a/src/virtd.socket.in
++++ b/src/virtd.socket.in
+@@ -11,5 +11,3 @@ RemoveOnStop=yes
+ 
+ [Install]
+ WantedBy=sockets.target
+-Also=@service@-ro.socket
+-Also=@service@-admin.socket
+-- 
+2.25.1
+
diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
index 6b19b700..412fb67b 100644
--- a/recipes-extended/libvirt/libvirt_10.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://gnutls-helper.py \
            file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
            file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
+           file://0001-Revert-systemd-Add-Also-between-sockets.patch \
           "
 
 SRC_URI[libvirt.sha256sum] = "8ba2e72ec8bdd2418554a1474c42c35704c30174b7611eaf9a16544b71bcf00a"
-- 
2.25.1


