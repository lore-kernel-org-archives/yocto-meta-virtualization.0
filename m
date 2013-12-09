Return-Path: <kergoth@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55442E00779
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Dec 2013 10:32:35 -0800 (PST)
Received: by mail-ie0-f177.google.com with SMTP id tp5so6458814ieb.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Dec 2013 10:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=srKagklOJcxEjeYn8sQ4CXdSFfblHfp2nEsrlFxS8XM=;
	b=Pns+BX7C495HAagZZmmlLm5O56VhHoqJRKqyhGxtJGbMR0X/X9wAwKlxNqTcBUzW5t
	W6X8i+kJ8NSve7/V0D8prO7HNBaam8WiQRo/k6llWRqEqxf5+Yp/i7E0GTpD1gy7pXAX
	OiEIV4uzDz8AAqwQNMOuM33k+v7R/irfmx1/9Qp8THsAXGDpEd3XcYCH+l8GAXj/2b5g
	OQkN1MRSYAjUirQWKC43m3kAVHuFEuGGquKLHMe5sdeRT/pmfPzGO4fggyRCtdROV9pw
	EwS98WLUsZtsbU7ARTHMeb7gtpD19iSwrCXBgTdCmU+pu5gfN+FkDV/m9gbFHdiEnwgz
	6WpA==
X-Received: by 10.50.221.99 with SMTP id qd3mr16550695igc.49.1386613954647;
	Mon, 09 Dec 2013 10:32:34 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id ri5sm15155447igc.1.2013.12.09.10.32.32
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Dec 2013 10:32:33 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  9 Dec 2013 11:32:27 -0700
Message-Id: <1386613947-5686-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] lxc: kill use of susv2 'head' args
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
X-List-Received-Date: Mon, 09 Dec 2013 18:32:36 -0000

Without enabling INCLUDE_SUSv2 in busybox, we need to use head's -n argument,
rather than -#.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../files/lxc-0.9.0-use-susv3-head-arguments.patch | 46 ++++++++++++++++++++++
 recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch

diff --git a/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch b/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
new file mode 100644
index 0000000..b9c516e
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
@@ -0,0 +1,46 @@
+Upstream-status: Pending
+
+--- lxc-0.9.0.orig/src/lxc/lxc-checkconfig.in
++++ lxc-0.9.0/src/lxc/lxc-checkconfig.in
+@@ -67,7 +67,7 @@ print_cgroups() {
+   awk '$1 !~ /#/ && $3 == mp { print $2; } ; END { exit(0); } '  "mp=$1" "$2" ;
+ }
+ 
+-CGROUP_MNT_PATH=`print_cgroups cgroup /proc/self/mounts | head -1`
++CGROUP_MNT_PATH=`print_cgroups cgroup /proc/self/mounts | head -n 1`
+ KVER_MAJOR=$($GREP '^# Linux' $CONFIG | \
+     sed -r 's/.* ([0-9])\.[0-9]{1,2}\.[0-9]{1,3}.*/\1/')
+ if [ "$KVER_MAJOR" = "2" ]; then
+--- lxc-0.9.0.orig/src/lxc/lxc-netstat.in
++++ lxc-0.9.0/src/lxc/lxc-netstat.in
+@@ -107,7 +107,7 @@ if [ ! -d "$parent_cgroup" ]; then
+     exit 1
+ fi
+ 
+-pid=$(head -1 $parent_cgroup/$name/tasks)
++pid=$(head -n 1 $parent_cgroup/$name/tasks)
+ 
+ if [ -z "$pid" ]; then
+     echo "$(basename $0): no process found for '$name'" >&2
+--- lxc-0.9.0.orig/templates/lxc-alpine.in
++++ lxc-0.9.0/templates/lxc-alpine.in
+@@ -99,7 +99,7 @@ EOF
+     if [ "$nics" -eq 1 ] && ! grep -q "^lxc.network.hwaddr" $path/config; then
+         # see http://sourceforge.net/tracker/?func=detail&aid=3411497&group_id=163076&atid=826303
+         hwaddr="fe:$(dd if=/dev/urandom bs=8 count=1 2>/dev/null |od -t x8 | \
+-                      head -1 |awk '{print $2}' | cut -c1-10 |\
++                      head -n 1 |awk '{print $2}' | cut -c1-10 |\
+                       sed 's/\(..\)/\1:/g; s/.$//')"
+         echo "lxc.network.hwaddr = $hwaddr" >> $path/config
+     fi
+--- lxc-0.9.0.orig/templates/lxc-oracle.in
++++ lxc-0.9.0/templates/lxc-oracle.in
+@@ -327,7 +327,7 @@ container_config_create()
+     # generate a hwaddr for the container with a high mac address
+     # see http://sourceforge.net/tracker/?func=detail&aid=3411497&group_id=163076&atid=826303
+     local hwaddr="fe:`dd if=/dev/urandom bs=8 count=1 2>/dev/null |od -t x8 | \
+-                      head -1 |awk '{print $2}' | cut -c1-10 |\
++                      head -n 1 |awk '{print $2}' | cut -c1-10 |\
+                       sed 's/\(..\)/\1:/g; s/.$//'`"
+     mkdir -p $cfg_dir || die "unable to create config dir $cfg_dir"
+     cat <<EOF >> $cfg_dir/config || die "unable to create $cfg_dir/config"
diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
index 03d4589..be6f8ca 100644
--- a/recipes-containers/lxc/lxc_0.9.0.bb
+++ b/recipes-containers/lxc/lxc_0.9.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
 	file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
 	file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
 	file://lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch \
+	file://lxc-0.9.0-use-susv3-head-arguments.patch \
 	"
 SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
 SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
-- 
1.8.3.4


