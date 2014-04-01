Return-Path: <bogdan.purcareata@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe005.messaging.microsoft.com [216.32.181.185])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FBD0E00C53
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Apr 2014 02:59:20 -0700 (PDT)
Received: from mail63-ch1-R.bigfish.com (10.43.68.247) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.22; Tue, 1 Apr 2014 09:59:19 +0000
Received: from mail63-ch1 (localhost [127.0.0.1])	by mail63-ch1-R.bigfish.com
	(Postfix) with ESMTP id 718271A03BC	for
	<meta-virtualization@yoctoproject.org>;
	Tue,  1 Apr 2014 09:59:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h177df4h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail63-ch1 (localhost.localdomain [127.0.0.1]) by mail63-ch1
	(MessageSwitch) id 1396346356772447_24582;
	Tue,  1 Apr 2014 09:59:16 +0000 (UTC)
Received: from CH1EHSMHS039.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail63-ch1.bigfish.com (Postfix) with ESMTP id
	AE6EB22004A;	Tue,  1 Apr 2014 09:59:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS039.bigfish.com
	(10.43.69.248) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 1 Apr 2014 09:59:16 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 1 Apr 2014 09:59:15 +0000
Received: from fsr-fed1764-008.ea.freescale.net
	(fsr-fed1764-008.ea.freescale.net [10.171.73.44])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id s319xDcN017294;
	Tue, 1 Apr 2014 02:59:14 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 1 Apr 2014 07:58:16 -0400
Message-ID: <1396353496-3511-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.9.rc1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] lxc: bug fixes from upstream
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
X-List-Received-Date: Tue, 01 Apr 2014 09:59:22 -0000
Content-Type: text/plain

Adding a couple of upstream fixes for lxc:
- follow symlinks when determining if Busybox is statically linked
- don't fail for lxc.network.type = none
- don't fail if no default macvlan mode is specified

More details are available in the individual patches.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...ork_type-set-macvlan-default-mode-to-priv.patch | 43 ++++++++++++++++++++++
 ...-follow-symlinks-when-inspecting-busybox-.patch | 27 ++++++++++++++
 ...-Add-missing-LXC_NET_NONE-option-refactor.patch | 38 +++++++++++++++++++
 recipes-containers/lxc/lxc_1.0.0.bb                |  5 ++-
 4 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
 create mode 100644 recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
 create mode 100644 recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch

diff --git a/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch b/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
new file mode 100644
index 0000000..8cb321b
--- /dev/null
+++ b/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
@@ -0,0 +1,43 @@
+From 261658e80014c031852a024f8794dd7f2a2351ad Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Fri, 28 Mar 2014 10:31:41 -0400
+Subject: [PATCH] config_network_type: set macvlan default mode to private
+
+If a default mode is not set, the container requires an explicit
+mode specified in the config file, otherwise creating the
+container fails.
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
+---
+ src/lxc/confile.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/lxc/confile.c b/src/lxc/confile.c
+index d6cf151..90fb344 100644
+--- a/src/lxc/confile.c
++++ b/src/lxc/confile.c
+@@ -303,6 +303,8 @@ out:
+ 	return ret;
+ }
+ 
++static int macvlan_mode(int *valuep, const char *value);
++
+ static int config_network_type(const char *key, const char *value,
+ 			       struct lxc_conf *lxc_conf)
+ {
+@@ -337,8 +339,10 @@ static int config_network_type(const char *key, const char *value,
+ 
+ 	if (!strcmp(value, "veth"))
+ 		netdev->type = LXC_NET_VETH;
+-	else if (!strcmp(value, "macvlan"))
++	else if (!strcmp(value, "macvlan")) {
+ 		netdev->type = LXC_NET_MACVLAN;
++		macvlan_mode(&netdev->priv.macvlan_attr.mode, "private");
++	}
+ 	else if (!strcmp(value, "vlan"))
+ 		netdev->type = LXC_NET_VLAN;
+ 	else if (!strcmp(value, "phys"))
+-- 
+1.9.rc1
+
diff --git a/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch b/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
new file mode 100644
index 0000000..6882c16
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
@@ -0,0 +1,27 @@
+From 50dbb8209bf65e4d24ccd06d3ca05004d0ddc63c Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Mon, 24 Mar 2014 12:43:03 -0400
+Subject: [PATCH] lxc-busybox: follow symlinks when inspecting busybox binary
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
+---
+ templates/lxc-busybox.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index e5a512a..246e743 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -187,7 +187,7 @@ configure_busybox()
+         return 1
+     fi
+ 
+-    file $(which busybox) | grep -q "statically linked"
++    file -L $(which busybox) | grep -q "statically linked"
+     if [ $? -ne 0 ]; then
+         echo "warning : busybox is not statically linked."
+         echo "warning : The template script may not correctly"
+-- 
+1.9.rc1
+
diff --git a/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch b/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch
new file mode 100644
index 0000000..81fde83
--- /dev/null
+++ b/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch
@@ -0,0 +1,38 @@
+From b343592b45c91db8c18e863fac5ab8eeb94445d6 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Wed, 26 Mar 2014 11:35:09 -0400
+Subject: [PATCH] network.c: Add missing LXC_NET_NONE option + refactor
+
+Add LXC_NET_NONE to known lxc_network_types, so parsing a config
+file with lxc.network.type = none does not result in failure
+(e.g. doc/examples/lxc-no-netns.conf). Options have also been
+reordered to match the enum in conf.h.
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
+---
+ src/lxc/network.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/lxc/network.c b/src/lxc/network.c
+index 090b9bd..a9900de 100644
+--- a/src/lxc/network.c
++++ b/src/lxc/network.c
+@@ -1202,11 +1202,12 @@ int lxc_bridge_attach(const char *bridge, const char *ifname)
+ }
+ 
+ static const char* const lxc_network_types[LXC_NET_MAXCONFTYPE + 1] = {
++	[LXC_NET_EMPTY]   = "empty",
+ 	[LXC_NET_VETH]    = "veth",
+ 	[LXC_NET_MACVLAN] = "macvlan",
+-	[LXC_NET_VLAN]    = "vlan",
+ 	[LXC_NET_PHYS]    = "phys",
+-	[LXC_NET_EMPTY]   = "empty",
++	[LXC_NET_VLAN]    = "vlan",
++	[LXC_NET_NONE]    = "none",
+ };
+ 
+ const char *lxc_net_type_to_str(int type)
+-- 
+1.9.rc1
+
diff --git a/recipes-containers/lxc/lxc_1.0.0.bb b/recipes-containers/lxc/lxc_1.0.0.bb
index 36ac78d..d5fc680 100644
--- a/recipes-containers/lxc/lxc_1.0.0.bb
+++ b/recipes-containers/lxc/lxc_1.0.0.bb
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PRIORITY = "optional"
-PR = "r3"
+PR = "r4"
 DEPENDS = "libxml2 libcap"
 RDEPENDS_${PN} = " \
 		rsync \
@@ -23,6 +23,9 @@ RDEPENDS_${PN} = " \
 
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
+	file://config_network_type-set-macvlan-default-mode-to-priv.patch \
+	file://lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch \
+	file://network.c-Add-missing-LXC_NET_NONE-option-refactor.patch \
 	"
 SRC_URI[md5sum] = "87a9d168a6e55326303cce3b2cb7f82e"
 SRC_URI[sha256sum] = "0992212ddaad01dfe8c048e130566b73dd5f34191585f36bdac07a4f8a91f3bd"
-- 
1.9.rc1



