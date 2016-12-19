Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20952E00D0C; Mon, 19 Dec 2016 07:21:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.194 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22F99E00CCA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Dec 2016 07:21:49 -0800 (PST)
Received: by mail-io0-f194.google.com with SMTP id b194so19330282ioa.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Dec 2016 07:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=LXUyWgdvuohw7lwYJq+Dy6T6+KLS61FC4Kki8YKOp+Y=;
	b=YbOXUULFbbc2VSvfN1bRAb0CoUG9Ky7JIJw5Zhr7jLShvbcoqNdkNxRx1HddyINCSd
	4+NO45neF1INNJUHx2ggedneQgsuVjBaP/usbZ+zeg7BsgS8UoqIwOwz1fH5/N6im457
	B0aKPslVX2DC/V3ISwezRAZkz10o3F+RV1hTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=LXUyWgdvuohw7lwYJq+Dy6T6+KLS61FC4Kki8YKOp+Y=;
	b=IjLCN8yjdQumLB+2TdPoM3XdFTI3X0VBrj6qtPq954C+4gFR1UWcpROvqSbka+8v6s
	N64pjTm9NtZuVKjZUnegNE5/l4RBzgczXTobwTTQHUopoRw9NzIGRt4ogaUJJ8svDUmC
	zQOnK031DqV881onPjRkjH4SMA7EkN0IjYoH2oFO7u81z3NgDosJCyajxAqCzgzej24I
	N9MBQ8W2yFqYtX5lX3b8IkdQssnKaO2Yaj31SFUvwE+eHeh7lCFLhmPGPsE6Afdqdt2y
	3sIWzFaO37g2ZcMyfn8vIk/EdKY16saukX+g0nh5V/jInqIoStXjhh/riMRsJ6g3DQ7Y
	vJgQ==
X-Gm-Message-State: AIkVDXJ/Z2y7hBxjnajB4SL0sLTiTIQRWVuY8Bp/lMbBpa2NUTvNApmSHtPgADIvwAY5Ig==
X-Received: by 10.107.35.73 with SMTP id j70mr15924755ioj.195.1482160909014;
	Mon, 19 Dec 2016 07:21:49 -0800 (PST)
Received: from doug-macbook.hsv.starlab.io
	(c-68-32-173-93.hsd1.al.comcast.net. [68.32.173.93])
	by smtp.googlemail.com with ESMTPSA id
	i196sm7054394itf.8.2016.12.19.07.21.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 07:21:48 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20161218164456.30100-1-cardoe@cardoe.com>
	<194b570c-c45c-1816-9041-96eb615fdebb@cardoe.com>
	<CADkTA4Oc3ZXiYKTUrKNRYqC+B6yO6pBU7ByVp0XAzRSyPPUM-A@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <c9d28e56-e079-7302-794a-3eea6da50c54@cardoe.com>
Date: Mon, 19 Dec 2016 09:21:43 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4Oc3ZXiYKTUrKNRYqC+B6yO6pBU7ByVp0XAzRSyPPUM-A@mail.gmail.com>
Cc: Derek Straka <derek@asterius.io>, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] xen: add extra generated file to package
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
X-List-Received-Date: Mon, 19 Dec 2016 15:21:52 -0000
X-Groupsio-MsgNum: 2159
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="aCE7TS5T4OeUai6SSALeXFd3vk7lCtbQH"

--aCE7TS5T4OeUai6SSALeXFd3vk7lCtbQH
Content-Type: multipart/mixed; boundary="AcPnbKjTn30pWdRPhmxWahWbpk3soRcos";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>, Derek Straka <derek@asterius.io>
Message-ID: <c9d28e56-e079-7302-794a-3eea6da50c54@cardoe.com>
Subject: Re: [meta-virtualization][PATCH 1/3] xen: add extra generated file to
 package
References: <20161218164456.30100-1-cardoe@cardoe.com>
 <194b570c-c45c-1816-9041-96eb615fdebb@cardoe.com>
 <CADkTA4Oc3ZXiYKTUrKNRYqC+B6yO6pBU7ByVp0XAzRSyPPUM-A@mail.gmail.com>
In-Reply-To: <CADkTA4Oc3ZXiYKTUrKNRYqC+B6yO6pBU7ByVp0XAzRSyPPUM-A@mail.gmail.com>

--AcPnbKjTn30pWdRPhmxWahWbpk3soRcos
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/18/16 9:44 PM, Bruce Ashfield wrote:
>=20
>=20
> On Sun, Dec 18, 2016 at 12:00 PM, Doug Goldstein <cardoe@cardoe.com
> <mailto:cardoe@cardoe.com>> wrote:
>=20
>     On 12/18/16 10:44 AM, Doug Goldstein wrote:
>=20
>     Bruce,
>=20
>     Please apply this series to morty and master please. This is to pre=
vent
>     morty from getting a bit stale.
>=20
>     Some background on the users of meta-virtualization for Xen that I =
know.
>     Derek and I both used Xen 4.7.0 for krogoth and going forward we're=

>     using Xen 4.8.0 (and probably 4.8.1 when it drops) for morty. The O=
penXT
>     folks are looking to use meta-virtualization with pyro and will lik=
ely
>     be aiming at Xen 4.9.0 which is the same that Derek and I will be a=
iming
>     for with pyro. So I'm looking to hopefully keep the versions in
>     meta-virtualization more up to date so that we get more users, even=
 if
>     that potentially means doing a version bump after a Yocto release d=
rops
>     (e.g. morty has dropped and we're bumping the version in this serie=
s).
>=20
>=20
>=20
> I'm ok with the strategy .. I don't feel the need to only to bug fixes
> in the released branches, if a specific version is what the user base
> needs, and the update looks sane, we'll go for it.
>=20
> Cheers,
>=20
> Bruce

Thanks Bruce. Well if its ok I'll submit some patches against krogoth as
well that I know people are using. I'm trying to encourage people to use
meta-virtualization when they use Xen on Yocto but I've held off on
sending patches in to remain more conservative.


--=20
Doug Goldstein


--AcPnbKjTn30pWdRPhmxWahWbpk3soRcos--

--aCE7TS5T4OeUai6SSALeXFd3vk7lCtbQH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYV/sLXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvU4NkP/A1i92cBX4HWZ1je3lewlqPP
f2CVkZ22YbkOwN40iNRZJAU/Yrhcic87eMdt/n4YC4RnffbrvbIenXilYpzQocQS
aLjQwwxMJKPiicyiBudNxIkrGVcsjzySM/mnjvP3LyyHBJg1WAK6uxNKKVi+Ic4x
uvPp/VUl1S33HPmY/U7kWf2E32QwvHW7eFJhy4LB0+R0P76eRSvzH5iqD1P0Zh/v
WtKs+fdU4NDT5o0WRGIEHvLIbjLHBFS4Qr0OKyQGoHjcTrHRGIyb4TPYS+JWiLWx
ec3ScDq/oj9NO9NJF9NJBxVFN2oBB2ANQ76iDPXgjWYIwWLXF3xboxAZ3tu+4H76
moVoV4BMLgvypqrVmoLW8niho4TEO7PCYs4qb6bCuKurnC/x5GskTJtK5tXgw4dn
+qcMTCvKp9QSxshzQvx0okxT063Pmu31CfRmQDExEbv5fqMMKJvK/5b0SiY3WTxl
A+9BbDyeZhk9BK51DZ82m/wVu9Oy9BnDMOZSn66omngG+/590N0VjWS6DZVSAyGe
QQOBo7qHe8fg1Ub6wMSvSXzIukf5Ha2KedPaK1/Np7HiQzfjqgylYCNcmkkIhP/h
NDpJUNBAJJQc6dWdgr93lXTUTooIdrepxggPwcxxFVvNiOxgae1TMGFm88Fbc92m
/wBG2rgDFPizJ0zlIo65
=6oTp
-----END PGP SIGNATURE-----

--aCE7TS5T4OeUai6SSALeXFd3vk7lCtbQH--
