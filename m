Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBC1DE0090C; Mon,  2 Jan 2017 20:57:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28080E008F3
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 20:57:49 -0800 (PST)
Received: by mail-io0-f195.google.com with SMTP id f73so55815084ioe.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 20:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:references:to:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=JIOGej+NLt8GKfSDAC+PiIYL3ILvnvNcWT/Hc6c1pdk=;
	b=FI/u3ypQwSalyB75+wujblUw9fgvEUnUBothsFFBxA7RS5mwhqSh8sUHfXjsM8pm6Z
	mREOpUbcaSFjd6C6noWliMXjIyGtEc2QMyg1L6Sbi1NA/JIBXW76O3mWpIpmbSyFhzkd
	10MuMWP/4ZOA6oEYd9kIibubcDfFauZ4+oRxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=JIOGej+NLt8GKfSDAC+PiIYL3ILvnvNcWT/Hc6c1pdk=;
	b=DnzHFA4TvG901nm0kb8i96BBg3QFQhTdzcytKmReUsyLSSvnVsFpPv5YgjM6MzS2U7
	+8ZwrI6kXfFpQGVsyoKbnT8Qfnu8jHPmSRje/j26gDIJcK4XEsL4EQ4UN1iaBjmu5n0r
	ldc2lpUC6THuKU1ROE8xRLwI2aYVu85dx9fex7fowr+Zls6MuW23EICWrKm/YekBfBhW
	9vP2/vD3fgq0hy2iOGg/+0SJ5+MaMQwHKq8/KCPeq+h/DdEn81Cy5V8rSWB7rL1NFa/I
	+F45mqWVx9FJ5+xzsGRlHYgBFf5GHPm92Lg8ILLQ/2Yb10x/bna0rPfFafbIHCXkefZl
	BjrQ==
X-Gm-Message-State: AIkVDXL7a/YRqmORIt44K3IHlGtTkkMdGLkM0heIhZzSXBrV2jYOvebUwWuwd7uOJAD38Q==
X-Received: by 10.107.4.132 with SMTP id 126mr44128786ioe.191.1483419468750;
	Mon, 02 Jan 2017 20:57:48 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	g190sm3116489ioe.30.2017.01.02.20.57.48
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 20:57:48 -0800 (PST)
References: <20170103044754.15012-1-cardoe@cardoe.com>
	<20170103044754.15012-5-cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <93bb80b4-fffc-f895-820b-ad52ac54eb24@cardoe.com>
Date: Mon, 2 Jan 2017 22:57:47 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170103044754.15012-5-cardoe@cardoe.com>
Subject: Re: [meta-virtualization (krogoth)][PATCH 5/5] xen: ensure we build release builds
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
X-List-Received-Date: Tue, 03 Jan 2017 04:57:49 -0000
X-Groupsio-MsgNum: 2232
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="tbSqMKrwBTBGG3VA5XPdMU11ITjoLGT0I"

--tbSqMKrwBTBGG3VA5XPdMU11ITjoLGT0I
Content-Type: multipart/mixed; boundary="MBRxhHbGusu96XxxwBP1Iu1vCgspNsart";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
Message-ID: <93bb80b4-fffc-f895-820b-ad52ac54eb24@cardoe.com>
Subject: Re: [meta-virtualization (krogoth)][PATCH 5/5] xen: ensure we build
 release builds
References: <20170103044754.15012-1-cardoe@cardoe.com>
 <20170103044754.15012-5-cardoe@cardoe.com>
In-Reply-To: <20170103044754.15012-5-cardoe@cardoe.com>

--MBRxhHbGusu96XxxwBP1Iu1vCgspNsart
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/2/17 10:47 PM, Doug Goldstein wrote:
> Don't build with asserts on. This is the default for release tarballs
> but if someone bbappends patches in we should ensure they don't shoot
> themselves.
>=20
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index 38922dc..d9490fe 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -843,6 +843,10 @@ addtask stubs after do_configure before do_compile=

> =20
>  # Allow all hypervisor settings in a defconfig
>  EXTRA_OEMAKE +=3D "XEN_CONFIG_EXPERT=3Dy"
> +# Build release versions always. Technically since we track release
> +# tarballs this always happens but occasionally people pull in patches=

> +# from staging that reverts this
> +EXTRA_OEMAKE +=3D "debug=3Dn"
> =20
>  do_configure() {
> =20
>=20

This patch should also be applied to morty and master.

--=20
Doug Goldstein


--MBRxhHbGusu96XxxwBP1Iu1vCgspNsart--

--tbSqMKrwBTBGG3VA5XPdMU11ITjoLGT0I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYay9LXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvU1psP/11cA9eS1V6kTHjvNyWjtxcL
2QV/LoxtUakyw4T90pYqayAnB2QqaNnht7oM8IjwoP285Lad/bIIzTAVBNZTDdBE
S72ST+/Ow5lxxInUXRr2ximDDn5R2E6ou2A7R/t4i1uqxd76mmOD5ihOchgZeWSM
4M/JSxnKZZ6JT6PxE5pAgqy3u1lI5tEzdGFW01s2zYOYK6lxy3+ZRJ7yiH6ibca0
UxCEMayCi5yI5uVuTULZfH0BZmCw8pNuein1A3sWu0JnYFny9QS+iC3BOf7BgDCX
9nMVKsfIZysZswjX0syfgPQQd3pd6WJh95JOmOpuCbBEf2/x4VoAFbPWE8mcyHK1
G3nP+aKB2i3cF403gA7XgT1dJW8gKrchAxYnJlYMrYzNla0kH80uP5OrtFQvy2Uj
Y4TSh/m4rzILFv8DC0UKHrg6ORvej6+T3jfrscuEHzZvng1h+iVXxhnikrNKxnp9
sdN97UjoeOnzwdFX2c+vX95z0TnML3hDyKxBiXpKclDE8rnAGWFQesKtWRlkQfIu
HgXCkS5cJnnxmzLuEiCMLRyj/UjPy0DipVnP9yeW8+2l0i8FN08K3BSPlG7rbZqB
IxuDfTxvGYF6Y68jMVMaIAIh5A7jpJQMSdxnnVSYAc8Z19oW7g6iC0ygQC0aQqOE
kQOqndWz6nhO2ifS1++Q
=wcVH
-----END PGP SIGNATURE-----

--tbSqMKrwBTBGG3VA5XPdMU11ITjoLGT0I--
