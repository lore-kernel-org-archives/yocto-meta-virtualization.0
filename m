Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 429BFE00D55; Sun, 10 Dec 2017 19:39:00 -0800 (PST)
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
	*      [209.85.216.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8982BE00CD3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 10 Dec 2017 19:38:58 -0800 (PST)
Received: by mail-qt0-f181.google.com with SMTP id d4so35203630qtj.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 10 Dec 2017 19:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KsvLdwuuynsuKiP6217mkXMMIyBtfvGIt3LESjo48HQ=;
	b=GW+6GHF9gTJnDDseZdKCVrHjAqYJS8R8nnSFYeJQMG8tUTaqUZFTu4PGWmEGURjHMv
	wyJvNbJL2po2NimhNbjtvGEX6kn4U2KKfH+w6o7+5yiwgEaq1kO5OC+2RPtoJpoH/NcA
	SRGzXTORGeckOUDFY88tMXUMbjy12RHaxO/3FsGMvQ61Je4ZWC5EqCfzVcBrE85K8FQR
	MziuA6EyZsh+CP6Wv5AsOw/wc24NJQEsr2kaFrZQvKcrT2o0Flps5thoJMbwjfo5vgI1
	n5wtN0EYcg3NU3XNRQK8oh2J1kGJEzTodt09Umx60Kpn9jticts3mbgQ7nXpjHJpG26B
	+lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KsvLdwuuynsuKiP6217mkXMMIyBtfvGIt3LESjo48HQ=;
	b=iD9596CxJphq8iXU+Vg/roUTZ2WSWyq9DcEsYbSTcVXOOmul53175oU5jmGwQdOih3
	oi8rJpC/Mq3ZHmWOojvU2s9HQad3r0EhgyJUUtlc0O8eqDnKjBcUVINIAN5GO6dTKqkU
	usQ1b74D2p6IsABgUt5S9+KdD00WB4CoaeszK1RMqd1FMGtsvZy1LUi7/pfiGdWApEwV
	XG49XbtePRejFr0j4nhkaQuqnK85qiefaF5Bxp/CIbZVnaJxy6RpK5Jtpcxq+79iTITD
	l09uBUSF7qWBvoIuKBRs9zty8LR+Zd5wK9S59R4EpKVOYofpVw9PGHx2WfyuIrNywtec
	4JJg==
X-Gm-Message-State: AKGB3mI3XoshX7YzDZHpaUXR+yPxu88aZ0yYXKObQwYVP1QeKJXLTpx0
	3JQHAv7K+zA0Jt92G3ObFS205Ahh4m2ZZi0FanI=
X-Google-Smtp-Source: AGs4zMbEJsarSLCQyE8T2XWno+7yUT+OrSr9G4SESLdB2NDElIOJpyv7n7cM30gG0pmtjnIGBs8Jj/H6RVfjA/h1qzk=
X-Received: by 10.55.181.1 with SMTP id e1mr42994464qkf.19.1512963537318; Sun,
	10 Dec 2017 19:38:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 10 Dec 2017 19:38:56 -0800 (PST)
In-Reply-To: <20171208155344.17795-1-jason.wessel@windriver.com>
References: <20171208155344.17795-1-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Dec 2017 22:38:56 -0500
Message-ID: <CADkTA4PiWLRexnWEM6uZYdoEiyPSg+KGq=36evAvtQm24gYVOQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Dec 2017 03:39:00 -0000
Content-Type: multipart/alternative; boundary="94eb2c06c6423338810560084607"

--94eb2c06c6423338810560084607
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 8, 2017 at 10:53 AM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> The runc-docker has all the code in it to properly run a stop hook if
> you use it in the foreground.  It doesn't work in the back ground
> because there is no way for a golang application to fork a child exit
> out of the parent process because all the golang threads stay with the
> parent.
>

Can you define background for the commit log purposes ? Is it a container
that allocates a tty and detaches from the current terminal ? Something
else ?

Also why does the threads staying with the parent mean the stop hooks
don't run. That isn't clear to me. Is it due to lack of notification if
they exit ?


>
> This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID
> is set.
>

Where do you see that environment variable being set ? In the config.json ?
Somewhere else ? (i.e. the launching environment).


>
> 1) The code was copied which performs the normal the signal handling
>    block which is used for the foreground operation of runc.
>
> 2) At the point where runc start would normally exit, it closes
>    stdin/stdout/stderr so it would be possible to daemonize "runc start
> ...".
>

I can't say I completely follow point #2. Maybe it is with me not having
looked at what is required to daemonize for a loooong time.

See one question on the patch below.


> 3) The code to send a SIGUSR1 to the parent process was added.  The
>    idea being that a parent process would simply exit at that point
>    because it was blocking until runc performed everything it was
>    required to perform.
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
>

So all the code below here is the copied block and it deals with the
normal exit ? i.e. is it shutting the container down ?

The reason I ask, is that I thought this block of code was running on
startup, when the container first detaches .. and it didn't make sense
in that context.

Bruce


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

--94eb2c06c6423338810560084607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Dec 8, 2017 at 10:53 AM, Jason Wessel <span dir=3D"ltr">&lt;<a =
href=3D"mailto:jason.wessel@windriver.com" target=3D"_blank">jason.wessel@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The ru=
nc-docker has all the code in it to properly run a stop hook if<br>
you use it in the foreground.=C2=A0 It doesn&#39;t work in the back ground<=
br>
because there is no way for a golang application to fork a child exit<br>
out of the parent process because all the golang threads stay with the<br>
parent.<br></blockquote><div><br></div><div>Can you define background for t=
he commit log purposes ? Is it a container</div><div>that allocates a tty a=
nd detaches from the current terminal ? Something</div><div>else ?</div><di=
v><br></div><div>Also why does the threads staying with the parent mean the=
 stop hooks</div><div>don&#39;t run. That isn&#39;t clear to me. Is it due =
to lack of notification if they exit ?</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
This patch has three parts that happen ONLY when $SIGUSR1_PARENT_PID<br>
is set.<br></blockquote><div><br></div><div>Where do you see that environme=
nt variable being set ? In the config.json ?</div><div>Somewhere else ? (i.=
e. the launching environment).</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
1) The code was copied which performs the normal the signal handling<br>
=C2=A0 =C2=A0block which is used for the foreground operation of runc.<br>
<br>
2) At the point where runc start would normally exit, it closes<br>
=C2=A0 =C2=A0stdin/stdout/stderr so it would be possible to daemonize &quot=
;runc start ...&quot;.<br></blockquote><div><br></div><div>I can&#39;t say =
I completely follow point #2. Maybe it is with me not having</div><div>look=
ed at what is required to daemonize for a loooong time.=C2=A0</div><div><br=
></div><div>See one question on the patch below.</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
3) The code to send a SIGUSR1 to the parent process was added.=C2=A0 The<br=
>
=C2=A0 =C2=A0idea being that a parent process would simply exit at that poi=
nt<br>
=C2=A0 =C2=A0because it was blocking until runc performed everything it was=
<br>
=C2=A0 =C2=A0required to perform.<br>
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
=A0 }<br></blockquote><div><br></div><div>So all the code below here is the=
 copied block and it deals with the</div><div>normal exit ? i.e. is it shut=
ting the container down ?</div><div><br></div><div>The reason I ask, is tha=
t I thought this block of code was running on</div><div>startup, when the c=
ontainer first detaches .. and it didn&#39;t make sense</div><div>in that c=
ontext.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
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
</div></div>

--94eb2c06c6423338810560084607--
