Return-Path: <Zibo.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 767C7E007C1; Tue,  7 Oct 2014 13:34:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 938B3E0076C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Oct 2014 13:34:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s97KY4NV010832
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Oct 2014 13:34:05 -0700 (PDT)
Received: from chinabull.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 13:34:04 -0700
From: Zibo Zhao <zibo.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 7 Oct 2014 16:33:49 -0400
Message-ID: <1412714029-19190-1-git-send-email-zibo.zhao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] libvirtd not properly shutting down on oVirt node install
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
X-List-Received-Date: Tue, 07 Oct 2014 20:34:08 -0000
Content-Type: text/plain

From: Prateek Kumar <prateek.kumar@windriver.com>

On registering the ovirt node form the ovirt engine web
interface the ovirt node installation goes fine but the
node will suffer a "communication failure" and the
status of the node will fail to go up status.
Its due to the race condition in libvirtd shutdown where
pid file is deleted before the real libvirtd process get
terminated.
The issue is fixed by making sure the libvirtd process
is terminated before deteting the pid file and providing
sufficient delay.

Signed-off-by: Prateek Kumar <prateek.kumar@windriver.com>
Signed-off-by: Zibo Zhao <zibo.zhao@windriver.com>
---
 recipes-extended/libvirt/libvirt/libvirtd.sh | 36 +++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt/libvirtd.sh b/recipes-extended/libvirt/libvirt/libvirtd.sh
index b4fa674..beb77ec 100755
--- a/recipes-extended/libvirt/libvirt/libvirtd.sh
+++ b/recipes-extended/libvirt/libvirt/libvirtd.sh
@@ -9,6 +9,8 @@
 
 . /etc/init.d/functions
 
+PID=/var/run/libvirtd.pid
+
 if [ -f /lib/lsb/init-functions ]
 then
     . /lib/lsb/init-functions
@@ -72,24 +74,42 @@ fi
 
 case "$1" in
         start)
-                if [ -e /var/run/libvirtd.pid ]; then
-                        if [ -d /proc/$(cat /var/run/libvirtd.pid) ]; then
+                if [ -e $PID ]; then
+                        if [ -d /proc/$(cat $PID) ]; then
                                 echo "virtualization library already started; not starting."
                         else
-                                echo "Removing stale PID file /var/run/libvirtd.pid."
-                                rm -f /var/run/libvirtd.pid
+                                echo "Removing stale PID file $PID."
+                                rm -f $PID
                         fi
                 fi
                 log_begin_msg "Starting virtualization library daemon: libvirtd"
                 start-stop-daemon -K -x /usr/bin/dnsmasq
-		start-stop-daemon --start --quiet --pidfile /var/run/libvirtd.pid --exec /usr/sbin/libvirtd -- --daemon --listen
+                start-stop-daemon --start --quiet --pidfile $PID --exec /usr/sbin/libvirtd -- --daemon --listen
                 log_end_msg $?
                 ;;
         stop)
+                if [ -f $PID ]; then
+                        libvirtd_pid=$(cat $PID)
+                fi
                 log_begin_msg "Stopping virtualization library daemon: libvirtd"
-		start-stop-daemon --stop --quiet --retry 3 --exec /usr/sbin/libvirtd --pidfile /var/run/libvirtd.pid
-                log_end_msg $?
-                rm -f /var/run/libvirtd.pid
+                start-stop-daemon --stop --quiet --retry 3 --exec /usr/sbin/libvirtd --pidfile $PID
+                CHECK=0
+                K=0
+                if [ "x$libvirtd_pid" != "x" ]; then
+                        while /bin/kill -0 $libvirtd_pid >/dev/null 2>&1; do
+                               K=$(($K+1))
+                               sleep 1
+                               if [ $K -ge 60 ]; then
+                                       log_end_msg "Stopping libvirtd: timed out"
+                                       CHECK=1
+                                       break
+                               fi
+                        done
+                fi
+                if [ $CHECK -eq 0 ]; then
+                        log_end_msg "Removing pid file $PID"
+                        rm -f $PID
+                fi
                 ;;
         restart)
                 $0 stop
-- 
1.9.1


