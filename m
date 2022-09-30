Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BA5C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 09:32:07 +0000 (UTC)
Received: from mail.rpgmaster.net (mail.rpgmaster.net [78.46.222.82])
 by mx.groups.io with SMTP id smtpd.web12.3618.1664530320066594285
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 02:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@signum-media.de header.s=rpgmaster header.b=q71zU0r3;
 spf=pass (domain: signum-media.de, ip: 78.46.222.82,
 mailfrom: g.meyer@signum-media.de)
Received: from serenity (i5C7584D8.versanet.de [92.117.132.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mail.rpgmaster.net (Postfix) with ESMTPSA id 43E8F240DD
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 11:31:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=signum-media.de;
	s=rpgmaster; t=1664530317;
	bh=hUmwAqJ6j3+4V9f6GNfhUQOLHT9GPbW3EjkBHnabBcA=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=q71zU0r37ckE3+RMzNyIoWXTi4QelvmDn90HD2/FdpSOhd3+JpEfQNjy+n5oG88tP
	 7tMNAgVqDVgEGRil9MUd/wce6MKTC9r9YxQQh0OFk+2hitDB3N1pfnbSAtaSTwUe6L
	 lOkz60yf9S+9jv3h3b6Ey1IXa7/4uLgQDiXvsi0E=
Date: Fri, 30 Sep 2022 11:31:46 +0200
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] fixed typos in kubernetes recipe
Message-ID: <20220930113146.62937a0f@serenity>
In-Reply-To: 
 <CADkTA4Pm9_Y0GVr6rbC33FqShBNCTM7usJiJ5esnSW6XY7u7Gg@mail.gmail.com>
References: <20220920133406.26b27242@serenity>
	<CADkTA4PZY7rBbQwN1AH2D+AWxAqYi5ndmvGwvxmL-xMdPtuFdg@mail.gmail.com>
	<20220926102346.7a0d6fbb@serenity>
	<CADkTA4Pm9_Y0GVr6rbC33FqShBNCTM7usJiJ5esnSW6XY7u7Gg@mail.gmail.com>
Organization: Signum-Media Veranstaltungs- und Datentechnik
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eAc9+JAws.66UGLWYdeGZZX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 30 Sep 2022 09:32:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7636

--Sig_/eAc9+JAws.66UGLWYdeGZZX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Sep 2022 08:48:50 -0400
"Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

> git send-email is heavily used, both in the OE ecosystem and many
> others. I'm not sure I follow what security concerns you might have
> with it .. but if you have anything specific let us know. Because it
> would affect all projects using it!

Thank you for all the information!

As I understand, git send-email connects directly to an SMTP server to
send out the patch. Inside a company network this could be a problem
because it's usually not allowed that an arbitrary binary can send
emails directly, at least in my experience.


> I consider this a request to backport, so I've cherry-picked the patch
> and merged it to kirkstone.

Thanks!

Guenther


--Sig_/eAc9+JAws.66UGLWYdeGZZX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzA/1q58SJcycb7/KVdabz09aRfwFAmM2t4IACgkQVdabz09a
RfwvWA/9HaxUtb8rL8nrTXdgmPqVggcQj/ucw7PIlL3A4y8ViwfupIqsH9wQasQS
xjTQy2eat4JPPyiwPVBmQRAHu6HnKCyOI49FhGWip9UNa9otPyYExfD+/h9Luw0j
h0fVlSWlHX/4B050p7pi83Mncv7PbHhSESTxWN2s6Fp7PSk2l0pq7FwTM+QxTjTM
QwpxtNXsqAZwoh7abgO25JCgt/FgKaFDP8VKr50BOzC9iac3XbZaWHLtdjyIR4tF
UrddOwEZG6DNuhcVpqJUCLhj7haaOKrEnczhG2ycHvdawHbUTjiI83SwfwWVGYQ/
/WsyXfj8vtLd8qtM4+88PY4ESrbTaRTYGxkcJr931jeISbl59TkAJT4fcdHS7dt1
CaLxKoQ5a9y7knRhElr9COFm/KwtolkfTgQK1QnU+iiAoejEWPNVloN3FrDVIuWx
mJaFJo4qcbFckcPI0XSGTYkGL+l563N+iZt88IzKMIBQzkjOdnHfc0v+FvFy8gdg
frs3DjOdfefRLpKtucEWGEczTL8IsT0XUKuCb6OsIknDJf7w6hOEXUewhHoW3xnu
nXgj6tifL2vJ9CKi4gtmJV4XTuoI5JwlyTvKvQSxbAMWpcCKK4FwiIeN6mRLsKIw
FBhcR+jnDzldVWo4Jxrj/ilMsroIleg/5cBBDRKcudLo4qWxq+M=
=DJj/
-----END PGP SIGNATURE-----

--Sig_/eAc9+JAws.66UGLWYdeGZZX--

