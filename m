Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 812C0E00929; Mon,  1 Feb 2016 08:00:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.171 listed in list.dnswl.org]
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02CAAE00911
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Feb 2016 08:00:34 -0800 (PST)
Received: by mail-yk0-f171.google.com with SMTP id r207so108329517ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 01 Feb 2016 08:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=OyB8oxZVBWsVfuN49pTLWP5TleTD0X9igiE4TVKKHuI=;
	b=liUhlalFQ+VGvxvyWHSueGVShZT3fUtrgbpSRlmTxizXSRjOw1USc4okpFYL3xRhvb
	WuTUr0z8Wn83StNTRJXUDevLYarit975zond7LDYLBqlr1Ibp84l+9Ql/6svkYgx7NKG
	BWLSBG4h/o2zSoMrVDYteyjXnyPQnvGjD4oyP19MO2UCwi43cbHakg5U1foYhnrM3mYd
	Y+f4ZsclgwMBz87HiBh3rg9UIb5CMq2Htow78hAR1u83RBQY6GT7Vra5TlMRPdekrE7z
	LqAwLsUiZ7xOZS9nyCuV6aZGudXPTBrb/nw455hXYlkgWuakE1w6oLdm3fNuuzKE8OCR
	wg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=OyB8oxZVBWsVfuN49pTLWP5TleTD0X9igiE4TVKKHuI=;
	b=csgR+PKIsBHx2MoPwGW0K6l22YMc/Dc3osX74NEPLbKyDVnSCCnJGdKe6MfkeAy3MC
	U7DP7pKcBWFx0dytrXiOtHq7eVH68u8boxPMl7PUkfhdgEHgwJE2Yl6iJbpKAlxN9Tdg
	Y8J//GCxS0nRNGh3v8hF0oXXbQ+9NRaUPIJlgSVvELTqQA+scTxdksbFW9FVuQVNnGKT
	7DkT0qMLD3a2uvPbyTwut3mxj9qSDgR0dNG/U+Gv+RMfRmsL+Aw/zvjBWADLVHuq5KzW
	r1fPHfyq5q6Zg06tMaXcqUgG8w/X3p0euxNFusaIEaMgvxw/3pAUbPtulxneuYrx3H4p
	gCAQ==
X-Gm-Message-State: AG10YORzAQrET0F+bSc9q1WmWrkh7CFTD8l/6uWP2NbjVaB/SbgTFk7H63+GIMa8aNykPA==
X-Received: by 10.37.8.5 with SMTP id 5mr12670823ybi.179.1454342434108;
	Mon, 01 Feb 2016 08:00:34 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	e6sm23112720ywd.23.2016.02.01.08.00.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Feb 2016 08:00:32 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <56AA7638.2070204@cardoe.com>
	<CADkTA4N-7sJos=VrMmXP_qKAtvUDXA6fbvhq7_YyrX_c=fXQgw@mail.gmail.com>
	<56AAD00D.2010708@cardoe.com>
	<CADkTA4OXKN7hsWxRVHVDWvtxiFDC5vrcksHRJqi7c1y=psw90A@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56AF811C.6090001@cardoe.com>
Date: Mon, 1 Feb 2016 10:00:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4OXKN7hsWxRVHVDWvtxiFDC5vrcksHRJqi7c1y=psw90A@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: jethro branch?
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
X-List-Received-Date: Mon, 01 Feb 2016 16:00:37 -0000
X-Groupsio-MsgNum: 1734
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="wQWj1FxgMAEIsN8aLLiVhNE0sqAIc4xbV"

--wQWj1FxgMAEIsN8aLLiVhNE0sqAIc4xbV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1/31/16 11:28 PM, Bruce Ashfield wrote:
>=20
>=20
> On Thu, Jan 28, 2016 at 9:35 PM, Doug Goldstein <cardoe@cardoe.com
> <mailto:cardoe@cardoe.com>> wrote:
>=20
>     On 1/28/16 6:25 PM, Bruce Ashfield wrote:
>     >
>     >
>     > On Thu, Jan 28, 2016 at 3:12 PM, Doug Goldstein <cardoe@cardoe.co=
m <mailto:cardoe@cardoe.com>
>     > <mailto:cardoe@cardoe.com <mailto:cardoe@cardoe.com>>> wrote:
>     >
>     >     Hi all,
>     >
>     >     With the addition of the linux-yocto_4.4.bbappend, master no =
longer
>     >     works with jethro. Could we land the Xen patches I proposed a=
nd then
>     >     create a jethro branch and drop linux-yocto_4.4.bbappend from=
 that
>     >     branch?
>     >
>     >
>     > I actually have a jethro branch prep'd already. Once I've merged =
the pending
>     > changes to master, I'll cherry pick them to the jethro and push b=
oth
>     > branches.
>     >
>     > Bruce
>=20
>     Thanks Bruce.
>=20
>=20
> I just pushed a preliminary jethro branch.=20
>=20
> oe-core/yocto branched jethro Nov 3rd 2015, and I did the same at the
> time. Looking
> at the newer changes in meta-virt, I updated my jethro branch up to the=

> point where
> I cloned the 4.1 xen config to 4.4 .. since that creates a dangling
> bbappend in the
> context of jethro.
>=20
> At this point, I'd like enlist the help of those that are building xen
> regularly, to=20
> point out the additional commits that should be merged.
>=20
> Either a branch for a pull request, or just a list of hashes in master
> will work.
>=20
> Bruce

Thanks Bruce. The changes that I'm building for jethro are the following:=


45de52d11c68cf023566c0d6d4fd341adfb04c7b
ec4b409bd6567e430511e767ac043066ddfc850c
12a7d544f40fb911b706c681b611a7cbdd303c39
a19e5567dc9f34d0c52fdb40544f82bba41bf0d0
5817c4a29b361812b87eddb2bbb623344dccbdc2
663463da0c29e1f22b0740335d193f637174c104
3915d59fdf7af575b7e26a82efb0f998864d8692
f5649753869888606de09701ea9f9a56424cd3d8

You can also pull it from here:

https://github.com/cardoe/meta-virtualization/tree/jethro-updates

--=20
Doug Goldstein


--wQWj1FxgMAEIsN8aLLiVhNE0sqAIc4xbV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWr4EfXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUjocP/Ag5XOutoGkQM+cxO+2izJqf
UPy2IBTyUpUYL1PI97O74+fVzw9hBeNPCUCOENFggpGeLKYN9dLqO3DNaoyKP4k/
Z3aMV7HgC+naTdpf8WAchjTGwnnxt5c8IOodGuQPRSvC6k+h8a2Ze+N5xs7msFAY
4K6Tu4FLmX730YQ9J705KppDQD0Yv9ipIv9CqdvN2lpux152xbrEYWt14ys7V/Sx
htjBygWwCYJE28hPgBGNppn79kuUoZ29XlF8ns1JDnZykI2N4NmVYQrR1kP4vMuE
GKxcyNJEEnWawx5r65YHEMKKye8jePxjv83Z71QAwJdfzprbSBB4HpWmIlPrdL0k
OYCxDgQ1TueiR995XE47P5GBkXZo7mACUpWQM9PrA7KS3ResxXeCYkZkbo9zShq5
JYdYZ8oj6AVWuHhsCD2gVwZmLDlI/1yJpc+P/6F3qjXtKBzLTC0USYS7ymItxGDS
ISS5+HcmZ9lUwMM4SnKlLmx7SwNU+VmLu6VUE1ozhRLAamUNn6sG+5WtJ6rDqA1R
HYT3hiTOATY5Svv6B2/G4Gy+2GeGf+XSClyrfztcm/eRDBFyWe/cPjYGWgEcGRjl
BicVZqPrMie40glT/aM/bLWRYoGcIDyPCe7mwSBGab0dSU0XWNsNhrycGigg6yFR
CrZha+L9hhoAW+BkM4X7
=E9hp
-----END PGP SIGNATURE-----

--wQWj1FxgMAEIsN8aLLiVhNE0sqAIc4xbV--
