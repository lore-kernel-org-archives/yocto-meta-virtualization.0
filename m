Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4E7CE00B81; Fri, 11 Dec 2015 09:28:30 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8EF8E0097F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:28:28 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBBHSRbF023604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Dec 2015 09:28:27 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 11 Dec 2015 09:28:27 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Fri, 11 Dec 2015 12:28:24 -0500
Message-ID: <1449854905-22308-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449854905-22308-1-git-send-email-mark.asselstine@windriver.com>
References: <1449854905-22308-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 2/3] openvswitch: rename openvswitch-controller
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
X-List-Received-Date: Fri, 11 Dec 2015 17:28:30 -0000
Content-Type: text/plain

As of version 2.4.0 openvswitch-controller has been renamed to
openvswitch-testcontroller. This was documented in the upstream 'NEWS':

   - test-controller has been renamed ovs-testcontroller at request of users
     who find it useful for testing basic OpenFlow setups.  It is still not
     a necessary or desirable part of most Open vSwitch deployments.

Our initscripts and such have continued to reference the old name
despite the application name name changing and so
openvswitch-controller packaging has been broken for some time now.

We rename the openvswitch-controller package to reflect the upstream
name change and apply  this name change throughout. We also drop the
RDEPENDS as the upstream comments also indicate that this package is
not needed for a normal openvswitch deployment.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../openvswitch/files/openvswitch-controller       | 274 ---------------------
 .../openvswitch/files/openvswitch-controller-setup |  29 ---
 .../openvswitch/files/openvswitch-testcontroller   | 274 +++++++++++++++++++++
 .../files/openvswitch-testcontroller-setup         |  29 +++
 recipes-networking/openvswitch/openvswitch.inc     |  36 +--
 5 files changed, 321 insertions(+), 321 deletions(-)
 delete mode 100755 recipes-networking/openvswitch/files/openvswitch-controller
 delete mode 100644 recipes-networking/openvswitch/files/openvswitch-controller-setup
 create mode 100755 recipes-networking/openvswitch/files/openvswitch-testcontroller
 create mode 100644 recipes-networking/openvswitch/files/openvswitch-testcontroller-setup

diff --git a/recipes-networking/openvswitch/files/openvswitch-controller b/recipes-networking/openvswitch/files/openvswitch-controller
deleted file mode 100755
index 026974a..0000000
--- a/recipes-networking/openvswitch/files/openvswitch-controller
+++ /dev/null
@@ -1,274 +0,0 @@
-#!/bin/sh
-#
-# Copyright (c) 2011 Nicira Networks Inc.
-# Copyright (c) 2007, 2009 Javier Fernandez-Sanguino <jfs@debian.org>
-#
-# This is free software; you may redistribute it and/or modify
-# it under the terms of the GNU General Public License as
-# published by the Free Software Foundation; either version 2,
-# or (at your option) any later version.
-#
-# This is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License with
-# the Debian operating system, in /usr/share/common-licenses/GPL;  if
-# not, write to the Free Software Foundation, Inc., 59 Temple Place,
-# Suite 330, Boston, MA 02111-1307 USA
-#
-### BEGIN INIT INFO
-# Provides:          openvswitch-controller
-# Required-Start:    $network $local_fs $remote_fs
-# Required-Stop:     $remote_fs
-# Should-Start:      $named
-# Should-Stop:       
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: Open vSwitch controller
-### END INIT INFO
-
-PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
-
-DAEMON=/usr/bin/ovs-controller # Introduce the server's location here
-NAME=ovs-controller         # Introduce the short server's name here
-DESC=ovs-controller         # Introduce a short description here
-LOGDIR=/var/log/openvswitch # Log directory to use
-
-PIDFILE=/var/run/openvswitch/$NAME.pid 
-
-test -x $DAEMON || exit 0
-
-. /lib/lsb/init-functions
-
-# Default options, these can be overriden by the information
-# at /etc/default/openvswitch-controller
-DAEMON_OPTS=""          # Additional options given to the server 
-
-DODTIME=10              # Time to wait for the server to die, in seconds
-                        # If this value is set too low you might not
-                        # let some servers to die gracefully and
-                        # 'restart' will not work
-                        
-LOGFILE=$LOGDIR/$NAME.log  # Server logfile
-#DAEMONUSER=            # User to run the daemons as. If this value
-                        # is set start-stop-daemon will chuid the server
-
-# Include defaults if available
-default=/etc/default/openvswitch-controller
-if [ -f $default ] ; then
-    . $default
-fi
-
-# Check that the user exists (if we set a user)
-# Does the user exist?
-if [ -n "$DAEMONUSER" ] ; then
-    if getent passwd | grep -q "^$DAEMONUSER:"; then
-        # Obtain the uid and gid
-        DAEMONUID=`getent passwd |grep "^$DAEMONUSER:" | awk -F : '{print $3}'`
-        DAEMONGID=`getent passwd |grep "^$DAEMONUSER:" | awk -F : '{print $4}'`
-    else
-        log_failure_msg "The user $DAEMONUSER, required to run $NAME does not exist."
-        exit 1
-    fi
-fi
-
-
-set -e
-
-running_pid() {
-# Check if a given process pid's cmdline matches a given name
-    pid=$1
-    name=$2
-    [ -z "$pid" ] && return 1 
-    [ ! -d /proc/$pid ] &&  return 1
-    cmd=`cat /proc/$pid/cmdline | tr "\000" "\n"|head -n 1 |cut -d : -f 1`
-    # Is this the expected server
-    [ "$cmd" != "$name" ] &&  return 1
-    return 0
-}
-
-running() {
-# Check if the process is running looking at /proc
-# (works for all users)
-
-    # No pidfile, probably no daemon present
-    [ ! -f "$PIDFILE" ] && return 1
-    pid=`cat $PIDFILE`
-    running_pid $pid $DAEMON || return 1
-    return 0
-}
-
-start_server() {
-    if [ -z "$LISTEN" ]; then
-        echo "$default: No connection methods configured, controller disabled" >&2
-        exit 0
-    fi
-
-    if [ ! -d /var/run/openvswitch ]; then
-        install -d -m 755 -o root -g root /var/run/openvswitch
-    fi
-
-    SSL_OPTS=
-    case $LISTEN in
-        *ssl*)
-            : ${PRIVKEY:=/etc/openvswitch-controller/privkey.pem}
-            : ${CERT:=/etc/openvswitch-controller/cert.pem}
-            : ${CACERT:=/etc/openvswitch-controller/cacert.pem}
-            if test ! -e "$PRIVKEY" || test ! -e "$CERT" ||
-                test ! -e "$CACERT"; then
-                if test ! -e "$PRIVKEY"; then
-                    echo "$PRIVKEY: private key missing" >&2
-                fi
-                if test ! -e "$CERT"; then
-                    echo "$CERT: certificate for private key missing" >&2
-                fi
-                if test ! -e "$CACERT"; then
-                    echo "$CACERT: CA certificate missing" >&2
-                fi
-                exit 1
-            fi
-            SSL_OPTS="--private-key=$PRIVKEY --certificate=$CERT --ca-cert=$CACERT"
-            ;;
-    esac
-
-# Start the process using the wrapper
-        if [ -z "$DAEMONUSER" ] ; then
-            start-stop-daemon --start --pidfile $PIDFILE \
-                        --exec $DAEMON -- --detach --pidfile=$PIDFILE \
-                        $LISTEN $DAEMON_OPTS $SSL_OPTS
-            errcode=$?
-        else
-# if we are using a daemonuser then change the user id
-            start-stop-daemon --start --quiet --pidfile $PIDFILE \
-                        --chuid $DAEMONUSER --exec $DAEMON -- \
-                        --detach --pidfile=$PIDFILE $LISTEN $DAEMON_OPTS \
-                        $SSL_OPTS
-            errcode=$?
-        fi
-        return $errcode
-}
-
-stop_server() {
-# Stop the process using the wrapper
-        if [ -z "$DAEMONUSER" ] ; then
-            start-stop-daemon --stop --quiet --pidfile $PIDFILE \
-                        --exec $DAEMON
-            errcode=$?
-        else
-# if we are using a daemonuser then look for process that match
-            start-stop-daemon --stop --quiet --pidfile $PIDFILE \
-                        --user $DAEMONUSER --exec $DAEMON
-            errcode=$?
-        fi
-
-        return $errcode
-}
-
-reload_server() {
-    [ ! -f "$PIDFILE" ] && return 1
-    pid=`cat $PIDFILE` # This is the daemon's pid
-    # Send a SIGHUP
-    kill -1 $pid
-    return $?
-}
-
-force_stop() {
-# Force the process to die killing it manually
-    [ ! -e "$PIDFILE" ] && return
-    if running ; then
-        kill -15 $pid
-        # Is it really dead?
-        sleep "$DODTIME"
-        if running ; then
-            kill -9 $pid
-            sleep "$DODTIME"
-            if running ; then
-                echo "Cannot kill $NAME (pid=$pid)!"
-                exit 1
-            fi
-        fi
-    fi
-    rm -f $PIDFILE
-}
-
-
-case "$1" in
-  start)
-        log_begin_msg "Starting $DESC " "$NAME"
-        # Check if it's running first
-        if running ;  then
-            log_warning_msg "apparently already running"
-            log_end_msg 0
-            exit 0
-        fi
-        if start_server && running ;  then
-            # It's ok, the server started and is running
-            log_end_msg 0
-        else
-            # Either we could not start it or it is not running
-            # after we did
-            # NOTE: Some servers might die some time after they start,
-            # this code does not try to detect this and might give
-            # a false positive (use 'status' for that)
-            log_end_msg 1
-        fi
-        ;;
-  stop)
-        log_begin_msg "Stopping $DESC" "$NAME"
-        if running ; then
-            # Only stop the server if we see it running
-            stop_server
-            log_end_msg $?
-        else
-            # If it's not running don't do anything
-            log_warning_msg "apparently not running"
-            log_end_msg 0
-            exit 0
-        fi
-        ;;
-  force-stop)
-        # First try to stop gracefully the program
-        $0 stop
-        if running; then
-            # If it's still running try to kill it more forcefully
-            log_begin_msg "Stopping (force) $DESC" "$NAME"
-            force_stop
-            log_end_msg $?
-        fi
-        ;;
-  restart|force-reload)
-        log_begin_msg "Restarting $DESC" "$NAME"
-        stop_server
-        # Wait some sensible amount, some server need this
-        [ -n "$DODTIME" ] && sleep $DODTIME
-        start_server
-        running
-        log_end_msg $?
-        ;;
-  status)
-
-        log_begin_msg "Checking status of $DESC" "$NAME"
-        if running ;  then
-            log_begin_msg "running"
-            log_end_msg 0
-        else
-            log_warning_msg "apparently not running"
-            log_end_msg 1
-            exit 1
-        fi
-        ;;
-  # Use this if the daemon cannot reload
-  reload)
-        log_warning_msg "Reloading $NAME daemon: not implemented, as the daemon"
-        log_warning_msg "cannot re-read the config file (use restart)."
-        ;;
-  *)
-        N=/etc/init.d/openvswitch-controller
-        echo "Usage: $N {start|stop|force-stop|restart|force-reload|status}" >&2
-        exit 1
-        ;;
-esac
-
-exit 0
diff --git a/recipes-networking/openvswitch/files/openvswitch-controller-setup b/recipes-networking/openvswitch/files/openvswitch-controller-setup
deleted file mode 100644
index 1d9f926..0000000
--- a/recipes-networking/openvswitch/files/openvswitch-controller-setup
+++ /dev/null
@@ -1,29 +0,0 @@
-# This is a POSIX shell fragment                -*- sh -*-
-
-# LISTEN: What OpenFlow connection methods should the controller listen on?
-#
-# This is a space-delimited list of connection methods:
-#
-# * "pssl:[PORT]": Listen for SSL connections on the specified PORT
-#   (default: 6633).  The private key, certificate, and CA certificate
-#   must be specified below.
-#
-# * "pctp:[PORT]": Listen for TCP connections on the specified PORT
-#   (default: 6633).  Not recommended for security reasons.
-#
-LISTEN="pssl:"
-
-# PRIVKEY: Name of file containing controller's private key.
-# Required if SSL enabled.
-PRIVKEY=/etc/openvswitch-controller/privkey.pem
-
-# CERT: Name of file containing certificate for private key.
-# Required if SSL enabled.
-CERT=/etc/openvswitch-controller/cert.pem
-
-# CACERT: Name of file containing switch CA certificate.
-# Required if SSL enabled.
-CACERT=/etc/openvswitch-controller/cacert.pem
-
-# Additional options to pass to controller, e.g. "--hub"
-DAEMON_OPTS=""
diff --git a/recipes-networking/openvswitch/files/openvswitch-testcontroller b/recipes-networking/openvswitch/files/openvswitch-testcontroller
new file mode 100755
index 0000000..aad5ad6
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-testcontroller
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
+# Provides:          openvswitch-testcontroller
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
+DAEMON=/usr/bin/ovs-testcontroller # Introduce the server's location here
+NAME=ovs-testcontroller         # Introduce the short server's name here
+DESC=ovs-testcontroller         # Introduce a short description here
+LOGDIR=/var/log/openvswitch # Log directory to use
+
+PIDFILE=/var/run/openvswitch/$NAME.pid 
+
+test -x $DAEMON || exit 0
+
+. /lib/lsb/init-functions
+
+# Default options, these can be overriden by the information
+# at /etc/default/openvswitch-testcontroller
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
+default=/etc/default/openvswitch-testcontroller
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
+            : ${PRIVKEY:=/etc/openvswitch-testcontroller/privkey.pem}
+            : ${CERT:=/etc/openvswitch-testcontroller/cert.pem}
+            : ${CACERT:=/etc/openvswitch-testcontroller/cacert.pem}
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
+        N=/etc/init.d/openvswitch-testcontroller
+        echo "Usage: $N {start|stop|force-stop|restart|force-reload|status}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/recipes-networking/openvswitch/files/openvswitch-testcontroller-setup b/recipes-networking/openvswitch/files/openvswitch-testcontroller-setup
new file mode 100644
index 0000000..b431ece
--- /dev/null
+++ b/recipes-networking/openvswitch/files/openvswitch-testcontroller-setup
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
+PRIVKEY=/etc/openvswitch-testcontroller/privkey.pem
+
+# CERT: Name of file containing certificate for private key.
+# Required if SSL enabled.
+CERT=/etc/openvswitch-testcontroller/cert.pem
+
+# CACERT: Name of file containing switch CA certificate.
+# Required if SSL enabled.
+CACERT=/etc/openvswitch-testcontroller/cacert.pem
+
+# Additional options to pass to controller, e.g. "--hub"
+DAEMON_OPTS=""
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 454aadf..13c7d06 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -14,9 +14,9 @@ LICENSE = "Apache-2"
 DEPENDS += "bridge-utils openssl python perl"
 
 RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
-	python perl perl-module-strict ${PN}-switch ${PN}-controller \
+	python perl perl-module-strict ${PN}-switch \
         bash"
-RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
+RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
 RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
 RDEPENDS_${PN}-pki = "${PN}"
 RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
@@ -29,8 +29,8 @@ RDEPENDS_${PN} += "sed gawk grep"
 SRC_URI = "\
 	file://openvswitch-switch \
 	file://openvswitch-switch-setup \
-	file://openvswitch-controller \
-	file://openvswitch-controller-setup \
+	file://openvswitch-testcontroller \
+	file://openvswitch-testcontroller-setup \
 	file://openvswitch-add-target-python-handling.patch \
 	file://openvswitch-add-target-perl-handling.patch \
 	"
@@ -47,13 +47,13 @@ CONFIGUREOPT_DEPTRACK = ""
 # EXTRA_OECONF = "--with-linux=${STAGING_KERNEL_DIR} KARCH=${TARGET_ARCH}"
 
 ALLOW_EMPTY_${PN}-pki = "1"
-PACKAGES =+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
+PACKAGES =+ "${PN}-testcontroller ${PN}-switch ${PN}-brcompat ${PN}-pki"
 
-FILES_${PN}-controller = "\
-	${sysconfdir}/init.d/openvswitch-controller \
-	${sysconfdir}/default/openvswitch-controller \
-	${sysconfdir}/openvswitch-controller \
-	${bindir}/ovs-controller \
+FILES_${PN}-testcontroller = "\
+	${sysconfdir}/init.d/openvswitch-testcontroller \
+	${sysconfdir}/default/openvswitch-testcontroller \
+	${sysconfdir}/openvswitch-testcontroller \
+	${bindir}/ovs-testcontroller \
 	"
 
 FILES_${PN}-brcompat = "${sbindir}/ovs-brcompatd"
@@ -69,21 +69,21 @@ FILES_${PN} += "/run"
 
 inherit autotools update-rc.d
 
-INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
+INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-testcontroller"
 INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
 INITSCRIPT_PARAMS_${PN}-switch = "defaults 71"
 
-INITSCRIPT_NAME_${PN}-controller = "openvswitch-controller"
-INITSCRIPT_PARAMS_${PN}-controller = "defaults 72"
+INITSCRIPT_NAME_${PN}-testcontroller = "openvswitch-testcontroller"
+INITSCRIPT_PARAMS_${PN}-testcontroller = "defaults 72"
 
 do_install_append() {
 	install -d ${D}/${sysconfdir}/default/
 	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
-	install -d ${D}/${sysconfdir}/openvswitch-controller
-	install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sysconfdir}/default/openvswitch-controller
+	install -d ${D}/${sysconfdir}/openvswitch-testcontroller
+	install -m 660 ${WORKDIR}/openvswitch-testcontroller-setup ${D}/${sysconfdir}/default/openvswitch-testcontroller
 
 	install -d ${D}/${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdir}/init.d/openvswitch-controller
+	install -m 755 ${WORKDIR}/openvswitch-testcontroller ${D}/${sysconfdir}/init.d/openvswitch-testcontroller
 	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
 	true || rm -fr ${D}/${datadir}/${PN}/pki
 
@@ -102,7 +102,7 @@ pkg_postinst_${PN}-pki () {
 	fi
 }
 
-pkg_postinst_${PN}-controller () {
+pkg_postinst_${PN}-testcontroller () {
 	# can't do this offline
 	if [ "x$D" != "x" ]; then
 		exit 1
@@ -112,7 +112,7 @@ pkg_postinst_${PN}-controller () {
 		ovs-pki init --dir=$D/${datadir}/${PN}/pki
 	fi
 
-	cd $D/${sysconfdir}/openvswitch-controller
+	cd $D/${sysconfdir}/openvswitch-testcontroller
 	if ! test -e cacert.pem; then
 		ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
 	fi
-- 
2.1.4


