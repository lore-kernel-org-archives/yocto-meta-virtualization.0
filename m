Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBDACE00CB9; Thu, 25 Apr 2019 00:45:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35641E00AD5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Apr 2019 00:45:18 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3P7ieFh001726
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Apr 2019 00:44:51 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 25 Apr 2019 00:44:30 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 25 Apr 2019 00:44:30 -0700
Message-ID: <20190425074430.92599-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] glusterfs: uprev from v5.4 to v6.1
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
X-List-Received-Date: Thu, 25 Apr 2019 07:45:21 -0000
Content-Type: text/plain

The release-6.1 fixes a lot of CVEs.

Modify parts of patches for v6.1.
Remove bd-xlator configure which has been dropped.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../glusterfs/files/glusterd-change-port-range.patch | 14 +++++++-------
 ...erfs-api-remove-unnecessary-library-options.patch | 11 ++++++-----
 .../glusterfs-change-default-nfs-port-number.patch   | 20 ++++++++++----------
 ...-configure-automake-with-subdir-objects-for.patch | 18 +++++++++++-------
 .../glusterfs-disable-default-startup-scripts.patch  | 18 +++++++++++-------
 recipes-extended/glusterfs/glusterfs.inc             |  2 --
 recipes-extended/glusterfs/glusterfs_5.4.bb          |  6 ------
 recipes-extended/glusterfs/glusterfs_6.1.bb          |  6 ++++++
 8 files changed, 51 insertions(+), 44 deletions(-)
 delete mode 100644 recipes-extended/glusterfs/glusterfs_5.4.bb
 create mode 100644 recipes-extended/glusterfs/glusterfs_6.1.bb

diff --git a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
index 52b6ffa..3458d8a 100644
--- a/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
+++ b/recipes-extended/glusterfs/files/glusterd-change-port-range.patch
@@ -1,6 +1,6 @@
-From a0ed85e0b268dba76d9c820571e1b9217b51e985 Mon Sep 17 00:00:00 2001
+From 59d1b6fb5e6315df9fc55a74576b1bfde30303f0 Mon Sep 17 00:00:00 2001
 From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Tue, 12 Mar 2019 20:03:21 -0700
+Date: Wed, 24 Apr 2019 23:07:58 -0400
 Subject: [PATCH] glusterd: change port range
 
 glusterfsd chooses tcp ports within the dynamic
@@ -22,24 +22,24 @@ Signed-off-by: Vu Tran <vu.tran@windriver.com>
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
 [Yi: minor adjust to apply the patch on 3.11.1]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-[Hogzhi: minor adjust to apply the patch on v5.4]
+[Hogzhi: modify patch for release-6.1]
 Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  extras/glusterd.vol | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/extras/glusterd.vol b/extras/glusterd.vol
-index 88d412c..b89aa56 100644
+index 6045591..d814b5f 100644
 --- a/extras/glusterd.vol
 +++ b/extras/glusterd.vol
-@@ -9,6 +9,6 @@ volume management
+@@ -11,6 +11,6 @@ volume management
      option event-threads 1
  #   option lock-timer 180
  #   option transport.address-family inet6
 -#   option base-port 49152
 +#   option base-port 59152
- #   option max-port  65535
+     option max-port  60999
  end-volume
 -- 
-2.17.1
+2.8.1
 
diff --git a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
index 2f140ea..32f4dc1 100644
--- a/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
@@ -1,6 +1,6 @@
-From 2ef09531d1d14cd64d5ba4ffbd9a99af10ae1ec4 Mon Sep 17 00:00:00 2001
+From 2b55524fab066cb14880a819f570b7f839bae1ce Mon Sep 17 00:00:00 2001
 From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Tue, 12 Mar 2019 19:37:51 -0700
+Date: Wed, 24 Apr 2019 22:44:12 -0400
 Subject: [PATCH] glusterfs-api: remove unnecessary library options
 
 These cause QA errors when users of the api such
@@ -11,13 +11,14 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
+[modify patch for release-6.1]
 Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  glusterfs-api.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/glusterfs-api.pc.in b/glusterfs-api.pc.in
-index 6af4e10..01b9d0f 100644
+index 4a2edb7..153c4ad 100644
 --- a/glusterfs-api.pc.in
 +++ b/glusterfs-api.pc.in
 @@ -8,5 +8,5 @@ Description: GlusterFS API
@@ -26,7 +27,7 @@ index 6af4e10..01b9d0f 100644
  Requires: @PKGCONFIG_UUID@
 -Libs: -L${libdir} @GFAPI_LIBS@ -lgfapi -lglusterfs -lgfrpc -lgfxdr
 +Libs: -lgfapi -lglusterfs -lgfrpc -lgfxdr
- Cflags: -I${includedir} -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64 -DUSE_POSIX_ACLS=@USE_POSIX_ACLS@
+ Cflags: -I${includedir} -D_FILE_OFFSET_BITS=64 -D__USE_FILE_OFFSET64 -D__USE_LARGEFILE64 -DUSE_POSIX_ACLS=@USE_POSIX_ACLS@
 -- 
-2.17.1
+2.8.1
 
diff --git a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
index e3453a2..deb9e45 100644
--- a/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
@@ -1,6 +1,6 @@
-From b0c106e74beee36c20f73b956841007209a7f23c Mon Sep 17 00:00:00 2001
+From b8b48d3c4ab92ce167db8137426fad45e938b11b Mon Sep 17 00:00:00 2001
 From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Tue, 12 Mar 2019 19:52:03 -0700
+Date: Wed, 24 Apr 2019 22:50:01 -0400
 Subject: [PATCH] glusterfs: change default nfs port number
 
 Currently both native nfs and glusterfs-nfs use NFS well
@@ -30,25 +30,25 @@ Signed-off-by: Vu Tran <vu.tran@windriver.com>
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
 [Yi: minor adjust to apply the patch on 3.11.1]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-[Hongzhi: minor adjust to apply the patch on v5.4]
+[Hongzhi: modify patch for release-6.1]
 Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
- libglusterfs/src/common-utils.h | 2 +-
+ libglusterfs/src/glusterfs/common-utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/libglusterfs/src/common-utils.h b/libglusterfs/src/common-utils.h
-index 6a6fd8c..218e379 100644
---- a/libglusterfs/src/common-utils.h
-+++ b/libglusterfs/src/common-utils.h
+diff --git a/libglusterfs/src/glusterfs/common-utils.h b/libglusterfs/src/glusterfs/common-utils.h
+index 0e2ecc7..59237a9 100644
+--- a/libglusterfs/src/glusterfs/common-utils.h
++++ b/libglusterfs/src/glusterfs/common-utils.h
 @@ -108,7 +108,7 @@ trap(void);
  /* Defining this here as it is needed by glusterd for setting
   * nfs port in volume status.
   */
 -#define GF_NFS3_PORT 2049
-+#define GF_NFS3_PORT    38467
++#define GF_NFS3_PORT 38467
  
  #define GF_CLIENT_PORT_CEILING 1024
  #define GF_IANA_PRIV_PORTS_START 49152 /* RFC 6335 */
 -- 
-2.17.1
+2.8.1
 
diff --git a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
index 8f3c854..6278ce6 100644
--- a/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
@@ -1,6 +1,6 @@
-From bb34fd21ae26005cf099928f41e68a0d98685eba Mon Sep 17 00:00:00 2001
-From: Xulin Sun <xulin.sun@windriver.com>
-Date: Mon, 21 Mar 2016 17:32:50 +0800
+From fcd612f75c2e99a0748bebbf530b730d0019d2bf Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Wed, 24 Apr 2019 22:33:49 -0400
 Subject: [PATCH] glusterfs: configure: automake with subdir-objects & foreign
  parameters
 
@@ -10,21 +10,22 @@ autoconf execution failed when using automake 1.14 around version.
 Upstream-Status: Pending
 
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
-
+[modify the patch for release-6.1]
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 43efd6d..8ce28f6 100644
+index 2f341de..b28ac20 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -13,11 +13,11 @@ AC_INIT([glusterfs],
  AC_SUBST([PACKAGE_RELEASE],
           [m4_esyscmd([build-aux/pkg-version --release])])
  
--AM_INIT_AUTOMAKE(tar-pax)
-+#AM_INIT_AUTOMAKE(tar-pax)
+-AM_INIT_AUTOMAKE([tar-pax foreign])
++#AM_INIT_AUTOMAKE([tar-pax foreign])
  
  # Removes warnings when using automake 1.14 around (...but option 'subdir-objects' is disabled )
  #but libglusterfs fails to build with contrib (Then are not set up that way?)
@@ -33,3 +34,6 @@ index 43efd6d..8ce28f6 100644
  
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES(yes)])
  
+-- 
+2.8.1
+
diff --git a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
index dbc81b6..7f582dc 100644
--- a/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
+++ b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
@@ -1,6 +1,6 @@
-From 08b55ee9ccb02db0519ddc9902025e191c1500b1 Mon Sep 17 00:00:00 2001
-From: Donn Seeley <donn.seeley@windriver.com>
-Date: Fri, 28 Feb 2014 09:11:02 -0500
+From bbc23b4723a5f60f2b6f4daf734194f9a3a315d8 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Wed, 24 Apr 2019 22:41:04 -0400
 Subject: [PATCH] Add the glusterfs package
 
 The glusterfs code for installing start-up scripts checks for systemd
@@ -18,21 +18,25 @@ Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
 Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
 [Yi: minor adjust to apply the patch on 3.11.1]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
-
+[modify patch for release-6.1]
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  extras/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/extras/Makefile.am b/extras/Makefile.am
-index 3af1103..8978dde 100644
+index ff5ca9b..1f59746 100644
 --- a/extras/Makefile.am
 +++ b/extras/Makefile.am
-@@ -4,7 +4,7 @@ addonexec_SCRIPTS = peer_add_secret_pub
+@@ -10,7 +10,7 @@ endif
  EditorModedir = $(docdir)
  EditorMode_DATA = glusterfs-mode.el glusterfs.vim
  
 -SUBDIRS = init.d systemd benchmarking hook-scripts $(OCF_SUBDIR) LinuxRPM \
 +SUBDIRS = benchmarking hook-scripts $(OCF_SUBDIR) LinuxRPM \
-           $(GEOREP_EXTRAS_SUBDIR) snap_scheduler firewalld cliutils
+           $(GEOREP_EXTRAS_SUBDIR) snap_scheduler firewalld cliutils python
  
  confdir = $(sysconfdir)/glusterfs
+-- 
+2.8.1
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 5843d7c..ab5f4e0 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -16,7 +16,6 @@ SRC_URI += "file://glusterd.init \
             file://glusterfs-api-remove-unnecessary-library-options.patch \
             file://python-work-around-host-and-target-python.patch \
             file://glusterfs-change-default-nfs-port-number.patch \
-            file://dependence-on-correct-header-file-path.patch \
             file://libglusterfs-Don-t-link-against-libfl.patch \
             file://glusterd-change-port-range.patch \
             file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \
@@ -51,7 +50,6 @@ EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
                "
 
 PACKAGECONFIG ??= "georeplication libibverbs"
-PACKAGECONFIG[bd-xlator] = "--enable-bd-xlator,--disable-bd-xlator,lvm2,"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
 PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
 PACKAGECONFIG[libibverbs] = "--enable-ibverbs,--disable-ibverbs,virtual/libibverbs librdmacm,"
diff --git a/recipes-extended/glusterfs/glusterfs_5.4.bb b/recipes-extended/glusterfs/glusterfs_5.4.bb
deleted file mode 100644
index 90ffd14..0000000
--- a/recipes-extended/glusterfs/glusterfs_5.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-SRC_URI = "https://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "b52ec9101de3c01c7db17c00b3234d94"
-SRC_URI[sha256sum] = "d4f8cf7551c4ac97480fa4f2da6077171b12d5501ee1ddc4cd8535e2336bde7e"
-
-require glusterfs.inc
diff --git a/recipes-extended/glusterfs/glusterfs_6.1.bb b/recipes-extended/glusterfs/glusterfs_6.1.bb
new file mode 100644
index 0000000..e109c08
--- /dev/null
+++ b/recipes-extended/glusterfs/glusterfs_6.1.bb
@@ -0,0 +1,6 @@
+SRC_URI = "https://bits.gluster.org/pub/gluster/glusterfs/src/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "18967c357204d4cbdd9c1731508862c6"
+SRC_URI[sha256sum] = "32ac75c883cdf18e081893ce5210b2331f1ee9ba25e3f3f56136d9878b194dc7"
+
+require glusterfs.inc
-- 
2.8.1


