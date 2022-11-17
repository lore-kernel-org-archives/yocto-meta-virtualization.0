Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5B0C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 21:25:04 +0000 (UTC)
Received: from srv.signum-media.de (srv.signum-media.de [159.69.219.184])
 by mx.groups.io with SMTP id smtpd.web10.2506.1668720299190627258
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Nov 2022 13:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@signum-media.de header.s=20221012 header.b=ig5kBVdN;
 spf=pass (domain: signum-media.de, ip: 159.69.219.184, mailfrom: g.meyer@signum-media.de)
Received: from serenity.localnet (unknown [IPv6:2001:a61:12c9:6cfe::3f1])
	by srv.signum-media.de (Postfix) with ESMTPSA id 669B01FA0C
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Nov 2022 22:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 srv.signum-media.de 669B01FA0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=signum-media.de;
	s=20221012; t=1668720296;
	bh=1qj4IyzEtFXyfyQq0Tu0dez+C8uOCQTlU8FS4EaCHHk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ig5kBVdNfVySqAfODcjSe0/WR/tNTqxFP6l2K2DbE+E3/DhghVa3twns7JNddM3Xf
	 BEouuJRKeKIzhznbr1OBIkA8AF9ykqJ8llD/h0devFNqu3gNaVMuj2OzBPPbzU9yml
	 vyAF2bIPzV0dSyJpR2vvHjpMcpKloH6sL61wizRVN2LFhXPH6Pi3D6+aGQYve8Ri2o
	 XJnTgVSmfMJPBifHhemf1SGYStYwTXek2Sca46rzz986HeILSiKe3He8DTEsdTtpak
	 4COUBqdgVY0Q6+TJuAO6ljuub25v5qUKjvCb0g9nL9DeiHR3LEZPetCctDPzMh32S3
	 kLClFC7mP/LIQ==
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] nerdctl: renamed upstream branch master to main
Date: Thu, 17 Nov 2022 22:24:55 +0100
Message-ID: <3063635.q5XDOhcSLO@serenity>
Organization: Signum Media
In-Reply-To: <CADkTA4O=km=BdAbC5=g6+e0eLgfJ2GGqc3QvkTTNkOZ0e4yYYQ@mail.gmail.com>
References: <3130543.zt3vOreWX6@serenity> <CADkTA4O=km=BdAbC5=g6+e0eLgfJ2GGqc3QvkTTNkOZ0e4yYYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2196570.jSADxVmXks"; micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Nov 2022 21:25:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7685

--nextPart2196570.jSADxVmXks
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Date: Thu, 17 Nov 2022 22:24:55 +0100
Message-ID: <3063635.q5XDOhcSLO@serenity>
Organization: Signum Media
Disposition-Notification-To: Guenther Meyer <g.meyer@signum-media.de>
MIME-Version: 1.0

On Donnerstag, 17. November 2022 19:23:08 CET Bruce Ashfield wrote:
> The change itself is fine, but your patch came through mangled, and it
> doesn't apply to the repository.
> 
> I could make the change myself, but it is probably worth sorting out
> which part of the patch sending chain caused the corruption.

Ok, what's thew problem? What can I do?


--nextPart2196570.jSADxVmXks
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMriC4l7RumrDsZEievmd2d8CKRIFAmN2pqcACgkQevmd2d8C
KRJgyg//T4UflgP7/r2RoBMA8stHYQhsANHW7QJzflJDLGDBJ190wlWK/HATBZYT
1REXutwpbZpe+6jRf9S7uOnxdDpVxyNBrcb/CsPjdxDKWXBAEed2PehiV7xcc492
GOYlgWz/0wj4YC0ilTu5Z4hQg9867mCm+PsuzgCRrn7fuV5wCY++L3meJH0fXD9+
aL71xMFpvI4ae1I0B+YunkLnBgjywrFzXPw06m+dGA9zvd1pUKlPhP1OF581UlF7
u140v01tdRy31YdVzKNnipRU0rZGZFOMJtaavpmtyTXyxtR0QAi7u2gNWW+2al01
D1YySTY1temur+oV5kEikmCVoaAmmlIxQ6PcgMucTkNzFzwz8bhkLls1BSaiQzdW
qIAcB1GcKBbXmJjrCVdCsn+gXDC3JJpj4A8SefL7mtiyOXIqotKezqw2xGj8ILx7
oY3C+jG8Ps4BX7mDjmlb9QDQwEHG/ulA9Kou8AH+DXeml50YtvRD288EMudFhMKI
ldesGuurxiPuKQ+UYXTcViTeXyjEq3DGIo7sKjhLVw6PYnwYxTr8wH8ENSFuX29D
Z4Q/MVJNqzE/CaUyaNL9K7oUFWn0944iZMMgSKBX7FtjagUxNYWTLBplmz/yCDLP
ouSpvAGeQX31geKSO3suc7JOtLjGxY/Bwy+hstKMb8QTqLRGchw=
=/wal
-----END PGP SIGNATURE-----

--nextPart2196570.jSADxVmXks--




