Return-Path: <bogdan.purcareata@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D629BE009D7; Fri, 25 Mar 2016 01:13:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.84 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0084.outbound.protection.outlook.com [65.55.169.84])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1AE44E009D7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Mar 2016 01:12:58 -0700 (PDT)
Received: from CH1PR03CA010.namprd03.prod.outlook.com (10.255.156.155) by
	DM2PR0301MB1229.namprd03.prod.outlook.com (10.160.219.18) with
	Microsoft SMTP
	Server (TLS) id 15.1.443.12; Fri, 25 Mar 2016 08:12:57 +0000
Received: from BN1BFFO11OLC001.protection.gbl (10.255.156.132) by
	CH1PR03CA010.outlook.office365.com (10.255.156.155) with Microsoft SMTP
	Server (TLS) id 15.1.447.15 via Frontend Transport;
	Fri, 25 Mar 2016 08:12:57 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; yoctoproject.org; dkim=none (message not signed)
	header.d=none; yoctoproject.org;
	dmarc=none action=none header.from=nxp.com; 
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11OLC001.mail.protection.outlook.com (10.58.145.12) with
	Microsoft
	SMTP Server (TLS) id 15.1.443.6 via Frontend Transport; Fri, 25 Mar 2016
	08:12:57 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.74.6])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u2P8CsiA031472 for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Mar 2016 01:12:55 -0700
From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 25 Mar 2016 08:12:53 +0000
Message-ID: <1458893573-632-1-git-send-email-bogdan.purcareata@nxp.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131033671772703275;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(36756003)(1220700001)(77096005)(1096002)(15975445007)(33646002)(105606002)(586003)(189998001)(92566002)(104016004)(5008740100001)(6806005)(2906002)(110136002)(106466001)(11100500001)(450100001)(107886002)(551544002)(87936001)(49486002)(85426001)(50226001)(47776003)(50466002)(575784001)(15395725005)(81166005)(229853001)(2870700001)(50986999)(19580405001)(86362001)(19580395003)(2351001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0301MB1229;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11OLC001;
	1:A+LUYnA8+y40utGXbIUxjgcKmY8Wmvu6RLY0sbMIpwHpzu6JrnUwf2/bsxn0S2mnVQYWlscvx4k2wHOZSKgtKwNqs36mp1uxs5ZicU6whOdPyw91WPczgG8PGtrG5LmuSBjNsdF6cG/DuOf2TnvKOAkukDAruvEaebjD9iMeQ1UMZmsAlJ6SLh+ST4KBKTFMIfwAV9pnX5im7Gh8YtZP0y0KbW3bS+NiC2ApZlp+mFiWNoi3gtg3TILw0Z3To80N8AGD/fp5P1fKEn73pyCub1ZbtW/nkFIRj8FwjVqTaIXFeubtst3B++p9xy2mkmZdrp/Bf1cbzrLKbWFZ//pvtw7ST6v+C9Qx52B8owdG+t0qLfHIB+muLEtLb1pAZNvg+FFn+0rw4vDDlrs69lGvFcIxCa5VCW6PhM6DWuBTJBqo9XjCS+y8C8AuCmeOe6u65wP/ai7u85A8NPLzvynlag0P3a0qNZqnpaLRn5eeuzjb8GFAlKBusfayGChqy4EN
X-MS-Office365-Filtering-Correlation-Id: 6e08be2a-86ca-4c98-28cc-08d354854615
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1229;
	2:m+985UarU3W2Oauw7TMNaxVY08iknmzY86RDu6Y7Z87rLmaPoMAa7UH4kAdQMRh/urykcSTS+2X7v1Dr7H91HnqV3UmJNzeAGMGEW7j5r64Eyhxh25orOuC+UbjPbaNop8FCZLrcVQjmD2q9d0ITDKA+K6yZHBsfJanm2lksaNi1+YWQLw4ZjanRbuUD4Q7i;
	3:8rnfwgvS/vvrcba2M3EOWJaW89we83SjNLrbLzTrtzWGrlq5TiTK4z05kBnLTjZr/WtvQGFNyHVoUpZuNVkf3MeQt6OFxMI7ILK4q/prI8Hb9rdA/bYHkSB3FxtzYLgl8ndO0i3DLdewskcjmdHfbLtG+jJJaqn3jBPf+fQzkEmdLjLJPQZmlfvGhT72tJnp16Uv+n1EYoIiwULRv3QO7qOA0zmgyz8tNj8CymN+53Y=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1229;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1229;
	25:C2V4Xt0lRSWAErelAGwOTDVz5MJKO/E0plk7pXLNgTpWRU4UX6bletcx57jtDyaao5mpQh92ylAUxjx5ii3mEOiejFXAzvnFhSyHVSoplKXK84SNOQup4AZjJYFy7S6pIsc9rXfiHrcJxzB0Ubhwa2XMQRgt1FSMebuYZzXGN//dEMcjILRB9GTwyF2UbrT+/bcz0+qo8CQQA7iM8Q06Q2rb+rwvHemM4hhP/XvskxlBtRwH75Atd6I/Nl61F6zxjLOjWPmfxWCMdj5fMwuk2efAPJ0O/964mGSuvXz0/VPt7ZBJ5MFXNx4/P47/HrQ5zfYsT9ihmImfpcuRpSnAzxjLKjIW5sx91+h48ReTYqOY7wTEhV2cNpCbHW+sZpRNk995889Bt3dEs1xTFGkdwjsoB+vFUU+PNbl7J/G31FDtALZjhDyxBx8BH0i3VPkTw1EAokjeOk3lHStqccBNCe+X9JIhtDI/Mk2kgFgbqRs6YYqQWta2ntSsAlOXaW6SSmdy7qbQRUHv60B6jr67SDPjWbC11uHX0qcD/S18s/i4UHBeUQC9oHGThNUz2cIiQJdP/wavihVvdFBgw50xK6wRUPgr93yZJUk1lxAZGenmNgH/gMKIKlbFugHLcAGWYm3lLZomdmB/VDz8KhZoZBGFffpFiI6PgSBhJxYpc7W6PT2+s2IlLRW/5ajXZfeY2iuBwQMrdxmReKKk3RhZ+OOwWX5Mt/yCkVxTPwLhENQ=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1229AF43B03B7F11D7510EE0EA830@DM2PR0301MB1229.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(13023025)(13024025)(5005006)(13017025)(13015025)(13018025)(10201501046)(3002001);
	SRVR:DM2PR0301MB1229; BCL:0; PCL:0; RULEID:(400006);
	SRVR:DM2PR0301MB1229; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1229;
	4:IqW0zX1uo6PviVbPjZuBKvkwDsj1zJwuz7IucszIDFfjdgd/k5HhJqm1ZOTTCyiiDvUsqi1IJbFwl/wnF2nQ+/up5bSr2nDFJ85LOMaL4FTK1Posai2kcXS0xnTalsL8lhbKcGjFawKdc/ROzU/c+ZMuN0DnR0TIIZq2/0r4rl45TUJsQqhJDramHZWccc7Zv6XEBlMSiF0T9BtlMCoOctnsOzLt49hIktFf9O6JbUUd/WVBzywofBWAXDnG0pMnkp26Bkz4ZERLsdwwOwpDUAAC74+LdnOX6aYCx4BS2uJ37YSkmW6MP8Gefe+vvTCirAWm+mR3HGBHK/XN0sq70/yz+kPGgJPk62JXQgoQ0Az1NRhdnuwd/tFmA8KqjyLvO9B3OcZd0ObmIh1xd1seyjzo5gRqnEEO5a1aiT8hcv8hQV+n8PqeCjs4FyGsVy2Yq1Op89ei9kIgB8/xx4EHdg==
X-Forefront-PRVS: 0892FA9A88
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1229;
	23:wWeuBllfkxSNddoV7LHx8HJm6rXy4LvebozcPVM?=
	=?us-ascii?Q?2DjN1fgC6602XyfwiV/gY/UzizCooonoo6ID1IntJlRPQL+KMcksqWSZZHUi?=
	=?us-ascii?Q?zlHdzCy1ihD+YPclkogf9IPcZJ9jJgBC/adWEVsisoUsxfuacwu648+rJ7nF?=
	=?us-ascii?Q?58ws1OxGbKG+ryGN4iQP3H4u3qYDoZKmUZhZuhoGysAKJXzzD+rK8j1/EmRk?=
	=?us-ascii?Q?NDVsRCGq0XMAN+iXNLQGa2o16uqUNvjp05Tj7zQKmwwtAB6ySt0JANqSpr/m?=
	=?us-ascii?Q?NwR6VHCI3FcbW3tdPybDtXEpq9laMIZ+L59rgjj598r7sjK3N5EurNBhBrOi?=
	=?us-ascii?Q?KHdVW2g70iT5nh4GI3fa5kR9dRDAfnPXvEo4mGKNN/9Z1Je2GB2T3Vj7gmlV?=
	=?us-ascii?Q?uCT+mg2y//p9/dTW0QJq1bApicS/tZFqk44s5jfqN9had11MtQKU4yrSUDVt?=
	=?us-ascii?Q?mXxfoqptmpTitgD6vtTGIKy04L3Ea+SJe7jMf1np9ADThPO8oIqo9udRac3d?=
	=?us-ascii?Q?7Wlxw62ncMhBP4/tl2lJMiGdpRjIwh4DoNgsWg4wjeMVguQT+4Dr4EoJFnx9?=
	=?us-ascii?Q?4VElXt6m4ZtQ+QWmVnHmsk4UOcQ7eq8ZwSG1o3nGOqBBEtkYeF22dwbTkAJr?=
	=?us-ascii?Q?AzRVslgqVMMo2CNm8EO1bJKL01KEbO8c6FcO9Evo4+ycDWrPClclxf0Q5LdW?=
	=?us-ascii?Q?D3Eq3Mb4PYynAxtEM5t6K8ZuLp2u418JtlhL1zn9cBPJt53i8NefzDkm8+yf?=
	=?us-ascii?Q?vdnz/IUzNa9yCMAKTXsiuZdDoynqBCnyMJWctD3xBa5yIBobnAkubAqxvJAW?=
	=?us-ascii?Q?Sl7TIZleJRfrN2GW0DRHL+Y2jYKSADnJ67EzKl35cn4J3csB6FmqtpyFeJee?=
	=?us-ascii?Q?59F2hGDrRG0Aghuzhb4xS9fQy3DCOsweGxzVlcp1OfrmRJk4rF/RPu4cufjz?=
	=?us-ascii?Q?EWybmoDHkp2HqudevmY8iK2wUDKaWvff6u6Nt1FOW6hG0U/nylCjhkiK8rZP?=
	=?us-ascii?Q?uzv+2NW1rsje3kxJRlqKz3/twZsXSQeIM0KT9Dyi/BzVhct2JaBUjD7K4vEK?=
	=?us-ascii?Q?rZUJGt4ni/DGAajYl9TSwK4QdTsLm4ZyuF2fF9k5KEYWAAsadWhGfBfda7h0?=
	=?us-ascii?Q?9vhBug5RHkx8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1229;
	5:RlXVkdSS3vwbVubg090WfLNfU805kNH3b1f2NF6l8J9vz0l3pT9W20vmHi771eXmpI3ERUG0IwCGGMT7bZHXAeqRPkKk8npZqkBaBv+EkRcr3/t71bevKSomrsxRsw/bwEkvTFVZK7Uk0YnLi3iU7tL6CQgblXh4yxtaLQsza9Y=;
	24:UHEMF29fF6qwT9LGRhCpikMosap2mDTS8rcwroFABPr7ON0zwT/iKF+HKLlOkqAqj/Bv8BVALfbMX5v5D1xml9yTyKAUbqDvW/KrIlOTjQ0=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2016 08:12:57.0831 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1229
Subject: [PATCH] lxc: warning fixes in busybox template
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Mar 2016 08:13:03 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Warnings fixes:
- optional mounts when dirs not available
- busybox dynamically linked
- fstab not available in container

Please apply on master and jethro branches.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
---
 ...-Remove-warning-for-dynamically-linked-Bu.patch | 43 +++++++++++++++++++
 ...x-Touch-etc-fstab-in-the-container-rootfs.patch | 30 +++++++++++++
 ...t_symlink-Don-t-SYSERROR-on-something-els.patch | 49 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_1.1.4.bb                |  3 ++
 4 files changed, 125 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch
 create mode 100644 recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-container-rootfs.patch
 create mode 100644 recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-something-els.patch

diff --git a/recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch b/recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch
new file mode 100644
index 0000000..c0a810b
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch
@@ -0,0 +1,43 @@
+From 07e4c41f2963d73b9aedd552c74f17a33e89f020 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Date: Thu, 24 Mar 2016 11:54:27 +0000
+Subject: [PATCH] lxc-busybox: Remove warning for dynamically linked Busybox
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The warning has been present since commit 32b37181ea (with no purpose stated).
+Support for dynamically linked Busybox has been added since commit bf6cc73696.
+Haven't encountered any issues with dynamically linked Busybox in my last
+2 years' testing.
+
+Upstream-status: Accepted
+[https://github.com/lxc/lxc/commit/07e4c41f2963d73b9aedd552c74f17a33e89f020]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Acked-by: Stéphane Graber <stgraber@ubuntu.com>
+---
+ templates/lxc-busybox.in | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index f547f9e..336fa12 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -304,13 +304,6 @@ configure_busybox()
+         return 1
+     fi
+ 
+-    file -L $(which busybox) | grep -q "statically linked"
+-    if [ $? -ne 0 ]; then
+-        echo "warning : busybox is not statically linked."
+-        echo "warning : The template script may not correctly"
+-        echo "warning : setup the container environment."
+-    fi
+-
+     # copy busybox in the rootfs
+     cp $(which busybox) $rootfs/bin
+     if [ $? -ne 0 ]; then
+-- 
+1.9.1
+
diff --git a/recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-container-rootfs.patch b/recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-container-rootfs.patch
new file mode 100644
index 0000000..33862dd
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-container-rootfs.patch
@@ -0,0 +1,30 @@
+From 6ab1ca0375feeb00070f0c0f9186551b08b1ee5e Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Date: Tue, 22 Mar 2016 13:33:57 +0000
+Subject: [PATCH] lxc-busybox: Touch /etc/fstab in the container rootfs
+
+Upstream-status: Accepted
+[https://github.com/lxc/lxc/commit/6ab1ca0375feeb00070f0c0f9186551b08b1ee5e]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+---
+ templates/lxc-busybox.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index c020e66..f547f9e 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -330,6 +330,9 @@ configure_busybox()
+     # relink /sbin/init
+     ln $rootfs/bin/busybox $rootfs/sbin/init
+ 
++    # /etc/fstab must exist for "mount -a"
++    touch $rootfs/etc/fstab
++
+     # passwd exec must be setuid
+     chmod +s $rootfs/bin/passwd
+     touch $rootfs/etc/shadow
+-- 
+1.9.1
+
diff --git a/recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-something-els.patch b/recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-something-els.patch
new file mode 100644
index 0000000..098ead7
--- /dev/null
+++ b/recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-something-els.patch
@@ -0,0 +1,49 @@
+From 88e078ba865b675f9a0dc61caa0732d7052593f8 Mon Sep 17 00:00:00 2001
+From: Christian Brauner <christian.brauner@mailbox.org>
+Date: Wed, 23 Mar 2016 16:37:09 +0100
+Subject: [PATCH] open_without_symlink: Don't SYSERROR on something else than
+ ELOOP
+
+The open_without_symlink routine has been specifically created to prevent
+mounts with synlinks as source or destination. Keep SYSERROR'ing in that
+particular scenario, but leave error handling to calling functions for the
+other ones - e.g. optional bind mount when the source dir doesn't exist
+throws a nasty error.
+
+Upstream-status: Accepted
+[https://github.com/lxc/lxc/commit/88e078ba865b675f9a0dc61caa0732d7052593f8]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+---
+ src/lxc/utils.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/lxc/utils.c b/src/lxc/utils.c
+index 6bee698..8e7ebbc 100644
+--- a/src/lxc/utils.c
++++ b/src/lxc/utils.c
+@@ -1621,8 +1621,6 @@ static int open_without_symlink(const char *target, const char *prefix_skip)
+ 			errno = saved_errno;
+ 			if (errno == ELOOP)
+ 				SYSERROR("%s in %s was a symbolic link!", nextpath, target);
+-			else
+-				SYSERROR("Error examining %s in %s", nextpath, target);
+ 			goto out;
+ 		}
+ 	}
+@@ -1667,8 +1665,11 @@ int safe_mount(const char *src, const char *dest, const char *fstype,
+ 
+ 	destfd = open_without_symlink(dest, rootfs);
+ 	if (destfd < 0) {
+-		if (srcfd != -1)
++		if (srcfd != -1) {
++			saved_errno = errno;
+ 			close(srcfd);
++			errno = saved_errno;
++		}
+ 		return destfd;
+ 	}
+ 
+-- 
+1.9.1
+
diff --git a/recipes-containers/lxc/lxc_1.1.4.bb b/recipes-containers/lxc/lxc_1.1.4.bb
index e017dcf..2645f4b 100644
--- a/recipes-containers/lxc/lxc_1.1.4.bb
+++ b/recipes-containers/lxc/lxc_1.1.4.bb
@@ -37,6 +37,9 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://open_without_symlink-Account-when-prefix-is-empty-st.patch \
 	file://lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch \
 	file://mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch \
+	file://open_without_symlink-Don-t-SYSERROR-on-something-els.patch \
+	file://lxc-busybox-Touch-etc-fstab-in-the-container-rootfs.patch \
+	file://lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch \
 	"
 
 SRC_URI[md5sum] = "d33c4bd9c57755c0e2b0e2acbc3f171d"
-- 
1.9.1


