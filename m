Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A0CECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 11:31:17 +0000 (UTC)
Received: from mail.rpgmaster.net (mail.rpgmaster.net [78.46.222.82])
 by mx.groups.io with SMTP id smtpd.web11.10666.1663673464258009884
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 04:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@signum-media.de header.s=rpgmaster header.b=Lglc7kBe;
 spf=pass (domain: signum-media.de, ip: 78.46.222.82,
 mailfrom: g.meyer@signum-media.de)
Received: from serenity (unknown [87.123.115.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mail.rpgmaster.net (Postfix) with ESMTPSA id 595DB2451E
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 13:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=signum-media.de;
	s=rpgmaster; t=1663673461;
	bh=6L+ovzVPPC2EOA3IiELHnh2XB/bFYk6Q9Xpn43uVUFs=;
	h=Date:From:To:Subject;
	b=Lglc7kBeYKKp4pdEx++xf6zqH39i6FKikD4Pm96q3VW4Y4XRT0p7o9NfSgpj8tNcj
	 +ZDBI8R2SO4uEXbcVRpdi88vhJg/1D78eL/rQ1vzvZ45zLlGc5JrDUVHIiifi2WF+/
	 mUaV6ZGP7+2PZ3ZsZW1mBq1xiSmdyZIQAwzzTa4A=
Date: Tue, 20 Sep 2022 13:34:06 +0200
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] fixed typos in kubernetes recipe
Message-ID: <20220920133406.26b27242@serenity>
Organization: Signum-Media Veranstaltungs- und Datentechnik
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//bidFH8tRprXp1/WOADmjqw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Sep 2022 11:31:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7620

--Sig_//bidFH8tRprXp1/WOADmjqw
Content-Type: multipart/mixed; boundary="MP_/CEbmzk5MWHwQNypkKH0frUp"

--MP_/CEbmzk5MWHwQNypkKH0frUp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I had a problem building the kubernetes package after upgrading to
kirkstone, the error is also documented here:
https://errors.yoctoproject.org/Errors/Details/657132/

The typo is still present in the master branch.

A patch to fix this is attached.
I don't know if this is the correct way to submit a patch, as this is
my first contribution. So feel free to correct me, if I'm wrong.

Guenther

--MP_/CEbmzk5MWHwQNypkKH0frUp
Content-Type: text/x-patch
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=0001-kubernetes-fixed-typos.patch

=46rom 7ec9bdc39ead89446aa7063a48afe8eeb3cce029 Mon Sep 17 00:00:00 2001
From: Guenther Meyer <g.meyer@signum-media.de>
Date: Tue, 20 Sep 2022 13:04:06 +0200
Subject: [PATCH] kubernetes: fixed typos

After upgrading from honister to kirkstone the build always failed
during the package_write_ipk step, because the package name has
been overwritten because of the typo in FILES.
While investigating, I discovered another typo in class-devupstream.

Signed-off-by: Guenther Meyer <g.meyer@signum-media.de>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-cont=
ainers/kubernetes/kubernetes_git.bb
index 96cae5c..170a938 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -13,7 +13,7 @@ PE =3D "1"
 BBCLASSEXTEND =3D "devupstream:target"
 LIC_FILES_CHKSUM:class-devupstream =3D "file://src/import/LICENSE;md5=3D3b=
83ef96387f14655fc854ddc3c6bd57"
 DEFAULT_PREFERENCE:class-devupstream =3D "-1"
-SRC_URI:classedevupstream =3D "git://github.com/kubernetes/kubernetes.git;=
branch=3Dmaster;name=3Dkubernetes;protocol=3Dhttps \
+SRC_URI:class-devupstream =3D "git://github.com/kubernetes/kubernetes.git;=
branch=3Dmaster;name=3Dkubernetes;protocol=3Dhttps \
                              git://github.com/kubernetes/release;branch=3D=
master;name=3Dkubernetes-release;destsuffix=3Dgit/release;protocol=3Dhttps \
                             "
 SRCREV_kubernetes:class-devupstream =3D "d2f6eb6339de25cef04850b6d9be8335d=
52324cd"
@@ -142,7 +142,7 @@ FILES:kube-proxy =3D "${bindir}/kube-proxy"
 FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
=20
 ALLOW_EMPTY:${PN}-host =3D "1"
-FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
+FILES:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
 RDEPENDS:${PN}-host =3D "${PN}"
=20
 RRECOMMENDS:${PN} =3D "\
--=20
2.37.3


--MP_/CEbmzk5MWHwQNypkKH0frUp--

--Sig_//bidFH8tRprXp1/WOADmjqw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzA/1q58SJcycb7/KVdabz09aRfwFAmMppS4ACgkQVdabz09a
RfzXmg/+I3vZ+1T0y7qU9r/Q1Mdah7KGwUUXYWvUwzpHaF2uL0rnfHzQZQYoLcG/
kdRr/8T0Mr3JVKBJuy0EQj0cfNQ9m4iiubT9JNL7cvjyumoF7jdzMpDm8r30R79R
OUl4Vg4kP0PP0GIZ7bBVo2VVEf3mHjhFHsWAZIvRQ3UtDn/gDrPRpASogD/U8gtc
ChvlodI5G35DL/a5hsCZ/j3CBu6a3HXU5zdMTxqNMOKBdPlgHjtPL0854jNWTafD
ai8vZywypFtaz908VUR8jDc71AgQUxmuArFPt9tkWY2p5OF64QnC/laBi1UdsHmq
2MHGe7spvmFlx0ll/ev2uKSyeuNhkKbyr99Md4VGpvLWOBpQewxtOo3MupiwM4R3
16wCACJRTGd4Yxd6jQ391fr4EHD2ofzAqMFeQHX6svhHYfT5QGcJHQ5cqTRD19Vn
PiE5ZcZZ1w69DCaReOFnzX00ag9Gg7hGX/99S+X4wxEKBoPOhucZRdmAYADi9bNU
G0UXGqPznGfMm8UJKE29zC+pb5DSDafrY4dTmmZOo+JGOWzz3AaedN/SaSidNORb
oPH44OfVbpF0R1gdCv37TAwsvhGXbaqr46sihJ+BBScuyWqLrm1jvmLPO+4I2bhy
v6P5iCEcqhnRWzuTMIahRsUh7kZ2zTplEpMTTXRCGAAaTiYXWFo=
=9A60
-----END PGP SIGNATURE-----

--Sig_//bidFH8tRprXp1/WOADmjqw--

