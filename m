Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39513.1793009674619713929
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Oct 2026 03:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=B3wYgqIq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 340C1C5147F
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Oct 2026 10:15:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E78560740;
	Mon, 26 Oct 2026 10:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8920510329027;
	Mon, 26 Oct 2026 11:14:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793009671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references:autocrypt;
	bh=wx5b+k0J8ZAeWnC6AxTSXv9Pc1ak8QtMRl9wSDI8APQ=;
	b=B3wYgqIqYcDOQnelFCqTe0hhA0Ezd1eaXD5VuorLqjaX+NwFimCLpuopdhgSCIhkpR55vK
	zvMjfBYiKRR+d1RDLvQfyYce6HByyVPuccCpVW3LIMQN9t3b4P4j1hstROib8Ano/3xIG+
	gdbc8ZSL1NQhgm0LanMsybOLd0mqbzqwAgz5Kl0EnyVm4M32UzN65FpTtksa9aDXL/9xu/
	D6MpEWAEOeEBybXjRipLRoZgQklvn+LMqZQfGytmEtDXXISUZZbzbwXhgP+O8fDYFDauNm
	1GrFUap+knrA6Y+9nQlTbtMBWpcPmrUezcfAel+t/gwazTqqfqV2ZdWiVbEUVA==
Message-ID: <c0902fcadabab47f0cf39bf7ce8b2f0764e3539d.camel@bootlin.com>
Subject: Re: [meta-virtualization][PATCH] fuse-overlayfs-snapshotter: add
 recipe
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Cc: thomas.perrot@bootlin.com
Date: Mon, 26 Oct 2026 11:14:29 +0100
In-Reply-To: <6ada97c9.cb15bf0c.c1fef.de2b@mx.google.com>
References: <20261005113630.1669431-1-thomas.perrot@bootlin.com>
	 <6ada97c9.cb15bf0c.c1fef.de2b@mx.google.com>
Autocrypt: addr=thomas.perrot@bootlin.com; prefer-encrypt=mutual;
 keydata=mQGNBF+/ZOUBDAC2DghCjZvmgYcve02OG7dGZ7Iy58uEwne3LB7w7nRwdAxKw7ZaiVqwY
 O+yNGVi+GVx7oA6Wn4pv46z+QDRLQiq6OseuXhkSGCg7U/yBCUq12B/GRGO1Qt2Qi1mJJT1s+1qZ5
 Gxv6Nypz9qKVn94GM2bR1hXBga0t87vBpebThOHmX5d/0dqIcVxRCM7onNb0dDyRoVgLS5rBhQzrL
 CMrJaCy39xZUy0J1SOlH4Mgk6EhJIPYY4wlzikGX6urg+Tc9EjGd78ry0e0p5U5qgjFR5QGJDy1Gn
 U3CfwbT9sowdCASDbQDUoltlv2iWJCLa0xl97KVchCa0pr7HKbFA3J5SLKqFYUBCkFL+5WudYlz2n
 XxiUgyviMQxyK+ij66kEi6/2zFDAecd43pHV7790ptqZBC3Jc67Emj7Vo3ShX6RXPPxxbeCTOF2uk
 I45aJ9XcVFH/MFE96NjXj8uahnIsiTPyuCUoJu8tj7TSQyue874qJqVQvqlFyt2aZYJZ8ruq8AEQE
 AAbQpVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT6JAc4EEwEIADgCGwMF
 CwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCX79mdwAKCRCfw
 AsFcf4K7fhbC/wP0kSl6id2E/K3+UdXk6CLMVRbCFLCREzQs5WFpQ6l/I0WGOamhrOgegdszheiVF
 orlUP8d37XSpFAqydhKGaN78V5Dps0Wmwm4lIlS4MtQXJtSLUHXDJLIZLW0pw8tiPLKsd1o/yDkXE
 dnpsjJTRG6SdDSHnyOB2/gh4p+yTaLytFdARk/r4/P26+L+FiH0fFl+RnBt19LPklfKgeDc7GwIif
 ja+nIWpp3W23DAUuI6xduEut25Q89yu7Ci8CliLfAiLy9bIGjBQWU2Y+1/j/7KuPj6VbBsZWLTZY0
 hUmpJSTnWAqc9SMsNxo7NSQuddgviz5e2tqucaRqxP02FGzNa8U4NAKdWaXrlHG5Dglj9XH0DK+SH
 +c96qqFewYD8VPQ6XAGxQcXbrtJmiMor1R2DfziispLRvJcfYs8xqabbCtoS3ouXB9XRi8hn7A2kh
 ME1ryS+Oh63JshXHnw6bmjCpVd/p+fGLIGU6A47pJOpviKR4jEO84pl2ejtDZ3Tc=
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MeLCXBPNHyBHJUH/WOGV"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Oct 2026 10:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10137


--=-MeLCXBPNHyBHJUH/WOGV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bruce,

On Thu, 2026-10-22 at 16:10 -0700, Bruce Ashfield via
lists.yoctoproject.org wrote:
> Hi Thomas,
>=20
> Reviewed the patch and it looks really good. I appreciate it
> following the layer conventions with the go-mod-vcs hybrid layout
> and the associated generated files.
>=20
> One thing to resolve before I take it: the hardcoded /mnt/data
> reference in two places.
>=20
> =C2=A0 files/containerd-fuse-overlayfs.service:
> =C2=A0=C2=A0=C2=A0 ExecStart=3D/usr/bin/containerd-fuse-overlayfs-grpc \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /run/containerd-fuse-overlayfs=
/containerd-fuse-overlayfs.sock
> \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /mnt/data/containerd-fuse-over=
layfs
>=20
> =C2=A0 fuse-overlayfs-snapshotter_git.bb do_install:
> =C2=A0=C2=A0=C2=A0 echo "d /mnt/data/containerd-fuse-overlayfs 0700 root =
root - -" \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > ${D}${sysconfdir}/tmpfiles.d=
/containerd-fuse-overlayfs.conf
>=20
> /mnt/data isn't a path that will exist on a stock meta-virt image.
> Was that intentional for your project (data partition mount
> convention, etc.), or a holdover from a local test setup? FHS-normal
> for a daemon's persistent store would be /var/lib/containerd-fuse-
> overlayfs/ -- which also matches what the upstream project README
> suggests when running out-of-box.
>=20
> If /mnt/data is specific to your deployment and you need it, the
> usual pattern in meta-virt is a recipe variable with a sane default:
>=20
> =C2=A0=C2=A0=C2=A0 CONTAINERD_FUSE_OVERLAYFS_ROOT ?=3D "/var/lib/containe=
rd-fuse-
> overlayfs"
>=20
> referenced from both the service file (via a substitution during
> do_install) and the tmpfiles.d entry. Downstreams that need /mnt/data
> override the variable in their local.conf without carrying a
> bbappend.
>=20
> A v2 switching the default to /var/lib/containerd-fuse-overlayfs and
> (optionally) parameterizing via the above variable would be the
> smallest change to get it into the tree. I'm happy to do the
> amend on apply if you'd prefer to not spin another patch -- let me
> know which you'd rather.
>=20

Thanks for the review. Sorry I forgot to drop the specific deployment
folder.

I will submit a v2 with the requested changes.

Kind regards,
Thomas Perrot

> Cheers,
>=20
> Bruce
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10136):
> https://lists.yoctoproject.org/g/meta-virtualization/message/10136
> Mute This Topic: https://lists.yoctoproject.org/mt/121589449/5443093
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/unsub=C2=A0[
> thomas.perrot@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--=-MeLCXBPNHyBHJUH/WOGV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmrfKAUACgkQn8ALBXH+
Cu0Yswv+MCqt9FVWKnsDVpjsC1i2GwQlQOTz+d0pSjiTlGRKGtomgF77CwjNOZqR
WX5KIAJ+vdB7JxIYEj4LPrYeWHku70X+hMUm3rw4dnsxgIlUHQ8a3UehCmQ3zzzx
Ww/7xH72CUH/CxlrxDtZzrhdEEunvMkz309+bvjnIHGtpDfkfuJKdvOR+41Is3HR
xOj1LViNy4adOGr1/qzqm360DbCk+NAxB9TChaBKNUY4yrNXJsasa3F60XVOQH1k
pulCApxld3JH1G+rI4qFgdZkihf9qVXQ6e1wqsTHjrpicN2cIcqJFL+o/Rgu8i2j
V5SLg/k06oLBjeDGJ+tatesxDIwgIIb9sDTCvTeIbzrWYSnRytapqQMY/RAh2KWP
mNVXIBBS4ud1zpFJV7IkkSp/MmU9ufoeGjkTLzbHkg0p+zKGmLN5Iib6EnNd7W5F
I+v+e4sVXRT2WaK42RP5T7MJagU8vd1NXvQZC3rwsEd7qq/F6uZJ6D1n0Bq3Hwyp
SaB+jdrn
=/5SJ
-----END PGP SIGNATURE-----

--=-MeLCXBPNHyBHJUH/WOGV--
