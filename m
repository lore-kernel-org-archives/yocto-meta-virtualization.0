Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CF81E00EF0; Fri,  2 Oct 2015 06:09:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FE4BE00D67
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Oct 2015 06:08:59 -0700 (PDT)
Received: by ykft14 with SMTP id t14so109735867ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 02 Oct 2015 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=s3P2vsUmRrqkTFUje4Bg6Ah2xOit5DwcNI6GUigkPdU=;
	b=TkUrp9DbeYRG9D1J1GeVD5kYDb73cpamm33o47Ji3pY18j/9ogdwLpqfFZ1jbqRzMF
	CDA1cG4K79+gaM/5u1MfTycCTSMHoOMzSHytfIRhzTPCRor7s1VvnxUsCTcTK7vMYZLP
	oXTDaEZVMyIO8EqYC2XwHp9yPPa2KDtHDm+jHWzeLRTeLWofg+HeVEJbtp6rhFImhUMK
	rPC+hZnTLuP5o3lIhTifLJe2V8rUKmAUwnRTto30vSLolXKnmjXwEkcbhO/MKS4SSXYA
	avWlZa0XorPMG+fHtcqYHSBIv7d/RA2ZMovp234UMo2fhCDUpU9QR55fIcSLEopAgYnp
	+2JQ==
MIME-Version: 1.0
X-Received: by 10.13.198.194 with SMTP id i185mr13197896ywd.68.1443791338785; 
	Fri, 02 Oct 2015 06:08:58 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Fri, 2 Oct 2015 06:08:58 -0700 (PDT)
In-Reply-To: <1443558318-11106-1-git-send-email-Jim.Somerville@windriver.com>
References: <1443558318-11106-1-git-send-email-Jim.Somerville@windriver.com>
Date: Fri, 2 Oct 2015 09:08:58 -0400
Message-ID: <CADkTA4Oj8LqW2GA-D9yyyntLfEOBm+qEwS5AvnDGEy2t4aXKrA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jim Somerville <Jim.Somerville@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: logs: use base filenames when reporting src files
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
X-List-Received-Date: Fri, 02 Oct 2015 13:09:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 29, 2015 at 4:25 PM, Jim Somerville
<Jim.Somerville@windriver.com> wrote:
> Problem:  Logs are nice in that they report the source file,
> routine, and line number where an issue occurs.  But the
> file is printed as the absolute filename.  Users do not
> need to see a long spew of path directory names where the package
> just happened to have been built on some host somewhere.  It
> can be confusing to anyone other than the developer.
>
> Solution:  Introduce a configure option to chop off all leading
> directories so that just the source filename ie. basename is printed.
>
> [ Upstream status:  Not needed.  These absolute filenames are a
>   consequence of poky/bitbake feeding the absolute filenames to
>   the compiler.  If you build lxc outside of poky/bitbake, just
>   the basenames are fed to the compiler. ]

merged.

Bruce

>
> Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> ---
>  ...ally-use-base-filenames-to-report-src-fil.patch | 70 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_1.1.3.bb                |  3 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/logs-optionally-use-base-filenames-to-report-src-fil.patch
>
> diff --git a/recipes-containers/lxc/files/logs-optionally-use-base-filenames-to-report-src-fil.patch b/recipes-containers/lxc/files/logs-optionally-use-base-filenames-to-report-src-fil.patch
> new file mode 100644
> index 0000000..583b6f1
> --- /dev/null
> +++ b/recipes-containers/lxc/files/logs-optionally-use-base-filenames-to-report-src-fil.patch
> @@ -0,0 +1,70 @@
> +From 4729d0f4c4d1dacd150ddfd7061dda875eb94e34 Mon Sep 17 00:00:00 2001
> +Message-Id: <4729d0f4c4d1dacd150ddfd7061dda875eb94e34.1443216870.git.Jim.Somerville@windriver.com>
> +From: Jim Somerville <Jim.Somerville@windriver.com>
> +Date: Fri, 25 Sep 2015 15:08:17 -0400
> +Subject: [PATCH 1/1] logs: optionally use base filenames to report src files
> +
> +Problem:  Logs are nice in that they report the source file,
> +routine, and line number where an issue occurs.  But the
> +file is printed as the absolute filename.  Users do not
> +need to see a long spew of path directory names where the package
> +was built.  It just confuses things.
> +
> +Solution:  Optionally chop off all leading directories so that just
> +the source filename ie. basename is printed.  This is done by
> +setting a #ifdef LXC_LOG_USE_BASENAME check in the code.  That
> +define is done via the optional --enable-log-src-basename provided
> +at configure time.
> +
> +Using __BASE_FILE__ instead of __FILE__ did not work.  It
> +refers to the file name as presented to the compile
> +machinery, and that may still be the absolute pathname to
> +the file.
> +
> +Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> +---
> + configure.ac  | 9 +++++++++
> + src/lxc/log.h | 5 +++++
> + 2 files changed, 14 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index deba90b..c1ed67b 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -357,6 +357,15 @@ AM_COND_IF([ENABLE_PYTHON],
> +       PKG_CHECK_MODULES([PYTHONDEV], [python3 >= 3.2],[],[AC_MSG_ERROR([You must install python3-dev])])
> +       AC_DEFINE_UNQUOTED([ENABLE_PYTHON], 1, [Python3 is available])])
> +
> ++# Enable basenames in the logs for source files
> ++AC_ARG_ENABLE([log-src-basename],
> ++      [AC_HELP_STRING([--enable-log-src-basename], [Use the shorter source file basename in the logs [default=no]])],
> ++      [], [enable_log_src_basename=no])
> ++
> ++if test "x$enable_log_src_basename" = "xyes"; then
> ++      AC_DEFINE([LXC_LOG_USE_BASENAME], 1, [Enabling shorter src filenames in the logs])
> ++fi
> ++
> + # Enable dumping stack traces
> + AC_ARG_ENABLE([mutex-debugging],
> +       [AC_HELP_STRING([--enable-mutex-debugging], [Makes mutexes to report error and provide stack trace [default=no]])],
> +diff --git a/src/lxc/log.h b/src/lxc/log.h
> +index 76bd4df..4365977 100644
> +--- a/src/lxc/log.h
> ++++ b/src/lxc/log.h
> +@@ -74,8 +74,13 @@ struct lxc_log_locinfo {
> +       int             line;
> + };
> +
> ++#ifdef LXC_LOG_USE_BASENAME
> ++#define LXC_LOG_LOCINFO_INIT                                          \
> ++      { .file = (strrchr(__FILE__, '/') ? strrchr(__FILE__, '/') + 1 : __FILE__), .func = __func__, .line = __LINE__  }
> ++#else
> + #define LXC_LOG_LOCINFO_INIT                                          \
> +       { .file = __FILE__, .func = __func__, .line = __LINE__  }
> ++#endif
> +
> + /* brief logging event object */
> + struct lxc_log_event {
> +--
> +1.8.3.2
> +
> diff --git a/recipes-containers/lxc/lxc_1.1.3.bb b/recipes-containers/lxc/lxc_1.1.3.bb
> index d1e80c4..e61aa6d 100644
> --- a/recipes-containers/lxc/lxc_1.1.3.bb
> +++ b/recipes-containers/lxc/lxc_1.1.3.bb
> @@ -33,6 +33,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-busybox-add-OpenSSH-support.patch \
>         file://make-some-OpenSSH-tools-optional.patch \
>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
> +       file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
>         "
>
>  SRC_URI[md5sum] = "197abb5a28ab0b689c737eb1951023fb"
> @@ -49,6 +50,8 @@ EXTRA_OECONF += "--with-init-script=\
>  ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit,', '', d)}\
>  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
>
> +EXTRA_OECONF += "--enable-log-src-basename"
> +
>  PACKAGECONFIG ??= "templates \
>      ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>  "
> --
> 1.8.3.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

