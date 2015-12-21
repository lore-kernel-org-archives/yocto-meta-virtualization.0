Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 877C9E00C55; Mon, 21 Dec 2015 12:11:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E20FE00457
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 12:11:33 -0800 (PST)
Received: by mail-yk0-f179.google.com with SMTP id p130so141773949yka.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 12:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=oy6cEJevN+Ga+xClkLV1ZVhXhjvoyzf7R1u5vLvlaiQ=;
	b=kEDQqQtr5aZ47w/6ee+j3u2vPMiG67MLMfCwkFx1s3hiilLlNXCc8Z0kaeGPlL0dE+
	mGWUc+Pig+0QemYZvVzXoYMNMf2SBiYn9vjSiGJhBzFtdmiYxUeWo1vr4AoiQZ/CYUsC
	lv7spf9GUwlfgKVAi0dVsAljvcsXEDsz39KvRPUW0ymJKaQs5EBqYYDc9eaZuYKY3yeg
	ffOpyuOh5fbkhOME9kBKHZcF7dlu00V5Ce9rbeNjRXeVuSCyoZ0QYWnwcbirvNLw5Wvr
	GYB8dGQKteto+NBHTwVqNVDUD5khyHq5+VNDGJWTzjoSj6l2VuiZHUBjaR8qR6tfgx/U
	tjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=oy6cEJevN+Ga+xClkLV1ZVhXhjvoyzf7R1u5vLvlaiQ=;
	b=X01LPaL9P6qfZ4SgvkVtGV/+5m0kXbBSKXdXdRyiGPZ2J0ewWmYFHk6EH6y+IWWgXj
	IIa2sKKcfdZ7/xfNwS+ZtFs4GE8ZJQ8fTaYXOI58m6tmrdukef2aE+C3Iuw624FP1vgO
	vQowiUKo/tEosPKrVk0Mph2exPlB/5rO+nBBIew4HIsS8eaRsr5Y8dn2qPOwx8rGoOA6
	Xlh+k3PRCRu/s6kLVeRj9CZt1A+nB8bPLi7CkABdBAeiGJ8LWC9Lu/nIJUKjjmWMv8aR
	0z3mgzBNfnEYw/I8zt9h4VdB3zJCVKRLXyf9yW1gqAi9PvStJVTbEzb3D5OOseYxV8DI
	wvBQ==
X-Gm-Message-State: ALoCoQkYwxnE1Y6Ij8IM7ZLKuV0ZpAtVbcDETLy0M2OcoNLNtmeiOPXr51ZujY8iA10hdYFNtrB9/AyoHBNCxhKkUgFrYTWs0A==
X-Received: by 10.129.152.7 with SMTP id p7mr16115119ywg.85.1450728693490;
	Mon, 21 Dec 2015 12:11:33 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	x83sm30171682ywb.47.2015.12.21.12.11.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 12:11:32 -0800 (PST)
To: Machon Gregory <mbgrego@tycho.nsa.gov>,
	meta-virtualization@yoctoproject.org
References: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56785CEF.4090702@cardoe.com>
Date: Mon, 21 Dec 2015 14:11:27 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
Subject: Re: [V2 Patch 1/2] Disables OCaml tools.
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
X-List-Received-Date: Mon, 21 Dec 2015 20:11:36 -0000
X-Groupsio-MsgNum: 1595
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="hFa2RCq1cvtjppuhpg0KOQVdFjwFLSeFI"

--hFa2RCq1cvtjppuhpg0KOQVdFjwFLSeFI
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/16/15 11:08 AM, Machon Gregory wrote:
> There is currently no support for OCaml in OpenEmbedded.
>=20
> Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
> ---
>  recipes-extended/xen/xen.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index 00f1823..9e35459 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -712,6 +712,7 @@ EXTRA_OECONF +=3D " \
>      --disable-pv-grub \
>      --disable-xenstore-stubdom \
>      --disable-rombios \
> +    --disable-ocamltools \
>      "
> =20
>  do_configure() {
>=20

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--hFa2RCq1cvtjppuhpg0KOQVdFjwFLSeFI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWeFzyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUwCQP/2CLkpJ0aZljwB/iRS1MbI1N
2DMxbyiMdKY0mdVYSEBG2eA4bFKWo7wc5HJQhp/thYNXV/PezTDVjnwkETWw/PiL
Fdn0XN3uPBZ9gs4C+ToKnKdH4IiuYIxz0FV96ZcR3klQ/idv/TDsr6pzQm6a5kSL
eaIqip3Q/iH0MEI2ojfZsssE8Jk2Xlrx58w49M+ycgaLn+XsXztIiCb9BOObH0v4
PShFE2CJ4mRbGrWyc6A9/Dk6BS9E8OXGRzy0rZMCNJbNj2wd8+ljg1g+IujCfUj6
Go3IOnBEz345c/Oim2LPGE5ImeEq5FACjYQRbOCD5kWqX36SAWTynim6h1XZYCQn
rsVCV2RPT6AiiH5IS9mji/gFuHsFf3jcgOurPeh4JTXnAoqDVnqZljSMGC1OzlX6
Zud19tsyvZZqLi4yMKCTqIdlEBn+s/VKW1IDxPy56zOP7HpaZ9GRGSG7W8rEpdd0
KpQCDDxX1rCAqCKytmkR5S8yHl8DImOf3lLHR4XqdEE+BLboXp2R8yoq/6iSvb+3
DE8+s/ZVIrpaZBkI62m0uJXE4RNP3vinXsUhDPzGexbGYVVikx0OJmDSyhhHx+Cm
17U2PZfgVP8LcTxkNFTOow1GTFVimbUKPgZsE51f0cOhypaaTtcpKvcLz9TbclIm
RdO6vASXt6CL/knJE2Ul
=apPw
-----END PGP SIGNATURE-----

--hFa2RCq1cvtjppuhpg0KOQVdFjwFLSeFI--
