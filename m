Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C19E8E00905; Mon,  2 Jan 2017 20:56:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.214.67 listed in dnsbl.sorbs.net]
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 857BCE0089B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 20:56:34 -0800 (PST)
Received: by mail-it0-f67.google.com with SMTP id 75so49689810ite.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 20:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:references:to:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=1Vnt/wO0Ku6DTKCWgpVu4DtM4u9kQWyDp0j1gMPzuaw=;
	b=Gk/KiiiED91PbQ6WasMCGSqKiS+LXEX2ELwVTcVYKbU1gvQlXbbiAhjCkh9yLu9IPV
	k3UPd7KzRNumzJhI2trGYq4Jsy2yo3oBI/yOF4WUSSCIQiMUWMxL8dAqJ6Gn9T20/yZq
	1w1wwVuU4pWkc+GE36/L39w0MxOAuEJjgoiXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=1Vnt/wO0Ku6DTKCWgpVu4DtM4u9kQWyDp0j1gMPzuaw=;
	b=F1JxMdfWDmjfq/3/IIplXEccpptgTvBIz3HsFGLEUzbO+X2Ubbl+kQKlwfoayaFCXr
	QJDo6OmpfeiXIEns3WmLyJU5jyIQCbYF09lsQhJoC/meBrEVEfb6jvgrNPmtiLqR8CFx
	4n9dpn3Y3S+Eeylafk4aXUJfvZfLB95PoPahBwiNRHCi6BvYXa1s/zhUCtOe54b0yOFz
	95gDUa8ZHPIH2dNfeSH5MEvsIWLXz3c+K+hkjGX+YjKWnM2egzakY2UqAZZqUeB8GUHd
	3atAs3T6uoFtFjXntNHVYnjMo/Px7A11RxfQ4Gvdv+RisFbOZBOcXuQ5LbK5mAR6wjF0
	egMQ==
X-Gm-Message-State: AIkVDXKrydYanNUsM4LCLX58MOnXirVtGYKtmv5A5ozWZRbwx/pculy2N6ZhXnOzw7A1Yg==
X-Received: by 10.36.51.76 with SMTP id k73mr53206894itk.22.1483419393928;
	Mon, 02 Jan 2017 20:56:33 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	j143sm35275190ita.1.2017.01.02.20.56.33
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 20:56:33 -0800 (PST)
References: <20170103044754.15012-1-cardoe@cardoe.com>
	<20170103044754.15012-4-cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <d3e1b5e5-c3ee-c9a1-e3d8-346631df75b3@cardoe.com>
Date: Mon, 2 Jan 2017 22:56:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170103044754.15012-4-cardoe@cardoe.com>
Subject: Re: [meta-virtualization (krogoth)][PATCH 4/5] xen: make it easy to override hypervisor config
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
X-List-Received-Date: Tue, 03 Jan 2017 04:56:36 -0000
X-Groupsio-MsgNum: 2231
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="2C2FAp4QEQ4soipaUOkOCiOojckN8dP1D"

--2C2FAp4QEQ4soipaUOkOCiOojckN8dP1D
Content-Type: multipart/mixed; boundary="Gp1u11IgbBCxhCg8vfXedqaTc5riLR3W8";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
Message-ID: <d3e1b5e5-c3ee-c9a1-e3d8-346631df75b3@cardoe.com>
Subject: Re: [meta-virtualization (krogoth)][PATCH 4/5] xen: make it easy to
 override hypervisor config
References: <20170103044754.15012-1-cardoe@cardoe.com>
 <20170103044754.15012-4-cardoe@cardoe.com>
In-Reply-To: <20170103044754.15012-4-cardoe@cardoe.com>

--Gp1u11IgbBCxhCg8vfXedqaTc5riLR3W8
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/2/17 10:47 PM, Doug Goldstein wrote:
> The hypervisor is now configured with Kconfig like busybox and the
> kernel. This makes Xen behave like the busybox recipe by taking a
> defconfig if the user has one provided with a bbappend.
>=20
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index 0d156dc..38922dc 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -841,6 +841,9 @@ do_stubs() {
> =20
>  addtask stubs after do_configure before do_compile
> =20
> +# Allow all hypervisor settings in a defconfig
> +EXTRA_OEMAKE +=3D "XEN_CONFIG_EXPERT=3Dy"
> +
>  do_configure() {
> =20
>      #./configure --enable-xsmpolicy does not set XSM_ENABLE must be do=
ne manually
> @@ -848,6 +851,11 @@ do_configure() {
>          echo "XSM_ENABLE :=3D y" > ${S}/.config
>      fi
> =20
> +    if [ -f "${WORKDIR}/defconfig" ]; then
> +        cp "${WORKDIR}/defconfig" "${B}/xen/.config" || \
> +        bbfatal "Unable to copy defconfig to .config"
> +    fi
> +
>      # do configure
>      oe_runconf
>  }
>=20

This should also be applied to morty and master.

--=20
Doug Goldstein


--Gp1u11IgbBCxhCg8vfXedqaTc5riLR3W8--

--2C2FAp4QEQ4soipaUOkOCiOojckN8dP1D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYay8AXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUyFoP/12d04aIL2ZzLTp68a9FAlLF
Qoz1W4FnCKcLrtG8fBdv6g9hfPHg/qahf2qKlosuTFEZYDSnpKJuyIDS5FYkVGLV
W9cft/L/6+cy0Q+Uk2acwyzyS5NVqXgnNPu0botlGIr+LZF39AwAoX7i72B1vO4K
KSpB7CZmh+Ko98fjprBAMx+OwDHNwux/GNQ+wUaLxwFGXS+9QleW2j74oNWk9GKG
xyEpbW7IiDtpKYwkXhCtdB/nBWMC15TlvOLUtp+hNg3sfCkeZqBkoFWoNLjqSzg7
10c8MrVlSVQ5URRlrcdo/c30zbLTCyhMdZR+qb5G+9FzQLzGCfvJ+fZgxLSND0zf
tLZV1Te4MW7psJd7b9xIli6RDKYEPI6hagJ+Ec3oOcA8KWaN11YpwQPUQDLP2tlt
qlspOr5OynnTaL6j+dC6YqEYSagOq5z6XsEuqnJ88G7jB8RBJwuttsWN5YBqaz9b
5kMQjNOVfVe2gWuvjINX6aDABzJXnRDjQh6not/gIkmMCU1ofaRIEDdeAGvRlFN4
kosKwJ6/QC/gOjazUFeiPYqrrCmNM25mrtyY2Dt7Q/CfTwDRxnh07Z3gKNK8dtWd
9oIVgD4woURQDy6axqc5b62dyUaoIE1yaHKQPQGUumqoSNm5VAKT3frjpRIIdcgK
/Zgh+kgPlWDclHuEzCxx
=vrxZ
-----END PGP SIGNATURE-----

--2C2FAp4QEQ4soipaUOkOCiOojckN8dP1D--
