Return-Path: <bogdan.purcareata@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F397FE0080C; Thu, 23 Oct 2014 02:48:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.110.136 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0136.outbound.protection.outlook.com [157.56.110.136])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 141AAE00799
	for <meta-virtualization@yoctoproject.org>;
	Thu, 23 Oct 2014 02:48:25 -0700 (PDT)
Received: from BN3PR0301CA0038.namprd03.prod.outlook.com (25.160.180.176) by
	BN1PR03MB185.namprd03.prod.outlook.com (10.255.200.139) with Microsoft
	SMTP Server (TLS) id 15.0.1054.13; Thu, 23 Oct 2014 09:34:01 +0000
Received: from BN1AFFO11FD044.protection.gbl (2a01:111:f400:7c10::127) by
	BN3PR0301CA0038.outlook.office365.com (2a01:111:e400:4000::48) with
	Microsoft
	SMTP Server (TLS) id 15.1.6.9 via Frontend Transport; Thu, 23 Oct 2014
	09:34:01 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD044.mail.protection.outlook.com (10.58.52.191) with
	Microsoft SMTP
	Server (TLS) id 15.0.1049.20 via Frontend Transport; Thu, 23 Oct 2014
	09:34:01 +0000
Received: from fsr-fed1764-008.ea.freescale.net
	(fsr-fed1764-008.ea.freescale.net [10.171.73.44])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s9N9Xxlh017165;
	Thu, 23 Oct 2014 02:34:00 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 23 Oct 2014 12:31:54 -0400
Message-ID: <1414081914-14838-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.9.rc1
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(110136001)(85306004)(104016003)(31966008)(97736003)(48376002)(81156004)(106466001)(21056001)(15202345003)(229853001)(107046002)(50466002)(2351001)(47776003)(120916001)(104166001)(64706001)(33646002)(46102003)(80022003)(15395725005)(95666004)(76482002)(20776003)(4396001)(50226001)(26826002)(99396003)(19580395003)(102836001)(69596002)(6806004)(19580405001)(44976005)(15975445006)(68736004)(84676001)(86362001)(575784001)(93916002)(50986999)(92566001)(92726001)(88136002)(89996001)(87936001)(85852003)(87286001)(62966002)(105606002)(77156001)(36756003)(2004002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR03MB185;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1PR03MB185;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Forefront-PRVS: 0373D94D15
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=bogdan.purcareata@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] lxc: add unprivileged Busybox containers support
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
X-List-Received-Date: Thu, 23 Oct 2014 09:48:31 -0000
Content-Type: text/plain

Integrate 2 upstream patches that enable creating unprivileged Busybox
containers.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 ...sybox_template_mount_fstab_when_available.patch |   32 +++++++
 ...plate_support_for_unprivileged_containers.patch |   92 ++++++++++++++++++++
 recipes-containers/lxc/lxc_1.0.6.bb                |    3 +
 3 files changed, 127 insertions(+)
 create mode 100644 recipes-containers/lxc/files/busybox_template_mount_fstab_when_available.patch
 create mode 100644 recipes-containers/lxc/files/busybox_template_support_for_unprivileged_containers.patch

diff --git a/recipes-containers/lxc/files/busybox_template_mount_fstab_when_available.patch b/recipes-containers/lxc/files/busybox_template_mount_fstab_when_available.patch
new file mode 100644
index 0000000..74b4fdf
--- /dev/null
+++ b/recipes-containers/lxc/files/busybox_template_mount_fstab_when_available.patch
@@ -0,0 +1,32 @@
+From 12c3b43fbeacd9cc471adf565ecea3263e37e353 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Mon, 20 Oct 2014 15:56:54 -0400
+Subject: [PATCH] busybox template: mount fstab when available
+
+When running unprivileged, lxc-create will touch a fstab file, with bind-mounts
+for the ttys and other devices. Add this entry in the container config.
+
+Upstream-Status: Accepted
+[https://github.com/lxc/lxc/commit/12c3b43fbeacd9cc471adf565ecea3263e37e353]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
+---
+ templates/lxc-busybox.in | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index ca2dd43..ee54a7a 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -301,6 +301,10 @@ EOF
+     done
+     echo "lxc.mount.entry = /sys/kernel/security sys/kernel/security none ro,bind,optional 0 0" >>$path/config
+     echo "lxc.mount.auto = proc:mixed sys" >>$path/config
++
++    if [ -f "$path/fstab" ]; then
++        echo "lxc.mount = $path/fstab" >>$path/config
++    fi
+ }
+ 
+ remap_userns()
diff --git a/recipes-containers/lxc/files/busybox_template_support_for_unprivileged_containers.patch b/recipes-containers/lxc/files/busybox_template_support_for_unprivileged_containers.patch
new file mode 100644
index 0000000..4e9ab74
--- /dev/null
+++ b/recipes-containers/lxc/files/busybox_template_support_for_unprivileged_containers.patch
@@ -0,0 +1,92 @@
+From a542dd3c1aca8b6674f631d625d888eb13ae3a4d Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Mon, 20 Oct 2014 15:56:53 -0400
+Subject: [PATCH] busybox template: support for unprivileged containers
+
+Apply the changes found in templates/lxc-download to the busybox template as
+well. Change ownership of the config and fstab files to the unprivileged user,
+and the ownership of the rootfs to root in the new user namespace.
+
+Eliminate the "unsupported for userns" flag.
+
+Upstream-Status: Accepted
+[https://github.com/lxc/lxc/commit/a542dd3c1aca8b6674f631d625d888eb13ae3a4d]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
+---
+ templates/lxc-busybox.in | 36 ++++++++++++++++++++++++++----------
+ 1 file changed, 26 insertions(+), 10 deletions(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index 246e743..ca2dd43 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -20,15 +20,8 @@
+ # License along with this library; if not, write to the Free Software
+ # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+ 
+-# Detect use under userns (unsupported)
+-for arg in "$@"; do
+-    [ "$arg" = "--" ] && break
+-    if [ "$arg" = "--mapped-uid" -o "$arg" = "--mapped-gid" ]; then
+-        echo "This template can't be used for unprivileged containers." 1>&2
+-        echo "You may want to try the \"download\" template instead." 1>&2
+-        exit 1
+-    fi
+-done
++LXC_MAPPED_UID=
++LXC_MAPPED_GID=
+ 
+ # Make sure the usual locations are in PATH
+ export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
+@@ -310,6 +303,21 @@ EOF
+     echo "lxc.mount.auto = proc:mixed sys" >>$path/config
+ }
+ 
++remap_userns()
++{
++    path=$1
++
++    if [ -n "$LXC_MAPPED_UID" ] && [ "$LXC_MAPPED_UID" != "-1" ]; then
++        chown $LXC_MAPPED_UID $path/config $path/fstab >/dev/null 2>&1
++        chown -R root $path/rootfs >/dev/null 2>&1
++    fi
++
++    if [ -n "$LXC_MAPPED_GID" ] && [ "$LXC_MAPPED_GID" != "-1" ]; then
++        chgrp $LXC_MAPPED_GID $path/config $path/fstab >/dev/null 2>&1
++        chgrp -R root $path/rootfs >/dev/null 2>&1
++    fi
++}
++
+ usage()
+ {
+     cat <<EOF
+@@ -318,7 +326,7 @@ EOF
+     return 0
+ }
+ 
+-options=$(getopt -o hp:n: -l help,rootfs:,path:,name: -- "$@")
++options=$(getopt -o hp:n: -l help,rootfs:,path:,name:,mapped-uid:,mapped-gid: -- "$@")
+ if [ $? -ne 0 ]; then
+     usage $(basename $0)
+     exit 1
+@@ -332,6 +340,8 @@ do
+         -p|--path)      path=$2; shift 2;;
+         --rootfs)       rootfs=$2; shift 2;;
+         -n|--name)      name=$2; shift 2;;
++        --mapped-uid)   LXC_MAPPED_UID=$2; shift 2;;
++        --mapped-gid)   LXC_MAPPED_GID=$2; shift 2;;
+         --)             shift 1; break ;;
+         *)              break ;;
+     esac
+@@ -374,3 +384,9 @@ if [ $? -ne 0 ]; then
+     echo "failed to write configuration file"
+     exit 1
+ fi
++
++remap_userns $path
++if [ $? -ne 0 ]; then
++    echo "failed to remap files to user"
++    exit 1
++fi
diff --git a/recipes-containers/lxc/lxc_1.0.6.bb b/recipes-containers/lxc/lxc_1.0.6.bb
index 2d384dd..0805573 100644
--- a/recipes-containers/lxc/lxc_1.0.6.bb
+++ b/recipes-containers/lxc/lxc_1.0.6.bb
@@ -26,7 +26,10 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://runtest.patch \
 	file://run-ptest \
 	file://automake-ensure-VPATH-builds-correctly.patch \
+	file://busybox_template_mount_fstab_when_available.patch \
+	file://busybox_template_support_for_unprivileged_containers.patch \
 	"
+
 SRC_URI[md5sum] = "4aad3aee84b42faa194e44091d723a3b"
 SRC_URI[sha256sum] = "fc6bffa750f00daaa92aa33d719c1cc235146aa779ebd2a64a0c24423977cf14"
 
-- 
1.7.10.4


