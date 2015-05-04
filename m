Return-Path: <B43198@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1C222E007B9; Mon,  4 May 2015 08:24:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.111 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1028 seconds by postgrey-1.32 at yocto-www;
	Mon, 04 May 2015 08:24:06 PDT
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0111.outbound.protection.outlook.com [65.55.169.111])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52F59E003A8
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 May 2015 08:24:06 -0700 (PDT)
Received: from BN3PR0301CA0073.namprd03.prod.outlook.com (25.160.152.169) by
	BLUPR03MB456.namprd03.prod.outlook.com (10.141.78.148) with Microsoft
	SMTP Server (TLS) id 15.1.160.10; Mon, 4 May 2015 14:52:01 +0000
Received: from BY2FFO11FD022.protection.gbl (2a01:111:f400:7c0c::185) by
	BN3PR0301CA0073.outlook.office365.com (2a01:111:e400:401e::41) with
	Microsoft
	SMTP Server (TLS) id 15.1.154.19 via Frontend Transport; Mon, 4 May 2015
	14:52:01 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; yoctoproject.org;
	dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD022.mail.protection.outlook.com (10.1.15.211) with Microsoft
	SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Mon, 4 May 2015 14:52:01 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.74.50])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t44EpxA3028636
	for <meta-virtualization@yoctoproject.org>;
	Mon, 4 May 2015 07:52:00 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 4 May 2015 17:51:58 +0000
Message-ID: <1430761918-340-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(6806004)(104016003)(5001920100001)(15395725005)(49486002)(2351001)(229853001)(47776003)(87936001)(551544002)(105606002)(107886002)(110136002)(62966003)(19580395003)(19580405001)(77156002)(50986999)(575784001)(5820100001)(77096005)(15975445007)(33646002)(23676002)(92566002)(46102003)(50226001)(5001960100002)(50466002)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB456;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB456;
X-Microsoft-Antispam-PRVS: <BLUPR03MB4565B719341EECBC9C9F80F8CD20@BLUPR03MB456.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BLUPR03MB456; BCL:0;
	PCL:0; RULEID:; SRVR:BLUPR03MB456; 
X-Forefront-PRVS: 05669A7924
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2015 14:52:01.0509 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB456
Subject: [PATCH] lxc: Add OpenSSH support for Busybox containers
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
X-List-Received-Date: Mon, 04 May 2015 15:24:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add command line parameter to create Busybox containers
with OpenSSH support. As a prerequisite, OpenSSH needs
to be installed on the host system.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
---
 .../files/lxc-busybox-add-OpenSSH-support.patch    | 246 +++++++++++++++++++++
 .../files/make-some-OpenSSH-tools-optional.patch   |  49 ++++
 recipes-containers/lxc/lxc_1.0.7.bb                |   2 +
 3 files changed, 297 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc-busybox-add-OpenSSH-support.patch
 create mode 100644 recipes-containers/lxc/files/make-some-OpenSSH-tools-optional.patch

diff --git a/recipes-containers/lxc/files/lxc-busybox-add-OpenSSH-support.patch b/recipes-containers/lxc/files/lxc-busybox-add-OpenSSH-support.patch
new file mode 100644
index 0000000..f2f332c
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc-busybox-add-OpenSSH-support.patch
@@ -0,0 +1,246 @@
+From ed52814c776963efdcc9dcda1ec26fc09930ef93 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Wed, 22 Apr 2015 14:53:32 +0000
+Subject: [PATCH] lxc-busybox: add OpenSSH support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add an additional template parameter for SSH support in the container. Currently
+this can be implemented using the Dropbear or OpenSSH utility. The respective
+tool needs to be available on the host Linux.
+
+If the parameter is omitted, the template will look for the Dropbear utility on
+the host and install it if it is available (legacy behavior).
+
+Adding OpenSSH support has been done following the model in the lxc-sshd
+template.
+
+Upstream-status: Accepted
+[https://github.com/lxc/lxc/commit/ed52814c776963efdcc9dcda1ec26fc09930ef93]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Acked-by: Stéphane Graber <stgraber@ubuntu.com>
+---
+ templates/lxc-busybox.in | 169 ++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 139 insertions(+), 30 deletions(-)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index 7e05bd6..95961a3 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -22,6 +22,7 @@
+ 
+ LXC_MAPPED_UID=
+ LXC_MAPPED_GID=
++SSH=
+ 
+ # Make sure the usual locations are in PATH
+ export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
+@@ -160,6 +161,116 @@ EOF
+     return $res
+ }
+ 
++install_dropbear()
++{
++    # copy dropbear binary
++    cp $(which dropbear) $rootfs/usr/sbin
++    if [ $? -ne 0 ]; then
++        echo "Failed to copy dropbear in the rootfs"
++        return 1
++    fi
++
++    # make symlinks to various ssh utilities
++    utils="\
++        $rootfs/usr/bin/dbclient \
++        $rootfs/usr/bin/scp \
++        $rootfs/usr/bin/ssh \
++        $rootfs/usr/sbin/dropbearkey \
++        $rootfs/usr/sbin/dropbearconvert \
++    "
++    echo $utils | xargs -n1 ln -s /usr/sbin/dropbear
++
++    # add necessary config files
++    mkdir $rootfs/etc/dropbear
++    dropbearkey -t rsa -f $rootfs/etc/dropbear/dropbear_rsa_host_key > /dev/null 2>&1
++    dropbearkey -t dss -f $rootfs/etc/dropbear/dropbear_dss_host_key > /dev/null 2>&1
++
++    echo "'dropbear' ssh utility installed"
++
++    return 0
++}
++
++install_openssh()
++{
++    # tools to be installed
++    server_utils="sshd"
++    client_utils="\
++        ssh \
++        scp \
++        sftp \
++        ssh-add \
++        ssh-agent \
++        ssh-keygen \
++        ssh-keyscan \
++        ssh-argv0 \
++        ssh-copy-id \
++        "
++
++    # new folders used by ssh
++    ssh_tree="\
++$rootfs/etc/ssh \
++$rootfs/var/empty/sshd \
++$rootfs/var/lib/empty/sshd \
++$rootfs/var/run/sshd \
++"
++
++    # create folder structure
++    mkdir -p $ssh_tree
++    if [ $? -ne 0 ]; then
++        return 1
++    fi
++
++    # copy binaries
++    for bin in $server_utils $client_utils; do
++        tool_path=`which $bin`
++        cp $tool_path $rootfs/$tool_path
++        if [ $? -ne 0 ]; then
++            echo "Unable to copy $tool_path in the rootfs"
++            return 1
++        fi
++    done
++
++    # add user and group
++    cat <<EOF >> $rootfs/etc/passwd
++sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
++EOF
++
++    cat <<EOF >> $rootfs/etc/group
++sshd:x:74:
++EOF
++
++    # generate container keys
++    ssh-keygen -t rsa -N "" -f $rootfs/etc/ssh/ssh_host_rsa_key >/dev/null 2>&1
++    ssh-keygen -t dsa -N "" -f $rootfs/etc/ssh/ssh_host_dsa_key >/dev/null 2>&1
++
++    # by default setup root password with no password
++    cat <<EOF > $rootfs/etc/ssh/sshd_config
++Port 22
++Protocol 2
++HostKey /etc/ssh/ssh_host_rsa_key
++HostKey /etc/ssh/ssh_host_dsa_key
++UsePrivilegeSeparation yes
++KeyRegenerationInterval 3600
++ServerKeyBits 768
++SyslogFacility AUTH
++LogLevel INFO
++LoginGraceTime 120
++PermitRootLogin yes
++StrictModes yes
++RSAAuthentication yes
++PubkeyAuthentication yes
++IgnoreRhosts yes
++RhostsRSAAuthentication no
++HostbasedAuthentication no
++PermitEmptyPasswords yes
++ChallengeResponseAuthentication no
++EOF
++
++    echo "'OpenSSH' utility installed"
++
++    return 0
++}
++
+ configure_busybox()
+ {
+     rootfs=$1
+@@ -230,34 +341,6 @@ EOF
+     lxc-unshare -s MOUNT -- /bin/sh < $CHPASSWD_FILE
+     rm $CHPASSWD_FILE
+ 
+-    # add ssh functionality if dropbear package available on host
+-    which dropbear >/dev/null 2>&1
+-    if [ $? -eq 0 ]; then
+-        # copy dropbear binary
+-        cp $(which dropbear) $rootfs/usr/sbin
+-        if [ $? -ne 0 ]; then
+-            echo "Failed to copy dropbear in the rootfs"
+-            return 1
+-        fi
+-
+-        # make symlinks to various ssh utilities
+-        utils="\
+-            $rootfs/usr/bin/dbclient \
+-            $rootfs/usr/bin/scp \
+-            $rootfs/usr/bin/ssh \
+-            $rootfs/usr/sbin/dropbearkey \
+-            $rootfs/usr/sbin/dropbearconvert \
+-        "
+-        echo $utils | xargs -n1 ln -s /usr/sbin/dropbear
+-
+-        # add necessary config files
+-        mkdir $rootfs/etc/dropbear
+-        dropbearkey -t rsa -f $rootfs/etc/dropbear/dropbear_rsa_host_key > /dev/null 2>&1
+-        dropbearkey -t dss -f $rootfs/etc/dropbear/dropbear_dss_host_key > /dev/null 2>&1
+-
+-        echo "'dropbear' ssh utility installed"
+-    fi
+-
+     return 0
+ }
+ 
+@@ -315,12 +398,12 @@ remap_userns()
+ usage()
+ {
+     cat <<EOF
+-$1 -h|--help -p|--path=<path>
++$1 -h|--help -p|--path=<path> -s|--ssh={dropbear,openssh}
+ EOF
+     return 0
+ }
+ 
+-options=$(getopt -o hp:n: -l help,rootfs:,path:,name:,mapped-uid:,mapped-gid: -- "$@")
++options=$(getopt -o hp:n:s: -l help,rootfs:,path:,name:,mapped-uid:,mapped-gid:,ssh: -- "$@")
+ if [ $? -ne 0 ]; then
+     usage $(basename $0)
+     exit 1
+@@ -336,6 +419,7 @@ do
+         -n|--name)      name=$2; shift 2;;
+         --mapped-uid)   LXC_MAPPED_UID=$2; shift 2;;
+         --mapped-gid)   LXC_MAPPED_GID=$2; shift 2;;
++        -s|--ssh)       SSH=$2; shift 2;;
+         --)             shift 1; break ;;
+         *)              break ;;
+     esac
+@@ -384,3 +468,28 @@ if [ $? -ne 0 ]; then
+     echo "failed to remap files to user"
+     exit 1
+ fi
++
++if [ -n "$SSH" ]; then
++    case "$SSH" in
++        "dropbear")
++            install_dropbear
++            if [ $? -ne 0 ]; then
++                echo "Unable to install 'dropbear' ssh utility"
++                exit 1
++            fi ;;
++        "openssh")
++            install_openssh
++            if [ $? -ne 0 ]; then
++                echo "Unable to install 'OpenSSH' utility"
++                exit 1
++            fi ;;
++        *)
++            echo "$SSH: unrecognized ssh utility"
++            exit 1
++    esac
++else
++    which dropbear >/dev/null 2>&1
++    if [ $? -eq 0 ]; then
++        install_dropbear
++    fi
++fi
+-- 
+2.1.4
+
diff --git a/recipes-containers/lxc/files/make-some-OpenSSH-tools-optional.patch b/recipes-containers/lxc/files/make-some-OpenSSH-tools-optional.patch
new file mode 100644
index 0000000..2d28788
--- /dev/null
+++ b/recipes-containers/lxc/files/make-some-OpenSSH-tools-optional.patch
@@ -0,0 +1,49 @@
+From 34be0d3cd8c4eaca9929470bc8bce5e74975bccf Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+Date: Thu, 23 Apr 2015 08:33:00 +0000
+Subject: [PATCH] lxc-busybox: make some OpenSSH tools optional
+
+Currently, when installing OpenSSH in a Busybox container, the template searches
+for all the OpenSSH client binaries available in the Debian distro package. The
+included tools might differ from distro to distro, so make part of the tools
+optional. The mandatory tools, without which installing OpenSSH fails, are
+"sshd" for the server and "ssh" and "scp" for the client.
+
+Upstream-Status: Submitted
+[https://lists.linuxcontainers.org/pipermail/lxc-devel/2015-April/011696.html]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
+---
+ templates/lxc-busybox.in | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
+index 95961a3..17a3006 100644
+--- a/templates/lxc-busybox.in
++++ b/templates/lxc-busybox.in
+@@ -197,6 +197,8 @@ install_openssh()
+     client_utils="\
+         ssh \
+         scp \
++        "
++    client_optional_utils="\
+         sftp \
+         ssh-add \
+         ssh-agent \
+@@ -230,6 +232,13 @@ $rootfs/var/run/sshd \
+         fi
+     done
+ 
++    for bin in $client_optional_utils; do
++        tool_path=`which $bin`
++        if [ $? -eq 0 ]; then
++            cp $tool_path $rootfs/$tool_path
++        fi
++    done
++
+     # add user and group
+     cat <<EOF >> $rootfs/etc/passwd
+ sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
+-- 
+2.1.4
+
diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
index 0da1e37..f79ba76 100644
--- a/recipes-containers/lxc/lxc_1.0.7.bb
+++ b/recipes-containers/lxc/lxc_1.0.7.bb
@@ -32,6 +32,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
 	file://ppc-add-seccomp-support-for-lxc.patch \
 	file://lxc-fix-B-S.patch \
+	file://lxc-busybox-add-OpenSSH-support.patch \
+	file://make-some-OpenSSH-tools-optional.patch \
 	"
 
 SRC_URI[md5sum] = "b48f468a9bef0e4e140dd723f0a65ad0"
-- 
1.9.1


