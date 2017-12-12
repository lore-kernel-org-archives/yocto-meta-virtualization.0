Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3D81E00D84; Mon, 11 Dec 2017 20:54:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E67BBE00CFF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Dec 2017 20:54:17 -0800 (PST)
Received: by mail-qt0-f178.google.com with SMTP id w10so44398886qtb.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Dec 2017 20:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GMM3PlrOqWi7qETwvIJqbO0KMPCj8AyXW3XmBIpuG00=;
	b=FQvQoJDC7DllFhNJlwwrQPdpboHkl1lk67RK37MdKq4MkK4OJsVK+lICsDtHn6i65L
	O1cVK7AkzFo05UbeZfskkNPSFpxRxhlM8D7u3MQ50FkuCjruvjuXbtSxpDWpTBrVcdac
	OtlwAWFqmSYFtcYfgtRUwsNMPs2clTPjbihp4FstI87ND3sKSkfpGfbkG9d6RM0OMe0X
	NbX5pPppaZnKEzq3I/egQY3yhFXvD2th2jy0dssf8MDBz3KjGJAez2fYVI5valG5dfbN
	hQPwyr/inEYuyiNtDmGZ8w7SQYOSXi5EsUhj9ubbOfZODgIzcOR7mq2H7lqpdYbHyCF2
	eJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GMM3PlrOqWi7qETwvIJqbO0KMPCj8AyXW3XmBIpuG00=;
	b=Y6x5J/K/LoGXyBiIL43Wk/gGd78UB0GUJnpfF17o1mvMWlqtcc57JCRFj0ZAKKjiR0
	P331VgL5E24bIezdj3jtVHhL03h7gFcGCw1RIAb0//bRubbFu+7nxiglSeJXfFmPy0g5
	TwY+e0kEqYXe/Hp+zLVqNtAAiXhp+F/b/3GPzoiWmPyVfxvpCnx+cFpYsfdHw3F+Uslc
	DeWoh3kzGPKAp91QUwRGIHZX816m4b3Hdp8RWrwtLmBz1fA1WdR7S83g/NPo+JNzTjsD
	+8gDCHXBt1XmvNUawDQY6yYNhhn9dPV5YXjIE+euyg0VJvl2xc1w5q355f7xhCV3Ts8k
	WnZw==
X-Gm-Message-State: AKGB3mJ00H7nVBB9BZ58V8oX8klM9JXR3+UEThZhQbTz1upJSrErh4fn
	LbjvnUFmU5iBMuHeEoknxB57TiHS2jQue/hdJ3Y=
X-Google-Smtp-Source: ACJfBovk7E3zRteq+pcM7Lm+cmzcsuTKvXO6F2jt27j2aUrB7eUhvn2BHpv4kWXsyytGR5DJvRWnU8l/EEwCINirdSI=
X-Received: by 10.55.181.1 with SMTP id e1mr3706844qkf.19.1513054456914; Mon,
	11 Dec 2017 20:54:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 11 Dec 2017 20:54:16 -0800 (PST)
In-Reply-To: <20171211134107.129827-1-jason.wessel@windriver.com>
References: <20171211134107.129827-1-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Dec 2017 23:54:16 -0500
Message-ID: <CADkTA4OW-BnMTOyFLspgN0E4kyY7jOTQsqDhw621zVU-=UZXYA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [v2 PATCH] runc-docker: Allow "run start ..." to daemonize with $SIGUSR1_PARENT_PID
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
X-List-Received-Date: Tue, 12 Dec 2017 04:54:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c06c6426e2e9405601d71fc"

--94eb2c06c6426e2e9405601d71fc
Content-Type: text/plain; charset="UTF-8"

v2 looks good and is now merged.

Bruce

On Mon, Dec 11, 2017 at 8:41 AM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> The runc-docker has all the code in it to properly run a stop hook if
> you use it in the foreground.  It doesn't work in the back ground
> because there is no way for a golang application to fork a child exit
> out of the parent process because all the golang threads stay with the
> parent.
>
> This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
> is set.
>
> 1) At the point where runc start would normally exit, it closes
>    stdin/stdout/stderr so it would be possible to daemonize "runc start
> ...".
>
> 2) The code to send a SIGUSR1 to the parent process was added.  The
>    idea being that a parent process would simply exit at that point
>    because it was blocking until runc performed everything it was
>    required to perform.
>
> 3) The code was copied which performs the normal the signal handling
>    block which is used for the foreground operation of runc.
>
> -- More information --
>
> When you use "runc run " it is running in the "foreground", in the
> sense it takes over your existing terminal.
>
> The runc-docker doesn't have a way to start it with "runc run&" where
> you can send it to the background and have everything work.  With this
> commit, it does allow you to do that and have all the stop hooks fire
> at the time what ever runc started exits.
>
> Lets take a quick look at what "runc run" does today:
>
>   * Starts a whole pile of threads
>   * Sets up all name spaces
>   * Starts child process for container and leaves it paused at image
> activation
>   * runs start hooks
>   * executes "continue" for container process
>   * waits for container app to exit
>   * executes stop hooks
>
> Now lets look at "runc create/start" does today:
>    runc create
>      * Starts a whole pile of threads
>      * Sets up all name spaces
>      * Starts child process for container and leaves it paused at image
> activation
>      * exits  -- [ NOTE: this is our problem! ]
>    runc start
>      * runs start hooks
>      * executes "continue" for continue process
>
>    At this point when the container app exits nothing is waiting for it
>    to run any kind of hooks.
>
> --- What is the new behavior? ---
>
>    runc create
>     [ NOTE: runc is started by a wrapper which sets $SIGUSR1_PARENT_PID ]
>       * Starts a whole pile of threads
>       * Sets up all name spaces
>       * Starts child process for container and leaves it paused at image
> activation
>       * closes stdin/stderr/stdout
>       * Sends SIGUSR1 to wrapper process and the wrapper just exits
>         leaving "runc create" behind.
>       * waits for child process to go away
>       * runs stop hooks
>    runc start
>       * runs start hooks
>       * executes continue for the container process created by runc create
>
> With the patch + a wrapper for "runc start" we get the same behavior
> as "runc run" where the stop hooks always run immediately following
> the container termination.  This is required if you want to have event
> driven stop hooks for your overall architecture.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  .../0001-runc-docker-SIGUSR1-daemonize.patch       | 131
> +++++++++++++++++++++
>  recipes-containers/runc/runc-docker_git.bb         |   1 +
>  2 files changed, 132 insertions(+)
>  create mode 100644 recipes-containers/runc/runc-docker/0001-runc-docker-
> SIGUSR1-daemonize.patch
>
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-SIGUSR1-daemonize.patch
> b/recipes-containers/runc/runc-docker/0001-runc-docker-
> SIGUSR1-daemonize.patch
> new file mode 100644
> index 0000000..b3bd068
> --- /dev/null
> +++ b/recipes-containers/runc/runc-docker/0001-runc-docker-
> SIGUSR1-daemonize.patch
> @@ -0,0 +1,131 @@
> +From cd7d76a6d1ecb1856f6ed666fb5c30dc105aa94e Mon Sep 17 00:00:00 2001
> +From: Jason Wessel <jason.wessel@windriver.com>
> +Date: Tue, 5 Dec 2017 18:28:28 -0800
> +Subject: [PATCH] runc-docker: Allow "run start ..." to daemonize with
> $SIGUSR1_PARENT_PID
> +
> +The runc-docker has all the code in it to properly run a stop hook if
> +you use it in the foreground.  It doesn't work in the back ground
> +because there is no way for a golang application to fork a child exit
> +out of the parent process because all the golang threads stay with the
> +parent.
> +
> +This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
> +is set.
> +
> +1) The code was copied which performs the normal the signal handling
> +   block which is used for the foreground operation of runc.
> +
> +2) At the point where runc start would normally exit, it closes
> +   stdin/stdout/stderr so it would be possible to daemonize "runc start
> ...".
> +
> +3) The code to send a SIGUSR1 to the parent process was added.  The
> +   idea being that a parent process would simply exit at that point
> +   because it was blocking until runc performed everything it was
> +   required to perform.
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +---
> + signals.go     | 54 ++++++++++++++++++++++++++++++
> ++++++++++++++++++++----
> + utils_linux.go |  2 +-
> + 2 files changed, 51 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/import/signals.go b/src/import/signals.go
> +index 910ea1ee..b6a23476 100644
> +--- a/src/import/signals.go
> ++++ b/src/import/signals.go
> +@@ -6,6 +6,7 @@ import (
> +       "os"
> +       "os/signal"
> +       "syscall" // only for Signal
> ++      "strconv"
> +
> +       "github.com/Sirupsen/logrus"
> +       "github.com/opencontainers/runc/libcontainer"
> +@@ -56,9 +57,6 @@ type signalHandler struct {
> + func (h *signalHandler) forward(process *libcontainer.Process, tty *tty,
> detach bool) (int, error) {
> +       // make sure we know the pid of our main process so that we can
> return
> +       // after it dies.
> +-      if detach && h.notifySocket == nil {
> +-              return 0, nil
> +-      }
> +
> +       pid1, err := process.Pid()
> +       if err != nil {
> +@@ -68,12 +66,60 @@ func (h *signalHandler) forward(process
> *libcontainer.Process, tty *tty, detach
> +       if h.notifySocket != nil {
> +               if detach {
> +                       h.notifySocket.run(pid1)
> +-                      return 0, nil
> +               } else {
> +                       go h.notifySocket.run(0)
> +               }
> +       }
> +
> ++      if (detach) {
> ++              // This allows the parent process to daemonize this process
> ++              // so long as stdin/stderr/stdout are closed
> ++              if envVal := os.Getenv("SIGUSR1_PARENT_PID"); envVal !=
> "" {
> ++                      // Close stdin/stdout/stderr
> ++                      os.Stdin.Close()
> ++                      os.Stdout.Close()
> ++                      os.Stderr.Close()
> ++                      // Notify parent to detach
> ++                      i, err := strconv.Atoi(envVal)
> ++                      if (err != nil) {
> ++                              return 0, nil
> ++                      }
> ++                      unix.Kill(i, unix.SIGUSR1)
> ++                      // Loop waiting on the child to signal or exit,
> ++                      // after which all stop hooks will be run
> ++                      for s := range h.signals {
> ++                              switch s {
> ++                              case unix.SIGCHLD:
> ++                                      exits, err := h.reap()
> ++                                      if err != nil {
> ++                                              logrus.Error(err)
> ++                                      }
> ++                                      for _, e := range exits {
> ++                                              logrus.WithFields(logrus.
> Fields{
> ++                                                      "pid":    e.pid,
> ++                                                      "status": e.status,
> ++                                              }).Debug("process exited")
> ++                                              if e.pid == pid1 {
> ++                                                      // call Wait() on
> the process even though we already have the exit
> ++                                                      // status because
> we must ensure that any of the go specific process
> ++                                                      // fun such as
> flushing pipes are complete before we return.
> ++                                                      process.Wait()
> ++                                                      if h.notifySocket
> != nil {
> ++
> h.notifySocket.Close()
> ++                                                      }
> ++                                                      return e.status,
> nil
> ++                                              }
> ++                                      }
> ++                              default:
> ++                                      logrus.Debugf("sending signal to
> process %s", s)
> ++                                      if err := unix.Kill(pid1,
> s.(syscall.Signal)); err != nil {
> ++                                              logrus.Error(err)
> ++                                      }
> ++                              }
> ++                      }
> ++              }
> ++              return 0, nil
> ++      }
> +       // perform the initial tty resize.
> +       tty.resize()
> +       for s := range h.signals {
> +diff --git a/src/import/utils_linux.go b/src/import/utils_linux.go
> +index e6d31b35..1bb80a63 100644
> +--- a/src/import/utils_linux.go
> ++++ b/src/import/utils_linux.go
> +@@ -308,7 +308,7 @@ func (r *runner) run(config *specs.Process) (int,
> error) {
> +       if err != nil {
> +               r.terminate(process)
> +       }
> +-      if detach {
> ++      if (detach && os.Getenv("SIGUSR1_PARENT_PID") == "") {
> +               return 0, nil
> +       }
> +       r.destroy()
> +--
> +2.11.0
> +
> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> index 9db48ee..f31b82e 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -10,6 +10,7 @@ SRC_URI = "git://github.com/docker/runc.
> git;nobranch=1;name=runc-docker \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-Use-correct-go-cross-compiler.patch \
>             file://0001-Disable-building-recvtty.patch \
> +           file://0001-runc-docker-SIGUSR1-daemonize.patch \
>            "
>
>  RUNC_VERSION = "1.0.0-rc3"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06c6426e2e9405601d71fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v2 looks good and is now merged.<div><br></div><div>Bruce<=
/div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon=
, Dec 11, 2017 at 8:41 AM, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jason.wessel@windriver.com" target=3D"_blank">jason.wessel@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The runc-docker =
has all the code in it to properly run a stop hook if<br>
you use it in the foreground.=C2=A0 It doesn&#39;t work in the back ground<=
br>
because there is no way for a golang application to fork a child exit<br>
out of the parent process because all the golang threads stay with the<br>
parent.<br>
<br>
This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID<br>
is set.<br>
<br>
1) At the point where runc start would normally exit, it closes<br>
=C2=A0 =C2=A0stdin/stdout/stderr so it would be possible to daemonize &quot=
;runc start ...&quot;.<br>
<br>
2) The code to send a SIGUSR1 to the parent process was added.=C2=A0 The<br=
>
=C2=A0 =C2=A0idea being that a parent process would simply exit at that poi=
nt<br>
=C2=A0 =C2=A0because it was blocking until runc performed everything it was=
<br>
=C2=A0 =C2=A0required to perform.<br>
<br>
3) The code was copied which performs the normal the signal handling<br>
=C2=A0 =C2=A0block which is used for the foreground operation of runc.<br>
<br>
-- More information --<br>
<br>
When you use &quot;runc run &quot; it is running in the &quot;foreground&qu=
ot;, in the<br>
sense it takes over your existing terminal.<br>
<br>
The runc-docker doesn&#39;t have a way to start it with &quot;runc run&amp;=
&quot; where<br>
you can send it to the background and have everything work.=C2=A0 With this=
<br>
commit, it does allow you to do that and have all the stop hooks fire<br>
at the time what ever runc started exits.<br>
<br>
Lets take a quick look at what &quot;runc run&quot; does today:<br>
<br>
=C2=A0 * Starts a whole pile of threads<br>
=C2=A0 * Sets up all name spaces<br>
=C2=A0 * Starts child process for container and leaves it paused at image a=
ctivation<br>
=C2=A0 * runs start hooks<br>
=C2=A0 * executes &quot;continue&quot; for container process<br>
=C2=A0 * waits for container app to exit<br>
=C2=A0 * executes stop hooks<br>
<br>
Now lets look at &quot;runc create/start&quot; does today:<br>
=C2=A0 =C2=A0runc create<br>
=C2=A0 =C2=A0 =C2=A0* Starts a whole pile of threads<br>
=C2=A0 =C2=A0 =C2=A0* Sets up all name spaces<br>
=C2=A0 =C2=A0 =C2=A0* Starts child process for container and leaves it paus=
ed at image activation<br>
=C2=A0 =C2=A0 =C2=A0* exits=C2=A0 -- [ NOTE: this is our problem! ]<br>
=C2=A0 =C2=A0runc start<br>
=C2=A0 =C2=A0 =C2=A0* runs start hooks<br>
=C2=A0 =C2=A0 =C2=A0* executes &quot;continue&quot; for continue process<br=
>
<br>
=C2=A0 =C2=A0At this point when the container app exits nothing is waiting =
for it<br>
=C2=A0 =C2=A0to run any kind of hooks.<br>
<br>
--- What is the new behavior? ---<br>
<br>
=C2=A0 =C2=A0runc create<br>
=C2=A0 =C2=A0 [ NOTE: runc is started by a wrapper which sets $SIGUSR1_PARE=
NT_PID ]<br>
=C2=A0 =C2=A0 =C2=A0 * Starts a whole pile of threads<br>
=C2=A0 =C2=A0 =C2=A0 * Sets up all name spaces<br>
=C2=A0 =C2=A0 =C2=A0 * Starts child process for container and leaves it pau=
sed at image activation<br>
=C2=A0 =C2=A0 =C2=A0 * closes stdin/stderr/stdout<br>
=C2=A0 =C2=A0 =C2=A0 * Sends SIGUSR1 to wrapper process and the wrapper jus=
t exits<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 leaving &quot;runc create&quot; behind.<br>
=C2=A0 =C2=A0 =C2=A0 * waits for child process to go away<br>
=C2=A0 =C2=A0 =C2=A0 * runs stop hooks<br>
=C2=A0 =C2=A0runc start<br>
=C2=A0 =C2=A0 =C2=A0 * runs start hooks<br>
=C2=A0 =C2=A0 =C2=A0 * executes continue for the container process created =
by runc create<br>
<br>
With the patch + a wrapper for &quot;runc start&quot; we get the same behav=
ior<br>
as &quot;runc run&quot; where the stop hooks always run immediately followi=
ng<br>
the container termination.=C2=A0 This is required if you want to have event=
<br>
driven stop hooks for your overall architecture.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-runc-docker-SIGUSR1-<wbr>daemonize.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 131 +++++++++++++++++++++<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-<wbr>docker_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 132 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/runc/runc-<wbr>docker/0001-runc=
-docker-<wbr>SIGUSR1-daemonize.patch<br>
<br>
diff --git a/recipes-containers/runc/<wbr>runc-docker/0001-runc-docker-<wbr=
>SIGUSR1-daemonize.patch b/recipes-containers/runc/<wbr>runc-docker/0001-ru=
nc-docker-<wbr>SIGUSR1-daemonize.patch<br>
new file mode 100644<br>
index 0000000..b3bd068<br>
--- /dev/null<br>
+++ b/recipes-containers/runc/<wbr>runc-docker/0001-runc-docker-<wbr>SIGUSR=
1-daemonize.patch<br>
@@ -0,0 +1,131 @@<br>
+From cd7d76a6d1ecb1856f6ed666fb5c30<wbr>dc105aa94e Mon Sep 17 00:00:00 200=
1<br>
+From: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.com">jason=
.wessel@windriver.com</a>&gt;<br>
+Date: Tue, 5 Dec 2017 18:28:28 -0800<br>
+Subject: [PATCH] runc-docker: Allow &quot;run start ...&quot; to daemonize=
 with $SIGUSR1_PARENT_PID<br>
+<br>
+The runc-docker has all the code in it to properly run a stop hook if<br>
+you use it in the foreground.=C2=A0 It doesn&#39;t work in the back ground=
<br>
+because there is no way for a golang application to fork a child exit<br>
+out of the parent process because all the golang threads stay with the<br>
+parent.<br>
+<br>
+This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID<br>
+is set.<br>
+<br>
+1) The code was copied which performs the normal the signal handling<br>
+=C2=A0 =C2=A0block which is used for the foreground operation of runc.<br>
+<br>
+2) At the point where runc start would normally exit, it closes<br>
+=C2=A0 =C2=A0stdin/stdout/stderr so it would be possible to daemonize &quo=
t;runc start ...&quot;.<br>
+<br>
+3) The code to send a SIGUSR1 to the parent process was added.=C2=A0 The<b=
r>
+=C2=A0 =C2=A0idea being that a parent process would simply exit at that po=
int<br>
+=C2=A0 =C2=A0because it was blocking until runc performed everything it wa=
s<br>
+=C2=A0 =C2=A0required to perform.<br>
+<br>
+Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.c=
om">jason.wessel@windriver.com</a>&gt;<br>
+---<br>
+ signals.go=C2=A0 =C2=A0 =C2=A0| 54 ++++++++++++++++++++++++++++++<wbr>+++=
+++++++++++++++++----<br>
+ utils_linux.go |=C2=A0 2 +-<br>
+ 2 files changed, 51 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/src/import/signals.go b/src/import/signals.go<br>
+index 910ea1ee..b6a23476 100644<br>
+--- a/src/import/signals.go<br>
++++ b/src/import/signals.go<br>
+@@ -6,6 +6,7 @@ import (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;os/signal&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;syscall&quot; // only for Signal<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;strconv&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com/Sirupsen/log=
rus" rel=3D"noreferrer" target=3D"_blank">github.com/Sirupsen/logrus</a>&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://github.com/opencontaine=
rs/runc/libcontainer" rel=3D"noreferrer" target=3D"_blank">github.com/openc=
ontainers/<wbr>runc/libcontainer</a>&quot;<br>
+@@ -56,9 +57,6 @@ type signalHandler struct {<br>
+ func (h *signalHandler) forward(process *libcontainer.Process, tty *tty, =
detach bool) (int, error) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// make sure we know the pid of our main proces=
s so that we can return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// after it dies.<br>
+-=C2=A0 =C2=A0 =C2=A0 if detach &amp;&amp; h.notifySocket =3D=3D nil {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, nil<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid1, err :=3D process.Pid()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+@@ -68,12 +66,60 @@ func (h *signalHandler) forward(process *libcontainer.=
Process, tty *tty, detach<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if h.notifySocket !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if detach {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0h.notifySocket.run(pid1)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0, nil<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0go h.notifySocket.run(0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 if (detach) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // This allows the paren=
t process to daemonize this process<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // so long as stdin/stde=
rr/stdout are closed<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if envVal :=3D os.Getenv=
(&quot;SIGUSR1_PARENT_PID&quot;<wbr>); envVal !=3D &quot;&quot; {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Close stdin/stdout/stderr<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Stdin.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Stdout.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Stderr.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Notify parent to detach<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 i, err :=3D strconv.Atoi(envVal)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (err !=3D nil) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unix.Kill(i, unix.SIGUSR1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Loop waiting on the child to signal or exit,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // after which all stop hooks will be run<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for s :=3D range h.signals {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch s {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case unix.SIGCHLD:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exits, err :=3D=
 h.reap()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D nil=
 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 logrus.Error(err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for _, e :=3D r=
ange exits {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 logrus.WithFields(logrus.<wbr>Fields{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pid&quot;:=C2=A0 =C2=A0 e.p=
id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;status&quot;: e.status,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }).Debug(&quot;process exited&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if e.pid =3D=3D pid1 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // call Wait() on the process eve=
n though we already have the exit<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // status because we must ensure =
that any of the go specific process<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // fun such as flushing pipes are=
 complete before we return.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process.Wait()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if h.notifySocket !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h.not=
ifySocket.Close()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return e.status, nil<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logrus.Debugf(&=
quot;sending signal to process %s&quot;, s)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D uni=
x.Kill(pid1, s.(syscall.Signal)); err !=3D nil {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 logrus.Error(err)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0, nil<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// perform the initial tty resize.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tty.resize()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for s :=3D range h.signals {<br>
+diff --git a/src/import/utils_linux.go b/src/import/utils_linux.go<br>
+index e6d31b35..1bb80a63 100644<br>
+--- a/src/import/utils_linux.go<br>
++++ b/src/import/utils_linux.go<br>
+@@ -308,7 +308,7 @@ func (r *runner) run(config *specs.Process) (int, erro=
r) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r.terminate(process=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 if detach {<br>
++=C2=A0 =C2=A0 =C2=A0 if (detach &amp;&amp; os.Getenv(&quot;SIGUSR1_PARENT=
_PID&quot;<wbr>) =3D=3D &quot;&quot;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0, nil<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r.destroy()<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" =
rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a> b/recipes-=
containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">runc<wbr>-docker_git.bb</a><br>
index 9db48ee..f31b82e 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/dock=
er/runc.git;nobranch=3D1;name=3Drunc-docker" rel=3D"noreferrer" target=3D"_=
blank">github.com/docker/runc.<wbr>git;nobranch=3D1;name=3Drunc-<wbr>docker=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-Add-console-<wbr=
>socket-dev-null.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-correct-go-<wbr>c=
ross-compiler.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-building-<wbr=
>recvtty.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-runc-docker-<wbr>SIGU=
SR1-daemonize.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0RUNC_VERSION =3D &quot;1.0.0-rc3&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c06c6426e2e9405601d71fc--
