Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97B29E00474; Tue,  1 Sep 2015 10:50:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65E24E00349
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Sep 2015 10:49:54 -0700 (PDT)
Received: by qkcj187 with SMTP id j187so52409504qkc.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 Sep 2015 10:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=ORAHGubbgnPPMEDferSnx8Zxg20LvAyb+rQqRY0bnQ8=;
	b=ioUV4V3hJtF2/UyMzGMVALqfjVE/LyUQIwDMUJokhc3HpMmwUESkVjXXj4MN+QI4mS
	JNXPCSWI2F/LaeaF13T2rK+3RmwM/sAUoZ/XRAE4NhG/4GWTFIsDGuBCZ45kYhiPjNzj
	WfyT33zgWHC1LTUjZfg17C8cj20dYr2UQP58ktZafP1TBm1W4eJnqycMXzuzUFzk/4rE
	10AdCSGqeQ85Cm7sHigZiIgiuibYwdfNs8srJv5vepAJ4/Nz+UZPR32RSbvZa4PdxXF4
	nYarBRmpcsXNm1MR5AFy0U7Dwzg5Ow1KDGCeSqeQPQLW3VIelGaZ7V7iJ2+UJ8T8myse
	apAA==
X-Gm-Message-State: ALoCoQmfERBh8vqwexGB0XPUJZuQ5AAVzLr6TF10NT/DMddLLUrgrQqCp0jRmJsC9OEzGTGR9OHk
X-Received: by 10.13.213.138 with SMTP id x132mr29779756ywd.79.1441129794088; 
	Tue, 01 Sep 2015 10:49:54 -0700 (PDT)
Received: from doug-macbook.lan ([67.63.141.2])
	by smtp.googlemail.com with ESMTPSA id
	m198sm1163694ywd.52.2015.09.01.10.49.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 10:49:53 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
	<1440448008-9189-2-git-send-email-cardoe@cardoe.com>
	<CADkTA4Mjg_+g+4oak_nApGcCKe_Or-NrrPu0ofWpQ_-3KP6ynw@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <55E5E540.2030205@cardoe.com>
Date: Tue, 1 Sep 2015 12:49:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Mjg_+g+4oak_nApGcCKe_Or-NrrPu0ofWpQ_-3KP6ynw@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/4] xen: drop incorrectly broken out package
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
X-List-Received-Date: Tue, 01 Sep 2015 17:50:00 -0000
X-Groupsio-MsgNum: 1292
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="a4BWDaDRPQn7g0BObI2rFSjTNFcijn0cs"

--a4BWDaDRPQn7g0BObI2rFSjTNFcijn0cs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/31/15 8:08 AM, Bruce Ashfield wrote:
> I've merged patches 2/3/4 of the series, and dropped patch #1 as discus=
sed
> on the list.
>=20
> Cheers,
>=20
> Bruce

Thank you. I'll re-submit soon along with more updates to let xen_git.bb
build Xen 4.6.0_rc2 (current master as of this email).


--=20
Doug Goldstein


--a4BWDaDRPQn7g0BObI2rFSjTNFcijn0cs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJV5eVAXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUyzkP/RKirEF7LLpjvYC052uB3LKW
jEYaPi4+6n1BhIwnxLcjWj3na11ry/hI7OJFAs4rNaiIga7aaOiEHY/egpbzbmfP
MJ4z3AMkKj/o+donSWD7AUwXNIb2cisO+imhEXjcsC/boHDopWqEZoD0YymYS1uV
4xZS1yG/qkh1O31pio3GEL4RCZIShzbsKgVLrZ4PtxtT8i2BG6LylIODqm8RGe92
mErFJ9x+NnQ/fWZ8M0HEds0DcwO6W7zyaEzrN880BS6HXurfsgl6TKsgiYSzZawh
Jy/z4KUauB9weBsFxZ0ioVC/hYMmP6HZntan7oGmvlUOKf/LnByU6142frvZmbkf
Apd510aS0yVFk28jvTb9XyY7V4CuRDxNWg8Bd6uDDnk6oGu3XE6eGsfA+TiYxiGQ
YFEKkC0GlL3lcuHFcmKX0V/wiMCgDS5DXjmq+ZYpEi5ZmSruaXjMVtBa0DbPJNCm
ttj0z4CeeaF5Ay+risd+rHUWtpED4q6YsVyjFVD/Bvqwhsa2yJkJwNMjXfEENqDC
SuBikygnqaJZKBQZY9YPrd7/R4lNsqc2swlmcCqreqRzS2GXJXotmbxBUZ4j7RO4
rqnsir6En0fyuOFXSF6ve53+epcq8385hW5UaeBa15OCEl7wq4cQ3KKJMA1FxhfM
WOrN2LTBRPJ9XeATDByR
=ul3w
-----END PGP SIGNATURE-----

--a4BWDaDRPQn7g0BObI2rFSjTNFcijn0cs--
