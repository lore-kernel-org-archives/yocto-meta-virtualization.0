Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBB24E00C45; Tue, 22 Dec 2015 15:09:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 848CEE0088B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 15:09:04 -0800 (PST)
Received: by mail-yk0-f181.google.com with SMTP id v6so178860038ykc.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 15:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=w+gd48or8afA6cyVU8q8QE9d/uRHcyfMM51C+rB0FAA=;
	b=oPl7kh1m8k1MFNJQz3VYrYI72Ro24OqmaT+b2Cncq4Ou6h+5W2nO1f9/+y7zhJPMBv
	FIYILhMXXVMMzAeCQpD5HS3lOm3cmDAzhcNtRhw9DTIbHcbc73hsF8FeW+BU2gzzNFno
	g2SZNMRXukPxN8AqospGp4O/5oSrBKtQiIf1suWI4bm0yuzY4l5gmNELkSw633mEyYxA
	a+ihEIgIjQyQLg0R++L0UuZtI/BdWJRxX3BhLDpL2BnY9gY448T2I08xyTsD/c02wXxn
	Fo0V96puv5l+s34EW/HZ/g6J3bpAJROsbdIYDnhMF/WaW8XVDTqSnUv6u36DuXNCFshs
	eRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=w+gd48or8afA6cyVU8q8QE9d/uRHcyfMM51C+rB0FAA=;
	b=e6G7EZWJcRrrrBIhqKV/uR4ekU+pfZusWOGU06D8Y/ZucsP/yGcj3SbtjyA2x7iADu
	Bjn0k3bmRkjlSg/WfcHJilj/DiJQWMsxHOCOnPyriUxa/JaOlKAOpQfTNBf3NHe6xLt3
	TJUFeLdFYFw+wBsyErTPKiaqZNhfArzohp8ZChKBkM+y+9bCw0Hg3O/qM3cZ6G8WqtXN
	G2VQBZttZdg5Y/Y9apsOQO7FSPvGXfHIAnF5F9uNzBgds70eOevxbkYHBkYVls8rOUuw
	UJOh/yME24QMIcacHYDoJ1grI1y3K1GVPdYinvKd6TqmbyAQu7wgUXWjRnSn2n+jbMqg
	tTJQ==
X-Gm-Message-State: ALoCoQmowVI5fC8Qju6FtYnfGHG6NeyBLsqJMZypni/H/6YCOWaSqPy5L7Rc5nGYj4M6B5hKRZzuk/G/7o3RAnxEyBpfSfJGrg==
X-Received: by 10.129.96.69 with SMTP id u66mr3261505ywb.344.1450825743541;
	Tue, 22 Dec 2015 15:09:03 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	d125sm10737176ywf.21.2015.12.22.15.09.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 15:09:02 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>, meta-virtualization@yoctoproject.org
References: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5679D809.1010503@cardoe.com>
Date: Tue, 22 Dec 2015 17:08:57 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
Subject: Re: [PATCH v2 1/5] seabios: uprev to 1.9.0
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
X-List-Received-Date: Tue, 22 Dec 2015 23:09:06 -0000
X-Groupsio-MsgNum: 1622
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="NhEDQNPEvbUAmR73PXOGtOFnArrrt70n6"

--NhEDQNPEvbUAmR73PXOGtOFnArrrt70n6
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/22/15 1:02 PM, Chris Patterson wrote:
> SeaBIOS 1.7.5 fails to compile on newer gcc, so update it! :)
>=20
> Also removing PR while I'm here.
>=20
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/seabios/seabios_1.7.5.bb |   45 ---------------------=
--------
>  recipes-extended/seabios/seabios_1.9.0.bb |   43 +++++++++++++++++++++=
++++++
>  2 files changed, 43 insertions(+), 45 deletions(-)
>  delete mode 100644 recipes-extended/seabios/seabios_1.7.5.bb
>  create mode 100644 recipes-extended/seabios/seabios_1.9.0.bb
>=20
> diff --git a/recipes-extended/seabios/seabios_1.7.5.bb b/recipes-extend=
ed/seabios/seabios_1.7.5.bb
> deleted file mode 100644
> index d57e250..0000000
> --- a/recipes-extended/seabios/seabios_1.7.5.bb
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -DESCRIPTION =3D "SeaBIOS"
> -HOMEPAGE =3D "http://www.coreboot.org/SeaBIOS"
> -LICENSE =3D "LGPLv3"
> -SECTION =3D "firmware"
> -
> -SRC_URI =3D " \
> -    http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.g=
z \
> -    file://hostcc.patch \
> -    file://defconfig \
> -    "
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504         \
> -                    file://COPYING.LESSER;md5=3D6a6a8e020838b23406c81b=
19c1d46df6  \
> -                    "
> -
> -SRC_URI[md5sum] =3D "3f1e17485ca327b245ae5938d9aa02d9"
> -SRC_URI[sha256sum] =3D "858d9eda4ad91efa1c45a5a401d560ef9ca8dd172f03b0=
a106f06661c252dc51"
> -
> -PR =3D "r0"
> -
> -FILES_${PN} =3D "/usr/share/firmware"
> -
> -DEPENDS =3D "util-linux-native file-native bison-native flex-native ge=
ttext-native iasl-native python-native"
> -
> -TUNE_CCARGS =3D ""
> -EXTRA_OEMAKE +=3D "HOSTCC=3D'${BUILD_CC}'"
> -EXTRA_OEMAKE +=3D "CROSS_PREFIX=3D${TARGET_PREFIX}"
> -
> -do_configure() {
> -    install -m 0644 "${WORKDIR}/defconfig" .config
> -    oe_runmake oldconfig
> -}
> -
> -do_compile() {
> -    unset CPP
> -    unset CPPFLAGS
> -    oe_runmake
> -}
> -
> -do_install() {
> -    oe_runmake
> -    install -d ${D}/usr/share/firmware
> -    install -m 0644 out/bios.bin ${D}/usr/share/firmware/
> -}
> -
> diff --git a/recipes-extended/seabios/seabios_1.9.0.bb b/recipes-extend=
ed/seabios/seabios_1.9.0.bb
> new file mode 100644
> index 0000000..fcdc0c5
> --- /dev/null
> +++ b/recipes-extended/seabios/seabios_1.9.0.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION =3D "SeaBIOS"
> +HOMEPAGE =3D "http://www.coreboot.org/SeaBIOS"
> +LICENSE =3D "LGPLv3"
> +SECTION =3D "firmware"
> +
> +SRC_URI =3D " \
> +    http://code.coreboot.org/p/seabios/downloads/get/${PN}-${PV}.tar.g=
z \
> +    file://hostcc.patch \
> +    file://defconfig \
> +    "
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504         \
> +                    file://COPYING.LESSER;md5=3D6a6a8e020838b23406c81b=
19c1d46df6  \
> +                    "
> +
> +SRC_URI[md5sum] =3D "c3fea87e731e396bd4e7e2c478ba39d9"
> +SRC_URI[sha256sum] =3D "88595545c6d580a7a6da1c40befc46dd74c0e4aaf80854=
7867dd7ce8cc3b4d0e"
> +
> +FILES_${PN} =3D "/usr/share/firmware"
> +
> +DEPENDS =3D "util-linux-native file-native bison-native flex-native ge=
ttext-native iasl-native python-native"
> +
> +TUNE_CCARGS =3D ""
> +EXTRA_OEMAKE +=3D "HOSTCC=3D'${BUILD_CC}'"
> +EXTRA_OEMAKE +=3D "CROSS_PREFIX=3D${TARGET_PREFIX}"
> +
> +do_configure() {
> +    install -m 0644 "${WORKDIR}/defconfig" .config
> +    oe_runmake oldconfig
> +}
> +
> +do_compile() {
> +    unset CPP
> +    unset CPPFLAGS
> +    oe_runmake
> +}
> +
> +do_install() {
> +    oe_runmake
> +    install -d ${D}/usr/share/firmware
> +    install -m 0644 out/bios.bin ${D}/usr/share/firmware/
> +}
> +
>=20

Only question would be did something need to change in defconfig with
1.9.0 for Xen?

--=20
Doug Goldstein


--NhEDQNPEvbUAmR73PXOGtOFnArrrt70n6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWedgMXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUCdwP/01UV5OQaT1dPDu/oJ0P9aJb
h4q2j7a7jihBgOs8czLF0brpg57q+cnYM0zs0kQddZQ67jL6hSQrBMeWxkoOprxl
7N3u9Bi/h9AO6uLiOuD7YC4HKOUqRnd7GCpW2I8nhw00NBlXSNDNCwnZu4UOIoPo
xkaqIW5tVha2LlWci2vwLhz/8N0QjuOFJOTQ27jJMoDJxbGSaH14ona9m/76N0bj
fCwtBhwpQ83W2SyqqgRT0rp8RV9VB/N3NxESC8QG/2zBB0JRCz4m8oZwWDoAiYOk
njYZJxtcwFbOqPVsAi2x1JAm8VvRgFn6MKb8dkaiwBn4wA8ItQYRuqa7U9P/hB4n
b0JaFE2wsHpwvnniCpPhN9bj0firz6vi5SCHfRq9PcZYkc0DEqeQauYCqdwt1rv3
Qeng1W8wgh8GeTFnWRmOAB53ITRa6+AAVVY21pxfAnozP8oS+7dtGMizUHhp5jiU
aLq5YKL8JksMbsYTi2sn9GhIKb0FDY0+wz4dmOPTqANyn2OpQe1KkpV0IECu06Ec
mVh1ufixvb80xtwERgjguvlocYvi1jbbWfn5A77pt/kE7UkSE/58694Bnr1ySjFK
JoXd0FBsbu+CYZtOe1UDVMv9NFEF95Iu/e8//DgfRZgOA/f5znCUd45nY2mlV0fr
WiJfIO48UkE09PDbfZcF
=NhmP
-----END PGP SIGNATURE-----

--NhEDQNPEvbUAmR73PXOGtOFnArrrt70n6--
