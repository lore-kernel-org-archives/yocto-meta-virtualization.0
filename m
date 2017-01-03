Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46A52E008D3; Mon,  2 Jan 2017 20:56:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.195 listed in dnsbl.sorbs.net]
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AE63E00890
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Jan 2017 20:56:04 -0800 (PST)
Received: by mail-io0-f195.google.com with SMTP id n85so29486502ioi.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Jan 2017 20:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:references:to:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=kxittpgiCOjAwd7SJt+UEKWva8gmpGMcKr39torQ+Nc=;
	b=KPeTqV53E3Oldo30qIbMI+wCnxQobblA3hTWPqgavQSFczXvMVZr4d5kF0dWGhtfo2
	U+qhZPURIC1uSTWFaKYLN4e4MGCwnl0iBO6D6A9tn+em2slac62OwtN+aED8TsraKxBv
	ip5Ugu4dmln3BR7DCyrpEze4RyGXeFBCdK5XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=kxittpgiCOjAwd7SJt+UEKWva8gmpGMcKr39torQ+Nc=;
	b=lrYQehw/pdGTLTaQeJA/IjxZbAn1+F9t9HFySyjKKa1g1nzNwdCJ4gy0Hz1pWbYfE2
	9+T2Gvvnt8a4RnviRPmTc1CuKD21hUitnlsppjxLC8seDJK5rPvCeWotL4tn+SlJ5pYs
	DSLN111QqgvYb1mKGlWTXsBEK1bJRuXPnA+Alb5NVwAVhv9lRw/Umn4NB+cZBemDq17P
	4d/5a6QzsikBMhwc3Kbwr/VEFFePXg+wAwyZTYdb8pSNGx9RHvQJ9nfq4fghLkLLUwMW
	o6AVet1ICmfU09NEv+vCyYRGrMz6rNmDL+0/wzaM9A6DCSoFuC8PcgeFR6ZqzjDoW9px
	j4Qg==
X-Gm-Message-State: AIkVDXI2ptWWGGdTHWzz3ZTEi6UGv8EPjDNVZN8Cj8FuL1B75ffQ5lqfyJ4EAmZxaMzF0Q==
X-Received: by 10.107.170.94 with SMTP id t91mr43234262ioe.200.1483419364297; 
	Mon, 02 Jan 2017 20:56:04 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	g127sm3109767iog.3.2017.01.02.20.56.03
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 20:56:03 -0800 (PST)
References: <20170103044754.15012-1-cardoe@cardoe.com>
	<20170103044754.15012-3-cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <0d1b88c0-7533-8b87-9928-33ed185ea9a9@cardoe.com>
Date: Mon, 2 Jan 2017 22:55:59 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170103044754.15012-3-cardoe@cardoe.com>
Subject: Re: [meta-virtualization (krogoth)][PATCH 3/5] xen: add gnu-efi to DEPENDS
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
X-List-Received-Date: Tue, 03 Jan 2017 04:56:08 -0000
X-Groupsio-MsgNum: 2230
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="SgjLaEKilG15LLHNgPB5X0Kesfks5jwVj"

--SgjLaEKilG15LLHNgPB5X0Kesfks5jwVj
Content-Type: multipart/mixed; boundary="ilmEd6eGVPStGP4Vt7JBgXxbhx3Efa3t8";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
Message-ID: <0d1b88c0-7533-8b87-9928-33ed185ea9a9@cardoe.com>
Subject: Re: [meta-virtualization (krogoth)][PATCH 3/5] xen: add gnu-efi to
 DEPENDS
References: <20170103044754.15012-1-cardoe@cardoe.com>
 <20170103044754.15012-3-cardoe@cardoe.com>
In-Reply-To: <20170103044754.15012-3-cardoe@cardoe.com>

--ilmEd6eGVPStGP4Vt7JBgXxbhx3Efa3t8
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/2/17 10:47 PM, Doug Goldstein wrote:
> Allow Xen to build the EFI loader by including the required dependency.=

>=20
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index 429a05a..0d156dc 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -52,6 +52,7 @@ DEPENDS =3D " \
>      xz \
>      yajl \
>      zlib \
> +	gnu-efi \
>      "
> =20
>  # inherit setuptools adds python to RDEPENDS, override it
>=20

I screwed up the whitespace. I can resend.

This patch should also be applied to morty and master.

--=20
Doug Goldstein


--ilmEd6eGVPStGP4Vt7JBgXxbhx3Efa3t8--

--SgjLaEKilG15LLHNgPB5X0Kesfks5jwVj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYay7iXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUO60P/2qykayd2K2slinM1GlpItWE
YmQjhzbxDdzFhTKnm0K02LVF8+UznNUgNVpkgKfZdwlc8xoKuihjXbXVpIRgtTnZ
djCRqicqiJ98QgRurAstB0U08XJrVeT+tXnFe3K00mzHjR94zZOVGxV+jSvY2vrc
r6+0j8rhURATbOZqMMrDP3CzT24OhwW8j49CbKzvX6SjXVGmhOfLFSEPac8xaWl5
qaobubtIU+WqGAgqZNSGTv99FOnUs4KZj/83CFIDmDNeY8F9VL6X1AxK0HQoiXWV
2wb1dMdDrDFuyuTh0NiMCRjO0EkxG5edrYbzGyxza8ENlVio7HgF8dPncEbsuRmv
Thtp8iVhbS+2tvb+03C+U3DiY6JRKUPHkDy912i4wX4NpcosWSFkQ5t5uJ6Rzs1O
hlXXhLbUwnmUn9JO0VUehgpafOD7KSxT2538UZYuOweh2gTOJRgUGtBfy3YHPDdx
JS/xHiCd5Cevs+tg1hStFDbLis0o7xz+ZPyikS/uhdrmizDZ/Z8vMCZBo1t8pL1p
fqMG9zCoBHrT6Z31Locwq/vprTT4EX/BqHdBR9LrbqKHbXnNepqgIgg1F1iLsJCh
CTc3QsTybjC7GJ5v/duLr61U9g3VA7iaFP1Xu1Wjp2aedUJnt1W8ifA5WzWTtUgi
Eh+lZJmI+lXzMpHNzqHw
=oCAn
-----END PGP SIGNATURE-----

--SgjLaEKilG15LLHNgPB5X0Kesfks5jwVj--
