Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4592E01410
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 17:46:43 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r071kbmM001753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Jan 2013 17:46:38 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Sun, 6 Jan 2013 17:46:37 -0800
Received: from skynet (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 407927FCE;
	Sun,  6 Jan 2013 20:45:03 -0500 (EST)
Received: by skynet (Postfix, from userid 1000)	id 1C5C260088F; Sun,  6 Jan
	2013 20:46:16 -0500 (EST)
Date: Sun, 6 Jan 2013 20:46:16 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <lei.yang@windriver.com>
Message-ID: <20130107014615.GD9356@windriver.com>
References: <1357449457-2669-1-git-send-email-lei.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1357449457-2669-1-git-send-email-lei.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 07 Jan 2013 01:55:32 -0800
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt virt-test)
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
X-List-Received-Date: Mon, 07 Jan 2013 01:46:44 -0000
X-Groupsio-MsgNum: 152
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline

--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt vi=
rt-test)] On 13.01.06 (Sun 13:17) lei.yang@windriver.com wrote:

> From: Lei Yang <lei.yang@windriver.com>
>=20
> The netcat-openbsd in meta-virtualization layer has bugs.
> This update version will fix "nc: Protocol no available." error.
> As bruce point, we want to keep netcat in the meta-networking,
> which meta-virtualization will depend on

That's fine with me if that works for him, and having both netcat
versions available is fine, I personally prefer the obsd one.  I'll keep
an eye out for your next version with the per-recipe alternative
priorities.

I didn't notice the discussion with Bruce, though, so at the risk of
re-stating what you guys have already agreed upon, this will mean you're
at least going to be cloning meta-oe to use meta-virtualization.
meta-networking isn't a standalone layer for the most part.  I maintain
a read-only subtree project on github that is meta-networking separated
=66rom the rest of meta-oe, but it necessarily trails the meta-networking
in meta-oe.

I'm fine with the new recipe, just wanted to make sure you had all the
information you needed.

-J.

>=20
> Lei
>=20
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>  .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   29 ++++++++++++++=
++++++
>  meta-networking/recipes-support/netcat/netcat.inc  |    6 ++++
>  .../recipes-support/netcat/netcat_0.7.1.bb         |   11 +++----
>  3 files changed, 40 insertions(+), 6 deletions(-)
>  create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd=
_1.89.bb
>  create mode 100644 meta-networking/recipes-support/netcat/netcat.inc
>=20
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.b=
b b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> new file mode 100644
> index 0000000..9fe406c
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> @@ -0,0 +1,29 @@
> +require netcat.inc
> +DESCRIPTION =3D "OpenBSD Netcat"
> +HOMEPAGE =3D "http://ftp.debian.org"
> +LICENSE =3D "BSD-3-Clause"
> +PR =3D "r0"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.=
orig.tar.gz;name=3Dnetcat \
> +           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.=
diff.gz;name=3Dnetcat-patch"
> +
> +SRC_URI[netcat.md5sum] =3D "7238ce15aae43069e96ba7faf03f153e"
> +SRC_URI[netcat.sha256sum] =3D "72e844dde8a2a7cba61971d493758dbea9ef0b164=
bccef15fd4a36490dc77f2b"
> +SRC_URI[netcat-patch.md5sum] =3D "00c65aa22243b76998174c733cbb64cc"
> +SRC_URI[netcat-patch.sha256sum] =3D "d5b6b2bd9788114bdcfbb71acad0263720b=
4fdc41529e287adf451b8610f84f1"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}.orig"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +	cd ${S}
> +        while read line; do patch -p1 <debian/patches/$line; done <debia=
n/patches/series
> +	pkgrel=3D4
> +	oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgrel}\\\"\""
> +}
> +
> +do_install() {
> +        install -d ${D}${bindir}
> +        install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> +}
> diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-net=
working/recipes-support/netcat/netcat.inc
> new file mode 100644
> index 0000000..4098668
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat.inc
> @@ -0,0 +1,6 @@
> +SECTION =3D "console/network"
> +inherit update-alternatives gettext
> +
> +ALTERNATIVE_${PN} =3D "nc"
> +ALTERNATIVE_PRIORITY =3D "100"
> +
> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/met=
a-networking/recipes-support/netcat/netcat_0.7.1.bb
> index c5ab85d..e09202b 100644
> --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> @@ -1,21 +1,20 @@
> +require netcat.inc
>  DESCRIPTION =3D "GNU Netcat"
>  HOMEPAGE =3D "http://netcat.sourceforge.net"
> -SECTION =3D "console/network"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
> =20
>  SRC_URI[md5sum] =3D "0a29eff1736ddb5effd0b1ec1f6fe0ef"
>  SRC_URI[sha256sum] =3D "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd0744890=
03f3df09676332bb"
> =20
> -inherit autotools update-alternatives gettext
> +inherit autotools
> =20
>  do_install_append() {
> -	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
> +        install -d ${D}${bindir}
> +        mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
>  }
> =20
> -ALTERNATIVE_${PN} =3D "nc"
> -ALTERNATIVE_PRIORITY =3D "100"
--=20
-Joe MacDonald.
:wq

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlDqKOcACgkQPN8S4W6ZZnchKwCeP7wRwZwhrgPTRiFDVGP5XVOQ
j/sAn2DNYDgNx6fzJjCO4c5daUF1fIsa
=IwSh
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
