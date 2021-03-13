Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.3053.1615663925809150617
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 13 Mar 2021 11:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V7kuUfX9;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id h13so12664337eds.5
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Mar 2021 11:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0QcXGmd2V5A+vYJRB1MXMJ0OwjYsTUeUQ2jj0RQhA8s=;
        b=V7kuUfX9mOIPKzU0x8NTY+xYNAXGWp8fxbxLkOrpDciYlzGbXUUYTGiuB57Ot6BO01
         pfSyhVotvMNkYyetrCboLNgD5IuZZF4Sn07a6VtBL8CKSOIGW8pN1dVvxX/e4bNhYe/X
         GX9NLwQ8k/Q/vNCXSoqJ2/lFkM/X0tINyc81phJfZCId5qjF5KpcnjURPpiHJaH8xE0J
         CLozcBIyM1zgt/rHUNIxFpRX341pQsXZahmxh8Af2RsbQOfQIPvENDJFMgcsZNbU7tTW
         pPlmsqmm6NHQ3QTWy8aL4YvUidAerfIXAa2CG87bYQHHhXJVsc55DeUXhHQnS+C1niDo
         OhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0QcXGmd2V5A+vYJRB1MXMJ0OwjYsTUeUQ2jj0RQhA8s=;
        b=MVc+t2vavy6rU93qGXsrMgwBqY1kbQ++GKNgSFRC44mun9ZU1m02d8BRXJZ1NKgGf0
         l9qQE9yqWEq6HM4xNWr/+/MUxl9Aue193B/osHuUpj7Q/cwSHswHUuFxa6ang/gVn384
         rX4z17jZwLG1c3BXhaZF0iEUv1cbBQnEGddbG22uGSankX+xPLgEiRxtDEiB0xgaKyg1
         h9j/no/UqBnDqhl64quOOdtv9mw/CRtI7e50CcVN8WPEtQN6B4p6I7fsB3Fuq+CC8UYJ
         XLDcthKmwXgC82V7lZqm9GcEypEf7FAPDU5I3wsp085GlP+IKVx+GNAJSQvddm4xn7HK
         Mnew==
X-Gm-Message-State: AOAM530mnSkzmhbAOCQB5TxlWFMlYpbEfkzTXQk+H5+bYdjt/5scX3Ij
	Qtghuv6QydV6z2GfasK6KGITxCDSxbypLj6HLrQ=
X-Google-Smtp-Source: ABdhPJwsFGs+GmaddTn+eijr/d2yBhYG+Sbtdq26BIvxnsR7aRb10bUUQBpdw63niVBALQ0aMqIPfFAeWSrDopudHKA=
X-Received: by 2002:aa7:d547:: with SMTP id u7mr21666843edr.347.1615663924053;
 Sat, 13 Mar 2021 11:32:04 -0800 (PST)
MIME-Version: 1.0
References: <20201124224942.559123-1-maciej.pijanowski@3mdeb.com>
 <164C7E16DDAE1F53.8361@lists.yoctoproject.org> <165315CA2BE9E660.12908@lists.yoctoproject.org>
In-Reply-To: <165315CA2BE9E660.12908@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 13 Mar 2021 14:31:53 -0500
Message-ID: <CADkTA4PbqerEYdPdxO-T1+ZxnfvYRWbsPYqPwdQKUKt4huXTuw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] balena-engine: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2020 at 11:10 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> And another followup.
>
> I still haven't forgotten about this,  I'm still just tied up with
> factoring the code, fighting with k3s and now the holidays. I expect
> to get back to this in the next little while.

FYI: I finally got through uprevs and getting k3s to work, so this is
my next detailed integration point.

If you happen to have updates or any newer versions of this, now is a
good time to share them, before I start digging in.

Cheers,

Bruce

>
> Bruce
>
> On Mon, Nov 30, 2020 at 11:43 PM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > Just following up, since there were some holidays (and a weekend)
> > between this being sent and now.
> >
> > I'll have a closer look at v2 in the next few days, and then will see
> > about unifying the moby build portion of the effort.
> >
> > Cheers,
> >
> > Bruce
> >
> > On Tue, Nov 24, 2020 at 5:50 PM Maciej Pijanowski
> > <maciej.pijanowski@3mdeb.com> wrote:
> > >
> > > As explained in [1], I have created the balena-engine recipe which c=
ould be
> > > used in "regular" Yocto/OE builds (outside of the balenaOS). The
> > > recipe is mostly a copy of the original recipe from meta-balena,
> > > stripped from the balenaOS-specific parts so it can be compiled and
> > > build outside of it. This recipe was tested at build and runtime
> > > on the dunfell release on two targets: RPi4 and qemux86-64.
> > >
> > > [1] https://lists.yoctoproject.org/g/meta-virtualization/message/591=
3
> > >
> > > Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> > > ---
> > >
> > > Changes since v1:
> > > * drop oe-meta-go removes
> > > * use variables instead of hardcoding in case of some paths
> > > * add support for sysvinit
> > >   - based on docker.init and confirmed with original balena-engine i=
nit [1]
> > >   - not verified in practice
> > > * conditionally install init files based on used init system
> > > * use goarch bbclass
> > > * use BUILD_TAGS as a BitBake variable
> > > * drop mobynit compilation
> > > * drop extra balena- symlinks
> > > * drop native bbclass support
> > > * reorganize file structure to be more similar to current docker rec=
ipes
> > >
> > > [1] https://github.com/balena-os/balena-engine/blob/master/contrib/i=
nit/sysvinit-redhat/balena-engine
> > >
> > >  ...dcoded-CC-on-cross-compile-docker-ce.patch |  60 ++++++++
> > >  .../balena-engine/balena-engine.init          | 131 +++++++++++++++=
+++
> > >  .../balena-engine/balena-tmpfiles.conf        |   2 +
> > >  .../balena-engine/balena-engine_git.bb        | 126 +++++++++++++++=
++
> > >  4 files changed, 319 insertions(+)
> > >  create mode 100644 recipes-containers/balena-engine/balena-engine/0=
001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch
> > >  create mode 100644 recipes-containers/balena-engine/balena-engine/b=
alena-engine.init
> > >  create mode 100644 recipes-containers/balena-engine/balena-engine/b=
alena-tmpfiles.conf
> > >  create mode 100644 recipes-containers/balena-engine/balena-engine_g=
it.bb
> > >
> > > diff --git a/recipes-containers/balena-engine/balena-engine/0001-imp=
orve-hardcoded-CC-on-cross-compile-docker-ce.patch b/recipes-containers/bal=
ena-engine/balena-engine/0001-imporve-hardcoded-CC-on-cross-compile-docker-=
ce.patch
> > > new file mode 100644
> > > index 000000000000..0f257f1bd964
> > > --- /dev/null
> > > +++ b/recipes-containers/balena-engine/balena-engine/0001-imporve-ha=
rdcoded-CC-on-cross-compile-docker-ce.patch
> > > @@ -0,0 +1,60 @@
> > > +From 1263fdb50a540e9db742694b7cee08284ad986d0 Mon Sep 17 00:00:00 2=
001
> > > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > > +Date: Wed, 17 Jul 2019 17:34:04 +0800
> > > +Subject: [PATCH] imporve hardcoded CC on cross compile
> > > +
> > > +Since commit applied in moby [61a3285 Support cross-compile for arm=
]
> > > +it hardcoded var-CC to support cross-compile for arm
> > > +
> > > +Correct it with "${parameter:-word}" format, it is helpful for user
> > > +define toolchains
> > > +
> > > +(Use Default Values.  If parameter is unset or null, the expansion =
of
> > > +word is substituted.  Otherwise, the value of parameter is substitu=
ted.)
> > > +
> > > +Upstream-Status: Submitted [https://github.com/moby/moby/pull/39546=
]
> > > +
> > > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > > +---
> > > + hack/make/.binary | 10 +++++-----
> > > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > > +
> > > +diff --git a/src/import/hack/make/.binary b/src/import/hack/make/.b=
inary
> > > +index 53de6749e5..66f4ca05f3 100644
> > > +--- a/src/import/hack/make/.binary
> > > ++++ b/src/import/hack/make/.binary
> > > +@@ -44,27 +44,27 @@ if [ "$(go env GOOS)/$(go env GOARCH)" !=3D "$(=
go env GOHOSTOS)/$(go env GOHOSTARC
> > > +       # must be cross-compiling!
> > > +       case "$(go env GOOS)/$(go env GOARCH)" in
> > > +               windows/amd64)
> > > +-                      export CC=3Dx86_64-w64-mingw32-gcc
> > > ++                      export CC=3D"${CC:-x86_64-w64-mingw32-gcc}"
> > > +                       export CGO_ENABLED=3D1
> > > +                       ;;
> > > +               linux/arm)
> > > +                       case "${GOARM}" in
> > > +                       5|"")
> > > +-                              export CC=3Darm-linux-gnueabi-gcc
> > > ++                              export CC=3D"${CC:-arm-linux-gnueabi=
-gcc}"
> > > +                               export CGO_ENABLED=3D1
> > > +                               ;;
> > > +                       7)
> > > +-                              export CC=3Darm-linux-gnueabihf-gcc
> > > ++                              export CC=3D"${CC:-arm-linux-gnueabi=
hf-gcc}"
> > > +                               export CGO_ENABLED=3D1
> > > +                               ;;
> > > +                       esac
> > > +                       ;;
> > > +               linux/arm64)
> > > +-                      export CC=3Daarch64-linux-gnu-gcc
> > > ++                      export CC=3D"${CC:-aarch64-linux-gnu-gcc}"
> > > +                       export CGO_ENABLED=3D1
> > > +                       ;;
> > > +               linux/amd64)
> > > +-                      export CC=3Dx86_64-linux-gnu-gcc
> > > ++                      export CC=3D"${CC:-x86_64-linux-gnu-gcc}"
> > > +                       export CGO_ENABLED=3D1
> > > +                       ;;
> > > +       esac
> > > +--
> > > +2.23.0
> > > diff --git a/recipes-containers/balena-engine/balena-engine/balena-e=
ngine.init b/recipes-containers/balena-engine/balena-engine/balena-engine.i=
nit
> > > new file mode 100644
> > > index 000000000000..a8c83b2b2b37
> > > --- /dev/null
> > > +++ b/recipes-containers/balena-engine/balena-engine/balena-engine.i=
nit
> > > @@ -0,0 +1,131 @@
> > > +#!/bin/sh
> > > +#
> > > +#       /etc/rc.d/init.d/balena-engine
> > > +#
> > > +#       Daemon for docker.com
> > > +#
> > > +# chkconfig:   2345 95 95
> > > +# description: Daemon for docker.com
> > > +
> > > +### BEGIN INIT INFO
> > > +# Provides:       balena-engine
> > > +# Required-Start: $network cgconfig
> > > +# Required-Stop:
> > > +# Should-Start:
> > > +# Should-Stop:
> > > +# Default-Start: 2 3 4 5
> > > +# Default-Stop:  0 1 6
> > > +# Short-Description: start and stop balena-engine
> > > +# Description: Daemon for docker.com
> > > +### END INIT INFO
> > > +
> > > +# Source function library.
> > > +. /etc/init.d/functions
> > > +
> > > +prog=3D"balena-engine"
> > > +unshare=3D/usr/bin/unshare
> > > +exec=3D"/usr/bin/balena-engine-daemon"
> > > +pidfile=3D"/var/run/$prog.pid"
> > > +lockfile=3D"/var/lock/subsys/$prog"
> > > +logfile=3D"/var/log/$prog"
> > > +other_args=3D"--pidfile $pidfile --registry-mirror=3Dhttp://localho=
st:5000 --insecure-registry=3Dhttp://localhost:5000 --raw-logs"
> > > +
> > > +[ -e /etc/sysconfig/$prog ] && . /etc/sysconfig/$prog
> > > +
> > > +start() {
> > > +    [ -x $exec ] || exit 5
> > > +
> > > +    check_for_cleanup
> > > +
> > > +    if ! [ -f $pidfile ]; then
> > > +        printf "Starting $prog:\t"
> > > +        echo -e "\n$(date)\n" >> $logfile
> > > +        "$unshare" -m -- $exec $other_args >> $logfile 2>&1 &
> > > +        pid=3D$!
> > > +        touch $lockfile
> > > +        # wait up to 10 seconds for the pidfile to exist.  see
> > > +        # https://github.com/docker/docker/issues/5359
> > > +        tries=3D0
> > > +        while [ ! -f $pidfile -a $tries -lt 10 ]; do
> > > +            sleep 1
> > > +            tries=3D$((tries + 1))
> > > +        done
> > > +        success
> > > +        echo
> > > +    else
> > > +        failure
> > > +        echo
> > > +        printf "$pidfile still exists...\n"
> > > +        exit 7
> > > +    fi
> > > +}
> > > +
> > > +stop() {
> > > +    echo -n $"Stopping $prog: "
> > > +    killproc $prog
> > > +    retval=3D$?
> > > +    echo
> > > +    [ $retval -eq 0 ] && rm -f $lockfile
> > > +    return $retval
> > > +}
> > > +
> > > +restart() {
> > > +    stop
> > > +    start
> > > +}
> > > +
> > > +reload() {
> > > +    restart
> > > +}
> > > +
> > > +force_reload() {
> > > +    restart
> > > +}
> > > +
> > > +rh_status() {
> > > +    status $prog
> > > +}
> > > +
> > > +rh_status_q() {
> > > +    rh_status >/dev/null 2>&1
> > > +}
> > > +
> > > +
> > > +check_for_cleanup() {
> > > +    if [ -f ${pidfile} ]; then
> > > +        /bin/ps -fp $(cat ${pidfile}) > /dev/null || rm ${pidfile}
> > > +    fi
> > > +}
> > > +
> > > +case "$1" in
> > > +    start)
> > > +        rh_status_q && exit 0
> > > +        $1
> > > +        ;;
> > > +    stop)
> > > +        rh_status_q || exit 0
> > > +        $1
> > > +        ;;
> > > +    restart)
> > > +        $1
> > > +        ;;
> > > +    reload)
> > > +        rh_status_q || exit 7
> > > +        $1
> > > +        ;;
> > > +    force-reload)
> > > +        force_reload
> > > +        ;;
> > > +    status)
> > > +        rh_status
> > > +        ;;
> > > +    condrestart|try-restart)
> > > +        rh_status_q || exit 0
> > > +        restart
> > > +        ;;
> > > +    *)
> > > +        echo $"Usage: $0 {start|stop|status|restart|condrestart|try=
-restart|reload|force-reload}"
> > > +        exit 2
> > > +esac
> > > +
> > > +exit $?
> > > diff --git a/recipes-containers/balena-engine/balena-engine/balena-t=
mpfiles.conf b/recipes-containers/balena-engine/balena-engine/balena-tmpfil=
es.conf
> > > new file mode 100644
> > > index 000000000000..548a25d3ae49
> > > --- /dev/null
> > > +++ b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles=
.conf
> > > @@ -0,0 +1,2 @@
> > > +L      /run/docker.pid -       -       -       -       /run/balena-=
engine.pid
> > > +L      /run/balena.pid -       -       -       -       /run/balena-=
engine.pid
> > > diff --git a/recipes-containers/balena-engine/balena-engine_git.bb b=
/recipes-containers/balena-engine/balena-engine_git.bb
> > > new file mode 100644
> > > index 000000000000..b1c149019c27
> > > --- /dev/null
> > > +++ b/recipes-containers/balena-engine/balena-engine_git.bb
> > > @@ -0,0 +1,126 @@
> > > +HOMEPAGE =3D "https://www.balena.io/"
> > > +SUMMARY =3D "A Moby-based container engine for IoT"
> > > +DESCRIPTION =3D "Balena is a new container engine purpose-built for=
 embedded \
> > > +and IoT use cases and compatible with Docker containers. Based on D=
ocker=E2=80=99s \
> > > +Moby Project, balena supports container deltas for 10-70x more effi=
cient \
> > > +bandwidth usage, has 3.5x smaller binaries, uses RAM and storage mo=
re \
> > > +conservatively, and focuses on atomicity and durability of containe=
r \
> > > +pulling."
> > > +LICENSE =3D "Apache-2.0"
> > > +LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3D4859e97a9c778=
0e77972d989f0823f28"
> > > +
> > > +BALENA_VERSION =3D "19.03.13-dev"
> > > +BALENA_BRANCH=3D "master"
> > > +
> > > +SRCREV =3D "074a481789174b4b6fd2d706086e8ffceb72e924"
> > > +SRC_URI =3D "\
> > > +       git://github.com/balena-os/balena-engine.git;branch=3D${BALE=
NA_BRANCH};destsuffix=3Dgit/src/import \
> > > +       file://0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.=
patch \
> > > +       file://balena-engine.init \
> > > +       file://balena-tmpfiles.conf \
> > > +"
> > > +
> > > +GO_IMPORT =3D "import"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +PV =3D "${BALENA_VERSION}+git${SRCREV}"
> > > +
> > > +SECURITY_CFLAGS =3D "${SECURITY_NOPIE_CFLAGS}"
> > > +SECURITY_LDFLAGS =3D ""
> > > +
> > > +inherit systemd update-rc.d
> > > +
> > > +SYSTEMD_PACKAGES =3D "${@bb.utils.contains('DISTRO_FEATURES','syste=
md','${PN}','',d)}"
> > > +SYSTEMD_SERVICE_${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES','=
systemd','balena-engine.service','',d)}"
> > > +SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
> > > +
> > > +INITSCRIPT_PACKAGES +=3D "${@bb.utils.contains('DISTRO_FEATURES','s=
ysvinit','${PN}','',d)}"
> > > +INITSCRIPT_NAME_${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES','=
sysvinit','balena-engine.init','',d)}"
> > > +INITSCRIPT_PARAMS_${PN} =3D "defaults"
> > > +
> > > +inherit useradd
> > > +USERADD_PACKAGES =3D "${PN}"
> > > +GROUPADD_PARAM_${PN} =3D "-r balena-engine"
> > > +
> > > +DEPENDS_append =3D " systemd"
> > > +RDEPENDS_${PN} =3D "curl util-linux iptables tini systemd bash"
> > > +RRECOMMENDS_${PN} +=3D "kernel-module-nf-nat kernel-module-br-netfi=
lter kernel-module-nf-conntrack-netlink kernel-module-xt-masquerade kernel-=
module-xt-addrtype"
> > > +
> > > +INSANE_SKIP_${PN} +=3D "already-stripped"
> > > +
> > > +FILES_${PN} +=3D " \
> > > +       ${systemd_unitdir}/system/* \
> > > +       ${ROOT_HOME} \
> > > +       ${localstatedir} \
> > > +"
> > > +
> > > +DOCKER_PKG=3D"github.com/docker/docker"
> > > +
> > > +BUILD_TAGS =3D"no_buildkit no_btrfs no_cri no_devmapper no_zfs excl=
ude_disk_quota exclude_graphdriver_btrfs exclude_graphdriver_devicemapper e=
xclude_graphdriver_zfs"
> > > +
> > > +inherit go
> > > +inherit goarch
> > > +inherit pkgconfig
> > > +
> > > +do_configure[noexec] =3D "1"
> > > +
> > > +do_compile() {
> > > +       export PATH=3D${STAGING_BINDIR_NATIVE}/${HOST_SYS}:$PATH
> > > +
> > > +       # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> > > +       # docker to download its dependencies but rather
> > > +       # use dependencies packaged independently.
> > > +       cd ${S}/src/import
> > > +       rm -rf .gopath
> > > +       mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
> > > +       ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
> > > +
> > > +       export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/ven=
dor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> > > +       export GOROOT=3D"${STAGING_DIR_NATIVE}/${nonarch_libdir}/${H=
OST_SYS}/go"
> > > +
> > > +       # Pass the needed cflags/ldflags so that cgo
> > > +       # can find the needed headers files and libraries
> > > +       export GOARCH=3D${TARGET_GOARCH}
> > > +       export CGO_ENABLED=3D"1"
> > > +       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TAR=
GET}"
> > > +       export CGO_LDFLAGS=3D"${LDFLAGS}  --sysroot=3D${STAGING_DIR_=
TARGET}"
> > > +       export DOCKER_BUILDTAGS=3D'${BUILD_TAGS}'
> > > +
> > > +       export DOCKER_GITCOMMIT=3D"${SRCREV}"
> > > +       export DOCKER_LDFLAGS=3D"-s"
> > > +
> > > +       VERSION=3D${BALENA_VERSION} ./hack/make.sh dynbinary-balena
> > > +}
> > > +
> > > +do_install() {
> > > +       mkdir -p ${D}/${bindir}
> > > +       install -m 0755 ${S}/src/import/bundles/dynbinary-balena/bal=
ena-engine ${D}/${bindir}/balena-engine
> > > +
> > > +       ln -sf balena-engine ${D}/${bindir}/balena-engine-daemon
> > > +       ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd
> > > +       ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd=
-shim
> > > +       ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd=
-ctr
> > > +       ln -sf balena-engine ${D}/${bindir}/balena-engine-runc
> > > +       ln -sf balena-engine ${D}/${bindir}/balena-engine-proxy
> > > +
> > > +       if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','=
false',d)}; then
> > > +               install -d ${D}${systemd_unitdir}/system
> > > +               install -m 0644 ${S}/src/import/contrib/init/systemd=
/balena-engine.socket ${D}/${systemd_unitdir}/system
> > > +               install -m 0644 ${S}/src/import/contrib/init/systemd=
/balena-engine.service ${D}/${systemd_unitdir}/system
> > > +       else
> > > +               install -d ${D}${sysconfdir}/init.d
> > > +               install -m 0755 ${WORKDIR}/balena-engine.init ${D}${=
sysconfdir}/init.d/balena-engine.init
> > > +       fi
> > > +
> > > +       install -d ${D}${ROOT_HOME}/.docker
> > > +       ln -sf .docker ${D}${ROOT_HOME}/.balena
> > > +       ln -sf .docker ${D}${ROOT_HOME}/.balena-engine
> > > +
> > > +       install -d ${D}${localstatedir}/lib/docker
> > > +       ln -sf docker ${D}${localstatedir}/lib/balena
> > > +       ln -sf docker ${D}${localstatedir}/lib/balena-engine
> > > +
> > > +       install -d ${D}${sysconfdir}/tmpfiles.d
> > > +       install -m 0644 ${WORKDIR}/balena-tmpfiles.conf ${D}${syscon=
fdir}/tmpfiles.d/
> > > +}
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
