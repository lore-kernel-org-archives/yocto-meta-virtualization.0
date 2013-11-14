Return-Path: <b43198@fsr-fed1764-008.ea.freescale.net>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0188.outbound.messaging.microsoft.com [213.199.154.188])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C499E015DE
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2013 08:04:54 -0800 (PST)
Received: from mail19-db8-R.bigfish.com (10.174.8.239) by
	DB8EHSOBE016.bigfish.com (10.174.4.79) with Microsoft SMTP Server id
	14.1.225.22; Thu, 14 Nov 2013 16:04:52 +0000
Received: from mail19-db8 (localhost [127.0.0.1])	by mail19-db8-R.bigfish.com
	(Postfix) with ESMTP id D8ACC3403AF	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2013 16:04:52 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzd772hzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h177df4h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail19-db8 (localhost.localdomain [127.0.0.1]) by mail19-db8
	(MessageSwitch) id 1384445090386390_17080;
	Thu, 14 Nov 2013 16:04:50 +0000 (UTC)
Received: from DB8EHSMHS006.bigfish.com (unknown [10.174.8.236])	by
	mail19-db8.bigfish.com (Postfix) with ESMTP id 58E48700049	for
	<meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2013 16:04:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS006.bigfish.com
	(10.174.4.16) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 14 Nov 2013 16:04:48 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 14 Nov 2013 16:04:48 +0000
Received: from fsr-fed1764-008.ea.freescale.net
	(fsr-fed1764-008.ea.freescale.net [10.171.73.92])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id rAEG4kEm010025;
	Thu, 14 Nov 2013 09:04:47 -0700
Received: (from b43198@localhost)	by fsr-fed1764-008.ea.freescale.net
	(8.14.5/8.14.5/Submit) id rAEG4foq001065;
	Thu, 14 Nov 2013 18:04:41 +0200
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 14 Nov 2013 18:04:40 +0200
Message-ID: <1384445080-1030-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.net
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] LXC: setup_netdev: re-read ifindex in LXC_NET_PHYS case
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
X-List-Received-Date: Thu, 14 Nov 2013 16:04:55 -0000
Content-Type: text/plain

Patch to fix interface netns transition when
assigning a physical interface to a container.
Pushed to the upstream LXC repo, to be included
in future versions of LXC.

Further details in included patch description.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...tdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch | 49 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_0.9.0.bb                |  5 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch

diff --git a/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch b/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
new file mode 100644
index 0000000..5cebb50
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
@@ -0,0 +1,49 @@
+From 8712c58ab896f072cf95e3ffa3ceac1fa10f6295 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Thu, 14 Nov 2013 12:31:55 +0200
+Subject: [PATCH] setup_netdev: re-read ifindex in LXC_NET_PHYS case
+
+When moving an interface from the host netns to a container's,
+the ifindex might not remain the same. This happens when the
+index of the host interface is already assigned to another interface
+in the new netns.
+
+For veth/vlan/macvlan, virtual interfaces are first created on the host,
+and then moved in the container. Since they are created after all other
+interfaces are discovered, there is no chance for its assigned ifindex
+to be already present in a freshly created netns, since its a greater
+number.
+
+However, when moving a physical interface, there is a chance that its
+ifindex in the host netns is not free in the new netns. The patch
+forces ifindex re-read for the LXC_NET_PHYS case to update the
+lxc_netdev structure.
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
+---
+ src/lxc/conf.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c
+index 6b3f318..08b0d0f 100644
+--- a/src/lxc/conf.c
++++ b/src/lxc/conf.c
+@@ -1846,6 +1846,14 @@ static int setup_netdev(struct lxc_netdev *netdev)
+ 		return 0;
+ 	}
+ 
++	/* get the new ifindex in case of physical netdev */
++	if (netdev->type == LXC_NET_PHYS)
++		if (!(netdev->ifindex = if_nametoindex(netdev->link))) {
++			ERROR("failed to get ifindex for %s",
++				netdev->link);
++			return -1;
++		}
++
+ 	/* retrieve the name of the interface */
+ 	if (!if_indextoname(netdev->ifindex, current_ifname)) {
+ 		ERROR("no interface corresponding to index '%d'",
+-- 
+1.7.11.7
+
diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 8f7736b..03d4589 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -24,8 +24,9 @@ RDEPENDS_${PN} = " \
 SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
 	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
 	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
-    file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
-    file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
+	file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
+	file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
+	file://lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch \
 	"
 SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
 SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
-- 
1.7.11.7



