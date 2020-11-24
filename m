Received: from 9.mo177.mail-out.ovh.net (9.mo177.mail-out.ovh.net [46.105.72.238])
 by mx.groups.io with SMTP id smtpd.web09.4187.1606255542607447565
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Nov 2020 14:05:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 46.105.72.238, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player787.ha.ovh.net (unknown [10.108.57.178])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 4C1EA139836
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 24 Nov 2020 23:05:40 +0100 (CET)
Received: from 3mdeb.com (89-66-159-90.dynamic.chello.pl [89.66.159.90])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player787.ha.ovh.net (Postfix) with ESMTPSA id 7571818AC67D2;
	Tue, 24 Nov 2020 22:05:38 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R005fbb7154c-2f75-41a3-9233-0baf61f07cb2,
                    BC82A14BF08680DC96B4491CA353477796433981) smtp.auth=maciej.pijanowski@3mdeb.com
Subject: Re: [meta-virtualization][PATCH] balena-engine: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20201124172012.318030-1-maciej.pijanowski@3mdeb.com>
 <CADkTA4N2RAG1MSBrSWxgwwo2f=GN7zpM0r8OLgrLH82xE8vNSw@mail.gmail.com>
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
Message-ID: <a127abae-6215-306b-e466-9cfea8dd91ff@3mdeb.com>
Date: Tue, 24 Nov 2020 23:05:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4N2RAG1MSBrSWxgwwo2f=GN7zpM0r8OLgrLH82xE8vNSw@mail.gmail.com>
X-Ovh-Tracer-Id: 9489928839925673649
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedgudehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgesrgdtreertdefjeenucfhrhhomhepofgrtghivghjucfrihhjrghnohifshhkihcuoehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefiedutedvjeekjeehhefgueffuedvheetgffghfdtjeejkeegvdeiveegieejudenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsrghlvghnrgdqvghnghhinhgvpghgihhtrdgssgdpghhithhhuhgsrdgtohhmpdgsrghlvghnrgdrihhopdefmhguvggsrdgtohhmnecukfhppedtrddtrddtrddtpdekledrieeirdduheelrdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepmhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehmvghtrgdqvhhirhhtuhgrlhhiiigrthhiohhnsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
Content-Type: multipart/alternative;
 boundary="------------9FBFCCA8362BF4BFABAD76DB"
Content-Language: en-US

--------------9FBFCCA8362BF4BFABAD76DB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 24.11.2020 19:03, Bruce Ashfield wrote:
>
>
> On Tue, Nov 24, 2020 at 12:20 PM Maciej Pijanowski
> <maciej.pijanowski@3mdeb.com <mailto:maciej.pijanowski@3mdeb.com>> wrote=
:
>
>     As explained in [1], I have created the balena-engine recipe which
>     could be
>     used in "regular" Yocto/OE builds (outside of the balenaOS). The
>     recipe is mostly a copy of the original recipe from meta-balena,
>     stripped from the balenaOS-specific parts so it can be compiled and
>     build outside of it. This recipe was tested at build and runtime
>     on the dunfell release on two targets: RPi4 and qemux86-64.
>
>
> Thanks for the contribution, it is most appreciated. The recipe
> unfortunately raises some concerns ..and something that we can work
> through.
> =C2=A0
>
>
>     [1] https://lists.yoctoproject.org/g/meta-virtualization/message/591=
3
>
>     Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com
>     <mailto:maciej.pijanowski@3mdeb.com>>
>     ---
>     =C2=A0...dcoded-CC-on-cross-compile-docker-ce.patch |=C2=A0 60 +++++=
++
>     =C2=A0.../balena-engine/balena-tmpfiles.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 =C2=A02 +
>     =C2=A0.../balena-engine/balena-engine_git.bb
>     <http://balena-engine_git.bb>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 159 +++++=
+++++++++++++
>     =C2=A03 files changed, 221 insertions(+)
>     =C2=A0create mode 100644
>     recipes-containers/balena-engine/balena-engine/0001-imporve-hardcode=
d-CC-on-cross-compile-docker-ce.patch
>     =C2=A0create mode 100644
>     recipes-containers/balena-engine/balena-engine/balena-tmpfiles.conf
>     =C2=A0create mode 100644
>     recipes-containers/balena-engine/balena-engine_git.bb
>     <http://balena-engine_git.bb>
>
>     diff --git
>     a/recipes-containers/balena-engine/balena-engine/0001-imporve-hardco=
ded-CC-on-cross-compile-docker-ce.patch
>     b/recipes-containers/balena-engine/balena-engine/0001-imporve-hardco=
ded-CC-on-cross-compile-docker-ce.patch
>     new file mode 100644
>     index 000000000000..0f257f1bd964
>     --- /dev/null
>     +++
>     b/recipes-containers/balena-engine/balena-engine/0001-imporve-hardco=
ded-CC-on-cross-compile-docker-ce.patch
>     @@ -0,0 +1,60 @@
>     +From 1263fdb50a540e9db742694b7cee08284ad986d0 Mon Sep 17 00:00:00
>     2001
>     +From: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +Date: Wed, 17 Jul 2019 17:34:04 +0800
>     +Subject: [PATCH] imporve hardcoded CC on cross compile
>     +
>     +Since commit applied in moby [61a3285 Support cross-compile for arm=
]
>     +it hardcoded var-CC to support cross-compile for arm
>     +
>     +Correct it with "${parameter:-word}" format, it is helpful for user
>     +define toolchains
>     +
>     +(Use Default Values.=C2=A0 If parameter is unset or null, the expan=
sion of
>     +word is substituted.=C2=A0 Otherwise, the value of parameter is
>     substituted.)
>     +
>     +Upstream-Status: Submitted [https://github.com/moby/moby/pull/39546=
]
>     +
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + hack/make/.binary | 10 +++++-----
>     + 1 file changed, 5 insertions(+), 5 deletions(-)
>     +
>     +diff --git a/src/import/hack/make/.binary
>     b/src/import/hack/make/.binary
>     +index 53de6749e5..66f4ca05f3 100644
>     +--- a/src/import/hack/make/.binary
>     ++++ b/src/import/hack/make/.binary
>     +@@ -44,27 +44,27 @@ if [ "$(go env GOOS)/$(go env GOARCH)" !=3D
>     "$(go env GOHOSTOS)/$(go env GOHOSTARC
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# must be cross-compiling!
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0case "$(go env GOOS)/$(go env GOARCH)" i=
n
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0windows/amd6=
4)
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 export CC=3Dx86_64-w64-mingw32-gcc
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 export CC=3D"${CC:-x86_64-w64-mingw32-gcc}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/arm)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0case "${GOARM}" in
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A05|"")
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3Darm-linux-gnueabi-gcc
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
>     CC=3D"${CC:-arm-linux-gnueabi-gcc}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A07)
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3Darm-linux-gnueabihf-gcc
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
>     CC=3D"${CC:-arm-linux-gnueabihf-gcc}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0esac
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/arm64)
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 export CC=3Daarch64-linux-gnu-gcc
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 export CC=3D"${CC:-aarch64-linux-gnu-gcc}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/amd64)
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 export CC=3Dx86_64-linux-gnu-gcc
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 export CC=3D"${CC:-x86_64-linux-gnu-gcc}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0esac
>     +--
>     +2.23.0
>     diff --git
>     a/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.con=
f
>     b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.con=
f
>     new file mode 100644
>     index 000000000000..548a25d3ae49
>     --- /dev/null
>     +++
>     b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.con=
f
>     @@ -0,0 +1,2 @@
>     +L=C2=A0 =C2=A0 =C2=A0 /run/docker.pid -=C2=A0 =C2=A0 =C2=A0 =C2=A0-=
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=
=A0
>     =C2=A0/run/balena-engine.pid
>     +L=C2=A0 =C2=A0 =C2=A0 /run/balena.pid -=C2=A0 =C2=A0 =C2=A0 =C2=A0-=
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=
=A0
>     =C2=A0/run/balena-engine.pid
>     diff --git a/recipes-containers/balena-engine/balena-engine_git.bb
>     <http://balena-engine_git.bb>
>     b/recipes-containers/balena-engine/balena-engine_git.bb
>     <http://balena-engine_git.bb>
>     new file mode 100644
>     index 000000000000..5d78dc02350f
>     --- /dev/null
>     +++ b/recipes-containers/balena-engine/balena-engine_git.bb
>     <http://balena-engine_git.bb>
>     @@ -0,0 +1,159 @@
>     +HOMEPAGE =3D "https://www.balena.io/"
>     +SUMMARY =3D "A Moby-based container engine for IoT"
>     +DESCRIPTION =3D "Balena is a new container engine purpose-built for
>     embedded \
>     +and IoT use cases and compatible with Docker containers. Based on
>     Docker=E2=80=99s \
>     +Moby Project, balena supports container deltas for 10-70x more
>     efficient \
>     +bandwidth usage, has 3.5x smaller binaries, uses RAM and storage
>     more \
>     +conservatively, and focuses on atomicity and durability of
>     container \
>     +pulling."
>     +LICENSE =3D "Apache-2.0"
>     +LIC_FILES_CHKSUM =3D
>     "file://src/import/LICENSE;md5=3D4859e97a9c7780e77972d989f0823f28"
>     +
>     +inherit systemd go pkgconfig useradd
>     +
>     +BALENA_VERSION =3D "19.03.13-dev"
>     +BALENA_BRANCH=3D "master"
>     +
>     +SRCREV =3D "074a481789174b4b6fd2d706086e8ffceb72e924"
>     +SRC_URI =3D "\
>     +=C2=A0 =C2=A0 =C2=A0
>     =C2=A0git://github.com/balena-os/balena-engine.git;branch=3D${BALENA=
_BRANCH};destsuffix=3Dgit/src/import
>     <http://github.com/balena-os/balena-engine.git;branch=3D$%7BBALENA_B=
RANCH%7D;destsuffix=3Dgit/src/import>
>     \
>     +=C2=A0 =C2=A0 =C2=A0
>     =C2=A0file://0001-imporve-hardcoded-CC-on-cross-compile-docker-ce.pa=
tch \
>
> The fact that we have to duplicate that patch, exposes an issue.
>
> It comes down to the fact that we already have containerd, moby, runc,
> etc, recipes.
>
> Having vendored copies for all of the engine variants is a problem,
> and one what I'm looking to solve.=C2=A0 I can help on that front, but i=
t
> won't be until after I've finished getting k3s working and merged.
Ok. I will start with the simpler fixes for v2 and we will go back to that=
.
>
> See more specific comments below.
>
> =C2=A0
>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://balena-tmpfiles.conf \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     +
>     +S =3D "${WORKDIR}/git"
>     +
>     +PV =3D "${BALENA_VERSION}+git${SRCREV}"
>     +
>     +SECURITY_CFLAGS =3D "${SECURITY_NOPIE_CFLAGS}"
>     +SECURITY_LDFLAGS =3D ""
>     +
>     +SYSTEMD_PACKAGES =3D "${PN}"
>     +SYSTEMD_SERVICE_${PN} =3D "balena-engine.service balena-engine.sock=
et"
>     +GO_IMPORT =3D "import"
>     +USERADD_PACKAGES =3D "${PN}"
>     +GROUPADD_PARAM_${PN} =3D "-r balena-engine"
>     +
>     +DEPENDS_append_class-target =3D " systemd"
>     +RDEPENDS_${PN}_class-target =3D "curl util-linux iptables tini
>     systemd bash"
>     +RRECOMMENDS_${PN} +=3D "kernel-module-nf-nat
>     kernel-module-br-netfilter kernel-module-nf-conntrack-netlink
>     kernel-module-xt-masquerade kernel-module-xt-addrtype"
>     +
>     +# oe-meta-go recipes try to build go-cross-native
>
>
> oe-meta-go shouldn't be relevant anymore .. neither should those
> _remove's.
>
> =C2=A0
>
>     +DEPENDS_remove_class-native =3D "go-cross-native"
>     +DEPENDS_append_class-native =3D " go-native"
>     +
>     +INSANE_SKIP_${PN} +=3D "already-stripped"
>     +
>     +FILES_${PN} +=3D " \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/lib/systemd/system/* \
>
>
> /lib shouldn't be hardcoded.
>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/home/root \
>
>
> neither should /home/root/
>
> =C2=A0
>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/boot/init \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0/boot/storage-driver \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir} \
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     +
>     +DOCKER_PKG=3D"github.com/docker/docker
>     <http://github.com/docker/docker>"
>     +
>     +# By default no extra LDFLAGS needed when compiling mobynit
>     +MOBYNIT_EXTRA_LDFLAGS ??=3D ""
>     +
>     +do_configure[noexec] =3D "1"
>     +
>     +do_compile() {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export PATH=3D${STAGING_BINDIR_NATIVE}/$=
{HOST_SYS}:$PATH
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOCACHE=3D"${B}/.cache"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOHOSTOS=3D"linux"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOOS=3D"linux"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0case "${TARGET_ARCH}" in
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GOARCH=3Damd64
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i586|i686)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GOARCH=3D386
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GOARCH=3D${TARGET_ARCH}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0case "${TUNE_PKGARCH}" in
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa*)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e=
xport GOARM=3D7
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;=
;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0esac
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# ARM64 is invalid for Go 1.4
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GOARCH=3Darm64
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GOARCH=3D"${TARGET_ARCH}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0esac
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH
>
>
> There are already classes that deal with the arch mapping, it doesn't
> belong in individual recipes.
>
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Set GOPATH. See 'PACKAGERS.md'. Don't =
rely on
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# docker to download its dependencies bu=
t rather
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# use dependencies packaged independentl=
y.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf .gopath
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p .gopath/src/"$(dirname "${DOCKE=
R_PKG}")"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../.. .gopath/src/"${DOCKER=
_PKG}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export
>     GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_D=
IR_TARGET}/${prefix}/local/go"
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that=
 cgo
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# can find the needed headers files and =
libraries
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS} --sysroot=
=
=3D${STAGING_DIR_TARGET}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${LDFLAGS}=C2=A0
>     --sysroot=3D${STAGING_DIR_TARGET}"
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_GITCOMMIT=3D"${SRCREV}"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_BUILDTAGS=3D"no_buildkit n=
o_btrfs no_cri
>     no_devmapper no_zfs exclude_disk_quota exclude_graphdriver_btrfs
>     exclude_graphdriver_devicemapper exclude_graphdriver_zfs"
>
>
> As we've already solved in the other docker/moby recipes, we any
> setting of buildtags needs to be by variable, so it can be
> overriden=C2=A0by bbappends, etc.
>
> =C2=A0
>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_LDFLAGS=3D"-s"
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0VERSION=3D${BALENA_VERSION} ./hack/make.=
sh dynbinary-balena
>
>
> And here we are with the repeated moby build infrastructure.
>
> I am curious as to why mainline moby won't work for this.
I have no idea, but can look into that.
>
> =C2=A0
>
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Compile mobynit
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd .gopath/src/"${DOCKER_PKG}"/cmd/mobyn=
it
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0go build -ldflags '-extldflags "-static
>     ${MOBYNIT_EXTRA_LDFLAGS}"' .
>
>
> This shouldn't be using 'go' directly, at the least, it should be
> using the variables as defined in the go classes.=C2=A0
>
> But again, this is solving and duplicating all the fixes that we've
> had to do over time in the existing moby recipe. .. this is less than
> ideal. and anything that we haven't solved there, we should actually
> be fixing there.
I will drop the mobynit completely from this recipe.
This was actually also done lately in the meta-balena:
https://github.com/balena-os/meta-balena/commit/29844ed3bd936c581e20b72df1=
33a2b6ed498512
> =C2=A0
>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -
>     +}
>     +
>     +do_install() {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${bindir}
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755
>     ${S}/src/import/bundles/dynbinary-balena/balena-engine
>     ${D}/${bindir}/balena-engine
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# install -d ${D}/boot
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# install -m 0755 ${S}/src/import/cmd/mo=
bynit/mobynit
>     ${D}/boot/init
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0# echo ${BALENA_STORAGE} > ${D}/boot/sto=
rage-driver
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
nad
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-containerd
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-containerd-shim
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-containerd-ctr
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-runc
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-proxy
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-engine-daemon
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-engine-containerd
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
>     ${D}/${bindir}/balena-engine-containerd-shim
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
>     ${D}/${bindir}/balena-engine-containerd-ctr
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-engine-runc
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir}/bale=
na-engine-proxy
>
>
> Outside of the branding, what's the difference between these binaries
> and when we build the upstream project variants ?
I think we only care about the balena-engine for the purpose of this
layer, really.
From what I understand, the first ones are used in the balenaOS and I shou=
ld
have dropped them in the initial recipe port.
>
> =C2=A0
>
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_unitdir}/system
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644
>     ${S}/src/import/contrib/init/systemd/balena-engine.socket
>     ${D}/${systemd_unitdir}/system
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644
>     ${S}/src/import/contrib/init/systemd/balena-engine.service
>     ${D}/${systemd_unitdir}/system
>
>
> The init system is variable, and should be checked before attempting
> to install services.
>
> =C2=A0
>
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/home/root/.docker
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf .docker ${D}/home/root/.balena
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf .docker ${D}/home/root/.balena-en=
gine
>
>
> As mentioned above /home/room, shouldn't be hardcoded.
>
> =C2=A0
>
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/lib/dock=
er
>
>
> Now we are polluting namespaces. A balena recipe making directories
> called "docker". This is the issue I had with k3s and CNI, and my
> concern about all the vendored versions we are getting in the
> container recipes.
>
> =C2=A0
>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf docker ${D}${localstatedir}/lib/b=
alena
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf docker ${D}${localstatedir}/lib/b=
alena-engine
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/tmpfiles.d
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/balena-tmpfil=
es.conf
>     ${D}${sysconfdir}/tmpfiles.d/
>     +}
>     +
>     +BBCLASSEXTEND =3D " native"
>
>
> Where is this being used natively ?
I see no usecase for the purpose of meta-virt.
In case of balenaOS it was used to build the containers probably.
Will drop that.
>
> Bruce
>
> =C2=A0
>
>     --=20
>     2.25.1
>
>
>
>
>
>
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>=20
>
--=20
Maciej Pijanowski
Embedded Firmware Team Leader
GPG: 9963C36AAC3B2B46
https://3mdeb.com | @3mdeb_com


--------------9FBFCCA8362BF4BFABAD76DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 24.11.2020 19:03, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4N2RAG1MSBrSWxgwwo2f=3DGN7zpM0r8OLgrLH82xE8vNSw@mail.gma=
il.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUT=
F-8">
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div class=3D"gmail_default" style=3D"font-size:small"><br>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at
            12:20 PM Maciej Pijanowski &lt;<a
              href=3D"mailto:maciej.pijanowski@3mdeb.com"
              moz-do-not-send=3D"true">maciej.pijanowski@3mdeb.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">As explained in [1], I
            have created the balena-engine recipe which could be<br>
            used in "regular" Yocto/OE builds (outside of the balenaOS).
            The<br>
            recipe is mostly a copy of the original recipe from
            meta-balena,<br>
            stripped from the balenaOS-specific parts so it can be
            compiled and<br>
            build outside of it. This recipe was tested at build and
            runtime<br>
            on the dunfell release on two targets: RPi4 and qemux86-64.<br=
>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div>Thanks for the contribution, it is most appreciated.
              The recipe unfortunately raises some concerns ..<span
                class=3D"gmail_default" style=3D"font-size:small"> and
                something that we can work through.</span><br>
            </div>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            [1] <a
              href=3D"https://lists.yoctoproject.org/g/meta-virtualization=
/message/5913"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">https://lists.yoctoproject.org/g/meta-virtualization/message/5913</a><br>
            <br>
            Signed-off-by: Maciej Pijanowski &lt;<a
              href=3D"mailto:maciej.pijanowski@3mdeb.com" target=3D"_blank=
"
              moz-do-not-send=3D"true">maciej.pijanowski@3mdeb.com</a>&gt;=
<br>
            ---<br>
            =C2=A0...dcoded-CC-on-cross-compile-docker-ce.patch |=C2=A0 60=
 +++++++<br>
            =C2=A0.../balena-engine/balena-tmpfiles.conf=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
            =C2=A0.../balena-engine/<a href=3D"http://balena-engine_git.bb=
"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">balena-engine_git.bb</a>=C2=A0
            =C2=A0 =C2=A0 =C2=A0 | 159 ++++++++++++++++++<br>
            =C2=A03 files changed, 221 insertions(+)<br>
            =C2=A0create mode 100644
recipes-containers/balena-engine/balena-engine/0001-imporve-hardcoded-CC-o=
n-cross-compile-docker-ce.patch<br>
            =C2=A0create mode 100644
            recipes-containers/balena-engine/balena-engine/balena-tmpfiles=
.conf<br>
            =C2=A0create mode 100644 recipes-containers/balena-engine/<a
              href=3D"http://balena-engine_git.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">balena-engine_git=
.bb</a><br>
            <br>
            diff --git
a/recipes-containers/balena-engine/balena-engine/0001-imporve-hardcoded-CC=
-on-cross-compile-docker-ce.patch
b/recipes-containers/balena-engine/balena-engine/0001-imporve-hardcoded-CC=
-on-cross-compile-docker-ce.patch<br>
            new file mode 100644<br>
            index 000000000000..0f257f1bd964<br>
            --- /dev/null<br>
            +++
b/recipes-containers/balena-engine/balena-engine/0001-imporve-hardcoded-CC=
-on-cross-compile-docker-ce.patch<br>
            @@ -0,0 +1,60 @@<br>
            +From 1263fdb50a540e9db742694b7cee08284ad986d0 Mon Sep 17
            00:00:00 2001<br>
            +From: Hongxu Jia &lt;<a
              href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank"
              moz-do-not-send=3D"true">hongxu.jia@windriver.com</a>&gt;<br=
>
            +Date: Wed, 17 Jul 2019 17:34:04 +0800<br>
            +Subject: [PATCH] imporve hardcoded CC on cross compile<br>
            +<br>
            +Since commit applied in moby [61a3285 Support cross-compile
            for arm]<br>
            +it hardcoded var-CC to support cross-compile for arm<br>
            +<br>
            +Correct it with "${parameter:-word}" format, it is helpful
            for user<br>
            +define toolchains<br>
            +<br>
            +(Use Default Values.=C2=A0 If parameter is unset or null, the
            expansion of<br>
            +word is substituted.=C2=A0 Otherwise, the value of parameter =
is
            substituted.)<br>
            +<br>
            +Upstream-Status: Submitted [<a
              href=3D"https://github.com/moby/moby/pull/39546"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">https://github.com/moby/moby/pull/39546</a>]<br>
            +<br>
            +Signed-off-by: Hongxu Jia &lt;<a
              href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blank"
              moz-do-not-send=3D"true">hongxu.jia@windriver.com</a>&gt;<br=
>
            +---<br>
            + hack/make/.binary | 10 +++++-----<br>
            + 1 file changed, 5 insertions(+), 5 deletions(-)<br>
            +<br>
            +diff --git a/src/import/hack/make/.binary
            b/src/import/hack/make/.binary<br>
            +index 53de6749e5..66f4ca05f3 100644<br>
            +--- a/src/import/hack/make/.binary<br>
            ++++ b/src/import/hack/make/.binary<br>
            +@@ -44,27 +44,27 @@ if [ "$(go env GOOS)/$(go env GOARCH)"
            !=3D "$(go env GOHOSTOS)/$(go env GOHOSTARC<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# must be cross-compiling!<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0case "$(go env GOOS)/$(go env GOAR=
CH)" in<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0window=
s/amd64)<br>
            +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 export CC=3Dx86_64-w64-mingw32-gcc<br>
            ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 export
            CC=3D"${CC:-x86_64-w64-mingw32-gcc}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/=
arm)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0case "${GOARM}" in<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A05|"")<br>
            +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
            CC=3Darm-linux-gnueabi-gcc<br>
            ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
            CC=3D"${CC:-arm-linux-gnueabi-gcc}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1=
<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A07)<br>
            +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
            CC=3Darm-linux-gnueabihf-gcc<br>
            ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export
            CC=3D"${CC:-arm-linux-gnueabihf-gcc}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1=
<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/=
arm64)<br>
            +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 export CC=3Daarch64-linux-gnu-gcc<br>
            ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 export
            CC=3D"${CC:-aarch64-linux-gnu-gcc}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux/=
amd64)<br>
            +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 export CC=3Dx86_64-linux-gnu-gcc<br>
            ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 export
            CC=3D"${CC:-x86_64-linux-gnu-gcc}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D1<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
            +--<br>
            +2.23.0<br>
            diff --git
            a/recipes-containers/balena-engine/balena-engine/balena-tmpfil=
es.conf
b/recipes-containers/balena-engine/balena-engine/balena-tmpfiles.conf<br>
            new file mode 100644<br>
            index 000000000000..548a25d3ae49<br>
            --- /dev/null<br>
            +++
            b/recipes-containers/balena-engine/balena-engine/balena-tmpfil=
es.conf<br>
            @@ -0,0 +1,2 @@<br>
            +L=C2=A0 =C2=A0 =C2=A0 /run/docker.pid -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=
=A0 =C2=A0
            =C2=A0/run/balena-engine.pid<br>
            +L=C2=A0 =C2=A0 =C2=A0 /run/balena.pid -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=
=A0 =C2=A0
            =C2=A0/run/balena-engine.pid<br>
            diff --git a/recipes-containers/balena-engine/<a
              href=3D"http://balena-engine_git.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">balena-engine_git=
.bb</a>
            b/recipes-containers/balena-engine/<a
              href=3D"http://balena-engine_git.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">balena-engine_git=
.bb</a><br>
            new file mode 100644<br>
            index 000000000000..5d78dc02350f<br>
            --- /dev/null<br>
            +++ b/recipes-containers/balena-engine/<a
              href=3D"http://balena-engine_git.bb" rel=3D"noreferrer"
              target=3D"_blank" moz-do-not-send=3D"true">balena-engine_git=
.bb</a><br>
            @@ -0,0 +1,159 @@<br>
            +HOMEPAGE =3D "<a href=3D"https://www.balena.io/"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">https://www.balena.io/</a>"<br>
            +SUMMARY =3D "A Moby-based container engine for IoT"<br>
            +DESCRIPTION =3D "Balena is a new container engine
            purpose-built for embedded \<br>
            +and IoT use cases and compatible with Docker containers.
            Based on Docker=E2=80=99s \<br>
            +Moby Project, balena supports container deltas for 10-70x
            more efficient \<br>
            +bandwidth usage, has 3.5x smaller binaries, uses RAM and
            storage more \<br>
            +conservatively, and focuses on atomicity and durability of
            container \<br>
            +pulling."<br>
            +LICENSE =3D "Apache-2.0"<br>
            +LIC_FILES_CHKSUM =3D
            <a class=3D"moz-txt-link-rfc2396E" href=3D"file://src/import/L=
ICENSE;md5=3D4859e97a9c7780e77972d989f0823f28">"file://src/import/LICENSE;m=
d5=3D4859e97a9c7780e77972d989f0823f28"</a><br>
            +<br>
            +inherit systemd go pkgconfig useradd<br>
            +<br>
            +BALENA_VERSION =3D "19.03.13-dev"<br>
            +BALENA_BRANCH=3D "master"<br>
            +<br>
            +SRCREV =3D "074a481789174b4b6fd2d706086e8ffceb72e924"<br>
            +SRC_URI =3D "\<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a
href=3D"http://github.com/balena-os/balena-engine.git;branch=3D$%7BBALENA_=
BRANCH%7D;destsuffix=3Dgit/src/import"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">github.com/balena-os/balena-engine.git;branch=3D${BALENA_BRANCH};destsuff=
ix=3Dgit/src/import</a>
            \<br>
            +=C2=A0 =C2=A0 =C2=A0
            =C2=A0<a class=3D"moz-txt-link-freetext" href=3D"file://0001-i=
mporve-hardcoded-CC-on-cross-compile-docker-ce.patch">file://0001-imporve-h=
ardcoded-CC-on-cross-compile-docker-ce.patch</a>
            \<br>
          </blockquote>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">The fac=
t
              that we have to duplicate that patch, exposes an issue.</div=
>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">It come=
s
              down to the fact that we already have containerd, moby,
              runc, etc, recipes.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Having
              vendored copies for all of the engine variants is a
              problem, and one what I'm looking to solve.=C2=A0 I can help=
 on
              that front, but it won't be until after I've finished
              getting k3s working and merged.</div>
          </div>
        </div>
      </div>
    </blockquote>
    Ok. I will start with the simpler fixes for v2 and we will go back
    to that.<br>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4N2RAG1MSBrSWxgwwo2f=3DGN7zpM0r8OLgrLH82xE8vNSw@mail.gma=
il.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">See mor=
e
              specific comments below.</div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D"moz-txt-link-freetext=
" href=3D"file://balena-tmpfiles.conf">file://balena-tmpfiles.conf</a> \<br=
>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0"<br>
            +<br>
            +S =3D "${WORKDIR}/git"<br>
            +<br>
            +PV =3D "${BALENA_VERSION}+git${SRCREV}"<br>
            +<br>
            +SECURITY_CFLAGS =3D "${SECURITY_NOPIE_CFLAGS}"<br>
            +SECURITY_LDFLAGS =3D ""<br>
            +<br>
            +SYSTEMD_PACKAGES =3D "${PN}"<br>
            +SYSTEMD_SERVICE_${PN} =3D "balena-engine.service
            balena-engine.socket"<br>
            +GO_IMPORT =3D "import"<br>
            +USERADD_PACKAGES =3D "${PN}"<br>
            +GROUPADD_PARAM_${PN} =3D "-r balena-engine"<br>
            +<br>
            +DEPENDS_append_class-target =3D " systemd"<br>
            +RDEPENDS_${PN}_class-target =3D "curl util-linux iptables
            tini systemd bash"<br>
            +RRECOMMENDS_${PN} +=3D "kernel-module-nf-nat
            kernel-module-br-netfilter
            kernel-module-nf-conntrack-netlink
            kernel-module-xt-masquerade kernel-module-xt-addrtype"<br>
            +<br>
            +# oe-meta-go recipes try to build go-cross-native<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">oe-meta=
-go
              shouldn't be relevant anymore .. neither should those
              _remove's.</div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +DEPENDS_remove_class-native =3D "go-cross-native"<br>
            +DEPENDS_append_class-native =3D " go-native"<br>
            +<br>
            +INSANE_SKIP_${PN} +=3D "already-stripped"<br>
            +<br>
            +FILES_${PN} +=3D " \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0/lib/systemd/system/* \<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">/lib
              shouldn't be hardcoded.</div>
            <br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0/home/root \<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">neither
              should /home/root/</div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0/boot/init \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0/boot/storage-driver \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0${localstatedir} \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0"<br>
            +<br>
            +DOCKER_PKG=3D"<a href=3D"http://github.com/docker/docker"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">github.com/docker/docker</a>"<br>
            +<br>
            +# By default no extra LDFLAGS needed when compiling mobynit<b=
r>
            +MOBYNIT_EXTRA_LDFLAGS ??=3D ""<br>
            +<br>
            +do_configure[noexec] =3D "1"<br>
            +<br>
            +do_compile() {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export
            PATH=3D${STAGING_BINDIR_NATIVE}/${HOST_SYS}:$PATH<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOCACHE=3D"${B}/.cache"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOHOSTOS=3D"linux"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOOS=3D"linux"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0case "${TARGET_ARCH}" in<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64=
)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GOARCH=3Damd64<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i586|i=
686)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GOARCH=3D386<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm)<b=
r>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GOARCH=3D${TARGET_ARCH}<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0case "${TUNE_PKGARCH}" in<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cortexa*)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0export GOARM=3D7<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aarch6=
4)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# ARM64 is invalid for Go 1.4<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GOARCH=3Darm64<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0GOARCH=3D"${TARGET_ARCH}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">There a=
re
              already classes that deal with the arch mapping, it
              doesn't belong in individual recipes.</div>
          </div>
          <div><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Set GOPATH. See 'PACKAGERS.md'. =
Don't rely on<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# docker to download its dependenc=
ies but rather<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# use dependencies packaged indepe=
ndently.<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/src/import<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf .gopath<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p .gopath/src/"$(dirname "$=
{DOCKER_PKG}")"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../../../.. .gopath/src/"${=
DOCKER_PKG}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export
GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TAR=
GET}/${prefix}/local/go"<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D"1"<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags s=
o that cgo<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# can find the needed headers file=
s and libraries<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D"${CFLAGS}
            --sysroot=3D${STAGING_DIR_TARGET}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D"${LDFLAGS}=
=C2=A0
            --sysroot=3D${STAGING_DIR_TARGET}"<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_GITCOMMIT=3D"${SRCRE=
V}"<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_BUILDTAGS=3D"no_buil=
dkit no_btrfs no_cri
            no_devmapper no_zfs exclude_disk_quota
            exclude_graphdriver_btrfs exclude_graphdriver_devicemapper
            exclude_graphdriver_zfs"<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">As we'v=
e
              already solved in the other docker/moby recipes, we any
              setting of buildtags needs to be by variable, so it can be
              overriden=C2=A0by bbappends, etc.</div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0export DOCKER_LDFLAGS=3D"-s"<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0VERSION=3D${BALENA_VERSION} ./hack=
/make.sh
            dynbinary-balena<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">And her=
e
              we are with the repeated moby build infrastructure.</div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">I am
              curious as to why mainline moby won't work for this.</div>
          </div>
        </div>
      </div>
    </blockquote>
    I have no idea, but can look into that.<br>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4N2RAG1MSBrSWxgwwo2f=3DGN7zpM0r8OLgrLH82xE8vNSw@mail.gma=
il.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Compile mobynit<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd .gopath/src/"${DOCKER_PKG}"/cmd=
/mobynit<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0go build -ldflags '-extldflags "-s=
tatic
            ${MOBYNIT_EXTRA_LDFLAGS}"' .<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">This
              shouldn't be using 'go' directly, at the least, it should
              be using the variables as defined in the go classes.=C2=A0</=
div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">But
              again, this is solving and duplicating all the fixes that
              we've had to do over time in the existing moby recipe. ..
              this is less than ideal. and anything that we haven't
              solved there, we should actually be fixing there.</div>
          </div>
        </div>
      </div>
    </blockquote>
    I will drop the mobynit completely from this recipe.<br>
    This was actually also done lately in the meta-balena:<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/balena-os/me=
ta-balena/commit/29844ed3bd936c581e20b72df133a2b6ed498512">https://github.c=
om/balena-os/meta-balena/commit/29844ed3bd936c581e20b72df133a2b6ed498512</a=
><br>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4N2RAG1MSBrSWxgwwo2f=3DGN7zpM0r8OLgrLH82xE8vNSw@mail.gma=
il.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0cd -<br>
            +}<br>
            +<br>
            +do_install() {<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${bindir}<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755
            ${S}/src/import/bundles/dynbinary-balena/balena-engine
            ${D}/${bindir}/balena-engine<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# install -d ${D}/boot<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# install -m 0755
            ${S}/src/import/cmd/mobynit/mobynit ${D}/boot/init<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# echo ${BALENA_STORAGE} &gt;
            ${D}/boot/storage-driver<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir=
}/balena<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir=
}/balenad<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-containerd<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-containerd-shim<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-containerd-ctr<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir=
}/balena-runc<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine ${D}/${bindir=
}/balena-proxy<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-engine-daemon<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-engine-containerd<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-engine-containerd-shim<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-engine-containerd-ctr<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-engine-runc<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf balena-engine
            ${D}/${bindir}/balena-engine-proxy<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">Outside
              of the branding, what's the difference between these
              binaries and when we build the upstream project variants ?</=
div>
          </div>
        </div>
      </div>
    </blockquote>
    I think we only care about the balena-engine for the purpose of this
    layer, really.<br>
    From what I understand, the first ones are used in the balenaOS and
    I should<br>
    have dropped them in the initial recipe port.<br>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4N2RAG1MSBrSWxgwwo2f=3DGN7zpM0r8OLgrLH82xE8vNSw@mail.gma=
il.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_unitdir}/=
system<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644
            ${S}/src/import/contrib/init/systemd/balena-engine.socket
            ${D}/${systemd_unitdir}/system<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644
            ${S}/src/import/contrib/init/systemd/balena-engine.service
            ${D}/${systemd_unitdir}/system<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">The ini=
t
              system is variable, and should be checked before
              attempting to install services.</div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/home/root/.docker<=
br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf .docker ${D}/home/root/.bal=
ena<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf .docker ${D}/home/root/.bal=
ena-engine<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">As
              mentioned above /home/room, shouldn't be hardcoded.</div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${localstatedir}/li=
b/docker<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">Now we
              are polluting namespaces. A balena recipe making
              directories called "docker". This is the issue I had with
              k3s and CNI, and my concern about all the vendored
              versions we are getting in the container recipes.</div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf docker ${D}${localstatedir}=
/lib/balena<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf docker ${D}${localstatedir}=
/lib/balena-engine<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/tmpfi=
les.d<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/balena-=
tmpfiles.conf
            ${D}${sysconfdir}/tmpfiles.d/<br>
            +}<br>
            +<br>
            +BBCLASSEXTEND =3D " native"<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small">Where i=
s
              this being used natively ?</div>
          </div>
        </div>
      </div>
    </blockquote>
    I see no usecase for the purpose of meta-virt.<br>
    In case of balenaOS it was used to build the containers probably.<br>
    Will drop that.<br>
    <blockquote type=3D"cite"
cite=3D"mid:CADkTA4N2RAG1MSBrSWxgwwo2f=3DGN7zpM0r8OLgrLH82xE8vNSw@mail.gma=
il.com">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>
            <div class=3D"gmail_default" style=3D"font-size:small"><br>
            </div>
            <div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div>
            <br>
          </div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            -- <br>
            2.25.1<br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
        <br clear=3D"all">
        <div><br>
        </div>
        -- <br>
        <div dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br=
>
          - "Use the force Harry" - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Maciej Pijanowski
Embedded Firmware Team Leader
GPG: 9963C36AAC3B2B46
<a class=3D"moz-txt-link-freetext" href=3D"https://3mdeb.com">https://3mde=
b.com</a> | @3mdeb_com</pre>
  </body>
</html>

--------------9FBFCCA8362BF4BFABAD76DB--
