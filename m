Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30F08E00C8F; Sat,  2 Jan 2016 12:39:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E414E00AD8
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Jan 2016 12:39:47 -0800 (PST)
Received: by mail-yk0-f169.google.com with SMTP id a85so139927156ykb.1
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Jan 2016 12:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=gLjtNgISoLHUw5WMZPUqC7llZaRGkFTnlmO6/c9YCKE=;
	b=NbBoQVSgIEUjulsMfATds8LghZLTOO0N2BI+KpBD0+P2VZcPWjtARhfb1dZBEL4K+B
	WIhLUhj7ZRHmfZanfqbcawTiQ0pBtWM0NEZXzsqNKtlEMp0QVYgcWxjyUwbVlw6v/onS
	NSipxsM2sYI1PKHuf3bhEk5etuZIP3mxYiHbd7BNlmFYmJrotTx/C35zAV3LCCyc4/iH
	bifFIRKSL8SoPyYWTWBcR64gH4hZnwakbgSqWM4X61vT6z0tli/mPCtASY6li5gYciO2
	L1hlXOSpMwpq61lTSaJSNs/w4OMh0PVRfnemFAtOxQyTyJ/xnos0BL1a8eyPMiT7j1rw
	O+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=gLjtNgISoLHUw5WMZPUqC7llZaRGkFTnlmO6/c9YCKE=;
	b=GSDkjDHwlzzY9e6DgaIv1haIMSz4XmYsaIKbRlqjMTS3v/V+AEV390AT9Xnjx9NU59
	NQ5Ioasmlww+5kF2hMoOzG2JMQ5Q6dU0wgPuzXa2rvqKMwAAaKb50zONQzXX9aW0ykTo
	uLTWcWZX8oWMwNiZdDokkyfNyvm/v9ReOGMqB3mTRpGngbInXywdptnMh8OkXyJGN21w
	XpowNlzZB+ILmSzUsPjhWcqfX5ji7wMI8npkzaf0wF6DuqOp5QsVH8FQ6kEc8E7xRpmc
	HyC6qNWXB90SWWUhqByWIo7U3gTbyBdWht2oF+mLD1dH7YHnzP1iA/U89QgPfUwf07X4
	FHDg==
X-Gm-Message-State: ALoCoQlQhsJKOdbIzvbTxoGRaTSeAoCFFt0QZJV4CfnWShHJvRg1eHw1h6ynLU1AeA05H3QY0vMctsItXC5zF7HqE70U3ASbHQ==
X-Received: by 10.13.232.87 with SMTP id r84mr64756400ywe.67.1451767186906;
	Sat, 02 Jan 2016 12:39:46 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:9145:7084:541a:f174])
	by smtp.googlemail.com with ESMTPSA id
	g73sm69367567ywb.1.2016.01.02.12.39.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jan 2016 12:39:46 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>, meta-virtualization@yoctoproject.org
References: <1451663657-25079-1-git-send-email-cjp256@gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56883596.5010206@cardoe.com>
Date: Sat, 2 Jan 2016 14:39:50 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1451663657-25079-1-git-send-email-cjp256@gmail.com>
Subject: Re: [PATCH] xen: add libnl to DEPENDS
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
X-List-Received-Date: Sat, 02 Jan 2016 20:39:54 -0000
X-Groupsio-MsgNum: 1632
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="90NdJw3JK9HcJRttM4uHoL2fjwQ8677aI"

--90NdJw3JK9HcJRttM4uHoL2fjwQ8677aI
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/1/16 9:54 AM, Chris Patterson wrote:
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/xen.inc |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index 6bc85fe..d3a8b10 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -35,6 +35,7 @@ DEPENDS =3D " \
>      gettext \
>      glib-2.0 \
>      iproute2 \
> +    libnl \
>      ncurses \
>      openssl \
>      pciutils \
>=20

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--90NdJw3JK9HcJRttM4uHoL2fjwQ8677aI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWiDWWXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUxDYP/3Q1oxeA1jeLFoQS7L357V6v
8686EyscyevL8LTmIT+9/uFSf45kBizA0nBTWwUaA/PSztJAxo8BTxRUersaP/9V
89Emz/a04hmNgh+m8xaysHHO8WKFIbHLTUX6XDgdch/Mi9NPDZk8gaPzOgSSRqMp
1iqQSVNrkHZhtglCltbrKDPI/57lii1KBeTmgNbC6f2Us0OSjuojHaCx/Qu8tcju
/jLVCaUCbNLempNMI6S5hlfmpJQXFLQ9/od6NQUeRzLM6ayiNB1yrifo0jB6S4wk
liJCDr1QRcg1Sq+VqJgzI1aZiOg2aRF4WsnPNAJfiUnXw1Hlew7T4zZp+ll6b9BV
gjdUY4Cthz+9FtMC+8oMP/QYqRw4x9O7LxBNcgLLF+0y5AKGrTwv552XpBdPDWEP
xk6+JSgLiJBLP8+TDM3mRGvTgqIPhexkBkRutwRJBc45pUENuNgxG960N3gvPClA
bIlnqg/aeoZBWhdcMHJjgpdWrd+sIOJItud2P8wC/CCoZaEI8U5+c30NcwxSaKwI
BXq0LI4wwT0dQVLLqviP/L0NIebcTcvYAbmlGbw/New/Ah13xmc4E/ICh9afTlV4
qxgvGWHBCwx/FMa/kz1hZUhKfLDMG41KamjnRruw2Q0pHqKjwIJnTgxUFh2SIvdr
bWugw+zcylOb0rrqEVbZ
=SE/e
-----END PGP SIGNATURE-----

--90NdJw3JK9HcJRttM4uHoL2fjwQ8677aI--
