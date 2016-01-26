Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 339DAE00B9D; Tue, 26 Jan 2016 07:58:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f194.google.com (mail-yk0-f194.google.com
	[209.85.160.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5D83E00B8B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 07:58:18 -0800 (PST)
Received: by mail-yk0-f194.google.com with SMTP id v14so14978607ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 26 Jan 2016 07:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=2gl4/fyrkLyC44Dum0n8FOEMdx6tnBEr+8024x3U/mk=;
	b=C0e02vG+LAfU6Dv8jjUUDF0INShF9fooPmpwlMaKTdOquQYfFJcZWhZxC6uKyZsB50
	+01Qu2yvDvGl5VcxE1Ll5TPaFoBZCVr2/Cz/8xQ+swJxFG/IvlGgttdJmc3psPl05o5N
	4YPAd93E88Czeyy2AGKKXwlene8ZzHftjiKOjWCJVsClEkJtVKHPymfQ3laY6eDccGcw
	EpL/iq38kesnKmhgSA2n6bfpCoKZKpsRKy2jOIsYivpLD9CvXOhRe+FeRjQTtu3kCtGp
	crF0NLspYX6XkFqDXfRDu9OxYrS2JdothTKA+hdUSaqxIOZP8YmCaHwmN+dMDamYs0eV
	OPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=2gl4/fyrkLyC44Dum0n8FOEMdx6tnBEr+8024x3U/mk=;
	b=UoZu0tbu0dCahrkNYthI2FwC5TzmTpkvmSJQ4bmVBPVpFrVVwC9EFHux1ESYp8MVKO
	mo1uqX3w9Pt/yXPJcKzITiHxgJtG6Kd1I/IOkZTGIg0KVJgnCaViFifkruaTzjnaqaP/
	GopljPXRk7Bn3H8DG/8I67mOkqgbQ6IcR+0y16fxpFSts2NVnrCRN+Yt+5GuNDP5L/5z
	7RnMzAOdmrlul7bYa9YAtHwvn9GwZqNQvsMPshedmLvvCBA+v/lPUYNCny6/L30F/4iU
	+48aiOfqejl0TelIMwIMn2B912cr8rdctsg83Ea5euPa4gyoO22wLRuMSO2RSQiHA/5b
	nbPA==
X-Gm-Message-State: AG10YOQWY//dlaI5ui3uPoZxHRC9a9mffydNhJEs3fWQxhGLawGUxYc7RVb1VGrFH5w8fA==
X-Received: by 10.37.39.69 with SMTP id n66mr12887529ybn.6.1453823897927;
	Tue, 26 Jan 2016 07:58:17 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	v130sm1294481ywe.24.2016.01.26.07.58.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jan 2016 07:58:16 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
	<CABZSBQetDdKXWDjGjdiKcKXYtKWPOcAWCehCDKzE4-gRFC=8MQ@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56A79794.5010402@cardoe.com>
Date: Tue, 26 Jan 2016 09:58:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CABZSBQetDdKXWDjGjdiKcKXYtKWPOcAWCehCDKzE4-gRFC=8MQ@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/5] xen: update git version to 4.6.x
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
X-List-Received-Date: Tue, 26 Jan 2016 15:58:21 -0000
X-Groupsio-MsgNum: 1715
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="XXIqwlpC7DgVMbPDX6SHqwSSaTiRSvdOf"

--XXIqwlpC7DgVMbPDX6SHqwSSaTiRSvdOf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1/25/16 4:20 PM, Chris Patterson wrote:
> I gave series a spin.  Xen 4.6 built and ran nicely.  On the git
> version, I received: "Fetcher failure: Unable to find revision
> 1fd615aa0108490ffc558d27627f509183cbfdaf in branch master even from
> upstream"
>=20
> Had to set branch=3Dstaging-4.6 to get it to fetch OK.  With the rest o=
f
> this patch series applied, I also needed to move more of the common
> bits into xen.inc to get it to build for x86_64.  Any thoughts on
> moving the EXTRA_OEMAKE,
> xen-x86-Fix-up-rules-when-forcing-mno-sse.patch, and
> do_install_append() to the .inc as well?
>=20
> Cheers for the cleanup :)
>=20

Yes. I actually have more patches and didn't include them for some
reason. I'll repost.

--=20
Doug Goldstein


--XXIqwlpC7DgVMbPDX6SHqwSSaTiRSvdOf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWp5eXXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUV6YP/2Nn1uZz1UnpbdJNSBFfeeiL
/Umy8uhSLTjlllHZXoEPcLvkky7yx+cWaGAWKXDRI52k7bNCDZfN47OtpDqsarye
FFcgAyCsd+hTatHpL147kI5LclzXoawnfUu7ApXtTXcN+y6Go4PPcO8rUXm2w9Tl
vZ9YNLpsb/sXr40A2OlGjvoE6fnn7OqOHFK+chmnCjDlTNftWNrgqzcF7/VkviLD
UH+qQOilSzVwXqXEr/U5bsOPu+/uZrGn0d2stkBAfxPmaIF0lOsGxpilUQARE81r
SmQzf2kcqe75ajCT2jNDd6cQPkamdC6o8/C/uAdwxfxILdXAhbDRRQHk3feb3EUm
9YbYDtWIUFDZv6yL1jJ+xlRDCFj+UG3OlWSN6pkJA9hFLWpjrgit5Sh3YD4rUQFu
kdw1y+x9lFJAFRY4Hr8vlNRF6QQT6f+MX1jPJKG8WE00+7V8X7qO2VT15xC7rKp9
mTcOQjoY0Da7+OI2cEunPpd+IxRmwaAK0ctJ64zx9ydQflFaP5piylwdfuoi9GWv
JrcKxPi+lwSovvgKyaKcX5FTPRrjuFSGTeDeltMDyvorjg9DPlq66MIoFAuNe61N
tcV6qMcrFrmEJ03XWOxEEr1Mof1dkwJuYRffdwcdZ7BXrZvOGhaH83+1Sb2I3AAs
dXRXWKPxlJZJKP3Mguag
=rJmb
-----END PGP SIGNATURE-----

--XXIqwlpC7DgVMbPDX6SHqwSSaTiRSvdOf--
