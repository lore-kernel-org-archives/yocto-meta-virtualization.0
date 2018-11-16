Return-Path: <chin.huat.ang@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C7FDE00ABE; Thu, 15 Nov 2018 17:31:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [134.134.136.20 listed in list.dnswl.org]
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F8BCE0095C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 15 Nov 2018 17:31:22 -0800 (PST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2018 17:31:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,238,1539673200"; d="scan'208";a="280390383"
Received: from chinhuat-mac01.png.intel.com (HELO ubuntu.localdomain)
	([10.221.20.192])
	by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2018 17:31:21 -0800
From: Chin Huat Ang <chin.huat.ang@intel.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Date: Fri, 16 Nov 2018 09:31:15 +0800
Message-Id: <1542331875-2822-1-git-send-email-chin.huat.ang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] docker: fix broken init script
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
X-List-Received-Date: Fri, 16 Nov 2018 01:31:23 -0000

Fix numerous docker.init issues such as missing runtime dependency
util-linux-unshare, incomplete handling of start/stop etc. operations
and minor typos.

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
---
 recipes-containers/docker/docker-ce_git.bb  |  2 +-
 recipes-containers/docker/docker_git.bb     |  2 +-
 recipes-containers/docker/files/docker.init | 12 ++++++++----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
index 7a41850..caf6d70 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -62,7 +62,7 @@ DEPENDS = " \
 PACKAGES =+ "${PN}-contrib"
 
 DEPENDS_append_class-target = " lvm2"
-RDEPENDS_${PN} = "util-linux iptables \
+RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
                  "
diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index f63cee1..7957808 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -67,7 +67,7 @@ PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
 PACKAGES =+ "${PN}-contrib"
 
 DEPENDS_append_class-target = " lvm2"
-RDEPENDS_${PN} = "util-linux iptables \
+RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
                  "
diff --git a/recipes-containers/docker/files/docker.init b/recipes-containers/docker/files/docker.init
index 2e8eb9e..0aea8d0 100644
--- a/recipes-containers/docker/files/docker.init
+++ b/recipes-containers/docker/files/docker.init
@@ -22,7 +22,7 @@
 # Source function library.
 . /etc/init.d/functions
 
-prog="docker"
+prog="dockerd"
 unshare=/usr/bin/unshare
 exec="/usr/bin/$prog"
 pidfile="/var/run/$prog.pid"
@@ -40,7 +40,7 @@ start() {
     if ! [ -f $pidfile ]; then
         printf "Starting $prog:\t"
         echo -e "\n$(date)\n" >> $logfile
-        "$unshare" -m -- $exec daemon $other_args &>> $logfile &
+        "$unshare" -m -- $exec $other_args &>> $logfile &
         pid=$!
         touch $lockfile
         # wait up to 10 seconds for the pidfile to exist.  see
@@ -83,7 +83,7 @@ force_reload() {
 }
 
 rh_status() {
-    status -p $pidfile $prog
+    status $prog
 }
 
 rh_status_q() {
@@ -99,24 +99,28 @@ check_for_cleanup() {
 
 case "$1" in
     start)
+        rh_status_q && exit 0
         $1
         ;;
     stop)
+        rh_status_q || exit 0
         $1
         ;;
     restart)
         $1
         ;;
     reload)
+        rh_status_q || exit 7
         $1
         ;;
     force-reload)
         force_reload
         ;;
     status)
-        status
+        rh_status
         ;;
     condrestart|try-restart)
+        rh_status_q || exit 0
         restart
         ;;
     *)
-- 
2.7.4


