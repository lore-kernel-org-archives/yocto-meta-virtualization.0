Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 38A94E006E9; Tue, 10 Mar 2015 10:18:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.181 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FDB4E003A8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Mar 2015 10:18:38 -0700 (PDT)
Received: by lbjf15 with SMTP id f15so3327096lbj.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Mar 2015 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=d4yNvmyYpdVfWoRgjvrFY7JBbxpDFoynKFNNvlVB/KY=;
	b=Vyu5HMCU6wGMkWKovk5KvlQLhXzVHymVAm7WGpKwnlkgo4q2AY+9fMjB4gO2gWjKQh
	2ZIRH7Idosq0Lj4S+YWbG59zoKVjeF6yfzhf3F8nBedX2k1hO25Ct/XHyLm3givjXBxc
	eVwoF3m6TctKsJ5wMGiAagzSXlKBGVpmfI+5Q6BIERKQ8OnYdBr2hYzBt54L4jMZrjAm
	fqqjAuUwfJSln3oTadSr30FzzNKAYgUQ0U/rOcHuGRxltP9fEYQV28wex1dgufx8mwrX
	jSpHmDfHO1rZ79tA+hKi41hWCmkXhdrr01Y1fXtFqf4mJLf8vvvoWDQU4Vh0ghYXgieZ
	ckBA==
MIME-Version: 1.0
X-Received: by 10.152.27.232 with SMTP id w8mr26696037lag.51.1426007916407;
	Tue, 10 Mar 2015 10:18:36 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 10 Mar 2015 10:18:36 -0700 (PDT)
In-Reply-To: <1425983283-32754-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1425983283-32754-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Tue, 10 Mar 2015 13:18:36 -0400
Message-ID: <CADkTA4OD6B8f6mGoubyO=_c=sSxgxv3r8OXtkEgzVwnYyyiqZA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: fix reboot for Busybox containers
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
X-List-Received-Date: Tue, 10 Mar 2015 17:18:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 6:28 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Busybox powered containers rely on a different signal for reboot - SIGTERM,
> rather than the default SIGINT.
>
> Apply the upstream support adding the infrastructure for defining a custom
> reboot signal for a container, and default this signal to SIGTERM for Busybox
> containers.  The original patches have been applied on the upstream master LXC
> branch, and required a minor backport.

Thanks. I've merged the patch, but have left the two seccomp patches until we
resolve the packageconfig question.

Bruce

>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  .../lxc/files/add-lxc.rebootsignal.patch           |  96 ++++++++++++++
>  .../lxc/files/document-lxc.rebootsignal.patch      | 140 +++++++++++++++++++++
>  .../lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch |  31 +++++
>  recipes-containers/lxc/lxc_1.0.7.bb                |   3 +
>  4 files changed, 270 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/add-lxc.rebootsignal.patch
>  create mode 100644 recipes-containers/lxc/files/document-lxc.rebootsignal.patch
>  create mode 100644 recipes-containers/lxc/files/lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch
>
> diff --git a/recipes-containers/lxc/files/add-lxc.rebootsignal.patch b/recipes-containers/lxc/files/add-lxc.rebootsignal.patch
> new file mode 100644
> index 0000000..e54d188
> --- /dev/null
> +++ b/recipes-containers/lxc/files/add-lxc.rebootsignal.patch
> @@ -0,0 +1,96 @@
> +From dd267776ee265737520c2c661a51c2d29cf43cb0 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Mon, 16 Feb 2015 09:38:34 +0000
> +Subject: [PATCH 10/12] add lxc.rebootsignal
> +
> +Following the model of f0f1d8c076ae93d8ecf735c2eeae471e27ca6abd, add a reboot
> +signal for special init processes that work on something other than SIGINT.
> +
> +Upstream-Status: Accepted
> +[https://github.com/lxc/lxc/commit/dd267776ee265737520c2c661a51c2d29cf43cb0]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> +---
> + src/lxc/conf.h         |  1 +
> + src/lxc/confile.c      | 14 ++++++++++++++
> + src/lxc/lxccontainer.c |  5 ++++-
> + 3 files changed, 19 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lxc/conf.h b/src/lxc/conf.h
> +index afa5517..334ea70 100644
> +--- a/src/lxc/conf.h
> ++++ b/src/lxc/conf.h
> +@@ -323,6 +323,7 @@ struct lxc_conf {
> +       int maincmd_fd;
> +       int autodev;  // if 1, mount and fill a /dev at start
> +       int haltsignal; // signal used to halt container
> ++      int rebootsignal; // signal used to reboot container
> +       int stopsignal; // signal used to hard stop container
> +       int kmsg;  // if 1, create /dev/kmsg symlink
> +       char *rcfile;   // Copy of the top level rcfile we read
> +diff --git a/src/lxc/confile.c b/src/lxc/confile.c
> +index 8544ac9..42d42e5 100644
> +--- a/src/lxc/confile.c
> ++++ b/src/lxc/confile.c
> +@@ -98,6 +98,7 @@ static int config_includefile(const char *, const char *, struct lxc_conf *);
> + static int config_network_nic(const char *, const char *, struct lxc_conf *);
> + static int config_autodev(const char *, const char *, struct lxc_conf *);
> + static int config_haltsignal(const char *, const char *, struct lxc_conf *);
> ++static int config_rebootsignal(const char *, const char *, struct lxc_conf *);
> + static int config_stopsignal(const char *, const char *, struct lxc_conf *);
> + static int config_start(const char *, const char *, struct lxc_conf *);
> + static int config_group(const char *, const char *, struct lxc_conf *);
> +@@ -158,6 +159,7 @@ static struct lxc_config_t config[] = {
> +       { "lxc.include",              config_includefile          },
> +       { "lxc.autodev",              config_autodev              },
> +       { "lxc.haltsignal",           config_haltsignal           },
> ++      { "lxc.rebootsignal",         config_rebootsignal         },
> +       { "lxc.stopsignal",           config_stopsignal           },
> +       { "lxc.start.auto",           config_start                },
> +       { "lxc.start.delay",          config_start                },
> +@@ -1268,6 +1270,18 @@ static int config_haltsignal(const char *key, const char *value,
> +       return 0;
> + }
> +
> ++static int config_rebootsignal(const char *key, const char *value,
> ++                           struct lxc_conf *lxc_conf)
> ++{
> ++      int sig_n = sig_parse(value);
> ++
> ++      if (sig_n < 0)
> ++              return -1;
> ++      lxc_conf->rebootsignal = sig_n;
> ++
> ++      return 0;
> ++}
> ++
> + static int config_stopsignal(const char *key, const char *value,
> +                         struct lxc_conf *lxc_conf)
> + {
> +diff --git a/src/lxc/lxccontainer.c b/src/lxc/lxccontainer.c
> +index e02ee93..4422f4a 100644
> +--- a/src/lxc/lxccontainer.c
> ++++ b/src/lxc/lxccontainer.c
> +@@ -1363,6 +1363,7 @@ free_tpath:
> + static bool lxcapi_reboot(struct lxc_container *c)
> + {
> +       pid_t pid;
> ++      int rebootsignal = SIGINT;
> +
> +       if (!c)
> +               return false;
> +@@ -1371,7 +1372,9 @@ static bool lxcapi_reboot(struct lxc_container *c)
> +       pid = c->init_pid(c);
> +       if (pid <= 0)
> +               return false;
> +-      if (kill(pid, SIGINT) < 0)
> ++      if (c->lxc_conf && c->lxc_conf->rebootsignal)
> ++              rebootsignal = c->lxc_conf->rebootsignal;
> ++      if (kill(pid, rebootsignal) < 0)
> +               return false;
> +       return true;
> +
> +--
> +2.1.4
> +
> diff --git a/recipes-containers/lxc/files/document-lxc.rebootsignal.patch b/recipes-containers/lxc/files/document-lxc.rebootsignal.patch
> new file mode 100644
> index 0000000..d1cce40
> --- /dev/null
> +++ b/recipes-containers/lxc/files/document-lxc.rebootsignal.patch
> @@ -0,0 +1,140 @@
> +From baefc2176780b5e4527c1f86206c0ea72d80c8f5 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Tue, 10 Mar 2015 10:06:58 +0000
> +Subject: [PATCH] document lxc.rebootsignal
> +
> +Also fix some minor indentation mishaps since we're here.
> +
> +Upstrem-Status: Backport [from LXC 1.1]
> +[https://github.com/lxc/lxc/commit/936762f3fb6cf10e0756719f03aebe052d5c31a8]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> +---
> + doc/lxc-stop.sgml.in           |  4 +-
> + doc/lxc.container.conf.sgml.in | 86 ++++++++++++++++++++++++++----------------
> + 2 files changed, 57 insertions(+), 33 deletions(-)
> +
> +diff --git a/doc/lxc-stop.sgml.in b/doc/lxc-stop.sgml.in
> +index bc5e6a8..3c69fed 100644
> +--- a/doc/lxc-stop.sgml.in
> ++++ b/doc/lxc-stop.sgml.in
> +@@ -70,7 +70,9 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> +       the container's init process, waiting up to 60 seconds for the container
> +       to exit, and then returning. If the container fails to cleanly exit in
> +       60 seconds, it will be sent the <command>lxc.stopsignal</command>
> +-      (defaults to SIGKILL) to force it to shut down.
> ++      (defaults to SIGKILL) to force it to shut down. A request to reboot will
> ++      send the <command>lxc.rebootsignal</command> (defaults to SIGINT) to the
> ++      container's init process.
> +     </para>
> +       <para>
> +       The <optional>-W</optional>, <optional>-r</optional>,
> +diff --git a/doc/lxc.container.conf.sgml.in b/doc/lxc.container.conf.sgml.in
> +index e98496d..1962528 100644
> +--- a/doc/lxc.container.conf.sgml.in
> ++++ b/doc/lxc.container.conf.sgml.in
> +@@ -158,46 +158,68 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> +     <refsect2>
> +       <title>Halt signal</title>
> +       <para>
> +-    Allows one to specify signal name or number, sent by lxc-stop to the
> +-    container's init process to cleanly shutdown the container. Different
> +-    init systems could use different signals to perform clean shutdown
> +-    sequence. This option allows the signal to be specified in kill(1)
> +-    fashion, e.g. SIGPWR, SIGRTMIN+14, SIGRTMAX-10 or plain number. The
> +-    default signal is SIGPWR.
> ++        Allows one to specify signal name or number, sent by lxc-stop to the
> ++        container's init process to cleanly shutdown the container. Different
> ++        init systems could use different signals to perform clean shutdown
> ++        sequence. This option allows the signal to be specified in kill(1)
> ++        fashion, e.g. SIGPWR, SIGRTMIN+14, SIGRTMAX-10 or plain number. The
> ++        default signal is SIGPWR.
> +       </para>
> +       <variablelist>
> +-    <varlistentry>
> +-      <term>
> +-        <option>lxc.haltsignal</option>
> +-      </term>
> +-      <listitem>
> +-        <para>
> +-          specify the signal used to halt the container
> +-        </para>
> +-      </listitem>
> +-    </varlistentry>
> ++        <varlistentry>
> ++          <term>
> ++            <option>lxc.haltsignal</option>
> ++          </term>
> ++          <listitem>
> ++            <para>
> ++              specify the signal used to halt the container
> ++            </para>
> ++          </listitem>
> ++        </varlistentry>
> ++      </variablelist>
> ++    </refsect2>
> ++
> ++    <refsect2>
> ++      <title>Reboot signal</title>
> ++      <para>
> ++        Allows one to specify signal name or number, sent by lxc-stop to
> ++        reboot the container. This option allows signal to be specified in
> ++        kill(1) fashion, e.g. SIGTERM, SIGRTMIN+14, SIGRTMAX-10 or plain number.
> ++        The default signal is SIGINT.
> ++          </para>
> ++          <variablelist>
> ++        <varlistentry>
> ++          <term>
> ++            <option>lxc.rebootsignal</option>
> ++          </term>
> ++          <listitem>
> ++            <para>
> ++              specify the signal used to reboot the container
> ++            </para>
> ++          </listitem>
> ++        </varlistentry>
> +       </variablelist>
> +     </refsect2>
> +
> +     <refsect2>
> +       <title>Stop signal</title>
> +       <para>
> +-    Allows one to specify signal name or number, sent by lxc-stop to forcibly
> +-    shutdown the container. This option allows signal to be specified in
> +-    kill(1) fashion, e.g. SIGKILL, SIGRTMIN+14, SIGRTMAX-10 or plain number.
> +-    The default signal is SIGKILL.
> +-      </para>
> +-      <variablelist>
> +-    <varlistentry>
> +-      <term>
> +-        <option>lxc.stopsignal</option>
> +-      </term>
> +-      <listitem>
> +-        <para>
> +-          specify the signal used to stop the container
> +-        </para>
> +-      </listitem>
> +-    </varlistentry>
> ++        Allows one to specify signal name or number, sent by lxc-stop to forcibly
> ++        shutdown the container. This option allows signal to be specified in
> ++        kill(1) fashion, e.g. SIGKILL, SIGRTMIN+14, SIGRTMAX-10 or plain number.
> ++        The default signal is SIGKILL.
> ++          </para>
> ++          <variablelist>
> ++        <varlistentry>
> ++          <term>
> ++            <option>lxc.stopsignal</option>
> ++          </term>
> ++          <listitem>
> ++            <para>
> ++              specify the signal used to stop the container
> ++            </para>
> ++          </listitem>
> ++        </varlistentry>
> +       </variablelist>
> +     </refsect2>
> +
> +--
> +2.1.4
> +
> diff --git a/recipes-containers/lxc/files/lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch b/recipes-containers/lxc/files/lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch
> new file mode 100644
> index 0000000..2f4513e
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch
> @@ -0,0 +1,31 @@
> +From 22fb28a946397ec19b247efe170c15b263bf89af Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Mon, 16 Feb 2015 09:38:36 +0000
> +Subject: [PATCH 12/12] lxc-busybox: use lxc.rebootsignal = SIGTERM
> +
> +Otherwise lxc-stop -r has no effect on the container.
> +
> +Upstream-Status: Accepted
> +[https://github.com/lxc/lxc/commit/22fb28a946397ec19b247efe170c15b263bf89af]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> +---
> + templates/lxc-busybox.in | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index 72531d6..7e05bd6 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -270,6 +270,7 @@ copy_configuration()
> + grep -q "^lxc.rootfs" $path/config 2>/dev/null || echo "lxc.rootfs = $rootfs" >> $path/config
> + cat <<EOF >> $path/config
> + lxc.haltsignal = SIGUSR1
> ++lxc.rebootsignal = SIGTERM
> + lxc.utsname = $name
> + lxc.tty = 1
> + lxc.pts = 1
> +--
> +2.1.4
> +
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
> index ecad31c..c618c84 100644
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
> @@ -26,6 +26,9 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://runtest.patch \
>         file://run-ptest \
>         file://automake-ensure-VPATH-builds-correctly.patch \
> +       file://add-lxc.rebootsignal.patch \
> +       file://document-lxc.rebootsignal.patch \
> +       file://lxc-busybox-use-lxc.rebootsignal-SIGTERM.patch \
>         "
>
>  SRC_URI[md5sum] = "b48f468a9bef0e4e140dd723f0a65ad0"
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

