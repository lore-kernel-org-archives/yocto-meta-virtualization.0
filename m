Return-Path: <Maxin.John@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19621E007EA; Tue, 29 Jul 2014 05:46:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 748E9E007E4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jul 2014 05:46:09 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 29 Jul 2014 14:46:06 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 02221288F33;
	Tue, 29 Jul 2014 14:46:05 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 29 Jul 2014 14:46:02 +0200
Message-ID: <1406637962-64017-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] lxc: Uprev to 1.0.5
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
X-List-Received-Date: Tue, 29 Jul 2014 12:46:23 -0000
Content-Type: text/plain

Update lxc to latest available version: 1.0.5
Remove already upstreamed patches.

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 ...ork_type-set-macvlan-default-mode-to-priv.patch | 43 ----------------------
 ...-follow-symlinks-when-inspecting-busybox-.patch | 27 --------------
 ...-Add-missing-LXC_NET_NONE-option-refactor.patch | 38 -------------------
 .../lxc/{lxc_1.0.1.bb => lxc_1.0.5.bb}             |  9 +----
 4 files changed, 2 insertions(+), 115 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
 delete mode 100644 recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch
 rename recipes-containers/lxc/{lxc_1.0.1.bb => lxc_1.0.5.bb} (85%)

diff --git a/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch b/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
deleted file mode 100644
index 8cb321b..0000000
--- a/recipes-containers/lxc/files/config_network_type-set-macvlan-default-mode-to-priv.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 261658e80014c031852a024f8794dd7f2a2351ad Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Fri, 28 Mar 2014 10:31:41 -0400
-Subject: [PATCH] config_network_type: set macvlan default mode to private
-
-If a default mode is not set, the container requires an explicit
-mode specified in the config file, otherwise creating the
-container fails.
-
-Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
----
- src/lxc/confile.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/lxc/confile.c b/src/lxc/confile.c
-index d6cf151..90fb344 100644
---- a/src/lxc/confile.c
-+++ b/src/lxc/confile.c
-@@ -303,6 +303,8 @@ out:
- 	return ret;
- }
- 
-+static int macvlan_mode(int *valuep, const char *value);
-+
- static int config_network_type(const char *key, const char *value,
- 			       struct lxc_conf *lxc_conf)
- {
-@@ -337,8 +339,10 @@ static int config_network_type(const char *key, const char *value,
- 
- 	if (!strcmp(value, "veth"))
- 		netdev->type = LXC_NET_VETH;
--	else if (!strcmp(value, "macvlan"))
-+	else if (!strcmp(value, "macvlan")) {
- 		netdev->type = LXC_NET_MACVLAN;
-+		macvlan_mode(&netdev->priv.macvlan_attr.mode, "private");
-+	}
- 	else if (!strcmp(value, "vlan"))
- 		netdev->type = LXC_NET_VLAN;
- 	else if (!strcmp(value, "phys"))
--- 
-1.9.rc1
-
diff --git a/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch b/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
deleted file mode 100644
index 6882c16..0000000
--- a/recipes-containers/lxc/files/lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 50dbb8209bf65e4d24ccd06d3ca05004d0ddc63c Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Mon, 24 Mar 2014 12:43:03 -0400
-Subject: [PATCH] lxc-busybox: follow symlinks when inspecting busybox binary
-
-Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
----
- templates/lxc-busybox.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
-index e5a512a..246e743 100644
---- a/templates/lxc-busybox.in
-+++ b/templates/lxc-busybox.in
-@@ -187,7 +187,7 @@ configure_busybox()
-         return 1
-     fi
- 
--    file $(which busybox) | grep -q "statically linked"
-+    file -L $(which busybox) | grep -q "statically linked"
-     if [ $? -ne 0 ]; then
-         echo "warning : busybox is not statically linked."
-         echo "warning : The template script may not correctly"
--- 
-1.9.rc1
-
diff --git a/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch b/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch
deleted file mode 100644
index 81fde83..0000000
--- a/recipes-containers/lxc/files/network.c-Add-missing-LXC_NET_NONE-option-refactor.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b343592b45c91db8c18e863fac5ab8eeb94445d6 Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Wed, 26 Mar 2014 11:35:09 -0400
-Subject: [PATCH] network.c: Add missing LXC_NET_NONE option + refactor
-
-Add LXC_NET_NONE to known lxc_network_types, so parsing a config
-file with lxc.network.type = none does not result in failure
-(e.g. doc/examples/lxc-no-netns.conf). Options have also been
-reordered to match the enum in conf.h.
-
-Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
----
- src/lxc/network.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/lxc/network.c b/src/lxc/network.c
-index 090b9bd..a9900de 100644
---- a/src/lxc/network.c
-+++ b/src/lxc/network.c
-@@ -1202,11 +1202,12 @@ int lxc_bridge_attach(const char *bridge, const char *ifname)
- }
- 
- static const char* const lxc_network_types[LXC_NET_MAXCONFTYPE + 1] = {
-+	[LXC_NET_EMPTY]   = "empty",
- 	[LXC_NET_VETH]    = "veth",
- 	[LXC_NET_MACVLAN] = "macvlan",
--	[LXC_NET_VLAN]    = "vlan",
- 	[LXC_NET_PHYS]    = "phys",
--	[LXC_NET_EMPTY]   = "empty",
-+	[LXC_NET_VLAN]    = "vlan",
-+	[LXC_NET_NONE]    = "none",
- };
- 
- const char *lxc_net_type_to_str(int type)
--- 
-1.9.rc1
-
diff --git a/recipes-containers/lxc/lxc_1.0.1.bb b/recipes-containers/lxc/lxc_1.0.5.bb
similarity index 85%
rename from recipes-containers/lxc/lxc_1.0.1.bb
rename to recipes-containers/lxc/lxc_1.0.5.bb
index 4ef80d6..bea1ad0 100644
--- a/recipes-containers/lxc/lxc_1.0.1.bb
+++ b/recipes-containers/lxc/lxc_1.0.5.bb
@@ -3,7 +3,6 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PRIORITY = "optional"
-PR = "r4"
 DEPENDS = "libxml2 libcap"
 RDEPENDS_${PN} = " \
 		rsync \
@@ -24,15 +23,12 @@ RDEPENDS_${PN}-ptest += "file make"
 
 SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
-	file://config_network_type-set-macvlan-default-mode-to-priv.patch \
-	file://lxc-busybox-follow-symlinks-when-inspecting-busybox-.patch \
-	file://network.c-Add-missing-LXC_NET_NONE-option-refactor.patch \
 	file://runtest.patch \
 	file://run-ptest \
 	file://automake-ensure-VPATH-builds-work-correctly.patch \
 	"
-SRC_URI[md5sum] = "3c7379891e45713817ec873a167070b0"
-SRC_URI[sha256sum] = "17d8e5b575207b4fb57da0b8ba2d13f3e5ee20ce8ccd1259d6eae4bd5ca575b1"
+SRC_URI[md5sum] = "9d9af9e9e69a831cd50b58d91c786013"
+SRC_URI[sha256sum] = "02ac82e69a76d424e5443b9c577e84a8eaafcebf17cfd865eedee147e8ef8844"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
@@ -76,4 +72,3 @@ pkg_postinst_${PN}() {
 		/etc/init.d/populate-volatile.sh update
 	fi
 }
-
-- 
1.9.1


