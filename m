Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41586E00ADD; Mon, 21 Dec 2015 21:45:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E4E78E00457
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 21:45:43 -0800 (PST)
Received: by mail-yk0-f176.google.com with SMTP id p130so153608570yka.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 21:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=QrXcs+w8tpyzhcPag2/7WO68hx2oLcV+1w3W2zYiSE8=;
	b=PP2z57ZhkFjYeFao6aC46xoUABM6hsei9e8XeX5Y8t2c6brA9QINmuq2d9nw6NXOJK
	UFnNNUu3Ex6yc2Nw8DpEfsTRYoTmc+xaN15r+tOANfa6HnpZS7TshWw1lZZE6e3iENAE
	3ZkK1JRMuVGadXmAc7QXqFgzz/30LUXGk2664sRReCRhVD7WwlOgEWjRduwExasVmdxQ
	UBm4BNskEWUg6TXmmlBAsVXts7+zACwBE3RKOyHQtsYyYrS0cthYyb4swioH9+Eda5+h
	EM79XhZT6rauomoKSJBUjszhda2R8WgS4ZGjUeTvn6BhraNkc3JbIxm3QwJEJSrTX+x8
	ntmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=QrXcs+w8tpyzhcPag2/7WO68hx2oLcV+1w3W2zYiSE8=;
	b=jWxSb7WqqLzzBBieRJ4UuAEeAi18/Pqzy0YnaiwcJaJGbRuoCUT96h+x7nE1mNPLm/
	jk9Jl+UQ18vTw0fjRrJ9A7ledJFq+N2yzVApNj974Dfl+pGlWDsOpmn++Oe960rB9WeT
	Im7/yb77uXzb5K+tz2tC5ddWN5RjOGVgC0fKsfwtE7IQOnjeaZund36KaPg2fU1SHcqL
	rgYsolhO1lCay+aINOvQ4lscWXYkxXVP1fBHG214RT+GoScrtM6/OQWSxItTCicC2iDP
	0WLYVT9nCDyfRWpiirrf3uFHRORNIrtFuMVKZ7LQoCSPhYC49dVpW9Wz+cTPN/yCJKLJ
	zJfQ==
X-Gm-Message-State: ALoCoQktWQA815CxVHaJQMXy+Wy2T/1qLxseqgUyaa0v/K8hbJlTjDmzCj8m1tt2JjDgo0zjcBlQXE3rciedNfWP1xyanej5sg==
X-Received: by 10.13.218.129 with SMTP id c123mr19630077ywe.4.1450763142774;
	Mon, 21 Dec 2015 21:45:42 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:7401:bb32:67d6:197e])
	by smtp.googlemail.com with ESMTPSA id
	h130sm31888671ywb.24.2015.12.21.21.45.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 21:45:42 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>, meta-virtualization@yoctoproject.org
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
	<1450747435-5738-3-git-send-email-cjp256@gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <5678E380.5070100@cardoe.com>
Date: Mon, 21 Dec 2015 23:45:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450747435-5738-3-git-send-email-cjp256@gmail.com>
Subject: Re: [PATCH 3/4] xen: uprev to 4.6.0
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
X-List-Received-Date: Tue, 22 Dec 2015 05:45:47 -0000
X-Groupsio-MsgNum: 1602
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="cNofnswfg03V2RCrX0GPV1AvRpmg555Ap"

--cNofnswfg03V2RCrX0GPV1AvRpmg555Ap
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/21/15 7:23 PM, Chris Patterson wrote:
> - Fixup LICENSE checksum.
> - Add patch to skip a check that breaks in cross-compile environments.
> - Drop udev package that has been removed.
>=20
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/files/skip-headers.chk.patch |   48 +++++++++++++=
++++++
>  recipes-extended/xen/xen.inc                      |   13 +-----
>  recipes-extended/xen/xen_4.5.0.bb                 |   50 -------------=
-------
>  recipes-extended/xen/xen_4.6.0.bb                 |   51 +++++++++++++=
++++++++
>  4 files changed, 100 insertions(+), 62 deletions(-)
>  create mode 100644 recipes-extended/xen/files/skip-headers.chk.patch
>  delete mode 100644 recipes-extended/xen/xen_4.5.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.6.0.bb
>=20
> diff --git a/recipes-extended/xen/files/skip-headers.chk.patch b/recipe=
s-extended/xen/files/skip-headers.chk.patch
> new file mode 100644
> index 0000000..19ce7bf
> --- /dev/null
> +++ b/recipes-extended/xen/files/skip-headers.chk.patch
> @@ -0,0 +1,48 @@
> +commit 162c1db56f3126f392269cb81808657e55c395e5
> +Author: Chris Patterson <cjp256@gmail.com>
> +Date:   Mon Dec 21 19:49:43 2015 -0500
> +
> +    Makefile: remove headers.chk which breaks in cross compilation env=
ironments
> +   =20
> +    Signed-off-by: Chris Patterson <cjp256@gmail.com>
> +
> +diff --git a/xen/include/Makefile b/xen/include/Makefile
> +index 94ba3d8..dd51d5b 100644
> +--- a/xen/include/Makefile
> ++++ b/xen/include/Makefile
> +@@ -87,35 +87,5 @@ compat/xlat.h: $(addprefix compat/.xlat/,$(xlat-y))=
 Makefile
> + 	cat $(filter %.h,$^) >$@.new
> + 	mv -f $@.new $@
> +=20
> +-ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
> +-
> +-all: headers.chk headers++.chk
> +-
> +-PUBLIC_HEADERS :=3D $(filter-out public/arch-% public/dom0_ops.h, $(w=
ildcard public/*.h public/*/*.h) $(public-y))
> +-
> +-PUBLIC_ANSI_HEADERS :=3D $(filter-out public/%ctl.h public/xsm/% publ=
ic/%hvm/save.h, $(PUBLIC_HEADERS))
> +-
> +-headers.chk: $(PUBLIC_ANSI_HEADERS) Makefile
> +-	for i in $(filter %.h,$^); do \
> +-	    $(CC) -x c -ansi -Wall -Werror -include stdint.h \
> +-	          -S -o /dev/null $$i || exit 1; \
> +-	    echo $$i; \
> +-	done >$@.new
> +-	mv $@.new $@
> +-
> +-headers++.chk: $(PUBLIC_HEADERS) Makefile
> +-	if $(CXX) -v >/dev/null 2>&1; then \
> +-	    for i in $(filter %.h,$^); do \
> +-	        echo '#include "'$$i'"' \
> +-	        | $(CXX) -x c++ -std=3Dgnu++98 -Wall -Werror -D__XEN_TOOLS__=
 \
> +-	          -include stdint.h -include public/xen.h -S -o /dev/null - =
\
> +-	        || exit 1; \
> +-	        echo $$i; \
> +-	    done ; \
> +-	fi >$@.new
> +-	mv $@.new $@
> +-
> +-endif
> +-
> + clean::
> + 	rm -rf compat headers.chk headers++.chk
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index 00f1823..c1be16d 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://xen.org"
>  LICENSE =3D "GPLv2"
>  SECTION =3D "console/tools"
> =20
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De0f0f3ac55608719a82394cc353=
928df"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6260c12cd5de27e80d89ae18e4=
8d20a"
> =20
>  COMPATIBLE_HOST =3D '(x86_64.*).*-linux|aarch64.*-linux'
> =20
> @@ -69,7 +69,6 @@ RDEPENDS_${PN}-base =3D "\
>      ${PN}-fsimage \
>      ${PN}-scripts-block \
>      ${PN}-scripts-network \
> -    ${PN}-udev \
>      ${PN}-xen-watchdog \
>      ${PN}-xencommons \
>      ${PN}-xendomains \
> @@ -99,7 +98,6 @@ RDEPENDS_${PN}-remus =3D "python"
>  RDEPENDS_${PN}-scripts-block =3D "\
>      bash \
>      ${PN}-scripts-common \
> -    ${PN}-udev \
>      ${PN}-volatiles \
>      "
> =20
> @@ -109,12 +107,9 @@ RDEPENDS_${PN}-scripts-network =3D "\
>      bash \
>      bridge-utils \
>      ${PN}-scripts-common \
> -    ${PN}-udev \
>      ${PN}-volatiles \
>      "
> =20
> -RDEPENDS_${PN}-udev =3D "udev"
> -
>  RDEPENDS_${PN}-xencommons =3D "\
>      bash \
>      ${PN}-console \
> @@ -182,7 +177,6 @@ PACKAGES =3D "\
>      ${PN}-scripts-common \
>      ${PN}-scripts-network \
>      ${PN}-staticdev \
> -    ${PN}-udev \
>      ${PN}-volatiles \
>      ${PN}-xcutils \
>      ${PN}-xencommons \
> @@ -512,11 +506,6 @@ FILES_${PN}-scripts-common =3D " \
>      ${sysconfdir}/xen/scripts/xen-script-common.sh \
>      "
> =20
> -FILES_${PN}-udev =3D "\
> -    ${sysconfdir}/udev/rules.d/xen-backend.rules \
> -    ${sysconfdir}/udev/rules.d/xend.rules \
> -    "
> -
>  FILES_${PN}-volatiles =3D "\
>      ${sysconfdir}/default/volatiles/99_xen \
>      ${sysconfdir}/tmpfiles.d/xen.conf \
> diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/x=
en_4.5.0.bb
> deleted file mode 100644
> index 6c17b90..0000000
> --- a/recipes-extended/xen/xen_4.5.0.bb
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -require xen.inc
> -
> -SRC_URI =3D " \
> -    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \=

> -    file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
> -    "
> -
> -SRC_URI[md5sum] =3D "9bac43d2419d05a647064d9253bb03fa"
> -SRC_URI[sha256sum] =3D "5bdb40e2b28d2eeb541bd71a9777f40cbe2ae444b98752=
1d33f099541a006f3b"
> -
> -S =3D "${WORKDIR}/xen-${PV}"
> -
> -# Xen suffixes the libexecdir within its configure scripts, prevent th=
e nested xen/xen/
> -libexecdir =3D "${libdir}"
> -
> -# These options override detected values from the build.
> -EXTRA_OECONF_append +=3D " \
> -    --with-initddir=3D${INIT_D_DIR} \
> -    --with-sysconfig-leaf-dir=3Ddefault \
> -    --with-system-qemu=3D/usr/bin/qemu-system-i386 \
> -    --disable-qemu-traditional \
> -    "
> -
> -EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware=
/vgabios-0.7a.bin"
> -EXTRA_OEMAKE +=3D "CIRRUSVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmw=
are/vgabios-0.7a.cirrus.bin"
> -EXTRA_OEMAKE +=3D "SEABIOS_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/bios.bin"
> -EXTRA_OEMAKE +=3D "ETHERBOOT_ROMS=3D${STAGING_DIR_HOST}/usr/share/firm=
ware/rtl8139.rom"
> -#EXTRA_OEMAKE +=3D "XENGFX_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/vgabios.bin"
> -
> -do_configure_prepend() {
> -    # fixup AS/CC/CCP/etc variable within StdGNU.mk
> -    for i in AS LD CC CPP AR RANLIB NM STRIP OBJCOPY OBJDUMP; do
> -        sed -i "s/^\($i\s\s*\).*=3D/\1?=3D/" ${S}/config/StdGNU.mk
> -    done
> -    # fixup environment passing in some makefiles
> -    sed -i 's#\(\w*\)=3D\(\$.\w*.\)#\1=3D"\2"#' ${S}/tools/firmware/Ma=
kefile
> -
> -    # libsystemd-daemon -> libsystemd for newer systemd versions
> -    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
> -}
> -
> -do_install_append() {
> -    # fixup default path to qemu-system-i386
> -    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=3D\).*$#\1"/usr/bin/qe=
mu-system-i386"#' ${D}/etc/init.d/xencommons
> -
> -    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.s=
ervice ]; then
> -        sed -i 's#ExecStart=3D.*qemu-system-i386\(.*\)$#ExecStart=3D/u=
sr/bin/qemu-system-i386\1#' \
> -            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.s=
ervice
> -    fi
> -}
> diff --git a/recipes-extended/xen/xen_4.6.0.bb b/recipes-extended/xen/x=
en_4.6.0.bb
> new file mode 100644
> index 0000000..1c84a6f
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.6.0.bb
> @@ -0,0 +1,51 @@
> +require xen.inc
> +
> +SRC_URI =3D " \
> +    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \=

> +    file://xen-x86-Fix-up-rules-when-forcing-mno-sse.patch \
> +    file://skip-headers.chk.patch \
> +    "
> +
> +SRC_URI[md5sum] =3D "48e232f90927c08326a7b52bb06f49bc"
> +SRC_URI[sha256sum] =3D "6fa1c2431df55aa5950d248e6093b8c8c0f11c357a0adb=
d348a2186478e80909"
> +
> +S =3D "${WORKDIR}/xen-${PV}"
> +
> +# Xen suffixes the libexecdir within its configure scripts, prevent th=
e nested xen/xen/
> +libexecdir =3D "${libdir}"
> +
> +# These options override detected values from the build.
> +EXTRA_OECONF_append +=3D " \
> +    --with-initddir=3D${INIT_D_DIR} \
> +    --with-sysconfig-leaf-dir=3Ddefault \
> +    --with-system-qemu=3D/usr/bin/qemu-system-i386 \
> +    --disable-qemu-traditional \
> +    "
> +
> +EXTRA_OEMAKE +=3D "STDVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmware=
/vgabios-0.7a.bin"
> +EXTRA_OEMAKE +=3D "CIRRUSVGA_ROM=3D${STAGING_DIR_HOST}/usr/share/firmw=
are/vgabios-0.7a.cirrus.bin"
> +EXTRA_OEMAKE +=3D "SEABIOS_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/bios.bin"
> +EXTRA_OEMAKE +=3D "ETHERBOOT_ROMS=3D${STAGING_DIR_HOST}/usr/share/firm=
ware/rtl8139.rom"
> +#EXTRA_OEMAKE +=3D "XENGFX_ROM=3D${STAGING_DIR_HOST}/usr/share/firmwar=
e/vgabios.bin"
> +
> +do_configure_prepend() {
> +    # fixup AS/CC/CCP/etc variable within StdGNU.mk
> +    for i in AS LD CC CPP AR RANLIB NM STRIP OBJCOPY OBJDUMP; do
> +        sed -i "s/^\($i\s\s*\).*=3D/\1?=3D/" ${S}/config/StdGNU.mk
> +    done
> +    # fixup environment passing in some makefiles
> +    sed -i 's#\(\w*\)=3D\(\$.\w*.\)#\1=3D"\2"#' ${S}/tools/firmware/Ma=
kefile
> +
> +    # libsystemd-daemon -> libsystemd for newer systemd versions
> +    sed -i 's#libsystemd-daemon#libsystemd#' ${S}/tools/configure
> +}
> +
> +do_install_append() {
> +    # fixup default path to qemu-system-i386
> +    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=3D\).*$#\1"/usr/bin/qe=
mu-system-i386"#' ${D}/etc/init.d/xencommons
> +
> +    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.s=
ervice ]; then
> +        sed -i 's#ExecStart=3D.*qemu-system-i386\(.*\)$#ExecStart=3D/u=
sr/bin/qemu-system-i386\1#' \
> +            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.s=
ervice
> +    fi
> +}
>=20

Any reason why you can't work with upstream on a solution to the headers
cross compile issue?

--=20
Doug Goldstein


--cNofnswfg03V2RCrX0GPV1AvRpmg555Ap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWeOODXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUnwgP/iYWn8YKFMU1SjWgjNu184O2
iIaI0cF8YvtmNlcfyed/ypARAB745NeysQr92RjFgFGGllpTBhzK63pETHmdOdoD
DXGw8rCM9igfmGJq9yYOESSNadt7y6AOBTROZTes1rWCOqhQEzW6By3pveBq9bXI
EYbgJBQ3+DPdpfmSJdP8Ertw2zg05TSDpobhIa5jYvA31foCuff1jAvk6iwSMF77
fYhaJapHWTSyGrHlP8OXyoxmMNHGtKhcJY5ZLnVs85THNFJF5MaF0O8XnZMRzpky
9XK/dUy6nz+vD2lS3nEL8JC6ygllhdJ5GMZ1wQtxIwJMWgNMQVMwwsJCcNAsifr0
BerTwQ0pV8A7mAacppC+Hxg2+KXHYF6/r8d6Zg/Lp4h6U+SFRdqBg7bXeDSgTUW5
Z1ou3nLiB95ToMzUW3GVPjQbhfokhvWSqKElazPdBtk4yAWfpBO+A7d6FW2l7ywL
+Fsc/bmG5T+X4D5lT7pd6uTTi+4mHVEYGcJUXfISk3Fu08KA4MzkFpcn6fENvbF/
faHjwUYBIHEgvEAPQps2T3n529m1UsK7IvvZBlvmDeVcEHywd7otZ7kNEY4JUtl1
kP+rWaaX4eOs+mA1ak5O8ufS32qM0WezSXCwCuC867SyAys6dv44Y/bDqdsRD+tX
/dqgHyRwgrr2Bo6l/Vqj
=E0xZ
-----END PGP SIGNATURE-----

--cNofnswfg03V2RCrX0GPV1AvRpmg555Ap--
