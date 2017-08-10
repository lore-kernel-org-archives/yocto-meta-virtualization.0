Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 038CCE00C09; Thu, 10 Aug 2017 11:36:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AADDAE00B8B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Aug 2017 11:36:29 -0700 (PDT)
Received: by mail-qk0-f193.google.com with SMTP id d145so1500960qkc.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Aug 2017 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=NNU9T/Wky1aURAozq1JiAImK239EosTEunZQ/2T80ek=;
	b=Edl9J8uDtexLz9ZFOoJw2pfpxVv20cmkQlYNW5/ndAII72b97slSynCYePtsT27GEP
	dGJFWbD9oKB/Bp3jYBnPiPWyVxBlwUOI92ckkxXV3U4w4ata7CF2HH0K3yHsufojta5C
	xd76IMiPOl9wSNJJGpd9qFpenp4dntLuYZBpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=NNU9T/Wky1aURAozq1JiAImK239EosTEunZQ/2T80ek=;
	b=IVR7R4R+dmg65lPU4qx5GxdkA4vtelDHlSU5d5EzyC5ORmJ1t1OFYg25LrqeLTdyWr
	XTiqY0xpFS1f3NyBI14X+b8Wo+wZAoIRevzhF70ryQPk1qocHKKadeH/b91+x40CHJhm
	m7m5rdDPvR6mtHVg/1XQRRork4N372Ci+4ADPG16KMznSpa+AwvVZym/tvTnzvOum7ht
	HYZAOCRdyyxcCK0LSDFLb3P+Uk5oFlPBbfM4QBGL3zM0RLrQTmoG39twZ7mZexaasWEF
	6118No/L5nuMcrqVf1w1o/gre52Jj0pxk9ErkriP2qJ9tms7iAM1dJXUaLTtivsuCnlr
	pFgA==
X-Gm-Message-State: AHYfb5i1LTRTrv8mn/Kc9IbVC4J3q/uwonVp+htuE5Cfm1rn4L8pvxj2
	nXoAXVL1rGC+VifRhFw71Q==
X-Received: by 10.55.114.194 with SMTP id n185mr17787752qkc.71.1502390188829; 
	Thu, 10 Aug 2017 11:36:28 -0700 (PDT)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	f32sm4444557qkf.4.2017.08.10.11.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 11:36:27 -0700 (PDT)
Sender: Doug Goldstein <cardoe@cardoe.com>
To: Christopher Clark <christopher.w.clark@gmail.com>,
	meta-virtualization@yoctoproject.org
References: <CACMJ4GaS4wgNiCdvPMWfSqCJoj5hWj1nm441WmfMDp7huFhtLQ@mail.gmail.com>
From: Doug Goldstein <cardoe@gentoo.org>
Message-ID: <9177e93c-9040-5675-f5a8-212ead02198f@gentoo.org>
Date: Thu, 10 Aug 2017 13:36:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4GaS4wgNiCdvPMWfSqCJoj5hWj1nm441WmfMDp7huFhtLQ@mail.gmail.com>
Subject: Re: [PATCH] xen: remove STAGING_DIR_HOST from runtime path for bios.bin
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
X-List-Received-Date: Thu, 10 Aug 2017 18:36:30 -0000
X-Groupsio-MsgNum: 2696
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="urWdDtlTdoHlj3Lqw3TdkTete4iiaUEKc"

--urWdDtlTdoHlj3Lqw3TdkTete4iiaUEKc
Content-Type: multipart/mixed; boundary="eVKkUQQFrxEEPRm2MDkB1bie58sW3TkK0";
 protected-headers="v1"
From: Doug Goldstein <cardoe@gentoo.org>
To: Christopher Clark <christopher.w.clark@gmail.com>,
 meta-virtualization@yoctoproject.org
Message-ID: <9177e93c-9040-5675-f5a8-212ead02198f@gentoo.org>
Subject: Re: [PATCH] xen: remove STAGING_DIR_HOST from runtime path for
 bios.bin
References: <CACMJ4GaS4wgNiCdvPMWfSqCJoj5hWj1nm441WmfMDp7huFhtLQ@mail.gmail.com>
In-Reply-To: <CACMJ4GaS4wgNiCdvPMWfSqCJoj5hWj1nm441WmfMDp7huFhtLQ@mail.gmail.com>

--eVKkUQQFrxEEPRm2MDkB1bie58sW3TkK0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/9/17 8:06 PM, Christopher Clark wrote:
> Bug fix: this configuration option sets a run-time search path rather
> than the location of a build-time dependency.
>=20
> Tested with Xen 4.9 on OpenXT.
>=20
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index 677ab69..274d0df 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -22,7 +22,7 @@ FLASK_POLICY_FILE ?=3D "xenpolicy-${PV}"
>  PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] =3D
> "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>  PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd=
,"
> -PACKAGECONFIG[hvm] =3D
> "--with-system-seabios=3D"${STAGING_DIR_HOST}/usr/share/firmware/bios.b=
in",--disable-seabios,seabios
> ipxe vgabios,"
> +PACKAGECONFIG[hvm] =3D
> "--with-system-seabios=3D"/usr/share/firmware/bios.bin",--disable-seabi=
os,seabios
> ipxe vgabios,"
>=20
>  DEPENDS =3D " \
>      bison-native \
>=20

ACK

--=20
Doug Goldstein


--eVKkUQQFrxEEPRm2MDkB1bie58sW3TkK0--

--urWdDtlTdoHlj3Lqw3TdkTete4iiaUEKc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQF8BAEBCgBmBQJZjKepXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQ1M0I3MDI5Qzk4NzZGNjVFNkVBQjgwM0M2
QzRFNjIwNDMxQzk5ODBEAAoJEGxOYgQxyZgNCIcIAKNGmgf4frm/cdny0IQhg3nf
Wx9DfOHbp8mZP81ARHTUb2XwhPkZhR8xjjY+ZvjxsJMr8E/EQzN2dVVgtPk7PtxB
ttGFART4vEbSHJOXGZOmPjWfti/uu5bjag0Y+ppSi3JTuy1/A9u+RB/2VV1sbJyY
/oMfVEHFNJtsxhv9acj43gkXfr0J1gYC+D+Uhu6iCc8Wkfvrg+UsZ0cTXCHjTcdf
79tJvVsJoMyYF0DIhaTWC0g8Xnd+eeMp2j3wLCRZIyiN2nt1LDARV41vucSIQgjA
gDXlzibFyvZmSZMZVjbtw6Sby2eugChR2f6CjAbCNkusGON6zwS7SCyFz85rvLk=
=o0dv
-----END PGP SIGNATURE-----

--urWdDtlTdoHlj3Lqw3TdkTete4iiaUEKc--
