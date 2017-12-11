Return-Path: <jason.wessel@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AA10E00D55; Sun, 10 Dec 2017 20:20:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85DC7E00CD3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 10 Dec 2017 20:20:13 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBB4KBfA007248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 10 Dec 2017 20:20:11 -0800
Received: from [172.25.59.212] (172.25.59.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 10 Dec 2017 20:20:10 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20171208155344.17795-1-jason.wessel@windriver.com>
	<CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <96828d83-e9cd-9218-057e-c5ee0f1005b2@windriver.com>
Date: Sun, 10 Dec 2017 22:20:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] runc-docker: Allow "run start ..." to daemonize with $SIGUSR1_PARENT_PID
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
X-List-Received-Date: Mon, 11 Dec 2017 04:20:15 -0000
Content-Type: multipart/alternative;
	boundary="------------561D379E77605BCC44DB2A16"
Content-Language: en-GB

--------------561D379E77605BCC44DB2A16
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2017 09:38 PM, Bruce Ashfield wrote:
>
>
> On Fri, Dec 8, 2017 at 10:53 AM, Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>> wrote:
>
>     The runc-docker has all the code in it to properly run a stop hook if
>     you use it in the foreground.  It doesn't work in the back ground
>     because there is no way for a golang application to fork a child exit
>     out of the parent process because all the golang threads stay with the
>     parent.
>
>
> Can you define background for the commit log purposes ? Is it a container
> that allocates a tty and detaches from the current terminal ? Something
> else ?


You are correct that it is ambiguous based on the terminal part.


For the purpose of the background for this commit it is about interaction with a bash shell for any other typical process.

When you use "runc run "  it is running in the "foreground", in the sense it takes over your existing terminal.

The runc-docker doesn't have a way to start it with "runc run&" where you can send it to the background and have everything work. With this commit, it does allow you to do that and have all the stop hooks fire at the time what ever runc started exits.


>
> Also why does the threads staying with the parent mean the stop hooks
> don't run. That isn't clear to me. Is it due to lack of notification if they exit ?

We want the parent process to go away because that is how we daemonize.   If the golang threads stay with the parent, after a fork no exit handlers run.


Lets take a quick look at what "runc run" does today:

   * Starts a whole pile of threads
   * Sets up all name spaces
   * Starts child process for container and leaves it paused at image activation
   * runs start hooks
   * executes "continue" for continue process
   * waits for container app to exit
   * executes stop hooks

Now lets look at "runc create/start"
    runc create
      * Starts a whole pile of threads
      * Sets up all name spaces
      * Starts child process for container and leaves it paused at image activation
      * exits  ----  DOH, this is the guy we want to keep
    runc start
      * runs start hooks
      * executes "continue" for continue process

     At this point when the container app exists nothing was waiting for it.


--- What happens with the patch? ---

    runc create
      * Starts a whole pile of threads
      * Sets up all name spaces
      * Starts child process for container and leaves it paused at image activation
      * closes stdin/stderr/stdout
      * Sends SIGUSR1 to wrapper process and the wrapper just exits leaving
         runc start behind.
      * waits for child process to go away
      * runs stop hooks
    runc start
      * runs start hooks
      * executes "continue" for continue process

     At this point when the container app exists nothing was waiting for it.



>
>     This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
>     is set.
>
>
> Where do you see that environment variable being set ? In the config.json ?
> Somewhere else ? (i.e. the launching environment).


This is only set by the launch wrapper.

The launch wrapper will set the variable to the PID of itself because it wants the notification.


>
>     1) The code was copied which performs the normal the signal handling
>        block which is used for the foreground operation of runc.
>
>     2) At the point where runc start would normally exit, it closes
>        stdin/stdout/stderr so it would be possible to daemonize "runc start ...".
>
>
> I can't say I completely follow point #2. Maybe it is with me not having
> looked at what is required to daemonize for a loooong time.
>
> See one question on the patch below.
>
>
>     3) The code to send a SIGUSR1 to the parent process was added.  The
>        idea being that a parent process would simply exit at that point
>        because it was blocking until runc performed everything it was
>        required to perform.
>
>     Signed-off-by: Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>>
>     ---
>      .../0001-runc-docker-SIGUSR1-daemonize.patch       | 131 +++++++++++++++++++++
>      recipes-containers/runc/runc-docker_git.bb <http://runc-docker_git.bb>        |   1 +
>      2 files changed, 132 insertions(+)
>      create mode 100644 recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
>
>     diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
>     new file mode 100644
>     index 0000000..b3bd068
>     --- /dev/null
>     +++ b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
>     @@ -0,0 +1,131 @@
>     +From cd7d76a6d1ecb1856f6ed666fb5c30dc105aa94e Mon Sep 17 00:00:00 2001
>     +From: Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>>
>     +Date: Tue, 5 Dec 2017 18:28:28 -0800
>     +Subject: [PATCH] runc-docker: Allow "run start ..." to daemonize with $SIGUSR1_PARENT_PID
>     +
>     +The runc-docker has all the code in it to properly run a stop hook if
>     +you use it in the foreground.  It doesn't work in the back ground
>     +because there is no way for a golang application to fork a child exit
>     +out of the parent process because all the golang threads stay with the
>     +parent.
>     +
>     +This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
>     +is set.
>     +
>     +1) The code was copied which performs the normal the signal handling
>     +   block which is used for the foreground operation of runc.
>     +
>     +2) At the point where runc start would normally exit, it closes
>     +   stdin/stdout/stderr so it would be possible to daemonize "runc start ...".
>     +
>     +3) The code to send a SIGUSR1 to the parent process was added.  The
>     +   idea being that a parent process would simply exit at that point
>     +   because it was blocking until runc performed everything it was
>     +   required to perform.
>     +
>     +Signed-off-by: Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>>
>     +---
>     + signals.go     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++----
>     + utils_linux.go |  2 +-
>     + 2 files changed, 51 insertions(+), 5 deletions(-)
>     +
>     +diff --git a/src/import/signals.go b/src/import/signals.go
>     +index 910ea1ee..b6a23476 100644
>     +--- a/src/import/signals.go
>     ++++ b/src/import/signals.go
>     +@@ -6,6 +6,7 @@ import (
>     +       "os"
>     +       "os/signal"
>     +       "syscall" // only for Signal
>     ++      "strconv"
>     +
>     +       "github.com/Sirupsen/logrus <http://github.com/Sirupsen/logrus>"
>     +       "github.com/opencontainers/runc/libcontainer <http://github.com/opencontainers/runc/libcontainer>"
>     +@@ -56,9 +57,6 @@ type signalHandler struct {
>     + func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, detach bool) (int, error) {
>     +       // make sure we know the pid of our main process so that we can return
>     +       // after it dies.
>     +-      if detach && h.notifySocket == nil {
>     +-              return 0, nil
>     +-      }
>     +
>     +       pid1, err := process.Pid()
>     +       if err != nil {
>     +@@ -68,12 +66,60 @@ func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, detach
>     +       if h.notifySocket != nil {
>     +               if detach {
>     +                       h.notifySocket.run(pid1)
>     +-                      return 0, nil
>     +               } else {
>     +                       go h.notifySocket.run(0)
>     +               }
>     +       }
>     +
>     ++      if (detach) {
>     ++              // This allows the parent process to daemonize this process
>     ++              // so long as stdin/stderr/stdout are closed
>     ++              if envVal := os.Getenv("SIGUSR1_PARENT_PID"); envVal != "" {
>     ++                      // Close stdin/stdout/stderr
>     ++                      os.Stdin.Close()
>     ++                      os.Stdout.Close()
>     ++                      os.Stderr.Close()
>     ++                      // Notify parent to detach
>     ++                      i, err := strconv.Atoi(envVal)
>     ++                      if (err != nil) {
>     ++                              return 0, nil
>     ++                      }
>
>
> So all the code below here is the copied block and it deals with the
> normal exit ? i.e. is it shutting the container down ?
>


Yes.   It follows the sequence I mentioned in this mail for the "runc run" case.  I tried to make it more clear.


> The reason I ask, is that I thought this block of code was running on
> startup, when the container first detaches .. and it didn't make sense
> in that context.



This block of code is the wait loop for signals OR exit, and there is some additional code that runs after it returns where it runs the cleanup handler.


Specifically if you look further down in the patch it is called r.destroy() and nothing is modified there other to call it.  In the case you don't have the environment variable set the exit is much earlier.

Jason.



>
> Bruce
>
>     ++                      unix.Kill(i, unix.SIGUSR1)
>     ++                      // Loop waiting on the child to signal or exit,
>     ++                      // after which all stop hooks will be run
>     ++                      for s := range h.signals {
>     ++                              switch s {
>     ++                              case unix.SIGCHLD:
>     ++                                      exits, err := h.reap()
>     ++                                      if err != nil {
>     ++ logrus.Error(err)
>     ++                                      }
>     ++                                      for _, e := range exits {
>     ++ logrus.WithFields(logrus.Fields{
>     ++ "pid":    e.pid,
>     ++ "status": e.status,
>     ++ }).Debug("process exited")
>     ++                                              if e.pid == pid1 {
>     ++                                                      // call Wait() on the process even though we already have the exit
>     ++                                                      // status because we must ensure that any of the go specific process
>     ++                                                      // fun such as flushing pipes are complete before we return.
>     ++ process.Wait()
>     ++                                                      if h.notifySocket != nil {
>     ++       h.notifySocket.Close()
>     ++                                                      }
>     ++ return e.status, nil
>     ++                                              }
>     ++                                      }
>     ++                              default:
>     ++ logrus.Debugf("sending signal to process %s", s)
>     ++                                      if err := unix.Kill(pid1, s.(syscall.Signal)); err != nil {
>     ++ logrus.Error(err)
>     ++                                      }
>     ++                              }
>     ++                      }
>     ++              }
>     ++              return 0, nil
>     ++      }
>     +       // perform the initial tty resize.
>     +       tty.resize()
>     +       for s := range h.signals {
>     +diff --git a/src/import/utils_linux.go b/src/import/utils_linux.go
>     +index e6d31b35..1bb80a63 100644
>     +--- a/src/import/utils_linux.go
>     ++++ b/src/import/utils_linux.go
>     +@@ -308,7 +308,7 @@ func (r *runner) run(config *specs.Process) (int, error) {
>     +       if err != nil {
>     +               r.terminate(process)
>     +       }
>     +-      if detach {
>     ++      if (detach && os.Getenv("SIGUSR1_PARENT_PID") == "") {
>     +               return 0, nil
>     +       }
>     +       r.destroy()
>     +--
>     +2.11.0
>     +
>     diff --git a/recipes-containers/runc/runc-docker_git.bb <http://runc-docker_git.bb> b/recipes-containers/runc/runc-docker_git.bb <http://runc-docker_git.bb>
>     index 9db48ee..f31b82e 100644
>     --- a/recipes-containers/runc/runc-docker_git.bb <http://runc-docker_git.bb>
>     +++ b/recipes-containers/runc/runc-docker_git.bb <http://runc-docker_git.bb>
>     @@ -10,6 +10,7 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker <http://github.com/docker/runc.git;nobranch=1;name=runc-docker> \
>                 file://0001-runc-Add-console-socket-dev-null.patch \
>                 file://0001-Use-correct-go-cross-compiler.patch \
>                 file://0001-Disable-building-recvtty.patch \
>     +           file://0001-runc-docker-SIGUSR1-daemonize.patch \
>                "
>
>      RUNC_VERSION = "1.0.0-rc3"
>     --
>     2.11.0
>
>     --
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization <https://lists.yoctoproject.org/listinfo/meta-virtualization>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"



--------------561D379E77605BCC44DB2A16
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 12/10/2017 09:38 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com">
      <meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Fri, Dec 8, 2017 at 10:53 AM,
            Jason Wessel <span dir="ltr">&lt;<a
                href="mailto:jason.wessel@windriver.com" target="_blank"
                moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote">The runc-docker has all the
              code in it to properly run a stop hook if<br>
              you use it in the foreground.  It doesn't work in the back
              ground<br>
              because there is no way for a golang application to fork a
              child exit<br>
              out of the parent process because all the golang threads
              stay with the<br>
              parent.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Can you define background for the commit log purposes ?
              Is it a container</div>
            <div>that allocates a tty and detaches from the current
              terminal ? Something</div>
            <div>else ?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    You are correct that it is ambiguous based on the terminal part.<br>
    <br>
    <br>
    For the purpose of the background for this commit it is about
    interaction with a bash shell for any other typical process.<br>
    <br>
    When you use "runc run "  it is running in the "foreground", in the
    sense it takes over your existing terminal.<br>
    <br>
    The runc-docker doesn't have a way to start it with "runc run&amp;"
    where you can send it to the background and have everything work. 
    With this commit, it does allow you to do that and have all the stop
    hooks fire at the time what ever runc started exits. <br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Also why does the threads staying with the parent mean
              the stop hooks</div>
            <div>don't run. That isn't clear to me. Is it due to lack of
              notification if they exit ?</div>
            <div> </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    We want the parent process to go away because that is how we
    daemonize.   If the golang threads stay with the parent, after a
    fork no exit handlers run.<br>
    <br>
    <br>
    Lets take a quick look at what "runc run" does today:<br>
    <br>
      * Starts a whole pile of threads<br>
      * Sets up all name spaces<br>
      * Starts child process for container and leaves it paused at image
    activation<br>
      * runs start hooks<br>
      * executes "continue" for continue process<br>
      * waits for container app to exit<br>
      * executes stop hooks<br>
    <br>
    Now lets look at "runc create/start"<br>
       runc create<br>
         * Starts a whole pile of threads<br>
         * Sets up all name spaces<br>
         * Starts child process for container and leaves it paused at
    image activation<br>
         * exits  ----  DOH, this is the guy we want to keep<br>
       runc start<br>
         * runs start hooks<br>
         * executes "continue" for continue process<br>
    <br>
        At this point when the container app exists nothing was waiting
    for it.<br>
    <br>
    <br>
    --- What happens with the patch? ---<br>
    <br>
       runc create<br>
         * Starts a whole pile of threads<br>
         * Sets up all name spaces<br>
         * Starts child process for container and leaves it paused at
    image activation<br>
         * closes stdin/stderr/stdout<br>
         * Sends SIGUSR1 to wrapper process and the wrapper just exits
    leaving<br>
            runc start behind.<br>
         * waits for child process to go away<br>
         * runs stop hooks<br>
       runc start<br>
         * runs start hooks<br>
         * executes "continue" for continue process<br>
    <br>
        At this point when the container app exists nothing was waiting
    for it.<br>
    <br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote">
              <br>
              This patch has three parts that happen ONLY when
              $SIGUSR1_PARENT_PID<br>
              is set.<br>
            </blockquote>
            <div><br>
            </div>
            <div>Where do you see that environment variable being set ?
              In the config.json ?</div>
            <div>Somewhere else ? (i.e. the launching environment).</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    This is only set by the launch wrapper. <br>
    <br>
    The launch wrapper will set the variable to the PID of itself
    because it wants the notification.<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote">
              <br>
              1) The code was copied which performs the normal the
              signal handling<br>
                 block which is used for the foreground operation of
              runc.<br>
              <br>
              2) At the point where runc start would normally exit, it
              closes<br>
                 stdin/stdout/stderr so it would be possible to
              daemonize "runc start ...".<br>
            </blockquote>
            <div><br>
            </div>
            <div>I can't say I completely follow point #2. Maybe it is
              with me not having</div>
            <div>looked at what is required to daemonize for a loooong
              time. </div>
            <div><br>
            </div>
            <div>See one question on the patch below.</div>
            <div><br>
            </div>
            <blockquote class="gmail_quote">
              <br>
              3) The code to send a SIGUSR1 to the parent process was
              added.  The<br>
                 idea being that a parent process would simply exit at
              that point<br>
                 because it was blocking until runc performed everything
              it was<br>
                 required to perform.<br>
              <br>
              Signed-off-by: Jason Wessel &lt;<a
                href="mailto:jason.wessel@windriver.com"
                moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;<br>
              ---<br>
               .../0001-runc-docker-SIGUSR1-<wbr>daemonize.patch       |
              131 +++++++++++++++++++++<br>
               recipes-containers/runc/<a
                href="http://runc-docker_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">runc-<wbr>docker_git.bb</a> 
                     |   1 +<br>
               2 files changed, 132 insertions(+)<br>
               create mode 100644 recipes-containers/runc/runc-<wbr>docker/0001-runc-docker-<wbr>SIGUSR1-daemonize.patch<br>
              <br>
              diff --git a/recipes-containers/runc/<wbr>runc-docker/0001-runc-docker-<wbr>SIGUSR1-daemonize.patch
              b/recipes-containers/runc/<wbr>runc-docker/0001-runc-docker-<wbr>SIGUSR1-daemonize.patch<br>
              new file mode 100644<br>
              index 0000000..b3bd068<br>
              --- /dev/null<br>
              +++ b/recipes-containers/runc/<wbr>runc-docker/0001-runc-docker-<wbr>SIGUSR1-daemonize.patch<br>
              @@ -0,0 +1,131 @@<br>
              +From cd7d76a6d1ecb1856f6ed666fb5c30<wbr>dc105aa94e Mon
              Sep 17 00:00:00 2001<br>
              +From: Jason Wessel &lt;<a
                href="mailto:jason.wessel@windriver.com"
                moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;<br>
              +Date: Tue, 5 Dec 2017 18:28:28 -0800<br>
              +Subject: [PATCH] runc-docker: Allow "run start ..." to
              daemonize with $SIGUSR1_PARENT_PID<br>
              +<br>
              +The runc-docker has all the code in it to properly run a
              stop hook if<br>
              +you use it in the foreground.  It doesn't work in the
              back ground<br>
              +because there is no way for a golang application to fork
              a child exit<br>
              +out of the parent process because all the golang threads
              stay with the<br>
              +parent.<br>
              +<br>
              +This patch has three parts that happen ONLY when
              $SIGUSR1_PARENT_PID<br>
              +is set.<br>
              +<br>
              +1) The code was copied which performs the normal the
              signal handling<br>
              +   block which is used for the foreground operation of
              runc.<br>
              +<br>
              +2) At the point where runc start would normally exit, it
              closes<br>
              +   stdin/stdout/stderr so it would be possible to
              daemonize "runc start ...".<br>
              +<br>
              +3) The code to send a SIGUSR1 to the parent process was
              added.  The<br>
              +   idea being that a parent process would simply exit at
              that point<br>
              +   because it was blocking until runc performed
              everything it was<br>
              +   required to perform.<br>
              +<br>
              +Signed-off-by: Jason Wessel &lt;<a
                href="mailto:jason.wessel@windriver.com"
                moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;<br>
              +---<br>
              + signals.go     | 54 ++++++++++++++++++++++++++++++<wbr>++++++++++++++++++++----<br>
              + utils_linux.go |  2 +-<br>
              + 2 files changed, 51 insertions(+), 5 deletions(-)<br>
              +<br>
              +diff --git a/src/import/signals.go
              b/src/import/signals.go<br>
              +index 910ea1ee..b6a23476 100644<br>
              +--- a/src/import/signals.go<br>
              ++++ b/src/import/signals.go<br>
              +@@ -6,6 +6,7 @@ import (<br>
              +       "os"<br>
              +       "os/signal"<br>
              +       "syscall" // only for Signal<br>
              ++      "strconv"<br>
              +<br>
              +       "<a href="http://github.com/Sirupsen/logrus"
                rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/Sirupsen/logrus</a>"<br>
              +       "<a
                href="http://github.com/opencontainers/runc/libcontainer"
                rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/opencontainers/<wbr>runc/libcontainer</a>"<br>
              +@@ -56,9 +57,6 @@ type signalHandler struct {<br>
              + func (h *signalHandler) forward(process
              *libcontainer.Process, tty *tty, detach bool) (int, error)
              {<br>
              +       // make sure we know the pid of our main process
              so that we can return<br>
              +       // after it dies.<br>
              +-      if detach &amp;&amp; h.notifySocket == nil {<br>
              +-              return 0, nil<br>
              +-      }<br>
              +<br>
              +       pid1, err := process.Pid()<br>
              +       if err != nil {<br>
              +@@ -68,12 +66,60 @@ func (h *signalHandler)
              forward(process *libcontainer.Process, tty *tty, detach<br>
              +       if h.notifySocket != nil {<br>
              +               if detach {<br>
              +                       h.notifySocket.run(pid1)<br>
              +-                      return 0, nil<br>
              +               } else {<br>
              +                       go h.notifySocket.run(0)<br>
              +               }<br>
              +       }<br>
              +<br>
              ++      if (detach) {<br>
              ++              // This allows the parent process to
              daemonize this process<br>
              ++              // so long as stdin/stderr/stdout are
              closed<br>
              ++              if envVal :=
              os.Getenv("SIGUSR1_PARENT_PID"<wbr>); envVal != "" {<br>
              ++                      // Close stdin/stdout/stderr<br>
              ++                      os.Stdin.Close()<br>
              ++                      os.Stdout.Close()<br>
              ++                      os.Stderr.Close()<br>
              ++                      // Notify parent to detach<br>
              ++                      i, err := strconv.Atoi(envVal)<br>
              ++                      if (err != nil) {<br>
              ++                              return 0, nil<br>
              ++                      }<br>
            </blockquote>
            <div><br>
            </div>
            <div>So all the code below here is the copied block and it
              deals with the</div>
            <div>normal exit ? i.e. is it shutting the container down ?</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    Yes.   It follows the sequence I mentioned in this mail for the
    "runc run" case.  I tried to make it more clear.<br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>The reason I ask, is that I thought this block of code
              was running on</div>
            <div>startup, when the container first detaches .. and it
              didn't make sense</div>
            <div>in that context.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    <br>
    This block of code is the wait loop for signals OR exit, and there
    is some additional code that runs after it returns where it runs the
    cleanup handler. <br>
    <br>
    <br>
    Specifically if you look further down in the patch it is called
    r.destroy() and nothing is modified there other to call it.  In the
    case you don't have the environment variable set the exit is much
    earlier. <br>
    <br>
    Jason.<br>
    <br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote">
              ++                      unix.Kill(i, unix.SIGUSR1)<br>
              ++                      // Loop waiting on the child to
              signal or exit,<br>
              ++                      // after which all stop hooks will
              be run<br>
              ++                      for s := range h.signals {<br>
              ++                              switch s {<br>
              ++                              case unix.SIGCHLD:<br>
              ++                                      exits, err :=
              h.reap()<br>
              ++                                      if err != nil {<br>
              ++                                             
              logrus.Error(err)<br>
              ++                                      }<br>
              ++                                      for _, e := range
              exits {<br>
              ++                                             
              logrus.WithFields(logrus.<wbr>Fields{<br>
              ++                                                     
              "pid":    e.pid,<br>
              ++                                                     
              "status": e.status,<br>
              ++                                             
              }).Debug("process exited")<br>
              ++                                              if e.pid
              == pid1 {<br>
              ++                                                      //
              call Wait() on the process even though we already have the
              exit<br>
              ++                                                      //
              status because we must ensure that any of the go specific
              process<br>
              ++                                                      //
              fun such as flushing pipes are complete before we return.<br>
              ++                                                     
              process.Wait()<br>
              ++                                                      if
              h.notifySocket != nil {<br>
              ++                                                       
                    h.notifySocket.Close()<br>
              ++                                                      }<br>
              ++                                                     
              return e.status, nil<br>
              ++                                              }<br>
              ++                                      }<br>
              ++                              default:<br>
              ++                                     
              logrus.Debugf("sending signal to process %s", s)<br>
              ++                                      if err :=
              unix.Kill(pid1, s.(syscall.Signal)); err != nil {<br>
              ++                                             
              logrus.Error(err)<br>
              ++                                      }<br>
              ++                              }<br>
              ++                      }<br>
              ++              }<br>
              ++              return 0, nil<br>
              ++      }<br>
              +       // perform the initial tty resize.<br>
              +       tty.resize()<br>
              +       for s := range h.signals {<br>
              +diff --git a/src/import/utils_linux.go
              b/src/import/utils_linux.go<br>
              +index e6d31b35..1bb80a63 100644<br>
              +--- a/src/import/utils_linux.go<br>
              ++++ b/src/import/utils_linux.go<br>
              +@@ -308,7 +308,7 @@ func (r *runner) run(config
              *specs.Process) (int, error) {<br>
              +       if err != nil {<br>
              +               r.terminate(process)<br>
              +       }<br>
              +-      if detach {<br>
              ++      if (detach &amp;&amp;
              os.Getenv("SIGUSR1_PARENT_PID"<wbr>) == "") {<br>
              +               return 0, nil<br>
              +       }<br>
              +       r.destroy()<br>
              +--<br>
              +2.11.0<br>
              +<br>
              diff --git a/recipes-containers/runc/<a
                href="http://runc-docker_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">runc<wbr>-docker_git.bb</a>
              b/recipes-containers/runc/<a
                href="http://runc-docker_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">runc<wbr>-docker_git.bb</a><br>
              index 9db48ee..f31b82e 100644<br>
              --- a/recipes-containers/runc/<a
                href="http://runc-docker_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">runc<wbr>-docker_git.bb</a><br>
              +++ b/recipes-containers/runc/<a
                href="http://runc-docker_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">runc<wbr>-docker_git.bb</a><br>
              @@ -10,6 +10,7 @@ SRC_URI = "git://<a
                href="http://github.com/docker/runc.git;nobranch=1;name=runc-docker"
                rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/docker/runc.<wbr>git;nobranch=1;name=runc-<wbr>docker</a>
              \<br>
                          <a class="moz-txt-link-freetext" href="file://0001-runc-Add-console">file://0001-runc-Add-console</a>-<wbr>socket-dev-null.patch
              \<br>
                          <a class="moz-txt-link-freetext" href="file://0001-Use-correct-go">file://0001-Use-correct-go</a>-<wbr>cross-compiler.patch
              \<br>
                          <a class="moz-txt-link-freetext" href="file://0001-Disable-building">file://0001-Disable-building</a>-<wbr>recvtty.patch
              \<br>
              +           <a class="moz-txt-link-freetext" href="file://0001-runc-docker">file://0001-runc-docker</a>-<wbr>SIGUSR1-daemonize.patch
              \<br>
                         "<br>
              <br>
               RUNC_VERSION = "1.0.0-rc3"<br>
              <span class="HOEnZb">--<br>
                2.11.0<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                meta-virtualization mailing list<br>
                <a href="mailto:meta-virtualization@yoctoproject.org"
                  moz-do-not-send="true">meta-virtualization@<wbr>yoctoproject.org</a><br>
                <a
                  href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">https://lists.yoctoproject.<wbr>org/listinfo/meta-<wbr>virtualization</a><br>
              </span></blockquote>
          </div>
          <br>
          <br>
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------561D379E77605BCC44DB2A16--
