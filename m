Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D364E00D55; Sun, 10 Dec 2017 20:32:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E5DDE00CD3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 10 Dec 2017 20:31:59 -0800 (PST)
Received: by mail-qt0-f169.google.com with SMTP id u10so35466521qtg.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 10 Dec 2017 20:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jUn3WGyFO5HLnN5/3k0BW6GE/fzjoJg/a/mn84lMzDA=;
	b=Wi57hxgwBhwTx7PRRwL+yizcSqu7U0jpM2X20XPkei/5ap3AvlBjwZdpgjEUDexsPg
	ZWl/2cxAVkHuAb+MiU1yj5adKpbwQr4/ZM4GhucR0txmQmLCWaprZJE+19oPJrNsFS8/
	tp4tlVV8B1abUt98gdgCyKe7eLq6YY1aJoxabJ4JBYHWr1WAG29MnLvY82RyEdrKVKhs
	xe45wqo4gDzQME52bK/9oRfcDmoAOTTkJsaa0PHIYdT/mlw8xK4/UrIi7EgjkgSeqnIQ
	O47vbKAC/rHbLBLXYfBumyVHWGva5IxwZNE27CvzAlkB46QfP8uS/E/qEuIuqvZipiYS
	vQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jUn3WGyFO5HLnN5/3k0BW6GE/fzjoJg/a/mn84lMzDA=;
	b=MKCoMCOoHCRwCP0WVYWzAn7x2y8Ehn3toeEzKkcjZyQr8IKpksQSoyjncLnJ/ufshC
	sqHOzk6KQCDgh6auV5TjyiFhe7q/oe0tYpRA2zmBEaqhTVQfu4AniCisbGSkVyirgTp+
	vWjOGnRnpFlWJkyejg535Frc3/nKCDp2UM2t143XfZ1dGHWvQbs8d0BYHMrfJxOc2ZiM
	JVVv7uOI08FwjQY4pFFtad82SUiFLbzkBYH8RnJSNHjxf7Sx8U6aPlpYcFSZyt+XNuFm
	iXH6b8ZqE4OwwssNWlAbIxC9ou8JngsGvPZdQJdSwGRqm1irPwY1G1aKXzsGJY0xOsvC
	k4cA==
X-Gm-Message-State: AKGB3mK001z+apJxaO+NyclUi0yswGhaTrxBu2VF1QETB7mNzJF8ugKG
	hbFvn9DNvoIkWrc0ihq5gNoPK4Ik5FmeqI7qIS49AQ==
X-Google-Smtp-Source: AGs4zMabjXrfGoMe30/84yNowJPW78/LjutefRHvtSrn838l/ln8mLodr4FJaUkaGJbG97p8wBat/Qnqy8tBs2T178M=
X-Received: by 10.237.33.130 with SMTP id l2mr25130129qtc.120.1512966718502;
	Sun, 10 Dec 2017 20:31:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 10 Dec 2017 20:31:57 -0800 (PST)
In-Reply-To: <96828d83-e9cd-9218-057e-c5ee0f1005b2@windriver.com>
References: <20171208155344.17795-1-jason.wessel@windriver.com>
	<CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com>
	<96828d83-e9cd-9218-057e-c5ee0f1005b2@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Dec 2017 23:31:57 -0500
Message-ID: <CADkTA4M4D1+vhN6y-P7KCRizSrNrufiDuLSsp=_kmoNi0UMUjg@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
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
X-List-Received-Date: Mon, 11 Dec 2017 04:32:01 -0000
Content-Type: multipart/alternative; boundary="001a113788f8d03e9d0560090387"

--001a113788f8d03e9d0560090387
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 10, 2017 at 11:20 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> On 12/10/2017 09:38 PM, Bruce Ashfield wrote:
>
>
>
> On Fri, Dec 8, 2017 at 10:53 AM, Jason Wessel <jason.wessel@windriver.com>
> wrote:
>
>> The runc-docker has all the code in it to properly run a stop hook if
>> you use it in the foreground.  It doesn't work in the back ground
>> because there is no way for a golang application to fork a child exit
>> out of the parent process because all the golang threads stay with the
>> parent.
>>
>
> Can you define background for the commit log purposes ? Is it a container
> that allocates a tty and detaches from the current terminal ? Something
> else ?
>
>
>
> You are correct that it is ambiguous based on the terminal part.
>
>
> For the purpose of the background for this commit it is about interaction
> with a bash shell for any other typical process.
>
> When you use "runc run "  it is running in the "foreground", in the sense
> it takes over your existing terminal.
>
> The runc-docker doesn't have a way to start it with "runc run&" where you
> can send it to the background and have everything work.  With this commit,
> it does allow you to do that and have all the stop hooks fire at the time
> what ever runc started exits.
>
>
>
> Also why does the threads staying with the parent mean the stop hooks
> don't run. That isn't clear to me. Is it due to lack of notification if
> they exit ?
>
>
>
> We want the parent process to go away because that is how we daemonize.
> If the golang threads stay with the parent, after a fork no exit handlers
> run.
>
>
> Lets take a quick look at what "runc run" does today:
>
>   * Starts a whole pile of threads
>   * Sets up all name spaces
>   * Starts child process for container and leaves it paused at image
> activation
>   * runs start hooks
>   * executes "continue" for continue process
>   * waits for container app to exit
>   * executes stop hooks
>
> Now lets look at "runc create/start"
>    runc create
>      * Starts a whole pile of threads
>      * Sets up all name spaces
>      * Starts child process for container and leaves it paused at image
> activation
>      * exits  ----  DOH, this is the guy we want to keep
>    runc start
>      * runs start hooks
>      * executes "continue" for continue process
>
>     At this point when the container app exists nothing was waiting for it.
>
>
> --- What happens with the patch? ---
>
>    runc create
>      * Starts a whole pile of threads
>      * Sets up all name spaces
>      * Starts child process for container and leaves it paused at image
> activation
>      * closes stdin/stderr/stdout
>      * Sends SIGUSR1 to wrapper process and the wrapper just exits leaving
>         runc start behind.
>      * waits for child process to go away
>      * runs stop hooks
>    runc start
>      * runs start hooks
>      * executes "continue" for continue process
>
>     At this point when the container app exists nothing was waiting for it.
>
>
>
ahaha. This makes it much clearer to me (even the block of code below).

Can you put those steps in the commit log ? I'd like to keep them around
for reference
when I end up merging more patches in the similar area.

I can add this to my test queue in the morning and get it merged.

Bruce


>
>
>> This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
>> is set.
>>
>
> Where do you see that environment variable being set ? In the config.json ?
> Somewhere else ? (i.e. the launching environment).
>
>
>
> This is only set by the launch wrapper.
>
> The launch wrapper will set the variable to the PID of itself because it
> wants the notification.
>
>
>
>
>
>>
>> 1) The code was copied which performs the normal the signal handling
>>    block which is used for the foreground operation of runc.
>>
>> 2) At the point where runc start would normally exit, it closes
>>    stdin/stdout/stderr so it would be possible to daemonize "runc start
>> ...".
>>
>
> I can't say I completely follow point #2. Maybe it is with me not having
> looked at what is required to daemonize for a loooong time.
>
> See one question on the patch below.
>
>
>> 3) The code to send a SIGUSR1 to the parent process was added.  The
>>    idea being that a parent process would simply exit at that point
>>    because it was blocking until runc performed everything it was
>>    required to perform.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  .../0001-runc-docker-SIGUSR1-daemonize.patch       | 131
>> +++++++++++++++++++++
>>  recipes-containers/runc/runc-docker_git.bb         |   1 +
>>  2 files changed, 132 insertions(+)
>>  create mode 100644 recipes-containers/runc/runc-d
>> ocker/0001-runc-docker-SIGUSR1-daemonize.patch
>>
>> diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
>> b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUS
>> R1-daemonize.patch
>> new file mode 100644
>> index 0000000..b3bd068
>> --- /dev/null
>> +++ b/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUS
>> R1-daemonize.patch
>> @@ -0,0 +1,131 @@
>> +From cd7d76a6d1ecb1856f6ed666fb5c30dc105aa94e Mon Sep 17 00:00:00 2001
>> +From: Jason Wessel <jason.wessel@windriver.com>
>> +Date: Tue, 5 Dec 2017 18:28:28 -0800
>> +Subject: [PATCH] runc-docker: Allow "run start ..." to daemonize with
>> $SIGUSR1_PARENT_PID
>> +
>> +The runc-docker has all the code in it to properly run a stop hook if
>> +you use it in the foreground.  It doesn't work in the back ground
>> +because there is no way for a golang application to fork a child exit
>> +out of the parent process because all the golang threads stay with the
>> +parent.
>> +
>> +This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
>> +is set.
>> +
>> +1) The code was copied which performs the normal the signal handling
>> +   block which is used for the foreground operation of runc.
>> +
>> +2) At the point where runc start would normally exit, it closes
>> +   stdin/stdout/stderr so it would be possible to daemonize "runc start
>> ...".
>> +
>> +3) The code to send a SIGUSR1 to the parent process was added.  The
>> +   idea being that a parent process would simply exit at that point
>> +   because it was blocking until runc performed everything it was
>> +   required to perform.
>> +
>> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> +---
>> + signals.go     | 54 ++++++++++++++++++++++++++++++
>> ++++++++++++++++++++----
>> + utils_linux.go |  2 +-
>> + 2 files changed, 51 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/src/import/signals.go b/src/import/signals.go
>> +index 910ea1ee..b6a23476 100644
>> +--- a/src/import/signals.go
>> ++++ b/src/import/signals.go
>> +@@ -6,6 +6,7 @@ import (
>> +       "os"
>> +       "os/signal"
>> +       "syscall" // only for Signal
>> ++      "strconv"
>> +
>> +       "github.com/Sirupsen/logrus"
>> +       "github.com/opencontainers/runc/libcontainer"
>> +@@ -56,9 +57,6 @@ type signalHandler struct {
>> + func (h *signalHandler) forward(process *libcontainer.Process, tty
>> *tty, detach bool) (int, error) {
>> +       // make sure we know the pid of our main process so that we can
>> return
>> +       // after it dies.
>> +-      if detach && h.notifySocket == nil {
>> +-              return 0, nil
>> +-      }
>> +
>> +       pid1, err := process.Pid()
>> +       if err != nil {
>> +@@ -68,12 +66,60 @@ func (h *signalHandler) forward(process
>> *libcontainer.Process, tty *tty, detach
>> +       if h.notifySocket != nil {
>> +               if detach {
>> +                       h.notifySocket.run(pid1)
>> +-                      return 0, nil
>> +               } else {
>> +                       go h.notifySocket.run(0)
>> +               }
>> +       }
>> +
>> ++      if (detach) {
>> ++              // This allows the parent process to daemonize this
>> process
>> ++              // so long as stdin/stderr/stdout are closed
>> ++              if envVal := os.Getenv("SIGUSR1_PARENT_PID"); envVal !=
>> "" {
>> ++                      // Close stdin/stdout/stderr
>> ++                      os.Stdin.Close()
>> ++                      os.Stdout.Close()
>> ++                      os.Stderr.Close()
>> ++                      // Notify parent to detach
>> ++                      i, err := strconv.Atoi(envVal)
>> ++                      if (err != nil) {
>> ++                              return 0, nil
>> ++                      }
>>
>
> So all the code below here is the copied block and it deals with the
> normal exit ? i.e. is it shutting the container down ?
>
>
>
> Yes.   It follows the sequence I mentioned in this mail for the "runc run"
> case.  I tried to make it more clear.
>
>
> The reason I ask, is that I thought this block of code was running on
> startup, when the container first detaches .. and it didn't make sense
> in that context.
>
>
>
>
> This block of code is the wait loop for signals OR exit, and there is some
> additional code that runs after it returns where it runs the cleanup
> handler.
>
>
> Specifically if you look further down in the patch it is called
> r.destroy() and nothing is modified there other to call it.  In the case
> you don't have the environment variable set the exit is much earlier.
>
> Jason.
>
>
>
>
>
> Bruce
>
>
>> ++                      unix.Kill(i, unix.SIGUSR1)
>> ++                      // Loop waiting on the child to signal or exit,
>> ++                      // after which all stop hooks will be run
>> ++                      for s := range h.signals {
>> ++                              switch s {
>> ++                              case unix.SIGCHLD:
>> ++                                      exits, err := h.reap()
>> ++                                      if err != nil {
>> ++                                              logrus.Error(err)
>> ++                                      }
>> ++                                      for _, e := range exits {
>> ++
>> logrus.WithFields(logrus.Fields{
>> ++                                                      "pid":    e.pid,
>> ++                                                      "status":
>> e.status,
>> ++                                              }).Debug("process exited")
>> ++                                              if e.pid == pid1 {
>> ++                                                      // call Wait() on
>> the process even though we already have the exit
>> ++                                                      // status because
>> we must ensure that any of the go specific process
>> ++                                                      // fun such as
>> flushing pipes are complete before we return.
>> ++                                                      process.Wait()
>> ++                                                      if h.notifySocket
>> != nil {
>> ++
>> h.notifySocket.Close()
>> ++                                                      }
>> ++                                                      return e.status,
>> nil
>> ++                                              }
>> ++                                      }
>> ++                              default:
>> ++                                      logrus.Debugf("sending signal to
>> process %s", s)
>> ++                                      if err := unix.Kill(pid1,
>> s.(syscall.Signal)); err != nil {
>> ++                                              logrus.Error(err)
>> ++                                      }
>> ++                              }
>> ++                      }
>> ++              }
>> ++              return 0, nil
>> ++      }
>> +       // perform the initial tty resize.
>> +       tty.resize()
>> +       for s := range h.signals {
>> +diff --git a/src/import/utils_linux.go b/src/import/utils_linux.go
>> +index e6d31b35..1bb80a63 100644
>> +--- a/src/import/utils_linux.go
>> ++++ b/src/import/utils_linux.go
>> +@@ -308,7 +308,7 @@ func (r *runner) run(config *specs.Process) (int,
>> error) {
>> +       if err != nil {
>> +               r.terminate(process)
>> +       }
>> +-      if detach {
>> ++      if (detach && os.Getenv("SIGUSR1_PARENT_PID") == "") {
>> +               return 0, nil
>> +       }
>> +       r.destroy()
>> +--
>> +2.11.0
>> +
>> diff --git a/recipes-containers/runc/runc-docker_git.bb
>> b/recipes-containers/runc/runc-docker_git.bb
>> index 9db48ee..f31b82e 100644
>> --- a/recipes-containers/runc/runc-docker_git.bb
>> +++ b/recipes-containers/runc/runc-docker_git.bb
>> @@ -10,6 +10,7 @@ SRC_URI = "git://github.com/docker/runc.
>> git;nobranch=1;name=runc-docker \
>>             file://0001-runc-Add-console-socket-dev-null.patch \
>>             file://0001-Use-correct-go-cross-compiler.patch \
>>             file://0001-Disable-building-recvtty.patch \
>> +           file://0001-runc-docker-SIGUSR1-daemonize.patch \
>>            "
>>
>>  RUNC_VERSION = "1.0.0-rc3"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113788f8d03e9d0560090387
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Dec 10, 2017 at 11:20 PM, Jason Wessel <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jason.wessel@windriver.com" target=3D"_blank">jason.wessel@=
windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <div class=3D"m_1607042089656893404moz-cite-prefix">On 12/10/2017 09:38=
 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Fri, Dec 8, 2017 at 10:53 AM,
            Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wess=
el@windriver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</spa=
n>
            wrote:<br>
            <blockquote class=3D"gmail_quote">The runc-docker has all the
              code in it to properly run a stop hook if<br>
              you use it in the foreground.=C2=A0 It doesn&#39;t work in th=
e back
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
    <br></span>
    You are correct that it is ambiguous based on the terminal part.<br>
    <br>
    <br>
    For the purpose of the background for this commit it is about
    interaction with a bash shell for any other typical process.<br>
    <br>
    When you use &quot;runc run &quot;=C2=A0 it is running in the &quot;for=
eground&quot;, in the
    sense it takes over your existing terminal.<br>
    <br>
    The runc-docker doesn&#39;t have a way to start it with &quot;runc run&=
amp;&quot;
    where you can send it to the background and have everything work.=C2=A0
    With this commit, it does allow you to do that and have all the stop
    hooks fire at the time what ever runc started exits. <br><span class=3D=
"">
    <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>Also why does the threads staying with the parent mean
              the stop hooks</div>
            <div>don&#39;t run. That isn&#39;t clear to me. Is it due to la=
ck of
              notification if they exit ?</div>
            <div>=C2=A0</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></span>
    We want the parent process to go away because that is how we
    daemonize.=C2=A0=C2=A0 If the golang threads stay with the parent, afte=
r a
    fork no exit handlers run.<br>
    <br>
    <br>
    Lets take a quick look at what &quot;runc run&quot; does today:<br>
    <br>
    =C2=A0 * Starts a whole pile of threads<br>
    =C2=A0 * Sets up all name spaces<br>
    =C2=A0 * Starts child process for container and leaves it paused at ima=
ge
    activation<br>
    =C2=A0 * runs start hooks<br>
    =C2=A0 * executes &quot;continue&quot; for continue process<br>
    =C2=A0 * waits for container app to exit<br>
    =C2=A0 * executes stop hooks<br>
    <br>
    Now lets look at &quot;runc create/start&quot;<br>
    =C2=A0=C2=A0 runc create<br>
    =C2=A0 =C2=A0=C2=A0 * Starts a whole pile of threads<br>
    =C2=A0 =C2=A0=C2=A0 * Sets up all name spaces<br>
    =C2=A0 =C2=A0=C2=A0 * Starts child process for container and leaves it =
paused at
    image activation<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * exits=C2=A0 ----=C2=A0 DOH, this is the guy =
we want to keep<br>
    =C2=A0=C2=A0 runc start<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * runs start hooks<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * executes &quot;continue&quot; for continue p=
rocess<br>
    <br>
    =C2=A0=C2=A0=C2=A0 At this point when the container app exists nothing =
was waiting
    for it.<br>
    <br>
    <br>
    --- What happens with the patch? ---<br>
    <br>
    =C2=A0=C2=A0 runc create<br>
    =C2=A0 =C2=A0=C2=A0 * Starts a whole pile of threads<br>
    =C2=A0 =C2=A0=C2=A0 * Sets up all name spaces<br>
    =C2=A0 =C2=A0=C2=A0 * Starts child process for container and leaves it =
paused at
    image activation<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * closes stdin/stderr/stdout<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * Sends SIGUSR1 to wrapper process and the wra=
pper just exits
    leaving<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runc start behind.<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * waits for child process to go away<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * runs stop hooks<br>
    =C2=A0=C2=A0 runc start<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * runs start hooks<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 * executes &quot;continue&quot; for continue p=
rocess<br>
    <br>
    =C2=A0=C2=A0=C2=A0 At this point when the container app exists nothing =
was waiting
    for it.<span class=3D""><br>
    <br>
    <br></span></div></blockquote><div><br></div><div>ahaha. This makes it =
much clearer to me (even the block of code below).</div><div><br></div><div=
>Can you put those steps in the commit log ? I&#39;d like to keep them arou=
nd for reference</div><div>when I end up merging more patches in the simila=
r area.</div><div><br></div><div>I can add this to my test queue in the mor=
ning and get it merged.</div><div><br></div><div>Bruce</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF">=
<span class=3D"">
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote">
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
    <br></span>
    This is only set by the launch wrapper. <br>
    <br>
    The launch wrapper will set the variable to the PID of itself
    because it wants the notification.<div><div class=3D"h5"><br>
    <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote">
              <br>
              1) The code was copied which performs the normal the
              signal handling<br>
              =C2=A0 =C2=A0block which is used for the foreground operation=
 of
              runc.<br>
              <br>
              2) At the point where runc start would normally exit, it
              closes<br>
              =C2=A0 =C2=A0stdin/stdout/stderr so it would be possible to
              daemonize &quot;runc start ...&quot;.<br>
            </blockquote>
            <div><br>
            </div>
            <div>I can&#39;t say I completely follow point #2. Maybe it is
              with me not having</div>
            <div>looked at what is required to daemonize for a loooong
              time.=C2=A0</div>
            <div><br>
            </div>
            <div>See one question on the patch below.</div>
            <div><br>
            </div>
            <blockquote class=3D"gmail_quote">
              <br>
              3) The code to send a SIGUSR1 to the parent process was
              added.=C2=A0 The<br>
              =C2=A0 =C2=A0idea being that a parent process would simply ex=
it at
              that point<br>
              =C2=A0 =C2=A0because it was blocking until runc performed eve=
rything
              it was<br>
              =C2=A0 =C2=A0required to perform.<br>
              <br>
              Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wesse=
l@windriver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;<br>
              ---<br>
              =C2=A0.../0001-runc-docker-SIGUSR1-<wbr>daemonize.patch=C2=A0=
 =C2=A0 =C2=A0 =C2=A0|
              131 +++++++++++++++++++++<br>
              =C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">runc-<wbr>docker_git.bb</a>=C2=
=A0
              =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
              =C2=A02 files changed, 132 insertions(+)<br>
              =C2=A0create mode 100644 recipes-containers/runc/runc-d<wbr>o=
cker/0001-runc-docker-SIGUSR1<wbr>-daemonize.patch<br>
              <br>
              diff --git a/recipes-containers/runc/runc<wbr>-docker/0001-ru=
nc-docker-SIGUS<wbr>R1-daemonize.patch
              b/recipes-containers/runc/runc<wbr>-docker/0001-runc-docker-S=
IGUS<wbr>R1-daemonize.patch<br>
              new file mode 100644<br>
              index 0000000..b3bd068<br>
              --- /dev/null<br>
              +++ b/recipes-containers/runc/runc<wbr>-docker/0001-runc-dock=
er-SIGUS<wbr>R1-daemonize.patch<br>
              @@ -0,0 +1,131 @@<br>
              +From cd7d76a6d1ecb1856f6ed666fb5c30<wbr>dc105aa94e Mon
              Sep 17 00:00:00 2001<br>
              +From: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windri=
ver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;<br>
              +Date: Tue, 5 Dec 2017 18:28:28 -0800<br>
              +Subject: [PATCH] runc-docker: Allow &quot;run start ...&quot=
; to
              daemonize with $SIGUSR1_PARENT_PID<br>
              +<br>
              +The runc-docker has all the code in it to properly run a
              stop hook if<br>
              +you use it in the foreground.=C2=A0 It doesn&#39;t work in t=
he
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
              +=C2=A0 =C2=A0block which is used for the foreground operatio=
n of
              runc.<br>
              +<br>
              +2) At the point where runc start would normally exit, it
              closes<br>
              +=C2=A0 =C2=A0stdin/stdout/stderr so it would be possible to
              daemonize &quot;runc start ...&quot;.<br>
              +<br>
              +3) The code to send a SIGUSR1 to the parent process was
              added.=C2=A0 The<br>
              +=C2=A0 =C2=A0idea being that a parent process would simply e=
xit at
              that point<br>
              +=C2=A0 =C2=A0because it was blocking until runc performed
              everything it was<br>
              +=C2=A0 =C2=A0required to perform.<br>
              +<br>
              +Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wess=
el@windriver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;<br>
              +---<br>
              + signals.go=C2=A0 =C2=A0 =C2=A0| 54 ++++++++++++++++++++++++=
++++++<wbr>++++++++++++++++++++----<br>
              + utils_linux.go |=C2=A0 2 +-<br>
              + 2 files changed, 51 insertions(+), 5 deletions(-)<br>
              +<br>
              +diff --git a/src/import/signals.go
              b/src/import/signals.go<br>
              +index 910ea1ee..b6a23476 100644<br>
              +--- a/src/import/signals.go<br>
              ++++ b/src/import/signals.go<br>
              +@@ -6,6 +6,7 @@ import (<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os/signal&quot;<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;syscall&quot; // only for S=
ignal<br>
              ++=C2=A0 =C2=A0 =C2=A0 &quot;strconv&quot;<br>
              +<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.co=
m/Sirupsen/logrus" rel=3D"noreferrer" target=3D"_blank">github.com/Sirupsen=
/logrus</a>&quot;<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.co=
m/opencontainers/runc/libcontainer" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/opencontainers/ru<wbr>nc/libcontainer</a>&quot;<br>
              +@@ -56,9 +57,6 @@ type signalHandler struct {<br>
              + func (h *signalHandler) forward(process
              *libcontainer.Process, tty *tty, detach bool) (int, error)
              {<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0// make sure we know the pid of o=
ur main process
              so that we can return<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0// after it dies.<br>
              +-=C2=A0 =C2=A0 =C2=A0 if detach &amp;&amp; h.notifySocket =
=3D=3D nil {<br>
              +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, =
nil<br>
              +-=C2=A0 =C2=A0 =C2=A0 }<br>
              +<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0pid1, err :=3D process.Pid()<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
              +@@ -68,12 +66,60 @@ func (h *signalHandler)
              forward(process *libcontainer.Process, tty *tty, detach<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0if h.notifySocket !=3D nil {<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if de=
tach {<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0h.notifySocket.run(pid1)<br>
              +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return 0, nil<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} els=
e {<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0go h.notifySocket.run(0)<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              +<br>
              ++=C2=A0 =C2=A0 =C2=A0 if (detach) {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // This al=
lows the parent process to
              daemonize this process<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // so long=
 as stdin/stderr/stdout are
              closed<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if envVal =
:=3D
              os.Getenv(&quot;SIGUSR1_PARENT_PID&quot;<wbr>); envVal !=3D &=
quot;&quot; {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 // Close stdin/stdout/stderr<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 os.Stdin.Close()<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 os.Stdout.Close()<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 os.Stderr.Close()<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 // Notify parent to detach<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 i, err :=3D strconv.Atoi(envVal)<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (err !=3D nil) {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, nil<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
            </blockquote>
            <div><br>
            </div>
            <div>So all the code below here is the copied block and it
              deals with the</div>
            <div>normal exit ? i.e. is it shutting the container down ?</di=
v>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br></div></div>
    Yes.=C2=A0=C2=A0 It follows the sequence I mentioned in this mail for t=
he
    &quot;runc run&quot; case.=C2=A0 I tried to make it more clear.<span cl=
ass=3D""><br>
    <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>The reason I ask, is that I thought this block of code
              was running on</div>
            <div>startup, when the container first detaches .. and it
              didn&#39;t make sense</div>
            <div>in that context.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    <br></span>
    This block of code is the wait loop for signals OR exit, and there
    is some additional code that runs after it returns where it runs the
    cleanup handler. <br>
    <br>
    <br>
    Specifically if you look further down in the patch it is called
    r.destroy() and nothing is modified there other to call it.=C2=A0 In th=
e
    case you don&#39;t have the environment variable set the exit is much
    earlier. <br><span class=3D"HOEnZb"><font color=3D"#888888">
    <br>
    Jason.</font></span><div><div class=3D"h5"><br>
    <br>
    <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><br>
            </div>
            <div>Bruce</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote">
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unix.Kill(i, unix.SIGUSR1)<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 // Loop waiting on the child to
              signal or exit,<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 // after which all stop hooks will
              be run<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 for s :=3D range h.signals {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch s {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case unix.SIGCHLD:<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
xits, err :=3D
              h.reap()<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f err !=3D nil {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
              logrus.Error(err)<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
or _, e :=3D range
              exits {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
              logrus.WithFields(logrus.Field<wbr>s{<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              &quot;pid&quot;:=C2=A0 =C2=A0 e.pid,<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              &quot;status&quot;: e.status,<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
              }).Debug(&quot;process exited&quot;)<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if e.pid
              =3D=3D pid1 {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //
              call Wait() on the process even though we already have the
              exit<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //
              status because we must ensure that any of the go specific
              process<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //
              fun such as flushing pipes are complete before we return.<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              process.Wait()<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if
              h.notifySocket !=3D nil {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              =C2=A0 =C2=A0 =C2=A0 h.notifySocket.Close()<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              return e.status, nil<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
              logrus.Debugf(&quot;sending signal to process %s&quot;, s)<br=
>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f err :=3D
              unix.Kill(pid1, s.(syscall.Signal)); err !=3D nil {<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0
              logrus.Error(err)<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
              ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, =
nil<br>
              ++=C2=A0 =C2=A0 =C2=A0 }<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0// perform the initial tty resize=
.<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0tty.resize()<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0for s :=3D range h.signals {<br>
              +diff --git a/src/import/utils_linux.go
              b/src/import/utils_linux.go<br>
              +index e6d31b35..1bb80a63 100644<br>
              +--- a/src/import/utils_linux.go<br>
              ++++ b/src/import/utils_linux.go<br>
              +@@ -308,7 +308,7 @@ func (r *runner) run(config
              *specs.Process) (int, error) {<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.ter=
minate(process)<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              +-=C2=A0 =C2=A0 =C2=A0 if detach {<br>
              ++=C2=A0 =C2=A0 =C2=A0 if (detach &amp;&amp;
              os.Getenv(&quot;SIGUSR1_PARENT_PID&quot;<wbr>) =3D=3D &quot;&=
quot;) {<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retur=
n 0, nil<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0r.destroy()<br>
              +--<br>
              +2.11.0<br>
              +<br>
              diff --git a/recipes-containers/runc/<a href=3D"http://runc-d=
ocker_git.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb<=
/a>
              b/recipes-containers/runc/<a href=3D"http://runc-docker_git.b=
b" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
              index 9db48ee..f31b82e 100644<br>
              --- a/recipes-containers/runc/<a href=3D"http://runc-docker_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
              +++ b/recipes-containers/runc/<a href=3D"http://runc-docker_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
              @@ -10,6 +10,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://g=
ithub.com/docker/runc.git;nobranch=3D1;name=3Drunc-docker" rel=3D"noreferre=
r" target=3D"_blank">github.com/docker/runc.<wbr>git;nobranch=3D1;name=3Dru=
nc-docke<wbr>r</a>
              \<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D"m_16070=
42089656893404moz-txt-link-freetext">file://0001-runc-Add-console</a>-s<wbr=
>ocket-dev-null.patch
              \<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D"m_16070=
42089656893404moz-txt-link-freetext">file://0001-Use-correct-go</a>-cro<wbr=
>ss-compiler.patch
              \<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D"m_16070=
42089656893404moz-txt-link-freetext">file://0001-Disable-building</a>-r<wbr=
>ecvtty.patch
              \<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_16070=
42089656893404moz-txt-link-freetext">file://0001-runc-docker</a>-SIGUS<wbr>=
R1-daemonize.patch
              \<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
              <br>
              =C2=A0RUNC_VERSION =3D &quot;1.0.0-rc3&quot;<br>
              <span class=3D"m_1607042089656893404HOEnZb">--<br>
                2.11.0<br>
                <br>
                --<br>
                ______________________________<wbr>_________________<br>
                meta-virtualization mailing list<br>
                <a href=3D"mailto:meta-virtualization@yoctoproject.org" tar=
get=3D"_blank">meta-virtualization@yoctoproje<wbr>ct.org</a><br>
                <a href=3D"https://lists.yoctoproject.org/listinfo/meta-vir=
tualization" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoprojec=
t.org<wbr>/listinfo/meta-virtualization</a><br>
              </span></blockquote>
          </div>
          <br>
          <br>
          <div><br>
          </div>
          -- <br>
          <div class=3D"m_1607042089656893404gmail_signature" data-smartmai=
l=3D"gmail_signature">&quot;Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end&quot;</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div></div></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a113788f8d03e9d0560090387--
