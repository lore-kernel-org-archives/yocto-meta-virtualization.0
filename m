Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7075BC4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 13:09:34 +0000 (UTC)
Received: from srv.signum-media.de (srv.signum-media.de [159.69.219.184])
 by mx.groups.io with SMTP id smtpd.web12.6997.1668604170427486732
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Nov 2022 05:09:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@signum-media.de header.s=20221012 header.b=IaZIde3o;
 spf=pass (domain: signum-media.de, ip: 159.69.219.184, mailfrom: g.meyer@signum-media.de)
Received: from serenity.localnet (muedsl-82-207-228-093.citykom.de [82.207.228.93])
	by srv.signum-media.de (Postfix) with ESMTPSA id E08EB1F4B5
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Nov 2022 14:09:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 srv.signum-media.de E08EB1F4B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=signum-media.de;
	s=20221012; t=1668604167;
	bh=iMR/iCW4avrU3b47C4ZKh4Rf/jvueDh14YCE+si4T6w=;
	h=From:To:Subject:Date:From;
	b=IaZIde3oh9TVrixzRSiQ2eYqlSuLNspu/zPIl58XLtiUlql3AJflzCgdt8T6C2nwl
	 np/V+2X4bageH1UD0lXuOaFArbBL4SgW96pn+XFozhdwgCe3OLj1VtqvASTOZOZVQl
	 oWrqpBq7A4ZIqzg9OQGbUicPtdShA45mz8F3s5Z5J0iawQ0RQ+Qm/r88/4/qR4WABS
	 Yc2HRGU0BxxFkzRg+IvqwblU6IXkCJygjjfBkekgLfaEnCKOrdedGm7WupIHUtpZK7
	 nDDD4wfJDbHZqG1pjL3BYBc61cn4r03cSAOyPZbQgbwT4cp+IjXMTqQOjFiumxzsTd
	 8czWhnCDmcWYQ==
From: Guenther Meyer <g.meyer@signum-media.de>
To: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH] nerdctl: renamed upstream branch master to main
Date: Wed, 16 Nov 2022 14:09:27 +0100
Message-ID: <3130543.zt3vOreWX6@serenity>
Organization: Signum Media
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5800054.Bz9BkYGCgj"; micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Nov 2022 13:09:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7683

--nextPart5800054.Bz9BkYGCgj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Guenther Meyer <g.meyer@signum-media.de>
Subject: [PATCH] nerdctl: renamed upstream branch master to main
Date: Wed, 16 Nov 2022 14:09:27 +0100
Message-ID: <3130543.zt3vOreWX6@serenity>
Organization: Signum Media
Disposition-Notification-To: Guenther Meyer <g.meyer@signum-media.de>
MIME-Version: 1.0

Signed-off-by: Guenther Meyer <g.meyer@signum-media.de>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/
nerdctl/nerdctl_git.bb
index 5d4d827..343c85d 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 SRCREV_FORMAT="nerdcli_cgroups"
 SRCREV_nerdcli = "48f189a53a24c12838433f5bb5dd57f536816a8a"

-SRC_URI = "git://github.com/containerd/
nerdctl.git;name=nerdcli;branch=master;protocol=https"
+SRC_URI = "git://github.com/containerd/
nerdctl.git;name=nerdcli;branch=main;protocol=https"

 include src_uri.inc

-- 
2.38.1

--nextPart5800054.Bz9BkYGCgj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMriC4l7RumrDsZEievmd2d8CKRIFAmN04QcACgkQevmd2d8C
KRIdPg/+MciyHF1c1SGr1WaZMnWkU7U8cMeDJnJmWhX/xjWg+18NF4OvAW89h9a7
w9p/ChjqT9CKIjWmIIqC4niH45FSwlVejx0G37UkjdviIRJLk/8dogrCI7D1TLb/
EDcBAOarW492jV/08jiE+DVD3GerEWqCeTJEk+PDuPapwrr3ZTByc1P4LxOHtkHO
I5KEYYvgSoN5/tmTg7gNu67RsKhPPLTKDe1Ms0v+dCG3bGsS9+9MDdf52A5feG7o
nEYBe9L89yWMSGJVtoLtGFJ4+fG3VMYesoQ8DzPTPtLytXyJ4+oMoZrZGDELjOXS
GrfSMVhzcsSdt2vL8m+rBmiP7prEweowc8HktO1mvrMmkenrC6k+YuPKF2br+sqX
J3eSlgQha6m47QSzStz3gNlXtG1B4fr1tgxIt5qmH4rTjfHwonPyfuk+W37pZXKc
vBIv3+F6PiRhkW3t+fpCESKkhXxTqpHeQ4t/ETqvEaYi36kYsCr8MmPhbG0IIV8s
nWv5w/IWB6MkL+oMaKHLpXnGJiiIoVnojSg2c3fU+es9AlDBpk6QM/Wocdf2ZZmu
lUkKSwrFITCWuWFZIYzqxYK++UXW6mRm5vqMfkftZr8+/r6+al51XxhdDQwmpyUV
il6PtRNQzhjeaODi+ijI1hlJpaBFMPKV7CwyF6cuyYB7LCGSfhw=
=dVRv
-----END PGP SIGNATURE-----

--nextPart5800054.Bz9BkYGCgj--




