Return-Path: <josep.puigdemont@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 7E825E00530
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 03:33:13 -0800 (PST)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 27 Feb 2014 12:33:10 +0100
Received: by sestofb10.enea.se (Postfix, from userid 3836)	id 06BC72880F9;
	Thu, 27 Feb 2014 12:33:11 +0100 (CET)
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 27 Feb 2014 12:33:06 +0100
Message-ID: <1393500786-16877-2-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393500786-16877-1-git-send-email-josep.puigdemont@enea.com>
References: <1393500786-16877-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] Update Linux Containers to lxc-1.0.0
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
X-List-Received-Date: Thu, 27 Feb 2014 11:33:15 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 .../lxc-0.9.0-always-strdup-rootfs-mount.patch     |   27 --------
 ...xc-0.9.0-check-when-bind-mounting-libdirs.patch |   44 ------------
 .../lxc-0.9.0-configure-allow-subdir-objects.patch |   35 ----------
 ...0.9.0-disable-udhcp-from-busybox-template.patch |   24 -------
 ...c-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch |   29 --------
 ...-chpasswd-functionality-for-busybox-hosts.patch |   70 --------------------
 ...tdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch |   49 --------------
 .../files/lxc-0.9.0-use-susv3-head-arguments.patch |   46 -------------
 ...1.0.0-disable-udhcp-from-busybox-template.patch |   24 +++++++
 recipes-containers/lxc/lxc_0.9.0.bb                |   69 -------------------
 recipes-containers/lxc/lxc_1.0.0.bb                |   62 +++++++++++++++++
 11 files changed, 86 insertions(+), 393 deletions(-)
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-configure-allow-subdir-objects.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
 delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
 create mode 100644 recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
 delete mode 100644 recipes-containers/lxc/lxc_0.9.0.bb
 create mode 100644 recipes-containers/lxc/lxc_1.0.0.bb

diff --git a/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch b/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
deleted file mode 100644
index 3e299d2..0000000
--- a/recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/src/lxc/conf.c b/src/lxc/conf.c
-index 6b3f318..2f8b9e6 100644
---- a/src/lxc/conf.c
-+++ b/src/lxc/conf.c
-@@ -2072,7 +2072,12 @@ struct lxc_conf *lxc_conf_init(void)
- 	new->console.slave = -1;
- 	new->console.name[0] = '\0';
- 	new->maincmd_fd = -1;
--	new->rootfs.mount = default_rootfs_mount;
-+	new->rootfs.mount = strdup(default_rootfs_mount);
-+	if (!new->rootfs.mount) {
-+		ERROR("lxc_conf_init : %m");
-+		free(new);
-+		return NULL;
-+	}
- 	new->kmsg = 1;
- 	lxc_list_init(&new->cgroup);
- 	lxc_list_init(&new->network);
-@@ -3084,7 +3089,7 @@ void lxc_conf_free(struct lxc_conf *conf)
- 		return;
- 	if (conf->console.path)
- 		free(conf->console.path);
--	if (conf->rootfs.mount != default_rootfs_mount)
-+	if (conf->rootfs.mount)
- 		free(conf->rootfs.mount);
- 	if (conf->rootfs.path)
- 		free(conf->rootfs.path);
diff --git a/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch b/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
deleted file mode 100644
index 4d21a02..0000000
--- a/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9e74f8161b8db05365fde0646b0c29c852afc3a0 Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Tue, 14 May 2013 11:54:23 +0300
-Subject: [PATCH] lxc-busybox: check when bind-mounting host libdirs
-
-The patch changes the busybox template behavior to automatically
-mount /lib and /usr/lib. In case one of these folders does not exist,
-starting the container will fail. Also, if there are other lib entries
-on the host - e.g. /usr/lib64 -  mount them as well.
-
-Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
----
- templates/lxc-busybox.in | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
-index cb425ec..49effae 100644
---- a/templates/lxc-busybox.in
-+++ b/templates/lxc-busybox.in
-@@ -240,13 +240,6 @@ lxc.pts = 1
- #lxc.aa_profile = unconfined
- EOF
- 
--if [ -d "$rootfs/lib" ]; then
--cat <<EOF >> $path/config
--lxc.mount.entry = /lib $rootfs/lib none ro,bind 0 0
--lxc.mount.entry = /usr/lib $rootfs/usr/lib none ro,bind 0 0
--EOF
--fi
--
-     libdirs="\
-         lib \
-         usr/lib \
-@@ -255,6 +248,7 @@ fi
- 
-     for dir in $libdirs; do
-         if [ -d "/$dir" ] && [ -d "$rootfs/$dir" ]; then
-+            echo "lxc.mount.entry = /$dir $rootfs/$dir none ro,bind 0 0" >> $path/config
-             echo "lxc.mount.entry = /$dir $dir none ro,bind 0 0" >> $path/config
-         fi
-     done
--- 
-1.7.11.7
-
diff --git a/recipes-containers/lxc/files/lxc-0.9.0-configure-allow-subdir-objects.patch b/recipes-containers/lxc/files/lxc-0.9.0-configure-allow-subdir-objects.patch
deleted file mode 100644
index 3b4dd84..0000000
--- a/recipes-containers/lxc/files/lxc-0.9.0-configure-allow-subdir-objects.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f3b86b0704cb62b77d80b90b40c1df68289d3558 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@windriver.com>
-Date: Fri, 31 Jan 2014 15:37:24 -0500
-Subject: [PATCH] configure: allow subdir objects
-
-autoconf-1.14 will fail to configure lxc with the following warning (and
-hence error):
-
-  | automake: warnings are treated as errors
-  | src/lxc/Makefile.am:79: warning: source file '../include/openpty.c' is in a subdirectory,
-  | src/lxc/Makefile.am:79: but option 'subdir-objects' is disabled
-
-So we tell autoconf that subdir objects are fine .. and the issue is solved.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
----
- configure.ac |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7dc82cfbcb8d..27ba250df3ac 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -6,7 +6,7 @@ AC_INIT([lxc], [0.9.0])
- AC_CONFIG_SRCDIR([configure.ac])
- AC_CONFIG_AUX_DIR([config])
- AC_CONFIG_HEADERS([src/config.h])
--AM_INIT_AUTOMAKE([-Wall -Werror -Wno-portability])
-+AM_INIT_AUTOMAKE([-Wall -Werror -Wno-portability subdir-objects])
- AC_CANONICAL_HOST
- AM_PROG_CC_C_O
- AC_GNU_SOURCE
--- 
-1.7.10.4
-
diff --git a/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
deleted file mode 100644
index 723be27..0000000
--- a/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From d7e07e7acb1cbad33806f49143a2a30b4468c369 Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Mon, 8 Apr 2013 18:30:19 +0300
-Subject: [PATCH] lxc-0.9.0-disable-udhcp-from-busybox-template
-
----
- templates/lxc-busybox.in | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
-index cb425ec..bb8c951 100644
---- a/templates/lxc-busybox.in
-+++ b/templates/lxc-busybox.in
-@@ -84,7 +84,6 @@ EOF
- #!/bin/sh
- /bin/syslogd
- /bin/mount -a
--/bin/udhcpc
- EOF
- 
-     # executable
--- 
-1.7.11.7
-
diff --git a/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch b/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
deleted file mode 100644
index fe9f8cc..0000000
--- a/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From fd95f2402dc70ad41fa2db8fb101f950196458a9 Mon Sep 17 00:00:00 2001
-From: Serge Hallyn <serge.hallyn@ubuntu.com>
-Date: Tue, 9 Apr 2013 16:23:05 -0500
-Subject: [PATCH] lxc.functions: don't let LXC_PATH= line end in failure
-
-Otherwise if called from dash with set -e, dash will exit.  This
-causes lxc-clone to fail.
-
-Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
----
- src/lxc/lxc.functions.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lxc/lxc.functions.in b/src/lxc/lxc.functions.in
-index b41f9b8..aa5717d 100644
---- a/src/lxc/lxc.functions.in
-+++ b/src/lxc/lxc.functions.in
-@@ -26,7 +26,7 @@ templatedir=@LXCTEMPLATEDIR@
- lxcinitdir=@LXCINITDIR@
- 
- get_default_lxcpath() {
--	LXC_PATH=$(grep -v "^#" "$globalconf" 2>/dev/null | grep "[ \t]*lxcpath[ \t]*=")
-+	LXC_PATH=$(grep -v "^#" "$globalconf" 2>/dev/null | grep "[ \t]*lxcpath[ \t]*=") || true
- 	if [ -n "$LXC_PATH" ]; then
- 		echo $LXC_PATH | awk -F= '{ print $2 }'
- 	else
--- 
-1.7.11.7
-
diff --git a/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch b/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
deleted file mode 100644
index d07c658..0000000
--- a/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 4ddc14bd0866ff769421857044dd14867f1944d5 Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Thu, 11 Apr 2013 16:15:43 +0300
-Subject: [PATCH v2] lxc-template: enable chroot + chpasswd functionality for
- Busybox hosts
-
-This patch supports the scenario where a user wants to install a
-busybox container on a busybox host.
-
-When running the template, in order to change the root password,
-the template needs to do the chroot. On busybox-powered hosts, chroot
-is not part of the coreutils package - it's part of busybox. And the
-busybox implementation or chroot only works if it has /lib in the new
-root populated with the right binaries (or at least that's the
-solution I found to make it work).
-
-The temporarily bind-mounts /lib in the NEWROOT, chroots there,
-changes the password, goes back and unmounts. This set of operations
-is contained in a new MOUNT namespace, using the lxc-unshare call.
-
-Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
----
- templates/lxc-busybox.in | 30 ++++++++++++++++++++++++++++--
- 1 file changed, 28 insertions(+), 2 deletions(-)
-
-diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
-index cb425ec..2ca2bfd 100644
---- a/templates/lxc-busybox.in
-+++ b/templates/lxc-busybox.in
-@@ -189,9 +189,35 @@ configure_busybox()
-     # passwd exec must be setuid
-     chmod +s $rootfs/bin/passwd
-     touch $rootfs/etc/shadow
--    echo "setting root passwd to root"
--    echo "root:root" | chroot $rootfs chpasswd
- 
-+    # setting passwd for root
-+    CHPASSWD_FILE=$rootfs/root/chpasswd.sh
-+
-+    cat <<EOF >$CHPASSWD_FILE
-+echo "setting root password to \"root\""
-+
-+mount --bind /lib $rootfs/lib
-+if [ \$? -ne 0 ]; then
-+    echo "Failed bind-mounting /lib at $rootfs/lib"
-+    exit 1
-+fi
-+
-+chroot $rootfs chpasswd <<EOFF 2>/dev/null
-+root:root
-+EOFF
-+
-+
-+if [ \$? -ne 0 ]; then
-+    echo "Failed to change root password"
-+    exit 1
-+fi
-+
-+umount $rootfs/lib
-+
-+EOF
-+
-+    lxc-unshare -s MOUNT -- /bin/sh < $CHPASSWD_FILE
-+    rm $CHPASSWD_FILE
- 
-     # add ssh functionality if dropbear package available on host
-     which dropbear >/dev/null 2>&1
--- 
-1.7.11.7
-
diff --git a/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch b/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
deleted file mode 100644
index 767e389..0000000
--- a/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8712c58ab896f072cf95e3ffa3ceac1fa10f6295 Mon Sep 17 00:00:00 2001
-From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Date: Thu, 14 Nov 2013 12:31:55 +0200
-Subject: [PATCH] setup_netdev: re-read ifindex in LXC_NET_PHYS case
-
-When moving an interface from the host netns to a container's,
-the ifindex might not remain the same. This happens when the
-index of the host interface is already assigned to another interface
-in the new netns.
-
-For veth/vlan/macvlan, virtual interfaces are first created on the host,
-and then moved in the container. Since they are created after all other
-interfaces are discovered, there is no chance for its assigned ifindex
-to be already present in a freshly created netns, since its a greater
-number.
-
-However, when moving a physical interface, there is a chance that its
-ifindex in the host netns is not free in the new netns. The patch
-forces ifindex re-read for the LXC_NET_PHYS case to update the
-lxc_netdev structure.
-
-Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
-Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
----
- src/lxc/conf.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/lxc/conf.c b/src/lxc/conf.c
-index 6b3f318..08b0d0f 100644
---- a/src/lxc/conf.c
-+++ b/src/lxc/conf.c
-@@ -1846,6 +1846,14 @@ static int setup_netdev(struct lxc_netdev *netdev)
- 		return 0;
- 	}
- 
-+	/* get the new ifindex in case of physical netdev */
-+	if (netdev->type == LXC_NET_PHYS)
-+		if (!(netdev->ifindex = if_nametoindex(netdev->link))) {
-+			ERROR("failed to get ifindex for %s",
-+				netdev->link);
-+			return -1;
-+		}
-+
- 	/* retrieve the name of the interface */
- 	if (!if_indextoname(netdev->ifindex, current_ifname)) {
- 		ERROR("no interface corresponding to index '%d'",
--- 
-1.7.11.7
-
diff --git a/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch b/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
deleted file mode 100644
index 86ed7d2..0000000
--- a/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-status: Pending
-
---- lxc-0.9.0.orig/src/lxc/lxc-checkconfig.in
-+++ lxc-0.9.0/src/lxc/lxc-checkconfig.in
-@@ -67,7 +67,7 @@ print_cgroups() {
-   awk '$1 !~ /#/ && $3 == mp { print $2; } ; END { exit(0); } '  "mp=$1" "$2" ;
- }
-
--CGROUP_MNT_PATH=`print_cgroups cgroup /proc/self/mounts | head -1`
-+CGROUP_MNT_PATH=`print_cgroups cgroup /proc/self/mounts | head -n 1`
- KVER_MAJOR=$($GREP '^# Linux' $CONFIG | \
-     sed -r 's/.* ([0-9])\.[0-9]{1,2}\.[0-9]{1,3}.*/\1/')
- if [ "$KVER_MAJOR" = "2" ]; then
---- lxc-0.9.0.orig/src/lxc/lxc-netstat.in
-+++ lxc-0.9.0/src/lxc/lxc-netstat.in
-@@ -107,7 +107,7 @@ if [ ! -d "$parent_cgroup" ]; then
-     exit 1
- fi
-
--pid=$(head -1 $parent_cgroup/$name/tasks)
-+pid=$(head -n 1 $parent_cgroup/$name/tasks)
-
- if [ -z "$pid" ]; then
-     echo "$(basename $0): no process found for '$name'" >&2
---- lxc-0.9.0.orig/templates/lxc-alpine.in
-+++ lxc-0.9.0/templates/lxc-alpine.in
-@@ -99,7 +99,7 @@ EOF
-     if [ "$nics" -eq 1 ] && ! grep -q "^lxc.network.hwaddr" $path/config; then
-         # see http://sourceforge.net/tracker/?func=detail&aid=3411497&group_id=163076&atid=826303
-         hwaddr="fe:$(dd if=/dev/urandom bs=8 count=1 2>/dev/null |od -t x8 | \
--                      head -1 |awk '{print $2}' | cut -c1-10 |\
-+                      head -n 1 |awk '{print $2}' | cut -c1-10 |\
-                       sed 's/\(..\)/\1:/g; s/.$//')"
-         echo "lxc.network.hwaddr = $hwaddr" >> $path/config
-     fi
---- lxc-0.9.0.orig/templates/lxc-oracle.in
-+++ lxc-0.9.0/templates/lxc-oracle.in
-@@ -327,7 +327,7 @@ container_config_create()
-     # generate a hwaddr for the container with a high mac address
-     # see http://sourceforge.net/tracker/?func=detail&aid=3411497&group_id=163076&atid=826303
-     local hwaddr="fe:`dd if=/dev/urandom bs=8 count=1 2>/dev/null |od -t x8 | \
--                      head -1 |awk '{print $2}' | cut -c1-10 |\
-+                      head -n 1 |awk '{print $2}' | cut -c1-10 |\
-                       sed 's/\(..\)/\1:/g; s/.$//'`"
-     mkdir -p $cfg_dir || die "unable to create config dir $cfg_dir"
-     cat <<EOF >> $cfg_dir/config || die "unable to create $cfg_dir/config"
diff --git a/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch b/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
new file mode 100644
index 0000000..723be27
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
@@ -0,0 +1,24 @@
+From d7e07e7acb1cbad33806f49143a2a30b4468c369 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Mon, 8 Apr 2013 18:30:19 +0300
+Subject: [PATCH] lxc-0.9.0-disable-udhcp-from-busybox-template
+
+---
+ templates/lxc-busybox.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index cb425ec..bb8c951 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -84,7 +84,6 @@ EOF
+ #!/bin/sh
+ /bin/syslogd
+ /bin/mount -a
+-/bin/udhcpc
+ EOF
+ 
+     # executable
+-- 
+1.7.11.7
+
diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
deleted file mode 100644
index e1de3c7..0000000
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-PRIORITY = "optional"
-PR = "r3"
-DEPENDS = "libxml2 libcap"
-RDEPENDS_${PN} = " \
-		rsync \
-		gzip \
-		libcap-bin \
-		bridge-utils \
-		dnsmasq \
-		perl-module-strict \
-		perl-module-getopt-long \
-		perl-module-vars \
-		perl-module-warnings-register \
-		perl-module-exporter \
-		perl-module-constant \
-		perl-module-overload \
-		perl-module-exporter-heavy \
-"
-
-SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
-	file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
-	file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
-	file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
-	file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
-	file://lxc-0.9.0-always-strdup-rootfs-mount.patch \
-	file://lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch \
-	file://lxc-0.9.0-use-susv3-head-arguments.patch \
-        file://lxc-0.9.0-configure-allow-subdir-objects.patch \
-	"
-SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
-SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-# Let's not configure for the host distro.
-#
-EXTRA_OECONF += "--with-distro=${DISTRO}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
-PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
-PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
-
-inherit autotools pkgconfig
-
-FILES_${PN}-doc = "${mandir} ${infodir}"
-# For LXC the docdir only contains example configuration files and should be included in the lxc package
-FILES_${PN} += "${docdir}"
-FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
-
-do_install_append() {
-	# The /var/cache/lxc directory created by the Makefile
-	# is wiped out in volatile, we need to create this at boot.
-	rm -rf ${D}${localstatedir}/cache
-	install -d ${D}${sysconfdir}/default/volatiles
-	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
-	     > ${D}${sysconfdir}/default/volatiles/99_lxc
-
-}
-
-pkg_postinst_${PN}() {
-	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
-		/etc/init.d/populate-volatile.sh update
-	fi
-}
diff --git a/recipes-containers/lxc/lxc_1.0.0.bb b/recipes-containers/lxc/lxc_1.0.0.bb
new file mode 100644
index 0000000..36ac78d
--- /dev/null
+++ b/recipes-containers/lxc/lxc_1.0.0.bb
@@ -0,0 +1,62 @@
+DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+PRIORITY = "optional"
+PR = "r3"
+DEPENDS = "libxml2 libcap"
+RDEPENDS_${PN} = " \
+		rsync \
+		gzip \
+		libcap-bin \
+		bridge-utils \
+		dnsmasq \
+		perl-module-strict \
+		perl-module-getopt-long \
+		perl-module-vars \
+		perl-module-warnings-register \
+		perl-module-exporter \
+		perl-module-constant \
+		perl-module-overload \
+		perl-module-exporter-heavy \
+"
+
+SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+	file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
+	"
+SRC_URI[md5sum] = "87a9d168a6e55326303cce3b2cb7f82e"
+SRC_URI[sha256sum] = "0992212ddaad01dfe8c048e130566b73dd5f34191585f36bdac07a4f8a91f3bd"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+# Let's not configure for the host distro.
+#
+EXTRA_OECONF += "--with-distro=${DISTRO}"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
+PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
+PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
+
+inherit autotools pkgconfig
+
+FILES_${PN}-doc = "${mandir} ${infodir}"
+# For LXC the docdir only contains example configuration files and should be included in the lxc package
+FILES_${PN} += "${docdir}"
+FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
+
+do_install_append() {
+	# The /var/cache/lxc directory created by the Makefile
+	# is wiped out in volatile, we need to create this at boot.
+	rm -rf ${D}${localstatedir}/cache
+	install -d ${D}${sysconfdir}/default/volatiles
+	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
+	     > ${D}${sysconfdir}/default/volatiles/99_lxc
+
+}
+
+pkg_postinst_${PN}() {
+	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+		/etc/init.d/populate-volatile.sh update
+	fi
+}
-- 
1.7.10.4


