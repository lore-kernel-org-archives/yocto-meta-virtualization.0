Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E16C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 10:55:50 +0000 (UTC)
Received: from srv.signum-media.de (srv.signum-media.de [159.69.219.184])
 by mx.groups.io with SMTP id smtpd.web11.8842.1668768948579176612
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 18 Nov 2022 02:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@signum-media.de header.s=20221012 header.b=bAQAHoRR;
 spf=pass (domain: signum-media.de, ip: 159.69.219.184, mailfrom: g.meyer@signum-media.de)
Received: from serenity.localnet (muedsl-82-207-231-140.citykom.de [82.207.231.140])
	by srv.signum-media.de (Postfix) with ESMTPSA id B04EE1FA06
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Nov 2022 11:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 srv.signum-media.de B04EE1FA06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=signum-media.de;
	s=20221012; t=1668768946;
	bh=QPPNNtXojQOsAK1y+3T+0OYZbI0BvmdV2mFNt01ADxo=;
	h=From:To:Subject:Date:From;
	b=bAQAHoRRQf0IifuW1a/1fLSb2TSd5VYLLQnJRwzw5RmoZvGOVOuKqF970dVoZiuyH
	 2tI7pRFrN2yy9Tm48z3hJh+QnW/TWIhOdgwQV7KZ7nnnj5pEqTlvpwsCsefwI0g3y6
	 nVSAMTu80WTn2AFR2yWKrAkmwHvdvI8McmdUSoif9wHABSc2bEqJCkpaiaOud/zqNB
	 eywauQKi83Ed2z1nmDibfpihBPG5YlBXRJgcA/E5MlpQjmKJkslpAnJ1h3n0UZuyf2
	 2XPdn45Bgh/UZa4HQxKKwXxf/s3cFACtrtuxBzfCtm15OdNj48BZCyAznzm/BE4ktm
	 Kuv5jxtBDQJnQ==
From: Guenther Meyer <g.meyer@signum-media.de>
To: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] nerdctl: renamed upstream branch master to main
Date: Fri, 18 Nov 2022 11:55:46 +0100
Message-ID: <11942338.0JuuMjmRpn@serenity>
Organization: Signum Media
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2590360.6NRbxR2SoY"; micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Nov 2022 10:55:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7688

--nextPart2590360.6NRbxR2SoY
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Guenther Meyer <g.meyer@signum-media.de>
Subject: [PATCH] nerdctl: renamed upstream branch master to main
Date: Fri, 18 Nov 2022 11:55:46 +0100
Message-ID: <11942338.0JuuMjmRpn@serenity>
Organization: Signum Media
Disposition-Notification-To: Guenther Meyer <g.meyer@signum-media.de>
MIME-Version: 1.0

Signed-off-by: Guenther Meyer <g.meyer@signum-media.de>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 5d4d827..343c85d 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 SRCREV_FORMAT="nerdcli_cgroups"
 SRCREV_nerdcli = "48f189a53a24c12838433f5bb5dd57f536816a8a"

-SRC_URI = "git://github.com/containerd/nerdctl.git;name=nerdcli;branch=master;protocol=https"
+SRC_URI = "git://github.com/containerd/nerdctl.git;name=nerdcli;branch=main;protocol=https"

 include src_uri.inc

-- 
2.38.1

--nextPart2590360.6NRbxR2SoY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMriC4l7RumrDsZEievmd2d8CKRIFAmN3ZLIACgkQevmd2d8C
KRL5fw/+JeF0psPuJBiK4wIxHHL/BMs48/L6kSfWTe/JdmO4mgjPebHSFTASnKuh
PU7zHOeQYBIuKYRj47+CoKAbu1UmeTQ/NDEy/AhOwO4bZEmfEErhIxRebqSOvmr5
prtEMZKthkH4ia4vuTXS2wi0JRBfjgzcW1x7XZfUCFGy76hsq37pXZ/hvatsbnKZ
QqAw8zH8AWI8i8Of5ft+LTItdqOqskBxTkhZrtmcVk9rbXHgdQZPvLohea4HLpR4
AoVfY9TarR1npREjdhWyitWdde8C5qsK1wnlyLeKiHAZ/18flcCMJjdjOv7QcEHR
N4GUY46oMmjzpV6vNEiUFTAOYtRX7kWdrcfv3TR9K4y1kd4WxcToV9d61t+MLCDp
X1tPBAnOLltakqkCWrHKAzazTWFU1iGYlesvVZQuvaG+TEFeLNlf1izjk8sElSyi
F4FoX1mo6g6RXT0N0PxxXkCGu/AKbh5VMAy21vn8iW/kxO8VBKERq0GkZNPyIO5Q
QtPM/bm64xYeEoCTvDZH/3LrJetTdowP+uaij326zUPZB0S1R8QUSAcxhtecf9v5
QMcIEbuq2O6aqkPrwDkYzjtinfQSGzbDKNB4UjgU7ExDFSsxDdCAAt2yIX+PLvKR
L9TYhQOZgzWpRxItF82XdUrWcoDy5JROJvwzvWSVly69ZR7Hxfg=
=0DIM
-----END PGP SIGNATURE-----

--nextPart2590360.6NRbxR2SoY--




