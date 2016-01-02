Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2840E00C81; Sat,  2 Jan 2016 12:40:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15ACAE00AD8
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Jan 2016 12:40:03 -0800 (PST)
Received: by mail-yk0-f177.google.com with SMTP id x67so216483928ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Jan 2016 12:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=90q5BiJ/rzhpx9ZtU70g9RgU0BJolr4pBIHjtjYdukg=;
	b=QziGAQ3Qi0/YUkhvT2gbZZQtwK6M+nTyywHDKxVG95BjVnB7l9YLXm4lkRGfYJnR+d
	5EKx4YjqhF+hp66WGMuFf6BOZUiFFA6yWXGkCl8hIYElZChwwTQuuqUDo72NIXL/Ciba
	aZX6J2fKiaB3aCm0ou9lm1OHs97HroVb7P40U+oj3fEjs84fNIjlrONUIMqDWAHduotQ
	g0h8kGv+6W/K4NcP67jjNPtA9Tdteql3+SQzSANZ42TdAGjZ9aWOwsc2P2ME15yvDivX
	c7M3pX9mYe9pXKkZ35DGbdcJyXCUZDC9Hf0datSPLVVhtJDUP5jzVoZ2slWHXviON2kK
	HeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=90q5BiJ/rzhpx9ZtU70g9RgU0BJolr4pBIHjtjYdukg=;
	b=aGoMKnViYtynMYePIb5xJ5Oz12ds37ocPqOEK4aCgpTj9vzXL+T0kYXLOeIBuba7W4
	zAN8rr6FfwrpjnIBFu1frrCE8hLOhIavS8eyxEOfQRZRfLWEmEGckSZxxDm+ayigrjnK
	6ubaT8a7on0ZTUJDHbaiCp/y16abXW2fvgpEx2xXxVCiU9AO2//tUhB2F05NexkExccF
	8ZjS1Lo1Kmz6SnVgUmtB89rvD34bqBj30Ruf3gBBlG/0KLGFxfkzeGcT784Y3OA8/uHj
	EI391SKfJBw7CEEiEOjT/5Nx+eBGDWw6CqVSd9XFWOuld6afTw0O+1ZkiALxiWDqQwR/
	aLmQ==
X-Gm-Message-State: ALoCoQloc/LQsXTtAWQs2EJ2r0E1rDa8DnYrAq4X9JCUWAYzi1F+amEHER/XfL0Q/HaA+qBOcwCd29N4muFU3hKSJeHJMUfKHA==
X-Received: by 10.129.53.66 with SMTP id c63mr57881248ywa.138.1451767203313;
	Sat, 02 Jan 2016 12:40:03 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:9145:7084:541a:f174])
	by smtp.googlemail.com with ESMTPSA id
	i81sm46538550ywe.28.2016.01.02.12.40.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jan 2016 12:40:02 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>, meta-virtualization@yoctoproject.org
References: <1451663667-25116-1-git-send-email-cjp256@gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <568835A6.5060504@cardoe.com>
Date: Sat, 2 Jan 2016 14:40:06 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1451663667-25116-1-git-send-email-cjp256@gmail.com>
Subject: Re: [PATCH] xen: package remus-netbuf-setup into xen-remus
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
X-List-Received-Date: Sat, 02 Jan 2016 20:40:04 -0000
X-Groupsio-MsgNum: 1633
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="WvRxDp1kUqEJeGVjJEmca8RW8AuCvLebO"

--WvRxDp1kUqEJeGVjJEmca8RW8AuCvLebO
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/1/16 9:54 AM, Chris Patterson wrote:
> Package remus-netbuf-setup script which does not ship with
> any existing package (throwing up a QA warning).
>=20
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/xen.inc |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index d3a8b10..ac9796b 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -100,7 +100,10 @@ RDEPENDS_${PN}-misc =3D " \
>      python \
>      "
> =20
> -RDEPENDS_${PN}-remus =3D "python"
> +RDEPENDS_${PN}-remus =3D " \
> +    bash \
> +    python \
> +    "
> =20
>  RDEPENDS_${PN}-scripts-block =3D "\
>      bash \
> @@ -478,6 +481,7 @@ FILES_${PN}-qemu =3D " \
> =20
>  FILES_${PN}-remus =3D "\
>      ${bindir}/remus \
> +    ${sysconfdir}/xen/scripts/remus-netbuf-setup \
>      "
> =20
>  FILES_${PN}-scripts-network =3D " \
>=20

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--WvRxDp1kUqEJeGVjJEmca8RW8AuCvLebO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWiDWnXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUcS4P/12tgjZD0fNGktUdOG4ci7kY
P0jyYdEh0DN+zVFypLsMBXQvyogn1VvkTH6NL5VWQXfDvhovYF961yFgnQHc62LI
2nqko3BHW7PWqOGahokWombLLk9CtC7E09UJU9tInnmHM0jQ2H7njCW1bD4RJfo9
XV+qsNIBg/px5uIK3pNQLC7Kfxj1jU8s6+IXwqa56gbGWPZYaC4WRBszhQAq3qh8
CFHRRod9BG57WDoJ070BbGy0epAlJAg7vsi8GR8GAg511bdvP7Z0i0ARY3RVTEeT
MLTj17My7Tq09aYyAsgYb/BzOrfn8E91g2WAAsdO6xJyyI4cg28VPphrkLswk19X
8cvTKdPGbuW8rNkXVY68My7cHvJvYOZfb61KUAGDwq6FtJaBQIK7089EniIBQ5Lt
T2pgjz5XPKDNYY0ththB4ixxgQRk5FC2gpn51GkdNa/LHYQoa4M7XxBgr5JyO5a8
IzXTD3miF/xm58mnLTyGDgHpy9bTV5R4AhvXzu7IPLnUjYUe5X2LOtKEryItmA1E
xC0eWxVgYfoHQPgIKunmi6gv6Nb/s5HpdYo5OnLbTAHA/PP0kyJVfJBEvaExdQRB
MvAKQy6BJ3Q+eQkAPQkMgcfwZK/5MNv4F0f8aV8GpPIDdRmEmFoyytWdEOJKK+mr
LxUNlVpmXBwaz6qaj8pN
=szOV
-----END PGP SIGNATURE-----

--WvRxDp1kUqEJeGVjJEmca8RW8AuCvLebO--
