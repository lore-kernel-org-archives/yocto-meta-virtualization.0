Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A056BE01469
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:55 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4044017eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=C1sZMWHXaoHbrQJbmVJPhOlXJD8JVvkB3EhA9BtRjbs=;
	b=KevhmCZo6BilKijTSVOugx3xINW3pVTTlXoAsFncL+p/aX1l38KM7RpVDK1gd0g5cU
	/brP+CfDQqzb/UK4m3WyA+U2efErDC61gqz7q9JKnfibNkymB3+BSmTvMhrkudg6kwkF
	FVdM/C7WW9Cd12OO5QTKCPEFN7bNG7yzSETA1+iOLSIj92vxinyr/EFSYOmuyvYrjH/e
	NrAxFzynQgBxQzX3DODhSUQChw5deP9pdVWGDIgRgqs9+MLTopwhFY2WPa+jkmUd4sS5
	sOA+8asGV6sxN4mRXF4U+5xGK6s1NdMabFQ0pcfIGUGSqc+HA+l/WzkwksWklWTpMbAQ
	cn/A==
Received: by 10.14.221.5 with SMTP id q5mr5981344eep.33.1354802635325;
	Thu, 06 Dec 2012 06:03:55 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id b49sm16070533eem.16.2012.12.06.06.03.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id A980C400DAC; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:15 +0100
Message-Id: <1354802601-10840-9-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv3 08/14] Added openvswitch recipe
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
X-List-Received-Date: Thu, 06 Dec 2012 14:03:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 .../openvswitch/files/openvswitch-controller       |  274 ++++++++++++++++++++
 .../openvswitch/files/openvswitch-controller-setup |   29 +++
 .../openvswitch/files/openvswitch-example          |  102 ++++++++
 .../openvswitch/files/openvswitch-switch           |  102 ++++++++
 .../openvswitch/files/openvswitch-switch-setup     |    8 +
 .../openvswitch/openvswitch_1.4.3.bb               |   99 +++++++
 6 files changed, 614 insertions(+)
 create mode 100755 recipes-networking/openvswitch/files/openvswitch-controller
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-controller-setup
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-example
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-switch
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-switch-setup
 create mode 100644 recipes-networking/openvswitch/openvswitch_1.4.3.bb

diff --git a/recipes-networking/openvswitch/files/openvswitch-controller b/recipes-networking/openvswitch/files/openvswitch-controller
new file mode 100755
index 0000000..026974a
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-controller
@@ -0,0 +1,274 @@
+#!/bin/sh
+#
+# Copyright (c) 2011 Nicira Networks Inc.
+# Copyright (c) 2007, 2009 Javier Fernandez-Sanguino <jfs@debian.org>
+#
+# This is free software; you may redistribute it and/or modify
+# it under the terms of the GNU General Public License as
+# published by the Free Software Foundation; either version 2,
+# or (at your option) any later version.
+#
+# This is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License with
+# the Debian operating system, in /usr/share/common-licenses/GPL;  if
+# not, write to the Free Software Foundation, Inc., 59 Temple Place,
+# Suite 330, Boston, MA 02111-1307 USA
+#
+### BEGIN INIT INFO
+# Provides:          openvswitch-controller
+# Required-Start:    $network $local_fs $remote_fs
+# Required-Stop:     $remote_fs
+# Should-Start:      $named
+# Should-Stop:       
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Open vSwitch controller
+### END INIT INFO
+
+PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
+
+DAEMON=/usr/bin/ovs-controller # Introduce the server's location here
+NAME=ovs-controller         # Introduce the short server's name here
+DESC=ovs-controller         # Introduce a short description here
+LOGDIR=/var/log/openvswitch # Log directory to use
+
+PIDFILE=/var/run/openvswitch/$NAME.pid 
+
+test -x $DAEMON || exit 0
+
+. /lib/lsb/init-functions
+
+# Default options, these can be overriden by the information
+# at /etc/default/openvswitch-controller
+DAEMON_OPTS=""          # Additional options given to the server 
+
+DODTIME=10              # Time to wait for the server to die, in seconds
+                        # If this value is set too low you might not
+                        # let some servers to die gracefully and
+                        # 'restart' will not work
+                        
+LOGFILE=$LOGDIR/$NAME.log  # Server logfile
+#DAEMONUSER=            # User to run the daemons as. If this value
+                        # is set start-stop-daemon will chuid the server
+
+# Include defaults if available
+default=/etc/default/openvswitch-controller
+if [ -f $default ] ; then
+    . $default
+fi
+
+# Check that the user exists (if we set a user)
+# Does the user exist?
+if [ -n "$DAEMONUSER" ] ; then
+    if getent passwd | grep -q "^$DAEMONUSER:"; then
+        # Obtain the uid and gid
+        DAEMONUID=`getent passwd |grep "^$DAEMONUSER:" | awk -F : '{print $3}'`
+        DAEMONGID=`getent passwd |grep "^$DAEMONUSER:" | awk -F : '{print $4}'`
+    else
+        log_failure_msg "The user $DAEMONUSER, required to run $NAME does not exist."
+        exit 1
+    fi
+fi
+
+
+set -e
+
+running_pid() {
+# Check if a given process pid's cmdline matches a given name
+    pid=$1
+    name=$2
+    [ -z "$pid" ] && return 1 
+    [ ! -d /proc/$pid ] &&  return 1
+    cmd=`cat /proc/$pid/cmdline | tr "\000" "\n"|head -n 1 |cut -d : -f 1`
+    # Is this the expected server
+    [ "$cmd" != "$name" ] &&  return 1
+    return 0
+}
+
+running() {
+# Check if the process is running looking at /proc
+# (works for all users)
+
+    # No pidfile, probably no daemon present
+    [ ! -f "$PIDFILE" ] && return 1
+    pid=`cat $PIDFILE`
+    running_pid $pid $DAEMON || return 1
+    return 0
+}
+
+start_server() {
+    if [ -z "$LISTEN" ]; then
+        echo "$default: No connection methods configured, controller disabled" >&2
+        exit 0
+    fi
+
+    if [ ! -d /var/run/openvswitch ]; then
+        install -d -m 755 -o root -g root /var/run/openvswitch
+    fi
+
+    SSL_OPTS=
+    case $LISTEN in
+        *ssl*)
+            : ${PRIVKEY:=/etc/openvswitch-controller/privkey.pem}
+            : ${CERT:=/etc/openvswitch-controller/cert.pem}
+            : ${CACERT:=/etc/openvswitch-controller/cacert.pem}
+            if test ! -e "$PRIVKEY" || test ! -e "$CERT" ||
+                test ! -e "$CACERT"; then
+                if test ! -e "$PRIVKEY"; then
+                    echo "$PRIVKEY: private key missing" >&2
+                fi
+                if test ! -e "$CERT"; then
+                    echo "$CERT: certificate for private key missing" >&2
+                fi
+                if test ! -e "$CACERT"; then
+                    echo "$CACERT: CA certificate missing" >&2
+                fi
+                exit 1
+            fi
+            SSL_OPTS="--private-key=$PRIVKEY --certificate=$CERT --ca-cert=$CACERT"
+            ;;
+    esac
+
+# Start the process using the wrapper
+        if [ -z "$DAEMONUSER" ] ; then
+            start-stop-daemon --start --pidfile $PIDFILE \
+                        --exec $DAEMON -- --detach --pidfile=$PIDFILE \
+                        $LISTEN $DAEMON_OPTS $SSL_OPTS
+            errcode=$?
+        else
+# if we are using a daemonuser then change the user id
+            start-stop-daemon --start --quiet --pidfile $PIDFILE \
+                        --chuid $DAEMONUSER --exec $DAEMON -- \
+                        --detach --pidfile=$PIDFILE $LISTEN $DAEMON_OPTS \
+                        $SSL_OPTS
+            errcode=$?
+        fi
+        return $errcode
+}
+
+stop_server() {
+# Stop the process using the wrapper
+        if [ -z "$DAEMONUSER" ] ; then
+            start-stop-daemon --stop --quiet --pidfile $PIDFILE \
+                        --exec $DAEMON
+            errcode=$?
+        else
+# if we are using a daemonuser then look for process that match
+            start-stop-daemon --stop --quiet --pidfile $PIDFILE \
+                        --user $DAEMONUSER --exec $DAEMON
+            errcode=$?
+        fi
+
+        return $errcode
+}
+
+reload_server() {
+    [ ! -f "$PIDFILE" ] && return 1
+    pid=`cat $PIDFILE` # This is the daemon's pid
+    # Send a SIGHUP
+    kill -1 $pid
+    return $?
+}
+
+force_stop() {
+# Force the process to die killing it manually
+    [ ! -e "$PIDFILE" ] && return
+    if running ; then
+        kill -15 $pid
+        # Is it really dead?
+        sleep "$DODTIME"
+        if running ; then
+            kill -9 $pid
+            sleep "$DODTIME"
+            if running ; then
+                echo "Cannot kill $NAME (pid=$pid)!"
+                exit 1
+            fi
+        fi
+    fi
+    rm -f $PIDFILE
+}
+
+
+case "$1" in
+  start)
+        log_begin_msg "Starting $DESC " "$NAME"
+        # Check if it's running first
+        if running ;  then
+            log_warning_msg "apparently already running"
+            log_end_msg 0
+            exit 0
+        fi
+        if start_server && running ;  then
+            # It's ok, the server started and is running
+            log_end_msg 0
+        else
+            # Either we could not start it or it is not running
+            # after we did
+            # NOTE: Some servers might die some time after they start,
+            # this code does not try to detect this and might give
+            # a false positive (use 'status' for that)
+            log_end_msg 1
+        fi
+        ;;
+  stop)
+        log_begin_msg "Stopping $DESC" "$NAME"
+        if running ; then
+            # Only stop the server if we see it running
+            stop_server
+            log_end_msg $?
+        else
+            # If it's not running don't do anything
+            log_warning_msg "apparently not running"
+            log_end_msg 0
+            exit 0
+        fi
+        ;;
+  force-stop)
+        # First try to stop gracefully the program
+        $0 stop
+        if running; then
+            # If it's still running try to kill it more forcefully
+            log_begin_msg "Stopping (force) $DESC" "$NAME"
+            force_stop
+            log_end_msg $?
+        fi
+        ;;
+  restart|force-reload)
+        log_begin_msg "Restarting $DESC" "$NAME"
+        stop_server
+        # Wait some sensible amount, some server need this
+        [ -n "$DODTIME" ] && sleep $DODTIME
+        start_server
+        running
+        log_end_msg $?
+        ;;
+  status)
+
+        log_begin_msg "Checking status of $DESC" "$NAME"
+        if running ;  then
+            log_begin_msg "running"
+            log_end_msg 0
+        else
+            log_warning_msg "apparently not running"
+            log_end_msg 1
+            exit 1
+        fi
+        ;;
+  # Use this if the daemon cannot reload
+  reload)
+        log_warning_msg "Reloading $NAME daemon: not implemented, as the daemon"
+        log_warning_msg "cannot re-read the config file (use restart)."
+        ;;
+  *)
+        N=/etc/init.d/openvswitch-controller
+        echo "Usage: $N {start|stop|force-stop|restart|force-reload|status}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/recipes-networking/openvswitch/files/openvswitch-controller-setup b/recipes-networking/openvswitch/files/openvswitch-controller-setup
new file mode 100644
index 0000000..1d9f926
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-controller-setup
@@ -0,0 +1,29 @@
+# This is a POSIX shell fragment                -*- sh -*-
+
+# LISTEN: What OpenFlow connection methods should the controller listen on?
+#
+# This is a space-delimited list of connection methods:
+#
+# * "pssl:[PORT]": Listen for SSL connections on the specified PORT
+#   (default: 6633).  The private key, certificate, and CA certificate
+#   must be specified below.
+#
+# * "pctp:[PORT]": Listen for TCP connections on the specified PORT
+#   (default: 6633).  Not recommended for security reasons.
+#
+LISTEN="pssl:"
+
+# PRIVKEY: Name of file containing controller's private key.
+# Required if SSL enabled.
+PRIVKEY=/etc/openvswitch-controller/privkey.pem
+
+# CERT: Name of file containing certificate for private key.
+# Required if SSL enabled.
+CERT=/etc/openvswitch-controller/cert.pem
+
+# CACERT: Name of file containing switch CA certificate.
+# Required if SSL enabled.
+CACERT=/etc/openvswitch-controller/cacert.pem
+
+# Additional options to pass to controller, e.g. "--hub"
+DAEMON_OPTS=""
diff --git a/recipes-networking/openvswitch/files/openvswitch-example b/recipes-networking/openvswitch/files/openvswitch-example
new file mode 100644
index 0000000..6f08c3f
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-example
@@ -0,0 +1,102 @@
+#! /bin/sh
+#
+# Copyright (C) 2011 Nicira Networks, Inc.
+#
+# Licensed under the Apache License, Version 2.0 (the "License");
+# you may not use this file except in compliance with the License.
+# You may obtain a copy of the License at:
+#
+#     http://www.apache.org/licenses/LICENSE-2.0
+#
+# Unless required by applicable law or agreed to in writing, software
+# distributed under the License is distributed on an "AS IS" BASIS,
+# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+# See the License for the specific language governing permissions and
+# limitations under the License.
+#
+### BEGIN INIT INFO
+# Provides:          openvswitch-switch
+# Required-Start:    $network $named $remote_fs $syslog
+# Required-Stop:     $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Open vSwitch switch
+### END INIT INFO
+
+(test -x /usr/sbin/ovs-vswitchd && test -x /usr/sbin/ovsdb-server) || exit 0
+
+. /usr/share/openvswitch/scripts/ovs-lib
+test -e /etc/default/openvswitch-switch && . /etc/default/openvswitch-switch
+
+if test X"$BRCOMPAT" = Xyes && test ! -x /usr/sbin/ovs-brcompatd; then
+    BRCOMPAT=no
+    log_warning_msg "ovs-brcompatd missing, disabling bridge compatibility"
+fi
+
+ovs_ctl () {
+    set /usr/share/openvswitch/scripts/ovs-ctl "$@"
+    if test X"$BRCOMPAT" = Xyes; then
+        set "$@" --brcompat
+    fi
+    "$@"
+}
+
+load_kmod () {
+    ovs_ctl load-kmod || exit $?
+}
+
+start () {
+    if ovs_ctl load-kmod; then
+	:
+    else
+	echo "Module has probably not been built for this kernel."
+	if ! test -d /usr/share/doc/openvswitch-datapath-source; then
+	    echo "Install the openvswitch-datapath-source package, then read"
+	else
+            echo "For instructions, read"
+	fi
+	echo "/usr/share/doc/openvswitch-datapath-source/README.Debian"
+    fi
+    set ovs_ctl ${1-start} --system-id=random
+    if test X"$FORCE_COREFILES" != X; then
+	set "$@" --force-corefiles="$FORCE_COREFILES"
+    fi
+    "$@" || exit $?
+
+    ovs_ctl --protocol=gre enable-protocol
+}
+
+stop () {
+    ovs_ctl stop
+}
+
+case $1 in
+    start)
+        start
+	;;
+    stop | force-stop)
+        stop
+        ;;
+    reload | force-reload)
+        # The OVS daemons keep up-to-date.
+        ;;
+    restart)
+        stop
+        start
+        ;;
+    status)
+        ovs_ctl status
+        ;;
+    force-reload-kmod)
+        start force-reload-kmod
+        ;;
+    load-kmod)
+        load_kmod
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|force-reload|status|force-stop|force-reload-kmod|load-kmod}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/recipes-networking/openvswitch/files/openvswitch-switch b/recipes-networking/openvswitch/files/openvswitch-switch
new file mode 100644
index 0000000..6f08c3f
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-switch
@@ -0,0 +1,102 @@
+#! /bin/sh
+#
+# Copyright (C) 2011 Nicira Networks, Inc.
+#
+# Licensed under the Apache License, Version 2.0 (the "License");
+# you may not use this file except in compliance with the License.
+# You may obtain a copy of the License at:
+#
+#     http://www.apache.org/licenses/LICENSE-2.0
+#
+# Unless required by applicable law or agreed to in writing, software
+# distributed under the License is distributed on an "AS IS" BASIS,
+# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+# See the License for the specific language governing permissions and
+# limitations under the License.
+#
+### BEGIN INIT INFO
+# Provides:          openvswitch-switch
+# Required-Start:    $network $named $remote_fs $syslog
+# Required-Stop:     $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Open vSwitch switch
+### END INIT INFO
+
+(test -x /usr/sbin/ovs-vswitchd && test -x /usr/sbin/ovsdb-server) || exit 0
+
+. /usr/share/openvswitch/scripts/ovs-lib
+test -e /etc/default/openvswitch-switch && . /etc/default/openvswitch-switch
+
+if test X"$BRCOMPAT" = Xyes && test ! -x /usr/sbin/ovs-brcompatd; then
+    BRCOMPAT=no
+    log_warning_msg "ovs-brcompatd missing, disabling bridge compatibility"
+fi
+
+ovs_ctl () {
+    set /usr/share/openvswitch/scripts/ovs-ctl "$@"
+    if test X"$BRCOMPAT" = Xyes; then
+        set "$@" --brcompat
+    fi
+    "$@"
+}
+
+load_kmod () {
+    ovs_ctl load-kmod || exit $?
+}
+
+start () {
+    if ovs_ctl load-kmod; then
+	:
+    else
+	echo "Module has probably not been built for this kernel."
+	if ! test -d /usr/share/doc/openvswitch-datapath-source; then
+	    echo "Install the openvswitch-datapath-source package, then read"
+	else
+            echo "For instructions, read"
+	fi
+	echo "/usr/share/doc/openvswitch-datapath-source/README.Debian"
+    fi
+    set ovs_ctl ${1-start} --system-id=random
+    if test X"$FORCE_COREFILES" != X; then
+	set "$@" --force-corefiles="$FORCE_COREFILES"
+    fi
+    "$@" || exit $?
+
+    ovs_ctl --protocol=gre enable-protocol
+}
+
+stop () {
+    ovs_ctl stop
+}
+
+case $1 in
+    start)
+        start
+	;;
+    stop | force-stop)
+        stop
+        ;;
+    reload | force-reload)
+        # The OVS daemons keep up-to-date.
+        ;;
+    restart)
+        stop
+        start
+        ;;
+    status)
+        ovs_ctl status
+        ;;
+    force-reload-kmod)
+        start force-reload-kmod
+        ;;
+    load-kmod)
+        load_kmod
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|force-reload|status|force-stop|force-reload-kmod|load-kmod}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/recipes-networking/openvswitch/files/openvswitch-switch-setup b/recipes-networking/openvswitch/files/openvswitch-switch-setup
new file mode 100644
index 0000000..73387fb
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-switch-setup
@@ -0,0 +1,8 @@
+# This is a POSIX shell fragment                -*- sh -*-
+
+# FORCE_COREFILES: If 'yes' then core files will be enabled.
+# FORCE_COREFILES=yes
+
+# BRCOMPAT: If 'yes' and the openvswitch-brcompat package is installed, then
+# Linux bridge compatibility will be enabled.
+# BRCOMPAT=yes
diff --git a/recipes-networking/openvswitch/openvswitch_1.4.3.bb b/recipes-networking/openvswitch/openvswitch_1.4.3.bb
new file mode 100644
index 0000000..88f0114
--- /dev/null
+++ b/recipes-networking/openvswitch/openvswitch_1.4.3.bb
@@ -0,0 +1,99 @@
+SUMMARY = "OpenvSwitch"
+DESCRIPTION = "Open vSwitch is a production quality, multilayer virtual switch licensed under the open source Apache 2.0 license. It is designed to enable massive network automation through programmatic extension, while still supporting standard management interfaces and protocols (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
+HOMEPAGE = "http://openvswitch.org/"
+SECTION = "networking"
+LICENSE = "Apache-2"
+
+DEPENDS += "bridge-utils openssl python perl"
+
+RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
+	       python perl perl-module-strict"
+RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
+RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
+RDEPENDS_${PN}-pki = "${PN}"
+RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
+RRECOMMENDS_${PN} += "kernel-module-openvswitch"
+
+PR = "r1"
+
+SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
+	file://openvswitch-switch \
+	file://openvswitch-switch-setup \
+	file://openvswitch-controller \
+	file://openvswitch-controller-setup \		
+	"
+
+SRC_URI[md5sum] = "66df8e84f579e734aa4a43bc502baffd"
+SRC_URI[sha256sum] = "be1ae1ecff0ff095d24f552c148dd4d2931d187bbb35b3d9205416a0aca746a8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
+
+# Don't compile kernel modules by default since it heavily depends on 
+# kernel version. Use the in-kernel module for now.
+# distro layers can enable with EXTRA_OECONF_pn_openvswitch += ""
+# EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
+
+ALLOW_EMPTY_${PN}-pki = "1"
+PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
+
+FILES_${PN}-controller = "${sysconfdir}/init.d/openvswitch-controller \
+	${sysconfdir}/default/openvswitch-controller \
+	${sysconfdir}/openvswitch-controller \
+	${bindir}/ovs-controller"
+
+FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
+
+FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
+		   ${sysconfdir}/default/openvswitch-switch \
+		   "
+inherit autotools update-rc.d
+
+INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
+INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
+INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
+
+INITSCRIPT_NAME_${PN}-controller = "openvswitch-controller"
+INITSCRIPT_PARAMS_${PN}-controller = "defaults 72"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/default/
+	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
+	install -d ${D}/${sysconfdir}/openvswitch-controller
+	install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sysconfdir}/default/openvswitch-controller
+	
+	install -d ${D}/${sysconfdir}/init.d/
+	install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdir}/init.d/openvswitch-controller
+	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
+	true || rm -fr ${D}/${datadir}/${PN}/pki
+}
+
+pkg_postinst_${PN}-pki () {
+	# can't do this offline
+        if [ "x$D" != "x" ]; then
+                exit 1
+        fi
+	if test ! -d $D/${datadir}/${PN}/pki; then
+            ovs-pki init --dir=$D/${datadir}/${PN}/pki
+        fi
+}
+
+pkg_postinst_${PN}-controller () {
+        # can't do this offline
+        if [ "x$D" != "x" ]; then
+                exit 1
+        fi
+	
+	cd $D/${sysconfdir}/openvswitch-controller
+        if ! test -e cacert.pem; then
+            ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
+        fi
+        if ! test -e privkey.pem || ! test -e cert.pem; then
+            oldumask=$(umask)
+            umask 077
+            ovs-pki req+sign --dir=$D/${datadir}/${PN}/pki tmp controller >/dev/null
+            mv tmp-privkey.pem privkey.pem
+            mv tmp-cert.pem cert.pem
+            mv tmp-req.pem req.pem
+            chmod go+r cert.pem req.pem
+            umask $oldumask
+        fi
+}
-- 
1.7.9.5


