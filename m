Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F9C6E00D6F; Fri,  8 Dec 2017 07:54:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0557AE00D19
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Dec 2017 07:53:58 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB8FrwGG002948
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 8 Dec 2017 07:53:58 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 8 Dec 2017 07:53:44 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 8 Dec 2017 07:53:44 -0800
Message-ID: <20171208155344.17795-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] runc-docker: Allow "run start ..." to daemonize with $SIGUSR1_PARENT_PID
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
X-List-Received-Date: Fri, 08 Dec 2017 15:54:00 -0000
Content-Type: text/plain

The runc-docker has all the code in it to properly run a stop hook if
you use it in the foreground.  It doesn't work in the back ground
because there is no way for a golang application to fork a child exit
out of the parent process because all the golang threads stay with the
parent.

This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
is set.

1) The code was copied which performs the normal the signal handling
   block which is used for the foreground operation of runc.

2) At the point where runc start would normally exit, it closes
   stdin/stdout/stderr so it would be possible to daemonize "runc start ...".

3) The code to send a SIGUSR1 to the parent process was added.  The
   idea being that a parent process would simply exit at that point
   because it was blocking until runc performed everything it was
   required to perform.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../0001-runc-docker-SIGUSR1-daemonize.patch       | 131 +++++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb         |   1 +
 2 files changed, 132 insertions(+)
 create mode 100644 recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch

diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
new file mode 100644
index 0000000..b3bd068
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
@@ -0,0 +1,131 @@
+From cd7d76a6d1ecb1856f6ed666fb5c30dc105aa94e Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Tue, 5 Dec 2017 18:28:28 -0800
+Subject: [PATCH] runc-docker: Allow "run start ..." to daemonize with $SIGUSR1_PARENT_PID
+
+The runc-docker has all the code in it to properly run a stop hook if
+you use it in the foreground.  It doesn't work in the back ground
+because there is no way for a golang application to fork a child exit
+out of the parent process because all the golang threads stay with the
+parent.
+
+This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
+is set.
+
+1) The code was copied which performs the normal the signal handling
+   block which is used for the foreground operation of runc.
+
+2) At the point where runc start would normally exit, it closes
+   stdin/stdout/stderr so it would be possible to daemonize "runc start ...".
+
+3) The code to send a SIGUSR1 to the parent process was added.  The
+   idea being that a parent process would simply exit at that point
+   because it was blocking until runc performed everything it was
+   required to perform.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+---
+ signals.go     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++----
+ utils_linux.go |  2 +-
+ 2 files changed, 51 insertions(+), 5 deletions(-)
+
+diff --git a/src/import/signals.go b/src/import/signals.go
+index 910ea1ee..b6a23476 100644
+--- a/src/import/signals.go
++++ b/src/import/signals.go
+@@ -6,6 +6,7 @@ import (
+ 	"os"
+ 	"os/signal"
+ 	"syscall" // only for Signal
++	"strconv"
+ 
+ 	"github.com/Sirupsen/logrus"
+ 	"github.com/opencontainers/runc/libcontainer"
+@@ -56,9 +57,6 @@ type signalHandler struct {
+ func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, detach bool) (int, error) {
+ 	// make sure we know the pid of our main process so that we can return
+ 	// after it dies.
+-	if detach && h.notifySocket == nil {
+-		return 0, nil
+-	}
+ 
+ 	pid1, err := process.Pid()
+ 	if err != nil {
+@@ -68,12 +66,60 @@ func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, detach
+ 	if h.notifySocket != nil {
+ 		if detach {
+ 			h.notifySocket.run(pid1)
+-			return 0, nil
+ 		} else {
+ 			go h.notifySocket.run(0)
+ 		}
+ 	}
+ 
++	if (detach) {
++		// This allows the parent process to daemonize this process
++		// so long as stdin/stderr/stdout are closed
++		if envVal := os.Getenv("SIGUSR1_PARENT_PID"); envVal != "" {
++			// Close stdin/stdout/stderr
++			os.Stdin.Close()
++			os.Stdout.Close()
++			os.Stderr.Close()
++			// Notify parent to detach
++			i, err := strconv.Atoi(envVal)
++			if (err != nil) {
++				return 0, nil
++			}
++			unix.Kill(i, unix.SIGUSR1)
++			// Loop waiting on the child to signal or exit,
++			// after which all stop hooks will be run
++			for s := range h.signals {
++				switch s {
++				case unix.SIGCHLD:
++					exits, err := h.reap()
++					if err != nil {
++						logrus.Error(err)
++					}
++					for _, e := range exits {
++						logrus.WithFields(logrus.Fields{
++							"pid":    e.pid,
++							"status": e.status,
++						}).Debug("process exited")
++						if e.pid == pid1 {
++							// call Wait() on the process even though we already have the exit
++							// status because we must ensure that any of the go specific process
++							// fun such as flushing pipes are complete before we return.
++							process.Wait()
++							if h.notifySocket != nil {
++								h.notifySocket.Close()
++							}
++							return e.status, nil
++						}
++					}
++				default:
++					logrus.Debugf("sending signal to process %s", s)
++					if err := unix.Kill(pid1, s.(syscall.Signal)); err != nil {
++						logrus.Error(err)
++					}
++				}
++			}
++		}
++		return 0, nil
++	}
+ 	// perform the initial tty resize.
+ 	tty.resize()
+ 	for s := range h.signals {
+diff --git a/src/import/utils_linux.go b/src/import/utils_linux.go
+index e6d31b35..1bb80a63 100644
+--- a/src/import/utils_linux.go
++++ b/src/import/utils_linux.go
+@@ -308,7 +308,7 @@ func (r *runner) run(config *specs.Process) (int, error) {
+ 	if err != nil {
+ 		r.terminate(process)
+ 	}
+-	if detach {
++	if (detach && os.Getenv("SIGUSR1_PARENT_PID") == "") {
+ 		return 0, nil
+ 	}
+ 	r.destroy()
+-- 
+2.11.0
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 9db48ee..f31b82e 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
            file://0001-runc-Add-console-socket-dev-null.patch \
            file://0001-Use-correct-go-cross-compiler.patch \
            file://0001-Disable-building-recvtty.patch \
+           file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
 RUNC_VERSION = "1.0.0-rc3"
-- 
2.11.0


