Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 470FDE00E9A; Fri, 16 Dec 2016 09:27:20 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.68 listed in list.dnswl.org]
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D1B4E00E8E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Dec 2016 09:27:16 -0800 (PST)
Received: by mail-it0-f68.google.com with SMTP id 75so3334160ite.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Dec 2016 09:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=/Vrg4Qe/3HEuoZe0F6PQGOyPKqcU6750SfEm00S3t+Y=;
	b=dFEMwHLFWQ88PiGLwOO49PNtF2a5LujpGMXIbxYNi7rdrN9hbwJKI/5flDsJe4O1mz
	bUCVvmVbxg0Kf2GNbiKADe4etVN01k9u9isvU/43XshmV2wamwdkSCnPtS5BajhWfYGJ
	h4lkBqEC4Dc9kgNg3pPOIlwhquPaROZUDg5Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=/Vrg4Qe/3HEuoZe0F6PQGOyPKqcU6750SfEm00S3t+Y=;
	b=Wyla0CqaL8tRVs1n4jyh3BvUENRPEQYZ38LRnX/Yg0XiF7ynElgU6ZT21AOpis04ia
	a+3LanTy5wsSnSoYGoJ4SBRGP0f+CkexhJFbHfkS44uc9aUfXnrSz+zAyCQg+KlI6mSD
	dhq8NRzx/H/TGj0ffw5P2CwjAzGX3SG+9e03LDRMTC8iPw5ifA7AjVc19UsSQI8HaUFZ
	zJVz+38wuTrODzJdhyvDiPXxBUB6fU8DSE6vGiWLjzT0hFS6fzg28XksgsuVdsxLCB88
	jHUS5JEEpf+SbDyWFDv0G/ehUdp0PptZgviAM6I1JPNL03DU+19FhTvcOzd4qB+2C1Tg
	e4Aw==
X-Gm-Message-State: AKaTC03eZq/7nEh/fUB0EhxidSzqBf9fLrEZj5cgFybBNofdjtQx9bA7prs/SBYGhOCnbA==
X-Received: by 10.36.245.9 with SMTP id k9mr4721077ith.65.1481909235829;
	Fri, 16 Dec 2016 09:27:15 -0800 (PST)
Received: from doug-macbook.hsv.starlab.io
	(c-68-32-173-93.hsd1.al.comcast.net. [68.32.173.93])
	by smtp.googlemail.com with ESMTPSA id
	e68sm3010781ioj.39.2016.12.16.09.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 09:27:11 -0800 (PST)
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1453525067-2109-1-git-send-email-cardoe@cardoe.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <38074716-dc39-3395-baee-04d2a8cd1aa4@cardoe.com>
Date: Fri, 16 Dec 2016 11:27:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1453525067-2109-1-git-send-email-cardoe@cardoe.com>
Subject: Re: [PATCH] xen-image-minimal: if DISTRO_FEATURES is missing xen error
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
X-List-Received-Date: Fri, 16 Dec 2016 17:27:20 -0000
X-Groupsio-MsgNum: 2149
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="XFhRQAX4Elvjt8MgKfOQwtSs89PR71m6l"

--XFhRQAX4Elvjt8MgKfOQwtSs89PR71m6l
Content-Type: multipart/mixed; boundary="8TVuvVm2HiWNL1mBj2LdBtu79vNkN8GxI";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <38074716-dc39-3395-baee-04d2a8cd1aa4@cardoe.com>
Subject: Re: [meta-virtualization][PATCH] xen-image-minimal: if
 DISTRO_FEATURES is missing xen error
References: <1453525067-2109-1-git-send-email-cardoe@cardoe.com>
In-Reply-To: <1453525067-2109-1-git-send-email-cardoe@cardoe.com>

--8TVuvVm2HiWNL1mBj2LdBtu79vNkN8GxI
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/22/16 10:57 PM, Doug Goldstein wrote:
> It can be confusing to users why things are failing with missing kernel=

> dependencies when you don't have 'xen' in your DISTRO_FEATURES. This
> should provide them with some better info.
>=20
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>=20
> The result of this change is the following output:
>=20
> | DEBUG: Executing shell function do_check_xen_state
> | ERROR: DISTRO_FEATURES does not contain 'xen'
> | WARNING: exit code 1 from a shell command.
>=20
> ---
>  recipes-extended/images/xen-image-minimal.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-ext=
ended/images/xen-image-minimal.bb
> index 26b6d06..b8c2002 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -20,6 +20,14 @@ LICENSE =3D "MIT"
> =20
>  inherit core-image
> =20
> +do_check_xen_state() {
> +    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'xen', ' yes', 'no',=
 d)}" =3D "no" ]; then
> +        die "DISTRO_FEATURES does not contain 'xen'"
> +    fi
> +}
> +
> +addtask check_xen_state before do_rootfs
> +
>  syslinux_iso_populate_append() {
>  	install -m 0444 ${STAGING_DATADIR}/syslinux/libcom32.c32 ${ISODIR}${I=
SOLINUXDIR}
>  	install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${ISODIR}${ISOL=
INUXDIR}
>=20

Ping? This would have solved Andrew Stuart's thread from 11/11/16.

--=20
Doug Goldstein


--8TVuvVm2HiWNL1mBj2LdBtu79vNkN8GxI--

--XFhRQAX4Elvjt8MgKfOQwtSs89PR71m6l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYVCPtXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvU8SIQAIATSGwPNxJsG1gHuzj/dJMl
f0SdeRMEGYy/WE25EDxPq14rIQYhrkRX3gRAhbpzX/EIGIXJpbHTvXKbDcboU1U8
4xdZrixYGLx1ckx3a+5bltLtOxC4JyRkMBcgMOx9IY9AnS4aACQgWFkCnWAcBZhh
nU1aBHw0bDBaSWMQajyeLEVO/seCQY+ZcNwq+ENY57Nqk+Qk+SWYl89x9HATdjPr
quoi58CkaX2ktR07ESOH0rfS8rG+IMnxrDNYl0XIl/SAvOwTuSltiHpFYBrRqnRH
uECPueP1TE3nhTfGf9AmVKTRYplW3M1UcYDMl5DCc0d6aTsJEOsJTkmjIb+HEXb6
4LTEBC1+fjN4rbZKdzBCgzG53A1EOS3TWGHA/jOiUL+QYHkCzo7jModC+uF+BmOr
PVx8IyNZsxMYVDGk8roHmvlz0p0vAj+xkPNFXbieICe80nsFhpZc4nRf11wz532A
p9NIMZ662roAZUjhoW6lbvPQxKsMZBJo9Gykdr97nTljtmqOA3o/nPBt4y6guJ7U
/9rlulYnOYaBOwIz3ge8iijY54jw7eF9iCdJ0+iP95S4vZWsSksZ7NtS/mxJF/NZ
4tJ8YGl9ia8qfDJ40XjaZSs9ZrDRgNC2YxVFnYqamo0pwp9yQEyP2DjsfQXC/hKo
VkEDX6UN1imvXn4MSxfA
=q4CB
-----END PGP SIGNATURE-----

--XFhRQAX4Elvjt8MgKfOQwtSs89PR71m6l--
