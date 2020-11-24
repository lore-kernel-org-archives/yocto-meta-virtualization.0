Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.873.1606241019791156677
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 10:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oXBw/aJI;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id bo9so24022426ejb.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Nov 2020 10:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mKtmfcRlaLoW9gtLFiri4L96nsSDLX8oHn0YPZaTTa8=;
        b=oXBw/aJI0NeSmRg3alFjAwQtG1FLrGm1NzbRu0MSYjIvVYbvnpM4PkPV0VZiyxWm6L
         6UTh5c7azdEc3tFO4O7Xmsb3lZoELikZ07ESP4mVKJSbwU6BOKAZ56awK2FMXC5D+kZ7
         T9th+YX6Bjzb/eJcsYcINv/iTrtPUB55vbmIqKUYsXE2E8BmLh2t6JJ2r+ZuixxJP3Z+
         dcORBVyk3IQo/ApIbG5ejw2X0D36tijBzLIzi1Q/3bXJgt8KrTBieN1xX6UAWhCkPYTY
         3JIR/nbM0Q1WeufzKY9DuF8rydtlIZsaVTn/cpBeuqv8U2Q2JmaawO9U5AwzwXRrlxu8
         osYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mKtmfcRlaLoW9gtLFiri4L96nsSDLX8oHn0YPZaTTa8=;
        b=FLozhBYubvkNFSmIC48HlX7GMxsltSkkgmCMF0GHZPeXm6d1ENJ1OBDK8HxHfc8bIW
         +LahtNjI9BenZQsS9mxGmuMrmTJM8noufqAOeiBeD68CmhXNsyUS4KGDs5eTlv7ib0UU
         4Wfx3i0Ot4H9T1Dh3/m+f9rqTa3+XcHuEJh+qs7VwfMto6A6k3rQ3AHdLaNqADAp2cla
         dwQRnvV/rZJKVwr4QKyarUrvjNnsucoMQyAG6CriC/QnbzViRGO1d/v03YOUmuI98wX1
         zl6uZS0VDwQDpVYVmKs1JYzOOLs2dV8PFvsVeLRHiIRNmImkkmXbG+fbPI+9jEro8m0h
         pB1A==
X-Gm-Message-State: AOAM533udrEaoWZgii1eEK33CSEb5nhNqoiuhFpz1oarxyY9WJDvspF1
	QEoAeabn5TdDpeB1OCc+lqnBgWLCxczOqHRFi9Y=
X-Google-Smtp-Source: ABdhPJx+w38MGejTOuGTCxhw7DD7qyDLY+eQ5Cz9A0QQuUaW3isgEK4Gdstu1ihGDslYl3Jal3rjAx+mCPSbgztgiME=
X-Received: by 2002:a17:907:4335:: with SMTP id ni5mr5181984ejb.459.1606241018055;
 Tue, 24 Nov 2020 10:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20201124172012.318030-1-maciej.pijanowski@3mdeb.com>
In-Reply-To: <20201124172012.318030-1-maciej.pijanowski@3mdeb.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 24 Nov 2020 13:03:26 -0500
Message-ID: <CADkTA4N2RAG1MSBrSWxgwwo2f=GN7zpM0r8OLgrLH82xE8vNSw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] balena-engine: add recipe
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004e136f05b4de2133"

--0000000000004e136f05b4de2133
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 12:20 PM Maciej Pijanowski <
maciej.pijanowski@3mdeb.com> wrote:

> As explained in [1], I have created the balena-engine recipe which could=
 be
> used in "regular" Yocto/OE builds (outside of the balenaOS). The
> recipe is mostly a copy of the original recipe from meta-balena,
> stripped from the balenaOS-specific parts so it can be compiled and
> build outside of it. This recipe was tested at build and runtime
> on the dunfell release on two targets: RPi4 and qemux86-64.
>

Thanks for the contribution, it is most appreciated. The recipe
unfortunately raises some concerns .. and something that we can work
through.


>
> [1] https://lists.yoctoproject.org/g/meta-virtualization/message/5913
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  ...dcoded-CC-on-cross-compile-docker-ce.patch |  60 +++++++
>  .../balena-engine/balena-tmpfiles.conf        |   2 +
>  .../balena-engine/balena-engine_git.bb        | 159 ++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644
> recipes-containers/balena-engine/balena-engine/0001-imporve-hardcoded-CC=
-on-cross-compile-docker-ce.patch
>  create mode 100644
> recipes-containers/balena-engine/balena-engine/balena-tmpfiles.conf
>  create mode 100644 recipes-containers/balena-engine/balena-engine_git.b=
b
>
> diff --git
> a/recipes-containers/balena-engine/balena-engine/0001-imporve-hardcoded-=
CC-on-cross-compile-docker-ce.patch
> b/recipes-containers/balena-engine/balena-engine/0001-imporve-hardcoded-=
CC-on-cross-compile-docker-ce.patch
> new file mode 100644
> index 000000000000..0f257f1bd964
> --- /dev/null
> +++
> b/recipes-containers/balena-engine/balena-engine/0001-imporve-hardcoded-=
CC-on-cross-compile-docker-ce.patch
> @@ -0,0 +1,60 @@
> +From 1263fdb50a540e9db742694b7cee08284ad986d0 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 17 Jul 2019 17:34:04 +0800
> +Subject: [PATCH] imporve hardcoded CC on cross compile
> +
> +Since commit applied in moby [61a3285 Support cross-compile for arm]
> +it hardcoded var-CC to support cross-compile for arm
> +
> +Correct it with "${parameter:-word}" format, it is helpful for user
> +define toolchains
> +
> +(Use Default Values.  If parameter is unset or null, the expansion of
> +word is substituted.  Otherwise, the value of parameter is substituted.=
)
> +
> +Upstream-Status: Submitted [https://github.com/moby/moby/pull/39546]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + hack/make/.binary | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/import/hack/make/.binary b/src/import/hack/make/.binar=
y
> +index 53de6749e5..66f4ca05f3 100644
> +--- a/src/import/hack/make/.binary
> ++++ b/src/import/hack/make/.binary
> +@@ -44,27 +44,27 @@ if [ "$(go env GOOS)/$(go env GOARCH)" !=3D "$(go e=
nv
> GOHOSTOS)/$(go env GOHOSTARC
> +       # must be cross-compiling!
> +       case "$(go env GOOS)/$(go env GOARCH)" in
> +               windows/amd64)
> +-                      export CC=3Dx86_64-w64-mingw32-gcc
> ++                      export CC=3D"${CC:-x86_64-w64-mingw32-gcc}"
> +                       export CGO_ENABLED=3D1
> +                       ;;
> +               linux/arm)
> +                       case "${GOARM}" in
> +                       5|"")
> +-                              export CC=3Darm-linux-gnueabi-gcc
> ++                              export CC=3D"${CC:-arm-linux-gnueabi-gcc=
}"
> +                               export CGO_ENABLED=3D1
> +                               ;;
> +                       7)
> +-                              export CC=3Darm-linux-gnueabihf-gcc
> ++                              export CC=3D"${CC:-arm-linux-gnueabihf-g=
cc}"
> +                               export CGO_ENABLED=3D1
> +                               ;;
> +                       esac
> +                       ;;
> +               linux/arm64)
> +-                      export CC=3Daarch64-linux-gnu-gcc
> ++                      export CC=3D"${CC:-aarch64-linux-gnu-gcc}"
> +                       export CGO_ENABLED=3D1
> +                       ;;
> +               linux/amd64)
> +-                      export CC=3Dx86_64-linux-gnu-gcc
> ++                      export CC=3D"${CC:-x86_64-linux-gnu-gcc}"
> +                       export CGO_ENABLED=3D1
> +                       ;;
> +       esac
> +--
> +2.23.0
> diff --git
> a/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.conf
> b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.conf
> new file mode 100644
> index 000000000000..548a25d3ae49
> --- /dev/null
> +++ b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.con=
f
> @@ -0,0 +1,2 @@
> +L      /run/docker.pid -       -       -       -
>  /run/balena-engine.pid
> +L      /run/balena.pid -       -       -       -
>  /run/balena-engine.pid
> diff --git a/recipes-containers/balena-engine/balena-engine_git.bb
> b/recipes-containers/balena-engine/balena-engine_git.bb
> new file mode 100644
> index 000000000000..5d78dc02350f
> --- /dev/null
> +++ b/recipes-containers/balena-engine/balena-engine_git.bb
> @@ -0,0 +1,159 @@
> +HOMEPAGE =3D "https://www.balena.io/"
> +SUMMARY =3D "A Moby-based container engine for IoT"
> +DESCRIPTION =3D "Balena is a new container engine purpose-built for
> embedded \
> +and IoT use cases and compatible with Docker containers. Based on
> Docker=E2=80=99s \
> +Moby Project, balena supports container deltas for 10-70x more efficien=
t \
> +bandwidth usage, has 3.5x smaller binaries, uses RAM and storage more \
> +conservatively, and focuses on atomicity and durability of container \
> +pulling."
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D
> "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
> +
> +inherit systemd go pkgconfig useradd
> +
> +BALENA_VERSION =3D "19.03.13-dev"
> +BALENA_BRANCH=3D "master"
> +
> +SRCREV =3D "074a481789174b4b6fd2d706086e8ffceb72e924"
> +SRC_URI =3D "\
> +       git://
> github.com/balena-os/balena-engine.git;branch=3D${BALENA_BRANCH};destsuf=
fix=3Dgit/src/import
> <http://github.com/balena-os/balena-engine.git;branch=3D$%7BBALENA_BRANC=
H%7D;destsuffix=3Dgit/src/import>
> \
> +       file://0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.patc=
h \
>
The fact that we have to duplicate that patch, exposes an issue.

It comes down to the fact that we already have containerd, moby, runc, etc=
,
recipes.

Having vendored copies for all of the engine variants is a problem, and on=
e
what I'm looking to solve.  I can help on that front, but it won't be unti=
l
after I've finished getting k3s working and merged.

See more specific comments below.



> +        file://balena-tmpfiles.conf \
> +       "
> +
> +S =3D "${WORKDIR}/git"
> +
> +PV =3D "${BALENA_VERSION}+git${SRCREV}"
> +
> +SECURITY_CFLAGS =3D "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_LDFLAGS =3D ""
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE_${PN} =3D "balena-engine.service balena-engine.socket"
> +GO_IMPORT =3D "import"
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM_${PN} =3D "-r balena-engine"
> +
> +DEPENDS_append_class-target =3D " systemd"
> +RDEPENDS_${PN}_class-target =3D "curl util-linux iptables tini systemd =
bash"
> +RRECOMMENDS_${PN} +=3D "kernel-module-nf-nat kernel-module-br-netfilter
> kernel-module-nf-conntrack-netlink kernel-module-xt-masquerade
> kernel-module-xt-addrtype"
> +
> +# oe-meta-go recipes try to build go-cross-native
>

oe-meta-go shouldn't be relevant anymore .. neither should those _remove's=
.



> +DEPENDS_remove_class-native =3D "go-cross-native"
> +DEPENDS_append_class-native =3D " go-native"
> +
> +INSANE_SKIP_${PN} +=3D "already-stripped"
> +
> +FILES_${PN} +=3D " \
> +       /lib/systemd/system/* \
>

/lib shouldn't be hardcoded.

+       /home/root \
>

neither should /home/root/



> +       /boot/init \
> +       /boot/storage-driver \
> +       ${localstatedir} \
> +       "
> +
> +DOCKER_PKG=3D"github.com/docker/docker"
> +
> +# By default no extra LDFLAGS needed when compiling mobynit
> +MOBYNIT_EXTRA_LDFLAGS ??=3D ""
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +       export PATH=3D${STAGING_BINDIR_NATIVE}/${HOST_SYS}:$PATH
> +
> +       export GOCACHE=3D"${B}/.cache"
> +       export GOHOSTOS=3D"linux"
> +       export GOOS=3D"linux"
> +       case "${TARGET_ARCH}" in
> +               x86_64)
> +                       GOARCH=3Damd64
> +                       ;;
> +               i586|i686)
> +                       GOARCH=3D386
> +                       ;;
> +               arm)
> +                       GOARCH=3D${TARGET_ARCH}
> +                       case "${TUNE_PKGARCH}" in
> +                               cortexa*)
> +                                       export GOARM=3D7
> +                                       ;;
> +                       esac
> +                       ;;
> +               aarch64)
> +                       # ARM64 is invalid for Go 1.4
> +                       GOARCH=3Darm64
> +               ;;
> +               *)
> +                       GOARCH=3D"${TARGET_ARCH}"
> +               ;;
> +       esac
> +       export GOARCH
>

There are already classes that deal with the arch mapping, it doesn't
belong in individual recipes.

+
> +       # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> +       # docker to download its dependencies but rather
> +       # use dependencies packaged independently.
> +       cd ${S}/src/import
> +       rm -rf .gopath
> +       mkdir -p .gopath/src/"$(dirname "${DOCKER_PKG}")"
> +       ln -sf ../../../.. .gopath/src/"${DOCKER_PKG}"
> +       export
> GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_T=
ARGET}/${prefix}/local/go"
> +
> +       export CGO_ENABLED=3D"1"
> +
> +       # Pass the needed cflags/ldflags so that cgo
> +       # can find the needed headers files and libraries
> +       export CGO_CFLAGS=3D"${CFLAGS} --sysroot=3D${STAGING_DIR_TARGET}=
"
> +       export CGO_LDFLAGS=3D"${LDFLAGS}  --sysroot=3D${STAGING_DIR_TARG=
ET}"
> +
> +       export DOCKER_GITCOMMIT=3D"${SRCREV}"
> +       export DOCKER_BUILDTAGS=3D"no_buildkit no_btrfs no_cri no_devmap=
per
> no_zfs exclude_disk_quota exclude_graphdriver_btrfs
> exclude_graphdriver_devicemapper exclude_graphdriver_zfs"
>

As we've already solved in the other docker/moby recipes, we any setting o=
f
buildtags needs to be by variable, so it can be overriden by bbappends, et=
c.



> +       export DOCKER_LDFLAGS=3D"-s"
> +
> +       VERSION=3D${BALENA_VERSION} ./hack/make.sh dynbinary-balena
>

And here we are with the repeated moby build infrastructure.

I am curious as to why mainline moby won't work for this.



> +
> +       # Compile mobynit
> +       cd .gopath/src/"${DOCKER_PKG}"/cmd/mobynit
> +       go build -ldflags '-extldflags "-static ${MOBYNIT_EXTRA_LDFLAGS}=
"'
> .
>

This shouldn't be using 'go' directly, at the least, it should be using th=
e
variables as defined in the go classes.

But again, this is solving and duplicating all the fixes that we've had to
do over time in the existing moby recipe. .. this is less than ideal. and
anything that we haven't solved there, we should actually be fixing there.


> +       cd -
> +}
> +
> +do_install() {
> +       mkdir -p ${D}/${bindir}
> +       install -m 0755
> ${S}/src/import/bundles/dynbinary-balena/balena-engine
> ${D}/${bindir}/balena-engine
> +       # install -d ${D}/boot
> +       # install -m 0755 ${S}/src/import/cmd/mobynit/mobynit
> ${D}/boot/init
> +       # echo ${BALENA_STORAGE} > ${D}/boot/storage-driver
> +
> +       ln -sf balena-engine ${D}/${bindir}/balena
> +       ln -sf balena-engine ${D}/${bindir}/balenad
> +       ln -sf balena-engine ${D}/${bindir}/balena-containerd
> +       ln -sf balena-engine ${D}/${bindir}/balena-containerd-shim
> +       ln -sf balena-engine ${D}/${bindir}/balena-containerd-ctr
> +       ln -sf balena-engine ${D}/${bindir}/balena-runc
> +       ln -sf balena-engine ${D}/${bindir}/balena-proxy
> +
> +       ln -sf balena-engine ${D}/${bindir}/balena-engine-daemon
> +       ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd
> +       ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd-shi=
m
> +       ln -sf balena-engine ${D}/${bindir}/balena-engine-containerd-ctr
> +       ln -sf balena-engine ${D}/${bindir}/balena-engine-runc
> +       ln -sf balena-engine ${D}/${bindir}/balena-engine-proxy
>

Outside of the branding, what's the difference between these binaries and
when we build the upstream project variants ?



> +
> +       install -d ${D}${systemd_unitdir}/system
> +       install -m 0644
> ${S}/src/import/contrib/init/systemd/balena-engine.socket
> ${D}/${systemd_unitdir}/system
> +       install -m 0644
> ${S}/src/import/contrib/init/systemd/balena-engine.service
> ${D}/${systemd_unitdir}/system
>

The init system is variable, and should be checked before attempting to
install services.



> +
> +       install -d ${D}/home/root/.docker
> +       ln -sf .docker ${D}/home/root/.balena
> +       ln -sf .docker ${D}/home/root/.balena-engine
>

As mentioned above /home/room, shouldn't be hardcoded.



> +
> +       install -d ${D}${localstatedir}/lib/docker
>

Now we are polluting namespaces. A balena recipe making directories called
"docker". This is the issue I had with k3s and CNI, and my concern about
all the vendored versions we are getting in the container recipes.



> +       ln -sf docker ${D}${localstatedir}/lib/balena
> +       ln -sf docker ${D}${localstatedir}/lib/balena-engine
> +
> +       install -d ${D}${sysconfdir}/tmpfiles.d
> +       install -m 0644 ${WORKDIR}/balena-tmpfiles.conf
> ${D}${sysconfdir}/tmpfiles.d/
> +}
> +
> +BBCLASSEXTEND =3D " native"
>

Where is this being used natively ?

Bruce



> --
> 2.25.1
>
>
>=20
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004e136f05b4de2133
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 12:20 PM Maciej Pijanowski =
&lt;<a href=3D"mailto:maciej.pijanowski@3mdeb.com">maciej.pijanowski@3mdeb.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">As explained in [1], I have created the balena-engine recipe which could=
 be<br>
used in &quot;regular&quot; Yocto/OE builds (outside of the balenaOS). The=
<br>
recipe is mostly a copy of the original recipe from meta-balena,<br>
stripped from the balenaOS-specific parts so it can be compiled and<br>
build outside of it. This recipe was tested at build and runtime<br>
on the dunfell release on two targets: RPi4 and qemux86-64.<br></blockquot=
e><div><br></div><div><div>Thanks for the contribution, it is most apprecia=
ted. The recipe unfortunately raises some concerns ..<span class=3D"gmail_d=
efault" style=3D"font-size:small"> and something that we can work through.<=
/span><br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
[1] <a href=3D"https://lists.yoctoproject.org/g/meta-virtualization/messag=
e/5913" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/g/meta-virtualization/message/5913</a><br>
<br>
Signed-off-by: Maciej Pijanowski &lt;<a href=3D"mailto:maciej.pijanowski@3=
mdeb.com" target=3D"_blank">maciej.pijanowski@3mdeb.com</a>&gt;<br>
---<br>
=C2=A0...dcoded-CC-on-cross-compile-docker-ce.patch |=C2=A0 60 +++++++<br>
=C2=A0.../balena-engine/balena-tmpfiles.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
=C2=A0.../balena-engine/<a href=3D"http://balena-engine_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">balena-engine_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 159 ++++++++++++++++++<br>
=C2=A03 files changed, 221 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/balena-engine/balena-engine/00=
01-imporve-hardcoded-CC-on-cross-compile-docker-ce.patch<br>
=C2=A0create mode 100644 recipes-containers/balena-engine/balena-engine/ba=
lena-tmpfiles.conf<br>
=C2=A0create mode 100644 recipes-containers/balena-engine/<a href=3D"http:=
//balena-engine_git.bb" rel=3D"noreferrer" target=3D"_blank">balena-engine_=
git.bb</a><br>
<br>
diff --git a/recipes-containers/balena-engine/balena-engine/0001-imporve-h=
ardcoded-CC-on-cross-compile-docker-ce.patch b/recipes-containers/balena-en=
gine/balena-engine/0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.pat=
ch<br>
new file mode 100644<br>
index 000000000000..0f257f1bd964<br>
--- /dev/null<br>
+++ b/recipes-containers/balena-engine/balena-engine/0001-imporve-hardcode=
d-CC-on-cross-compile-docker-ce.patch<br>
@@ -0,0 +1,60 @@<br>
+From 1263fdb50a540e9db742694b7cee08284ad986d0 Mon Sep 17 00:00:00 2001<br=
>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=
=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Wed, 17 Jul 2019 17:34:04 +0800<br>
+Subject: [PATCH] imporve hardcoded CC on cross compile<br>
+<br>
+Since commit applied in moby [61a3285 Support cross-compile for arm]<br>
+it hardcoded var-CC to support cross-compile for arm<br>
+<br>
+Correct it with &quot;${parameter:-word}&quot; format, it is helpful for =
user<br>
+define toolchains<br>
+<br>
+(Use Default Values.=C2=A0 If parameter is unset or null, the expansion o=
f<br>
+word is substituted.=C2=A0 Otherwise, the value of parameter is substitut=
ed.)<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/moby/moby/pull/=
39546" rel=3D"noreferrer" target=3D"_blank">https://github.com/moby/moby/pu=
ll/39546</a>]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com"=
 target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ hack/make/.binary | 10 +++++-----<br>
+ 1 file changed, 5 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/src/import/hack/make/.binary b/src/import/hack/make/.binary<=
br>
+index 53de6749e5..66f4ca05f3 100644<br>
+--- a/src/import/hack/make/.binary<br>
++++ b/src/import/hack/make/.binary<br>
+@@ -44,27 +44,27 @@ if [ &quot;$(go env GOOS)/$(go env GOARCH)&quot; !=3D=
 &quot;$(go env GOHOSTOS)/$(go env GOHOSTARC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# must be cross-compiling!<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$(go env GOOS)/$(go env GOARCH)&quo=
t; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0windows/amd64)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 export CC=3Dx86_64-w64-mingw32-gcc<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 export CC=3D&quot;${CC:-x86_64-w64-mingw32-gcc}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0export CGO_ENABLED=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/arm)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0case &quot;${GOARM}&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A05|&quot;&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3Darm-linux-gnueabi-gcc<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D&quot;${CC:-arm-linux-gnuea=
bi-gcc}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A07)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3Darm-linux-gnueabihf-gcc<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D&quot;${CC:-arm-linux-gnuea=
bihf-gcc}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/arm64)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 export CC=3Daarch64-linux-gnu-gcc<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 export CC=3D&quot;${CC:-aarch64-linux-gnu-gcc}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0export CGO_ENABLED=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/amd64)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 export CC=3Dx86_64-linux-gnu-gcc<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 export CC=3D&quot;${CC:-x86_64-linux-gnu-gcc}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0export CGO_ENABLED=3D1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+--<br>
+2.23.0<br>
diff --git a/recipes-containers/balena-engine/balena-engine/balena-tmpfile=
s.conf b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.con=
f<br>
new file mode 100644<br>
index 000000000000..548a25d3ae49<br>
--- /dev/null<br>
+++ b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.conf<=
br>
@@ -0,0 +1,2 @@<br>
+L=C2=A0 =C2=A0 =C2=A0 /run/docker.pid -=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0=
 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=
=A0/run/balena-engine.pid<br>
+L=C2=A0 =C2=A0 =C2=A0 /run/balena.pid -=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0=
 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=
=A0/run/balena-engine.pid<br>
diff --git a/recipes-containers/balena-engine/<a href=3D"http://balena-eng=
ine_git.bb" rel=3D"noreferrer" target=3D"_blank">balena-engine_git.bb</a> b=
/recipes-containers/balena-engine/<a href=3D"http://balena-engine_git.bb" r=
el=3D"noreferrer" target=3D"_blank">balena-engine_git.bb</a><br>
new file mode 100644<br>
index 000000000000..5d78dc02350f<br>
--- /dev/null<br>
+++ b/recipes-containers/balena-engine/<a href=3D"http://balena-engine_git=
.bb" rel=3D"noreferrer" target=3D"_blank">balena-engine_git.bb</a><br>
@@ -0,0 +1,159 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.balena.io/" rel=3D"noreferrer" =
target=3D"_blank">https://www.balena.io/</a>&quot;<br>
+SUMMARY =3D &quot;A Moby-based container engine for IoT&quot;<br>
+DESCRIPTION =3D &quot;Balena is a new container engine purpose-built for =
embedded \<br>
+and IoT use cases and compatible with Docker containers. Based on Docker=
=E2=80=99s \<br>
+Moby Project, balena supports container deltas for 10-70x more efficient =
\<br>
+bandwidth usage, has 3.5x smaller binaries, uses RAM and storage more \<b=
r>
+conservatively, and focuses on atomicity and durability of container \<br=
>
+pulling.&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;md5=3D4859e97a9c7780=
e77972d989f0823f28&quot;<br>
+<br>
+inherit systemd go pkgconfig useradd<br>
+<br>
+BALENA_VERSION =3D &quot;19.03.13-dev&quot;<br>
+BALENA_BRANCH=3D &quot;master&quot;<br>
+<br>
+SRCREV =3D &quot;074a481789174b4b6fd2d706086e8ffceb72e924&quot;<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/balena-os/b=
alena-engine.git;branch=3D$%7BBALENA_BRANCH%7D;destsuffix=3Dgit/src/import"=
 rel=3D"noreferrer" target=3D"_blank">github.com/balena-os/balena-engine.gi=
t;branch=3D${BALENA_BRANCH};destsuffix=3Dgit/src/import</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-imporve-hardcoded-CC-on-cross-comp=
ile-docker-ce.patch \<br></blockquote><div><div class=3D"gmail_default" sty=
le=3D"font-size:small"></div></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">The fact that we have to duplicate that patch, expose=
s an issue.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">It comes down=
 to the fact that we already have containerd, moby, runc, etc, recipes.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Having vendored copies for a=
ll of the engine variants is a problem, and one what I&#39;m looking to sol=
ve.=C2=A0 I can help on that front, but it won&#39;t be until after I&#39;v=
e finished getting k3s working and merged.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">See more specific comments below.</div><br></div><div>=C2=
=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://balena-tmpfiles.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+PV =3D &quot;${BALENA_VERSION}+git${SRCREV}&quot;<br>
+<br>
+SECURITY_CFLAGS =3D &quot;${SECURITY_NOPIE_CFLAGS}&quot;<br>
+SECURITY_LDFLAGS =3D &quot;&quot;<br>
+<br>
+SYSTEMD_PACKAGES =3D &quot;${PN}&quot;<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;balena-engine.service balena-engine.socke=
t&quot;<br>
+GO_IMPORT =3D &quot;import&quot;<br>
+USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
+GROUPADD_PARAM_${PN} =3D &quot;-r balena-engine&quot;<br>
+<br>
+DEPENDS_append_class-target =3D &quot; systemd&quot;<br>
+RDEPENDS_${PN}_class-target =3D &quot;curl util-linux iptables tini syste=
md bash&quot;<br>
+RRECOMMENDS_${PN} +=3D &quot;kernel-module-nf-nat kernel-module-br-netfil=
ter kernel-module-nf-conntrack-netlink kernel-module-xt-masquerade kernel-m=
odule-xt-addrtype&quot;<br>
+<br>
+# oe-meta-go recipes try to build go-cross-native<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">oe-meta=
-go shouldn&#39;t be relevant anymore .. neither should those _remove&#39;s=
.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+DEPENDS_remove_class-native =3D &quot;go-cross-native&quot;<br>
+DEPENDS_append_class-native =3D &quot; go-native&quot;<br>
+<br>
+INSANE_SKIP_${PN} +=3D &quot;already-stripped&quot;<br>
+<br>
+FILES_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/lib/systemd/system/* \<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">/lib s=
houldn&#39;t be hardcoded.</div><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/home/root \<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">neither should /h=
ome/root/</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/boot/init \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/boot/storage-driver \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+DOCKER_PKG=3D&quot;<a href=3D"http://github.com/docker/docker" rel=3D"nor=
eferrer" target=3D"_blank">github.com/docker/docker</a>&quot;<br>
+<br>
+# By default no extra LDFLAGS needed when compiling mobynit<br>
+MOBYNIT_EXTRA_LDFLAGS ??=3D &quot;&quot;<br>
+<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export PATH=3D${STAGING_BINDIR_NATIVE}/${HOST_=
SYS}:$PATH<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOCACHE=3D&quot;${B}/.cache&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOHOSTOS=3D&quot;linux&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOOS=3D&quot;linux&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;${TARGET_ARCH}&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0GOARCH=3Damd64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i586|i686)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0GOARCH=3D386<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0GOARCH=3D${TARGET_ARCH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0case &quot;${TUNE_PKGARCH}&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export G=
OARM=3D7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0# ARM64 is invalid for Go 1.4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0GOARCH=3Darm64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0GOARCH=3D&quot;${TARGET_ARCH}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">There are alread=
y classes that deal with the arch mapping, it doesn&#39;t belong in individ=
ual recipes.</div></div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Set GOPATH. See &#39;PACKAGERS.md&#39;. Don&=
#39;t rely on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# docker to download its dependencies but rath=
er<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# use dependencies packaged independently.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf .gopath<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p .gopath/src/&quot;$(dirname &quot;${D=
OCKER_PKG}&quot;)&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../.. .gopath/src/&quot;${DOCKER_=
PKG}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import/.gopath:=
${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# can find the needed headers files and librar=
ies<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS}=C2=A0 --=
sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_GITCOMMIT=3D&quot;${SRCREV}&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_BUILDTAGS=3D&quot;no_buildkit no=
_btrfs no_cri no_devmapper no_zfs exclude_disk_quota exclude_graphdriver_bt=
rfs exclude_graphdriver_devicemapper exclude_graphdriver_zfs&quot;<br></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">As we&#39;ve already solved in the other docker/moby recipes, we an=
y setting of buildtags needs to be by variable, so it can be overriden=C2=
=A0by bbappends, etc.</div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_LDFLAGS=3D&quot;-s&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0VERSION=3D${BALENA_VERSION} ./hack/make.sh dyn=
binary-balena<br></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">And here we are with the repeated moby build =
infrastructure.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">I am curi=
ous as to why mainline moby won&#39;t work for this.</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Compile mobynit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd .gopath/src/&quot;${DOCKER_PKG}&quot;/cmd/m=
obynit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0go build -ldflags &#39;-extldflags &quot;-stat=
ic ${MOBYNIT_EXTRA_LDFLAGS}&quot;&#39; .<br></blockquote><div><br></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small">This shouldn&#39;t=
 be using &#39;go&#39; directly, at the least, it should be using the varia=
bles as defined in the go classes.=C2=A0</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">But again, this is solving and duplicating all the fixes th=
at we&#39;ve had to do over time in the existing moby recipe. .. this is le=
ss than ideal. and anything that we haven&#39;t solved there, we should act=
ually be fixing there.</div></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/src/import/bundles/dynbin=
ary-balena/balena-engine ${D}/${bindir}/balena-engine<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# install -d ${D}/boot<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# install -m 0755 ${S}/src/import/cmd/mobynit/=
mobynit ${D}/boot/init<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# echo ${BALENA_STORAGE} &gt; ${D}/boot/storag=
e-driver<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balenad<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-con=
tainerd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-con=
tainerd-shim<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-con=
tainerd-ctr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-run=
c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-pro=
xy<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-eng=
ine-daemon<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-eng=
ine-containerd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-eng=
ine-containerd-shim<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-eng=
ine-containerd-ctr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-eng=
ine-runc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/balena-eng=
ine-proxy<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">Outside of the branding, what&#39;s the differenc=
e between these binaries and when we build the upstream project variants ?<=
/div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/src/import/contrib/init/s=
ystemd/balena-engine.socket ${D}/${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/src/import/contrib/init/s=
ystemd/balena-engine.service ${D}/${systemd_unitdir}/system<br></blockquote=
><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>The init system is variable, and should be checked before attempting to in=
stall services.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/home/root/.docker<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf .docker ${D}/home/root/.balena<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf .docker ${D}/home/root/.balena-engine<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">As mentioned above /home/room, shouldn&#39;t be hardcoded.</=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/docker<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">Now we are polluting namespaces. A balena recipe making direct=
ories called &quot;docker&quot;. This is the issue I had with k3s and CNI, =
and my concern about all the vendored versions we are getting in the contai=
ner recipes.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf docker ${D}${localstatedir}/lib/balena<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf docker ${D}${localstatedir}/lib/balena-=
engine<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/tmpfiles.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/balena-tmpfiles.con=
f ${D}${sysconfdir}/tmpfiles.d/<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot; native&quot;<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Where is this being=
 used natively ?</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--0000000000004e136f05b4de2133--
