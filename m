Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB494E00C77; Mon, 21 Dec 2015 21:45:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E917E0083E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 21:45:54 -0800 (PST)
Received: by mail-yk0-f176.google.com with SMTP id 140so153644491ykp.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 21:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=9cxU6BwoTDGtKxjD/XUJHgvKue+TV+zIPdY/9Ckl9L0=;
	b=XRaYFv+dSF12soxaWoBmO2/S8s+jiGEQj6nUxeKw6yFk6nIQTOD7y2uDweJ17ilJdA
	muVGaAwc789wVh88t/lQ1YbOoEgOGuzVAN5K+sHZpczBZhPtuk56+JK1PMFPlrGJggbs
	dhmwinyJXqrx4TBVVtOpULiACAbZZWLsH8MLzfUiD8CmvLBAObjBMhKW8PCnkihk1Y12
	QiZOeBQJyMpHm34Z7adUPvBcyKZfwzZ1SqrE2BErF5R7Jc+U853o+j2z9z3M3rsjx85h
	VLp6kj8TM5bFFOCA9kIIMRb1Le/mkZ1IRUAkCEtu1+CiTSIyc4Ss9u0N0wypQMfx68Sy
	b3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=9cxU6BwoTDGtKxjD/XUJHgvKue+TV+zIPdY/9Ckl9L0=;
	b=Fhqmw4Hql4jZVnNYTpg7Z2BxbFYHIQQzOkoB78yCT1CZgNOzO9FPN3poooU1Db5Qkk
	ZgIxBVGtc6hXarSnFPJW91r92HHJEfczMhykd9oJ86jJ5Z+PUAgVmA1ukVWTz7vexNRT
	DAjRO05iBFLRDJdJrn2OXaGPiG8ZR+nfBKjLQqBUsi3/W50caDJhDrttuogkrG2wOvwe
	qxNkjv6h7TY+QE4eVLnkADeJU6kBEszcZV87maCFI//CrNMh42KCPS6v9H4icgXqXedb
	Q4/ZsZ7UiikpUQhi6qXgGaprqWf8H31F/ufTgVBbWZ9TrHFeznO/4wXtVOE8sxtl/0Qx
	m9yw==
X-Gm-Message-State: ALoCoQmKwiMhjvRNhrfwAcI1s+yIqMvzsRDVijw74+Kb3mGQjeQMv9sBGr1lq0tkiEVlyXusSBvXPZLM/F2A0cYmQDP5QSV2Qg==
X-Received: by 10.129.87.81 with SMTP id l78mr17523451ywb.149.1450763154154;
	Mon, 21 Dec 2015 21:45:54 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:7401:bb32:67d6:197e])
	by smtp.googlemail.com with ESMTPSA id
	j82sm12088848ywg.36.2015.12.21.21.45.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 21:45:53 -0800 (PST)
To: Machon Gregory <mbgrego@tycho.nsa.gov>,
	meta-virtualization@yoctoproject.org
References: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
	<1450285722-14530-2-git-send-email-mbgrego@tycho.nsa.gov>
From: Doug Goldstein <cardoe@cardoe.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5678E38F.3030609@cardoe.com>
Date: Mon, 21 Dec 2015 23:45:51 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1450285722-14530-2-git-send-email-mbgrego@tycho.nsa.gov>
Subject: Re: [V2 Patch 2/2] Enables XSM functionality in builds that contain "xsm" in the PACKAGECONFIG.
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
X-List-Received-Date: Tue, 22 Dec 2015 05:45:55 -0000
X-Groupsio-MsgNum: 1603
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="aP012nhd1WFMhCCgjBCmVWt7k3UglBRdu"

--aP012nhd1WFMhCCgjBCmVWt7k3UglBRdu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/16/15 11:08 AM, Machon Gregory wrote:
> * Correctly identifies xenpolicy by ${PV}
> * Adds a check to identify if xsm is specified in PACKAGECONFIG and if =
so manually sets XSM_ENABLE in Xen's .config
>=20
> Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
> ---
>  recipes-extended/xen/xen.inc | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index 9e35459..03ec935 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -333,7 +333,7 @@ FILES_${PN}-flask =3D "\
>      ${sbindir}/flask-loadpolicy \
>      ${sbindir}/flask-set-bool \
>      ${sbindir}/flask-setenforce \
> -    /boot/xenpolicy.24 \
> +    /boot/xenpolicy-${PV} \
>      "
> =20
>  FILES_${PN}-gdbsx =3D "\
> @@ -715,6 +715,15 @@ EXTRA_OECONF +=3D " \
>      --disable-ocamltools \
>      "
> =20
> +# check for XSM in package config to allow XSM_ENABLE to be set=20
> +python () {
> +    pkgconfig =3D d.getVar('PACKAGECONFIG', True)
> +    if ('xsm') in pkgconfig.split():
> +        d.setVar('XSM_ENABLED', '1')
> +    else:
> +        d.setVar('XSM_ENABLED', '0')
> +}
> +
>  do_configure() {
>      # no stubs-32.h in our 64-bit sysroot - hack it into tools/include=
/gnu
>      if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; th=
en
> @@ -727,6 +736,11 @@ do_configure() {
>          fi
>      fi
> =20
> +    #./configure --enable-xsm does not set XSM_ENABLE must be done man=
ually
> +    if [ "${XSM_ENABLED}" =3D "1" ]; then
> +        echo "XSM_ENABLE :=3D y" > ${S}/.config
> +    fi
> +
>      # do configure
>      oe_runconf
>  }
>=20

This should do the trick for Xen 4.5 and Xen 4.6, however for 4.7 I've
just submitted some changes to how FLASK and XSM are built and this will
break there but we'll cross that bridge then.

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--aP012nhd1WFMhCCgjBCmVWt7k3UglBRdu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWeOOPXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUdgkQAJa1ScvnqOqd3IfFdcBwX4Rl
KjYokuHqRU/OSky1joHszs6D/yvjdRzmWeVH9f5VWqhtp/ABdv0RQoE4JUOI2d8d
0ZECsVtB4yTbrfwwBbHd9w/3QHesr9jxZ5aTAAa0n0vFFirk+obfIWLdxMOkeVLm
ZXlYk2i/6H1mx7eg2jFbdTa3MYudB80XZqb2bIBL3yverL8+O0SCPh6aqXwZUbvD
YSv13EVQDLwG2l4cgNC6d7XpCYvpx+ECgqT1HjUSBml32ggdn0lLHNOGQTwALxR5
bfn6If0VHz3/xgfGZYCG73mhgJFVPhgDLGM94K93QhjA1pEYOJH406Q/EEzOyW3T
D7PseU8JFWJa320Clj83v6bRyUg5JPf+J3Cw28ZPRc2Yvz4Wy9dvDcug0GDBN29m
LC8n4Bsu+TzWiu8mk/PFYFcNDhGGnY7zhZY75igsOJbOiLDWfefcBkFzQ2UuolwP
2OqC56nhM8/CG9lUgUGWli+h59Rtj59xtB6jOIFv/FszaflduSdyCwl4dz1ILx3/
wecIaxoju+y9eRXloQDQmGkS2R6XE6RwV7W7pasz77JIQF+tEcdBj6XIGb7zIsQD
oaTxhNdeaiGMOIggNJJ6hucaiTkAAg2tI+j8+gReRNh9JOSNYv7t6bmiPO9QFdDU
QGKf5ETDThpBlke2rJ5/
=8ACo
-----END PGP SIGNATURE-----

--aP012nhd1WFMhCCgjBCmVWt7k3UglBRdu--
