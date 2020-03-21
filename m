Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.12357.1584810614382579670
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 21 Mar 2020 10:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePlrHY5f;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id v6so11000303edw.8
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 21 Mar 2020 10:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPd6wDM26Nx1KDyC2SCt8GnoVEYxpdURWki6YRhl6wU=;
        b=ePlrHY5fePjq1/O6S2FzReEhyQLpJfVcuWb9v3QCRUWjoHBpV5Eps4CfMrSILRaH4Z
         YPYZyA4njQ8v0C1HQEvSRaxzX73WIeph+MWOB3rNzIUg9ozq468ZswGF9S3koVSPuf4k
         /7Hv+me6vUJmEf0Bt+GSHT+s83JsHINmrUXCn54n+EBgVjslk8PHDjpJfe9mh4GVRngk
         6U7FbUC+qlaM5fgzezFyVhxfdyO7hFP34Y3k5tR+H4i4foDjB1qoXzV7dUa5ydxMmWl/
         NTmzBSc6VM5sf4VCuMVvKAF/6wzs4MSZ6UR/Lh3ELaivQEhQ6tRJPiRqFSn4UVprVON3
         rcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPd6wDM26Nx1KDyC2SCt8GnoVEYxpdURWki6YRhl6wU=;
        b=Ca4IxvEyZ8J3BIU4CX0SPDopziugCpDDvLr9Oz+YOUV3yVjWHOq8xXwpcR9TjZbRke
         lgsZyQNkM6WZpaJWrFSluNEiY1FN/Pdi6gBKTybo2rnQ5mk7D4NT/7rMVLhrFIdJf84S
         zGAAHy2qAXE0TUGzZaTEDaCffhQJILf2E5kBw7zx5Qjv2apFbewy6LrNZaa63R5m8SM0
         xUMawduxCMpAqCu5fnFUDfAWuqK7Nmw5kRufm9mrtDc4N39DJeU0lWSVs0M2vFPPY2+D
         U0odEyBMyLrQPTU0aIgDBb4vsG0WUJopmV4tTlVqPItFr2Ki0FjZvjGXrv6OjB9dajOn
         tX4w==
X-Gm-Message-State: ANhLgQ2cuEWLEQPHzaXpfI7a6hSxvC2Z5X0f44WuPG996pR4JGtflZaP
	RQFpF5AMcYYefT+BWGykqq0aDEL7NzyDck1Yg80=
X-Google-Smtp-Source: ADFU+vsdLYoC2LUksVCoAGypapMzAu/2jymgOewbuAiEI+MSIgVOUZeoYwzGj2V9qO/OTXQY00V24tHUJRWDuGtek5o=
X-Received: by 2002:a50:ae64:: with SMTP id c91mr3398338edd.129.1584810612566;
 Sat, 21 Mar 2020 10:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200320095124.3297-1-joakimr@axis.com> <7eba015ce34d41618ff6ed2d738b1696@XBOX03.axis.com>
In-Reply-To: <7eba015ce34d41618ff6ed2d738b1696@XBOX03.axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 21 Mar 2020 13:10:01 -0400
Message-ID: <CADkTA4P+oixEyD1XU9BuERrdTPHCFoPt-RCJNEwzt41Dhg_ghg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] go: Enable different target dir by using variable
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Joakim Roubert <Joakim.Roubert@axis.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 20, 2020 at 3:57 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-
> > virtualization@lists.yoctoproject.org> On Behalf Of Joakim Roubert
> > Sent: den 20 mars 2020 10:51
> > To: meta-virtualization@lists.yoctoproject.org
> > Cc: Joakim Roubert <Joakim.Roubert@axis.com>
> > Subject: [meta-virtualization][PATCH] go: Enable different target dir by
> > using variable
> >
> > Enable setting the target installation (sub)directory for go by adding
> > such a variable in a class (go.class). The default target installation
> > value is local, to get binaries in /usr/local/bin just like before. But
> > on systems where e.g. /usr/bin is the desired target that is achieved by
> > setting this variable to "".
> >
> > Change-Id: I1a3de8e70340931391cd4382cba2478403ae27ce
> > Signed-off-by: Joakim Roubert <joakimr@axis.com>
> > ---
> >  classes/go.bbclass                         |  4 ++++
> >  recipes-devtools/go/compose-file_git.bb    | 20 +++++++++++---------
> >  recipes-devtools/go/go-capability_git.bb   | 12 +++++++-----
> >  recipes-devtools/go/go-cli_git.bb          | 12 +++++++-----
> >  recipes-devtools/go/go-connections_git.bb  | 18 ++++++++++--------
> >  recipes-devtools/go/go-context_git.bb      | 12 +++++++-----
> >  recipes-devtools/go/go-dbus_git.bb         | 12 +++++++-----
> >  recipes-devtools/go/go-distribution_git.bb | 18 ++++++++++--------
> >  recipes-devtools/go/go-fsnotify_git.bb     | 12 +++++++-----
> >  recipes-devtools/go/go-libtrust_git.bb     | 12 +++++++-----
> >  recipes-devtools/go/go-logrus_git.bb       | 12 +++++++-----
> >  recipes-devtools/go/go-metalinter_git.bb   |  8 +++++---
> >  recipes-devtools/go/go-mux_git.bb          | 12 +++++++-----
> >  recipes-devtools/go/go-patricia_git.bb     | 12 +++++++-----
> >  recipes-devtools/go/go-pty_git.bb          | 12 +++++++-----
> >  recipes-devtools/go/go-systemd_git.bb      | 12 +++++++-----
> >  recipes-devtools/go/grpc-go_git.bb         | 18 ++++++++++--------
> >  recipes-devtools/go/notary_git.bb          | 18 ++++++++++--------
> >  18 files changed, 137 insertions(+), 99 deletions(-)
> >  create mode 100644 classes/go.bbclass
> >
> > diff --git a/classes/go.bbclass b/classes/go.bbclass
> > new file mode 100644
> > index 0000000..273842c
> > --- /dev/null
> > +++ b/classes/go.bbclass
> > @@ -0,0 +1,4 @@
> > +# Set the target installation (sub)directory for go. The default is local,
> > +# to get binaries in /usr/local/bin, but on systems where e.g. /usr/bin is
> > +# the desired target that is achieved by setting this variable to "".
> > +LOCAL_SUBDIR_go ?= "/local"
>
> This will not work. There is already a go.bbclass in meta.
>

This was my immediate feedback as well, we'd never call such a class
go.bbclass, the name is far to generic .. and collides.

> However, unless I am mistaken, all paths that are replaced below are
> actually "${prefix}/local/go/src" (and no references to /usr/local/bin).
> Based on what is done in go.bbclass, I believe all these recipes are
> actually doing the wrong thing. They should package "${prefix}/local/go/src"
> in ${PN}-dev rather than ${PN} since the sources are only needed in
> build time.

They really have no benefit on target, since they were created (with a
few exceptions) to support the build (before we moved to other
techniques, and more packages started using vendor'd dependencies). So
I agree, they are -dev packages, not PN. Avoiding their install to
target completely is a better idea.

Joakim: is this what is happening to you ? They are in the DEPENDS,
and hence get the PN  RDEPENDS, then are installed to target, and that
is causing you issues ?

>
> Taking this a step further, I have a feeling all these recipes would
> benefit from being rewritten to use the go.bbclass, as I guess they
> predate it.

Yep, they definitely do predate it. Some packages have been updated,
but if something isn't causing a problem, it just stays as-is. That
being said, I bet that no one will have time to do the updating for a
while.

Cheers,

Bruce

>
> //Peter
>
> > diff --git a/recipes-devtools/go/compose-file_git.bb b/recipes-
> > devtools/go/compose-file_git.bb
> > index bcf8c3d..be2284e 100644
> > --- a/recipes-devtools/go/compose-file_git.bb
> > +++ b/recipes-devtools/go/compose-file_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "Parser for the Compose file format (version 3)"
> >  HOMEPAGE = "https://github.com/aanand/compose-file"
> >  SECTION = "devel/go"
> > @@ -19,23 +21,23 @@ do_compile() {
> >  }
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> >       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> > -         if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> > -             mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> > +         if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> > ]; then
> > +             mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> > $j)
> >           fi
> > -         cp $j ${D}${prefix}/local/go/$j
> > +         cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
> >       done
> > -     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_compose_file_sysroot_preprocess"
> >
> >  go_compose_file_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> >
> > -CLEANBROKEN = "1"
> > \ No newline at end of file
> > +CLEANBROKEN = "1"
> > diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-
> > devtools/go/go-capability_git.bb
> > index 8524af6..b4f9d1b 100644
> > --- a/recipes-devtools/go/go-capability_git.bb
> > +++ b/recipes-devtools/go/go-capability_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "Utilities for manipulating POSIX capabilities in Go."
> >  HOMEPAGE = "https://github.com/syndtr/gocapability"
> >  SECTION = "devel/go"
> > @@ -15,15 +17,15 @@ PV = "0.0+git${SRCPV}"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_capability_sysroot_preprocess"
> >
> >  go_capability_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-
> > cli_git.bb
> > index 434594c..2ef5a50 100644
> > --- a/recipes-devtools/go/go-cli_git.bb
> > +++ b/recipes-devtools/go/go-cli_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "A small package for building command line apps in Go"
> >  HOMEPAGE = "https://github.com/codegangsta/cli"
> >  SECTION = "devel/go"
> > @@ -15,15 +17,15 @@ PV = "1.1.0+git${SRCPV}"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_cli_sysroot_preprocess"
> >
> >  go_cli_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-connections_git.bb b/recipes-
> > devtools/go/go-connections_git.bb
> > index 5d071b0..57e2f14 100644
> > --- a/recipes-devtools/go/go-connections_git.bb
> > +++ b/recipes-devtools/go/go-connections_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "Utility package to work with network connections"
> >  HOMEPAGE = "https://github.com/docker/connections"
> >  SECTION = "devel/go"
> > @@ -19,21 +21,21 @@ do_compile() {
> >  }
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> >       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> > -         if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> > -             mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> > +         if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> > ]; then
> > +             mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> > $j)
> >           fi
> > -         cp $j ${D}${prefix}/local/go/$j
> > +         cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
> >       done
> > -     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_connections_sysroot_preprocess"
> >
> >  go_connections_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-
> > devtools/go/go-context_git.bb
> > index 15f6a8d..369b910 100644
> > --- a/recipes-devtools/go/go-context_git.bb
> > +++ b/recipes-devtools/go/go-context_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "A golang registry for global request variables."
> >  HOMEPAGE = "https://github.com/gorilla/context"
> >  SECTION = "devel/go"
> > @@ -14,15 +16,15 @@ SRCREV = "14f550f51af52180c2eefed15e5fd18d63c0a64a"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_context_sysroot_preprocess"
> >
> >  go_context_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-
> > dbus_git.bb
> > index 2390861..15b718e 100644
> > --- a/recipes-devtools/go/go-dbus_git.bb
> > +++ b/recipes-devtools/go/go-dbus_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "Native Go bindings for D-Bus"
> >  HOMEPAGE = "https://github.com/godbus/dbus"
> >  SECTION = "devel/go"
> > @@ -15,15 +17,15 @@ PV = "4.0.0+git${SRCPV}"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_dbus_sysroot_preprocess"
> >
> >  go_dbus_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-
> > devtools/go/go-distribution_git.bb
> > index 9e3f209..e81eea4 100644
> > --- a/recipes-devtools/go/go-distribution_git.bb
> > +++ b/recipes-devtools/go/go-distribution_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "The Docker toolset to pack, ship, store, and deliver
> > content"
> >  HOMEPAGE = "https://github.com/docker/distribution"
> >  SECTION = "devel/go"
> > @@ -19,21 +21,21 @@ do_compile() {
> >  }
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> >       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> > -         if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> > -             mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> > +         if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> > ]; then
> > +             mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> > $j)
> >           fi
> > -         cp $j ${D}${prefix}/local/go/$j
> > +         cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
> >       done
> > -     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_distribution_digeset_sysroot_preprocess"
> >
> >  go_distribution_digeset_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-
> > devtools/go/go-fsnotify_git.bb
> > index 0826aa7..3f5d769 100644
> > --- a/recipes-devtools/go/go-fsnotify_git.bb
> > +++ b/recipes-devtools/go/go-fsnotify_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "A golang registry for global request variables."
> >  HOMEPAGE = "https://github.com/go-fsnotify/fsnotify"
> >  SECTION = "devel/go"
> > @@ -15,15 +17,15 @@ PV = "1.2.11+git${SRCPV}"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_fsnotify_sysroot_preprocess"
> >
> >  go_fsnotify_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-
> > devtools/go/go-libtrust_git.bb
> > index 5565946..448423c 100644
> > --- a/recipes-devtools/go/go-libtrust_git.bb
> > +++ b/recipes-devtools/go/go-libtrust_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "Primitives for identity and authorization"
> >  HOMEPAGE = "https://github.com/docker/libtrust"
> >  SECTION = "devel/go"
> > @@ -15,15 +17,15 @@ PV = "0.0+git${SRCPV}"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_libtrust_sysroot_preprocess"
> >
> >  go_libtrust_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-
> > devtools/go/go-logrus_git.bb
> > index aa89033..12bb183 100644
> > --- a/recipes-devtools/go/go-logrus_git.bb
> > +++ b/recipes-devtools/go/go-logrus_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "A golang registry for global request variables."
> >  HOMEPAGE = "https://github.com/Sirupsen/logrus"
> >  SECTION = "devel/go"
> > @@ -15,15 +17,15 @@ PV = "0.11.0+git${SRCPV}"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_logrus_sysroot_preprocess"
> >
> >  go_logrus_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-metalinter_git.bb b/recipes-
> > devtools/go/go-metalinter_git.bb
> > index 668b431..fd5195b 100644
> > --- a/recipes-devtools/go/go-metalinter_git.bb
> > +++ b/recipes-devtools/go/go-metalinter_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "Go Meta Linter."
> >  HOMEPAGE = "https://github.com/alecthomas/gometalinter"
> >  SECTION = "devel/go"
> > @@ -17,8 +19,8 @@ PV = "0.0+git${SRCPV}"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-
> > mux_git.bb
> > index 7a2025a..a88ee69 100644
> > --- a/recipes-devtools/go/go-mux_git.bb
> > +++ b/recipes-devtools/go/go-mux_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "A powerful URL router and dispatcher for golang."
> >  HOMEPAGE = "https://github.com/gorilla/mux"
> >  SECTION = "devel/go"
> > @@ -14,15 +16,15 @@ SRCREV = "136d54f81f00414c45c3c68dd47e98cc97519c5e"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_mux_sysroot_preprocess"
> >
> >  go_mux_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-
> > devtools/go/go-patricia_git.bb
> > index 8c1e10d..a6aa66b 100644
> > --- a/recipes-devtools/go/go-patricia_git.bb
> > +++ b/recipes-devtools/go/go-patricia_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "A generic patricia trie (also called radix tree)
> > implemented in Go (Golang)"
> >  HOMEPAGE = "https://github.com/gorilla/context"
> >  SECTION = "devel/go"
> > @@ -15,15 +17,15 @@ PV = "2.2.6+git${SRCPV}"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_patricia_sysroot_preprocess"
> >
> >  go_patricia_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-
> > pty_git.bb
> > index bc94b31..53a53a0 100644
> > --- a/recipes-devtools/go/go-pty_git.bb
> > +++ b/recipes-devtools/go/go-pty_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "PTY interface for Go"
> >  HOMEPAGE = "https://github.com/kr/pty"
> >  SECTION = "devel/go"
> > @@ -14,15 +16,15 @@ SRCREV = "05017fcccf23c823bfdea560dcc958a136e54fb7"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_pty_sysroot_preprocess"
> >
> >  go_pty_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-
> > devtools/go/go-systemd_git.bb
> > index 0f89c0f..8c5e8ec 100644
> > --- a/recipes-devtools/go/go-systemd_git.bb
> > +++ b/recipes-devtools/go/go-systemd_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "Go bindings to systemd socket activation, journal, D-Bus,
> > and unit files"
> >  HOMEPAGE = "https://github.com/coreos/go-systemd"
> >  SECTION = "devel/go"
> > @@ -17,15 +19,15 @@ RDEPENDS_${PN} += "bash"
> >  S = "${WORKDIR}/git"
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > -     cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +     cp -r ${S}/*
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_systemd_sysroot_preprocess"
> >
> >  go_systemd_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-
> > devtools/go/grpc-go_git.bb
> > index 48c4249..ab4870c 100644
> > --- a/recipes-devtools/go/grpc-go_git.bb
> > +++ b/recipes-devtools/go/grpc-go_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "The Go language implementation of gRPC. HTTP/2 based RPC"
> >  HOMEPAGE = "https://github.com/grpc/grpc-go"
> >  SECTION = "devel/go"
> > @@ -19,23 +21,23 @@ do_compile() {
> >  }
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> >       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> > -         if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> > -             mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> > +         if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> > ]; then
> > +             mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> > $j)
> >           fi
> > -         cp $j ${D}${prefix}/local/go/$j
> > +         cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
> >       done
> > -     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_grpc_sysroot_preprocess"
> >
> >  go_grpc_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> >  FILES_${PN} += " \
> > -    ${prefix}/local/go/src/${PKG_NAME}/* \
> > +    ${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/* \
> >  "
> > diff --git a/recipes-devtools/go/notary_git.bb b/recipes-
> > devtools/go/notary_git.bb
> > index 9cfb46e..abfafc6 100644
> > --- a/recipes-devtools/go/notary_git.bb
> > +++ b/recipes-devtools/go/notary_git.bb
> > @@ -1,3 +1,5 @@
> > +inherit go
> > +
> >  DESCRIPTION = "Notary is a Docker project that allows anyone to have
> > trust over arbitrary collections of data"
> >  HOMEPAGE = "https://github.com/docker/notary"
> >  SECTION = "devel/go"
> > @@ -19,21 +21,21 @@ do_compile() {
> >  }
> >
> >  do_install() {
> > -     install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> > +     install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> >       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> > -         if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> > -             mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> > +         if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> > ]; then
> > +             mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> > $j)
> >           fi
> > -         cp $j ${D}${prefix}/local/go/$j
> > +         cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
> >       done
> > -     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}/local/go/src/${PKG_NAME}/
> > +     cp -r ${S}/src/${PKG_NAME}/LICENSE
> > ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
> >  }
> >
> >  SYSROOT_PREPROCESS_FUNCS += "go_notary_sysroot_preprocess"
> >
> >  go_notary_sysroot_preprocess () {
> > -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> > -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> > +    install -d
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> > ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> > ${PKG_NAME})
> >  }
> >
> > -FILES_${PN} += "${prefix}/local/go/src/${PKG_NAME}/*"
> > +FILES_${PN} += "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> > --
> > 2.20.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
