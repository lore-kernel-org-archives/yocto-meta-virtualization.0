Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.9251.1584734243888642036
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 Mar 2020 12:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kb/x7YPX;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=29452; q=dns/txt; s=axis-central1;
  t=1584734244; x=1616270244;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QgzOFqGcwCgp4i92XABt32gADAS2TDqauPFI7FLPiNU=;
  b=kb/x7YPXigYFMsoaLtDzYjTQcPGvqbjdOV6/YpIWXfCwd6YZ58DHvIbs
   2K82sleewLL4OQGt1KxyfQKoIroAbg7utAlGjmge6CJgnDwDdPqsg74B8
   jJEhXg8FVAbDtI6uL+/W2XFZx0TX6KhyaXh3Bsj85jtjI8kApTTmkZkz8
   c710uxwiR362ZJ5yjN/Z2440yGc537UlmL90UwfdinXMK5ijSV7OTjDe1
   y22K296YEyYVI39ffjDqplV7gxkc/F8chxczfLGRe2Y+rOaMr/etPTN6M
   Yvpw5jigEZfHFubwB4rZZbJvDAsfckrccP9pInap8V3iUvleHJhDesbnv
   w==;
IronPort-SDR: r1bhN9Kbyms+oW4v7/OpyrTgs5ZdL/hWheVBmqfDuOZgcDm7VC1mv0em4Aa14qkt5Ercx9VYkT
 ia0qZu9gjs35Jla5BldBIy4t41eb/6lgHU50hANOqdrbjEU7cImy4EbXzff2jVoeoWLjs99Lxh
 D2nGBwDwvYu2qRazvJx/Hv/k+jHFdzaX8r86gz8rR+Ujj0KPvnTLAhAHn2W8g/UZS4MYPASp/q
 IIgzR00xXJ8S91qw5g6izIg1+S+qyZjkbRiW8U387BCvnKwnytbO/sS4cyrBF6ETmhBGtkd8WR
 Zwk=
X-IronPort-AV: E=Sophos;i="5.72,285,1580770800"; 
   d="scan'208";a="6754967"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Joakim Roubert <Joakim.Roubert@axis.com>,
	"meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] go: Enable different target dir by using variable
Thread-Topic: [meta-virtualization][PATCH] go: Enable different target dir by
 using variable
Thread-Index: AQHV/sjw7wTsy5KOhEygzeyCTzULVqhR0+Sg
Date: Fri, 20 Mar 2020 19:57:21 +0000
Message-ID: <7eba015ce34d41618ff6ed2d738b1696@XBOX03.axis.com>
References: <20200320095124.3297-1-joakimr@axis.com>
In-Reply-To: <20200320095124.3297-1-joakimr@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-
> virtualization@lists.yoctoproject.org> On Behalf Of Joakim Roubert
> Sent: den 20 mars 2020 10:51
> To: meta-virtualization@lists.yoctoproject.org
> Cc: Joakim Roubert <Joakim.Roubert@axis.com>
> Subject: [meta-virtualization][PATCH] go: Enable different target dir by
> using variable
>=20
> Enable setting the target installation (sub)directory for go by adding
> such a variable in a class (go.class). The default target installation
> value is local, to get binaries in /usr/local/bin just like before. But
> on systems where e.g. /usr/bin is the desired target that is achieved by
> setting this variable to "".
>=20
> Change-Id: I1a3de8e70340931391cd4382cba2478403ae27ce
> Signed-off-by: Joakim Roubert <joakimr@axis.com>
> ---
>  classes/go.bbclass                         |  4 ++++
>  recipes-devtools/go/compose-file_git.bb    | 20 +++++++++++---------
>  recipes-devtools/go/go-capability_git.bb   | 12 +++++++-----
>  recipes-devtools/go/go-cli_git.bb          | 12 +++++++-----
>  recipes-devtools/go/go-connections_git.bb  | 18 ++++++++++--------
>  recipes-devtools/go/go-context_git.bb      | 12 +++++++-----
>  recipes-devtools/go/go-dbus_git.bb         | 12 +++++++-----
>  recipes-devtools/go/go-distribution_git.bb | 18 ++++++++++--------
>  recipes-devtools/go/go-fsnotify_git.bb     | 12 +++++++-----
>  recipes-devtools/go/go-libtrust_git.bb     | 12 +++++++-----
>  recipes-devtools/go/go-logrus_git.bb       | 12 +++++++-----
>  recipes-devtools/go/go-metalinter_git.bb   |  8 +++++---
>  recipes-devtools/go/go-mux_git.bb          | 12 +++++++-----
>  recipes-devtools/go/go-patricia_git.bb     | 12 +++++++-----
>  recipes-devtools/go/go-pty_git.bb          | 12 +++++++-----
>  recipes-devtools/go/go-systemd_git.bb      | 12 +++++++-----
>  recipes-devtools/go/grpc-go_git.bb         | 18 ++++++++++--------
>  recipes-devtools/go/notary_git.bb          | 18 ++++++++++--------
>  18 files changed, 137 insertions(+), 99 deletions(-)
>  create mode 100644 classes/go.bbclass
>=20
> diff --git a/classes/go.bbclass b/classes/go.bbclass
> new file mode 100644
> index 0000000..273842c
> --- /dev/null
> +++ b/classes/go.bbclass
> @@ -0,0 +1,4 @@
> +# Set the target installation (sub)directory for go. The default is loca=
l,
> +# to get binaries in /usr/local/bin, but on systems where e.g. /usr/bin =
is
> +# the desired target that is achieved by setting this variable to "".
> +LOCAL_SUBDIR_go ?=3D "/local"

This will not work. There is already a go.bbclass in meta.

However, unless I am mistaken, all paths that are replaced below are=20
actually "${prefix}/local/go/src" (and no references to /usr/local/bin).
Based on what is done in go.bbclass, I believe all these recipes are=20
actually doing the wrong thing. They should package "${prefix}/local/go/src=
"
in ${PN}-dev rather than ${PN} since the sources are only needed in=20
build time.

Taking this a step further, I have a feeling all these recipes would=20
benefit from being rewritten to use the go.bbclass, as I guess they=20
predate it.

//Peter

> diff --git a/recipes-devtools/go/compose-file_git.bb b/recipes-
> devtools/go/compose-file_git.bb
> index bcf8c3d..be2284e 100644
> --- a/recipes-devtools/go/compose-file_git.bb
> +++ b/recipes-devtools/go/compose-file_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "Parser for the Compose file format (version 3)"
>  HOMEPAGE =3D "https://github.com/aanand/compose-file"
>  SECTION =3D "devel/go"
> @@ -19,23 +21,23 @@ do_compile() {
>  }
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
>  	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> ]; then
> +	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> $j)
>  	    fi
> -	    cp $j ${D}${prefix}/local/go/$j
> +	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
>  	done
> -	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_compose_file_sysroot_preprocess"
>=20
>  go_compose_file_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
>=20
> -CLEANBROKEN =3D "1"
> \ No newline at end of file
> +CLEANBROKEN =3D "1"
> diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-
> devtools/go/go-capability_git.bb
> index 8524af6..b4f9d1b 100644
> --- a/recipes-devtools/go/go-capability_git.bb
> +++ b/recipes-devtools/go/go-capability_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "Utilities for manipulating POSIX capabilities in Go."
>  HOMEPAGE =3D "https://github.com/syndtr/gocapability"
>  SECTION =3D "devel/go"
> @@ -15,15 +17,15 @@ PV =3D "0.0+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_capability_sysroot_preprocess"
>=20
>  go_capability_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-
> cli_git.bb
> index 434594c..2ef5a50 100644
> --- a/recipes-devtools/go/go-cli_git.bb
> +++ b/recipes-devtools/go/go-cli_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "A small package for building command line apps in Go"
>  HOMEPAGE =3D "https://github.com/codegangsta/cli"
>  SECTION =3D "devel/go"
> @@ -15,15 +17,15 @@ PV =3D "1.1.0+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_cli_sysroot_preprocess"
>=20
>  go_cli_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-connections_git.bb b/recipes-
> devtools/go/go-connections_git.bb
> index 5d071b0..57e2f14 100644
> --- a/recipes-devtools/go/go-connections_git.bb
> +++ b/recipes-devtools/go/go-connections_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "Utility package to work with network connections"
>  HOMEPAGE =3D "https://github.com/docker/connections"
>  SECTION =3D "devel/go"
> @@ -19,21 +21,21 @@ do_compile() {
>  }
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
>  	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> ]; then
> +	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> $j)
>  	    fi
> -	    cp $j ${D}${prefix}/local/go/$j
> +	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
>  	done
> -	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_connections_sysroot_preprocess"
>=20
>  go_connections_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-
> devtools/go/go-context_git.bb
> index 15f6a8d..369b910 100644
> --- a/recipes-devtools/go/go-context_git.bb
> +++ b/recipes-devtools/go/go-context_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "A golang registry for global request variables."
>  HOMEPAGE =3D "https://github.com/gorilla/context"
>  SECTION =3D "devel/go"
> @@ -14,15 +16,15 @@ SRCREV =3D "14f550f51af52180c2eefed15e5fd18d63c0a64a"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_context_sysroot_preprocess"
>=20
>  go_context_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-
> dbus_git.bb
> index 2390861..15b718e 100644
> --- a/recipes-devtools/go/go-dbus_git.bb
> +++ b/recipes-devtools/go/go-dbus_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "Native Go bindings for D-Bus"
>  HOMEPAGE =3D "https://github.com/godbus/dbus"
>  SECTION =3D "devel/go"
> @@ -15,15 +17,15 @@ PV =3D "4.0.0+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_dbus_sysroot_preprocess"
>=20
>  go_dbus_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-
> devtools/go/go-distribution_git.bb
> index 9e3f209..e81eea4 100644
> --- a/recipes-devtools/go/go-distribution_git.bb
> +++ b/recipes-devtools/go/go-distribution_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "The Docker toolset to pack, ship, store, and deliver
> content"
>  HOMEPAGE =3D "https://github.com/docker/distribution"
>  SECTION =3D "devel/go"
> @@ -19,21 +21,21 @@ do_compile() {
>  }
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
>  	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> ]; then
> +	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> $j)
>  	    fi
> -	    cp $j ${D}${prefix}/local/go/$j
> +	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
>  	done
> -	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_distribution_digeset_sysroot_preproces=
s"
>=20
>  go_distribution_digeset_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-
> devtools/go/go-fsnotify_git.bb
> index 0826aa7..3f5d769 100644
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ b/recipes-devtools/go/go-fsnotify_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "A golang registry for global request variables."
>  HOMEPAGE =3D "https://github.com/go-fsnotify/fsnotify"
>  SECTION =3D "devel/go"
> @@ -15,15 +17,15 @@ PV =3D "1.2.11+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_fsnotify_sysroot_preprocess"
>=20
>  go_fsnotify_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-
> devtools/go/go-libtrust_git.bb
> index 5565946..448423c 100644
> --- a/recipes-devtools/go/go-libtrust_git.bb
> +++ b/recipes-devtools/go/go-libtrust_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "Primitives for identity and authorization"
>  HOMEPAGE =3D "https://github.com/docker/libtrust"
>  SECTION =3D "devel/go"
> @@ -15,15 +17,15 @@ PV =3D "0.0+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_libtrust_sysroot_preprocess"
>=20
>  go_libtrust_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-
> devtools/go/go-logrus_git.bb
> index aa89033..12bb183 100644
> --- a/recipes-devtools/go/go-logrus_git.bb
> +++ b/recipes-devtools/go/go-logrus_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "A golang registry for global request variables."
>  HOMEPAGE =3D "https://github.com/Sirupsen/logrus"
>  SECTION =3D "devel/go"
> @@ -15,15 +17,15 @@ PV =3D "0.11.0+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_logrus_sysroot_preprocess"
>=20
>  go_logrus_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-metalinter_git.bb b/recipes-
> devtools/go/go-metalinter_git.bb
> index 668b431..fd5195b 100644
> --- a/recipes-devtools/go/go-metalinter_git.bb
> +++ b/recipes-devtools/go/go-metalinter_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "Go Meta Linter."
>  HOMEPAGE =3D "https://github.com/alecthomas/gometalinter"
>  SECTION =3D "devel/go"
> @@ -17,8 +19,8 @@ PV =3D "0.0+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/go-
> mux_git.bb
> index 7a2025a..a88ee69 100644
> --- a/recipes-devtools/go/go-mux_git.bb
> +++ b/recipes-devtools/go/go-mux_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "A powerful URL router and dispatcher for golang."
>  HOMEPAGE =3D "https://github.com/gorilla/mux"
>  SECTION =3D "devel/go"
> @@ -14,15 +16,15 @@ SRCREV =3D "136d54f81f00414c45c3c68dd47e98cc97519c5e"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_mux_sysroot_preprocess"
>=20
>  go_mux_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-
> devtools/go/go-patricia_git.bb
> index 8c1e10d..a6aa66b 100644
> --- a/recipes-devtools/go/go-patricia_git.bb
> +++ b/recipes-devtools/go/go-patricia_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "A generic patricia trie (also called radix tree)
> implemented in Go (Golang)"
>  HOMEPAGE =3D "https://github.com/gorilla/context"
>  SECTION =3D "devel/go"
> @@ -15,15 +17,15 @@ PV =3D "2.2.6+git${SRCPV}"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_patricia_sysroot_preprocess"
>=20
>  go_patricia_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/go-
> pty_git.bb
> index bc94b31..53a53a0 100644
> --- a/recipes-devtools/go/go-pty_git.bb
> +++ b/recipes-devtools/go/go-pty_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "PTY interface for Go"
>  HOMEPAGE =3D "https://github.com/kr/pty"
>  SECTION =3D "devel/go"
> @@ -14,15 +16,15 @@ SRCREV =3D "05017fcccf23c823bfdea560dcc958a136e54fb7"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_pty_sysroot_preprocess"
>=20
>  go_pty_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-
> devtools/go/go-systemd_git.bb
> index 0f89c0f..8c5e8ec 100644
> --- a/recipes-devtools/go/go-systemd_git.bb
> +++ b/recipes-devtools/go/go-systemd_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "Go bindings to systemd socket activation, journal, D-Bu=
s,
> and unit files"
>  HOMEPAGE =3D "https://github.com/coreos/go-systemd"
>  SECTION =3D "devel/go"
> @@ -17,15 +19,15 @@ RDEPENDS_${PN} +=3D "bash"
>  S =3D "${WORKDIR}/git"
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> -	cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +	cp -r ${S}/*
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_systemd_sysroot_preprocess"
>=20
>  go_systemd_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-
> devtools/go/grpc-go_git.bb
> index 48c4249..ab4870c 100644
> --- a/recipes-devtools/go/grpc-go_git.bb
> +++ b/recipes-devtools/go/grpc-go_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "The Go language implementation of gRPC. HTTP/2 based RP=
C"
>  HOMEPAGE =3D "https://github.com/grpc/grpc-go"
>  SECTION =3D "devel/go"
> @@ -19,23 +21,23 @@ do_compile() {
>  }
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
>  	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> ]; then
> +	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> $j)
>  	    fi
> -	    cp $j ${D}${prefix}/local/go/$j
> +	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
>  	done
> -	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_grpc_sysroot_preprocess"
>=20
>  go_grpc_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
>  FILES_${PN} +=3D " \
> -    ${prefix}/local/go/src/${PKG_NAME}/* \
> +    ${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/* \
>  "
> diff --git a/recipes-devtools/go/notary_git.bb b/recipes-
> devtools/go/notary_git.bb
> index 9cfb46e..abfafc6 100644
> --- a/recipes-devtools/go/notary_git.bb
> +++ b/recipes-devtools/go/notary_git.bb
> @@ -1,3 +1,5 @@
> +inherit go
> +
>  DESCRIPTION =3D "Notary is a Docker project that allows anyone to have
> trust over arbitrary collections of data"
>  HOMEPAGE =3D "https://github.com/docker/notary"
>  SECTION =3D "devel/go"
> @@ -19,21 +21,21 @@ do_compile() {
>  }
>=20
>  do_install() {
> -	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
> +	install -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
>  	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
> -	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
> -	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
> +	    if [ ! -d ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname $j)
> ]; then
> +	        mkdir -p ${D}${prefix}${LOCAL_SUBDIR_go}/go/$(dirname
> $j)
>  	    fi
> -	    cp $j ${D}${prefix}/local/go/$j
> +	    cp $j ${D}${prefix}${LOCAL_SUBDIR_go}/go/$j
>  	done
> -	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}/local/go/src/${PKG_NAME}/
> +	cp -r ${S}/src/${PKG_NAME}/LICENSE
> ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/
>  }
>=20
>  SYSROOT_PREPROCESS_FUNCS +=3D "go_notary_sysroot_preprocess"
>=20
>  go_notary_sysroot_preprocess () {
> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}/local/go/src/$(dirname ${PKG_NAME})
> +    install -d
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> +    cp -r ${D}${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}
> ${SYSROOT_DESTDIR}${prefix}${LOCAL_SUBDIR_go}/go/src/$(dirname
> ${PKG_NAME})
>  }
>=20
> -FILES_${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
> +FILES_${PN} +=3D "${prefix}${LOCAL_SUBDIR_go}/go/src/${PKG_NAME}/*"
> --
> 2.20.1

