Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C0BC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 15:45:10 +0000 (UTC)
Received: from srv.signum-media.de (srv.signum-media.de [159.69.219.184])
 by mx.groups.io with SMTP id smtpd.web11.9404.1667922299578254636
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Nov 2022 07:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@signum-media.de header.s=20221012 header.b=Wtk0Ie+r;
 spf=pass (domain: signum-media.de, ip: 159.69.219.184, mailfrom: g.meyer@signum-media.de)
Received: from serenity.localnet (i59F7C191.versanet.de [89.247.193.145])
	by srv.signum-media.de (Postfix) with ESMTPSA id D0E681F69E
	for <meta-virtualization@lists.yoctoproject.org>; Tue,  8 Nov 2022 16:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 srv.signum-media.de D0E681F69E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=signum-media.de;
	s=20221012; t=1667922296;
	bh=pla3XceQejWQLUqn1m6HlyLtv1ii6U8GNfX+LbXoLWU=;
	h=From:To:Subject:Date:From;
	b=Wtk0Ie+rRe06J4q775kwSvMGyEqxcXDPeijsXvShDFnnqwxdL3gHMyICtEiwaNxX7
	 hvvJw6sQueGfc4GDibbsNayo3/jyAARyrERC0hTtSnJorH4WlCETSZvGvxfQYUD3zb
	 n0DeaA60wRW1HqWBTXo2vThC4kboesonfBVm+HQxwJDpzIbirpehJTakcTh4pxRl1v
	 i4RVS7XlhUuxzrxp7as8558MAaji93texKF1LlU6stZzRCOhzyTxaXnZRotS+11fp1
	 Evzkxvaszs1QaTEarNG3zI9yGZzDI64QX6soTcVdacVmUANV7n9ZwawZICRYVJxs7E
	 bAEFNYkurKtig==
From: Guenther Meyer <g.meyer@signum-media.de>
To: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: Problems building an OCI container image
Date: Tue, 08 Nov 2022 16:44:56 +0100
Message-ID: <2422477.irdbgypaU6@serenity>
Organization: Signum Media
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13436381.uLZWGnKmhe"; micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Nov 2022 15:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7677

--nextPart13436381.uLZWGnKmhe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Guenther Meyer <g.meyer@signum-media.de>
Subject: Problems building an OCI container image
Date: Tue, 08 Nov 2022 16:44:56 +0100
Message-ID: <2422477.irdbgypaU6@serenity>
Organization: Signum Media
Disposition-Notification-To: Guenther Meyer <g.meyer@signum-media.de>
MIME-Version: 1.0

Hi,

I am trying to build some OCI-containers, but there are some things that are 
not really clear to me:

Issue one: When I build my container image, these are the resulting files:

example-container-qemux86-64.testdata.json -> example-container-
qemux86-64-20221108152401.testdata.json
example-container-qemux86-64-20221108152401.testdata.json
example-container-qemux86-64.manifest -> example-container-
qemux86-64-20221108152401.rootfs.manifest
example-container-qemux86-64-20221108152401.rootfs.manifest
example-container-qemux86-64.qemuboot.conf -> example-container-
qemux86-64-20221108152401.qemuboot.conf
example-container-qemux86-64-20221108152401.qemuboot.conf
example-container-qemux86-64-20221108152401.rootfs.tar.bz2
example-container-qemux86-64.tar.bz2 -> example-container-
qemux86-64-20221108152401.rootfs.tar.bz2
example-container-qemux86-64-20221108152401.rootfs-oci
example-container-qemux86-64-20221108152401.rootfs-oci.tar

So the question is, why are there only stable symlinks for some of the files 
and not for the rootfs-oci files? How can this be changed?


The second issue is the resulting tar-file. I thought, I could directly load it 
as an image, but that results in an error.
Investigating the content of the archive, I found, that the necessary content 
like index.json, oci-layout ad blob/* is not on the root level but inside a 
subfolder "example-container-qemux86-64-20221108152401.rootfs-oci/".

Is that intentional, if yes, why?
Because when I create an archive with the same files on the root level, it can 
directly be used with podman or other tools.


Issue number three:
Maybe this is not directly related, but I'm fairly new into this container 
stuff, so forgive me, if I'm wrong:
If I want to use a predeployed image with k3s, what is the name of the image 
that I have to use in the deployment yaml? Is it just the filename or is it 
something else? If the latter, how do I set the image name during the build?

Cheers,
Guenther

--nextPart13436381.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEMriC4l7RumrDsZEievmd2d8CKRIFAmNqeXgACgkQevmd2d8C
KRIRyw/3cyXJ+vvHPfadKje8szp7ZR4iOnHbpm8rDE5/lcrqYQu8NDzrdcXlfRlS
Oonadt4Ob2ocJjBr4nohJp+6LBuHXViI84KbYvJ4pQlY8n+rXMQ/LY/tzaVdhDQq
ucrWiQNQdLRDHQW6Z/lwn2W/V86yUdyYalJnCWg9fazjwlKDkg+qNH8IQ1JyBSBF
PPVAZO0t++m16k6/ZCQBz6cZIiWFneLGxtFRb+7WgWO0HD79eQ+k5BVnpZpvCccw
fjLGFLK09eZaCIGxXZM6IAr6IClmiyL2owm9QYo2vZvtCEaloc61b+nMpj96WIGs
PPe/YYm9SVw5VYHiLtGHElsGfK2JsM3Ae6JWhH09sS26cNuFFN0Od7F/uJb5tr7N
VYKc0u/wrJ5wY7tzZYh6bDWjvGL1lz6ONtSNX2y5DQv+ZE1CbS3K//dfWrm34rq/
F7DJHWttkL8jL/f0b7LL+WgzbJ2ln13sxsrAFpuxF5SD48a6MwTaznBuiK9G23GM
4HtvbmTZxHwirR1EMW9BUq+OwA8n4M6wu4RE594EekIQYywNb5GrPhggIv9UNwLI
5plGBrSyMNfX2Zb+DAK5oM/wKEY/OQl4YC0yNukXCIkxjvYw0SAFsO7rB3q/s8Pc
Cyen5ZBwTNB/0UCP7VsVARXhLnwusAPZXn4GvAnkKvMIhvJOyw==
=wt75
-----END PGP SIGNATURE-----

--nextPart13436381.uLZWGnKmhe--




