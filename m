Return-Path: <Zibo.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9BA2E007C1; Tue,  7 Oct 2014 09:23:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7615EE0076C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Oct 2014 09:22:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s97GMuEG015732
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Oct 2014 09:22:56 -0700 (PDT)
Received: from chinabull.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 7 Oct 2014 09:22:56 -0700
From: Zibo Zhao <zibo.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 7 Oct 2014 12:22:41 -0400
Message-ID: <1412698961-17093-1-git-send-email-zibo.zhao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] libvirtd not properly shutting down on oVirt node install
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
X-List-Received-Date: Tue, 07 Oct 2014 16:23:05 -0000
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
 recipes-extended/libvirt/libvirt/libvirtd.sh | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt/libvirtd.sh b/recipes-extended/libvirt/libvirt/libvirtd.sh
index 29dbf39..c1cd6ee 100755
--- a/recipes-extended/libvirt/libvirt/libvirtd.sh
+++ b/recipes-extended/libvirt/libvirt/libvirtd.sh
@@ -86,10 +86,26 @@ case "$1" in
                 log_end_msg $?
                 ;;
         stop)
+                if [ -f /var/run/libvirtd.pid ]; then
+                        pid=$(cat /var/run/libvirtd.pid)
+                fi
                 log_begin_msg "Stopping virtualization library daemon: libvirtd"
-		start-stop-daemon --stop --quiet --retry 3 --exec /usr/sbin/libvirtd --pidfile /var/run/libvirtd.pid
-                log_end_msg $?
-                rm -f /var/run/libvirtd.pid
+                start-stop-daemon --stop --quiet --retry 3 --exec /usr/sbin/libvirtd --pidfile /var/run/libvirtd.pid
+                CHECK=0
+                k=0
+                while /bin/kill -0 $pid >/dev/null 2>&1; do
+                        k=$(($k+1))
+                        sleep 1
+                        if [ $k -ge 60 ]; then
+                                log_end_msg "Stopping the libvertd timedout"
+                                CHECK=1
+                                break
+                        fi				
+                done
+                if [ $CHECK -eq 0 ]; then
+                        log_end_msg "Removing the pid $PID"
+                        rm -f /var/run/libvirtd.pid
+                fi
                 ;;
         restart)
                 $0 stop
-- 
2.1.0


