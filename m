Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1935EE00B05; Tue, 15 Dec 2015 10:29:47 -0800 (PST)
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
	*      [209.85.220.180 listed in list.dnswl.org]
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7215E00AF2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Dec 2015 10:29:41 -0800 (PST)
Received: by mail-qk0-f180.google.com with SMTP id t125so26911471qkh.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Dec 2015 10:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=DYPCWULjSfDT9rCaaLxWmvyFVeEPeagCsou6/Z+yDJw=;
	b=mCwZWBzn5IUOtGeETWEvFCZ989EO9tRI4n3AtrZrlhoPoBKeac/t3/5+ikscoyXc0L
	17xMfLCmIc46q02sCYiNb703mMxgbSbLzYVgLYQTkpjAwFnQsTPGXqJXVuILODB25C5M
	qiWWcZajmkyAm3F2Kf7D2V1uaHJ7rY7qkST6em546VB786Io+MebGmhUKqozgQaLDlQl
	dtyHVw/61pE7XFX/z5D2nX1J/uhgHm+iaopNRFk5P/2esjx/rT99HUWV2WnvvaOcGkUy
	6G73IbgxJUnxcBDt5oRROQqocF9Tnh7XvEK9BDVR9C64SFDkLngMW2ChQYj6nd3hNtCo
	3kJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=DYPCWULjSfDT9rCaaLxWmvyFVeEPeagCsou6/Z+yDJw=;
	b=kZPD0Y3OAUXz+bXjdViyR9Snrk9DZk9acAIL4KgaLh+Q4bfotLlAKaXMc5IOyU/Wnu
	XE3NGGOC6qtSb4N1sbs1SQYDjHOntd5k2Y90vf7YqHM9vF4pzBmrSjhSeeBeF4R/Op2y
	aqV3oo9L1WxmG2PmKvDwWRmknJnY6fpMRN11ZhDfMHndTZzzohrjWM10oACapY+82yyI
	mUEShStRuHauQXP4sPd9NgVMRplLVH0Vny2RvHcfB+VwR16JkqG4KZrL8Pv60Wfc5VI4
	XWH2GeW3Y91MqJAO4dMsJ5LMrx+Ejx836OTMqspMkNJFD0fa1q4SGzrsqjeEIoHw2+x2
	lEeQ==
X-Gm-Message-State: ALoCoQnad4HODk6G4CfGNcdttK4Gw9A3gbaT6NPHJwmBkkcM6iVhV6Pao+YALBt5ctEP8tUYYYQGNKFOkQ3Jt+iejIaP9aw8Mw==
X-Received: by 10.129.158.135 with SMTP id v129mr16131282ywg.49.1450204179765; 
	Tue, 15 Dec 2015 10:29:39 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	q129sm1663112ywc.2.2015.12.15.10.29.38
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Dec 2015 10:29:39 -0800 (PST)
To: meta-virtualization@yoctoproject.org
References: <5670419A.70304@tycho.nsa.gov>
From: Doug Goldstein <cardoe@cardoe.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56705C0A.20903@cardoe.com>
Date: Tue, 15 Dec 2015 12:29:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <5670419A.70304@tycho.nsa.gov>
Subject: Re: Building xen-image-minimal with master
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
X-List-Received-Date: Tue, 15 Dec 2015 18:29:47 -0000
X-Groupsio-MsgNum: 1590
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="n0gJhuxE83jRvBnDSVFD2XFkXMHRbKVJD"

--n0gJhuxE83jRvBnDSVFD2XFkXMHRbKVJD
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/15/15 10:36 AM, M. Gregory wrote:
> I am new to Yocto/Openembedded. I have successful built the
> xen-minimal-image and several variations using the fido branches of
> meta-virtualization and the required meta-layers. I have several patche=
s
> I would like to submit to enable XSM to function correctly, so I moved
> to the master branches of  meta-virtualization and the required
> meta-layers. It seems that GCC 5.2 the default compiler for Yocto 2.0,
> is incompatible with the current versions of Seabios and Xen.
> Additionally, when I attempt to set my GCCVERSION =3D "4.9%", glibc see=
ms
> to still want to use GCC 5.2 and compilation errors occur.
>=20
> I am using a clean Yocto install with upstream meta-openembedded and
> meta-virtualization. I have altered my local.conf to include
> DISTRO_FEATURES_append =3D " xen" and MACHINE=3D"genericx86-64". Is
> configuration incorrect?
>=20
> If my configuration is correct is the correct course of action to patch=

> the offending files or move to a more recent version of Xen and Seabio?=

> Both have been patched to fix the incompatibilities with GCC 5.2?
>=20
> Thanks for your time,
> Machon
>=20

Machon,

I'm actually in the process of submitting patches to bring in the newer
version of Xen. When you update SeaBIOS I would double check that
CONFIG_XEN is on because I believe its not by default anymore. The
DISTRO_FEATURES_append is correct and the MACHINE should be fine. I'm
using meta-intel and actually using intel-corei7-64 for MACHINE.

If you would please CC me whatever patches you send I would appreciate th=
at.

--=20
Doug Goldstein


--n0gJhuxE83jRvBnDSVFD2XFkXMHRbKVJD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWcFwQXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUUxEP/3ovQ6BnkJw5tH80+FbcaOYz
G7XFZuVkuAcaB/EjWoMBkNCwd4HSCZ5zb2xaHfmUP1sR7kxFCTzt9FfbQZQ50quK
enpfabL2k8HKTLILk5lamxXHF/TwUVfAx5lfrY9sKQMucyONyWnm8hUwn/netpJU
pV+T75xkUaaaJoQUcGehCOT01cRpFlnSvzmKcxwJl+cH5cOjouNbAXhbG7qN68bO
nXFkL6Rvp8+y/VFj8idYXKiiP+qyOwKFH5KaDjnCARZRBOhvIq8yTaEodQw943Dd
qPOoKlDC8umPuyh3uhaeidI+za2oK2jE9OdyIw3sekBw/zbsOEC0L8U1n/V5kxKz
FMzHaBUrKi4RlEFz8GnR1/5KiXVkNWULiCNM3mmZ9xnFgfg5GdICgK4O+KidPw7u
OkUFPhkurSh4Wa+IXX7xIVvB07/HPhmaaW9rzHbyhGa6EAgVIZR5CTyXc0onhALd
jKNVTh6tl6Kbzp9PzMFwGzXFJIS1xk7XsR2CYwqXTjkO/BXlW7y5SVpWfM/VNuzz
7LtV12Fri40jgpbTxcoKmqAIskvCrLj53Rq/R8fE3zkU8sNR7BH+yqrIy4xdeuHg
Nu5VyqW9z0pw8Xtu46WU4ZoPYjIPCaQ9jmwquTtZcrNM2vYMlvNOWGs4KZ+G1Z+R
9G0B4N428ypyJHcF+p7g
=iei4
-----END PGP SIGNATURE-----

--n0gJhuxE83jRvBnDSVFD2XFkXMHRbKVJD--
