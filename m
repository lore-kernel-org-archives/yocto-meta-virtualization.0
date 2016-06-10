Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 918B7E00D89; Fri, 10 Jun 2016 09:34:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 089F4E00D6C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 09:34:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5AGYMr3026441
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Jun 2016 09:34:22 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 10 Jun 2016 09:34:22 -0700
To: Kevin Hao <kexin.hao@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1465428334-137696-1-git-send-email-kexin.hao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <575AEC0D.6050206@windriver.com>
Date: Fri, 10 Jun 2016 12:34:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465428334-137696-1-git-send-email-kexin.hao@windriver.com>
Subject: Re: [PATCH] Remove the duplicated recipe of iscsi-initiator-utils
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
X-List-Received-Date: Fri, 10 Jun 2016 16:34:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-06-08 07:25 PM, Kevin Hao wrote:
> The iscsi-initiator-utils recipe has already been integrated into
> meta-networking layer. We have no reason to keep a duplicated one
> in meta-cloud-services layer. It also kill two QA warnings caused
> by this recipe.

merged.

Bruce

>
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
>   .../iscsi-initiator-utils/files/initd.debian       | 119 ----------
>   .../iscsi-initiator-utils-dont-use-static.patch    |  20 --
>   .../iscsi-initiator-utils-use-var-for-config.patch | 239 ---------------------
>   .../iscsi-initiator-utils.inc                      | 109 ----------
>   .../iscsi-initiator-utils_2.0-873.bb               |  14 --
>   5 files changed, 501 deletions(-)
>   delete mode 100644 meta-openstack/recipes-extended/iscsi-initiator-utils/files/initd.debian
>   delete mode 100644 meta-openstack/recipes-extended/iscsi-initiator-utils/files/iscsi-initiator-utils-dont-use-static.patch
>   delete mode 100644 meta-openstack/recipes-extended/iscsi-initiator-utils/files/iscsi-initiator-utils-use-var-for-config.patch
>   delete mode 100644 meta-openstack/recipes-extended/iscsi-initiator-utils/iscsi-initiator-utils.inc
>   delete mode 100644 meta-openstack/recipes-extended/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
>
> diff --git a/meta-openstack/recipes-extended/iscsi-initiator-utils/files/initd.debian b/meta-openstack/recipes-extended/iscsi-initiator-utils/files/initd.debian
> deleted file mode 100644
> index eb8eea714528..000000000000
> --- a/meta-openstack/recipes-extended/iscsi-initiator-utils/files/initd.debian
> +++ /dev/null
> @@ -1,119 +0,0 @@
> -#! /bin/sh
> -### BEGIN INIT INFO
> -# Provides:
> -# Required-Start:
> -# Required-Stop:
> -# Default-Start:
> -# Default-Stop:
> -# Short-Description: Starts and stops the iSCSI initiator services and logins to default targets
> -### END INIT INFO
> -#set -x
> -PATH=/sbin:/bin:/usr/sbin:/usr/bin
> -DAEMON=/sbin/iscsid
> -ADM=/sbin/iscsiadm
> -PIDFILE=/var/run/iscsid.pid
> -
> -[ -x "$DAEMON" ] || exit 0
> -
> -if [ ! -d /sys/class/ ]; then
> -  echo "Failure:" "iSCSI requires a mounted sysfs, not started."
> -  exit 1
> -fi
> -
> -nodestartup_re='s/^node\.conn\[0]\.startup[ 	]*=[ 	]*//p'
> -
> -RETVAL=0
> -
> -start() {
> -	echo "Starting iSCSI initiator service" "iscsid"
> -	modprobe -q iscsi_tcp 2>/dev/null || :
> -	modprobe -q ib_iser 2>/dev/null || :
> -	if [ ! -f /etc/iscsi/initiatorname.iscsi ]; then
> -		INITIATORNAME=$(iscsi-iname)
> -		cat >/etc/iscsi/initiatorname.iscsi <<EOF
> -## DO NOT EDIT OR REMOVE THIS FILE!
> -## If you remove this file, the iSCSI daemon will not start.
> -## If you change the InitiatorName, existing access control lists
> -## may reject this initiator.  The InitiatorName must be unique
> -## for each iSCSI initiator.  Do NOT duplicate iSCSI InitiatorNames.
> -InitiatorName=$INITIATORNAME
> -EOF
> -	fi
> -	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON
> -	RETVAL=$?
> -	starttargets
> -}
> -
> -starttargets() {
> -	echo "Setting up iSCSI targets"
> -	$ADM -m node --loginall=automatic
> -}
> -
> -stoptargets() {
> -	echo "Disconnecting iSCSI targets"
> -	sync
> -	$ADM -m node --logoutall=all
> -	RETVAL=$?
> -	#if RETVAL is 21, means no active sessions, consider ok
> -	if [ "$RETVAL" = "21" ]; then
> -		RETVAL=0
> -	fi
> -}
> -
> -stop() {
> -	stoptargets
> -	if [ $RETVAL -ne 0 ]; then
> -		echo "Failure:" "Could not stop all targets, try again later"
> -		return $RETVAL
> -	fi
> -
> -	echo "Stopping iSCSI initiator service"
> -	start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $DAEMON
> -	rm -f $PIDFILE
> -	status=0
> -	modprobe -r ib_iser 2>/dev/null
> -	if [ "$?" -ne "0" -a "$?" -ne "1" ]; then
> -		status=1
> -	fi
> -	modprobe -r iscsi_tcp 2>/dev/null
> -	if [ "$?" -ne "0" -a "$?" -ne "1" ]; then
> -		status=1
> -	fi
> -}
> -
> -restart() {
> -	stop
> -	if [ $RETVAL -ne 0 ]; then
> -		echo "Failure:" "Stopping iSCSI initiator service failed, not starting"
> -		return $RETVAL
> -	fi
> -	start
> -}
> -
> -restarttargets() {
> -	stoptargets
> -	if [ $RETVAL -ne 0 ]; then
> -		echo "Failure:" "Could not stop all targets, try again later"
> -		return $RETVAL
> -	fi
> -	starttargets
> -}
> -
> -status() {
> -	#XXX FIXME: what to do here?
> -	#status iscsid
> -	# list active sessions
> -	echo Current active iSCSI sessions:
> -	$ADM -m session
> -}
> -
> -case "$1" in
> -	start|starttargets|stop|stoptargets|restart|restarttargets|status)
> -		$1
> -		;;
> -	*)
> -		echo "Usage: $0 {start|stop|restart|status}"
> -		exit 1
> -		;;
> -esac
> -exit $RETVAL
> diff --git a/meta-openstack/recipes-extended/iscsi-initiator-utils/files/iscsi-initiator-utils-dont-use-static.patch b/meta-openstack/recipes-extended/iscsi-initiator-utils/files/iscsi-initiator-utils-dont-use-static.patch
> deleted file mode 100644
> index 8645587e2310..000000000000
> --- a/meta-openstack/recipes-extended/iscsi-initiator-utils/files/iscsi-initiator-utils-dont-use-static.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -iscsi-initiator-utils not to use static
> -
> -This patch is from fedora17.
> -
> -Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> -Signed-off-by: Vu Tran <vu.tran@windriver.com>
> -
> -diff --git a/usr/Makefile b/usr/Makefile
> -index 673b7f1..fd14a10 100644
> ---- a/usr/Makefile
> -+++ b/usr/Makefile
> -@@ -61,7 +61,7 @@ iscsiadm: $(ISCSI_LIB_SRCS) $(DISCOVERY_SRCS) iscsiadm.o session_mgmt.o
> -
> - iscsistart: $(ISCSI_LIB_SRCS) $(INITIATOR_SRCS) $(FW_BOOT_SRCS) \
> - 		iscsistart.o statics.o
> --	$(CC) $(CFLAGS) -static $^ -o $@
> -+	$(CC) $(CFLAGS) $^ -o $@
> - clean:
> - 	rm -f *.o $(PROGRAMS) .depend $(LIBSYS)
> -
> diff --git a/meta-openstack/recipes-extended/iscsi-initiator-utils/files/iscsi-initiator-utils-use-var-for-config.patch b/meta-openstack/recipes-extended/iscsi-initiator-utils/files/iscsi-initiator-utils-use-var-for-config.patch
> deleted file mode 100644
> index b0ce88960d4b..000000000000
> --- a/meta-openstack/recipes-extended/iscsi-initiator-utils/files/iscsi-initiator-utils-use-var-for-config.patch
> +++ /dev/null
> @@ -1,239 +0,0 @@
> -iscsi-initiator-utils to use var for config
> -
> -This patch is from fedora.
> -
> -Use /var/lib/iscsi/ instead of /etc/iscsi/ for holding
> -state files.
> -
> -Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> -Signed-off-by: Vu Tran <vu.tran@windriver.com>
> -
> -diff --git a/README b/README
> -index 7364b2d..5e8bff8 100644
> ---- a/README
> -+++ b/README
> -@@ -164,10 +164,10 @@ available on all Linux installations.
> -
> - The database contains two tables:
> -
> --- Discovery table (/etc/iscsi/send_targets);
> --- Node table (/etc/iscsi/nodes).
> -+- Discovery table (/var/lib/iscsi/send_targets);
> -+- Node table (/var/lib/iscsi/nodes).
> -
> --The regular place for iSCSI database files: /etc/iscsi/nodes
> -+The regular place for iSCSI database files: /var/lib/iscsi/nodes
> -
> - The iscsiadm utility is a command-line tool to manage (update, delete,
> - insert, query) the persistent database.
> -@@ -444,7 +444,7 @@ a scsi_host per HBA port).
> - To manage both types of initiator stacks, iscsiadm uses the interface (iface)
> - structure. For each HBA port or for software iscsi for each network
> - device (ethX) or NIC, that you wish to bind sessions to you must create
> --a iface config /etc/iscsi/ifaces.
> -+a iface config /var/lib/iscsi/ifaces.
> -
> - Prep:
> -
> -@@ -478,29 +478,29 @@ Running:
> - iface0 qla4xxx,00:c0:dd:08:63:e8,20.15.0.7,default,iqn.2005-06.com.redhat:madmax
> - iface1 qla4xxx,00:c0:dd:08:63:ea,20.15.0.9,default,iqn.2005-06.com.redhat:madmax
> -
> --Will report iface configurations that are setup in /etc/iscsi/ifaces.
> -+Will report iface configurations that are setup in /var/lib/iscsi/ifaces.
> - The format is:
> -
> - iface_name transport_name,hwaddress,ipaddress,net_ifacename,initiatorname
> -
> - For software iscsi, you can create the iface configs by hand, but it is
> - reccomended that you use iscsiadm's iface mode. There is a iface.example in
> --/etc/iscsi/ifaces which can be used as a template for the daring.
> -+/var/lib/iscsi/ifaces which can be used as a template for the daring.
> -
> - For each network object you wish to bind a session to you must create
> --a seperate iface config in /etc/iscsi/ifaces and each iface config file
> -+a seperate iface config in /var/lib/iscsi/ifaces and each iface config file
> - must have a unique name which is less than or equal to 64 characters.
> -
> - Example:
> -
> - If you have NIC1 with MAC address 00:0F:1F:92:6B:BF and NIC2 with
> - MAC address 00:C0:DD:08:63:E7 and you wanted to do software iscsi over
> --TCP/IP. Then in /etc/iscsi/ifaces/iface0 you would enter:
> -+TCP/IP. Then in /var/lib/iscsi/ifaces/iface0 you would enter:
> -
> - iface.transport_name = tcp
> - iface.hwaddress = 00:0F:1F:92:6B:BF
> -
> --and in /etc/iscsi/ifaces/iface1 you would enter:
> -+and in /var/lib/iscsi/ifaces/iface1 you would enter:
> -
> - iface.transport_name = tcp
> - iface.hwaddress = 00:C0:DD:08:63:E7
> -@@ -550,7 +550,7 @@ cxgb3i.00:07:43:05:97:07 cxgb3i,00:07:43:05:97:07,<empty>,<empty>,<empty>
> - qla4xxx.00:0e:1e:04:8b:2e qla4xxx,00:0e:1e:04:8b:2e,<empty>,<empty>,<empty>
> -
> -
> --Will report iface configurations that are setup in /etc/iscsi/ifaces.
> -+Will report iface configurations that are setup in /var/lib/iscsi/ifaces.
> - The format is:
> -
> - iface_name transport_name,hwaddress,ipaddress,net_ifacename,initiatorname
> -@@ -636,7 +636,7 @@ need a seperate network connection to the target for discovery purposes.
> - *This will be fixed in the next version of open-iscsi*
> -
> - For compatibility reasons, when you run iscsiadm to do discovery, it
> --will check for interfaces in /etc/iscsi/iscsi/ifaces that are using
> -+will check for interfaces in /var/lib/iscsi/iscsi/ifaces that are using
> - tcp for the iface.transport and it will bind the portals that are discovered
> - so that they will be logged in through those ifaces. This behavior can also
> - be overriden by passing in the interfaces you want to use. For the case
> -@@ -654,7 +654,7 @@ we do not bind a session to a iface, then you can use the special iface
> -
> - iscsiadm -m discoverydb -t st -p ip:port -I default --discover -P 1
> -
> --And if you did not define any interfaces in /etc/iscsi/ifaces and do
> -+And if you did not define any interfaces in /var/lib/iscsi/ifaces and do
> - not pass anything into iscsiadm, running iscsiadm will do the default
> - behavior, where we allow the network subsystem to decide which
> - device to use.
> -@@ -696,7 +696,7 @@ To now log into targets it is the same as with sofware iscsi. See section
> -
> - 	    ./iscsiadm -m discoverydb -t st -p 192.168.1.1:3260 --discover
> -
> --	This will search /etc/iscsi/send_targets for a record with the
> -+	This will search /var/lib/iscsi/send_targets for a record with the
> - 	ID [portal = 192.168.1.1:3260 and type = sendtargets. If found it
> - 	will perform discovery using the settings stored in the record.
> - 	If a record does not exist, it will be created using the iscsid.conf
> -@@ -705,7 +705,7 @@ To now log into targets it is the same as with sofware iscsi. See section
> - 	The argument to -p may also be a hostname instead of an address.
> - 	    ./iscsiadm -m discoverydb -t st -p smoehost --discover
> -
> --	For the ifaces, iscsiadm will first search /etc/iscsi/ifaces for
> -+	For the ifaces, iscsiadm will first search /var/lib/iscsi/ifaces for
> - 	interfaces using software iscsi. If any are found then nodes found
> - 	during discovery will be setup so that they can logged in through
> - 	those interfaces. To specify a specific iface, pass the
> -@@ -761,7 +761,7 @@ To now log into targets it is the same as with sofware iscsi. See section
> - 	This command will perform discovery, but not manipulate the node DB.
> -
> -   - SendTargets iSCSI Discovery with a specific interface. If you
> --	wish to only use a subset of the interfaces in /etc/iscsi/ifaces
> -+	wish to only use a subset of the interfaces in /var/lib/iscsi/ifaces
> - 	then you can pass them in during discovery:
> -
> - 	     ./iscsiadm -m discoverydb -t sendtargets -p 192.168.1.1:3260 \
> -@@ -1072,8 +1072,8 @@ where targetname is the name of the target and ip_address:port is the address
> - and port of the portal. tpgt, is the portal group tag of
> - the portal, and is not used in iscsiadm commands except for static
> - record creation. And iface name is the name of the iscsi interface
> --defined in /etc/iscsi/ifaces. If no interface was defined in
> --/etc/iscsi/ifaces or passed in, the default behavior is used.
> -+defined in /var/lib/iscsi/ifaces. If no interface was defined in
> -+/var/lib/iscsi/ifaces or passed in, the default behavior is used.
> - Default here is iscsi_tcp/tcp to be used over which ever NIC the
> - network layer decides is best.
> -
> -@@ -1188,7 +1188,7 @@ If set, iscsid will perform discovery to the address every
> - discovery.isns.discoveryd_poll_inval or
> - discovery.sendtargets.discoveryd_poll_inval seconds,
> - and it will log into any portals found from the discovery source using
> --the ifaces in /etc/iscsi/ifaces.
> -+the ifaces in /var/lib/iscsi/ifaces.
> -
> - Note that for iSNS the poll_interval does not have to be set. If not set,
> - iscsid will only perform rediscovery when it gets a SCN from the server.
> -diff --git a/doc/iscsiadm.8 b/doc/iscsiadm.8
> -index 7c209f6..e94cca0 100644
> ---- a/doc/iscsiadm.8
> -+++ b/doc/iscsiadm.8
> -@@ -89,7 +89,7 @@ This option is only valid for ping submode.
> - .TP
> - \fB\-I\fR, \fB\-\-interface=\fI[iface]\fR
> - The interface argument specifies the iSCSI interface to use for the operation.
> --iSCSI interfaces (iface) are defined in /etc/iscsi/ifaces. For hardware
> -+iSCSI interfaces (iface) are defined in /var/lib/iscsi/ifaces. For hardware
> - iSCSI (qla4xxx) the iface config must have the hardware address
> - (iface.hwaddress = port's MAC address)
> - and the driver/transport_name (iface.transport_name). The iface's name is
> -@@ -166,7 +166,7 @@ If no other options are specified: for \fIdiscoverydb\fR and \fInode\fR, all
> - of their respective records are displayed; for \fIsession\fR, all active
> - sessions and connections are displayed; for \fIfw\fR, all boot firmware
> - values are displayed; for \fIhost\fR, all iSCSI hosts are displayed; and
> --for \fIiface\fR, all ifaces setup in /etc/iscsi/ifaces are displayed.
> -+for \fIiface\fR, all ifaces setup in /var/lib/iscsi/ifaces are displayed.
> -
> - .TP
> - \fB\-n\fR, \fB\-\-name=\fIname\fR
> -@@ -535,10 +535,10 @@ The configuration file read by \fBiscsid\fR and \fBiscsiadm\fR on startup.
> - The file containing the iSCSI InitiatorName and InitiatorAlias read by
> - \fBiscsid\fR and \fBiscsiadm\fR on startup.
> - .TP
> --/etc/iscsi/nodes/
> -+/var/lib/iscsi/nodes/
> - This directory contains the nodes with their targets.
> - .TP
> --/etc/iscsi/send_targets
> -+/var/lib/iscsi/send_targets
> - This directory contains the portals.
> -
> - .SH "SEE ALSO"
> -diff --git a/usr/idbm.c b/usr/idbm.c
> -index 4d30aa9..316e54f 100644
> ---- a/usr/idbm.c
> -+++ b/usr/idbm.c
> -@@ -2468,9 +2468,9 @@ free_info:
> - int idbm_init(idbm_get_config_file_fn *fn)
> - {
> - 	/* make sure root db dir is there */
> --	if (access(ISCSI_CONFIG_ROOT, F_OK) != 0) {
> --		if (mkdir(ISCSI_CONFIG_ROOT, 0660) != 0) {
> --			log_error("Could not make %s %d\n", ISCSI_CONFIG_ROOT,
> -+	if (access(ISCSIVAR, F_OK) != 0) {
> -+		if (mkdir(ISCSIVAR, 0660) != 0) {
> -+			log_error("Could not make %s %d\n", ISCSIVAR,
> - 				   errno);
> - 			return errno;
> - 		}
> -diff --git a/usr/idbm.h b/usr/idbm.h
> -index 245f046..f45e86e 100644
> ---- a/usr/idbm.h
> -+++ b/usr/idbm.h
> -@@ -28,12 +28,16 @@
> - #include "config.h"
> - #include "list.h"
> -
> --#define NODE_CONFIG_DIR		ISCSI_CONFIG_ROOT"nodes"
> --#define SLP_CONFIG_DIR		ISCSI_CONFIG_ROOT"slp"
> --#define ISNS_CONFIG_DIR		ISCSI_CONFIG_ROOT"isns"
> --#define STATIC_CONFIG_DIR	ISCSI_CONFIG_ROOT"static"
> --#define FW_CONFIG_DIR		ISCSI_CONFIG_ROOT"fw"
> --#define ST_CONFIG_DIR		ISCSI_CONFIG_ROOT"send_targets"
> -+#define ISCSIVAR			"/var/lib/iscsi/"
> -+
> -+#define NODE_CONFIG_DIR    ISCSIVAR"nodes"
> -+#define SLP_CONFIG_DIR     ISCSIVAR"slp"
> -+#define ISNS_CONFIG_DIR    ISCSIVAR"isns"
> -+#define STATIC_CONFIG_DIR  ISCSIVAR"static"
> -+#define FW_CONFIG_DIR      ISCSIVAR"fw"
> -+#define ST_CONFIG_DIR      ISCSIVAR"send_targets"
> -+
> -+
> - #define ST_CONFIG_NAME		"st_config"
> - #define ISNS_CONFIG_NAME	"isns_config"
> -
> -diff --git a/usr/iface.h b/usr/iface.h
> -index 01f7074..2c6ef72 100644
> ---- a/usr/iface.h
> -+++ b/usr/iface.h
> -@@ -20,7 +20,8 @@
> - #ifndef ISCSI_IFACE_H
> - #define ISCSI_IFACE_H
> -
> --#define IFACE_CONFIG_DIR	ISCSI_CONFIG_ROOT"ifaces"
> -+#include "idbm.h"
> -+#define IFACE_CONFIG_DIR	ISCSIVAR"ifaces"
> -
> - struct iface_rec;
> - struct list_head;
> diff --git a/meta-openstack/recipes-extended/iscsi-initiator-utils/iscsi-initiator-utils.inc b/meta-openstack/recipes-extended/iscsi-initiator-utils/iscsi-initiator-utils.inc
> deleted file mode 100644
> index 30dcffc8efad..000000000000
> --- a/meta-openstack/recipes-extended/iscsi-initiator-utils/iscsi-initiator-utils.inc
> +++ /dev/null
> @@ -1,109 +0,0 @@
> -#
> -# Copyright (C) 2014 Wind River Systems, Inc.
> -#
> -SUMMARY = "iSCSI daemon and utility programs"
> -DESCRIPTION = \
> -"Open-iSCSI project is a high performance, transport independent, \
> -multi-platform implementation of RFC3720. The iscsi package provides \
> -the server daemon for the iSCSI protocol, as well as the utility \
> -programs used to manage it. iSCSI is a protocol for distributed \
> -disk access using SCSI commands sent over Internet Protocol networks."
> -SECTION = "console/network"
> -
> -HOMEPAGE = "http://www.open-iscsi.org/"
> -INC_PR = "r4"
> -
> -UPSTREAM_name = "open-iscsi"
> -
> -#iscsi-initiator-utils-{use-var-for-config}.patch are from fedora
> -#change nodes,send_targets... from /etc/iscsi to /var/lib/iscsi
> -SRC_URI = "http://www.open-iscsi.org/bits/${UPSTREAM_name}-${PV}.tar.gz \
> -	   file://iscsi-initiator-utils-use-var-for-config.patch \
> -	   file://iscsi-initiator-utils-dont-use-static.patch	\
> -	   file://initd.debian	\
> -"
> -S = "${WORKDIR}/${UPSTREAM_name}-${PV}"
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -
> -#utils/fwparam_ibft/prom_parse.y utils/fwparam_ibft/prom_lex.l
> -#already parsed in source 2.0 but still depends on flex and bison
> -#native in case future version they are not parsed
> -DEPENDS += "openssl flex-native bison-native"
> -
> -PACKAGES =+ "${PN}-tests"
> -
> -FILES_${PN}-tests = "/opt/${BPN}-tests/*"
> -RDEPENDS_${PN}-tests = "perl"
> -
> -inherit update-rc.d
> -
> -do_configure () {
> -	#need to support cross-compiling in open-isns only
> -	(cd utils/open-isns; \
> -	 ./configure --host=${TARGET_SYS} --build=${BUILD_SYS} --with-security=no )
> -}
> -
> -do_compile () {
> -	#make iscsistart one of PROGRAMS if install_user in do_install
> -	#sed -i -e '/^PROGRAMS = /s;$; usr/iscsistart;' Makefile
> -
> -	#fix the ar used in open-isns
> -	sed -i -e 's:ar cr :$(AR) cr :' ${S}/utils/open-isns/Makefile
> -	oe_runmake user
> -
> -}
> -
> -do_install () {
> -	#completely override the install_user as bugs in Makefile
> -	#oe_runmake DESTDIR="${D}" install_user
> -
> -	#install necessary directories
> -	install -d ${D}${base_sbindir} \
> -		${D}${sysconfdir}/init.d \
> -		${D}${sysconfdir}/iscsi \
> -		${D}${localstatedir}/lib/iscsi/nodes \
> -		${D}${localstatedir}/lib/iscsi/send_targets \
> -		${D}${localstatedir}/lib/iscsi/static \
> -		${D}${localstatedir}/lib/iscsi/isns \
> -		${D}${localstatedir}/lib/iscsi/slp \
> -		${D}${localstatedir}/lib/iscsi/ifaces \
> -		${D}${localstatedir}/lock/iscsi ${D}/${mandir}/man8
> -
> -	install -p -m 755 ${S}/usr/iscsid ${S}/usr/iscsiadm \
> -		${S}/utils/iscsi-iname \
> -		${S}/usr/iscsistart ${D}/${base_sbindir}
> -
> -	install -p -m 644 ${S}/doc/iscsiadm.8 ${S}/doc/iscsid.8 ${D}/${mandir}/man8
> -	install -p -m 644 ${S}/etc/iscsid.conf ${D}${sysconfdir}/iscsi
> -	install -p -m 755 ${WORKDIR}/initd.debian ${D}${sysconfdir}/init.d/iscsid
> -
> -	#install regression tests
> -	[ ! -d ${D}/opt/${BPN}-tests ] && mkdir -p ${D}/opt/${BPN}-tests
> -	install ${S}/test/regression.dat ${S}/test/regression.sh ${D}/opt/${BPN}-tests/
> -
> -	#open-isns tests
> -	mkdir -p ${D}/opt/${BPN}-tests/isns-tests
> -	install ${S}/utils/open-isns/tests/*.pl ${D}/opt/${BPN}-tests/isns-tests/
> -	install ${S}/utils/open-isns/tests/genkey \
> -		${S}/utils/open-isns/tests/client.conf \
> -		${S}/utils/open-isns/tests/server.conf \
> -		${D}/opt/${BPN}-tests/isns-tests/
> -	cp -a ${S}/utils/open-isns/tests/data ${D}/opt/${BPN}-tests/isns-tests/
> -}
> -
> -pkg_postinst_${PN}() {
> -	#default there is no initiatorname.iscsi installed
> -	#but it is needed or iscsid will fail
> -	
> -	#will run only when postinst on target
> -	if [ "x$D" != "x" ]; then
> -		exit 1
> -	fi
> -	if [ ! -f ${sysconfdir}/iscsi/initiatorname.iscsi ]; then
> -		echo "InitiatorName=$(${base_sbindir}/iscsi-iname)" > \
> -		${sysconfdir}/iscsi/initiatorname.iscsi
> -	fi
> -}
> -
> -INITSCRIPT_NAME = "iscsid"
> -INITSCRIPT_PARAMS = "start 30 1 2 3 4 5 . stop 70 0 1 2 3 4 5 6 ."
> diff --git a/meta-openstack/recipes-extended/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-openstack/recipes-extended/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> deleted file mode 100644
> index cb7429ddd264..000000000000
> --- a/meta-openstack/recipes-extended/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#
> -# Copyright (C) 2014 Wind River Systems, Inc.
> -#
> -LICENSE = "GPLv2 & LGPLv2.1"
> -LIC_FILES_CHKSUM = \
> -	"file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
> -	 file://utils/open-isns/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> -
> -PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
> -SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
> -
> -require ${PN}.inc
>


