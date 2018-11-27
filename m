Return-Path: <tyu@cisco.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23491E00B3E; Tue, 27 Nov 2018 11:16:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM
	white-list
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [173.37.86.76 listed in list.dnswl.org]
X-Greylist: delayed 61 seconds by postgrey-1.32 at yocto-www;
	Tue, 27 Nov 2018 11:16:20 PST
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D999FE00B3E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Nov 2018 11:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=3370; q=dns/txt; s=iport;
	t=1543346180; x=1544555780;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=XTPXWuNi9+UC4LJ4/ORnZcR2Isnb8DFUqfe1jeT5hAg=;
	b=G87AIcc81x7jo48qTtOSeSBgjCqIwlh5jV0v6cTvE0ATPoTzCcplMNiB
	W45Wd2+kXeYqFa7rZ9/NJ53FkHWwpIYngs2C8+knZzaoprTdlL9J6E7MK
	PLqnyDy0fRFTrhi8p6P4JBkU2kmoHyM++kiYEcrwY3iiNH6+O9eiilKnk U=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AnAAARl/1b/5tdJa1jHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUQcBAQsBggNmgQInjBGMB5lNgXoNH4RNgxoiNAkNAQMBAQIBAQJtKIV?=
	=?us-ascii?q?1AUYwXUSDIQGCAAGnRYRBQD+EbodihCsXgUA/g26GA4RsIgKQF491CQ2Gb4o?=
	=?us-ascii?q?pCxiRC5g3gUY4gVVwFYMnCYIeF44+HjMBjhUBAQ?=
X-IronPort-AV: E=Sophos;i="5.56,287,1539648000"; d="scan'208";a="270629064"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
	by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 19:15:18 +0000
Received: from sjc-ads-3167.cisco.com (sjc-ads-3167.cisco.com [171.68.248.120])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id wARJFHCf003490; 
	Tue, 27 Nov 2018 19:15:18 GMT
Received: by sjc-ads-3167.cisco.com (Postfix, from userid 23091)
	id B3F75D53; Tue, 27 Nov 2018 11:15:17 -0800 (PST)
From: Ting Yu <tyu@cisco.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 27 Nov 2018 11:14:54 -0800
Message-Id: <20181127191454.2581-1-tyu@cisco.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.248.120, sjc-ads-3167.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
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
X-List-Received-Date: Tue, 27 Nov 2018 19:16:22 -0000
Content-Transfer-Encoding: 8bit

From: Chin Huat Ang <chin.huat.ang@intel.com>

Fix numerous docker.init issues such as missing runtime dependency
util-linux-unshare, incomplete handling of start/stop etc. operations
and minor typos.

Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
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
2.19.1


