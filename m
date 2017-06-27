Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF090E00B76; Tue, 27 Jun 2017 10:26:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	NORMAL_HTTP_TO_IP, 
	RCVD_IN_DNSWL_NONE,WEIRD_PORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.54 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* 0.0 NORMAL_HTTP_TO_IP URI: URI host has a public dotted-decimal IPv4
	*      address
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18075E00B2F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:25:57 -0700 (PDT)
Received: by mail-lf0-f54.google.com with SMTP id l13so21277854lfl.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Jun 2017 10:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2n6PNhsY9yFxcA82JFlxU4aYVtqMmHvc4VPKfZd3Jnc=;
	b=D7H3JFNvemFeku2G0ZvIq5IYzsCR1NgNAExHsDTfng92fejO7lmHhpTrPKU5Tgv41g
	kxrvs6EjDCpCH0ZHqeXzjlUarkQIps9qdjIuBjjUK5ifyuYhSOxH2MQ8iW0sUmW4WFar
	nlVoblGozGdZDTMT3CeLCYNNlxCTdwsYujqiPkOLXBxYFFJ1sQmuJHOA1FwzLivJfDn+
	dSd1bkqzBZpdcaPB6hjRqtmX1vXE/5NdaQ26XrCrue+Zvpzp7pNSTFc1H1FvL/vg80LH
	/vfREmwuYjyEScm9gIiZBhJdQu/xxNStUU8st/zkvSeLmhBL6DgC3RhrfAo0Mb2uk5p/
	2SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2n6PNhsY9yFxcA82JFlxU4aYVtqMmHvc4VPKfZd3Jnc=;
	b=jPFqnbkgStHIKEKNEXE/OXhCxIx/5sZmalFWURGMNqqSdW4DSx1aSIWkuZZ6XAUBEK
	13u9dWLt4rincSKKNEvfN2BGrQYzhTcG1xekQ5uHotdQ1UayKp2uPQtYJehWgOWyZZJe
	kRDLDnOZQzCjWLO+DEJCJbpKt2OUTWVnDVLBl15gMs4+O2hWhs/CqHqTK7uwNBEW5lFH
	FtzpJB6FTFARMxI0zWl4T4u/R9+vpQVyNFYgWTNL5aW2TAZwteniU4j7UGHheCGS+9Q6
	YiZH7Z5jDeilLOwvFs6vQpafRcz6mgNJxoO6rFyrhMdd7ZTJ8fh4bUvA6TOPC5FlYByu
	F6iA==
X-Gm-Message-State: AKS2vOx1TuPZ78CEngWKfQYhmQOqVgSzlZP8SiGQnYSArcIS6g6JH8yo
	6Jl72J5i+AXPHR2nSuad5vbUsr7IKw==
X-Received: by 10.25.27.2 with SMTP id b2mr1897136lfb.24.1498584356696; Tue,
	27 Jun 2017 10:25:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Tue, 27 Jun 2017 10:25:55 -0700 (PDT)
In-Reply-To: <1498523199-15721-1-git-send-email-yi.zhao@windriver.com>
References: <1498523199-15721-1-git-send-email-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Jun 2017 13:25:55 -0400
Message-ID: <CADkTA4M_4Kv8uW9B-vao8GAEXzGaL80NPyLLm9s576S2+ky2JA@mail.gmail.com>
To: yi.zhao@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [PATCH] diod: add new recipe
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
X-List-Received-Date: Tue, 27 Jun 2017 17:26:01 -0000
Content-Type: multipart/alternative; boundary="001a1140244c3f3bab0552f45c51"

--001a1140244c3f3bab0552f45c51
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Jun 26, 2017 at 8:26 PM, <yi.zhao@windriver.com> wrote:

> From: Yi Zhao <yi.zhao@windriver.com>
>
> diod is a multi-threaded, user space file server that speaks 9P2000.L
> protocol.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  recipes-extended/diod/diod_1.0.24.bb               |  32 ++++++
>  ...ow-builds-to-work-with-separate-build-dir.patch | 126
> +++++++++++++++++++++
>  .../files/0002-auto.diod.in-remove-bashisms.patch  |  47 ++++++++
>  recipes-extended/diod/files/diod                   |  75 ++++++++++++
>  recipes-extended/diod/files/diod.conf              |  15 +++
>  5 files changed, 295 insertions(+)
>  create mode 100644 recipes-extended/diod/diod_1.0.24.bb
>  create mode 100644 recipes-extended/diod/files/
> 0001-build-allow-builds-to-work-with-separate-build-dir.patch
>  create mode 100644 recipes-extended/diod/files/0002-auto.diod.in-remove-
> bashisms.patch
>  create mode 100644 recipes-extended/diod/files/diod
>  create mode 100644 recipes-extended/diod/files/diod.conf
>
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/
> diod_1.0.24.bb
> new file mode 100644
> index 0000000..a4d159a
> --- /dev/null
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Diod is a user space server for the kernel v9fs client."
> +DESCRIPTION = "\
> +Diod is a user space server for the kernel v9fs client (9p.ko, 9pnet.ko).
> \
> +Although the kernel client supports several 9P variants, diod only
> supports \
> +9P2000.L, and only in its feature-complete form, as it appeared in
> 2.6.38."
> +SECTION = "console/network"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +PV = "1.0.24+git${SRCPV}"
> +SRCREV = "0ea3fe3d829b5085307cd27a512708d99ef48199"
> +SRC_URI = "git://github.com/chaos/diod.git;protocol=git \
> +           file://diod \
> +           file://diod.conf \
> +           file://0001-build-allow-builds-to-work-with-separate-build-dir.patch
> \
> +           file://0002-auto.diod.in-remove-bashisms.patch \
> +          "
> +DEPENDS = "libcap ncurses tcp-wrappers lua"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools systemd
> +
> +do_install_append () {
> +        # install our init based on start-stop-daemon
> +        install -D -m 0755 ${WORKDIR}/diod ${D}${sysconfdir}/init.d/diod
> +        # install a real(not commented) configuration file for diod
> +        install -m 0644 ${WORKDIR}/diod.conf ${D}${sysconfdir}/diod.conf
> +}
> +
> +FILES_${PN} += "${systemd_unitdir}"
> diff --git a/recipes-extended/diod/files/0001-build-allow-builds-to-
> work-with-separate-build-dir.patch b/recipes-extended/diod/files/
> 0001-build-allow-builds-to-work-with-separate-build-dir.patch
> new file mode 100644
> index 0000000..f40e0eb
> --- /dev/null
> +++ b/recipes-extended/diod/files/0001-build-allow-builds-to-
> work-with-separate-build-dir.patch
> @@ -0,0 +1,126 @@
> +From 43403468298ef4167baa5d84de2ee2eaf7f4007a Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Fri, 9 Jan 2015 18:34:04 +0000
> +Subject: [PATCH 1/2] build: allow builds to work with separate build dir
> +
> +Remove assumptions in include paths that assume the build
> +is happening in the source directories.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + diod/Makefile.am              | 2 +-
> + libdiod/Makefile.am           | 2 +-
> + liblsd/Makefile.am            | 2 +-
> + libnpclient/Makefile.am       | 2 +-
> + scripts/Makefile.am           | 6 +++---
> + tests/kern/dbench/Makefile.am | 4 ++--
> + utils/Makefile.am             | 2 +-
> + 7 files changed, 10 insertions(+), 10 deletions(-)
> +
> +diff --git a/diod/Makefile.am b/diod/Makefile.am
> +index 7644be7..fdaf130 100644
> +--- a/diod/Makefile.am
> ++++ b/diod/Makefile.am
> +@@ -1,7 +1,7 @@
> + AM_CFLAGS = @GCCWARN@
> +
> + AM_CPPFLAGS = \
> +-      -I../libnpfs -I../liblsd -I../libdiod
> ++      -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(srcdir)/../libdiod
> +
> + sbin_PROGRAMS = diod
> +
> +diff --git a/libdiod/Makefile.am b/libdiod/Makefile.am
> +index 4810e14..6905cdd 100644
> +--- a/libdiod/Makefile.am
> ++++ b/libdiod/Makefile.am
> +@@ -1,7 +1,7 @@
> + AM_CFLAGS = @GCCWARN@
> +
> + AM_CPPFLAGS = \
> +-      -I../libnpfs -I../libnpclient -I../liblsd
> ++      -I$(srcdir)/../libnpfs -I$(srcdir)/../libnpclient
> -I$(srcdir)/../liblsd
> +
> + noinst_LIBRARIES = libdiod.a
> +
> +diff --git a/liblsd/Makefile.am b/liblsd/Makefile.am
> +index c3e5658..7e18bf8 100644
> +--- a/liblsd/Makefile.am
> ++++ b/liblsd/Makefile.am
> +@@ -1,6 +1,6 @@
> + AM_CFLAGS = @GCCWARN@
> +
> +-AM_CPPFLAGS = -I../libdiod
> ++AM_CPPFLAGS = -I$(srcdir)/../libdiod
> +
> + noinst_LIBRARIES = liblsd.a
> +
> +diff --git a/libnpclient/Makefile.am b/libnpclient/Makefile.am
> +index 5305df9..cbaf266 100644
> +--- a/libnpclient/Makefile.am
> ++++ b/libnpclient/Makefile.am
> +@@ -1,7 +1,7 @@
> + AM_CFLAGS = @GCCWARN@
> +
> + AM_CPPFLAGS = \
> +-      -I../libnpfs
> ++      -I$(srcdir)/../libnpfs
> +
> + noinst_LIBRARIES = libnpclient.a
> +
> +diff --git a/scripts/Makefile.am b/scripts/Makefile.am
> +index 51c24a3..2aba728 100644
> +--- a/scripts/Makefile.am
> ++++ b/scripts/Makefile.am
> +@@ -1,9 +1,9 @@
> +-systemddir=$(sysconfdir)/systemd/system
> ++systemddir=/lib/systemd/system
> +
> + install-data-local:
> +-      $(top_srcdir)/config/install-sh -m 755 $(srcdir)/auto.diod \
> ++      $(top_srcdir)/config/install-sh -m 755 ./auto.diod \
> +               $(DESTDIR)$(sysconfdir)/auto.diod
> +-      $(top_srcdir)/config/install-sh -m 755 $(srcdir)/diod.service \
> ++      $(top_srcdir)/config/install-sh -m 644 ./diod.service \
> +               $(DESTDIR)$(systemddir)/diod.service
> +
> + uninstall-local:
> +diff --git a/tests/kern/dbench/Makefile.am b/tests/kern/dbench/Makefile.
> am
> +index e0cdefa..1704f9f 100644
> +--- a/tests/kern/dbench/Makefile.am
> ++++ b/tests/kern/dbench/Makefile.am
> +@@ -2,7 +2,7 @@ AM_CFLAGS = -w
> +
> + # VERSION=4.00
> +
> +-AM_CPPFLAGS = -DDATADIR=\"$(X_DATADIR)\"
> ++AM_CPPFLAGS = -I. -DDATADIR=\"$(X_DATADIR)\"
> +
> + LDADD = $(LIBPOPT)
> +
> +@@ -25,6 +25,6 @@ BUILT_SOURCES = proto.h
> + CLEANFILES = proto.h
> +
> + proto.h: $(dbench_SOURCES) mkproto.pl
> +-      perl mkproto.pl $(dbench_SOURCES) > proto.h
> ++      $(srcdir)/mkproto.pl $(patsubst %,$(srcdir),$(dbench_SOURCES)) >
> proto.h
> +
> + EXTRA_DIST = mkproto.pl
> +diff --git a/utils/Makefile.am b/utils/Makefile.am
> +index 169b6c4..91d571d 100644
> +--- a/utils/Makefile.am
> ++++ b/utils/Makefile.am
> +@@ -1,7 +1,7 @@
> + AM_CFLAGS = @GCCWARN@
> +
> + AM_CPPFLAGS = \
> +-      -I../libnpfs -I../liblsd -I../libdiod -I../libnpclient
> ++      -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd
> -I$(srcdir)/../libdiod -I$(srcdir)/../libnpclient
> +
> + sbin_PROGRAMS = diodmount diodcat dtop diodload diodls diodshowmount
> dioddate
> +
> +--
> +2.11.0
> +
> diff --git a/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
> b/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
> new file mode 100644
> index 0000000..65d6ff6
> --- /dev/null
> +++ b/recipes-extended/diod/files/0002-auto.diod.in-remove-bashisms.patch
> @@ -0,0 +1,47 @@
> +From 5a9e09dc5de833db11607530351cd87cecbfd17e Mon Sep 17 00:00:00 2001
> +From: Roy Li <rongqing.li@windriver.com>
> +Date: Thu, 22 Jun 2017 06:32:30 +0000
> +Subject: [PATCH 2/2] auto.diod.in: remove bashisms
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + scripts/auto.diod.in | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/scripts/auto.diod.in b/scripts/auto.diod.in
> +index f63e004..4d5fc3a 100755
> +--- a/scripts/auto.diod.in
> ++++ b/scripts/auto.diod.in
> +@@ -1,4 +1,4 @@
> +-#!/bin/bash
> ++#!/bin/sh
> + #
> + # auto.diod - executable automounter map for diod file systems
> + #
> +@@ -41,15 +41,15 @@ dcatopts="${DIOD_TIMEOUT:+-t $DIOD_TIMEOUT}"
> + for server in $DIOD_SERVERS; do
> +     $DIOD_DIODCAT -s $server $dcatopts exports | awk '{print $1}' |\
> +     while read path; do
> +-        if [ "$path" == "/" ]; then
> +-            if [ "$key" == "ROOT" ]; then
> ++        if [ "$path" = "/" ]; then
> ++            if [ "$key" = "ROOT" ]; then
> +                 echo "$prefix $server:$path"
> +                 exit 0
> +             fi
> +-        elif [ "$key" == "$(echo $path|sed -e's/^\///' -e's/\//./g')" ] \
> +-          || [ "$key" == "$(echo $path|sed -e's/^\///' -e's/\//_/g')" ] \
> +-          || [ "$key" == "$(echo $path|sed -e's/^\///' -e's/\//-/g')" ] \
> +-          || [ "$key" == "$(basename $path)" ]; then
> ++        elif [ "$key" = "$(echo $path|sed -e's/^\///' -e's/\//./g')" ] \
> ++          || [ "$key" = "$(echo $path|sed -e's/^\///' -e's/\//_/g')" ] \
> ++          || [ "$key" = "$(echo $path|sed -e's/^\///' -e's/\//-/g')" ] \
> ++          || [ "$key" = "$(basename $path)" ]; then
> +             echo "$prefix $server:$path"
> +             exit 0
> +         fi
> +--
> +2.11.0
> +
> diff --git a/recipes-extended/diod/files/diod
> b/recipes-extended/diod/files/diod
> new file mode 100644
> index 0000000..cd0bf98
> --- /dev/null
> +++ b/recipes-extended/diod/files/diod
> @@ -0,0 +1,75 @@
> +#!/bin/sh
> +#
> +# chkconfig: 35 20 80
> +# description: Distributed Input Output Daemon
> +#
> +
> +# Get function from functions library
> +. /etc/init.d/functions
> +
> +BASE=diod
> +PIDFILE=/var/run/$BASE.pid
> +PID=`test -f $PIDFILE && cat $PIDFILE`
> +DIOD_BIN=/usr/sbin/$BASE
> +DIOD_CONF=/etc/$BASE.conf
> +DIOD_OPTS="-c $DIOD_CONF"
> +DIOD="$DIOD_BIN $DIOD_OPTS"
> +RETVAL=0
> +
> +# Start the service $BASE
> +start()
> +{
> +       # Force creation of the log directory even on a tmpfs /var/log.
> +       mkdir -p /var/log/diod
> +
> +       start-stop-daemon --stop --test --quiet --pidfile $PIDFILE
> +       status=$?
> +       if [ $status -eq 0 ]; then
> +           echo "diod service is already running with pid $PID"
> +           exit 1
> +       else
> +           echo -n "Starting $BASE:"
> +           start-stop-daemon --start --pidfile $PIDFILE \
> +            --exec $DIOD_BIN -- $DIOD_OPTS
> +           RETVAL=$?
> +           echo
> +           [ $RETVAL -ne 0 ] && exit $RETVAL
> +       fi
> +}
> +
> +# Stop the service $BASE
> +stop()
> +{
> +    echo -n "Stopping $BASE:"
> +    start-stop-daemon --stop --test --quiet --pidfile $PIDFILE
> +    status=$?
> +    if [ $status -eq 0 ]; then
> +        start-stop-daemon --stop --quiet --pidfile $PIDFILE
> +        [ -w $PIDFILE ] && rm -f $PIDFILE
> +    else
> +       start-stop-daemon --stop --quiet --name $BASE
> +    fi
> +}
> +
> +
> +### service arguments ###
> +case $1 in
> +    start)
> +        start
> +        ;;
> +    stop)
> +        stop
> +        ;;
> +    status)
> +        status $BASE
> +        ;;
> +    restart | force-reload)
> +        $0 stop
> +        $0 start
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|status|restart}."
> +        exit 1
> +esac
> +
> +exit 0
> diff --git a/recipes-extended/diod/files/diod.conf
> b/recipes-extended/diod/files/diod.conf
> new file mode 100644
> index 0000000..e97743a
> --- /dev/null
> +++ b/recipes-extended/diod/files/diod.conf
> @@ -0,0 +1,15 @@
> +--
> +-- /etc/diod.conf - config file for diod distributed I/O daemon
> +--
> +-- NOTE: This config file is a lua script that diod runs, then extracts
> +-- the value of certain globally defined variables.  See diod.conf(5).
> +
> +listen = { "0.0.0.0:564" }
> +nwthreads = 16
> +auth_required = 1
> +logdest = "syslog:daemon:err"
> +
> +exports = { "/g/g0", "/g/g10" }
> +
> +allsquash = 0
> +squashuser = "nobody"
> --
> 2.7.4
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

--001a1140244c3f3bab0552f45c51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Jun 26, 2017 at 8:26 PM=
,  <span dir=3D"ltr">&lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D=
"_blank">yi.zhao@windriver.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi=
.zhao@windriver.com</a>&gt;<br>
<br>
diod is a multi-threaded, user space file server that speaks 9P2000.L<br>
protocol.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D"norefe=
rrer" target=3D"_blank">diod_1.<wbr>0.24.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 32 ++++++<br>
=C2=A0...ow-builds-to-work-with-<wbr>separate-build-dir.patch | 126 +++++++=
++++++++++++++<br>
=C2=A0.../files/0002-auto.diod.in-<wbr>remove-bashisms.patch=C2=A0 |=C2=A0 =
47 ++++++++<br>
=C2=A0recipes-extended/diod/files/<wbr>diod=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 75 ++++++++++++<br>
=C2=A0recipes-extended/diod/files/<wbr>diod.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 +++<br>
=C2=A05 files changed, 295 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/diod/<a href=3D"http://diod_1.0.2=
4.bb" rel=3D"noreferrer" target=3D"_blank">diod_1.<wbr>0.24.bb</a><br>
=C2=A0create mode 100644 recipes-extended/diod/files/<wbr>0001-build-allow-=
builds-to-<wbr>work-with-separate-build-dir.<wbr>patch<br>
=C2=A0create mode 100644 recipes-extended/diod/files/<wbr>0002-auto.diod.in=
-remove-<wbr>bashisms.patch<br>
=C2=A0create mode 100644 recipes-extended/diod/files/<wbr>diod<br>
=C2=A0create mode 100644 recipes-extended/diod/files/<wbr>diod.conf<br>
<br>
diff --git a/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D=
"noreferrer" target=3D"_blank">diod_<wbr>1.0.24.bb</a> b/recipes-extended/d=
iod/<a href=3D"http://diod_1.0.24.bb" rel=3D"noreferrer" target=3D"_blank">=
diod_<wbr>1.0.24.bb</a><br>
new file mode 100644<br>
index 0000000..a4d159a<br>
--- /dev/null<br>
+++ b/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D"norefe=
rrer" target=3D"_blank">diod_<wbr>1.0.24.bb</a><br>
@@ -0,0 +1,32 @@<br>
+SUMMARY =3D &quot;Diod is a user space server for the kernel v9fs client.&=
quot;<br>
+DESCRIPTION =3D &quot;\<br>
+Diod is a user space server for the kernel v9fs client (9p.ko, 9pnet.ko). =
\<br>
+Although the kernel client supports several 9P variants, diod only support=
s \<br>
+9P2000.L, and only in its feature-complete form, as it appeared in 2.6.38.=
&quot;<br>
+SECTION =3D &quot;console/network&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>59530bdf33659b29e73d4=
adb9f9f65<wbr>52&quot;<br>
+<br>
+PV =3D &quot;1.0.24+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;<wbr>0ea3fe3d829b5085307cd27a512708<wbr>d99ef48199&quot;<=
br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/chaos/diod.git;protoc=
ol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/chaos/diod.<wbr>g=
it;protocol=3Dgit</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://diod \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://diod.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-allow-<wbr>buil=
ds-to-work-with-separate-<wbr>build-dir.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-auto.diod.in-<wbr>rem=
ove-bashisms.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+DEPENDS =3D &quot;libcap ncurses tcp-wrappers lua&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools systemd<br>
+<br>
+do_install_append () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # install our init based on start-stop-daemon<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 0755 ${WORKDIR}/diod ${D}${sysco=
nfdir}/init.d/diod<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # install a real(not commented) configuration =
file for diod<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/diod.conf ${D}${sys=
confdir}/diod.conf<br>
+}<br>
+<br>
+FILES_${PN} +=3D &quot;${systemd_unitdir}&quot;<br>
diff --git a/recipes-extended/diod/files/<wbr>0001-build-allow-builds-to-<w=
br>work-with-separate-build-dir.<wbr>patch b/recipes-extended/diod/files/<w=
br>0001-build-allow-builds-to-<wbr>work-with-separate-build-dir.<wbr>patch<=
br>
new file mode 100644<br>
index 0000000..f40e0eb<br>
--- /dev/null<br>
+++ b/recipes-extended/diod/files/<wbr>0001-build-allow-builds-to-<wbr>work=
-with-separate-build-dir.<wbr>patch<br>
@@ -0,0 +1,126 @@<br>
+From 43403468298ef4167baa5d84de2ee2<wbr>eaf7f4007a Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Fri, 9 Jan 2015 18:34:04 +0000<br>
+Subject: [PATCH 1/2] build: allow builds to work with separate build dir<b=
r>
+<br>
+Remove assumptions in include paths that assume the build<br>
+is happening in the source directories.<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ diod/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
+ libdiod/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ liblsd/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ libnpclient/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ scripts/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br=
>
+ tests/kern/dbench/Makefile.am | 4 ++--<br>
+ utils/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
+ 7 files changed, 10 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/diod/Makefile.am b/diod/Makefile.am<br>
+index 7644be7..fdaf130 100644<br>
+--- a/diod/Makefile.am<br>
++++ b/diod/Makefile.am<br>
+@@ -1,7 +1,7 @@<br>
+ AM_CFLAGS =3D @GCCWARN@<br>
+<br>
+ AM_CPPFLAGS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 -I../libnpfs -I../liblsd -I../libdiod<br>
++=C2=A0 =C2=A0 =C2=A0 -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(src=
dir)/../libdiod<br>
+<br>
+ sbin_PROGRAMS =3D diod<br>
+<br>
+diff --git a/libdiod/Makefile.am b/libdiod/Makefile.am<br>
+index 4810e14..6905cdd 100644<br>
+--- a/libdiod/Makefile.am<br>
++++ b/libdiod/Makefile.am<br>
+@@ -1,7 +1,7 @@<br>
+ AM_CFLAGS =3D @GCCWARN@<br>
+<br>
+ AM_CPPFLAGS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 -I../libnpfs -I../libnpclient -I../liblsd<br>
++=C2=A0 =C2=A0 =C2=A0 -I$(srcdir)/../libnpfs -I$(srcdir)/../libnpclient -I=
$(srcdir)/../liblsd<br>
+<br>
+ noinst_LIBRARIES =3D libdiod.a<br>
+<br>
+diff --git a/liblsd/Makefile.am b/liblsd/Makefile.am<br>
+index c3e5658..7e18bf8 100644<br>
+--- a/liblsd/Makefile.am<br>
++++ b/liblsd/Makefile.am<br>
+@@ -1,6 +1,6 @@<br>
+ AM_CFLAGS =3D @GCCWARN@<br>
+<br>
+-AM_CPPFLAGS =3D -I../libdiod<br>
++AM_CPPFLAGS =3D -I$(srcdir)/../libdiod<br>
+<br>
+ noinst_LIBRARIES =3D liblsd.a<br>
+<br>
+diff --git a/libnpclient/Makefile.am b/libnpclient/Makefile.am<br>
+index 5305df9..cbaf266 100644<br>
+--- a/libnpclient/Makefile.am<br>
++++ b/libnpclient/Makefile.am<br>
+@@ -1,7 +1,7 @@<br>
+ AM_CFLAGS =3D @GCCWARN@<br>
+<br>
+ AM_CPPFLAGS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 -I../libnpfs<br>
++=C2=A0 =C2=A0 =C2=A0 -I$(srcdir)/../libnpfs<br>
+<br>
+ noinst_LIBRARIES =3D libnpclient.a<br>
+<br>
+diff --git a/scripts/Makefile.am b/scripts/Makefile.am<br>
+index 51c24a3..2aba728 100644<br>
+--- a/scripts/Makefile.am<br>
++++ b/scripts/Makefile.am<br>
+@@ -1,9 +1,9 @@<br>
+-systemddir=3D$(sysconfdir)/<wbr>systemd/system<br>
++systemddir=3D/lib/systemd/<wbr>system<br>
+<br>
+ install-data-local:<br>
+-=C2=A0 =C2=A0 =C2=A0 $(top_srcdir)/config/install-<wbr>sh -m 755 $(srcdir=
)/auto.diod \<br>
++=C2=A0 =C2=A0 =C2=A0 $(top_srcdir)/config/install-<wbr>sh -m 755 ./auto.d=
iod \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)$(sysconf=
dir)/auto.<wbr>diod<br>
+-=C2=A0 =C2=A0 =C2=A0 $(top_srcdir)/config/install-<wbr>sh -m 755 $(srcdir=
)/diod.service \<br>
++=C2=A0 =C2=A0 =C2=A0 $(top_srcdir)/config/install-<wbr>sh -m 644 ./diod.s=
ervice \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)$(systemd=
dir)/diod.<wbr>service<br>
+<br>
+ uninstall-local:<br>
+diff --git a/tests/kern/dbench/Makefile.<wbr>am b/tests/kern/dbench/Makefi=
le.<wbr>am<br>
+index e0cdefa..1704f9f 100644<br>
+--- a/tests/kern/dbench/Makefile.<wbr>am<br>
++++ b/tests/kern/dbench/Makefile.<wbr>am<br>
+@@ -2,7 +2,7 @@ AM_CFLAGS =3D -w<br>
+<br>
+ # VERSION=3D4.00<br>
+<br>
+-AM_CPPFLAGS =3D -DDATADIR=3D\&quot;$(X_DATADIR)\&quot;<br>
++AM_CPPFLAGS =3D -I. -DDATADIR=3D\&quot;$(X_DATADIR)\&quot;<br>
+<br>
+ LDADD =3D $(LIBPOPT)<br>
+<br>
+@@ -25,6 +25,6 @@ BUILT_SOURCES =3D proto.h<br>
+ CLEANFILES =3D proto.h<br>
+<br>
+ proto.h: $(dbench_SOURCES) <a href=3D"http://mkproto.pl" rel=3D"noreferre=
r" target=3D"_blank">mkproto.pl</a><br>
+-=C2=A0 =C2=A0 =C2=A0 perl <a href=3D"http://mkproto.pl" rel=3D"noreferrer=
" target=3D"_blank">mkproto.pl</a> $(dbench_SOURCES) &gt; proto.h<br>
++=C2=A0 =C2=A0 =C2=A0 $(srcdir)/<a href=3D"http://mkproto.pl" rel=3D"noref=
errer" target=3D"_blank">mkproto.pl</a> $(patsubst %,$(srcdir),$(dbench_SOU=
RCES)) &gt; proto.h<br>
+<br>
+ EXTRA_DIST =3D <a href=3D"http://mkproto.pl" rel=3D"noreferrer" target=3D=
"_blank">mkproto.pl</a><br>
+diff --git a/utils/Makefile.am b/utils/Makefile.am<br>
+index 169b6c4..91d571d 100644<br>
+--- a/utils/Makefile.am<br>
++++ b/utils/Makefile.am<br>
+@@ -1,7 +1,7 @@<br>
+ AM_CFLAGS =3D @GCCWARN@<br>
+<br>
+ AM_CPPFLAGS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 -I../libnpfs -I../liblsd -I../libdiod -I../libnpclie=
nt<br>
++=C2=A0 =C2=A0 =C2=A0 -I$(srcdir)/../libnpfs -I$(srcdir)/../liblsd -I$(src=
dir)/../libdiod -I$(srcdir)/../libnpclient<br>
+<br>
+ sbin_PROGRAMS =3D diodmount diodcat dtop diodload diodls diodshowmount di=
oddate<br>
+<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/recipes-extended/diod/files/<wbr>0002-auto.diod.in-remove-<wbr=
>bashisms.patch b/recipes-extended/diod/files/<wbr>0002-auto.diod.in-remove=
-<wbr>bashisms.patch<br>
new file mode 100644<br>
index 0000000..65d6ff6<br>
--- /dev/null<br>
+++ b/recipes-extended/diod/files/<wbr>0002-auto.diod.in-remove-<wbr>bashis=
ms.patch<br>
@@ -0,0 +1,47 @@<br>
+From 5a9e09dc5de833db11607530351cd8<wbr>7cecbfd17e Mon Sep 17 00:00:00 200=
1<br>
+From: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rongqing.li@=
windriver.com</a>&gt;<br>
+Date: Thu, 22 Jun 2017 06:32:30 +0000<br>
+Subject: [PATCH 2/2] <a href=3D"http://auto.diod.in" rel=3D"noreferrer" ta=
rget=3D"_blank">auto.diod.in</a>: remove bashisms<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">ron=
gqing.li@windriver.com</a>&gt;<br>
+---<br>
+ scripts/<a href=3D"http://auto.diod.in" rel=3D"noreferrer" target=3D"_bla=
nk">auto.diod.in</a> | 14 +++++++-------<br>
+ 1 file changed, 7 insertions(+), 7 deletions(-)<br>
+<br>
+diff --git a/scripts/<a href=3D"http://auto.diod.in" rel=3D"noreferrer" ta=
rget=3D"_blank">auto.diod.in</a> b/scripts/<a href=3D"http://auto.diod.in" =
rel=3D"noreferrer" target=3D"_blank">auto.diod.in</a><br>
+index f63e004..4d5fc3a 100755<br>
+--- a/scripts/<a href=3D"http://auto.diod.in" rel=3D"noreferrer" target=3D=
"_blank">auto.diod.in</a><br>
++++ b/scripts/<a href=3D"http://auto.diod.in" rel=3D"noreferrer" target=3D=
"_blank">auto.diod.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#!/bin/bash<br>
++#!/bin/sh<br>
+ #<br>
+ # auto.diod - executable automounter map for diod file systems<br>
+ #<br>
+@@ -41,15 +41,15 @@ dcatopts=3D&quot;${DIOD_TIMEOUT:+-t $DIOD_TIMEOUT}&quo=
t;<br>
+ for server in $DIOD_SERVERS; do<br>
+=C2=A0 =C2=A0 =C2=A0$DIOD_DIODCAT -s $server $dcatopts exports | awk &#39;=
{print $1}&#39; |\<br>
+=C2=A0 =C2=A0 =C2=A0while read path; do<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$path&quot; =3D=3D &quot;/&quot; ]=
; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$key&quot; =3D=3D &q=
uot;ROOT&quot; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$path&quot; =3D &quot;/&quot; ]; t=
hen<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$key&quot; =3D &quot=
;ROOT&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$=
prefix $server:$path&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ &quot;$key&quot; =3D=3D &quot;$(echo $=
path|sed -e&#39;s/^\///&#39; -e&#39;s/\//./g&#39;)&quot; ] \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || [ &quot;$key&quot; =3D=3D &quot;$(e=
cho $path|sed -e&#39;s/^\///&#39; -e&#39;s/\//_/g&#39;)&quot; ] \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || [ &quot;$key&quot; =3D=3D &quot;$(e=
cho $path|sed -e&#39;s/^\///&#39; -e&#39;s/\//-/g&#39;)&quot; ] \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || [ &quot;$key&quot; =3D=3D &quot;$(b=
asename $path)&quot; ]; then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ &quot;$key&quot; =3D &quot;$(echo $pat=
h|sed -e&#39;s/^\///&#39; -e&#39;s/\//./g&#39;)&quot; ] \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || [ &quot;$key&quot; =3D &quot;$(echo=
 $path|sed -e&#39;s/^\///&#39; -e&#39;s/\//_/g&#39;)&quot; ] \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || [ &quot;$key&quot; =3D &quot;$(echo=
 $path|sed -e&#39;s/^\///&#39; -e&#39;s/\//-/g&#39;)&quot; ] \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || [ &quot;$key&quot; =3D &quot;$(base=
name $path)&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$prefix $server=
:$path&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/recipes-extended/diod/files/<wbr>diod b/recipes-extended/diod/=
files/<wbr>diod<br>
new file mode 100644<br>
index 0000000..cd0bf98<br>
--- /dev/null<br>
+++ b/recipes-extended/diod/files/<wbr>diod<br>
@@ -0,0 +1,75 @@<br>
+#!/bin/sh<br>
+#<br>
+# chkconfig: 35 20 80<br>
+# description: Distributed Input Output Daemon<br>
+#<br>
+<br>
+# Get function from functions library<br>
+. /etc/init.d/functions<br>
+<br>
+BASE=3Ddiod<br>
+PIDFILE=3D/var/run/$BASE.pid<br>
+PID=3D`test -f $PIDFILE &amp;&amp; cat $PIDFILE`<br>
+DIOD_BIN=3D/usr/sbin/$BASE<br>
+DIOD_CONF=3D/etc/$BASE.conf<br>
+DIOD_OPTS=3D&quot;-c $DIOD_CONF&quot;<br>
+DIOD=3D&quot;$DIOD_BIN $DIOD_OPTS&quot;<br>
+RETVAL=3D0<br>
+<br>
+# Start the service $BASE<br>
+start()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Force creation of the log directory even on a=
 tmpfs /var/log.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p /var/log/diod<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon --stop --test --quiet --pidfi=
le $PIDFILE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status=3D$?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $status -eq 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;diod service is alread=
y running with pid $PID&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n &quot;Starting $BASE:&quo=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon --start --pidfi=
le $PIDFILE \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --exec $DIOD_BIN -- $DIOD_OPTS<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RETVAL=3D$?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ $RETVAL -ne 0 ] &amp;&amp; exit=
 $RETVAL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
+<br>
+# Stop the service $BASE<br>
+stop()<br>
+{<br>
+=C2=A0 =C2=A0 echo -n &quot;Stopping $BASE:&quot;<br>
+=C2=A0 =C2=A0 start-stop-daemon --stop --test --quiet --pidfile $PIDFILE<b=
r>
+=C2=A0 =C2=A0 status=3D$?<br>
+=C2=A0 =C2=A0 if [ $status -eq 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 start-stop-daemon --stop --quiet --pidfile $PI=
DFILE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -w $PIDFILE ] &amp;&amp; rm -f $PIDFILE<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon --stop --quiet --name $BASE<b=
r>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+<br>
+### service arguments ###<br>
+case $1 in<br>
+=C2=A0 =C2=A0 start)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 start<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 stop)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 stop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 status)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status $BASE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 restart | force-reload)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 $0 stop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 $0 start<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 *)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Usage: $0 {start|stop|status|restar=
t}.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
+esac<br>
+<br>
+exit 0<br>
diff --git a/recipes-extended/diod/files/<wbr>diod.conf b/recipes-extended/=
diod/files/<wbr>diod.conf<br>
new file mode 100644<br>
index 0000000..e97743a<br>
--- /dev/null<br>
+++ b/recipes-extended/diod/files/<wbr>diod.conf<br>
@@ -0,0 +1,15 @@<br>
+--<br>
+-- /etc/diod.conf - config file for diod distributed I/O daemon<br>
+--<br>
+-- NOTE: This config file is a lua script that diod runs, then extracts<br=
>
+-- the value of certain globally defined variables.=C2=A0 See diod.conf(5)=
.<br>
+<br>
+listen =3D { &quot;<a href=3D"http://0.0.0.0:564" rel=3D"noreferrer" targe=
t=3D"_blank">0.0.0.0:564</a>&quot; }<br>
+nwthreads =3D 16<br>
+auth_required =3D 1<br>
+logdest =3D &quot;syslog:daemon:err&quot;<br>
+<br>
+exports =3D { &quot;/g/g0&quot;, &quot;/g/g10&quot; }<br>
+<br>
+allsquash =3D 0<br>
+squashuser =3D &quot;nobody&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
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

--001a1140244c3f3bab0552f45c51--
