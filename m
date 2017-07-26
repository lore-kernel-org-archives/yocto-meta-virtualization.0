Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3156AE00BBC; Tue, 25 Jul 2017 17:42:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B2FFE00B6F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 17:41:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6Q0fwK7028369
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Jul 2017 17:41:58 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 25 Jul 2017 17:41:57 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Wed, 26 Jul 2017 08:42:09 +0800
Message-ID: <1501029729-15543-4-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501029729-15543-1-git-send-email-yi.zhao@windriver.com>
References: <1501029729-15543-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-cloud-services][PATCH V2 3/3] glusterfs: uprev to 3.11.1
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
X-List-Received-Date: Wed, 26 Jul 2017 00:42:06 -0000
Content-Type: text/plain

* Add systemd support

* Drop the following patch which already fixed in upstream:
  0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...nt.glusterfs-not-accepting-version-argume.patch |  33 -----
 ...c-allow-PYTHON-values-to-be-passed-via-en.patch |  67 ++++++++++
 .../dependence-on-correct-header-file-path.patch   |  32 +++++
 .../files/glusterd-change-port-range.patch         |  39 ++++++
 .../files/{glusterd-ovp => glusterd.init}          |   6 +-
 recipes-extended/glusterfs/files/glusterd.service  |  12 ++
 ...fs-api-remove-unnecessary-library-options.patch |  31 +++++
 .../glusterfs-change-default-nfs-port-number.patch |  49 +++++++
 ...onfigure-automake-with-subdir-objects-for.patch |  37 ++++++
 ...glusterfs-disable-default-startup-scripts.patch |  24 +++-
 .../libglusterfs-Don-t-link-against-libfl.patch    |  46 +++++++
 ...python-work-around-host-and-target-python.patch |  81 ++++++++++++
 .../files/xlator-host-contamination-3.4.patch      |  34 +++--
 recipes-extended/glusterfs/glusterfs.inc           | 142 ++++++++++++++++-----
 recipes-extended/glusterfs/glusterfs_3.11.1.bb     |   6 +
 recipes-extended/glusterfs/glusterfs_3.4.2.bb      |  12 --
 16 files changed, 550 insertions(+), 101 deletions(-)
 delete mode 100644 recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
 create mode 100644 recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
 create mode 100644 recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
 create mode 100644 recipes-extended/glusterfs/files/glusterd-change-port-range.patch
 rename recipes-extended/glusterfs/files/{glusterd-ovp => glusterd.init} (92%)
 create mode 100644 recipes-extended/glusterfs/files/glusterd.service
 create mode 100644 recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
 create mode 100644 recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
 create mode 100644 recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
 create mode 100644 recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
 create mode 100644 recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
 create mode 100644 recipes-extended/glusterfs/glusterfs_3.11.1.bb
 delete mode 100644 recipes-extended/glusterfs/glusterfs_3.4.2.bb

diff --git a/recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch b/recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
deleted file mode 100644
index d89fde9..0000000
--- a/recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 960a101ab795fed1b7505ed9db61769cbdb9450e Mon Sep 17 00:00:00 2001
-From: Sebastian Lenartowicz <Sebastian.Lenartowicz@windriver.com>
-Date: Wed, 4 Dec 2013 15:16:02 -0500
-Subject: [PATCH 1/1] Fix for mount.glusterfs not accepting --version argument
-
-The mount.glusterfs shell script serves as a convenient "gatekeeper"
-for the glusterfs program itself, and performs a few setup tasks,
-depending on the options it's given. However, an overzealous check
-for the number of arguments (any number of arguments less than 2)
-was preventing the --version and --help arguments from being usable
-on their own. This patch solves that by dropping the check (the
-glusterfs software itself can throw out commands with too few
-arguments, which makes the check redundant in any event).
----
- xlators/mount/fuse/utils/mount.glusterfs.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xlators/mount/fuse/utils/mount.glusterfs.in b/xlators/mount/fuse/utils/mount.glusterfs.in
-index 2a8183c..ea18efb 100755
---- a/xlators/mount/fuse/utils/mount.glusterfs.in
-+++ b/xlators/mount/fuse/utils/mount.glusterfs.in
-@@ -395,7 +395,7 @@ main ()
-             pos_args=$((pos_args+1))
-         fi
-     done
--    if [ $in_opt = "yes" -o $pos_args -lt 2 ]; then
-+    if [ $in_opt = "yes" ]; then
-         usage
-         exit 1
-     fi
--- 
-1.7.9.7
-
diff --git a/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
new file mode 100644
index 0000000..a33ffce
--- /dev/null
+++ b/recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
@@ -0,0 +1,67 @@
+From d535a5448191d433e328b0a25a0710da203c44e7 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 19 Jul 2017 09:40:57 +0800
+Subject: [PATCH] configure.ac: allow PYTHON values to be passed via env
+
+Allow the recipe can specify specific values for PYTHON.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac | 26 ++++++++++----------------
+ 1 file changed, 10 insertions(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 43efd6d..7a31038 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -544,9 +544,6 @@ fi
+ dnl Check if version matches that we require
+ PYTHONDEV_CPPFLAGS=
+ PYTHONDEV_LDFLAGS=
+-BUILD_PYTHON_SITE_PACKAGES=
+-BUILD_PYTHON_INC=
+-BUILD_PYTHON_LIB=
+ have_python2=no
+ have_Python_h=no
+ 
+@@ -555,25 +552,22 @@ if echo $PYTHON_VERSION | grep -q ^2; then
+ 
+    dnl Use pkg-config to get runtime search patch missing from ${PYTHON}-config
+    dnl Just do "true" on failure so that configure does not bail out
+-   PKG_CHECK_MODULES([PYTHON], "python-$PYTHON_VERSION",,true)
++   PKG_CHECK_MODULES([PYTHONDEV], "python-$PYTHON_VERSION", [AC_SUBST(PYTHONDEV_CPPFLAGS) AC_SUBST(PYTHONDEV_LDFLAGS)], AC_MSG_ERROR([Can not find python]))
+ 
+-   PYTHONDEV_CPPFLAGS="`${PYTHON}-config --cflags`"
+-   dnl Edit out the flags that are not required or are conflicting
+-   PYTHONDEV_CPPFLAGS=`echo ${PYTHONDEV_CPPFLAGS} | sed -e 's/-Wp,-D_FORTIFY_SOURCE=[[0-9]]//g'`
+-
+-   dnl Find python libs at user configured libdir and also "lib" under prefix
+-   PYTHONDEV_LDFLAGS="${PYTHON_LIBS} -L`${PYTHON}-config --prefix`/lib -L`${PYTHON}-config --prefix`/$libdir `${PYTHON}-config --ldflags`"
+-
+-   BUILD_PYTHON_SITE_PACKAGES=${pythondir}
+-   BUILD_PYTHON_INC=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_inc())" 2>/dev/null`
+-   BUILD_PYTHON_LIB=python$PYTHON_VERSION
++   if test -z "${BUILD_PYTHON_SITE_PACKAGES}"; then
++      BUILD_PYTHON_SITE_PACKAGES=${pythondir}
++   fi
++   if test -z "${BUILD_PYTHON_INC}"; then
++      BUILD_PYTHON_INC=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_inc())" 2>/dev/null`
++   fi
++   if test -z "${BUILD_PYTHON_LIB}"; then
++      BUILD_PYTHON_LIB=python$PYTHON_VERSION
++   fi
+ 
+    dnl Now check for python header using the include path obtained above
+    AC_CHECK_HEADERS([${BUILD_PYTHON_INC}/Python.h],[have_Python_h=yes],[])
+ fi
+ 
+-AC_SUBST(PYTHONDEV_CPPFLAGS)
+-AC_SUBST(PYTHONDEV_LDFLAGS)
+ AC_SUBST(BUILD_PYTHON_SITE_PACKAGES)
+ AC_SUBST(BUILD_PYTHON_INC)
+ AC_SUBST(BUILD_PYTHON_LIB)
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
new file mode 100644
index 0000000..ff885f1
--- /dev/null
+++ b/recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
@@ -0,0 +1,32 @@
+From f5bb2a133292b37cd45e3c393e4d43364fe9a11a Mon Sep 17 00:00:00 2001
+From: Xulin Sun <xulin.sun@windriver.com>
+Date: Tue, 22 Mar 2016 16:05:32 +0800
+Subject: [PATCH] dependence on correct header file path
+
+To avoid the below building error, use the correct header file path.
+xlators/features/glupy/src/glupy.c:13:20: fatal error: Python.h:
+No such file or directory
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+---
+ xlators/features/glupy/src/glupy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xlators/features/glupy/src/glupy.c b/xlators/features/glupy/src/glupy.c
+index 7bb88c0..648b966 100644
+--- a/xlators/features/glupy/src/glupy.c
++++ b/xlators/features/glupy/src/glupy.c
+@@ -10,7 +10,7 @@
+ 
+ #include <ctype.h>
+ #include <sys/uio.h>
+-#include <Python.h>
++#include <python2.7/Python.h>
+ 
+ #ifndef _CONFIG_H
+ #define _CONFIG_H
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
new file mode 100644
index 0000000..0468460
--- /dev/null
+++ b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
@@ -0,0 +1,39 @@
+glusterd: change port range
+
+glusterfsd chooses tcp ports within the dynamic
+range [49152-65535] to provide its service.  When
+libvirt performs migration it indicates qemu
+to use tcp port within dynamic range [49152-49216]
+as well.
+
+When both glusterfsd and qemu/libvirt use the same
+port (e.g. 49152) then libvirtd crashes and
+causes migration failed.
+
+Modify the base-port for glusterfsd starting from
+59152 to avoid port conflict with qemu/libvirt
+
+Upstream-Status: Pending
+
+Signed-off-by: Vu Tran <vu.tran@windriver.com>
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+[Yi: minor adjust to apply the patch on 3.11.1]
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ extras/glusterd.vol | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/extras/glusterd.vol b/extras/glusterd.vol
+index d882007..c8dfe91 100644
+--- a/extras/glusterd.vol
++++ b/extras/glusterd.vol
+@@ -8,5 +8,5 @@ volume management
+     option ping-timeout 0
+     option event-threads 1
+ #   option transport.address-family inet6
+-#   option base-port 49152
++#   option base-port 59152
+ end-volume
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/glusterd-ovp b/recipes-extended/glusterfs/files/glusterd.init
similarity index 92%
rename from recipes-extended/glusterfs/files/glusterd-ovp
rename to recipes-extended/glusterfs/files/glusterd.init
index c020928..7851a50 100644
--- a/recipes-extended/glusterfs/files/glusterd-ovp
+++ b/recipes-extended/glusterfs/files/glusterd.init
@@ -58,13 +58,13 @@ stop()
        #pidof -c -o %PPID -x $GLUSTERFS &> /dev/null
        #[ $? -eq 0 ] && start-stop-daemon --stop --quiet --name $GLUSTERFS
 
-    if [ -f /etc/glusterd/nfs/run/nfs.pid ] ;then
-        pid=`cat /etc/glusterd/nfs/run/nfs.pid`;
+    if [ -f /var/lib/glusterd/nfs/run/nfs.pid ] ;then
+        pid=`cat /var/lib/glusterd/nfs/run/nfs.pid`;
         cmd=`ps -p $pid -o comm=`
 
         if [ $cmd == "glusterfs" ]; then
 	    start-stop-daemon --stop --quiet \
-	      --pidfile /etc/glusterd/nfs/run/nfs.pid
+	      --pidfile /var/lib/glusterd/nfs/run/nfs.pid
         fi
     fi
 }
diff --git a/recipes-extended/glusterfs/files/glusterd.service b/recipes-extended/glusterfs/files/glusterd.service
new file mode 100644
index 0000000..4835c82
--- /dev/null
+++ b/recipes-extended/glusterfs/files/glusterd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Gluster File System service for volume management
+After=syslog.target network.target
+
+[Service]
+Type=forking
+PIDFile=@localstatedir@/run/glusterd.pid
+ExecStartPre=@base_bindir@/mkdir -p @localstatedir@/log/glusterfs
+ExecStart=@SBINDIR@/glusterd -p @localstatedir@/run/glusterd.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
new file mode 100644
index 0000000..96d7352
--- /dev/null
+++ b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
@@ -0,0 +1,31 @@
+From a7e6549389f7358cad6a04544b2c1e4d2d5615d0 Mon Sep 17 00:00:00 2001
+From: Jim Somerville <Jim.Somerville@windriver.com>
+Date: Wed, 12 Feb 2014 15:41:50 +0000
+Subject: [PATCH] glusterfs-api remove unnecessary library options
+
+These cause QA errors when users of the api such
+as qemu generate their packages.  The reported
+error is unnecessary or redundant RPATH specified.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+---
+ glusterfs-api.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glusterfs-api.pc.in b/glusterfs-api.pc.in
+index 5d23454..8a602f6 100644
+--- a/glusterfs-api.pc.in
++++ b/glusterfs-api.pc.in
+@@ -8,5 +8,5 @@ Description: GlusterFS API
+ /* This is the API version, NOT package version */
+ Version: @GFAPI_VERSION@
+ Requires: @PKGCONFIG_UUID@
+-Libs: -L${libdir} @GFAPI_LIBS@ -lgfapi -lglusterfs -lgfrpc -lgfxdr
++Libs: -lgfapi -lglusterfs -lgfrpc -lgfxdr
+ Cflags: -I${includedir}/glusterfs -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64 -DUSE_POSIX_ACLS=@USE_POSIX_ACLS@
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
new file mode 100644
index 0000000..81439d1
--- /dev/null
+++ b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
@@ -0,0 +1,49 @@
+glusterfs: change default nfs port number
+
+Currently both native nfs and glusterfs-nfs use NFS well
+known port 2049.  This causes native nfs not to be able
+to run on the same machine if glusterfs is already running
+with the following error:
+
+starting 8 nfsd kernel threads: rpc.nfsd: unable to bind inet TCP
+socket: errno 98 (Address already in use) rpc.nfsd: unable to set
+any sockets for nfsd
+done
+starting mountd: done
+
+This error will be seen if there are gluster volumes started.
+
+This patch changes the default glusterfs NFS port from 2049
+to 38467.
+
+This patch infact inverses the commit
+3bee716c7a740c3cb6adececcea84bac0ba8abaa
+upstream https://github.com/gluster/glusterfs.git branch
+remotes/origin/release-3.4.
+
+Upstream-Status: Pending
+
+Signed-off-by: Vu Tran <vu.tran@windriver.com>
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+[Yi: minor adjust to apply the patch on 3.11.1]
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libglusterfs/src/common-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libglusterfs/src/common-utils.h b/libglusterfs/src/common-utils.h
+index 6bd2417..25a92b0 100644
+--- a/libglusterfs/src/common-utils.h
++++ b/libglusterfs/src/common-utils.h
+@@ -94,7 +94,7 @@ void trap (void);
+ /* Defining this here as it is needed by glusterd for setting
+  * nfs port in volume status.
+  */
+-#define GF_NFS3_PORT    2049
++#define GF_NFS3_PORT    38467
+ 
+ #define GF_CLIENT_PORT_CEILING 1024
+ #define GF_IANA_PRIV_PORTS_START 49152 /* RFC 6335 */
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
new file mode 100644
index 0000000..f385578
--- /dev/null
+++ b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
@@ -0,0 +1,37 @@
+From 32dffb85c81480d53e639ef84242ccfca26461f9 Mon Sep 17 00:00:00 2001
+From: Xulin Sun <xulin.sun@windriver.com>
+Date: Mon, 21 Mar 2016 17:32:50 +0800
+Subject: [PATCH] glusterfs: configure: automake with subdir-objects & foreign
+ parameters
+
+With subdir-objects & foreign for AM_INIT_AUTOMAKE to avoid
+autoconf execution failed when using automake 1.14 around version.
+
+Upstream-Status: Pending
+
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ff746ff..983572e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -13,11 +13,11 @@ AC_INIT([glusterfs],
+ AC_SUBST([PACKAGE_RELEASE],
+          [m4_esyscmd([build-aux/pkg-version --release])])
+ 
+-AM_INIT_AUTOMAKE(tar-pax)
++#AM_INIT_AUTOMAKE(tar-pax)
+ 
+ # Removes warnings when using automake 1.14 around (...but option 'subdir-objects' is disabled )
+ #but libglusterfs fails to build with contrib (Then are not set up that way?)
+-#AM_INIT_AUTOMAKE([subdir-objects])
++AM_INIT_AUTOMAKE([subdir-objects foreign])
+ 
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)])
+ 
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
index 4e0379b..cbff10e 100644
--- a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
@@ -2,24 +2,34 @@ The glusterfs code for installing start-up scripts checks for systemd
 directories on the build host, and if it finds them, it chooses systemd
 style scripts, otherwise init.d style scripts.  This behavior might
 conceivably be suitable for self-hosted builds, but it's grossly broken
-for cross-build environments.  Since we want to install custom WR scripts
+for cross-build environments.  Since we want to install custom scripts
 regardless of which script style we support, we patch glusterfs so that
 it doesn't install any of its default start-up scripts.
 
-Upstream-Status: Inappropriate [WR-specific change]
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+[Xulin: minor adjust to apply the patch]
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+[Yi: minor adjust to apply the patch on 3.11.1]
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- extras/Makefile.am |    2 +-
+ extras/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/extras/Makefile.am b/extras/Makefile.am
+index 3af1103..8978dde 100644
 --- a/extras/Makefile.am
 +++ b/extras/Makefile.am
-@@ -2,7 +2,7 @@
+@@ -4,7 +4,7 @@ addonexec_SCRIPTS = peer_add_secret_pub
  EditorModedir = $(docdir)
  EditorMode_DATA = glusterfs-mode.el glusterfs.vim
  
--SUBDIRS = init.d systemd benchmarking hook-scripts $(OCF_SUBDIR) LinuxRPM
-+SUBDIRS = benchmarking hook-scripts $(OCF_SUBDIR) LinuxRPM
+-SUBDIRS = init.d systemd benchmarking hook-scripts $(OCF_SUBDIR) LinuxRPM \
++SUBDIRS = benchmarking hook-scripts $(OCF_SUBDIR) LinuxRPM \
+           $(GEOREP_EXTRAS_SUBDIR) snap_scheduler firewalld cliutils
  
  confdir = $(sysconfdir)/glusterfs
- conf_DATA = glusterfs-logrotate
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
new file mode 100644
index 0000000..97548a5
--- /dev/null
+++ b/recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
@@ -0,0 +1,46 @@
+From c8be736bd972bb40b03a34bf9565e1bf4880fa7f Mon Sep 17 00:00:00 2001
+From: Xulin Sun <xulin.sun@windriver.com>
+Date: Fri, 25 Mar 2016 12:33:04 +0800
+Subject: [PATCH] libglusterfs: Don't link against libfl
+
+Remove reference to yywrap by adding "%option noyywrap" statements to
+the flex source file which doesn't override yywrap. After this, we no
+longer need to link against libfl and so no longer get errors about
+undefined references to yylex.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+---
+ libglusterfs/src/Makefile.am | 2 +-
+ libglusterfs/src/graph.l     | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libglusterfs/src/Makefile.am b/libglusterfs/src/Makefile.am
+index 85886c1..e90f553 100644
+--- a/libglusterfs/src/Makefile.am
++++ b/libglusterfs/src/Makefile.am
+@@ -8,7 +8,7 @@ libglusterfs_la_CPPFLAGS = $(GF_CPPFLAGS) -D__USE_FILE_OFFSET64 \
+ 	-I$(CONTRIBDIR)/libexecinfo ${ARGP_STANDALONE_CPPFLAGS} \
+ 	-DSBIN_DIR=\"$(sbindir)\" -I$(CONTRIBDIR)/timer-wheel
+ 
+-libglusterfs_la_LIBADD = @LEXLIB@ $(ZLIB_LIBS) $(MATH_LIB) $(UUID_LIBS)
++libglusterfs_la_LIBADD = $(ZLIB_LIBS) $(MATH_LIB) $(UUID_LIBS)
+ libglusterfs_la_LDFLAGS = -version-info $(LIBGLUSTERFS_LT_VERSION)
+ 
+ lib_LTLIBRARIES = libglusterfs.la
+diff --git a/libglusterfs/src/graph.l b/libglusterfs/src/graph.l
+index e4eba9c..78c6ef8 100644
+--- a/libglusterfs/src/graph.l
++++ b/libglusterfs/src/graph.l
+@@ -11,6 +11,7 @@
+ %x STRING
+ %option yylineno
+ %option noinput
++%option noyywrap
+ %{
+ 
+ #define YYSTYPE char *
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
new file mode 100644
index 0000000..9bb90d7
--- /dev/null
+++ b/recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
@@ -0,0 +1,81 @@
+From 485cf109af4adf3050b558cf16c61b620d7b9fb0 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 27 Feb 2014 21:50:40 -0500
+Subject: [PATCH] python: work around host and target python
+
+In order to allow for the build system to make use of python but not
+influence the installed software we create a split between PYTHON and
+TARGET_PYTHON.
+
+gsyncd.c is the only use of PYTHON on the insalled system so we can
+restrict the introduction of TARGET_PYTHON to gsyncd.c and the
+associated Makefile.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+[Xulin: minor adjust the code to apply the patch]
+Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+[Yi: minor adjust the code to apply the patch on 3.11.1]
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ configure.ac                    | 2 ++
+ geo-replication/src/Makefile.am | 3 ++-
+ geo-replication/src/gsyncd.c    | 6 +++---
+ 3 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7a31038..e54d92b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -270,6 +270,8 @@ AC_CANONICAL_HOST
+ AC_PROG_CC
+ AC_DISABLE_STATIC
+ AC_PROG_LIBTOOL
++AC_SUBST(TARGET_PYTHON)
++
+ AC_SUBST([shrext_cmds])
+ 
+ AC_CHECK_PROG([RPCGEN], [rpcgen], [yes], [no])
+diff --git a/geo-replication/src/Makefile.am b/geo-replication/src/Makefile.am
+index 9937a0b..07456fb 100644
+--- a/geo-replication/src/Makefile.am
++++ b/geo-replication/src/Makefile.am
+@@ -22,7 +22,8 @@ noinst_HEADERS = procdiggy.h
+ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
+ 	-I$(top_srcdir)/rpc/xdr/src -I$(top_builddir)/rpc/xdr/src \
+ 	-DGSYNCD_PREFIX=\"$(GLUSTERFS_LIBEXECDIR)\" -DUSE_LIBGLUSTERFS \
+-	-DSBIN_DIR=\"$(sbindir)\" -DPYTHON=\"$(PYTHON)\"
++	-DSBIN_DIR=\"$(sbindir)\" -DPYTHON=\"$(PYTHON)\"\
++	-DTARGET_PYTHON=\"$(TARGET_PYTHON)\"
+ 
+ AM_CFLAGS = -Wall $(GF_CFLAGS)
+ 
+diff --git a/geo-replication/src/gsyncd.c b/geo-replication/src/gsyncd.c
+index 2c48ca5..b1d1126 100644
+--- a/geo-replication/src/gsyncd.c
++++ b/geo-replication/src/gsyncd.c
+@@ -153,9 +153,9 @@ invoke_gsyncd (int argc, char **argv)
+                 goto error;
+ 
+         j = 0;
+-        python = getenv("PYTHON");
++        python = getenv("TARGET_PYTHON");
+         if(!python)
+-                python = PYTHON;
++                python = TARGET_PYTHON;
+         nargv[j++] = python;
+         nargv[j++] = GSYNCD_PREFIX"/python/syncdaemon/"GSYNCD_PY;
+         for (i = 1; i < argc; i++)
+@@ -205,7 +205,7 @@ find_gsyncd (pid_t pid, pid_t ppid, char *name, void *data)
+         ret = 0;
+         switch (zeros) {
+         case 2:
+-                if ((strcmp (basename (buf), basename (PYTHON)) ||
++                if ((strcmp (basename (buf), basename (TARGET_PYTHON)) ||
+                      strcmp (basename (buf + strlen (buf) + 1), GSYNCD_PY)) == 0) {
+                         ret = 1;
+                         break;
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch b/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
index 16cc47e..7d26ecf 100644
--- a/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
+++ b/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
@@ -4,36 +4,45 @@ the host's $(xlatordir) directory, resulting in contamination that gets
 flagged by Yocto's QA rules.
 
 Upstream-Status: Pending
+
 Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+[Xulin: minor adjust to apply the patch]
+Signed-off-by: Xuin Sun <xulin.sun@windriver.com>
 ---
- xlators/mgmt/glusterd/src/Makefile.am    |    2 --
- xlators/nfs/server/src/Makefile.am       |    2 --
- xlators/system/posix-acl/src/Makefile.am |    2 --
- 3 files changed, 6 deletions(-)
+ xlators/mgmt/glusterd/src/Makefile.am    | 2 +-
+ xlators/nfs/server/src/Makefile.am       | 2 --
+ xlators/system/posix-acl/src/Makefile.am | 2 --
+ 3 files changed, 1 insertion(+), 5 deletions(-)
 
+diff --git a/xlators/mgmt/glusterd/src/Makefile.am b/xlators/mgmt/glusterd/src/Makefile.am
+index a8f27fb..8243bf0 100644
 --- a/xlators/mgmt/glusterd/src/Makefile.am
 +++ b/xlators/mgmt/glusterd/src/Makefile.am
-@@ -33,8 +33,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_src
+@@ -54,7 +54,7 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src \
  
- AM_CFLAGS = -Wall $(GF_CFLAGS)
+ AM_CFLAGS = -Wall $(GF_CFLAGS) $(URCU_CFLAGS) $(URCU_CDS_CFLAGS)
+ 
+-AM_LDFLAGS = -L$(xlatordir) $(URCU_LIBS) $(URCU_CDS_LIBS)
++AM_LDFLAGS = -L$(URCU_LIBS) $(URCU_CDS_LIBS)
  
--AM_LDFLAGS = -L$(xlatordir)
--
  CLEANFILES =
  
- install-data-hook:
+diff --git a/xlators/nfs/server/src/Makefile.am b/xlators/nfs/server/src/Makefile.am
+index f91bbcf..b16bb9b 100644
 --- a/xlators/nfs/server/src/Makefile.am
 +++ b/xlators/nfs/server/src/Makefile.am
-@@ -19,6 +19,4 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) \
+@@ -22,6 +22,4 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) \
  
  AM_CFLAGS = -Wall $(GF_CFLAGS)
  
 -AM_LDFLAGS = -L$(xlatordir)
 -
  CLEANFILES =
+diff --git a/xlators/system/posix-acl/src/Makefile.am b/xlators/system/posix-acl/src/Makefile.am
+index bc5fbc2..0b9fabe 100644
 --- a/xlators/system/posix-acl/src/Makefile.am
 +++ b/xlators/system/posix-acl/src/Makefile.am
-@@ -10,8 +10,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_src
+@@ -10,8 +10,6 @@ AM_CPPFLAGS = $(GF_CPPFLAGS) -I$(top_srcdir)/libglusterfs/src
  
  AM_CFLAGS = -Wall $(GF_CFLAGS)
  
@@ -42,3 +51,6 @@ Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
  CLEANFILES =
  
  access-control-compat:
+-- 
+1.9.1
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 7a3f71a..e45dc9e 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -1,21 +1,25 @@
-#
-# Copyright (C) 2013 Wind River Systems, Inc.
-#
-
 SUMMARY = "Glusterfs distributed filesystem"
 DESCRIPTION = "\
-  GlusterFS is an open source, distributed file system capable of scaling \
-  to several petabytes (actually, 72 brontobytes!) and handling thousands \
-  of clients.  GlusterFS clusters together storage building blocks over \
-  Infiniband RDMA or TCP/IP interconnect, aggregating disk and memory \
-  resources and managing data in a single global namespace."
+GlusterFS is an open source, distributed file system capable of scaling \
+to several petabytes (actually, 72 brontobytes!) and handling thousands \
+of clients.  GlusterFS clusters together storage building blocks over \
+Infiniband RDMA or TCP/IP interconnect, aggregating disk and memory \
+resources and managing data in a single global namespace."
 HOMEPAGE = "http://www.gluster.org/"
 SECTION = "console/network"
 
-SRC_URI += "file://glusterd-ovp \
+SRC_URI += "file://glusterd.init \
+            file://glusterd.service \
+            file://glusterfs-configure-automake-with-subdir-objects-for.patch \
             file://xlator-host-contamination-3.4.patch \
             file://glusterfs-disable-default-startup-scripts.patch \
-            file://0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch \
+            file://glusterfs-api-remove-unnecessary-library-options.patch \
+            file://python-work-around-host-and-target-python.patch \
+            file://glusterfs-change-default-nfs-port-number.patch \
+            file://dependence-on-correct-header-file-path.patch \
+            file://libglusterfs-Don-t-link-against-libfl.patch \
+            file://glusterd-change-port-range.patch \
+            file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
@@ -23,51 +27,79 @@ LIC_FILES_CHKSUM = "file://COPYING-GPLV2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING-LGPLV3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://contrib/fuse-util/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit autotools update-rc.d pkgconfig
+inherit autotools pkgconfig distutils-base update-rc.d systemd
 
-DEPENDS += "bison-native flex-native fuse libaio libxml2 ncurses \
-            openssl python readline zlib"
+DEPENDS += "bison-native flex-native python-native fuse libaio libxml2 ncurses \
+            openssl python readline zlib liburcu util-linux glib-2.0 acl"
 
 EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
                 ac_cv_file__etc_SuSE_release=no \
                 ac_cv_file__etc_redhat_release=no \
                 --with-mountutildir=${sbindir} \
                 --disable-fusermount \
-                PYTHON=${bindir}/python"
-
-PACKAGECONFIG ??= "georeplication"
+                TARGET_PYTHON=${bindir}/python \
+                PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python \
+                BUILD_PYTHON_INC=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
+                BUILD_PYTHON_LIB=python${PYTHON_BASEVERSION} \
+                BUILD_PYTHON_SITE_PACKAGES=${PYTHON_SITEPACKAGES_DIR} \
+               "
+
+PACKAGECONFIG ??= "georeplication libibverbs"
 PACKAGECONFIG[bd-xlator] = "--enable-bd-xlator,--disable-bd-xlator,lvm2,"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
 PACKAGECONFIG[libibverbs] = "--enable-ibverbs,--disable-ibverbs,libibverbs librdmacm,"
 PACKAGECONFIG[ocf] = "--with-ocf,--without-ocf,,"
-PACKAGECONFIG[systemtap] = "--enable-systemtap,--disable-systemtap,systemtap,"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
 
 do_install_append() {
-        install -d ${D}${sysconfdir}/init.d
-        install -m 0755 ${WORKDIR}/glusterd-ovp \
-          ${D}${sysconfdir}/init.d/glusterd
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/glusterd.init \
+        ${D}${sysconfdir}/init.d/glusterd
 
-        # Mount looks for mount.* plug-ins in /sbin; fix it with a symlink.
-        mkdir -p ${D}${base_sbindir}
-        (cd ${D}${base_sbindir}; ln -s ..${sbindir}/mount.glusterfs .)
+    # Mount looks for mount.* plug-ins in /sbin; fix it with a symlink.
+    mkdir -p ${D}${base_sbindir}
+    (cd ${D}${base_sbindir}; ln -s ..${sbindir}/mount.glusterfs .)
 
-        # These are plug-ins, so they don't need libtool configs.
-        find ${D}${libdir}/glusterfs/${PV} -name '*.la' -exec rm -f '{}' ';'
+    # These are plug-ins, so they don't need libtool configs.
+    find ${D}${libdir}/glusterfs/${PV} -name '*.la' -exec rm -f '{}' ';'
 
-        # The RPM spec file creates these directories.
-        install -d ${D}${sysconfdir}/default/volatiles
-        cat > ${D}${sysconfdir}/default/volatiles/99_glusterfs << EOF
+    # The RPM spec file creates these directories.
+    install -d ${D}${sysconfdir}/default/volatiles
+    cat > ${D}${sysconfdir}/default/volatiles/99_glusterfs << EOF
 d root root 0755 ${localstatedir}/log/glusterfs none
 d root root 0755 ${localstatedir}/run/gluster none
 EOF
+
+    # Install systemd service files
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/glusterd.service ${D}${systemd_system_unitdir}
+    sed -i -e 's#@SBINDIR@#${sbindir}#g' \
+        -e 's#@base_bindir@#${base_bindir}#g' \
+        -e 's#@localstatedir@#${localstatedir}#g' \
+        ${D}${systemd_system_unitdir}/glusterd.service
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        cat > ${D}${sysconfdir}/tmpfiles.d/glusterfs.conf << EOF
+d ${localstatedir}/log/glusterfs 0755 root root -
+d ${localstatedir}/run/gluster 0755 root root -
+EOF
+    fi
+
+    # Remove /var/run and /var/log as they are created on startup
+    rm -rf ${D}${localstatedir}/run
+    rm -rf ${D}${localstatedir}/log
 }
 
 INITSCRIPT_PACKAGES = "glusterfs-server"
 INITSCRIPT_NAME = "glusterd"
 INITSCRIPT_PARAMS = "start 20 5 3 2 . stop 80 0 1 6 ."
 
+SYSTEMD_PACKAGES = "glusterfs-server"
+SYSTEMD_SERVICE_${PN} = "glusterd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 # Allow plug-in symlinks.
 INSANE_SKIP_${PN} += "dev-so"
 INSANE_SKIP_${PN}-rdma += "dev-so"
@@ -77,6 +109,10 @@ INSANE_SKIP_${PN}-server += "dev-so"
 PACKAGES += "${PN}-rdma ${PN}-geo-replication ${PN}-fuse ${PN}-server \
              ${PN}-api ${PN}-ocf"
 
+RDEPENDS_${PN} += "python python-json python-ctypes bash"
+RDEPENDS_${PN}-ocf += "bash"
+RDEPENDS_${PN}-server += "bash"
+
 FILES_${PN}-dbg += "${libdir}/glusterfs/${PV}/*/.debug \
                     ${libdir}/glusterfs/${PV}/*/*/.debug \
                     ${libdir}/glusterfs/${PV}/*/*/*/.debug \
@@ -92,18 +128,51 @@ FILES_${PN} = "${libdir}/glusterfs/${PV}/auth \
                ${libdir}/glusterfs/${PV}/xlator/protocol/client* \
                ${libdir}/glusterfs/${PV}/xlator/system \
                ${libdir}/glusterfs/${PV}/xlator/testing \
+               ${libdir}/glusterfs/${PV}/xlator/meta.so \
+               ${libdir}/glusterfs/ganesha \
+               ${libdir}/glusterfs/glusterfs/glusterfind \
+               ${libdir}/glusterfs/glusterfs/gfind_missing_files \
+               ${libdir}/glusterfs/glusterfs/peer* \
+               ${libdir}/glusterfs/glusterfs/*.sh \
                ${libdir}/libglusterfs.so.* \
                ${libdir}/libgfrpc.so.* \
+               ${libdir}/libgfchangelog.so.* \
+               ${libdir}/libgfdb.so.* \
                ${libdir}/libgfxdr.so.* \
+               ${libdir}/python*/site-packages \
+               ${libexecdir}/glusterfs/events \
+               ${libexecdir}/glusterfs/glusterfind \
+               ${libexecdir}/glusterfs/gfind_missing_files \
+               ${libexecdir}/glusterfs/peer_mountbroker.py \
+               ${libexecdir}/glusterfs/peer_eventsapi.py \
+               ${libexecdir}/glusterfs/peer_mountbroker \
+               ${libexecdir}/glusterfs/peer_gsec_create \
+               ${libexecdir}/glusterfs/gverify.sh \
+               ${libexecdir}/glusterfs/peer_add_secret_pub \
                ${localstatedir} \
                ${sysconfdir}/default/volatiles \
                ${sbindir}/glusterfs \
-               ${sbindir}/glusterfsd"
+               ${sbindir}/glusterfsd \
+               ${sbindir}/gfind_missing_files \
+               ${sbindir}/glfsheal \
+               ${sbindir}/gluster-eventsapi \
+               ${sbindir}/gluster-mountbroker \
+               ${sbindir}/glustereventsd \
+               ${sbindir}/gf_attach \
+               ${sbindir}/*.py \
+               ${bindir}/ \
+               ${sysconfdir}/glusterfs \
+               ${sysconfdir}/ganesha \
+               ${datadir}/glusterfs/* \
+	      "
 
 FILES_${PN}-rdma = "${libdir}/glusterfs/${PV}/rpc-transport/rdma*"
 
 FILES_${PN}-geo-replication = "${libexecdir}/glusterfs/gsyncd \
-                               ${libexecdir}/glusterfs/python/syncdaemon"
+                               ${libexecdir}/glusterfs/python/syncdaemon \
+                               ${libexecdir}/glusterfs/peer_georep-sshkey.py \
+                               ${libexecdir}/glusterfs/set_geo_rep_pem_keys.sh \
+                               ${sbindir}/gluster-georep-sshkey"
 
 FILES_${PN}-fuse = "${bindir}/fusermount-glusterfs \
                     ${libdir}/glusterfs/${PV}/xlator/mount \
@@ -118,7 +187,9 @@ FILES_${PN}-server = "${libdir}/glusterfs/${PV}/xlator/mgmt \
                       ${sbindir}/glusterd \
                       ${sysconfdir}/glusterfs/glusterd.vol \
                       ${sysconfdir}/glusterfs/glusterfs-logrotate \
-                      ${sysconfdir}/init.d/glusterd"
+                      ${sysconfdir}/init.d/glusterd \
+                      ${sysconfdir}/tmpfiles.d \
+                      ${systemd_system_unitdir}"
 
 # Note: Debian package renaming produces libgfapi[0-9]+-*.*.rpm.
 FILES_${PN}-api = "${libdir}/libgfapi.so.*"
@@ -126,7 +197,8 @@ FILES_${PN}-api = "${libdir}/libgfapi.so.*"
 FILES_${PN}-ocf = "${prefix}/lib/ocf"
 
 pkg_postinst_${PN}() {
-        if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ]; then
-                /etc/init.d/populate-volatile.sh update
-        fi
+    if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ]; then
+        /etc/init.d/populate-volatile.sh update
+    fi
 }
+
diff --git a/recipes-extended/glusterfs/glusterfs_3.11.1.bb b/recipes-extended/glusterfs/glusterfs_3.11.1.bb
new file mode 100644
index 0000000..bbaaaf4
--- /dev/null
+++ b/recipes-extended/glusterfs/glusterfs_3.11.1.bb
@@ -0,0 +1,6 @@
+SRC_URI = "http://download.gluster.org/pub/gluster/glusterfs/3.11/${PV}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "46d56837b8b5c785f2f1e5317d5f6da8"
+SRC_URI[sha256sum] = "c7e0502631c9bc9da05795b666b74ef40a30a0344f5a2e205e65bd2faefe1442"
+
+require glusterfs.inc
diff --git a/recipes-extended/glusterfs/glusterfs_3.4.2.bb b/recipes-extended/glusterfs/glusterfs_3.4.2.bb
deleted file mode 100644
index b6ae856..0000000
--- a/recipes-extended/glusterfs/glusterfs_3.4.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-#
-# Copyright (C) 2013 Wind River Systems, Inc.
-#
-
-PR = "r0"
-
-SRC_URI = "http://download.gluster.org/pub/gluster/glusterfs/3.4/${PV}/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "7c05304a9aca3c85ff27458461783623"
-SRC_URI[sha256sum] = "4fcd42b13b60a67587de98e60ff679803433bbb0c11aa2b40c4135e2358cedef"
-
-require glusterfs.inc
-- 
2.7.4


