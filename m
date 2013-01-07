Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC0B5E0144A
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 18:15:50 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r072FjLK005416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Jan 2013 18:15:45 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Sun, 6 Jan 2013 18:15:45 -0800
Received: from skynet (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id E26457FCE;
	Sun,  6 Jan 2013 21:14:10 -0500 (EST)
Received: by skynet (Postfix, from userid 1000)	id E5FCB60088F; Sun,  6 Jan
	2013 21:15:23 -0500 (EST)
Date: Sun, 6 Jan 2013 21:15:23 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <lei.yang@windriver.com>
Message-ID: <20130107021523.GF9356@windriver.com>
References: <1357522704-9608-1-git-send-email-lei.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1357522704-9608-1-git-send-email-lei.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 07 Jan 2013 01:55:32 -0800
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCHV2] Add netcat-bsd into meta-networking for meta-virutalization libvirt virt-test
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
X-List-Received-Date: Mon, 07 Jan 2013 02:15:51 -0000
X-Groupsio-MsgNum: 154
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline

--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[meta-networking][PATCHV2] Add netcat-bsd into meta-networking for meta-vi=
rutalization libvirt virt-test] On 13.01.07 (Mon 09:38) lei.yang@windriver.=
com wrote:

> From: Lei Yang <lei.yang@windriver.com>
>=20
> The netcat-openbsd in meta-virtualization layer has bugs.
> This update version will fix "nc: Protocol no available." error.
> As bruce point, we want to keep netcat in the meta-networking,
> which meta-virtualization will depend on,and this patch will let
> netcat-openbsd with low priority to install

Okay, I hadn't seen this version yet.  Looks okay, I think.  I'll merge
it anyway soon, unless there's further discussion.  The dependency on
meta-networking from meta-virtualization is probably out of scope.  Ping
me any time if you've got any questions about the relationship between
meta-oe/meta-networking and my github meta-networking.

Thanks, Lei.

-J.

>=20
> Lei
>=20
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>  .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   30 ++++++++++++++=
++++++
>  meta-networking/recipes-support/netcat/netcat.inc  |    5 +++
>  .../recipes-support/netcat/netcat_0.7.1.bb         |   11 +++----
>  3 files changed, 40 insertions(+), 6 deletions(-)
>  create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd=
_1.89.bb
>  create mode 100644 meta-networking/recipes-support/netcat/netcat.inc
>=20
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.b=
b b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> new file mode 100644
> index 0000000..f83caee
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> @@ -0,0 +1,30 @@
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
> +        install -m 755 ${S}/nc ${D}${bindir}/nc.${PN}
> +}
> +ALTERNATIVE_PRIORITY =3D "50"
> diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-net=
working/recipes-support/netcat/netcat.inc
> new file mode 100644
> index 0000000..6c815d9
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat.inc
> @@ -0,0 +1,5 @@
> +SECTION =3D "console/network"
> +inherit update-alternatives gettext
> +
> +ALTERNATIVE_${PN} =3D "nc"
> +
> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/met=
a-networking/recipes-support/netcat/netcat_0.7.1.bb
> index c5ab85d..c4f1f33 100644
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
> -
> -ALTERNATIVE_${PN} =3D "nc"
>  ALTERNATIVE_PRIORITY =3D "100"
--=20
-Joe MacDonald.
:wq

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlDqL7sACgkQPN8S4W6ZZnck6QCfS7hEZx1P70pUL1QWVDoX0YIh
9p8AnRboHRbLfNvmEzPOdJbTmwEaajbQ
=WzJh
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
